Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26D6BE8FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69D610EEF4;
	Fri, 17 Mar 2023 12:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB45910EEF4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wxlvNLGKgBNmusrXwv5nJvC1jT8zNLs4o63V3Oq55OI=; b=D8fYSVFHxRxkWM8ooaCtJrSslk
 iYawuRl6Efmm9iNfhGGKGnjSWBepYC0agou6YKRqLPTqodLqxjyH42HfNTn2QKLZbzQheCuIiZqpo
 uFGU1Zu6mWfGfFxXCogN1Rcs+SjFe7u35jS02p1WHa5NSIBFFHvflP6N1HXi7GpS4Qs8lnZWq5bKS
 n045cp1UUxElZqZdHAePrQhYAJSHSEfKDtOUo0EBiqOkIxqB3vHov1SKbn8IUDCrTSUQBD8UJym3y
 vqrsjn8+TqetKivDqwQ9i93DRneKt1yA7Rtu1Wcac8fQ29/MTIKPXF+tcEccLbLZz6gyy8qLR4jOJ
 Sn4pX8xg==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xS-00FrGz-J4; Fri, 17 Mar 2023 13:13:19 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Asahi Lina <lina@asahilina.net>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 4/9] rust: dma_fence: expose the fence's seqno publically
Date: Fri, 17 Mar 2023 09:12:08 -0300
Message-Id: <20230317121213.93991-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each fence has a linear increasing sequence number inside the execution
context, that can be used to decide which fence would be signaled later.
So, expose this attribute to the Rust drivers through a method.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 rust/kernel/dma_fence.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/dma_fence.rs b/rust/kernel/dma_fence.rs
index 176e6d250e6c..94fead520274 100644
--- a/rust/kernel/dma_fence.rs
+++ b/rust/kernel/dma_fence.rs
@@ -60,6 +60,13 @@ pub trait RawDmaFence: crate::private::Sealed {
         }
     }
 
+    /// Return the seqno from this fence
+    fn seqno(&self) -> u64 {
+        // SAFETY: We hold a reference to a dma_fence and every dma_fence holds
+        // a seqno.
+        unsafe { (*self.raw()).seqno }
+    }
+
     /// Signal completion of this fence
     fn signal(&self) -> Result {
         to_result(unsafe { bindings::dma_fence_signal(self.raw()) })
-- 
2.39.2

