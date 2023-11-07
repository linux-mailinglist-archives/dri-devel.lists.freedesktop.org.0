Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DED7E4361
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 16:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F2110E60C;
	Tue,  7 Nov 2023 15:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA1510E60B;
 Tue,  7 Nov 2023 15:26:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB9CDCE0F14;
 Tue,  7 Nov 2023 15:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E20CC433C7;
 Tue,  7 Nov 2023 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699370798;
 bh=ljmnGxLYReiQWa6Iv86aTfS9zhxAvbUWtes+QtFunpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m63ny3zpg+SV/+cDpDbbJmMFdZ0EBKySKBGuQAqjxFNkqQGhaOdWSgvY56ZF7FxX5
 kuHXtm0T3Wc4V1mbYpuqOn+x5n3xTZQtKiq/5u5bnCpOOZcQDSk8kE5CciAZ88Uh9/
 aPKVARvlyxzu/U+Qj2T7+Sxos5JQIV3/OL2G8F1g=
Date: Tue, 7 Nov 2023 16:26:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <2023110704-deem-jigsaw-0bbf@gregkh>
References: <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
 <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
 <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <2z3yvvtd6ttsd7qw43sl5svtfijxevdr6omxxmws64k6l5qv55@5nnh2b32h2ep>
 <2023110704-playback-grit-7a27@gregkh>
 <hkzoi4sazufi5xdgr6hacuzk72cnbtmm6dwm2bzfgwh5yij6wj@2g4eb6ea4dgd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hkzoi4sazufi5xdgr6hacuzk72cnbtmm6dwm2bzfgwh5yij6wj@2g4eb6ea4dgd>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 01:18:14PM +0100, Maxime Ripard wrote:
> On Tue, Nov 07, 2023 at 12:22:21PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Nov 07, 2023 at 11:57:49AM +0100, Maxime Ripard wrote:
> > > +GKH
> > 
> > Why?  I don't see a question for me here, sorry.
> 
> I guess the question is: we have a bus with various power states
> (powered off, low power, high speed)

Great, have fun!  And is this per-device or per-bus-instance?

> low power is typically used to send commands to a device, high speed to
> transmit pixels, but still allows to send commands.
> 
> Depending on the devices, there's different requirements about the state
> devices expect the bus to be in to send commands. Some will need to send
> all the commands in the low power state, some don't care, etc. See
> the mail I was replying too for more details.
> 
> We've tried so far to model that in KMS itself, so the framework the
> drivers would register too, but we're kind of reaching the limits of
> what we can do there. It also feels to me that "the driver can't access
> its device" is more of a problem for the bus to solve rather than the
> framework.

This is up to the specific bus to resolve, there's nothing special
needed in the driver core for it, right?

> Do you agree? Are you aware of any other bus in Linux with similar
> requirements we could look at? Or any suggestion on how to solve it?

There might be others, yes, look at how the dynamic power management
works for different devices on most busses, that might help you out
here.

good luck!

greg k-h
