Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFCF26C3FB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F516E94D;
	Wed, 16 Sep 2020 15:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1086E890
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:01:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so7294710wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gidsKX2Zswr/VwhkhQMTK3wAIhUubsrLCvk0z38r4n4=;
 b=oIn4JOuCOy7CHb5ZQdtF3SJH5FKQ9V2Z7+N3zKF9SyHuINlifIlQheLnsDTuJweddb
 RIgMxn2Nr3rwOljGIi2sVO5CNwhrMCZZsTGqAvA1IKT3Lc2nLi7W2OhbZE8moxDZt4Ho
 gkldh03HHGorLu6oZnd++T6Up6ED/0pWJ/ur+k9AJ/zu13w+veYC95XwTrGyI0Opu742
 98fJ5+Yo2BTZTXWqeEmf7AZ33nOSIM7nmZ0me8nG67MIVt9tP1vRYmhfjm0rbV1eKTzf
 Za7Q8WCnYAR7OIq4H/fdU5pY3CoX11T41lH+hSWhMlUr1Ll++wjeka7Ui00Jd1KitB/O
 RkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gidsKX2Zswr/VwhkhQMTK3wAIhUubsrLCvk0z38r4n4=;
 b=Fscw6tMApDqnmcogV241umJv1obNcPtZIpLNIckUswDo71XGCvnr/CYyX72Kmm8Eu5
 fzIB2PDjIkqAcFFnfwio2ibLc2D23jJYivCeryfbv3Mj1yw5q70K8yfQf9LMjnbnNG+p
 MMKazrh5Bvv2n07XYFgc0ECYDGQGNeN86qvJmXjnKbpC42QQy1DLM1gglQ2QAHwRSaEw
 Ygm9+MFWYmvG4dOKyBXlDIimmEHMm8wr5A82bGswoLhpaGef3tOezuiyepiA9KIvaf3S
 YwvyllkeULIF5UCky/o639P84Dcgdy7OS+JNIYcKGyNbeesMkARIj6G0o9heTW1uOAT9
 Cuaw==
X-Gm-Message-State: AOAM533Pzgw8L0R57qEDl4Br+6JrLJLi5SJhaeR9XQk3/CrW5sbUXw9U
 MAbrBJ6IBtDT1S6m3DKTr7UjRw==
X-Google-Smtp-Source: ABdhPJzi4a/WO+NRp20+3sYyly2vAAt3B+yfSFNlTW4Qddgxuygr8mJVM7RDXG3HBkLI4jtZ9O/c0Q==
X-Received: by 2002:adf:f7ca:: with SMTP id a10mr26806103wrq.321.1600268515849; 
 Wed, 16 Sep 2020 08:01:55 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 2/3] drm/panfrost: add amlogic reset quirk callback
Date: Wed, 16 Sep 2020 17:01:46 +0200
Message-Id: <20200916150147.25753-3-narmstrong@baylibre.com>
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
SoCs needs a quirk in the PWR registers at the GPU reset time.

Since the Amlogic's integration of the GPU cores with the SoC is not
publicly documented we do not know what does these
values, but they permit having a fully functional GPU running with Panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 11 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index a6de78bc1fa8..e1b2a3376624 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -76,6 +76,17 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	return 0;
 }
 
+void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev)
+{
+	/*
+	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
+	 * these undocumented bits in GPU_PWR_OVERRIDE1 to be set in order
+	 * to operate correctly.
+	 */
+	gpu_write(pfdev, GPU_PWR_KEY, GPU_PWR_KEY_UNLOCK);
+	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
+}
+
 static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 {
 	u32 quirks = 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 4112412087b2..468c51e7e46d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
+
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index ea38ac60581c..eddaa62ad8b0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -51,6 +51,10 @@
 #define GPU_STATUS			0x34
 #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
 #define GPU_LATEST_FLUSH_ID		0x38
+#define GPU_PWR_KEY			0x50	/* (WO) Power manager key register */
+#define  GPU_PWR_KEY_UNLOCK		0x2968A819
+#define GPU_PWR_OVERRIDE0		0x54	/* (RW) Power manager override settings */
+#define GPU_PWR_OVERRIDE1		0x58	/* (RW) Power manager override settings */
 #define GPU_FAULT_STATUS		0x3C
 #define GPU_FAULT_ADDRESS_LO		0x40
 #define GPU_FAULT_ADDRESS_HI		0x44
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
