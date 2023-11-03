Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4E7E081D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 19:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEBB10E18E;
	Fri,  3 Nov 2023 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0537810E18E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 18:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699036051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tCQTZTtBGHUcOzfNPoWKgA+n3Zp3rKItoxbSjEs0GKE=;
 b=OZjZmTTX7uYrOVtK+8J/CM9966SQD5dAOwNVXUvD2AUM0+UCZfr5O+sRpfOelvGd59Tf0B
 b5X+mfDlFur2aNFPQfRaqnoFv5WSYbBYY03vVL8UKnL5htWXA2tPSwdQB9iYaP8ebd4fkx
 a5WUmtmaZElM/ZXfCAl6FXTIj7uan6s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-j4F9IfymNP6ukZF082jTOg-1; Fri, 03 Nov 2023 14:27:29 -0400
X-MC-Unique: j4F9IfymNP6ukZF082jTOg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53f8893ddbdso454201a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 11:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699036048; x=1699640848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tCQTZTtBGHUcOzfNPoWKgA+n3Zp3rKItoxbSjEs0GKE=;
 b=G5F02br8JrAn/z2vYiL9/3oVKQTEc3zFCZM10U6Ia2AW+FcNLjOd92xDSYFr7GDoBg
 kJ7AfLA3jjT4jstuGiNRgF2nrs1uy7qfkuugLVuBgotE83ujr4K2LCw3LxNpzTZE0kgl
 5z9ycyUDW6xiyXpvXV8s84Qv6Oh/XyWZsDzB8S05U6iSHvuEwTt4b24VK5knfsD/zj/o
 nNNeiGOIOfowk5UHlbfRExP/FahGz5wl0TKUd5FlS2dbNgU5UBHwEN9aVDIDH2jLgFL+
 6i4yhDkC4SE2Q8HQipl/TFff3IIFoWTFaeo8SBeFzZbnBP/U0sRk4wpyYp7m6kRV3/bJ
 vLrQ==
X-Gm-Message-State: AOJu0Yy0QGpVPTroZnf3zwis18cML2vlzEBXBCrsasDWaVVBrIv1+7QS
 SC/Y4WmQrGfTDccV7329xQrxfUvYhZjq3crkak8er6339+Z22db7bihXu04d9uz6Bm3BVLMZrkz
 UAOn6+zP6CY9T2GeadXEVjnhp6ZMo
X-Received: by 2002:a05:6402:f0a:b0:544:3966:6904 with SMTP id
 i10-20020a0564020f0a00b0054439666904mr873188eda.2.1699036048601; 
 Fri, 03 Nov 2023 11:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/afJoWCH0B69Fkx5QSe1FwXqsA2+HGUFWSQOKo++oLG5JDy6JNH3qK4i1hA0DdwxaL+aeiA==
X-Received: by 2002:a05:6402:f0a:b0:544:3966:6904 with SMTP id
 i10-20020a0564020f0a00b0054439666904mr873173eda.2.1699036048291; 
 Fri, 03 Nov 2023 11:27:28 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32d1:5200:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a50d597000000b0053dd8898f75sm1250103edi.81.2023.11.03.11.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:27:28 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/ast: use managed devres functions
Date: Fri,  3 Nov 2023 19:25:43 +0100
Message-ID: <20231103182542.97589-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, tha ast-driver just maps the PCI-dev's regions with
pcim_iomap(). It does not actually reserve the regions exclusively
with, e.g., pci_request_regions().

Replace the calls to pcim_iomap() with ones to pcim_iomap_regions() to
reserve and map the regions simultaneously.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Changes in v2:
- Remove unnecessary return code checks for pcim_iomap_regions()
  (Jocelyn)

Thx Jocelyn for the kind review
---
 drivers/gpu/drm/ast/ast_main.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index dae365ed3969..8b714b99f9d6 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -444,9 +444,11 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ast->regs = pcim_iomap(pdev, 1, 0);
-	if (!ast->regs)
-		return ERR_PTR(-EIO);
+	ret = pcim_iomap_regions(pdev, BIT(1), 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ast->regs = pcim_iomap_table(pdev)[1];
 
 	/*
 	 * After AST2500, MMIO is enabled by default, and it should be adopted
@@ -461,9 +463,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 	/* "map" IO regs if the above hasn't done so already */
 	if (!ast->ioregs) {
-		ast->ioregs = pcim_iomap(pdev, 2, 0);
-		if (!ast->ioregs)
-			return ERR_PTR(-EIO);
+		ret = pcim_iomap_regions(pdev, BIT(2), 0);
+		if (ret)
+			return ERR_PTR(ret);
+		ast->ioregs = pcim_iomap_table(pdev)[2];
 	}
 
 	if (!ast_is_vga_enabled(dev)) {
-- 
2.41.0

