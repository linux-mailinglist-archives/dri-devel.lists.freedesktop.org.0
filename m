Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67855A4081B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 12:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAE310E1C1;
	Sat, 22 Feb 2025 11:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=erdfelt.com header.i=@erdfelt.com header.b="uV73Vx4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 843 seconds by postgrey-1.36 at gabe;
 Sat, 22 Feb 2025 06:24:49 UTC
Received: from out.bound.email (out.bound.email [141.193.244.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C910610E307
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 06:24:49 +0000 (UTC)
Received: from mail.sventech.com (localhost [127.0.0.1])
 by out.bound.email (Postfix) with ESMTP id 9DDFA8A0A03;
 Fri, 21 Feb 2025 22:10:43 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
 id 8445F160036F; Fri, 21 Feb 2025 22:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
 s=default; t=1740204643;
 bh=ipBg/kh10xlLbTfqW90iojp94rB9+YUQQbr3OHMLVXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uV73Vx4sYe6+zf3jjzrwt+ECW446OAMMZzdBgrfnLwS0sg+2CL30u2R73aA5DxYnl
 7zGJFwOIa47n8pyBbaz2HQA4i+QHZtwNJYfU2M9GMUIDBsUNddjp4oUf+mneWRdxff
 SK+LnfDuirmuLBci97mXWUpZILvcPoCSkgWk7tu0=
Date: Fri, 21 Feb 2025 22:10:43 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 simona@ffwll.ch, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh@kernel.org, maarten.lankhorst@linux.intel.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mripard@kernel.org, tzimmermann@suse.de, andy.yan@rock-chips.com,
 krzk+dt@kernel.org, kernel@collabora.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Message-ID: <20250222061043.GW16911@sventech.com>
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
 <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
 <2425191.NG923GbCHz@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2425191.NG923GbCHz@diego>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sat, 22 Feb 2025 11:54:30 +0000
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

On Tue, Feb 18, 2025, Heiko Stübner <heiko@sntech.de> wrote:
> I was more thinking about fixing the correct thing, with something like:
> 
> ----------- 8< ----------
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172f..50faafbf5dda 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5258,6 +5258,10 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
>         if (!clkspec)
>                 return ERR_PTR(-EINVAL);
> 
> +       /* Check if node in clkspec is in disabled/fail state */
> +       if (!of_device_is_available(clkspec->np))
> +               return ERR_PTR(-ENOENT);
> +
>         mutex_lock(&of_clk_mutex);
>         list_for_each_entry(provider, &of_clk_providers, link) {
>                 if (provider->node == clkspec->np) {
> ----------- 8< ----------
> 
> Because right now the clk framework does not handle nodes in
> failed/disabled state and would defer indefinitly.

I've been testing the recent patches Jimmy Hon has posted to add the
Orange Pi 5 Ultra DT and I ran into this bug. The Ultra uses HDMI1 for
the HDMI TX.

This patch successfully fixes the issue I was seeing.

JE

