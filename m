Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E569938D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 23:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9F310E427;
	Mon,  7 Oct 2024 21:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 421 seconds by postgrey-1.36 at gabe;
 Mon, 07 Oct 2024 21:16:19 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1452810E427;
 Mon,  7 Oct 2024 21:16:19 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id B37EC92009C; Mon,  7 Oct 2024 23:09:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id A591592009B;
 Mon,  7 Oct 2024 22:09:15 +0100 (BST)
Date: Mon, 7 Oct 2024 22:09:15 +0100 (BST)
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
In-Reply-To: <20241007-b4-has_ioport-v6-4-03f7240da6e5@linux.ibm.com>
Message-ID: <alpine.DEB.2.21.2410072109130.30973@angie.orcam.me.uk>
References: <20241007-b4-has_ioport-v6-0-03f7240da6e5@linux.ibm.com>
 <20241007-b4-has_ioport-v6-4-03f7240da6e5@linux.ibm.com>
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

On Mon, 7 Oct 2024, Niklas Schnelle wrote:

> diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
> index 6709b6a5f3011db38acc58dc7223158fe4fcf72e..6a638feb44e443a1998980dd037748f227ec1bc8 100644
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
[...]
>  	iobase = pci_resource_start(dev, 0);
>  	outb(0x0, iobase + CH384_XINT_ENABLE_REG);
>  }
>  
> -
>  static int
>  pci_sunix_setup(struct serial_private *priv,
>  		const struct pciserial_board *board,

 Gratuitous change here.

> diff --git a/drivers/tty/serial/8250/8250_pcilib.c b/drivers/tty/serial/8250/8250_pcilib.c
> index ea906d721b2c3eac15c9e8d62cc6fa56c3ef6150..fc1882d7515b5814ff1240ffdbe1009ab908ad6b 100644
> --- a/drivers/tty/serial/8250/8250_pcilib.c
> +++ b/drivers/tty/serial/8250/8250_pcilib.c
> @@ -28,6 +28,10 @@ int serial8250_pci_setup_port(struct pci_dev *dev, struct uart_8250_port *port,
>  		port->port.membase = pcim_iomap_table(dev)[bar] + offset;
>  		port->port.regshift = regshift;
>  	} else {
> +		if (!IS_ENABLED(CONFIG_HAS_IOPORT)) {
> +			pr_err("Serial port %lx requires I/O port support\n", port->port.iobase);
> +			return -EINVAL;
> +		}
>  		port->port.iotype = UPIO_PORT;
>  		port->port.iobase = pci_resource_start(dev, bar) + offset;
>  		port->port.mapbase = 0;

 Can we please flatten this conditional and get rid of the negation, and 
also use `pci_err' for clear identification (`port->port.iobase' may not 
even have been set to anything meaningful if this triggers)?  I.e.:

		/* ... */
	} else if (IS_ENABLED(CONFIG_HAS_IOPORT)) {
		/* ... */
	} else {
		pci_err(dev, "serial port requires I/O port support\n");
		return -EINVAL;
	}

I'd also say "port I/O" (by analogy to "memory-mapped I/O") rather than 
"I/O port", but I can imagine it might be debatable.

> +static __always_inline bool is_upf_fourport(struct uart_port *port)
> +{
> +	if (!IS_ENABLED(CONFIG_HAS_IOPORT))
> +		return false;
> +
> +	return port->flags & UPF_FOURPORT;
> +}

 Can we perhaps avoid adding this helper and then tweaking code throughout 
by having:

#ifdef CONFIG_SERIAL_8250_FOURPORT
#define UPF_FOURPORT		((__force upf_t) ASYNC_FOURPORT       /* 1  */ )
#else
#define UPF_FOURPORT		0
#endif

in include/linux/serial_core.h instead?  I can see the flag is reused by 
drivers/tty/serial/sunsu.c, but from a glance over it seems rubbish to me 
and such a change won't hurt the driver anyway.

> @@ -1174,7 +1201,7 @@ static void autoconfig(struct uart_8250_port *up)
>  		 */
>  		scratch = serial_in(up, UART_IER);
>  		serial_out(up, UART_IER, 0);
> -#ifdef __i386__
> +#if defined(__i386__) && defined(CONFIG_HAS_IOPORT)
>  		outb(0xff, 0x080);
>  #endif
>  		/*
> @@ -1183,7 +1210,7 @@ static void autoconfig(struct uart_8250_port *up)
>  		 */
>  		scratch2 = serial_in(up, UART_IER) & UART_IER_ALL_INTR;
>  		serial_out(up, UART_IER, UART_IER_ALL_INTR);
> -#ifdef __i386__
> +#if defined(__i386__) && defined(CONFIG_HAS_IOPORT)
>  		outb(0, 0x080);
>  #endif
>  		scratch3 = serial_in(up, UART_IER) & UART_IER_ALL_INTR;

 Nah, i386 does have machine OUTB instructions, it has the port I/O 
address space in the ISA, so these two changes make no sense to me.  

 Though this #ifdef should likely be converted to CONFIG_X86_32 via a 
separate change.

> @@ -1306,12 +1333,12 @@ static void autoconfig_irq(struct uart_8250_port *up)
>  {
>  	struct uart_port *port = &up->port;
>  	unsigned char save_mcr, save_ier;
> +	unsigned long irqs;
>  	unsigned char save_ICP = 0;
>  	unsigned int ICP = 0;
> -	unsigned long irqs;
>  	int irq;

 Gratuitous change here (also breaking the reverse Christmas tree order).

 Thanks for making the clean-ups we discussed.

  Maciej
