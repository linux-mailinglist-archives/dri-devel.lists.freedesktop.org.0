Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0C463224
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 12:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38D6E5A5;
	Tue, 30 Nov 2021 11:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9F06E58B;
 Tue, 30 Nov 2021 11:17:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236017784"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="236017784"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 03:17:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="512136237"
Received: from dcondura-mobl.ger.corp.intel.com (HELO [10.252.36.49])
 ([10.252.36.49])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 03:17:39 -0800
Message-ID: <b40c5455-7b60-7c97-9fcd-fba67ed71f6d@linux.intel.com>
Date: Tue, 30 Nov 2021 12:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v2 00/16] drm/i915: Remove short term pins
 from execbuf.
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <f1202314-f42d-e37a-49a7-16148f5018be@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <f1202314-f42d-e37a-49a7-16148f5018be@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30-11-2021 09:54, Tvrtko Ursulin wrote:
>
> Hi,
>
> On 29/11/2021 13:47, Maarten Lankhorst wrote:
>> New version of the series, with feedback from previous series added.
>
> If there was a cover letter sent for this work in the past could you please keep attaching it? Or if there wasn't, could you please write one?
>
> I am worried about two things. First is that we need to have a high level overview of the rules/design changes documented so third party people have any hope of getting code right after this lands. (Where we are, where we are going, how we will get there, how far did we get and when we will get to the end.)
>
> Second is that when parts of the series land piecemeal (Which they have in this right, right?), it gets very hard to write up a maintainer level changelog.

The preparation part is to ensure we always hold vma->obj->resv when unbinding.

The first preparation series ensured vma->obj always existed. This was not the case for mock gtt and gen6 aliasing gtt. This allowed us to remove all the special handling for those uncommon cases, and actually enforce we can always take that lock. This part is merged.

Patch 2-11 in this series adds the vma->obj->resv to eviction and shrinker. Those are the only parts where we don't take the lock yet.

After that, we always hold the lock when required, and we can start requiring the obj-> resv lock when unbinding. This is completed in patch 15.

With that fixed, removing short term pins can be done, because for unbind we now always take obj->resv, so holding obj->resv during execbuf submission is sufficient, and all short term pinning can be removed.

We only pin temporarily when calling i915_gem_evict_vm in execbuf, which could also be handled in theory by just marking all objects as unpinned.

As a bonus, using TTM for delayed eviction on all objects becomes easy, just need to get rid of i915_active in i915_vma, as it keeps the object refcount alive.

Remainder is removing refcount to i915_vma, to make it a real

> But in any case, even on the mundane process level, we need to have cover letters for any non trivial work was the conclusion since some time ago. 

Here you go! I hope it explains the reasoning.

~Maarten

