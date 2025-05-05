Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D756AAA0B0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813E310E4A4;
	Mon,  5 May 2025 22:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lGzf1NzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773F10E4F1;
 Mon,  5 May 2025 22:38:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 79DF64A489;
 Mon,  5 May 2025 22:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A528AC4CEE4;
 Mon,  5 May 2025 22:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484694;
 bh=kpuzWk60oqHn9WGOBuexBhO59/wtaS7eIae24p/EROk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lGzf1NzNGFN2m5ZdTno0AO+sIDHuttmojQipx7KKuDKau+FRKoz4u4c2/Ea8kunxN
 AoPGYMU2g8v/AUrKr+ezZ7ayj0ezvQJx11b7MI8zLyY+/iq9VzihSZk3t+NxGqO9Q9
 HUYtIO9JDRwM8pqYVIvxS7mu0/iKMmQi9Ur15NuyRAmYx7o650wFZ6JzzpYp8yHlkM
 LerLbjSY4BBeyE5pyHoz5FnBwDTZfKbWsJLdJw11/4Xw5b2CtsvYcRm73+xkqQwYNv
 5MOXVlg+gA3FVPtcBOFwpSwtWEVQtNR8axmWYku54tClbHu8Asbndkk9TZEzSkLCvr
 X90Vg5HH7/WyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 611/642] drm/xe/vf: Perform early GT MMIO
 initialization to read GMDID
Date: Mon,  5 May 2025 18:13:47 -0400
Message-Id: <20250505221419.2672473-611-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

[ Upstream commit 13265fe7426ec9ba5aa86baab913417ca361e8a4 ]

VFs need to communicate with the GuC to obtain the GMDID value
and existing GuC functions used for that assume that the GT has
it's MMIO members already setup. However, due to recent refactoring
the gt->mmio is initialized later, and any attempt by the VF to use
xe_mmio_read|write() from GuC functions will lead to NPD crash due
to unset MMIO register address:

[] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
[] xe 0000:00:02.1: [drm] GT0: sending H2G MMIO 0x5507
[] BUG: unable to handle page fault for address: 0000000000190240

Since we are already tweaking the id and type of the primary GT to
mimic it's a Media GT before initializing the GuC communication,
we can also call xe_gt_mmio_init() to perform early setup of the
gt->mmio which will make those GuC functions work again.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250114211347.1083-1-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b8813a518d72..d92b2e5885b98 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -490,6 +490,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 			gt->info.type = XE_GT_TYPE_MAIN;
 		}
 
+		xe_gt_mmio_init(gt);
 		xe_guc_comm_init_early(&gt->uc.guc);
 
 		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
-- 
2.39.5

