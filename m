Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966FA6DCF9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 15:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549910E261;
	Mon, 24 Mar 2025 14:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/pa4rkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF10810E1DC;
 Mon, 24 Mar 2025 14:28:55 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3035858c687so953485a91.2; 
 Mon, 24 Mar 2025 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742826535; x=1743431335; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V2tZCtADdnCqZ2h+Fe0T2ycKUuwyHWNo6ZRayizrM04=;
 b=k/pa4rkMZ1ctfKoJ/0nV1qZDfh7XofisXgNkqAJfJyYL1n36l5RPQ8coayjGM2j4pE
 FboT007hW0EYkMJHfwuLCYxPq0jan5heS9/P6Ea6v5kMR8YXU1KNsFkJECULS38Ohx6G
 OQGhSSWDr4u+w5tMY7hNdYwKszBsiJ4M0YJJEu1Nx2/cNnuk/pwRpGDGQ+obba56vlTz
 zM/pdHY+edFZDouGDkWFfbP6zpskzHUzxNTdeCBMCK9Dpbx6Es8h2GJxDsdbl2oWBuWx
 UvDWDi71mXXA2S7hWfmxQ8rEp0NnigLxu4oZMHQND4jpNZzKu/6O0LPyPv5SQz/YMXZQ
 xLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742826535; x=1743431335;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V2tZCtADdnCqZ2h+Fe0T2ycKUuwyHWNo6ZRayizrM04=;
 b=HPfN2H26XVAwEOstWS5XnAluWwDt2ZCGVOCtwWl5jqlG9au2qId33BLlPWhHgSgsX6
 7uBdVZWCd6mFDA3pK/uu80yUaei3g1BOT79K4QJr6l2FdkVcXIcQ4AeUHe9Td1ZTRLIV
 LucVukE9l7TFlC02NCnwk8y8Id2rasGay49bx1lxeyuGJ1wlEL7MDB8xUi7kE4bfXCmd
 akJ32Kgz4qgJ9zkPOosoMriLjMBBRV6RSxvFelut6YPr8JfLjd2F/j0DD20FN8/wKDcm
 Sl9L374BLriIxN8t41Jm+29EkWOx7BTDEp0BekcV4XvFOSl/OjV0hmkMW2JSvyjHLBlp
 0iaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU/iucj8LwXNfI6n89AP1/D0jL5L9j31M0+GJcer4ZZn/o9AQ46CxomalO2KK8QIvcSeI0VCLiFAEz@lists.freedesktop.org,
 AJvYcCXZQNr+Ao4V80ocAmB1T0OKENi19VMSgFmqDvxOsioaz4ZNqzPG0TqKnvhovJlpzCpsnD9P74HpIZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt3+ks6urTg1OfG2+VJGbsDQQpI0bP7OZ56FHn/8YBrOcJ86wF
 BMrDAjgFrkbrAXPlS3okbrESugdffQL8L/wfIktyP2iVejykrsPT
X-Gm-Gg: ASbGncuCYSacpwz2BCqERlK4myJiZFkV+mXPNSDZSUkP8dgG0sUUQ4xwZbV8w3bndKd
 a0V3VKsKdUkpqs7YINJGRcYDKuD3N2HuL4aic/Y2kQHQztdMBb0AW3tqC7ulNnZ7PNk/ZHKfF9V
 Eh65Ad+6hg5DjNukwjshaKNYt6lUgDQB6CLwm3K+r2ebGcaXRF/1ZHQ4pOV2/furFeYnBhW4dk6
 2EM5WBESXIqxNbvARFgpvr4TcmLRX3cTcIrpzsFdUuZmzsVhSRdDmWqKgZvgN4a6GBPH/1/NQL1
 MZk+sR9CSlN2zJpRJEnnQzMEMG0SlNreUCZrwE7NNfTjtfFvK4GgS2QofrT9emtHUujU
X-Google-Smtp-Source: AGHT+IEc4zJRCtjm7tZQ2FP3G0nb3Bl9s88O1GkgJaZqI9g47C7voyfXZhOp0FPfkrGdzxg9VNj4rQ==
X-Received: by 2002:a17:90b:2707:b0:2ff:6488:e01c with SMTP id
 98e67ed59e1d1-3030fefe3e4mr21894157a91.29.1742826535022; 
 Mon, 24 Mar 2025 07:28:55 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3030f613968sm8195911a91.28.2025.03.24.07.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 07:28:54 -0700 (PDT)
Date: Mon, 24 Mar 2025 10:28:52 -0400
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
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 0/5] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z-FsJPA1aq7KyTlm@thinkpad>
References: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
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

On Sat, Mar 22, 2025 at 06:23:11PM +0900, Vincent Mailhol via B4 Relay wrote:
> Introduce some fixed width variant of the GENMASK() and the BIT()
> macros in bits.h. Note that the main goal is not to get the correct
> type, but rather to enforce more checks at compile time. For example:

You say this, and then typecast both BIT and GENMASK. This may confuse
readers. Maybe add few words about promotion rules in C standard, or
just drop this note entirely? Doesn't require new submission, of
course.

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
> change is that __GENMASK() was moved to the uapi headers. For this
> reason, a new GENMASK_TYPE() is introduced instead and the uapi
> __GENMASK() is left untouched.
> 
> Finally, I do not think it makes sense to expose the fixed width
> variants to the asm. The fixed width integers type are a C concept. So
> the GENMASK_U*() are only visible to the non-asm code. For asm, the
> long and long long variants seems sufficient.
> 
> This series does not modify the actual GENMASK(), GENMASK_ULL() and
> GENMASK_U128(). A consolidation of the existing genmasks will be
> proposed later on in a separate series.
> 
> As requested, here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
>   add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
>   Function                                     old     new   delta
>   Total: Before=22723481, After=22723481, chg +0.00%
> 
> (done with GCC 12.4.1 on an x86_64 defconfig)
> 
> --
> 2.43.0
> 
> ---
> Changes from v6:
> 
>   - Split the series in two: this series leave any existing GENMASK*()
>     unmodified. The consolidation will be done in a separate series.
> 
>   - Collect some Reviewed-by tag.
> 
>   - Address miscellaneous nitpick on the code comments and the line
>     wrapping (details in each patch).
> 
>   - Link to v6: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
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
> Vincent Mailhol (2):
>       bits: introduce fixed-type GENMASK_U*()
>       test_bits: add tests for BIT_U*()
> 
>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>  include/linux/bitops.h               |   1 -
>  include/linux/bits.h                 |  57 +++++++++++++++++-
>  lib/test_bits.c                      |  30 ++++++++++
>  4 files changed, 96 insertions(+), 100 deletions(-)
> ---
> base-commit: e3f42c436d7e0cb432935fe3ae275dd8d9b60f71
> change-id: 20250228-fixed-type-genmasks-8d1a555f34e8
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
