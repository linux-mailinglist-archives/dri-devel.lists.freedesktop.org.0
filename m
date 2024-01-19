Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B785832B21
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B0E10EA5C;
	Fri, 19 Jan 2024 14:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633B10E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705673655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zL3Tp6j0FI2WH0LNy5N+K5/yV+yjLiDhRH8Apc3kyR0=;
 b=3LszNdqwVjq2wB4XbfV0SlOIPJE88IrYP6Nh6Aey3ecpOMPogYori6J5mRQT8+eARmgXUn
 kYdPu5/dlYKwuEclfM9xyYKYSrti2QlD4kewAKbelYZrc2+SJ6bJoEYnXfFlTrQ+Xhqm0+
 l2KMj978BvE776w0tCxib3B3dGAZeks=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 6/6] Documentation: usb: Document FunctionFS DMABUF API
Date: Fri, 19 Jan 2024 15:14:02 +0100
Message-ID: <20240119141402.44262-7-paul@crapouillou.net>
In-Reply-To: <20240119141402.44262-1-paul@crapouillou.net>
References: <20240119141402.44262-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the three ioctls used to attach or detach
externally-created DMABUFs, and to request transfers from/to previously
attached DMABUFs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
v3: New patch
---
 Documentation/usb/functionfs.rst | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
index a3054bea38f3..d05a775bc45b 100644
--- a/Documentation/usb/functionfs.rst
+++ b/Documentation/usb/functionfs.rst
@@ -2,6 +2,9 @@
 How FunctionFS works
 ====================
 
+Overview
+========
+
 From kernel point of view it is just a composite function with some
 unique behaviour.  It may be added to an USB configuration only after
 the user space driver has registered by writing descriptors and
@@ -66,3 +69,36 @@ have been written to their ep0's.
 
 Conversely, the gadget is unregistered after the first USB function
 closes its endpoints.
+
+DMABUF interface
+================
+
+FunctionFS additionally supports a DMABUF based interface, where the
+userspace can attach DMABUF objects (externally created) to an endpoint,
+and subsequently use them for data transfers.
+
+A userspace application can then use this interface to share DMABUF
+objects between several interfaces, allowing it to transfer data in a
+zero-copy fashion, for instance between IIO and the USB stack.
+
+As part of this interface, three new IOCTLs have been added. These three
+IOCTLs have to be performed on a data endpoint (ie. not ep0). They are:
+
+  ``FUNCTIONFS_DMABUF_ATTACH(int)``
+    Attach the DMABUF object, identified by its file descriptor, to the
+    data endpoint. Returns zero on success, and a negative errno value
+    on error.
+
+  ``FUNCTIONFS_DMABUF_DETACH(int)``
+    Detach the given DMABUF object, identified by its file descriptor,
+    from the data endpoint. Returns zero on success, and a negative
+    errno value on error. Note that closing the endpoint's file
+    descriptor will automatically detach all attached DMABUFs.
+
+  ``FUNCTIONFS_DMABUF_TRANSFER(struct usb_ffs_dmabuf_transfer_req *)``
+    Enqueue the previously attached DMABUF to the transfer queue.
+    The argument is a structure that packs the DMABUF's file descriptor,
+    the size in bytes to transfer (which should generally correspond to
+    the size of the DMABUF), and a 'flags' field which is unused
+    for now. Returns zero on success, and a negative errno value on
+    error.
-- 
2.43.0

