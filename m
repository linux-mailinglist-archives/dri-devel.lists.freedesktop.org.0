Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA6478180
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B305A10E22A;
	Fri, 17 Dec 2021 00:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E1110E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCqrlpOxkFkN8jRFGgvU6Wypx9DvPQbRgHTOxVpgDMI=;
 b=SKaV1Tgbqht9VvjOgDgmxMYJ6nE7StDrTtB0Y/wteFDg8CALdvRKNw2HFIlMpYVruqWPKq
 ojr25XdPeiMxWed1ycMzIeLTiaBIkR/A+wQuEUV+7jFmtF/8XX6ZGwe3THWOgKiCAI5a/5
 eL1vCl99eYJ5J7776l0VMaR3G7GWUBk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-HFFKZ3zHMtK5XLjSp6gKaw-1; Thu, 16 Dec 2021 19:38:02 -0500
X-MC-Unique: HFFKZ3zHMtK5XLjSp6gKaw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so160307wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCqrlpOxkFkN8jRFGgvU6Wypx9DvPQbRgHTOxVpgDMI=;
 b=FaGnkwQiGIU6dPHKH6fqMxU7g85BK7fC24NvO0c8/vVGS300fGZI++tOpCITi4sGZH
 TFrpYXMlB2U2cUi56p7QWxLHNA0tdEfpQvZW33mNddq6IDWAnBF95mg3COgpryLQfi/X
 8Mo2NbmWpHuN/qjFr0N1lueaQzmVkqY1BScyFnvwld40RvithBfhMxy6TUVbQx3WVDTZ
 YmFUX8UH5J8iB555/HYb4sm0SBMrp2wYEhrt8+OLpikcOKz2gp6SJ/AqTw9smvSs/HFY
 yyc+OgpWkAraHaDV6ADYt/2LI56MjYV+iIi9cMt1Ou7f6DHdUJgRQFlwfK+oHUzHiP5y
 jzoQ==
X-Gm-Message-State: AOAM532IUW0QqFIoKnGrciO87zMk3h+60EZr/k7YsGDo9k7Q13b0ocyH
 bJYuqAdy7RuCYRQAGp3hLLl/IcpcB1Wo4bk1MsAgCFbo0IBvWfXFGVchtJgh0EB5dsb9zAuUw34
 VAnBZDMV0GofpzXiQlesGgj0xhqED
X-Received: by 2002:a05:600c:3d94:: with SMTP id
 bi20mr7294642wmb.83.1639701481696; 
 Thu, 16 Dec 2021 16:38:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPcJfWzzRuydjtFYXtlvszgaSB2rBou3sc3ogRK24mXfEMwess61xOQD9S4/Y6RJZWLXpwAQ==
X-Received: by 2002:a05:600c:3d94:: with SMTP id
 bi20mr7294633wmb.83.1639701481467; 
 Thu, 16 Dec 2021 16:38:01 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/37] drm/komeda: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:18 +0100
Message-Id: <20211217003752.3946210-4-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
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

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index e7933930a657..0d426240b1c9 100644
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
@@ -198,7 +199,7 @@ static struct platform_driver komeda_platform_driver = {
 	},
 };
 
-module_platform_driver(komeda_platform_driver);
+drm_module_platform_driver(komeda_platform_driver);
 
 MODULE_AUTHOR("James.Qian.Wang <james.qian.wang@arm.com>");
 MODULE_DESCRIPTION("Komeda KMS driver");
-- 
2.33.1

