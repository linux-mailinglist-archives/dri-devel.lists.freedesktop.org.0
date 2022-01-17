Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DF490072
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 04:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E520B10E580;
	Mon, 17 Jan 2022 03:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB0410E579
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 03:02:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E9B3681430;
 Mon, 17 Jan 2022 04:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642388543;
 bh=nwEUFuNyu9PNmHsCkjKXQRZ4FND9Q4pJgxVKB4hSk38=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TzXmpBg0i8MduMaQ6YiSoJpaPFvco/FN/iOVDTzS1o6FDrhNbtkAdUH5oeQDb6ck2
 HC2kjG36xm9ktR1Qoyl0kIyWz1/4y5KsYeIRr4XXc2zJbMUed72mgXs3iUtf7Sksj0
 XrsFka7EDhStGjRybcvIuveJwC5TdFcBuI0fNSD/HegtJK4b4MRXY8i4cOLc/OyGtM
 C7+9sM384hpmH2Ah0VwPqVNFqkm9XaoeAeHnczmDD7WPlwAOQTd68pol0j+rsbwn6R
 +RmlY3cmJgD9yZOVe8j0i1Qcriftj9DEbDp09L2/XAgXc8m1ZuGHdy67IyoGONQJE7
 N4AbdoYZSB/WA==
Message-ID: <6a05a1eb-3aa6-fe08-7520-e670e7378eed@denx.de>
Date: Mon, 17 Jan 2022 04:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 4/4] drm/bridge: tc358767: Add DSI-to-DPI mode support
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-4-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20211127032405.283435-4-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/27/21 04:24, Marek Vasut wrote:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Add support for the
> DSI-to-DPI mode.
> 
> This requires skipping most of the (e)DP initialization code, which is
> currently a large part of this driver, hence it is better to have far
> simpler separate tc_dpi_bridge_funcs and their implementation.
> 
> The configuration of DPI output is also much simpler. The configuration
> of the DSI input is rather similar to the other TC bridge chips.
> 
> The Pixel PLL in DPI output mode does not have the 65..150 MHz limitation
> imposed on the (e)DP output mode, so this limitation is skipped to permit
> operating panels with far slower pixel clock, even below 9 MHz. This mode
> of operation of the PLL is valid and tested.
> 
> The detection of bridge mode is now added into tc_probe_bridge_mode(),
> where in case a DPI panel is found on port@1 endpoint@1, the mode is
> assumed to be DSI-to-DPI. If (e)DP is detected on port@2, the mode is
> assumed to be DPI-to-(e)DP.
> 
> The DSI-to-(e)DP mode is not supported due to lack of proper hardware,
> but this would be some sort of mix between the two aforementioned modes.

[...]

Would it be possible to get some feedback on this patchset ?
