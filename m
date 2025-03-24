Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C5A6DF50
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37110E3D8;
	Mon, 24 Mar 2025 16:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S6OCcCLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405510E3D8;
 Mon, 24 Mar 2025 16:11:04 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso9886898a91.1; 
 Mon, 24 Mar 2025 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742832664; x=1743437464; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pfKZtzv59eBwLvLslJklRIH1GlVmmxb0T7NI0lTwvR4=;
 b=S6OCcCLn+6QT5PVl7iofLhNUPka4DWmcWHL/gQoiSOSqz98XSgHw8qoce9gLgubaTS
 6P9VF85gjt4r1d5ieiDhUubkmW5QSfj0u1MhayMy+q19t1dLc5z6arZ/RDcpvGDSuKc/
 JliReIhaCYkNtvcaVY0FdKWg3UGg3BrMxiXoaGszXVItF0B6noVot3PYi2WvMdD/dYrI
 2nbGOcCXFDgdTp8kTiihnYTVEh2f/QaQnqOvyVVlLR/is6mPX1EE0o0gt6+DijrlKIpm
 1O9D9XGoehY6rEHPbs/bCJL0NxZ4DBLom35cZyzea6h6nPP4pytcygcgM+LQLNBgWwHC
 /2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742832664; x=1743437464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfKZtzv59eBwLvLslJklRIH1GlVmmxb0T7NI0lTwvR4=;
 b=uQyx+bIIDroweYW/SOqfmuSNGz4BtGckNpo+GgU/036KV063AgFaaEBSmUnL4qOzPM
 Z4pRGnurwrgnJIeXaZIPGkQvGW5Ga/+WI81ilzkpvLGr8/ihGavM0S3A/FoLvFIadjZ1
 HVKube7X7yhljJj/hLwR1azXixsUNSfsvnLDWPePR1I9jnEhrDnL4VpjLwEulr+rYo5v
 1keyw6gSavBWEnEfACqzm9EM14i9pl8WqVDmGLV1bta8OgkLemaXE7Fj0qqKhzwkiWQT
 KmvQaRTa2Otc6PNa0tXE76OwlryHyUtoz83hKYQ201du/I7UA+yzMuMT1q6x2OaOK3ez
 ZhRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Ws7FXNrAcrFD83md49h5cv9RuuzLwcVTF68tPbRnWyW+VVgKlHQOFumGsJVmEPexhV9UDZcqR0DD@lists.freedesktop.org,
 AJvYcCXCaK8Eko30Af4Zgc10yjzhYzSxmuVnTh1XNCVZLtObKWy5+iyaqtrTzDhdbqLxTPk40B9/JMvAvT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycFBu3oEUb59FpiCAA20VddlLCOIRfXKYcjZCKG4lZWuL0Uy2e
 SgbZDNdYwH+2H2pa+zHgPYYMnj3HxYxhDOWmR9I1oA8iuycCfgE/
X-Gm-Gg: ASbGncsp0taCfqWV/LTqtYigWLRHTxjPXLeMUpS3aEnaDGU+oqVDdqL3ZthHl1vjNM5
 oW1/ShAAzbmLBeIBIY2xjWETZTDjBN68oafPHuhhiKK3QwD4um6apyVKRUdP7HLnrTFWOFYejHD
 VN8YwkZDZWDnWvNVsQttGdRfnpHHO2gl8QWOcFMN9rH6F8RVktxT/39CRUKXMnrwnH2rHMlgdPP
 TP3N3YVHg7wD57v9f58s9TPnhp4YqOygdxdhZcLW63Gum1GzTecb+i9YwCfQneFeX8le1afInW6
 dWf4Qv+GhdEnwDj/e7Ib1c1XQpIgixHnzl7maDlV3VXm9cw3ohbvBWKmFSP2pzayFeGx
