Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C4A7766C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE7810E097;
	Tue,  1 Apr 2025 08:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HnoCPooj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02B10E50B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:30:21 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-3014678689aso7419414a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743496221; x=1744101021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjoRRxErQAE65f2vVZqYUjTQAES/NXv5oq8jYX02KT4=;
 b=HnoCPoojV3AWm5ecn4E8duWMYeVr4xdG7TKRrdJ+8JmK8tS/WMmiI3sy9dr3HZ7mDD
 MceWscpP55xM8QEKZ5eqMu80DI3qnSLSl9QjBNCVkXcyXlcmv8SCLltoTEY6/wY42SYH
 L8YRkaVBxNrFIaIl8g0yn0ARZpTKscmNxJkzeXswHWISAL8UrYZrjTWDS94hqzSx38CZ
 utjCTVfFOf7D9nnMpqHuchPqbgaHVfNhAPdtAb/fbWiTM8oTIivhz1rsWq6CA1I4m/Xz
 gHbyKhz/60kulWr4A/T3V6pMhGWgpXspxLxjA+6r+8r3v8Gy8ZUGIzZTSPVI8kHdE5v7
 9+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743496221; x=1744101021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjoRRxErQAE65f2vVZqYUjTQAES/NXv5oq8jYX02KT4=;
 b=WRAyi3J4dK/t6K0L0geRFzwrLHfC0hd0B3AO6uBUs3zm94nRgUzQsOtMdWe0zqxwMZ
 ZhO1MhRRpwpaDgjC2iQbfbbrr/9Ens4K345xN8hWDkU0zPaxgtEIHFoFWqS4qkRunEtM
 /xrI19fa31henqbGYUm/79lxww9Ll6zpEpLlfr3cuMqKMa4LtyqLFNxa6iMiilJ3Zk8H
 SiFzGXN/fBAN9tH7K2XPupzYu6mg2tXu7Qtghkbdcq0um6XuzuwfVabfCYC7J04rMU/r
 HIw+FzkQ0Ks6UTch4AHDHzUwB6NVNzQHmUJBU54dX9smRcxG5XooEsTQ3ubdBApyhibH
 p0kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCWghs64B31bwD/jckDo3qHWjXmR+P0OJdRYPTQEsNbsDxip2V7sTLzPDBjqOncZRZLRsLpikUBL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybn8O6fLO+T/8/ZIbSgb5DdRFc7s7om11I+dCv1c8Yh5RBGAYy
 HALizlR54ghmMc7aUZ+6QLbx4S21djRrfs3BFiqfWX6852gW34z+2UemljVuOzk=
X-Gm-Gg: ASbGnctrqQgc4SiFuZQHhkd0bwbauoCZkNIBFfYrUN7/DjfRU0E7uzMAp3PizOE7xH1
 Gu2OBhlpQy1U63IbBx2Lry0xu0AiycA90/bYyEF1OPQ9sANV6MV59dQnizzRXQsB12jLVmmtoRf
 f+gd1LTzTdJ9uGi5NYeOvM629EPQRNF6aODd6MCACyEyX2Gx/z8JQy89bViPu+WihG+HVBILV/N
 TuP+gwCd690xxZr6vIU4bC2fMolPqcDXOTlRKFJ2/lAMgxnOl6xbJmhKj7aOkRvnrUb9GcwdJxl
 36YIpKvQMBjkVeU63eMbdn9F9XOdmCSJkulw7jzS2h4lHjcouQUcZPz1/oPKwGo/ejOhKDA=
X-Google-Smtp-Source: AGHT+IFWAAHV082oTdqQGEjBX414lW/d/FJAUbsjDbzy53pI1JmjcwR0u4fqgwsDs6QJqtqU53fJMg==
X-Received: by 2002:a17:90b:384d:b0:2f9:9ddd:689b with SMTP id
 98e67ed59e1d1-3053214bfd5mr14011201a91.22.1743496220800; 
 Tue, 01 Apr 2025 01:30:20 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30562c6d29dsm505191a91.2.2025.04.01.01.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 01:30:20 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Markus.Elfring@web.de
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 16:29:50 +0800
Message-Id: <20250401082950.21698-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
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

The function wled_configure() uses devm_kasprintf() without checking for
allocation failures, which could lead to NULL pointer dereferences.

Add proper error handling when devm_kasprintf() fails by:
- Returning -ENOMEM immediately
- Ensuring no resources are left allocated (none need cleanup in this case)

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
V2 -> V3: Fix commit message and verify proper error handling with
resource cleanup.
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1

