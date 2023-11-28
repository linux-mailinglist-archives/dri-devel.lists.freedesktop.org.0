Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE357FCA0D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2BE10E361;
	Tue, 28 Nov 2023 22:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8C210E048;
 Tue, 28 Nov 2023 22:18:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9F0EDB8068A;
 Tue, 28 Nov 2023 22:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360DEC433C8;
 Tue, 28 Nov 2023 22:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701209886;
 bh=ScPqrKrr5fwcMadOaUcl+bJfC6DSW+eVwIqo4WXnKe4=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=lsXwK+xD3UehOuoCUwSS4p5SvzngiI8XAETgZtnybHgrhVQGBRwM1q11YID8gS3UZ
 wfuMAaWOsddOLngX07am9vMnrqO81sJlYE0/TEyxc2OmVg4GZmqDfZ8OmDixIRrPvn
 AXCMmJOUk/Jv9oQm1rdJmgQFIhLiryBKssmFVDQHWmvyQcs82vyvCrOlGKLwKiLo3K
 wONyauGHa5O9zGKbgiYMKVqTj8xmfzYEIeuN+Z5Q1YzDs+K9ItcnAllj/P28tk6XeX
 nYuD88rXyq+BUpa32RNLvkFbFrrc0rbOsjAxEO6NEiUIVmfmzetZpPks5DiST/k7SU
 GtwwFpJp+L+uQ==
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 23:17:55 +0100
From: Michael Walle <mwalle@kernel.org>
To: undisclosed-recipients:;
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
In-Reply-To: <CAA8EJpoYkH-0onMmNRk1iO5YeLN+5hpZMsfvtNo-7p6y2mjZwg@mail.gmail.com>
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
 <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
 <dce76a6e1321a6374ad39125bead56b3@kernel.org>
 <CAA8EJpr9PDgSrTpP2-joQ09fxmJKZB1B+ESbDbMjkLNiqZ1m3A@mail.gmail.com>
 <14D9F495-425D-47FA-AD0D-F7299285936F@walle.cc>
 <CAA8EJpoYkH-0onMmNRk1iO5YeLN+5hpZMsfvtNo-7p6y2mjZwg@mail.gmail.com>
Message-ID: <1293a05c596d92da15bb6076d5046c93@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Nov 2023 22:58:27 +0000
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

>> >> >> > DSI device lifetime has three different stages:
>> >> >> > 1. before the DSI link being powered up and clocking,
>> >> >> > 2. when the DSI link is in LP state (for the purpose of this question,
>> >> >> > this is the time between the DSI link being powered up and the video
>> >> >> > stream start)
>> >> >> > 3. when the DSI link is in HS state (while streaming the video).
>> >> >>
>> >> >> It's not clear to me what (2) is. What is the state of the clock and
>> >> >> data lanes?
>> >> >
>> >> > Clk an Data0 should be in the LP mode, ready for LP Data Transfer.
>> >>
>> >> Then this is somehow missing
>> >> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>> >>
>> >>    A DSI host should keep the PHY powered down until the pre_enable
>> >> operation
>> >>    is called. All lanes are in an undefined idle state up to this point,
>> >> and
>> >>    it must not be assumed that it is LP-11. pre_enable should initialise
>> >> the
>> >>    PHY, set the data lanes to LP-11, and the clock lane to either LP-11
>> >> or HS
>> >>    depending on the mode_flag MIPI_DSI_CLOCK_NON_CONTINUOUS.
>> >>
>> >> So I don't think these three states are sufficient, see below, that
>> >> there
>> >> should be at least four.
>> >
>> >Which one is #4?
>> 
>> enabled clock lane (HS mode), data lanes in LP-11
> 
> What is the purpose of such a mode?

To repeat my first mail:

I'm facing similar issues with the tc358775 bridge. This bridge needs
to release its reset while both clock and data lanes are in LP-11
mode.
But then it needs to be configured (via I2C) while the clock lane is
in enabled (HS mode), but the data lanes are still in LP-11 mode.

Therefore, for the correct init sequence is:
(1) dsi host enables lanes, that is clock and data are in lp-11
(2) dsi bridge driver releases reset of the bridge
(3) dsi host enables clock lane, leaves data lanes in lp-11
(4) dsi bridge driver configures the bridge
(5) dsi host enables the video stream
(6) dsi bridge enables the output port of the bridge

-michael

>> >> > I don't think we support ULPS currently.
>> >> >
>> >> >
>> >> >>
>> >> >> I'm facing similar issues with the tc358775 bridge. This bridge needs
>> >> >> to release its reset while both clock and data lanes are in LP-11
>> >> >> mode.
>> >> >> But then it needs to be configured (via I2C) while the clock lane is
>> >> >> in enabled (HS mode), but the data lanes are still in LP-11 mode.
>> >> >>
>> >> >> To me it looks like there is a fouth case then:
>> >> >> 1. unpowered
>> >> >> 2. DSI clock and data are in LP-11
>> >> >> 3. DSI clock is in HS and data are in LP-11
>> >> >> 4. DSI clock is in HS and data is in HS
>> >> >>
>> >> >> (And of course the bridge needs continuous clock mode).
>> >> >>
>> >> >> > Different DSI bridges have different requirements with respect to the
>> >> >> > code being executed at stages 1 and 2. For example several DSI-to-eDP
>> >> >> > bridges (ps8640, tc358767 require for the link to be quiet during
>> >> >> > reset time.
>> >> >> > The DSI-controlled bridges and DSI panels need to send some commands
>> >> >> > in stage 2, before starting up video
>> >> >> >
>> >> >> > In the DRM subsystem stage 3 naturally maps to the
>> >> >> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
>> >> >> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
>> >> >> > the DRM call chain.
>> >> >> > Earlier we attempted to solve that using the pre_enable_prev_first,
>> >> >> > which remapped pre-enable callback execution order. However it has led
>> >> >> > us to the two issues. First, at the DSI host driver we do not know
>> >> >> > whether the panel / bridge were updated to use pre_enable_prev_first
>> >> >> > or not. Second, if the bridge has to perform steps during both stages
>> >> >> > 1 and 2, it can not do that.
>> >> >> >
>> >> >> > I'm trying to find a way to express the difference between stages 1
>> >> >> > and 2 in the generic code, so that we do not to worry about particular
>> >> >> > DSI host and DSI bridge / panel peculiarities when implementing the
>> >> >> > DSI host and/or DSI panel driver.
>> >> >>
>> >> >> For now, I have a rather hacky ".dsi_lp11_notify" callback in
>> >> >> drm_bridge_funcs which is supposed to be called by the DSI host while
>> >> >> the
>> >> >> clock and data lanes are in LP-11 mode. But that is rather an RFC and
>> >> >> me
>> >> >> needing something to get the driver for this bridge working. Because
>> >> >> it's
>> >> >> badly broken. FWIW, you can find my work-in-progress patches at
>> >> >> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
>> >> >>
>> >> >> -michael
>> >> >>
>> >> >
>> >> >
>> >> > --
>> >> > With best wishes
>> >> > Dmitry
>> >
>> >
>> >
>> 
