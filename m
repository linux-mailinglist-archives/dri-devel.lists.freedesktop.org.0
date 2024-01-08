Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DB826DDD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A18810E26A;
	Mon,  8 Jan 2024 12:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A058C10E254;
 Mon,  8 Jan 2024 12:28:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 38BF7B80D58;
 Mon,  8 Jan 2024 12:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4795C433C8;
 Mon,  8 Jan 2024 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704716925;
 bh=tij3zoxBMK+MBVN+7nMEI60sbQV6NDv5rjGx+xkKnhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gy9/q2L4G1iTSF7sVMeTCQKGdE0wdl07eYAO/TOZd5wqxSHzDlj56ljqesaafP56j
 Wf6SwNRtFHoiYMjoKRi3sDzCzLCIAM3+kOmvb2buGZJfQaWKSDC60FwECR9HHMhTGQ
 dT3bgGYhFxzMvvk1X1S4JE9Nk/xqk/tZ5O2OJMOcgkFzdIlys5SfbuHSSHJbuThGiX
 uzGZ0CW70eRvxUeCVJRvmh80w9Gapp4Ww7wY30SPf8XyGioVe9vQMpRot90oFZUhCe
 t1iXL+ZpO1+yEX/voQDbsyokCtlthBDXiFQh5G/UzU5NSHt61brQ1077hL40ljS0OW
 OtC0wzEhJksfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 5/5] nouveau: fix disp disabling with GSP
Date: Mon,  8 Jan 2024 07:28:16 -0500
Message-ID: <20240108122823.2090312-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108122823.2090312-1-sashal@kernel.org>
References: <20240108122823.2090312-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.71
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
index 65c99d948b686..ae47eabd5d0bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -359,7 +359,7 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 	if (ret)
 		return ret;
 
-	if (disp->func->oneinit) {
+	if (disp->func && disp->func->oneinit) {
 		ret = disp->func->oneinit(disp);
 		if (ret)
 			return ret;
@@ -461,8 +461,10 @@ nvkm_disp_new_(const struct nvkm_disp_func *func, struct nvkm_device *device,
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

