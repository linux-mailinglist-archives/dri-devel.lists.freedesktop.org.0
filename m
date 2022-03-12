Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D84D6C30
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 04:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945E810E0D8;
	Sat, 12 Mar 2022 03:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEEE10E0D8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 03:08:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8146161180;
 Sat, 12 Mar 2022 03:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB69FC340E9;
 Sat, 12 Mar 2022 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647054522;
 bh=b8BccljxP6pjlkkeTT/uLJrHoMWJhjstlpN4rJId/hE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gA29R6PxdqXCY8jqoECYDZc73P2DQLd7rKVzNF0aFvqmi6XBG0Pu+qSqp5FmVsFND
 SwxtUh4ypiCJswMJ5TeR81GOfmX+IZ+1j94i3l58u3HqQukTU1jWo6V0xmN2LNeUnn
 nVZO+a0VyO6NSIl5uFMJuKHD7ctVgTInmnzbO4u1G2j/1dEVB7a2bPldWYaSV+qd/I
 ueFGdrNb+e6c2Ph/QLzbxAeB10xeSO8X5kw7Ctu1CMKG4kFqJf620E4hc5fiS+oPRZ
 poEpxMCKR44Xtm2skWo8EkD6WOatDaZidB0wiMcMskIX+TrspFTaM+anN4pr/bnyy/
 pr6EKLDM7Z6YA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
Subject: Re: [PATCH v7 00/12] clk: Improve clock range handling
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>
Date: Fri, 11 Mar 2022 19:08:39 -0800
User-Agent: alot/0.10
Message-Id: <20220312030842.DB69FC340E9@smtp.kernel.org>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-02-25 06:35:22)
> Hi,
>=20
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
>=20
> and here:
> https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
>=20
> While the initial proposal implemented a new API to temporarily raise and=
 lower
> clock rates based on consumer workloads, Stephen suggested an
> alternative approach implemented here.
>=20
> The main issue that needed to be addressed in our case was that in a
> situation where we would have multiple calls to clk_set_rate_range, we
> would end up with a clock at the maximum of the minimums being set. This
> would be expected, but the issue was that if one of the users was to
> relax or drop its requirements, the rate would be left unchanged, even
> though the ideal rate would have changed.
>=20
> So something like
>=20
> clk_set_rate(user1_clk, 1000);
> clk_set_min_rate(user1_clk, 2000);
> clk_set_min_rate(user2_clk, 3000);
> clk_set_min_rate(user2_clk, 1000);
>=20
> Would leave the clock running at 3000Hz, while the minimum would now be
> 2000Hz.
>=20
> This was mostly due to the fact that the core only triggers a rate
> change in clk_set_rate_range() if the current rate is outside of the
> boundaries, but not if it's within the new boundaries.
>=20
> That series changes that and will trigger a rate change on every call,
> with the former rate being tried again. This way, providers have a
> chance to follow whatever policy they see fit for a given clock each
> time the boundaries change.
>=20
> This series also implements some kunit tests, first to test a few rate
> related functions in the CCF, and then extends it to make sure that
> behaviour has some test coverage.
>=20
> Let me know what you think

Thanks. I'm going to apply this to clk-next but not the last two drm
patches. That is OK?
