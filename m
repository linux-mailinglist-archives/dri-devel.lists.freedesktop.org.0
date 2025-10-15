Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED5BDDE6E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46B010E76B;
	Wed, 15 Oct 2025 10:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P8jstF9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9E110E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760522588;
 bh=vIUSMXrHYo6IVAXXMlf2z2QqzqoJqcv9TqtH8rYDitE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P8jstF9EFj1pRwbRbKvsomEZszhzzmqa/emjO22fMo3rkEfP5JsJ5N1N4ZpP/NswI
 D17peeUodI2Qo1oJinpW1/CbABku69oUBKLoSXrnZBuiwxQ3OOvmM43QD8/UbUNVE9
 r5/C1Fbytwz4q2HA5fTewQdJW0bvRyHP6kjpElWDxJiDCaUQdf7291XkG1n8rFAomC
 bkX/PltyOWoolKBd9X2MSes74NZWXhZHwoiXVCb3HCZElbLxtyY2Xx968D9F9Z0NRP
 99RxlnNhhstChFTilT1r8aC/xw0JRWM2s8Lh81FJgNnZJftCM3AXfhO/rZt2taTSQF
 bftZTKi8vPQCw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 93E8E17E00A3;
 Wed, 15 Oct 2025 12:03:07 +0200 (CEST)
Message-ID: <7291eff3-b259-4209-b150-cb220abc01ec@collabora.com>
Date: Wed, 15 Oct 2025 13:03:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/14/25 7:00 PM, Sebastian Reichel wrote:
> After resume from suspend to RAM, the following splash is generated if
> the HDMI driver is probed (independent of a connected cable):
> 
> [ 1194.484052] irq 80: nobody cared (try booting with the "irqpoll" option)
> [ 1194.484074] CPU: 0 UID: 0 PID: 627 Comm: rtcwake Not tainted 6.17.0-rc7-g96f1a11414b3 #1 PREEMPT
> [ 1194.484082] Hardware name: Rockchip RK3576 EVB V10 Board (DT)
> [ 1194.484085] Call trace:
> [ 1194.484087]  ... (stripped)
> [ 1194.484283] handlers:
> [ 1194.484285] [<00000000bc363dcb>] dw_hdmi_qp_main_hardirq [dw_hdmi_qp]
> [ 1194.484302] Disabling IRQ #80
> 
> Apparently the HDMI IP is losing part of its state while the system
> is suspended and generates spurious interrupts during resume. The
> bug has not yet been noticed, as system suspend does not yet work
> properly on upstream kernel with either the Rockchip RK3588 or RK3576
> platform.
> 
> Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

LGTM, hence

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
