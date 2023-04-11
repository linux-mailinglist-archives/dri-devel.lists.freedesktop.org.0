Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E646DDC79
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F6010E4ED;
	Tue, 11 Apr 2023 13:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D936B10E36D;
 Tue, 11 Apr 2023 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681220630; i=markus.elfring@web.de;
 bh=7QMVGNLkemqceAqBuvWC+EimKfuSgO/00Je536TRm9Y=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=TNbeE3ytFDGYp1ad5equCMWRYcyu6KB2oYURomUJlIoPZoIO/KN54tb1SfxL6BqLq
 l/AYUVrEa6hBQj3RMMMQOF4qj+r7j/hhvQYR1N25TWaPMIijjfzu5RR3nHG1bsW8C5
 e90IUwjLq+nj2ijxljzvKl11s0DtzqOV6y8KIUuumr0nI343XLaxhtW38s+7OOw5tB
 /5GjVvG5EwZXQoo+2YkYUtpF5yle1KUrAYmeYrM2EEV3G+afwxwAiW5NbS9BeWmRkC
 uj+vGn/63pZiLlAhwkoVsYCsOwXZZMmWZdWSZtXeAEcFpcF2yrSw1D6UhthD/m0XMg
 ZbPGuyVtmkgJQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0PR-1peE4x0VmH-00CVOk; Tue, 11
 Apr 2023 15:43:50 +0200
Message-ID: <89048a5f-2dbb-012c-41f5-7c300e8415f5@web.de>
Date: Tue, 11 Apr 2023 15:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 2/5] drm/amd/display: Move three variable assignments behind
 condition checks in trigger_hotplug()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
In-Reply-To: <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PqPz95aENc2yY4ywu1s1GTinq81kvAZt6m4fTsE0rOeI88+DpZU
 h65mIHIHhsh1du5/3FvC1i+ZotOzl1F8SpGJu+FuqahoYLTdb3RXneyQLNSpRbcUL3U0tC2
 Zmaa4JSg35REbB3IqmGjTNAATjBYHPmvG7mASbc8cdbNoecMOBRRBsQT3gLNEa0JoYyuLD0
 MPKJ2lk12ufmrxTcHgRyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qx+AswJDC80=;EGkA7B18JdiviSfPLVea3rozgG2
 2RIVxfybNO+4m31FcnHVIKyDa6rnqKNDmiVXxPLqQZU0h1y5rjWx444VRFYoob46lhh+b5a20
 +54IS/teRxhSvI09Ng1nHqycTcPBns9oY2+U0JLH/Fqwys8GDA1LmnmfCQLJKz/MyzNAECerx
 6qDoKWwIBNGVRC4YVZcHvRlhAvy5lr+wP0bOTe/eWnTDV+qnTcsTal4F1cEzgWfjtzaYAkP+X
 zQc99Bbe2NXv1LhO9LigMQFD04QNQkDbxT1TsofT9u0pDvMI11U5hOTIAacm7FmT5uy3hSaaG
 /angXBm+xe3EFcdYfrF89xEVyJJ3mm8btP39hNv+Z5hvuoRI0cSvIIDC2j6e1GQTkaYgxer5j
 8D2YOcMTdOeqRRW3LieuaeCxz5Nwtv1ZlIs4qjSXabTO7g0lfxvIL7e06df8t18VjahTY2kVZ
 A7yNXFUe6Tj3XXM4nsAjmKZPJzUQhmsmUzS4aFHDQihKewLLKB9SeCXDZD1NvEOiae16tjlRz
 16iWbNm8daZ+vOIIP96hapZAMvjLh1pRw/8NYEOEjwZXSIqkDL2t4Xu13XQToY3+96bPCec1U
 NKo8BFcMeqSo4Cn4GALJVNMMHHE+G2XZnNKM33besDS5YpqwuHit+plx3H49KR8kE0waj8nSi
 QNQOD/BQ9TciNiAA2twZA2ucsqd08loqZ/I/8gfLP/9nJPLVkB0zwqENECpfk2TJdgl56TEKL
 +5+r6QFKBsQjccf+AtZMaF6hOuwx/7h7j9kS0z6fpHfvatcnPUsKJId3cIBMJRWjrUfDWhjSP
 27ZBHWFkZ8OK+6xjSIqsMvXcUwGaGoYMDeeYf39PmTuyl+PdLhGraKP+WHY0p3YT++Z6Nla6y
 0stSTVLGh5Fb2ZJGH1SzasRGut01NgMIqsk0ZGgD+XDtLBFZpPAX36YfK
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

Date: Tue, 11 Apr 2023 11:39:02 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Ctrigger_hotplug=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for three local variables behind some condition checks.

This issue was detected by using the Coccinelle software.

Fixes: 6f77b2ac628073f647041a92b36c824ae3aef16e ("drm/amd/display: Add con=
nector HPD trigger debugfs entry")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 827fcb4fb3b3..b3cfd7dfbb28 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1205,10 +1205,10 @@ static ssize_t trigger_hotplug(struct file *f, con=
st char __user *buf,
 							size_t size, loff_t *pos)
 {
 	struct amdgpu_dm_connector *aconnector =3D file_inode(f)->i_private;
-	struct drm_connector *connector =3D &aconnector->base;
+	struct drm_connector *connector;
 	struct dc_link *link =3D NULL;
-	struct drm_device *dev =3D connector->dev;
-	struct amdgpu_device *adev =3D drm_to_adev(dev);
+	struct drm_device *dev;
+	struct amdgpu_device *adev;
 	enum dc_connection_type new_connection_type =3D dc_connection_none;
 	char *wr_buf =3D NULL;
 	uint32_t wr_buf_size =3D 42;
@@ -1253,12 +1253,16 @@ static ssize_t trigger_hotplug(struct file *f, con=
st char __user *buf,
 		return -EINVAL;
 	}

+	connector =3D &aconnector->base;
+	dev =3D connector->dev;
+
 	if (param[0] =3D=3D 1) {

 		if (!dc_link_detect_connection_type(aconnector->dc_link, &new_connectio=
n_type) &&
 			new_connection_type !=3D dc_connection_none)
 			goto unlock;

+		adev =3D drm_to_adev(dev);
 		mutex_lock(&adev->dm.dc_lock);
 		ret =3D dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD);
 		mutex_unlock(&adev->dm.dc_lock);
=2D-
2.40.0

