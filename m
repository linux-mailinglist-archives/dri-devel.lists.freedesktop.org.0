Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73263273C55
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B406E11D;
	Tue, 22 Sep 2020 07:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567689A5C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 18:18:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so13814445wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7apNRD9MQ+dEbnQVbfSw0In2eqPMXGuCV372ylb3ZQ=;
 b=ERLVZJ3EXcEKmJVu0ezDXvmSIS0V/PJ7ZnNVSQU0bJzm3mg78YqOJG4OiMDYfgJSwn
 y47D67v7BnubGcSiUowbyAbNcgxuWhfWYvTewcbRZ+qYql4qKjcnB2kVzfIuh0vVW7nK
 qwy3st9zBZ8CKdqilTBd59a4KeX6l9H6Jw0NafiE1KJBXeBCYAApYcO057b3aKjSYQiP
 cHgbrOPRX7zdCJZTLInB1ULvxBlQoCSfWmWV6+AMSYLVt2o4QkhHgLY3Bh9gwkxkh01o
 2LXJ08//lk7qjbTrxgJzeOevrGAZL5AvSoXmBzKlrtCoj90pqwhbjZddLRiD6bNnSzbN
 PLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7apNRD9MQ+dEbnQVbfSw0In2eqPMXGuCV372ylb3ZQ=;
 b=od+DBezVq8korWqNfXnCCnKhYUZP5BTLhc3yFYMUOpDgZzUyi9jkV2oyDm+80FUUHe
 9jVstygGU1U5HtYn+ftdMgLUhoMN4FuRuiDbP79u3rNuaYxhduPd8qWrdFTSeo+1lESE
 5nrLate1bi/UfzcG3sbjHNJTjlsc9pY6jNBe22+p4/jpUQBKs2IHcRVvBZZHdy7bvLwC
 b7cwgSnp+eg9J1hZFxL7lGgh7Rg0v76qg2Vnh2+17cyIhIPMWzHANE7du7ZLHHDygB0H
 HGlrS/QZy07A+ZL7DfqTMxBPO9E0pJaoC89YrKeNlja6b+EVQNmqdEEm8KMfZOwYJyEs
 WAoA==
X-Gm-Message-State: AOAM530xajxvKxK7Y9AvKkOgisvgRQzIOUzYQgvPDy1iPGE8U5BdNHRI
 RRGUfCMiUBxZgxJuFQiljUU=
X-Google-Smtp-Source: ABdhPJzeDbyqxIujUGLCtG0+lY+QlhF6phMdhTwizmUx643F/K9o2bqH6xuMl9rJ4hLXgbgbNdH9sA==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr1130170wrr.149.1600712310132; 
 Mon, 21 Sep 2020 11:18:30 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id h16sm23523249wre.87.2020.09.21.11.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:18:29 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 2/3] drm: rockchip: hdmi: allow any clock that is within the
 range
Date: Mon, 21 Sep 2020 20:18:02 +0200
Message-Id: <20200921181803.1160-3-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921181803.1160-1-vicencb@gmail.com>
References: <20200921181803.1160-1-vicencb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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

For a video mode to work it suffices that the available bandwidth is
large enough. There is no need to have an exact match.

This greatly expands the list of supported monitors.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 23de359a1dec..87a9198f7494 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -230,7 +230,7 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
 	int i;
 
 	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
-		if (pclk == mpll_cfg[i].mpixelclock) {
+		if (pclk <= mpll_cfg[i].mpixelclock) {
 			valid = true;
 			break;
 		}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
