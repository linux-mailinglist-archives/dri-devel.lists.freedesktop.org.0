Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26FA56EE4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F6B10E341;
	Fri,  7 Mar 2025 17:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YYIAnmWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BE810E0CC;
 Fri,  7 Mar 2025 17:18:04 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e6119fc5e9bso1461762276.0; 
 Fri, 07 Mar 2025 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741367884; x=1741972684; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Peeb251MvSHM+3gUXma/XyQegei79/j9jUNe5rzX1oA=;
 b=YYIAnmWiyscaaP9vPIjI8aCnKy1i4NSha2jSIAAjycn/gExPJ+oBoSIubeTvXMtIr+
 U7Vm+TpBsmm8MpTEVZS9GjAmxVHrKsgAawmjeFSxmp+MdTy+m2XpHMMuIxS51fS/ZanI
 YZfcyuu3bOuBo+VZoB9Z8hzr1eYVEYEvqwa8zjHUHamjowiIppP6Mx+MfWHy82TwQYoa
 wiqHluUwM1KZCJ1e4GvocnNBGqT5doDbRw0qVXKuCqMxwt/zOLmGQ5GdOZslhtgPVe19
 uRxlH6u/CPGEjqhwJbUrmSR6wWu2TpauWDZlwW71D4B8+c2USjzekofgcTxsRDGSkFXB
 ChPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741367884; x=1741972684;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Peeb251MvSHM+3gUXma/XyQegei79/j9jUNe5rzX1oA=;
 b=DDDtQ0uIABRghGwXAWgLjiDkb7R0eAzUYdADoJ2nOrolVCQoRCAKkkq7TF4Zn2fD3Q
 Rfo/ZM+hsTQWN28ZZfnbrqQ7tOWq4/wWXYnpWwnyKhRdu6QeDIsup2E+Rq0X/vfc5iTL
 n2nqAGTPv6poDeLbt5EKRaYqzAJTZt3+E/I3O5sBPG4W6QTz1L3etdc3JW3iDre70oX7
 fiIdz1hn3mRtQhs7aRRP2JWojuIZcZ2ElmXxfrfMMKfF5rm1NFFa8EVw9zG0T2fh57pS
 SB6nCmDDlCZkmqUlAdq7ickIuDVb7YgIhkuZrzZsk/+jpQ9KVIRGr1KpswPsddI/8knB
 VkiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/HYa4VuEmsmmIIfD1wiuYoXLmBjbJHPXAcS6BqMLhaCYEu7GMnNGsfSr4bVeuhpLxvjz76s52B9jV@lists.freedesktop.org,
 AJvYcCXwOnz0G0Gfh+mOF5tfDw8pH2P/uClaKTBpKaKFecDm4wnz3N+892mXA5pJ7YUEroAst/P/XPU0DYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFlQ4WGrD97RfjfFVMzoE3CVpvlPRJYhwwzkyqA6lEPKCa2n+j
 DANNI+oAYv54DrubUqNi+2cd+xfH1hJfVeV67xg7oeWADJi1/uyl
X-Gm-Gg: ASbGncu63N6d+hhLU/ITdGevTL/J25DVVcJzpIO/a7pNrJfVkr851HGEWk2bFY15wuZ
 IHN+O8kEuTGeHAtNAqkfy062VyLLiKRTPJRBzxUGG/wR7Ppv4X7m/OTim5dDxazg9qehEVz28xX
 1GKo3NKELLZ0avq1YrPITrye9HJZxZIVIcaOSSszTD3i/2I+Sk6Xv0OIUNdxbLDNQ7pXd4UFSQk
 tx4UZVOEZ2W2JaBxfIrA4briP8n8dbhOkmjXPvGF4JUdc4aZtfdXdP0tz/1rfE4XTtp9qLo14oD
 2PGuJKmpEF2jk8KpPTatk6/X0pniTgQrEW9kkOhGAidW6+GfY7OANPG2HalRpDEggsg3tEplGvW
 xAcmu
X-Google-Smtp-Source: AGHT+IEHFCWT89Ioz7/PyTLUzg88TY7P6CYM+MvJU0uY5S4dmN+2b1iDHoDD8tHOCSEw3trVdgguOw==
X-Received: by 2002:a05:6902:348a:b0:e5d:bf59:3343 with SMTP id
 3f1490d57ef6-e635c1cab17mr4708121276.38.1741367883762; 
 Fri, 07 Mar 2025 09:18:03 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e634b841f82sm903536276.15.2025.03.07.09.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 09:18:03 -0800 (PST)
Date: Fri, 7 Mar 2025 12:18:02 -0500
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 0/7] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z8sqSpKZzfolKm8Q@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
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

No rush, please allow your reviewers a week or two before submitting
a new iteration unless you want to disregard the previous version for
some reason, of course. This will not get into the upcoming merge
window, anyways.

