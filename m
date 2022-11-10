Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E11624DAE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 23:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A45810E0A5;
	Thu, 10 Nov 2022 22:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5FB10E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 22:37:29 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668119847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2EsEvJhlAZZQPSn3pNUyWB9e4WUrObOqKYk/7OmMuc=;
 b=L0SMSt4q7jIhlzsoMg/xRFF+mS5mvQInBQrHnxfqgLft7IMQvdhT0dYdY7yePwM9Fv+G4C
 Jo7De6PJWh1b57zTUEvA/r0LIsHe+Ele14Jqom9ODT7aG/xmLKVcR6kEkUGj65//fEAUEn
 LU694e9AwzJ05OHi702f+znr9M7EsMbvzWj5bFjKIV8TV6mgQ7YRykr3ApF1NcKh2+ZLZR
 /Mme5fix7hlnZP8MTGD/Hc3n5tv9+dRIWuECLKRCUQYsHHRPQUysQApkyADc/Utz/ZXHBL
 oNUuV/8UY2GMEtRqZNNwfY5AAaqIXXvG0DR5T0VeSz3HrDewe4dlY+d0MJrS1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668119847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2EsEvJhlAZZQPSn3pNUyWB9e4WUrObOqKYk/7OmMuc=;
 b=cR6YDafDK7z9RudGpmOn+Lr/YsZxGTyyB4YVYSNXVaaNOgu+QC1ESLllubJrkI6jh2NdsI
 K/UxS8kYMw8BavCA==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v3 33/40] printk, xen: fbfront: create/use safe
 function for forcing preferred
In-Reply-To: <Y200WG6q4z0JGYBc@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-34-john.ogness@linutronix.de>
 <Y20aBwNWT19YDeib@alley> <877d026blr.fsf@jogness.linutronix.de>
 <Y200WG6q4z0JGYBc@alley>
Date: Thu, 10 Nov 2022 23:43:26 +0106
Message-ID: <87mt8ywi55.fsf@jogness.linutronix.de>
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

On 2022-11-10, Petr Mladek <pmladek@suse.com> wrote:
>>>> +	/* Only the new head can have CON_CONSDEV set. */
>>>> +	WRITE_ONCE(cur_pref_con->flags, cur_pref_con->flags & ~CON_CONSDEV);
>>>
>>> As mentioned in the reply for 7th patch, I would prefer to hide this
>>> WRITE_ONCE into a wrapper, e.g. console_set_flag(). It might also
>>> check that the console_list_lock is taken...
>> 
>> Agreed. For v4 it will become:
>> 
>> console_srcu_write_flags(cur_pref_con, cur_pref_con->flags & ~CON_CONSDEV);
>
> I am happy that your are going to introduce an API for this.
>
> Just to be sure. The _srcu_ in the name means that the write
> will use WRITE_ONCE() so that it can be read safely in SRCU
> context using READ_ONCE(). Do I get it correctly, please?

Yes.

> I expect that the counter part will be console_srcu_read_flags().
> I like the name. It is better than _unsafe_ that I proposed earlier.

Since the only flag that is ever checked in this way is CON_ENABLED, I
was planning on calling it console_srcu_is_enabled(). But I suppose I
could have it be: (console_srcu_read_flags() & CON_ENABLED). That would
keep it more abstract in case anyone should want to read other flag bits
under SRCU.

There are only 4 call sites that need this, so I suppose we don't need a
special _is_enabled() variant. Thanks for the suggestion!

John
