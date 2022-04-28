Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D36513F1D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 01:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5225410E1D0;
	Thu, 28 Apr 2022 23:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274D88DF8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 23:38:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 13AF083A70;
 Fri, 29 Apr 2022 01:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651189098;
 bh=JdSoKxbDavhx6j+X6ey+bb83GHTOGfQNsmvSVtTb2m4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qW0s5883BhCn4/VFti/qV4pCtXRsNyHsf2qZnufkSlRGzUSMRdDK4r92kaXHgyHx8
 6tNv0/9TiomcUzYqWS33FEpLECNjqx2AL8K9pqo2UVVYBE3XGCD6PRPcDhOBl/RO7w
 9NsL+2QphWJb3S5IM7pXq5iEMNH+Ilz7DZCGqGYz8Vh2hMlZwq6gpUtP2VphW+ZBro
 UfHVryXCLUcQx6yrDhMxqV65/uLMYPBLp7WJvgPk9bo8sBd7F8btgSgUnAdnifMkiL
 xAfapkRExH4NfFSWJ73pyF5uzNshuurLxzWa3RpkRoxCbCNKHvjQfO2PjkOrvrwN7s
 2Vvon5sjGoHJQ==
Message-ID: <ca4b0aa6-0be6-0f7b-261b-6f9a51ed63db@denx.de>
Date: Fri, 29 Apr 2022 01:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] drm/bridge: tc358767: Fix (e)DP bridge endpoint
 parsing in dedicated function
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220428213132.447890-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220428213132.447890-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/22 23:31, Marek Vasut wrote:
> Per toshiba,tc358767.yaml DT binding document, port@2 the output (e)DP
> port is optional. In case this port is not described in DT, the bridge
> driver operates in DPI-to-DP mode. The drm_of_find_panel_or_bridge()
> call in tc_probe_edp_bridge_endpoint() returns -ENODEV in case port@2
> is not present in DT and this specific return value is incorrectly
> propagated outside of tc_probe_edp_bridge_endpoint() function. All
> other error values must be propagated and are propagated correctly.
> 
> Return 0 in case the port@2 is missing instead, that reinstates the
> original behavior before the commit this patch fixes.
> 
> Fixes: 8478095a8c4b ("drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into dedicated function")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

This is a V1, sigh ... the fix stands however.
