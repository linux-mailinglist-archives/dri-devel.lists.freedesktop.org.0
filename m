Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B71D408968
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54D96E154;
	Mon, 13 Sep 2021 10:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF126E0A6;
 Mon, 13 Sep 2021 10:52:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="208740768"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="208740768"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:52:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="469159921"
Received: from dennis-mobl.ger.corp.intel.com (HELO [10.213.217.72])
 ([10.213.217.72])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:52:24 -0700
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/guc: Implement no mid batch
 preemption for multi-lrc
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-24-matthew.brost@intel.com>
 <a2a377cb-c0f0-fcae-b1bd-ee5da3566411@linux.intel.com>
 <20210910204935.GA24315@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <722dd221-3867-2e27-ec48-323e8c36ae43@linux.intel.com>
Date: Mon, 13 Sep 2021 11:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910204935.GA24315@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 10/09/2021 21:49, Matthew Brost wrote:
> On Fri, Sep 10, 2021 at 12:25:43PM +0100, Tvrtko Ursulin wrote:
>>
>> On 20/08/2021 23:44, Matthew Brost wrote:
>>> For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
>>> mid BB. To safely enable preemption at the BB boundary, a handshake
>>> between to parent and child is needed. This is implemented via custom
>>> emit_bb_start & emit_fini_breadcrumb functions and enabled via by
>>> default if a context is configured by set parallel extension.
>>
>> FWIW I think it's wrong to hardcode the requirements of a particular
>> hardware generation fixed media pipeline into the uapi. IMO better solution
>> was when concept of parallel submission was decoupled from the no preemption
>> mid batch preambles. Otherwise might as well call the extension
>> I915_CONTEXT_ENGINES_EXT_MEDIA_SPLIT_FRAME_SUBMIT or something.
>>
> 
> I don't disagree but this where we landed per Daniel Vetter's feedback -
> default to what our current hardware supports and extend it later to
> newer hardware / requirements as needed.

I think this only re-affirms my argument - no point giving the extension 
a generic name if it is so tightly coupled to a specific use case. But I 
wrote FWIW so whatever.

It will be mighty awkward if compute multi-lrc will need to specify a 
flag to allow preemption, when turning off preemption is otherwise not 
something we allow unprivileged clients to do. So it will be kind of 
opt-out from unfriendly/dangerous default behaviour instead of explicit 
requesting it.

Regards,

Tvrtko
