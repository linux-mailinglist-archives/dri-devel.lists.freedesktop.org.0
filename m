Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F548F281
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 23:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6894510E28F;
	Fri, 14 Jan 2022 22:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9FA10E28F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 22:38:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 910A861ED2;
 Fri, 14 Jan 2022 22:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E542EC36AE7;
 Fri, 14 Jan 2022 22:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642199925;
 bh=WTst2NrV82dAikh+ViTGMOxgddkuhhc7SX52HrSKAEE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=P1UY4JGng/j87dDRKNOnuO81kP74augA/pxUqJ0cOP4SfM3VDK8lxHJSGHJDLjrQo
 VxCftDStONzCsKpIiX65xWjsJsOZbaRxBv+9BhrOAuP1Mm44dlvsgO+6Jbafw1wuLt
 dHGBNCircKv2DR4zsEVX3PLU0xLxTThdrNhhTSw7z9q369ucWGLfB852v5oy8fdZc9
 1PVVQI86XPj+13Y4QxgdAD6bLOEh+EhPwke6jUadjzk03jfgCZwTxLzO3cjxVYMqK/
 HP1fu3h0adN6QDt7Kl8ShU00v1FH94Z8sdukueIWAbmJMBaGKONgWhaMwtW0rgoHYQ
 PHgjvD3N4YLQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220114161556.vgxhetm4ccokik4b@houat>
References: <20210914093515.260031-1-maxime@cerno.tech>
 <20210914093515.260031-2-maxime@cerno.tech>
 <20220112033716.63631C36AEA@smtp.kernel.org>
 <20220112114652.hmfdcpqil5jg2vz6@houat>
 <20220113214426.95292C36AEA@smtp.kernel.org>
 <20220114161556.vgxhetm4ccokik4b@houat>
Subject: Re: [PATCH v2 1/3] clk: Introduce a clock request API
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 14 Jan 2022 14:38:43 -0800
User-Agent: alot/0.10
Message-Id: <20220114223844.E542EC36AE7@smtp.kernel.org>
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-01-14 08:15:56)
> On Thu, Jan 13, 2022 at 01:44:25PM -0800, Stephen Boyd wrote:
> > >=20
> > I don't see a problem with re-evaluating the rate every time we call
> > clk_set_rate_range(). That's probably the bug that I can't recall. Can
> > you fix the API so it works that way?
>=20
> Yep, I'll work on it next week. I started to think about it this week,
> and there's two things I'm not entirely sure about:
>=20
>   - Keeping the clock at its minimum rate is essentially policy. Do we
>     want to guard that behavior by a flag, and do we want to do the same
>     thing if we want to max it?

The policy should be to re-evaluate the rate based on constraints each
time the constraints or rate is changed. The clk provider can decide if
it wants to max it out or keep it minimized in the determine_rate
clk_op. If you're worried about breaking somebody, there's only one
other user I see in the tree, Tegra, so the risk seems low. If Tegra is
relying on the existing behavior (very possible) then we can hopefully
change that clk provider to keep the rate where it is if it's within the
constraints vs. round it down to the minimum acceptable.

>=20
>   - How should we deal with a clk_set_rate call while we have a range?
>     Something like:
>=20
>     clk_set_min_rate(hdmi1_clk, 1000);
>     clk_set_min_rate(hdmi2_clk, 2000)
>     clk_set_rate(hdmi1_clk, 3000);
>     clk_drop_range(hdmi2_clk);
>=20
>     If we just try to minimize the rate all the time, we'll set the rate
>     back to 1000Hz, but I think it would make more sense to keep the
>     rate at 3000?

This assumes the rate after clk_set_rate() is 3000. It all depends on
the provider what the rate actually is.

>=20
>     Maybe we can test if the range is still at the boundary we remove,
>     and only if it is, drop it to whatever boundary we have left?
>=20

From the consumer API perspective it looks like hdmi1 is saying it can
accept a frequency as low as 1000 but would like 3000. The clk provider
will look at the constraints and decide to try to get close to 3000, or
exceed 3000, or set it lower than 3000 but not lower than 2000. I don't
want to enforce anything in the framework here. Let the clk provider
decide what frequency it should set the rate to based on the
constraints. When there are constraints mixed with a clk_set_rate() we
should give the provider all the facts, i.e. the rate and the
constraints and let it decide what to do.
