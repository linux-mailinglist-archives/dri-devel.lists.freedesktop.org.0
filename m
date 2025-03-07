Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43803A56E3F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B810D10EC02;
	Fri,  7 Mar 2025 16:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BoQvgaac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E10410EBED;
 Fri,  7 Mar 2025 16:49:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A65CBA439F8;
 Fri,  7 Mar 2025 16:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD48FC4CED1;
 Fri,  7 Mar 2025 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741366177;
 bh=YVrzd+IXmf9EiRC/v/odDZpblRQr8mxNU5vz6S8KECo=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=BoQvgaacfJjUKq98N2WYIp/L3ir7FtYHSV17NSBkjDw3NkYVE01ad/JnMWdRiYjtJ
 d68pVNJdK/38bUQspRsLNldAVhtpp61VpUXsxRfTADho4ZZ7rgQLbTH8fVUq3+6+O6
 t6xYp9Gqcn+6cqX4AIj5JaNoUoimOVhTrZMmYco8bcqdzfS6beeK8MtcV9m7UfICNH
 HDpE51tGTgwDimbbTp4gPajDN4vs8q/LTXrBBi+IQbhMT+xePzHSd3dJ88i/olP3FO
 45RyMg8Ar8LoHk+92h4WpD0n1XGWarvxw4zIYrEl4M6IP7Pxez0wh2A4TLb13/gon4
 MFk9WybYXYmEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C133CC19F32;
 Fri,  7 Mar 2025 16:49:37 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Subject: [PATCH v6 0/7] bits: Fixed-type GENMASK_U*() and BIT_U*()
Date: Sat, 08 Mar 2025 01:48:47 +0900
Message-Id: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG8jy2cC/23OTWrDMBCG4asErTtG1n+zyj1KFoo0ikVjKUiu0
 xB890othRay/GDm4X2QiiViJfvdgxRcY405taFedsRNNp0Rom+bMMokZcxAiJ/oYblfEc6YZlv
 fKxg/Will4AINaZ/Xgv2sq2/HtkPJMyxTQftrCcqooVpINg5Sa6oVjHD5cLYOHmdb3BQPMS14G
 VyeOznFuuRy/+5cRYd/kjiVT5NWARRGo7l3PijN+OFmk/U5D6GQ3rTKv4h6jsiGnITg+Ordyar
 /yLZtX2xDHpw/AQAA
X-Change-ID: 20250228-fixed-type-genmasks-8d1a555f34e8
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5833;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=YVrzd+IXmf9EiRC/v/odDZpblRQr8mxNU5vz6S8KECo=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmnlVt3qopGFdkpOt+fWLbi0iThoAev0qo3GG82rdrB8
 Zj7+ZpVHaUsDGJcDLJiiizLyjm5FToKvcMO/bWEmcPKBDKEgYtTACZSJ8rwiyl97xSvHas3Op9d
 fnj+6Xupp60Y3WYcnXPtz6bwqUUnu6sZGTZssrm76fqsQoeqyWl8yXav7s3La3Zd/qS8bbvHnWl
 5v1kB
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce some fixed width variant of the GENMASK() and the BIT()
macros in bits.h. Note that the main goal is not to get the correct
type, but rather to enforce more checks at compile time. For example:

  GENMASK_U16(16, 0)

will raise a build bug.

This series is a continuation of:

  https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com

from Lucas De Marchi. Above series is one year old. I really think
that this was a good idea and I do not want this series to die. So I
am volunteering to revive it.

Meanwhile, many changes occurred in bits.h. The most significant
change is that __GENMASK() was moved to the uapi headers.

In v4 and onward, I introduce one big change: split the definition of
the asm and non-asm GENMASK(). I think this is controversial.
Especially, Yury commented that he did not want such split. So I
initially implemented a first draft in which both the asm and non-asm
version would rely on the same helper macro, i.e. adding this:

  #define __GENMASK_TYPE(t, w, h, l)			\
  	(((t)~_ULL(0) - ((t)1 << (l)) + 1) &		\
  	 ((t)~_ULL(0) >> (w - 1 - (h))))
    
