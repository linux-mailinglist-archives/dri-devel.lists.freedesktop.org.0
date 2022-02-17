Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DAC4BC756
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3344410F68A;
	Sat, 19 Feb 2022 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9B10E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 13:20:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 314181F45C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645104021;
 bh=frvkPvpz6EtNe12MCXtRLAiBcdyezvJMEVigFM8+kGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RGsVsI/lQpoUKPA6V3Twhpxur+3Y+o6SyrYEKhCHhJnVUkGSdRrTbzhckA6Z8vruL
 ZFCkGZ7FZ3XA2nHIdLJ+811J/y2ivyUjsdG8WaVsdZMh4ZCVViUbinVp7sQmWQFiDy
 3t9IGpwnR2aDxLUD7Yx45IdCTohzsP/YfefaFo6ENeMRJQ96FaIbQ0jV/JBsvxQwfD
 gzJJJED0QxI7RA3ui1ytubcIxPQ1iZuWyqMKve9fg7CTJ6TzBvBC5hlCQhxpuobfei
 Gyv3aKQIsS5Yv1FuVr9MU3UZUHh/jG1zOfB/kS5Zkw+0IshM7cq00jpEX+7ptY8sdz
 QAdJg4pLtwH1w==
Message-ID: <0fa21d91-b15f-8049-d776-8c6e9e9334b2@collabora.com>
Date: Thu, 17 Feb 2022 16:20:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/23] drm/rockchip: dw_hdmi: rename vpll clock to
 reference clock
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-3-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220217082954.2967889-3-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 11:29, Sascha Hauer пишет:
> +	hdmi->ref_clk = devm_clk_get(hdmi->dev, "ref");
> +	if (PTR_ERR(hdmi->ref_clk) == -ENOENT)
> +		hdmi->ref_clk = devm_clk_get(hdmi->dev, "vpll");
> +
> +	if (PTR_ERR(hdmi->ref_clk) == -ENOENT) {
> +		hdmi->ref_clk = NULL;

I missed in v5 that devm_clk_get_optional() could be used here. But this
doesn't worth the v7 by itself.
