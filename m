Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910E5FC8D3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 18:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C584310E2AC;
	Wed, 12 Oct 2022 16:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D98210E2AC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 16:01:57 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3017A21B52;
 Wed, 12 Oct 2022 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665590515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+RNgCK6qqojiT+qhhYN/EWp/y1Qj/NNbS50byrHex4=;
 b=aBn04Kj+B41WURCoXqhWODwI4dy6X6yhzTmNQmNmO+vr23JDzWbAANBt2kS4TO6nBhsY+I
 S8bDfCC6OfglAt98NrUpWyfw5uuLLN0+hcQnJg90DJR4sGKGBASIbpESwcuS1vtlLx/W1D
 EdLIB/al7Ld3DOpgihAaxO5ZE2OluEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665590515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+RNgCK6qqojiT+qhhYN/EWp/y1Qj/NNbS50byrHex4=;
 b=5n5D4GdrRgeDPdJBOUJdODy0llgwsWDODFU/6LSgcBsCCf7800UHSrCmzV6c28KWklPXtU
 +EuG3coeE1e7mrAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C8FAB2C141;
 Wed, 12 Oct 2022 16:01:53 +0000 (UTC)
Date: Wed, 12 Oct 2022 18:01:52 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20221012160152.GE28810@kitsune.suse.cz>
References: <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
 <a81e1acf-64dd-f69d-d97f-4a1af534e8e6@suse.de>
 <Y0bWYb0z1HZ2PztG@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0bWYb0z1HZ2PztG@intel.com>
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
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Geert Uytterhoeven <geert@linux-m68k.org>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 05:59:45PM +0300, Ville Syrjälä wrote:
> On Wed, Oct 12, 2022 at 04:31:14PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 12.10.22 um 15:12 schrieb Arnd Bergmann:
> > > On Wed, Oct 12, 2022, at 2:00 PM, Thomas Zimmermann wrote:
> > >>
> > >> Could well be. But ofdrm intents to replace offb and this test has
> > >> worked well in offb for almost 15 yrs. If there are bug reports, I'm
> > >> happy to take patches, but until then I see no reason to change it.
> > > 
> > > I wouldn't change the code in offb unless a user reports a bug,
> > > but I don't see a point in adding the same mistake to ofdrm if we
> > > know it can't work on real hardware.
> > 
> > As I said, this has worked with offb and apparently on real hardware. 
> > For all I know, ATI hardware (before it became AMD) was used in PPC 
> > Macintoshs and assumed big-endian access on those machines.
> 
> At least mach64 class hardware has two frame buffer apertures, and
> byte swapping can be configured separately for each. But that means
> you only get correct byte swapping for at most two bpps at the same
> time (and that only if you know which aperture to access each time).
> IIRC Rage 128 already has the surface register stuff where you
> could byte swap a limited set of ranges independently. And old
> mga hardware has just one byte swap setting for the whole frame
> buffer aperture, so only one bpp at a time.
> 
> That kind of horrible limitations of the byte swappers is the
> main reason why I wanted to make drm fourcc endianness explicit.
> Simply assuming host endianness would end in tears on big endian
> as soon as you need to access stuff with two bpps at the same time.
> Much better to just switch off those useless byte swappers and
> swap by hand when necessary.

If you have hardware-specific driver, sure.

This is firmware-provided framebuffer, though. You get one framebuffer
address, and one endian - whatever the firmware set up and described in
the DT.

Thanks

Michal
