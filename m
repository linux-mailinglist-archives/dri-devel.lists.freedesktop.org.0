Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646E535217
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 18:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB4210E25D;
	Thu, 26 May 2022 16:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A708610E25D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 16:30:50 +0000 (UTC)
Date: Thu, 26 May 2022 16:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653582648; x=1653841848;
 bh=r3+Z29pIXb0Ohe+V6wTFTJYIF2UlE2BhOveZjFhi2es=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=S7LiGvqOB99LuE6iAr7gIQ2yq2Mshb+VeyOxbXrzXAzSklCj4DrkBqsFwe9Fib6H4
 TESw+Q3bpCRWVSgxxVSRfDtL8Qf8HpQQkvrntYs+t7mavmIeOmcgPL2594hbEgUDm3
 x01s2dLn3sX1lqcKWNe2U2EZxxfu+4XLtjYjEVoy4bV7UD5zf0i8iorIcNdAz73CoU
 QJXfmbvErVOrq1qwA5JFODnEC1Bw3QVa8noO0qPc1/w9oxRN/asLoE1b9xeNefyr7Y
 MnFx3p27tfAMQ47DHf33S6a+sXT4Mogs8o4rfgD+p7TwSLBdctXPAT6hFAJOu2vbGH
 rHvqUE1PiZxhA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] dma-buf: document how to find size, mention kernel versions
Message-ID: <20220526163033.341425-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document how to obtain the size of a DMA-BUF. This is what
Wayland compositors are doing.

Mention the kernel version numbers from which DMA-BUF features are
available.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 include/uapi/linux/dma-buf.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 8e4a2ca0bcbf..c95f6d3457d2 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -47,9 +47,13 @@
  *
  * If the driver or API with which the client is interacting uses implicit
  * synchronization, waiting for prior work to complete can be done via
- * poll() on the DMA buffer file descriptor.  If the driver or API require=
s
- * explicit synchronization, the client may have to wait on a sync_file or
- * other synchronization primitive outside the scope of the DMA buffer API=
.
+ * poll() on the DMA buffer file descriptor from kernel version 3.17.  If =
the
+ * driver or API requires explicit synchronization, the client may have to=
 wait
+ * on a sync_file or other synchronization primitive outside the scope of =
the
+ * DMA buffer API.
+ *
+ * From kernel version 3.12, user-space can use llseek(2) with the ``SEEK_=
END``
+ * whence to obtain the size of a DMA-BUF.
  */
 struct dma_buf_sync {
 =09/**
--=20
2.36.1


