Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E858629CF
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 09:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03C210E208;
	Sun, 25 Feb 2024 08:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="uWxPu15j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 624 seconds by postgrey-1.36 at gabe;
 Fri, 23 Feb 2024 20:01:32 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C12F10ECB4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 20:01:31 +0000 (UTC)
Date: Fri, 23 Feb 2024 14:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1708717865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=;
 b=uWxPu15jxbBy5Qv8sUU4/FKz9vhwMVdq24ex7AxwdBDTkpdTty7N4oFt5H+WpItVhn5h2q
 QhDNbk6QMiXNrrlkBl7kMfsoV81d2NhOFvXWC0sVWqoHMtRJN5Tm42Zzvb2Qci9w4QIV6Q
 wpkGE4FwRbb7rZDimmKQkBl02FYhYXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, 
 LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-rdma@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, 
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org, selinux@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-hwmon@vger.kernel.org,
 io-uring@vger.kernel.org, 
 linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org, 
 dev@openvswitch.org, linux-s390@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
 <20240223134653.524a5c9e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223134653.524a5c9e@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 25 Feb 2024 08:49:54 +0000
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

On Fri, Feb 23, 2024 at 01:46:53PM -0500, Steven Rostedt wrote:
> On Fri, 23 Feb 2024 10:30:45 -0800
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> 
> > On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > 
> > > [
> > >    This is a treewide change. I will likely re-create this patch again in
> > >    the second week of the merge window of v6.9 and submit it then. Hoping
> > >    to keep the conflicts that it will cause to a minimum.
> > > ]
> > > 
> > > With the rework of how the __string() handles dynamic strings where it
> > > saves off the source string in field in the helper structure[1], the
> > > assignment of that value to the trace event field is stored in the helper
> > > value and does not need to be passed in again.  
> > 
> > Just curious if this could be done piecemeal by first changing the
> > macros to be variadic macros which allows you to ignore the extra
> > argument. The callers could then be modified in their separate trees.
> > And then once all the callers have be merged, the macros could be
> > changed to no longer be variadic.
> 
> I weighed doing that, but I think ripping off the band-aid is a better
> approach. One thing I found is that leaving unused parameters in the macros
> can cause bugs itself. I found one case doing my clean up, where an unused
> parameter in one of the macros was bogus, and when I made it a used
> parameter, it broke the build.
> 
> I think for tree-wide changes, the preferred approach is to do one big
> patch at once. And since this only affects TRACE_EVENT() macros, it
> hopefully would not be too much of a burden (although out of tree users may
> suffer from this, but do we care?)

Agreed on doing it all at once, it'll be way less spam for people to
deal with.

Tangentially related though, what would make me really happy is if we
could create the string with in the TP__fast_assign() section. I have to
have a bunch of annoying wrappers right now because the string length
has to be known when we invoke the tracepoint.
