Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86327447B6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 09:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0AA10E073;
	Sat,  1 Jul 2023 07:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jun 2023 18:24:14 UTC
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C9B10E18C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 18:24:13 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id BEEDA120005;
 Fri, 30 Jun 2023 21:15:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BEEDA120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1688148916;
 bh=+iLch2qAvGn4pfUehxJdtn4vtmFO4jTPo40JbMcUAX8=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=WxEg/2kvwPreQTg+r2N3XEH3y3Kk07do/xoH4StKlU9Oa5VXbIIkYQ73UKVdxkN3c
 VwhvBg30btoWcumWDTIu4GceBRikwuxcgG//JVMcSlrXC4kJxDHdYI68czOHSn3tx6
 TeYHzUa759gNbHKlwHSb+pVhlbharcYmuXlq2ud0f1qsyYd8CSDq2tqNNdPc2VUcVv
 7uOuQX9kwB+w1Y9LnnPC7hUsSbFWEzQBaa8FKMMRTxAH8xbjl0YluALyhm1MrrUUhk
 rjdY9P/sk7C58OWnxg1l5OnY+CYl3cHVhBkpKmtz1aIom/Egz8rO3Tu637l3CPmOPj
 Hzvfnvyy5AdUw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 30 Jun 2023 21:15:15 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 30 Jun 2023 21:15:01 +0300
Message-ID: <c487ed03-0ab2-74fb-91bc-4a773bfdfc5b@sberdevices.ru>
Date: Fri, 30 Jun 2023 21:10:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jagan Teki
 <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178380 [Jun 30 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517
 b0056c19d8e10afbb16cb7aad7258dedb0179a79,
 {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/06/30 14:57:00 #21607376
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Sat, 01 Jul 2023 07:31:46 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Neil

On 6/30/23 19:29, Neil Armstrong wrote:
> Disable the px_clk when setting the rate to recover a fully
> configured and correctly reset VCLK clock tree after the rate
> is set.
>
> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 57447abf1a29..dc63d2d813a9 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -94,6 +94,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		return ret;
>   	}
>   
> +	clk_disable_unprepare(mipi_dsi->px_clk);
>   	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
>   
>   	if (ret) {
> @@ -102,6 +103,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		return ret;
>   	}
>   
> +	clk_prepare_enable(mipi_dsi->px_clk);
probably should be:
ret = clk_prepare_enable(mipi_dsi->px_clk);
> +	if (ret) {
> +		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
> +		return ret;
> +	}
> +
>   	switch (mipi_dsi->dsi_device->format) {
>   	case MIPI_DSI_FMT_RGB888:
>   		dpi_data_format = DPI_COLOR_24BIT;
>
-- 
Best regards
George

