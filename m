Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0A3F360E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 23:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D158F6EB1C;
	Fri, 20 Aug 2021 21:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FAB6EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 21:31:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C7CEF1F44A8F;
 Fri, 20 Aug 2021 22:31:33 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/panfrost: Bug fixes for lock_region
Date: Fri, 20 Aug 2021 17:31:14 -0400
Message-Id: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
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
(seemingly cargo culted from kbase) and can be simplified with kernel
helpers and some mathematical identities. The first patch in the series
rewrites the calculation in a form avoiding undefined behaviour; Chris
confirms it placates UBSAN.

While researching this function, I noticed a pair of other potential
bugs: Bifrost can lock more than 4GiB at a time, but must lock at least
32KiB at a time. The latter patches in the series handle these cases.

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

Alyssa Rosenzweig (3):
  drm/panfrost: Simplify lock_region calculation
  drm/panfrost: Use u64 for size in lock_region
  drm/panfrost: Clamp lock region to Bifrost minimum

 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 31 +++++++++---------------
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 2 files changed, 13 insertions(+), 20 deletions(-)

-- 
2.30.2

