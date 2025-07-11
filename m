Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E6B02200
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 18:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3036610EA8B;
	Fri, 11 Jul 2025 16:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2C9C10EA7D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 16:40:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B800316F8;
 Fri, 11 Jul 2025 09:40:29 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3643F6A8;
 Fri, 11 Jul 2025 09:40:37 -0700 (PDT)
Message-ID: <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
Date: Fri, 11 Jul 2025 17:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
 <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
 <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2025 5:00 pm, Tomeu Vizoso wrote:
> On Tue, Jun 24, 2025 at 3:50 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
>> [...]
>>> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
>>> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f826c5002a6c0ecbf9aed4 100644
>>> --- a/drivers/accel/rocket/rocket_device.h
>>> +++ b/drivers/accel/rocket/rocket_device.h
>>> @@ -13,6 +13,8 @@
>>>    struct rocket_device {
>>>        struct drm_device ddev;
>>>
>>> +     struct mutex sched_lock;
>>> +
>>>        struct mutex iommu_lock;
>>
>> Just realised I missed this in the last patch, but iommu_lock appears to
>> be completely unnecessary now.
>>
>>>        struct rocket_core *cores;
>> [...]
>>> +static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
>>> +{
>>> +     struct rocket_task *task;
>>> +     bool task_pp_en = 1;
>>> +     bool task_count = 1;
>>> +
>>> +     /* GO ! */
>>> +
>>> +     /* Don't queue the job if a reset is in progress */
>>> +     if (atomic_read(&core->reset.pending))
>>> +             return;
>>> +
>>> +     task = &job->tasks[job->next_task_idx];
>>> +     job->next_task_idx++;
>>> +
>>> +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
>>> +
>>> +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
>>> +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
>>
>> Those really look like bitfield operations rather than actual arithmetic
>> to me.
>>
>>> +
>>> +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
>>
>> I don't see how regcmd is created (I guess that's in userspace?), but
>> given that it's explicitly u64 all the way through - and especially
>> since you claim to support 40-bit DMA addresses - it definitely seems
>> suspicious that the upper 32 bits never seem to be consumed anywhere :/
> 
> Yeah, but there's no other register for BASE_ADDRESS address in the TRM.

That only reaffirms the question then - if this value is only ever 
written verbatim to a 32-bit register, why is it 64-bit?

Thanks,
Robin.
