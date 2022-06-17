Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7A5500D9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877A10F87B;
	Fri, 17 Jun 2022 23:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78A10F813
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:33:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e4so6219332ljl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9plUk4yuJHI9KQEwjKvSKAhzBHEdS1qic5Z60CrCjLI=;
 b=vwYNKA3mFqnN6V3Y0psPcXFYgGmC7OjV0mQTP0R/36Wp4nsaDK0xw8EA/8M93r/d72
 UBeXvvd617oBpcfeECb8QB1p1QKQOLExELPmWCT8rinXftWy5z0cjH/zW+r8nQdMjogv
 1rHrUfH54XhDdG9jYD2ZA5cxHobggE95E992uC+wHqrh90xC06zbbcT3JK1UCcdxE2Ve
 fo9iI38UmP76cqTifI0SBUwJBIOUig8xU8EViQ0ErNfOIbr7IQoqLOXcjr3tbLtUUu/B
 EmpXderT7ZBZ+jCCX1cC0Xz22iZatkiSsR4U+47Vrm3sqe6F0FlE15nRUvLnUZXTmVo+
 Nyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9plUk4yuJHI9KQEwjKvSKAhzBHEdS1qic5Z60CrCjLI=;
 b=EoDFS+JgH9mOsUr82f6I5PvamgJA5Phk01j7j0KFM9RZJP6lCnDziX73I509N6DluG
 HQQKpDJsgQRXiggnc2OhjwoZVuCA3JjGGUxkkOx0d2dI5hIIwtd9IiLhb+s6C64fpb2G
 PHq1lJRWbNEnwG99pRebO+JZww6DhXfxH9dq5fVfjyoxuhQlhAWnLEmi8eV6Xo4teI8d
 hmxv+ixTqvvELRoaBu6DE4OXYLCLT7+F2OZuv79cJT/cTp+K8l1poq91XkyzufqyChqL
 E3Y4HsNifHcdCdjZhvIybk5VDsOrqW7ynX+nnAcrlk/LejUj7BhprJ2wN51ZjkcjZy0t
 xtIA==
X-Gm-Message-State: AJIora/j44wK3fy1h+A0Eh25zqDeBGta/bs32QKjXQXfTM8/cu1ATuKu
 X0I4YMGJ6pZjzS7DGte74TQy1w==
X-Google-Smtp-Source: AGRyM1ucXsrdIM7nzBNXjCAc2D9qJZH6jHx/c1+TagewrvF+KfQOEgkB+zuAhD9m+o2RYJMWtS0+FQ==
X-Received: by 2002:a2e:9958:0:b0:25a:541a:1273 with SMTP id
 r24-20020a2e9958000000b0025a541a1273mr2287584ljj.516.1655508811728; 
 Fri, 17 Jun 2022 16:33:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:33:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 1/4] drm/msm: clean event_thread->worker in case of an error
Date: Sat, 18 Jun 2022 02:33:25 +0300
Message-Id: <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If worker creation fails, nullify the event_thread->worker, so that
msm_drm_uninit() doesn't try accessing invalid memory location. While we
are at it, remove duplicate assignment to the ret variable.

Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of kthread_run")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..1aab6bf86278 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		if (IS_ERR(priv->event_thread[i].worker)) {
 			ret = PTR_ERR(priv->event_thread[i].worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			ret = PTR_ERR(priv->event_thread[i].worker);
+			priv->event_thread[i].worker = NULL;
 			goto err_msm_uninit;
 		}
 
-- 
2.35.1

