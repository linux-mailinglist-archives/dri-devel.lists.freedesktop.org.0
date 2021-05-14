Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3F380E6A
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 18:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166B76E22F;
	Fri, 14 May 2021 16:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42E96E226;
 Fri, 14 May 2021 16:48:42 +0000 (UTC)
IronPort-SDR: wzNBkpqQUNKYNK6zaP6aMAvoYxttqo6NA3IRD5ROgI9xllF4nJLpucIPFEMQ3O9DYchpYTlMLZ
 ru1Pegyfs8hw==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="180482261"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="180482261"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 09:48:41 -0700
IronPort-SDR: VFOJcdPwSYg3ucr6thJOTDuAq7iSruR8eg/3c3Y3J8Rd9XdsyqjBftIaABBimccTERbZjhVcLC
 QW8ZzpIdNtTw==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="610821378"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 09:48:41 -0700
Date: Fri, 14 May 2021 09:41:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in
 the i915
Message-ID: <20210514164125.GA826@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d5695c6d-2dc9-2ea3-9491-2a12468e68a2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5695c6d-2dc9-2ea3-9491-2a12468e68a2@linux.intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 12:11:56PM +0100, Tvrtko Ursulin wrote:
> 
> On 06/05/2021 20:13, Matthew Brost wrote:
> > Basic GuC submission support. This is the first bullet point in the
> > upstreaming plan covered in the following RFC [1].
> > 
> > At a very high level the GuC is a piece of firmware which sits between
> > the i915 and the GPU. It offloads some of the scheduling of contexts
> > from the i915 and programs the GPU to submit contexts. The i915
> > communicates with the GuC and the GuC communicates with the GPU.
> > 
> > GuC submission will be disabled by default on all current upstream
> > platforms behind a module parameter - enable_guc. A value of 3 will
> > enable submission and HuC loading via the GuC. GuC submission should
> > work on all gen11+ platforms assuming the GuC firmware is present.
> 
> Some thoughts mostly relating to future platforms where GuC will be the only
> option, and to some extent platforms where it will be possible to turn it on
> for one reason or another.
> 
> Debuggability - in the context of having an upstream way/tool for capturing
> and viewing GuC logs usable for attaching to bug reports.
> 

Agree. We have discussed this internally as an upstream requirement for quite
sometime. 

> Currently i915 logs, can provide traces via tracepoints and trace printk,
> and GPU error capture state, which provides often sufficient trail of
> evidence to debug issues.
> 

If we do this right, we should have something the same with GuC submission.

> We need to make sure GuC does is not a black box in this respect. By this I
> mean it does not hide a large portion of the execution flows from upstream
> observability.
> 
> This could mean a tool in IGT to access/capture GuC logs and update bug
> filing instructions.
> 

We have a few internal tools decode the GuC logs. One of these tools will be
open sourced and on a public repo. We just need to decide which tool and make
sure that tool works across all the distros.

> Leading from here is probably the need for the GuC firmware team to cross
> the internal-upstream boundary and deal with such bug reports on upstream
> trackers. Upstream GuC is unlikely to work if we don't have such plan and
> commitment.
> 

I think we can land this code first as it is going be disabled by default.
Certainly once we turn it on by default we need to have everything in place that
you mention in this email.

> Also leading from here is the need for GPU error capture to be on par from
> day one which is I believe still not there in the firmware.
>

We are missing a register dump from the GuC on reset. No other way to say this
than this has been huge miss by the i915 / GuC teams. This is something we
absolutely need and it hasn't gotten done. I'll push on this and hopefully we
can land this feature soon.

> Another, although unrelated, missing feature on my wish list is firmware
> support for wiring up accurate engine busyness stats to i915 PMU. I believe
> this is also being worked on but I don't know when is the expected delivery.
>

This is landing this week I believe. Next upstream post should include an
updated GuC firmware + code in the i915 that hooks into the PMU stats.

Matt

> If we are tracking a TODO list of items somewhere I think these ones should
> be definitely considered.
> 
> Regards,
> 
> Tvrtko
