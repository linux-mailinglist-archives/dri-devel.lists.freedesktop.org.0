Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84D7BBCAF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 18:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B0610E534;
	Fri,  6 Oct 2023 16:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520610E534;
 Fri,  6 Oct 2023 16:27:05 +0000 (UTC)
Received: from g550jk.localnet (k10064.upc-k.chello.nl [62.108.10.64])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 49F5BC7DB1;
 Fri,  6 Oct 2023 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1696609593; bh=7XUVrpq5dGvmYdD55o5iSVdInjOuv/+36iUevKirUmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=edBJ2D4HGI5Mgg6i9lXKDzg631eax4/2CZiv0TFCbkjr926EZVXdV1BgTi56Y+Zif
 z6cCZhaZQARvLYd6OLPPTKXi/FImuQoflnpGnvzO84gysbHk25brze4AuhKlMtQYZY
 hWOVNoANlnYAP1Dczz1Thv5p6zMenQZ7xngS5CJU=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
Date: Fri, 06 Oct 2023 18:26:32 +0200
Message-ID: <12295796.O9o76ZdvQC@z3ntu.xyz>
In-Reply-To: <019e66c4-8188-4fbb-b169-d2cec165c91b@linaro.org>
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <5711857.DvuYhMxLoT@z3ntu.xyz>
 <019e66c4-8188-4fbb-b169-d2cec165c91b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Freitag, 6. Oktober 2023 15:38:51 CEST Dmitry Baryshkov wrote:
> On 29/09/2023 23:52, Luca Weiss wrote:
> > On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
> >> Experimental support for MSM8953, which has MDP5 v1.16. It looks like
> >> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> >> etc.
> > 
> > Hi Dmitry,
> > 
> > As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the
> > screen is initializing and displaying stuff :) But there's some errors,
> > which presumably are the reason that the screen is only updating a few
> > times per second.
> > 
> > [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> > [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu
> > error]enc31 intf1 ctl start interrupt wait failed [   23.099821]
> > [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done
> > returned -22
> > 
> > These messages appear about 13 times per second but as I mentioned, the
> > screen *is* updating (slowly) there.
> 
> For my understanding, does it work with the MDP5 driver?

Not perfectly, but it does work. What I mean is that the panel is running at 
30Hz (shown e.g. with kmscube) instead of the 60Hz it should run at.

One of the comments I got is that mdp5 is essentially unmaintained so I should 
try DPU ;)

Also I can ask someone with a video-mode panel to test, maybe it works better 
there. At least good to have more data points?

Regards
Luca

> 
> > Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> > msm_mdp5_dpu_migration list, without this DPU is never even considered for
> > 8953.




