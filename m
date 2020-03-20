Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B9818DB96
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 00:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5246EB88;
	Fri, 20 Mar 2020 23:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4897F6EB88
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 23:14:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 150F62072C;
 Fri, 20 Mar 2020 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584746040;
 bh=U/cJ0BSW3BRcy0W5KoR1HwjhDf6zGsTE5nhf+o4EqUU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ZKZMfV5DH8CnhhuZuMkf36QJ/QDIrIlKkjYW5oSz9aauGDXiJj+TMgiW+vcymc/FB
 PGAq53M9SjECoNZv/2BTnxOyCLeOcbkzrNgZ4o62mXGgmOzSj4RZPS0JNq5D3lRagt
 d5dJjtPRRAqxyf6N7CZyDp85TyeI8URrWGkcc8io=
MIME-Version: 1.0
In-Reply-To: <20200311165322.1594233-4-enric.balletbo@collabora.com>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-4-enric.balletbo@collabora.com>
Subject: Re: [PATCH v12 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, airlied@linux.ie,
 ck.hu@mediatek.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 ulrich.hecht+renesas@gmail.com
Date: Fri, 20 Mar 2020 16:13:59 -0700
Message-ID: <158474603935.125146.14986079780178656133@swboyd.mtv.corp.google.com>
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
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, ,
	James Liao <jamesjj.liao@mediatek.com>, hat.com@freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Fabien Parent <fparent@baylibre.com>,
	Collabora Kernel ML <kernel@collabora.com>,
	linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Richard Fontana <rfontana@red>, wens@csie.org,
	Allison Randal <allison@lohutok.net>,
	mtk01761 <wendell.lin@mediatek.com>,
	Owen Chen <owen.chen@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, frank-w@public-files.de,
	Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
	Houlong Wei <houlong.wei@mediatek.com>,
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Enric Balletbo i Serra (2020-03-11 09:53:20)
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

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Unless you want me to pick this up by itself?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
