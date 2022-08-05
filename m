Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0658A460
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 03:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C847FAC3B5;
	Fri,  5 Aug 2022 01:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC911ACC74
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 01:04:09 +0000 (UTC)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2750McTg009481;
 Thu, 4 Aug 2022 19:22:39 -0500
Message-ID: <a9822ef5fba5599ddcee5daa4dbd17d8aaca8390.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Javier
 Martinez Canillas <javierm@redhat.com>
Date: Fri, 05 Aug 2022 10:22:38 +1000
In-Reply-To: <20220726144024.GP17705@kitsune.suse.cz>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2022-07-26 at 16:40 +0200, Michal Suchánek wrote:
> Hello,
> 
> On Tue, Jul 26, 2022 at 03:38:37PM +0200, Javier Martinez Canillas wrote:
> > On 7/20/22 16:27, Thomas Zimmermann wrote:
> > > Add a per-model device-function structure in preparation of adding
> > > color-management support. Detection of the individual models has been
> > > taken from fbdev's offb.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > 
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > 
> > [...]
> > 
> > > +static bool is_avivo(__be32 vendor, __be32 device)
> > > +{
> > > +	/* This will match most R5xx */
> > > +	return (vendor == 0x1002) &&
> > > +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
> > > +}
> > 
> > Maybe add some constant macros to not have these magic numbers ?
> 
> This is based on the existing fbdev implementation's magic numbers:
> 
> drivers/video/fbdev/offb.c:                 ((*did >= 0x7100 && *did < 0x7800) ||
> 
> Of course, it would be great if somebody knowledgeable could clarify
> those.

I don't think anybody remembers :-) Vendor 0x1002 is PCI_VENDOR_ID_ATI,
but the rest is basically ranges of PCI IDs for which we don't have
symbolic constants.

Cheers,
Ben.

