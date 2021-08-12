Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075923EA8D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 18:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9A6E435;
	Thu, 12 Aug 2021 16:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE9AE6E434;
 Thu, 12 Aug 2021 16:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id AD7C120201B;
 Thu, 12 Aug 2021 18:54:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id CkgQfxZhxIDW; Thu, 12 Aug 2021 18:54:51 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 5235720201A;
 Thu, 12 Aug 2021 18:54:51 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mEDyk-0005vC-Ag; Thu, 12 Aug 2021 18:54:50 +0200
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
 <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
 <MN2PR12MB3775E6C1ECA915283108E6D783F99@MN2PR12MB3775.namprd12.prod.outlook.com>
 <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
 <194e8a33-1705-d19c-add1-38941b6d9b5c@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Message-ID: <ae81d7d1-c111-1d24-6be0-6728ce9ba36b@daenzer.net>
Date: Thu, 12 Aug 2021 18:54:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <194e8a33-1705-d19c-add1-38941b6d9b5c@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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

On 2021-08-12 1:33 p.m., Lazar, Lijo wrote:
> On 8/12/2021 1:41 PM, Michel Dänzer wrote:
>> On 2021-08-12 7:55 a.m., Koenig, Christian wrote:
>>> Hi James,
>>>
>>> Evan seems to have understood how this all works together.
>>>
>>> See while any begin/end use critical section is active the work should not be active.
>>>
>>> When you handle only one ring you can just call cancel in begin use and schedule in end use. But when you have more than one ring you need a lock or counter to prevent concurrent work items to be started.
>>>
>>> Michelle's idea to use mod_delayed_work is a bad one because it assumes that the delayed work is still running.
>>
>> It merely assumes that the work may already have been scheduled before.
>>
>> Admittedly, I missed the cancel_delayed_work_sync calls for patch 2. While I think it can still have some effect when there's a single work item for multiple rings, as described by James, it's probably negligible, since presumably the time intervals between ring_begin_use and ring_end_use are normally much shorter than a second.
>>
>> So, while patch 2 is at worst a no-op (since mod_delayed_work is the same as schedule_delayed_work if the work hasn't been scheduled yet), I'm fine with dropping it.
>>
>>
>>> Something similar applies to the first patch I think,
>>
>> There are no cancel work calls in that case, so the commit log is accurate TTBOMK.
> 
> Curious -
> 
> For patch 1, does it make a difference if any delayed work scheduled is cancelled in the else part before proceeding?
> 
> } else if (!enable && adev->gfx.gfx_off_state) {
> cancel_delayed_work();

I tried the patch below.

While this does seem to fix the problem as well, I see a potential issue:

1. amdgpu_gfx_off_ctrl locks adev->gfx.gfx_off_mutex
2. amdgpu_device_delay_enable_gfx_off runs, blocks in mutex_lock
3. amdgpu_gfx_off_ctrl calls cancel_delayed_work_sync

I'm afraid this would deadlock? (CONFIG_PROVE_LOCKING doesn't complain though)


Maybe it's possible to fix it with cancel_delayed_work_sync somehow, but I'm not sure how offhand. (With cancel_delayed_work instead, I'm worried amdgpu_device_delay_enable_gfx_off might still enable GFXOFF in the HW immediately after amdgpu_gfx_off_ctrl unlocks the mutex. Then again, that might happen with mod_delayed_work as well...)


diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

index a0be0772c8b3..3e4585ffb9af 100644

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

@@ -570,8 +570,11 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)



        if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {

                schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);

-       } else if (!enable && adev->gfx.gfx_off_state) {

-               if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {

+       } else if (!enable) {

+               cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);

+

+               if (adev->gfx.gfx_off_state &&

+                   !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {

                        adev->gfx.gfx_off_state = false;



                        if (adev->gfx.funcs->init_spm_golden) {



-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
