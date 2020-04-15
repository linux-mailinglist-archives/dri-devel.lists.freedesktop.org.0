Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6521A94CA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0366E8C0;
	Wed, 15 Apr 2020 07:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6AC6E885
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b11so6484671wrs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtP/89g9aM3u0Nm0W+HkCARJNgfXdOfm5/c36QlMO2I=;
 b=CF97yLZ0S+2v4OuhfavdY7U0ECyT2gPDGVZFyTBunwwT+4Aw6pIy1xynlekSVo7H0q
 /YsyKvZHuCmelu82TuBdQuRLEFn3hYY0vj0ym7DF4aW+9+hhepAN4zC7GoN8HgfIqSq/
 rxuYBAyJa4X0jUJzZSIRvzwchODja2SVJOj0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtP/89g9aM3u0Nm0W+HkCARJNgfXdOfm5/c36QlMO2I=;
 b=a+l9s9pPUfuonr+LYGeh7qP6A0UVUK5P2TdqMSbrljroM1FE2OJYgd2N025hzgjYz4
 37HM6fn6dpKMqnBnnff0V4vnBVxTI1x/sp4tApb8D3Cnw5rK+XdhLh2ds9Z5UpDdh1Sk
 ngFwbWzp+24hCG7gNJMcEmMr2O9TrxC4gaAHeml7xH2lPx8Ank9xgCtBOnazIMtY4mPv
 Qdw4BxsJcr74puamF1VyfLWXvZpzLZm7kME+P2UdzFGKYbO4a55d2527dUiHmJ5WaSpR
 N8jQYOXqXHGYCQ19lEyJTa6GJhqlYsws/fw6FB9BqAcpHPKjEeuV/jIOwj00dvCRSfFq
 TJvQ==
X-Gm-Message-State: AGi0Pua3glvWVu7PDvwNLfvQFFG373sa/UBSsLf4/RmuBhm9IRUsxxk5
 m8GaVQ1Ak2uwDB7yo+KMVgUZkw==
X-Google-Smtp-Source: APiQypJ6i7NFMGx2tr0yUjpjOnF/J+jRGVv86p0TN0xW/Gpxp8zvjokNui/gT/5rsow52eat5lsv/g==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr27666266wre.34.1586936473416; 
 Wed, 15 Apr 2020 00:41:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 31/59] drm/ingenic: Don't set drm_device->dev_private
Date: Wed, 15 Apr 2020 09:40:06 +0200
Message-Id: <20200415074034.175360-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Entirely not used, just copypasta.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 2dd1f3020fcb..632d72177123 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -619,7 +619,6 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	priv->soc_info = soc_info;
 	priv->dev = dev;
 	drm = &priv->drm;
-	drm->dev_private = priv;
 
 	platform_set_drvdata(pdev, priv);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
