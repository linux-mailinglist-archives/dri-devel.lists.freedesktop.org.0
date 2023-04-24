Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866B6ED011
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 16:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA76B10E14A;
	Mon, 24 Apr 2023 14:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5FF10E07A;
 Mon, 24 Apr 2023 14:12:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C57E96252E;
 Mon, 24 Apr 2023 14:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B69C433EF;
 Mon, 24 Apr 2023 14:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682345519;
 bh=rXDHwC4VVIDhGhpP6nmTzwKeAZm5iA95fSY6qeiaDfk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ecpuOMTszADJgavY0i4FFYrmRsSE82tCm+QPqEkdo5TNJZ0aomGalWpUZP0Ssb37+
 6BRaY9kgbQwqrNhHiAnWG5WmonxJCpgW7u0su6XQrV4B5V5qAzwpLIhlrluayElPR/
 9LvYnxGL2AR/Jo5Ejdd9VZ2uR/rElBYlR3kFXPr+bNZk1kYpGQ/G/iNoQL5vYnmfNC
 2gWYQtekVQ8MyM+tQvnoS0fEqOvYMNWiu0AMPp90UfQoLGH2XYKkZ+TzqGbivTB67f
 sYnPOiDz75wq5eq8MMpVpB6nSElpSmDbIzBWx/M92Sn27+kD8rIcS+lMpc/OCpiMRO
 6XOmZzurWJmLg==
Message-ID: <4a2f1ed0-015b-9953-1656-5d90020b7c10@kernel.org>
Date: Mon, 24 Apr 2023 17:11:52 +0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/5] drm/msm/mdss: Handle the reg bus ICC path
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
 <20230417-topic-dpu_regbus-v2-4-91a66d04898e@linaro.org>
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-4-91a66d04898e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad,

On 18.04.23 15:10, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
> On the MDSS side, we only have to ensure that it's on at what Qualcomm
> downstream calls "77 MHz", a.k.a 76.8 Mbps and turn it off at suspend.
> 
> To achieve that, make msm_mdss_icc_request_bw() accept a boolean to
> indicate whether we want the busses to be on or off, as this function's
> only use is to vote for minimum or no bandwidth at all.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
[..]
> -static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
> +static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, bool enable)
>   {
>   	int i;
>   
>   	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
> -		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
> +		icc_set_bw(msm_mdss->mdp_path[i], 0, enable ? Bps_to_icc(MIN_IB_BW) : 0);
> +
> +	if (msm_mdss->reg_bus_path)
> +		icc_set_bw(msm_mdss->reg_bus_path, 0, enable ? 76800 : 0);

Please use Bps_to_icc, kbps_to_icc or any of the other macros.

BR,
Georgi
