Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AEE1A54F0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5008E6E365;
	Sat, 11 Apr 2020 23:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4366E35F;
 Sat, 11 Apr 2020 23:08:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF1562166E;
 Sat, 11 Apr 2020 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646512;
 bh=gxcoV2qpI5IWHpmQs+fyevwYN5HNxlyLXon5O6O47ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AF516nSxJHM/4r8ew4EU+brXII/W5ZSZDWifrAmgx1cJ73GCl3yEP0DL8avSAlLse
 G62TtlSM+Yvoxwn4MMrULiUkU31yWqQULwVTyjd6UvzHLggz9aZ1dNBNEcPHsHLvCN
 RWNQTNVP/fkLO1DbT2q2+t/vMX39iVSCquEGeLlo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 070/121] drm/amd/display: System crashes when
 add_ptb_to_table() gets called
Date: Sat, 11 Apr 2020 19:06:15 -0400
Message-Id: <20200411230706.23855-70-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Peikang Zhang <peikang.zhang@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Peikang Zhang <peikang.zhang@amd.com>

[ Upstream commit 0062972b9d9f888d0273c6496769d02e8f509135 ]

[Why]
Unused VMIDs were not evicted correctly

[How]
1. evict_vmids() logic was fixed;
2. Added boundary check for add_ptb_to_table() and
   clear_entry_from_vmid_table() to avoid crash caused by array out of
   boundary;
3. For mod_vmid_get_for_ptb(), vimd is changed from unsigned to signed
   due to vimd is signed.

Signed-off-by: Peikang Zhang <peikang.zhang@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/modules/vmid/vmid.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
index f0a153704f6e0..00f132f8ad55d 100644
--- a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
+++ b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
@@ -40,14 +40,18 @@ struct core_vmid {
 
 static void add_ptb_to_table(struct core_vmid *core_vmid, unsigned int vmid, uint64_t ptb)
 {
-	core_vmid->ptb_assigned_to_vmid[vmid] = ptb;
-	core_vmid->num_vmids_available--;
+	if (vmid < MAX_VMID) {
+		core_vmid->ptb_assigned_to_vmid[vmid] = ptb;
+		core_vmid->num_vmids_available--;
+	}
 }
 
 static void clear_entry_from_vmid_table(struct core_vmid *core_vmid, unsigned int vmid)
 {
-	core_vmid->ptb_assigned_to_vmid[vmid] = 0;
-	core_vmid->num_vmids_available++;
+	if (vmid < MAX_VMID) {
+		core_vmid->ptb_assigned_to_vmid[vmid] = 0;
+		core_vmid->num_vmids_available++;
+	}
 }
 
 static void evict_vmids(struct core_vmid *core_vmid)
@@ -57,7 +61,7 @@ static void evict_vmids(struct core_vmid *core_vmid)
 
 	// At this point any positions with value 0 are unused vmids, evict them
 	for (i = 1; i < core_vmid->num_vmid; i++) {
-		if (ord & (1u << i))
+		if (!(ord & (1u << i)))
 			clear_entry_from_vmid_table(core_vmid, i);
 	}
 }
@@ -91,7 +95,7 @@ static int get_next_available_vmid(struct core_vmid *core_vmid)
 uint8_t mod_vmid_get_for_ptb(struct mod_vmid *mod_vmid, uint64_t ptb)
 {
 	struct core_vmid *core_vmid = MOD_VMID_TO_CORE(mod_vmid);
-	unsigned int vmid = 0;
+	int vmid = 0;
 
 	// Physical address gets vmid 0
 	if (ptb == 0)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
