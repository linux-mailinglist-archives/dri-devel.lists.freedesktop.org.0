Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653B574939
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34C7A2D84;
	Thu, 14 Jul 2022 09:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726DA2D79
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:39:28 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id p9so2322830pjd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=035aCrOz5ERcq1QdmAwfHzCWjFJoscBLHwbpgcL7qwM=;
 b=IPcwiRAPfXZGdabealGssIj3UFwxYY+gjXA8gU2bN98caeRupARqxJi5HvEaCHj8LU
 l369ixh3UstTtFS1BnorG0XXEhuP5h0hAgJ+FtMmjNUfmrUgC24cb61vTCAsdX+wL7HZ
 5NBJwOaPmwCW3P9eKO3GGTpFex7BdN5odvivw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=035aCrOz5ERcq1QdmAwfHzCWjFJoscBLHwbpgcL7qwM=;
 b=ML4aBRJvmZg9jikq/sRJnqaWaHWutnONAbfb/Spu6P2NVsq4+ymb3c5uFqk6KS7Et1
 5mto5l6xWsFlD/ANrfhzMatuQZ3njW/Fqk0YpFBFnW6x+MRGgNbhKiE8g8MVyeHZwRwQ
 JX77X9CEtCKrHCEWirc9GUtc59Wx6ABXwH2IKb4KsVITGv41OOn3Ttlpnrk+mhxL2bG4
 uDjy6FHVtp+fWZdTEB+2B8v6BD9RZ9YptrLhLExnoUt3STz+59RWeEhtOvgpaDjVhjHk
 O89zy/1DWMm7XykUegeuOTj19mpYngD3FtJbP5MxzqHuYoNJ6Sl77MjecIuYvt2kAVbn
 LUXA==
X-Gm-Message-State: AJIora8LMsFlrz+t7HU+vF3eeUqviTcgKfLsw5kQKvkaoIR/Neq2zSl+
 Ap9iqWeDmnOdsXKfSGhug5bfTg==
X-Google-Smtp-Source: AGRyM1uHl6xzZtJP+2RbMoBawnwUDbMd+wrFhj4n0h0m6qDMV3KEhp79mOW1zYnnkrHA80MGqTCS2w==
X-Received: by 2002:a17:90b:1643:b0:1f0:2094:57db with SMTP id
 il3-20020a17090b164300b001f0209457dbmr8738186pjb.140.1657791568146; 
 Thu, 14 Jul 2022 02:39:28 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:e954:82dc:af20:e6e1])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a056a00213300b00528c34f514dsm1180743pfj.121.2022.07.14.02.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:39:27 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: it6505: Power on downstream device in
 .atomic_enable
Date: Thu, 14 Jul 2022 17:39:20 +0800
Message-Id: <20220714173715.v2.1.I85af54e9ceda74ec69f661852825845f983fc343@changeid>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-Yen Lin <treapking@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Send DPCD DP_SET_POWER_D0 command to the monitor in .atomic_enable
callback. Without this command, some monitors won't show up again after
changing the resolution.

Fixes: 46ca7da7f1e8 ("drm/bridge: it6505: Send DPCD SET_POWER to downstream")

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
---

Changes in v2:
- Update the typo in the summary (power on --> power off)
- Re-write the commit message to make it clearer.

 drivers/gpu/drm/bridge/ite-it6505.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4b673c4792d7..e5626035f311 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2945,6 +2945,9 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (ret)
 		dev_err(dev, "Failed to setup AVI infoframe: %d", ret);
 
+	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
+				     DP_SET_POWER_D0);
+
 	it6505_update_video_parameter(it6505, mode);
 
 	ret = it6505_send_video_infoframe(it6505, &frame);
-- 
2.37.0.144.g8ac04bfd2-goog

