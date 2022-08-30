Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BFB5A64E2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC310E0C8;
	Tue, 30 Aug 2022 13:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0679C10E0E1;
 Tue, 30 Aug 2022 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661866599; x=1693402599;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=O9CgTkDBOczWNsw6xgnL7AlVgHCVygWfHTMUKa/QgD8=;
 b=d8YuDrvsUXU2NT992PGZ3eotpCrktdhojJf8pVMRj+fcwKWLbe0GZZtm
 jIBdjYv2oBkMDZIFCGt0iwkkk+w3bWFoJQMIJbJcuzWe+hJ2ghHT98L4i
 OMusSZaWd7GqULYvF89gQeXFn4tQxEDnoT1jX4trc5g8wxt9atYHYqTpw
 6F4yJsF+gDuDjh7aPBm2xnpL6W2GHTa+xsIr4QOmKae71qY0PTx6HzO56
 QmD6PPInon52r0u7HIqpLW0eLTI54DM2sDmukr+j+/wrnWS/qNSAgIYBx
 uTnL1+dOqEX7tnhE1iHeTHce9nEtcN5FjQRoHFnYqerJvY/6Uv8pJFc2O w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="295176323"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="295176323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 06:36:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="672867819"
Received: from amrabet-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 06:36:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
 separate function
In-Reply-To: <20220830120330.6f5f22d35gu7cbr3@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
 <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
 <87czcidnb8.fsf@intel.com> <20220830120330.6f5f22d35gu7cbr3@houat>
Date: Tue, 30 Aug 2022 16:36:23 +0300
Message-ID: <875yi9etuw.fsf@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Aug 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> Hi,
>
> On Tue, Aug 30, 2022 at 01:43:07PM +0300, Jani Nikula wrote:
>> On Tue, 30 Aug 2022, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
>> >> +#define STR_STRICT_EQ(str, len, cmp) \
>> >> +       ((strlen(cmp) == len) && !strncmp(str, cmp, len))
>> >
>> > This is not part of the move, but newly added.
>> 
>> The same construct is also duplicated elsewhere in the series, and I
>> kept being confused by it.
>
> I'm not sure what is confusing, but I can add a comment if needed.

STR_STRICT_EQ() is what's confusing. I have to look at the
implementation to understand what it means. What does "strict" string
equality mean?

>
>> The above is precisely the same as:
>> 
>> 	str_has_prefix(str, cmp) == len
>
> Here, it's used to make sure we don't have a named mode starting with
> either e, d, or D.
>
> If I understood str_has_prefix() right, str_has_prefix("DUMB-MODE", "D")
> == strlen("DUMB-MODE") would return true, while it's actually what we
> want to avoid.

That's not true, str_has_prefix("DUMB-MODE", "D") == strlen("D") is.

> It's also used indeed in drm_get_tv_mode_from_name(), where we try to
> match a list of names with one passed as argument.
>
> With drm_get_tv_mode_from_name("NSTC", strlen("NTSC")), we would end up
> calling str_has_prefix("NTSC-J", "NTSC") == strlen("NTSC-J") which would
> work. However, we end up calling prefix not a prefix, but an entire
> string we want to match against, which is very confusing to me too.

If I get this right, you have a string and you want to check if that has
a certain prefix. Additionally, you want to check the prefix is a
certain length.

Sure, that the prefix is a certain length is more of a property of the
string, which is NUL terminated later than at length, but that's doesn't
really matter.

That condition is simply str_has_prefix(string, prefix) == length.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
