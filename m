Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D72A82E54
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97B10E02A;
	Wed,  9 Apr 2025 18:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inl0vQ3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729D910E02A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:15:42 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-736bfa487c3so6211188b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744222542; x=1744827342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RLlYeHtvUctAB5rHW2z6orExJGooSjFURuTNigxPPWQ=;
 b=inl0vQ3+rVipJkGWZNrTTcYGLu7xcnoWU06XVnB1tRItRg+d1mUkZjpZ6GCWZIqbhM
 IdUEU+0Wh6osIicDkORrTcRleDefWSStMw/SmSv7i9zQbxddMWrsaFHwNFhmBKT2Like
 lvkDuqQDufOuZt1859EUxboYO9Opfga1ub4MXBRENwLlmLjuQTttCnyS19FKvlxopgZ4
 GKZnu7xOKhX1a2O8zUPnHqTIXTC2WrpSH6Fk39Ce+LugcCsMIefyYYA+AwG59vk/H9Hf
 X+aqivUeWN7p2ciODezcgLHlB9HWiyk31MOiEOihsZuhZPcPoKJVbjFshMDH2B9CNz7Y
 7TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744222542; x=1744827342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLlYeHtvUctAB5rHW2z6orExJGooSjFURuTNigxPPWQ=;
 b=fffXN06GKt9RxJCaPgNPrna0ObN5FRHK0v8fg2zJTOQvln8K5XkVazn06ZHS8eZ6QV
 ZPTFXL0i7ES2GyCQE5FPAoypGt7wM7SLWPZi+OvVmx/yTgM7NbMJZLJdI3intzQLrKKM
 6SFTcld91Ww6cwFvSEm2JHAXkcTapwNkw6xGqdZqOw9sUM6h5wOXc6Eng7DMrC85s8a3
 K8zfhYzSsAZqyS/f9ZOJaeIeLx3sxwNUw0QAV6gyVEBFjbQy+NZqSnSOonz9+ELbmlyf
 DMtTHm89aCqLO03ZAMcw2P7qAxasaTDuVlJBU7/cVOPrlK4cDCHno3A+ktr8o3vkKRao
 VgmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNaCZJgzOtf9U4cVKvw5o+piRf06OkTIUMB4wQHGGt02FDtjCM8kemAFeDJcJnNFZ3A1tSqbkpCaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZPDwvPENwg9rv5ZZS+y/K2JGsFWXTjvmEiTg39GA/iRMxe0xL
 +RFRVUEfWyO7jgGYntEIVjagSuaExuxwP5H63P98z1V6f7JSCwSb
X-Gm-Gg: ASbGncvUFvFA0fKQG2Na9P8xj/favpxOSDQIUKGDuxIm8yGgQuC5/d4MU+fv4DIvGM5
 XjcNAK0J6I3Dzzj0orkpVvf0T53POFDByFLwy+wt9PEUE9ENy+GLvII+pezIPUMkb/RKNpSRdLy
 0Xd9JccgF645WT9aMKN6igkXIqwDvzLMMuSV7/YZZ603/IZdXXrJWd5F3E6QoAuyuoRohjUvbKZ
 iiq/4LbeHJLHJqK4WK9OxvGniuCYXFKNPOIApEZWdKuGZlmOn0GkLq3wYoQNDq2fW2cDvC9Bsl0
 yIs1tTlFfIA4r590Kb2dvq2SxJy9gkdaoRl5YkC9AacU6GGOrROPod4mdBABi1q6hxGl
X-Google-Smtp-Source: AGHT+IGEA9hhRRBDeyzG4WkKt+49d7gFcuvCU6+XKMxeG2gY6BreZ4BlmPPM+Kdczsk2MzNQJdHAMw==
X-Received: by 2002:a05:6a00:4606:b0:736:9fa2:bcbb with SMTP id
 d2e1a72fcca58-73bafd708c5mr4555757b3a.24.1744222541802; 
 Wed, 09 Apr 2025 11:15:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1d2ae8dsm1728722b3a.18.2025.04.09.11.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:15:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:15:30 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_amQp3gK5Dm8Qz3@yury>
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

On Wed, Apr 09, 2025 at 12:54:35PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> > Several parts of the kernel contain open-coded and redundant
> > implementations of parity calculation. This patch series introduces
> > a unified helper, parity_odd(), to simplify and standardize these
> > cases.
> > 
> > The first patch renames parity8() to parity_odd(), changes its argument
> 
> Alright, if it's an extension of the area of applicability, it should be
> renamed to just parity(). I already shared a table that summarized the
> drivers authors' view on that, and they clearly prefer not to add the
> suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 
> 
> https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/
> 
> Yes, the argument that boolean function should explain itself sounds
> correct, but in this case, comment on top of the function looks enough
> to me.
> 
> The existing codebase doesn't care about the suffix as well. If no
> strong preference, let's just pick a short and sweet name?
> 
I don't have a strong preference for the name, but if I had to guess
the return value from the function prototype, I would intuitively
expect an int to return "0 for even and 1 for odd," and a bool to
return "true for even, false for odd." I recall Jiri and Jacob shared
similar thoughts, which is why I felt adding _odd could provide better
clarity.

