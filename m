Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24360B498
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 19:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A3110E6B7;
	Mon, 24 Oct 2022 17:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8C10E65D;
 Mon, 24 Oct 2022 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666634004; x=1698170004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+9IffsENXZLLQ1PuCmG2BckTIHrQ9YE6AHK4XSADV2k=;
 b=eJBRA6yeQrEbiUHPxX/3GcNUalcWh08xnDTAwetGTKEsRoOFNSQVhSFk
 EON8bb767n8fGxtvcHO1/TAe038oSQGB7mO/nwrwhd4POMNMWBmq1JZlD
 nozUTb2KKUvSM/FIcTcyxfHf9ydd4EYRHyNcU68a1twFO1LxlJVmaC5cp
 jLmvZWVeen3R5QT/6kZtHVgkayk+zBTBaNQiIAehRwfe7/0SqD5ZHighK
 TZig+0FFHULrrCMRJiSebt634WyXnYVqqTHHkqABhTJqASWym//BglzNf
 xjE10EpyAQ19RKH4rKADFOctQz5M6BVgiuunTWKXC5emXJGJMUuTSg5lu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334075621"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="334075621"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 10:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806388795"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="806388795"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga005.jf.intel.com with SMTP; 24 Oct 2022 10:53:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Oct 2022 20:53:20 +0300
Date: Mon, 24 Oct 2022 20:53:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 09/16] drm/edid: detach debugfs EDID override from
 EDID property update
Message-ID: <Y1bREOOlS/ODLioH@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
 <4c875f8e06c4499f498fcf876e1233cbb155ec8a.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c875f8e06c4499f498fcf876e1233cbb155ec8a.1666614699.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 03:33:37PM +0300, Jani Nikula wrote:
