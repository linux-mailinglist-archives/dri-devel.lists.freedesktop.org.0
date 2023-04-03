Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41416D4D7A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B3110E4FE;
	Mon,  3 Apr 2023 16:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191BA10E4FE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680539027; x=1712075027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KKOoqArtLJbI+AYxzGdM3VB9YLMZqitlFjI+Y4NeHVM=;
 b=e+4tZFQ3s+VUK+nGNn3VLvXMz3hIZhNg8Cd9bHkrK2Euw8XYK5YRJMd0
 6FS0DVsR2YGtVniQu2fQEhbYe7+L9LcVL43/8IWf0OVWc8rvOjoHtcqOG
 fsOz+6yaVujynRlTWmuDHIkpAL2akEFqaX0QHmlcnfKALiQhBbFURqQPe
 AwetdZ8ooa88tPyjPk0S6sJ1DnM8h2bT5VASpRHf6ip/aJrpdJNj+4uz6
 iUjoeJmSxqUE2emtPSuz2lwDIwoFb5VADEzsha0TO/CBreGQhpU7OfS8T
 llmvdKorYbLZ+Eh8mUfTznwYchskTQP4oKmUnPSJ6iJ6JFFdtdDhQDdCx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340677126"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="340677126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829622393"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="829622393"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 03 Apr 2023 09:23:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Apr 2023 19:23:43 +0300
Date: Mon, 3 Apr 2023 19:23:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/vblank: Simplify drm_dev_has_vblank()
Message-ID: <ZCr9jrhTyGuZA+Qt@intel.com>
References: <20230403160735.1211468-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403160735.1211468-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 09:07:35AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> What does vblank have to do with num_crtcs?  Well, this was technically
> correct, but you'd have to go look at where num_crtcs is initialized to
> understand why.  Lets just replace it with the simpler and more obvious
> check.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 877e2067534f..ad34c235d853 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -575,7 +575,7 @@ EXPORT_SYMBOL(drm_vblank_init);
>   */
>  bool drm_dev_has_vblank(const struct drm_device *dev)
>  {
> -	return dev->num_crtcs != 0;
> +	return !!dev->vblank;

The compiler knows how to turn things into a boolean.

Or I guess if we want to be a bit more explicit we could
write this as
 return dev->vblank != NULL;
but IIRC that will make checkpatch complain because of
someone's personal taste.

>  }
>  EXPORT_SYMBOL(drm_dev_has_vblank);
>  
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
