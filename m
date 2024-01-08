Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10D826DD4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D87A10E273;
	Mon,  8 Jan 2024 12:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445A510E254;
 Mon,  8 Jan 2024 12:28:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C34E60F7C;
 Mon,  8 Jan 2024 12:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F8BC433C9;
 Mon,  8 Jan 2024 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704716894;
 bh=opb3qO0OY2NI17zoyL1H/sSnvpBzXA8yXd5kYvYY5H4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCszEp8BIc/JVjc1uoO6L3ZQA0KwEY+E+rLyQEXclj8myz2Y2TxO4A/iLqhUk/8NS
 mfafNpv/vG6IeAXfRg3edn1p7lNMW9Si9Rqw2YmPjwU+Kdl3I+oizPOA6N5Vu9vhNN
 y1uR1YaELF756kgiuAljSqoJgVh9GIbrZ+AlzWWhLXfdxqloKZLHyINDUsmBDHCVgA
 Xltq2tL63GIp1A87BKi45jT92g69TrxeuTgXUM6VpmUA5ltcAZhIkgjSZyz8DkWjBE
 rHuP310JrqdijvHaGImEg8emNsNrwk8kQuWLVrhtCNpkR/8KbLNZ6OzEQQUbxbFRBN
 Pm3QGzU6t6/0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 8/8] nouveau: fix disp disabling with GSP
Date: Mon,  8 Jan 2024 07:27:24 -0500
Message-ID: <20240108122745.2090122-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108122745.2090122-1-sashal@kernel.org>
References: <20240108122745.2090122-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.10
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
Cc: Sasha Levin <sashal@kernel.org>, kherbst@redhat.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dakr@redhat.com, bskeggs@redhat.com, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@gmail.com>

[ Upstream commit 7854ea0e408d7f2e8faaada1773f3ddf9cb538f5 ]

This func ptr here is normally static allocation, but gsp r535
uses a dynamic pointer, so we need to handle that better.

This fixes a crash with GSP when you use config=disp=0 to avoid
disp problems.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231222043308.3090089-4-airlied@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 73104b59f97fe..54a3017f4756a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -276,7 +276,7 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 		list_add_tail(&outp->conn->head, &disp->conns);
 	}
 
-	if (disp->func->oneinit) {
+	if (disp->func && disp->func->oneinit) {
 		ret = disp->func->oneinit(disp);
 		if (ret)
 			return ret;
@@ -377,8 +377,10 @@ nvkm_disp_new_(const struct nvkm_disp_func *func, struct nvkm_device *device,
 	spin_lock_init(&disp->client.lock);
 
 	ret = nvkm_engine_ctor(&nvkm_disp, device, type, inst, true, &disp->engine);
-	if (ret)
+	if (ret) {
+		disp->func = NULL;
 		return ret;
+	}
 
 	if (func->super) {
 		disp->super.wq = create_singlethread_workqueue("nvkm-disp");
-- 
2.43.0

