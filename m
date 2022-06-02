Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD153B31B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 07:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33771133D8;
	Thu,  2 Jun 2022 05:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615E61133D4;
 Thu,  2 Jun 2022 05:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654148538; x=1685684538;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cAigtFrYpjM8aiEGkIP9ue5YoGZzqzs6qR3NKEHgUcM=;
 b=Gm/Vd0WIki4f7EmQFtSvyYJPYyNX3V9vuSymK5K6AwgA2dz7Oz2mFcEB
 rM8+aCVb5sun/OpD8IWw880Ns8Bn/bri7AIkHInzx46vxP3XDGTmvVkTB
 lBP0d1cWZ4hqPQqTL7yR8Syr+WLiy54qqopesyeoEovtcJ8J/zC0mtNpV
 tooyU1f7FZTbzaK0Z3m9QcGR/qXK/aRIOUBC+aK6HJLctotxN7bK2OM0S
 ZQcDyU837bm7oCMEWndYWlapUyMRhgpZAHPw0GMl8QUU7wPHTszvFHw2t
 1hONia9tAnOWW3TIRk8LrZKI4aZLN2eA8n5Bzm6gxZnrcQQq0AK5hYQKu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273397985"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="273397985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 22:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="606659316"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2022 22:42:16 -0700
Received: from [10.249.138.186] (aakhrem-mobl.ger.corp.intel.com
 [10.249.138.186])
 by linux.intel.com (Postfix) with ESMTP id 2C20D580931;
 Wed,  1 Jun 2022 22:42:13 -0700 (PDT)
Message-ID: <2508922c-dae7-af05-0feb-9c4b63411a8c@intel.com>
Date: Thu, 2 Jun 2022 08:42:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601211849.GA30517@jons-linux-dev-box>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220601211849.GA30517@jons-linux-dev-box>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, chris.p.wilson@intel.com, daniel.vetter@intel.com,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2022 00:18, Matthew Brost wrote:
> On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
>> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
>>> +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
>>> +async worker. The binding and unbinding will work like a special GPU engine.
>>> +The binding and unbinding operations are serialized and will wait on specified
>>> +input fences before the operation and will signal the output fences upon the
>>> +completion of the operation. Due to serialization, completion of an operation
>>> +will also indicate that all previous operations are also complete.
>> I guess we should avoid saying "will immediately start binding/unbinding" if
>> there are fences involved.
>>
>> And the fact that it's happening in an async worker seem to imply it's not
>> immediate.
>>
>>
>> I have a question on the behavior of the bind operation when no input fence
>> is provided. Let say I do :
>>
>> VM_BIND (out_fence=fence1)
>>
>> VM_BIND (out_fence=fence2)
>>
>> VM_BIND (out_fence=fence3)
>>
>>
>> In what order are the fences going to be signaled?
>>
>> In the order of VM_BIND ioctls? Or out of order?
>>
>> Because you wrote "serialized I assume it's : in order
>>
>>
>> One thing I didn't realize is that because we only get one "VM_BIND" engine,
>> there is a disconnect from the Vulkan specification.
>>
>> In Vulkan VM_BIND operations are serialized but per engine.
>>
>> So you could have something like this :
>>
>> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
>>
>> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>>
> Question - let's say this done after the above operations:
>
> EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
>
> Is the exec ordered with respected to bind (i.e. would fence3 & 4 be
> signaled before the exec starts)?
>
> Matt


Hi Matt,

 From the vulkan point of view, everything is serialized within an 
engine (we map that to a VkQueue).

So with :

EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)

EXEC completes first then VM_BIND executes.


To be even clearer :

EXEC (engine=ccs0, in_fence=fence2, out_fence=NULL)
VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)


EXEC will wait until fence2 is signaled.
Once fence2 is signaled, EXEC proceeds, finishes and only after it is done, VM_BIND executes.

It would kind of like having the VM_BIND operation be another batch executed from the ringbuffer buffer.

-Lionel


>
>> fence1 is not signaled
>>
>> fence3 is signaled
>>
>> So the second VM_BIND will proceed before the first VM_BIND.
>>
>>
>> I guess we can deal with that scenario in userspace by doing the wait
>> ourselves in one thread per engines.
>>
>> But then it makes the VM_BIND input fences useless.
>>
>>
>> Daniel : what do you think? Should be rework this or just deal with wait
>> fences in userspace?
>>
>>
>> Sorry I noticed this late.
>>
>>
>> -Lionel
>>
>>

