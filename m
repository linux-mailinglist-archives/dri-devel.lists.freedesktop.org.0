Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F774BC748
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A900010F66C;
	Sat, 19 Feb 2022 10:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 440E710EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:35:36 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.53 with ESMTP; 17 Feb 2022 19:35:34 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 17 Feb 2022 19:35:34 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: Re: Report in ata_scsi_port_error_handler()
Date: Thu, 17 Feb 2022 19:35:28 +0900
Message-Id: <1645094128-17099-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
References: <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<torvalds@linux-foundation.org> wrote:
> On Tue, Feb 15, 2022 at 10:37 PM Damien Le Moal
> <damien.lemoal@opensource.wdc.com> wrote:
> >
> > On 2/16/22 13:16, Byungchul Park wrote:
> > > [    2.051040 ] ===================================================
> > > [    2.051406 ] DEPT: Circular dependency has been detected.
> > > [    2.051730 ] 5.17.0-rc1-00014-gcf3441bb2012 #2 Tainted: G        W
> > > [    2.051991 ] ---------------------------------------------------
> > > [    2.051991 ] summary
> > > [    2.051991 ] ---------------------------------------------------
> > > [    2.051991 ] *** DEADLOCK ***
> > > [    2.051991 ]
> > > [    2.051991 ] context A
> > > [    2.051991 ]     [S] (unknown)(&(&ap->eh_wait_q)->dmap:0)
> > > [    2.051991 ]     [W] __raw_spin_lock_irq(&host->lock:0)
> > > [    2.051991 ]     [E] event(&(&ap->eh_wait_q)->dmap:0)
> > > [    2.051991 ]
> > > [    2.051991 ] context B
> > > [    2.051991 ]     [S] __raw_spin_lock_irqsave(&host->lock:0)
> > > [    2.051991 ]     [W] wait(&(&ap->eh_wait_q)->dmap:0)
> > > [    2.051991 ]     [E] spin_unlock(&host->lock:0)
> >
> > Sleeping with a spinlock held would be triggering warnings already, so
> > these reports seem bogus to me.
> 
> Yeah, Matthew pointed out the same thing for another use-case, where
> it looks like DEPT is looking at the state at the wrong point (not at
> the scheduling point, but at prepare_to_sleep()).
> 
> This ata_port_wait() is the exact same pattern, ie we have
> 
>	spin_lock_irqsave(ap->lock, flags);
> 
>	while (ap->pflags & (ATA_PFLAG_EH_PENDING | ATA_PFLAG_EH_IN_PROGRESS)) {
>		prepare_to_wait(&ap->eh_wait_q, &wait, TASK_UNINTERRUPTIBLE);
>		spin_unlock_irqrestore(ap->lock, flags);
>		schedule();
> 
> and DEPT has incorrectly taken it to mean that 'ap->lock' is held
> during the wait, when it is actually released before actually waiting.
> 
> For the spin-locks, this is all very obvious (because they'd have been
> caught long ago by much simpler debug code), but the same
> prepare_to_wait -> wait pattern can most definitely happen with
> sleeping locks too, so they are all slightly suspect.
> 
> And yes, the detailed reports are hard to read because the locations
> are given as "ata_port_wait_eh+0x52/0xc0". Running them through
> scripts/decode_stacktrace.sh to turn them into filename and line
> numbers - and also sort out inlining - would help a lot.
> 
> Byungchul, could you fix those two issues? Some of your reports may

Of couse, that's what I should do. Thanks for your feedback.

> well be entirely valid, but the hard-to-read hex offsets and the
> knowledge that at least some of them are confused about how
> prepare_to_wait -> wait actually works makes the motivation to look at
> the details much less..
> 
> 	Linus
