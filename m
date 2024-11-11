Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5519C448D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA7310E1F7;
	Mon, 11 Nov 2024 18:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KZ8ZConb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0364A10E15D;
 Mon, 11 Nov 2024 18:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DACC15C5A95;
 Mon, 11 Nov 2024 18:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC05C4CECF;
 Mon, 11 Nov 2024 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731348514;
 bh=AEvF+lxs/+5g7LFaaobL1cTI1sRUJ97tB8YlBhuVWfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KZ8ZConbsjyDJcVw6oxZ+ctk2irCZm2M8eq6B88tVhGYr1AabBhfilstVivond0wU
 zOJssRhGu/jQ/MtALIE4SZ+4Mj/Av6tc+Ozz5lYY+jcDKcBzysgN52dEXZCfO2Ss+z
 VpqvpT4SqEwAkzimaNDQV+75qtlUgbVxVuLHx39fs83eMObPj8RDdt4kdBIxqvaAdl
 bD26t3H79LIdJ2KuE2Zyk7EEzqCY5Hw3LFSB3GwYJJ3BVkEv4bsVmZ8GdyDelqy7W0
 NQwwFjlwWimiqvEINDyW092S++cw3enZ39km4PUoecwFW/Z6c33/T9uauTBMuBpelv
 k2UMAfkuGWkpw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/msm/adreno: Setup SMMU aparture
Date: Mon, 11 Nov 2024 12:08:31 -0600
Message-ID: <173134850914.212509.17711783777299070949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
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


On Sun, 10 Nov 2024 09:33:39 -0800, Bjorn Andersson wrote:
> Support for per-page tables requires the SMMU aparture to be setup, on
> some targets this is done statically in firmware, on others it's
> expected to be requested in runtime by the driver, through a SCM call.
> 
> Marking the series as RFT, as this has been tested on a few different
> modern platforms, but only with Qualcomm presence in EL2.
> 
> [...]

Applied, thanks!

[1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      commit: 1af75b2ad08bd5977c51c2d0fc11741a4c0a48d9
[2/2] drm/msm/adreno: Setup SMMU aparture for per-process page table
      commit: 98e5b7f98356cef2f13b54862ca9ac016b71ff06

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
