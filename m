Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296BAD18E7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 09:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FDB10E0F3;
	Mon,  9 Jun 2025 07:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="owuNkOJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jun 2025 07:15:20 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE82610E0F3;
 Mon,  9 Jun 2025 07:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1749453315; x=1750058115; i=markus.elfring@web.de;
 bh=97rwl5tQ9kVnE87DvY09ZWlkxcPn81NrBCP78VTLnE8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=owuNkOJJEDSOWnSCojdNpah6wnksBJWcPMQkBpx64dBx3Ur9PcQrXN6ht0WLypYr
 wQCdvV9tVGUkZiyeI1vOfTqBWHvwLWPzWr4pKLgSUv88EDPa/5+edC0i6zhvGpV4U
 JNtNwa7nEPlQ5Pe5dQ9Q1KpbJ2RNo+ZqGrjJU2n5EBTjAjMOJ2buAvGhyHfU9Nn0d
 lroIpZIO6yAlmM6VxCNwPv+xQyDKlxAGBIjydKb2+Gf2AGA8jXzeYAoHrCSDOJUyW
 07ZWyefjTqG0cZM61P2cjA7g0tDLKOUz9R9RdumzxfkNPivSX20Bnb/HlRlKykVMU
 NbQbR1QfKRgM+YbS0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.233]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPaMQ-1uArff0iZe-00WLGy; Mon, 09
 Jun 2025 09:09:29 +0200
Message-ID: <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
Date: Mon, 9 Jun 2025 09:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Stylon Wang <stylon.wang@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 cocci@inria.fr, Melissa Wen <mwen@igalia.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6WzgLsEkjsIjvTLIR4U7D19tKLt5E132l1qOf077lk/8aBWo85M
 nU3Ja69SBe97sd2HOryn91M/B2ySJ4DQMB1pKp+WqJdHeX1XnMAM466bE+BSE1QcSIKgtCE
 YwOjS7ShwfKaDWo1DzT6c95H/Dvas3gfxrqPWDYtkAMDvSOh6OyJi0hkyQqvrAsDXY1gqb4
 QN7cyJ9awZ5WsysmdpKcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gg+RSqzvIfE=;bJUZA3pwQlSgzUtz8VDjdqJnVYm
 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
 kxXdE4rCTWFf6gDzXASiGcGSVmx2g==
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
Date: Mon, 9 Jun 2025 08:21:16 +0200

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

Fixes: 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI T=
MDS")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
* The change suggestion was rebased on source files of
  the software =E2=80=9CLinux next-20250606=E2=80=9D.

* Recipient lists were adjusted accordingly.


 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 78816712afbb..f8aa1c541678 100644
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
+	dc_release_state(dc_state);
+release_plane_state:
+	dc_plane_state_release(dc_plane_state);
 	return dc_result;
 }
=20
=2D-=20
2.49.0


