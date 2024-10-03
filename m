Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C90498F4A3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFD810E8BE;
	Thu,  3 Oct 2024 16:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUBgoeXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CE610E23C;
 Thu,  3 Oct 2024 16:55:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 30DB3A441AE;
 Thu,  3 Oct 2024 16:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFA5C4CEC5;
 Thu,  3 Oct 2024 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727974558;
 bh=imNR9DXTopukjHkwo5tclh0f1T0zRA2E8rGys8K3ZBI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mUBgoeXrHyFZRDnDFpzUHsyrA3zf4FusfHuV2snFvZRImM4+j7hwtqq+ZrBSE5D3n
 +rdmASkKWd/fwNc4EiIKOPcuKRL4ovfbG9e1T9T9utn0siEstG84ngnVYNVQFCKR0H
 a2nMO5EGxHa9Gv8oLd6M163qG4tqe/Oe5OvANnNKq+BwMbj3m9IVAePMwhALF/qYrn
 77GTVxyHvspOo/svDpB5dNVt4uLddhwrn3bThmnrF22a9wjH96M7wDNnTfJssFDbNi
 VSg4b7UjtZOwHotpEY7baNida1iiOa+A+XTaFlC/g2xvW30DztVq2ee2fMhPjLRbFl
 5ZyH4Wd0XM2Hw==
Message-ID: <b084d738-19dd-469a-8ac8-e72c76e0997c@kernel.org>
Date: Thu, 3 Oct 2024 18:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
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
 <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
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
> Support for per-process page tables requires the SMMU aparture to be
> setup such that the GPU can make updates with the SMMU. On some targets
> this is done statically in firmware, on others it's expected to be
> requested in runtime by the driver, through a SCM call.
> 
> One place where configuration is expected to be done dynamically is the
> QCS6490 rb3gen2.
> 
> The downstream driver does this unconditioanlly on any A6xx and newer,
> so follow suite and make the call.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Not all A6xx targets support PPPT (e.g. A619 on SM6375 - but A619 on SM6350
does..). We already print some error messages when that's the case, I think
this may add one more.

Nonetheless, I think that sticks to the accepted status quo where lacking
PPPT is a bug, so..

Tested-by: Konrad Dybcio <konradybcio@kernel.org> # FP5
Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

