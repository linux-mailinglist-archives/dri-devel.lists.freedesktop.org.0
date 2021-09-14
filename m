Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF040B661
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 19:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B426E523;
	Tue, 14 Sep 2021 17:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAC36E523
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:59:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307639868"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307639868"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544216080"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:59:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/16] drm/edid: Allow the querying/working with the
 panel ID from the EDID
In-Reply-To: <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
 <87h7ey81e9.fsf@intel.com>
 <CAD=FV=X-d8XH5bmcAhDGnbs-DHgQ7D6G9g3gRsjo7RN1xQ1kNA@mail.gmail.com>
Date: Tue, 14 Sep 2021 20:59:27 +0300
Message-ID: <87h7en11j4.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Mon, Sep 6, 2021 at 3:05 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> > +{
>> > +     struct edid *edid;
>> > +     u32 val;
>> > +
>> > +     edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
>> > +
>> > +     /*
>> > +      * There are no manufacturer IDs of 0, so if there is a problem reading
>> > +      * the EDID then we'll just return 0.
>> > +      */
>> > +     if (IS_ERR_OR_NULL(edid))
>> > +             return 0;
>> > +
>> > +     /*
>> > +      * In theory we could try to de-obfuscate this like edid_get_quirks()
>> > +      * does, but it's easier to just deal with a 32-bit number.
>>
>> Hmm, but is it, really? AFAICT this is just an internal representation
>> for a table, where it could just as well be stored in a struct that
>> could be just as compact now, but extensible later. You populate the
>> table via an encoding macro, then decode the id using a function - while
>> it could be in a format that's directly usable without the decode. If
>> suitably chosen, the struct could perhaps be reused between the quirks
>> code and your code.
>
> I'm not 100% sure, but I think you're suggesting having this function
> return a `struct edid_panel_id` or something like that. Is that right?
> Maybe that would look something like this?
>
> struct edid_panel_id {
>   char vendor[4];
>   u16 product_id;
> }
>
> ...or perhaps this (untested, but I think it works):
>
> struct edid_panel_id {
>   u16 vend_c1:5;
>   u16 vend_c2:5;
>   u16 vend_c3:5;
>   u16 product_id;
> }
>
> ...and then change `struct edid_quirk` to something like this:
>
> static const struct edid_quirk {
>   struct edid_panel_id panel_id;
>   u32 quirks;
> } ...
>
> Is that correct? There are a few downsides that I can see:
>
> a) I think the biggest downside is the inability compare with "==". I
> don't believe it's legal to compare structs with "==" in C. Yeah, we
> can use memcmp() but that feels more awkward to me.
>
> b) Unless you use the bitfield approach, it takes up more space. I
> know it's not a huge deal, but the format in the EDID is pretty much
> _forced_ to fit in 32-bits. The bitfield approach seems like it'd be
> more awkward than my encoding macros.

Sorry for the delayed response. Fair enough, let's go with the u32 for
now. It's not like we can't change this later.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
