Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C5F6C8CCC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 09:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DBE10E029;
	Sat, 25 Mar 2023 08:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 898 seconds by postgrey-1.36 at gabe;
 Fri, 24 Mar 2023 15:57:24 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9942710E539;
 Fri, 24 Mar 2023 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1679673443; i=markus.elfring@web.de;
 bh=FUV2j/mIf5N8XPN4ZSnuoAgV2XPJ4du/+8E5iOw21GE=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=MRTG2yiiPIeZ0dAeHXD7KP9nnTWn/5QH9MlAK4gXjX/SxExfTcLsFk+je+VSUBenw
 /VKLGLNAIabSXTcCOW05kjkuKxm9hhrVDIgk3i9b9RZljMP1sEG15r2koElK2zQDG0
 VbSbkwjM9vUGXH4vnk9vkxfdpiP2q7ospPxGDIoe44Yn19906iPD+sGdESIMjyOTtq
 tkGyKzmG/XGihNOo9aG4+orilof7GG48mN4US1B1Yx2ekGa/6E+N+s6iugmF4vPgfH
 xOylqt91KdlgA457HJTJMxnIgMVqALU12IKw77mdMGDLHZCzYLU9roSJnFy/ITZwiB
 AWJxtba4xjtKA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N3Xnl-1qfR420z7z-010c9g; Fri, 24
 Mar 2023 16:42:21 +0100
Message-ID: <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
Date: Fri, 24 Mar 2023 16:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH resent] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
Content-Language: en-GB
In-Reply-To: <e6656c83-ee7a-a253-2028-109138779c94@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wURbRRzJDKLNkPhJ1aQ657prHwMd7a6I/FrJ1on0Fmq6FFRpdPk
 39ANyg6ItpDWjPmHE25D7kHn5uS5WBOmM+M25MDJ4dsJdV5ryq/ZfVUF6rHp1P9n75GTAKf
 CYfFUR0ZJpy+yFNqsWjzMgSSCB+YVB3TbiMZJNIJEeQAfeH3EhtZ+1817F7a9mxBnGJ1R/H
 PssPVlr9gm3S0yS//lpbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X3zg9xzqSPA=;6+mxuhJpaGRPm1k7txSJGyIF5eA
 VsWr57xlj/YSCtgBvkkbGLS84Qv4Z27XSaELZv25fB35BQqf0hFRMFlWYoJtfIWKk6cRtGbJc
 9McmoBqDwlQt3pmq2JfwiHrLeMk3ZGdHIxtVH0LSNF3zRWsXrnt/9elNzqfPK6KUo3OVzIRHp
 gStp45IXyIIZoKIPGIA/gf7pE9MYna9+/nfAt8dUzW7m3jUZvw5y/XeURXQiZLKJbxmYYfqLJ
 rqxoAbD8Tivvlj6MItsxMc+iyyRCWn11rbiPn95uPs13kEAbbaOJLm1mNS+JAcdj90DWldOoY
 tyE1fMKvjFQ1ajoj+r9OuRBfd8Rwv6sVCrvQrGrESd1BPZ1V2iYuwVHEVdoBxIzjtcI91lGhL
 ifo5pEfkgBwQoSVKLrK4yNXmr566WWp9S/tojqhictw0ydEBljXxKF+b/fvgOHQf/yg9CBGwX
 5Inrnod9AxUzhabNzA6gmjMs+pWMCqenr8qZlYWZQyZ1BRsBvN303G20LtMsYgn9SMG3/ieM7
 qwWGbVc8oTeLUMFkyQ8uS+jkr0Z4TtS6mUeMnXpwtDLwCRvvaf7GLsXduzgaUxkZLGGOFKZrr
 +LerawzPcifZ0KBdcPTOaR+gmtNCVl1rHRJ/VjropcY3Lp9THQcBx7oDqJrq4ghA9DJEbXvyI
 2w+Pym1v+XDY2IduB9/QVpCE180yKZxOmWZxVIytZX2WQWtB5dmF36xeoOIIlIFdslBvFVjBy
 8+x9LX2hZkoPJyutv2Zz9IetKnq79QXcTK3lYWkyS6Or2zd9/joV60Valw0aom1x4Gvj7kxV8
 bbxoMNxiYyTU9cFsuSiEhIPcAG0iG78P3syL3AW5xfQt6Ncwx1u2UpRpY/uzZbZW9UGp3H5IB
 ZFyRHykaI6IXFZyp4WkE5jGFfdhAlgv49iNJO71fEeiYK+IWkvaZXpL4x
X-Mailman-Approved-At: Sat, 25 Mar 2023 08:52:41 +0000
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

Date: Sat, 18 Mar 2023 16:21:32 +0100

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

Fixes: 5468c36d628524effbb89a9503eb1a2318804759 ("drm/amd/display: Filter =
Invalid 420 Modes for HDMI TMDS")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index eeaeca8b51f4..3086613f5f5d 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6426,19 +6426,19 @@ static enum dc_status dm_validate_stream_and_conte=
xt(struct dc *dc,
 						struct dc_stream_state *stream)
 {
 	enum dc_status dc_result =3D DC_ERROR_UNEXPECTED;
-	struct dc_plane_state *dc_plane_state =3D NULL;
-	struct dc_state *dc_state =3D NULL;
+	struct dc_plane_state *dc_plane_state;
+	struct dc_state *dc_state;

 	if (!stream)
-		goto cleanup;
+		return dc_result;

 	dc_plane_state =3D dc_create_plane_state(dc);
 	if (!dc_plane_state)
-		goto cleanup;
+		return dc_result;

 	dc_state =3D dc_create_state(dc);
 	if (!dc_state)
-		goto cleanup;
+		goto release_plane_state;

 	/* populate stream to plane */
 	dc_plane_state->src_rect.height  =3D stream->src.height;
@@ -6475,13 +6475,9 @@ static enum dc_status dm_validate_stream_and_contex=
t(struct dc *dc,
 	if (dc_result =3D=3D DC_OK)
 		dc_result =3D dc_validate_global_state(dc, dc_state, true);

-cleanup:
-	if (dc_state)
-		dc_release_state(dc_state);
-
-	if (dc_plane_state)
-		dc_plane_state_release(dc_plane_state);
-
+	dc_release_state(dc_state);
+release_plane_state:
+	dc_plane_state_release(dc_plane_state);
 	return dc_result;
 }

=2D-
2.40.0

