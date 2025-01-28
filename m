Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1603A20F37
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF0710E298;
	Tue, 28 Jan 2025 16:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bT+Y66sT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEF310E298
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738083187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bzZqdfWddQbHUECEg4094v75joFV9Fo55eFZWFq5P60=;
 b=bT+Y66sTqWhgvuKVQqWcjvYk4KGX+n51XwuVkq7JX8l3e3ep+BhbDHxdxkJE+IgCOV2aO7
 obkX8unDawYGhZ9AxhzfQ+Xskl8xIv6jLuZxBqc6P2wAmURRk1YB9J42jOFByh2cUmrFCB
 ++GsP5upYqnD+0uFsjfJQ4FDFD5qMdk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-LcYvOsPoOCiOQ_eDyL1zrg-1; Tue,
 28 Jan 2025 11:53:03 -0500
X-MC-Unique: LcYvOsPoOCiOQ_eDyL1zrg-1
X-Mimecast-MFC-AGG-ID: LcYvOsPoOCiOQ_eDyL1zrg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A728318009C9; Tue, 28 Jan 2025 16:53:01 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.110])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 58FE230001BE; Tue, 28 Jan 2025 16:52:57 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2] drm/panic: Better binary encoding in QR code
Date: Tue, 28 Jan 2025 17:52:10 +0100
Message-ID: <20250128165254.893204-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

The current encoding, is done by converting 13bits of input into 4
decimal digits, that are then encoded efficiently using the numeric
encoding of the QR code specification.
The Fido v2.2 specification [1] uses a similar approach for its
QR-initiated authentication. The only difference is that it converts
7 bytes (56bits) of input into 17 decimal digits. The benefit is that
the algorithm doesn't require to split input bytes into 13bits chunk,
and the ratio is a bit better.
This improvement was proposed by Jó Ágila Bitsch in [2].
drm_panic is still young, and the QR code feature is not widely used,
so it's still time to switch to a common algorithm, shared with a
widely used standard.
I also changed the name of the url parameter, from zl= to z=, so the
website can keep backward compatibility if needed.

[1] https://fidoalliance.org/specs/fido-v2.2-rd-20230321/fido-client-to-authenticator-protocol-v2.2-rd-20230321.html#hybrid-qr-initiated
[2] https://github.com/kdj0c/panic_report/issues/2

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * Add comments for the SegmentIterator numeric encoding. 
 
 
 drivers/gpu/drm/drm_panic.c     |   2 +-
 drivers/gpu/drm/drm_panic_qr.rs | 108 +++++++++++---------------------
 2 files changed, 36 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f128d345b16d..ab42a2b1567d 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -499,7 +499,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 	char *kmsg;
 	int max_qr_data_size, url_len;
 
-	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&zl=",
+	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
 			   utsname()->machine, utsname()->release);
 
 	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 09500cddc009..477de4101c3e 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -13,12 +13,13 @@
 //! The binary data must be a valid URL parameter, so the easiest way is
 //! to use base64 encoding. But this wastes 25% of data space, so the
 //! whole stack trace won't fit in the QR code. So instead it encodes
-//! every 13bits of input into 4 decimal digits, and then uses the
+//! every 7 bytes of input into 17 decimal digits, and then uses the
 //! efficient numeric encoding, that encode 3 decimal digits into
-//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
-//! into 40bits in the QR code, so wasting only 2.5%. And the numbers are
+//! 10bits. This makes 168bits of compressed data into 51 decimal digits,
+//! into 170bits in the QR code, so wasting only 1.17%. And the numbers are
 //! valid URL parameter, so the website can do the reverse, to get the
-//! binary data.
+//! binary data. This is the same algorithm used by Fido v2.2 QR-initiated
+//! authentication specification.
 //!
 //! Inspired by these 3 projects, all under MIT license:
 //!
@@ -26,7 +27,6 @@
 //! * <https://github.com/erwanvivien/fast_qr>
 //! * <https://github.com/bjguillot/qr>
 
-use core::cmp;
 use kernel::str::CStr;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
