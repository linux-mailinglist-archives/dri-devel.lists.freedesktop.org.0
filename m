Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B678D5B6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66BD10E129;
	Wed, 30 Aug 2023 11:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABD310E129;
 Wed, 30 Aug 2023 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693396749; x=1724932749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qOqUVVgQwlfiQmAWLlrKFZ13Ts0gYzw7r11Loeui4pk=;
 b=mUiDTRZKk9gNJ/dm/hlkstHnEmWSHA6RA/3Vh8WpZA+WQpaS/MDrrvWG
 v4bxjtUyf9er0WnHzGtzSnFmdFWxfi3GXbnhmCMjptCsLraLSETrqzMgM
 mbRWbbUerY1JQdvCSklMhC6LcR5MzyBJ8ZfPDpeIVoP2ZFssnqCYy5GXg
 69Ok5DfBomcQOMu+PSVBLUH25joPqYdokJ8m3O9MDTza7ARZGObzZkGL8
 6W1H4e9wiJrG+S+ohTnVpwW5E7uPWAMu5wDH0mPmDb2oj4VMdpsmItPt7
 S08PMsPNLHF7oe8tDV3F4MzGJ4EHUOA5fbo6kkmlmYVrQHYpakZrNxTIW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375576802"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="375576802"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="774092363"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="774092363"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:59:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 02/12] drm/sysfs: Register "ddc" symlink later
In-Reply-To: <20230829113920.13713-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-3-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 14:59:03 +0300
Message-ID: <873500212w.fsf@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently drm_sysfs_connector_add() attempts to register
> the "ddc" symlink (based one connector->ddc) before the
> driver's .early_register() hook has been called. That is
> too early for i915 which only fully registers the aux ch
> and associated i2c bus from said hook (to prevent half
> initialized stuff getting exposed to userspace). This
> causes my attempt at using drm_connector_init_with_ddc()
> to fail, and the entire connector disappears from sysfs
> on account of sysfs_create_link() failing.
>
> To fix that split the sysfs symlink stuff into separate
> functions (drm_sysfs_connector_add_late() and
> drm_sysfs_connector_remove_early()) which are called
> on the opposite side of the .later_register() and
> .early_unregister() hooks.
>
> Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_connector.c |  9 +++++++++
>  drivers/gpu/drm/drm_internal.h  |  2 ++
>  drivers/gpu/drm/drm_sysfs.c     | 22 +++++++++++++++-------
>  3 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 988996cf6da5..9d4c7b0c5c05 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -631,6 +631,10 @@ int drm_connector_register(struct drm_connector *con=
nector)
>  			goto err_debugfs;
>  	}
>=20=20
> +	ret =3D drm_sysfs_connector_add_late(connector);
> +	if (ret)
> +		goto err_late_register;
> +
>  	drm_mode_object_register(connector->dev, &connector->base);
>=20=20
>  	connector->registration_state =3D DRM_CONNECTOR_REGISTERED;
> @@ -647,6 +651,9 @@ int drm_connector_register(struct drm_connector *conn=
ector)
>  	mutex_unlock(&connector_list_lock);
>  	goto unlock;
>=20=20
> +err_late_register:
> +	if (connector->funcs->early_unregister)
> +		connector->funcs->early_unregister(connector);
>  err_debugfs:
>  	drm_debugfs_connector_remove(connector);
>  	drm_sysfs_connector_remove(connector);
> @@ -681,6 +688,8 @@ void drm_connector_unregister(struct drm_connector *c=
onnector)
>  					connector->privacy_screen,
>  					&connector->privacy_screen_notifier);
>=20=20
> +	drm_sysfs_connector_remove_early(connector);
> +
>  	if (connector->funcs->early_unregister)
>  		connector->funcs->early_unregister(connector);
>=20=20
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index ba12acd55139..4053cf8105ce 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -153,6 +153,8 @@ int drm_sysfs_init(void);
>  void drm_sysfs_destroy(void);
>  struct device *drm_sysfs_minor_alloc(struct drm_minor *minor);
>  int drm_sysfs_connector_add(struct drm_connector *connector);
> +int drm_sysfs_connector_add_late(struct drm_connector *connector);
> +void drm_sysfs_connector_remove_early(struct drm_connector *connector);
>  void drm_sysfs_connector_remove(struct drm_connector *connector);
>=20=20
>  void drm_sysfs_lease_event(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index b169b3e44a92..a953f69a34b6 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -400,10 +400,6 @@ int drm_sysfs_connector_add(struct drm_connector *co=
nnector)
>  			drm_err(dev, "failed to add component to create link to typec connect=
or\n");
>  	}
>=20=20
> -	if (connector->ddc)
> -		return sysfs_create_link(&connector->kdev->kobj,
> -				 &connector->ddc->dev.kobj, "ddc");
> -
>  	return 0;
>=20=20
>  err_free:
> @@ -411,14 +407,26 @@ int drm_sysfs_connector_add(struct drm_connector *c=
onnector)
>  	return r;
>  }
>=20=20
> +int drm_sysfs_connector_add_late(struct drm_connector *connector)
> +{
> +	if (connector->ddc)
> +		return sysfs_create_link(&connector->kdev->kobj,
> +					 &connector->ddc->dev.kobj, "ddc");
> +
> +	return 0;
> +}
> +
> +void drm_sysfs_connector_remove_early(struct drm_connector *connector)
> +{
> +	if (connector->ddc)
> +		sysfs_remove_link(&connector->kdev->kobj, "ddc");
> +}
> +
>  void drm_sysfs_connector_remove(struct drm_connector *connector)
>  {
>  	if (!connector->kdev)
>  		return;
>=20=20
> -	if (connector->ddc)
> -		sysfs_remove_link(&connector->kdev->kobj, "ddc");
> -
>  	if (dev_fwnode(connector->kdev))
>  		component_del(connector->kdev, &typec_connector_ops);

--=20
Jani Nikula, Intel Open Source Graphics Center
