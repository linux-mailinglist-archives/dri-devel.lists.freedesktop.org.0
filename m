Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95887B315A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 13:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EFA10E11A;
	Fri, 29 Sep 2023 11:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6133110E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695986848; x=1727522848;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xntQEvpoZ4lSuT64X8F2ZkdBs0aMLp7g+Fr1xpd4/iU=;
 b=JqoWZgYnYlzrsy3jTk6D3aqcpvNvvdp/Lb4M7K/b/YA3o2LLXo5e9KiN
 p4EvPx8P2A0ZeRaLpwwcfMSskEf8cIkz5y1T0YMlTa2JmfJ/i+5j0uRLS
 uDAEmQZXtWZcLKSWTeC94UlsmVdznhyoHO2VnoaAQ5Gm7kPIT8gBLFXyN
 jn4qVscKNramTASBwuqLwlgWFkWH3Wv4LyLLYgthHy8rxqWnPoss6Wl8W
 R8ntFoz8fB6VlIljtSPz7W8WBAvU1bAUko6t8aj7mcFGrQvC5zqYZnkmq
 j7Sl70akqor/i/nw71f9ApfPoItPVpjxtrM6OQIC+W2um6K2hHueC2Muu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880573"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="880573"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726566293"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="726566293"
Received: from osalyk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.237])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:27:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611uxc: use drm_bridge_get_edid()
 instead of using ->get_edid directly
In-Reply-To: <20230927223510.GY5854@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131450.2473061-1-jani.nikula@intel.com>
 <20230914131450.2473061-2-jani.nikula@intel.com>
 <20230927113058.GA8079@pendragon.ideasonboard.com>
 <87lecrk8rw.fsf@intel.com>
 <20230927223510.GY5854@pendragon.ideasonboard.com>
Date: Fri, 29 Sep 2023 14:27:22 +0300
Message-ID: <87il7ti5id.fsf@intel.com>
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

On Thu, 28 Sep 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Sep 27, 2023 at 05:09:23PM +0300, Jani Nikula wrote:
>> On Wed, 27 Sep 2023, Laurent Pinchart wrote:
>> > On Thu, Sep 14, 2023 at 04:14:50PM +0300, Jani Nikula wrote:
>> >> Make drm_bridge_get_edid() the one place to call the hook.
>> >> 
>> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> >> Cc: Robert Foss <rfoss@kernel.org>
>> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> >> Cc: Jonas Karlman <jonas@kwiboo.se>
>> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> 
>> >> ---
>> >> 
>> >> UNTESTED
>> >
>> > I can't test this either, but it looks fine.
>> 
>> Thanks. Are you okay with merging the two with review only?
>
> The changes are trivial, if we can't get anyone to test them, then I'm
> OK merging them.

Thanks, pushed to drm-misc-next.

BR,
Jani.


>
>> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> >
>> >> ---
>> >>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> 
>> >> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>> >> index 22c84d29c2bc..7835738a532e 100644
>> >> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>> >> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
>> >> @@ -296,7 +296,7 @@ static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
>> >>  	unsigned int count;
>> >>  	struct edid *edid;
>> >>  
>> >> -	edid = lt9611uxc->bridge.funcs->get_edid(&lt9611uxc->bridge, connector);
>> >> +	edid = drm_bridge_get_edid(&lt9611uxc->bridge, connector);
>> >>  	drm_connector_update_edid_property(connector, edid);
>> >>  	count = drm_add_edid_modes(connector, edid);
>> >>  	kfree(edid);

-- 
Jani Nikula, Intel
