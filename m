Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A20474FBC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3F10E13D;
	Wed, 15 Dec 2021 01:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89D910E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90fdRUH+BwC8CK1ZHj3eypDb3h6VgZnI8Gytvn0sj5U=;
 b=WY1aQv9P2k4dHCffJW9VgH7Qx740kEee3hz5fFrrdmu6ptLniVlOIUw5bJlKV4EL8ugJ0T
 LPGxtcxyVWQ1zNNhBDK8rFk/TtfaEDsAZplLDH2w1Lq92IKgifttr8Xux7hpdpVbQPOwa9
 iFgrBVWCqwvGFtkPKYfCd8C+rjvQQBU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-Ue3372DkN6eOZPkld8XXgw-1; Tue, 14 Dec 2021 20:00:52 -0500
X-MC-Unique: Ue3372DkN6eOZPkld8XXgw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso1098687wrg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=90fdRUH+BwC8CK1ZHj3eypDb3h6VgZnI8Gytvn0sj5U=;
 b=7Javi2aF7Ip2G0Jn7QkCtVCc3cwQ5jlmdG9cVtXPaUcfdESY8DLqpcKBjVBpE9jaXo
 0y46ERTm1vL1Mau/UU388EBcF+h8w+1h+TWUAep/x0bIe4zkilyo4cAuZpDUslT+vbfB
 jzYB65SZ/tbEVGDFqHpfoUypCAA8BF8MA56zwQWMICbuid3F2k2HcO9meSH6+qBzODyY
 bcyhcV32X4CZ4NaFF7HuauDv20bOmOJjLVHLbxC+alefvKzRuNWBUy1qrOHHXFDRs076
 kP2bevupbuBs4QZHi24dIxvJlOVKE9mp2Hsk9QjvyINtIvp/FoHJwha4+LhigDLRC0r6
 uURQ==
X-Gm-Message-State: AOAM532BfaBxjewWWwArmzI+f9Gl9fzqrQEMZLLtk26G5BrA7XMcFvwi
 L/nTC0FcPVAT7Bim/UlCEs1dE2SQNSNZIjUfH0b73b1JF0OH/X1MEKzhWWnLSo83Zb2fvfy5Jto
 dM47t6aNqlYEdzGmIC+IvoFsGRAJj
X-Received: by 2002:a5d:5850:: with SMTP id i16mr2168127wrf.410.1639530050701; 
 Tue, 14 Dec 2021 17:00:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKtKciV2mCOl9DWsiZcW5uvMrGAi6mSHfnjdBtzkqkSsjfHoUdtZOKfa4UaV1nJfnxdVeKPg==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr2168113wrf.410.1639530050540; 
 Tue, 14 Dec 2021 17:00:50 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/60] drm/komeda: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:09 +0100
Message-Id: <20211215010008.2545520-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index e7933930a657..4f6d5c2103ec 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_of.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
@@ -117,6 +118,9 @@ static int komeda_platform_probe(struct platform_device *pdev)
 	struct component_match *match = NULL;
 	struct device_node *child;
 
+	if (drm_firmware_drivers_only())
+		return -EINVAL;
+
 	if (!dev->of_node)
 		return -ENODEV;
 
-- 
2.33.1

