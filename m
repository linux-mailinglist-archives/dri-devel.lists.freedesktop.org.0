Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C6510603
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3310EFE4;
	Tue, 26 Apr 2022 17:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA80510EFF4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650995718; x=1682531718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X9XNX+IeU0lIL9RPe+MGAlYsYHmibVt1ffpe4p9hwLc=;
 b=ZBF3HvmVoTQF5tVKlwQdCfpbKapB3PX+6p9O8rXfH0KsUnUhZwMGJvov
 I1l5O6EGRfgLOgTX39U8iL5ZlDwhyUUPvrodvKlmbVwKC94eMUfFcX0Un
 blDVYWYEFeGuTDVrDAtSqESY9qMb2VqDsOudCSGxYMfieHsYusuPe9N5G
 DUsob0qX1UxY7CE+H6p5mKM0xmLWORCjT6hSROOYwBAazgcxxAd8uskbw
 IifipQfULKSOWVbM85smv55k633ddftqoV++6Syq+3ImycVAMPrxYba7m
 WsS7NN9PkmrJrDtAJIWJJLGb7FoLmUZUw70H8R6UpmL/s1SkbG+Jh1uTJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="246237866"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="246237866"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="564698483"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga007.fm.intel.com with SMTP; 26 Apr 2022 10:55:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Apr 2022 20:55:14 +0300
Date: Tue, 26 Apr 2022 20:55:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <YmgyArRaJCh6JkQh@intel.com>
References: <20220426113502.224d0a90@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426113502.224d0a90@eldfell>
X-Patchwork-Hint: comment
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote:
> Hi all,
> 
> I'm working on setting HDR & WCG video modes in Weston, and I thought
> setting "max bpc" KMS property on the connector would be a good idea.
> I'm confused about how it works though.
> 
> I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/issues/612
> 
> Summary:
> 
> - Apparently the property was originally added as a manual workaround
>   for sink hardware behaving badly with high depth. A simple end user
>   setting for "max bpc" would suffice for this use.
> 
> - Drivers will sometimes automatically choose a lower bpc than the "max
>   bpc" value, but never bigger.
> 
> - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
>   definitely want to raise it.

I've occasionally pondered about doing the same for i915, just to have
the safest default possible. But I'd hate to lose the deep color testing
coverage knowing very few people would in practice raise the limit.
Also the number of systems where deep color doesn't work reliably
(or can't be made to work by not using a crap cable) seems to be quite
low.

> 
> If I always slam "max bpc" to the highest supported value for that
> property, do I lose more than workarounds for bad sink hardware?

We don't have any workarounds implemented like this in the kernel.
Or should not have at least. "max bpc" exists purely for the user
to have a say in the matter in addition to whatever the EDID/quirks
say. Ie. if the kernel knows for sure that deep color won't work on
a particular setup then it should just not allow deep color at all
despite what the prop value says.

So the only danger is fighting with the user's wishes which I guess
you can overcome with some kind of user visible knob.

> 
> Do I lose the ability to set video modes that take too much bandwidth
> at uncapped driver-selected bpc while capping the bpc lower would allow
> me to use those video modes?
> 
> Or, are drivers required to choose a lower-than-usual but highest
> usable bpc to make the requested video mode squeeze through the
> connector and link?

IMO drivers should implement the "reduce bpc until it fits"
fallback. We have that in i915, except for MST where we'd need
to potentially involve multiple streams in the fallback. That
is something we intend to remedy eventually but it's not an
entirely trivial thing to implement so will take some actual
work. ATM we just cap MST to <=8bpc to avoid users getting into
this situation so often.

> 
> Do I need to implement a fallback strategy in a display server,
> starting from the highest possible "max bpc" value, and if my modeset
> is rejected, repeatedly try with lower "max bpc" setting until it works
> or I'm out of bpc options?

IMO the bpc part should be handled by the kernel since we already
had this behaviour even before the "max bpc" prop was introduced
and we didn't add an explicit "use this bpc or fail" prop. But of
course you should have some kind of sensible fallback strategy for
things that just fail for other reasons.

The one problem we have in the kernel is that we have no way to
ask the user if the display we tried to light up is actually
working. So our policy decisions can't really involve user input.
Userspace should not generally have that problem.

-- 
Ville Syrjälä
Intel
