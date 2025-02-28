Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89EAA49BD8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 15:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EE710ECBC;
	Fri, 28 Feb 2025 14:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J4f3okZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869510ECBB;
 Fri, 28 Feb 2025 14:23:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D730461F6C;
 Fri, 28 Feb 2025 14:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19873C4CED6;
 Fri, 28 Feb 2025 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740752637;
 bh=kbCWeMKmYUCMjknkwLpFQ4vOZhr06uyQ6A8L6Y6j3cA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=J4f3okZzEW756AuEQGKk7lNHCr0rV9x4HUiSPHdbrH79q2OMaEG15g+F9fjCZwRAy
 1ec/689S42x9Ffi1ic8yUwKt7/FP5dyzSkOvGyFNW5HM/NRq52XWCg3PrinV4TsJ0J
 CbkaQ2xVseBR8CmnlXfB48YqG8VwTK+N+uc3+Xw69v3zzRUOk0vvOGQhSPPU4XOcJZ
 bYQsbsYcS+ZOnkPzyS4IorM6ElTBaSCH33WXdR3z7p5Wr25sfKrsmoScfWWfV66T0B
 qX049SjwbGE5N5ZNQ1EtTx58pd/fmSlu4cC2UYPINuB4+6fBznGZMM/8YfGgbW5JVi
 L5tiHwAuWdAlg==
Date: Fri, 28 Feb 2025 08:23:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jie Zhang <quic_jiezh@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 freedreno@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
Message-Id: <174075232770.2756163.15128447349702656600.robh@kernel.org>
Subject: Re: [PATCH v2 0/6] Support for Adreno 623 GPU
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


On Fri, 28 Feb 2025 01:37:48 +0530, Akhil P Oommen wrote:
> This series adds support for A623 GPU found in QCS8300 chipsets. This
> GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
> pick up.
> 
> ---
> Changes in v2:
> - Fix hwcg config (Konrad)
> - Split gpucc reg list patch (Rob)
> - Rebase on msm-next tip
> - Link to v1: https://lore.kernel.org/r/20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com
> 
> ---
> Jie Zhang (6):
>       drm/msm/a6xx: Split out gpucc register block
>       drm/msm/a6xx: Fix gpucc register block for A621
>       drm/msm/a6xx: Add support for Adreno 623
>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  8 files changed, 171 insertions(+), 3 deletions(-)
> ---
> base-commit: 89839e69f6154feecd79bd01171375225b0296e9
> change-id: 20250213-a623-gpu-support-f6698603fb85
> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
> 
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:0: 'gcc_gpu_memnoc_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:1: 'gcc_gpu_snoc_dvm_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:2: 'gpu_cc_ahb_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:3: 'gpu_cc_hlos1_vote_gpu_smmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:4: 'gpu_cc_cx_gmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:5: 'gpu_cc_hub_cx_int_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#





