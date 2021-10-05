Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41742317E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8056EC35;
	Tue,  5 Oct 2021 20:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0A6EC35
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:17:28 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id e16so350076qts.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLpOU2gtDlN/t3YQqeM1ZuC76+nni+Jjgvk3fLJVQKY=;
 b=RwfG7yaYvor7iaI3TZc1YwftZ27vcx7i0037yizes8DSPwQ9lcL5MSDT9l0mqhKyDH
 iDX1hitbLAWnMbfQmw3tbHYlmxNMNVkmvzVUIzny978etjMoJ3e1qWgFHkDRtt8JwXA9
 i47D7HgfjzL2YD7gkhYn/54tIbtcy4aBVkRJGWDZ/OgtY57gOYWOUPAELR/PDh4hoxku
 eKZe0ahF45G8hlDXaxhqw58JImQGwL1d6aFoHNYUuUmFzpk2SRailTLrmUqbTjYvMn5c
 Ox7Kvr29srBP1p5VHj5DAZKpqPg7TfoAx1VHqBDbTlrRTnoDx1ctxptAu85c7Y7chNTL
 iO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLpOU2gtDlN/t3YQqeM1ZuC76+nni+Jjgvk3fLJVQKY=;
 b=A9ApmoTe15zkOOYuf3dulCdayKrUUKu92wiN33hc8ClwFV6LWGtPKA3EaRU7oLh14f
 UqpJ0R3++0uCrq3oLBwuHVzCbz/AKsPyBRnL0a0Jku+gBdf3lToR8ghIPK4lRg7fivmv
 zd71I1oJJhWDAPL3sEc/uWjDF3PA+PamlC61cJUNQjSPNffb7AkVvvk7LV6HKs0Nt2vn
 H8IaTPyEAiqHupiuIkATDoftOvO+gQmvz5SSGEc0fCZh32JiS80UkAI8WJN4Y6QUBFmO
 FOzancF2W7cWI//vhCtfDugXqpEubf59a6KqwSXI5cPd8vMYimH3M0QicXC3nccbNaTf
 eIyA==
X-Gm-Message-State: AOAM5320j59Ku9/GfwbV3UfdNIdh6Q1BHDIz2JgSIVxtJtoYIbWKKF6Y
 EXrsqLms0aCm6pDVc5AuylI=
X-Google-Smtp-Source: ABdhPJyctVOHylaCsucvT+4OfzMwlJtBm8lqPYlWmlvb3RV4i5pAD1BpFisEj8qbW1OkcJN2waEaMA==
X-Received: by 2002:aed:27d9:: with SMTP id m25mr22303427qtg.85.1633465048127; 
 Tue, 05 Oct 2021 13:17:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:9b98::1007])
 by smtp.googlemail.com with ESMTPSA id j2sm13056905qta.84.2021.10.05.13.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:17:27 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH 3/6] drm: vkms: Replace hardcoded value of `vkms_composer.map`
 to DRM_FORMAT_MAX_PLANES
Date: Tue,  5 Oct 2021 17:16:34 -0300
Message-Id: <20211005201637.58563-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005201637.58563-1-igormtorrente@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
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

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..64e62993b06f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -28,7 +28,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct dma_buf_map map[4];
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

