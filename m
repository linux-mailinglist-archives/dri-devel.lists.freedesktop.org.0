Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8212EC27732
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 05:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9AE10E03C;
	Sat,  1 Nov 2025 04:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="JJQxrBd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5600D10E03C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 04:01:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b6cf1a95274so2099104a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 21:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761969663; x=1762574463; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XBf5/4PIi/TVU5oxmQ/qOw5ZlkbtFKWT8j+z39lbocw=;
 b=JJQxrBd4t+2oqZB/pgF3iw5AO94fa2P+XejgWhQsqhI+KO4ThBO34G5kF4RENpHeUB
 x7ro73ophRsUTqtWcxPYgAwz1hg6xKfziqGN0FTrf2OxRHrh2HBFbhvVMz4r6K82EI7u
 ZUpNvW9cicGdiNvVhIalbNmvivgTCINUcXbAN3BozjGoaeI1SO52rlQ3uN2vuih1VwNS
 fjbMwrYC8YXOPQ+qJdwKDceVIkQim6lkUtO/LQBlQPW3cD4wChtXE9LzW2ndd6zGmZ3F
 DW1x9i1gDVPo1xGylZeUZeq/9PZ9MIwA9FX4zNfgq5ZYNgYbz8euyIzTQ/VLOaY6BjBV
 C5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761969663; x=1762574463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XBf5/4PIi/TVU5oxmQ/qOw5ZlkbtFKWT8j+z39lbocw=;
 b=qYvkqMT0+Et2AowfgnKrrHW91xzXj/HJpMM0e7/j3HRXQTulEyfDub6jFyf2IrBA41
 rMQRTACKfumKlOBpzzSTz4bBXmAfWc7K+29t8k9xrGcZXxl7PdSwCwdbPluCw77qNNhe
 709NoabwwmOJ9o6XkZODYxeUhYRCTOTnjJJwsQmZ5Jbmq20VLkVuaO1QV/AxYFcc4z27
 PQdRlX+9ZpvZ0cys8XcjzX9y1pfmG592s4w1m7UAoSyyYX+sz/3tVUUafizu8hJRhSEZ
 D+siFUzad5nK44Q86jcDveDrz22LH15wCMDTr9JQ6rvNGPFyrTNlIjRFJMc4FiB8kFAL
 bH5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg2PWTzNwaduSIWBLNwu1LHTgEa8IKTxBrVAFcE/FD7wcGQUoUbtgbHoJ2G0WcPriqQYTsExBSgSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2T7byQOwSGa/33xac8/O4FBWcDBmO1FcBQ6QvP2BkiDa9HxOv
 E3zWL3SDcrywwUMcn7gIi2qH31PhR8WKtM+417wlLl3YTWLwYwxkf2fCTbontI4Zfj8=
X-Gm-Gg: ASbGncvrmJGMYsSiVzFrSVqCQbChMphrrNL4VqTgEniYbK3JpRft0dmjOH3y2PMEefr
 Ft8ySOXtZvYRDfAb1A9rzcl7Mc8RoJWXn2lMWou9HNzxKTTv3OGZeHKq80bK3MzZeuNQBUmYxuj
 IspTV5BBeoCNo6XClx72eq3FARFW9Td3mB/Nc9nCEkh1xLA/3oRRhevUJaTQkB5fFNqwhfVyl2D
 UGB/ZNKxMIEefTx6/J4dYnu5vJ2HSwCA52qDWbCpxn8qNz2lNdgik5k3eDDSfrM9pP5vdo/DsIE
 pbXkx0zBRnHLq5i8wGHBYmFvPhaG6/5bgoKhyJsFNIMEOmgQRv/yIHxYjF6JDvRa3wLqLRQbYku
 mkjTV+ejcHqo/H41nDC+Std5gTb1Kx36G5jZQ1lK8BqvrhVoIV5RgnIg7EQyrxQydFbNkrTTeDf
 WjktaCRGFyWnlENhYXSNg0SQBgG6AO2l8AdJdGm9dfeqvQZ+rLCV0EqS9eRHiMFisgrtIRizR4b
 jiMtZ9yYSx4cOCdUpnrlB4P
X-Google-Smtp-Source: AGHT+IGyIY45gXiMcurK9CvCmQ5ISfIMp4z7rdhImhGAODCiT+xwAiq16dsVlTY0Riz4IkD5f1h19g==
X-Received: by 2002:a17:902:fc85:b0:294:faad:8c80 with SMTP id
 d9443c01a7336-2951a53f50amr67105715ad.61.1761969662620; 
 Fri, 31 Oct 2025 21:01:02 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (36-231-161-24.dynamic-ip.hinet.net. [36.231.161.24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295268b43d7sm40377355ad.35.2025.10.31.21.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 21:01:02 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>, jazhan@google.com
Subject: [PATCH v2] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
Date: Sat,  1 Nov 2025 12:00:43 +0800
Message-Id: <20251101040043.3768848-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
but it will happen display noise in some videos.
So, limit it to 6 bpc modes.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
changes from v1->v2:
* Change EDID_QUIRK_FORCE_6BPC to BIT(EDID_QUIRK_FORCE_6BPC)

 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..26bb7710a462 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -250,6 +250,9 @@ static const struct edid_quirk {
 	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
 	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
 
+	/* LQ116M1JW10 displays noise when 8 bpc, but display fine as 6 bpc */
+	EDID_QUIRK('S', 'H', 'P', 0x154c, BIT(EDID_QUIRK_FORCE_6BPC)),
+
 	/*
 	 * @drm_edid_internal_quirk entries end here, following with the
 	 * @drm_edid_quirk entries.
-- 
2.25.1

