Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE32C62A1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4446EB9D;
	Fri, 27 Nov 2020 10:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3806EB71
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 09:23:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j10so5193887lja.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDVGerivDhcovGvlrg4RdGN4PhZ+oBrQSqPNlOoN/KE=;
 b=xXo1mpme3FQkxz7YOniDXUXLh1hheRztkvuFD0BgV002eFkuLs9/dcgDiWWCkpLt1h
 e1g5XSCd/9I2I221sERnEP5Fl3x2MhneduRxljWEjh4cMBhD/La7eSfE+qUnugOnZmvQ
 CTYXTVxuM/C5YrnndrLDTMSY/njX9IEXElhdv3mUHj9yJCDG845sHyPDxgeFGjR2Kt6B
 fYw7wfn1t5zKg1WL1I18oLC5Aq1lLeCDWszonc6zgKx8SDoPTC+FPtYEisuLI5e4jASN
 3pFbXg6iE0k75/7eStyKP54QMo2n+JxTlPeaRbJPAhsys/nCn/ARQB+lI/K9/Yx9xU8m
 29GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDVGerivDhcovGvlrg4RdGN4PhZ+oBrQSqPNlOoN/KE=;
 b=Ts+RRWmRwxXDEDJiYKwXSjSBwAgjgOfml2FS5SX2UHbRbjofMKgWYxrPJ6zl+c4mkz
 ZezovoAgMNudAAo8fnKVZNdUx/ikSKDi3wyOGs2+FxT8ZTXt99x2ypda0PkOaKhTWp70
 x5NMLrb+5+atTbsz7mDA2AmSCz1OKG1bcZWPA6tqn28FD9R9zfV1chu5MKZTGFPWVw8d
 5ChUgjfR2ScsBE/QTg+jJomaGGr9xcU6f8Vba5Zahum4e11xG3yGHmTnj6ghUVVrEDka
 E8mGNCBcfDJR5tEmwBUDsusM5WtfUrrezTsV1mk5jptHZhDP+chM9gtCPssg7RgUu6/9
 SdBQ==
X-Gm-Message-State: AOAM533LrwvvxAPArnxk40LNsMulpXxUJWDzgbNnJdcUUFgi0OnCv/00
 joaaILeaDlWGlvlH3mxNyqkBcO22oGyXfA==
X-Google-Smtp-Source: ABdhPJw2T3Uh8Fn3UGKCfLRGJRb/SWo+VxiKeMYglY+tch0H/sdr9lyw+X2xetxPm3T4VEjuJwptvA==
X-Received: by 2002:a2e:998e:: with SMTP id w14mr3176710lji.100.1606468998738; 
 Fri, 27 Nov 2020 01:23:18 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
 by smtp.gmail.com with ESMTPSA id a6sm615442lfi.107.2020.11.27.01.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 01:23:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to
 become available
Date: Fri, 27 Nov 2020 12:23:15 +0300
Message-Id: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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

- Return NULL pointer from get_edid() callback rather than ERR_PTR()
  pointer, as DRM code does NULL checks rather than IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 0c98d27f84ac..b708700e182d 100644
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
@@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 	ret = lt9611uxc_wait_for_edid(lt9611uxc);
 	if (ret < 0) {
 		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return NULL;
+	} else if (ret == 0) {
+		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
+		return NULL;
 	}
 
 	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
