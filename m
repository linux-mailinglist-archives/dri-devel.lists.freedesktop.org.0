Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB36619282
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 09:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE2C10E04F;
	Fri,  4 Nov 2022 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Fri, 04 Nov 2022 08:13:03 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B29110E703
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 08:13:03 +0000 (UTC)
Received: from letrec.thunk.org (guestnat-104-133-8-97.corp.google.com
 [104.133.8.97] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2A484Ibc021298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Nov 2022 04:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1667549066; bh=moS+CuyFo/iNk12/7L0jlf5OeXKrD4AexiQVcA1f9j8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=pmjf6GL7YT4m13zzwJ8ZziTP9QSE6xD7N4SKabyPsGs9ErEmKoNGQLYrvajnTDcIl
 6xkfPsdloqBuVLMA+usmt6Z8+OGqd+nqTTW8rH1XQO3dgQl7Wc4cmrKcYGspyVEGr3
 VKCzxltipZvI0eKo/bquNP7a8KUkyH2cvtNZAEZ5Vxp/zD+KiK1WdTIhMzTvolj9d7
 tByGRQP7kkWdxpABu3J86iGrT7QrRxDTaDFkHH2om1kHrku2eGhzuvOHImulvxujF7
 qeOaBdGpP8uHr3x0hOkrniax7ZvQEHLZ16xcjKpWwy1uUoBwo0TuML+PK7IG4rkylq
 O+5DneNdid76A==
Received: by letrec.thunk.org (Postfix, from userid 15806)
 id AFB0F8C0031; Fri,  4 Nov 2022 04:04:17 -0400 (EDT)
Date: Fri, 4 Nov 2022 04:04:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [QUESTION] {start,stop}_this_handle() and lockdep annotations
Message-ID: <Y2THgc9xgnUJg0Io@mit.edu>
References: <1667541392-16270-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1667541392-16270-1-git-send-email-byungchul.park@lge.com>
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
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, chris.p.wilson@intel.com,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note: in the future, I'd recommend looking at the MAINTAINERS to
figure out a smaller list of people to ask this question, instead of
spamming everyone who has ever expressed interest in DEPT.


On Fri, Nov 04, 2022 at 02:56:32PM +0900, Byungchul Park wrote:
> Peterz (commit 34a3d1e8370870 lockdep: annotate journal_start()) and
> the commit message quoted what Andrew Morton said. It was like:
> 
> > Except lockdep doesn't know about journal_start(), which has ranking
> > requirements similar to a semaphore.
> 
> Could anyone tell what the ranking requirements in the journal code
> exactly means and what makes {start,stop}_this_handle() work for the
> requirements?

The comment from include/linux/jbd2.h may be helpful:

#ifdef CONFIG_DEBUG_LOCK_ALLOC
	/**
	 * @j_trans_commit_map:
	 *
	 * Lockdep entity to track transaction commit dependencies. Handles
	 * hold this "lock" for read, when we wait for commit, we acquire the
	 * "lock" for writing. This matches the properties of jbd2 journalling
	 * where the running transaction has to wait for all handles to be
	 * dropped to commit that transaction and also acquiring a handle may
	 * require transaction commit to finish.
	 */
	struct lockdep_map	j_trans_commit_map;
#endif

And the reason why this isn't a problem is because start_this_handle()
can be passed a special handle which is guaranteed to not block
(because we've reserved journal credits for it).  Hence, there is no
risk that in _this_ call path start_this_handle() will block for a
commit:

> <4>[   43.124442 ] stacktrace:
> <4>[   43.124443 ]       start_this_handle+0x557/0x620
> <4>[   43.124445 ]       jbd2_journal_start_reserved+0x4d/0x1b0
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> <4>[   43.124448 ]       __ext4_journal_start_reserved+0x6d/0x190
> <4>[   43.124450 ]       ext4_convert_unwritten_io_end_vec+0x22/0xd0
> <4>[   43.124453 ]       ext4_end_io_rsv_work+0xe4/0x190
> <4>[   43.124455 ]       process_one_work+0x301/0x660
> <4>[   43.124458 ]       worker_thread+0x3a/0x3c0
> <4>[   43.124459 ]       kthread+0xef/0x120
> <4>[   43.124462 ]       ret_from_fork+0x22/0x30


The comment for this function from fs/jbd2/transaction.c:

/**
 * jbd2_journal_start_reserved() - start reserved handle
 * @handle: handle to start
 * @type: for handle statistics
 * @line_no: for handle statistics
 *
 * Start handle that has been previously reserved with jbd2_journal_reserve().
 * This attaches @handle to the running transaction (or creates one if there's
 * not transaction running). Unlike jbd2_journal_start() this function cannot
 * block on journal commit, checkpointing, or similar stuff. It can block on
 * memory allocation or frozen journal though.
 *
 * Return 0 on success, non-zero on error - handle is freed in that case.
 */

And this is why this will never be a problem in real life, or flagged
by Lockdep, since Lockdep is a dynamic checker.  The deadlock which
the static DEPT checker has imagined can never, ever, ever happen.

For more context, also from fs/jbd2/transaction.c:

/**
 * jbd2_journal_start() - Obtain a new handle.
 * @journal: Journal to start transaction on.
 * @nblocks: number of block buffer we might modify
 *
 * We make sure that the transaction can guarantee at least nblocks of
 * modified buffers in the log.  We block until the log can guarantee
 * that much space. Additionally, if rsv_blocks > 0, we also create another
 * handle with rsv_blocks reserved blocks in the journal. This handle is
 * stored in h_rsv_handle. It is not attached to any particular transaction
 * and thus doesn't block transaction commit. If the caller uses this reserved
 * handle, it has to set h_rsv_handle to NULL as otherwise jbd2_journal_stop()
 * on the parent handle will dispose the reserved one. Reserved handle has to
 * be converted to a normal handle using jbd2_journal_start_reserved() before
 * it can be used.
 *
 * Return a pointer to a newly allocated handle, or an ERR_PTR() value
 * on failure.
 */

To be clear, I don't blame DEPT for not being able to figure this out;
it would require human-level intelligence to understand why in *this*
call path, we never end up waiting.  But this is why I am very
skeptical of static analyzers which are *sure* that anything they flag
is definitely a bug.  We definitely will need a quick and easy way to
tell DEPT, "go home, you're drunk".

Hope this helps,

					- Ted


P.S.  Note: the actual function names are a bit misleading.  It looks
like the functions got refactored, and the documentation wasn't
updated to match.  Sigh... fortuantely the concepts are accurate; it's
just that function names needs to be fixed up.  For example, creating
a reserved handle is no longer done via jbd2_journal_start(), but
rather jbd2__journal_start().  

