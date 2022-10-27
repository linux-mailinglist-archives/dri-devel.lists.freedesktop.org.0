Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD060F929
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886F710E63C;
	Thu, 27 Oct 2022 13:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B00110E63D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 13:35:26 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666877724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qUNnaSiTpnz8zitnV3znO1WDSOsrJ4JHkGUBNirU8e0=;
 b=HZYNVE0jgBeZDZOVHj4C7tlK31pHEp+SXTTvp39STk13iUrdwUHjJrlrCXHvFCpGXc3z2l
 hRvUlmvJRVpPsC5BwmbFW+S9u4cXXQzUxgxkmKmyJzZLys+51YXAP3x2YuDGBtIB6b49/p
 bXEJf8/vIKh/DZUYRYH3QflGEAudHc2pjG4s9qcZxdY14pwWa+XWPsXQPl4trs0U59t/Kq
 cJLCs3aEi1nh7zZZI7M4l90knFfp2TLdjBRfXQhQNbYF2GUkJg0UeDhqdkCHcBDQVuo25r
 YGzP5qFFP5joDEDs1sAaY7fP7OsQ/2qUbujdaR0huZcrLDPz+BlH0aYCShkbQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666877724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qUNnaSiTpnz8zitnV3znO1WDSOsrJ4JHkGUBNirU8e0=;
 b=K8svDYQnhUfwQTDx+8cl3c6kL/K6magEDxEws98VvnaxAhrM/pDkWdvd4JUu3Bnj6xHQOa
 g9lKHnKVwORNFTDQ==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v2 38/38] printk, xen: fbfront: create/use safe
 function for forcing preferred
In-Reply-To: <Y1qFHbi39SpTggPH@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-39-john.ogness@linutronix.de>
 <Y1qFHbi39SpTggPH@alley>
Date: Thu, 27 Oct 2022 15:41:23 +0206
Message-ID: <87v8o5crtw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juergen Gross <jgross@suse.com>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tom Rix <trix@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-27, Petr Mladek <pmladek@suse.com> wrote:
>> -	if (c) {
>> -		unregister_console(c);
>> -		c->flags |= CON_CONSDEV;
>> -		c->flags &= ~CON_PRINTBUFFER; /* don't print again */
>> -		register_console(c);
>> -	}
>> +	if (c)
>> +		console_force_preferred(c);
>
> I would prefer to fix this a clean way.
>
> [...]
>
> I would suggest to implement:
>
> [...]
>
> It is a more code. But it is race-free. Also it is much more clear
> what is going on.
>
> How does this sound, please?

I wasn't sure if any of the other preferred-console magic in
register_console() was needed, which is why I kept a full
register_console() call. But if it really is just about forcing it the
head and setting a new CON_CONSDEV, then your suggestion is much
simpler. Thanks.

John
