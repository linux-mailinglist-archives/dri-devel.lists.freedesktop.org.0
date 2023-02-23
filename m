Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB856A00DB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 02:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4FB10E499;
	Thu, 23 Feb 2023 01:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76EF10EAC2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 01:47:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id s22so12370491lfi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 17:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uw9ANW8A0HIEHlu0J95K8GI8spDLrbsMISUzwV0ijx4=;
 b=tQWLe5WcJzNbK/0p370q5JCC8xgYGmEwPZJ1u6Jeop0GH/tTM6fKYVde7vjXHCszdz
 f/ZjfII2Yl+byBaNLDjx0CQfwG3e0seCepo4C4GVKGCVRZmJByOi0FjsUQHZE8NTYyXD
 6Ipy9iEz8c9OGNaIua1la3+dYcQjQ5wrpAkN9nkNKtGd37SwjHq0fGXCpH1cAOWMCyK7
 LNNwXLk3mMsep1eDtljLQAr/JxPlaTqfaFeiZvMdLEPMmSU8T0ykV/iMy2Sar3KaGFNS
 k8eNDCmuGPhCtt3HlOSqjC+lTp8Wp2DJsdE/BzOuBJTjlKFf+1TDR2RwuybWldBf7YO7
 u4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uw9ANW8A0HIEHlu0J95K8GI8spDLrbsMISUzwV0ijx4=;
 b=iQ4XfSPpAr/gKFlWhF2/v7p8goi9Vzfj0CvKSk1+Alq36o2MyfcoAK/X53/pKF0kpG
 ux/mxkkA0XfHHtbwkEB2b0bml01IUXG2j6Gl4VZdPr9QlfWVRnP5OfXpzcoARgGGPXEq
 APsnox0EM9Enm/XaCAwzYUd7iIGtGTnu0Ekzkf7LcGsvQOxDAp6j5g981jIb5aNHJ+DT
 vdpbnpZkaRJzWYsn+5HUl/8neQ2FiZlrXMEGYeB0s8LD3aTqes93N+EMDOKJyAl+QtgX
 8noDiEsxaGsFNJ8sBYVkcZhDq6spwgS6fYtUioOrJs1OSn/zqDZYAKjO2v694t7/wnqb
 djBA==
X-Gm-Message-State: AO0yUKUKJmVKbi1xmTRgUJHRW1qwGLa6PFqrWz8/DJvn2hMTBg8znBC1
 VmwTSxkRljyhu3xB8XTwbK8OUaHvmx2Um6cT
X-Google-Smtp-Source: AK7set9HAxRsGbwERh+lUn3YGqAoTzETv5bCEZ+5Z5csnzzygLG1C8GvwRh/vu7HzJtKMzBd/rQ6vQ==
X-Received: by 2002:a19:f512:0:b0:4cb:c11:d01f with SMTP id
 j18-20020a19f512000000b004cb0c11d01fmr3528085lfb.22.1677116866864; 
 Wed, 22 Feb 2023 17:47:46 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 17:47:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 02:47:42 +0100
Subject: [PATCH v2 6/6] drm/msm/adreno: Enable optional icc voting from OPP
 tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=767;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lx2DqRTcWzcl/VYcOjFYV+HDGYAZOMxix7RaJuIvTv8=;
 b=mYkZ7qwqRbSRNaoLVDbG+NeuUgSJomROk/h9vglxkqTqHBuqRkB9BIoLFrYD7vD+bXjLGT7PYIoJ
 MeljqooSASz7mlvRrVYqcvglbqNK7hJ+uUF4kGeKVT8KaExP5mtI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
handle bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..5142a4c72cfc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -548,6 +548,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(gpu);
 	}
 
+	ret = dev_pm_opp_of_find_icc_paths(dev, NULL);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.39.2

