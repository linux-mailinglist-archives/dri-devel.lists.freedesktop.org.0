Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D8A42161
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E804210E4DC;
	Mon, 24 Feb 2025 13:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="givNZBbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B914710E29C;
 Mon, 24 Feb 2025 11:17:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA54F5C60AB;
 Mon, 24 Feb 2025 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9D3C4CEE6;
 Mon, 24 Feb 2025 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740395871;
 bh=TeyWQj9qkghOfMJ64W/gHI66DjJV8RFUgYrm7AH8ts4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=givNZBbgt6o8H3gOcRCAfBdG16tweQmnw0jeMuS/BMxLAvaW61puGGTmFjGmgVaTA
 1gt5ilNYcYMShtYS+cI+t9tOngbgSpbiTjvZL8JICGu8LX5aLVhcJR8Yh7AUkqEASs
 7Z6k6Xj2DWfrcmvtPmb2SCurgy2bMY5R9WFaWgMKX8/F63+B2GCrq/r3eNzfZwaV6n
 8OrTa47/ssMGfEVX3QD35IUp3vTUkA8UKLJSUqIe7GGkNU5v5WYXe5UT0CH7goVgu5
 rBsAzvafwk8+jGZkSfr/17fU6b4TEwPVp2z/t4391M3SlYIBuwm7b2vPIPHVqj+uxl
 Xs/5zHhNXq8cg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sasha Levin <sashal@kernel.org>,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 27/32] drm/xe: Make GUC binaries dump consistent
 with other binaries in devcoredump
Date: Mon, 24 Feb 2025 06:16:33 -0500
Message-Id: <20250224111638.2212832-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224111638.2212832-1-sashal@kernel.org>
References: <20250224111638.2212832-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.4
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

From: José Roberto de Souza <jose.souza@intel.com>

[ Upstream commit 643f209ba3fdd4099416aaf9efa8266f7366d6fb ]

All other(hwsp, hwctx and vmas) binaries follow this format:
[name].length: 0x1000
[name].data: xxxxxxx
[name].error: errno

The error one is just in case by some reason it was not able to
capture the binary.

So this GuC binaries should follow the same patern.

v2:
- renamed GUC binary to LOG

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250123202307.95103-3-jose.souza@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit cb1f868ca13756c0c18ba54d1591332476760d07)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_ct.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6eabf7a9d3b07..b527f34b979be 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1699,9 +1699,11 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 
-		if (snapshot->ctb)
-			xe_print_blob_ascii85(p, "CTB data", '\n',
+		if (snapshot->ctb) {
+			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
+			xe_print_blob_ascii85(p, "[CTB].data", '\n',
 					      snapshot->ctb, 0, snapshot->ctb_size);
+		}
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 2baa4d95571fb..2457572ed86ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -208,10 +208,11 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
 	drm_printf(p, "Log level: %u\n", snapshot->level);
 
+	drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
 	remain = snapshot->size;
 	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-		const char *prefix = i ? NULL : "Log data";
+		const char *prefix = i ? NULL : "[LOG].data";
 		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
 
 		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
-- 
2.39.5

