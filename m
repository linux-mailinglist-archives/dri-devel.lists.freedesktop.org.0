Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582964273CA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 00:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9856E892;
	Fri,  8 Oct 2021 22:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1BE6E892
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 22:31:12 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so10348496pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 15:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2SslUtgREFqZPZutv1E1PPwo3SH8tGLrCooYjOSvSU=;
 b=ZzZ/oSyVvoCxGioRJePesqRhkD8P2jQXTVcAX0CSI1G9R8HExP9FXtY+XQlKn5YwJQ
 qjt7JjgwliSD9ml2KeVlqUGfztZlit9CnKKQ3SqdIAiUEZRePGUnB/vct3RXKVd5dau0
 gcCGc4KcFgDBUvgeLus8NKt+CpGuNnJGCnc7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2SslUtgREFqZPZutv1E1PPwo3SH8tGLrCooYjOSvSU=;
 b=FNzzUvSpLzZvu+9m/k3a0pe2koeBSz/oHtJ3Kt9HR+L1rQSSpvCL5HYpAc0fFXhXC6
 3BOK5uzBKbKK1wRMYopc0p3wtbRrYh4JTadrugJ3ccmthzrajJ5QEMdyu1ZxTIhfyOxI
 OVZuzIIKTu95P25V3L+wf+673AsvExs3soOBBhrD5NDnHTWdvwBSo5IiY7CN7jqRD8V9
 Be/ymskWQpKmqJcUqObRGeNJOIk7933g5xX1mEdYjFYBF5xfvlWq+OJBADUxDB4rPN1i
 dEtRx4S/SqzRXN5wfzoxeS1dIKQqqEsx4p5FIBwrgp+y54LQ3WZMpegTZam7dEyaJrEQ
 We3A==
X-Gm-Message-State: AOAM530Kojful0ABytpmu38QahBZBvZ2tCymmxXfAb/SqHwjVxeIofUg
 4xwMNW2MTCxygVLHlnTPtUmLeggnenTzIw==
X-Google-Smtp-Source: ABdhPJxUwsepBnEFFQTQHNh7+2nFo7S8tcOEzslFztnMxkYzwYSLSUB/2QlZPi9UFdSP/NdTQY+cSg==
X-Received: by 2002:a17:90a:e547:: with SMTP id
 ei7mr8195089pjb.169.1633732271765; 
 Fri, 08 Oct 2021 15:31:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:2a6d:84fa:761e:91e4])
 by smtp.gmail.com with UTF8SMTPSA id e20sm312867pfc.11.2021.10.08.15.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 15:31:11 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH] drm/rockchip: vop: Add timeout for DSP hold
Date: Fri,  8 Oct 2021 15:31:04 -0700
Message-Id: <20211008153102.1.I2a5dbaaada35023a9703a8db7af501528fbb6e31@changeid>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If hardware is malfunctioning (e.g., misconfigured clocks?), we can get
stuck here forever, holding various DRM locks and eventually locking up
the entire system. It's better to complain loudly and move on, than to
lock up the system.

In local tests, this operation takes less than 20ms.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba9e14da41b4..b28ea5d6a3e2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -726,7 +726,9 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	spin_unlock(&vop->reg_lock);
 
-	wait_for_completion(&vop->dsp_hold_completion);
+	if (!wait_for_completion_timeout(&vop->dsp_hold_completion,
+					 msecs_to_jiffies(200)))
+		WARN(1, "%s: timed out waiting for DSP hold", crtc->name);
 
 	vop_dsp_hold_valid_irq_disable(vop);
 
-- 
2.33.0.882.g93a45727a2-goog

