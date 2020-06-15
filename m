Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3F1F8FBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381676E262;
	Mon, 15 Jun 2020 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3506B89CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 05:49:48 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m81so16521526ioa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7ruDvGofOhhRFxjxzvARwe0MCxEQwIr7VVI2CrJkuL4=;
 b=B9gX5dcbUS3bQsdiuc+bkQzsjfJd6Fx+AEvjavyFA2RhdMhufaEBmncOBD3hmq8PDJ
 iH5AEtTVMXidRaD8hAN2naz3vlWsBM12gwEyDWb4O56ctGvLDkWK88IWOGxcv+YqdrV1
 W417gOw8P7mKooMH3F5Q3YEZZdhyPszJPQp1il0m1BBN2sPz0i5VP0hvfDzreYKlZg7U
 InnfEKE6Rv/eW59qNfL1orn/KdSa39JC+pSkSpwqAJ4DnBOXtU82Q6PS+08jBQLiJA5q
 fN3he/jZsj12Df9LLUuLcb/lZRYVEscizts7xMOkjb6qfml4m0qVgxpHW3Bdlr+nAycN
 spfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7ruDvGofOhhRFxjxzvARwe0MCxEQwIr7VVI2CrJkuL4=;
 b=UfjG1SX5cc5u6BTRiMruyq9n1MuY+zNurtLeXjjetI9YfTmr9HBUgYVkw48U/+XiAb
 xmMbrQuoHQEeHmbneXy8gs2eEcQLhKFe29DzXBCqC7v4DiL/CMoI0sqv4KXAatjvaYgR
 Xs+51nMm4hJTzy//+onrfim9FvSw6dVysxuEtTSjU9+63an00gWh8W1+EDazEb3Q04SN
 NcDLjE2DMomxDdrlEXiKJrq7a3epH5VRTUfXH5NC6imBdMvyYZBLV69lWKiTrUIB38+x
 K3zUJ2IkaQTQKZ0Pq5wj5DAyfLsc2Xd1xo/DqvdgDUk92TWVhq02/KyD0FnDwQ3Ywlhs
 ngtQ==
X-Gm-Message-State: AOAM531Jh9E131g6D5GvW2M6woTP/X4zOoQ7qv3yMrYcpjcCVUIrM0mU
 Hz3/JVQFMQYwj0+v2uGWsHA=
X-Google-Smtp-Source: ABdhPJxruih3vxQf+sbzwLJl+cYEVjlMuvcKUBOAnwdFXsNBfhW7Wku97FRJRruNTcJqrexR7qAQAg==
X-Received: by 2002:a6b:39c3:: with SMTP id g186mr24984270ioa.91.1592200187582; 
 Sun, 14 Jun 2020 22:49:47 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id k5sm7395066ili.80.2020.06.14.22.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 22:49:47 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/exynos: fix ref count leak in mic_pre_enable
Date: Mon, 15 Jun 2020 00:49:28 -0500
Message-Id: <20200615054928.55188-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <027d9eb5-a1c1-c329-72c3-a555b71f8677@samsung.com>
References: <027d9eb5-a1c1-c329-72c3-a555b71f8677@samsung.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: mccamant@cs.umn.edu, emamd001@umn.edu, kjlu@umn.edu, wu000273@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in mic_pre_enable, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v2:
	- reuse the unlock label and call pm_runtime_put_noidle
---
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index a86abc173605..3821ea76a703 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -269,8 +269,10 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 		goto unlock;
 
 	ret = pm_runtime_get_sync(mic->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(mic->dev);
 		goto unlock;
+	}
 
 	mic_set_path(mic, 1);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
