Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B075FFAB3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 17:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3133010E503;
	Sat, 15 Oct 2022 15:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5CE10E252;
 Sat, 15 Oct 2022 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7pRTxq7KYO3k44s3qhhCAVY4oTb2mw2IirE3FSx1ng=; b=GxgJFEJBFZcqMt7jvrGYCAAGvx
 DhywpEK9lBqlpQmTL4JiLK3wR0cIB5uIM7Vt45U6b7uvvqRM17u4wpNFNJ+6HWbBXQB2B8bPvXXcc
 SF6kMCb+eFJkntalEPfxQRkTmvEAT5YSt+VnrxWIv835yQ0c5WBfTxfdeZW3tPWyZRRGZJQj7T8m0
 Nwjnxm9d/Kec3pBZRybCzuqaSZT7YWXxBDldAQ0+bMLTxvqNh/nPKfl9IKbpdXGAnTgVbO6w4Iei4
 xE654Ew2Owk/VskBBICvPXnHWLrbN62n6D61UnEqU0XnG0aVsZ7niE1H3xvX8rAikZ5owhybXqkb3
 8dPL05TQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64825
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ojiih-0008O3-ML; Sat, 15 Oct 2022 17:04:59 +0200
Message-ID: <71e53906-ae9b-55b9-7a93-7bb04a891423@tronnes.org>
Date: Sat, 15 Oct 2022 17:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 11/30] drm/modes: Add a function to generate analog
 display modes
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-11-60d38873f782@cerno.tech>
 <0aa690b8-988a-878f-4d4f-d391295bc591@tronnes.org>
 <20221013083638.kloiaxervnhii7ew@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221013083638.kloiaxervnhii7ew@houat>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 13.10.2022 10.36, skrev Maxime Ripard:
> Hi Noralf,
> 
> On Sat, Oct 01, 2022 at 02:52:06PM +0200, Noralf Trønnes wrote:
>> Den 29.09.2022 18.31, skrev Maxime Ripard:
>>> Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
>>> 625-lines modes in their drivers.
>>>
>>> Since those modes are fairly standard, and that we'll need to use them
>>> in more places in the future, it makes sense to move their definition
>>> into the core framework.
>>>
>>> However, analog display usually have fairly loose timings requirements,
>>> the only discrete parameters being the total number of lines and pixel
>>> clock frequency. Thus, we created a function that will create a display
>>> mode from the standard, the pixel frequency and the active area.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - Reworded the line length check comment
>>> - Switch to HZ_PER_KHZ in tests
>>> - Use previous timing to fill our mode
>>> - Move the number of lines check earlier
>>> ---
>>>  drivers/gpu/drm/drm_modes.c            | 474 +++++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/tests/Makefile         |   1 +
>>>  drivers/gpu/drm/tests/drm_modes_test.c | 144 ++++++++++
>>>  include/drm/drm_modes.h                |  17 ++
>>>  4 files changed, 636 insertions(+)
>>>
>>
>> I haven't followed the discussion on this patch, but it seems rather
>> excessive to add over 600 lines of code (including tests) to add 2 fixed
>> modes. And it's very difficult to see from the code what the actual
>> display mode timings really are, which would be useful for other
>> developers down the road wanting to use them.
>>
>> Why not just hardcode the modes?
> 
> Yeah, I have kind of the same feeling tbh, but it was asked back on the
> v1 to ease the transition of old fbdev drivers, since they will need
> such a function:
> https://lore.kernel.org/dri-devel/CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com/
> 

If that's the case I suggest you just hardcode them for now and leave
the complexity to the developer doing the actual conversion of the fbdev
driver. Who knows when that will happen, but that person will have your
well documented and discussed work to fall back on.

Noralf.
