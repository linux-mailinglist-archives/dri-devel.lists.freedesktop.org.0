Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F5A38FB3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 00:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBAF10E22A;
	Mon, 17 Feb 2025 23:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sZz0hGjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C5A10E22A;
 Mon, 17 Feb 2025 23:43:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A4DEDA41B45;
 Mon, 17 Feb 2025 23:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3841EC4CED1;
 Mon, 17 Feb 2025 23:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739835805;
 bh=N61QqzpcOMoeHWqpfFmlVOvWCLR8YOYOT1A963i1cNo=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=sZz0hGjXVco0y8h2smR6NENtY+og9Eyw33ICIXehbDL3XrqOefYzx3hJCibxWLYwd
 tXKODRTSbQxJi9rFBLjR14mk5kj13giEScg297XhPMZyMTj2jrtuNJvE17Y+auzE9F
 LyOOtFAvWMkYf1/3SJ02cK96M1FzC8VjjJ9jKsSsLZHhE6j9+xlUvrSclAgZ8DE+qw
 17OdpX/dVinXas0VpLoSiWxgXpLdSt678x3F+aKfj3sl+Kfs1TM+AneVEbiMSsWnV1
 ZEM/T4JA2cFY/ymILk8SDPurasSWGp9X5P/RRJJJHNMsaSeG0L/NBHGyfzurISFNQA
 xyG3HbBmHFbhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5ABC021A9;
 Mon, 17 Feb 2025 23:43:25 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 17:43:18 -0600
Subject: [PATCH] drm/nouveau/pmu: Fix gp10b firmware guard
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-nouveau-gm10b-guard-v1-1-0d96f0068570@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJXJs2cC/x2MQQqAIBAAvxJ7bkG3ougr0cFqsz2koRiB9Pek4
 8DMZIgchCOMVYbAt0TxroCuK1gP4yyjbIWBFHWKdI/Op5tNQntqtaBNJmxo2mZoFS3FICjlFXi
 X579O8/t+8YEsT2UAAAA=
X-Change-ID: 20250217-nouveau-gm10b-guard-a438402b5022
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739835804; l=1102;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=f8lb6sJV/0LlAIwBP7HgEJtH0QjoGFU98w+WZTb7n3A=;
 b=zrOqogMmtS+s+z9c0ZTFVovU04FHtGu75y4ymeQgMVFlFom3ckutTmS40FWLi5r9k/jjJ/PqW
 4EB3YkQumtdAcdfBGN24IIENroYNuD0HoEuQDww+AyIotTJtZzd7JP0
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aaron Kling <webgeek1234@gmail.com>

Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on available firmware")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index a6f410ba60bc94ec9d52fc78868acddfc6770e19..d393bc540f8628812990dffe4c2f7e9014be07c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -75,7 +75,7 @@ gp10b_pmu_acr = {
 	.bootstrap_multiple_falcons = gp10b_pmu_acr_bootstrap_multiple_falcons,
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");

---
base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
change-id: 20250217-nouveau-gm10b-guard-a438402b5022

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


