Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53670605453
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 02:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F2D10E058;
	Thu, 20 Oct 2022 00:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD910E058
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 00:04:21 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id l6so17708891pgu.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 17:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sTMXfwPxByKhRbLMaBxfNCc3mPRoF7RiiHgqUtdhFi8=;
 b=NzPUtom58NR34m2Vw7sS73ERU30rhe3RyOvvFRL8c790qf5KuZz3KvN69al/nH052u
 65SRaYt/WHp0PKjIXDaLYCni7KlNbgouTs8KNf5Fy7byqei7PQ3KRgBHVXjhzqsdhzY0
 or9yFqOg4L7gMu66IIQ9eWmxSPJ7xk7vRk2RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTMXfwPxByKhRbLMaBxfNCc3mPRoF7RiiHgqUtdhFi8=;
 b=yGRKrpqYo8zAnYN/kT0azjZf/Bt99MTaDliTD7XEwpkIA1uttA/l8NZVwiXBJIa8b8
 GOtZZa21sWh2Yzy9lyiZKyFrgOj2pgvduV5YxJVwdsk2lZr5dp2M34U7Bc2wwvM7wsJH
 VMfKzV9LsBXViIM4atIyOL+eJg1VwGE8BSkB+5Kmzj2BcU/xGkmU3eQlLvOBuT2/7NhT
 eCWxJQWMV1A2WxFZTbgfCFgM7WoAng0XdXw7c/Vt8DVbaNiWh6rKyJjX0ripSEiBOqKp
 D+j1LLEeAMB17iY0n1BX31Xk6+dUiLbELUabEodQ50FWn6+iJKPZAt1YCPg937gukqtk
 +ajQ==
X-Gm-Message-State: ACrzQf0BY5X+NqPa02p6vMjYlVspJlmY9Ksyp/cEG1lnBZqlkvXzi0F2
 NnH6tDKajLF6EUESZMHzIwEsKKXCEVtKVg==
X-Google-Smtp-Source: AMsMyM664xBzQRRznQW+wpuvkN2DiM8TEUvDJZUSO7BbmhIQUEq/kvX65aGrSxbs3usLThugxlDXJA==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id
 p125-20020a634283000000b00457dced8ba3mr9328251pga.220.1666224261493; 
 Wed, 19 Oct 2022 17:04:21 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:57b7:1f0e:44d1:f252])
 by smtp.gmail.com with UTF8SMTPSA id
 lb13-20020a17090b4a4d00b0020a825fc912sm459119pjb.45.2022.10.19.17.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 17:04:21 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 1/2] drm/rockchip: dsi: Clean up 'usage_mode' when failing to
 attach
Date: Wed, 19 Oct 2022 17:03:48 -0700
Message-Id: <20221019170255.1.Ia68dfb27b835d31d22bfe23812baf366ee1c6eac@changeid>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Helen Koike <helen.koike@collabora.com>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail to attach the first time (especially: EPROBE_DEFER), we fail
to clean up 'usage_mode', and thus will fail to attach on any subsequent
attempts, with "dsi controller already in use".

Re-set to DW_DSI_USAGE_IDLE on attach failure.

This is especially common to hit when enabling asynchronous probe on a
duel-DSI system (such as RK3399 Gru/Scarlet), such that we're more
likely to fail dw_mipi_dsi_rockchip_find_second() the first time.

Fixes: 71f68fe7f121 ("drm/rockchip: dsi: add ability to work as a phy instead of full dsi")
Cc: <stable@vger.kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index bf6948125b84..d222c6811207 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1051,23 +1051,31 @@ static int dw_mipi_dsi_rockchip_host_attach(void *priv_data,
 	if (ret) {
 		DRM_DEV_ERROR(dsi->dev, "Failed to register component: %d\n",
 					ret);
-		return ret;
+		goto out;
 	}
 
 	second = dw_mipi_dsi_rockchip_find_second(dsi);
-	if (IS_ERR(second))
-		return PTR_ERR(second);
+	if (IS_ERR(second)) {
+		ret = PTR_ERR(second);
+		goto out;
+	}
 	if (second) {
 		ret = component_add(second, &dw_mipi_dsi_rockchip_ops);
 		if (ret) {
 			DRM_DEV_ERROR(second,
 				      "Failed to register component: %d\n",
 				      ret);
-			return ret;
+			goto out;
 		}
 	}
 
 	return 0;
+
+out:
+	mutex_lock(&dsi->usage_mutex);
+	dsi->usage_mode = DW_DSI_USAGE_IDLE;
+	mutex_unlock(&dsi->usage_mutex);
+	return ret;
 }
 
 static int dw_mipi_dsi_rockchip_host_detach(void *priv_data,
-- 
2.38.0.413.g74048e4d9e-goog

