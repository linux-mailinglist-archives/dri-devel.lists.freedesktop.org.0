Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8056009D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C43010E222;
	Wed, 29 Jun 2022 13:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D176C10E222
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656507858; x=1688043858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mQZzsgrfQfGB4r5Wod5uTV6JqnbcnZQ+QrZiRSDDJ+E=;
 b=Q3WucKKSxcEN20V/TiWRm5otJydeni5BAPf36AfnwZ521YH9LdPgtSux
 8bOvCOMGl1euHeJjrENr/yq1GgXDBrURoQYsH0BkDw/bBMB+m1/GsLz2c
 Ege+o/P+XoYJSgxubi/JXCIHvoSUb9rFOIOpk31c6yWOQsTs7r2jcdgWb
 bvamTwgVhkO2KkqPmDdcv+0yCazdyEe2yBI6iuhJMp7JVIzQo9FVkmTDD
 a6SxP+8YJ3Aq+gE9JQQhaPHnWYCe35cq6pYC0N5ahlWZh/qiWDci8ijQN
 Nq/mkI1SnOdCWviIS050+O/QNag+RrKviwvUpLK93YJtb6NOiYhaGgJ0r w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282058241"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="282058241"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:04:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647386123"
Received: from clauter-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.48.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:04:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3 08/71] drm/connector: Check for destroy implementation
In-Reply-To: <20220629123510.1915022-9-maxime@cerno.tech>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220629123510.1915022-1-maxime@cerno.tech>
 <20220629123510.1915022-9-maxime@cerno.tech>
Date: Wed, 29 Jun 2022 16:04:13 +0300
Message-ID: <87y1xfpqnm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 29 Jun 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> Connectors need to be cleaned up with a call to drm_connector_cleanup()
> in their drm_connector_funcs.destroy implementation.
>
> Let's check for this and complain if there's no such function.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_connector.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d7dab4242290..855267116e68 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -347,6 +347,9 @@ int drm_connector_init(struct drm_device *dev,
>  		       const struct drm_connector_funcs *funcs,
>  		       int connector_type)
>  {
> +	if (WARN_ON(!(funcs && funcs->destroy)))

drm_WARN_ON() for both.

> +		return -EINVAL;
> +
>  	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
>  }
>  EXPORT_SYMBOL(drm_connector_init);
> @@ -377,6 +380,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
>  				int connector_type,
>  				struct i2c_adapter *ddc)
>  {
> +	if (WARN_ON(!(funcs && funcs->destroy)))
> +		return -EINVAL;
> +
>  	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
>  }
>  EXPORT_SYMBOL(drm_connector_init_with_ddc);

-- 
Jani Nikula, Intel Open Source Graphics Center
