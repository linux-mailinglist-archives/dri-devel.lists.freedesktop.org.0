Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E2C671F3C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 15:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3805510E197;
	Wed, 18 Jan 2023 14:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Wed, 18 Jan 2023 14:17:00 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FF110E197
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 14:17:00 +0000 (UTC)
Message-ID: <f4ba9333-144a-c2c4-108f-71b2b4c9acd1@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1674051057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilB7OTwIAX8N3WvG1TvNqQJkH9aWvuim71G4PHOXXrA=;
 b=EFBGsmmR6q243VF+wlXauMTBGMsILKrq7geT1pnQEieX6a0gPpkr1d/lb9KS1iBmF/0cma
 ycwKYXxM/GopSfdsCIZd/x8x0smN8dVjMZqY4NdDGM3IZk7m1jmejxR5DexcMRplskxRks
 Ib4/46hsfwNuaXnrbA653grzgIHwHiuCbq8Mcdq8C2/svExWyhpY31ADGDH7Rzpk7FwWOh
 d6UlufudOoNDQikO5V7emwxrKDc6cLmTx7PgplfBWqj+6gI5pQQ58gtmzdHSrIQnugEjmQ
 tR0Q5wKQcK/ZOMmzLuGBbcbMOttOtC/NNa93WNuthUgxO8v/rAhtnSEuUygJ2A==
Date: Wed, 18 Jan 2023 15:10:56 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] drm/rockchip: dw_hdmi: Add 4k@30 support
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20230118132213.2911418-1-s.hauer@pengutronix.de>
Content-Language: en-US
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <20230118132213.2911418-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=strit@manjaro.org smtp.mailfrom=strit@manjaro.org
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
Cc: linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, kernel@pengutronix.de,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested the whole series on my Rock 3A, with my 1440p monitor. Works wonders!

Thank you.

Tested-by: Dan Johansen <strit@manjaro.org>

Den 18.01.2023 kl. 14.22 skrev Sascha Hauer:
> It's been some time since I last sent this series. This version fixes
> a regression Dan Johansen reported. The reason turned out to be simple,
> I used the YUV420 register values instead of the RGB ones.
>
> I realized that we cannot achieve several modes offered by my monitor
> as these require pixelclocks that are slightly below the standard
> pixelclocks. As these are lower than the standard clock rates the PLL
> driver offers the clk driver falls back to a way lower frequency
> which results in something the monitor can't display, so this series
> now contains a patch to discard these unachievable modes.
>
> Sascha
>
> Changes since v2:
> - Use correct register values for mpll_cfg
> - Add patch to discard modes we cannot achieve
>
> Changes since v1:
> - Allow non standard clock rates only on Synopsys phy as suggested by
>    Robin Murphy
>
> Sascha Hauer (3):
>    drm/rockchip: dw_hdmi: relax mode_valid hook
>    drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>    drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
>
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 40 ++++++++++++++++-----
>   1 file changed, 32 insertions(+), 8 deletions(-)
>
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>
