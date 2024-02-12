Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5118517C3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B37E10E151;
	Mon, 12 Feb 2024 15:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="X5naKi5g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wvaAtq9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FFC10E151
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 15:16:46 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1707751001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C0+9xXf1xmlpe5oi4tOOoKsJ9pZFh5ERW9flQIZRs88=;
 b=X5naKi5gLpvZkYPThLTAQgcrOgmy7YnG179d5g9Zp0omwvh7aQLVvP0+Rlpn18mGTFxMVS
 jb2OZM69peAkDCL3yF1jhi9jdM6PGkhHzdqiyNkma8rajbUwpx+HZjDXUlKVpumyENxaZ2
 LPo4BLCgiNACH4nQjgU9UuW+MEmyXZH1whNpAhisf6WmczXagVYIkUzTeheK86QtZWf9U6
 3XJjiQDuJAWk7KCjGTytUpoi1cc/0Ph1Fc7WGqbAhlZSwzb/k+buVyjqd2knVFJJqEtp9Y
 Fj381DdX3HHi1MwyJ1buO9ZUt/ECWBEkvtQedGK44DUkGfRizsz9fRj14/9l8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1707751001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C0+9xXf1xmlpe5oi4tOOoKsJ9pZFh5ERW9flQIZRs88=;
 b=wvaAtq9gXWu+gOMPiuUPNIHogxDOFBTHTovmSRErtvucLMRbKc+sW6mcVW7KPtOAn9Jr0c
 FJrzz2lzCTOfMLBw==
To: Byungchul Park <byungchul@sk.com>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 will@kernel.org, rostedt@goodmis.org, joel@joelfernandes.org,
 sashal@kernel.org, daniel.vetter@ffwll.ch, duyuyang@gmail.com,
 johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
 willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
 gregkh@linuxfoundation.org, kernel-team@lge.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, mhocko@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, vdavydov.dev@gmail.com, sj@kernel.org,
 jglisse@redhat.com, dennis@kernel.org, cl@linux.com, penberg@kernel.org,
 rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com, chris.p.wilson@intel.com,
 gwan-gyeong.mun@intel.com, max.byungchul.park@gmail.com,
 boqun.feng@gmail.com, longman@redhat.com, hdanton@sina.com,
 her0gyugyu@gmail.com
Subject: Re: [PATCH v11 14/26] locking/lockdep, cpu/hotplus: Use a weaker
 annotation in AP thread
In-Reply-To: <20240130025836.GA49173@system.software.com>
References: <20240124115938.80132-1-byungchul@sk.com>
 <20240124115938.80132-15-byungchul@sk.com> <87il3ggfz9.ffs@tglx>
 <20240130025836.GA49173@system.software.com>
Date: Mon, 12 Feb 2024 16:16:41 +0100
Message-ID: <871q9hlnl2.ffs@tglx>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30 2024 at 11:58, Byungchul Park wrote:
> On Fri, Jan 26, 2024 at 06:30:02PM +0100, Thomas Gleixner wrote:
>> On Wed, Jan 24 2024 at 20:59, Byungchul Park wrote:
>> 
>> Why is lockdep in the subsystem prefix here? You are changing the CPU
>> hotplug (not hotplus) code, right?
>> 
>> > cb92173d1f0 ("locking/lockdep, cpu/hotplug: Annotate AP thread") was
>> > introduced to make lockdep_assert_cpus_held() work in AP thread.
>> >
>> > However, the annotation is too strong for that purpose. We don't have to
>> > use more than try lock annotation for that.
>> 
>> This lacks a proper explanation why this is too strong.
>> 
>> > Furthermore, now that Dept was introduced, false positive alarms was
>> > reported by that. Replaced it with try lock annotation.
>> 
>> I still have zero idea what this is about.
>
> 1. can track PG_locked that is a potential deadlock trigger.
>
>    https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/

Sure, but that wants to be explicitely explained in the changelog and
not with a link. 'Now that Dept was introduced ...' is not an
explanation.

Thanks,

        tglx


