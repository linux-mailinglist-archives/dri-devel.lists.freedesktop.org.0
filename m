Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B43EEA04
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D226E147;
	Tue, 17 Aug 2021 09:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E17D6E141;
 Tue, 17 Aug 2021 09:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keLeug2tWmDdsmp5xZaip02tnqiS/FL0ezT0Q4f9JyGKblUKaJLxgzzxONCk98WP+VqJBFnsrgohTBhfLrwWUIwz3elP8dczxzu4R99/K1IOJDoIE7nD/T9heRP8raJZukNtpVG0hwVYuc9L3ptHLhEx7GWG4uN5LnFIVw41Dt17aXRI4QqESORA2QzHiNnHKJS8L69Yy1LuJjkKVOyq3EdNZ8hyYOu5tbSrNeFMW819oj9dcIyCO2JqcqBb8ffs02nZyqMGm9S1Bfah3l3RIhTZ1cDyqLmY+1e5QuB7cNxfwwM1DVcv4ApwUsPCB/rd1QijlztLUYiydlrdmcUc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y4zxlPDg/lkWBeYk5NEcc7a7HWWq0KL+rxPHs/0Gxc=;
 b=FDWTYqRNskyd4EILaAq5Iz36EUI6HI49aKsJsXP8CoKCMBIvklbPuVc+QFGLDYiS0WgBgl7vNN8BC6hJlF3uJ6vc/EJBgyU7yIOgaZIcAabuZeVzsP3I3Jb3Lw9dHoy4bOE0YkI2QRbBUNcr0tLGBxjCgpKnyC2sJ+POcNOb4hhJHwOTR/UyJ2Z+pxAN0pWEVHcNQcbiSSzlaAG71NwyX5Eq9TizSbH4CTX+AslfbIxhSj4LeXVNGOY6Vp0Gi1/p7NIb5YN8ai3u3TBsWXARZ1a28FoHBVQTiD8U7WJqm9XNRoMuYjlVNen20YYkJ9f0ZZB73idFBR9x+ZiPCo1a/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y4zxlPDg/lkWBeYk5NEcc7a7HWWq0KL+rxPHs/0Gxc=;
 b=nX8pABKA+9irjy0sYmUD3sfZ2LTQCNI/keAUmF8pYLEtYVS1GGzZw0MhnyC9Xbh8v4BaiRFxmL6OSx8/VYU6rTV1ChmH+lucGRBW0DKmdYyNZvUZQHoepYdfSHdDzT+xGSFoay4WuaekDzpI0ZMKGFEiQ681YVyRoSVfAXSCzqA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL0PR12MB5508.namprd12.prod.outlook.com (2603:10b6:208:1c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 09:37:17 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 09:37:16 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
 <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
 <8461fba5-662e-85f7-b712-472232ed12ba@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <c294f4c7-7919-7b7f-4de7-ab4def8c90a3@amd.com>
Date: Tue, 17 Aug 2021 15:07:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8461fba5-662e-85f7-b712-472232ed12ba@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::10) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN2PR01CA0005.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 09:37:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3110616-7049-4ccf-6e7c-08d9616299fd
X-MS-TrafficTypeDiagnostic: BL0PR12MB5508:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5508F64AD28F042F86CE6C5397FE9@BL0PR12MB5508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1ZFwEC+iCj9I7ORM5ELUwN9j5Dgb+9b0M+yp6Zt792/RMZ1eOfCmEDBlfRSpX5g3BTYloYKsasxpKbJxnOnwYwoNxZkKxchGmXqG2QF5MyNjdQyTXuAXnBYtN3sgFzmamRjYLjHghXVFgayZWEvVAFYpnDKSk14FM1Mil+Cz8Pca5yKvzxKMkzKccJ8jO6zOgD+F2vR8brZDZaXn4FZY1j56bYzGORZ6s0vRiqB16rF7qw5NWzaYg3IUxP8EA5C0LHp8iEcWExrhuA0hgvegEygzI0OAHxToltmaYw/Gl9lpZ8nbrR/epQGjjGfyYcWvPxe6ynVgKJhWo9u/QC8vQGD7CtYPYphZSJKmq+zjFrUJRAa0gsDO98WAj7I20hLWsanwJKjahPQ2gCiM4yIABqQPXYEyKfbjx5KaBnLD9/8H5uNjU7mh2DcTLnAIc5gNJhPf5HAek7U7/vGZo6B42QbDRj1jmGCPxvC/mArGUtCU1HAUsYZ/vV73XYj0H4bTt59OMSw0FoHkMEZVBZ5MJCBYFWx/xeuoGd70ZJl57oP9NoGZvzvCeXh4/0FpT9zxqdCIp4TfHCakqs6+eGNP5gaRC5d74zO4+LIFH9no+bttSjtsrIx5XlwJcUIvXnsjNL0oH8jxIvKEQ2DzqCtQjmP02M0T8qpUqchFWvWhTK6U+pkNhKeGVng+d1Ii8h72d1wG9c88gFmpfx05swrWXHudMxE06j6RnnjcQ7vIME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(54906003)(26005)(31686004)(2906002)(6636002)(316002)(16576012)(5660300002)(8676002)(478600001)(110136005)(66946007)(66556008)(36756003)(6666004)(38100700002)(6486002)(83380400001)(66574015)(186003)(53546011)(86362001)(4326008)(31696002)(8936002)(2616005)(66476007)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTVVdlhzVk01VjE5THNYZUFrdk5MSmJxK2lWSFhITnl3Y3IzR2x4UktVam9I?=
 =?utf-8?B?dTl0YmtzYk5XcU1IUlVHU1VTZlNXRXU2OTdoYzl0bHFqa2l5bWRmMllrd0E5?=
 =?utf-8?B?Rk9zc2s2V1czSTRvYWRXQWlNdG5NM2taaTFUbzNLSEJXQS9tTkViUE02TjVB?=
 =?utf-8?B?NE1OSCtmS091SlllbWpTWE1vR2kvcDluRnV1alVWNkRFVHVDWTJpclVleDBw?=
 =?utf-8?B?OVJoVzBQTGdmTVZhTjduakhuNTVLbkNISEdHbmtrTTF5MFJEdzV5R0xiQnN3?=
 =?utf-8?B?R0FKTDNaa0JVWjQ0OEJZVm1ZWGZqYmc3TGIzdFBvaDRvdVlJR05MamtnS09r?=
 =?utf-8?B?ZnFEbDhERlV2cnBKbTR6VVVRSU5aSVpoa3dGSGI5R09XcStyTUN4R0RJUHF2?=
 =?utf-8?B?dDZXWjNtc0dhaWtCeEJCNnVWUDBETWhGaGphWE9rM3NvSkp1dXJUbEs5bXZa?=
 =?utf-8?B?REtsdXhiRlZGVW5EWTVxVEhkNFp1dzVzLzQ0UU5yVDdtUWp6Z2cwZng4UzVU?=
 =?utf-8?B?UERVb3Jkem50MkVOZU5pakxFWHdPeis2UmxzNjR0b1dnTlBML1RtNm9YUzlO?=
 =?utf-8?B?djdqY1lLZEk1ZWxxTEpWSEQxMmlUcjR1WkVTZWRHemNObkNDQlJJTUtUVmRC?=
 =?utf-8?B?bUFZWWV3UDdQalV0OFZKQWlaZzMvN3dTQVZ0dWdiTGxnWm5nSlg2TmhDaHcw?=
 =?utf-8?B?U2xxbHlUOVA4Vk5MWmJxKzRKMjNBSzNBdEE1dzdra21ieGJwcmlQQTBjaVBV?=
 =?utf-8?B?VEZMY055UDNYWTlCUGpnREpUNW0zOGRlUzhBS1B1dzY3VmY2eUU5dG96dHFr?=
 =?utf-8?B?MlVxM245SzZhdkhnSkZyWlpGS0RmUVZPVnhKZElZdEJnTXJCMExWZWxWbWpM?=
 =?utf-8?B?QXdWUGQwU3pidER2M3dSRWVsNVA2QXpuK1JQc2xDcjBZTnFLK0NtZmpISExW?=
 =?utf-8?B?NlcrVTdXTUNXZDdUNDVxODVxVHlJNGJoclRKZWJ1TGpGSXBSS05kV1BGWHFz?=
 =?utf-8?B?SGxicnJzSllRbEVmWTlZME1tQjNSR0JiL3I1R2hvUlNlcllJdzJOYitYcG5s?=
 =?utf-8?B?TVVZVGNXWkJXMjNxT0hqZ1Uxd1ZrbEFnTTVlUXhuT2dnWDl3V2hVNEI1T21k?=
 =?utf-8?B?c3VHYjBSajBXY21BOE5NbWlmOFV2TkFJSlVDZ214SThjQ3NOd0l4elZZZFI1?=
 =?utf-8?B?cXpHOXdSb0NtVFRNNFU5UEVpYUpEVFVZeTdBUVNSNlRUcWdZN05JS3pKZmwx?=
 =?utf-8?B?Wi9CT1BDY0JUbjZwbGFUbk40MEZaQXJDRCtHZzdGaUJEWHZWN0xMZmVmeUhU?=
 =?utf-8?B?S2VLakhSeXpONXNsa0owRVNGdlZ5d1g2cU13aUhjR3IwNnpqRkN4ZnF2a3h3?=
 =?utf-8?B?U1hoNVVBemh3Z25rVld5ODI4Qko3eUJKRXI4MFVQQmlETDYwM2xDU29uL2hY?=
 =?utf-8?B?VjY3TThNV1pDSGdHR0hNUWwwaEozY0VDM1pvVHpwR3A0Q3Y0VUJqa3U2QXlj?=
 =?utf-8?B?cml2SjJ1YnljR0FjTHZ1cTl6YzIrVmpmQUhjNE5PMDNXZVVocE1tKzQ3ZWpq?=
 =?utf-8?B?andDS2hFV2J2ZW9IclQreWtYWUN0T3NVYzluRUpRQ3JEVXhTWngwRWdsV0E5?=
 =?utf-8?B?U3ZBcStrQ2p5RWpzbEs2UExCRjQzU1JJLzhEZlZpRC8yN2c5UGFtWWdjaU1N?=
 =?utf-8?B?TkNpdVJOczJJc3kvcGU3SG5Xa2pGeGptVmV1V0d6ZzlTTTZTZ3B2dDMyL08y?=
 =?utf-8?Q?QCEC5bUBwrMvAd4yQoQF1BITcQGguin+UqOi5Zv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3110616-7049-4ccf-6e7c-08d9616299fd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 09:37:16.9002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx2Jht1/dAHjF29NEOOz1XI2k8arLIfd4dEVENdixASXy7+KbK6L5QGtLM+RAbvb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5508
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



