Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3493F47817A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F8510E1C5;
	Fri, 17 Dec 2021 00:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614C10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/41J8DAM1gdd3WP+PUnIuvtC1QrJS0LZN5dpagEG/EU=;
 b=NHrCkid3B/603UjFyR6Nr+qI5qLZd+fiKpJ1Q/3kz/dwYyz3QZuWw7+h9ArX/QdBrOdOkD
 nptXdUA8X80sqKbFPXxT49CkuSZJXHvOUyPNxUdQJvh+WD09kGFDyjXFq4Lg1I21oettFS
 plXjSSp/vh23iPkrhc+n4JF3N/VciOo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-qhyq9OISNqqVT61U8mAWYw-1; Thu, 16 Dec 2021 19:38:06 -0500
X-MC-Unique: qhyq9OISNqqVT61U8mAWYw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j26-20020adfb31a000000b001a2356afd4fso139473wrd.21
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/41J8DAM1gdd3WP+PUnIuvtC1QrJS0LZN5dpagEG/EU=;
 b=CPj4KLXyeYLVD20h5V/YRtfVMNBcTJdUPJlmVjD0msLnHvU6ddfo/aQYb3uFnvuG9q
 bGoWkmadusosmoouqSFdLvCm7gr0t0ZWKosMthAgPpa2dMrT2feVNsVgUsyvgniKGRcx
 jKvtG7MFoPkLUY2RVKuY0w0654PvKytv7Xg0/lWGzkM6ctIyuMG8WI4/LRZQOUrdzlHj
 VmU4R4UNbuC2l4NFiQsAz5xBOWZojbSGrgGQWmXsBJBDOYBdLWp8npOZI5b0dnrfMBBH
 A7PA+UyAQYaq5iErcBhD/sy9fPPbLt7WY9HxPH7OxBt5H0+FrLWvF8wMdrnETe0rBiTz
 Dlnw==
X-Gm-Message-State: AOAM53055E9LlL3kd4dW3c3cQrKcLXX0SCWZ6qRm4+TcU8i/3I8z2bVQ
 NEPmUn/vL4aXBXMKcnz6dP/TdASLQj3PRRoUiNWDGSqQRpTiF1zny95JA0k9V8EJUhtEn70mg8o
 a8SgbsO2cSLfJMYeOnqOXu2/UDhwq
X-Received: by 2002:adf:cf05:: with SMTP id o5mr362390wrj.325.1639701485486;
 Thu, 16 Dec 2021 16:38:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjZVTrbXpQQ+uX2glLN271I37ZMYitMAf7//HnyLzVu2ZhFdMQrRZkMmi8So3CiwT6jRlLCg==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr362380wrj.325.1639701485328;
 Thu, 16 Dec 2021 16:38:05 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/37] drm/atmel-hlcdc: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:22 +0100
Message-Id: <20211217003752.3946210-8-javierm@redhat.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 1656d27b78b6..3c01ede792bb 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -833,7 +833,7 @@ static struct platform_driver atmel_hlcdc_dc_platform_driver = {
 		.of_match_table = atmel_hlcdc_dc_of_match,
 	},
 };
-module_platform_driver(atmel_hlcdc_dc_platform_driver);
+drm_module_platform_driver(atmel_hlcdc_dc_platform_driver);
 
 MODULE_AUTHOR("Jean-Jacques Hiblot <jjhiblot@traphandler.com>");
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
-- 
2.33.1

