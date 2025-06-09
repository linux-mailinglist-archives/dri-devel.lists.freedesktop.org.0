Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F5AD219D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40B110E40C;
	Mon,  9 Jun 2025 15:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pUyftA65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B6C10E406;
 Mon,  9 Jun 2025 15:01:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A999AA50F48;
 Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332ABC4CEED;
 Mon,  9 Jun 2025 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749481273;
 bh=49cU8Ts94cgb4QkrriKDZFEwuDxhQXvYqP0FbuF4YZQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=pUyftA65BFa7f/aOR3L+uaX+HTauesh20t2Rq7zturUKTtFX0ptHSDOMnDf/100Q+
 QcTyTIQyuostNjRegk4soHMyzDRavWRNsYNaV6LrNvbTwAB41Yss5dLQgQC7nA0fGe
 ZQxSFTQmuDg3M3Kmjwj3nD8O/pg9VfbqNhyqc+mVSfuiqjFmPFha940csLTM9mD0TM
 r2EDzqVF4UgPMBsZ2msvMtuo4z382SszHx4EG9CdoyYDF+6sL+ksgeZ/o7+KLiYXGB
 7ehe5kT5cEeFpr3HvthoR70OD2nSYeYR/NXollVQCI1GxYNLNSOc66ApvHfojq/zLM
 OxnxR+j3tZBSA==
Date: Mon, 09 Jun 2025 10:01:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Message-Id: <174948104999.2282575.3222487103979882730.robh@kernel.org>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
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


On Sat, 07 Jun 2025 19:44:58 +0530, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
> 
> Tested Glmark & Vkmark on Debian Gnome desktop.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
> 
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
> 
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit b3bded85d838336326ce78e394e7818445e11f20

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: opp-table (operating-points-v2-adreno): 'opp-666000000-0', 'opp-666000000-1' do not match any of the regexes: '^opp-[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#





