Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64B86CF81
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0D910E1F7;
	Thu, 29 Feb 2024 16:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwPsqj5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AC810E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709225012; x=1740761012;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=O64Lz4VhVZbPupITA0ycZpRV1MrL3MtI2W4plGilPig=;
 b=NwPsqj5e8KhorGVY+7hp72eSGWGseaKpBbcOHKOd1ZNvI7RC+CiaG273
 Y/sJPli/Pg72a1shAW5rjXLSsaoTvJBjg1KiAwvHfWHLom/Zdr6bhdIS8
 cZDtYNMRhpOCeVgd0jOpWfVwrz+I1sbN9QuvaFxuWJijYlR8p4B7lpFus
 dylRcKISAlRu3G+y/bEbgwGcfQQdeT3m/cSVwwqVgq/GduKkVNOOdiX9L
 w+bTJc6ZifRv7KBJlQZtfQkgqjhbXzkKfOhIUiClmghxlAGi4FpywrpbS
 RuOyLMTjFBeLjXXjjb4Ha+PAOEOrSRf3mfnS+CpD2YDZ03AxZ0cEnPg+k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3827684"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3827684"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 08:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7828309"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 08:43:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
In-Reply-To: <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org> <87wmqqjmt9.fsf@intel.com>
 <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
 <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
Date: Thu, 29 Feb 2024 18:43:23 +0200
Message-ID: <87bk7z6x1w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 28 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Tue, Feb 27, 2024 at 5:27=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
>>
>> On Tue, Feb 27, 2024 at 1:09=E2=80=AFAM Jani Nikula <jani.nikula@linux.i=
ntel.com> wrote:
>> >
>> > On Fri, 23 Feb 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>> > > It's found that some panels have variants that they share the same p=
anel id
>> > > although their EDID and names are different. Besides panel id, now w=
e need
>> > > the hash of entire EDID base block to distinguish these panel varian=
ts.
>> > >
>> > > Add drm_edid_get_base_block to returns the EDID base block, so calle=
r can
>> > > further use it to get panel id and/or the hash.
>> >
>> > Please reconsider the whole approach here.
>> >
>> > Please let's not add single-use special case functions to read an EDID
>> > base block.
>> >
>> > Please consider reading the whole EDID, using the regular EDID reading
>> > functions, and use that instead.
>> >
>> > Most likely you'll only have 1-2 blocks anyway. And you might consider
>> > caching the EDID in struct panel_edp if reading the entire EDID is too
>> > slow. (And if it is, this is probably sensible even if the EDID only
>> > consists of one block.)
>> >
>> > Anyway, please do *not* merge this as-is.
>> >
>>
>> hi Jani,
>>
>> I sent a v2 here implementing this method:
>> https://lore.kernel.org/lkml/20240228011133.1238439-2-hsinyi@chromium.or=
g/
>>
>> We still have to read edid twice due to:
>> 1. The first caller is in panel probe, at that time, connector is
>> still unknown, so we can't update connector status (eg. update
>> edid_corrupt).
>> 2. It's possible that the connector can have some override
>> (drm_edid_override_get) to EDID, that is still unknown during the
>> first read.
>
> I'll also comment in Hsin-Yi's v2, but given Hsin-Yi's digging and the
> fact that we can't cache the EDID (because we don't yet have a
> "drm_connector"), I'd much prefer Hsin-Yi's solution here from v1 that
> allows reading just the first block. If we try to boot a device with a
> multi-block EDID we're now wastefully reading all the blocks of the
> EDID twice at bootup which will slow boot time.
>
> If you can see a good solution to avoid reading the EDID twice then
> that would be amazing, but if not it seems like we should go back to
> what's here in v1. What do you think? Anyone else have any opinions?

I haven't replied so far, because I've been going back and forth with
this. I'm afraid I don't really like either approach now. Handling the
no connector case in v2 is a bit ugly too. :(

Seems like you only need this to extend the panel ID with a hash. And
panel-edp.c is the only user of drm_edid_get_panel_id(). And EDID quirks
in drm_edid.c could theoretically hit the same problem you're solving.

So maybe something like:

	u32 drm_edid_get_panel_id(struct i2c_adapter *adapter, u32 *hash);

or if you want to be fancy add a struct capturing both id and hash:

	bool drm_edid_get_panel_id(struct i2c_adapter *adapter, struct drm_edid_pa=
nel_id *id);

And put the hash (or whatever mechanism you have) computation in
drm_edid.c. Just hide it all in drm_edid.c, and keep the EDID interfaces
neat.

How would that work for you?


BR,
Jani.


--=20
Jani Nikula, Intel
