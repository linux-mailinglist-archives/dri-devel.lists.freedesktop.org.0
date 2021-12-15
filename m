Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA1474FD8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3089FEC;
	Wed, 15 Dec 2021 01:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D53510E128
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlDMfQhcV7AZSs8IvwxBHAeCaGQ4pJFItbhLR/NMUvk=;
 b=Q5F2VDaiePZIRSg3doTrUb1N1eoCJMjDUr/J/u+8in+9FwlV2fjM3mJwlOvLPsMGBLqq/b
 sniV6wsGy7MjzVhm6pdFBgijLGfXKIPHwS5wrozNSnlWIc8isCLBhWSL7XLoEUVYvifG+G
 /gl468C+69u0BYfRUgw/jjxNLb9pugo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-zKCNdZZZNtu0PKBU2KefVw-1; Tue, 14 Dec 2021 20:01:12 -0500
X-MC-Unique: zKCNdZZZNtu0PKBU2KefVw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so13883705wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QlDMfQhcV7AZSs8IvwxBHAeCaGQ4pJFItbhLR/NMUvk=;
 b=jhYQk21oFLyg1ZgOpkmcXCUin9WpJMeQrPQKYzstDhBvGh4UL6xZAZ6KwcB+iqPDM/
 LM98KbrE0hTN87BqtORiKg1Rs5pLzFX/JkldgBvEImifQ6+Yz1dOaSD1qHWe+60h7Vn3
 LcQh5AbEmE/hJnMBUy1xUypH2jF36x3TD5/HhIVumzMKqH6skaQj9Kqdm0sCUKgUk7pm
 3E0tDx6AWyrMnFkoSokWUSBaQlf03eGseyV25rvJBK+2zpSiz5Po9imtNSiOsfF+BL+z
 nUPgjQSsGWbYiFtIkd2EPp3QqSI4aeWptYe9dSVmA53HYfDtJK7vFtwrYeb0Nwh6NffB
 PHMQ==
X-Gm-Message-State: AOAM5320q65udaCMR47lII4DGM73NwWtN6rLKWtKGXCj3Net93UOStJM
 N0U57Vu18LWtLXrV4eNK+QmQXklhecTQRWCMh8ftZktN10PW2riaLkbNBqvyVEpsIXbbghJevv3
 cy3dJkUwjv1Jh8cM9Ng2/kJCt9yeb
X-Received: by 2002:a5d:4883:: with SMTP id g3mr2181225wrq.590.1639530070946; 
 Tue, 14 Dec 2021 17:01:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqBTmUVUxMpnj2vnusf3lwGrdrHWm0F0q/QNuFSPpSWq/aWByz7IaWGYOGpolNWIglB7ngdA==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr2181210wrq.590.1639530070724; 
 Tue, 14 Dec 2021 17:01:10 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/60] drm/mga: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:32 +0100
Message-Id: <20211215010008.2545520-25-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/mga/mga_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_drv.c
index 71128e6f6ae9..dc4154d39133 100644
--- a/drivers/gpu/drm/mga/mga_drv.c
+++ b/drivers/gpu/drm/mga/mga_drv.c
@@ -87,6 +87,9 @@ static struct pci_driver mga_pci_driver = {
 
 static int __init mga_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	driver.num_ioctls = mga_max_ioctl;
 	return drm_legacy_pci_init(&driver, &mga_pci_driver);
 }
-- 
2.33.1

