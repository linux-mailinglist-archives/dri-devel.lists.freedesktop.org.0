Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D144753B43B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6605D10E5E4;
	Thu,  2 Jun 2022 07:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7806110E5E4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:19:13 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 7so3234667pga.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/AgL3mhclsRnOIjShcky6P/zYqYoTK5YEABahucPLqo=;
 b=XSLWBrUEed9Lolpsa7uO5CbaR4AjyTCecnUaFW3y4NL9c+E4gUNBk5OxOyK964p6/1
 7oHCe9/pZ7fI2Ty8Ps0Nyn6XXFbISwCb/KnD5tEsSR/JRssY0j9uVSmupr9OL5hch6Xl
 SfdubO4H9O2FRKMe8jCT1pnYCmj6Qn4Y9UI+CeqQzJyoZuldfgouaUXPh/NjCT+W6kXk
 Zw/ZdsRRnXKVw64lI9jysyfsn8h5oNJWRzmouJZBel28yszQhnTQnfcqDS7MOjyLwOaC
 yZcHvzvYuxiPP21sHFbaTmAQmQ4xBsX3YWLYdF00j+a9Xmusg8/AmRjkq8dvC5GJN23e
 VP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/AgL3mhclsRnOIjShcky6P/zYqYoTK5YEABahucPLqo=;
 b=QYzI9dgTyHWJgzv/Quqnge2Jh75Rz+NbGSbi3i5ZvKqa0KjexFlWnh41M9XExnUz0i
 BTTiQojqwdTrNvlFvfl5lgRdWhnmqgdp7k3Jz60UFo6drX7SPcCn+jbjHxiJdI2Lg2bz
 LU0VJcq53NTVPKBZebThAHczhPY4asYSbzJKo4YfBByuLPnaSFFcLy89gxvoT05R6Nr3
 h8K8Qn+sXOp6pCAyrta0NgnUr58owGAOHuH19s20mjqVfNONXyHkQo+PiLS+ikERAySY
 Fegycz5R8QQt8N0mPc1VpeSK2d+6aJigXzte3ttPoZPrTM7rN1gm+l+JkblMxPNDPInd
 8K0Q==
X-Gm-Message-State: AOAM530ME3GHMNd/4Kj1/YGLOBmjoFqZaWQXmonaGwT7V+9qSVk0stm8
 7d/JR3obZftBJ/YX3k31GEw=
X-Google-Smtp-Source: ABdhPJyNCRxM1xVeTV9AnJRopo/U6+CXHO8H9eRsl8Qtk7uNHjQIPGjV+6Xm3bcluRIWA8q+ko47pA==
X-Received: by 2002:a63:187:0:b0:3fb:16f3:ac7f with SMTP id
 129-20020a630187000000b003fb16f3ac7fmr3032548pgb.284.1654154353050; 
 Thu, 02 Jun 2022 00:19:13 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170902d50a00b0015ec71f72d6sm2831603plg.253.2022.06.02.00.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:19:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: thierry.reding@gmail.com
Subject: [PATCH] drm/tegra: Remove redundant NULL check before kfree
Date: Thu,  2 Jun 2022 07:19:09 +0000
Message-Id: <20220602071909.278279-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

kfree on NULL pointer is a no-op.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/tegra/submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 6d6dd8c35475..54ac31bc80f6 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -639,8 +639,7 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 		kfree(job_data->used_mappings);
 	}
 
-	if (job_data)
-		kfree(job_data);
+	kfree(job_data);
 put_bo:
 	gather_bo_put(&bo->base);
 unlock:
-- 
2.25.1


