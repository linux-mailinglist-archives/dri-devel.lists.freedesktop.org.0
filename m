Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D36A5B80
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11EC10E4D5;
	Tue, 28 Feb 2023 15:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABDD10E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 15:16:58 +0000 (UTC)
Received: (qmail 6176 invoked by uid 1000); 28 Feb 2023 15:16:54 -0000
Message-ID: <20230228151654.6175.qmail@stuge.se>
Date: Tue, 28 Feb 2023 15:16:54 +0000
From: Peter Stuge <peter@stuge.se>
To: Simon Ser <contact@emersion.fr>
Subject: Re: gud: set PATH connector property
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
 <20230228123134.1311.qmail@stuge.se>
 <Rg-l1BDgSgbo04Mgca01xzLlg0MjL1P9SxE2GvPPQbOlkMLH1AtqvZ6zj6DItsDBfSIkScUbK4YIctzF57Y5Diinb99sXLqlgCCsAOEjNTc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Rg-l1BDgSgbo04Mgca01xzLlg0MjL1P9SxE2GvPPQbOlkMLH1AtqvZ6zj6DItsDBfSIkScUbK4YIctzF57Y5Diinb99sXLqlgCCsAOEjNTc=@emersion.fr>
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
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simon Ser wrote:
> > > Would it be possible to set the PATH connector property based on the
> > > USB port used by gud?
> > 
> > Sadly not really easily.
> > 
> > The physical topology underneath each host controller is stable but
> > bus numbers (usb1, usb2 etc.) are not.
> 
> Oh, that's news to me. So if I unplug and replug a USB device, the bus
> number and bus device number might change?

The bus number is stable as long as the bus (host controller) exists.


> Or does this happen after a power-cycle? Or is this hardware-specific?

Consider a host controller on a plug-in card, like ExpressCard (usb1)
and perhaps Thunderbolt (usb2) for a more modern example.

The bus on each new host controller gets the next available bus number.

Plug ExpressCard before Thunderbolt to get the order above. Unplug
both (usb1+usb2 disappear) then plug Thunderbolt back in before
ExpressCard; now Thunderbolt is usb1 and ExpressCard usb2.


> > For onboard host controllers it could be possible to anchor to a
> > PCI or platform bus device.
> 
> But the PCI bus device isn't enough I think? If I have a onboard host
> controller with 2 physical USB ports, the PCI bus device isn't enough
> to tell these 2 physical ports apart?

*Only* the PCI bus device is not enough, but it could serve as a
unique anchor and some host controller-specific information (e.g.
root port number) can be added to that.


> > How about using e.g. the serial number of the gud USB device instead
> > of host topology, or maybe some other information from the panel
> > behind it?
> 
> The PATH property is really about the port path, not the sink. IOW, if
> I have two USB displays, one USB port, and switch between the two
> displays on this one port, the PATH property isn't supposed to change.

Hmm. What is "port path" supposed to mean across a hot-pluggable bus?

Should PATH refer to the one ExpressCard host controller if it moves
between slots (assuming a computer with two slots) or should it
rather refer to "the upper USB port on the right hand side ExpressCard"
so I can insert another brand host controller in that slot without
PATH changing?


//Peter
