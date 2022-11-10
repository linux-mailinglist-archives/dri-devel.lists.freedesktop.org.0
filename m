Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6890624688
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636410E168;
	Thu, 10 Nov 2022 16:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3E910E155
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:03:16 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668096193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2ekXh2GYs190EffPperJZ/U7GEy4Ue5lLOHn3cnsTY=;
 b=D1AzsMAdXVSDzz5kJrt9f713AtZ5rwnGbtn8uOef0JjHAAhBhyzEyiDq1I4hJFtlHwHh7m
 GX7kiyvgZ3PjN+ftd7LtrFABw4GFID9mZN+agIDdaqey1U4NW5RLby7bOch02j8RPrSQtP
 KTqpF0M+gkCE7sCeHQTPScGxCAPJKuWP/T2Xxk9rVHONfbgP9UaFMP37fW/W0INgYEmOYx
 0MR6EQms1qzi0t7s4cUwMnj75aA6oMqWPYYwkFXWQ2lSLfxYtxcfXX3CB4j1rGNpUxmnOM
 +5J1Oi3XlYw6P51/QXLvftS8uzOWlMfNROslqy9yksaFLsFqyScc1+JGHlVleA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668096193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2ekXh2GYs190EffPperJZ/U7GEy4Ue5lLOHn3cnsTY=;
 b=UIWSEc3uFNBtJFNIDDChRw/avEosrXGr8wJbKqiOCuw8HBJGUZix7GKEv6AtQEYcN/OaQw
 EMckQVr9OCZKoJDg==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v3 33/40] printk, xen: fbfront: create/use safe
 function for forcing preferred
In-Reply-To: <Y20aBwNWT19YDeib@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-34-john.ogness@linutronix.de>
 <Y20aBwNWT19YDeib@alley>
Date: Thu, 10 Nov 2022 17:09:12 +0106
Message-ID: <877d026blr.fsf@jogness.linutronix.de>
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
>> +void console_force_preferred_locked(struct console *con)
>> +{
>> +	struct console *cur_pref_con;
>> +
>> +	if (!console_is_registered_locked(con))
>> +		return;
>> +
>> +	cur_pref_con = console_first();
>> +
>> +	/* Already preferred? */
>> +	if (cur_pref_con == con)
>> +		return;
>> +
>> +	hlist_del_init_rcu(&con->node);
>
> We actually should re-initialize the node only after all existing
> console list walks are finished. Se we should use here:
>
> 	hlist_del_rcu(&con->node);

hlist_del_init_rcu() only re-initializes @pprev pointer. But maybe you
are concerned that there is a window where list_unhashed() becomes true?
I agree that it should be changed to hlist_del_rcu() because there
should not be a window where this console appears unregistered.

>> +	/* Only the new head can have CON_CONSDEV set. */
>> +	WRITE_ONCE(cur_pref_con->flags, cur_pref_con->flags & ~CON_CONSDEV);
>
> As mentioned in the reply for 7th patch, I would prefer to hide this
> WRITE_ONCE into a wrapper, e.g. console_set_flag(). It might also
> check that the console_list_lock is taken...

Agreed. For v4 it will become:

console_srcu_write_flags(cur_pref_con->flags & ~CON_CONSDEV);

John
