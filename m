Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1E790410
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688E910E02F;
	Fri,  1 Sep 2023 23:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733B910E029
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:40:46 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-56a55c0f8b1so1862097a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611645; x=1694216445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1LlxEF4RQMcRybMyLUYgejZ0HV1kn3rreyInd+SMhw=;
 b=RoI17cqEs2v8oWOvrPur4Q5Z5N01QN3EqbDt3RNlOlTGhl2yXekHBI3G1JUps4j8tz
 lUGFKhciRij7cca5NUVkRhgoDAPzxi8BWb7m8pK5PRENk+LUFNAhEYzmsiq2VsSik3HI
 +iprbbSN2rGNw1OmYHUfADUbpabnO+z2MgpjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611645; x=1694216445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1LlxEF4RQMcRybMyLUYgejZ0HV1kn3rreyInd+SMhw=;
 b=Q8Fz5u9s6QPPFs3wtz9Bz11UTfuMDhl8weTtkpUWFRdw3WTzonb1+3yo8xMv/CuAhv
 gD+QkGtMuQz/+Hv3L8cJ2Yk5VF7MdvDLoOhN9PhgM0i4CQyIvjqtKOHFv8njZZqHByHG
 ih6h2jDzkHzJl8rhnYJnSdXFX387d8cGliF0yQt4Pb3IGL1qto2dZptP34/ThllwlcK9
 7/uicudKsM7LnCLn+CtTB6aeInXxAi99E5+bkJk2RqYS9Jb7+GQmRYXF4xtInjoTTk/8
 YYUkHIgDSpUJJH1/7cgzNC8LI0vdFwO95qVbntt7rEnoMZFIyyM0571VpC61MK+JVY87
 IcLA==
X-Gm-Message-State: AOJu0YxUTWzoZCzPpINgjk9xI4DeVX4JNnqDH0/7ErJCGwsSYxMnmXyt
 yCisyFUzPjaROTh9FZU51GuwKiZc8WqJYLlZrmm6intc
X-Google-Smtp-Source: AGHT+IHdqIX+XBiRHTDluS5KvZ5QkvIQj+FK8jGum6b97Eu1rT0JDLuFn7HoN6B/O2zYYxeetoxxxA==
X-Received: by 2002:a17:90b:33cc:b0:269:96e:7d52 with SMTP id
 lk12-20020a17090b33cc00b00269096e7d52mr3827916pjb.26.1693611645262; 
 Fri, 01 Sep 2023 16:40:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:40:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 1/6] drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
 should be a noop
Date: Fri,  1 Sep 2023 16:39:52 -0700
Message-ID: <20230901163944.RFT.1.I906acd535bece03b6671d97c2826c6f0444f4728@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As with other places in the Linux kernel--kfree(NULL) being the most
famous example--it's convenient to treat being passed a NULL argument
as a noop in cleanup functions. Let's make
drm_atomic_helper_shutdown() work like this.

This is convenient for DRM devices that use the "component" model. On
these devices we want shutdown to be a noop if the bind() call of the
component hasn't been called yet. As long as drivers are careful to
make sure the drvdata is NULL whenever the driver is not bound then we
can just do a simple call to drm_atomic_helper_shutdown() with the
drvdata at shutdown time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_atomic_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 292e38eb6218..71d399397107 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3339,6 +3339,9 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
+	if (dev == NULL)
+		return;
+
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	ret = drm_atomic_helper_disable_all(dev, &ctx);
-- 
2.42.0.283.g2d96d420d3-goog

