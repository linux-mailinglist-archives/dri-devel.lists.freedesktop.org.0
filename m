Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35E26135E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19B36E862;
	Tue,  8 Sep 2020 15:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476106E86D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:19:05 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y15so4943228wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0IoBahBXL8EV0Zm9JurRP5zVn3O/ezWTWYb2ZZwdoss=;
 b=GG9m4KU79FRy3Qgbny/8OL+0RnULk7UHa8hwD7IGdlg/qZhDxf7vKcI4P3TtCRnWdZ
 t6SU2EesiN0Cw098TrXyhVUAbYiefAj+KMX4mOg1eFswalgfcdxfwWFd/2OhgVTFVRXf
 g0dRQ0aec6jsWRZ846qt63PSfKpe9CRYDVyuynbySXEdwR52T3mzEDOmJpGxQlgwxhsR
 IpjPOse9s6p0IfHP9+eYD58xNRKvXxt51uPieX/UxsPiOthcKowdpEe+ob6Bpatn2wNW
 rrfbpmyD9lJLn0HetNn/Bm5glZadk3/taeSTRnHJRgtnOOemPdW3Cmkd8Y5jL0zjvFCG
 uWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0IoBahBXL8EV0Zm9JurRP5zVn3O/ezWTWYb2ZZwdoss=;
 b=JARCuKhJxE/rmzv/wyqsIORriZWDyUSSt9kYalWaz4T3BckRLwePaZetxvqSArvE59
 ijLuhWecccT1FCYIXvG5Cu7AwlxxzgBbk8KmVRCs7s8pJTb4n/OwJ9b4XEeTkh5oCfFP
 XqGvvDVLcJFjotNJhs6aGbHvNDAGR288B+Ahv+1YLy8vS4P97hnsRdxGeol0dIiTTYCI
 yjNicTflLdFY/iq1hlvoBNrk+gO2lYupb765Durb+WtvehoRrpwWwCynedNAzuM+sXhZ
 +7fgA1s338cmyVfq85NPicKoG2/SgaaYYkze+FAe79zC9dgymnss3euXpGzl5+/Thfgv
 0+4Q==
X-Gm-Message-State: AOAM530IWDOL5pJqMoLwFQpXMVSgf9bR8VVHSc1bN022w8EmlC0O2+38
 +YNuv+GjnNA84MzTL+chWxfowBTKkehkSGoE
X-Google-Smtp-Source: ABdhPJw6zcnIiatO6SQE5a+MzW0yXoBmBj7sAP9Cf3yM7GxqrkpZS5u2132oDAMPyj0810YP9kSkWQ==
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr73546wmg.58.1599578343681; 
 Tue, 08 Sep 2020 08:19:03 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 4/5] drm/panfrost: add amlogic reset quirk callback
Date: Tue,  8 Sep 2020 17:18:52 +0200
Message-Id: <20200908151853.4837-5-narmstrong@baylibre.com>
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

The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

Since the documentation of the GPU cores are not public, we do not know what does these
values, but they permit having a fully functional GPU running with Panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 13 +++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index c129aaf77790..018737bd4ac6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -80,6 +80,19 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	return 0;
 }
 
+void panfrost_gpu_amlogic_quirks(struct panfrost_device *pfdev)
+{
+	/*
+	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
+	 * these undocumented bits to be set in order to operate
+	 * correctly.
+	 * These GPU_PWR registers contains:
+	 * "device-specific power control value"
+	 */
+	gpu_write(pfdev, GPU_PWR_KEY, 0x2968A819);
+	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
+}
+
 static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 {
 	u32 quirks = 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 4112412087b2..a881d7dc812f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_gpu_amlogic_reset_quirk(struct panfrost_device *pfdev);
+
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index ea38ac60581c..fa0d02f3c830 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -51,6 +51,9 @@
 #define GPU_STATUS			0x34
 #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
 #define GPU_LATEST_FLUSH_ID		0x38
+#define GPU_PWR_KEY			0x050	/* (WO) Power manager key register */
+#define GPU_PWR_OVERRIDE0		0x054	/* (RW) Power manager override settings */
+#define GPU_PWR_OVERRIDE1		0x058	/* (RW) Power manager override settings */
 #define GPU_FAULT_STATUS		0x3C
 #define GPU_FAULT_ADDRESS_LO		0x40
 #define GPU_FAULT_ADDRESS_HI		0x44
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
