Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D16E3C93
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA32810E2FB;
	Sun, 16 Apr 2023 22:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F710E2FB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 22:12:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D5CF085C9B;
 Mon, 17 Apr 2023 00:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681683151;
 bh=njiQMSpa55Md/h+IwVavrbsHo/BMerUnaJPe8xEMR9Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gha/hyJvKgc5H7SCdoyie6kvnyfwTn1IGp0hMnPAXUskY1UWWBC1+e7EHHVgtP4yY
 IhCvcUykT2iJbzXXE251hDynxzuHJEJAS+82oYX+xhanXjQnbkzvI6opz/4HjnEaAr
 qfYuQ4ysdPfBgp6iAOQeL2iA7QvG0aeehH7ApmfnhAoxiF3DFzechHrHmuFQdC9h+l
 fPDFloU0N1PvKGnj2PlNPfaLPiGPh/Bkfkr/RxLQll2SF+l3lAKFfSWdQgg/qPhae4
 YidyO8lns6MYKCZKEeZfD/QJ/ZjJrmUQRQZcbyGwBB5GOtwpHF3qkl2zk05heoUMFr
 tVeMbhUHiyCCg==
Message-ID: <5b6d4cfd-dedb-3123-9db4-28e202da11b2@denx.de>
Date: Mon, 17 Apr 2023 00:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/6] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-4-aford173@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230415104104.5537-4-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/23 12:41, Adam Ford wrote:
> NXP uses a lookup table to determine the various values for
> the PHY Timing based on the clock rate in their downstream
> kernel.  Since the input clock can be variable, the phy
> settings need to be variable too.  Add an additional variable
> to the driver data to enable this feature to prevent breaking
> boards that don't support it.

Isn't there already a generic LP2HS transition time calculation in the 
kernel ?

This looks like a generic calculation which should be done by all the 
DSI hosts, so why not introduce a generic helper to do such a 
calculation (and not a table please) ?
