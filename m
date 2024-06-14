Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79AB908A91
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 12:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801D210ECEF;
	Fri, 14 Jun 2024 10:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A255C10ECEF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 10:57:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E3A761D4B;
 Fri, 14 Jun 2024 10:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C86C2BD10;
 Fri, 14 Jun 2024 10:57:23 +0000 (UTC)
Date: Fri, 14 Jun 2024 11:57:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 06/10] mm/kmemleak: Replace strncpy() with
 __get_task_comm()
Message-ID: <ZmwiEbCcovJ8fdr5@arm.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
 <20240613023044.45873-7-laoar.shao@gmail.com>
 <Zmqvu-1eUpdZ39PD@arm.com>
 <CALOAHbB3Uiwsp2ieiPZ-_CKyZPgW6_gF_y-HEGHN3KWhGh0LDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbB3Uiwsp2ieiPZ-_CKyZPgW6_gF_y-HEGHN3KWhGh0LDg@mail.gmail.com>
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

On Thu, Jun 13, 2024 at 08:10:17PM +0800, Yafang Shao wrote:
> On Thu, Jun 13, 2024 at 4:37 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Thu, Jun 13, 2024 at 10:30:40AM +0800, Yafang Shao wrote:
> > > Using __get_task_comm() to read the task comm ensures that the name is
> > > always NUL-terminated, regardless of the source string. This approach also
> > > facilitates future extensions to the task comm.
> > >
> > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > ---
> > >  mm/kmemleak.c | 8 +-------
> > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > >
> > > diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> > > index d5b6fba44fc9..ef29aaab88a0 100644
> > > --- a/mm/kmemleak.c
> > > +++ b/mm/kmemleak.c
> > > @@ -663,13 +663,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
> > >               strncpy(object->comm, "softirq", sizeof(object->comm));
> > >       } else {
> > >               object->pid = current->pid;
> > > -             /*
> > > -              * There is a small chance of a race with set_task_comm(),
> > > -              * however using get_task_comm() here may cause locking
> > > -              * dependency issues with current->alloc_lock. In the worst
> > > -              * case, the command line is not correct.
> > > -              */
> > > -             strncpy(object->comm, current->comm, sizeof(object->comm));
> > > +             __get_task_comm(object->comm, sizeof(object->comm), current);
> > >       }
> >
> > You deleted the comment stating why it does not use get_task_comm()
> > without explaining why it would be safe now. I don't recall the details
> > but most likely lockdep warned of some potential deadlocks with this
> > function being called with the task_lock held.
> >
> > So, you either show why this is safe or just use strscpy() directly here
> > (not sure we'd need strscpy_pad(); I think strscpy() would do, we just
> > need the NUL-termination).
> 
> The task_lock was dropped in patch #1 [0]. My apologies for not
> including you in the CC for that change. After this modification, it
> is now safe to use __get_task_comm().
> 
> [0] https://lore.kernel.org/all/20240613023044.45873-2-laoar.shao@gmail.com/

Ah, great. For this patch:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

You may want to add a comment in the commit log that since
__get_task_comm() no longer takes a long, it's safe to call it from
kmemleak.

-- 
Catalin
