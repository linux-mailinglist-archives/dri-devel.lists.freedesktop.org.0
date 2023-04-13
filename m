Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D56E155B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 21:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133910EC02;
	Thu, 13 Apr 2023 19:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EE310EC02
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681415064; i=markus.elfring@web.de;
 bh=qOGuCShQ+GRXJcmAjLP3izQLsAVZcyAZRpZ35hIizx4=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=v7/kTXhFY0hABdRHISl9eqtaHuCZ50z3HIKxOSkFHoNRV99hEkySY4UF87tvHiVA4
 7JdvHTXYZVXfHruJ8xuMVhYH53wfSFEejUL14u60LVBLN12tdnY4+CcP0Nmq+WYRW1
 wmlkTF1+OrycjsznOkeYp9Gpd4pUslzaMERtg932Fs4QM4DwcZrcRJyQWxTdNFEJbE
 SdhlqzrUS50mc9CkqQNSccRSRb+ODfcDo1tNeACgD3yz7CditIAbOe4WkPKjg0+3Qk
 Dolm14H3zHlXiqSujJRTgquSRbbRRTPmsJ2eBYEsxGGvFZUzMuR4NWNQPNVajUm3uA
 z3kCajEPpncBw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MN6Bb-1q5xCH3FXZ-00IpMe; Thu, 13
 Apr 2023 21:44:24 +0200
Message-ID: <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
Date: Thu, 13 Apr 2023 21:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] video: au1100fb: Move a variable assignment behind a null
 pointer check in au1100fb_setmode()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Antonino Daplas <adaplas@pol.net>,
 =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>,
 Yihao Han <hanyihao@vivo.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ap6G4YuCFkJzgF5UGRZwAk1oAua1riOUt+7p93mBUS6qNt02wij
 9z2rA3YgYx0MKWNgMYyDn3iilQ8dTa0HO1tceJBCPK/86Z4nVRwWwMwqMzuTQOjv32jnj+v
 1EuNjemvdabt3Grr/bDKuUS0ADnKyvM2+uOkdsSHrIkGaHqhOvQZOXeu6W1eXkekO9vGHQ7
 M+oJ/PLYTgY2kMpD4FXXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NQCZFHsloKI=;3y/e3Z0j8Gr9kr+YduY9YiFkaL2
 nQAj2khXWc8PbQUyJFUrOhrPx3wykPAhn4nNU2URWghQ0M0wYNxZd73bA1A/n8OWiaCshYnkC
 EfxjLc0lD2EESI5oXfTpnyivXjKlSoE9Nzv2jR2IJJQaq2HzdEFu4nMSdtYdDZKJ+MJk2sHeJ
 W3epzIXg2iv00MqsbdlfvXK0NxTXtDBkEfXPKg5sGrfH275X07+9xspLJ8QHWh2whwjU62MCE
 MpsL7tpW51Q6jWPV4t9Fua4hj+QWeYhrTbVhD2WLIrIu6Jv/p3ipjaikY36tEsSYyJZar0g0d
 0Ig6mV2VrB/ASn5JjwDGLctOS+kQl6xLXXybFzSv1JtRDa/EP/2dkzQg+WfN4NVXVxq62yd45
 vtY3jl/dGR7/UPsm05QlJYXyjm4CDnBPkIhsv7uSeOthCTPCKaAW/IQ5ftWx8D3wsHj9f5+uw
 qwMj/l/LpxIq0UjGHftFH274BQW79+MyMjDYJCFB+tV/t9tCRjvV6FDsI+RlYHrq0lQP+cyfe
 O28e3Nwdq0zUPjGgUYDfk2A4HSTsoghDlIwkxQv8tIgjQ3tL9HtqizHGVbHlbdeyYafUFjtUY
 FmAoYDUpb73CKthaSYuCU4we1fHVo5AYEiIzzjPXNC5ODS7VJRGBd1Lu8jzYI/kdqegt/hzYz
 9gGcfVO7KzGyH/AQfRkSSqkFy6fZpdNBL9w1vUvzSOh35J9aZPo5hNFJsiMtWCgyKStoN980K
 l6+mGuqtsaf6+1LBn7iw09GG9Hud1a8mkrmyu6V2tppbV1feRIp3/fv2U0rJgo+qcNBAERlIM
 +StJYuAwLs7Bc9nNcF3J0CyJU/tNjlaa0hV5XRdPHWZJJ64z0KrnWRN5aMAb5Dg+QRzM5IJBE
 uxtBtxFBXMUG2WZ9F6DUhw/CQXIohb1VwvGHxe0ggn1sy5xpNLFHmP8BP
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Thu, 13 Apr 2023 21:35:36 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cau1100fb_setmode=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cinfo=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 3b495f2bb749b828499135743b9ddec46e34fda8 ("Au1100 FB driver uplift =
for 2.6.")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/video/fbdev/au1100fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb=
.c
index cb317398e71a..fcb47b350bc9 100644
=2D-- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -137,13 +137,15 @@ static int au1100fb_fb_blank(int blank_mode, struct =
fb_info *fbi)
 	 */
 int au1100fb_setmode(struct au1100fb_device *fbdev)
 {
-	struct fb_info *info =3D &fbdev->info;
+	struct fb_info *info;
 	u32 words;
 	int index;

 	if (!fbdev)
 		return -EINVAL;

+	info =3D &fbdev->info;
+
 	/* Update var-dependent FB info */
 	if (panel_is_active(fbdev->panel) || panel_is_color(fbdev->panel)) {
 		if (info->var.bits_per_pixel <=3D 8) {
=2D-
2.40.0

