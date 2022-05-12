Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441B524B6A
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2A110F138;
	Thu, 12 May 2022 11:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0ADE010F1A1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:20:04 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.52 with ESMTP; 12 May 2022 20:20:03 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 12 May 2022 20:20:03 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: tj@kernel.org
Subject: Re: [REPORT] syscall reboot + umh + firmware fallback
Date: Thu, 12 May 2022 20:18:24 +0900
Message-Id: <1652354304-17492-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <YnzQHWASAxsGL9HW@slm.duckdns.org>
References: <YnzQHWASAxsGL9HW@slm.duckdns.org>
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
 rostedt@goodmis.org, linux-block@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, mcgrof@kernel.org, holt@sgi.com, hannes@cmpxchg.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tejun wrote:
> Hello,

Hello,

> I'm not sure I'm reading it correctly but it looks like "process B" column

I think you're interpreting the report correctly.

> is superflous given that it's waiting on the same lock to do the same thing
> that A is already doing (besides, you can't really halt the machine twice).

Indeed! I've been in a daze. I thought kernel_halt() can be called twice
by two different purposes. Sorry for the noise.

> What it's reporting seems to be ABBA deadlock between A waiting on
> umhelper_sem and C waiting on fw_st->completion. The report seems spurious:
>
> 1. wait_for_completion_killable_timeout() doesn't need someone to wake it up
>    to make forward progress because it will unstick itself after timeout
>    expires.

I have a question about this one. Yes, it would never been stuck thanks
to timeout. However, IIUC, timeouts are not supposed to expire in normal
cases. So I thought a timeout expiration means not a normal case so need
to inform it in terms of dependency so as to prevent further expiraton.
That's why I have been trying to track even timeout'ed APIs.

Do you think DEPT shouldn't track timeout APIs? If I was wrong, I
shouldn't track the timeout APIs any more.

> 2. complete_all() from __fw_load_abort() isn't the only source of wakeup.
>    The fw loader can be, and mainly should be, woken up by firmware loading
>    actually completing instead of being aborted.

This is the point I'd like to ask. In normal cases, fw_load_done() might
happen, of course, if the loading gets completed. However, I was
wondering if the kernel ensures either fw_load_done() or fw_load_abort()
to be called by *another* context while kernel_halt().

> Thanks.

Thank you very much!

	Byungchul

> 
> -- 
> tejun
> 
