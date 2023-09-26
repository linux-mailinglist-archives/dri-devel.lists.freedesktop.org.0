Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442F7AE9B4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 11:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32610E393;
	Tue, 26 Sep 2023 09:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE2A10E393
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695722183; x=1727258183;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lv6utoFmGE1CxgX6o35L7q9olx7J1U+BXt8gJeEi0+0=;
 b=iMaaq6KO00APE0xv7EMEil682NdI/mrVlL9LOC3ljfiQShL+kCye6rQP
 D3nX/GXYs2ZIoD04bPhyj2qYKHIianuv2RbFR097UJ35dowmA6P2Fhk3a
 zGbhEYMPjIy0QRkpJAgKEOZmA9Cu/CvncotE9wZLtkd3271vPVIIRaoGL
 ZXOBLR7yJLqQYvvyxyulbYwkwagYtKh8bi0DgttcxdbuCkZEMobft0dub
 f7JEDuU6eaIA92P2AU+0BqPh/TOQdM+h8FLC+ymFdCZJzkhN5qRdl+ReS
 w01t38VWYzh/Tnh6BId5ViZNIoxGgiFTcIv3/kEWXXwf906LDqDT3ss9J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="448029278"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="448029278"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 02:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995773375"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="995773375"
Received: from wagnert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.202])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 02:56:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/bridge: use drm_bridge_get_edid() instead of
 using ->get_edid directly
In-Reply-To: <20230914131450.2473061-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131450.2473061-1-jani.nikula@intel.com>
Date: Tue, 26 Sep 2023 12:56:17 +0300
Message-ID: <87jzsdl0la.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Ping?

On Thu, 14 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Make drm_bridge_get_edid() the one place to call the hook.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1da93d5a1f61..31baf1f5ff81 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -238,7 +238,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>  	if (status != connector_status_connected)
>  		goto no_edid;
>  
> -	edid = bridge->funcs->get_edid(bridge, connector);
> +	edid = drm_bridge_get_edid(bridge, connector);
>  	if (!drm_edid_is_valid(edid)) {
>  		kfree(edid);
>  		goto no_edid;

-- 
Jani Nikula, Intel
