Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1961FCDF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 19:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601510E263;
	Mon,  7 Nov 2022 18:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 18:09:33 UTC
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF4C10E263
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=SLyAxHhS6Hp5u+fEweOLsy65p6aKk/bAOsQqjWK82MY=;
 b=pLvJx/ARXL8BUweavzGmY9yhuhJx4ANZhYhH4Ey7652wAuZsu+XXmrHfCZChe9vHlBlsG4CyCXtlj
 hrEzdHnBkt6ZFdGqw39l2g6UAHJorZWQzSmsPJInytNFbwdsZYXSeaZC1sVxd6BMymOznpK85oX0WP
 ijjDs8Qq4xSeEVCXZC+uzQRTVDiVem49GueY0Fm9B1h05u7kzq22IaV0WSXPdI5ugdhVkuenpGuJg9
 f3lzeDjbPYxYeJ062zih9F5sXp9ibWKdODp6lwDQlwI883o74pzp1xEtIr9tWCoFpNHFWo8hwxTTK6
 bXGgJua39P8SwRBu/4WPu+/abuydNxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=SLyAxHhS6Hp5u+fEweOLsy65p6aKk/bAOsQqjWK82MY=;
 b=WySIdHcNNGMTnlpGu4csUpXl6pOQ2/QYNqYWjoAIHij0UYRD0CbpxoQjInz/WdK/+LR0doOYDL455
 BGnDrH3Ag==
X-HalOne-ID: 13afeb26-5ec5-11ed-ba33-1b2345786432
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 13afeb26-5ec5-11ed-ba33-1b2345786432;
 Mon, 07 Nov 2022 17:53:27 +0000 (UTC)
Date: Mon, 7 Nov 2022 18:53:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 08/26] drm: atmel-hlcdc: Remove #ifdef guards for PM
 related functions
Message-ID: <Y2lGFZi+VHZCRvGN@ravnborg.org>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-9-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107175106.360578-9-paul@crapouillou.net>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 05:50:48PM +0000, Paul Cercueil wrote:
> Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
> the .suspend/.resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for taking care of this.

	Sam

