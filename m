Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A54781A3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7894C10E2CA;
	Fri, 17 Dec 2021 00:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90310E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CH/yLDN3aiuSoANBKfiRVu9bkbDIfJXNva4DO0r+zh8=;
 b=LsTxCZGIeIJhFoINtIobY/ItjDX+7znR0QfU33S+HacKvACC6sV8A62jA8OsrrppzLRa8j
 Fs9NpnmgzwnicxtaYXhJGZXLfOmweryJTyI3JjaipIHDdbky3RTNAH2i1WLNfMK0yXwTdN
 3aSlJ1xpJRd/Pi9A/IOnv4OzEWWZiM8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-kEAwegJPP2eqWstInUP-tA-1; Thu, 16 Dec 2021 19:38:11 -0500
X-MC-Unique: kEAwegJPP2eqWstInUP-tA-1
Received: by mail-wr1-f70.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so160493wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CH/yLDN3aiuSoANBKfiRVu9bkbDIfJXNva4DO0r+zh8=;
 b=Wop/ZLC6yjyyobT0ElwvxDFA4V3N+os/BYNqaalEjtLDTFWelSJmMJQcx0KEb7ZB/Y
 Xw4wiW+3Y18H2/aWZaLUHVSDXRhSXbAR9rGADXakg2B+zlqSUJLtCGf57eaIzDjX+Cpm
 FjnmkN5IaXoSJ4xyzlfrPZFC9NQwYudygmMCjUpYI3rpZZ2Ppwc0vohxf5Tl3MR2IxA/
 SInloCyPn6l+C78Imgo8VnRkUhxaWSkQyopQe+Gn+KIHNKAzOiNcKqTOilrbKJaopAuc
 Ms07UMo3NjOQVgvzakJ7sA2huZIW2kcfgVqlA0dXzS2aoRqiwabB5zGnwp85tRaw5mf7
 6/Cw==
X-Gm-Message-State: AOAM530p1grCd0ocoDWqSySfl8l6sjcGaMoyqYrObpm82L3Bu0OWbjP+
 9yzgZPRSdOXLt+shzyevPV7IQGh9/ylQVWnQz8FsMI/9vg3kQQyKeQZ2hIItGU4bFVh1+7J+fF1
 OqerZneXpu292qAswEDrFMHFFa6qt
X-Received: by 2002:adf:e482:: with SMTP id i2mr403187wrm.284.1639701490397;
 Thu, 16 Dec 2021 16:38:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYwZOIGG0CxZbG8jz1k7y09aVqYCd8qTtTPMvByStDzhdRk6KnTXyYvLLH536sDgjoNdiQ5A==
X-Received: by 2002:adf:e482:: with SMTP id i2mr403176wrm.284.1639701490222;
 Thu, 16 Dec 2021 16:38:10 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/37] drm/meson: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:27 +0100
Message-Id: <20211217003752.3946210-13-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/meson/meson_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 80f1d439841a..36a107e9bafa 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -541,7 +541,7 @@ static struct platform_driver meson_drm_platform_driver = {
 	},
 };
 
-module_platform_driver(meson_drm_platform_driver);
+drm_module_platform_driver(meson_drm_platform_driver);
 
 MODULE_AUTHOR("Jasper St. Pierre <jstpierre@mecheye.net>");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-- 
2.33.1

