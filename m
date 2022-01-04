Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66851483E1B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 09:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5610E1CC;
	Tue,  4 Jan 2022 08:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB7F10E1C8;
 Tue,  4 Jan 2022 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641284973; x=1672820973;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=inp4zl5PxT6m0phrdgKlCcGPK/z9l8nskoQCH79NGm0=;
 b=NpD/sZK9M6Wxt3/tBymR/4pCjPZyoBMZVkIWd7qOr5Hsw0vdZTNMnLzr
 d+qTBfLj3oTRscCBcc//x/v0YhO2AwbFOQ0EHLDRzjbyoG461UBtF0mhR
 FvxsZcJE/rS7iwu8BmjY9+fkgFZt/geixX4JqoaLh6mmG1K0PAv/GLcrF
 418oLLSR1SKHARwaAf3+bC+479ouvXbCO6qAsNOIj+Rqu+qmcXCCdGG9s
 d/L89OoPOCvJXpmLsdndCoSw3Vef+6CsYAaqIXNOyb4Iy6tP/NnadqSpP
 Dm4BAvmMNeErEFArPBQ2ilMSKmzusP9SZAL/BRliIzumV9hg+asy+26zy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="302935232"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="302935232"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 00:29:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="611002421"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.196])
 ([10.249.254.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 00:29:31 -0800
Message-ID: <f31472df-3239-5903-ea3c-60fd58b4e1d8@linux.intel.com>
Date: Tue, 4 Jan 2022 09:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
 <20220103115947.92688-3-thomas.hellstrom@linux.intel.com>
 <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
 <BN6PR11MB1633BB7DDA0486B79F6B6C2492499@BN6PR11MB1633.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <BN6PR11MB1633BB7DDA0486B79F6B6C2492499@BN6PR11MB1633.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Oak.

On 1/4/22 00:08, Zeng, Oak wrote:
>
> Regards,
> Oak

Looks like your emails always start with "Regards, Oak". a misconfiguration?


>> -----Original Message-----
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Sent: January 3, 2022 1:58 PM
>> To: Zeng, Oak <oak.zeng@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: Re: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as argument for gtt binding / unbinding
>>
>> Hi, Oak.
>>
>> On 1/3/22 19:17, Zeng, Oak wrote:
>>> Regards,
>>> Oak
>>>
>>>> -----Original Message-----
>>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Thomas Hellström
>>>> Sent: January 3, 2022 7:00 AM
>>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld, Matthew <matthew.auld@intel.com>
>>>> Subject: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as argument for gtt binding / unbinding
>>>>
>>>> When introducing asynchronous unbinding, the vma itself may no longer
>>>> be alive when the actual binding or unbinding takes place.
>>> Can we take an extra reference counter of the vma to keep the vma alive, until the actual binding/unbinding takes place?
>> The point here is that that's not needed, and should be avoided.
> Can you explain more why "keeping vma alive until unbinding takes place" should be avoided?
>
> As I understand it, your series introduce asynchronized unbinding. But since vma might be no longer alive at the time of unbinding. To overcome this difficulty, you introduce a vma resource structure and you guarantee vma resource is alive at bind/unbind time. So you can use vma resource for the bind/unbind operation. My question is, can we achieve the asynchronized unbinding still using vma structure by keeping vma structure alive ( by ref count it). This way the change should be much smaller (compared to this series). Why it is harmful to keep the vma alive? Maybe you have other reasons to introduce vma resource that I don't see.

When we allow asynchronous unbinding, it's allowed to immediately rebind 
the vma, possibly into the same gpu virtual address, but with different 
pages. And when doing that we don't want to block waiting for the unbind 
to execute. In fact, we could allow a large number of outstanding binds 
and unbinds for a vma, which makes the vma structure unsuitable to track 
this, since there will no longer be a single mapping between a set of 
active pages and a vma, or a virtual gpu range and a vma.

Thanks,

/Thomas

>
> Regards,
> Oak
>
>   If the
>> vma is no longer alive, that means nobody uses it anymore, but the GPU
>> may still have work in the pipe that references the GPU virtual address.
>>
>> /Thomas.
>>
