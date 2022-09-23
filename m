Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84A5E76AC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B576A10E7D5;
	Fri, 23 Sep 2022 09:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8A210E7D5;
 Fri, 23 Sep 2022 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663924739; x=1695460739;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qFRpcPQ3Nucr6vmKDoOh9w6fsNE+aROgpsnIbjVMoU4=;
 b=GTxb1PjtOnL4ueOSHUByeQ90sjl9h6ut/09yIXLO2A/DwbJcECvtJf/X
 pJlGl64OFZpn8yhfWXeWOG0lEFCbjT/Gs0WBaud6t0Na9YnRNUfpX+4VC
 hks2zwaV1KKRPIWAI2bT0lKHKI8hWd6YI0VbfIRZ7E1Mzzfv11Jq9F74d
 cbXKZtXcJXMrWTT4R3DNeJ2giB14Q2v5xQT/+lFQgxebw14Iq2Qj1QvKz
 H+saiZfsRw5QeH7e0+DOSasyklARa/3xEe2g/L7/Gtar5OpMtubxz8B58
 gB43x5NdG2KPmxhkmaOtzN11IT5nTMz/I+5b6iECK7yjNGI0BHaOuF2AV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301998187"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="301998187"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 02:18:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="865231225"
Received: from armannov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.93])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 02:18:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <maxime@cerno.tech>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, David
 Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
In-Reply-To: <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
Date: Fri, 23 Sep 2022 12:18:32 +0300
Message-ID: <87h70y4ffb.fsf@intel.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Sep 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 22.09.22 um 16:25 schrieb Maxime Ripard:
>> +	drm_dbg_kms(dev,
>> +		    "Generating a %ux%u%c, %u-line mode with a %lu kHz clock\n",
>> +		    hactive, vactive,
>> +		    interlace ? 'i' : 'p',
>> +		    params->num_lines,
>> +		    pixel_clock_hz / 1000);
>
> Divide by HZ_PER_KHZ here and in other places.
>
>    https://elixir.bootlin.com/linux/latest/source/include/linux/units.h#L23

From the Department of Bikeshedding:

I find "pixel_clock_hz / 1000" has much more clarity than
"pixel_clock_hz / HZ_PER_KHZ".

I don't consider the SI prefixes magic numbers.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
