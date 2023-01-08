Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4F661941
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 21:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395AD10E03C;
	Sun,  8 Jan 2023 20:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEA610E03C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9OaC5fUVjOcmXpBQANWBWYj1FAjD2dw4nLoh5knK1rQ=;
 b=a3Tr/5THw9+sAm+Z+Gy/e4LPnpKQjtoLtN8tz6vefonrvI2Pg0DkrGp7CRZv9nUmr2A1eqptG9QOW
 1f/HZoXSd3iAonj5rqD6hm8MfIqs+HGA74YZTEWBqQ8zPgFaXkRXZXdnxCyMaH5GiAqtxqK9Df6AX9
 3m+LbJKf5IvUctgd9+rBTMF5HCdyq41ptarJEFEIxZnSoPgNbm9JF71Uqwz6qa4eukWv6jkTxzMAYs
 0ekB9siEZdEjgGlQRCnZjJI9Gm+DPZrbVZFfhiiBbLrw2rGTdikvsqCerKtoliTSrMwPUfeZ8oSV+u
 SlL0aFFxR/YyVglkXoExkwRnS6zazdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9OaC5fUVjOcmXpBQANWBWYj1FAjD2dw4nLoh5knK1rQ=;
 b=kycKAXjH4J9Dm+t0vV22ddvwFXvBpt2IbPP9ed4AbUh/FX4raML677FAsMHuNHPU0gcasnEY0VNwR
 z0AhnIABQ==
X-HalOne-ID: 6e82c542-8f92-11ed-a2f5-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 6e82c542-8f92-11ed-a2f5-7703b0afff57;
 Sun, 08 Jan 2023 20:24:21 +0000 (UTC)
Date: Sun, 8 Jan 2023 21:24:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight handling
Message-ID: <Y7smdFs2xgJwwVQO@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
 <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
 <Y7nb2q6SDota/rTU@ravnborg.org>
 <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>,
 Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Paul Mackerras <paulus@samba.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>,
 Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen.

 
> Here are my pending patches from last June on lore:
> 

All patches are handled I think except this:
> * https://lore.kernel.org/lkml/20220608205623.2106113-1-steve@sk2.org/

Can I ask you to drop the assignment that is not needed, and resend with
the collected acks/r-b.

With this, then all fbdev patches are handled.

	Sam
