Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4530D4DF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FA56EA09;
	Wed,  3 Feb 2021 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Tue, 02 Feb 2021 08:45:41 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6826E8F0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:45:41 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612255104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XSvnQS472UFc97/OveAYELQREPOxJl2PjuSTa4E+Q7A=;
 b=fOwUz6oMsJL1OT+8YKgVu8YLiGerlC6aoRGuk2gj3WQtUgU8QXSFpJ09U58JpJZXEehe+m
 Qvm+Z3XThUOMXKRyBZB7+bDjUhB+oW1k9PjhHBvhXxRvpDI/pEj0dFjalO7cXIZ6/LmAmw
 AkIet2SuXwlUKmVKo6LYhbu3DnbqfcXWFnkeq13yZS8SZs/yNjBFd+tbOJ43wrJQMUIO4V
 V5ZdDZeEV1oaO/ZC+FkkcD5CvM9I9f9RZUMxvlOWWq7jLpmML8ghyP0xcXUniwX4RVQVj4
 j9+Q4MQbZrSxNHrqAt2SHlSB53aNx+8ux1oL3D+TPkMNegsaWy31lKKV3ki2GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612255104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XSvnQS472UFc97/OveAYELQREPOxJl2PjuSTa4E+Q7A=;
 b=OPu2XNNKWOUcpfxtFJWAMYFL7d6qcjsZokIJEMUiNGj0vWq2dCutTDGvIHWGet1UOF9hx3
 9T+b4TtHpCZ3cXDw==
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/3] printk: use CONFIG_CONSOLE_LOGLEVEL_* directly
In-Reply-To: <20210202070218.856847-1-masahiroy@kernel.org>
References: <20210202070218.856847-1-masahiroy@kernel.org>
Date: Tue, 02 Feb 2021 09:44:22 +0106
Message-ID: <87eehy27b5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, linux-fbdev@vger.kernel.org,
 linux-efi@vger.kernel.org, Russ Anderson <russ.anderson@hpe.com>,
 Steve Wahl <steve.wahl@hpe.com>, Mike Travis <mike.travis@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Peter Jones <pjones@redhat.com>,
 x86@kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-02, Masahiro Yamada <masahiroy@kernel.org> wrote:
> CONSOLE_LOGLEVEL_DEFAULT is nothing more than a shorthand of
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT.
>
> When you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT from Kconfig, almost
> all objects are rebuilt because CONFIG_CONSOLE_LOGLEVEL_DEFAULT is
> used in <linux/printk.h>, which is included from most of source files.
>
> In fact, there are only 4 users of CONSOLE_LOGLEVEL_DEFAULT:
>
>   arch/x86/platform/uv/uv_nmi.c
>   drivers/firmware/efi/libstub/efi-stub-helper.c
>   drivers/tty/sysrq.c
>   kernel/printk/printk.c
>
> So, when you change CONFIG_CONSOLE_LOGLEVEL_DEFAULT and rebuild the
> kernel, it is enough to recompile those 4 files.
>
> Remove the CONSOLE_LOGLEVEL_DEFAULT definition from <linux/printk.h>,
> and use CONFIG_CONSOLE_LOGLEVEL_DEFAULT directly.

With commit a8fe19ebfbfd ("kernel/printk: use symbolic defines for
console loglevels") it can be seen that various drivers used to
hard-code their own values. The introduction of the macros in an
intuitive location (include/linux/printk.h) made it easier for authors
to find/use the various available printk settings and thresholds.

Technically there is no problem using Kconfig macros directly. But will
authors bother to hunt down available Kconfig settings? Or will they
only look in printk.h to see what is available?

IMHO if code wants to use settings from a foreign subsystem, it should
be taking those from headers of that subsystem, rather than using some
Kconfig settings from that subsystem. Headers exist to make information
available to external code. Kconfig (particularly for a subsystem) exist
to configure that subsystem.

But my feeling on this may be misguided. Is it generally accepted in the
kernel that any code can use Kconfig settings of any other code?

John Ogness
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