On 8/17/2021 2:56 PM, Michel Dänzer wrote:
> On 2021-08-17 11:12 a.m., Lazar, Lijo wrote:
>>
>>
>> On 8/17/2021 1:53 PM, Michel Dänzer wrote:
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> schedule_delayed_work does not push back the work if it was already
>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>> was disabled and re-enabled again during those 100 ms.
>>>
>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>> disabling it again (for getting the GPU clock counter).
>>>
>>> To fix this, call cancel_delayed_work_sync when the disable count
>>> transitions from 0 to 1, and only schedule the delayed work on the
>>> reverse transition, not if the disable count was already 0. This makes
>>> sure the delayed work doesn't run at unexpected times, and allows it to
>>> be lock-free.
>>>
>>> v2:
>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>     mod_delayed_work.
>>> v3:
>>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>>> v4:
>>> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>>>     adev->gfx.gfx_off_req_count and amdgpu_device_delay_enable_gfx_off
>>>     checking for it to be 0 (Evan Quan)
>>>
>>> Cc: stable@vger.kernel.org
>>> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
>>> Acked-by: Christian König <christian.koenig@amd.com> # v3
>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>> ---
>>>
>>> Alex, probably best to wait a bit longer before picking this up. :)
>>>
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++-------
>>>    2 files changed, 30 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index f3fd5ec710b6..f944ed858f3e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>        struct amdgpu_device *adev =
>>>            container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>    -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>> -            adev->gfx.gfx_off_state = true;
>>> -    }
>>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>>> +
>>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>> +        adev->gfx.gfx_off_state = true;
>>>    }
>>>      /**
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> index a0be0772c8b3..b4ced45301be 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>>          mutex_lock(&adev->gfx.gfx_off_mutex);
>>>    -    if (!enable)
>>> -        adev->gfx.gfx_off_req_count++;
>>> -    else if (adev->gfx.gfx_off_req_count > 0)
>>> +    if (enable) {
>>> +        /* If the count is already 0, it means there's an imbalance bug somewhere.
>>> +         * Note that the bug may be in a different caller than the one which triggers the
>>> +         * WARN_ON_ONCE.
>>> +         */
>>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>> +            goto unlock;
>>> +
>>>            adev->gfx.gfx_off_req_count--;
>>>    -    if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>>> -            adev->gfx.gfx_off_state = false;
>>> +        if (adev->gfx.gfx_off_req_count == 0 && !adev->gfx.gfx_off_state)
>>> +            schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>> +    } else {
>>> +        if (adev->gfx.gfx_off_req_count == 0) {
>>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>> +
>>> +            if (adev->gfx.gfx_off_state &&
>>
>> More of a question which I didn't check last time - Is this expected to be true when the disable call comes in first?
> 
> My assumption is that cancel_delayed_work_sync guarantees amdgpu_device_delay_enable_gfx_off's assignment is visible here.
> 

To clarify - when nothing is scheduled. If enable() is called when the 
count is 0, it goes to unlock. Now the expectation is someone to call 
Disable first.  Let's say  Disable() is called first, then the variable 
will be false, right?

Thanks,
Lijo
