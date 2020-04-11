Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA121A4E39
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 07:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C88B6ED77;
	Sat, 11 Apr 2020 05:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64A36ED77
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 05:46:36 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w20so3815289iob.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 22:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WiNGtbaTEgFI2Ambw/NBjeXjSKphhfC2LjH8nGfubE=;
 b=f++FdS/1K/hAONc1GYsMc4l3FNQXu/bZO3znxAgObdFW8zHNlK9yRPvUF/q3GJYSJK
 fBAblfrG2987eHf6lRFRMNqoVsQa4HZAZG6fB06kWJ48CO4HXt2tTpPWQTa/8CvnDvV2
 nlMtJC6us9ZodxrDn7rvctlez/9PiOQ/lL51hxT+VGBxspLDqeptVWNFc6TSg/cIviM7
 ve5NPYGzejpW7pzft9jYzIiOmWA5bWjIaC9W8ilZ8NDf7E7G91BnvtQe5bnxpRah/wHU
 qfO6Ml882P6E9LxVspzvpRI9YJ/F48QgoOk2FhRz2vS/WpjWaybm71KKLuvKlNMiXnPH
 UhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WiNGtbaTEgFI2Ambw/NBjeXjSKphhfC2LjH8nGfubE=;
 b=Uz/xoADsOnq6bn2ltNLgrGSj/eGW8MBYR8zWQ6EE5LMep3Xn5ujuzC9FfnsvQr1Cir
 KkbUqDHCEMElnqFQwsu2z13UZRVS+0llt0ljZ2OnMeZso407YAIsOha/k7Z74ZwPRkiX
 WGHlnVZytUCc3dMAHLb6eKFp+tehRfYlPmPLmTc0H/aU+S4F/45LJSYR1fjChgT4YuJj
 BS1d/ocuEcSPTsZRXFe2bCC1kHA+DoU7F6TGpApQRxuJNQNyoXxctFNO8WS7Rmo53gN7
 B7rcgty6hex6OdiYZPD6hnRRvRFOKJzc36dXpUcFhqcmvvm0kt+GKZogsQUkE4GfEVvy
 KGSQ==
X-Gm-Message-State: AGi0Pub0rC0bHwNVbkOJT6MJ5T4c3vpd7srdrBCvvrTkM7Lk3LDvEgz2
 kPhoZEnLnjCBvm2ti8mbWK6g0i8x
X-Google-Smtp-Source: APiQypL4T1XANVKA4cYdcSxOvp9eDvywSjs6+0UJNv7O4UQgMT2TzxevSei5HattpSlJq2OhushA2Q==
X-Received: by 2002:a6b:ba07:: with SMTP id k7mr7408801iof.24.1586583995731;
 Fri, 10 Apr 2020 22:46:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-253.hlrn.qwest.net.
 [97.118.146.253])
 by smtp.gmail.com with ESMTPSA id m4sm1464114ill.78.2020.04.10.22.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 22:46:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: hdmi: Silence pixel clock error on -EPROBE_DEFER
Date: Fri, 10 Apr 2020 23:46:11 -0600
Message-Id: <20200411054611.25647-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Hilliard <james.hilliard1@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the vc4 hdmi driver loads before the pixel clock is available we
see a spurious "*ERROR* Failed to get pixel clock" error.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 340719238753..6d4ee3f6b445 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1338,8 +1338,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdmi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(hdmi->pixel_clock)) {
-		DRM_ERROR("Failed to get pixel clock\n");
-		return PTR_ERR(hdmi->pixel_clock);
+		ret = PTR_ERR(hdmi->pixel_clock);
+		if (ret != -EPROBE_DEFER)
+			DRM_ERROR("Failed to get pixel clock\n");
+		return ret;
 	}
 	hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(hdmi->hsm_clock)) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
