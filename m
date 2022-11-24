Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563A637A14
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 14:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF1810E077;
	Thu, 24 Nov 2022 13:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F1A10E01F;
 Thu, 24 Nov 2022 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YwGIb+ZMz0VBwzNNqfdvn12/MOc6eqkpW0OnNa0NbJc=; b=GQfGkevNoEMy1ayya0G6zV5KXu
 Uu+8D5ZQljH4/FMGR10VoXwIhyFpgwYnL/T/BAhQltcKGKx8cD6dB4fB5+tPJ31epgmzcbQYe5yiR
 J3u0cP9bvbv3otXYzE50euxkNSizLlYX9F0swrsOtM6ikyETKuoeL++WWSG+k+nVr4fr5J5smXDFY
 pLRwrnnV4GkqriXpfOipwOTyFZ/1IuEFctpDiX8/9ZTS9bMCCWmI9natYNHxDr+U8u+Yw8V/tV95y
 G8acGM4PpbCVo08/WYMRXXsH3BiLz3SIDgDvaVY42f4grYOgMqdXwLwZVqDADujf8PXH12hsDYcAJ
 BE9EgNXw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=54180)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oyCSC-0006kb-Ph; Thu, 24 Nov 2022 14:39:48 +0100
Message-ID: <a3380bb8-65c7-9dd9-12ac-8558d03ff5c8@tronnes.org>
Date: Thu, 24 Nov 2022 14:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v10 06/19] drm/modes: Add a function to generate analog
 display modes
To: Maxime Ripard <maxime@cerno.tech>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <20220728-rpi-analog-tv-properties-v10-6-256dad125326@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-6-256dad125326@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 17.11.2022 10.28, skrev Maxime Ripard:
> Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> 625-lines modes in their drivers.
> 
> Since those modes are fairly standard, and that we'll need to use them
> in more places in the future, it makes sense to move their definition
> into the core framework.
> 
> However, analog display usually have fairly loose timings requirements,
> the only discrete parameters being the total number of lines and pixel
> clock frequency. Thus, we created a function that will create a display
> mode from the standard, the pixel frequency and the active area.
> 
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---

I'm no domain expert so apart from the timing details which I can't
comment on, it looks fine. I personally advocated for a much simpler
solution for these NTSC and PAL modes, but AIUI this is part of a
grander plan to support devices with other timings.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
