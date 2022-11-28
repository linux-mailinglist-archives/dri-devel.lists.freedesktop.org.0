Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839AE63A236
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ADF10E29B;
	Mon, 28 Nov 2022 07:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125F710E299;
 Mon, 28 Nov 2022 07:40:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F22A5501;
 Mon, 28 Nov 2022 08:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669621234;
 bh=5b4MxYFtVv/AGcWdNIpHDp3GApnEy6D6HkKW6YNderw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ugwOsTD5I1hFZda17iF3WHNKa3FvmdN0jtHDJWEyJiFBCffw8/HWeChfy44l2uxq5
 zB0Aoy5BOnrSbCUIdzQkv4XPA25BY7Ih+hVNUGwYqk7+bC/xfitNjItxW+VZK5gVOL
 n1FN471F+479gPDzz3TVO0tmUbHg6qPfrntETfOE=
Date: Mon, 28 Nov 2022 09:40:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 1/2] drm/connector: add connector list iteration with
 filtering
Message-ID: <Y4Rl4yoJH+hX7a6S@pendragon.ideasonboard.com>
References: <cover.1664966047.git.jani.nikula@intel.com>
 <8d92019b6ae730d6dc019e03fbc103645a2cf203.1664966047.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d92019b6ae730d6dc019e03fbc103645a2cf203.1664966047.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

Thank you for the patch.

On Wed, Oct 05, 2022 at 01:51:43PM +0300, Jani Nikula wrote:
> Add new function drm_connector_list_iter_filter_begin() to initialize
> connector list iterator with a filter function. Subsequent iteration on
> the list will only return connectors on which the filter function
> returns true.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 57 ++++++++++++++++++++++++++-------
>  include/drm/drm_connector.h     |  9 ++++++
>  2 files changed, 54 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e3142c8142b3..d54b4b54cecb 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -762,6 +762,29 @@ static struct lockdep_map connector_list_iter_dep_map = {
>  };
>  #endif
>  
> +/**
> + * drm_connector_list_iter_filter_begin - initialize a connector_list iterator with filter
> + * @dev: DRM device
> + * @iter: connector_list iterator
> + * @filter: connector filter function
> + * @filter_context: context to be passed to the filter function
> + *
> + * Same as drm_connector_list_iter_begin(), but sets up the iterator to only
> + * return connectors where filter(connector) returns true.
> + */
> +void drm_connector_list_iter_filter_begin(struct drm_device *dev,
> +					  struct drm_connector_list_iter *iter,
> +					  drm_connector_list_iter_filter_fn filter,
> +					  void *filter_context)
> +{
> +	iter->dev = dev;
> +	iter->conn = NULL;
> +	iter->filter = filter;
> +	iter->filter_context = filter_context;
> +	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL, _RET_IP_);
> +}
> +EXPORT_SYMBOL(drm_connector_list_iter_filter_begin);
> +
>  /**
>   * drm_connector_list_iter_begin - initialize a connector_list iterator
>   * @dev: DRM device
> @@ -775,9 +798,7 @@ static struct lockdep_map connector_list_iter_dep_map = {
>  void drm_connector_list_iter_begin(struct drm_device *dev,
>  				   struct drm_connector_list_iter *iter)
>  {
> -	iter->dev = dev;
> -	iter->conn = NULL;
> -	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL, _RET_IP_);
> +	drm_connector_list_iter_filter_begin(dev, iter, NULL, NULL);
>  }
>  EXPORT_SYMBOL(drm_connector_list_iter_begin);

I would have made this a static inline function in
include/drm/drm_connector.h. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
> @@ -800,15 +821,8 @@ __drm_connector_put_safe(struct drm_connector *conn)
>  	schedule_work(&config->connector_free_work);
>  }
>  
> -/**
> - * drm_connector_list_iter_next - return next connector
> - * @iter: connector_list iterator
> - *
> - * Returns: the next connector for @iter, or NULL when the list walk has
> - * completed.
> - */
> -struct drm_connector *
> -drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
> +static struct drm_connector *
> +__drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>  {
>  	struct drm_connector *old_conn = iter->conn;
>  	struct drm_mode_config *config = &iter->dev->mode_config;
> @@ -836,6 +850,25 @@ drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>  
>  	return iter->conn;
>  }
> +
> +/**
> + * drm_connector_list_iter_next - return next connector
> + * @iter: connector_list iterator
> + *
> + * Returns: the next connector for @iter, or NULL when the list walk has
> + * completed.
> + */
> +struct drm_connector *
> +drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
> +{
> +	struct drm_connector *connector;
> +
> +	while ((connector = __drm_connector_list_iter_next(iter)) &&
> +	       iter->filter && !iter->filter(connector, iter->filter_context))
> +		;
> +
> +	return connector;
> +}
>  EXPORT_SYMBOL(drm_connector_list_iter_next);
>  
>  /**
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 56aee949c6fa..497b98197d3a 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1868,6 +1868,9 @@ struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
>  void drm_mode_put_tile_group(struct drm_device *dev,
>  			     struct drm_tile_group *tg);
>  
> +typedef bool (*drm_connector_list_iter_filter_fn)(const struct drm_connector *connector,
> +						  void *filter_context);
> +
>  /**
>   * struct drm_connector_list_iter - connector_list iterator
>   *
> @@ -1886,10 +1889,16 @@ struct drm_connector_list_iter {
>  /* private: */
>  	struct drm_device *dev;
>  	struct drm_connector *conn;
> +	drm_connector_list_iter_filter_fn filter;
> +	void *filter_context;
>  };
>  
>  void drm_connector_list_iter_begin(struct drm_device *dev,
>  				   struct drm_connector_list_iter *iter);
> +void drm_connector_list_iter_filter_begin(struct drm_device *dev,
> +					  struct drm_connector_list_iter *iter,
> +					  drm_connector_list_iter_filter_fn filter,
> +					  void *filter_context);
>  struct drm_connector *
>  drm_connector_list_iter_next(struct drm_connector_list_iter *iter);
>  void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);

-- 
Regards,

Laurent Pinchart
