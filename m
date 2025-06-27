Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B18CAEB7B2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA91F10E9F8;
	Fri, 27 Jun 2025 12:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Iz5OfdKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4593D10E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:29:10 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id BE00824CE2;
 Fri, 27 Jun 2025 14:29:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-Vi0xHrL_L8; Fri, 27 Jun 2025 14:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751027342; bh=EtshUSUcNz/EcdgguxC9OOdXGB2IBgMhJVAOJyuE9yY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Iz5OfdKj6tJy1F91PBHFqCdCfHs+sxsFQcWGG3bBiYzpqR1aPcf7Lzxm6Ff+GuGXk
 1OXZThqT8gFO7exnrQIQVG84R/sQd5c+Hj/B+ceIWiFssn79jGI7jweBHA0FTFLs+7
 /pewIt+aa0AmzeDs6lnlC6PRlMp8auU3FBSOmbB3bpIQrEkMrJHRqPhHi1n49wNBTL
 J9RUeRH+h2LEbUd7ZMiRaa0AQyx9D6t/VT7w4GxW/8yBaC+eyGOyQ1SRlA7NF0a2N+
 G1rhJBnMJxswRIYj9mNn47hmhyNPC6+x2sk+3jRfy2EB+MRYfIAXU0QEO9ra53ZmPy
 8mPJdvLa2xdPA==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 12:29:01 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] drm/bridge: samsung-dsim: separate LINK and DPHY
 status registers
In-Reply-To: <CAAQKjZOHUGg8WEZxfhVxrUPS3O68BQJ6=cDnUSk6BomYjuY62Q@mail.gmail.com>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
 <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
 <CAAQKjZOHUGg8WEZxfhVxrUPS3O68BQJ6=cDnUSk6BomYjuY62Q@mail.gmail.com>
Message-ID: <922117777d718b77c86be3a43e86dd7f@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2025-06-27 10:07, Inki Dae wrote:
> 2025년 6월 27일 (금) 오전 4:42, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> Exynos7870's DSIM has separate registers for LINK and DPHY status. 
>> This
>> is in contrast to other devices in the driver which use a single
>> register for both.
>> 
>> Add their respective entries in the register list. Devices having a
>> single status register have been assigned the same offset for both
>> entries.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 
>> f2f666b27d2d5ec016d7a7f47c87fcdf1377d41a..7fd4c34cdc3170d363942f98feec048097da3c06 
>> 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -30,7 +30,7 @@
>>  /* returns true iff both arguments logically differs */
>>  #define NEQV(a, b) (!(a) ^ !(b))
>> 
>> -/* DSIM_STATUS */
>> +/* DSIM_DPHY_STATUS */
>>  #define DSIM_STOP_STATE_DAT(x)         (((x) & 0xf) << 0)
>>  #define DSIM_STOP_STATE_CLK            BIT(8)
>>  #define DSIM_TX_READY_HS_CLK           BIT(10)
>> @@ -239,7 +239,8 @@ enum samsung_dsim_transfer_type {
>>  };
>> 
>>  enum reg_idx {
>> -       DSIM_STATUS_REG,        /* Status register */
> 
> According to the datasheets I have, both Exynos5422 and Exynos7420 use
> DSIM_STATUS, while Exynos8890 splits this into DSIM_LINK_STATUS and
> DSIM_PHY_STATUS. It appears that Exynos7870 follows the same approach
> as Exynos8890.
> 
> The current modification removes the legacy DSIM_STATUS_REG and adds
> new DSIM_LINK_STATUS_REG and DSIM_DPHY_STATUS_REG. However, this
> change causes the register names used for older SoC versions to differ
> from those in the datasheets, so I think it is better to keep the
> legacy name for backward compatibility.
> 
> How about modifying it as follows?
> enum reg_idx {
>     DSIM_STATUS_REG,          /* Status register (legacy) */
>     DSIM_LINK_STATUS_REG,     /* Link status register (Exynos7870, ...) 
> */
>     DSIM_PHY_STATUS_REG,      /* PHY status register (Exynos7870, ...) 
> */
>     ...
> };
> 
> static const unsigned int exynos7870_reg_ofs[] = {
>     [DSIM_STATUS_REG] = 0x00,        /* Legacy compatibility - use
> LINK_STATUS */
>     [DSIM_LINK_STATUS_REG] = 0x04,   /* Link status register */
>     [DSIM_PHY_STATUS_REG] = 0x08,    /* PHY status register */
>     ...
> };
> 
> Additionally, by configuring the hw_type field in the
> samsung_dsim_plat_data structure like you did with the patch[1], you
> can use the appropriate register name for each SoC as shown below:
> if (dsi->plat_data->hw_type == DSIM_TYPE_EXYNOS7870)

I've instead added a flag to the driver data indicating the
availability of legacy status register. In my opinion, this
approach quickly turns cumbersome as the number of variants
increase.

Thanks for the suggestion.

>     reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
> else
>     reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
> 
> 
> [1] [PATCH v2 12/13] drm/bridge: samsung-dsim: add driver support for
> exynos7870 DSIM bridge
> 
> Thanks,
> Inki Dae
