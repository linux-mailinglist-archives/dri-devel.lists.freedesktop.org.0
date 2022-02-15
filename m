Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46664B701D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785910E682;
	Tue, 15 Feb 2022 16:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 352 seconds by postgrey-1.36 at gabe;
 Tue, 15 Feb 2022 16:29:22 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A67C10E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:29:22 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644942208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGa3oCsCDm0R2QE32ynzHVQmQs9uQ3ubWMnYmBZfUtU=;
 b=b5AuXe/aARjeX5fjNLRuvi7BCXK1xKsBXXx8pqm9uDCmW1oSq4NPu2Ntr+cMDzooZojhRA
 Mo/BtgXQpJVQ4xvkZOhZXSZ4kA+0a/2BpGls+2efBUpHnpXJ//b4L16TynasJXnsckeJFy
 1Z/E7bVtGhTPRXYSY6TSOURJCrkCr64AE2r3nAbJ8e7/7xD91Kh7eLv8L4PD26V93M3IEL
 xRg4jafV0o8Jm+ZsJ73v37eC+81tcmET2Yo6NbJ642yyTY6W4m639aCIt4S3Sw5G3yk1zT
 J9auPgiRZwm4BbnAHxy926Ez1CsiEqwODQyEc5C/x5LbiecOT61lXAo/9tWdrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644942208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGa3oCsCDm0R2QE32ynzHVQmQs9uQ3ubWMnYmBZfUtU=;
 b=oDGLoR+EdHIqdeEfijeVg9bXDhKnweL8w/ARhGpB5nK6PhRveeKOU0KcdBtcxtWm4hbg4r
 nrsqpYR5X0nQP3AQ==
To: Sebastian Siewior <bigeasy@linutronix.de>, Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] drm: fb-helper: Avoid nesting spinlock_t into
 raw_spinlock_t
In-Reply-To: <YgvLdvPihuQ9KZ6/@linutronix.de>
References: <nycvar.YFH.7.76.2202151640200.11721@cbobk.fhfr.pm>
 <YgvLdvPihuQ9KZ6/@linutronix.de>
Date: Tue, 15 Feb 2022 17:29:27 +0106
Message-ID: <87o8382j5s.fsf@jogness.linutronix.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-15, Sebastian Siewior <bigeasy@linutronix.de> wrote:
>> From: Jiri Kosina <jkosina@suse.cz>
>> 
>> drm_fb_helper_damage() is acquiring spinlock_t (helper->damage_lock), 
>> while it can be called from contexts where raw_spinlock_t is held (e.g. 
>> console_owner lock obtained on vprintk_emit() codepath).
>> 
>> As the critical sections protected by damage_lock are super-tiny, let's 
>> fix this by converting it to raw_spinlock_t in order not to violate 
>> PREEMPT_RT-imposed lock nesting rules.
>> 
>> This fixes the splat below.
>> 
>>  =============================
>>  [ BUG: Invalid wait context ]
>>  5.17.0-rc4-00002-gd567f5db412e #1 Not tainted
>
> rc4. Is this also the case in the RT tree which includes John's printk
> changes?

In the RT tree, the fbcon's write() callback is only called in
preemptible() contexts. So this is only a mainline issue.

The series I recently posted to LKML [0] should also address this issue
(if/when it gets accepted).

John

[0] https://lore.kernel.org/lkml/20220207194323.273637-1-john.ogness@linutronix.de
