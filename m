Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546FB478192
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433ED10E290;
	Fri, 17 Dec 2021 00:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B5C10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9bq9vvV2NBJllKyCK/gDa1JTgmxSu2CIS04ZfQDYl4=;
 b=bfO8kJlYuARzHkXMIvI3Sh1UHVSdc++19f4EC72pHGWacV2IaMNR7dLSIQ0fgcqE59nB5K
 obvKELco7yXA+9ONtxkvwo75Wnvfpi/p7T+XITw1D4lvwOyTk/1Du8xf/6qr0zWZFce7S+
 DbH8CtJdXj7OIVG2v7PJTuEFyxqRrww=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-Z70mvbfYN72DN865T4SBcQ-1; Thu, 16 Dec 2021 19:38:04 -0500
X-MC-Unique: Z70mvbfYN72DN865T4SBcQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so153601wrd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9bq9vvV2NBJllKyCK/gDa1JTgmxSu2CIS04ZfQDYl4=;
 b=niA+xjh9iEUf9OIBDZtzMuW5jZFyRIJpatYnCPLItIqoS8Z7VPbTuaJZXtxiZ08fa0
 0jcvUFETwMUhfDP6LR43+VJxyA4N19PN2rwSAi+A/tdo9Qf4DQqVdGm+l43rfMWGCqGt
 fRR40BM+vSXRGApcVa9hu76F1UDn+mszSBM8U6ldEU1zW05Hv2s0jsPHu9YCyZAUrYqB
 +yj+BvMDnpItxMdi8pdYCvMUAB+gqUTkJrvoEyWjHxhTiVeORZUv+cQTNVqGZwPAzW2q
 b5uc8fxm2FET9YeuoOJbj172BSvoqqnhmbl6rfqPfWpCQ/Jkxod+bJav8lp++u0oLsL/
 rYHQ==
X-Gm-Message-State: AOAM530tkpyqkS2IdLZq/szxYbIhamikkuq/rAA6RNnb4mVaazDKxDl/
 vTt7A14uv+7gzewBuuetIFFCS5TP0/ldvtZPZdSMvz6vsG3GYvndy0pFJIgM4k/7+c8n/IOvV26
 CD9VnjPeEqChIl4Og07mi7OTebm5V
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr378528wrx.601.1639701483641; 
 Thu, 16 Dec 2021 16:38:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxi2FMgQ4xi2dwXnV1vvgkYz9NP1Vg1YCFodvuBQTMKjm2z7LrLCKuJf11GSfz2vZ5K5fNJDw==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr378520wrx.601.1639701483471; 
 Thu, 16 Dec 2021 16:38:03 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/37] drm/malidp: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:20 +0100
Message-Id: <20211217003752.3946210-6-javierm@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/arm/malidp_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 78d15b04b105..fe3215ec39c4 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -1008,7 +1008,7 @@ static struct platform_driver malidp_platform_driver = {
 	},
 };
 
-module_platform_driver(malidp_platform_driver);
+drm_module_platform_driver(malidp_platform_driver);
 
 MODULE_AUTHOR("Liviu Dudau <Liviu.Dudau@arm.com>");
 MODULE_DESCRIPTION("ARM Mali DP DRM driver");
-- 
2.33.1

