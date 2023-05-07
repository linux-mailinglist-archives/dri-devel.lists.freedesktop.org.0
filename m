Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630BA6F9A28
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33810E2B4;
	Sun,  7 May 2023 16:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FA610E2B4
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=ucA11er79JBET5xWuYyOksM1zu8wU5kPeOrR5aA/0dU=;
 b=PRgP9Y4tNwXHXZxrzXrZXQOQJrTWVbnnddZMPB2mk9pAZH6bVYon8BkwVTrI0xZh245CSp7c/MQzS
 qJJmpiAjYG0AjFK7avHGfYI7/rB5q9zPm3GvyAG2LRfU++rlb+5vx8IUQO9W5lovDNzCdGKEWrMvkQ
 pbCZMyd0+LOsePy4H6RvzrlHamNmJ95+z0nYYKHVZ3siwQDkmjr4Ocdecf3oJRbOxHpra0AilaEm5v
 OCysPHPCKUEK8kT+WCqKWxre06jOsHPP3Py2HVgaOEbGdbSgdm2rdeknHn9m9tdtfKMR1xC4vecCcN
 ipYG1RBWXnWrElU0KMFu4eXFixtn+Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=ucA11er79JBET5xWuYyOksM1zu8wU5kPeOrR5aA/0dU=;
 b=IIfp1nrbe2FTNGrkX3vZSeZbg/t4CNFhhhF36p6dbnAwlRmjsD8D1hGKpg5r6+b/bKcpaheCbFQuD
 aNAvqmVDA==
X-HalOne-ID: 605f2960-ecf6-11ed-a290-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 605f2960-ecf6-11ed-a290-99461c6a3fe8;
 Sun, 07 May 2023 16:44:07 +0000 (UTC)
Date: Sun, 7 May 2023 18:44:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/53] drm/atmel-hlcdc: Convert to platform remove
 callback returning void
Message-ID: <20230507164405.GA858368@ravnborg.org>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-7-u.kleine-koenig@pengutronix.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel@pengutronix.de,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 07, 2023 at 06:25:29PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