However, I agree that if the kernel doc comment is clear, it might not
be a big issue. But David previously mentioned that he doesn't want to
rely on checking the function's documentation every time while reading
the code.

Regardless, I'm flexible as long as we all reach a consensus on the
naming.

> > type from u8 to u64 for broader applicability, and updates its return
> > type from int to bool to make its usage and return semantics more
> > intuitive-returning true for odd parity and false for even parity. It
> > also adds __attribute_const__ to enable compiler optimizations.
> 
> That's correct and nice, but can you support it with a bloat-o-meter's
> before/after and/or asm snippets? I also think it worth to be a separate
> patch, preferably the last patch in the series.
> 
I quickly tested it with the x86 defconfig, and it appears that the
generated code doesn't change. I forgot who requested the addition
during the review process, but I initially thought it would either
improve the generated code or leave it unchanged without significantly
increasing the source code size.

However, if there's no actual difference in the generated code, maybe
let's just remove it?

Regards,
Kuan-Wei

> > While more efficient implementations may exist, further optimization is
> > postponed until a use case in performance-critical paths arises.
> > 
> > Subsequent patches refactor various kernel components to replace
> > open-coded parity logic with the new helper, reducing code duplication
> > and improving consistency.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > 
> > To H. Peter:
> > I understand your preference for a parity8/16/32/64() style interface,
> > and I agree that such a design would better accommodate potential
> > arch-specific implementations. However, I suspect there are very few,
> > if any, users who care about the performance of parity calculations
> > enough to warrant such optimizations. So my inclination is to defer any
> > arch-specific or optimized implementations until we see parity_odd()
> > being used in hot paths.
> > 
> > Changes in v4:
> > - Rename parity8() to parity_odd().
> > - Change the argument type from u8 to u64.
> > - Use a single parity_odd() function.
> > 
> > Changes in v3:
> > - Avoid using __builtin_parity.
> > - Change return type to bool.
> > - Drop parity() macro.
> > - Change parityXX() << y to !!parityXX() << y.
> > 
> > Changes in v2:
> > - Provide fallback functions for __builtin_parity() when the compiler
> >   decides not to inline it
> > - Use __builtin_parity() when no architecture-specific implementation
> >   is available
> > - Optimize for constant folding when val is a compile-time constant
> > - Add a generic parity() macro
> > - Drop the x86 bootflag conversion patch since it has been merged into
> >   the tip tree
> > 
> > v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
> > v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> > v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> > 
> > Kuan-Wei Chiu (13):
> >   bitops: Change parity8() to parity_odd() with u64 input and bool
> >     return type
> >   media: media/test_drivers: Replace open-coded parity calculation with
> >     parity_odd()
> >   media: pci: cx18-av-vbi: Replace open-coded parity calculation with
> >     parity_odd()
> >   media: saa7115: Replace open-coded parity calculation with
> >     parity_odd()
> >   serial: max3100: Replace open-coded parity calculation with
> >     parity_odd()
> >   lib/bch: Replace open-coded parity calculation with parity_odd()
> >   Input: joystick - Replace open-coded parity calculation with
> >     parity_odd()
> >   net: ethernet: oa_tc6: Replace open-coded parity calculation with
> >     parity_odd()
> >   wifi: brcm80211: Replace open-coded parity calculation with
> >     parity_odd()
> >   drm/bridge: dw-hdmi: Replace open-coded parity calculation with
> >     parity_odd()
> >   mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
> >   fsi: i2cr: Replace open-coded parity calculation with parity_odd()
> >   nfp: bpf: Replace open-coded parity calculation with parity_odd()
> > 
> >  arch/x86/kernel/bootflag.c                    |  4 +--
> >  drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
> >  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
> >  drivers/hwmon/spd5118.c                       |  2 +-
> >  drivers/i3c/master/dw-i3c-master.c            |  2 +-
> >  drivers/i3c/master/i3c-master-cdns.c          |  2 +-
> >  drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
> >  drivers/input/joystick/grip_mp.c              | 17 ++-----------
> >  drivers/input/joystick/sidewinder.c           | 25 ++++---------------
> >  drivers/media/i2c/saa7115.c                   | 12 ++-------
> >  drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
> >  .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
> >  drivers/mtd/ssfdc.c                           | 20 +++------------
> >  drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
> >  drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
> >  .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
> >  drivers/tty/serial/max3100.c                  |  3 ++-
> >  include/linux/bitops.h                        | 19 ++++++++------
> >  lib/bch.c                                     | 14 +----------
> >  19 files changed, 49 insertions(+), 165 deletions(-)
> 
> OK, now it looks like a nice consolidation and simplification of code
> base. Thanks for the work.
> 
> Thanks,
> Yury
