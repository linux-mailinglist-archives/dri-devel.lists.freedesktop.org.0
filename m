Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34439A93B4F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B1010E21C;
	Fri, 18 Apr 2025 16:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wh5NbyQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3B810E21C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744995076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Jc22vPjDGeO+zr+AJ2vzRyryOfSK27EryZ/lo0anPI=;
 b=Wh5NbyQr+/tK8y/3U/SYE3KJ5D0/cwhORguWg/0NbfVGA+VJ47KK/lOy1ibcxd2e0c5TIE
 sixkEy6F8TL7oMbjcL84UY892PmgdOTyPfC273ugXp5b3gQZ5xDiaIbYqvLmSk3yh7PlAR
 5+sn14IeYNfFrFbnDoN8YIW1TLyJNZ0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-J4wB9MzXMvi_sdC6eLbTQw-1; Fri,
 18 Apr 2025 12:51:12 -0400
X-MC-Unique: J4wB9MzXMvi_sdC6eLbTQw-1
X-Mimecast-MFC-AGG-ID: J4wB9MzXMvi_sdC6eLbTQw_1744995070
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE98B1800370; Fri, 18 Apr 2025 16:51:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.226.83])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AA7701800D9E; Fri, 18 Apr 2025 16:51:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
Date: Fri, 18 Apr 2025 18:48:16 +0200
Message-ID: <20250418165059.560503-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PU2Lcyf4VkcDkb8i0bkQKUQUBsuKvjehZEukLcUEhC8_1744995070
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

On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
to use a simple fifo with decimal digits as u8 instead.
This is slower but should compile on all architecture.

Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 6025a705530e..dd55b1cb764d 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
         SegmentIterator {
             segment: self,
             offset: 0,
-            carry: 0,
-            carry_len: 0,
+            decfifo: Default::default(),
+        }
+    }
+}
+
+/// Max fifo size is 17 (max push) + 2 (max remaining)
+const MAX_FIFO_SIZE: usize = 19;
+
+/// A simple Decimal digit FIFO
+#[derive(Default)]
+struct DecFifo {
+    decimals: [u8; MAX_FIFO_SIZE],
+    len: usize,
+}
+
+impl DecFifo {
+    fn push(&mut self, data: u64, len: usize) {
+        let mut chunk = data;
+        for i in (0..self.len).rev() {
+            self.decimals[i + len] = self.decimals[i];
+        }
+        for i in 0..len {
+            self.decimals[i] = (chunk % 10) as u8;
+            chunk /= 10;
+        }
+        self.len += len;
+    }
+
+    /// Pop 3 decimal digits from the FIFO
+    fn pop3(&mut self) -> Option<(u16, usize)> {
+        if self.len == 0 {
+            None
+        } else {
+            let poplen = 3.min(self.len);
+            self.len -= poplen;
+            let mut out = 0;
+            let mut exp = 1;
+            for i in 0..poplen {
+                out += self.decimals[self.len + i] as u16 * exp;
+                exp *= 10;
+            }
+            Some((out, NUM_CHARS_BITS[poplen]))
         }
     }
 }
@@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
 struct SegmentIterator<'a> {
     segment: &'a Segment<'a>,
     offset: usize,
-    carry: u64,
-    carry_len: usize,
+    decfifo: DecFifo,
 }
 
 impl Iterator for SegmentIterator<'_> {
@@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
                 }
             }
             Segment::Numeric(data) => {
-                if self.carry_len < 3 && self.offset < data.len() {
-                    // If there are less than 3 decimal digits in the carry,
-                    // take the next 7 bytes of input, and add them to the carry.
+                if self.decfifo.len < 3 && self.offset < data.len() {
+                    // If there are less than 3 decimal digits in the fifo,
+                    // take the next 7 bytes of input, and push them to the fifo.
                     let mut buf = [0u8; 8];
                     let len = 7.min(data.len() - self.offset);
                     buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
                     let chunk = u64::from_le_bytes(buf);
-                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
-                    self.carry = chunk + self.carry * pow;
+                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
                     self.offset += len;
-                    self.carry_len += BYTES_TO_DIGITS[len];
-                }
-                match self.carry_len {
-                    0 => None,
-                    len => {
-                        // take the next 3 decimal digits of the carry
-                        // and return 10bits of numeric data.
-                        let out_len = 3.min(len);
-                        self.carry_len -= out_len;
-                        let pow = u64::pow(10, self.carry_len as u32);
-                        let out = (self.carry / pow) as u16;
-                        self.carry %= pow;
-                        Some((out, NUM_CHARS_BITS[out_len]))
-                    }
                 }
+                self.decfifo.pop3()
             }
         }
     }

base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
-- 
2.49.0

