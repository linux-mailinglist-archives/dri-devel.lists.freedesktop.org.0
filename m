Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A17DB6B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2310D10E262;
	Mon, 30 Oct 2023 09:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C2A10E262
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698659460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/oSWn6zXYpZy9BOM4oLogaZaeF7rrl7rER8ZrPalZQY=;
 b=XZ5+URRBbSiJpCrOChg85s48CdHdi23vHHRhfpP04J8vi1sPJXc0iNfFd3x1vdX4KBe60b
 SxoJXB3ccosB2v0RhZy0uqEpOqvmN6aiQ34Webqn8mnEOjMW7SCsiodOUZGMm4Zxgc8Sw5
 fPX3qamd8uUcn7poSPn+AXWNEyAH5WU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-0rrkTqi1N5iv6UBSvw8HFw-1; Mon, 30 Oct 2023 05:50:57 -0400
X-MC-Unique: 0rrkTqi1N5iv6UBSvw8HFw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9c45a6a8832so47967066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 02:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698659456; x=1699264256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/oSWn6zXYpZy9BOM4oLogaZaeF7rrl7rER8ZrPalZQY=;
 b=DDDBmfXXYYw28jvWJnOX2urUAb+fUJa7FxYZ0EHIPIA4H8Rh8zJD4MgYzj6ZTiBxYn
 O51XussmM3JN6FFw70rmKzUA4QCVlyUrx2gEwoTIN1TR3FmyRj2il0gdR2MADHEbNMTF
 FTGOvsqSR0r4jHvrOflrtrgAKdoJN1dVWPt5VzbRkPhpKxTYtpnThtBizyZWAjOqOYkj
 ey6AqmCYquEgNX8RlrCuAYU4eNSQ5mgVxNj9C/WkrDrteEANmXa3PhvU0tJgvWgA0ZzB
 WcJCCiLD4Ihf1OlQa/ZvXpEwBGwQFXos6O9CT5acJ5yELVdTTkZaXKYcR2ksUBxoAOGG
 jByw==
X-Gm-Message-State: AOJu0YzrG7VGtVWEyBgfjsqtnGb2QqQSu1dg9ndw5QQBqlticDVaK2N9
 LMGl1xMkLTjErc9gDjCLB2YPo+je+gtQxxleuxAmep1/u/JUHx7ZqxUL8mh058E2XiZAHizFt9l
 nUAvrMa88J9ZbR5wNR8wVhZtqp7k2
X-Received: by 2002:a17:907:7e81:b0:9bd:d7bd:1a4f with SMTP id
 qb1-20020a1709077e8100b009bdd7bd1a4fmr7602333ejc.3.1698659456598; 
 Mon, 30 Oct 2023 02:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMRMtphV7L/pm2FESojpEkX3pszj2FB49P9ifh3HCWwcnJGmYxU5G5hOQexhf62fcAmQtueA==
X-Received: by 2002:a17:907:7e81:b0:9bd:d7bd:1a4f with SMTP id
 qb1-20020a1709077e8100b009bdd7bd1a4fmr7602318ejc.3.1698659456249; 
 Mon, 30 Oct 2023 02:50:56 -0700 (PDT)
Received: from fedorinator.. ([2a01:598:c850:3f34:4525:c3f4:ae24:9570])
 by smtp.gmail.com with ESMTPSA id
 rh19-20020a17090720f300b009b97d9ae329sm5763300ejb.198.2023.10.30.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 02:50:55 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ast: use managed devres functions
Date: Mon, 30 Oct 2023 10:50:24 +0100
Message-ID: <20231030095024.9808-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.org, dri-devel@lists.freedesktop.org,
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
¡Hola!
I picked up the memory-region-request-task from the DRM-TODO-List [1]
and began with this driver.

Please have a first look. I wasn't entirely sure about -ENOMEM... for
example, as far as my understanding goes, it should not be able to fail
anyways in the second call.

I don't have the server-hardware, thus, can't test it on a physical
machine.

Please tell me what you think.

P.

[1] https://dri.freedesktop.org/docs/drm/gpu/todo.html#request-memory-regions-in-all-drivers
---
 drivers/gpu/drm/ast/ast_main.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index dae365ed3969..1004c6628938 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -444,9 +444,13 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ast->regs = pcim_iomap(pdev, 1, 0);
+	ret = pcim_iomap_regions(pdev, BIT(1), 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ast->regs = pcim_iomap_table(pdev)[1];
 	if (!ast->regs)
-		return ERR_PTR(-EIO);
+		return ERR_PTR(-ENOMEM);
 
 	/*
 	 * After AST2500, MMIO is enabled by default, and it should be adopted
@@ -461,9 +465,12 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 	/* "map" IO regs if the above hasn't done so already */
 	if (!ast->ioregs) {
-		ast->ioregs = pcim_iomap(pdev, 2, 0);
+		ret = pcim_iomap_regions(pdev, BIT(2), 0);
+		if (ret)
+			return ERR_PTR(ret);
+		ast->ioregs = pcim_iomap_table(pdev)[2];
 		if (!ast->ioregs)
-			return ERR_PTR(-EIO);
+			return ERR_PTR(-ENOMEM);
 	}
 
 	if (!ast_is_vga_enabled(dev)) {
-- 
2.41.0

