Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666B1E0140
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 19:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9FD89DDF;
	Sun, 24 May 2020 17:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80F889DDF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gEucHw00yI0aDw2301W8fLDPFjF0TZfhsCmw9IsXOBs=; b=GRIbVQIppWgeNa7ixzVNW22N+Z
 vpo4I3CslBa3BVW17pWaVO8O7AKqUgDNNhDaaHxOx5voXbIDMyaXxlFbO75CPA3EVFN2pq+ynkeld
 OwL8cxXFs2KTpuhiZAxe4aqBhjFH5N658kMJkMgerzUeHF5VBViHnWWC4b5UMq1JMGaTPUp+OToxj
 N/eFkWovNXM2NxlSe9kKaQarW9aUpeQbgDfGjGUdaoVdY91KDeCTN2dyofqYnc0UL2mvnHuAJpAje
 Sr1g4rrKMmFoo/+5JsWxOqdZxykkW8qUm0lLpfMCtl69nILNQtjYdzHkyCiWCss1Rcg1zJZQ9Aksu
 w+mCIu/w==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51721
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jcuhg-0004FH-MM; Sun, 24 May 2020 19:46:28 +0200
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
To: Paul Cercueil <paul@crapouillou.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <05f4908a-2df4-2694-e5e6-0faee31cc2a9@tronnes.org>
Date: Sun, 24 May 2020 19:46:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 24.05.2020 18.13, skrev Paul Cercueil:
> Hi list,
> 
> I'd like to open a discussion about the current support of MIPI DSI and
> DBI panels.
> 
> Both are standards from the MIPI alliance, both are communication
> protocols between a LCD controller and a LCD panel, they generally both
> use the same commands (DCS), the main difference is that DSI is serial
> and DBI is generally parallel.
> 
> In the kernel right now, DSI is pretty well implemented. All the
> infrastucture to register a DSI host, DSI device etc. is there. DSI
> panels are implemented as regular drm_panel instances, and their drivers
> go through the DSI API to communicate with the panel, which makes them
> independent of the DSI host driver.
> 
> DBI, on the other hand, does not have any of this. All (?) DBI panels
> are implemented as tinydrm drivers, which make them impossible to use
> with regular DRM drivers. Writing a standard drm_panel driver is
> impossible, as there is no concept of host and device. All these tinydrm
> drivers register their own DBI host as they all do DBI over SPI.
> 
> I think this needs a good cleanup. Given that DSI and DBI are so
> similar, it would probably make sense to fuse DBI support into the
> current DSI code, as trying to update DBI would result in a lot of code
> being duplicated. With the proper host/device registration mechanism
> from DSI code, it would be possible to turn most of the tinydrm drivers
> into regular drm_panel drivers.
> 
> The problem then is that these should still be available as tinydrm
> drivers. If the DSI/DBI panels can somehow register a .update_fb()
> callback, it would make it possible to have a panel-agnostic tinydrm
> driver, which would then probably open a lot of doors, and help a lot to
> clean the mess.
> 
> I think I can help with that, I just need some guidance - I am fishing
> in exotic seas here.
> 
> Thoughts, comments, are very welcome.

I did look at this a few months back:

drm/mipi-dbi: Support panel drivers
https://lists.freedesktop.org/archives/dri-devel/2019-August/228966.html

The problem with DBI is that it has reused other busses which means we
don't have DBI drivers, we have SPI drivers instead (6800/8080 is not
avail. as busses in Linux yet). DSI and DPI on the other hand has
dedicated hw controller drivers not shared with other subsystems.

My initial tinydrm work used drm_panel, but I was not allowed to use it
(at least not the way I had done it).

Noralf.

> 
> Cheers,
> -Paul
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
