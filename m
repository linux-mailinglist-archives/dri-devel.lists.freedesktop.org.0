Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B009BC4F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 06:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2E310E513;
	Tue,  5 Nov 2024 05:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F+AwVop8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E826A10E514
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 05:54:07 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7ea8de14848so2979364a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 21:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730786047; x=1731390847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4arZk0p0VPlza97zof+KayaWUIzMuwjvTBGsx2BEfA=;
 b=F+AwVop81yZLSSC9XV0Y/f72WEbcd0ONl+l57ygwb/d5mghUCcyCOjz5WC+P3MlNXa
 zMbbu8P2rZ/7iFlBmD+hF8zMcm1UftcYontfEaWtvY+/aO5AUUBigj2bMuJnagbKhAkO
 IXdYCKhtaUYsOHh0SDB+aQSyZvzI4YqPxFeWLLmTOTcaBYejzY82J6NE7gR0EOibkQ9i
 wK+NkQNYgnYkJEazQRIYvV5ei4jSk1+gXKA/I72Ej0hh0i9rEdyw3mRyajt+Ua0dlnsh
 RzW291WFnxr+Vhwwa1uDN1Rjz4h38cjn820Z6DFKI4wGQzDtqnsgRUPtr/Z1a+c41V8l
 UWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730786047; x=1731390847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K4arZk0p0VPlza97zof+KayaWUIzMuwjvTBGsx2BEfA=;
 b=sg4UW9bPL/H5K+UZxyhsDjFV4QxHZb52RFZ6aQvds0W/hrHMtXAUHDKgehSqw8LmCI
 CRP0DMArLih5ryqKT5bPIP8frniGfR6wJOUdPxEtgSsZlZpsaWsm31JENB4HUcuTyfEB
 ZByUX3fOrlAL6s8dbQ2Nv9PKDtPE+zHzPgLi1xsOmWVIGWe4JOemrQ6hM6+E3stdaxKW
 tp7r37wm3+dphoDb6XDk+L1B1uzKTzZ1UeZ8XPSSakzeLETKOP4hK/hvHjb9MH4yJwJW
 rPmCS5q7CSJNd+70tBSwHgch1gsKm4rc8Dq1ofu/AGcC3fiKAszrTuEo/qptjQNJKN3/
 kvEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2x2UaCHhp62dPfWdIOfMXvM7URVdwBev0OT0yqW2MkjFGFqpMgQu+12ZecMwdx8vBPWAkB1IOz+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtWpFPCta7J1nqlHZcULm9cdMu3e95FT8TYtJ3NqSQSjijQw0n
 XXe+ZOg1Bolp0eYhnSa86VpMm2P/V+BYKei+xTUIf8QE+uyKWoar
X-Google-Smtp-Source: AGHT+IGC9kl31Sp+055bbsciqTzeV//KgUd64QAAm85Mm2OmpR+CzCYrU//EVOzEjFD2+vVhJCcjHQ==
X-Received: by 2002:a17:90b:38ca:b0:2e2:cf5c:8ee8 with SMTP id
 98e67ed59e1d1-2e93c186141mr24223930a91.12.1730786047333; 
 Mon, 04 Nov 2024 21:54:07 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa4570fsm10952198a91.30.2024.11.04.21.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 21:54:06 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ryan Walklin <ryan@testtoast.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 2/7] drm: panel: nv3052c: Rename rg35xx-plus-panel back to
 WL-355608-A8
Date: Tue,  5 Nov 2024 14:52:30 +0900
Message-ID: <20241105055239.1577275-3-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105055239.1577275-1-kikuchan98@gmail.com>
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A panel assembly is changed in the recent revision of Anbernic RG35XX
Plus, so the `anbernic,rg35xx-plus-panel` identifier is neither suitable
nor unique for the panel anymore.

Fortunately, the panel can be distinguished by a label printed on the
FPC cable, so use the label "WL-355608-A8" as an identifier instead.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 06e16a7c14a..2da1e924177 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -917,7 +917,7 @@ static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
 static const struct spi_device_id nv3052c_ids[] = {
 	{ "ltk035c5444t", },
 	{ "fs035vg158", },
-	{ "rg35xx-plus-panel", },
+	{ "wl-355608-a8", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, nv3052c_ids);
@@ -925,7 +925,7 @@ MODULE_DEVICE_TABLE(spi, nv3052c_ids);
 static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
 	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
-	{ .compatible = "anbernic,rg35xx-plus-panel", .data = &wl_355608_a8_panel_info },
+	{ .compatible = "anbernic,wl-355608-a8", .data = &wl_355608_a8_panel_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nv3052c_of_match);
-- 
2.47.0

