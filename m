Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4567D0C8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 17:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D026B10E2A6;
	Thu, 26 Jan 2023 16:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592B210E2A6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:01:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2228385559;
 Thu, 26 Jan 2023 17:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674748877;
 bh=vf8B8hq49foMyRmHsJLvgiJicbOc4TFu8+a0WjKW9+k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SXMxO4bepnOScYKVYybXB5EdebSv6bgNOCFfz7i5EIDMIkeTg0FGTZCN6BGl4oRYY
 KPiOc8ex0UeY+A3Hztp+pO50hKgwIAnEw+izzIIR25v/AmUbUbLjbKzXxd40T5wtv8
 99MfyD9mZioRXQk2MqBccbOFQvV7PtVTWbeXaaES3M23x7mQZfSty7HrCLEuGN3ALG
 29djjPOLuTIhUd2O+UyGkFt7JfV1/V8J1udOrItFsRM4jQ/RDo0PUky0A4ULh2j4Q1
 8pjh2ByRP9xHaOWXmmvaaAMZNkB+Ez6orwlH1zcbOdwE7LEnuOMBFsXe3XDYcRVQwI
 U0VYci+Nkw/WA==
Message-ID: <d4267645-448c-f702-fcc3-6c534d9ec2b7@denx.de>
Date: Thu, 26 Jan 2023 16:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v12 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <20230126144427.607098-12-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230126144427.607098-12-jagan@amarulasolutions.com>
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

On 1/26/23 15:44, Jagan Teki wrote:
> Finding the right input bus format throughout the pipeline is hard
> so add atomic_get_input_bus_fmts callback and initialize with the
> proper input format from list of supported output formats.
> 
> This format can be used in pipeline for negotiating bus format between
> the DSI-end of this bridge and the other component closer to pipeline
> components.
> 
> List of Pixel formats are taken from,
> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
