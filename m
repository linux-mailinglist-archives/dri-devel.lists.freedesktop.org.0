Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ADB67A6EA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 00:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F053510E09F;
	Tue, 24 Jan 2023 23:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8810E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:36:36 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7C3054215D;
 Wed, 25 Jan 2023 00:36:33 +0100 (CET)
Date: Wed, 25 Jan 2023 00:36:31 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1 12/14] drm/msm/disp/dpu1: revise timing engine
 programming to work for DSC
Message-ID: <20230124233631.rojijcfy6xhntl3p@SoMainline.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
 <8392e1f3-8459-4408-41de-564a41980b4c@linaro.org>
 <3588a5d0-ca28-918f-e072-35f15a5a5132@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3588a5d0-ca28-918f-e072-35f15a5a5132@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 andersson@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-24 09:55:24, Kuogee Hsieh wrote:

<snip>

> This timing engine code is derived from our downstream code directly and 
> it has been used at many mobile devices by many vendors for many years 
> already.
> 
> On the other words, it had been tested very thorough and works on 
> dsi/dp/hdmi/dsc/widebus applications.

And the code already in mainline has seen 12 rounds of review, with a
focus on inter-SoC compatibility.  Regardless of that, we have processes
to make changes on mainline: formatting changes (when actually making an
improvement) go separate from semantic changes.  Bugfixes are clearly
described in individual patches with Fixes: tags.  If you really think
the code has to be as proposed in this patch, follow Dmitry's advice and
split this accordingly.

> When i brought dsc v1.2 over, I just merged it over and did not consider 
> too much.

And that is exactly what is wrong with this *entire* series: copying
over downstream code without "considering too much", stomping over
previous review and even reverting bugfixes [1] [2] without giving it
ANY ATTENTION in your patch description.  That's unacceptable and
insulting to contributors and reviewers.  Full stop.  Or did you expect
us to turn a blind eye?  This is mainline, not some techpack playground.

[1]: https://lore.kernel.org/linux-arm-msm/20230123201133.zzt2zbyaw3pfkzi6@SoMainline.org/
[2]: https://lore.kernel.org/linux-arm-msm/20221026182824.876933-10-marijn.suijten@somainline.org/

> Can we adapt this code so that both upstream and down stream shared same 
> timing engine programming so that easier to maintain?

Easy, I've said this before in IRC and will state it again: stop this
techpack nonsense and focus on upstream-first.  When something passes
mainline review (and please don't bother maintainers and reviewers with
series like this) it is inevitably good enough to be copied to
techpack... at which point techpack becomes worthless as you can just
backport a mainline patch or use a recent-enough kernel.


tl;dr: it seems like you nor anyone involved in pre-reviewing/vetting
this series is familiar with upstream guidelines.  Follow the global
advice from Dmitry [3] to reach a more efficient v2, and please don't
let this run to v10 (or beyond) again.

One suggestion to improve efficiency: split off the DPU v1.2 hardware
block addition (and related changes) into a separate series.  A smaller
series (and properly split patches!) will give everyone less moving
parts to worry about, and paves the way for DSI support without blocking
on DP.

[3]: https://lore.kernel.org/linux-arm-msm/47c83e8c-09f1-d1dd-ca79-574122638256@linaro.org/

- Marijn
