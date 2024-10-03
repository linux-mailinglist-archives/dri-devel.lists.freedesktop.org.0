Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41B798F471
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7B710E238;
	Thu,  3 Oct 2024 16:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xx777kdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC2F10E238;
 Thu,  3 Oct 2024 16:48:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A23E45C5D32;
 Thu,  3 Oct 2024 16:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF20C4CEC5;
 Thu,  3 Oct 2024 16:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727974099;
 bh=+Qa9dKaycAhBRYIrsw+LWF3SLzloCUMxztuqxkQ01wM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xx777kdnc3tch5DRdjRa9JbwLb4MLmM2MxRanYyJW2QfqJ0Qll6QmcgDF9fqX9SYk
 UkXxhpqfVfbmrbOm/RTxL58LD8uklTYebjtLja6+ul4cOW5k4vBOjjl6o8/jZII3sY
 BSQAZh6687xuad/hq/L5jt/CbaZkvRsbYSIEwH1BQxJnhysM8eVlH5GyercFqUO9Pa
 fXvKWR+ULspFHYp12q+72fFLyFJEuftVGEd7M5/mpStkolRzyKZL7KeYQSrxXlSXFW
 mX0OyIPR2VNQ7Q28rGSUna681NPSlAYHyciLZ/xkMoEj+Ok5G9TgiLtr91z/yq94oL
 BQcfnHY1AjEww==
Message-ID: <c30baaca-beaf-485c-88b4-984febf06519@kernel.org>
Date: Thu, 3 Oct 2024 18:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
 <20241002-adreno-smmu-aparture-v1-1-e9a63c9ccef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241002-adreno-smmu-aparture-v1-1-e9a63c9ccef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3.10.2024 5:01 AM, Bjorn Andersson wrote:
> The QCOM_SCM_SVC_MP service provides QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> which is used to trigger the mapping of register banks into the SMMU
> context for per-processes page tables to function (in case this isn't
> statically setup by firmware).
> 
> This is necessary on e.g. QCS6490 Rb3Gen2, in order to avoid "CP | AHB
> bus error"-errors from the GPU.
> 
> Introduce a function to allow the msm driver to invoke this call.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Tested-by: Konrad Dybcio <konradybcio@kernel.org> # FP5
Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad
