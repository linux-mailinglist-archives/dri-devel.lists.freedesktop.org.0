Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7A0A6ADCC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFAC10E6E0;
	Thu, 20 Mar 2025 18:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d8ci0dkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119C110E6B0;
 Thu, 20 Mar 2025 18:54:02 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-85b44094782so34872539f.3; 
 Thu, 20 Mar 2025 11:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496841; x=1743101641; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tgy450ZES2ez3J/XkWzr8/KGFStO5bXfg+gAZCZdzzk=;
 b=d8ci0dkFrBYDMJDdWUDYEUzakNQv4FBy9TA89cvbqYTOZGC+ROJOmcE3HX+eGbtNK1
 kecPesAb49wdLMUOM+EPj/zgAjjXEEQrGdcuhpJgEX1rwsiiNbXWwy4mYx42PtyQ10SL
 nklsNtZ9RvSJpMq/OY7eOodaROdZAiBEGjGqqRY6JUGQbZ2KRFmQni5MKHZJXdeWvv2j
 WnoDAsyYeimrFPt75hVqn+Y2nCcAzlTVqAnJOQyigJ5bnrhxYvTqya84YVfMqH1DUTsT
 4sPuEZlZmfRCd2w8nOOW2j6zRjV8MPERsBEGXZydWEboh4yMi/574VA4iy+pzSBX8Q1G
 uYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496841; x=1743101641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tgy450ZES2ez3J/XkWzr8/KGFStO5bXfg+gAZCZdzzk=;
 b=IBBBYXi0EAjC73NxvxZV/RFqfK0qBvaNwlvr2LKg29TQRRFC3tbHP3HP1AlupwhJVJ
 bs3mld4L8dPnMgxaylQ8QNUOMhWgWta6CvEPIuFL9dkCITHTMq4VMc4frmY9ew+8w9e0
 0uBA1zUrxjbe3GGevOz8JvxbMgU7SRDdkmU+VB1WilERY4VcZeMcRvJV/3VepBVm14kG
 vjCPny0c5Li/W2RJYonxLMle1z0YnUeMlk631DhpnicaZQVZ77A9HZ93FPWI/gG8iRbb
 2vMEC7PUrbqcnnMTtS2bmv1JbPDV8Pry5caRHIbMWvzxR5QBRPJQOQzHivkrLl46PppP
 Nnug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT5momNWrtJNQjDReE9MNoenVP0NA67BPVaGTSLE0Ct3QWGIT8Alv7SzjtPeT5Dw+vWBblwoeQ@lists.freedesktop.org,
 AJvYcCVtyuQ5I+LM39WvLQRkR6BZ2hoaX8OD342CBjOlD4/2APtMJqamQ2GAQ8/Lfdspm2wDY6cz0pJcUd/s/pNlQwWngg==@lists.freedesktop.org,
 AJvYcCW6/tcgl3M4d78xnSTCyRGojrQ9gfj2E5ZoUGdUNPBbWl2UKcRumpvPS4uzzBr54NvXAMxSFgAGtxaf@lists.freedesktop.org,
 AJvYcCWrfUZleEOGHpA03lRlCJLzWzh/kznUD9WI2zyQSHa9WcEAxGnrHrhU2+JVJYUB/Y7PxCM12Rx+JhviK6tCpg==@lists.freedesktop.org,
 AJvYcCXW8EYjTlAnmdBclXi2qHkavaQDU9/jgPFyR28vnDWMYaz1JlSEQvIAkgEH4cXKOkhYZ0MCdTtvQJEO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4/X4nxPnoOY1MlWNhYy6TReSq4ieh6FfVfTc3PdGdmW+c24Rk
 RCD2xgWeg5awxwhtOaFUm/ZVk2Q3c1VtS4HPzOp+uykrrHHvOaoM
X-Gm-Gg: ASbGncuSAablBx6shBhvGqhHYABejKHT0oGQPygplpg1pzpz9eaoKQRuesvTfsVtwdM
 TvqDI1qm5tNPmhvkO2EDqybpdANwSWoCRZBUMg0tKHYH06Oi8b6fLDEwIujujPSZs109uzljx4r
 JoDWEp7VOYAvu8tmyj+WMyGBKjnABa7CvXvXmXe0sw+TjjeSKB3ZuJHQ6ELnw9SFi+r+eJUYF5/
 YSaiHF1hL9CNs13ZdbKBesIqbxHGvZRcACIgwfsokrHxSPe+8S2Oasgn6d8tu+Xonbtsje60O3Y
 UDETWG3TWJsfOv8Ud4OlCVbYSEIX9t3JbEcGyuDXlWpRQKOHrkCHZzl5ZutBVgAXQjykNh8mngc
 UBlRmedJEbJS4
X-Google-Smtp-Source: AGHT+IGBUJj0c0mSBRBgJSPDvGPw3Gh4UAbdxFlYAyO26LwXLIgnhQFAIJTPVSWIGcw7/GhzghR57A==
X-Received: by 2002:a05:6602:c89:b0:85e:201e:3e35 with SMTP id
 ca18e2360f4ac-85e2ca18937mr56876739f.3.1742496841207; 
 Thu, 20 Mar 2025 11:54:01 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 50/59] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Thu, 20 Mar 2025 12:52:28 -0600
Message-ID: <20250320185238.447458-51-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
index 267f082bc430..6eaac728e966 100644
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
2.49.0

