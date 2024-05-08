Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C18C05C3
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 22:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933B311297B;
	Wed,  8 May 2024 20:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="a2/4sLX3";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="CEGyBVPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8711297B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 20:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2Kr4WAPymGfrFyDSJoZ4sUX/qeZZIZop4uu2xT6wC8g=;
 b=a2/4sLX3UBAM5CDJi69E6xgTJmcUlUGlgiWpr3MBzvygSwoYJbD4px9wDDaWolIfocZnuHGq8Ipki
 g2c1Cm9trcnFPLPJWyfrieGUJP49pcwKxr6DwOohwAUqPl8aNIpGCsd369mft5I/sOhOF5pDe2XvoZ
 TznTG2taddCRb4oovv2/qD/kGN5HXfArIwiXGAG60eJhNhQCyLMcG4vKw94oh6SZGwI5cWKfCGf9sI
 5ZG6DPefQlnNmzHOhVyaAX6YR+XIh19zAIYTPBigUyCmp6z3Vts8TQANRqh3PGKkaijxA59SZBMP4p
 ksjcSxxQkccvLutPmbJzHTtgoX7IvvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2Kr4WAPymGfrFyDSJoZ4sUX/qeZZIZop4uu2xT6wC8g=;
 b=CEGyBVPPCl2X12NdPcyzd1fao8OO62cec9WJU3Erhxjd1RIzw7J466KO211uqWipb7NQIdd3xvAKq
 Z/F8Ep7AA==
X-HalOne-ID: 9ba8772e-0d7a-11ef-88ab-edf132814434
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 9ba8772e-0d7a-11ef-88ab-edf132814434;
 Wed, 08 May 2024 20:36:15 +0000 (UTC)
Date: Wed, 8 May 2024 22:36:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Message-ID: <20240508203613.GA2715801@ravnborg.org>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
 <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
 <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
 <ZjoMI5bJSlqhtOy1@phenom.ffwll.local>
 <41191296-0aa0-4010-b70f-efa80b9200d4@app.fastmail.com>
 <fe156e32-8ce7-4ce5-99cb-6291ad4b83b0@broadcom.com>
 <41639d6b-a429-43f4-8568-12fcd1671cff@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41639d6b-a429-43f4-8568-12fcd1671cff@app.fastmail.com>
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

Hi Arnd,

> 
> I think if you want to do a new version, that is likely to run
> into new problems, given that this part of fbdev is particularly
> fragile and partly wrong. On the other hand, it would be nice to
> have a patch to limit the use of the notifiers to the smallest
> set of kernel configs that actually need it, and leave it turned
> off for everything else.
> 
> These are the ones I could find:
> 
> - CONFIG_GUMSTIX_AM200EPD (FB_EVENT_FB_REGISTERED)

I was surprised to see this driver is still around as many other old
drivers was nuked as part of the pxa cleanup.
It is the only user of FB_EVENT_FB_REGISTERED - so a potential cleanup
if the driver is no longer relevant.

Just a drive-by comment, this should not stop a v2 of the patchset.

	Sam
