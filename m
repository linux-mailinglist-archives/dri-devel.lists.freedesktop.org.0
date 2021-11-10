Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF244BEF5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A865C6EBA1;
	Wed, 10 Nov 2021 10:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5322E6EBA1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:45:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE4A31FD3F;
 Wed, 10 Nov 2021 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1636541111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GUpTvZNhgXgXObp506QhXsYR81By+iDPFzAbaJOpy7E=;
 b=TnHZI7aCI7ViBAvgZ+UQC9O8UDlyQVUJBgV0QPZ0nOaVXq6ntU/j3fSteNuQoFjxEp4pqA
 sB7sLjxYQF6EqJg+SNCJbDVuQgSjEdwqUYMaWjVeLKGDZj1qhnwUo1wveJNtfIjldukL/C
 KQp3O7Wh6+WSEy66KMHjfi9VSa6x7u0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A92A13BEA;
 Wed, 10 Nov 2021 10:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JyhlGbeii2GhQAAAMHmgww
 (envelope-from <mkoutny@suse.com>); Wed, 10 Nov 2021 10:45:11 +0000
Date: Wed, 10 Nov 2021 11:45:10 +0100
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <20211110104510.GB20566@blackbody.suse.cz>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <CAKfTPtC_A-_sfQ+rm440oHwd2gUZ222FMwsi-JTkyLPc-x0qrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtC_A-_sfQ+rm440oHwd2gUZ222FMwsi-JTkyLPc-x0qrw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>, Anton Vorontsov <anton@enomsg.org>,
 David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 10:00:35AM +0100, Vincent Guittot <vincent.guittot@linaro.org> wrote:
> Is it the same SCHED_WARN_ON(rq->tmp_alone_branch !=
> &rq->leaf_cfs_rq_list); that generates the deadlock on v5.15 too ?
> 
> one remaining tmp_alone_branch warning has been fixed in v5.15 with
> 2630cde26711 ("sched/fair: Add ancestors of unthrottled undecayed cfs_rq")

AFAIK, the warning is typically triggered on v5.13 when CPU throttling is
employeed. The cfs_rq list is mis-ordered but it shouldn't be fatal.
But the throttling currently (since v5.13 too) also exposes a race on
task_group removal that can lead to corrupting the cfs_rq list (another
thread [1], I'll leave this thread for printk (non)-locking).

HTH,
Michal

[1] https://lore.kernel.org/r/20211011172236.11223-1-mkoutny@suse.com/
