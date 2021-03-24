Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D75C347ABA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2956EBC4;
	Wed, 24 Mar 2021 14:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0210.hostedemail.com
 [216.40.44.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E636EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:32:03 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 32F09182244EB;
 Wed, 24 Mar 2021 14:32:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1543:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3354:3622:3865:3867:3868:3870:3871:3872:3874:4321:4605:5007:6119:6120:7576:7652:7901:7903:8603:10004:10400:11026:11232:11473:11657:11658:11783:11914:12043:12048:12297:12438:12555:12683:12740:12895:13439:13894:14181:14659:14721:21080:21433:21451:21627:21660:21972:21990:30046:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: hill42_1e033b52777b
X-Filterd-Recvd-Size: 4973
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Mar 2021 14:31:59 +0000 (UTC)
Message-ID: <382fd12d804ac8e2693f92cf649c4f038f9c022e.camel@perches.com>
Subject: Re: [PATCH] amdgpu: fix gcc -Wrestrict warning
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Wed, 24 Mar 2021 07:31:58 -0700
In-Reply-To: <20210323130430.2250052-1-arnd@kernel.org>
References: <20210323130430.2250052-1-arnd@kernel.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jinzhou Su <Jinzhou.Su@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-03-23 at 14:04 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> =

> gcc warns about an sprintf() that uses the same buffer as source
> and destination, which is undefined behavior in C99:
> =

> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c: In function 'amdgpu_se=
curedisplay_debugfs_write':
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:141:6: error: 'sprintf'=
 argument 3 overlaps destination object 'i2c_output' [-Werror=3Drestrict]
> =A0=A0141 |      sprintf(i2c_output, "%s 0x%X", i2c_output,
> =A0=A0=A0=A0=A0=A0|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =A0=A0142 |       securedisplay_cmd->securedisplay_out_message.send_roi_c=
rc.i2c_buf[i]);
> =A0=A0=A0=A0=A0=A0|       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:97:7: note: destination=
 object referenced by 'restrict'-qualified argument 1 was declared here
> =A0=A0=A097 |  char i2c_output[256];
> =A0=A0=A0=A0=A0=A0|       ^~~~~~~~~~
> =

> Rewrite it to remember the current offset into the buffer instead.
> =

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =A0drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 3 ++-
> =A01 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> index 834440ab9ff7..69d7f6bff5d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> @@ -136,9 +136,10 @@ static ssize_t amdgpu_securedisplay_debugfs_write(st=
ruct file *f, const char __u
> =A0		ret =3D psp_securedisplay_invoke(psp, TA_SECUREDISPLAY_COMMAND__SEND=
_ROI_CRC);
> =A0		if (!ret) {
> =A0			if (securedisplay_cmd->status =3D=3D TA_SECUREDISPLAY_STATUS__SUCCE=
SS) {
> +				int pos =3D 0;
> =A0				memset(i2c_output,  0, sizeof(i2c_output));
> =A0				for (i =3D 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
> -					sprintf(i2c_output, "%s 0x%X", i2c_output,
> +					pos +=3D sprintf(i2c_output + pos, " 0x%X",
> =A0						securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_bu=
f[i]);
> =A0				dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", =
i2c_output);

Perhaps use a hex output like:

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_securedisplay.c
index 9cf856c94f94..25bb34c72d20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -97,13 +97,12 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struc=
t file *f, const char __u
 	uint32_t op;
 	int i;
 	char str[64];
-	char i2c_output[256];
 	int ret;
 =

 	if (*pos || size > sizeof(str) - 1)
 		return -EINVAL;
 =

-	memset(str,  0, sizeof(str));
+	memset(str, 0, sizeof(str));
 	ret =3D copy_from_user(str, buf, size);
 	if (ret)
 		return -EFAULT;
@@ -139,11 +138,9 @@ static ssize_t amdgpu_securedisplay_debugfs_write(stru=
ct file *f, const char __u
 		ret =3D psp_securedisplay_invoke(psp, TA_SECUREDISPLAY_COMMAND__SEND_ROI=
_CRC);
 		if (!ret) {
 			if (securedisplay_cmd->status =3D=3D TA_SECUREDISPLAY_STATUS__SUCCESS) {
-				memset(i2c_output,  0, sizeof(i2c_output));
-				for (i =3D 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
-					sprintf(i2c_output, "%s 0x%X", i2c_output,
-						securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]=
);
-				dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", i2c_=
output);
+				dev_info(adev->dev, "SECUREDISPLAY: I2C buffer output is: %*ph\n",
+					 (int)TA_SECUREDISPLAY_I2C_BUFFER_SIZE,
+					 securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf);
 			} else {
 				psp_securedisplay_parse_resp_status(psp, securedisplay_cmd->status);
 			}


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
