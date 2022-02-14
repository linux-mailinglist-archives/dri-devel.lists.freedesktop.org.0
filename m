Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1B4B467F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89B10E2B8;
	Mon, 14 Feb 2022 09:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2E210E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:46:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4849347F;
 Mon, 14 Feb 2022 10:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644831963;
 bh=8+kyEa+cdzy/DxEjkMvf9Hc7x6VolC3E/4NhE6SQ798=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTzVRlwuVgrrAS4Rb/YYXcIyYwzneqv6IkqYbR46JQkPrZ9VtppEMvpo4ELwMwTtf
 OEWDXmxhQc1iSMl9a41Gz2u56lbJa7MJbQY0fKyu04kdjQ2mycKKhI1Jl7PR5yaUgh
 FGnnLz60Yjg7hhnjBZs0OZJXdMNfggCBMr8oFMaQ=
Date: Mon, 14 Feb 2022 11:45:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 0/10] clk: Improve clock range handling
Message-ID: <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
References: <20220125141549.747889-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220125141549.747889-1-maxime@cerno.tech>
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
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime and Stephen,

We have recently posted a driver for the BCM2711 Unicam CSI-2 receiver
(see [1]) which is a perfect candidate for this API, as it needs a
minimum rate for the VPU clock. Any chance we can get this series merged
? :-)

[1] https://lore.kernel.org/linux-media/20220208155027.891055-1-jeanmichel.hautbois@ideasonboard.com

On Tue, Jan 25, 2022 at 03:15:39PM +0100, Maxime Ripard wrote:
> Hi,
> 
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
> 
> and here:
> https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
> 
> While the initial proposal implemented a new API to temporarily raise and lower
> clock rates based on consumer workloads, Stephen suggested an
> alternative approach implemented here.
> 
> The main issue that needed to be addressed in our case was that in a
> situation where we would have multiple calls to clk_set_rate_range, we
> would end up with a clock at the maximum of the minimums being set. This
> would be expected, but the issue was that if one of the users was to
> relax or drop its requirements, the rate would be left unchanged, even
> though the ideal rate would have changed.
> 
> So something like
> 
> clk_set_rate(user1_clk, 1000);
> clk_set_min_rate(user1_clk, 2000);
> clk_set_min_rate(user2_clk, 3000);
> clk_set_min_rate(user2_clk, 1000);
> 
> Would leave the clock running at 3000Hz, while the minimum would now be
> 2000Hz.
> 
> This was mostly due to the fact that the core only triggers a rate
> change in clk_set_rate_range() if the current rate is outside of the
> boundaries, but not if it's within the new boundaries.
> 
> That series changes that and will trigger a rate change on every call,
> with the former rate being tried again. This way, providers have a
> chance to follow whatever policy they see fit for a given clock each
> time the boundaries change.
> 
> This series also implements some kunit tests, first to test a few rate
> related functions in the CCF, and then extends it to make sure that
> behaviour has some test coverage.
> 
> Let me know what you think
> Maxime
> 
> Changes from v3:
>   - Renamed the test file and Kconfig option
>   - Add option to .kunitconfig
>   - Switch to kunit_kzalloc
>   - Use KUNIT_EXPECT_* instead of KUNIT_ASSERT_* where relevant
>   - Test directly relevant calls instead of going through a temporary variable
>   - Switch to more precise KUNIT_ASSERT_* macros where relevant
> 
> Changes from v2:
>   - Rebased on current next
>   - Rewrote the whole thing according to Stephen reviews
>   - Implemented some kunit tests
> 
> Changes from v1:
>   - Return NULL in clk_request_start if clk pointer is NULL
>   - Test for clk_req pointer in clk_request_done
>   - Add another user in vc4
>   - Rebased on top of v5.15-rc1
> 
> Maxime Ripard (10):
>   clk: Introduce Kunit Tests for the framework
>   clk: Always clamp the rounded rate
>   clk: Use clamp instead of open-coding our own
>   clk: Always set the rate on clk_set_range_rate
>   clk: Add clk_drop_range
>   clk: bcm: rpi: Add variant structure
>   clk: bcm: rpi: Set a default minimum rate
>   clk: bcm: rpi: Run some clocks at the minimum rate allowed
>   drm/vc4: Add logging and comments
>   drm/vc4: hdmi: Remove clock rate initialization
> 
>  drivers/clk/.kunitconfig          |   1 +
>  drivers/clk/Kconfig               |   7 +
>  drivers/clk/Makefile              |   1 +
>  drivers/clk/bcm/clk-raspberrypi.c | 125 +++++-
>  drivers/clk/clk-test.c            | 621 ++++++++++++++++++++++++++++++
>  drivers/clk/clk.c                 |  51 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 -
>  drivers/gpu/drm/vc4/vc4_kms.c     |  11 +
>  include/linux/clk.h               |  11 +
>  9 files changed, 786 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/clk/clk-test.c

-- 
Regards,

Laurent Pinchart
