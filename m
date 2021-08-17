Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A93EECE4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 14:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BA06E195;
	Tue, 17 Aug 2021 12:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224CB6E194;
 Tue, 17 Aug 2021 12:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaVAdnNeHoZJXYPqIIVh+8i/CED4bdXpTASJ1PFI/bzOYTrFQxLS/uUmliJvsWtjzbIYN85pn445jGcj3hcahMq0adK1GwU8HqahzCMdIRDsl8fWtx7GC3ssk4Vr5tdOtYtzypCe7FsMliBrkH4mtsWPQ0y0NcKt2xl+BckPZoQbqM/YlqWN3F3AQH+q2c1iUuGQbbIF3BpxBNXFC0UGXENqqDPKTpmDc3hlLehVAVFprvtWeCM6y5I7sDifjc0WLy9/RBj+dPwglhcw+EtI8YnBkeu0D6oXrrX67UFaGP2o805/U+HmKvo+aF7etBUbuVHOD/dY0c8DLjzR3cKDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39R8mjznJk2NfMIkLUASzfdqXLrA9V156kKaqABg1JU=;
 b=gxHfOH1TdECy6t2XPKth6gsm5GISwt5GpxBFgOT/K1sWqjTlv8ePg3PH34nYr9fK3+tbgl+U62JCZdgVkbBpfpWVyQbaPsddFyYQ3b5g828XEn0sbLk+Xl2YTdH947Nj/Iln1oD3xR0dUrHRpNLpFXgjsXNUQb5t+JydzYBJ9D6qkCwDzOtalvG0OQMjQds1gMld5vG43EiZiAG/WhkYujjJb/yEtvdVox2gD8coMDNb+kgR7JJwlElLGLKdbGzwdLuZY/UoXkxTqR/994iLBpD0irVtUncOF2lVMOMrIDWo5YQInXf7OPSv6ivLYIpq2ool3QskhKJY5QV1fHnAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39R8mjznJk2NfMIkLUASzfdqXLrA9V156kKaqABg1JU=;
 b=00Ex681OAl7VquavC5C43KHw0x8y6jK1e8i+v2yATwYWaV/00UMUQGaI/qrjJKnJ+a1DjgYTIcoosaPozW6pCJM5GgZjpHR0PW2f+wc1L9c9AYso7pmXbVF+Oq0h+G+mOKv6qLh0ZSKc3B6UhbwYmeDzNuKTW/LWRr+ZrF9DYW0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 12:55:40 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 12:55:40 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
From: "Lazar, Lijo" <lijo.lazar@amd.com>
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
 <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
 <8461fba5-662e-85f7-b712-472232ed12ba@daenzer.net>
 <c294f4c7-7919-7b7f-4de7-ab4def8c90a3@amd.com>
 <e9aa759e-1692-b8c5-3f23-2c55af0151bc@daenzer.net>
 <c8b52f3a-f431-3dc5-b08c-b6af5f8d1d7a@amd.com>
 <a4d876a1-2e61-22bb-828f-dad5798181f7@daenzer.net>
 <d957015b-f8c5-b2ae-70e2-17bbfa5d9d22@amd.com>
