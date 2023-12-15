Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70386814499
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 10:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723D810E32A;
	Fri, 15 Dec 2023 09:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5053310E0A7;
 Fri, 15 Dec 2023 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702633039; x=1734169039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zvg/lFItumenYrG3N2XhzoEUGv1fk0+uuv3sf6oiWUM=;
 b=jrr2+/+SmLaK5kYMBXgbK1VYVBkLXCTaTF45Tofr2O3MZSeAaPm6+kNW
 3/s6bvipzyP0NTkxO5H8JVtdmRE4s60oBz8A1SZlpAFTzUnOq5yD8Nhu4
 MI34kE9Iueme7nYiwbRXeNdYIo81p4dCuniCf/aSaR7me4QlQkVH9z+Rs
 rZXdQxKtdCgan0NbQfKu/xUzp8TUua06HFlgQcdb3Ys71kB+9nz3TVBX5
 FFxbLzgYOpzO54+JA3tt//fpjcwlfJuvurijY2pZFdQauct4vgOmXq5YV
 LxTagARs9uw+zCykS1cvrbLiXbog1l+NHF77WJ+HRRc77cJdlP28gxa9V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459573622"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="459573622"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 01:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="17743781"
Received: from srgreatl-mobl2.ger.corp.intel.com (HELO [10.213.207.13])
 ([10.213.207.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 01:37:16 -0800
Message-ID: <4556f0c9-9ab0-4f8d-ad8b-68e51cd320d6@linux.intel.com>
Date: Fri, 15 Dec 2023 09:37:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
 kmap_local_page()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>
References: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
 <ZXsA4ojbROLXMkfz@intel.com>
 <2abe6f02-b93e-4207-b9be-e9185c7b69e5@linux.intel.com>
 <c968f151-6445-4ab4-9d2f-c59568665707@linux.intel.com>
 <ZXsZeEw/w+LfaKyH@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZXsZeEw/w+LfaKyH@intel.com>
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
Cc: Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/12/2023 15:04, Zhao Liu wrote:
> On Thu, Dec 14, 2023 at 02:35:26PM +0000, Tvrtko Ursulin wrote:
>> Date: Thu, 14 Dec 2023 14:35:26 +0000
>> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Subject: Re: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
>>   kmap_local_page()
>>
>>
>> On 14/12/2023 13:45, Tvrtko Ursulin wrote:
>>>
>>> Hi Zhao,
>>>
>>> On 14/12/2023 13:19, Zhao Liu wrote:
>>>> Hi maintainers,
>>>>
>>>> Just kindly ping.
>>>> May I ask if this refresh version could be merged into the next tree of
>>>> the i915?
>>>
>>> I certainly spotted your series last week or so but then it slipped my
>>> mind to go through it. Should be able to go through it today or
>>> tomorrow.
>>
>> It all looks good to me. I only needed to queue a re-test in our CI since v3
>> failed BAT, but pretty sure it wasn't at fault. Once I am satisfied with the
>> results I will merge the series. Thanks for the cleanups and your patience!
>>
>> Regards,
>>
>> Tvrtko
>>
> 
> Thanks for your review!

Pushed to drm-intel-gt-next, thanks again!

Regards,

Tvrtko
