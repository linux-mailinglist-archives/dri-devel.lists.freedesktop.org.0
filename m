Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FE4A7481
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE610E1C5;
	Wed,  2 Feb 2022 15:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBCD10E1C5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:22:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A6CF6159F;
 Wed,  2 Feb 2022 15:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113DDC004E1;
 Wed,  2 Feb 2022 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815325;
 bh=OTLXgwve+GXUKqJgusIix6IvLJEmARJe1ZPe1Wk9IxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UxdeogQjte72mAnF7hRypZPI8xAbel7BrvRvPRlt1nfnufzyW07t/bWcHBqQ+cWPm
 Gfc7wtq1yWuM2Uxpn/bNERIJOeOvPeaoI++xw+q2x8VrjZqBmySMQSBjFDba9IJcW6
 +cwWNGtZFw79R6zllZHcbqxZrAX74luFmU3CzYCl7aa1qHcw4b+lbh8fH1pEj+uRAU
 UT0vNpdnpUacazhAij3sM8PDYaMhN6cYmFT54tdjOiJqYFz5AdKJ3TUpuMoCMpyKBE
 UBR1KsMFehen3PYeGvOFkAHjM8IfDBW3goWi6ZgbHxbfzVlmxlK6r/uhtmXJ5WFkHG
 QBJj61DDUrK7w==
Date: Wed, 2 Feb 2022 20:52:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4] phy: dphy: Correct clk_pre parameter
Message-ID: <YfqhmSEL8Jym8FhA@matsya>
References: <20220124024007.1465018-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124024007.1465018-1-victor.liu@nxp.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Wyon Bi <bivvy.bi@rock-chips.com>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-01-22, 10:40, Liu Ying wrote:
> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> mentions that it should be in UI.  However, the dphy core driver wrongly
> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> 
> So, let's fix the dphy core driver to correctly reflect the T-CLK-PRE
> parameter's minimum value according to the D-PHY specification.
> 
> I'm assuming that all impacted custom drivers shall program values in
> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
> specification mentions that the frequency of TxByteClkHS is exactly 1/8
> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
> custom driver code is changed to program those values as
> DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
> 
> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
> as I don't have the hardwares.

Applied, thanks

-- 
~Vinod
