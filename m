Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27450A7A3BC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538310E9C7;
	Thu,  3 Apr 2025 13:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eghYFj7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111B810E9C8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 13:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82BD05C5C48;
 Thu,  3 Apr 2025 13:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AA1C4CEEB;
 Thu,  3 Apr 2025 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743687222;
 bh=rl01/FdFtTK1ESwz6xo4DRwQE6TYQX0rQmwJ/UODmaM=;
 h=From:Subject:Date:To:Cc:From;
 b=eghYFj7m1Ar1NSkqJGxsJJdqsFzr66HttynSzabWV/sRjxIe6KMH2Zs7QCTvEPU1g
 pBuL/a4fIGafl3FLWZ/5dfSZ3yORSZfzH7jQqGJWP1GHUdG7QlMV6ob6xU02d200EY
 CnQLigRfhAHY9zmWpprNCwjda5T7O6L2gK0mJkJy3Ld2XKFSZfGqFkP04ZyUe6t8WX
 qP7XffRLaMsY8r+sUWCqJJ/YAgj+EkkSDYoGSOma0XH4pu2FQ0krSsjyQpjYnAaSwC
 DZmEtew5XJFcKfgyppWlHFQJGZWsdvk2OaF4paZn044CovJeR9RUBMXzVQLwrlEEPo
 kIl2Y32lZCeDQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/4] drm/vc4: tests: Fix locking failures
Date: Thu, 03 Apr 2025 15:33:29 +0200
Message-Id: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACmO7mcC/4WNTQ6CMBBGr0Jm7RhKiwVX3sOw4GeACVjMFBoN4
 e5WL+DyveR73w6ehMnDNdlBKLDnxUXITgm0Y+0GQu4iQ5ZmeapVgZ08MLQGp83xin3N8ybkUSv
 dGGvz1ugC4vgp1PPrF75XkUf26yLv309QX/s3GRSmaG1ZXExX1o22t4nE0XxeZIDqOI4Pf/+T+
 r0AAAA=
X-Change-ID: 20250318-drm-vc4-kunit-failures-313b4775c438
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=mripard@kernel.org;
 h=from:subject:message-id; bh=rl01/FdFtTK1ESwz6xo4DRwQE6TYQX0rQmwJ/UODmaM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+vRvTnm0d8eEkzyff9lzVl2ak7c/pkpc3EVQWGPW4
 i/SQbYhHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIeCgjQ8dN7b935afoffNQ
 XfheI/9phkJTzcuktXa/5/1fM0HCg43hn05cTtv+x9lHArYWGOz+IXJps3vkPOupW3gvnY5YPt2
 5khcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

This series deals with (lack of) EDEADLK handling in vc4 PV muxing
tests.

This was leading to failures with CONFIG_DEBUG_WW_MUTEX_SLOWPATH
enabled.

Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Fix typo in commit log.
- Enhance the backoff code 
- Link to v1: https://lore.kernel.org/r/20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org

---
Maxime Ripard (4):
      drm/vc4: tests: Use return instead of assert
      drm/vc4: tests: Document output handling functions
      drm/vc4: tests: Stop allocating the state in test init
      drm/vc4: tests: Retry pv-muxing tests when EDEADLK

 drivers/gpu/drm/vc4/tests/vc4_mock_output.c    |  62 ++++++++--
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 154 ++++++++++++++++++++++---
 2 files changed, 189 insertions(+), 27 deletions(-)
---
base-commit: c0988d693eb10e115d95747f8a0cccc83babb3fc
change-id: 20250318-drm-vc4-kunit-failures-313b4775c438

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

