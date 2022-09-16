Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02F5BAF9A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D0310E470;
	Fri, 16 Sep 2022 14:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B012E10E470
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 14:49:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m3so11991562eda.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Udhk4Q2S/+kZ/4kuQfb/Q3gnhZBJAS7E9brlINKWaBA=;
 b=mM2JRZPp+c5UJqx940V5iM59hJC0QcbIOAt3KcNOuW+DqYVp6zTlXPFaiwEMcWIrlE
 cK6B7yUmmJsaL0yNjfRkGHWWoaCEcNaBdcFp8zMmEnBpAHV7s621GO00GvS0waLllgyH
 nJXdVde/QH0u5+bLwgxWCRo/fp2jyn8l91o0zwVmlShXeoeToeEEjFKJvjXaQUs0sa/f
 ET9Du3muo4NojEp2iOBQU0GBR0aKqAm8y3Y7X6TA6HMpPC0BYG/i8/HeAUUIOY2K+klG
 1MivcFhQigyzuZ4B3fHD7NSiF5cfY4aMDFStsb4VjnArVCLEe3aTsYcMNHCKJ4trpoHn
 d6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Udhk4Q2S/+kZ/4kuQfb/Q3gnhZBJAS7E9brlINKWaBA=;
 b=t0DAdIpVBzrAZ83oS3rlJ0L6B8s9sN0qGAgT1+kn7HYXaIRHduDhZVXAqLqMmD1EVi
 qd6R8lCIiGDjvvPYP/2r0UGIs8QUjEZBl/2tjxM58b854wmgVEC7QWVZ7DrvXt5QFUf5
 yUz+VrL8lVqVms7nTs5I2kEbdstlSXIYZrWGi6nUk3KEx/0rk/H2v4z8ddYj7fHQRgU5
 AGoTpvzkugUto/iPyOvzEg6BiEzTm5GZuUQudiGpUXio9Nu9iZKW4UkJgAx6ZFxg5UbZ
 l6QERQbUc+K2iSVM4THbhw0IAMFEJTr5WDL35RZURjX3xpOfVcZvZnE8yVJSt9DmmZaS
 YSNQ==
X-Gm-Message-State: ACrzQf3XRNwPN/NlTwVKEF3WVD6omW5blbul49oFytSetBqeEKqi20cY
 9JTab+6ERIk1Uf35FB6M/Xs=
X-Google-Smtp-Source: AMsMyM4wosS/9EUN4XPzsd9E3cF+/d3pcXKnlIvOr72RSZ9iMIfHqeHq0GM7ZSII6npMLsrAq3roHA==
X-Received: by 2002:a05:6402:161a:b0:451:ea13:572e with SMTP id
 f26-20020a056402161a00b00451ea13572emr4293402edv.41.1663339769879; 
 Fri, 16 Sep 2022 07:49:29 -0700 (PDT)
Received: from felia.fritz.box
 (200116b82618570059b736ec202ba767.dip.versatel-1u1.de.
 [2001:16b8:2618:5700:59b7:36ec:202b:a767])
 by smtp.gmail.com with ESMTPSA id
 s25-20020aa7cb19000000b004531b137e4bsm2735103edt.67.2022.09.16.07.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 07:49:28 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: make DRM_DEBUG_MODESET_LOCK depend on DRM
Date: Fri, 16 Sep 2022 16:49:05 +0200
Message-Id: <20220916144905.18253-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DEBUG_KERNEL is selected with a kernel build without DRM, Kconfig still
asks if DRM_DEBUG_MODESET_LOCK is to be selected or not, although this has
no influence on the kernel without DRM.

Make DRM_DEBUG_MODESET_LOCK depend on DRM to avoid needless questions
during kernel build configuration.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 198ba846d34b..393d6da0d0f7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -96,6 +96,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 
 config DRM_DEBUG_MODESET_LOCK
 	bool "Enable backtrace history for lock contention"
+	depends on DRM
 	depends on STACKTRACE_SUPPORT
 	depends on DEBUG_KERNEL
 	depends on EXPERT
-- 
2.17.1

