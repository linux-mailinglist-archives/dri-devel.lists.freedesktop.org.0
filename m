Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8D581588
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 16:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6409B8F644;
	Tue, 26 Jul 2022 14:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573068F69D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 14:40:28 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id ED8121FEAA;
 Tue, 26 Jul 2022 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658846426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTmDdk3BCJXU66FNIOyDwXn3D4Z4E7It/BpD50zR37c=;
 b=slnjENGecyoF9cdEgc3AdMM/bgS3ZaMTCjuJhT/ATqsSIq8r2k+z9jerENWV2+GKZiz019
 IydVJQpgTKEvbsa17clvsvC2q/L4NvNOwqgQQMgtpcrTLiiusoTKu3CofLq1DdztGY4bLt
 dpm80iIgIcQHtQLXGDZzjssGyaBIWPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658846426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTmDdk3BCJXU66FNIOyDwXn3D4Z4E7It/BpD50zR37c=;
 b=+9jOMyM9GYJd8e7hl0Ul/rnbsYdkLNTVLbIlMof86f5aY6/bt7N77Vxg7HIHi07pzV74et
 uKa9ispc+GfyPZDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 45C7B2C141;
 Tue, 26 Jul 2022 14:40:25 +0000 (UTC)
Date: Tue, 26 Jul 2022 16:40:24 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
Message-ID: <20220726144024.GP17705@kitsune.suse.cz>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
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
 airlied@linux.ie, mpe@ellerman.id.au, deller@gmx.de,
 mark.cave-ayland@ilande.co.uk, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech,
 geert@linux-m68k.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Jul 26, 2022 at 03:38:37PM +0200, Javier Martinez Canillas wrote:
> On 7/20/22 16:27, Thomas Zimmermann wrote:
> > Add a per-model device-function structure in preparation of adding
> > color-management support. Detection of the individual models has been
> > taken from fbdev's offb.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> [...]
> 
> > +static bool is_avivo(__be32 vendor, __be32 device)
> > +{
> > +	/* This will match most R5xx */
> > +	return (vendor == 0x1002) &&
> > +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
> > +}
> 
> Maybe add some constant macros to not have these magic numbers ?

This is based on the existing fbdev implementation's magic numbers:

drivers/video/fbdev/offb.c:                 ((*did >= 0x7100 && *did < 0x7800) ||

Of course, it would be great if somebody knowledgeable could clarify
those.

Thanks

Michal
