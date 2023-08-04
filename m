Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8357704D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CC210E72B;
	Fri,  4 Aug 2023 15:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B944110E725
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:23 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe457ec6e7so3871678e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163202; x=1691768002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkJZcKj0fkFAOpA+ii9LBosfGNpWxtA1197WIIr/hic=;
 b=nR/+5J1icecG0BXV3DYt3GC7xVBsZqDhfRGA2zoYe6sxyaj5zBnJAeU/NOd2yOlUAQ
 zbxmbrN6xqJCLW3tWJb09OBvrHcRMcX/tSUealCPQVyT0qWTGWC4ABcQq7Woep6OEcUJ
 sib6kG2kaEBp/3rsdlXSxql1u/q2zx+RopJWYpmP+ZC+4yN36Nu2jxxNdV2ywjzULzR/
 7aWEjOhJ145JJT55vVjmft71Ey9AgNjBMRO04OFZvWQ36GHlqT/YL/XVUaW61JgvSOdD
 rmXFegDXal65g03lj3NBHP1MlbIhbj5P7B5ToGM4EgEQtl4SHONPDE5jPkEl0ssVUIbY
 juMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163202; x=1691768002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkJZcKj0fkFAOpA+ii9LBosfGNpWxtA1197WIIr/hic=;
 b=BuJNp9DGde0SQPyLtIdN1sjPiWhRG+wr4C5zHocJvv/Xt3l8E2hAelac2JHcBq0NzB
 7axNgYXRpb3Sjs7lD+WmX27oU+DzWwWn3PxPrquqarkgl/VHNIBryuyfnzvIk9736MVF
 oEtd8KuwI23ykXZ7rBboafyADz025Pa5bis8j4+NczFfsBG4TWTaIEfx7C9pCqCFOyp4
 Lf+Tg+q2+IREog4A+iZ+E9dVK6BTM0+O8aCWjf1jPYZKRFjYU40AV1+uXQkUXv/mNYDy
 XWCMGb7tOrNfbFGqNzZc95AW2x6KQv4eyhdCfVSAL8ugg8hXhVkZ86v/03WKIvMvA6to
 HCsA==
X-Gm-Message-State: AOJu0YwzH77zTRIXUSz2wSCARtNWs5kbHj0EcZErpGvBtXe77s0tw0M4
 APvyV2U6eCdH6IwoawQfNI9q9A==
X-Google-Smtp-Source: AGHT+IHIS9jgN3PSebWEsZkCoXHSbvwTkZqxiiIqQKiYiCi1TFo0VAB2FTMJzF63PVft4JhcyCWMEw==
X-Received: by 2002:a05:6512:34d2:b0:4f8:7513:8cac with SMTP id
 w18-20020a05651234d200b004f875138cacmr1464741lfr.48.1691163201896; 
 Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: initialise clk_rate to 0 in
 _dpu_core_perf_get_core_clk_rate
Date: Fri,  4 Aug 2023 18:33:16 +0300
Message-Id: <169116308154.148471.18222389077643257942.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
References: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 04 Aug 2023 12:48:04 +0300, Dmitry Baryshkov wrote:
> When removing the core perf tune overrides, I also occasionaly removed the
> initialisation of the clk_rate variable. Initialise it to 0 to let max()
> correctly calculate the maximum of requested clock rates.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_rate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34202be95237

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
