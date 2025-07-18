Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BEFB0A3D9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F97F10E999;
	Fri, 18 Jul 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lsdvfmTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6020C10E91F;
 Fri, 18 Jul 2025 07:37:48 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23636167b30so17078735ad.1; 
 Fri, 18 Jul 2025 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752824268; x=1753429068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F331rKpZ7Oe6FYaTJXdFG2PxN8OlPB5pXAO1vVr7BtA=;
 b=lsdvfmTT64yn7wzWDesRD9eO7Gp2ZvtJYhLGMHYNNHF/UPrNHx7ONf5HM5NEIb/qpN
 DXtqE2AntYvdNeebzJSJNhelomda7Ao6WXNIRon23rEXkFya918CPJ1Okn7cG5dyCzmZ
 VYQqSNqEGJt/S65vuj0ko86ZwtYDgY8xvrHlXoeqQJW9ImDdji9zD4OdV4W8psZEHz+H
 oN2HRg57UQukeHIQoGww2VG5wI6t3La6w1j5bB2XhVxCyjPDKjZpj8u2BzmJbMX9W2ZQ
 XMUEfT5mXXf+XZzp3ZUhwzXMjXJVWD4VukpXENZeoS90F8lhNN/+Fh4dFGGtecvpyMWw
 98mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752824268; x=1753429068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F331rKpZ7Oe6FYaTJXdFG2PxN8OlPB5pXAO1vVr7BtA=;
 b=lZOfi78UfGhMc4xKCZhiea+9aBjAh5i42256I3hcQDZ08O/54ujtSwaw5aJ3TBIa/Q
 Bz1xlU05BDkk0Wlk6Vq4LStPLMLOQna0U/50Flcu54xUl/WouhCBj+1hD0UAgaqSq3Tq
 ilwtUgYx+B2EFwNC4qGd+TtqTdBAll/rD+Kki+mTlF6adSH8r1Kh4vzki9Fku3efE8JM
 2Pt9cglCHkC5ZcMZQnIbAaXDfAQEpTfQVEZ0Yw0WW6RaIpv0bnVqnXWkP45U2GzLWeJU
 uIBFA3rMy4IMElezqxv/k/87l6gPJGBD1vmZb18NX0zVnGFIgenodt9iUYXTJoIp51Hj
 ISmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhRl3zcYxsi7PxMdJL2D0oqwI6Iy6QgviqW2f/ReB334gBBofbXWbDQyRvn6aIIvB4nQsRLh/DXrw=@lists.freedesktop.org,
 AJvYcCWAsVk04b7/CnkNDmK26ybRdB6KPcuCaUO3A0mHIxKkjkDuZ9c0dtmxTEEnSEHoShqUMuH8WAVnlg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRkRbFYXSANW3bev6Nq8ud6YCdrCIrnAjhyASx1zq1aqWVUtBO
 hb+z3hDosANeNmpcXHUtX3cn9p0Z46i44fSuSptOmoRG4p0i50RwuV9V
X-Gm-Gg: ASbGncvVcel5WNLhb1TE/ioHhZ0RXt4ynO70C7xtgMaprrb0vtyfbT1m4wiRIhqQuG7
 yzEb8GSnayxarpQ5VOPtPmAtgxpMxc4wuGJ7xKwtZTqIfmz94b1WxCXCvuNuGXygmbp0z3sWJMM
 wCVHl/h4N+glX3xYcgvf2Opz9sRzbcM15v4nS+cOXu7cal1D9l5vfE3KFkJQG2jPG31n2i6YZau
 XOgMXstUPCZGhDEEQG+UETPTRod0kFblxsnhja+SmULuR51YP8iyrT9c7reW+ou2DNcHrJlcGJw
 B0FgVib+LZrq3HdcYlUb/4+6EAPb5xAwWODuXROVDIU1iQJQBjlzumpwxV7iMlYQtNmsKEiGnhp
 6kpQrNA0fR6HJihRVZ9Fvq1Fb81zLi8EaIp0=
X-Google-Smtp-Source: AGHT+IETRPva4ck7C9Si6yZrkvK+/vXb7rDOjcKQ4Tbk1nNlqyAeaw2WVm2q8RtQKEDPzQzyQtR9Rg==
X-Received: by 2002:a17:902:c941:b0:234:c2e7:a103 with SMTP id
 d9443c01a7336-23e2572ffe3mr115592075ad.33.1752824267824; 
 Fri, 18 Jul 2025 00:37:47 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4e84sm7671725ad.104.2025.07.18.00.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 00:37:47 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpu: nova-core: vbios: change PmuLookupTableEntry to use
 size_of
Date: Fri, 18 Jul 2025 00:36:25 -0700
Message-ID: <20250718073633.194032-3-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718073633.194032-1-krakow20@gmail.com>
References: <20250718073633.194032-1-krakow20@gmail.com>
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

Annotate the PmuLookupTableEntry with an `#[repr(C, packed)]` attribute.
Removes another magic number by making the struct the same size as
the data it needs to read, allowing the use of
`size_of::<PmuLookupTableEntry>()`

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- get_data helper function renamed to data
Changes in v3:
- Change PmuLookupTableEntry.data back to u32
- Remove helper function
- Annotate `PmuLookupTableEntry` with `#[repr(C, packed)]`

---
 drivers/gpu/nova-core/vbios.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..4c8368946bd6 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -893,6 +893,7 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
 ///
 /// See the [`PmuLookupTable`] description for more information.
 #[expect(dead_code)]
+#[repr(C, packed)]
 struct PmuLookupTableEntry {
     application_id: u8,
     target_id: u8,
@@ -901,7 +902,7 @@ struct PmuLookupTableEntry {

 impl PmuLookupTableEntry {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 6 {
+        if data.len() < core::mem::size_of::<Self>() {
             return Err(EINVAL);
         }


base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
--
2.50.1
