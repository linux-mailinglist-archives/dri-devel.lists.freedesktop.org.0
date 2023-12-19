Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3708183A1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 09:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DED110E41C;
	Tue, 19 Dec 2023 08:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD44410E41C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702975447; x=1734511447;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=y23D3/S71Dkftkw0q5rEVVQsi0eBjpjp26UrTr3izLc=;
 b=gbfSib0crA41g31i+9LATPovgkDo/ZjIyNwUPmkJ/cNr+Q/eLMWaBv8e
 loSK8wd6zdP9Aa1DIp2GzZK9iR1FHrZ+ckBFomG1wN5kp7jIc24xfz6HP
 khHz2gOi0H47pOYY+2Jw3r6PIBRupd3Pmo59wWQL8WpFSx0kXrQpN0r8a
 kW7WZNNKruuDsrQleMp5XeMOLbkOGnAFzdGE1/A/4u3coziRtyLMnSDPK
 TAx8GnDleQ2v5gFu9ZaLPj7EI85l0l6LZKm1ox1aUuWXR37anVE+v+5I2
 pNiUcv7xQzwMLlHtA++w7Fc2urT02mcfxwthNXKuQx1+oCG93jUQMImo1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459969794"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="459969794"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 00:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107277246"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="1107277246"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.118])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 00:44:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.14 3/6] drm/crtc: Fix uninit-value bug in
 drm_mode_setcrtc
In-Reply-To: <20231218124725.1382738-3-sashal@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231218124725.1382738-1-sashal@kernel.org>
 <20231218124725.1382738-3-sashal@kernel.org>
Date: Tue, 19 Dec 2023 10:44:02 +0200
Message-ID: <87bkamvay5.fsf@intel.com>
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
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de,
 Ziqi Zhao <astrajoan@yahoo.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023, Sasha Levin <sashal@kernel.org> wrote:
> From: Ziqi Zhao <astrajoan@yahoo.com>
>
> [ Upstream commit 3823119b9c2b5f9e9b760336f75bc989b805cde6 ]
>
> The connector_set contains uninitialized values when allocated with
> kmalloc_array. However, in the "out" branch, the logic assumes that any
> element in connector_set would be equal to NULL if failed to
> initialize, which causes the bug reported by Syzbot. The fix is to use
> an extra variable to keep track of how many connectors are initialized
> indeed, and use that variable to decrease any refcounts in the "out"
> branch.
>
> Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
> Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
> Reported-and-tested-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
> Tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Link: https://lore.kernel.org/r/20230721161446.8602-1-astrajoan@yahoo.com
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This commit fixes an uninitialized value, but introduces a new
one. Please backport 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable
use") from v6.7-rc6 to go with it.

Thanks,
Jani.

> ---
>  drivers/gpu/drm/drm_crtc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 5af25ce5bf7c2..5ae3adfbc5e80 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -556,8 +556,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	struct drm_mode_set set;
>  	uint32_t __user *set_connectors_ptr;
>  	struct drm_modeset_acquire_ctx ctx;
> -	int ret;
> -	int i;
> +	int ret, i, num_connectors;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EINVAL;
> @@ -672,6 +671,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  			goto out;
>  		}
>  
> +		num_connectors = 0;
>  		for (i = 0; i < crtc_req->count_connectors; i++) {
>  			connector_set[i] = NULL;
>  			set_connectors_ptr = (uint32_t __user *)(unsigned long)crtc_req->set_connectors_ptr;
> @@ -692,6 +692,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  					connector->name);
>  
>  			connector_set[i] = connector;
> +			num_connectors++;
>  		}
>  	}
>  
> @@ -700,7 +701,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	set.y = crtc_req->y;
>  	set.mode = mode;
>  	set.connectors = connector_set;
> -	set.num_connectors = crtc_req->count_connectors;
> +	set.num_connectors = num_connectors;
>  	set.fb = fb;
>  	ret = __drm_mode_set_config_internal(&set, &ctx);
>  
> @@ -709,7 +710,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  		drm_framebuffer_put(fb);
>  
>  	if (connector_set) {
> -		for (i = 0; i < crtc_req->count_connectors; i++) {
> +		for (i = 0; i < num_connectors; i++) {
>  			if (connector_set[i])
>  				drm_connector_put(connector_set[i]);
>  		}

-- 
Jani Nikula, Intel
