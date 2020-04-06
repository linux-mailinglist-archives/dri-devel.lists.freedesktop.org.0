Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410B19F19F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 10:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1EB6E040;
	Mon,  6 Apr 2020 08:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE0489F4A;
 Mon,  6 Apr 2020 08:32:51 +0000 (UTC)
IronPort-SDR: 3EG8xOP8uM9tTUmMb965V7IJ/csY4lQlJ5l79Y2bjI4vaqL+W2njONvLkKoNhYwlfQlU/7BkQD
 p2NUw371ySgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 01:32:51 -0700
IronPort-SDR: xU6jgijA9eoJCsmfR0qbFbTkab9P66OIRSvk1kwD3zEsucMmbumlsuKGXaJsmIsTqjTTeslfCL
 1akuhsVMbVwA==
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="424285937"
Received: from maytarsh-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 01:32:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: abhinavk@codeaurora.org, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 03/17] drm: Nuke mode->vrefresh
In-Reply-To: <5d677ff317089267407609a1faa64b13@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-4-ville.syrjala@linux.intel.com>
 <5d677ff317089267407609a1faa64b13@codeaurora.org>
Date: Mon, 06 Apr 2020 11:32:38 +0300
Message-ID: <87tv1xko9l.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, aravindh@quicinc.com,
 Emil Velikov <emil.velikov@collabora.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 pdhaval@quicinc.com, Ben Skeggs <bskeggs@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 nganji@quicinc.com, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 jeykumar@quicinc.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Apr 2020, abhinavk@codeaurora.org wrote:
> On 2020-04-03 13:39, Ville Syrjala wrote:
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index fec1c33b3045..e3d5f011f7bd 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -759,9 +759,7 @@ int drm_mode_vrefresh(const struct drm_display_mode 
>> *mode)
>>  {
>>  	int refresh = 0;
>> 
>> -	if (mode->vrefresh > 0)
>> -		refresh = mode->vrefresh;
>
> The mode->vrefresh has been replaced with calling this API in all its 
> usages.
> However in this API, the above if statement was returning the vrefresh 
> if it was already
> set. mode->clock is holding the pixel clock . So this will not cause any 
> issues in non-compressed cases.
> In case of compression like DSC, the pixel
> clock will be different based on the compression ratio hence the 
> mode->clock will change but fps will not.
> So we did have usages in our downstream driver where we would use this 
> API and the refresh rate
> returned will be the mode->vrefresh which did not change but after this 
> change for those cases it will end up returning the refresh rate 
> calculated using mode->clock which will result in a different value now.
> So is the recommendation that even in the case of compression 
> mode->clock should always hold
> uncompressed pixel clock value because with this part of the change we 
> will now get a different value when we call this API.

Yes. The mode remains the same regardless of compression, and
compression is just an implementation detail of the transport.

You may need to maintain separate "physical port clock" and "logical
port clock" for DSC, where the latter is a function of the former and
the DSC parameters. And then you can see if your logical port clock
provides enough bandwidth for your mode. But this is up to your driver
and encoder implementation.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
