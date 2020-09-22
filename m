Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84852275299
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35189DCF;
	Wed, 23 Sep 2020 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9D89CCB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 20:31:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so18530535wrx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFdc4SH1Iulou9qYgYBQGfoZtnnhVU1CnDj8vAu45kc=;
 b=CoXHm0eaOneQq4NOeA+r/ftMb0wf9sIVBeynoAxaeqawgA39as5IwJfpGsqCGWrUK4
 zG1CsoWq7MqNSHgxictCRpJlOY7LjwqnGrKkfuQvToF1vsxmQh9mam33dAEUT6mNK7Ba
 u5h7dvQix55Kuw4FZuBQxMOh7ymb7CIAevecuv2vLW1q4e1+76YftuMEavlFpLLpY5Au
 SJ3k18lbu/QsI/+YiwoTy5ZMSvAlYcBb3BOueGrTFVmgQiLGgQGhMa2z0BwtGD/4XX9e
 CjfMdtfO25dsvzPzXaKPtjxya5n2Xr3QYbtbQzW73pTkeoDDBq+zHr07O67fYr8vIhwv
 Yqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WFdc4SH1Iulou9qYgYBQGfoZtnnhVU1CnDj8vAu45kc=;
 b=azaphFmJOYuXkDewFiTdoyKyKLQb22kkt52Aoa5m8YDtlLez/ueDXJROH/1rVQyPyX
 2Z6uxPqpqWO1GVLyG70ZRaSKhpvvZIkW0uD1RPT20osgKKCY5H0V09m2XnfeBzpy3+Xj
 bM9L/24XNcyFWfbsjRSqcGQtBZPUKYU1oRxtjLuIos6xXS8XjcXB+l+7IBfKAktl8jRo
 1g/5FOXuQreXaqP7XE/q2wMJHyhimE/nZ2mM9xB+Gd27OerIEcvf3gN6KlS4Waqo1l7x
 W+39Ox7PJtp7J7S+YXtidVVmI+uApOzxOXn5p2F//gdL/7pY6/p++RajgjDZCaYjUTwb
 LeVA==
X-Gm-Message-State: AOAM530qUrpPrTcaeVYW4V9A8KZ2rXV5ydfB4E1w5kOFoqgldAp5pMV5
 BwfpJrXb7shPfXLn5OzIdbo=
X-Google-Smtp-Source: ABdhPJz1a/9PvGrBgYj/xTM5peJkjvqZ6wo444zg84ZzKqMUizLT0jDE3tcOqaLR/ocL4N+77TX/XQ==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr6764290wrm.291.1600806683396; 
 Tue, 22 Sep 2020 13:31:23 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id r14sm27256849wrn.56.2020.09.22.13.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:31:22 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Doug Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/3] drm: rockchip: hdmi: fix clock rounding code
Date: Tue, 22 Sep 2020 22:31:05 +0200
Message-Id: <20200922203107.2932-2-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922203107.2932-1-vicencb@gmail.com>
References: <20200922203107.2932-1-vicencb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Under certain conditions vop_crtc_mode_fixup rounds the clock
148500000 to 148501000 which leads to the following error:
dwhdmi-rockchip ff940000.hdmi: PHY configuration failed (clock 148501000)

The issue was found on RK3399 booting with u-boot. U-boot configures the
display at 2560x1440 and then linux comes up with a black screen.
A workaround was to un-plug and re-plug the HDMI display.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c80f7d9fd13f..92efbd899dee 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1176,12 +1176,9 @@ static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
 	 *
 	 * 2. Get the clock framework to round the rate for us to tell us
 	 *    what it will actually make.
-	 *
-	 * 3. Store the rounded up rate so that we don't need to worry about
-	 *    this in the actual clk_set_rate().
 	 */
 	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
-	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
+	adjusted_mode->clock = rate / 1000;
 
 	return true;
 }
@@ -1380,7 +1377,7 @@ static void vop_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	VOP_REG_SET(vop, intr, line_flag_num[0], vact_end);
 
-	clk_set_rate(vop->dclk, adjusted_mode->clock * 1000);
+	clk_set_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
 
 	VOP_REG_SET(vop, common, standby, 0);
 	mutex_unlock(&vop->vop_lock);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
