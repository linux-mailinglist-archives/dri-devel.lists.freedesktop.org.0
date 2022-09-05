Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0285AD95F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532010E4AE;
	Mon,  5 Sep 2022 19:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76FF10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:31 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1278624b7c4so5039961fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eZii4gjhTjK0xhJIY2LpP4ehNrQlhadyaeGAukQmRaM=;
 b=WXPY9c3ZBdlo7tB76gcc5dIWT9zp/31n8vXXwr6cEGm1t3dLlb+ntW+JY7THPkQ7Ry
 BVklK4nRrmv19p29oLp8uCQ44d6sY/2qXiyGSnxgVCRqhZx5ruXSYRCvE5fRjOgBbEw3
 47nKZbrNHhAMUJ5QvmVNjX4IKDnPv20Y7hO45iSHMwRqjMjF7yqrLlzTwQ4OxwYhArDt
 663XCYdRXxtEQIDQMH/YAoEnv/gk+U+TQygRZNGWrbKrRMSgDvlNQiN1Zbg4GSNeI77Y
 /ad1w2TXb2SNIcMzxaspIykEzmRzE86ZzMf3xykkDxsjNJkpg5rwbiMurV+5x5FxuDQW
 E9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eZii4gjhTjK0xhJIY2LpP4ehNrQlhadyaeGAukQmRaM=;
 b=LDA6aZ2Z42I0ZyPa3HvNz+ISW/YBCr86gK0HcncY3m1TQyWovVHIOfc31TheyD7HQ0
 eSMM7zQG7LiFnRxkqcTfmya4LdB9Ue1KRaeutpoqb0jV3YOGXgnUM40fVUXFB2sjurS1
 PNDOzJAIfm0sLoCX0IpdeTWZRrVspYZA51MZGZzEqJc/fZDkCxXsk/gD3JS0CuYwMmpX
 9QnjwGdH3U9mQ/UD7D3RYW14petvK0K/QKiyuMDJGrFsA/YvBBxAkjQ1EIQvsXHBTW9p
 J6f0Xt818Dp5fGVHKrR80PRBoLIUNr2hb3oY/F121Y6vENsPaSnLheGtRz5Cnp0grhqb
 ZBmw==
X-Gm-Message-State: ACgBeo2xBe6KAH8D19ol2M3ALvKFRy9UZEhT+9YiDVYaC2xGWQBo4XRH
 zwEVBjSfvGtgvQf4Hid1j0g=
X-Google-Smtp-Source: AA6agR62497O26+DxtFXn2yuypdT6JWMc4PmdvWZiMp/I3v8UVRaB+nDeNbEh5Tx+pigBSgL+gqNuw==
X-Received: by 2002:a05:6870:e612:b0:109:d5fb:144c with SMTP id
 q18-20020a056870e61200b00109d5fb144cmr9972198oag.195.1662404911255; 
 Mon, 05 Sep 2022 12:08:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:31 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 1/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Mon,  5 Sep 2022 16:08:03 -0300
Message-Id: <20220905190811.25024-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905190811.25024-1-igormtorrente@gmail.com>
References: <20220905190811.25024-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 1d60654b553b..ae6c5a3d356c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -31,7 +31,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct iosys_map map[4];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

