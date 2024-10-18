Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D69A48BF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14BE10E9B9;
	Fri, 18 Oct 2024 21:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cjqWS6KU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F0C10E9AA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:10:40 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so4156634e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729285838; x=1729890638; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=foLEB3IkBWHubF9wiB7Qykhc/Hfy+axzkwl74pUgfCE=;
 b=cjqWS6KUxbOgCSiV/9dKa+kkqUkukWQ+Rs/n+SyD/ZMpIbZAX9sVUDs8jNJcOhS373
 ighQ+0BYUnOuVvEyTRrrWybw4NRWiFBkksHf/PMsp2ryBo/gPfia/PwR2Fh2an6xrFoi
 J4li3c1+Kyku+MHvWhCoIZus97hU1KZut/QNjnfKIyNHOVTZeo81QwEt0lEsNp+evk65
 QNH7jVAoBpoLzvViIC+QilBflOMjgg9na0VgFBghaNxL9047Z/YJNqLQvx5zteq60+ai
 i+XZ1D0tzv09w3Vt6CHJRNsj12OCefMZnwS5YL707OPv7MUKz6BiYzSXG8bMgWKQUKLk
 XvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729285838; x=1729890638;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=foLEB3IkBWHubF9wiB7Qykhc/Hfy+axzkwl74pUgfCE=;
 b=vYhonJ90l7RqgwQq1ZFV4Rz8EJzq35ONTgKNglMDBFCuvx3UcJ+1p/isaWAfMRn0W1
 tcQr7wpSPwHuS7QUN1y5XrhJ2ajYFp2xdlV+V2MZ30Dka/5coMsszqYVQHqyYPkxIuJn
 nnJ0mcmgM2iIOqpBSfMMmU4k//aor4YTFBmiTHpspNpvy/TYHjO+O5rxf4evbprx8GA+
 6X6dvNl0jH23cct8vDZ7TL/gym9dhQLojlqUKqaoEaUD3adKg76sbuwLsBX5M7CR4CZ6
 meEnnu3/94e+eBwcxB3bkG15tdWO30JhFcNvtnceCid7CKh90w9cMLNzrtvIJJ8Nfpxt
 o5JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWexwgXGLx8sScYSpm3BIu+e5gB+efCptAiH61nD+qajxMwsbNJglx1josujD2P4nIkV/5y9Fx6t6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/PjYlss34cwXmQhP8UF9uYNIxSSxgGWnSMjVTf3ELTppGwsuB
 EXadbTracBT+z5i5/aXLhKTH4sPRIIwOFNmZWRbHWIcCWYm/Ay3aBkrxiA6AnMs=
X-Google-Smtp-Source: AGHT+IHt9oXi+IhTVxmWhRKS1ReTT9GguWan85tSMWRnx+jNu82vXpqvZtb54V0dm69fu8rQ4ETTRg==
X-Received: by 2002:a05:6512:308d:b0:539:e6bf:ca9a with SMTP id
 2adb3069b0e04-53a1534117bmr2562285e87.6.1729285838429; 
 Fri, 18 Oct 2024 14:10:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b0312sm331171e87.51.2024.10.18.14.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:10:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:10:34 +0300
Subject: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMnOEmcC/x3MQQqAIBBA0avErBtwoiC7SrQonXIgLTQikO6et
 HyL/zMkjsIJhipD5FuSHKGA6gqMm8PGKLYYGtW0pEijTx6d9YISLo77bNgidao3ZI1eFg2lPCO
 v8vzXcXrfD8wAgRVlAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A3EGjKxsej0bqYegaiMoauAyA0UdndhPqjQLZupQTLg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEs7LQ15JYU+h+GvmmE15FMjj+jK9vWjszep76
 N/7j+DnGuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLOywAKCRCLPIo+Aiko
 1auUB/0YiI8y9HJuL2UVQt00hcYEtprQ2lks+FUovYIMXsYT3iNFlLzGN1WTCFLxQwr8VpzZ1vN
 2QnReFAchDkQYO6NFgzHfMiNbdveVL5z2kZiYMNosWQ6rdrC8ki5r+b23vz2LrOv6tF8Ptyw1Mc
 qd2SHhcz6Z9I7eg7Mtw/RbBcArn6IBG+LHyQpdtJl/D3Z3YYgJNQJkRd/h/topE982IOE97TJEY
 nLkPs0YyQEYv3/dx8Dpa53BZZeeuFtvCHV+3pnTvCeZLMCAxh9Cf1qgslr5pwP6P1wU9kn5PJzp
 0kFUCqj/sJsnbNnlvwoEviCNWc3PYYhNMP/j7yHCqWaFyXv0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The MSM HDMI driver supports interlaced modes. Set the corresponding
flag to allow interlaced modes on the corresponding connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..643c152e6380 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->funcs = &msm_hdmi_bridge_funcs;
 	bridge->ddc = hdmi->i2c;
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+	bridge->interlace_allowed = true;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;

---
base-commit: c4f364c621d0d509190d673d80a9b23250607b4a
change-id: 20241019-msm-hdmi-interlaced-1508c1dc9bb9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