So, what should I do? Go through the v5 and all discussions in there,
or just jump on this?

On Sat, Mar 08, 2025 at 01:48:47AM +0900, Vincent Mailhol via B4 Relay wrote:
> Introduce some fixed width variant of the GENMASK() and the BIT()
> macros in bits.h. Note that the main goal is not to get the correct
> type, but rather to enforce more checks at compile time. For example:
> 
>   GENMASK_U16(16, 0)
> 
> will raise a build bug.
> 
> This series is a continuation of:
> 
>   https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
> 
> from Lucas De Marchi. Above series is one year old. I really think
> that this was a good idea and I do not want this series to die. So I
> am volunteering to revive it.
> 
> Meanwhile, many changes occurred in bits.h. The most significant
> change is that __GENMASK() was moved to the uapi headers.
> 
> In v4 and onward, I introduce one big change: split the definition of
> the asm and non-asm GENMASK(). I think this is controversial.
> Especially, Yury commented that he did not want such split. So I
> initially implemented a first draft in which both the asm and non-asm
> version would rely on the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_TYPE(t, w, h, l)			\
>   	(((t)~_ULL(0) - ((t)1 << (l)) + 1) &		\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
>     
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
>     
> and so on.
>     
> I implemented it, and the final result looks quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Adding to this, that macro can not even be generalized to u128
> integers, whereas after the split, it is.
> 
> Finally, I do not think it makes sense to expose the fixed width
> variants to the asm. The fixed width integers type are a C
> concept. For asm, the long and long long variants seems sufficient.
> 
> And so, after implementing both, the asm and non-asm split seems way
> more clean and I think this is the best compromise. Let me know what
> you think :)
> 
> As requested, here are the bloat-o-meter stats:
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
> ---
> Changes from v5:
> 
>   - Update the cover letter message. I was still refering to
>     GENMASK_t() instead of GENMASK_TYPE().
> 
>   - Add a comment in the cover letter to explain that a common
>     GENMASK_TYPE() for C and asm wouldn't allow to generate the u128
>     variant.
> 
>   - Restore the comment saying that BUILD_BUG_ON() is not available in
>     asm code.
> 
>   - Add a FIXME message to highlight the absence of the asm GENMASK*()
>     unit tests.
> 
>   - Use git's histogram diff algorithm
> 
>   - Link to v5: https://lore.kernel.org/r/20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr
> 
> Changes from v4:
> 
>   - Rebase on https://github.com/norov/linux/tree/bitmap-for-next
> 
>   - Rename GENMASK_t() to GENMASK_TYPE()
> 
>   - First patch of v4 (the typo fix 'init128' -> 'int128') is removed
>     because it was resent separately in:
>     https://lore.kernel.org/all/20250305-fix_init128_typo-v1-1-cbe5b8e54e7d@wanadoo.fr
> 
>   - Replace the (t)~ULL(0) by type_max(t). This way, GENMASK_TYPE()
>     can now be used to generate GENMASK_U128().
> 
>   - Get rid of the unsigned int cast for the U8 and U16 variants.
> 
>   - Add the BIT_TYPE() helper macro.
> 
>   - Link to v4: https://lore.kernel.org/r/20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr
> 
> Changes from v3:
> 
>   - Rebase on v6.14-rc5
> 
>   - Fix a typo in GENMASK_U128() comment.
> 
>   - Split the asm and non-asm definition of 
> 
>   - Replace ~0ULL by ~ULL(0)
> 
>   - Since v3, __GENMASK() was moved to the uapi and people started
>     using directly. Introduce GENMASK_t() instead.
> 
>   - Link to v3: https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
> 
> Changes from v2:
> 
>   - Document both in commit message and code about the strict type
>     checking and give examples how it´d break with invalid params.
> 
>   - Link to v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com
> 
> Link to v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com
> 
> ---
> Lucas De Marchi (3):
>       bits: introduce fixed-type BIT_U*()
>       drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
>       test_bits: add tests for GENMASK_U*()
> 
> Vincent Mailhol (3):
>       bits: split the definition of the asm and non-asm GENMASK()
>       test_bits: add tests for __GENMASK() and __GENMASK_ULL()
>       test_bits: add tests for BIT_U*()
> 
> Yury Norov (1):
>       bits: introduce fixed-type genmasks
> 
>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>  include/linux/bitops.h               |   1 -
>  include/linux/bits.h                 |  91 ++++++++++++++++++++---------
>  lib/test_bits.c                      |  49 ++++++++++++++++
>  4 files changed, 124 insertions(+), 125 deletions(-)
> ---
> base-commit: 0312e94abe484b9ee58c32d2f8ba177e04955b35
> change-id: 20250228-fixed-type-genmasks-8d1a555f34e8
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
