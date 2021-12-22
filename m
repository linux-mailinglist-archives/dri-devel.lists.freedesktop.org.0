Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED147CE39
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEE010F4D9;
	Wed, 22 Dec 2021 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F0D10F8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKhPToxfBQq5pNydzHjkwk5WxJWAvq+wwjNPWe8gGJo=;
 b=fwfA3/+JcUYDaDRPmvQL+gZfFEmCNvSMwUj9fyzWioBoBC2ONl/1VSV6EuYNUbzXxeDgmk
 b7Yprf/AOETok2wlrCQHSzlNYhhCkQNTk8er6pmWi6TAUVuv12dTaJsFvo24QIeYiiO5XZ
 qlvK4BKo5eBmO5YkY70y/59wgemgXrA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-qu6fQ3bdNny2nURTts-2VQ-1; Wed, 22 Dec 2021 03:28:46 -0500
X-MC-Unique: qu6fQ3bdNny2nURTts-2VQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so528259wrd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WKhPToxfBQq5pNydzHjkwk5WxJWAvq+wwjNPWe8gGJo=;
 b=V2NIneFuk9GPKaswnVvCAIlGf9WX9hfmgbD/UT5CI90ewtsO8KlJbklEu4Md6yHWwF
 hkdT4noqtrptT1gx9ZEugKpU9TZaM9fQxnYgtk3b8NwKL2+Kp4aYHJyvWs88I9wwHIPQ
 4AZbSqjjVxidRLLOalzvQsGCYhrQZvsYK+pCAYvZg2VuzrU10pj61v8UfUdY1+8pTu94
 XyiyJ5z7bxbpnJH7LTMlMAme/kqkbaNqryr90sGVG2w6UOiDm1zxs6H5h4xbKwqjC9iF
 Ag9VykZMqznYM4nEtmojBpX5xgO4Ku6YdWDnxQ/XaaVQZGvGG1IaV2gHCJQup7dYS99Z
 ojxA==
X-Gm-Message-State: AOAM531RLr+Q5NAgSXdyFC9JMJn5QRU+tzObHLyUxoMJgJ+eK9+oTmV1
 NK0QuEdAYFkPtasY+pp7GZceD7h/Do3KHq1RWxkwft7aBiWqfKpypodpJCIZP/dEjeBsQ/1l/xG
 tGHOiqu2uTaKME/tzxb1QpUAEeF3u
X-Received: by 2002:a05:600c:2188:: with SMTP id e8mr99505wme.55.1640161725322; 
 Wed, 22 Dec 2021 00:28:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwASAq/dtsK6K6Yjj0AI3A3qYyq47cJbVrQUcbjvBZF7illfU9D4bt+Pmqd9TWF8LyyxZuyEw==
X-Received: by 2002:a05:600c:2188:: with SMTP id e8mr99495wme.55.1640161725085; 
 Wed, 22 Dec 2021 00:28:45 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/10] drm/cirrus: Replace module-init boiler-plate code
 with DRM helpers
Date: Wed, 22 Dec 2021 09:28:25 +0100
Message-Id: <20211222082831.196562-5-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Remove custom cirrus_init() and cirrus_exit() functions and initialize
the module with DRM module helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tiny/cirrus.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c95d9ff7d600..ecf2475d0f16 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -39,6 +39,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -633,21 +634,7 @@ static struct pci_driver cirrus_pci_driver = {
 	.remove = cirrus_pci_remove,
 };
 
-static int __init cirrus_init(void)
-{
-	if (drm_firmware_drivers_only())
-		return -EINVAL;
-
-	return pci_register_driver(&cirrus_pci_driver);
-}
-
-static void __exit cirrus_exit(void)
-{
-	pci_unregister_driver(&cirrus_pci_driver);
-}
-
-module_init(cirrus_init);
-module_exit(cirrus_exit);
+drm_module_pci_driver(cirrus_pci_driver)
 
 MODULE_DEVICE_TABLE(pci, pciidlist);
 MODULE_LICENSE("GPL");
-- 
2.33.1

