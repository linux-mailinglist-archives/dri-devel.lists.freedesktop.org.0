Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94FF9A99C0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 08:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F8110E5E3;
	Tue, 22 Oct 2024 06:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Y/Cvb57v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628AD10E077
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 06:26:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49M6PXOI039918;
 Tue, 22 Oct 2024 01:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1729578333;
 bh=LqOPiRoB5yDfn3lWhu3EbcoRAt1pousPdUgqN9fXJws=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Y/Cvb57vkiI/RH7vVlrFENv0jejrgCwGNYrpz4i/Ac2ZuxCf+wFmYO6Ew1GQVjeju
 DNQMpsyWgXVgMoQ518DkWjQ/DyXr6dSgXReLexAuy7i/gutfTqc5oVt5vuUYQm+ICc
 c9zA1JT/IfIl/xi5QSoB+4j82y9iSS++94fU6Y00=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49M6PXix099300
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Oct 2024 01:25:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Oct 2024 01:25:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Oct 2024 01:25:32 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49M6PQYD024889;
 Tue, 22 Oct 2024 01:25:27 -0500
Message-ID: <c0784c5e-fc71-64c5-e09f-63e1abd1b61d@ti.com>
Date: Tue, 22 Oct 2024 11:55:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 07/13] drm/bridge: cdns-dsi: Wait for Clk and Data
 Lanes to be ready
Content-Language: en-US
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary
 <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019195411.266860-8-aradhya.bhatia@linux.dev>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20241019195411.266860-8-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Aradhya,

Thanks for the patch.

On 20/10/24 01:24, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>

[...]

> +	/*
> +	 * Now that the DSI Link and DSI Phy are initialized,
> +	 * wait for the CLK and Data Lanes to be ready.
> +	 */
> +	tmp = CLK_LANE_RDY;
> +	for (int i = 0; i < nlanes; i++)
> +		tmp |= DATA_LANE_RDY(i);
> +
> +	if (readl_poll_timeout(dsi->regs + MCTL_MAIN_STS, status,
> +			       status & tmp, 100, 500000))

The above would mark the condition as true even if one data lane gets ready. I
think we need to poll until all data lanes are marked as ready. Also good to
give a warning in case we time out.

IMHO below should fix this:
        WARN_ON_ONCE(readl_poll_timeout(dsi->regs + MCTL_MAIN_STS, status,
                                       (tmp == (status & tmp)), 100, 0));

Regards
Devarsh
