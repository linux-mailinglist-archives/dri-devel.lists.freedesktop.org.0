Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD9A1A94AC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D4891BA;
	Wed, 15 Apr 2020 07:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C733E6E8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so17655561wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYsyCYlUTNp19HneBY4lXiaAEzda+/qQSjN5TCET0Jg=;
 b=dXEUJbhWzX558pMiChWHVq1ZBWdSwgZ2BZKiaSb2GQ0/EUCofZHR8jKb74TgQPKFWv
 Ozvkl3TWECaHXrpA87Sh9a65Urag+pqKk78QmYsyTtKe561emurRPNw/Eh1EG1ki7nxv
 mtn07WyFmXGbQnjwuQad4ZFWnxe6kk1Zpcz1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYsyCYlUTNp19HneBY4lXiaAEzda+/qQSjN5TCET0Jg=;
 b=EdEMxGwZ2U+U1SDHEK9c/rXKkE5m3fW3+coRWi/c8c2o/oZVPBeaCmhCTJReb7brLU
 El4wXlo8UBCSX+PMm8IKpeR580V/18iUeijg4rwNogYKOyi/yeKXTqM8vH9eN6MMSqVY
 D4wcfmqTPU0h7yNs54F59BvBV4A7FaxzeEnPXkuKXMbOXsGtqy/FVr3KBXJGIXG316qw
 4ECyFEh7WVwbWf+dPpt7wlkATKiqKcsSUGtwgJl36Eqp70F2yBf5HBEbdCykMGsWBf1G
 gK6NEKAgmeNXrXABAiG9a8VUyjZgvpnF8jDEYO7DbWeAoVsULdb8f04jmJIPUjoKpFTp
 aAMQ==
X-Gm-Message-State: AGi0PuZCNkBnsLFU0h108QVsjLFzPty29+VzIc24cR4XqTIqAogHfXaX
 H4E9XUtUAGuaOW/1oqHv/DLXUQ==
X-Google-Smtp-Source: APiQypI+UCF6z3vFSUDWwFiaq6Ltv77FkhIClEqxG1fuQrPeC7TZGX/UeP0t05C6iIQO3JfFBaATsw==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr3626897wmc.136.1586936472416; 
 Wed, 15 Apr 2020 00:41:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 30/59] drm/ingenic: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:05 +0200
Message-Id: <20200415074034.175360-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already using devm_drm_dev_init, so very simple replacment.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 24cc3587cea5..2dd1f3020fcb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -611,9 +611,10 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
+				  struct ingenic_drm, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->soc_info = soc_info;
 	priv->dev = dev;
@@ -622,13 +623,6 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	ret = devm_drm_dev_init(dev, drm, &ingenic_drm_driver_data);
-	if (ret) {
-		kfree(priv);
-		return ret;
-	}
-	drmm_add_final_kfree(drm, priv);
-
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