to uapi/bits.h. And then, the different GENMASK()s would look like
this:

  #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
    
and so on.
    
I implemented it, and the final result looks quite ugly. Not only do
we need to manually provide the width each time, the biggest concern
is that adding this to the uapi is asking for trouble. Who knows how
people are going to use this? And once it is in the uapi, there is
virtually no way back.

Adding to this, that macro can not even be generalized to u128
integers, whereas after the split, it is.

Finally, I do not think it makes sense to expose the fixed width
variants to the asm. The fixed width integers type are a C
concept. For asm, the long and long long variants seems sufficient.

And so, after implementing both, the asm and non-asm split seems way
more clean and I think this is the best compromise. Let me know what
you think :)

As requested, here are the bloat-o-meter stats:

  $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
  add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-4 (1)
  Function                                     old     new   delta
  intel_psr_invalidate                         666     668      +2
  mst_stream_compute_config                   1652    1653      +1
  intel_psr_flush                              977     978      +1
  intel_dp_compute_link_config                1327    1328      +1
  cfg80211_inform_bss_data                    5109    5108      -1
  intel_drrs_activate                          379     376      -3
  Total: Before=22723481, After=22723482, chg +0.00%

(done with GCC 12.4.1 on an x86_64 defconfig)

--
2.43.0

---
Changes from v5:

  - Update the cover letter message. I was still refering to
    GENMASK_t() instead of GENMASK_TYPE().

  - Add a comment in the cover letter to explain that a common
    GENMASK_TYPE() for C and asm wouldn't allow to generate the u128
    variant.

  - Restore the comment saying that BUILD_BUG_ON() is not available in
    asm code.

  - Add a FIXME message to highlight the absence of the asm GENMASK*()
    unit tests.

  - Use git's histogram diff algorithm

  - Link to v5: https://lore.kernel.org/r/20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr

Changes from v4:

  - Rebase on https://github.com/norov/linux/tree/bitmap-for-next

  - Rename GENMASK_t() to GENMASK_TYPE()

  - First patch of v4 (the typo fix 'init128' -> 'int128') is removed
    because it was resent separately in:
    https://lore.kernel.org/all/20250305-fix_init128_typo-v1-1-cbe5b8e54e7d@wanadoo.fr

  - Replace the (t)~ULL(0) by type_max(t). This way, GENMASK_TYPE()
    can now be used to generate GENMASK_U128().

  - Get rid of the unsigned int cast for the U8 and U16 variants.

  - Add the BIT_TYPE() helper macro.

  - Link to v4: https://lore.kernel.org/r/20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr

Changes from v3:

  - Rebase on v6.14-rc5

  - Fix a typo in GENMASK_U128() comment.

  - Split the asm and non-asm definition of 

  - Replace ~0ULL by ~ULL(0)

  - Since v3, __GENMASK() was moved to the uapi and people started
    using directly. Introduce GENMASK_t() instead.

  - Link to v3: https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com

Changes from v2:

  - Document both in commit message and code about the strict type
    checking and give examples how it´d break with invalid params.

  - Link to v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com

Link to v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com

---
Lucas De Marchi (3):
      bits: introduce fixed-type BIT_U*()
      drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
      test_bits: add tests for GENMASK_U*()

Vincent Mailhol (3):
      bits: split the definition of the asm and non-asm GENMASK()
      test_bits: add tests for __GENMASK() and __GENMASK_ULL()
      test_bits: add tests for BIT_U*()

Yury Norov (1):
      bits: introduce fixed-type genmasks

 drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
 include/linux/bitops.h               |   1 -
 include/linux/bits.h                 |  91 ++++++++++++++++++++---------
 lib/test_bits.c                      |  49 ++++++++++++++++
 4 files changed, 124 insertions(+), 125 deletions(-)
---
base-commit: 0312e94abe484b9ee58c32d2f8ba177e04955b35
change-id: 20250228-fixed-type-genmasks-8d1a555f34e8

Best regards,
-- 
Vincent Mailhol <mailhol.vincent@wanadoo.fr>


