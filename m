Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19D7FA5A7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F30010E396;
	Mon, 27 Nov 2023 16:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235A910E396;
 Mon, 27 Nov 2023 16:07:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CBDAECE127E;
 Mon, 27 Nov 2023 16:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071E7C433C8;
 Mon, 27 Nov 2023 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701101236;
 bh=CAVT3JTOqdhtMpmyz9hZHgwDT59aK+uHYtnwfXlCXjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=neC+N+L85KemwluYfyC3P9D8ihbrOkVoCvJ1GV+ZCiqo+YeGQ+HY4hTVBV3Lgst1c
 9cRWM9QUolfeC7sLFu6CjfnGHEDCD91cdhkG28ea4OXjfhYrvhX5ZHfsYnRlg6ZUiA
 k5CiTAic0qf0jfdGSnB0j/vVsSAOKia85mq/DgzEfOhmXZMDihTqw1oFDrM9Z5aHch
 ky2TtMRPtTg3TjuAT89xXCSoa61vxHGKzsrk1bl/q17DIUsoctaErgIcTVn0Dsc2IP
 dh+C+nnHqZTChSA4mHWgVcFt7UPRn6r2KKG0p0K8s/8KfvDTrB8/EIIjr5+uu8DELK
 fnKjh5PjHfbmw==
From: Michael Walle <mwalle@kernel.org>
To: dmitry.baryshkov@linaro.org
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Date: Mon, 27 Nov 2023 17:06:58 +0100
Message-Id: <20231127160658.2164612-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Michael Walle <mwalle@kernel.org>, tony@atomide.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 marijn.suijten@somainline.org, marex@denx.de, rfoss@kernel.org,
 dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com,
 alexander.stein@ew.tq-group.com, quic_jesszhan@quicinc.com, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, dianders@chromium.org,
 konrad.dybcio@linaro.org, tzimmermann@suse.de, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> DSI device lifetime has three different stages:
> 1. before the DSI link being powered up and clocking,
> 2. when the DSI link is in LP state (for the purpose of this question,
> this is the time between the DSI link being powered up and the video
> stream start)
> 3. when the DSI link is in HS state (while streaming the video).

It's not clear to me what (2) is. What is the state of the clock and
data lanes?

I'm facing similar issues with the tc358775 bridge. This bridge needs
to release its reset while both clock and data lanes are in LP-11 mode.
But then it needs to be configured (via I2C) while the clock lane is
in enabled (HS mode), but the data lanes are still in LP-11 mode.

To me it looks like there is a fouth case then:
1. unpowered
2. DSI clock and data are in LP-11
3. DSI clock is in HS and data are in LP-11
4. DSI clock is in HS and data is in HS

(And of course the bridge needs continuous clock mode).

> Different DSI bridges have different requirements with respect to the
> code being executed at stages 1 and 2. For example several DSI-to-eDP
> bridges (ps8640, tc358767 require for the link to be quiet during
> reset time.
> The DSI-controlled bridges and DSI panels need to send some commands
> in stage 2, before starting up video
> 
> In the DRM subsystem stage 3 naturally maps to the
> drm_bridge_funcs::enable, stage 1 also naturally maps to the
> drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> the DRM call chain.
> Earlier we attempted to solve that using the pre_enable_prev_first,
> which remapped pre-enable callback execution order. However it has led
> us to the two issues. First, at the DSI host driver we do not know
> whether the panel / bridge were updated to use pre_enable_prev_first
> or not. Second, if the bridge has to perform steps during both stages
> 1 and 2, it can not do that.
> 
> I'm trying to find a way to express the difference between stages 1
> and 2 in the generic code, so that we do not to worry about particular
> DSI host and DSI bridge / panel peculiarities when implementing the
> DSI host and/or DSI panel driver.

For now, I have a rather hacky ".dsi_lp11_notify" callback in
drm_bridge_funcs which is supposed to be called by the DSI host while the
clock and data lanes are in LP-11 mode. But that is rather an RFC and me
needing something to get the driver for this bridge working. Because it's
badly broken. FWIW, you can find my work-in-progress patches at
https://github.com/mwalle/linux/tree/feature-tc358775-fixes

-michael
