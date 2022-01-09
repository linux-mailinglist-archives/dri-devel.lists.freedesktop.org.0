Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3BA489345
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806DE12A8DC;
	Mon, 10 Jan 2022 08:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A1D10E2A5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 20:41:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4064040wme.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtFdLLS5GcaegKjbKWr5PvQazf86TAVRtVOt+lG9vE4=;
 b=U4hhmH566w5zWI55wGgJnTqS9jf9efCX2WsmQDgdRcTPzUkLHRb6UYhv2d3KppN1AW
 pJpe7U1eMuVmludZhiXBKATaLPbPvm3+FhHvo2KD3Nh7FA8ZJmn7zMXEY5ZlccF/E9pJ
 ln6oCp81fP61NcmBcaxXtJ3X0Ueb90TE79kNzS2u8mb8dsLKSyECfFzzh+wXQTeiAz3b
 Ym3z8d8PetpMJT7GAM96YCpDrKC3ED4qE85RTIcISgiZE2Og3pECZRt2Xer5dyrdmOhg
 WT4Q65bYqt7oy9ctRDE3zMty39B3GP1J9Irib3qUgvKimSGM04kQ2EvHu2L0AfESCMYQ
 Ja4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtFdLLS5GcaegKjbKWr5PvQazf86TAVRtVOt+lG9vE4=;
 b=H0KXSK7D0U3Rpb65VLIhYTQ/ZjYhkeP0CEFH03KFSQIo+YfqPUJG5H7HLoJ79c8Pju
 gCv7CTHRTDp6ehB/fOEHIs1kYBtV0yIv1x/nGrHL73fUaatFIfbflk0K29CJvPNq3b8x
 xa0Uc5X3J2Fud6WKLqjf9KMYGbTsXcW9xziRj6S2QoXGrf2MyBSMmGDgZEAjWzZomYST
 L3vzUsSq22OtfS6tPIm9xxFSZoWM2p7xtkjLL2SAEoJTnM7/O38WfdnxKar8KIig23lY
 FZs1egH0sTDjfFRwNqYowFoVhJSSVjOLEO2Dim/vKEM9az7IACOnulwXwzbJ+Qqi6hyX
 32XQ==
X-Gm-Message-State: AOAM530aAJtS/CQoQnaxJTYfD9z2YbKWsX7vLN89enMXmar9KJqBlX1R
 y6cDF2o3LbAtii2vVrAnzK4=
X-Google-Smtp-Source: ABdhPJzHCw1tXMWCxa7fiZNVNwfLK9Kt3oRY8ZzA/AzZbu+FBVQcxtbSaDPcxTYHuir+4pMQVkg4rg==
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr3323567wme.103.1641760866167; 
 Sun, 09 Jan 2022 12:41:06 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id w17sm5560413wmc.14.2022.01.09.12.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:41:05 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: adv7533: make array clock_div_by_lanes static
 const
Date: Sun,  9 Jan 2022 20:41:05 +0000
Message-Id: <20220109204105.51878-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 08:27:29 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array clock_div_by_lanes on the stack but
instead it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index eb7579dec40a..ef6270806d1d 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -29,7 +29,7 @@ static void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
 	struct mipi_dsi_device *dsi = adv->dsi;
 	struct drm_display_mode *mode = &adv->curr_mode;
 	unsigned int hsw, hfp, hbp, vsw, vfp, vbp;
-	u8 clock_div_by_lanes[] = { 6, 4, 3 };	/* 2, 3, 4 lanes */
+	static const u8 clock_div_by_lanes[] = { 6, 4, 3 };	/* 2, 3, 4 lanes */
 
 	hsw = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
-- 
2.32.0

