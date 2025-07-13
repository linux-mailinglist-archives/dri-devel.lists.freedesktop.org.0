Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0210B037EE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAAE10E408;
	Mon, 14 Jul 2025 07:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKceVKa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC1310E033;
 Sun, 13 Jul 2025 02:53:26 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-315c1b0623cso3292319a91.1; 
 Sat, 12 Jul 2025 19:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752375206; x=1752980006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=acNe71zhPgHfE83GbVhM4d777Q2BYU21y6svlMAOGRE=;
 b=jKceVKa++K3XA0lrbkSsbxMRm8D4trvQViaEaRMtjxgeJ2ii2aiyoxo8egdrjGU3C9
 x73W7dRa8ExWIc9gQanA689rW6Fs2SJFxOFQ38GNZohk9tNFaonpKp6o8h7AMUS7UTYP
 EkKc/EGh+xSEG6o+LKiMWVCgOtPIqCw+7eVw0Ov9Z8/oAjLJPa90unR+D9YYubx6V7Ol
 /DsOn73ZGxHHrkQTEMF+32rtp2fjOsGJ6J/BqPpvMjgfHXyVrBH1s90B/RqD9J+0iOZY
 +fbNXS4lK1rSkRW0p+wn9CkR0U65Qv1GX22v32au6ZhKMoITHJy8Xi5PXhTjcQX4MvBo
 3Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752375206; x=1752980006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=acNe71zhPgHfE83GbVhM4d777Q2BYU21y6svlMAOGRE=;
 b=gjT0EjG9VWD7ZIsom62q96Aa8KFEQScVi8318712F3pyw45ejCajWUmzjK1wNAwdNP
 xoC1uLyj/0vzqzDSU6u7fFWblTPot0fefXsSq3sB6FfJjGmikn6Fw7Hgyx+MAz+lS9km
 qYTSSbgz2m2Kc6i0qPfuI6M7neIxfaHFsJlksq3pyOSTZjH7AlZwonwIrSRcKvZhHiSR
 DZwzuuch72TdjoZDLfncO0BkUUb5VVN8F6TXmpGVNoz+MSWIKsZj3nZgWsQ5pX8uMdtw
 O6f/UBNsAHA+E8FTzuS240cUbkqhfk5ijqgud3IJvjDiVEvYoY5kwAYcMKVRbsQ7K3pb
 hZjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdEXts5lFFwHoVAxqEYDcTgYPs0nHXseAvLcm8HAKotLOPcylOxkmvsa4sDDnf3RjVYWmTpfpbE00=@lists.freedesktop.org,
 AJvYcCWaT93SiBMPX7qbUPWPtWHyo4zQtrOV5bqOvlKBVQF6K7M65IdRtYWw+913SI36Busz5GNCmvadbA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpcU64iVOkMh0c2hOw9+XybKAvcUcUOYOMwfW27Y/fx4Lyy5+Z
 mDDQ139XEzJrEwBsNywAsoZo+cwf74MjZpFE+H4lomwGZMN2usbxXQ4h
X-Gm-Gg: ASbGnctwA5G9JTjFVWPw05l2ZtL+PuCFhySG7g9XOUffJp4loQcq7rVKX/hRPT9+8ff
 E7wjhvNoUtB6Rd7dtSgdeOefiVA+dtsShP2WpBmNczNWtSn3XVDCRFlKhf+uKXwP+gc1q4LcXcP
 B1Pfhqgn2nEa/ITgUNVjsiCHUIxgs4yNENs2ytHfAKb+KkUzrjnjHEd6U8n1iuSAn/4/Acs/JJ+
 tuCiefdCZfzAfHkBvuUgq7QYM3QfIzkqWl/TdB0tl8iNukcNu+PVEWaXUHh1TmORPQjtlQCBg6A
 oCPDCYbcPIBLFfyJQ77z+C4LhD7GLPx2SfNTJOb41aIF7KWZi2i1dnmG9Dw3/2eYP1ufXGyVYux
 HU/RJQHIxztxDnaynxf5MwKnR
X-Google-Smtp-Source: AGHT+IGd8q7vYPk8tC8e4wXZEeiN7rexsxjv5S+Uzeguwh00QdTa0AZAe4a4z+mwvG8FjYaTfd9Kvw==
X-Received: by 2002:a17:90a:da8d:b0:311:b6d2:4c36 with SMTP id
 98e67ed59e1d1-31c4f5ad1e1mr10884033a91.26.1752375206071; 
 Sat, 12 Jul 2025 19:53:26 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4286da3sm76345145ad.34.2025.07.12.19.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 19:53:25 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Rhys Lloyd <krakow20@gmail.com>
Subject: [PATCH] gpu: nova-core: fix bounds check in PmuLookupTableEntry::new
Date: Sat, 12 Jul 2025 19:51:08 -0700
Message-ID: <20250713025108.9364-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

data is sliced from 2..6, but the bounds check data.len() < 5
does not satisfy those bounds.

Fixes: 47c4846e4319 ("gpu: nova-core: vbios: Add support for FWSEC ucode extraction")

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- Ensure commit description does not spill into commit message
- Fix author to match SoB
- Add "Fixes:" tag
- Add base commit

---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 663fc50e8b66..5b5d9f38cbb3 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -901,7 +901,7 @@ struct PmuLookupTableEntry {
 
 impl PmuLookupTableEntry {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 5 {
+        if data.len() < 6 {
             return Err(EINVAL);
         }
 

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
-- 
2.50.1

