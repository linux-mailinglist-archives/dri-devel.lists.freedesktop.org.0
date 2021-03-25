Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D1349BA3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 22:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FDF6EE4B;
	Thu, 25 Mar 2021 21:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C66EE4B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 21:28:24 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id c204so3386283pfc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ar68jm2yqLLP/HtYyEXI6uh/AJB1y8cS7PMCnpcIT0Y=;
 b=TEhkRsQE/1x3MCeVcTv1S4X5n9NVnMa/jFa1XAMbvGy39rpRV1ols2bNLEAqx+w+h5
 g2Q8Cf5S/EzPjEVGrOQzwY+XfoaFuzar68pfaJd/vxur40Pn9WtqXa1pHKYOkFb2L6Ii
 ZRPcqJ7LOVPXZga+/NH+evnqAMK2sye1eGuMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ar68jm2yqLLP/HtYyEXI6uh/AJB1y8cS7PMCnpcIT0Y=;
 b=Db2XF7hLXzWulluRL3OmGyQjuVPRKMUzL3xxROnAnOrkp5C2pkI50uPxM38dGaOLvK
 W8KZfyAAAFr1EcpY6fFi3zJTJ2NmLsxGxCStPop6oG0nFRWxKgH+dJWd5MG0Bv5Bhvb6
 Eb/OPKKGlNFNvQGcF8lpcKYvBEhvRyG8VtNbMTa5s4lGZYKn+Cj3Fo7ebein0I8LWJlx
 eHqEWtp9GfEQsd5HFhFH6TvLpze6exeLAvAWLoREDH9586ueuvDj5befpl8H4wPtCpQY
 pmKEuNEfZ2c3ATlwxxFtG+FJK84p5eJPVi+yeOpuAVwcGm7AEyUgPCi/c6A1oKzO6oDb
 nYag==
X-Gm-Message-State: AOAM531ZuFaN0xVKfpqza/fI4JG4exywlWMh6SwB6ECtKnbi/aCvuFUN
 qjoEaL1bKUKkACIxNK0pmZJj8w==
X-Google-Smtp-Source: ABdhPJxb+M1K271yeV8ZJZrouwWTafpUJhJVRUBFQFGmitdZRBmwSGYAIxMD8Z4uVYOLg333mONJ/Q==
X-Received: by 2002:a17:902:dad2:b029:e5:e7da:cbb0 with SMTP id
 q18-20020a170902dad2b02900e5e7dacbb0mr11705640plx.66.1616707703977; 
 Thu, 25 Mar 2021 14:28:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:18a3:238:26c5:1521])
 by smtp.gmail.com with ESMTPSA id e21sm5880792pgv.74.2021.03.25.14.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 14:28:23 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm: Set drvdata to NULL when msm_drm_init() fails
Date: Thu, 25 Mar 2021 14:28:22 -0700
Message-Id: <20210325212822.3663144-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
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
Cc: freedreno@lists.freedesktop.org,
 Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should set the platform device's driver data to NULL here so that
code doesn't assume the struct drm_device pointer is valid when it could
have been destroyed. The lifetime of this pointer is managed by a kref
but when msm_drm_init() fails we call drm_dev_put() on the pointer which
will free the pointer's memory. This driver uses the component model, so
there's sort of two "probes" in this file, one for the platform device
i.e. msm_pdev_probe() and one for the component i.e. msm_drm_bind(). The
msm_drm_bind() code is using the platform device's driver data to store
struct drm_device so the two functions are intertwined.

This relationship becomes a problem for msm_pdev_shutdown() when it
tests the NULL-ness of the pointer to see if it should call
drm_atomic_helper_shutdown(). The NULL test is a proxy check for if the
pointer has been freed by kref_put(). If the drm_device has been
destroyed, then we shouldn't call the shutdown helper, and we know that
is the case if msm_drm_init() failed, therefore set the driver data to
NULL so that this pointer liveness is tracked properly.

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a5c6b8c23336..196907689c82 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -570,6 +570,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	kfree(priv);
 err_put_drm_dev:
 	drm_dev_put(ddev);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
