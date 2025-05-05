Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4741AAA21D
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034CB10E58A;
	Mon,  5 May 2025 22:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ofOanrv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A1110E58A;
 Mon,  5 May 2025 22:55:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3009F4A3EA;
 Mon,  5 May 2025 22:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7C2C4CEED;
 Mon,  5 May 2025 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485713;
 bh=QfzK3qyAlNt3rNQwwtvAXu5oLER/vfNYNL3KtQqHp0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ofOanrv3bMxlR1ALy+coLSfd5qUfcCVZ+gVoNdV8QnyZwFELF9J6lfsFd81ax5CdQ
 r0qkBv/hJdmbLTKXVFPbL25muKEkCdiHdN2mV6RSVO/dJifetl6lMyxKyfbNZNjuON
 hg2befnIQoxmpK1hTQvTaAL1FHZfUJpNVQZJwCT5qJ/8ZzAx7eG3XrL7+vveNXiUfW
 vjRyx9Qbg45dzFdVS6amHXECGDzn1Wp0ktL7j3IOL+YpOlN8OxbvRmlJviFj/IyonL
 FCAw2aAhzil2WH3TXcWGu1HJgUnmDqi5KOKPL/rPNzsFvygGjCg/sFv/ndsibuX4GT
 tstAihzVpZ/FA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 439/486] drm/xe/relay: Don't use GFP_KERNEL for
 new transactions
Date: Mon,  5 May 2025 18:38:35 -0400
Message-Id: <20250505223922.2682012-439-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

[ Upstream commit 78d5d1e20d1de9422f013338a0f2311448588ba7 ]

VFs use a relay transaction during the resume/reset flow and use
of the GFP_KERNEL flag may conflict with the reclaim:

     -> #0 (fs_reclaim){+.+.}-{0:0}:
 [ ]        __lock_acquire+0x1874/0x2bc0
 [ ]        lock_acquire+0xd2/0x310
 [ ]        fs_reclaim_acquire+0xc5/0x100
 [ ]        mempool_alloc_noprof+0x5c/0x1b0
 [ ]        __relay_get_transaction+0xdc/0xa10 [xe]
 [ ]        relay_send_to+0x251/0xe50 [xe]
 [ ]        xe_guc_relay_send_to_pf+0x79/0x3a0 [xe]
 [ ]        xe_gt_sriov_vf_connect+0x90/0x4d0 [xe]
 [ ]        xe_uc_init_hw+0x157/0x3b0 [xe]
 [ ]        do_gt_restart+0x1ae/0x650 [xe]
 [ ]        xe_gt_resume+0xb6/0x120 [xe]
 [ ]        xe_pm_runtime_resume+0x15b/0x370 [xe]
 [ ]        xe_pci_runtime_resume+0x73/0x90 [xe]
 [ ]        pci_pm_runtime_resume+0xa0/0x100
 [ ]        __rpm_callback+0x4d/0x170
 [ ]        rpm_callback+0x64/0x70
 [ ]        rpm_resume+0x594/0x790
 [ ]        __pm_runtime_resume+0x4e/0x90
 [ ]        xe_pm_runtime_get_ioctl+0x9c/0x160 [xe]

Since we have a preallocated pool of relay transactions, which
should cover all our normal relay use cases, we may use the
GFP_NOWAIT flag when allocating new outgoing transactions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Tested-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250131153713.808-1-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index ade6162dc2598..0e5b43e1518ea 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -224,7 +224,7 @@ __relay_get_transaction(struct xe_guc_relay *relay, bool incoming, u32 remote, u
 	 * with CTB lock held which is marked as used in the reclaim path.
 	 * Btw, that's one of the reason why we use mempool here!
 	 */
-	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_KERNEL);
+	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_NOWAIT);
 	if (!txn)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.39.5

