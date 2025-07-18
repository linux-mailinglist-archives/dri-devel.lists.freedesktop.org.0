Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F94B0A3D8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB1910E995;
	Fri, 18 Jul 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JQCAzwGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECC310E91D;
 Fri, 18 Jul 2025 07:37:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-236192f8770so12984095ad.0; 
 Fri, 18 Jul 2025 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752824239; x=1753429039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ai6AIsNYmiqglCkswHUmAaEoqz48shBaAddMej2UzY8=;
 b=JQCAzwGC9VybZZqv1F40r6LfxbDoJaPEMIp+nTU43XtR+cWUWQES7+M0XEvmvh0Y8r
 +XgwUNdX5Ai/ahJpEHXvP6NOD7RT8YKj8ZxWnx43iFTXzCHhxCCrQA7UT8WWICqbww8p
 NYOtWzh5kERTovVsptjpneN8ECDNr2zo+RLjslP4dPhH/285eeYrExK/+u5BShMlbac6
 T313rPH6p4JfPjH81M2Moh3ELt7vwaPzUWU2v5NDJwf548owguUVgAknUgCOZLLUuJnw
 wgumt40UsgLyFCn0quH3Jk3vB4whlPfwuaZS3zlQu/NKd7rU1VO80wYCycdoNlF7InYB
 8G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752824239; x=1753429039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ai6AIsNYmiqglCkswHUmAaEoqz48shBaAddMej2UzY8=;
 b=JTFd0KB8MPoBwIR+qx627rY0959GKM1yZW1uyHgQGuvWMp2XczsMYPI5FjnKINYuvh
 wBz8mqqQttqwf/ETpSeDgu/h0adCPHkRUJ5l7yaJYfT+jX6m678IsHNN1iwDmS0bgjM4
 8N/zTjTA8HIJMECqy8gd2vjKZb8Pb6rsXbLi+lTcni+mZHhlQQGeZbDfjRUbGFT9umjp
 i/D+TNIHIAv5zYGGCufTbod2lyMLtj9JbcYdg5UOuDhq/vHNguCqw5IPaeA4Z11I+E7u
 7uJV6zGYFc2b/ezrLgSEeLnqx/AvwmDYs4943IgAfhsWsEA5wpLNAl699ImZmsyPlx1P
 qCUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDNsFWIeIHVlxsJDRAswlnn9BQnYJZsWviZ/8eaimdiqODbKAf55g71pwwqc4AyluwLIdrNWAu9Q==@lists.freedesktop.org,
 AJvYcCXZGQv4L/gUKZWE3OjHEHFQwjJf8w4k4DTniYATTbNlXQHGHVXsJMT2I2BlsT5Q1sHQQhKWbRURmCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw69QBlcCJh1dgUJu09o3qpWBt/DJxAf93XyeKyQy6Dzy4HcT5a
 Y1OCdvHHKJJc8UQs+4A7jEXpSiE8vww9Mh8aNFj+8TlbrcdH7IrTSnWmWYdlxMk5KOg=
X-Gm-Gg: ASbGnctUC7ohIWCIV/P/CqnuUphBjflNaw/jIM71eCHvUk89n9hrX35pKn0VvxuJgMK
 +ZoyIjaMxNXw9aWNcK9bafvttecpNSq9GWf1Q6RZKI49mflo1Bqy/r4m5PCT1N6gkjPQR/8KkKJ
 /52/szbw8zWp9ykxP4aBBvwx6CIjWvFBEYXSxLgJd705Y91L8jig0wNW8fFGmxfbk8DAfRraL13
 OWntr7TLqezxbCbVa/bVn0uJkQ8Ow4+b0JYIP8492CnhYzEaRB8GnZ+r805GbDY4Lj9H8EbTQGA
 AQew1f4tw4p8g+L64rJggCBzL4ctgx8Rh5OGCAwJDK3753nZ19NxCFVIUS/0Ea0k1CmdPsnUL0E
 ecqP+CwhPMR6veaVUSI6QoqfP
X-Google-Smtp-Source: AGHT+IGhzhjEyANqqp1/SDgKHIG6htiJ1z7iWroAuAfjCn4qbOsU8XvNCKF51G1XeSxmyeC5vQFokA==
X-Received: by 2002:a17:903:19eb:b0:221:751f:cfbe with SMTP id
 d9443c01a7336-23e2f73fea7mr100230355ad.19.1752824239054; 
 Fri, 18 Jul 2025 00:37:19 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4e84sm7671725ad.104.2025.07.18.00.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 00:37:18 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: vbios: use offset_of in
 PmuLookupTableHeader::new
Date: Fri, 18 Jul 2025 00:36:23 -0700
Message-ID: <20250718073633.194032-1-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

Use the offset_of macro for each struct field, annotate the
`PmuLookupTableHeader` struct with `#[repr(C)]` attribute,
and add a TODO message to use FromBytes when available.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index a77d7a4c8595..cedfcf3476bb 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -893,6 +893,7 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
 ///
 /// See the [`PmuLookupTable`] description for more information.
 #[expect(dead_code)]
+#[repr(C)]
 struct PmuLookupTableHeader {
     version: u8,
     header_len: u8,
@@ -901,16 +902,17 @@ struct PmuLookupTableHeader {
 }
 
 impl PmuLookupTableHeader {
+    // TODO[TRSM]: use FromBytes::from_bytes when it becomes available.
     fn new(data: &[u8]) -> Result<Self> {
         if data.len() < core::mem::size_of::<Self>() {
             return Err(EINVAL);
         }
 
         Ok(PmuLookupTableHeader {
-            version: data[0],
-            header_len: data[1],
-            entry_len: data[2],
-            entry_count: data[3],
+            version: data[const { core::mem::offset_of!(PmuLookupTableHeader, version) }],
+            header_len: data[const { core::mem::offset_of!(PmuLookupTableHeader, header_len) }],
+            entry_len: data[const { core::mem::offset_of!(PmuLookupTableHeader, entry_len) }],
+            entry_count: data[const { core::mem::offset_of!(PmuLookupTableHeader, entry_count) }],
         })
     }
 }

base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
prerequisite-patch-id: 6f9311de987d56f4313d5fbdd85ed8c48a44e78c
-- 
2.50.1

