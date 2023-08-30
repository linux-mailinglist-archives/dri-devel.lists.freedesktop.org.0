Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800078D5C1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F2610E50E;
	Wed, 30 Aug 2023 12:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E3910E50E;
 Wed, 30 Aug 2023 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397183; x=1724933183;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rnzE+QpBbWTsUauWU3ePutypudHICOCMQAFpYKuTzL4=;
 b=dxQ1GaSF8Gq+j4iXqCLIT5qdrYghZzv3KCOB7dXP6hNT7oI+EEctN6FN
 yruIa4/tKmIqPS9pW/GbiY/IXm6kmf7b3qqy2Se/pjWT2k63u37ary1c2
 wl8P79IywVHRlG8IYeSq1t4mO6c8CQvaOPzLSQ8d45XWPoAZ5skIrawzj
 X1U6ShLxlFRtacJL6NR+EVzpO5uCUFeMzH3B69UXp53Lek5OuZIJB/MEn
 MjJfFsypGeTb3ZTZH/zY78LyBfTL3vZCMyUE8nupdvfdPxcF5sHRLoqV9
 7ZnCyQ+J6Q2Ep904e62MpAWETYTh5nqCPx+YTPe5Yqb/8vWObHk3MvNv+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379373598"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379373598"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882731380"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:06:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 05/12] drm/i915/crt: Populate connector->ddc
In-Reply-To: <20230829113920.13713-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-6-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:06:18 +0300
Message-ID: <87msy8zqdh.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Populate connector->ddc, and thus create the "ddc" symlink
> in sysfs for analog VGA connectors.
>
> As a bonus we can replace a bunch of intel_gmbus_get_adapter()
> lookups with just the connector->ddc pointer. Sadly one extra
> lookup still remains due to the g4x DVI-I shenanigans. We could
> perhaps consider borrowing the ddc proxy idea from SDVO to deal
> with that in a perhaps nicer way, but can't really be bothered
> right now at least. Also not sure exposing such a dual ddc bus
> to userspace would be quite wise.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_crt.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i=
915/display/intel_crt.c
> index 8145511bd5c3..ea3908fd2505 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -650,11 +650,9 @@ static bool intel_crt_detect_ddc(struct drm_connecto=
r *connector)
>  	struct intel_crt *crt =3D intel_attached_crt(to_intel_connector(connect=
or));
>  	struct drm_i915_private *dev_priv =3D to_i915(crt->base.base.dev);
>  	const struct drm_edid *drm_edid;
> -	struct i2c_adapter *ddc;
>  	bool ret =3D false;
>=20=20
> -	ddc =3D intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc=
_pin);
> -	drm_edid =3D intel_crt_get_edid(connector, ddc);
> +	drm_edid =3D intel_crt_get_edid(connector, connector->ddc);
>=20=20
>  	if (drm_edid) {
>  		const struct edid *edid =3D drm_edid_raw(drm_edid);
> @@ -923,8 +921,7 @@ static int intel_crt_get_modes(struct drm_connector *=
connector)
>  	wakeref =3D intel_display_power_get(dev_priv,
>  					  intel_encoder->power_domain);
>=20=20
> -	ddc =3D intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc=
_pin);
> -	ret =3D intel_crt_ddc_get_modes(connector, ddc);
> +	ret =3D intel_crt_ddc_get_modes(connector, connector->ddc);
>  	if (ret || !IS_G4X(dev_priv))
>  		goto out;
>=20=20
> @@ -988,6 +985,7 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
>  	struct intel_crt *crt;
>  	struct intel_connector *intel_connector;
>  	i915_reg_t adpa_reg;
> +	u8 ddc_pin;
>  	u32 adpa;
>=20=20
>  	if (HAS_PCH_SPLIT(dev_priv))
> @@ -1024,10 +1022,14 @@ void intel_crt_init(struct drm_i915_private *dev_=
priv)
>  		return;
>  	}
>=20=20
> +	ddc_pin =3D dev_priv->display.vbt.crt_ddc_pin;
> +
>  	connector =3D &intel_connector->base;
>  	crt->connector =3D intel_connector;
> -	drm_connector_init(&dev_priv->drm, &intel_connector->base,
> -			   &intel_crt_connector_funcs, DRM_MODE_CONNECTOR_VGA);
> +	drm_connector_init_with_ddc(&dev_priv->drm, connector,
> +				    &intel_crt_connector_funcs,
> +				    DRM_MODE_CONNECTOR_VGA,
> +				    intel_gmbus_get_adapter(dev_priv, ddc_pin));
>=20=20
>  	drm_encoder_init(&dev_priv->drm, &crt->base.base, &intel_crt_enc_funcs,
>  			 DRM_MODE_ENCODER_DAC, "CRT");

--=20
Jani Nikula, Intel Open Source Graphics Center
