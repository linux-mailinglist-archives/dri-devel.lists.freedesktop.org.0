Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A326C3FC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C706E956;
	Wed, 16 Sep 2020 15:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C016E952
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:01:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m6so7324277wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvushcHgW5x8Ci13qV/eVljqWihhBxbnLqYrlJGnnQM=;
 b=aIi8RU3GfifGkaYbMW1MYLTxAkS9nN6U2v50gcwQKZKksSLDZajirW7gQTn2LLnktm
 CyI0tpHPNTv19Qc5/cJj43pTaueffg0aGDYRumwLvKkRtOHUAMiREXV/heRedSuF6bWi
 NKtLgvbCgtSXb0fVCOqvyo4yoEHswt6g3uH95KDxuMtJ43vxcihOQoHgi+oi7fMYQmsp
 PORvN1HxIp9wQj9v8KwaJh/G4mvc4xhXRlymBrmVNwN6Dc1nER9V2ceAKr/nKyre1STa
 LxAQLCy9ECvJfm8GVhR8ZEAjgdg1Z7VDe2nYFT3HOojjlMjRmblgctWj9erSX2AImZ/6
 y98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvushcHgW5x8Ci13qV/eVljqWihhBxbnLqYrlJGnnQM=;
 b=Zx/ehvMSlXSoo+1rqqqCBGK6gikWUXqGqhbpoKA2Z6Ph3YhnG9AS7crIjyym4L0DBM
 WYy+eLaXC9ZDnZblCujbcBqgqgIp//zn4oLjANUN/d3gS6J6iPgka2PD4w//pLZ34PjE
 3q+45LWu4JquGxNBld/wRtH0RgIKRbCL/6kx32T57atYQDOkBe020HZLfMDfUEf9+11v
 AXcQdnFErQmUlgC8/Yt148EQ6VztoNOwJl9a/oalaMEFdN9YjGRxHEV0KEuIuFo6eMO/
 aU4plry87T4k1OI8fmrajfax9rzRofnoED29myC/3XZlNctSNP/h9wgpmcqNN63kJGn3
 nJmA==
X-Gm-Message-State: AOAM5319iR80XQlWvCfU5ezrZqKeM4KfDQJ3Pld2vmBAgVYGyxjP02T/
 s9V1+wd8et7/VxO+xaqN49BXhg==
X-Google-Smtp-Source: ABdhPJxoKhG14BSFQVVyTSDxEWd6rrCYlRRTJeLtOKT+FsHY/62gPCBcNexsNdCeXVc2WChrJeebzQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr26961296wri.256.1600268517315; 
 Wed, 16 Sep 2020 08:01:57 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 3/3] drm/panfrost: add Amlogic GPU integration quirks
Date: Wed, 16 Sep 2020 17:01:47 +0200
Message-Id: <20200916150147.25753-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150147.25753-1-narmstrong@baylibre.com>
References: <20200916150147.25753-1-narmstrong@baylibre.com>
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

This adds the required GPU quirks, including the quirk in the PWR registers at the GPU
reset time and the IOMMU quirk for shareability issues observed on G52 in Amlogic G12B SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7c8a87d164c3..6e5dedacb777 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -658,7 +658,18 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible amlogic_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+	.vendor_quirk = panfrost_gpu_amlogic_quirk,
+};
+
 static const struct of_device_id dt_match[] = {
+	/* Set first to probe before the generic compatibles */
+	{ .compatible = "amlogic,meson-gxm-mali",
+	  .data = &amlogic_data, },
+	{ .compatible = "amlogic,meson-g12a-mali",
+	  .data = &amlogic_data, },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
