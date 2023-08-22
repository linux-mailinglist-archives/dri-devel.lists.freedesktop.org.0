Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51D7844BC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09410E1D7;
	Tue, 22 Aug 2023 14:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646FC10E1D7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692715905; x=1724251905;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=OX7Pj2Q2LK76Q8Stxn/xyJU6l2MEuoC2QmDhxxoblig=;
 b=gADo1f8BYtKtbuIFfC1EtCHgNwH/JTRP37J7Odzbph3hEC9M+zIcgfU4
 yfUZQx5okD5gGeQqMxvugee6g1J4WTeBf4T1mqpUut5Rg+uznZ18Xdg1n
 +twlREEkCN1gqKw7qUBq6D6v0i1/bwgZAugMnjYsd91gsAKKbxh6eMtbU
 Uhp8KbzWK3jQu46Rc0WSr3Mng+j8gLOK7N5ifgtvdkqF9MZ+2y79MystO
 /PEMHfsLZAi2BcI26EN8E+51TZMFF9W6FDMm7BCnW6EyjByv25awZQ0P1
 PieYNZdyDWxNHxSZcbGrZDg8Vieop6Hy9qlSBQgJGQCrnVVkTmcnG8hPm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353468281"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="353468281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739330839"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="739330839"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:51:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Emma Anholt
 <emma@anholt.net>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 00/13] drm/connector: Create HDMI Connector
 infrastructure
In-Reply-To: <sh3f7nuks7cww43ajz2iwrgzkxbqpk7752iu4pj4vtwaiv76x4@itnf6f2mnbgn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
 <ZOTDKHxn2bOg+Xmg@phenom.ffwll.local>
 <sh3f7nuks7cww43ajz2iwrgzkxbqpk7752iu4pj4vtwaiv76x4@itnf6f2mnbgn>
Date: Tue, 22 Aug 2023 17:51:39 +0300
Message-ID: <87pm3f5dvo.fsf@intel.com>
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

On Tue, 22 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> On Tue, Aug 22, 2023 at 04:16:08PM +0200, Daniel Vetter wrote:
>> On Mon, Aug 14, 2023 at 03:56:12PM +0200, Maxime Ripard wrote:
>> > Here's a series that creates a subclass of drm_connector specifically
>> > targeted at HDMI controllers.
>> > 
>> > The idea behind this series came from a recent discussion on IRC during
>> > which we discussed infoframes generation of i915 vs everything else. 
>> > 
>> > Infoframes generation code still requires some decent boilerplate, with
>> > each driver doing some variation of it.
>> > 
>> > In parallel, while working on vc4, we ended up converting a lot of i915
>> > logic (mostly around format / bpc selection, and scrambler setup) to
>> > apply on top of a driver that relies only on helpers.
>> > 
>> > While currently sitting in the vc4 driver, none of that logic actually
>> > relies on any driver or hardware-specific behaviour.
>> > 
>> > The only missing piec to make it shareable are a bunch of extra
>> > variables stored in a state (current bpc, format, RGB range selection,
>> > etc.).
>> > 
>> > Thus, I decided to create some generic subclass of drm_connector to
>> > address HDMI connectors, with a bunch of helpers that will take care of
>> > all the "HDMI Spec" related code. Scrambler setup is missing at the
>> > moment but can easily be plugged in.
>> > 
>> > Last week, Hans Verkuil also expressed interest in retrieving the
>> > infoframes generated from userspace to create an infoframe-decode tool.
>> > This series thus leverages the infoframe generation code to expose it
>> > through debugfs.
>> > 
>> > This entire series is only build-tested at the moment. Let me know what
>> > you think,
>>
>> I think the idea overall makes sense, we we probably need it to roll out
>> actual hdmi support to all the hdmi drivers we have. But there's the
>> eternal issue of "C sucks at multiple inheritance".
>> 
>> Which means if you have a driver that subclasses drm_connector already for
>> it's driver needs it defacto cannot, or only under some serious pains, use
>> this.
>
> That's what vc4 is doing, and it went fine I think? it was mostly a
> matter of subclassing drm_hdmi_connector instead of drm_connector, and
> adjusting the various pointers and accessors here and there.
>
> It does create a fairly big diffstat, but nothing too painful.

The main pain point is not the diffstat per se, but that *all* casts to
subclass need to check what the connector type is before doing
so. You'll also get fun NULL conditions that you need to check and
handle if the type isn't what you'd like it to be.

Currently i915 can just assume all drm_connectors it encounters are
intel_connectors that it created, always.

Basically this has blocked the writeback connector stuff for a few years
now in i915, because writeback forces a different subclassing, and what
should be a small change in i915 turns into huge churn.

BR,
Jani.


>
>> Which is kinda why in practice we tend to not subclass, but stuff
>> subclass fields into a name sub-structure. So essentially struct
>> drm_connector.hdmi and struct drm_connector_state.hdmi instead of
>> drm_hdmi_connector and drm_hdmi_connector_state. The helper functions to
>> set it all up would all still be the same roughly. It's less typesafe but
>> I think the gain in practical use (like you could make i915 use the
>> helpers probably, which with this approach here is practically
>> impossible).
>
> Ack.
>
>> The only other nit is that we probably want to put some of the hdmi
>> properties into struct drm_mode_config because there's no reason to have
>> per-connector valid values.
>
> What property would you want to move?
>
>> Also, it might be really good if you can find a co-conspirator who also
>> wants to use this in their driver, then with some i915 extracting we'd
>> have three, which should ensure the helper api is solid.
>
> I can convert sunxi (old) HDMI driver if needed. I'm not sure how
> helpful it would be since it doesn't support bpc > 8, but it could be a
> nice showcase still for "simple" HDMI controllers.
>
> Maxime

-- 
Jani Nikula, Intel Open Source Graphics Center
