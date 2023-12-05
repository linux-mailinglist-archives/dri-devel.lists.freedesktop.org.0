Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AED8044FD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916BE10E471;
	Tue,  5 Dec 2023 02:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E5610E469
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:34:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bfa7f7093so1864976e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743648; x=1702348448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AO6nkg54Ej/DMmVgWcwfv8nG+4F5atkWpwzna13KQTU=;
 b=pSNLssiait0Ps4WVTxfdVAf2uab/pmj/PyNps7my73ngWVaPrYaSzhjX2i1CLP7Dp+
 +SkqkKc8XEwaVcoyx2oLhnuIbSQ5WTLoKy0Dfj26ElOGSxT4YPOQYMzpA3cgSIm78eIf
 9OfJtz2DxUOZKonS6OOszuJPW5QddoL0kY2cGbiHtbxVv9wGeCP2GtrOLO4grnPt9Pvk
 c7FqrAR5KAJSNROeREY3rOhOAz8u0o+ubb7GU/c6SdmaLIhglbn6HFvHZNoBgP5ARlZZ
 uWdJ7SBMB9cIf7I5g+aeRnn/awVBD0SpRrkkJBtkOsqAEQq5ecIgsyey+G0skFhe1gG5
 91LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743648; x=1702348448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AO6nkg54Ej/DMmVgWcwfv8nG+4F5atkWpwzna13KQTU=;
 b=gkov+qDNczAiTKv4cWLGzJwHWHWTsWneC+1Xro7gu2bRojGONmZ5V6kDt25oZm9r7D
 i9fqNGideMyT7YO3wh2WPXpFoOi+CA1C2BZeHgbNabVUutg7jpGuN+i2/jx/thFGTTeb
 vna67iqvDSLiV3Q9bx4PjyyUaHkkFbJL4XE93bjmUCNi3/tUsCEHL5L+cdVE6+po4m6i
 XoX7cpfVUPTu+wx4I/8X/5ri/4tfOnebFBZ+5HUjYm8oLO8CW+Ychks6dGtmrR0HsSXw
 hvomIuDU68U6ocA6P/vRhVpapcB0Lz5hiAtaBFSKS3He8tbxAKN8dfUL9DXUqWKnPc5l
 vUbA==
X-Gm-Message-State: AOJu0YxMxqrC2hVLDurKOWhahYxMrJ9p100H+oSHik+l4KvtAjiBzy3T
 pH7iSwFuOz+uuPAXw4w/itk05w==
X-Google-Smtp-Source: AGHT+IHXqs6nCI5D1xPBsmc1ahRdMJg9G0hOTFi6khoWVdQBV85832EfGuhCOJhj1141+jxxyaBWaA==
X-Received: by 2002:a05:6512:ac6:b0:50b:fce6:1998 with SMTP id
 n6-20020a0565120ac600b0050bfce61998mr1140519lfu.83.1701743648407; 
 Mon, 04 Dec 2023 18:34:08 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:34:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 00/10] drm/msm/dpu: simplify DPU sub-blocks info
Date: Tue,  5 Dec 2023 05:34:04 +0300
Message-Id: <170174354266.1582017.5924036306070016370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
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


On Sat, 02 Dec 2023 01:40:24 +0200, Dmitry Baryshkov wrote:
> The handling code also usually knows, which sub-block it is now looking
> at. Drop unused 'id' field and arguments and merge some of sub-block
> declarations.
> 
> While we are at it, also fix all VIG subblocks to contain correct scaler
> block version and drop the becoming unused QSEED-related feature bits.
> 
> [...]

Applied, thanks!

[01/10] drm/msm/dpu: populate SSPP scaler block version
        https://gitlab.freedesktop.org/lumag/msm/-/commit/46b1f1b839ca
[02/10] drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/07b852c91cbe
[03/10] drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps
        https://gitlab.freedesktop.org/lumag/msm/-/commit/88fc981f8ef2
[04/10] drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6876059d7edf
[05/10] drm/msm/dpu: drop the `smart_dma_priority' field from struct dpu_sspp_sub_blks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/01fc6c012fad
[06/10] drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd205412e1e
[07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aa83fa5bf6c7
[08/10] drm/msm/dpu: rewrite scaler and CSC presense checks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2b98aa1d6558
[09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
        https://gitlab.freedesktop.org/lumag/msm/-/commit/193838acc111
[10/10] drm/msm/gpu: drop duplicating VIG feature masks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/223fb06fbc26

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
