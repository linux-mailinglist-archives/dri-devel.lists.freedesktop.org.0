Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBC1EB8ED
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 11:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58966E11C;
	Tue,  2 Jun 2020 09:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B76E0F4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 09:55:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so2739058wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+Uzz4Q5qO5ZTX6q4vn0R9ZfiBdftapYOGYcasChACw=;
 b=Gqoa9L9tROgitus4ET+BWcmGS1ZqVQ3XSdXTqfjbCVlbfh1zOK/ixpLLNJbwfSu0Ea
 6LpaEVW79dkJ6KETbIJWV/GGtgNxvwH5JS58OzOGMbw+5jORK+MEwuEox9tKQIwlMzdO
 XKgQ7KI0jgyDBbIlzMgk+xx/8xfkhQdTIm+qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+Uzz4Q5qO5ZTX6q4vn0R9ZfiBdftapYOGYcasChACw=;
 b=Aztcr69vAh1SMFyTtBuN7qx/VRg3N5HToa9UIK+6yHC/XqFcWFbBVx1S5hcgmV3HEn
 JsAYHxQCNq8Ds6VOHLpmQS9TXIcpFUDz2P4Zd5FDHJhZN9x1fwPacjoOiyqMTu/nGHK6
 jJBMs87/wnJjEuhLW9FjUavC6damuhvifIqz7EnkwXkJkd3wZ9uinC31T1zyb39RgZc+
 /QKB9kRrsMsN4rj6NF0EjyWwf73w1nfKWYrhf6URdmx2D4RKBnYPyI0zjc+2P/Z+QAW1
 Zc0Xl5weNPm3MGA4jlSVO9TLd07XmMfCebBXkWiqh/HPFG3fy9W0rMlij1YFuT9+iR5Z
 7bUA==
X-Gm-Message-State: AOAM530n+tCb2XPXm/ljUhCkYBwb9GKp682lB//1I+2WaEY4ycYndycM
 h6UGlUNPdsnlGk+SQqTUpaH3XYI2HKQ=
X-Google-Smtp-Source: ABdhPJwAHJAJ5nX/yY4jBwec61op048ceDu9R0jIXfVdzNruIdMkQpqGrC2T99XHNXe8/nsJgMPzVw==
X-Received: by 2002:adf:d852:: with SMTP id k18mr10439549wrl.177.1591091716134; 
 Tue, 02 Jun 2020 02:55:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t8sm2840846wro.56.2020.06.02.02.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:55:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/malidp: Don't call drm_crtc_vblank_off on unbind
Date: Tue,  2 Jun 2020 11:55:05 +0200
Message-Id: <20200602095505.37509-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602095140.36678-2-daniel.vetter@ffwll.ch>
References: <20200602095140.36678-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already done as part of the drm_atomic_helper_shutdown(),
and in that case only for the crtc which are actually on.

v2: I overlooked that malidp also needs to have it's interrupt shut
down reordered.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 02904392e370..cdb817a7c611 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -928,11 +928,10 @@ static void malidp_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	pm_runtime_get_sync(dev);
-	drm_crtc_vblank_off(&malidp->crtc);
+	drm_atomic_helper_shutdown(drm);
 	malidp_se_irq_fini(hwdev);
 	malidp_de_irq_fini(hwdev);
 	drm->irq_enabled = false;
-	drm_atomic_helper_shutdown(drm);
 	component_unbind_all(dev, drm);
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
