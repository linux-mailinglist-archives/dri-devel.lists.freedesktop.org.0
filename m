Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508A23A964
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 17:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75AB89FFD;
	Mon,  3 Aug 2020 15:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1423E89FFD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 15:32:42 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8611720678;
 Mon,  3 Aug 2020 15:32:39 +0000 (UTC)
Date: Mon, 3 Aug 2020 11:32:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200803113239.194eb86f@oasis.local.home>
In-Reply-To: <20200803144719.3184138-3-kaleshsingh@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-doc@vger.kernel.org, kernel-team@android.com,
 Jonathan Corbet <corbet@lwn.net>, Ioannis Ilkos <ilkos@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 Ingo Molnar <mingo@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  3 Aug 2020 14:47:19 +0000
Kalesh Singh <kaleshsingh@google.com> wrote:

> +DECLARE_EVENT_CLASS(dma_buf_ref_template,
> +
> +	TP_PROTO(struct task_struct *task, struct file *filp),
> +
> +	TP_ARGS(task,  filp),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, tgid)
> +		__field(u32, pid)

I only see "current" passed in as "task". Why are you recording the pid
and tgid as these are available by the tracing infrastructure.

At least the pid is saved at every event. You can see the tgid when
enabling the "record_tgid".

 # trace-cmd start -e all -O record_tgid
 # trace-cmd show

# tracer: nop
#
# entries-in-buffer/entries-written: 39750/39750   #P:8
#
#                                      _-----=> irqs-off
#                                     / _----=> need-resched
#                                    | / _---=> hardirq/softirq
#                                    || / _--=> preempt-depth
#                                    ||| /     delay
#           TASK-PID    TGID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |        |      |   ||||       |         |
       trace-cmd-28284 (28284) [005] .... 240338.934671: sys_exit: NR 1 = 1
     kworker/3:2-27891 (27891) [003] d... 240338.934671: timer_start: timer=00000000d643debd function=delayed_work_timer_fn expires=4535008893 [timeout=1981] cpu=3 idx=186 flags=I
       trace-cmd-28284 (28284) [005] .... 240338.934672: sys_write -> 0x1
     kworker/3:2-27891 (27891) [003] .... 240338.934672: workqueue_execute_end: work struct 000000008fddd403: function psi_avgs_work
     kworker/3:2-27891 (27891) [003] .... 240338.934673: workqueue_execute_start: work struct 00000000111c941e: function dbs_work_handler
     kworker/3:2-27891 (27891) [003] .... 240338.934673: workqueue_execute_end: work struct 00000000111c941e: function dbs_work_handler
     kworker/3:2-27891 (27891) [003] d... 240338.934673: rcu_utilization: Start context switch
     kworker/3:2-27891 (27891) [003] d... 240338.934673: rcu_utilization: End context switch

-- Steve

> +		__field(u64, size)
> +		__field(s64, count)
> +		__string(exp_name, dma_buffer(filp)->exp_name)
> +		__string(name, dma_buffer(filp)->name ? dma_buffer(filp)->name : UNKNOWN)
> +		__field(u64, i_ino)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->tgid = task->tgid;
> +		__entry->pid = task->pid;
> +		__entry->size = dma_buffer(filp)->size;
> +		__entry->count = file_count(filp);
> +		__assign_str(exp_name, dma_buffer(filp)->exp_name);
> +		__assign_str(name, dma_buffer(filp)->name ? dma_buffer(filp)->name : UNKNOWN);
> +		__entry->i_ino = filp->f_inode->i_ino;
> +	),
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