X-Google-Smtp-Source: AGHT+IFGSZzECIzd4xFIfdlc38K0Cf0n26OwSjiHv+4oEt7ysXyvnNIq/1GYBi7pelSqe/eAsII4KQ==
X-Received: by 2002:a17:90b:3943:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-301d43c9272mr29014013a91.15.1742832664244; 
 Mon, 24 Mar 2025 09:11:04 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf576c7dsm12373991a91.3.2025.03.24.09.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 09:11:03 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:11:01 -0400
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <Z-GEFcciqCwxL88W@thinkpad>
References: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
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

+ Anshuman Khandual, Catalin Marinas, linux-arm-kernel@lists.infradead.org

This series moves GENMASK_U128 out of uapi. ARM is the only proposed
user. Add ARM people for visibility.

Thanks,
Yury

On Sat, Mar 22, 2025 at 07:39:35PM +0900, Vincent Mailhol via B4 Relay wrote:
> This is a subset of below series:
> 
>   bits: Fixed-type GENMASK_U*() and BIT_U*()
>   Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
> Yury suggested to split the above series in two steps:
> 
>   #1 Introduce the new fixed type GENMASK_U*()
>   #2 Consolidate the existing GENMASK*()
> 
> This new series is the resulting step #2 following the split.
> 
> And thus, this series consolidate all the non-asm GENMASK*() so that
> they now all depend on GENMASK_TYPE() which was introduced in step #1.
> 
> To do so, I had to split the definition of the asm and non-asm
> GENMASK(). I think this is controversial. So I initially implemented a
> first draft in which both the asm and non-asm version would rely on
> the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_TYPE(t, w, h, l)		\
>   	(((t)~_ULL(0) << (l)) &			\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
> 
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
> 
> and so on.
> 
> I implemented it, and the final result looked quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Adding to this, that macro can not even be generalized to u128
> integers, whereas after the split, it can.
> 
> And so, after implementing both, the asm and non-asm split seems way
> more clean and I think this is the best compromise.
> 
> Aside from the split, the asm's GENMASK() and GENMASK_ULL() are left
> untouched. While there are some strong incentives to also simplify
> these as pointed by David Laight in this thread:
> 
>   https://lore.kernel.org/all/20250309102312.4ff08576@pumpkin/
> 
> this series deliberately limit its scope to the non-asm variants.
> 
> Here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-4 (1)
>   Function                                     old     new   delta
>   intel_psr_invalidate                         666     668      +2
>   mst_stream_compute_config                   1652    1653      +1
>   intel_psr_flush                              977     978      +1
>   intel_dp_compute_link_config                1327    1328      +1
>   cfg80211_inform_bss_data                    5109    5108      -1
>   intel_drrs_activate                          379     376      -3
>   Total: Before=22723481, After=22723482, chg +0.00%
> 
> (done with GCC 12.4.1 on an x86_64 defconfig)
> 
> --
> 2.43.0
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
> Vincent Mailhol (3):
>       bits: split the definition of the asm and non-asm GENMASK*()
>       bits: unify the non-asm GENMASK*()
>       test_bits: add tests for __GENMASK() and __GENMASK_ULL()
> 
>  include/linux/bits.h | 29 ++++++-----------------------
>  lib/test_bits.c      | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 23 deletions(-)
> ---
> base-commit: e3f42c436d7e0cb432935fe3ae275dd8d9b60f71
> change-id: 20250320-consolidate-genmask-6cd02abadf82
> prerequisite-change-id: 20250228-fixed-type-genmasks-8d1a555f34e8:v7
> prerequisite-patch-id: 572c05165229640db7dd8fe4d53e1a33ee5dd586
> prerequisite-patch-id: c16d122a487f83e2866a9a669259db097ef46a70
> prerequisite-patch-id: 35f115c0f1b327f1516cfc38b3076e07713df6cd
> prerequisite-patch-id: 5fe7058f6ea73b37df75d5c39ad69a4da928058d
> prerequisite-patch-id: 82fb628d052ce9f1efac7f3b61eafb2749f95847
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
