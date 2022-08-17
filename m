Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506F5979DA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 00:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3268AF9DB;
	Wed, 17 Aug 2022 22:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4093CAF9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 22:57:53 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D8A3B6601A13;
 Wed, 17 Aug 2022 23:57:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660777071;
 bh=TxAbi6e312VFgURSiMw/SYGlkhUqLRcFFtpaFQ+YP6c=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=bVhJ/k51+xGX/7nvmFj9Ku+ALaJV+LAmu2Bewec3le1Rz852ioLPvOSQZjvUUzVDY
 skjSNQfCe4YwezLyU+7KXqp15kUUZG1/j3RH61+VGYWSV5Kk5vQqb4yRCMuHfFD/QP
 BrQSvwPsbb5kDx8m6EViKnJjPv6jOXGVZa6x4WlQBlLUBHX9NmtAYpAaEhZkc+YILu
 +oOctra9txmzzu/PmRtKRMFsn/ZynZBqg09pfanq72QADeKrWPl6W8Ef8DMFPy+py3
 lwvDrCTwzkMCz3Jh/uRc47RGL4ble5AI773heECnaAfoq+nyYfbyjx52ayk6OK2xmZ
 Ewz1pZXJAuR5Q==
Message-ID: <ff28e1b4-cda2-14b8-b9bf-10706ae52cac@collabora.com>
Date: Thu, 18 Aug 2022 01:57:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
 <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
 <57562db8-bacf-e82d-8417-ab6343c1d2fa@amd.com>
 <86a87de8-24a9-3c53-3ac7-612ca97e41df@collabora.com>
 <8f749cd0-9a04-7c72-6a4f-a42d501e1489@amd.com>
 <5340d876-62b8-8a64-aa6d-7736c2c8710f@collabora.com>
 <594f1013-b925-3c75-be61-2d649f5ca54e@amd.com>
 <6893d5e9-4b60-0efb-2a87-698b1bcda63e@collabora.com>
 <73e5ed8d-0d25-7d44-8fa2-e1d61b1f5a04@amd.com>
 <c9d89644-409e-0363-69f0-a3b8f2ef0ae4@collabora.com>
 <6effcd33-8cc3-a4e0-3608-b9cef7a76da7@collabora.com>
In-Reply-To: <6effcd33-8cc3-a4e0-3608-b9cef7a76da7@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 18:54, Dmitry Osipenko wrote:
> On 8/15/22 17:57, Dmitry Osipenko wrote:
>> On 8/15/22 16:53, Christian König wrote:
>>> Am 15.08.22 um 15:45 schrieb Dmitry Osipenko:
>>>> [SNIP]
>>>>> Well that comment sounds like KVM is doing the right thing, so I'm
>>>>> wondering what exactly is going on here.
>>>> KVM actually doesn't hold the page reference, it takes the temporal
>>>> reference during page fault and then drops the reference once page is
>>>> mapped, IIUC. Is it still illegal for TTM? Or there is a possibility for
>>>> a race condition here?
>>>>
>>>
>>> Well the question is why does KVM grab the page reference in the first
>>> place?
>>>
>>> If that is to prevent the mapping from changing then yes that's illegal
>>> and won't work. It can always happen that you grab the address, solve
>>> the fault and then immediately fault again because the address you just
>>> grabbed is invalidated.
>>>
>>> If it's for some other reason than we should probably investigate if we
>>> shouldn't stop doing this.
>>
>> CC: +Paolo Bonzini who introduced this code
>>
>> commit add6a0cd1c5ba51b201e1361b05a5df817083618
>> Author: Paolo Bonzini <pbonzini@redhat.com>
>> Date:   Tue Jun 7 17:51:18 2016 +0200
>>
>>     KVM: MMU: try to fix up page faults before giving up
>>
>>     The vGPU folks would like to trap the first access to a BAR by setting
>>     vm_ops on the VMAs produced by mmap-ing a VFIO device.  The fault
>> handler
>>     then can use remap_pfn_range to place some non-reserved pages in the
>> VMA.
>>
>>     This kind of VM_PFNMAP mapping is not handled by KVM, but follow_pfn
>>     and fixup_user_fault together help supporting it.  The patch also
>> supports
>>     VM_MIXEDMAP vmas where the pfns are not reserved and thus subject to
>>     reference counting.
>>
>> @Paolo,
>> https://lore.kernel.org/dri-devel/73e5ed8d-0d25-7d44-8fa2-e1d61b1f5a04@amd.com/T/#m7647ce5f8c4749599d2c6bc15a2b45f8d8cf8154
>>
> 
> If we need to bump the refcount only for VM_MIXEDMAP and not for
> VM_PFNMAP, then perhaps we could add a flag for that to the kvm_main
> code that will denote to kvm_release_page_clean whether it needs to put
> the page?

The other variant that kind of works is to mark TTM pages reserved using
SetPageReserved/ClearPageReserved, telling KVM not to mess with the page
struct. But the potential consequences of doing this are unclear to me.

Christian, do you think we can do it?

-- 
Best regards,
Dmitry
