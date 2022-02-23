Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3894C06F8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA9610E421;
	Wed, 23 Feb 2022 01:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F40710E421
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 01:40:58 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.52 with ESMTP; 23 Feb 2022 10:40:56 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.126 with ESMTP; 23 Feb 2022 10:40:56 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Wed, 23 Feb 2022 10:40:44 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: Report 1 in ext4 and journal based on v5.17-rc1
Message-ID: <20220223014044.GB26277@X58A-UD3R>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
 <20220222082723.rddf4typah3wegrc@quack3.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222082723.rddf4typah3wegrc@quack3.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: hamohammed.sa@gmail.com, peterz@infradead.org, daniel.vetter@ffwll.ch,
 amir73il@gmail.com, david@fromorbit.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, bfields@fieldses.org, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, joel@joelfernandes.org, cl@linux.com,
 will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
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
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 09:27:23AM +0100, Jan Kara wrote:
> On Thu 17-02-22 20:10:03, Byungchul Park wrote:
> > [    7.009608] ===================================================
> > [    7.009613] DEPT: Circular dependency has been detected.
> > [    7.009614] 5.17.0-rc1-00014-g8a599299c0cb-dirty #30 Tainted: G        W
> > [    7.009616] ---------------------------------------------------
> > [    7.009617] summary
> > [    7.009618] ---------------------------------------------------
> > [    7.009618] *** DEADLOCK ***
> > [    7.009618]
> > [    7.009619] context A
> > [    7.009619]     [S] (unknown)(&(bit_wait_table + i)->dmap:0)
> > [    7.009621]     [W] down_write(&ei->i_data_sem:0)
> > [    7.009623]     [E] event(&(bit_wait_table + i)->dmap:0)
> > [    7.009624]
> > [    7.009625] context B
> > [    7.009625]     [S] down_read(&ei->i_data_sem:0)
> > [    7.009626]     [W] wait(&(bit_wait_table + i)->dmap:0)
> > [    7.009627]     [E] up_read(&ei->i_data_sem:0)
> > [    7.009628]
> 
> Looking into this I have noticed that Dept here tracks bitlocks (buffer
> locks in particular) but it apparently treats locks on all buffers as one
> locking class so it conflates lock on superblock buffer with a lock on
> extent tree block buffer. These are wastly different locks with different
> locking constraints. So to avoid false positives in filesystems we will
> need to add annotations to differentiate locks on different buffers (based
> on what the block is used for). Similarly how we e.g. annotate i_rwsem for

Exactly yes. All synchronization objects should be classfied by what it
is used for. Even though it's already classified by the location of the
code initializing the object - roughly and normally saying we can expect
those have the same constraint, we are actually assigning different
constraints according to the subtle design esp. in file systems.

It would also help the code have better documentation ;-) I'm willing to
add annotations for that to fs.

> different inodes.
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
