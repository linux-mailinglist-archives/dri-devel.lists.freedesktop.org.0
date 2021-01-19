Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0A2FBBCE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 17:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED5D89D4A;
	Tue, 19 Jan 2021 15:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757E38941E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CiCcK8kv/Yj149qFwcqQoyTY88+W1ZWU1NJwVOAOfc4=; b=DDjDNtz5vMzyzBRgKTPlpNMs0o
 wLMnHTJ5KOZriOQPORNhpLqDv4ZLqQUEWnin3+QBappbgTk8geOKPZ33x+YU6Rem7yLNFcWdVeCPR
 BV2x8XHjWL9qlleBptJLZXNqBUHf5J0cypVxnHfyEhsHiPKTVaXXE6Rnx7oO3DcxA6AkrthVIkIrW
 fnOWvAHr9HvsO32NH/NKRwl5WwZymW8cWDPn59LeOSHWCgqB31Ue7HuOfVBbuQt5vjIWBnE1Xhr2v
 SxdsG90FlEwSgWHfJPZKWepO6CKYpDoZbC6bUWop+mR51PbsEpHbJRWLSp/Y46/qmdAvUutG3DMQY
 0wEUp4cQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tQ8-0006qS-NQ; Tue, 19 Jan 2021 15:59:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B41F6300F7A;
 Tue, 19 Jan 2021 16:59:48 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8015820290D21; Tue, 19 Jan 2021 16:59:48 +0100 (CET)
Date: Tue, 19 Jan 2021 16:59:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v3
Message-ID: <YAcB9FY35hf2B3kQ@hirez.programming.kicks-ass.net>
References: <20210119114841.2003-1-christian.koenig@amd.com>
 <CAKMK7uGJE4BtEhT0KV+qiDdT+Q-a8nRyWafOzZ7bmDSdfnFLFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGJE4BtEhT0KV+qiDdT+Q-a8nRyWafOzZ7bmDSdfnFLFg@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 02:05:09PM +0100, Daniel Vetter wrote:

> > diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> > index b9e9adec73e8..6eb117c0d0f3 100644
> > --- a/include/linux/lockdep.h
> > +++ b/include/linux/lockdep.h
> > @@ -310,6 +310,10 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
> >                 WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));       \
> >         } while (0)
> >
> > +#define lockdep_assert_none_held_once()        do {                            \
> > +               WARN_ON_ONCE(debug_locks && current->lockdep_depth);    \
> > +       } while (0)
> > +
> >  #define lockdep_recursing(tsk) ((tsk)->lockdep_recursion)
> >
> >  #define lockdep_pin_lock(l)    lock_pin_lock(&(l)->dep_map)
> > @@ -387,6 +391,7 @@ extern int lockdep_is_held(const void *);
> >  #define lockdep_assert_held_write(l)   do { (void)(l); } while (0)
> >  #define lockdep_assert_held_read(l)            do { (void)(l); } while (0)
> >  #define lockdep_assert_held_once(l)            do { (void)(l); } while (0)
> > +#define lockdep_assert_none_held_once()        do { } while (0)
> >
> >  #define lockdep_recursing(tsk)                 (0)
> 
> ofc needs ack from Peter, but drm parts look all good to me.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
