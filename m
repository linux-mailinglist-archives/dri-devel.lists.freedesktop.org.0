Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600346A455F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5367C10E41E;
	Mon, 27 Feb 2023 14:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FC10E41E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 14:58:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F324085A6E;
 Mon, 27 Feb 2023 15:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1677509917;
 bh=wZLI7hdr6HH44lVzor9TtB9EkjL2wZLffCqbHuZS5Ms=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fBRKCfgpE14QjQHA0aq2n+LegWmTd9ZIoT+U7Hfhaqiivjm8DXBWEsEq8TnS7xE7G
 zJQtX84RustiDGhGLc+iZ8h53XoozEDvmKhAHmHg9iRQ6FdWg0BGW81krmWWAXm7tE
 +7GgrtBQNiGrs2zlY7Fonz4gWj6Nlqh9Dh9P2bGHyJHpCSlyTzWReyXkfecMhCpIDZ
 k4Xyu22bql/DU39IqK5KD82Dca+2Cp481SAZTaOHSKBZnXgLK/LlqEbAQjgJBzYWLS
 uUSwLRJBq82x+pksJ9ma3Gl3Gv0bpdWyNdxdc1cAoS91Wmi9eShlAod04H9ZDRSFDu
 ZBxBTUhg5r65Q==
Message-ID: <3ba8caf1-9f6f-f3e6-28e8-1d6764911cde@denx.de>
Date: Mon, 27 Feb 2023 15:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 12/18] drm: exynos: dsi: Consolidate component and
 bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-13-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230227113925.875425-13-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 12:39, Jagan Teki wrote:

[...]

> @@ -1733,11 +1728,67 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>   	return 0;
>   }
>   
> +static int _exynos_dsi_host_attach(struct exynos_dsi *dsim,

I didn't notice it before, but please get rid of those leading 
underscores in function names, they shouldn't be necessary.

> +				   struct mipi_dsi_device *device)
> +{
> +	struct exynos_dsi_enc *dsi_enc = dsim->priv;

[...]
