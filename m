Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64BD41B5D1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 20:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC8C6E925;
	Tue, 28 Sep 2021 18:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C436E925
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 18:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=FQDKVFnJLuI7GhddRCy/fYTIWhrt9ayCVBaHFloKfpM=; b=fOoTq08H6Pf92oMngM1WHIJt98
 6O+9Fhr9W3Go8JGMecC6RHusbhhoL1MmpyFGD2/KjlL4eR5f7naqcsxfWS8j/Oi0Y1AgOqWOd4u9M
 EtR4TlTHKoKufXlFsu/eDyE8dVCQtyQIt3QM+41SGE2DzV3ot6phOHezz3+csVH5JUIiDE7q57TfU
 21IFy7dG0b+afPBpDi5I4KUiXhhOH7mhLnlcX2w2D+xaqyxJBRPF2m8prx0NS06A+RqtRcUAgiMz9
 zbRyswPGtg7L8TzntMSE81IZA/a0Z2m46YuHo1GrqacjTVJq5/KWwk1th1s7mlh6BV2s/E5WUFGnW
 pjNHRJyw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVHib-008O0y-9m; Tue, 28 Sep 2021 18:20:41 +0000
Subject: Re: [PATCH] drm/bridge: Add stubs for devm_drm_of_get_bridge when OF
 is disabled
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
References: <20210928181333.1176840-1-maxime@cerno.tech>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <70a74a6b-9c10-477d-bfc2-c358d6ecdc52@infradead.org>
Date: Tue, 28 Sep 2021 11:20:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928181333.1176840-1-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 9/28/21 11:13 AM, Maxime Ripard wrote:
> If CONFIG_OF is disabled, devm_drm_of_get_bridge won't be compiled in
> and drivers using that function will fail to build.
> 
> Add an inline stub so that we can still build-test those cases.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
>   include/drm/drm_bridge.h | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 9cdbd209388e..1648ce265cba 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -911,9 +911,20 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>   struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>   						   struct drm_panel *panel,
>   						   u32 connector_type);
> +struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
> +#endif
> +
> +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
>   struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
>   					  u32 port, u32 endpoint);
> -struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
> +#else
> +static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +							struct device_node *node,
> +							u32 port,
> +							u32 endpoint)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
>   #endif
>   
>   #endif
> 


-- 
~Randy
