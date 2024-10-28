Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2FF9B2D66
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5411410E468;
	Mon, 28 Oct 2024 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VrIGBOSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB02F10E47C;
 Mon, 28 Oct 2024 10:52:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4914A41C0E;
 Mon, 28 Oct 2024 10:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B729C4CEE4;
 Mon, 28 Oct 2024 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730112730;
 bh=9AzQdJ7a7ZmHLyvXYcvwTYK3YDslAKLGKeQaeCzx/34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VrIGBOSEonr5OyXOb4Axjggr8O80L0wPQxCU21lZuIHyMOvInbWfiaXCOqBga6PaN
 WDYJ4F4bnFGlusGkN22YCpbr7DwkJVXGF02iNbQrmbJMElJOGNmuU9BqtldT53B5Lc
 Wi36RqlHLSfQTSOoPLsHs8eJ3FXRMx48BShcd3oKyh7zB8AAoZDTH8V5znJWIWDdtj
 VaGfeGKGg/eFOUls8hAixnwHu70L2LTMdrbKG/JvdUqxWHe5R98PQdt55Rv/vNbqjv
 6LPYFmQywhTxCdKAuA3qiebLfLZ6/eOTX+OJ5HxdI8fCG2ox62hDYQah39t+jrBJ7X
 NtA11xsfJRMtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 32/32] drm/xe: Don't restart parallel queues
 multiple times on GT reset
Date: Mon, 28 Oct 2024 06:50:14 -0400
Message-ID: <20241028105050.3559169-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
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

From: Nirmoy Das <nirmoy.das@intel.com>

[ Upstream commit cdc21021f0351226a4845715564afd5dc50ed44b ]

In case of parallel submissions multiple GuC id will point to the
same exec queue and on GT reset such exec queues will get restarted
multiple times which is not desirable.

v2: don't use exec_queue_enabled() which could race,
    do the same for xe_guc_submit_stop (Matt B)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241022103555.731557-1-nirmoy.das@intel.com
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
(cherry picked from commit c8b0acd6d8745fd7e6450f5acc38f0227bd253b3)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 690f821f8bf5a..8628fbfade5a8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1762,8 +1762,13 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 	mutex_lock(&guc->submission_state.lock);
 
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/* Prevent redundant attempts to stop parallel queues */
+		if (q->guc->id != index)
+			continue;
+
 		guc_exec_queue_stop(guc, q);
+	}
 
 	mutex_unlock(&guc->submission_state.lock);
 
@@ -1801,8 +1806,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/* Prevent redundant attempts to start parallel queues */
+		if (q->guc->id != index)
+			continue;
+
 		guc_exec_queue_start(q);
+	}
 	mutex_unlock(&guc->submission_state.lock);
 
 	wake_up_all(&guc->ct.wq);
-- 
2.43.0

