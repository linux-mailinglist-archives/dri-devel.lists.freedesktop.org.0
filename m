Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B62F9B3E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE1B6E1CD;
	Mon, 18 Jan 2021 08:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7B989B49
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 00:24:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id p13so14497441ljg.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 16:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
 b=a6xn4dTZ2IFPAX0OuBOTeKJNnVYS33dqQWXOkWew7MdddpflJN/lH4msVuofd7VNE1
 uSdDZWYEmIVjE1pkdkEaoUlcRhhVl8QS7YgwMOa3nUL8T0/6LV89dXyV5cbqm+/On3+B
 QD3gXecTGRMAgFZnedB4sPbuyf3vOJdVTSDsNInZc4y1cM1utPNxb57fY4fq33AbobcZ
 uGPj5UGNfFfgTTAnM68lTSoVLNz00eqkd4smeVYNzh0CO/86ISInkRr5NcupXimuJOVH
 unHFEgPdgxJIZHJEbvxYKJVKodGDIrbZ6Ouxnhy4O2dvxAD6+V99V6FD5rOCPjrjzJOS
 3Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
 b=LDtqBFt8BkLFCT2itd8rHVMd6PW8sAdTs0nJV4qmOo4itN7aDLLuvZ2yqWPeKcZqKQ
 KH3IEG7vb72tpJMiHlWfhB/2yk/f71daXgwdjWne++xBttAxh9rCW1QxwM/6gyVQVhBc
 nWBI5mlZlGklAU+kCRomyp7xYKtToLHI9LHfXlqvYZxivjAXMOJogHkxahZsuP/VGe2I
 1AqOdxTrUsaq25xiOXQ6DHmRBOBXpEpcuJqsjtK9dc3joAmJWPuhNbRK3bsbtmiqOlxW
 6WtelJfQEHs0WQX7lod3MIop4bf5QfSyt+FSxYHyCwVG1ZGPFOjmrZCfmx7gV+P5+wBj
 vRJg==
X-Gm-Message-State: AOAM531N7kQbPbxTW5V5UTo8Rs4zKYxqJD4GtN15M+xHxK8LBQher0jH
 UgXhoGxS8N7VYTE5SdDoMcoX7JA3Xp0i3LIl
X-Google-Smtp-Source: ABdhPJxRg3eJAQoDyiUkVKBvBiFd2B9eEiPA2IEMEdjLSpsknS2wV9RDFNyeQd9YpoVEE2kPJavj2g==
X-Received: by 2002:a2e:9985:: with SMTP id w5mr8241208lji.122.1610843038203; 
 Sat, 16 Jan 2021 16:23:58 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
 by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 16:23:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to
 become available
Date: Sun, 17 Jan 2021 03:23:53 +0300
Message-Id: <20210117002355.435860-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
