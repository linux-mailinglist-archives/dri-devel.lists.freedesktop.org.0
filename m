Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C595FC4FE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E85A10E440;
	Wed, 12 Oct 2022 12:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9E410E440
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 12:07:14 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6AA791F381;
 Wed, 12 Oct 2022 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665576433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLCPJxzJ0YYg2ZOgvIOSJ8Odau36xhYM3uJca/JYmTM=;
 b=aWK/GoG2/0N0MOrwxh+/O+NkFUqsPj6bfy5yFCLcAwu+RgOePf0jIIImImg3Y1z8Lq+jHr
 Al6xFtCJq6TsFtHU2tv2HjYcuG5ZZZCptGMC4NAnKqXEdevp5mz3Bbmt74HeMXbrunIpAx
 vIv2jeSVjZtVPFlwENubImIy2xQiStI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665576433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLCPJxzJ0YYg2ZOgvIOSJ8Odau36xhYM3uJca/JYmTM=;
 b=EUwrAEdomB1XMZtAb3Yak1TjM5uFoJg8tDEwZcbhsHvzbyH78mVYjePQByhRCfQyASeXAt
 qc/d/WVFS1IFuUDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 312582C141;
 Wed, 12 Oct 2022 12:07:11 +0000 (UTC)
Date: Wed, 12 Oct 2022 14:07:09 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20221012120709.GC28810@kitsune.suse.cz>
References: <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
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
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, linuxppc-dev@lists.ozlabs.org,
 mark.cave-ayland@ilande.co.uk, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Maxime Ripard <maxime@cerno.tech>, Geert Uytterhoeven <geert@linux-m68k.org>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 10:38:29AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 12, 2022, at 10:27 AM, Thomas Zimmermann wrote:
> > Am 12.10.22 um 09:44 schrieb Arnd Bergmann:
> >> On Wed, Oct 12, 2022, at 9:40 AM, Thomas Zimmermann wrote:
> >>> Am 12.10.22 um 09:17 schrieb Arnd Bergmann:
> >>>> On Wed, Oct 12, 2022, at 8:46 AM, Thomas Zimmermann wrote:
> >>>
> >>>> Does qemu mark the device has having a particular endianess then, or
> >>>> does it switch the layout of the framebuffer to match what the CPU
> >>>> does?
> >>>
> >>> The latter. On neither architecture does qemu expose this flag. The
> >>> default endianess corresponds to the host.
> >> 
> >> "host" as in the machine that qemu runs on, or the machine that is
> >> being emulated? I suppose it would be broken either way, but in the
> >> latter case, we could get away with detecting that the machine is
> >> running under qemu.
> >
> > Sorry, my mistake. I meant "guest": the endianess of the framebuffer 
> > corresponds to the endianess of the emulated machine.  Given that many 
> > graphics cards support LE and BE modes, I assume that this behavior 
> > mimics real-hardware systems.
> 
> Not really: While the hardware may be able to switch between
> the modes, something has to actively set some hardware registers up
> that way, but the offb/ofdrm driver has no interface for interacting
> with that register, and the bootloader or firmware code that knows
> about the register has no information about what kernel it will
> eventually run. This is a bit architecture dependent, as e.g. on
> MIPS, a bi-endian hardware platform has to run a bootloader with the
> same endianness as the kernel, but on arm and powerpc the bootloader
> is usually fixed and the kernel switches to its configured endianness
> in the first few instructions after it gets entered.

But then the firmware knows that the kernel can switch endian and the
endian information should be provided. And maybe that should be emulated
better by qemu. Unfortunately, modern Power servers rarely come with a
graphics card so it's hard to test on real hardware.

Thanks

Michal
