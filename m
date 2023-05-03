Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892256F621D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 01:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2508D10E05D;
	Wed,  3 May 2023 23:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F7010E05D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 23:36:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8EFF320A1D;
 Thu,  4 May 2023 01:36:54 +0200 (CEST)
Date: Thu, 4 May 2023 01:36:53 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v4 4/7] drm/msm/dpu: add PINGPONG_NONE to disconnect DSC
 from PINGPONG
Message-ID: <mbpdqthhi7ynb22l62pwuwuepqeh6t67ggdseltxlx25uh6a2x@sbbfuitssdv5>
References: <1683144639-26614-1-git-send-email-quic_khsieh@quicinc.com>
 <1683144639-26614-5-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683144639-26614-5-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-03 13:10:36, Kuogee Hsieh wrote:
> During DSC setup, the crossbar mux need to be programmed to engage
> DSC to specified PINGPONG. Hence during tear down, the crossbar mux
> need to be reset to disengage DSC from PINGPONG. 0X0F is written to
> reset crossbar mux. It is not relevant to hw_pp->idx.  This patch add
> PINGPONG_NONE to serve as disable to reset crossbar mux.
> 
> Changes in v4:
> -- more details to commit text

As requested in v3, this doesn't adequately explain that all you're
doing is **removing `bool enable`** so that this function becomes
simpler to call in the disable scenario without coming up with a random
dpu_pingpong value that's irrelevant when enable=false.  How about the
following wording:

    drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG

    Disabling the crossbar mux between DSC and PINGPONG currently
    requires a bogus enum dpu_pingpong value to be passed when calling
    dsc_bind_pingpong_blk() with enable=false, even though the register
    value written is independent of the current PINGPONG block.  Replace
    that `bool enable` parameter with a new PINGPONG_NONE dpu_pingpong
    flag that triggers the write of the "special" 0xF "crossbar
    disabled" value to the register instead.

And don't forget to fix the log statement below.

<snip>

>  	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
> -			enable ? "Binding" : "Unbinding",
> +			pp ? "Binding" : "Unbinding",
>  			hw_dsc->idx - DSC_0,
> -			enable ? "to" : "from",
> +			pp ? "to" : "from",
>  			pp - PINGPONG_0);

This wasn't adjusted, see v3 review.

- Marijn
