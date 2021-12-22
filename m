Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53347CE48
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ED51126ED;
	Wed, 22 Dec 2021 08:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777B11126E5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YX/sIrrqWUDik1PzndjmJVQyO+z161qCpfbNGHekPD4=;
 b=fk2GzClkdrq2Lc0KMQbPTdK9zoA3TYLAJYxQeoE6TH7Ctd74pabVA5c4WbH+SWg3ypuH1w
 /HMLmtMSZGKninP9Ym40fHhvVSEKKS4GULSIBzFvO0uBmun3y8RXEhnXWUOF8H55S+z3aO
 vJ6ryua9wzzR0vtLxsbxhgd4A7CbEdw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-9vE-08swMES09Qh0XECtKw-1; Wed, 22 Dec 2021 03:28:50 -0500
X-MC-Unique: 9vE-08swMES09Qh0XECtKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so403001wma.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YX/sIrrqWUDik1PzndjmJVQyO+z161qCpfbNGHekPD4=;
 b=S39XSl68S53e3r/3f/cBqSp4b/6AWkJ32b+hroddFv34S4YkGcGVjqLLRpU+/5JafJ
 6C8HeyY/krVqRPsWFRmaNG3fYts6bnec8A/khp7zqm/2pdbVk1wUvJr7ImyWFdjRIBwa
 kz+szSn7kvM/0Gz9kBrmOm90ivqgCVmRiofX4AraUcbYIm1Y+NlOn5h3vDjSio5e2NlD
 6laVpmPme9/bUiYG4lmIT4cOyDn4k1NRABvOJidQNHimdnfcd17jJJhIKvmk2mMmc4D7
 24tGOfKfPyKQrglwkpNxqlEnXwt6c/ZV2FpN+tSSLyCtvkD1RKD501ZKvhbgBSnkLpJk
 qf4g==
X-Gm-Message-State: AOAM531QjUx8GqvT6d6DD63oiYnU7iISv3JuTB3uW0tMbM4oZ8Q4d5ft
 6HQVsCTrYVia5fEKqu2nNy6pOBdWCwgxxznwY4mCKmWCmNbG8YgtCtYZ1QXAVLJLawbaCEOEGcs
 XofuudNWtreDU7wGGGND5DVanM7PN
X-Received: by 2002:a5d:5310:: with SMTP id e16mr1288218wrv.91.1640161729535; 
 Wed, 22 Dec 2021 00:28:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqScG9KfeV/wbitdFv1RY0/fBhHnWA+ZQcrjuEC7jBkboX0U40jvqhJQ1jShPeLro0YydqwQ==
X-Received: by 2002:a5d:5310:: with SMTP id e16mr1288212wrv.91.1640161729359; 
 Wed, 22 Dec 2021 00:28:49 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/10] drm/komeda: Replace module initialization with DRM
 helpers
Date: Wed, 22 Dec 2021 09:28:29 +0100
Message-Id: <20211222082831.196562-9-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace module_platform_driver() with drm_module_platform_driver(). The
DRM macro respects drm_firmware_drivers_only() and fails if the flag has
been set.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index e7933930a657..51e51ff299b7 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
+#include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
@@ -198,7 +199,7 @@ static struct platform_driver komeda_platform_driver = {
 	},
 };
 
-module_platform_driver(komeda_platform_driver);
+drm_module_platform_driver(komeda_platform_driver);
 
 MODULE_AUTHOR("James.Qian.Wang <james.qian.wang@arm.com>");
 MODULE_DESCRIPTION("Komeda KMS driver");
-- 
2.33.1

