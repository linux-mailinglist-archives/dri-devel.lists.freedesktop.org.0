Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F72FFE95
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1246E9C8;
	Fri, 22 Jan 2021 08:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FEC6E979
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:33:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l12so1953171ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLR41DXLpX01EFGGqYnK9wGC2B/eZfRvF8CSAXF0+wM=;
 b=uW5eW3TZasEXRCDWT0TKkUuPWqXEULz2GdydhJeniRJoiM1zBePlAtNcnqi376CPhm
 gWC58dX5F0i+Vs0WgL2uoQFc416FPZKpX3cvmoq6j0O+biInsJYOfjCT9N6WVrJnjxoS
 6onjhcbX0HZDdS3PsjiC1cUvSpoY5zyYIkt3QBYC6TrTTD5NwcfHJ+25qD7BBE6dtbED
 1HYkhlHQiXPL1LaC1ZLBga9KzL7UO72SHgcynsqU/ZPyoyujvV9nFSQWz9uEQ6J2BIEX
 Cv10xXwNRVrXMetW0r8CtvnQDLWUe38sfIxvwxTLGep7Bk8WXnzxIs0K2xMIeLgXpA0+
 ldwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLR41DXLpX01EFGGqYnK9wGC2B/eZfRvF8CSAXF0+wM=;
 b=SAnddGwuShMsIr8UjP5Zi7mkV4JyNGsNJSaLxFWcmR26tJqFQNN5qSkXq5ICyirMRZ
 J2RIhluB4Pj8hsdZAEncxAz02x3bdIWlsYLahTM+vBH9GOZxLnVhu3FngbHGTa0oYlBT
 JBxvqDJHgtgvcABAfyxlAd/7toXKQoKTuywUNq11HRwX03VLgZPw9j03z6EET5dpL9j2
 S1sJKZB098qyYwRU/ZVgBGWD7K5OluHJIbfUCT5xsbRxkoY6fvDj1JoxM4uvACezgxuw
 r9ckKxCTeQULMTlnK7qftWSyK2gbYaLJw2TB1d6/a21g1+oaUZpUR8kRsGou4QuEm7Sq
 XuoA==
X-Gm-Message-State: AOAM531VFbDMivOWcbDGD/4su/tbWspUGtRw7ivoC5SDPbF05Wqcb08t
 Yyu87JvJEmaTcWJ3Z2Sd1NTtv4DRxS5Esycb
X-Google-Smtp-Source: ABdhPJyTWeBrunTtFpZ8ytV0REk/xDX7IQe2MnkWbZ1xNoNwfR8h06feNxw//96kKZqiswmlj/GD/w==
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr871501ljm.466.1611271988840; 
 Thu, 21 Jan 2021 15:33:08 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
 by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 15:33:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to
 become available
Date: Fri, 22 Jan 2021 02:33:01 +0300
Message-Id: <20210121233303.1221784-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Call wake_up() when EDID ready event is received to wake
  wait_event_interruptible_timeout()

- Increase waiting timeout, reading EDID can take longer than 100ms, so
  let's be on a safe side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 0c98d27f84ac..a59e811f1705 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 
 	lt9611uxc_unlock(lt9611uxc);
 
-	if (irq_status & BIT(0))
+	if (irq_status & BIT(0)) {
 		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
+		wake_up_all(&lt9611uxc->wq);
+	}
 
 	if (irq_status & BIT(1)) {
 		if (lt9611uxc->connector.dev)
@@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 {
 	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
-			msecs_to_jiffies(100));
+			msecs_to_jiffies(500));
 }
 
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
