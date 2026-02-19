Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHd6DsMFl2kWtwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 13:44:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4E15EA6D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 13:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F68710E304;
	Thu, 19 Feb 2026 12:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5zz9lPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463D010E304;
 Thu, 19 Feb 2026 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771505087; x=1803041087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OTCrul63GWdffGunU3BmYtyrvrOi6IFXRMTu2yDAG4U=;
 b=C5zz9lPTsTl0Ej94Oi+WMK4cw6urXK541VO5at8hmeZWG1JYo3JjfB2L
 7Cug+d7HNu5IKzqHpIg3wjeOXbMMvW3xseFoR4faJI4Z9yoFPT5Y7y8H2
 kZuenR9XoSSRlD/TmjXe3zqiRUH3sVTwMjDPZtAF4PXHaEBs9YTfwHLmh
 8ZFQTuWysBQxBNaBM6S8Nyc7lSBkQwXOBhiWajRtD3B9Tju5cj2axzCFA
 AY1paDU8TXNOvYUrPrvyr2MLRh6ZX+q8sq4GrFY4xei2zIw4qfBV/S/nW
 7liIOfsdeM1vfLynN6P1uPletw1jHX2+npUkcqvGUcx3LYOy0QvpvDlvB Q==;
X-CSE-ConnectionGUID: aNiwWposSYanCEM5HYj/6A==
X-CSE-MsgGUID: TEc+jx0KS2mM9O4QG9TXzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="75196912"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="75196912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 04:44:46 -0800
X-CSE-ConnectionGUID: IGvQgT3TRC+VbMRSENLIQw==
X-CSE-MsgGUID: bX+pq6m7Qx69eo1lfBQDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="219035188"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.167])
 ([10.245.244.167])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 04:44:44 -0800
Message-ID: <1243e2a5-02bd-4b44-9008-6d18a706e44f@intel.com>
Date: Thu, 19 Feb 2026 12:44:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
 <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
 <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 8DF4E15EA6D
X-Rspamd-Action: no action

On 19/02/2026 11:14, Danilo Krummrich wrote:
> On Thu Feb 19, 2026 at 11:38 AM CET, Matthew Auld wrote:
>> On 19/02/2026 10:16, Danilo Krummrich wrote:
>>> On Mon Feb 16, 2026 at 12:19 PM CET, Koen Koning wrote:
>>>> Use subsys_initcall instead of module_init for the GPU buddy allocator,
>>>> so its initialization code runs before any gpu drivers.
>>>> Otherwise, a built-in driver that tries to use the buddy allocator will
>>>> run into a kernel NULL pointer dereference because slab_blocks is
>>>> uninitialized.
>>>>
>>>> Specifically, this fixes drm/xe (as built-in) running into a kernel
>>>> panic during boot, because it uses buddy during device probe.
>>>
>>> I just noticed that this patch was sent twice, and I posted my feedback on [1]
>>> -- pasting it here as well.
>>>
>>>> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
>>>
>>> This Fixes: tag seems wrong. How is this code move related to this problem?
>>
>> This popped up as a very recent regression for us internally. It looks
>> like it worked before since link order ensured drm_buddy came before all
>> the driver code. With above commit the link order changed and became
>> drm/ and then buddy. See [1] also, which is maybe clearer to see this.
> 
> I see, I think this would be a good hint for the commit message. :)
> 
> However, I think it was never meant to rely on a build system implementation
> detail, nor would this be correct. So, I think this should add both Fixes: tags.

Yeah, I'm really not sure tbh. From a quick grep there do seem to be 
other users relying on this:

drm/drm_drv.c:1274:module_init(drm_core_init);
drm/scheduler/sched_fence.c:238:module_init(drm_sched_fence_slab_init);

The sched one looks identical with the slab thing. Do these need to be 
fixed also?

> 
> Whether it should be backported is a different question though, as it seems to
> work by accident in previous versions, i.e. it is only a "potential bug".
> 
> My personal opinion is that it should be backported either way, however that's
> ultimately up to the stable team.
> 
> - Danilo
> 
>>
>> [1]
>> https://lore.kernel.org/intel-xe/20260213152047.179628-1-koen.koning@linux.intel.com/
>>
>>>
>>> This should rather be:
>>>
>>> Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common drm")
>>>
>>> Also, please add:
>>>
>>> Cc: stable@vger.kernel.org
>>>
>>>> Cc: Joel Fernandes <joelagnelf@nvidia.com>
>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>> Cc: intel-xe@lists.freedesktop.org
>>>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
>>>
>>> [1] https://lore.kernel.org/all/DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org/
> 

