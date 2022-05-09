Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E851F44D
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 08:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BD41121B5;
	Mon,  9 May 2022 06:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4791121B5;
 Mon,  9 May 2022 06:11:44 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso953442pjw.0; 
 Sun, 08 May 2022 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tLx5Pm6Ngh4YLs7U4uiQY60BpXpO+WnLGyecC77JrZw=;
 b=Jnf9FtUJSdYHxR7peyJf3TzliXYeHQrTsId7OaDoq71bojBxuF9kPLSuguaSt0bpAr
 oOikRnEOw1TuiIJD6/iXR0PxSRIjkVeKUk89cZqEdQ8MPrnOyweopgjeJyvmAMj0EgMq
 sDXCkaTbjZs9WRrtgQwibByiyBBliFpqQVD87QlVnIeosD/LRHtuvVWfZREX3tvfQLEs
 yq4eovHKjSOUeR+pdIW1HtjdObCpfuimJlfNKao5/VsRAud/dNmF72XboTCCU8NwCjOy
 SPIE1raBJoijowbBnBfPsZQdeJw44hKiwwumgsWHLVVVMJRQJHzAtxh0gnRf9Xkd+bLJ
 7c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tLx5Pm6Ngh4YLs7U4uiQY60BpXpO+WnLGyecC77JrZw=;
 b=ebEjussfDV7iTiAB6cc8anXplVwN//oGI2nV/ZXcc7e0pxV9CjhbIxu5IZYak+RVsg
 IPoNO0h9+QG9VIZVVJC1pqq1Fo2gkWViWIU8teieSrfCrGvb9MGZewJ+wVyVTTXmrRqs
 MyhVeTPp/fuG+k87FCmDhv+bPMQex8uaENnSqryw2tOqh6FBxurLFMuL6yJV5wapyJgX
 svBjXMbhViQvvduLW854H5yl5TS5muWnyp4fITFuWC4obRm7RkyA7dXXUeoVh5007RE+
 yqLYe41pvAr96sG7CP6Slf1PPhgNvLbuIZXjHo1fWr88AcKGgL9gskRkf9uYogNU7wNd
 RQTQ==
X-Gm-Message-State: AOAM533hT9M55DU8OklU787LCdrgnBZlbGYcT4dtanhmG7HEPLguGFgV
 uDuKoTUO8frKQpN9K6Nj1fe6t5A4WnV9gA==
X-Google-Smtp-Source: ABdhPJxv9Zjx5DUMC6R3uYLXLUaG+lxpUae+8y4732Pr++SO/sJa3ZwhEvnos3IXYMSepsop/B152Q==
X-Received: by 2002:a17:902:ec8c:b0:15e:a371:ad7d with SMTP id
 x12-20020a170902ec8c00b0015ea371ad7dmr14751207plg.12.1652076703604; 
 Sun, 08 May 2022 23:11:43 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a170902988d00b0015e8d4eb257sm6135771plp.161.2022.05.08.23.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:11:43 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 gbeeresh@codeaurora.org, sviau@codeaurora.org, wentaox@codeaurora.org
Subject: [PATCH] drm: msm: fix possible memory leak in mdp5_crtc_cursor_set()
Date: Mon,  9 May 2022 14:11:25 +0800
Message-Id: <20220509061125.18585-1-hbh25y@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_object_lookup will call drm_gem_object_get inside. So cursor_bo
needs to be put when msm_gem_get_and_pin_iova fails.

Fixes: e172d10a9c4a ("drm/msm/mdp5: Add hardware cursor support")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index b966cd69f99d..6a5f73f6a23b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -991,8 +991,10 @@ static int mdp5_crtc_cursor_set(struct drm_crtc *crtc,
 
 	ret = msm_gem_get_and_pin_iova(cursor_bo, kms->aspace,
 			&mdp5_crtc->cursor.iova);
-	if (ret)
+	if (ret) {
+		drm_gem_object_put(cursor_bo);
 		return -EINVAL;
+	}
 
 	pm_runtime_get_sync(&pdev->dev);
 
-- 
2.25.1