@@ -296,35 +296,11 @@ fn version_info(&self) -> u32 {
 /// Padding bytes.
 const PADDING: [u8; 2] = [236, 17];
 
-/// Get the next 13 bits of data, starting at specified offset (in bits).
-fn get_next_13b(data: &[u8], offset: usize) -> Option<(u16, usize)> {
-    if offset < data.len() * 8 {
-        let size = cmp::min(13, data.len() * 8 - offset);
-        let byte_off = offset / 8;
-        let bit_off = offset % 8;
-        // `b` is 20 at max (`bit_off` <= 7 and `size` <= 13).
-        let b = (bit_off + size) as u16;
-
-        let first_byte = (data[byte_off] << bit_off >> bit_off) as u16;
-
-        let number = match b {
-            0..=8 => first_byte >> (8 - b),
-            9..=16 => (first_byte << (b - 8)) + (data[byte_off + 1] >> (16 - b)) as u16,
-            _ => {
-                (first_byte << (b - 8))
-                    + ((data[byte_off + 1] as u16) << (b - 16))
-                    + (data[byte_off + 2] >> (24 - b)) as u16
-            }
-        };
-        Some((number, size))
-    } else {
-        None
-    }
-}
-
 /// Number of bits to encode characters in numeric mode.
 const NUM_CHARS_BITS: [usize; 4] = [0, 4, 7, 10];
-const POW10: [u16; 4] = [1, 10, 100, 1000];
+/// Number of decimal digits required to encode n bytes of binary data.
+/// eg: you need 15 decimal digits to fit 6 bytes of binary data.
+const BYTES_TO_DIGITS: [usize; 8] = [0, 3, 5, 8, 10, 13, 15, 17];
 
 enum Segment<'a> {
     Numeric(&'a [u8]),
@@ -360,13 +336,9 @@ fn character_count(&self) -> usize {
         match self {
             Segment::Binary(data) => data.len(),
             Segment::Numeric(data) => {
-                let data_bits = data.len() * 8;
-                let last_chars = match data_bits % 13 {
-                    1 => 1,
-                    k => (k + 1) / 3,
-                };
-                // 4 decimal numbers per 13bits + remainder.
-                4 * (data_bits / 13) + last_chars
+                let last_chars = BYTES_TO_DIGITS[data.len() % 7];
+                // 17 decimal numbers per 7bytes + remainder.
+                17 * (data.len() / 7) + last_chars
             }
         }
     }
@@ -403,7 +375,7 @@ fn iter(&self) -> SegmentIterator<'_> {
 struct SegmentIterator<'a> {
     segment: &'a Segment<'a>,
     offset: usize,
-    carry: u16,
+    carry: u64,
     carry_len: usize,
 }
 
@@ -422,40 +394,30 @@ fn next(&mut self) -> Option<Self::Item> {
                 }
             }
             Segment::Numeric(data) => {
-                if self.carry_len == 3 {
-                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
-                    self.carry_len = 0;
-                    self.carry = 0;
-                    Some(out)
-                } else if let Some((bits, size)) = get_next_13b(data, self.offset) {
-                    self.offset += size;
-                    let new_chars = match size {
-                        1 => 1,
-                        k => (k + 1) / 3,
-                    };
-                    if self.carry_len + new_chars > 3 {
-                        self.carry_len = new_chars + self.carry_len - 3;
-                        let out = (
-                            self.carry * POW10[new_chars - self.carry_len]
-                                + bits / POW10[self.carry_len],
-                            NUM_CHARS_BITS[3],
-                        );
-                        self.carry = bits % POW10[self.carry_len];
-                        Some(out)
-                    } else {
-                        let out = (
-                            self.carry * POW10[new_chars] + bits,
-                            NUM_CHARS_BITS[self.carry_len + new_chars],
-                        );
-                        self.carry_len = 0;
-                        Some(out)
+                if self.carry_len < 3 && self.offset < data.len() {
+                    // If there are less than 3 decimal digits in the carry,
+                    // take the next 7 bytes of input, and add them to the carry.
+                    let mut buf = [0u8; 8];
+                    let len = 7.min(data.len() - self.offset);
+                    buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
+                    let chunk = u64::from_le_bytes(buf);
+                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
+                    self.carry = chunk + self.carry * pow;
+                    self.offset += len;
+                    self.carry_len += BYTES_TO_DIGITS[len];
+                }
+                match self.carry_len {
+                    0 => None,
+                    len => {
+                        // take the next 3 decimal digits of the carry
+                        // and return 10bits of numeric data.
+                        let out_len = 3.min(len);
+                        self.carry_len -= out_len;
+                        let pow = u64::pow(10, self.carry_len as u32);
+                        let out = (self.carry / pow) as u16;
+                        self.carry = self.carry % pow;
+                        Some((out, NUM_CHARS_BITS[out_len]))
                     }
-                } else if self.carry_len > 0 {
-                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
-                    self.carry_len = 0;
-                    Some(out)
-                } else {
-                    None
                 }
             }
         }

base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
-- 
2.47.1

