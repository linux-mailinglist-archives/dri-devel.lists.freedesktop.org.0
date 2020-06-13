Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B81F85A8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 00:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBBC6E461;
	Sat, 13 Jun 2020 22:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B346E461
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 22:30:36 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i3so10439956ljg.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZVmpYpdcLJwl2DSPAje1OikSpkykl0PP+kQhQUL22OQ=;
 b=k4TzTSdw7lly8trfcqMwra4DmSkI4MQ/iTmYv7KHHtfai16TeRlOPF0uSFdmNbyi5g
 rtMMuGe5pWYw3pEYqvgHDJJfaHO3EgQG33NxwnAwZhNthAMjXOEFPcIIyZDNFYUo93UB
 At4lNZq/62wBKTh/QCAbpRGNFHu5ckD/ijsF1ujB2kzVl65vavcGYKg7UXiAx7dbdSZ/
 brjIHKxQC2Owfa4xg0gYWccVr6JzZVTlLjFvzG3BRKNx/bkV0ZwBSIu42MKCALiS0VP9
 17EGLm6OfpU92sJx+VPd9qbH7pQtSBgwy6gd+1uW3HsMvqwtV/ETGb08aLScAncpot7Y
 jBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZVmpYpdcLJwl2DSPAje1OikSpkykl0PP+kQhQUL22OQ=;
 b=kBChrQpP2vcKdnJSw5lPlIJdMiAOl6i6ELvOXpQMPHXUfv7a3OiW/Ad/b3zrqf1YJ/
 iHXQKMenC3cz/4Lare/FjMpxJYnn/XoYcAgC1sJdaObVbnY9HhyMgVYawDoAl9JSEUou
 2Xb4e1cL6RzBqZA/Usfu9ZzNLcZ4fDAhLDNcnu3ZSnFMo5qPHbL8OzbnuTv6HDQdjsRV
 SNHuYcxuHsUjO+7day1EcC4gjMiyEFZvBd3gGIaavXZdq96dbeRl6NNt4bMTg1Ptzhvc
 BCTTD2LmB0jJKsqZbciH69YcPBr0RRhMh0osqtvT2cgNpnPnhzw8TDPGvkCYJ9rjypEn
 QYAQ==
X-Gm-Message-State: AOAM53009tOa/cE+VnbUo4vlrez5+g7XxBPjSdo3+5AOx1MCOTcgDIa5
 GgIUUnfczFBE1+3sWqggYNLvNSRwCbWZGA==
X-Google-Smtp-Source: ABdhPJyUf7EfwBdgX4MbsmqireeqO0m6LckflQVhSKKESBt72onjFwr5HHppP0IHQAqEb2dZF9/h2Q==
X-Received: by 2002:a2e:818f:: with SMTP id e15mr9433758ljg.376.1592087434532; 
 Sat, 13 Jun 2020 15:30:34 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 15sm2888027ljw.46.2020.06.13.15.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 15:30:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2] drm: mcde: Fix display initialization problem
Date: Sun, 14 Jun 2020 00:30:26 +0200
Message-Id: <20200613223027.4189309-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following bug appeared in the MCDE driver/display
initialization during the recent merge window.

First the place we call drm_fbdev_generic_setup() in the
wrong place: this needs to be called AFTER calling
drm_dev_register() else we get this splat:

 ------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/drm_fb_helper.c:2198 drm_fbdev_generic_setup+0x164/0x1a8
mcde a0350000.mcde: Device has not been registered.
Modules linked in:
Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
[<c010e704>] (unwind_backtrace) from [<c010a86c>] (show_stack+0x10/0x14)
[<c010a86c>] (show_stack) from [<c0414f38>] (dump_stack+0x9c/0xb0)
[<c0414f38>] (dump_stack) from [<c0121c8c>] (__warn+0xb8/0xd0)
[<c0121c8c>] (__warn) from [<c0121d18>] (warn_slowpath_fmt+0x74/0xb8)
[<c0121d18>] (warn_slowpath_fmt) from [<c04b154c>] (drm_fbdev_generic_setup+0x164/0x1a8)
[<c04b154c>] (drm_fbdev_generic_setup) from [<c04ed278>] (mcde_drm_bind+0xc4/0x160)
[<c04ed278>] (mcde_drm_bind) from [<c04f06b8>] (try_to_bring_up_master+0x15c/0x1a4)
(...)

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 84f3e2dbd77b..80082d6dce3a 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -209,7 +209,6 @@ static int mcde_modeset_init(struct drm_device *drm)
 
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
-	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
 }
@@ -264,6 +263,8 @@ static int mcde_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind;
 
+	drm_fbdev_generic_setup(drm, 32);
+
 	return 0;
 
 unbind:
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
