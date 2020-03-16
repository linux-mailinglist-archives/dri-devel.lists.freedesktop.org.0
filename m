Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160C1873F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 21:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551C46E44A;
	Mon, 16 Mar 2020 20:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310616E211;
 Mon, 16 Mar 2020 20:24:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6fe05e0000>; Mon, 16 Mar 2020 13:23:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Mar 2020 13:24:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Mar 2020 13:24:11 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 16 Mar 2020 20:24:11 +0000
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
 <20200316184935.GA25322@lst.de> <20200316200929.GB20010@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <6de7ee97-45c7-b814-4dab-64e311dd86ce@nvidia.com>
Date: Mon, 16 Mar 2020 13:24:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200316200929.GB20010@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584390238; bh=2z7e3ESRBQ0H8l3+b7lx2d630qW++ERUUrzJr7vt57A=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JxWKBiGQ3XdzKvT9lBERRaqH41+x1hMRHEOZ7+ESSYPf4tr7uxiHEyyfUvGCoFxE5
 wnafQFYdsxDkau5rO2z0cBg26v0Co2WvdkfBNv14fTenH71/APx2TD6GocEcijFnRH
 77X4YHpi1Tb/Tcb8f9RVLklEEqfGRIPkoTeFAGljEIlUP1tleR40W7QY1qeuKVgu4i
 6+L0winf0kmireFkKGuJur2cucyVTfG4jwLgeaZoCG35e0HRlwWDIzHcDVZj9rwKTX
 kFKi2VZVoGKIX5BODqlko+JSh7ejKUuEIjXYEJrJ1viU3xpNgz6qH0Nln4JYWf38p4
 WH4LRHcY88tXA==
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/16/20 1:09 PM, Jason Gunthorpe wrote:
> On Mon, Mar 16, 2020 at 07:49:35PM +0100, Christoph Hellwig wrote:
>> On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
>>>
>>> On 3/16/20 10:52 AM, Christoph Hellwig wrote:
>>>> No driver has actually used properly wire up and support this feature.
>>>> There is various code related to it in nouveau, but as far as I can tell
>>>> it never actually got turned on, and the only changes since the initial
>>>> commit are global cleanups.
>>>
>>> This is not actually true. OpenCL 2.x does support SVM with nouveau and
>>> device private memory via clEnqueueSVMMigrateMem().
>>> Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
>>> migrated and this change would conflict with that.
>>
>> Can you explain me how we actually invoke this code?
>>
>> For that we'd need HMM_PFN_DEVICE_PRIVATE NVIF_VMM_PFNMAP_V0_VRAM
>> set in ->pfns before calling hmm_range_fault, which isn't happening.
> 
> Oh, I got tripped on this too
> 
> The logic is backwards from what you'd think.. If you *set*
> HMM_PFN_DEVICE_PRIVATE then this triggers:
> 
> hmm_pte_need_fault():
> 	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> 		/* Do we fault on device memory ? */
> 		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
> 			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
> 			*fault = true;
> 		}
> 		return;
> 	}
> 
> Ie if the cpu page is a DEVICE_PRIVATE and the caller sets
> HMM_PFN_DEVICE_PRIVATE in the input flags (pfns) then it always faults
> it and never sets HMM_PFN_DEVICE_PRIVATE in the output flags.
> 
> So setting 0 enabled device_private support, and nouveau is Ok.
> 
> AMDGPU is broken because it can't handle device private and can't set
> the flag to supress it.
> 
> I was going to try and sort this out as part of getting rid of range->flags
> 
> Jason
> 

The reason for it being backwards is that "normally" a device doesn't want
the device private page to be faulted back to system memory, it wants to
get the device private struct page so it can update its page table to point
to the memory already in the device.
Also, a device like Nvidia's GPUs may have an alternate path for copying
one GPU's memory to another (nvlink) without going through system memory
so getting a device private struct page/PFN from hmm_range_fault() that isn't
"owned" by the faulting GPU is useful.
I agree that the current code isn't well tested or thought out for multiple devices
(rdma, NVMe drives, GPUs, etc.) but it also ties in with peer-to-peer access via PCIe.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
