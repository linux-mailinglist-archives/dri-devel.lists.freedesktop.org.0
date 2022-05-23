Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E133530703
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 03:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9F10E257;
	Mon, 23 May 2022 01:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B2F610E257
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 01:12:38 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.52 with ESMTP; 23 May 2022 10:12:36 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 23 May 2022 10:12:36 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Mon, 23 May 2022 10:10:45 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [REPORT] syscall reboot + umh + firmware fallback
Message-ID: <20220523011045.GA16721@X58A-UD3R>
References: <YnzQHWASAxsGL9HW@slm.duckdns.org>
 <1652354304-17492-1-git-send-email-byungchul.park@lge.com>
 <Yn0SHhnhB8fyd0jq@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yn0SHhnhB8fyd0jq@mit.edu>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, ngupta@vflare.org, johannes.berg@intel.com,
 jack@suse.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, rodrigosiqueiramelo@gmail.com, kernel-team@lge.com,
 gregkh@linuxfoundation.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 penberg@kernel.org, minchan@kernel.org, mcgrof@kernel.org, holt@sgi.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 09:56:46AM -0400, Theodore Ts'o wrote:
> On Thu, May 12, 2022 at 08:18:24PM +0900, Byungchul Park wrote:
> > I have a question about this one. Yes, it would never been stuck thanks
> > to timeout. However, IIUC, timeouts are not supposed to expire in normal
> > cases. So I thought a timeout expiration means not a normal case so need
> > to inform it in terms of dependency so as to prevent further expiraton.
> > That's why I have been trying to track even timeout'ed APIs.
> 
> As I beleive I've already pointed out to you previously in ext4 and
> ocfs2, the jbd2 timeout every five seconds happens **all** the time
> while the file system is mounted.  Commits more frequently than five
> seconds is the exception case, at least for desktops/laptop workloads.

Thanks, Ted. It's easy to stop tracking APIs with timeout. I've been
just afraid that the cases that we want to suppress anyway will be
skipped.

However, I should stop it if it produces too many false alarms.

> We *don't* get to the timeout only when a userspace process calls
> fsync(2), or if the journal was incorrectly sized by the system
> administrator so that it's too small, and the workload has so many
> file system mutations that we have to prematurely close the
> transaction ahead of the 5 second timeout.

Yeah... It's how journaling works. Thanks.

> > Do you think DEPT shouldn't track timeout APIs? If I was wrong, I
> > shouldn't track the timeout APIs any more.
> 
> DEPT tracking timeouts will cause false positives in at least some
> cases.  At the very least, there needs to be an easy way to suppress
> these false positives on a per wait/mutex/spinlock basis.

The easy way is to stop tracking those that are along with timeout until
DEPT starts to consider waits/events by timeout functionality itself.

Thanks.

	Byungchul
> 
>       	       	    	     	      	   	 - Ted
