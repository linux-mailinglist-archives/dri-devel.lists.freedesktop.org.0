Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC709923C7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 07:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A217310E2FD;
	Mon,  7 Oct 2024 05:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marek.ca header.i=@marek.ca header.b="GPB+5gsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D121010E2FD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 05:06:01 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6cb2f344dbbso32470246d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1728277561; x=1728882361; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=roE3JMr9lMbeU1huQ5l+ymUGwxuvCsD8E2naNBrZpXE=;
 b=GPB+5gsMUts7+94TXsPX7NaA74weOfHaXCymS2WdbFhSJWsZ2iUjXexehePmvdOkTM
 +c8uB6nPEvpJM99tTqxdNZBkZ7PXTnUVWLzM46mb48tOzIp9LOIU3RBJLlu4W7hjis4B
 jaaFsjB5WO7UsDxvPGV3yRyFU+tLs3a7h6Aj2aM7FizUMnL7/45zc+T3PLZ76t/OSl0Z
 1EXPYCWnOcWyFZGUbr7Z9gIiaAr0YUCtWt9nMm/Gd7uuP2B3ldFjcQT2FtVmtWiVII/5
 OTGR7tk5ZozazsOMne8KBni4qOe8h9vPix45getJ01+mjH787w0T0pDJhif1865/Etz9
 HgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728277561; x=1728882361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=roE3JMr9lMbeU1huQ5l+ymUGwxuvCsD8E2naNBrZpXE=;
 b=YnSvxth9tDXdzw1zlCKmpOcce7jUYN/b9lD+H2KExpJ1UQExXDJZA2hg4jmaXMXLIv
 OKpLf0kA5NP+YSQGg68rUlWUTtU4JeSunQbD7F0LFdhHA65xrxZMPMpr/SGdfx71bdkw
 s0AGqXWGrMeDRLcrwsfnDK98z96Z1s+0L52KMF9bBCaPhWSQu0iS2dRALuL9ZAeg/hK6
 Om3ailjKGahz9TAgVUCS7eEACjOHf75q878Vl8EC5tNAtK+Q9t479R7G3qN+5CMmXeOU
 CULLaBvVTpk4BRGM1sBW4Ykwfm7M47bz4f69ZLz3KhIvH804/jJHy6hpujvqFT74tgxj
 zv0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVehqFfcusZn5H299gzmdB/bBxw6WbbxPDznrMBgudSui/Z0Nf5+xLKzBHLODvhj9tVsDTO92cE2u0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTxk8js93hHs7yGH/SU9g8SKBeoe00Zkq6mnIkFZkelWiGPjcf
 5z2ZnUZjKsrfy2VDikaghaGW1JGvhumX99PMtQQWfVW8lNaWY3VgWvfBTJGm8tM=
X-Google-Smtp-Source: AGHT+IEFqA0OIk3ks3aFd2muaztD8wK5Pr5n5CCRe39FVoqFWsj3k1MVbhTRHDeseeL2V/taCAEOOQ==
X-Received: by 2002:a0c:f40a:0:b0:6c3:e231:960e with SMTP id
 6a1803df08f44-6cb9a32e928mr162731146d6.17.1728277560758; 
 Sun, 06 Oct 2024 22:06:00 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba476152asm22452216d6.126.2024.10.06.22.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 22:06:00 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Date: Mon,  7 Oct 2024 01:01:48 -0400
Message-ID: <20241007050157.26855-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mode_vrefresh() can introduce a large rounding error, avoid it.

Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf376..1205aa398e445 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
 
 	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
-	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
+	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
 
 static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
-- 
2.45.1

