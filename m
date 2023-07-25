Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1D7624D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 23:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0431910E1AB;
	Tue, 25 Jul 2023 21:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405A10E1AB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 21:51:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 424B061920;
 Tue, 25 Jul 2023 21:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74192C433C7;
 Tue, 25 Jul 2023 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690321863;
 bh=cwjUnEpKd3inLxZNqE7zRhpjdwyHJ4S8/pVBZkwz308=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=N0KmrS+Trg21R+yMce2RP23J9qPMmSNIHzReUW1Q/AhJC+dk9d0P8sfBK020Wzhnr
 /fhY2gBE/ptvVz/faQJIWeYKcS4bDVHhD4kshaSfK/czF6/6xsuq7qwxIYk4FqfsgC
 mi+mPvsISS/+tGs/jJHtxGJ4rtDT0wg516ZGy0b0jwtS1OG3zMU9eOcIpiD7RubsGu
 5CRyNL29fFg/6x74F0N8eaVJ1dAS1vKFWnNS1PqvLF0m2tn3zp14gYNEfSpr0JY96D
 FrNbLLTuuamFv/H6uyANqzO+o0sOagUImBc2XeZotshXqsGdVhT0X3VftOhdmU2Ypq
 +CnTLmQV38LXg==
Date: Tue, 25 Jul 2023 16:51:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 4/6] PCI/VGA: Move the new_state assignment out the loop
Message-ID: <20230725215101.GA667452@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c8ca3a6-5898-ccba-cd01-9622215ddd10@loongson.cn>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 09:02:14PM +0800, suijingfeng wrote:
> PING, please !

Don't worry, these are not forgotten.  Your other series seems more
important, so that's what I've been paying attention to.

> On 2023/7/11 21:43, Sui Jingfeng wrote:
> > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > 
> > In the vga_arbiter_notify_clients() function, the value of the 'new_state'
> > variable will be 'false' on systems that have more than one PCI VGA card.
> > Its value will be 'true' on systems that have one or no PCI VGA compatible
> > card. In other words, its value is not relevant to the iteration, so move
> > the assignment () out of the loop.
> > 
> > For a system with multiple video cards, this patch saves the redundant
> > assignment.
> > 
> > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
> >   drivers/pci/vgaarb.c | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> > index 668139f7c247..4c448c758bab 100644
> > --- a/drivers/pci/vgaarb.c
> > +++ b/drivers/pci/vgaarb.c
> > @@ -1468,22 +1468,20 @@ static void vga_arbiter_notify_clients(void)
> >   {
> >   	struct vga_device *vgadev;
> >   	unsigned long flags;
> > -	uint32_t new_decodes;
> > -	bool new_state;
> > +	bool state;
> >   	if (!vga_arbiter_used)
> >   		return;
> > +	state = (vga_count > 1) ? false : true;
> > +
> >   	spin_lock_irqsave(&vga_lock, flags);
> >   	list_for_each_entry(vgadev, &vga_list, list) {
> > -		if (vga_count > 1)
> > -			new_state = false;
> > -		else
> > -			new_state = true;
> >   		if (vgadev->set_decode) {
> > -			new_decodes = vgadev->set_decode(vgadev->pdev,
> > -							 new_state);
> > -			vga_update_device_decodes(vgadev, new_decodes);
> > +			unsigned int decodes;
> > +
> > +			decodes = vgadev->set_decode(vgadev->pdev, state);
> > +			vga_update_device_decodes(vgadev, decodes);
> >   		}
> >   	}
> >   	spin_unlock_irqrestore(&vga_lock, flags);
> 
