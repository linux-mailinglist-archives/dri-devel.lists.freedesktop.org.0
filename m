Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3DB16CE7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AED10E71B;
	Thu, 31 Jul 2025 07:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECDE10E71B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 07:51:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 832445C5CF9;
 Thu, 31 Jul 2025 07:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C16EC4CEF5;
 Thu, 31 Jul 2025 07:51:18 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Juston Li <justonli@chromium.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpu/trace: TRACE_GPU_MEM should depend on DRM
Date: Thu, 31 Jul 2025 09:51:13 +0200
Message-ID: <43ea77e79722abf6c16c3c7b59b25453cc88a4c6.1753948197.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU memory usage tracepoints are only used by DRM GPU drivers.
Hence add a dependency on DRM, to prevent asking the user about this
functionality when configuring a kernel without DRM GPU support.

Fixes: 5d95cbf21a4a550f ("gpu/trace: make TRACE_GPU_MEM configurable")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/trace/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index cd3d19c4a201c9c6..7f405ce7df5a0a42 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -2,6 +2,7 @@
 
 config TRACE_GPU_MEM
 	bool "Enable GPU memory usage tracepoints"
+	depends on DRM || COMPILE_TEST
 	default n
 	help
 	  Choose this option to enable tracepoints for tracking
-- 
2.43.0

