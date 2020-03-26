Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6396193500
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 01:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCBC6E221;
	Thu, 26 Mar 2020 00:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4386E221
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 00:37:54 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29ACB2076A;
 Thu, 26 Mar 2020 00:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585183074;
 bh=uTBwrRURfEgw4S2hFimXxbsm5HsmXB305WVY0KDpJgA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QyWBNUs1RXuj5dE1+bdyCZwg5QFoS3XLTv9q5FGZYkVkdkFffX9T2Wa8DTVg9D4cc
 lY0XCrDNKsuu3ZV/R7ximMohWgUnvZaSnVfnZAs0u32HyIMjGNv5PMjOLwJrabKWfe
 0wR+1/f1OvnbYtZdXHYUGRUkiwAhlqvtR+VDn30c=
MIME-Version: 1.0
In-Reply-To: <20200325173123.3569606-4-enric.balletbo@collabora.com>
References: <20200325173123.3569606-1-enric.balletbo@collabora.com>
 <20200325173123.3569606-4-enric.balletbo@collabora.com>
Subject: Re: [RESEND PATCH v12 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, airlied@linux.ie,
 ck.hu@mediatek.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 ulrich.hecht+renesas@gmail.com
Date: Wed, 25 Mar 2020 17:37:53 -0700
Message-ID: <158518307331.125146.14008716764131362133@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	Richard Fontana <rfontana@redhat.com>,
	Collabora Kernel ML <kernel@collabora.com>,
	linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
	rnel.org@freedesktop.org, linux-arm-kernel@lists.infradead.org,
	mtk01761 <wendell.lin@mediatek.com>,
	Owen Chen <owen.chen@mediatek.com>, devicetree@vger.kernel.org,
	frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
	sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Allison Randal <allison@lohutok.net>,
	Matthias Brugger <mbrugger@suse.com>,
	Fabien Parent <fparent@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	matthias.bgg@kernel.org, linux-media@vger.ke
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Enric Balletbo i Serra (2020-03-25 10:31:21)
> From: Matthias Brugger <mbrugger@suse.com>
> 
> There is no strong reason for this to use CLK_OF_DECLARE instead of
> being a platform driver. Plus, MMSYS provides clocks but also a shared
> register space for the mediatek-drm and the mediatek-mdp
> driver. So move the MMSYS clocks to a new platform driver and also
> create a new MMSYS platform driver in drivers/soc/mediatek that
> instantiates the clock driver.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
