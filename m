Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F317729DE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 17:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80C10E1BA;
	Mon,  7 Aug 2023 15:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0801A10E1BA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 15:54:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 30F7680740;
 Mon,  7 Aug 2023 17:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1691423679;
 bh=7fEFWubiZcQelEBU9AkGaA2mZZmKhjzFsK+qpzkejAM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IauvfoX5NQ5rKJ4Y2sBpuvcQgM5AsvcXZv//D4EeEw8p6GLENG4R3wO42RcphfnAC
 u/t9UXc+ncW4f9aOa/nmenzXP2PpexHAuktTaABPDzE+jldAdEw6MqKb1d0AAjwxeX
 l6Q9GkC8kCBFBfGSNM8PA7zQ8rdbabF/SOYPVLAOz0cHmDxucXatiBDqx1zTQNc3la
 SI2VYD+lBe8mhC6RYkThglrz8XcT8fLoiLJt+4G+pMG0d72xYa4ZYKViK5PeokIwQ7
 BEIRzXcFu5IPRbdy4DLXAiZRRezGe5XE3OTElwGZKtHmwCxA45CaHjx9nx4rU1aIH9
 oNCU0z658naag==
Message-ID: <d06370f6-8237-07fd-0981-a71bc08ee67a@denx.de>
Date: Mon, 7 Aug 2023 16:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org
References: <CGME20230807130041eucas1p1bf8380490bcf76a34d2c09bfcbdb757b@eucas1p1.samsung.com>
 <20230807130033.1530241-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230807130033.1530241-1-m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/7/23 15:00, Marek Szyprowski wrote:

Hi,

> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index 05100e91ecb9..18017b3e5d9e 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
>   	const unsigned int *reg_values;
>   	u16 m_min;
>   	u16 m_max;
> +	unsigned int has_broken_fifoctrl_emptyhdr;

Do we want to do :1 here to allow more flags in the future ?

Like this:
unsigned int has_broken_fifoctrl_emptyhdr:1;
unsigned int another_flag:1;
...

I didn't realize this before, sorry.
