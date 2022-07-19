Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20DF579416
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A610FAB2;
	Tue, 19 Jul 2022 07:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B24C10FA87;
 Tue, 19 Jul 2022 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658215486; x=1689751486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=75p9fUuRHTBFN8wmS9uUr2gQdmoiH7o4N5Yd87DQGtA=;
 b=RX3meGFYye/8fmYZaeCNzKCs6BgLdheWZ+sLelsH/02EVoEfantHD2wY
 V2LVcsSKjM97+HJTU+yTJpeP6Utexw/1s6cNQYgS6EPTxEUI/LastsTDp
 O+JD0xdXIT3hqdfnotuCUpCXuV2lNWUpcPAAmT5ju7DiVM1UkmXpO0/Ma
 1ez3okocF9XcYuDxf9EIPFCMb1NnNxRzWkhKS01U82JdO6pRhidQR1KBp
 eG8nU9HI/MYkUNG7s/MmW6KqvRQCf3YjSSeDA8U7J6A+nsUtONTBeaCy1
 1GCuEUrrFBqmcWUjiK25eFviH+NRoQErHnZJbQNsN9BVo9B+bIOFA7hZP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="312104122"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="312104122"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:24:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="601493430"
Received: from ssherida-mobl.ger.corp.intel.com (HELO [10.213.201.170])
 ([10.213.201.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:24:41 -0700
Message-ID: <7ed6b275-e0d3-12b7-cdbe-c43994e92b47@linux.intel.com>
Date: Tue, 19 Jul 2022 08:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v2 01/21] drm/i915/gt: Ignore TLB
 invalidations on idle engines
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Mauro Carvalho Chehab' <mauro.chehab@linux.intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <c014a1d743fa46a6b57f02bffb7badf438136442.1657800199.git.mchehab@kernel.org>
 <76318fe1-37dc-8a1e-317e-76333995b8ca@linux.intel.com>
 <20220718165341.30ee6e31@maurocar-mobl2>
 <b244f88e85a44485be9038c622fa13b1@AcuMS.aculab.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b244f88e85a44485be9038c622fa13b1@AcuMS.aculab.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris.p.wilson@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi David,

On 18/07/2022 16:50, David Laight wrote:
> From: Mauro Carvalho Chehab
>> Sent: 18 July 2022 15:54
>>
>> On Mon, 18 Jul 2022 14:16:10 +0100
>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>> On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
>>>> From: Chris Wilson <chris.p.wilson@intel.com>
>>>>
>>>> Check if the device is powered down prior to any engine activity,
>>>> as, on such cases, all the TLBs were already invalidated, so an
>>>> explicit TLB invalidation is not needed, thus reducing the
>>>> performance regression impact due to it.
>>>>
>>>> This becomes more significant with GuC, as it can only do so when
>>>> the connection to the GuC is awake.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
>>>
>>> Patch itself looks fine but I don't think we closed on the issue of
>>> stable/fixes on this patch?
>>
>> No, because TLB cache invalidation takes time and causes time outs, which
>> in turn affects applications and produce Kernel warnings.
> 
> It's not only the TLB flushes that cause grief.
> 
> There is a loop that forces a write-back of all the frame buffer pages.
> With a large display and some cpu (like my Ivy bridge one) that
> takes long enough with pre-emption disabled that wakeup of RT processes
> (and any pinned to the cpu) takes far longer than one might have
> wished for.
> 
> Since some X servers request a flush every few seconds this makes
> the system unusable for some workloads.

Ok TLB invalidations as discussed in this patch does not apply to 
Ivybridge. But what is the write back loop you mention which is causing 
you grief? What size frame buffers are we talking about here? If they 
don't fit in the mappable area recently we merged a patch* which 
improves things in that situation but not sure you are hitting exactly that.

Regards,

Tvrtko

*) 230523ba24bd ("drm/i915/gem: Don't evict unmappable VMAs when pinning 
with PIN_MAPPABLE (v2)")
