Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE1225894
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EBF89FF9;
	Mon, 20 Jul 2020 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9301C6E286
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 20:04:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j4so14252932wrp.10
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c0T7Z0qYf9WUlRISQUZHhs4GcxCldWcEZuU3vNtYbek=;
 b=ZspbZnDizms9ElKXoiKKK5esxckOlsZE3C41L5ngf9htqd6fgAKb36noxHKmg5tB/c
 kElI64UCe6YUXG0tdG/YrPWsVnxJZM4MoUvHu3zrhT+Qz+F6vSjb/EKF75MB8scSIKIf
 fEYsgXPE+T3pT4lyd7+25nq7r480mVXS+BHKVr6WXzFvVp6menCcMvodBcD5KFZNnFTv
 /uk3MdlEphS1RlOixET0xsjPWbkL+Gs+RXNqDJYGdn+i/Ysn2mhN35H9MdlNjmpj+9jB
 QVU4HNok4nRFt+hqmotpFZqeah+WuOpfQnqxbvWRUMSlOgCTN3RrEnl6pTaqFoxEGLlj
 VMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c0T7Z0qYf9WUlRISQUZHhs4GcxCldWcEZuU3vNtYbek=;
 b=rmVxjn+P7PiYJo8u2/ZC3sEfppdrUgq5cZ77MMIEP7RNfPIcMaTmqUpt6yrk0fQkSW
 NUulIyroQOUaK5MjOkjjkZ0klHqfvfnJWz3zFCb6BmyoBBKDspUUVpDzStZrdTC/vkXx
 radIP0ktXC03qvAkJyz6wd/Lu7eNXLG3VckqxmBM1yMsqNtnoMYueXbLH4P48itVosAG
 /gmdKk8KWQRp6CH+21WpmxO79oCkZ+vMlFyvjff6rM5nUk3c00104MZ6LjPbWtko85rj
 qAm3MWVxSOJkpdJU9OMpOYSdi3s2Sjb1mVda76obfIju7CIqK6LVp9NGhXeRGCcuRn3s
 SsGg==
X-Gm-Message-State: AOAM531GaeCsFiJYwJEmuLONAEHFGQJKF23K2ejvPwVAlyncHnX5PR3X
 /9VLXkR4cBm1yey8U8noGg==
X-Google-Smtp-Source: ABdhPJwTTkdbteurLJf8bTe6KQBo79DMHcPS1mzHuaTUrXsKp7gfNu8uVCge2iQB7FqFmqAViyAykw==
X-Received: by 2002:adf:8091:: with SMTP id 17mr15006619wrl.13.1595102639229; 
 Sat, 18 Jul 2020 13:03:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 l15sm21073826wro.33.2020.07.18.13.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 13:03:58 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH 4/5] drm: rockchip: set alpha_en to 0 if it is not used
Date: Sat, 18 Jul 2020 22:03:22 +0200
Message-Id: <20200718200323.3559-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718200323.3559-1-knaerzche@gmail.com>
References: <20200718200323.3559-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

alpha_en should be set to 0 if it is not used, i.e. to disable alpha
blending if it was enabled before and should be disabled now.

fixes: 2aae8ed1f390 ("drm/rockchip: Add per-pixel alpha support for the PX30 VOP")

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c80f7d9fd13f..0f23144491e4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1013,6 +1013,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 		VOP_WIN_SET(vop, win, alpha_en, 1);
 	} else {
 		VOP_WIN_SET(vop, win, src_alpha_ctl, SRC_ALPHA_EN(0));
+		VOP_WIN_SET(vop, win, alpha_en, 0);
 	}
 
 	VOP_WIN_SET(vop, win, enable, 1);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
