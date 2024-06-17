Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102390BCAC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 23:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F5910E121;
	Mon, 17 Jun 2024 21:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="xi8ip5/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 633 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 21:11:07 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C4E10E121
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 21:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718658664;
 bh=MdDBTGJOD4DdU6inKQlvAasJgqrrJixgcL+TEIP3eQw=;
 b=xi8ip5/wncAx4idK+WnVDUW8b46RR4Rgp5OwBMaQP2a++QN5jRgTmQeHWO8X2uGOjBJmz1ElN
 fklM5jaF0JLkhtQp+ELccSHjQN+qbVU7L8R2r1ngcH6cbNS/SUuD7pv7J4Kdwnm3KcM+ESrBsCD
 vi18lcdM3ZuIvsJSjDDK4GhQ0UbA/JAdokFX9+PycG6CSR+ZRtUw0QgFLcNZ1rq+SFNcKR430/I
 zTdNdwH/KSEpkEoy/5jm3rCoQ4EzjCXG/2Bz3OEJHf6DpPUW3rj64DEtAprePtRqBld0I+5A4tD
 rueF8rNbEeXN4jfzzSWtayF6ia4zoKBIwV3yzrPxzp9g==
Message-ID: <6a2293ec-1506-4fe7-a3cf-fcfc594c19cc@kwiboo.se>
Date: Mon, 17 Jun 2024 22:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] clk: rockchip: Set parent rate for DCLK_VOP clock
 on RK3228
To: "=?UTF-8?Q?Heiko_St=C3=BCbner?=" <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yakir Yang
 <kuankuan.y@gmail.com>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240615170417.3134517-1-jonas@kwiboo.se>
 <20240615170417.3134517-3-jonas@kwiboo.se> <19757196.sIn9rWBj0N@diego>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <19757196.sIn9rWBj0N@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6670a183c06db152bdd50c23
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

Hi Heiko,

On 2024-06-17 22:30, Heiko Stübner wrote:
> Am Samstag, 15. Juni 2024, 19:03:53 CEST schrieb Jonas Karlman:
>> Similar to DCLK_LCDC on RK3328, the DCLK_VOP on RK3228 is typically
>> parented by the hdmiphy clk and it is expected that the DCLK_VOP and
>> hdmiphy clk rate are kept in sync.
>>
>> Use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags, same as used
>> on RK3328, to make full use of all possible supported display modes.
>>
>> Fixes: 0a9d4ac08ebc ("clk: rockchip: set the clock ids for RK3228 VOP")
>> Fixes: 307a2e9ac524 ("clk: rockchip: add clock controller for rk3228")
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> did your mailer have a hickup? Somehow I got patch2 (only this one)
> 2 times
> 

Strange, not something I know about, each patch 1-13 are listed as 250
Accepted (heiko@sntech.de) and patches arrived to the ML and patchwork:

https://lore.kernel.org/all/20240615170417.3134517-1-jonas@kwiboo.se/
https://patchwork.freedesktop.org/series/134926/
https://patchwork.kernel.org/cover/13699322/

Regards,
Jonas

