Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAE583D7C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 13:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C869987D9;
	Thu, 28 Jul 2022 11:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7D48AE58
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 11:31:38 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B1CFA22D9F;
 Thu, 28 Jul 2022 11:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659007896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T4hQ/srl6ezx6qKxwYZFZoIzdHVMVGWAztMtWSsODRU=;
 b=WKraLZd3Nx1mQi2HCCD6z59bZmbtSTHs2bmXmI6OQ3rVhAwOgBSCRZcdwvb/ikns0uqwrt
 tGIgXCIY+4dbUN7I273qjDjRWtuA1q/1Q6xTHivSXnpJM955uXQltYYcY2zKust3TXg6Tq
 k12UHAjsTAUsAVY4q3YoTsrsDmWuUuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659007896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T4hQ/srl6ezx6qKxwYZFZoIzdHVMVGWAztMtWSsODRU=;
 b=Gh/HNYvu/lj5tV+p2GbSX4mtEPX6FWpozm40/6neq0aYbAiVlEACdEK6b4/xPj4MiFIioX
 TBy2Jz+a0EBUxCCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 626C42C141;
 Thu, 28 Jul 2022 11:31:32 +0000 (UTC)
Date: Thu, 28 Jul 2022 13:31:31 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 00/10] drm: Add driver for PowerPC OF displays
Message-ID: <20220728113131.GS17705@kitsune.suse.cz>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <871qu5cww8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qu5cww8.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org,
 mark.cave-ayland@ilande.co.uk, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech,
 geert@linux-m68k.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu, Jul 28, 2022 at 09:13:59PM +1000, Michael Ellerman wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> > (was: drm: Add driverof PowerPC OF displays)
> >
> > PowerPC's Open Firmware offers a simple display buffer for graphics
> > output. Add ofdrm, a DRM driver for the device. As with the existing
> > simpledrm driver, the graphics hardware is pre-initialized by the
> > firmware. The driver only provides blitting, no actual DRM modesetting
> > is possible.
> 
> Hi Thomas,
> 
> I tried to test this on a 32-bit ppc Mac Mini but didn't have much luck.
> But I'm probably doing something wrong because I'm a graphics noob.
> 
> The machine normally uses CONFIG_DRM_RADEON, so I turned that off, and
> turned DRM_OFDRM on.
> 
> When I boot I get boot messages but only one screen worth, the messages
> don't scroll at all, which is unusual. But I'm not sure if that's
> related to ofdrm or something else.

A somewhat interesting datapoint might be how this works with offb.

> The machine does come up, I can login via SSH. Is there some way to
> start X to exercise the driver from an SSH login?

The startx script provided by distribution usually works.

It's basically a very convoluted way to do something like

X :0&
DISPLAY=:0 xterm&

Thanks

Michal
