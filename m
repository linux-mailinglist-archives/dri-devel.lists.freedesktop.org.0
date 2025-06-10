Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CCAD2DBF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 08:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102F10E22C;
	Tue, 10 Jun 2025 06:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="J0D2imux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0892110E23A;
 Tue, 10 Jun 2025 06:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1749535856; x=1750140656; i=markus.elfring@web.de;
 bh=QtGmO32MWmv2oqQt77RtwekQKB2W8DvItptTZDgUe3c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=J0D2imuxvWewcwUecaFheVVsE9H0rOLva2MNy01LnEMIGVIiritGDORnZqpG5Axb
 AwOFYLJ95ys6GhgRc05BanC2d7FXxD2LAxH0KuJ5jCxmyl8peCbmxWHHc2QMiy2Gr
 4LGTIQLakP+yVfUmPvDaJT++f26L86nBCqmP6bqirHW0+GtQ2OFDbeYgtHR+FPmp9
 DUtND2xidP8CxcsZuB+ai/aRZCCVCQMLyxBi7LsuFe2O9O/7CvIR5kcmAL6JFcwhB
 1ruEKMCIyCAH02+8fMMQrO8QpX23wuttCa0BMbR7VuMi4dw7chbu32wtLDOgf5y2U
 1WzSS4zIyya8LTT/FA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.183]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MpCmZ-1vBRx23Ai7-00fv95; Tue, 10
 Jun 2025 08:10:55 +0200
Message-ID: <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
Date: Tue, 10 Jun 2025 08:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
From: Markus Elfring <Markus.Elfring@web.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
 cocci@inria.fr, Melissa Wen <mwen@igalia.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:80O+haoG28pLodlT+TgNmlm05U3XWpmk4KtOLEIQOSYnyPhhLn8
 wyVp3nwi4WuqC9aKHEhr5Xp90vM+pk6RiWNYxiQmqJXFenBxq1AnKA4FwdcdApHeWPyKD8U
 wIRTKwTaBHCE8mk3OcImE11iC4V5mvvs6MBtqYF0WzJ67BEgNw5oZakajX7kiqtPadslbcK
 YmboKwjmxDmsXz1BK4b5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zFF8mO0KoK0=;rr/lpWVNFVg7xG8a9GYPYrI5jmb
 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
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 10 Jun 2025 07:42:40 +0200

The label =E2=80=9Ccleanup=E2=80=9D was used to jump to another pointer ch=
eck despite of
the detail in the implementation of the function =E2=80=9Cdm_validate_stre=
am_and_context=E2=80=9D
that it was determined already that corresponding variables contained
still null pointers.

1. Thus return directly if
   * a null pointer was passed for the function parameter =E2=80=9Cstream=
=E2=80=9D
     or
   * a call of the function =E2=80=9Cdc_create_plane_state=E2=80=9D failed=
.

2. Use a more appropriate label instead.

3. Delete two questionable checks.

4. Omit extra initialisations (for the variables =E2=80=9Cdc_state=E2=80=
=9D and =E2=80=9Cdc_plane_state=E2=80=9D)
   which became unnecessary with this refactoring.


This issue was detected by using the Coccinelle software.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp@in=
tel.com/
Fixes: 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI T=
MDS")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V3:
* Another function call was renamed.

* Recipient lists were adjusted once more.

V2:
* The change suggestion was rebased on source files of
  the software =E2=80=9CLinux next-20250606=E2=80=9D.

* Recipient lists were adjusted accordingly.


 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 78816712afbb..7dc80b2fbd30 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7473,19 +7473,19 @@ static enum dc_status dm_validate_stream_and_conte=
xt(struct dc *dc,
 						struct dc_stream_state *stream)
 {
 	enum dc_status dc_result =3D DC_ERROR_UNEXPECTED;
-	struct dc_plane_state *dc_plane_state =3D NULL;
-	struct dc_state *dc_state =3D NULL;
+	struct dc_plane_state *dc_plane_state;
+	struct dc_state *dc_state;
=20
 	if (!stream)
-		goto cleanup;
+		return dc_result;
=20
 	dc_plane_state =3D dc_create_plane_state(dc);
 	if (!dc_plane_state)
-		goto cleanup;
+		return dc_result;
=20
 	dc_state =3D dc_state_create(dc, NULL);
 	if (!dc_state)
-		goto cleanup;
+		goto release_plane_state;
=20
 	/* populate stream to plane */
 	dc_plane_state->src_rect.height  =3D stream->src.height;
@@ -7522,13 +7522,9 @@ static enum dc_status dm_validate_stream_and_contex=
t(struct dc *dc,
 	if (dc_result =3D=3D DC_OK)
 		dc_result =3D dc_validate_global_state(dc, dc_state, DC_VALIDATE_MODE_O=
NLY);
=20
-cleanup:
-	if (dc_state)
-		dc_state_release(dc_state);
-
-	if (dc_plane_state)
-		dc_plane_state_release(dc_plane_state);
-
+	dc_state_release(dc_state);
+release_plane_state:
+	dc_plane_state_release(dc_plane_state);
 	return dc_result;
 }
=20
=2D-=20
2.49.0

