Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A046447819C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DAE10E2A4;
	Fri, 17 Dec 2021 00:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE43010E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XeEAGbUCQAagra5UKTXhHNdQiD7z7drBXuFqxobwP+4=;
 b=V94JkTK8JB1wETMsrP8PQCzbV3PxPTdj4NH0vMpB/fu5/Z/iMVzcIcmkqyO2Tr5BFiWt+m
 dMkpQcJkCDd63dT/+xG43mfa2NSfHRoHka4oSknHctpKlhsrZrHM4G0WtwuZgcF9qGSxbZ
 MJl9rMqKHDRwyY6ESQ7N7wsvdUFQoRI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-8HamlIfuOkChdrQd9dTWTA-1; Thu, 16 Dec 2021 19:38:16 -0500
X-MC-Unique: 8HamlIfuOkChdrQd9dTWTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so399136wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeEAGbUCQAagra5UKTXhHNdQiD7z7drBXuFqxobwP+4=;
 b=uK9JsYjIlm/Cqrl9XrTirX1ZsmAjnA7aDj5KMXIsMxHsmebLLUirC3tSsCRY3KUa/Y
 i4L83BPkXu0rhlMt1Tk7C+AdtqxAWtyb0MbYyIxyc48Yi80Pqr2Fj0Gq99HoOa5W1byb
 9y8PV4croiLGfVMMGMd7D0hi5pDcphWYzSH/h20rix0xQc7ow7P/O3JMf2NgUlW2huwA
 XOoYT3H33GAOiXTnrSi/6jTUBCmBGViwjOuQ64VdvircVRxYdHW9ziy4t8Go0/ynzjgN
 hU62eDGW4C7YNU5Gg4BVd6Z845p1thzwLqTvzTck+2EFEBHzswiwIFIuLJFTS9uphRCO
 pnlw==
X-Gm-Message-State: AOAM530GOe7y9PRa4GGCeB7psAHMhH87oTxhustrtuMzrgcjzeEo64yh
 ENuVGdHM/MH7EPTBCY2OEvDQVmabQ6n3dmX8vAG0yIOru9I+uwPfss1xVaJbQDYPL4oO1oX0+Ab
 NKfOk0PZ/yaP0CN0nEiJOGCkyK8xH
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr368957wmq.122.1639701495548; 
 Thu, 16 Dec 2021 16:38:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk/ca36+xMPaSJuWujk137KwR4n8yjHrZOssdyt6YhVcuIuvZitOhSJ5wHtWfLmwbHmAOEyA==
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr368945wmq.122.1639701495384; 
 Thu, 16 Dec 2021 16:38:15 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/37] drm/tidss: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:32 +0100
Message-Id: <20211217003752.3946210-18-javierm@redhat.com>
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomba@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tidss/tidss_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 7c784e90e40e..121fd413a75e 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -251,7 +251,7 @@ static struct platform_driver tidss_platform_driver = {
 	},
 };
 
-module_platform_driver(tidss_platform_driver);
+drm_module_platform_driver(tidss_platform_driver);
 
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
 MODULE_DESCRIPTION("TI Keystone DSS Driver");
-- 
2.33.1

