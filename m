Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437776EE9E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A1110E628;
	Thu,  3 Aug 2023 15:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D983910E624
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:49:35 +0000 (UTC)
Received: from strictly.printclub (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2681D660719F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 16:49:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691077774;
 bh=+KDq+XA2vyLpoB80hYko5BRd79y3WdrDIm5Agor7Tn0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kYAUDr6gJDpN4LsSUzLskoYHMt6p7TmxkTiBq8zY6sz7XJblWCyfmlzy5204FAyAm
 T4KPaH2rtR47AxZwNiyCNbIqgC+Sur4Zj/RF1SQeCEYx+hI9AAGHMvPzoPPJgEElTw
 A7KW02wH9x+mquS5fS/JU4oSDv6qOAsKU8/m6lOc1Jstm9HaHFY1wSeLFhK+A9vHwr
 kvQsaCIDneHXQ2naMDkiml4IoLfHIeTgvcQo7e52jyj5LJ6zceV/SRHi+zVfeGAOzm
 tW7vRtQ/KId/VWv9hiAIRFECFpS673mk3FP/xCSXLS0hEN0mWpwRlf7v3BIFyNcJdu
 HmvBBTHj3wdFw==
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] doc: dma-buf: Rewrite intro section a little
Date: Thu,  3 Aug 2023 16:47:28 +0100
Message-ID: <20230803154908.105124-3-daniels@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20210905122742.86029-1-daniels@collabora.com>
References: <20210905122742.86029-1-daniels@collabora.com>
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

Make it a little bit more clear what's going on and fix some formatting.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 Documentation/driver-api/dma-buf.rst | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

v2: New.

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index f92a32d095d9..862dbc2759d0 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -5,14 +5,22 @@ The dma-buf subsystem provides the framework for sharing buffers for
 hardware (DMA) access across multiple device drivers and subsystems, and
 for synchronizing asynchronous hardware access.
 
-This is used, for example, by drm "prime" multi-GPU support, but is of
-course not limited to GPU use cases.
-
-The three main components of this are: (1) dma-buf, representing a
-sg_table and exposed to userspace as a file descriptor to allow passing
-between devices, (2) fence, which provides a mechanism to signal when
-one device has finished access, and (3) reservation, which manages the
-shared or exclusive fence(s) associated with the buffer.
+As an example, it is used extensively by the DRM subsystem to exchange
+buffers between processes, contexts, library APIs within the same
+process, and also to exchange buffers with other subsystems such as
+V4L2.
+
+This document describes the way in which kernel subsystems can use and
+interact with the three main primitives offered by dma-buf:
+
+ - dma-buf, representing a sg_table and exposed to userspace as a file
+   descriptor to allow passing between processes, subsystems, devices,
+   etc;
+ - dma-fence, providing a mechanism to signal when an asynchronous
+   hardware operation has completed; and
+ - dma-resv, which manages a set of dma-fences for a particular dma-buf
+   allowing implicit (kernel-ordered) synchronization of work to
+   preserve the illusion of coherent access
 
 Shared DMA Buffers
 ------------------
-- 
2.41.0

