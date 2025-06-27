Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F53AEB323
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10910E998;
	Fri, 27 Jun 2025 09:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SVv3jZR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B49810E998
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751017280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L6jxLqbH5aL7S/cyb6QujO2iII/2MSR1tRtC68sK9Tc=;
 b=SVv3jZR72MlQFvkb6X4pflgt7OokdZqMhxwC41i5MYHxIOT/kZJA0DdYZXXa/4pKz51fmq
 IOdbZjEKjc53ntlH3+ayS43LuO6ZMnOUcPLgrQLnb5i5hRtkwrzf3bAkeNMhVA/qB5cOuu
 8E+fgDHz8sTonPHSX77w87AAap+CfQw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-CFZx656jPpyzHa0zMhDWhw-1; Fri,
 27 Jun 2025 05:41:16 -0400
X-MC-Unique: CFZx656jPpyzHa0zMhDWhw-1
X-Mimecast-MFC-AGG-ID: CFZx656jPpyzHa0zMhDWhw_1751017274
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D022E1955ECC; Fri, 27 Jun 2025 09:41:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CD40C19560A7; Fri, 27 Jun 2025 09:41:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
Date: Fri, 27 Jun 2025 11:40:01 +0200
Message-ID: <20250627094102.770689-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2uGym2hvJExWyPaTr-z2ASgR2_MlmI6psV7VNk7tIBM_1751017274
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

On 32bits ARM, u64 divided by a constant is not optimized to a
multiply by inverse by the compiler [1].
So do the multiply by inverse explicitly for this architecture.

Link: https://github.com/llvm/llvm-project/issues/37280 [1]
Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..82acecd505d3 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -381,6 +381,24 @@ struct DecFifo {
     len: usize,
 }
 
+/// On arm32 architecture, dividing an u64 by a constant will generate a call
+/// to __aeabi_uldivmod which is not present in the kernel.
+/// So use the multiply by inverse method for this architecture.
+#[cfg(target_arch = "arm")]
+fn div10(val: u64) -> u64
+{
+    let val_h = val >> 32;
+    let val_l = val & 0xFFFFFFFF;
+    let b_h: u64 = 0x66666666;
+    let b_l: u64 = 0x66666667;
+
+    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
+    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
+    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
+
+    tmp3 >> 2
+}
+
 impl DecFifo {
     fn push(&mut self, data: u64, len: usize) {
         let mut chunk = data;
@@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
         }
         for i in 0..len {
             self.decimals[i] = (chunk % 10) as u8;
-            chunk /= 10;
+            if cfg!(target_arch = "arm") {
+                chunk = div10(chunk);
+            } else {
+                chunk /= 10;
+            }
         }
         self.len += len;
     }

base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38
-- 
2.49.0

