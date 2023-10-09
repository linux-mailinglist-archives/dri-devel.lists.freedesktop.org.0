Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1A7BDB71
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 14:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0310E10C;
	Mon,  9 Oct 2023 12:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1A10E10C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696853980; x=1728389980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=orcsiRXreRBjsWfZ9tlQmbyEj+8pUqazTaxyGFk8vZ4=;
 b=T8n6bCUooeYeSnuDipXFk4qklJvUDjy/RrBjshF4Wka2P7NURdVoAhzx
 L9h/drwQfKQncrvay8l7+lnIIaNKXJU/lKP/egekmwNZEuIpAFXMssPXf
 XvG9OrzNKqh7AH/bCWT/EfqYDycS6M0ZyjSzGpPyvDtF798c302CsOo/f
 e/YeoBdFw4+AiNQRZxC2QI9xtv5BFhGl4muLBL2KHHolawxNBK1PWYJeD
 orUDkrF9yQBjyvfcjPyM5K22IdgcjezVWM5mKzxEJAUUDKol8GDYfyrik
 SocGSXj6T40SoWtmDqNNi6uJ/7XBRbfg1Q6Y4XTd3AjfcpyR7QL2ZZsBe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="381392489"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="381392489"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 05:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="753001169"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="753001169"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 09 Oct 2023 05:19:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 15:19:34 +0300
Date: Mon, 9 Oct 2023 15:19:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZSPv1iAwJMgnsDu3@intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
X-Patchwork-Hint: comment
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
Cc: Ray Strode <halfline@gmail.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 08:42:24AM +0200, Christian König wrote:
> Am 06.10.23 um 20:48 schrieb Ray Strode:
> > Hi,
> >
> > On Fri, Oct 6, 2023 at 3:12 AM Christian König <christian.koenig@amd.com> wrote:
> >> When the operation busy waits then that *should* get accounted to the
> >> CPU time of the current process. When the operation sleeps and waits for
> >> some interrupt for example it should not get accounted.
> >> What you suggest is to put the parts of the operation which busy wait
> >> into a background task and then sleep for that task to complete. This is
> >> not a solution to the problem, but just hides it.
> > Actually, I think we both probably agree that there shouldn't be long
> > busy waits in the context of the current process. After all, we both
> > agree what the AMD DC driver code is doing is wrong.
> >
> > To be clear, my take is, if driver code is running in process context
> > and needs to wait for periods of time on the order of or in excess of
> > a typical process time slice it should be sleeping during the waiting.
> > If the operation is at a point where it can be cancelled without side
> > effects, the sleeping should be INTERRUPTIBLE. If it's past the point
> > of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
> > opinion, should kernel code busy block a typical process for dozens of
> > milliseconds while keeping the process RUNNING. I don't think this is
> > a controversial take.
> 
> Exactly that's what I completely disagree on.
> 
> When the driver is burning CPU cycles on behalves of a process then 
> those CPU cycles should be accounted to the process causing this.
> 
> That the driver should probably improve it's behavior is a different issue.
> 
> > Actually, I think (maybe?) you might even agree with that, but you're
> > also saying: user space processes aren't special here. While it's not
> > okay to busy block them, it's also not okay to busy block on the
> > system unbound workqueue either. If that's your sentiment, I don't
> > disagree with it.
> 
> No, it's absolutely ok to busy block them it's just not nice to do so.
> 
> As Daniel pointed out this behavior is not incorrect at all. The DRM 
> subsystem doesn't make any guarantee that drmModeAtomicCommit() will not 
> burn CPU cycles.
> 
> >
> > So I think we both agree the busy waiting is a problem, but maybe we
> > disagree on the best place for the problem to manifest when it
> > happens.
> >
> > One thought re the DC code is regardless of where the code is running,
> > the scheduler is going to forcefully preempt it at some point right?
> > Any writereg/udelay(1)/readreg loop is going to get disrupted by a
> > much bigger than 1us delay by the kernel if the loop goes on long
> > enough. I'm not wrong about that? if that's true, the code might as
> > well switch out the udelay(1) for a usleep(1) and call it a day (well
> > modulo the fact I think it can be called from an interrupt handler; at
> > least "git grep" says there's a link_set_dpms_off in
> > link_dp_irq_handler.c)
> >
> >> Stuff like that is not a valid justification for the change. Ville
> >> changes on the other hand tried to prevent lock contention which is a
> >> valid goal here.
> > Okay so let's land his patchset! (assuming it's ready to go in).
> > Ville, is that something you'd want to resend for review?
> 
> Well, while Ville patch has at least some justification I would still 
> strongly object to move the work into a background thread to prevent 
> userspace from being accounted for the work it causes.

Aren't most wayland compositors using nonblocking commits anyway?
If so they would already be bypassing proper CPU time accounting.
Not saying we shouldn't try to fix that, but just pointing out that
it already is an issue with nonblocking commits.

-- 
Ville Syrjälä
Intel
