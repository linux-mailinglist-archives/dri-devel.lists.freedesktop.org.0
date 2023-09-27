Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636F7B01F6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2F310E4C8;
	Wed, 27 Sep 2023 10:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1F410E4CF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695810842; x=1727346842;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0uKalNv179OEKE/G2LpUN22B2Ay5+5invLQSGR9vLnQ=;
 b=IUFiBSj3suGwT/zrGihN9o7s0E7jLegaxCApziXHlJTZRp1PZhv8bk7Q
 j91jTQf/yJKAqOJDY8V3mm+/Br3WVVqGJ+hFAYp7TUPS3EOQ84T37szjo
 0uNb3h22rDKp32B8pGeQ0MzM8jYmOMg2vDmuaOYodlhpzVJUwyANTZizV
 O3yFwRVgorkaLRC/pBe5KFAkF4cVy55b9zUvyjAsaE90ELjPENRc79Los
 yANSWd5m+N1pNbN4EgtZqYPJcopL0KhR0OpjfW7A8N/18tiJRw3dyMiVi
 xHagLWeCOiudcAYnYT5arO6iVMzmQau1t8zXII7aeegjgxAMFyhpEhQ9c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="379070799"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="379070799"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819379592"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="819379592"
Received: from roomensx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.40.191])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:33:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm/bridge: use drm_bridge_get_edid() instead of
 using ->get_edid directly
In-Reply-To: <20230926101959.GB5854@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131450.2473061-1-jani.nikula@intel.com>
 <20230926101959.GB5854@pendragon.ideasonboard.com>
Date: Wed, 27 Sep 2023 13:33:56 +0300
Message-ID: <87v8bvkiqz.fsf@intel.com>
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

On Tue, 26 Sep 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Hi Jani,
>
> Thank you for the patch.
>
> On Thu, Sep 14, 2023 at 04:14:49PM +0300, Jani Nikula wrote:
>> Make drm_bridge_get_edid() the one place to call the hook.
>> 
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks Laurent, does that cover patch 2/2 as well, or just 1/2?

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_bridge_connector.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 1da93d5a1f61..31baf1f5ff81 100644
>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>> @@ -238,7 +238,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>>  	if (status != connector_status_connected)
>>  		goto no_edid;
>>  
>> -	edid = bridge->funcs->get_edid(bridge, connector);
>> +	edid = drm_bridge_get_edid(bridge, connector);
>>  	if (!drm_edid_is_valid(edid)) {
>>  		kfree(edid);
>>  		goto no_edid;

-- 
Jani Nikula, Intel
