Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11506A4563
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB9510E41F;
	Mon, 27 Feb 2023 14:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE4610E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 14:58:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DF06D85A40;
 Mon, 27 Feb 2023 15:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1677509918;
 bh=mvFSq9+jjVmrvZ3Yg9EJUZvkm39XrqTZ+BE7p/Z0LiM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eG4N+4PDrbxZzW21glOoRjfYDlEcfZ96H6qYD6Wl2PZCadVBDaQeXpJeiBhJhFFSl
 ycGlSZpqgKQBsSEohmd6OePDe17IO645+fX518bQBLX12DOZ70+2VfSc4nCDACLJJ8
 idYRhU7/KBWnX7WBKFLEx1wARyHiFzA0bgTiXY9U5dn/rsXV6739XRI3rtnuD/tX9r
 JT1CQmjOAO3MOMb1bth//RpN6+8Ow1duPgbAbIVAwBJsuIFdZkHqA6jAS/I4OH062p
 5H6SUXcvX9/KJ8BJqpMR9B4+rEFc64ka5EwkUTz4xmPWyjzmZtigL79QYv9CHEMDj8
 2ZZ/wz8mk6U7w==
Message-ID: <c819b9a2-d7db-b89f-ea59-bd70ec2bea2c@denx.de>
Date: Mon, 27 Feb 2023 15:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 13/18] drm: exynos: dsi: Add host helper for
 te_irq_handler
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
 <20230227113925.875425-14-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230227113925.875425-14-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
> IRQ handler for te-gpio seems to be common across DSIM host.
> 
> However, Exynos is handling this via CRTC drivers but there is no clear
> evidence on how the same has been handled in i.MX8MM. Keeping the handler
> as-it-is can be a viable option but adding DSIM bridge core in upcoming
> patches is not possible to call Exynos CRTC handler as DSIM bridge has
> to be common across DRM bridge core instead of platform specific DRM
> drivers like Exynos here.
> 
> So, this patch handles the handler via platform host helper, so-that
> handling platform specific hook across Exynos and generic can be
> reasonable till it makes it generic across all platforms.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
