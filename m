Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77252A1C1A5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D4B10EA62;
	Sat, 25 Jan 2025 06:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i5WnFGyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD37410EA85;
 Sat, 25 Jan 2025 06:47:36 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so8478025ab.3; 
 Fri, 24 Jan 2025 22:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787656; x=1738392456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ql8+Sd28U3OYErawdU0P9/UDn3jtrynMdSWwaBGt8hk=;
 b=i5WnFGylTSX90O486mpTy+uW0424hlvhmO173bRfpJ2uhKZO9mGO3NgObl13hNCXKN
 O2eyeq9gitYbdw5ShW4lTJFKKPjDdg09MUgohPos+jIIIqjNOiIKF2NvyDvIlWKU+Sqs
 YxaRbehOfbooYmSHjQ4fDs57OXA1O8takCOr+0zSlqX8K5C/x4qkPnxl2EfIGppWsKBA
 skwtlamP85wy/RHJB+UYWkW3zXLW/G33OjtbL+iaVSKWZOQcEqLWwv+t3VzfbEicx2NZ
 YULveDFdQvzCFJnTM5R9hONqwe2ZKHXn6+mwIHIUmQraxJFbUYMHTwXWLPVfcnx1Q9la
 Rc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787656; x=1738392456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ql8+Sd28U3OYErawdU0P9/UDn3jtrynMdSWwaBGt8hk=;
 b=Rv8xTZ0lKzWIJNMyJ5aN0xw6OjSjHsrV0A4w46wXuZzxyl22GBlQUpc5lbuJMwMuby
 vPJUt3wWFeCXpUz2yymQdPpb3pdjuN/Pg+p5DxYqZzzzokNHMe7fKDutC7JJA4E0iaFY
 CHR5iSdbl1jwBQB8UxRgSHI4MyEBJXWOh50eOqo2tJvY4puFrR6HsfTOx9yh8mmSmJAo
 vM6ebHlctYOF95AFGdKmjZTCA9CTIB3vk9KzsV3Jb9u8fEHgJgju7ppbVK0NNDhfl/po
 aKrnFI5+NM2KNOlBxfTLJWPpYr0oHGvGahGDSkoaa4Z+DZmDhOiO2rQdNTS2XuBibqiu
 cFMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVu/eDXoeEml4a8osjaUlpCuLKXwYbpC6u7FXnU+TCF37otRUG5rcZHDnZReft/A/n6aerw54ksEqz@lists.freedesktop.org,
 AJvYcCUYXNyGi1ecaCl32XYomFHiN5mhkr07QJLjiG7cWx0WSJ3XT/eCE2EtSKxScmm6qIBe5D2W5F1pa2EP@lists.freedesktop.org,
 AJvYcCUfl3UWWgJFJ0P/SbVRbMufsVTRAAOwjCdIflMCotu2TGcNFWm4HTCCvqKAeEVQ5HcwxbNq9ZprRiRLaVP87Q==@lists.freedesktop.org,
 AJvYcCUpvmFr9MnqXno3c1InTDGpLjI258si70LDlVpTWo/LimY7Q0dnlCzg8XptX5dpi6DpfvuFeEgC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDvqU/0Nh64Cf+4wodBkFdszEBYiz3sKhzDpShpd21fr+2cJcy
 IW58hBqYHn5KYVs6a3ncOZzrsvWLxt/98MO6fdIq84qNSjOI9Xrj
X-Gm-Gg: ASbGncsoQVUkflTWCPiAfqaJfZy2PS/np2FdsfjG7tAevO0oqmMiQguyuBHl/DcvdWA
 aqJGaTjC/WJmS+UtFBwYorF6+Q5ER7uyWGK2lCcizo8tB+J9IVQFlmoIr/QzRoBUfDmRZEmgWfG
 dl0ySjdl8yM9eM5XiKx/BVF+hFFZ/PfyTdsDjIDrQ6YRQ/FB52vHnnVer42dEGVCTs/8FWtfOgH
 V1uf6IIGBkisTsHWUom0rsisjQSShM/EEcoKk3MrGPv85AViOmcdN5wveNPr9wCSuI+hTECj4dM
 pr8cKDFlk7ynkw1e63rObtLhOMvn3c7RrX34ew==
X-Google-Smtp-Source: AGHT+IH2IBog3sKmGnBbGJ0PnP3Lo2liPfO+4K6LPzzZwjG/QTxkHqsi6rm8EDeKjpBGZ1861EYtWQ==
X-Received: by 2002:a05:6602:3c3:b0:84a:78ff:1247 with SMTP id
 ca18e2360f4ac-851b6286c35mr3044514639f.9.1737787656003; 
 Fri, 24 Jan 2025 22:47:36 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 55/63] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Fri, 24 Jan 2025 23:46:09 -0700
Message-ID: <20250125064619.8305-56-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 5e958cc223f4..beea273df8cd 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -253,6 +253,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static int radeon_pci_probe(struct pci_dev *pdev,
-- 
2.48.1

