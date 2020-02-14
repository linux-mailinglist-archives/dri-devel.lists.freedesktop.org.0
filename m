Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F85615CF14
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 01:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A9C6F8A1;
	Fri, 14 Feb 2020 00:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CDF6F8A0;
 Fri, 14 Feb 2020 00:35:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20217935-1500050 for multiple; Fri, 14 Feb 2020 00:34:39 +0000
MIME-Version: 1.0
To: Andi Shyti <andi@etezian.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200211225644.GA6319@jack.zhora.eu>
References: <20200207151720.2812125-1-chris@chris-wilson.co.uk>
 <20200211225644.GA6319@jack.zhora.eu>
Message-ID: <158164047649.7047.7007579718429977472@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/mm: Break long searches in fragmented
 address spaces
Date: Fri, 14 Feb 2020 00:34:36 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 Andi Shyti <andi@etezian.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2020-02-11 22:56:44)
> Hi Chris,
> 
> On Fri, Feb 07, 2020 at 03:17:20PM +0000, Chris Wilson wrote:
> > We try hard to select a suitable hole in the drm_mm first time. But if
> > that is unsuccessful, we then have to look at neighbouring nodes, and
> > this requires traversing the rbtree. Walking the rbtree can be slow
> > (much slower than a linear list for deep trees), and if the drm_mm has
> > been purposefully fragmented our search can be trapped for a long, long
> > time. For non-preemptible kernels, we need to break up long CPU bound
> > sections by manually checking for cond_resched(); similarly we should
> 
> checking for "fatal signals" you mean?

We need to call schedule() ourselves for non-voluntary CONFIG_PREEMPT
kernels, and we need to escape from the kernel back to userspace to
handle a pending signal in this process.

Other applications, sysadmins tend to notice and complain about driver
hogging a CPU not letting anything else run; typically the user notices
that their application doesn't close on ^C.

(That is schedule() delays of a few ms will be noticed, but it takes a
couple of seconds before a user will become aware of a severe problem
with a stuck signal. :)

Now since responding to a signal itself may be expensive (we have to
restart the syscall and re-process all the state from before this
point), we make the trade-off here of only responding to a fatal-signal
(process exit), which should allow for faster system recovery under
pathological conditions.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
