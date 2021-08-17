Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086D3EF399
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 22:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4091C6E249;
	Tue, 17 Aug 2021 20:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECFF6E247
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 20:43:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso323787wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qkmIGWStsmGwX59IYJq69k4MQQvvnZaBHUVStjccRIg=;
 b=zruDqWaleaTIcNcI8RfwQBJ4phf50405hx5OYGUC+2ADyiJA5LMo6lpUfJV6SwJEGB
 2xNV+t69eOOtw0KzUc1ZpfHKtVv8DOZBKwEJzA/PcGY5CgnV/K8Ex70xhN6StEtJYOio
 toclwNRTCoRfWVqoBTRQOyYmRQ4xT7JFM8iVhuouHXSOLPIO/u6QH5dw4b4+99vGMkMx
 7e7cg7Xqq0EmFrzSQTafdSV2KtOYF9sGbPB54dDa6ZqizSXYIowiOPAWlDIV5L3QifxJ
 +DwKbQdhfMYrjBzp25spYffer7prBJa56fdqRUkN1knSXfoRHEE+VBmdZvM2PpuZ18D/
 xc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qkmIGWStsmGwX59IYJq69k4MQQvvnZaBHUVStjccRIg=;
 b=o32SirBy4Uaj4LDaSmqX2AXzLRG//pMbWapnWLWtfVW2UKOQKY0rwnuVGjLTC4iRka
 lt5ZFQgb08+N1FZXg4jArAO8WhSw5AAfECTKv44dJagwmhiq0HBFRBgTZSaj/mz3Jbkd
 KqCJ0AUopE+643jqOTL8RchwxgrrCQYoZF4Xl+JnahTk93xYFIRchkncwTmsOdXDmdi7
 QCQJYJO3j1gSSCOpvoWjCb/booHDukqfK0EHKbShZXB7TO5AC6seGsAkS9qwN1OR133l
 XBZeMK40nRpmf7sOzqKEOGI4XABIS3RsFq3qJRC9sH5TSvED1kL43JkGe/PBQwyKyKSP
 Rpmw==
X-Gm-Message-State: AOAM532OHf8jgLw+4maA1DYtpkLykaUogcuRe4nrUkpzizOH7/4jHLWB
 lvdQ1wzu3wICMLFva680eyYP5w==
X-Google-Smtp-Source: ABdhPJwpVDe3ZeJNBVxh6qeSyGZgVTaF1ZlUUzxwqfNMz8sEqyoUOT0KCvhTRjge3V+N4Kjg5mUsug==
X-Received: by 2002:a05:600c:3591:: with SMTP id
 p17mr5239032wmq.134.1629233018998; 
 Tue, 17 Aug 2021 13:43:38 -0700 (PDT)
Received: from gpdmax.. ([2a0d:e487:15f:f479:6202:d4f7:9ddb:b07c])
 by smtp.gmail.com with ESMTPSA id e10sm3540332wrt.82.2021.08.17.13.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:43:38 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>,
 Anisse Astier <anisse@astier.eu>
Subject: [PATCH v3 2/2] drm: Add orientation quirk for GPD Win Max
Date: Tue, 17 Aug 2021 22:43:29 +0200
Message-Id: <20210817204329.5457-3-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817204329.5457-1-anisse@astier.eu>
References: <20210817204329.5457-1-anisse@astier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Panel is 800x1280, but mounted on a laptop form factor, sideways.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4e965b0f5502..643b55f9a9d1 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -160,6 +160,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MicroPC"),
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Max */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
 		 * GPD Pocket, note that the the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
-- 
2.31.1

