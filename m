Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6F474FC6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B859710E149;
	Wed, 15 Dec 2021 01:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E29110E135
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPwbQSjTLtGQ2bSf5dJaXmd35YFe+1ZNVqX51ENv6p4=;
 b=AWdprE7AOqhyo+SJe3m0CJJSAVVbEvDO4Us1L+XsBHsbscnm7F5znD4SEtsuA29nLKM+LN
 JqFdQpHKUa/p4zB9wGHlKKd6bMncRu8F/RwwzNGgJ/s2z0iEymHujoLJZDSqMfvkPH50aM
 vZmtTnTE0rPhsi/1BFvKgKsRZvqQeWY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-_sr8v2U5PA-gKTzMcmdSSQ-1; Tue, 14 Dec 2021 20:00:57 -0500
X-MC-Unique: _sr8v2U5PA-gKTzMcmdSSQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso5390279wrx.15
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPwbQSjTLtGQ2bSf5dJaXmd35YFe+1ZNVqX51ENv6p4=;
 b=ea+ajUYi1NFuC/4dDNuXMRCu/pJHJpgIllN6mI06EkDf3sTr0/+kR8qQv34KH1jZbq
 F8OehV9V1ZcOGsCISUpFrI5k2ZqXcqb1ylQJN8Allvki1PckWYxj8hWHQd+HHrkp6O0q
 qgD3mEKmilwEQmBI4JLiYWrcvKlNWtpAOhUSfUrEQtsX8yzhUB68GDF73HjJpXubxC8w
 wH3O8XMXHofEquOXuHXcD+Q7SuQB8fmTcwXkaixaWJ879xak6cpG6zz9Ydy/pkR/cuTD
 3LXe2elVwMPin9mzEHfhGhxUSs/glGt8HBw9l4XR1++fJoIi+8xD5Uvge/9vnqToheXl
 YBoA==
X-Gm-Message-State: AOAM530p3aRwdM/sht/CGOj4gp9Ifvhb7YXF7lL0/Szm77Y0zXXFAu2z
 0QoZHY9S3oQFGY9mdC3caJyvsCwcec/ToPSCb2soz2EMsmMSc/DFN5GR3B1sjS0Q2KKlxrp1vcc
 YEHCHBIsl4M/61GNdrEhFpZG7JrnQ
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr2328312wmb.14.1639530056104; 
 Tue, 14 Dec 2021 17:00:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb0sf26Iq2p48wbNys/WmtOwDWHzEtvhQlwIT5GTeLf4E/dLNHCaaWeJfxWgYit2n/LHRiWg==
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr2328297wmb.14.1639530055884; 
 Tue, 14 Dec 2021 17:00:55 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/60] drm/etnaviv: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:15 +0100
Message-Id: <20211215010008.2545520-8-javierm@redhat.com>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
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

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7dcc6392792d..58b092248f7b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -635,6 +635,9 @@ static int __init etnaviv_init(void)
 	int ret;
 	struct device_node *np;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	etnaviv_validate_init();
 
 	ret = platform_driver_register(&etnaviv_gpu_driver);
-- 
2.33.1

