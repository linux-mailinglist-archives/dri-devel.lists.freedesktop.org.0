Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A959A6C8A6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 10:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72910E2D1;
	Sat, 22 Mar 2025 09:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Inwoxhel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4F010E02D;
 Sat, 22 Mar 2025 09:24:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D117D4152C;
 Sat, 22 Mar 2025 09:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0649BC4CEDD;
 Sat, 22 Mar 2025 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742635452;
 bh=sN2Lxz4ZIQPFbPUodNuVELEY2d+P3QblePNK77Bui9s=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=Inwoxhelg1KcEkbK4E/1/8y31pI1+1ifPI4iejG6cfxW7tdaE7aSSgbIWdK/aOF/C
 aZ5apK6AbeYF1UAPadUZkiIX4VPOnwtrdyoaFm+cgHwKshniHw+xbKCsjUFHPdJNUV
 T2lPJXUtKJUKLMe6isoCa8eTcRrHL/8//pdGCwNZA1RLl65hHcczwtZr03gPFTaEf/
 RSPlgtrO5YvFEMyg88AY5grLJ2Tjm2C+suUClkMtwXDwKqm23QA4CitkCITR8x38k0
 7GcsIWygUofPDg+RdGBlEktNjM63qPKFcUoZgyPCKL9EV8pEAMJUfqdhqTx5aLbWTY
 Z0sDKWfUvtQSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E3EEDC35FFC;
 Sat, 22 Mar 2025 09:24:11 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Subject: [PATCH v7 0/5] bits: Fixed-type GENMASK_U*() and BIT_U*()
Date: Sat, 22 Mar 2025 18:23:11 +0900
Message-Id: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH+B3mcC/23Q0WrDIBTG8VcpXs9g1KNmV32PsQurx0bWxKJZt
 lLy7tONQcdy+cHxxx/vpGCOWMjz4U4yrrHENNehnw7EjXY+I42+bsIZB8a5oSF+oqfL7Yr0jPN
 ky1uhxvcWAIKQaEh9ec3Yzpr68lp3yGmiy5jR/lqScWaYlsD7DrRmWtGeXt6dLZ3HyWY3xmOcF
 7x0Lk2NHGNZUr59d66ywT9JgsFu0iopo73RwjsflObi+GFn61PqQiataYVHRO0jUJGTlAIH705
 W/UfUI7L/OauqSIBB9IBaOD78QbZt+wLVchcAhAEAAA==
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4801;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=sN2Lxz4ZIQPFbPUodNuVELEY2d+P3QblePNK77Bui9s=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOn3Glc+/7895IhHkpuNq0JE1MtYNSf28sj60npLDZdpd
 at6Dip0lLIwiHExyIopsiwr5+RW6Cj0Djv01xJmDisTyBAGLk4BmMgFHkaGd2bPS6dlHbRoPSxY
 9fOwiVFZ3MPmbxI3lNP+n/7WdmhyIyPD6XkPMt3Xquy8oXZI70uIjMnvvs3W96oFd16b7hvZJWr
 BAwA=
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
change is that __GENMASK() was moved to the uapi headers. For this
reason, a new GENMASK_TYPE() is introduced instead and the uapi
__GENMASK() is left untouched.

Finally, I do not think it makes sense to expose the fixed width
variants to the asm. The fixed width integers type are a C concept. So
the GENMASK_U*() are only visible to the non-asm code. For asm, the
long and long long variants seems sufficient.

This series does not modify the actual GENMASK(), GENMASK_ULL() and
GENMASK_U128(). A consolidation of the existing genmasks will be
proposed later on in a separate series.

As requested, here are the bloat-o-meter stats:

  $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
  add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
  Function                                     old     new   delta
  Total: Before=22723481, After=22723481, chg +0.00%

(done with GCC 12.4.1 on an x86_64 defconfig)

--
2.43.0

---
Changes from v6:

  - Split the series in two: this series leave any existing GENMASK*()
    unmodified. The consolidation will be done in a separate series.

  - Collect some Reviewed-by tag.

  - Address miscellaneous nitpick on the code comments and the line
    wrapping (details in each patch).

  - Link to v6: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr

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

Vincent Mailhol (2):
      bits: introduce fixed-type GENMASK_U*()
      test_bits: add tests for BIT_U*()

 drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
 include/linux/bitops.h               |   1 -
 include/linux/bits.h                 |  57 +++++++++++++++++-
 lib/test_bits.c                      |  30 ++++++++++
 4 files changed, 96 insertions(+), 100 deletions(-)
---
base-commit: e3f42c436d7e0cb432935fe3ae275dd8d9b60f71
change-id: 20250228-fixed-type-genmasks-8d1a555f34e8

Best regards,
-- 
Vincent Mailhol <mailhol.vincent@wanadoo.fr>


