Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A4546D40
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5791135DA;
	Fri, 10 Jun 2022 19:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2807410E151;
 Fri, 10 Jun 2022 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654889360; x=1686425360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ph1O0Ltuh8YI0nNdspQVFqPdBqrEgD4dFxyqThw84jA=;
 b=YjpCJBMUczHNCQ9vMa4wUbrgfoiuYjfFc5WVfyWfJR+leuTZQPag1YlN
 DL35dsNaqRq3ZQLdqyDwnJheral+vxJc6P87nddZ79uPiuSw5lBU8a9Hm
 0UKQL1wZIOb02eYJ8j2nHRtvkXsY0kLBlMrDBkHti8xTqDmisVZPwD+ss
 7yVV6tuZZT6fWRHD5L8VHeA4M1n6yMvM+iErJFhtoJ0v7amWSeDhkVXK/
 tXxIAtD52DHsuP0/BaJqc3v0KDwOZ3vaNKsRWHxwy+eYO/co6ArhDA/T8
 uI7GEpaYmyJpAj/1N5F/jQ/NKYyH3cw1lO8K0FzGVFR/kTSsQKTOiNJtK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="364053162"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="364053162"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="581227985"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 10 Jun 2022 12:29:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:29:16 +0300
Date: Fri, 10 Jun 2022 22:29:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 09/15] drm/edid: add drm_edid_raw() to access the raw
 EDID data
Message-ID: <YqObjAgiFiy+h6ku@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <5363988bcd7f0af9a32e30634348dbb8f22ec5b9.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5363988bcd7f0af9a32e30634348dbb8f22ec5b9.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:39AM +0300, Jani Nikula wrote:
> Unfortunately, there are still plenty of interfaces around that require
> a struct edid pointer, and it's impossible to change them all at
> once. Add an accessor to the raw EDID data to help the transition.
> 
> While there are no such cases now, be defensive against raw EDID
> extension count indicating bigger EDID than is actually allocated.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 26 ++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 952724788963..4e788c5cbf25 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2333,6 +2333,32 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL_GPL(drm_do_get_edid);
>  
> +/**
> + * drm_edid_raw - Get a pointer to the raw EDID data.
> + * @drm_edid: drm_edid container
> + *
> + * Get a pointer to the raw EDID data.
> + *
> + * This is for transition only. Avoid using this like the plague.
> + *
> + * Return: Pointer to raw EDID data.
> + */
> +const struct edid *drm_edid_raw(const struct drm_edid *drm_edid)
> +{
> +	if (!drm_edid || !drm_edid->size)
> +		return NULL;
> +
> +	/*
> +	 * Do not return pointers where relying on EDID extension count would
> +	 * lead to buffer overflow.
> +	 */
> +	if (WARN_ON(edid_size(drm_edid->edid) > drm_edid->size))
> +		return NULL;
> +
> +	return drm_edid->edid;
> +}
> +EXPORT_SYMBOL(drm_edid_raw);
> +
>  /* Allocate struct drm_edid container *without* duplicating the edid data */
>  static const struct drm_edid *_drm_edid_alloc(const void *edid, size_t size)
>  {
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index aeb2fa95bc04..2181977ae683 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -597,6 +597,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
>  const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
>  void drm_edid_free(const struct drm_edid *drm_edid);
> +const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
>  const struct drm_edid *drm_edid_read(struct drm_connector *connector);
>  const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>  					 struct i2c_adapter *adapter);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
