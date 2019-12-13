Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA611EE9A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A236EE11;
	Fri, 13 Dec 2019 23:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3B6EE11;
 Fri, 13 Dec 2019 23:39:00 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 15:39:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="204473980"
Received: from ldmartin-desk1.jf.intel.com (HELO ldmartin-desk1)
 ([10.24.11.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 15:39:00 -0800
Date: Fri, 13 Dec 2019 15:38:53 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm: Add
 __drm_atomic_helper_crtc_state_reset() & co.
Message-ID: <20191213233853.eefala2yj2sibvx2@ldmartin-desk1>
X-Patchwork-Hint: ignore
References: <20191107142417.11107-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107142417.11107-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 07, 2019 at 04:24:13PM +0200, Ville Syrj=E4l=E4 wrote:
>From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>
>Annoyingly __drm_atomic_helper_crtc_reset() does two
>totally separate things:
>a) reset the state to defaults values
>b) assign the crtc->state pointer
>
>I just want a) without the b) so let's split out part
>a) into __drm_atomic_helper_crtc_state_reset(). And
>of course we'll do the same thing for planes and connectors.
>
>Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>---
> drivers/gpu/drm/drm_atomic_state_helper.c | 70 ++++++++++++++++++++---
> include/drm/drm_atomic_state_helper.h     |  6 ++
> 2 files changed, 67 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/d=
rm_atomic_state_helper.c
>index d0a937fb0c56..a972068d58cf 100644
>--- a/drivers/gpu/drm/drm_atomic_state_helper.c
>+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>@@ -57,6 +57,22 @@
>  * for these functions.
>  */
>
>+/**
>+ * __drm_atomic_helper_crtc_state_reset - reset the CRTC state
>+ * @crtc_state: atomic CRTC state, must not be NULL
>+ * @crtc: CRTC object, must not be NULL
>+ *
>+ * Initializes the newly allocated @crtc_state with default
>+ * values. This is useful for drivers that subclass the CRTC state.
>+ */
>+void
>+__drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
>+				     struct drm_crtc *crtc)
>+{
>+	crtc_state->crtc =3D crtc;
>+}
>+EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
>+
> /**
>  * __drm_atomic_helper_crtc_reset - reset state on CRTC
>  * @crtc: drm CRTC
>@@ -74,7 +90,7 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> 			       struct drm_crtc_state *crtc_state)
> {
> 	if (crtc_state)
>-		crtc_state->crtc =3D crtc;
>+		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
>
> 	crtc->state =3D crtc_state;
> }
>@@ -212,23 +228,43 @@ void drm_atomic_helper_crtc_destroy_state(struct drm=
_crtc *crtc,
> EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
>
> /**
>- * __drm_atomic_helper_plane_reset - resets planes state to default values
>+ * __drm_atomic_helper_plane_state_reset - resets plane state to default =
values
>+ * @plane_state: atomic plane state, must not be NULL
>  * @plane: plane object, must not be NULL
>- * @state: atomic plane state, must not be NULL
>  *
>- * Initializes plane state to default. This is useful for drivers that su=
bclass
>- * the plane state.
>+ * Initializes the newly allocated @plane_state with default
>+ * values. This is useful for drivers that subclass the CRTC state.
>  */
>-void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
>-				     struct drm_plane_state *state)
>+void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
>+					   struct drm_plane *plane)
> {
> 	state->plane =3D plane;
> 	state->rotation =3D DRM_MODE_ROTATE_0;
>
> 	state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> 	state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
>+}
>+EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>
>-	plane->state =3D state;
>+/**
>+ * __drm_atomic_helper_plane_reset - reset state on plane
>+ * @plane: drm plane
>+ * @plane_state: plane state to assign
>+ *
>+ * Initializes the newly allocated @plane_state and assigns it to
>+ * the &drm_crtc->state pointer of @plane, usually required when
>+ * initializing the drivers or when called from the &drm_plane_funcs.reset
>+ * hook.
>+ *
>+ * This is useful for drivers that subclass the plane state.
>+ */
>+void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
>+				     struct drm_plane_state *plane_state)
>+{
>+	if (plane_state)
>+		__drm_atomic_helper_plane_state_reset(plane_state, plane);
>+
>+	plane->state =3D plane_state;
> }
> EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
>
>@@ -335,6 +371,22 @@ void drm_atomic_helper_plane_destroy_state(struct drm=
_plane *plane,
> }
> EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
>
>+/**
>+ * __drm_atomic_helper_connector_state_reset - reset the connector state
>+ * @conn__state: atomic connector state, must not be NULL

typo here, otherwise


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+ * @connector: connectotr object, must not be NULL
>+ *
>+ * Initializes the newly allocated @conn_state with default
>+ * values. This is useful for drivers that subclass the connector state.
>+ */
>+void
>+__drm_atomic_helper_connector_state_reset(struct drm_connector_state *con=
n_state,
>+					  struct drm_connector *connector)
>+{
>+	conn_state->connector =3D connector;
>+}
>+EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
>+
> /**
>  * __drm_atomic_helper_connector_reset - reset state on connector
>  * @connector: drm connector
>@@ -352,7 +404,7 @@ __drm_atomic_helper_connector_reset(struct drm_connect=
or *connector,
> 				    struct drm_connector_state *conn_state)
> {
> 	if (conn_state)
>-		conn_state->connector =3D connector;
>+		__drm_atomic_helper_connector_state_reset(conn_state, connector);
>
> 	connector->state =3D conn_state;
> }
>diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomi=
c_state_helper.h
>index e4577cc11689..8171dea4cc22 100644
>--- a/include/drm/drm_atomic_state_helper.h
>+++ b/include/drm/drm_atomic_state_helper.h
>@@ -37,6 +37,8 @@ struct drm_private_state;
> struct drm_modeset_acquire_ctx;
> struct drm_device;
>
>+void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
>+					  struct drm_crtc *crtc);
> void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> 				    struct drm_crtc_state *state);
> void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
>@@ -48,6 +50,8 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_c=
rtc_state *state);
> void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
> 					  struct drm_crtc_state *state);
>
>+void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
>+					   struct drm_plane *plane);
> void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
> 				     struct drm_plane_state *state);
> void drm_atomic_helper_plane_reset(struct drm_plane *plane);
>@@ -59,6 +63,8 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_=
plane_state *state);
> void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
> 					  struct drm_plane_state *state);
>
>+void __drm_atomic_helper_connector_state_reset(struct drm_connector_state=
 *conn_state,
>+					       struct drm_connector *connector);
> void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
> 					 struct drm_connector_state *conn_state);
> void drm_atomic_helper_connector_reset(struct drm_connector *connector);
>-- =

>2.23.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
