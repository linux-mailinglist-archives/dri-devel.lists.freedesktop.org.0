Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48D56E9C43
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 21:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593210E4DB;
	Thu, 20 Apr 2023 19:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48810E4DB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 19:10:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F76264B69;
 Thu, 20 Apr 2023 19:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420C7C433D2;
 Thu, 20 Apr 2023 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682017838;
 bh=XrXqfqmFPAxvfcLnA7hSYVE5T/DiaBScxzwQjC8CZk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LDA5jXTMDJtx+rIFPKnSiZlDcDjiPcZkkoYv6a7KaXWNVDExEskBTpBs+iuoiG1zV
 EaLTGqTna5BKDtH/AhicV08Z60dmekfu41aStdgnq8vLIfZXpXLa/dg1XOB7TviBV9
 En+gIxIR0IEveSaCahs3ZKDC//tkHJzO3Q7mJBsRYbgsdRYpzvEo81sC+MRJsGQThn
 P8mFYrJ7distbVy02YT339dE/+3T1F9wHMGVjwgRFF1PkL9WeGmsdqTsYPbxVSptTB
 VG8754GGBoYnE0DpeLBUFeJHoBOJ/nggPEiMu6CDz3cdlIS4JwDMpezehL0BJD6Mzv
 hvPfJ+vO73uAg==
Date: Thu, 20 Apr 2023 14:10:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
Message-ID: <20230420191036.GA315493@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d65e2938-2910-2330-b9c2-082ab947015d@suse.de>
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>,
 Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+cc Damien, linux-ide]

On Thu, Apr 20, 2023 at 09:08:48AM +0200, Thomas Zimmermann wrote:
> Am 19.04.23 um 20:37 schrieb Bjorn Helgaas:
> > On Wed, Apr 19, 2023 at 09:00:15AM +0200, Thomas Zimmermann wrote:
> > > Am 19.04.23 um 00:57 schrieb Patrick McLean:
> > > > Currently the ASPEED PCI vendor ID is defined in
> > > > drivers/gpu/drm/ast/ast_drv.c, move that to include/linux/pci_ids.h
> > > > with all the rest of the PCI vendor ID definitions. Rename the definition
> > > > to follow the format that the other definitions follow.
> > > 
> > > Thanks a lot. Can you please also move and rename the PCI device ids? [1]
> > 
> > Generally we move things to pci_ids.h only when they are shared
> > between multiple drivers.  This is mostly to make backports easier.
> > 
> > PCI_VENDOR_ID_ASPEED is (or will be) used in both ast_drv.c and
> > libata-core.c, so it qualifies.
> > 
> > It doesn't look like PCI_CHIP_AST2000 and PCI_CHIP_AST2100 would
> > qualify since they're only used in ast_drv.c and ast_main.c, which are
> > part of the same driver.
> 
> Ok, I see. Can I take the patch into DRM trees?

The first time around I got two patches [2].  This time I only got
this patch, but IIUC there are still two patches in play here:

  - This one, which moves PCI_VENDOR_ID_ASPEED to pci_ids.h, and
  - The libata-core one that adds a use in ata_dev_config_ncq()

Those should go together via the same tree.  I supplied my ack to
indicate that I'm not going to merge anything myself, and I expect
whoever merges the libata patch to also merge this one.

If for some reason the libata-core patch doesn't happen, then this
patch shouldn't happen either, because there would no longer be any
sharing between drivers that would justify a pci_ids.h addition.

Bjorn

[2] https://lore.kernel.org/r/20230418011720.3900090-1-chutzpah@gentoo.org

> > > [1] https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/ast/ast_drv.h#L52

> > > > Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
> > > > ---
> > > >    drivers/gpu/drm/ast/ast_drv.c | 4 +---
> > > >    include/linux/pci_ids.h       | 2 ++
> > > >    2 files changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> > > > index d78852c7cf5b..232e797793b6 100644
> > > > --- a/drivers/gpu/drm/ast/ast_drv.c
> > > > +++ b/drivers/gpu/drm/ast/ast_drv.c
> > > > @@ -70,12 +70,10 @@ static const struct drm_driver ast_driver = {
> > > >     * PCI driver
> > > >     */
> > > > -#define PCI_VENDOR_ASPEED 0x1a03
> > > > -
> > > >    #define AST_VGA_DEVICE(id, info) {		\
> > > >    	.class = PCI_BASE_CLASS_DISPLAY << 16,	\
> > > >    	.class_mask = 0xff0000,			\
> > > > -	.vendor = PCI_VENDOR_ASPEED,			\
> > > > +	.vendor = PCI_VENDOR_ID_ASPEED,			\
> > > >    	.device = id,				\
> > > >    	.subvendor = PCI_ANY_ID,		\
> > > >    	.subdevice = PCI_ANY_ID,		\
> > > > diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> > > > index 45c3d62e616d..40e04e88ca5a 100644
> > > > --- a/include/linux/pci_ids.h
> > > > +++ b/include/linux/pci_ids.h
> > > > @@ -2553,6 +2553,8 @@
> > > >    #define PCI_DEVICE_ID_NETRONOME_NFP3800_VF	0x3803
> > > >    #define PCI_DEVICE_ID_NETRONOME_NFP6000_VF	0x6003
> > > > +#define PCI_VENDOR_ID_ASPEED		0x1a03
> > > > +
> > > >    #define PCI_VENDOR_ID_QMI		0x1a32
> > > >    #define PCI_VENDOR_ID_AZWAVE		0x1a3b
> > > 
> > > -- 
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 Nürnberg, Germany
> > > (HRB 36809, AG Nürnberg)
> > > Geschäftsführer: Ivo Totev
> > 
> > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)



