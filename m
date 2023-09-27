Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7617B063F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 16:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BCC10E535;
	Wed, 27 Sep 2023 14:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F19110E535
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695823769; x=1727359769;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1VugMVzAcvJXPQUc2zNrMm5xY+clhzIVS1o0nfEl1MU=;
 b=AKtx8yEx2m8t/pa5yDSF2UpeNLMW1iUgOfKduQ6eO82MaWvtpSrRGu9G
 BRl/X7OHUgJX1UIZjiQhGTWU+qXvP1QOrsZDPV6b2fKOan6vfbCOcwW7M
 xL29jCdijjJJu5qFM7RLcxtOd3d397AfmK50HDvM9hoHFwF8L3sRa5UQO
 tqs2kQc1HV8x6ZUPPQGkf8bESyE9pKu/2Y80wkIQjD0x3wtyl3bArAI5C
 ysxHsYogqjSZVJz+X1TNTRYAjvT66sMdDGlT1cQzztT25Kn+2t4u7x3f9
 NFHp9lC3pHFr68HwCO9b6lyXj7xA5t7BKn4sDSymSiv2ecQxM5YzVVtrQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468116166"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="468116166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="784337226"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="784337226"
Received: from roomensx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.40.191])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:09:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611uxc: use drm_bridge_get_edid()
 instead of using ->get_edid directly
In-Reply-To: <20230927113058.GA8079@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131450.2473061-1-jani.nikula@intel.com>
 <20230914131450.2473061-2-jani.nikula@intel.com>
 <20230927113058.GA8079@pendragon.ideasonboard.com>
Date: Wed, 27 Sep 2023 17:09:23 +0300
Message-ID: <87lecrk8rw.fsf@intel.com>
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
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sep 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Hi Jani,
>
> On Thu, Sep 14, 2023 at 04:14:50PM +0300, Jani Nikula wrote:
>> Make drm_bridge_get_edid() the one place to call the hook.
>> 
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> UNTESTED
>
> I can't test this either, but it looks fine.

Thanks. Are you okay with merging the two with review only?

BR,
Jani.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> ---
>>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>> index 22c84d29c2bc..7835738a532e 100644
>> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>> @@ -296,7 +296,7 @@ static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
>>  	unsigned int count;
>>  	struct edid *edid;
>>  
>> -	edid = lt9611uxc->bridge.funcs->get_edid(&lt9611uxc->bridge, connector);
>> +	edid = drm_bridge_get_edid(&lt9611uxc->bridge, connector);
>>  	drm_connector_update_edid_property(connector, edid);
>>  	count = drm_add_edid_modes(connector, edid);
>>  	kfree(edid);

-- 
Jani Nikula, Intel
