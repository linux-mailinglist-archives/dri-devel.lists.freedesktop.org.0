Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36A63FB0A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9E610E681;
	Thu,  1 Dec 2022 22:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDA010E680;
 Thu,  1 Dec 2022 22:57:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AC0962178;
 Thu,  1 Dec 2022 22:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158DCC433C1;
 Thu,  1 Dec 2022 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669935428;
 bh=Iece4Ggdjnc0zgVTxLn8Qf6TaPc+ROmQXehO4YnTyUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dhi9a4n1MDkugPm6zzlyfa1b463Z4vsP2TF/EUCWg0UeTI/wZXo9HV75Wrqt9ktiN
 0VE/7gjmbALvarkSaaTK2vduEPR3b0vHlQ8YRjQW8VWmt3r+0KG1ZSer25P2FwUi4j
 cIPN0/vWkJ8U0tyCI294h+QP/yExXFxgYvLJKem9oRgF7bqTyzY4Cwk8MzOUMgialh
 XqMJ+4y7T+NuC9fDSOQlLlGdDWFmKH7jGWrxKiw6TPwsijz0ec+D7b7uT0a9dTAuWG
 W4sAIyUbit8zbldtmN0SLaKsxMhCJgIrQev/i8YLwVihXjXRSQEWEKeAiL1dqsFWj6
 m/m92RAlKTIxA==
Date: Thu, 1 Dec 2022 16:57:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Message-ID: <20221201225705.46r2m35ketvzipox@builder.lan>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 krzysztof.kozlowski@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> 

@Ulf, Akhil has a power-domain for a piece of hardware which may be
voted active by multiple different subsystems (co-processors/execution
contexts) in the system.

As such, during the powering down sequence we don't wait for the
power-domain to turn off. But in the event of an error, the recovery
mechanism relies on waiting for the hardware to settle in a powered off
state.

The proposal here is to use the reset framework to wait for this state
to be reached, before continuing with the recovery mechanism in the
client driver.

Given our other discussions on quirky behavior, do you have any
input/suggestions on this?

> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal. To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.

@Akhil, this description is fairly generic. As we've reached the state
where the hardware has settled and we return to the client, what
prevents it from being powered up again?

Or is it simply a question of it hitting the powered-off state, not
necessarily staying there?

Regards,
Bjorn

> 
> This series is rebased on top of qcom/linux:for-next branch.
> 
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
> 
> Changes in v7:
> - Update commit message (Bjorn)
> - Rebased on top of qcom/linux:for-next branch.
> 
> Changes in v6:
> - No code changes in this version. Just captured the Acked-by tags
> 
> Changes in v5:
> - Nit: Remove a duplicate blank line (Krzysztof)
> 
> Changes in v4:
> - Update gpu dt-binding schema
> - Typo fix in commit text
> 
> Changes in v3:
> - Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krzysztof)
> 
> Changes in v2:
> - Return error when a particular custom reset op is not implemented. (Dmitry)
> 
> Akhil P Oommen (6):
>   dt-bindings: clk: qcom: Support gpu cx gdsc reset
>   clk: qcom: Allow custom reset ops
>   clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>   clk: qcom: gpucc-sc7280: Add cx collapse reset support
>   dt-bindings: drm/msm/gpu: Add optional resets
>   arm64: dts: qcom: sc7280: Add Reset support for gpu
> 
>  .../devicetree/bindings/display/msm/gpu.yaml       |  6 +++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +++
>  drivers/clk/qcom/gdsc.c                            | 23 ++++++++++++++----
>  drivers/clk/qcom/gdsc.h                            |  7 ++++++
>  drivers/clk/qcom/gpucc-sc7280.c                    | 10 ++++++++
>  drivers/clk/qcom/reset.c                           | 27 +++++++++++++++++++++-
>  drivers/clk/qcom/reset.h                           |  8 +++++++
>  include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  3 +++
>  8 files changed, 82 insertions(+), 5 deletions(-)
> 
> -- 
> 2.7.4
> 
