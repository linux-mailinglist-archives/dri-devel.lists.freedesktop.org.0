Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4436DCC0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B63A6E113;
	Wed, 28 Apr 2021 16:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991FA6E113;
 Wed, 28 Apr 2021 16:13:40 +0000 (UTC)
IronPort-SDR: i5YW2q1UinBP2DqdccfPuwS1V5VQxOLVLWvxSIT6OVbmkcRhHR7X6GpUEUsA7+V7bFlgWvUecG
 WoKTBKyIqkqA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282117455"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="282117455"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 09:11:11 -0700
IronPort-SDR: Yb8TgQ9p7hewIODeR56cNpfaMdqxslpKYWBP62mKSYJ2gz3TGL7hFsNLZc+ZetyhYLf8YyJePl
 6Kmq5WFa/PuQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="403733548"
Received: from gstedje-mobl2.ger.corp.intel.com (HELO [10.252.13.124])
 ([10.252.13.124])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 09:10:58 -0700
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
To: Kenneth Graunke <kenneth@whitecape.org>, intel-gfx@lists.freedesktop.org
References: <20210426093901.28937-1-matthew.auld@intel.com>
 <4429978.s5xreEhoxC@mizzik>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <e6d77106-6d21-3c2d-8edd-65a2fa9451b2@intel.com>
Date: Wed, 28 Apr 2021 17:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4429978.s5xreEhoxC@mizzik>
Content-Language: en-GB
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, Jordan Justen <jordan.l.justen@intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/04/2021 16:16, Kenneth Graunke wrote:
> On Monday, April 26, 2021 2:38:53 AM PDT Matthew Auld wrote:
>> +Existing uAPI issues
>> +====================
>> +Some potential issues we still need to resolve.
>> +
>> +I915 MMAP
>> +---------
>> +In i915 there are multiple ways to MMAP GEM object, including mapping the same
>> +object using different mapping types(WC vs WB), i.e multiple active mmaps per
>> +object. TTM expects one MMAP at most for the lifetime of the object. If it
>> +turns out that we have to backpedal here, there might be some potential
>> +userspace fallout.
>> +
>> +I915 SET/GET CACHING
>> +--------------------
>> +In i915 we have set/get_caching ioctl. TTM doesn't let us to change this, but
>> +DG1 doesn't support non-snooped pcie transactions, so we can just always
>> +allocate as WB for smem-only buffers.  If/when our hw gains support for
>> +non-snooped pcie transactions then we must fix this mode at allocation time as
>> +a new GEM extension.
>> +
>> +This is related to the mmap problem, because in general (meaning, when we're
>> +not running on intel cpus) the cpu mmap must not, ever, be inconsistent with
>> +allocation mode.
>> +
>> +Possible idea is to let the kernel picks the mmap mode for userspace from the
>> +following table:
>> +
>> +smem-only: WB. Userspace does not need to call clflush.
>> +
>> +smem+lmem: We allocate uncached memory, and give userspace a WC mapping
>> +for when the buffer is in smem, and WC when it's in lmem. GPU does snooped
>> +access, which is a bit inefficient.
> 
> I think you meant to write something different here.  What I read was:
> 
> - If it's in SMEM, give them WC
> - If it's in LMEM, give them WC
> 
> Presumably one of those should have been something else, since otherwise
> you would have written "always WC" :)

It should have been "always WC", sorry for the confusion.

"smem+lmem: We only ever allow a single mode, so simply allocate this as 
uncached memory, and always give userspace a WC mapping. GPU still does 
snooped access here(assuming we can't turn it off like on DG1), which is 
a bit inefficient."

> 
>> +
>> +lmem only: always WC
>> +
>> +This means on discrete you only get a single mmap mode, all others must be
>> +rejected. That's probably going to be a new default mode or something like
>> +that.
>> +
>> +Links
>> +=====
>> +[1] https://patchwork.freedesktop.org/series/86798/
>> +
>> +[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
