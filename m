Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730E98A890
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075F110E539;
	Mon, 30 Sep 2024 15:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tretyak2.mcst.ru (tretyak2.mcst.ru [212.5.119.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1807310E536
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 15:33:11 +0000 (UTC)
Received: from tretyak2.mcst.ru (localhost [127.0.0.1])
 by tretyak2.mcst.ru (Postfix) with ESMTP id B175E102391;
 Mon, 30 Sep 2024 18:33:08 +0300 (MSK)
Received: from frog.lab.sun.mcst.ru (frog.lab.sun.mcst.ru [176.16.4.50])
 by tretyak2.mcst.ru (Postfix) with ESMTP id ABD7C101765;
 Mon, 30 Sep 2024 18:32:23 +0300 (MSK)
Received: from artemiev-i.lab.sun.mcst.ru (avior-1 [192.168.63.223])
 by frog.lab.sun.mcst.ru (8.13.4/8.12.11) with ESMTP id 48UFWMPI023053;
 Mon, 30 Sep 2024 18:32:23 +0300
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: Karol Herbst <kherbst@redhat.com>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] drm/nouveau/clk: prevent division by zero in gt215_clk_info()
Date: Mon, 30 Sep 2024 18:25:51 +0300
Message-Id: <20240930152551.1581766-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.39/RELEASE,
 bases: 20111107 #2745587, check: 20240930 notchecked
X-AV-Checked: ClamAV using ClamSMTP
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

sdiv can be zero if read_vco() returns 0 or khz is greater than sclk*2.
This value will cause a division-by-zero error in the gt215_clk_info() function.

Add a check before division. 

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
index b5f3969727a2..4c53442b4167 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
@@ -206,6 +206,9 @@ gt215_clk_info(struct nvkm_clk *base, int idx, u32 khz,
 	default:
 		sclk = read_vco(clk, idx);
 		sdiv = min((sclk * 2) / khz, (u32)65);
+		if (!sdiv)
+			return -EINVAL;
+
 		oclk = (sclk * 2) / sdiv;
 		diff = ((khz + 3000) - oclk);
 
-- 
2.39.2

