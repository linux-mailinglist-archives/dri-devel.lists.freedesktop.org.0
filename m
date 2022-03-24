Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03FB4E6912
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 20:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD63110E0F8;
	Thu, 24 Mar 2022 19:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07E710E0F8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 19:09:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F9BEB8250D;
 Thu, 24 Mar 2022 19:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E28C340EE;
 Thu, 24 Mar 2022 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648148947;
 bh=9Zaw4QnaJObocBpW0+nZUqWqUxkYP++HlVIrKQzxWEU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qTe1wJ1MlFK/aCHoeArbL74wovZbNPa7WMUUcq9v1Zeclg5Jsg69dBcVZ3m1b1w6k
 NuzdGSrVyXXAIQKu8Zqd1BcgjWVsz9qV5ctM4qnngyDZDtbHWVclSyodYFCQiTiauZ
 jaLyBXJEPn+Y+H9fIhLy1OJQhOkJ9OIBfl+cMJgPcjcSsh468HymuDm8ZeY+2t671j
 VspVYwvLFeVpWHJ4ybu/UF6mOQf9tCLL4nF/JHpi45vfwuSr0vCfO9SzdGJJ+6Y567
 q6pEJw+q9aftuAwfta0VIvnxJbF35QckWApSq51AOqZQFnl6LOBA35kiqvUPwfrZeQ
 fcNnpS67S1njA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220323085140.ifeclmttkrqo55ru@houat>
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-7-maxime@cerno.tech>
 <7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com>
 <20220323085140.ifeclmttkrqo55ru@houat>
Subject: Re: [PATCH v7 06/12] clk: Always set the rate on clk_set_range_rate
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Thu, 24 Mar 2022 12:09:05 -0700
User-Agent: alot/0.10
Message-Id: <20220324190907.08E28C340EE@smtp.kernel.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-03-23 01:51:40)
> Hi,
>=20
>=20
> The whole point of this patch is to give an opportunity to every driver
> to change the rate whenever the boundaries have changed, so we very much
> want to have the option to change it if clk_set_rate() has never been
> called.
>=20
> However, I think the issue is why req_rate would be 0 in the first
> place?
>=20
> req_rate is initialized to what recalc_rate returns:
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L3607
>=20
> So the case where req_rate is 0 shouldn't occur unless you had an
> explicit clk_set_rate to 0, or if your clock was orphaned at some point.
>=20
> Judging from the code, it seems like the latter is the most plausible.
> Indeed, __clk_core_init() will set req_rate to 0 if the clock is
> orphaned (just like rate and accuracy), and
> clk_core_reparent_orphans_nolock will be in charge of updating them when
> the clock is no longer an orphan.
>=20
> However, clk_core_reparent_orphans_nolock() will update rate by calling
> __clk_recalc_rate and accuracy by calling __clk_recalc_accuracies, but
> it never sets req_rate.
>=20
> I'm not sure if this is the right patch, Stephen will tell, but could
> you test:

It looks correct to me. Would be helpful to have some comment of course
that we're setting a default req_rate because we want a
clk_set_rate_range() before clk_set_rate() to work properly when this
clk is initially an orphan. We should be able to code up a test case for
that too by registering an orphan and then registering the parent and
then calling clk_set_rate_range().
