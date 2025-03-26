Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E6A717A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669C910E131;
	Wed, 26 Mar 2025 13:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QwYx4oWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB4110E131;
 Wed, 26 Mar 2025 13:37:44 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6feb229b716so63227187b3.3; 
 Wed, 26 Mar 2025 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742996264; x=1743601064; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2DpJ6VRMzKkbiSjucX4k613JgndFFXaW28hmKcfLsmU=;
 b=QwYx4oWzLoC1aZZNN5A7mUaQbdYPEBCuwIw0yP+oMiv+8kHFFTyP0JF/bl+A/8S8nh
 /IsXBRbxXGA+LF1Ebn22mGmWZZRwIab8oLA0F6KSG5l+pmrNB9SK1j3T8c4GJuohhYQy
 R6boeL/5k/YnkrDz7TKvEC30GGNctjBiLKcnyPDvcXstPNWW5TcrQ6NGbQ+wfcCtIkIu
 LSpbLeAUJ7S1dlgKYLXYmQHjPv5bQ9DLj6U544QYE2+76CCeaPqg/53WgQ5WnMF77br5
 GuhUgkmY7POu5Xw6gAS7O5ND/M79M09mrMA04AfMWdtBn4w7lYVf8JKvypjYCYAsYQnU
 o41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742996264; x=1743601064;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DpJ6VRMzKkbiSjucX4k613JgndFFXaW28hmKcfLsmU=;
 b=UWMEAylNJFsC2pm9tPxcidyrAq/1tf/hOU6W8ITW393nJRKWemWE9SPTp/Q3LlAlEI
 ZAgMdqa3gZxfDxj4xKadJURdNfs4vYE8o8rDb69AKs3f1Bb+u9JVHt4wW6IEb96P7lSa
 AMTCPDPnp4P564fxDsYwYRhBM3X8T7o4P8PIlnUSnyOIlXS3zbjNm7tzmk1n4Lu2/HzO
 7yvVIHEVTS2giW7gLMYkwsSPMf/OPzFaA5CYSwl/2njlnG54PNqUnOOBmQE0spXsbAdg
 IX7d/Hsu9NNQrEKPgv8urgf8sQdAJnbD8W8HBFdRVt1rpi9HgRnHovVoUg69RiP8UWWZ
 mMEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZntn1rIailYAcJe2gX7ObUlH1CbG5IOJHOb4t3zVzJpgoGVOM8BHr7yEiYjndd2nAAFxb4/oPtbY=@lists.freedesktop.org,
 AJvYcCVY7OZJWqpQS74+RmO+v8Dh4Rw2dLc01Xhfi2dHR6qbd8NDtP3e+9w93j0E5cDOIgrbp38OFTsNQyoK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ3W0BGHSF/FUBfzjZxdZKGYRg4Sf8ABvnvciUdkDA5gY5gUPW
 e8COH8RsSQ7Eahb8Pe5C2GOhMSz6Esd4EJlkIkLR0RPkB1B7542f
X-Gm-Gg: ASbGncuyf1sDfXpqSA/UMtkEFemYihSxgXgmimxIc9I/v52wXaUERQZIMbfLYw12o84
 94shBtmTN7/FF8IJaQ9z8eGm49QIgnZ/XpRcp3kEj9kQcTsrC/N/YU9sKspowb8y71Dm74DZJf0
 WZ8V6c/zv5e4vA3sPL8JoxrpoVy0JfqW4uNXP/O6u205pl9PtzAmKXWbjHMX+erZp+I6uXcrZYU
 fIwHZ1oFLC6hWAfreHWu5YhM9i+QIPC7LIWTkCAksLjku8DJg/VhLvhyohkwVyNTLdGipyihUbU
 X0fshv73TeBnnF/Ag/dNRs4axcRTIZy9r6DolyMz9BlaijeLjR7ll1ZFjZWNpTmO8RaqMHkkX2q
 hECeP
X-Google-Smtp-Source: AGHT+IGvirXrX547Pzmc+Y0plNP5+DHUQkHLaMvaNmdW4WCslAICEC1hYvTBWFyg2u5oqxcINUQj5w==
X-Received: by 2002:a05:690c:4507:b0:6f9:a3c6:b2e4 with SMTP id
 00721157ae682-700bad19157mr281523847b3.37.1742996263675; 
 Wed, 26 Mar 2025 06:37:43 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-700ba88d538sm25142977b3.99.2025.03.26.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 06:37:43 -0700 (PDT)
Date: Wed, 26 Mar 2025 09:37:42 -0400
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v8 0/6] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z-QDHmrA9G0Erp85@thinkpad>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
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

On Wed, Mar 26, 2025 at 12:59:55AM +0900, Vincent Mailhol via B4 Relay wrote:
> Introduce some fixed width variant of the GENMASK() and the BIT()
> macros in bits.h. For example:
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
> change is that __GENMASK() was moved to the uapi headers. For this
> reason, a new GENMASK_TYPE() is introduced instead and the uapi
> __GENMASK() is left untouched.
> 
> Finally, I do not think it makes sense to expose the fixed width
> variants to the asm. The fixed width integers type are a C concept. So
> the GENMASK_U*() are only visible to the non-asm code. For asm, the
> long and long long variants seem sufficient.
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
>   Total: Before=22781662, After=22781662, chg +0.00%
> 
> (done with GCC 12.4.1 on an x86_64_defconfig)

Applied, thanks!

> 
> --
> 2.43.0
> 
> ---
> Changes from v7:
> 
>   - Meanwhile, in commit db6fe4d61ece ("lib: Move KUnit tests into
>     tests/ subdirectory"), lib/test_bits.c was moved to
>     lib/tests/test_bits.c. Rebase onto Linus's master branch so that
>     this change is reflected.
> 
>   - Remove the note in the cover letter on the return type, instead
>     add an explanation in patch "bits: introduce fixed-type
>     GENMASK_U*()".
> 
>   - s/shift-count-overflow/-Wshift-count-overflow/g
> 
>   - Link to v7: https://lore.kernel.org/r/20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr
> 
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
> Vincent Mailhol (3):
>       bits: add comments and newlines to #if, #else and #endif directives
>       bits: introduce fixed-type GENMASK_U*()
>       test_bits: add tests for BIT_U*()
> 
>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>  include/linux/bitops.h               |   1 -
>  include/linux/bits.h                 |  57 +++++++++++++++++-
>  lib/tests/test_bits.c                |  30 ++++++++++
>  4 files changed, 96 insertions(+), 100 deletions(-)
> ---
> base-commit: 2df0c02dab829dd89360d98a8a1abaa026ef5798
> change-id: 20250228-fixed-type-genmasks-8d1a555f34e8
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
