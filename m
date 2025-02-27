Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECEEA474AE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F230710EA2F;
	Thu, 27 Feb 2025 04:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pPe2TzGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2C110EA3F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:11 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54622e97753so555805e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631090; x=1741235890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+xNvurO8U1WVGtMu3d7j2YgOZ/XCG9UaC+fiCOcukg=;
 b=pPe2TzGhtYcjXCuNpjtQI56uMsUW0zIo8dfYFnLqszWngPMAzxTSxOPc5o7pSZrFV0
 pUjQOnumtjv9BKNI4fFlVN7UbEDANyNmkU/Pimc9DcQB+iatAlD68Ueh6UnP7yOR9tWq
 Ojg8gwzr8fi1sCPXzktaFQiu/CQudFpiGDItFoPx7gt/4s97NfsiqgyzrOr4sJctmny1
 sb1ZBBf2KW+sYJhu9YGVQoeT36cDCEjqHu0jrd1XjrGVeIv0ojhbeZhL2yEYQvSwJwM2
 EivmO4SrLQNvTr9KBjK/BdrrLLEJqSUwkWVok3Qbg6XS2LQ9tyEjEWqyWhGJzQ/qFFcY
 LtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631090; x=1741235890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+xNvurO8U1WVGtMu3d7j2YgOZ/XCG9UaC+fiCOcukg=;
 b=qSMS3VsnlY7ymiSZlgB2y2A36gWG4Xl9e6iU9x52iFzHrcHHAZgQXIp46y8ZLe8kxE
 rwDkp6LXtK0u6CQnUmKvUMF4r1EH+cMg2l99I1pI4PUpVURsF3H/XPdKaz2cGcfxPyKA
 p1UaT7HACaVQZW6ixXiXU6Dd8baix01f2EiKlBjEvJAiZHFYH8MARSYoHlT1oMKlRUdE
 wY4shS8i0KvEZGYQYzz+Mr/P+HW4WUyRIrpRcPPQ9ZsHu0EQtrbhod/wHbw7bRkZRUtr
 KPg3ixSVlvFeVSWq4Jp7j7QL+WEjOrFS5kk0oLhCOABfxBodJSQ/vBDOZJlg0A6VQekl
 /14Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWic7SMIMPLJeCTfsds501EX7pyxkRbK8stJMGg3EhDF2kNfr54/B33cCCdJasMce0K/YyR9B7cS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsW92Q9KWcaKcQE7mbbTkCHP75jYleQr4GXOFiHcfnhRw6rbva
 8zkhdV0cpWGDWZA3CtgTdZ7DZV5qTlEA2J2cF23+cSxYWDRCvvOGjr404VQuLz4=
X-Gm-Gg: ASbGncuhJ5RzoT34qcyNzWrW56IouFimgcKUStvCH37X2d9c24/j8ex1+zIa9AeKPRg
 5yTwMV+R8Ayvp3twqVZ8OxYpbybmrGkItfG8GViyPs8p5jx0iMPW6r7YS2Avo/+9XjDv4cTgO2L
 gPIaVhzO99Y/cttCI7wKQgNjEutXvwAIZbsZvOaUWEBe05RXgS+FxEGTOysYUIRjsmL7b5Ovx2O
 3S+DEORpei50NvxvBAxHxx8JL0xnzo74n2PB9nmgTDzcvx0+Gf8iu5cq6iuETBNC0obOprx4ZZj
 V48O+Tte5zrRB7764Gmtg/toU1ePPwwk1vOfglE6Jw==
X-Google-Smtp-Source: AGHT+IG4FmEa2E6Vnd3n6pmL4LIRNjCw5Yr6bPCVueD2ge1UqqUmi9/g9dZciGxkaPkoSh2/W32iag==
X-Received: by 2002:a05:6512:31d0:b0:545:240:55ba with SMTP id
 2adb3069b0e04-549433167b7mr678503e87.26.1740631089878; 
 Wed, 26 Feb 2025 20:38:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] drm/msm: add a display mmu fault handler
Date: Thu, 27 Feb 2025 06:37:35 +0200
Message-Id: <174063096226.3733075.7759942352504243411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
References: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 19 Feb 2025 11:49:16 -0800, Jessica Zhang wrote:
> To debug display mmu faults, this series introduces a display fault
> handler similar to the gpu one.
> 
> This series has been tested on sc7280 chromebook by using triggering
> a smmu fault by forcing an incorrect stride on the planes.
> 

Applied, thanks!

[1/5] drm/msm: register a fault handler for display mmu faults
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eabba31a839a
[2/5] drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f66f3cf6bc42
[3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c37d9f0b1a18
[4/5] drm/msm: switch msm_kms to use msm_iommu_disp_new()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/85bdbd8306d8
[5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
      https://gitlab.freedesktop.org/lumag/msm/-/commit/89839e69f615

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
