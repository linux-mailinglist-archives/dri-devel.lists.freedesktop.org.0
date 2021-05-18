Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08C3874D8
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8317E6EB0F;
	Tue, 18 May 2021 09:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126D26EB08;
 Tue, 18 May 2021 09:12:31 +0000 (UTC)
IronPort-SDR: qsMIj4cQ8ntWXhGs78vrwFaRL7qGLSY7o1GpyJHZ8Rqnb9MNpEOn8oNECfbBq1xHgEjVC8w7aw
 PEIeOz0wxSTA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180268534"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="180268534"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:12:30 -0700
IronPort-SDR: kW1P7Da0t3aLsgFUElHXfQkRIiCMDuZrHk8UYOYMtHmBKAM8gx9nELRA5Lw/oKeekmcauL+GA/
 Ns1bpofE4Asw==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="466335777"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 02:12:29 -0700
Subject: Re: [Intel-gfx] [PATCH v2 05/15] drm/i915/ttm Initialize the ttm
 device and memory managers
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-6-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNOLTqrp-kv0rAkXZGb02swQ+8-Q7dxMZOHwDEh=QCgpw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0e80ab1f-9b88-c2ec-bbfd-48de35f4ef3d@linux.intel.com>
Date: Tue, 18 May 2021 11:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNOLTqrp-kv0rAkXZGb02swQ+8-Q7dxMZOHwDEh=QCgpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 11:09 AM, Matthew Auld wrote:
> On Tue, 18 May 2021 at 09:27, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Temporarily remove the buddy allocator and related selftests
>> and hook up the TTM range manager for i915 regions.
>>
>> Also modify the mock region selftests somewhat to account for a
>> fragmenting manager.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> v2:
>> - Fix an error unwind in lmem_get_pages() (Reported by Matthew Auld)
>> - Break out and modify usage of i915_sg_dma_sizes() (Reported by Mattew Auld)
>> - Break out TTM changes to a separate patch (Reported by Christian König)
>> ---
> <snip>
>
>> +
>> +static int mock_region_get_pages(struct drm_i915_gem_object *obj)
>> +{
>> +       unsigned int flags;
>> +       struct sg_table *pages;
>> +
>> +       flags = I915_ALLOC_MIN_PAGE_SIZE;
>> +       if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
>> +               flags |= I915_ALLOC_CONTIGUOUS;
>> +
>> +       obj->mm.st_mm_node = intel_region_ttm_node_alloc(obj->mm.region,
>> +                                                        obj->base.size,
>> +                                                        flags);
>> +       if (IS_ERR(obj->mm.st_mm_node))
>> +               return PTR_ERR(obj->mm.st_mm_node);
>> +
>> +       pages = intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_mm_node);
>> +       if (IS_ERR(pages))
>> +               return PTR_ERR(pages);
> Needs some onion?

Ah, yes.

/Thomas


