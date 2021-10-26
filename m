Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E243B14D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6661289CFA;
	Tue, 26 Oct 2021 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A489E89CC4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:29 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id y11so13092316qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8AjUosguFFwtSTTUN5QcdLFCu3iDK1fKV4GOcMHHcY=;
 b=pIvdM+bPSllROd9J58XWZfllhzU8vWSjbRvnbm5a04KeMQq6iA8iRwvZOJEMuOmcoH
 CAH8/fCIERo6Mu+xvk5ItQiBgD96zTa5dhGSlTr0lr+0hLWO+Rj/MHRryB2fEa01O2R1
 HTiHYXXAhmpFrIt7BZGQBN5VnC4VVuttXWHhB2/PBh+3fs4NElCZmSHGX2OFqyIHy4Fu
 sNxuMnBxLEJvrw5sLKzSnVwa98U3Gd0DKAsr9Ra1F9qq+wEs4GnySvJ71SogcHgL/zIR
 hAThQ+uQPDSeDR9XT/PFo4RP7ybZO7XgwfLDPQlRJejQ+GWsUjprxFwcWJRn3te6OWsK
 Pl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8AjUosguFFwtSTTUN5QcdLFCu3iDK1fKV4GOcMHHcY=;
 b=xzmN0m4hpcVa+b0sOXyO9okd8YIAlDY4JWzWarPSZ2DdBK9AfiW93pVygPZ52ZWxba
 lFPc+7TcYgGJ0DiN/X2dw9MxjksdbbeeJwvMKGWX7fyY+Ucb6WXUROUmtIj4PUbvTSP+
 Zypz50gEw3hLJ/xXQjUpA8psfB356iPdJHrdsYHIjOjlRdm94lvd4mSvjfpXBTXLgW2g
 niLusm0TVmqsrQN9ABRxwjqxczO8W5Tl2EeYkyNYmUX9td/M178NUUjfKFdvfw9m5ynJ
 qvZEbFY/UeUSbBByh7EzwmC2EWLEgmwd3u+80jyAGKyLfnyQEkEIoNAURZBzxcCWsP7w
 7y1Q==
X-Gm-Message-State: AOAM532HeYDTytcV3tJukHw6Prc5yhZQVzSveRwBoeryM8ZBrVUjlxI0
 Gmge2CTe6+PU5U38MGMsn1c=
X-Google-Smtp-Source: ABdhPJwNCqGvoofJDphLJuI8ugs3EZ27U14tagTGxGaPD5Pu0+v5MIh7QJPEAY6vC6d5cZvEebvc4A==
X-Received: by 2002:ac8:610b:: with SMTP id a11mr23622405qtm.182.1635248068893; 
 Tue, 26 Oct 2021 04:34:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:28 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm: vkms: Replace the deprecated drm_mode_config_init
Date: Tue, 26 Oct 2021 08:34:01 -0300
Message-Id: <20211026113409.7242-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `drm_mode_config_init` was deprecated since c3b790e commit, and it's
being replaced by the `drmm_mode_config_init`.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Change the code style(Thomas Zimmermann).
---
 drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..ee4d96dabe19 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret < 0)
+		return ret;
 
-	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
 	dev->mode_config.min_width = XRES_MIN;
 	dev->mode_config.min_height = YRES_MIN;
-- 
2.30.2

