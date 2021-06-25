Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CC3B3E02
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 09:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0786EC35;
	Fri, 25 Jun 2021 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02DA6EC35;
 Fri, 25 Jun 2021 07:48:11 +0000 (UTC)
IronPort-SDR: Oo33wuLQus7GgwZYx1XT+W4Wk5d5R6VaEQX1jB4rHvZYw8IaNfQ0ddrOjKrwlvbX80MZwPr1Nw
 iO1Q6o/HbxEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="229222038"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="229222038"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 00:48:10 -0700
IronPort-SDR: b7Pe5NkesrrDkhsN96JJvpf3kl0mzb807k9Rkg6nvK/8CH5Q9wNxzc5WvFZ7JHNYX/3Je3H0WV
 yO++uHf5meLw==
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="453731121"
Received: from ssaranga-mobl2.ger.corp.intel.com (HELO [10.252.39.20])
 ([10.252.39.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 00:48:08 -0700
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Reinstate the mmap ioctl for
 some platforms
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210624112914.311984-1-thomas.hellstrom@linux.intel.com>
 <CAKMK7uEeV0nvf+4ae2rYQHMBQ2rm2NNKT+n8CvDU=gdaEXHHBw@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <c9c9ab2d-e55c-6426-1d4f-20248040f111@linux.intel.com>
Date: Fri, 25 Jun 2021 09:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEeV0nvf+4ae2rYQHMBQ2rm2NNKT+n8CvDU=gdaEXHHBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 24-06-2021 om 14:04 schreef Daniel Vetter:
> On Thu, Jun 24, 2021 at 1:29 PM Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Reinstate the mmap ioctl for all current integrated platforms.
>> The intention was really to have it disabled for discrete graphics
>> where we enforce a single mmap mode.
>>
>> Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> ---
>> v2:
>> - Added a R-B.
>> - Fixed up the code comment a bit.
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 2fd155742bd2..4f50a508c7a0 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -62,10 +62,11 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
>>         struct drm_i915_gem_object *obj;
>>         unsigned long addr;
>>
>> -       /* mmap ioctl is disallowed for all platforms after TGL-LP.  This also
>> -        * covers all platforms with local memory.
>> +       /*
>> +        * mmap ioctl is disallowed for all discrete platforms,
>> +        * and for all platforms with GRAPHICS_VER > 12.
>>          */
>> -       if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915))
>> +       if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
>>                 return -EOPNOTSUPP;
>>
>>         if (args->flags & ~(I915_MMAP_WC))
>> --
>> 2.31.1
>>
>
Would keeping this change unapplied break any currently shipping platforms? If not, could we leave it as-is?
