Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE2478170
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F9710E1F0;
	Fri, 17 Dec 2021 00:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924010E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjSPCkabpBJdylyAzsXsZ678mzFYTORqarlksLIyBUc=;
 b=YfWlNWcTLTLN8VNykMeXa06QE7uWHWxxQ9CMBl3+er9iK2PLcsdEULn5iA8bJ/PQHIxoQU
 yrVnxBCOMH4NI1weQoBLiImpNnmfPoMR8dlXdTImWgZc9rzt1JxyHA7TPF2sxjdtsDqCd1
 aXFw5Fm5QvmldYbhM9pzBz2nSjOlrIQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-BRCGNpxcNj67ulHE4x6O9Q-1; Thu, 16 Dec 2021 19:38:07 -0500
X-MC-Unique: BRCGNpxcNj67ulHE4x6O9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso2065604wme.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjSPCkabpBJdylyAzsXsZ678mzFYTORqarlksLIyBUc=;
 b=0wSD6a+gyPOikLKTcMylQWa+DadQewbYS+jemtJsqmrSoelbYN7xbuOhbreBs9kqTY
 aOrdYb3pcYnJISYHwaQoqPu0BdlKtL7MqMsPQ80H5ktPUEBKgbHA9kjMNoe4wfoEN/ja
 AMYv7uq1//GBkuV/T+aMnzC3jBlz62zZ+cx3j+sj8JnIlB2jqyQK991vkkCVZPvvZWml
 EwFErF7cqPktMns2kjbB5AzBL9gR2xIyZ/H0C/Ck8DYFZA7U+f+uaGX6d9s6BD+h9EH5
 yZI+rZf0UBTmsWu+yg6KecE2zfBrp8DUjrFSfH68IYJizN4ieiZeawC/w1VZhpDT/+ul
 /i6w==
X-Gm-Message-State: AOAM533nGU+vFGN97pRryYlGypI4MkWT4fKAEKbcbbXpC0/Y4/PqgZJ7
 qMM699Z7LwvmZycs5CzLF3fAbY3Hx1ygKQRbHVKu0BUUVsH2qNsWuKdRFHTJzvoZQHD1k/21JRQ
 4cWmf47Sq3w6ZFPrjpP6VQyRDYVmO
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr380233wrv.371.1639701486672; 
 Thu, 16 Dec 2021 16:38:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV0faymaogyu1Cxq+hBi0+XoYVAsqf6T3xAeGgzAF9pGm4bakxsL0yZU74Co8dJ+wx1cPcxg==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr380219wrv.371.1639701486464; 
 Thu, 16 Dec 2021 16:38:06 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/37] drm/fsl-dcu: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:23 +0100
Message-Id: <20211217003752.3946210-9-javierm@redhat.com>
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
Cc: Alison Wang <alison.wang@nxp.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 660fe573db96..b24265f69523 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -368,7 +368,7 @@ static struct platform_driver fsl_dcu_drm_platform_driver = {
 	},
 };
 
-module_platform_driver(fsl_dcu_drm_platform_driver);
+drm_module_platform_driver(fsl_dcu_drm_platform_driver);
 
 MODULE_DESCRIPTION("Freescale DCU DRM Driver");
 MODULE_LICENSE("GPL");
-- 
2.33.1

