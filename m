Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 960DC26C3F9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67F76E890;
	Wed, 16 Sep 2020 15:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F3C6E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:01:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x14so7230221wrl.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hImJ77lnVX3Gt8BtSBrQ9L58KJd7sxpK5SqbvVqBDT4=;
 b=zn+OYs3Yc6TjDeDMLiJWpLLWggFqYNeLgm6J18K4sU21Tf8A707dIRS/zJPSWEBT2o
 mOrJtvn+/XGRVorYTU1AR22L+QJt+mapeRzWYs+8v78LOCpeuWjvFgy3Ve1kCJjDlKzk
 vc6ow+f7V56/J3+1AB12ZA0MTx3oPMNEuiXq1S2mNaVT9aJrcGow+Nd2Z+dB2ii9rkkf
 aX5fRJNsu46XIPQpdADaIQEhHFm6Ix91chLutkMAfxAGo9b/yfulX/dAIMbMAliOiff1
 c9EY0xmyHleE6D1Iq2v8+pccK4susTBg181AxyOhknWw2l3AfwxxqxgLUtujtfkihSdi
 O3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hImJ77lnVX3Gt8BtSBrQ9L58KJd7sxpK5SqbvVqBDT4=;
 b=GJfTuJa8HI3YUlB7PcuAs+dNOtPgrXkLi3n2O+KvyNByQRtVz+wQRj1H55iNWTBKCv
 zx6yaVnkMwU3ObPcLPgEWm5yIygIgYhoAtdE3JGBnuLL6sWheQLu1V0pa80F3YUgSb0I
 5s3kkXt6l9/SI5+QXza5phqYRYK5VKNNqF9igrjm7RnILcl4vxQ9/hyALqMUas4BPoXy
 +StleKIarRrq/B0wv2mgR7Ty7rBqGeK2oDJeis8bwAUYYYvJIHxIMT+d8Hv1c9XoB/oI
 efo9ZqgJ7diIWmBy2rR+9AwARE736ZxjL8JttjHOxIIr2YwesbRRrAvpM/MmaUcAp5lu
 IUVw==
X-Gm-Message-State: AOAM531OWbw1Wx8kDY7EN5muIjnaa2HjBhlK7aU+WuEhzdoVm/0DBUW9
 uEkhyoIHr0laihfc/wee0I3fvA==
X-Google-Smtp-Source: ABdhPJxoLA/tx2P1IXNi1/eKRjFXPh02N6giEvfMg6DRt8JMc/aIkC7UH8raS68XGZ2uahjcBpp/TA==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr27578093wrp.356.1600268514278; 
 Wed, 16 Sep 2020 08:01:54 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 1/3] drm/panfrost: add support for vendor quirk
Date: Wed, 16 Sep 2020 17:01:45 +0200
Message-Id: <20200916150147.25753-2-narmstrong@baylibre.com>
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

The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers after each reset.

This adds a callback in the device compatible struct of permit this.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index abfc78db193a..140e004a3790 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -70,6 +70,9 @@ struct panfrost_compatible {
 	int num_pm_domains;
 	/* Only required if num_pm_domains > 1. */
 	const char * const *pm_domain_names;
+
+	/* Vendor implementation quirks callback */
+	void (*vendor_quirk)(struct panfrost_device *pfdev);
 };
 
 struct panfrost_device {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index c7c5da5a31d4..a6de78bc1fa8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -136,6 +136,10 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 
 	if (quirks)
 		gpu_write(pfdev, GPU_JM_CONFIG, quirks);
+
+	/* Here goes platform specific quirks */
+	if (pfdev->comp->vendor_quirk)
+		pfdev->comp->vendor_quirk(pfdev);
 }
 
 #define MAX_HW_REVS 6
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
