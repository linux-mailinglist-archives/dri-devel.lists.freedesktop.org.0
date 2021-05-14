Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D4380E74
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 18:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62E06E20F;
	Fri, 14 May 2021 16:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C876E20F;
 Fri, 14 May 2021 16:53:40 +0000 (UTC)
IronPort-SDR: Rsaa3nqpJlMwUDRL2Lif8yXU8ZL7V4+7sRHlns421C1obZ/pxe8RI6zf3yGUO5hQ5BbRWn+pQW
 tkV2g9FT8fkg==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="199894845"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="199894845"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 09:53:38 -0700
IronPort-SDR: gJ2ap+lkq2mr3hPUz3bxRc2B2JtHlcBOyyf4Ty7kRoHoKQJadwu4LctQKjmHmGbJU98RYnsYkU
 kxu2Eo1mKEfA==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="457874101"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 09:53:38 -0700
Date: Fri, 14 May 2021 09:46:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in
 the i915
Message-ID: <20210514164621.GB826@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d5695c6d-2dc9-2ea3-9491-2a12468e68a2@linux.intel.com>
 <CAOFGe94nFvepNaV56SQ-OWV5vicYWXuAOZb2ufrs4G+-1QZZXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe94nFvepNaV56SQ-OWV5vicYWXuAOZb2ufrs4G+-1QZZXA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 11:36:37AM -0500, Jason Ekstrand wrote:
> On Fri, May 14, 2021 at 6:12 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > On 06/05/2021 20:13, Matthew Brost wrote:
> > > Basic GuC submission support. This is the first bullet point in the
> > > upstreaming plan covered in the following RFC [1].
> > >
> > > At a very high level the GuC is a piece of firmware which sits between
> > > the i915 and the GPU. It offloads some of the scheduling of contexts
> > > from the i915 and programs the GPU to submit contexts. The i915
> > > communicates with the GuC and the GuC communicates with the GPU.
> > >
> > > GuC submission will be disabled by default on all current upstream
> > > platforms behind a module parameter - enable_guc. A value of 3 will
> > > enable submission and HuC loading via the GuC. GuC submission should
> > > work on all gen11+ platforms assuming the GuC firmware is present.
> >
> > Some thoughts mostly relating to future platforms where GuC will be the
> > only option, and to some extent platforms where it will be possible to
> > turn it on for one reason or another.
> >
> > Debuggability - in the context of having an upstream way/tool for
> > capturing and viewing GuC logs usable for attaching to bug reports.
> >
> > Currently i915 logs, can provide traces via tracepoints and trace
> > printk, and GPU error capture state, which provides often sufficient
> > trail of evidence to debug issues.
> >
> > We need to make sure GuC does is not a black box in this respect. By
> > this I mean it does not hide a large portion of the execution flows from
> > upstream observability.
> 
> I agree here.  If GuC suddenly makes submission issues massively
> harder to debug then that's a regression vs. execlists.  I don't know
> what the solution there is but I think the concern is valid.
> 

Replied to Tvrtko with detailed answers. The TL;DR is agree with basically
everything he said and we have plans address it all and everything must be
addressed before the GuC can be turned on by default.

Matt

> > This could mean a tool in IGT to access/capture GuC logs and update bug
> > filing instructions.
> >
> > Leading from here is probably the need for the GuC firmware team to
> > cross the internal-upstream boundary and deal with such bug reports on
> > upstream trackers. Upstream GuC is unlikely to work if we don't have
> > such plan and commitment.
> 
> I mostly agree here as well.  I'm not sure it'll actually happen but
> I'd like anyone who writes code which impacts Linux to be active in
> upstream bug trackers.
> 
> > Also leading from here is the need for GPU error capture to be on par
> > from day one which is I believe still not there in the firmware.
> 
> This one has me genuinely concerned.  I've heard rumors that we don't
> have competent error captures with GuC yet.  From the Mesa PoV, this
> is a non-starter.  We can't be asked to develop graphics drivers with
> no error capture.
> 
> The good news is that, based on my understanding, it shouldn't be
> terrible to support.  We just need the GuC to grab all the registers
> for us and shove them in a buffer somewhere before it resets the GPU
> and all that data is lost.  I would hope the Windows people have
> already done that and we just need to hook it up.  If not, there may
> be some GuC engineering required here.
> 
> > Another, although unrelated, missing feature on my wish list is firmware
> > support for wiring up accurate engine busyness stats to i915 PMU. I
> > believe this is also being worked on but I don't know when is the
> > expected delivery.
> >
> > If we are tracking a TODO list of items somewhere I think these ones
> > should be definitely considered.
> 
> Yup, let's get it all in the ToDo and not flip GuC on by default in
> the wild until it's all checked off.
> 
> --Jason
