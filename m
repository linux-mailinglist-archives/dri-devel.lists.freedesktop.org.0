Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E58CD761A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 23:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1310C10E04B;
	Mon, 22 Dec 2025 22:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="syvKYJwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D699510E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 22:53:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251222225350euoutp027729596f5ef62723ded213e1244725d1~Dq3y0u0Ak0761207612euoutp02f
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 22:53:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251222225350euoutp027729596f5ef62723ded213e1244725d1~Dq3y0u0Ak0761207612euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1766444030;
 bh=kC7Q0t/efEBJ0QALzbKklCHmQfNI6W8zXfcM+UKOfFE=;
 h=From:Date:Subject:To:Cc:References:From;
 b=syvKYJwR8DToV/gN6LpI2fXXKi2ZWczqtMHVOFZLFwKzyBui29wfkGyESwAV57OlT
 eS/rwG4ULZLoYbTdhrPSXRGP7ca5STPOOD86BnqSp3a8hsJvn3cb++O/szShs6hrFT
 Urvi6s6+ZCdE28bXBMb9zULWjj2TIPHezvOwNfXU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1~Dq3yKzt5y3132931329eucas1p15;
 Mon, 22 Dec 2025 22:53:50 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251222225349eusmtip1d46a466848fdd2a2e90c626b8b611888~Dq3xqltq-0596005960eusmtip1Y;
 Mon, 22 Dec 2025 22:53:49 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 22 Dec 2025 23:53:31 +0100
Subject: [PATCH] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>
X-B4-Tracking: v=1; b=H4sIAOrLSWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3bTMivjM3MT0zLzEEqBaXYvUNINkSxOgXLKJElBXQVEqUAnYxOj
 Y2loAgGJsZmEAAAA=
X-Change-ID: 20251222-fix_imagination-8ef0c94122c4
To: Frank Binns <frank.binns@imgtec.com>,  Matt Coster
 <matt.coster@imgtec.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,  kernel
 test robot <lkp@intel.com>,  Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1
X-EPHeader: CA
X-CMS-RootMailID: 20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1
References: <CGME20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1@eucas1p1.samsung.com>
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

The build fails on RISC-V using GCC because `SIZE_CHECK(struct
rogue_fwif_hwrtdata, 384)` expects 384 bytes, but the compiler generates
a 336-byte structure.

This is due to an alignment conflict: the inner member `cleanup_state`
requires 64-byte alignment, but the outer struct is explicitly marked
`__aligned(8)`.

While GCC on ARM64 implicitly pads the size to a multiple of 64, GCC on
RISC-V strictly respects the 8-byte outer alignment, resulting in a size
mismatch.

Fix this by aligning the entire structure to 64 bytes, which resolves
the contradiction and forces the correct 384 byte size on all
architectures.

Fixes: a26f067feac1 ("drm/imagination: Add FWIF headers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512131851.1WNXk3BC-lkp@intel.com/
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
index 172886be4c820a32ae1b08d62bf0814250f2a9bd..1ba2a167a38b31911e0846923e4dc70626f5ca65 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
@@ -2170,7 +2170,7 @@ struct rogue_fwif_hwrtdata {
 	bool geom_caches_need_zeroing __aligned(4);
 
 	struct rogue_fwif_cleanup_ctl cleanup_state __aligned(64);
-} __aligned(8);
+} __aligned(64);
 
 /*
  ******************************************************************************

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-fix_imagination-8ef0c94122c4

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

