Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F37620B2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 19:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F4610E132;
	Tue, 25 Jul 2023 17:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470E310E132
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=b58HxDk4pWLDi3O792SrDwRigi4TNZsbJpTqvdkuXQw=;
 b=LTkZxPGUiYmTXLYVZ70EIwnAuEoe8IidUv1urjDHVF5DE3iKISkV+wNHqwNX82fb7/9zJB3ERTrWM
 bklyLi2z/tBAjWAK+ECNdJQMVcvPGEHI2tmGvpL6yBU0ydySDdUcCystBKecmscZoB6pmbc+1MZCtL
 7vtFk89c/Ng+awbupm6PbMATPhDFGcdSRHWbqdZnsbSTqo+ZeCnEsBMzLRmHSxvHup0/vCe0AuDWly
 1NBfaeOWi9c7IREaldfHCXXuIZxrLJhi4g66bi007ctX+1xa2nNPlcIWZpjU04OQrNpL1uiYbgT59z
 iutkNuTtxPnmMmlGnnRTtwjTXcki3/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=b58HxDk4pWLDi3O792SrDwRigi4TNZsbJpTqvdkuXQw=;
 b=xIWNFOA9Y1e5I+D5BtIac7rX8eyu5PIYXyX3JRjEgiw/PCuSip3XrYqqz7VhOkTpSmuYrJDJcO/KG
 yvd4QkeAg==
X-HalOne-ID: 9a250718-2b14-11ee-9efa-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 9a250718-2b14-11ee-9efa-99461c6a3fe8;
 Tue, 25 Jul 2023 17:56:40 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:56:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
Message-ID: <20230725175639.GC838289@ravnborg.org>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

> >> >  menuconfig LOGO
> >> >       bool "Bootup logo"
> >> > -     depends on FB || SGI_NEWPORT_CONSOLE
> >> > +     depends on FB_CORE || SGI_NEWPORT_CONSOLE
> >> >       help
> >> >         Enable and select frame buffer bootup logos.
> >>
> >> Should then move this option to drivers/video/fbdev/core/Kconfig ?
> >
> > No, all logo options are in their own file.
> >
> 
> Yes. I meant to move drivers/video/logo/ to drivers/fbdev/core/logo and to
> source its Kconfig from drivers/fbdev/core/Kconfig, since it now depends
> on FB_CORE.
> 
> But I see now that it also depends on SGI_NEWPORT_CONSOLE, so having those
> in drivers/video/logo makes sense indeed.

The SGI_NEWPORT_CONSOLE should be replaced by some ifdef in the
newport_con.c code - to do what other drivers do.
But thats for another day.

	Sam
