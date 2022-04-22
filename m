Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FF50AFC1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 07:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1846B10F501;
	Fri, 22 Apr 2022 05:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B9B10F501
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:55:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B71761D77;
 Fri, 22 Apr 2022 05:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39416C385A4;
 Fri, 22 Apr 2022 05:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650606942;
 bh=yPcgKn7+VM0lcH+ZbeTVmHNXEMBQkHRpFUGHrVbAfn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DGjFcWT+dCRf+1Ea0UMpZB3BVhFT/mpAUOufRi+F5d42Ebw210evImcesBdkmAE2y
 CojO/L6OwQvvebeoVE6qvReZ7g9PFW9JuEYpetmtjtso83DunufiLr8qgO9O0+FFpn
 GVMccx8ynEYfHuCvjETmo3HW7xzHr3OoSppx9O2wdR3ZEn7HcEdKmSQap5o8e+7dTD
 jgWGncxQTYOOsaLGuI90Mu9fT+ymfCNsIJoAsUtWTNfNAgWP+0rLmO96CJ3OGjOTNi
 cMc2mOyUFIDdlFfXV8S9TmUlpmywWyXsJfWmlDXPjEEw4JKcA8ShoftvG9yEz9x4qA
 iPnvfq7oG+4Qw==
Date: Fri, 22 Apr 2022 11:25:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 20/41] dma: omap: hide legacy interface
Message-ID: <YmJDWYcBN5+MWe91@matsya>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-21-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-21-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19-04-22, 15:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The legacy interface for omap-dma is only used on OMAP1, and the
> same is true for the non-DT case. Make both of these conditional on
> CONFIG_ARCH_OMAP1 being set to simplify the dependency.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
