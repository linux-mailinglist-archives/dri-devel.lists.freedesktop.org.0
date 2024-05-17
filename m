Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348708C8B80
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 19:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCD10EF56;
	Fri, 17 May 2024 17:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175FE10EF54;
 Fri, 17 May 2024 17:48:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 284C061DD8;
 Fri, 17 May 2024 17:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424EAC2BD10;
 Fri, 17 May 2024 17:48:06 +0000 (UTC)
Date: Fri, 17 May 2024 13:48:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux trace kernel
 <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org,
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org,
 selinux@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org,
 linux-sound@vger.kernel.org, bpf@vger.kernel.org,
 linux-wpan@vger.kernel.org, dev@openvswitch.org,
 linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net, Julia
 Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240517134834.43e726dd@gandalf.local.home>
In-Reply-To: <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
References: <20240516133454.681ba6a0@rorschach.local.home>
 <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 17 May 2024 10:36:37 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Building csky:allmodconfig (and others) ... failed
> --------------
> Error log:
> In file included from include/trace/trace_events.h:419,
>                  from include/trace/define_trace.h:102,
>                  from drivers/cxl/core/trace.h:737,
>                  from drivers/cxl/core/trace.c:8:
> drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1
> 
> This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
> So far that seems to be the only build failure.
> Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
> cxl_general_media and cxl_dram events"). Guess we'll see more of those
> towards the end of the commit window.

Looks like I made this patch just before this commit was pulled into
Linus's tree.

Which is why I'll apply and rerun the above again probably on Tuesday of
next week against Linus's latest.

This patch made it through both an allyesconfig and an allmodconfig, but on
the commit I had applied it to, which was:

  1b294a1f3561 ("Merge tag 'net-next-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next")

I'll be compiling those two builds after I update it then.

-- Steve
