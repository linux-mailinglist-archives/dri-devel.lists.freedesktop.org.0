Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A58D26BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140F61127F7;
	Tue, 28 May 2024 21:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bQlGt4Jo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0FA1127F1;
 Tue, 28 May 2024 21:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E917462496;
 Tue, 28 May 2024 21:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620DEC32781;
 Tue, 28 May 2024 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716930401;
 bh=ZSJQyl9M2teS5Qx+/nF2zTSPDI8GKe5B/XcPj6W/pxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQlGt4JoOroymoDj15TKOYMq4CvoZ95q+35EHLFFNL+YjPWebxr8s94joLUHbNk4c
 8D9YTkiisAAoUEHc4u6X/ThU9e91TDphV3FwDirx+SeSajrtXdjDlFhIAs/8sd5wSE
 y0+miW1vGQ6vBvXX4cgnf3WeL/K4iOEzD0h2aB2AEsOEWL5qKn9jrfDbhxtsqfbS6/
 fJsjjc62b1N+Cq6sixjlEx52JuDxHG6vY0+j4ogPYHm6WojgLxBv1OODtL1tfUl/0M
 WLehtaA9506TQNPj5gQbNZTwYJWG3j6pQfrFsQpuffKtTeAbCf/od89ZBpwGUm67/w
 dq27GJKSPFj/g==
Date: Tue, 28 May 2024 16:06:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
Message-ID: <q3ajxhbj5kyc7ljgy7vr3lbpixjhtbv3ud7sgdec4u3iog6das@rdeymasp3n6j>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:54PM GMT, Konrad Dybcio wrote:
[..]
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 10e0a4c287f4..52439f48428f 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -3,6 +3,8 @@
>  #ifndef __QCOM_SOCINFO_H__
>  #define __QCOM_SOCINFO_H__
>  
> +#include <linux/types.h>
> +
>  /*
>   * SMEM item id, used to acquire handles to respective
>   * SMEM region.
> @@ -82,4 +84,28 @@ struct socinfo {
>  	__le32 boot_core;
>  };
>  
> +/* Internal feature codes */
> +enum qcom_socinfo_feature_code {
> +	/* External feature codes */
> +	SOCINFO_FC_UNKNOWN = 0x0,
> +	SOCINFO_FC_AA,
> +	SOCINFO_FC_AB,
> +	SOCINFO_FC_AC,
> +	SOCINFO_FC_AD,
> +	SOCINFO_FC_AE,
> +	SOCINFO_FC_AF,
> +	SOCINFO_FC_AG,
> +	SOCINFO_FC_AH,
> +};
> +
> +/* Internal feature codes */
> +/* Valid values: 0 <= n <= 0xf */
> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)

Please wrap that 'n' in some () here and below...

> +#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0x10)

"MAX" sounds inclusive, but the value is exclusive.

Regards,
Bjorn

> +
> +/* Product codes */
> +#define SOCINFO_PC_UNKNOWN		0
> +#define SOCINFO_PCn(n)			(n + 1)
> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
> +
>  #endif
> 
> -- 
> 2.44.0
> 
