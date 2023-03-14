Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40566B9728
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C8D10E801;
	Tue, 14 Mar 2023 14:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9010E177;
 Tue, 14 Mar 2023 14:04:21 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2088920145;
 Tue, 14 Mar 2023 15:04:19 +0100 (CET)
Date: Tue, 14 Mar 2023 15:04:15 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 07/10] drm/msm/dsi: Remove custom DSI config handling
Message-ID: <20230314140415.4aensrq6ntj3j25w@SoMainline.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-7-54b4898189cb@linaro.org>
 <20230314130522.wimbrf7d6lqwdbgz@SoMainline.org>
 <441030fa-afcb-8e5f-ea5a-f467d9d11937@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <441030fa-afcb-8e5f-ea5a-f467d9d11937@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-14 14:44:06, Konrad Dybcio wrote:
> 
> 
> On 14.03.2023 14:05, Marijn Suijten wrote:
> > On 2023-03-14 13:13:45, Konrad Dybcio wrote:
> >> Now that the only user is handled by common code, remove the option to
> >> specify custom handlers through match data.
> >>
> >> This is effectively a revert of commit:
> >> 5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> [...]
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> index 8772a3631ac1..91bdaf50bb1a 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> @@ -65,8 +65,5 @@ struct msm_dsi_cfg_handler {
> >>  
> >>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
> >>  
> >> -/* Non autodetect configs */
> >> -extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
> >> -
> > 
> > Probably the wrong `fixup!` commit: this should have been part of patch
> > 6 where the struct is removed, not patch 7 (this patch).
> Yeah, that's most likely what happened.. Does that warrant another resend?

For proper cleanliness it should have been... but maybe Dmitry can patch
this up while applying?  In that case, at least have my:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
