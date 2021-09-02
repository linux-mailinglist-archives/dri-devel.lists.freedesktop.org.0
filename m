Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D63FEE21
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 14:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E89B6E525;
	Thu,  2 Sep 2021 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 02 Sep 2021 12:54:19 UTC
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B126E520
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 12:54:19 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7822:25bf:8b52:7a36])
 by albert.telenet-ops.be with bizsmtp
 id p0pF2500P13ssow060pFq9; Thu, 02 Sep 2021 14:49:16 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mLm9a-001Ldm-Sz; Thu, 02 Sep 2021 14:49:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mLm9a-00BK7i-Bq; Thu, 02 Sep 2021 14:49:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hridya Valsaraju <hridya@google.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] dma-buf: DMABUF_MOVE_NOTIFY should depend on
 DMA_SHARED_BUFFER
Date: Thu,  2 Sep 2021 14:49:11 +0200
Message-Id: <20210902124913.2698760-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902124913.2698760-1-geert@linux-m68k.org>
References: <20210902124913.2698760-1-geert@linux-m68k.org>
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

Move notify between drivers is an option of DMA-BUF.  Enabling
DMABUF_MOVE_NOTIFY without DMA_SHARED_BUFFER does not have any impact,
as drivers/dma-buf/ is not entered during the build when
DMA_SHARED_BUFFER is disabled.

Fixes: bb42df4662a44765 ("dma-buf: add dynamic DMA-buf handling v15")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/dma-buf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 9561e3d2d4285d55..de5a17c40a33d336 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -42,6 +42,7 @@ config UDMABUF
 config DMABUF_MOVE_NOTIFY
 	bool "Move notify between drivers (EXPERIMENTAL)"
 	default n
+	depends on DMA_SHARED_BUFFER
 	help
 	  Don't pin buffers if the dynamic DMA-buf interface is available on
 	  both the exporter as well as the importer. This fixes a security
-- 
2.25.1

