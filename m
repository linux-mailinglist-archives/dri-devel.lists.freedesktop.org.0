Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23E971561
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 12:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF43810E374;
	Mon,  9 Sep 2024 10:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OpiVlMBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A789F10E372;
 Mon,  9 Sep 2024 10:34:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FB135C4D22;
 Mon,  9 Sep 2024 10:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B00C4CEC5;
 Mon,  9 Sep 2024 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725878096;
 bh=mdd27egtpKHNtkcd8KHdlrUC/vkGITQ+FHnGZUqhHrI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OpiVlMBqdGcHOBcffmsy0taA3NAfevwxc0gX7CcNbrlf816tIFGoTJQBpftmZg4Iz
 rDaSSQhYQ0Ee4FDW4yWaG8ZJanu6Uzuo+pC79kyjxcWarvnQeIy+pBsHASGSPi2XAq
 bYJG07aezgdwBFJQ6ccXxZ/k2tgZrbLnlRm2oXJ91gjbR6eQIpdeL2Hws7LftZ88xh
 KvhpyPSoFt0hwU+f4+CWKo9+5D+RkhrH2rLM1MRiEuNU1lwHN+dcn4BAg07XAdlwf4
 IX4VovOTV0urvcTanoY3XWRP8YFTOUUpPjP6msiaU1Cptvqz/yrR7LYiVvGZYd6eA1
 nMBTOFZBc5cKQ==
Message-ID: <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
Date: Mon, 9 Sep 2024 12:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
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

On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
> Under some circumstance

Under what circumstances?

This branch is only taken if there's a .create_private_address_space
callback and it only seems to be there on a[67]xx.

a6xx_create_address_space returns:

- an ERR_PTR if msm_iommu_pagetable_create() fails
- retval of msm_gem_address_space_create() otherwise
   - retval of msm_iommu_pagetable_create() is nullchecked here
     again because we apparently we want to be double sure
   - err_ptr(-enomem) is returned if allocating aspace fails
   - otherwise aspace is allocated somewhere

Konrad
