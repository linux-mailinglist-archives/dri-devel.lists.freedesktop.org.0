Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F13F6728
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699AF6E090;
	Tue, 24 Aug 2021 17:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDF26E090
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:30:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 76CB11F426FC;
 Tue, 24 Aug 2021 18:30:38 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/panfrost: Bug fixes for lock_region
Date: Tue, 24 Aug 2021 13:30:24 -0400
Message-Id: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chris Morgan reported UBSAN errors in panfrost and tracked them down to
the size computation in lock_region. This calculation is overcomplicated
(cargo culted from kbase) and can be simplified with kernel helpers and
some mathematical identities. The first patch in the series rewrites the
calculation in a form avoiding undefined behaviour; Chris confirms it
placates UBSAN.

While researching this function, I noticed a pair of other potential
bugs: Bifrost can lock more than 4GiB at a time, but must lock at least
32KiB at a time. The latter patches in the series handle these cases.

In review of v1 of this series, Steven pointed out a fourth potential
bug: rounding down the iova can truncate the lock region. v2 adds a new
patch for this case.

The size computation was unit-tested in userspace. Relevant code below,
just missing some copypaste definitions for fls64/clamp/etc:

	#define MIN_LOCK (1ULL << 12)
	#define MAX_LOCK (1ULL << 48)

	struct {
		uint64_t size;
		uint8_t encoded;
	} tests[] = {
		/* Clamping */
		{ 0, 11 },
		{ 1, 11 },
		{ 2, 11 },
		{ 4095, 11 },
		/* Power of two */
		{ 4096, 11 },
		/* Round up */
		{ 4097, 12 },
		{ 8192, 12 },
		{ 16384, 13 },
		{ 16385, 14 },
		/* Maximum */
		{ ~0ULL, 47 },
	};

	static uint8_t region_width(uint64_t size)
	{
		size = clamp(size, MIN_LOCK, MAX_LOCK);
		return fls64(size - 1) - 1;
	}

	int main(int argc, char **argv)
	{
		for (unsigned i = 0; i < ARRAY_SIZE(tests); ++i) {
			uint64_t test = tests[i].size;
			uint8_t expected = tests[i].encoded;
			uint8_t actual = region_width(test);

			assert(expected == actual);
		}
	}

Changes in v2:

* New patch for non-aligned lock addresses
* Commit message improvements.
* Add Steven's tags.

Alyssa Rosenzweig (4):
  drm/panfrost: Simplify lock_region calculation
  drm/panfrost: Use u64 for size in lock_region
  drm/panfrost: Clamp lock region to Bifrost minimum
  drm/panfrost: Handle non-aligned lock addresses

 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 32 ++++++++++--------------
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 2 files changed, 15 insertions(+), 19 deletions(-)

-- 
2.30.2

