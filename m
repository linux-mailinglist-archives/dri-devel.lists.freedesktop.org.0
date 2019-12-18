Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B7124A5F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 15:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C0B6E4F9;
	Wed, 18 Dec 2019 14:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D706E4BA;
 Wed, 18 Dec 2019 14:53:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 06:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="222026579"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 18 Dec 2019 06:53:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Dec 2019 16:53:05 +0200
Date: Wed, 18 Dec 2019 16:53:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm: Add
 __drm_atomic_helper_crtc_state_reset() & co.
Message-ID: <20191218145305.GJ1208@intel.com>
References: <20191107142417.11107-1-ville.syrjala@linux.intel.com>
 <20191213233853.eefala2yj2sibvx2@ldmartin-desk1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213233853.eefala2yj2sibvx2@ldmartin-desk1>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 03:38:53PM -0800, Lucas De Marchi wrote:
> On Thu, Nov 07, 2019 at 04:24:13PM +0200, Ville Syrj=E4l=E4 wrote:
> >From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> >Annoyingly __drm_atomic_helper_crtc_reset() does two
> >totally separate things:
> >a) reset the state to defaults values
> >b) assign the crtc->state pointer
> >
> >I just want a) without the b) so let's split out part
> >a) into __drm_atomic_helper_crtc_state_reset(). And
> >of course we'll do the same thing for planes and connectors.
> >
> >Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >---
> > drivers/gpu/drm/drm_atomic_state_helper.c | 70 ++++++++++++++++++++---
> > include/drm/drm_atomic_state_helper.h     |  6 ++
> > 2 files changed, 67 insertions(+), 9 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm=
/drm_atomic_state_helper.c
> >index d0a937fb0c56..a972068d58cf 100644
> >--- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >@@ -57,6 +57,22 @@
> >  * for these functions.
> >  */
> >
> >+/**
> >+ * __drm_atomic_helper_crtc_state_reset - reset the CRTC state
> >+ * @crtc_state: atomic CRTC state, must not be NULL
> >+ * @crtc: CRTC object, must not be NULL
> >+ *
> >+ * Initializes the newly allocated @crtc_state with default
> >+ * values. This is useful for drivers that subclass the CRTC state.
> >+ */
> >+void
> >+__drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
> >+				     struct drm_crtc *crtc)
> >+{
> >+	crtc_state->crtc =3D crtc;
> >+}
> >+EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
> >+
> > /**
> >  * __drm_atomic_helper_crtc_reset - reset state on CRTC
> >  * @crtc: drm CRTC
> >@@ -74,7 +90,7 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> > 			       struct drm_crtc_state *crtc_state)
> > {
> > 	if (crtc_state)
> >-		crtc_state->crtc =3D crtc;
> >+		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
> >
> > 	crtc->state =3D crtc_state;
> > }
> >@@ -212,23 +228,43 @@ void drm_atomic_helper_crtc_destroy_state(struct d=
rm_crtc *crtc,
> > EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
> >
> > /**
> >- * __drm_atomic_helper_plane_reset - resets planes state to default val=
ues
> >+ * __drm_atomic_helper_plane_state_reset - resets plane state to defaul=
t values
> >+ * @plane_state: atomic plane state, must not be NULL
> >  * @plane: plane object, must not be NULL
> >- * @state: atomic plane state, must not be NULL
> >  *
> >- * Initializes plane state to default. This is useful for drivers that =
subclass
> >- * the plane state.
> >+ * Initializes the newly allocated @plane_state with default
> >+ * values. This is useful for drivers that subclass the CRTC state.
> >  */
> >-void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
> >-				     struct drm_plane_state *state)
> >+void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *stat=
e,
> >+					   struct drm_plane *plane)
> > {
> > 	state->plane =3D plane;
> > 	state->rotation =3D DRM_MODE_ROTATE_0;
> >
> > 	state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> > 	state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> >+}
> >+EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
> >
> >-	plane->state =3D state;
> >+/**
> >+ * __drm_atomic_helper_plane_reset - reset state on plane
> >+ * @plane: drm plane
> >+ * @plane_state: plane state to assign
> >+ *
> >+ * Initializes the newly allocated @plane_state and assigns it to
> >+ * the &drm_crtc->state pointer of @plane, usually required when
> >+ * initializing the drivers or when called from the &drm_plane_funcs.re=
set
> >+ * hook.
> >+ *
> >+ * This is useful for drivers that subclass the plane state.
> >+ */
> >+void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
> >+				     struct drm_plane_state *plane_state)
> >+{
> >+	if (plane_state)
> >+		__drm_atomic_helper_plane_state_reset(plane_state, plane);
> >+
> >+	plane->state =3D plane_state;
> > }
> > EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
> >
> >@@ -335,6 +371,22 @@ void drm_atomic_helper_plane_destroy_state(struct d=
rm_plane *plane,
> > }
> > EXPORT_SYMBOL(drm_atomic_helper_plane_destroy_state);
> >
> >+/**
> >+ * __drm_atomic_helper_connector_state_reset - reset the connector state
> >+ * @conn__state: atomic connector state, must not be NULL
> =

> typo here, otherwise

Thanks for catching that. Made me run a doc build that found a mismatch
between kerneldoc vs. code for the plane function, so I fixed that up
while pushing.

Entire series pushed to dinq with Daniel's ack for the first patch.
Though in hindsight I could have just pushed that one to drm-misc eons
ago. Oh well.

Thanks for the reviews.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
