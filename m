Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D73F90BC7B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E6D10E4F1;
	Mon, 17 Jun 2024 20:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="gDQRIre0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8391C10E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:57:00 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1718657818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0b1pWrdGahjc5mnO1xKSRT8jsHp5loCfKfaw5bWIjA=;
 b=gDQRIre07RFJ9Xp9kBuZUFFbeI0LYbWhqlDGqneNFGAMGrNN4LGcvP+moA3SbkdvSl3HUX
 /MRz/oSChHsfy2VaLmaHZznZUN5ferXomuvLZDHJH7oZmisflT++kGT0MC64wGLrvHbKay
 TFOV8EKkjRjFBy0ULt3zQKAZN9IEEfjUaadRyqOaaiBTGOx8e61E5dg+fvc7k5VmLBD+1d
 CeR5cqgdnW69NqJlFoEbdO+ymYc5yUWjcy66G8GNzFU2nygQtWb73o2sbSbyVqKPcz6qzO
 nejY76uk20AGlEpI7pJndPsTpFf4MsMyJjQgeAJ9n+N5f3MlDQphjmIDuIRg0w==
Date: Mon, 17 Jun 2024 22:56:57 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yakir Yang
 <kuankuan.y@gmail.com>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/13] clk: rockchip: Set parent rate for DCLK_VOP clock
 on RK3228
In-Reply-To: <6a2293ec-1506-4fe7-a3cf-fcfc594c19cc@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
 <20240615170417.3134517-3-jonas@kwiboo.se> <19757196.sIn9rWBj0N@diego>
 <6a2293ec-1506-4fe7-a3cf-fcfc594c19cc@kwiboo.se>
Message-ID: <32481efc439b66da6d109e1484255aaf@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

On 2024-06-17 22:50, Jonas Karlman wrote:
> On 2024-06-17 22:30, Heiko Stübner wrote:
>> Am Samstag, 15. Juni 2024, 19:03:53 CEST schrieb Jonas Karlman:
>>> Similar to DCLK_LCDC on RK3328, the DCLK_VOP on RK3228 is typically
>>> parented by the hdmiphy clk and it is expected that the DCLK_VOP and
>>> hdmiphy clk rate are kept in sync.
>>> 
>>> Use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags, same as 
>>> used
>>> on RK3328, to make full use of all possible supported display modes.
>>> 
>>> Fixes: 0a9d4ac08ebc ("clk: rockchip: set the clock ids for RK3228 
>>> VOP")
>>> Fixes: 307a2e9ac524 ("clk: rockchip: add clock controller for 
>>> rk3228")
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> 
>> did your mailer have a hickup? Somehow I got patch2 (only this one)
>> 2 times
> 
> Strange, not something I know about, each patch 1-13 are listed as 250
> Accepted (heiko@sntech.de) and patches arrived to the ML and patchwork:
> 
> https://lore.kernel.org/all/20240615170417.3134517-1-jonas@kwiboo.se/
> https://patchwork.freedesktop.org/series/134926/
> https://patchwork.kernel.org/cover/13699322/

It might be that something is wrong with the MX host for sntech.de, I 
got
one email rejected today with "invalid certificate" (or something like 
that)
as the error message.
