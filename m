Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03C70CE2B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD3C10E2BF;
	Mon, 22 May 2023 22:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7F210E082;
 Mon, 22 May 2023 22:43:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB1266239A;
 Mon, 22 May 2023 22:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEEAC433EF;
 Mon, 22 May 2023 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684795438;
 bh=oOHDjeYKCKxfJCgXP2IFGV4OVL44QXbBAH3b4cOYdG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIK07Rtlo0FkG2xHNTlvOBNjCr1urFVT9UBOedGuSQfj+W95+8oinEug9N1wDVoNs
 glixJIsgG6OPvwptlGPmI0zfb+8UR/1fcxdxil9DLSOm+ZQ3/UIYHZufCnjuGP029r
 qWtaL3czA1cb6AMKq4PeR72BTNih0Is2a+wy0B4+3DDVpksci8GU+rHl0tFNKFzWWP
 CqzOvANXB2WGirNq9thICVmK2aZbwlmR6Qc3XHQ20cN0bPe6c0pa+AesFjiUQJjjY0
 Z0ZkbVnpGif/y5gmnBz6lFNtP59YcnXHjNj6hOxQ0SeXOq5PyvbqwXBO/fFM9KcfRo
 fZLC6OxKZrteg==
Date: Mon, 22 May 2023 15:47:51 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
Message-ID: <20230522224751.5tf4oifp5z5k45pf@ripper>
References: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
 <20230522220555.7ood44kavjzzg3lv@ripper>
 <c4d6e019-1582-c94f-d56d-271c420d72ea@linaro.org>
 <9804c558-124d-aca4-c534-158c0457b7bf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9804c558-124d-aca4-c534-158c0457b7bf@quicinc.com>
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
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, quic_jesszhan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:35:13PM -0700, Kuogee Hsieh wrote:
> 
> 
> > > >   -static void dp_display_config_hpd(struct dp_display_private *dp)
> > > > -{
> > > > -
> > > > -    dp_display_host_init(dp);
> > > > -    dp_catalog_ctrl_hpd_config(dp->catalog);
> > > > -
> > > > -    /* Enable plug and unplug interrupts only if requested */
> > > > -    if (dp->dp_display.internal_hpd)
> > > > -        dp_catalog_hpd_config_intr(dp->catalog,
> > > > -                DP_DP_HPD_PLUG_INT_MASK |
> > > > -                DP_DP_HPD_UNPLUG_INT_MASK,
> > > > -                true);
> > > > -
> > > > -    /* Enable interrupt first time
> > > > -     * we are leaving dp clocks on during disconnect
> > > > -     * and never disable interrupt
> > > > -     */
> > > > -    enable_irq(dp->irq);
> > > 
> > > ...we need dp->irq enabled for handling the other interrupts, otherwise
> > > e.g. AUX transfers will time out.
> > > 
> > > I added enable_irq(dp_priv->irq) to the EV_HPD_INIT_SETUP case below,
> > > just for testing, and with that the patch seems to be working fine.
> > > 
> > > 
> > > Is there any reason why we need to delay its enablement to after we
> > > unmask the HPD interrupts?
> 
> my though is aux transaction should happen after plugin interrupt detected.
> 

I have a next_bridge which implements DRM_BRIDGE_OP_HPD, in which case
dp_bridge_hpd_enable() will never be called (the next_bridge's
hpd_enable will be called instead).

> can you please let me know what did you do to trigger aux timeout?
> 

In this setup I just connect the cable, wait a few seconds and the
transfers fails - as there's no interrupts signalling them being
completed.

> It does not happen on me at my test.
> 

Given that you have the HPD signal on a GPIO, you should be able to
rewrite your DTS in line with:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sa8295p-adp.dts#n28

And pinmux the HPD signal as GPIO instead.

I believe this would allow you to test both code paths - without the
actual TCPM known to Linux.

> > 
> > As I wrote, I'd probably prefer to see enable_irq() and disable_irq()
> > calls gone.
> 
> ok, i will move enable_irq() out of here.
> 

Thanks,
Bjorn

> 
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > 