Message-ID: <5748596a-488a-66fa-9ff6-f9922d71f9c3@amd.com>
Date: Tue, 17 Aug 2021 18:25:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d957015b-f8c5-b2ae-70e2-17bbfa5d9d22@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::16) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 BMXPR01CA0006.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 12:55:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cac8154-d7f3-437a-9c2a-08d9617e50e4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB510955B1975760F90A36888597FE9@BL1PR12MB5109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNZ1K3gNXiB5L6CUkHcwPLvCYM5XyTaaxjzcz+SyT77ccpn+4/o5N6YwpnIDtTZChQyt6osTKXHZV14tiJUf9keTEQVAY+DLZCm2e5q3Bkbs3BYoM0OSsjGe2k3h6lgGIs/PavUPSE9wwUCsyQb1zGcjrG/4/boOpzRNj16EP1A+zPv2va5W28LUQ2rLXDEGsuKrJknLtPbCYsYbC/gQ6TH+CcjR4FXTXtkoYHyKbFJriQ+SuSyYp60qKM1cThqjmdDKVDCZQwBWhjSXXdtJ9CVfGPW5YLJEc+4yW6y9kYQNxGDYKKGSAWCsrBtm64ctjZNCqZ35PGwt9nwTyoZY19zauid+Ac5O89Lurpwo77KeZIhIDIqbN78AJQGY3xY6U/9nKi53V4xdP9QolpKWSWqvAqSGWtyZyYqGYnqlpam0gPplRWG3aYcyjUAojm80sKFiY9NWNC4a22ca+ZrfyNkXdWVcZh9hcT6y3rF+7emwKaL0sN0goHLjR4qp9CcdEflwC+ziNo5QzYOGFvej4K9UsQ+JuPpF2rWY8mVggwxjDC4MMEpEVFXNbhLQXH2GAEzD5Wtnk3W3v39EvyEGNfQ1f/61wLSsNaXhFHvL/EK+JsZAA1Z4jUHQfM0F5k80o3NOLk6gz0RZN15UzF7V1flGyKpgB/A/tEjGi8ql/tTNQgERlZ5U5bKlVVNoC5td9P8c1LzOtPs6KNdtF8qBSbZ0x9pn6lEUyKaxo69FHs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(6666004)(6486002)(956004)(478600001)(316002)(83380400001)(31696002)(66946007)(19627235002)(53546011)(186003)(2616005)(31686004)(86362001)(66556008)(110136005)(36756003)(8676002)(66574015)(5660300002)(2906002)(54906003)(16576012)(8936002)(38100700002)(4326008)(66476007)(6636002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pXYmdvSkpZb2RDaHN4WG5HaUFkQ25RQW9idW04NysxbGxuV1NjQUROb0k2?=
 =?utf-8?B?aWdlV3dSQ3pTR3V4Q25FUlNWenlKMTdCTVViK2hUVkd3MUNrR0RUaFZFUFlB?=
 =?utf-8?B?QldzZlVnNzNteXE2eC92bitlRnpYOUczb3g3eGxtMFZWMHFyTDZzOVA0cEJx?=
 =?utf-8?B?VE9ndVQwSVhqQ3l4YzFZZ1d6RnU3TGxsV0hDYy8zR2UvQ2I2UFdOUUdjWllp?=
 =?utf-8?B?Y25uaVJxRVJkK3FTWXlscDg5bmE3cmNDREZXVEllUmVqbjJVdldlSitKT3JQ?=
 =?utf-8?B?bWpsamx6eHVCRmhsU3F1N2dscml5WkhTYXg2OTk4SlVtQ3JreGxmM3NsZ3ht?=
 =?utf-8?B?c25uN0IyOXQvR0FkVW9PZ3ErUTBncmVubkloMUkrQUloNjQ5aGNtUnV0Um5s?=
 =?utf-8?B?eHlHYi9VK25oVEk4L0UwdWlMNkhaemZyNy8vUGhmK05tQzVrYnhEeEM0ekxR?=
 =?utf-8?B?WHRKdVdMYXhXUC9XakF3Z0gwTjJ5VDNnRDZlWXhsYnRwUys5bTFHc2lGNHNt?=
 =?utf-8?B?YU9qWXJRNVI1Sk9uL1VtVmdUSGdaTVM3bmxzRWhueUJvTkd4N2h0R25nanJR?=
 =?utf-8?B?cjdDRm5GbVh3N1YzMHdCZEJSQTlNOHJuSWN0cmM1RmhjK2xjK3JtTTZvdTdV?=
 =?utf-8?B?OFlpNWRONThJQ2hES3Fvc3ZmTWpwWXFzOWYvaGFUQXRVSmFoSGd1RkVyUTAz?=
 =?utf-8?B?VmFIdExHQjFyQlNvUWZURWlNWVpieHZYSzJpMm1MS1VMZ2MrL2NBQ05ER2lG?=
 =?utf-8?B?eTl2a2JUTEMvQ0ZieU9pYVVBWEJwNWtHTlg3b0ZVVDU1d0JPcW5PSGhkcG1Y?=
 =?utf-8?B?SEt2ZDBGbm9SL3k2M3ZRUXVNbi9aS1ZDVFB1dHhUTHRySFJtWTA3K0RvQmty?=
 =?utf-8?B?bitRbmY4dmk4cUhlUDR2QXhqdjh5ZUp2SjRIdm4xT1l1dnF1WlRVcHg4SGtE?=
 =?utf-8?B?UnZMWWI5RWtpdlZCeEl5Q28yUzd2eVM5UjV5ZjI4WkRzWGRxMUZweWt5Y3RQ?=
 =?utf-8?B?RDhnY0FDZE1CR2FwMnNCanVQMnlwaXpZb2JDVUFzOWYyemc0blU4Q1VxL0pX?=
 =?utf-8?B?VXZ3Mmxxa3BJTE1OY01rejhlRHlkS1JsN1VFV21FalQzbUtielh3ODNkblc4?=
 =?utf-8?B?Mll0MHppRHlEbXFLdUluYmJIU2NVK29meUc4UjdBVDBwN3FyRDQvL2srNUh3?=
 =?utf-8?B?R2c4M09ySmg3ZFFFVEZxdlBjU0hSRTkxSXMzL0R2WmxOL1QxMUVRbzRGL2tx?=
 =?utf-8?B?bmM2RGZiYUxjbmFjaHVOblAzbm5QOWdOUEpydXBuWG9OSUdtTStOb0F3MzdF?=
 =?utf-8?B?Z2p0Smh6cVgxTG9Nb05uR05oMWpRWTdWalh6bkVLS0toU0hTTWs5SVlUbGRH?=
 =?utf-8?B?WkVPVVdodzVQZzk2M0JSWnd3UGdHcE1LNWdQaVVTcXhscG9wT1RacjViU25L?=
 =?utf-8?B?UzVjcFVIa2h5MHhnZGZ3MFNYYUU4ZFVubzJpV1lCMFJvWEorZEdTQzNIQ1JG?=
 =?utf-8?B?bFVTcG83UVBFbnR6eHBWYmNXS0lyZ2VyMXVKbnBQRm1WYlREM2RVRTdVZG1D?=
 =?utf-8?B?bzVUUkZxSk9LVmNVR3hteFZ3Y2hQQURpbGF0QytTc01CWjhFYVlOdUpEaHZT?=
 =?utf-8?B?TEVZTkJreWhPdHBodWJZZHdwemR4bE1RZG1OdzRQd3lkVDh3QUM5Y09IR3NG?=
 =?utf-8?B?cEJOR3RHcElaTTZJZVg2QUs2ZWFleE9DblJwajJqMWpmYmhieEJKVW9zU2tW?=
 =?utf-8?Q?XolXmIlMCtNZzW9u9K1ol5Ev4frtfm1yw9knr5r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cac8154-d7f3-437a-9c2a-08d9617e50e4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 12:55:40.3645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouUkB3/WChmKewN6t7q2nVc67jFp8LNsr95yXYmkU6/Mzr74XNjLv98mVjMW4ac6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
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



On 8/17/2021 5:19 PM, Lazar, Lijo wrote:
> 
> 
> On 8/17/2021 4:36 PM, Michel Dänzer wrote:
>> On 2021-08-17 12:37 p.m., Lazar, Lijo wrote:
>>>
>>>
>>> On 8/17/2021 3:29 PM, Michel Dänzer wrote:
>>>> On 2021-08-17 11:37 a.m., Lazar, Lijo wrote:
>>>>>
>>>>>
>>>>> On 8/17/2021 2:56 PM, Michel Dänzer wrote:
>>>>>> On 2021-08-17 11:12 a.m., Lazar, Lijo wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 8/17/2021 1:53 PM, Michel Dänzer wrote:
>>>>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>>
>>>>>>>> schedule_delayed_work does not push back the work if it was already
>>>>>>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>>>>>>> after the first time GFXOFF was disabled and re-enabled, even if 
>>>>>>>> GFXOFF
>>>>>>>> was disabled and re-enabled again during those 100 ms.
>>>>>>>>
>>>>>>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>>>>>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>>>>>>> disabling it again (for getting the GPU clock counter).
>>>>>>>>
>>>>>>>> To fix this, call cancel_delayed_work_sync when the disable count
>>>>>>>> transitions from 0 to 1, and only schedule the delayed work on the
>>>>>>>> reverse transition, not if the disable count was already 0. This 
>>>>>>>> makes
>>>>>>>> sure the delayed work doesn't run at unexpected times, and 
>>>>>>>> allows it to
>>>>>>>> be lock-free.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>>>>>>       mod_delayed_work.
>>>>>>>> v3:
>>>>>>>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian 
>>>>>>>> König)
>>>>>>>> v4:
>>>>>>>> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>>>>>>>>       adev->gfx.gfx_off_req_count and 
>>>>>>>> amdgpu_device_delay_enable_gfx_off
>>>>>>>>       checking for it to be 0 (Evan Quan)
>>>>>>>>
>>>>>>>> Cc: stable@vger.kernel.org
>>>>>>>> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com> # v3
>>>>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Alex, probably best to wait a bit longer before picking this up. :)
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 
>>>>>>>> +++++++++++++++-------
>>>>>>>>      2 files changed, 30 insertions(+), 17 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> index f3fd5ec710b6..f944ed858f3e 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> @@ -2777,12 +2777,11 @@ static void 
>>>>>>>> amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>>>>>>          struct amdgpu_device *adev =
>>>>>>>>              container_of(work, struct amdgpu_device, 
>>>>>>>> gfx.gfx_off_delay_work.work);
>>>>>>>>      -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>>>> -    if (!adev->gfx.gfx_off_state && 
>>>>>>>> !adev->gfx.gfx_off_req_count) {
>>>>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, 
>>>>>>>> AMD_IP_BLOCK_TYPE_GFX, true))
>>>>>>>> -            adev->gfx.gfx_off_state = true;
>>>>>>>> -    }
>>>>>>>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>>>>>>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>>>>>>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>>>>>>>> +
>>>>>>>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev, 
>>>>>>>> AMD_IP_BLOCK_TYPE_GFX, true))
>>>>>>>> +        adev->gfx.gfx_off_state = true;
>>>>>>>>      }
>>>>>>>>        /**
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c 
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>>> index a0be0772c8b3..b4ced45301be 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>>> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct 
>>>>>>>> amdgpu_device *adev, bool enable)
>>>>>>>>            mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>>>>      -    if (!enable)
>>>>>>>> -        adev->gfx.gfx_off_req_count++;
>>>>>>>> -    else if (adev->gfx.gfx_off_req_count > 0)
>>>>>>>> +    if (enable) {
>>>>>>>> +        /* If the count is already 0, it means there's an 
>>>>>>>> imbalance bug somewhere.
>>>>>>>> +         * Note that the bug may be in a different caller than 
>>>>>>>> the one which triggers the
>>>>>>>> +         * WARN_ON_ONCE.
>>>>>>>> +         */
>>>>>>>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>>>>>>> +            goto unlock;
>>>>>>>> +
>>>>>>>>              adev->gfx.gfx_off_req_count--;
>>>>>>>>      -    if (enable && !adev->gfx.gfx_off_state && 
>>>>>>>> !adev->gfx.gfx_off_req_count) {
>>>>>>>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, 
>>>>>>>> GFX_OFF_DELAY_ENABLE);
>>>>>>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>>>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, 
>>>>>>>> AMD_IP_BLOCK_TYPE_GFX, false)) {
>>>>>>>> -            adev->gfx.gfx_off_state = false;
>>>>>>>> +        if (adev->gfx.gfx_off_req_count == 0 && 
>>>>>>>> !adev->gfx.gfx_off_state)
>>>>>>>> +            
>>>>>>>> schedule_delayed_work(&adev->gfx.gfx_off_delay_work, 
>>>>>>>> GFX_OFF_DELAY_ENABLE);
>>>>>>>> +    } else {
>>>>>>>> +        if (adev->gfx.gfx_off_req_count == 0) {
>>>>>>>> +            
>>>>>>>> cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>>>>>>> +
>>>>>>>> +            if (adev->gfx.gfx_off_state &&
>>>>>>>
>>>>>>> More of a question which I didn't check last time - Is this 
>>>>>>> expected to be true when the disable call comes in first?
>>>>>>
>>>>>> My assumption is that cancel_delayed_work_sync guarantees 
>>>>>> amdgpu_device_delay_enable_gfx_off's assignment is visible here.
>>>>>>
>>>>>
>>>>> To clarify - when nothing is scheduled. If enable() is called when 
>>>>> the count is 0, it goes to unlock. Now the expectation is someone 
>>>>> to call Disable first.
>>>>
>>>> Yes, the very first amdgpu_gfx_off_ctrl call must pass enable=false, 
>>>> or it's a bug, which
>>>>
>>>>           if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>>>
>>>> will catch.
>>>>
>>>>
>>>>> Let's say  Disable() is called first, then the variable will be 
>>>>> false, right?
>>>>
>>>> Ohh, I see what you mean. The first time amdgpu_gfx_off_ctrl is 
>>>> called with enable=false, adev->gfx.gfx_off_state == false (what it 
>>>> was initialized to), so it doesn't actually disable GFXOFF in HW.
>>>
>>> Exactly.
>>
>> Turns out that's not the end of that rabbit (side-)hole yet. :)
>>
>> amdgpu_device_init initializes adev->gfx.gfx_off_req_count = 1. 
>> amdgpu_gfx_off_ctrl is then called with enable=true from 
>> amdgpu_device_init → amdgpu_device_ip_late_init → 
>> amdgpu_device_set_pg_state. This schedules 
>> amdgpu_device_delay_enable_gfx_off, which runs ~100ms later, enables 
>> GFXOFF in the HW and sets adev->gfx.gfx_off_state = true.
>>
> 
> What if a disable comes at < 100ms? Quite unlikely, neverthless in that 
> case pending work will get cancelled and the variable won't be set until 
> the work gets a chance to fully run. The assumption that GFXOFF disable 
> succeeded in a subsequent amdgpu_gfx_off_ctrl  enable = false won't be 
> correct as PMFW will by default enable GFXOFF when there is no activity.

"PMFW will by default enable GFXOFF when there is no activity."
Checked again and this is false at least for Sienna Cichlid/NV1x.Driver 
must explicitly allow GfxOff first. In that sense, driver doesn't need 
to disable GFXOFF unless it has succeeded in enabling it.

Overall, the existing logic is fine. Sorry for the confusion.

Thanks,
Lijo

> Otherwise, keep an assumption that amdgpu_device_delay_enable_gfx_off 
> gets a chance to run before any disable call comes - maybe that's the 
> case in most cases.
> 
>> So it looks fine as is actually, if a bit convoluted. 
> 
>> (I wonder if GFXOFF shouldn't rather be enabled synchronously during 
>> initialization though)
> 
> Yes, that is logical. But amdgpu_device_ip_late_init is called also 
> during amdgpu_device_resume. amdgpu_device_resume is used in pm_ops or 
> runtime pm. In those cases it makes sense to delay it as there could be 
> an immediate usage of GFX.
> 
> Thanks,
> Lijo
> 
>>
>>
