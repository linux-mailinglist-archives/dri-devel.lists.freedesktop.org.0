Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2143806AD6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DB910E6B0;
	Wed,  6 Dec 2023 09:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A49C10E6B0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:37:33 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9eca5bbaeso54291171fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701855451; x=1702460251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9AmJwkDE0GOCanY4DoOGUdEEjQ004fTwlj8Vhw/CU8=;
 b=WjAsD5HntyYazq+SbQM64iMAZvCJvA4S+yWRHpocrnanrsWITwvgPFeuXoy3wPfE4L
 2hrZaJTgOfnQp6ScDtR+LpHhk6tdjou5axvDLnHZ9jv9D0MV78S6OTyUbGy3kBMjsHMz
 x5HeHMH/4UnO/idIaMdeBRTlU3NDsVnPAyZsJew8oj3tRQ73n6RH/8PoeakuOECeNzgi
 VIPQ6RFSmpv/CYeJT+DqKRKFTTUCqqV6b1L01OVrNF7xSrxOhJrAQEvKVe+ieImJpfat
 1s/EAeogzKn5EC25erOHT0IQsaRQmPtG7BDEDKihRIT++JlGHQp+dgvn9GAZjp/WvjPO
 dy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855451; x=1702460251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9AmJwkDE0GOCanY4DoOGUdEEjQ004fTwlj8Vhw/CU8=;
 b=Q6Bs/wzukbuzYGIfm/bXTkSq+bnXl7NAUvCzn2GE75BU7csP22uhyGD4nmNY1zmD/Q
 yW3akWWpz/0Uva9XzQgZslBXMTNMvGxq1Y8am04w5yilQGt3yxPDIxPXjM/tZ26Ki2wn
 2PG46IOI4mHmKbRxptwKR1Cy743OO15rriPmQJd16F5RT5prokJrarfEWbcDOoPuOW/q
 2FNwteH9pzw7xj05rc5Dhakxfa6tAR/FWw4W1FvPfogfQ3fe8qKEfvK9sS045KPjBpiI
 0hfg2AtdO/5U4jugjR8KdYu7HLQ/avm7XYLsUr14u19lTHv1QkaRy4BbayXo/6l7D2N9
 VwZw==
X-Gm-Message-State: AOJu0Yz+/mNM9UHGANaMbIkMNGQU4iqavaBxiW5nzDDt2gbJHCVL1yNO
 U/UchGRtVB+aEE9HMoKLqFHvhA==
X-Google-Smtp-Source: AGHT+IEY4J/JJbM2WamIhwg19X8ihrG/RFqOdsJ0LKU3kUEbxrVchenGFzk46YBsD//sLu4y397VAQ==
X-Received: by 2002:a2e:7802:0:b0:2ca:68b:4abb with SMTP id
 t2-20020a2e7802000000b002ca068b4abbmr209304ljc.202.1701855451548; 
 Wed, 06 Dec 2023 01:37:31 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a2e894a000000b002c9fbb50770sm1120102ljk.90.2023.12.06.01.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:37:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 00/13] drm/msm/dpu: use managed memory allocations
Date: Wed,  6 Dec 2023 12:37:29 +0300
Message-Id: <170185542751.1626201.7605667574857624404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 02 Dec 2023 00:18:32 +0300, Dmitry Baryshkov wrote:
> In a lots of places in DPU driver memory is allocated by using the
> kzalloc and then manually freed using kfree. However thes memory chunks
> have a well-defined life cycle. They are either a part of the driver's
> runtime and can be devm_kzalloc'ed or are exposed to userspace via the
> DRM objects and thus can be drmm_alloc'ed. Implement corresponding
> runtime resource manangement for the DPU driver.
> 
> [...]

Applied, thanks!

[01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/134c78c96227
[02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b830b06f0087
[03/13] drm/msm/dpu: use devres-managed allocation for interrupts data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b19e6f7dd2e7
[04/13] drm/msm/dpu: use devres-managed allocation for VBIF data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bdfa47d9b17a
[05/13] drm/msm/dpu: use devres-managed allocation for MDP TOP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e897dcc4c67
[06/13] drm/msm/dpu: use devres-managed allocation for HW blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a106ed98af68
[07/13] drm/msm/dpu: drop unused dpu_plane::lock
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b0311c1c4e06
[08/13] drm/msm/dpu: remove QoS teardown on plane destruction
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bcc54a4c063a
[09/13] drm/msm/dpu: use drmm-managed allocation for dpu_plane
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e00f9af95bb
[10/13] drm/msm/dpu: use drmm-managed allocation for dpu_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3637af92de2b
[11/13] drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
        https://gitlab.freedesktop.org/lumag/msm/-/commit/73169b45e1ed
[12/13] drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3285f4acb23c
[13/13] drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd42c56d9c0b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
