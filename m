Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C95905571
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD4110E87A;
	Wed, 12 Jun 2024 14:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2r7wGhyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FA510E87A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:42:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D06CDCE0C2F;
 Wed, 12 Jun 2024 14:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C34FC116B1;
 Wed, 12 Jun 2024 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1718203342;
 bh=fIyHMCmdFag/kreazotdgSfqaaLxX6azOoYs64Naiq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2r7wGhybYveJ0OLks02tsdo8uWtqpEFFUrtDCrsXCKYC1H7xvfiNjkI9VxsQ345hk
 TJKFXsJYUE9xA7aEoZdI9C2Va7O2R3Yd0hrKq8OC0ZkL3c5HWp82SMRze2saG2/DHQ
 icYL9JmNEzpNy+dkQ2CDZOVDP7TwVbPDBXqoCCAs=
Date: Wed, 12 Jun 2024 16:42:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>,
 Frank Oltmanns <frank@oltmanns.dev>, stable@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
Message-ID: <2024061208-trapping-diminish-fda6@gregkh>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 <yw1xo78z8ez0.fsf@mansr.com>
 <c4c1229c-1ed3-4b6e-a53a-e1ace2502ded@oltmanns.dev>
 <yw1x4jap90va.fsf@mansr.com> <yw1xo78w73uv.fsf@mansr.com>
 <8be80682-067a-4685-9830-cfed0287e617@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8be80682-067a-4685-9830-cfed0287e617@leemhuis.info>
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

On Wed, Jun 12, 2024 at 03:28:01PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 23.05.24 20:58, Måns Rullgård wrote:
> > Måns Rullgård <mans@mansr.com> writes:
> >> Frank Oltmanns <frank@oltmanns.dev> writes:
> >>> 21.05.2024 15:43:10 Måns Rullgård <mans@mansr.com>:
> >>>> Frank Oltmanns <frank@oltmanns.dev> writes:
> >>>>
> >>>>> The Allwinner SoC's typically have an upper and lower limit for their
> >>>>> clocks' rates. Up until now, support for that has been implemented
> >>>>> separately for each clock type.
> >>>>>
> >>>>> Implement that functionality in the sunxi-ng's common part making use of
> >>>>> the CCF rate liming capabilities, so that it is available for all clock
> >>>>> types.
> >>>>>
> >>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
> >>>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >>>>> Cc: stable@vger.kernel.org
> >>>>> ---
> >>>>> drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
> >>>>> drivers/clk/sunxi-ng/ccu_common.h |  3 +++
> >>>>> 2 files changed, 22 insertions(+)
> >>>>
> >>>> This just landed in 6.6 stable, and it broke HDMI output on an A20 based
> >>>> device, the clocks ending up all wrong as seen in this diff of
> >>>> /sys/kernel/debug/clk/clk_summary:
> > [...]
> > 
> >>>> Reverting this commit makes it work again.
> >>> Thank you for your detailed report!
> > [...]
> > It turns out HDMI output is broken in v6.9 for a different reason.
> > However, this commit (b914ec33b391 clk: sunxi-ng: common: Support
> > minimum and maximum rate) requires two others as well in order not
> > to break things on the A20:
> > 
> > cedb7dd193f6 drm/sun4i: hdmi: Convert encoder to atomic
> > 9ca6bc246035 drm/sun4i: hdmi: Move mode_set into enable
> > 
> > With those two (the second depends on the first) cherry-picked on top of
> > v6.6.31, the HDMI output is working again.  Likewise on v6.8.10.
> 
> They from what I can see are not yet in 6.6.y or on their way there (6.8
> is EOL now). Did anyone ask Greg to pick this up? If not: Månsm could
> you maybe do that? CCing him on a reply and asking is likely enough if
> both changes apply cleanly.

Both now queued up, thanks.

greg k-h
