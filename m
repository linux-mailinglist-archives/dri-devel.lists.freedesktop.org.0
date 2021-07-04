Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D13BAC87
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEBC89BD4;
	Sun,  4 Jul 2021 09:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B63989BD4
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:39:08 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id l11so9580804pji.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XV29OwulScpqtDerQ3Bq68i5Mk5q3WGxc3b90rwh8P0=;
 b=FGl7SvhWbTWjEUKcHpMUaAbC+p5Z8Tg2YeVZxqA/acdCmBu3pmjqsDYJMVC5RzTw1i
 8acwMH6enlKzwahmpw3HFLGGE7wnkPJNoNO3AEI9vq2JASTEaJMaiWkUQCllfgOoFVJQ
 LymfEDMf3ZhRpW0YyXrdEYEJ0tbax7Aa35NH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XV29OwulScpqtDerQ3Bq68i5Mk5q3WGxc3b90rwh8P0=;
 b=PpXIlfedpTov3V8tAtLqiHJeEVrxYf9KFvuc08ZIwevXzwOUzk6LjcMZoFiYlMq4XJ
 +VENpdSRleceADCVqmYtZNayWbP3C6l9YTgu1YsZAMqoEDoFIvw1hjRwOnNDRoZJMUzm
 DSJ1pCK4Dn5JJJ7imTr4G5ccazJW07bJqcZXRkVoWyagYzg2WCuw/a1UnWFtS/yOmkVL
 OfBm8K8B8At8zVIlWduau0pMeUF7zwk0UQyNCo0iBILs/kLoVzwqdRwB8Zb/T+Mqxi0M
 wFDPN5EVLKITG/Z4Zd8QoxUWvBVUFe5csQdMl25OKr19TqoL+YoLeUX9XzQ/OsjAmvd+
 aeQg==
X-Gm-Message-State: AOAM531ueayHO4G2YC1Xc1l7UbQEgYCDGfa0OA087iO+FkTsmBYYQTg1
 vor1bz36YTaKITH18jgn7pD05RwxdIAqDg==
X-Google-Smtp-Source: ABdhPJzH073RGd418Sva1wuR1FG77jszkYLltTvJDea5YRF7I3xBkCYWuBuc17Wz6EH4n8fb7Ltc5w==
X-Received: by 2002:a17:902:b789:b029:129:4883:5185 with SMTP id
 e9-20020a170902b789b029012948835185mr7449524pls.68.1625391547663; 
 Sun, 04 Jul 2021 02:39:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id v14sm10334076pgo.89.2021.07.04.02.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:39:07 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH] drm: mxsfb: Support 24-bit SPWG, JEIDA bus formats
Date: Sun,  4 Jul 2021 15:08:57 +0530
Message-Id: <20210704093857.27961-1-jagan@amarulasolutions.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

24-bit SPWG, JEIDA bus formats are considered as 24-bit
bus widths for LCDC_CTRL register in mxsfb.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 22cb749fc9bc..5657155f9633 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -85,6 +85,8 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
 		ctrl |= CTRL_BUS_WIDTH_18;
 		break;
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
 		ctrl |= CTRL_BUS_WIDTH_24;
 		break;
 	default:
-- 
2.25.1

