Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5310E95C7D0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 10:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA6510E168;
	Fri, 23 Aug 2024 08:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="U8r8HRX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2024 08:15:32 UTC
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24410E168
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:15:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724400450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q06oqOIsnlBXOPeX9QmHFvGk4DIwl/omFgxTtDgtIdY=;
 b=U8r8HRX+MecBuIaubX7KG/DiqadhPH9bhKB6ZsqgHjrqEPmVNOcWeKKALOFqm+jJJJ5q2q
 NM1/DahPLSsLPc8CzzmlNNtXKZE92L65cA5hYLe/8lLlZtSHhkPDuCExOrVEgE88ldZ671
 qe6c9qxPO+zPKVJx0llqA0qAevsRhfU=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] gpu: host1x: Make host1x_context_device_bus_type constant
Date: Fri, 23 Aug 2024 16:07:24 +0800
Message-ID: <20240823080724.148423-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Kunwu Chan <chentao@kylinos.cn>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the host1x_context_device_bus_type variable
to be a constant structure as well, placing it into read-only memory
which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/host1x/context_bus.c   | 2 +-
 include/linux/host1x_context_bus.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index d9421179d7b4..7cd0e1a5edd1 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -6,7 +6,7 @@
 #include <linux/device.h>
 #include <linux/of.h>
 
-struct bus_type host1x_context_device_bus_type = {
+const struct bus_type host1x_context_device_bus_type = {
 	.name = "host1x-context",
 };
 EXPORT_SYMBOL_GPL(host1x_context_device_bus_type);
diff --git a/include/linux/host1x_context_bus.h b/include/linux/host1x_context_bus.h
index 72462737a6db..c928cb432680 100644
--- a/include/linux/host1x_context_bus.h
+++ b/include/linux/host1x_context_bus.h
@@ -9,7 +9,7 @@
 #include <linux/device.h>
 
 #ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
-extern struct bus_type host1x_context_device_bus_type;
+extern const struct bus_type host1x_context_device_bus_type;
 #endif
 
 #endif
-- 
2.41.0

