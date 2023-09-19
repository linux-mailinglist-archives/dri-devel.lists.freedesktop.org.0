Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604D7A5ED6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650E610E39A;
	Tue, 19 Sep 2023 09:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5B410E374
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695117305; x=1726653305;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VE2rjU6vKS7B5FcRe/RnrC2e6YXvyOnWP8lQUDgIgR0=;
 b=dn2g/Zu9N+QUDQl2gEqvqRv5VdsWFkxJ3sFA6BG+LLGuDUfFYJhCWcty
 2OOZSoOWugkF6qjB27ZZtNa1XkhbScDiSZN0sTdlCir8egtiQkMctDFlM
 oJk+ZrUiU1jM26oPtDkCmVfGKUqNZsNm4U++uQbJmcae3dyIUuf8x8SRf
 MZ9OO4X1inQtabxLcV60PdGN5LrVyCJBTbiCyaNtMOhfKUMBX57p9p3g9
 QpnXoizz1WCf1yTv/AgOwnStD+ODPoZh6hh4VIfQGyaFc5aVfzUt4D2T5
 SjK3ZD3KPyGMWzIaERp+OVYmjgadH/I8PZk1ZSSJ+2sLTyaN3vbMVOinJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382651760"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="382651760"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="695850188"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695850188"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.227])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:55:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
In-Reply-To: <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131015.2472029-1-jani.nikula@intel.com>
 <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org>
Date: Tue, 19 Sep 2023 12:54:58 +0300
Message-ID: <87msxitrm5.fsf@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 14/09/2023 15:10, Jani Nikula wrote:
>> The EDID returned by drm_bridge_get_edid() needs to be freed.
>> 
>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Kevin Hilman <khilman@baylibre.com>
>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-amlogic@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: <stable@vger.kernel.org> # v5.17+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> UNTESTED
>> ---
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 9913971fa5d2..25ea76558690 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>>   			return;
>>   
>>   		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
>> +
>> +		kfree(edid);
>>   	} else
>>   		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>>   }
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks. I don't seem to have a toolchain to get this to build... would
you mind applying this, please?

BR,
Jani.


-- 
Jani Nikula, Intel
