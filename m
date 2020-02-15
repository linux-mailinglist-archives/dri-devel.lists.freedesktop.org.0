Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351D15FFB1
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 19:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B374A6E21F;
	Sat, 15 Feb 2020 18:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368396E21F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:35:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8A8EC20041;
 Sat, 15 Feb 2020 19:35:05 +0100 (CET)
Date: Sat, 15 Feb 2020 19:35:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 1/1] drm: drop unused drm_display_mode.private
Message-ID: <20200215183503.GA17310@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=QyXUC8HyAAAA:8
 a=n5kQD2eiCkkDc2C2j2wA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=xmb-EsYY8bH0VWELuYED:22
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_display_mode.private was only referenced in one place where
is was copied but never assigned.

Drop the copy and drop the field in drm_display_mode.
Adjust the comment of private_flags as is referred to the comment for
private.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
---

Again, something I just stumbled upon.
I also checked private_flags - it is used in a few modules.
And it looked legit.

Build tested with allmodconfig, allyesconfig, allnoconfig for relevant
architectures.

	Sam


 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  1 -
 include/drm/drm_modes.h                     | 11 ++---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_encoder.c
index f96e142c4361..6197261e22c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -516,7 +516,6 @@ static void _dpu_encoder_adjust_mode(struct drm_connect=
or *connector,
 		if (cur_mode->vdisplay =3D=3D adj_mode->vdisplay &&
 		    cur_mode->hdisplay =3D=3D adj_mode->hdisplay &&
 		    drm_mode_vrefresh(cur_mode) =3D=3D drm_mode_vrefresh(adj_mode)) {
-			adj_mode->private =3D cur_mode->private;
 			adj_mode->private_flags |=3D cur_mode->private_flags;
 		}
 	}
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index e946e20c61d8..99134d4f35eb 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -371,20 +371,13 @@ struct drm_display_mode {
 	int crtc_vtotal;
 =

 	/**
-	 * @private:
+	 * @private_flags:
 	 *
-	 * Pointer for driver private data. This can only be used for mode
+	 * Driver private flags. private_flags can only be used for mode
 	 * objects passed to drivers in modeset operations. It shouldn't be used
 	 * by atomic drivers since they can store any additional data by
 	 * subclassing state structures.
 	 */
-	int *private;
-
-	/**
-	 * @private_flags:
-	 *
-	 * Similar to @private, but just an integer.
-	 */
 	int private_flags;
 =

 	/**
-- =

2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
