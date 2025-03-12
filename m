Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC120A5DF5B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA2610E794;
	Wed, 12 Mar 2025 14:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVKxVOJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C79410E793;
 Wed, 12 Mar 2025 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741790736; x=1773326736;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=51F5V9KpmKiGFlWk7Ciyvh77TSQD6EBq5r4usIm5TGQ=;
 b=XVKxVOJ26xJn9g4Tw1HceFhAHjmXH1GaSyvqj1t3m4siqN6hl/kkCTSL
 wbX0u78fDl5doJfgZFc3Jl8L9n0l+TTggcJX99fk1hrkrBOvYxJBFlboG
 QeM2yz4PtEVxZQfNVVPmCPtl4jwxujFnv6gHeOwO5idTROx2SiMx0DSpA
 qzzb3DE2+kp+/+vOtvA7l76O0/VanLhEj9TwKFLcxEsitv3ZMSSfpW+XL
 t/5iyeRdtVVVm7/5gsHsiPEIQmTPSVmNaORVY5ppOB5MH64v+Hh6PO2yy
 mqdthnOaXh6lec9CD2c0BaJbSbouu+1+hgGjF3nXui0R6l5NUBpneA3H3 Q==;
X-CSE-ConnectionGUID: oj21kJITQ4WfVD67unFfJQ==
X-CSE-MsgGUID: tBuLRBjiQKyOkFzV895xKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60417864"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="60417864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:36 -0700
X-CSE-ConnectionGUID: Wn4fnWvZTZWF5FapvxLUNA==
X-CSE-MsgGUID: MmX8ztUwTu6yCtYzSG8Tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120631590"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 7/8] drm/client: Move variables to tighter scope
In-Reply-To: <20250228211454.8138-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
 <20250228211454.8138-8-ville.syrjala@linux.intel.com>
Date: Wed, 12 Mar 2025 16:45:31 +0200
Message-ID: <87zfhqe29g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 28 Feb 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Bunch of variables are only needed inside loops and whatnot.
> Move them to a tighter scope to make the code less confusing.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 33 +++++++++++++++-------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index a0caa2b229dd..54cbcaa476e2 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -73,9 +73,10 @@ int drm_client_modeset_create(struct drm_client_dev *c=
lient)
>  static void drm_client_modeset_release(struct drm_client_dev *client)
>  {
>  	struct drm_mode_set *modeset;
> -	unsigned int i;
>=20=20
>  	drm_client_for_each_modeset(modeset, client) {
> +		unsigned int i;
> +
>  		drm_mode_destroy(client->dev, modeset->mode);
>  		modeset->mode =3D NULL;
>  		modeset->fb =3D NULL;
> @@ -291,9 +292,8 @@ static bool drm_client_target_cloned(struct drm_devic=
e *dev,
>  				     struct drm_client_offset offsets[],
>  				     bool enabled[], int width, int height)
>  {
> -	int count, i, j;
> +	int count, i;
>  	bool can_clone =3D false;
> -	const struct drm_display_mode *mode;
>  	struct drm_display_mode *dmt_mode;
>=20=20
>  	/* only contemplate cloning in the single crtc case */
> @@ -313,6 +313,8 @@ static bool drm_client_target_cloned(struct drm_devic=
e *dev,
>  	/* check the command line or if nothing common pick 1024x768 */
>  	can_clone =3D true;
>  	for (i =3D 0; i < connector_count; i++) {
> +		int j;
> +
>  		if (!enabled[i])
>  			continue;
>=20=20
> @@ -347,6 +349,8 @@ static bool drm_client_target_cloned(struct drm_devic=
e *dev,
>  		goto fail;
>=20=20
>  	for (i =3D 0; i < connector_count; i++) {
> +		const struct drm_display_mode *mode;
> +
>  		if (!enabled[i])
>  			continue;
>=20=20
> @@ -380,12 +384,12 @@ static int drm_client_get_tile_offsets(struct drm_d=
evice *dev,
>  				       int idx,
>  				       int h_idx, int v_idx)
>  {
> -	struct drm_connector *connector;
>  	int i;
>  	int hoffset =3D 0, voffset =3D 0;
>=20=20
>  	for (i =3D 0; i < connector_count; i++) {
> -		connector =3D connectors[i];
> +		struct drm_connector *connector =3D connectors[i];
> +
>  		if (!connector->has_tile)
>  			continue;
>=20=20
> @@ -415,7 +419,6 @@ static bool drm_client_target_preferred(struct drm_de=
vice *dev,
>  					bool enabled[], int width, int height)
>  {
>  	const u64 mask =3D BIT_ULL(connector_count) - 1;
> -	struct drm_connector *connector;
>  	u64 conn_configured =3D 0;
>  	int tile_pass =3D 0;
>  	int num_tiled_conns =3D 0;
> @@ -429,9 +432,9 @@ static bool drm_client_target_preferred(struct drm_de=
vice *dev,
>=20=20
>  retry:
>  	for (i =3D 0; i < connector_count; i++) {
> +		struct drm_connector *connector =3D connectors[i];
>  		const char *mode_type;
>=20=20
> -		connector =3D connectors[i];
>=20=20
>  		if (conn_configured & BIT_ULL(i))
>  			continue;
> @@ -546,9 +549,8 @@ static int drm_client_pick_crtcs(struct drm_client_de=
v *client,
>  	struct drm_device *dev =3D client->dev;
>  	struct drm_connector *connector;
>  	int my_score, best_score, score;
> -	struct drm_crtc **crtcs, *crtc;
> +	struct drm_crtc **crtcs;
>  	struct drm_mode_set *modeset;
> -	int o;
>=20=20
>  	if (n =3D=3D connector_count)
>  		return 0;
> @@ -578,7 +580,8 @@ static int drm_client_pick_crtcs(struct drm_client_de=
v *client,
>  	 * remaining connectors
>  	 */
>  	drm_client_for_each_modeset(modeset, client) {
> -		crtc =3D modeset->crtc;
> +		struct drm_crtc *crtc =3D modeset->crtc;
> +		int o;
>=20=20
>  		if (!connector_has_possible_crtc(connector, crtc))
>  			continue;
> @@ -622,7 +625,7 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  	const int count =3D min_t(unsigned int, connector_count, BITS_PER_LONG);
>  	unsigned long conn_configured, conn_seq, mask;
>  	struct drm_device *dev =3D client->dev;
> -	int i, j;
> +	int i;
>  	bool *save_enabled;
>  	bool fallback =3D true, ret =3D true;
>  	int num_connectors_enabled =3D 0;
> @@ -656,12 +659,11 @@ static bool drm_client_firmware_config(struct drm_c=
lient_dev *client,
>  retry:
>  	conn_seq =3D conn_configured;
>  	for (i =3D 0; i < count; i++) {
> -		struct drm_connector *connector;
> +		struct drm_connector *connector =3D connectors[i];
>  		struct drm_encoder *encoder;
>  		struct drm_crtc *crtc;
>  		const char *mode_type;
> -
> -		connector =3D connectors[i];
> +		int j;
>=20=20
>  		if (conn_configured & BIT(i))
>  			continue;
> @@ -1239,11 +1241,12 @@ static void drm_client_modeset_dpms_legacy(struct=
 drm_client_dev *client, int dp
>  	struct drm_connector *connector;
>  	struct drm_mode_set *modeset;
>  	struct drm_modeset_acquire_ctx ctx;
> -	int j;
>  	int ret;
>=20=20
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	drm_client_for_each_modeset(modeset, client) {
> +		int j;
> +
>  		if (!modeset->crtc->enabled)
>  			continue;

--=20
Jani Nikula, Intel
