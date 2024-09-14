Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624797907B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 13:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F0A10E1E0;
	Sat, 14 Sep 2024 11:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="skuqOD8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC1210E1E0;
 Sat, 14 Sep 2024 11:29:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB116A40340;
 Sat, 14 Sep 2024 11:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2E0C4CEC0;
 Sat, 14 Sep 2024 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726313383;
 bh=ibWf5h/YDMR7+aYKTl31w6DGDWtFK+8+WSEzQEoJnZI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=skuqOD8jLO7TYF3xAdh+YzydIe9lA57IQWVfeOofeb/wdeY9m1D21+O6Sqr+hdQgi
 jFDyapW0FM9Psk+p7GcptCxlZ1hj1rFJsFVE7ntKdO1ati3NHnDz6aghSXCPaTwGKj
 DWX25ggg7LaRE2kuREHyxIVzW/ji6J5U5lLPWsgY1yN2oPtnTGXKvijlw3lkTANNfM
 ewYgVKxuIlVWqPQtNEZj2vTMMDLM+RFNZmaxMdBRZ6/I0uCpFlJvTQF4RS9paQ53Lw
 IMypwu06ZvhZncqZwcDmvvso5R0YMRPsl0kuKgET+/MMuC57GXcTktuNg89w8PcwW4
 t8oSRpTjCaEoQ==
Message-ID: <9fee28de-24eb-46b1-aa5b-6febc2972a3c@kernel.org>
Date: Sat, 14 Sep 2024 13:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240913103755.7290-3-quic_mukhopad@quicinc.com>
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

On 13.09.2024 12:37 PM, Soutrik Mukhopadhyay wrote:
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Bjorn and Dmitry
> 	- Made aux_cfg array as const.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index da2b32fb5b45..bcd5aced9e06 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>  
>  struct qcom_edp_phy_cfg {
>  	bool is_edp;
> +	const u8 *aux_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
>  };
> @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>  	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>  
> +static const u8 edp_phy_aux_cfg_v4[10] = {
> +	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> +};

How about we only abstract the values that differ? It would seem like more
platforms reuse about half of these magic bytes

Konrad