> Having the EDID override debugfs directly update the EDID property is
> problematic. The update is partial only. The driver has no way of
> knowing it's been updated. Mode list is not updated. It's an
> inconsistent state.
> 
> Detach debugfs EDID override from the property update completely. Only
> set and reset a separate override EDID copy from debugfs, and have it
> take effect only at detect (via EDID read). The copy is at
> connector->edid_override, protected by connector->edid_override_mutex.
> 
> This also brings override EDID closer to firmware EDID in behaviour.
> 
> Add validation of the override EDID which we completely lacked.
> 
> Note that IGT already forces a detect whenever tests update the override
> EDID.
> 
> v2: Add locking (Ville)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  1 +
>  drivers/gpu/drm/drm_edid.c      | 73 ++++++++++++++++-----------------
>  include/drm/drm_connector.h     | 16 ++++++--
>  3 files changed, 49 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 61c29ce74b03..f25674c0d41e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -274,6 +274,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
>  	mutex_init(&connector->mutex);
> +	mutex_init(&connector->edid_override_mutex);
>  	connector->edid_blob_ptr = NULL;
>  	connector->epoch_counter = 0;
>  	connector->tile_blob_ptr = NULL;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c3cf942186b7..b8d07e4d6215 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2207,8 +2207,12 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
>  {
>  	struct edid *override = NULL;
>  
> -	if (connector->override_edid)
> -		override = drm_edid_duplicate(connector->edid_blob_ptr->data);
> +	mutex_lock(&connector->edid_override_mutex);
> +
> +	if (connector->edid_override)
> +		override = drm_edid_duplicate(connector->edid_override->edid);
> +
> +	mutex_unlock(&connector->edid_override_mutex);

I was first thinking we'd use connection_mutex or something for this,
but given no one should anymore access this thing directly a dedicated
mutex seems like a fine choice. At least it's clear what it protects.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  
>  	if (!override)
>  		override = drm_load_edid_firmware(connector);
> @@ -2223,10 +2227,15 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
>  /* For debugfs edid_override implementation */
>  int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m)
>  {
> -	struct drm_property_blob *edid = connector->edid_blob_ptr;
> +	const struct drm_edid *drm_edid;
>  
> -	if (connector->override_edid && edid)
> -		seq_write(m, edid->data, edid->length);
> +	mutex_lock(&connector->edid_override_mutex);
> +
> +	drm_edid = connector->edid_override;
> +	if (drm_edid)
> +		seq_write(m, drm_edid->edid, drm_edid->size);
> +
> +	mutex_unlock(&connector->edid_override_mutex);
>  
>  	return 0;
>  }
> @@ -2235,32 +2244,43 @@ int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m)
>  int drm_edid_override_set(struct drm_connector *connector, const void *edid,
>  			  size_t size)
>  {
> -	int ret;
> +	const struct drm_edid *drm_edid;
>  
> -	if (size < EDID_LENGTH || edid_size(edid) > size)
> +	drm_edid = drm_edid_alloc(edid, size);
> +	if (!drm_edid_valid(drm_edid)) {
> +		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override invalid\n",
> +			    connector->base.id, connector->name);
> +		drm_edid_free(drm_edid);
>  		return -EINVAL;
> -
> -	connector->override_edid = false;
> +	}
>  
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override set\n",
>  		    connector->base.id, connector->name);
>  
> -	ret = drm_connector_update_edid_property(connector, edid);
> -	if (!ret)
> -		connector->override_edid = true;
> +	mutex_lock(&connector->edid_override_mutex);
>  
> -	return ret;
> +	drm_edid_free(connector->edid_override);
> +	connector->edid_override = drm_edid;
> +
> +	mutex_unlock(&connector->edid_override_mutex);
> +
> +	return 0;
>  }
>  
>  /* For debugfs edid_override implementation */
>  int drm_edid_override_reset(struct drm_connector *connector)
>  {
> -	connector->override_edid = false;
> -
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override reset\n",
>  		    connector->base.id, connector->name);
>  
> -	return drm_connector_update_edid_property(connector, NULL);
> +	mutex_lock(&connector->edid_override_mutex);
> +
> +	drm_edid_free(connector->edid_override);
> +	connector->edid_override = NULL;
> +
> +	mutex_unlock(&connector->edid_override_mutex);
> +
> +	return 0;
>  }
>  
>  /**
> @@ -6634,23 +6654,6 @@ int drm_edid_connector_update(struct drm_connector *connector,
>  {
>  	int count;
>  
> -	/*
> -	 * FIXME: Reconcile the differences in override_edid handling between
> -	 * this and drm_connector_update_edid_property().
> -	 *
> -	 * If override_edid is set, and the EDID passed in here originates from
> -	 * drm_edid_read() and friends, it will be the override EDID, and there
> -	 * are no issues. drm_connector_update_edid_property() ignoring requests
> -	 * to set the EDID dates back to a time when override EDID was not
> -	 * handled at the low level EDID read.
> -	 *
> -	 * The only way the EDID passed in here can be different from the
> -	 * override EDID is when a driver passes in an EDID that does *not*
> -	 * originate from drm_edid_read() and friends, or passes in a stale
> -	 * cached version. This, in turn, is a question of when an override EDID
> -	 * set via debugfs should take effect.
> -	 */
> -
>  	count = _drm_edid_connector_update(connector, drm_edid);
>  
>  	_drm_update_tile_info(connector, drm_edid);
> @@ -6665,10 +6668,6 @@ EXPORT_SYMBOL(drm_edid_connector_update);
>  static int _drm_connector_update_edid_property(struct drm_connector *connector,
>  					       const struct drm_edid *drm_edid)
>  {
> -	/* ignore requests to set edid when overridden */
> -	if (connector->override_edid)
> -		return 0;
> -
>  	/*
>  	 * Set the display info, using edid if available, otherwise resetting
>  	 * the values to defaults. This duplicates the work done in
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b1b2df48d42c..e641a4725f99 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1550,12 +1550,20 @@ struct drm_connector {
>  	struct drm_cmdline_mode cmdline_mode;
>  	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
>  	enum drm_connector_force force;
> +
> +	/**
> +	 * @edid_override: Override EDID set via debugfs.
> +	 *
> +	 * Do not modify or access outside of the drm_edid_override_* family of
> +	 * functions.
> +	 */
> +	const struct drm_edid *edid_override;
> +
>  	/**
> -	 * @override_edid: has the EDID been overwritten through debugfs for
> -	 * testing? Do not modify outside of drm_edid_override_set() and
> -	 * drm_edid_override_reset().
> +	 * @edid_override_mutex: Protect access to edid_override.
>  	 */
> -	bool override_edid;
> +	struct mutex edid_override_mutex;
> +
>  	/** @epoch_counter: used to detect any other changes in connector, besides status */
>  	u64 epoch_counter;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
