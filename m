Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66FD1A9450
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC526E864;
	Wed, 15 Apr 2020 07:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD126E864
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:33:32 +0000 (UTC)
IronPort-SDR: y7oXLXC+Ye7daj79mykWzhLSUuKJIZtk2qaU7516xty2RxJN81oB9oek6yr+vXIeR9jP/FBNJF
 sxjHTPBgb/aA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 00:33:32 -0700
IronPort-SDR: 9LZ/+cGlJal2nOD6KrYU8t20P/pQz48b1fG4ws+BB68kWPKKEZGu8jsE4yebXpEkxDTLpQ0Kon
 FTvkvZc4Ea4A==
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427347028"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 00:33:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yussuf Khalil <dev@pp3345.net>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
In-Reply-To: <2cfe44c96818515939050ad19e9c248e50519be2.camel@pp3345.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
 <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
 <87ftd6mi3e.fsf@intel.com> <87d08amhy5.fsf@intel.com>
 <20200414123404.GT3456981@phenom.ffwll.local>
 <2cfe44c96818515939050ad19e9c248e50519be2.camel@pp3345.net>
Date: Wed, 15 Apr 2020 10:33:25 +0300
Message-ID: <87r1wp5hkq.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020, Yussuf Khalil <dev@pp3345.net> wrote:
> On Tue, 2020-04-14 at 14:34 +0200, Daniel Vetter wrote:
>> On Tue, Apr 14, 2020 at 02:21:06PM +0300, Jani Nikula wrote:
>> > On Tue, 14 Apr 2020, Jani Nikula <jani.nikula@linux.intel.com>
>> > wrote:
>> > > On Mon, 13 Apr 2020, Simon Ser <contact@emersion.fr> wrote:
>> > > > On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <
>> > > > dev@pp3345.net> wrote:
>> > > > 
>> > > > > DRM now has a globally available "RGB quantization range"
>> > > > > connector
>> > > > > property. i915's "Broadcast RGB" that fulfils the same
>> > > > > purpose is now
>> > > > > considered deprecated, so drop it in favor of the DRM
>> > > > > property.
>> > > > 
>> > > > For a UAPI point-of-view, I'm not sure this is fine. Some user-
>> > > > space
>> > > > might depend on this property, dropping it would break such
>> > > > user-space.
>> > > 
>> > > Agreed.
>> > > 
>> > > > Can we make this property deprecated but still keep it for
>> > > > backwards
>> > > > compatibility?
>> > > 
>> > > Would be nice to make the i915 specific property an "alias" for
>> > > the new
>> > > property, however I'm not sure how you'd make that happen.
>> > > Otherwise
>> > > juggling between the two properties is going to be a nightmare.
>> > 
>> > Ah, the obvious easy choice is to use the property and enum names
>> > already being used by i915 and gma500, and you have no problem.
>> > Perhaps
>> > they're not the names you'd like, but then looking at the total
>> > lack of
>> > consistency across property naming makes them fit right in. ;)
>> 
>> Yeah if we don't have contradictory usage across drivers when
>> modernizing
>> these properties, then let's just stick with the names already there.
>> It's
>> not pretty, but works better since more userspace/internet howtos
>> know how
>> to use this stuff.
>> -Daniel
>
> Note that i915's "Broadcast RGB" isn't the same as gma500's: i915 has an
> "Automatic" option, whereas gma500 does not.

Adding "Automatic" option that just defaults to "Full" in gma500 does
not break existing userspace, but allows for extending it to do more
clever things later.

> Also, radeon has a property called
> "output_csc" that fulfills a similar purpose. Looking at the code, though, it
> seems that radeon does not adhere to the standard correctly (or I am missing
> something).
>
> An alternative would be to leave the existing driver-specific properties and
> change them to be pseudo-aliases for the "RGB quantization range" property.
> This can be done by letting the drivers read from and write to the new property
> when user-space tries to read or modify the driver's property. This way we could
> retain full backwards compatibility for all drivers equally.
>
> What do you think?

I'm obviously biased and predisposed to avoid adding extra complexity to
i915 when it's not necessary. We'd have *two* connector properties for
the same thing until the end of time, even if one is an alias for the
other.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
