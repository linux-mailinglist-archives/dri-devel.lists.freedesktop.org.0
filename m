Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713176B13BE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 22:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FC710E71B;
	Wed,  8 Mar 2023 21:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E710E71B;
 Wed,  8 Mar 2023 21:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678310611; x=1709846611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vl4wY6flQp8MD2Ellil5QsYMewyUgb9M54xrBxBlHmU=;
 b=P8WOeQjYCgB8UqUUK6tWqtf42e4h739kHjmv+2SDNhxXJndiCRabNJZz
 HOI9fND5gsFL8SpB2l3rO+G4aiIvQrfR47a3xjrbAY+49Bt+iVb2F+11/
 cjY6sxB1cJJvCpc7lQWFMuT1hsyKefxrID/dri0S7Afj3Dag25tTEHvA/
 pD0+NwfuHmalbQ1l4EKghRfwgGP1rIoduGG4dGMvULgopI4twyAEPiejH
 luxq7/SbOb9HQNu1cmOzyiqa+xyJHu0sgOFzZX6hevBXptzSqkQxS6Zmi
 5tGk1bbRPEfDewmUZKf/iTFd/wDxGK2IjCWzP00ETfZ3Z/jcbjGC4Ec3O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324594675"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="324594675"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 13:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709572576"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="709572576"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 08 Mar 2023 12:26:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Mar 2023 22:26:27 +0200
Date: Wed, 8 Mar 2023 22:26:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [RFC] drm: property: use vzalloc() instead of kvzalloc() for
 large blobs
Message-ID: <ZAjvc7jjKDNSJcjq@intel.com>
References: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 12:02:42PM -0800, Abhinav Kumar wrote:
> For DRM property blobs created by user mode using
> drm_property_create_blob(), if the blob value needs to be updated the
> only way is to destroy the previous blob and create a new one instead.
> 
> For some of the property blobs, if the size of the blob is more
> than one page size, kvzalloc() can slow down system as it will first
> try to allocate physically contiguous memory but upon failure will
> fall back to non-contiguous (vmalloc) allocation.
> 
> If the blob property being used is bigger than one page size, in a
> heavily loaded system, this causes performance issues because
> some of the blobs are updated on a per-frame basis.
> 
> To mitigate the performance impact of kvzalloc(), use it only when
> the size of allocation is less than a page size when creating property
> blobs

Not sure how badly this will eat into the vmalloc area.

Is there no GFP flag to avoid the expensive stuff instead?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_property.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index dfec479830e4..40c2a3142038 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -561,7 +561,11 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
>  	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
>  		return ERR_PTR(-EINVAL);
>  
> -	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
> +	if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
> +		blob = vzalloc(sizeof(struct drm_property_blob)+length);
> +	else
> +		blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
> +
>  	if (!blob)
>  		return ERR_PTR(-ENOMEM);
>  
> -- 
> 2.7.4

-- 
Ville Syrjälä
Intel
