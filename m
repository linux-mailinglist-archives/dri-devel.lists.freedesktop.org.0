Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02A99B9CF
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 16:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A76A10E00E;
	Sun, 13 Oct 2024 14:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTP id D53FD10E00E;
 Sun, 13 Oct 2024 14:53:24 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 4DC4292009C; Sun, 13 Oct 2024 16:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 45D3F92009B;
 Sun, 13 Oct 2024 15:53:21 +0100 (BST)
Date: Sun, 13 Oct 2024 15:53:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Niklas Schnelle <schnelle@linux.ibm.com>
cc: Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, 
 linux-hexagon@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-serial@vger.kernel.org, linux-arch@vger.kernel.org, 
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v6 4/5] tty: serial: handle HAS_IOPORT dependencies
In-Reply-To: <46d81b40dda20ada3b5847353a866172b419c811.camel@linux.ibm.com>
Message-ID: <alpine.DEB.2.21.2410081606420.30973@angie.orcam.me.uk>
References: <20241007-b4-has_ioport-v6-0-03f7240da6e5@linux.ibm.com>
 <20241007-b4-has_ioport-v6-4-03f7240da6e5@linux.ibm.com>
 <alpine.DEB.2.21.2410072109130.30973@angie.orcam.me.uk>
 <46d81b40dda20ada3b5847353a866172b419c811.camel@linux.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Oct 2024, Niklas Schnelle wrote:

> > > +static __always_inline bool is_upf_fourport(struct uart_port *port)
> > > +{
> > > +	if (!IS_ENABLED(CONFIG_HAS_IOPORT))
> > > +		return false;
> > > +
> > > +	return port->flags & UPF_FOURPORT;
> > > +}
> > 
> >  Can we perhaps avoid adding this helper and then tweaking code throughout 
> > by having:
> > 
> > #ifdef CONFIG_SERIAL_8250_FOURPORT
> > #define UPF_FOURPORT		((__force upf_t) ASYNC_FOURPORT       /* 1  */ )
> > #else
> > #define UPF_FOURPORT		0
> > #endif
> > 
> > in include/linux/serial_core.h instead?  I can see the flag is reused by 
> > drivers/tty/serial/sunsu.c, but from a glance over it seems rubbish to me 
> > and such a change won't hurt the driver anyway.
> 
> I'll look at this, do you think this is okay regarding matching the
> user-space definitions in include/uapi/linux/tty_flags.h?

 With this change UAPI stays the same and setting ASYNC_FOURPORT (with 
`setserial', etc.) will just do nothing with non-port-I/O platforms, as 
expected.  Arguably being able to set it for any serial port and cause the 
driver to poke at random I/O locations is already asking for trouble, but 
that the price of legacy.

> > > @@ -1174,7 +1201,7 @@ static void autoconfig(struct uart_8250_port *up)
> > >  		 */
> > >  		scratch = serial_in(up, UART_IER);
> > >  		serial_out(up, UART_IER, 0);
> > > -#ifdef __i386__
> > > +#if defined(__i386__) && defined(CONFIG_HAS_IOPORT)
> > >  		outb(0xff, 0x080);
> > >  #endif
> > >  		/*
> > > @@ -1183,7 +1210,7 @@ static void autoconfig(struct uart_8250_port *up)
> > >  		 */
> > >  		scratch2 = serial_in(up, UART_IER) & UART_IER_ALL_INTR;
> > >  		serial_out(up, UART_IER, UART_IER_ALL_INTR);
> > > -#ifdef __i386__
> > > +#if defined(__i386__) && defined(CONFIG_HAS_IOPORT)
> > >  		outb(0, 0x080);
> > >  #endif
> > >  		scratch3 = serial_in(up, UART_IER) & UART_IER_ALL_INTR;
> > 
> >  Nah, i386 does have machine OUTB instructions, it has the port I/O 
> > address space in the ISA, so these two changes make no sense to me.  
> > 
> >  Though this #ifdef should likely be converted to CONFIG_X86_32 via a 
> > separate change.
> 
> This is needed for Usermode Linux (UM) which sets __i386__ but also
> doesn't have CONFIG_HAS_IOPORT. This was spotted by the kernel test bot
> here: https://lore.kernel.org/all/202410031712.BwfGjrQY-lkp@intel.com/

 Odd, but I'm not into UML so I need to accept your justification.  My 
reservation about relying on compiler's __i386__ predefine rather than our 
CONFIG_X86_32 setting still stands, but that's beyond the scope of your 
change (as is switching from `#if ...' to `if (...)').  Thanks for your 
attention to such details.

 NB these `outb' calls look to me remarkably like remains of `outb_p' and 
I wonder if they could be abstracted somehow.  For those who don't know: 
the port I/O location 0x80 in the IBM PC address space was reserved for 
use as a diagnostic port.  Despite being in the mainboard's address space 
its chip select line was left floating and one could obtain an ISA option 
card that decoded this location and showed data values written to it on a 
hex display.  As it was a location known to cause no side effect (beyond 
that optional hex display) it was commonly used to incur a small delay in 
execution.  It was also used by BIOS POST to indicate progress.

 I've skimmed over v8 and it seems good to go as far as I'm concerned.  
Any fallout can be dealt with on a case-by-case basis.  Thank you for 
working on these improvements.

  Maciej
