Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FA926135D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A776E86C;
	Tue,  8 Sep 2020 15:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ABB6E866
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:19:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so19590428wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5HUPZey23fpZ7O0ISBcnmoDeQoSvAOa5PK6DE6zp90=;
 b=ORyY4ZqfDcrdXYjsjTXTEtrUaQe1RJldbGO+pqANb858Ya+JjB4iH1ncEJwkByFE3d
 cvYPX+8JBt8+2Wov00EdDqAMHvKSEsRwmOVae7HKFzAi8a9LM7+VE9WE6w4pARa9Ox1x
 /ahRnbLC4gcZoGEORtUuxneW2DLP1pdu8Ol/m53qs6fnlTkDYEodVKtywKTDBQzApoU1
 GQlb0LTW7BmwiHtiu2r/3kR4FFdu4bFblA3jYjH2vVIAP3WNcxTFgYY3IKzl4j7ojkEK
 mYooRqXepx9HdE+veBwBnbnNIubUixtUQd1iCTaBJhk1jxmYyWfkQCIc1ZTaHlMQiRg+
 ITOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5HUPZey23fpZ7O0ISBcnmoDeQoSvAOa5PK6DE6zp90=;
 b=lneJ82Ip80onsssGybx5qKh2E3O275LIFlCzkiXNPWPtxhHDBI+WHdxo2+X36HilTz
 0gOZ/yaxjcmPmmv6zcD52H4rj8j3kc70+OcAJzRmiYOP/7HY8QbV7etbUfw1K1jSMUBt
 PYC2xwXA+OfYGd3xHDXLP9JPrRakNM/mFvjGCoBNdlFSNTIhT0fshFfjFBov14KeW9FI
 IGGjMUgrYP8YUgOyb5Hf/n3WQda6SdMGYznAtWQ+6Ifoo1Kwrvq+xkPL7isqIjg80xO6
 F3eTptgWEig20d0AQeIVRxMN/A8fSGrc371ElVa2pcmxM81+BBhcMkK4rNt/6ZufHUME
 Uw2g==
X-Gm-Message-State: AOAM532ML0YK5s0T7ySYpSSQEqcWx1Jc9d3giL0sz4P1Kuz/vcPQ5iHT
 hU9SZZ5MyGKyskY7ljRYyXqraw==
X-Google-Smtp-Source: ABdhPJzcrzBmN5nUV5nRaVbaFFXi/hKg4wRQw/mW6OU7rGvxpIpYuoFbrS9YqopA0v/jdvJCmxWXjQ==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr119063wrw.223.1599578340777; 
 Tue, 08 Sep 2020 08:19:00 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 2/5] drm/panfrost: add support specifying pgtbl quirks
Date: Tue,  8 Sep 2020 17:18:50 +0200
Message-Id: <20200908151853.4837-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a pgtbl_quirks entry in the compatible specific table to permit specyfying IOMMU
quirks for platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 953f7536a773..2cf1a6a13af8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -70,6 +70,9 @@ struct panfrost_compatible {
 	int num_pm_domains;
 	/* Only required if num_pm_domains > 1. */
 	const char * const *pm_domain_names;
+
+	/* IOMMU quirks flags */
+	unsigned long pgtbl_quirks;
 };
 
 struct panfrost_device {
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e8f7b11352d2..55a846c70e46 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -368,6 +368,7 @@ int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
 	mmu->as = -1;
 
 	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
+		.quirks = pfdev->comp ? pfdev->comp->pgtbl_quirks : 0,
 		.pgsize_bitmap	= SZ_4K | SZ_2M,
 		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
 		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
