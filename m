Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC53B46AC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 17:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076BB6EDFD;
	Fri, 25 Jun 2021 15:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE0326EDFD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 15:32:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC041042;
 Fri, 25 Jun 2021 08:32:38 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB72F3F694;
 Fri, 25 Jun 2021 08:32:36 -0700 (PDT)
Subject: Re: [PATCH v3 05/15] drm/panfrost: Expose exception types to userspace
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-6-boris.brezillon@collabora.com>
 <YNXdMK//ENHdQKUN@maud> <20210625162101.3047172f@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <cb7e886d-d59c-6086-7c5c-0070869087b1@arm.com>
Date: Fri, 25 Jun 2021 16:32:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625162101.3047172f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2021 15:21, Boris Brezillon wrote:
> On Fri, 25 Jun 2021 09:42:08 -0400
> Alyssa Rosenzweig <alyssa@collabora.com> wrote:
> 
>> I'm not convinced. Right now most of our UABI is pleasantly
>> GPU-agnostic. With this suddenly there's divergence between Midgard and
>> Bifrost uABI.
> 
> Hm, I don't see why. I mean the exception types seem to be the same,
> there are just some that are not used on Midgard and some that are no
> used on Bifrost. Are there any collisions I didn't notice?

I think the real question is: why are we exporting them if user space
doesn't want them ;) Should this be in an internal header file at least
until someone actually requests they be available to user space?

>> With that drawback in mind, could you explain the benefit?
> 
> Well, I thought having these definitions in a central place would be a
> good thing given they're not expected to change even if they might
> be per-GPU. I don't know if that changes with CSF, maybe the exception
> codes are no longer set in stone and can change with FW update...

CSF certainly means the firmware controls a lot more of this sort of
thing but AFAIK the exception types still fit in the same scheme.

Steve

>>
>> On Fri, Jun 25, 2021 at 03:33:17PM +0200, Boris Brezillon wrote:
>>> Job headers contain an exception type field which might be read and
>>> converted to a human readable string by tracing tools. Let's expose
>>> the exception type as an enum so we share the same definition.
>>>
>>> v3:
>>> * Add missing values
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  include/uapi/drm/panfrost_drm.h | 71 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 71 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
>>> index ec19db1eead8..899cd6d952d4 100644
>>> --- a/include/uapi/drm/panfrost_drm.h
>>> +++ b/include/uapi/drm/panfrost_drm.h
>>> @@ -223,6 +223,77 @@ struct drm_panfrost_madvise {
>>>  	__u32 retained;       /* out, whether backing store still exists */
>>>  };
>>>  
>>> +/* The exception types */
>>> +
>>> +enum drm_panfrost_exception_type {
>>> +	DRM_PANFROST_EXCEPTION_OK = 0x00,
>>> +	DRM_PANFROST_EXCEPTION_DONE = 0x01,
>>> +	DRM_PANFROST_EXCEPTION_INTERRUPTED = 0x02,
>>> +	DRM_PANFROST_EXCEPTION_STOPPED = 0x03,
>>> +	DRM_PANFROST_EXCEPTION_TERMINATED = 0x04,
>>> +	DRM_PANFROST_EXCEPTION_KABOOM = 0x05,
>>> +	DRM_PANFROST_EXCEPTION_EUREKA = 0x06,
>>> +	DRM_PANFROST_EXCEPTION_ACTIVE = 0x08,
>>> +	DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT = 0x40,
>>> +	DRM_PANFROST_EXCEPTION_JOB_POWER_FAULT = 0x41,
>>> +	DRM_PANFROST_EXCEPTION_JOB_READ_FAULT = 0x42,
>>> +	DRM_PANFROST_EXCEPTION_JOB_WRITE_FAULT = 0x43,
>>> +	DRM_PANFROST_EXCEPTION_JOB_AFFINITY_FAULT = 0x44,
>>> +	DRM_PANFROST_EXCEPTION_JOB_BUS_FAULT = 0x48,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_INVALID_PC = 0x50,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_INVALID_ENC = 0x51,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_TYPE_MISMATCH = 0x52,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_OPERAND_FAULT = 0x53,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_TLS_FAULT = 0x54,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_BARRIER_FAULT = 0x55,
>>> +	DRM_PANFROST_EXCEPTION_INSTR_ALIGN_FAULT = 0x56,
>>> +	DRM_PANFROST_EXCEPTION_DATA_INVALID_FAULT = 0x58,
>>> +	DRM_PANFROST_EXCEPTION_TILE_RANGE_FAULT = 0x59,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_RANGE_FAULT = 0x5a,
>>> +	DRM_PANFROST_EXCEPTION_IMPRECISE_FAULT = 0x5b,
>>> +	DRM_PANFROST_EXCEPTION_OOM = 0x60,
>>> +	DRM_PANFROST_EXCEPTION_OOM_AFBC = 0x61,
>>> +	DRM_PANFROST_EXCEPTION_UNKNOWN = 0x7f,
>>> +	DRM_PANFROST_EXCEPTION_DELAYED_BUS_FAULT = 0x80,
>>> +	DRM_PANFROST_EXCEPTION_GPU_SHAREABILITY_FAULT = 0x88,
>>> +	DRM_PANFROST_EXCEPTION_SYS_SHAREABILITY_FAULT = 0x89,
>>> +	DRM_PANFROST_EXCEPTION_GPU_CACHEABILITY_FAULT = 0x8a,
>>> +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_0 = 0xc0,
>>> +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_1 = 0xc1,
>>> +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_2 = 0xc2,
>>> +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_3 = 0xc3,
>>> +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_4 = 0xc4,
>>> +	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_IDENTITY = 0xc7,
>>> +	DRM_PANFROST_EXCEPTION_PERM_FAULT_0 = 0xc8,
>>> +	DRM_PANFROST_EXCEPTION_PERM_FAULT_1 = 0xc9,
>>> +	DRM_PANFROST_EXCEPTION_PERM_FAULT_2 = 0xca,
>>> +	DRM_PANFROST_EXCEPTION_PERM_FAULT_3 = 0xcb,
>>> +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_0 = 0xd0,
>>> +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_1 = 0xd1,
>>> +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_2 = 0xd2,
>>> +	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_3 = 0xd3,
>>> +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_0 = 0xd8,
>>> +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_1 = 0xd9,
>>> +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_2 = 0xda,
>>> +	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_3 = 0xdb,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN0 = 0xe0,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN1 = 0xe1,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN2 = 0xe2,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN3 = 0xe3,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT0 = 0xe4,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT1 = 0xe5,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT2 = 0xe6,
>>> +	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT3 = 0xe7,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_0 = 0xe8,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_1 = 0xe9,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_2 = 0xea,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_3 = 0xeb,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_0 = 0xec,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_1 = 0xed,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_2 = 0xee,
>>> +	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_3 = 0xef,
>>> +};
>>> +
>>>  #if defined(__cplusplus)
>>>  }
>>>  #endif
>>> -- 
>>> 2.31.1
>>>   
> 

