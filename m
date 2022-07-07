Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D256A9A4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB40113322;
	Thu,  7 Jul 2022 17:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE78F11254F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 17:30:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B94261063;
 Thu,  7 Jul 2022 10:30:49 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EF243F792;
 Thu,  7 Jul 2022 10:30:48 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com
Subject: [PATCH] gpu: host1x: Register context bus unconditionally
Date: Thu,  7 Jul 2022 18:30:44 +0100
Message-Id: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conditional registration is a problem for other subsystems which may
unwittingly try to interact with host1x_context_device_bus_type in an
uninitialised state on non-Tegra platforms. A look under /sys/bus on a
typical system already reveals plenty of entries from enabled but
otherwise irrelevant configs, so lets keep things simple and register
our context bus unconditionally too.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/host1x/context_bus.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index b0d35b2bbe89..d9421179d7b4 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -15,11 +15,6 @@ static int __init host1x_context_device_bus_init(void)
 {
 	int err;
 
-	if (!of_machine_is_compatible("nvidia,tegra186") &&
-	    !of_machine_is_compatible("nvidia,tegra194") &&
-	    !of_machine_is_compatible("nvidia,tegra234"))
-		return 0;
-
 	err = bus_register(&host1x_context_device_bus_type);
 	if (err < 0) {
 		pr_err("bus type registration failed: %d\n", err);
-- 
2.36.1.dirty

