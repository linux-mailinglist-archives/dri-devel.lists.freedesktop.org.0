Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FB5A60F6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 12:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EBD10E051;
	Tue, 30 Aug 2022 10:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3563A10E047;
 Tue, 30 Aug 2022 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661856204; x=1693392204;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1JuE3MlMyluva+oTcotxIb88e/kWe/AXbzFxNtVjZ48=;
 b=XbHTJVFeRVnNQcBOIvOh1kF00+Os/eenr7cr3Bsqy4NFP73NURXzty6o
 O9xYFR3mSLbO+11TpjJvCC0V/uns7TGgQmbJO8dCkyZaW2m4071DJ9Juf
 VxqWfjQ/iq/QH49LzM55a7ayQu0IO3G/0RqsK9PmXqGBE/M7Emim9EvnN
 RL78TFV4i71Q9TfupDh83y44jIVHfXifiE1qD9A9rMak1M0+B9fRZTdNN
 GjLMfvYwdluIMG1sgKtSsf8GIXLKoZCkAyihd4+YN3Z8FmhnEB1YFVjlr
 zTtPIxilzLvyOcMokpLO7FpdVoRXlbYw94oZCPkVF1FF9myx5yEp8VxaG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="356857901"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="356857901"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 03:43:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="672807662"
Received: from amrabet-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 03:43:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
 separate function
In-Reply-To: <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
 <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Date: Tue, 30 Aug 2022 13:43:07 +0300
Message-ID: <87czcidnb8.fsf@intel.com>
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
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
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

On Tue, 30 Aug 2022, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
>> +#define STR_STRICT_EQ(str, len, cmp) \
>> +       ((strlen(cmp) == len) && !strncmp(str, cmp, len))
>
> This is not part of the move, but newly added.

The same construct is also duplicated elsewhere in the series, and I
kept being confused by it. The above is precisely the same as:

	str_has_prefix(str, cmp) == len

Which is more intuitive and available in string.h instead of being a
local duplicate.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
