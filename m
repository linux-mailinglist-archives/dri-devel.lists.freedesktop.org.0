Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB0B052F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684F10E53E;
	Tue, 15 Jul 2025 07:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P5HJx/bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEC010E221;
 Mon, 14 Jul 2025 17:36:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4561607166aso11643455e9.2; 
 Mon, 14 Jul 2025 10:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752514594; x=1753119394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BtITE6KgMoS3AhCyG7ge+r6WLj1yPmuHodNoaoo4KmM=;
 b=P5HJx/bigD4Fc2V46Rtf5jnblftv/DdG3skPSC1Z8wGhcVZv5JJrDnC5kj4pdfCtC7
 MU2qwJ43yb0oWeji2NRWDAuKrH3hSHSVDOxWPnZAhZ+BQupz85dWPH180RzkQPCCtIeh
 YUbRsaF2DA3qZ474GSz86DCGyEHIL3zcbt7XCSQN4QwKtWyBbnox5TFjZRkBEui6e15k
 azBOOkiXQWW4XXRP6L9p9fjk2xQoaoQe7kW1uAZIejdAIHN3AiebuGGwbt3ANK5UAHeP
 EwydZIPxjKxJeUysWI1GjRdgjElQgA+8giaR4hKU0RsIKQTmnLzvXSqfMjqjXRi8dYHC
 W4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752514594; x=1753119394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BtITE6KgMoS3AhCyG7ge+r6WLj1yPmuHodNoaoo4KmM=;
 b=KtVIXqWQY68RqvIZ6hnb0dnDYKsoQMt056NWw1p2NHDNM/jTD9aTNG8bA2YRn4zL2y
 0CbOfMSdAgFCwVjMHnBAsPdye60G7uCN30WfaR36MPPUg3Vua9ALbxuSg2+HtmyqWRpl
 6pB7JrwwwWRkbIeb3MWs8v+BXNbgbAm2JysLLsq5q58Fxg7FzZQ25ApeMy2haUG9KYY7
 lEgTeNG5VlQW3H10DDdWajztSoabRfk8w5LmsV62+CkupO540xglpLxeWH/TL1HZkrpJ
 Rh3g419fOGfRZ/qe5ECGnApcuEhK+rdrWUnng5WNwJGOnspWCyyhZ7CvEWqRmpiY/XaC
 8fIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeD/LXTJWurhtoUWoQbcGTSMq+49OmMoEWc7X3u2gnCTdAw4EKgQqlBLG3pwWA7bTGfsSokhRmmu4=@lists.freedesktop.org,
 AJvYcCXOEPDAzc4ztc641sdiOT/PBUDNc1xfMhp7eh6+ZL6qjyX3wDcTqJNvR6MW7VCgl2ErHWG2o8LlTkau@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtrPTNPLh/ubSyBJl7Oy9hM08qQxajpLH9IeipWOeINp7BxxiT
 ZFDmncaWjgbC4/clNd49vfGfpwtffvVNkJ7KkeAMs+x8xLO37aoIzoh0
X-Gm-Gg: ASbGnctrV8x6Y8FfRvlxvbW4aw+ARxHls2k3N1+Itm5OC7w4GCOH8mtgcAZXHFdSkVr
 E+YVGt7BtumVLdZkSgmFrU6yDTCDKW0kAQt6T7ogjzvMP0WiaWGw8yeqi/AQgCWfu9YxKSBbVDt
 uGZxmfDt0Gp3n+cczHwtRX5NM1HZb9A5TPRX7QsphnKcObPFfCwMXLSaD0sq3yqcYrS1SwhZaRf
 I4FjDU6TwZJgUV9JVbDciafKo8mulL+OKeUs7c1AzQTtZkqFd2a4i+ywZNWg58Od2urYm44NUc7
 bOmO1C1hx5kOs914iHt/SD+rL0MfFr5BA57NAlk/hKsrHBGtUV32IdQJt7Gpjy1UaENYtq2Z7FA
 zBebSjQV8ot0IspVvr/5YjJ7AZi/pbZ9PyayAD91jnfi5Dw==
X-Google-Smtp-Source: AGHT+IF3IHZAfUwjccfOhHLL0NnXoP3T/kMpOhEmbqxn+mxAllsqLzGXG/3Az9GvJrjSX4te6HwBiQ==
X-Received: by 2002:a05:600c:3f18:b0:456:c50:1b3 with SMTP id
 5b1f17b1804b1-4560c50065emr75556405e9.29.1752514593967; 
 Mon, 14 Jul 2025 10:36:33 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 10:36:33 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
Date: Mon, 14 Jul 2025 18:35:42 +0100
Message-ID: <20250714173554.14223-7-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

The OLED display in the Surface Pro 11 reports a maximum link rate of
zero in its DPCD, causing it to fail to probe correctly.

The Surface Pro 11's DSDT table contains some XML with an
"EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
(8.1Gbps/HBR3).

Add a quirk to conditionally override the max link rate if its value
is zero specifically for this model.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 4e8ab75c771b..b2e65b987c05 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -11,6 +11,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#include <linux/dmi.h>
+
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
@@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
+	/*
+	 * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
+	 * reports a max link rate of 0 in the DPCD. Fix it to match the
+	 * EDPOverrideDPCDCaps string found in the ACPI DSDT
+	 */
+	if (dpcd[DP_MAX_LINK_RATE] == 0 &&
+	    dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
+	    dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
+		dpcd[1] = DP_LINK_BW_8_1;
+	}
+
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
 	link_info->revision = dpcd[DP_DPCD_REV];
-- 
2.50.1

