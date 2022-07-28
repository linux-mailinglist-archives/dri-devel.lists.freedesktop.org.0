Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CE5841E0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAA310E4F6;
	Thu, 28 Jul 2022 14:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE0710F259
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:38:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04670B8247E;
 Thu, 28 Jul 2022 14:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2780FC433C1;
 Thu, 28 Jul 2022 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659019115;
 bh=T0SHuXwms0ULhNSk06npqRzjCyjBqf+WMkcyXOh3mVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tuZDhK2NfIRhsiGsc3OHq9E6APLfmz1ZzviYgdVlFZyC/0qnjX4D+3cSnhMBRDTp/
 wf5uKznxn7htR92pkdg7knCkxP9XNNayz9JN/DK3r4/UWNaGNnC+wB6tPHeMLsWWyc
 wyYxly+6SmnXdxNg9LBc56Hl3Q+lHMH/HtUSJwp8=
Date: Thu, 28 Jul 2022 16:38:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markuss Broks <markuss.broks@gmail.com>
Subject: Re: [PATCH 1/2] drivers: serial: earlycon: Pass device-tree node
Message-ID: <YuKfaVG/ZbYtFjS/@kroah.com>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-2-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728142824.3836-2-markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Wei Ming Chen <jj251510319013@gmail.com>,
 phone-devel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 05:28:18PM +0300, Markuss Broks wrote:
> Pass a pointer to device-tree node in case the driver probed from
> OF. This makes early console drivers able to fetch options from
> device-tree node properties.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  drivers/tty/serial/earlycon.c | 3 +++
>  include/linux/serial_core.h   | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
> index 57c70851f22a0e78805f34d1a7700708104b6f6a..14e8a7fe54486a1c377a6659c37a73858de5bf0b 100644
> --- a/drivers/tty/serial/earlycon.c
> +++ b/drivers/tty/serial/earlycon.c
> @@ -304,6 +304,9 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
>  		strlcpy(early_console_dev.options, options,
>  			sizeof(early_console_dev.options));
>  	}
> +
> +	early_console_dev.node = node;
> +
>  	earlycon_init(&early_console_dev, match->name);
>  	err = match->setup(&early_console_dev, options);
>  	earlycon_print_info(&early_console_dev);
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index cbd5070bc87f42aa450c4ca7af8a9b59fbe88574..3295721f33e482124fae8370b5889d5d6c012303 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -349,6 +349,7 @@ struct earlycon_device {
>  	struct uart_port port;
>  	char options[16];		/* e.g., 115200n8 */
>  	unsigned int baud;
> +	unsigned long node;

That should not be an unsigned long, but rather an 'int'.  Something got
messed up, of_setup_earlycon() should be changed to reflect this before
propagating the error to other places in the kernel.

And it's not really a "node" but an "offset", right?

thanks,

greg k-h
