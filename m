Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E1D24BD5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6425710E0E3;
	Thu, 15 Jan 2026 13:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A8810E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:32:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4DA260195;
 Thu, 15 Jan 2026 13:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22BDC116D0;
 Thu, 15 Jan 2026 13:32:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Juston Li <justonli@chromium.org>, Lucas De Marchi <demarchi@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] gpu/trace: TRACE_GPU_MEM should depend on DRM
Date: Thu, 15 Jan 2026 14:32:00 +0100
Message-ID: <598987a3785b1d3914a0b1ca25d1d464ee2e68dd.1768483636.git.geert+renesas@glider.be>
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
Used by DRM_MSM (which selects TRACE_GPU_MEM) and DRM_XE (when
TRACE_GPU_MEM is enabled manually).

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

