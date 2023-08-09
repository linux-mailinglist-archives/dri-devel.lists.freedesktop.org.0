Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C6776364
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 17:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80B10E45D;
	Wed,  9 Aug 2023 15:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D144210E45C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 15:09:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6BFEF867EA;
 Wed,  9 Aug 2023 17:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1691593753;
 bh=c1oj8C9wOMOGdfDaeQFOTWTqQ0pdozX5Gv09kEzqDns=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0Kujr4MG+Ctvh68MMllLT29gSuG+F1+r2vHyxQC4iig0rbbk4LjevkwBB+kMTdY9V
 tFxYMQGN7GXiRbGAoDp9BCPOy2IMutluKDddB+yz2hxMGnhKI6NCBQm4l/LWm9q55O
 Y+H3IFgw21JuC3T6BYo/cslDZVi2AL5JS4lCMNx6HJ43MPkSf4hdbvam/nx5Q2mjTQ
 iJEeolhHNcPRo8i5f1INE2PGUZCZgn96SnSISdJ6PDfWZvYv9D1/F5agw3IvHMe1m9
 cEStGQvhRtkddeP3CJFSh6PIbydxJhzb9Rj8oEk2K966zMU4hR1c+DpDyP5uKJte0x
 cdgVV4nl+UXwA==
Message-ID: <8f567515-9125-c204-e6d0-9540167f06cf@denx.de>
Date: Wed, 9 Aug 2023 17:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org
References: <CGME20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2@eucas1p1.samsung.com>
 <20230809145641.3213210-1-m.szyprowski@samsung.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230809145641.3213210-1-m.szyprowski@samsung.com>
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

On 8/9/23 16:56, Marek Szyprowski wrote:
> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
> doesn't report empty level of packer header FIFO. In case of those SoCs,
> use the old way of waiting for empty command tranfsfer FIFO, removed
> recently by commit 14806c641582 ("Drain command transfer FIFO before
> transfer").
> 
> Fixes: 14806c641582 ("drm: bridge: samsung-dsim: Drain command transfer FIFO before transfer")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Oh, nice, there is already a bitfield piece in place.

Thanks !

Reviewed-by: Marek Vasut <marex@denx.de>
