Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1F65B1FB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 13:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268C710E309;
	Mon,  2 Jan 2023 12:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9689210E309
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672662297; x=1704198297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yhiKrPs+Cdxtz46EqEgyUFqBGAMbhKIClJvW2BwW0NA=;
 b=Y+wPSoLWRpbEOCgO26sBSeiK3fxx6OdaFhpUo4HWWxT2eRAgkIl20jOa
 hO/5AST//xVmM+Bod8BuKflimJofwzr8SmXv3Zvq1360uwMSqqxUdg2gD
 okwyFBbhPepyWeMvvw4bpqqUbqBEctR9+GYRvpksREkpij09KFooJzBnd
 3JOY+k9/RYsKwCpDJqMudICHu0CzmOxuMBikbf9UAHXCJE5fehdXdaN4S
 3F6RVJ4ldIivOZ+CZgKgWMsKlAM5tZpVvW9Nbe6pekcnOTvxWD5Kfa3rG
 CjMZztn0ISIywp6HXV3mq7lDtwNm8xkAUUYmgYQwv7QO/m0fonbjxSt4D g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="320188974"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="320188974"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 04:24:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="717785248"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="717785248"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.91])
 ([10.213.18.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 04:24:53 -0800
Message-ID: <99853520-02ff-b2be-9ce7-9e24a2303150@intel.com>
Date: Mon, 2 Jan 2023 13:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/bridge: panel: Prevent ERR_PTR Dereference
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230102120123.19062-1-maxime@cerno.tech>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230102120123.19062-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02.01.2023 13:01, Maxime Ripard wrote:
> Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
> drm_panel") introduced an access to the bridge pointer in the
> devm_drm_panel_bridge_add_typed() function.
>
> However, due to the unusual ERR_PTR check when getting that pointer, the
> pointer access is done even though the pointer might be an error
> pointer.
>
> Rework the function for a more traditional design that will return
> immediately if it gets an ERR_PTR so that we never access the pointer in
> that case.
>
> Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/bridge/panel.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 1708098fba6d..e8aae3cdc73d 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -357,15 +357,16 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>   		return ERR_PTR(-ENOMEM);
>   
>   	bridge = drm_panel_bridge_add_typed(panel, connector_type);
> -	if (!IS_ERR(bridge)) {
> -		*ptr = bridge;
> -		devres_add(dev, ptr);
> -	} else {
> +	if (IS_ERR(bridge)) {
>   		devres_free(ptr);
> +		return bridge;
>   	}
>   
>   	bridge->pre_enable_prev_first = panel->prepare_prev_first;
>   
> +	*ptr = bridge;
> +	devres_add(dev, ptr);
> +
>   	return bridge;
>   }
>   EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);

