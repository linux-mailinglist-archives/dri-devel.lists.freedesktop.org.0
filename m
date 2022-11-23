Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E06352DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E7910E1FE;
	Wed, 23 Nov 2022 08:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D0110E517
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:38:46 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 180DC21D8A;
 Wed, 23 Nov 2022 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669192724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyDkuzNC/jl4d5KJL9/SjUBleXArECVHMISPfJsrGP8=;
 b=HEUE2jrFgR3QRIu0bSrkoslAyO6xNL6LlEveIMGzeg2CW3FR9JX6cVTN1QHrwqqFOSHF5Y
 w0sJ3VEIiW/hCPT1V44+WMnTMiSZSGPGvoKFSlGVRGzVfsPd9W+iPf9W9xhiaqTKnOoOcl
 om9nc0tU5VjTY65QTRaCVbnCOZ+YiNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669192724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyDkuzNC/jl4d5KJL9/SjUBleXArECVHMISPfJsrGP8=;
 b=2lSj3ejczholVpslJNAYIyLw7sO3BGm7rR4NRqHwAC63X5Ne3WfgMvdG3Swu6Wz1axu0NK
 FNRPyl5UmMRpA+DQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D353E2C141;
 Wed, 23 Nov 2022 08:38:43 +0000 (UTC)
Date: Wed, 23 Nov 2022 09:38:42 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
Message-ID: <20221123083842.GZ28810@kitsune.suse.cz>
References: <20221123031605.16680-1-rdunlap@infradead.org>
 <fd0d1d30-3210-77f5-8cd7-b62f59dc3c20@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd0d1d30-3210-77f5-8cd7-b62f59dc3c20@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 09:02:54AM +0100, Thomas Zimmermann wrote:
> 
> Am 23.11.22 um 04:16 schrieb Randy Dunlap:
> > Fix build when CONFIG_FB_OF=y and CONFIG_DRM_OFDRM=m.
> > When the latter symbol is =m, kconfig downgrades (limits) the 'select's
> > under FB_OF to modular (=m). This causes undefined symbol references:
> > 
> > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined reference to `cfb_fillrect'
> > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined reference to `cfb_copyarea'
> > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined reference to `cfb_imageblit'
> > 
> > Fix this by allowing FB_OF any time that DRM_OFDRM != y so that the
> > selected FB_CFB_* symbols will become =y instead of =m.
> > 
> > In tristate logic (for DRM_OFDRM), this changes the dependency from
> >      !DRM_OFDRM	== 2 - 1 == 1 => modular only (or disabled)
> > to (boolean)
> >      DRM_OFDRM != y == y, allowing the 'select's to cause the
> > FB_CFB_* symbols to =y instead of =m.
> > 
> > Fixes: c8a17756c425 ("drm/ofdrm: Add ofdrm for Open Firmware framebuffers")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Michal Suchánek <msuchanek@suse.de>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Tested-by: Michal Suchánek <msuchanek@suse.de>

> 
> > ---
> >   drivers/video/fbdev/Kconfig |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -455,7 +455,7 @@ config FB_ATARI
> >   config FB_OF
> >   	bool "Open Firmware frame buffer device support"
> >   	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> > -	depends on !DRM_OFDRM
> > +	depends on DRM_OFDRM != y
> >   	select APERTURE_HELPERS
> >   	select FB_CFB_FILLRECT
> >   	select FB_CFB_COPYAREA
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev



