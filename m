Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD47BE560C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184A810E0F9;
	Thu, 16 Oct 2025 20:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eXVICUMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EA110E0F9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760646311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3VuXIGcz/r2zeKQR2M44CEMWNcOxAJOoKMcLC5g8uJE=;
 b=eXVICUMIpbgafm30M3BIcn14ZxAQLnRufP6q6eAOUFtLwGZHgKp6Gpqz3AXUD7ArfWBSTT
 AHHlJpzUQ6VMtF1uZ3e2APUAqH5ZVtrUH7RRyC8M/le598rf5fQ6YVlQYpaacG5kqkM+9f
 nqdM+T99vDdWOaNPBDQbsZuvlS1VMgI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-_dl4DnHEN1CP2xMtHN0itw-1; Thu,
 16 Oct 2025 16:25:06 -0400
X-MC-Unique: _dl4DnHEN1CP2xMtHN0itw-1
X-Mimecast-MFC-AGG-ID: _dl4DnHEN1CP2xMtHN0itw_1760646304
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 402111800D81; Thu, 16 Oct 2025 20:25:04 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.252])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1D64F30001A2; Thu, 16 Oct 2025 20:25:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH] iosys_map: Make dst a const in iosys_map_memcpy_to()
Date: Thu, 16 Oct 2025 16:24:55 -0400
Message-ID: <20251016202455.2750217-1-lyude@redhat.com>
MIME-Version: 1.0
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

A drive-by fix I discovered when writing up bindings for iosys_mem for
rust: while iosys_map_memcpy_to() does modify the memory pointed to by the
iosys_map, it doesn't modify the actual iosys_map struct at all.

As such, let's add a const qualifier to this function.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/iosys-map.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 3e85afe794c0a..0ececbba04b3a 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -278,7 +278,7 @@ static inline void iosys_map_clear(struct iosys_map *map)
  * system memory. Depending on the buffer's location, the helper picks the
  * correct method of accessing the memory.
  */
-static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
+static inline void iosys_map_memcpy_to(const struct iosys_map *dst, size_t dst_offset,
 				       const void *src, size_t len)
 {
 	if (dst->is_iomem)

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.0

