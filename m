Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A3782FF8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 20:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7370210E2A8;
	Mon, 21 Aug 2023 18:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3210E11D;
 Mon, 21 Aug 2023 18:08:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gmh5jxpj30luBnzOeB1Dh8qsnIkpOE9tTBZwp7/gUxCRxXDGknhWMyvA/TNxxEqRriPXBwIMr/6zQZDh/AJ7m48v2Ehp/RLtWk+BLgBR2CMopcxBzPalN06R/59NKCBBSque8akpGd2NDX960L/gq4mVlBgs/6rxyp7Ij/ASA2EAM3NaY6wVVs/HVKkm3N7WEC6d054J6IU0onp6yiKKYJTE4XOI38VF3C+imR5Us65bTCB4zpk6V7I9bdBqYP8zMVUmIJSsZ5uan7MWkX13WdQi3N68kei1dDcbLTlc2nLoJMqnSVBeMYN9cbfb8ktM7ztlnD1Ah0STBfaE8OdjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGBXzNkL5dnI+nvDZl+IqRqIFtsW0asEpa8GNjMVie0=;
 b=AwbetVqlhkA3dFs8m+7YbI+GuQnU04WeUa81RKQ94rpMEm+ArSIRd7S9wTwB1DcWpst7gTvmw5DpwOjTjryyhXrkIM+F/mbTiPUnv/WsAVWmqhZNWlSHmbYrUnT5dqzWkj5KAoyOZNrl94LAZ4lBisFYLjZUYmFhXCh1RdgfTD8unmb1dm29t0CRlUV4bhKN+OHnjwrIn10MztrbDAgCHkNnRJ8+IYKc322K1ZX5lD5O9FP/GwPSaZBkg7mbnCpycBuFKt4XbFvym/u8oeLZUSAFl/nAAgzXRofAb9BGALSnjc9vNN/sBj6aDqJ5IzgBE6ohg/J0jUfD41tOgLFztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGBXzNkL5dnI+nvDZl+IqRqIFtsW0asEpa8GNjMVie0=;
 b=tG1oCGctLbG+S8JET04PXi5cr57fIs83UNge1qQoXa3X30lof5i4lKGHUSDjxHfCA5l04IWRJHfVovDk6bAZFNHKNSIpHVjt9+31pqse7ExEAdgUNfNY8XjdquAh9zseCl3rEpTjkunXL0CdM0jNYOFwV6wrt8ZzU//vtMvjeuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by DS0PR12MB6581.namprd12.prod.outlook.com (2603:10b6:8:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:08:15 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 18:08:15 +0000
Message-ID: <18153a49-4b32-6053-b7fe-43ea12de45af@amd.com>
Date: Mon, 21 Aug 2023 23:38:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Arvind Yadav <Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
 <CADnq5_PreqOHyhF2v5FxViJcBO2RKjEjCCE2_RoYXoD66TX4eA@mail.gmail.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <CADnq5_PreqOHyhF2v5FxViJcBO2RKjEjCCE2_RoYXoD66TX4eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::15) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|DS0PR12MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ffe2ba-c95a-4ee9-0e15-08dba27196be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGw/O5Vilj5AnV7edKT9NEEGDK33C2PQ0EA8KSrs8fzpeflaQ3NwqUnEu4B7geyBVLpo3W6qR4jcVmNROo5sGwduX+94ag64t5MfT/oxbCjHQvrx5/4yY0ax/XORNi4Zvth0sHM5l0AqFDYMlNE+AGpVoKN3dTQQhqXD344xtYabew8L9QS7b5PfCKMnsPONfKuoZvaUgSVvDfCQCK6ZUft8K4Fnk0i3s94LIMvGs2e2Swxbc+9VvjVp5lsa4+nv3d2oBd2fvutGleY1C417E7JsIANRPIo+m1tvMVwf/mqgk5m/7Gadqbpme5Wwa1l58dkkCYnMpUA5wG5moveBEZqJfhySJ6p/ikJyiQi3HNfPzN0sMtWGE09fYzbA7TmHG+uuL51WzMlRATBbAC3SRJ/dyRIWAQ0lNEWafy+DDRcrQyJDKGYxJBkqspypAWy9sHHIl2UVcRCssphdnwinOOOLG7JTCdeID+A4TbrJUzBL/7KL8GEH7MuNWvS8qEbaB7gtBQNsN8rM1UzY8sFiqaLYSHd62k+FPa0h0a5nnmTJfVIRymaQYEaZywibw5UMuDvzsnAolSTRqISrjfcPxiTKejOesoYsb+G6lPACZg/rcduVfqlWQSaYvt3nSoPw3aWXA69s1a8uG4zPyJ88sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(2906002)(83380400001)(53546011)(6486002)(38100700002)(6506007)(5660300002)(26005)(31686004)(31696002)(8676002)(8936002)(2616005)(4326008)(66946007)(316002)(6512007)(6636002)(66556008)(66476007)(110136005)(478600001)(6666004)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUMwNjNXV2xMRlJOQ2ZmMVRJR3Z5QkNaU3pFdTZFNjFsWEY1cW45SFRzK1Fz?=
 =?utf-8?B?NmJiSHpJUEpqZGx6NWJ2R0UydWtFQ004VTZMazhYUi8rL29BOVJRU0UxeEpO?=
 =?utf-8?B?U2QvSm9qZEs2ckNHNnlBbytKajRrdmVWU0srOSs5eGM3akZXWXVZTElNSTh6?=
 =?utf-8?B?NHljSktNV2pVZTVzYjFvNmJWNVlLamZpdkNIWEd4YzhnRVRVbzN3SWc1KzZr?=
 =?utf-8?B?YlgyMjU1ZkVwTXNoSTdRaFBQQWFaMTU2aEtoOTgyWnE4NHBBandkS0hSSzdM?=
 =?utf-8?B?elp2NjZFZVVRNk1JL1ZVbzBNMEhSZ2tTTk5EYnY2bUpOTDdwZTFoRXVlOGxH?=
 =?utf-8?B?T2VyZ3VPVGJjY29EbVZWUFpCZDdSWWs5M0txdUgvOFR3elRxb2Fsbkt1NFN2?=
 =?utf-8?B?S0xZOEZLMlpybVVrc0gyQ0thWkZNUENBcWxFcmUvaGZlb1NobU1IUFgxeFRp?=
 =?utf-8?B?U05OVWVqdWNRRXN6WUhRZWpldkRuNzFnSmUwSXVmdTRTZktPQ1AwV2xySkZX?=
 =?utf-8?B?dXMrNWxUMmtQRzJwTExncTNsdWFtRFFibHBpajV4TTNOeFIvQWJQeHBFL2JQ?=
 =?utf-8?B?VEVyTStsTDdnRGVYckZma0NLR1AvRUVXdTcwSnVvRkZ1WnFnZUFRR3NGQlB6?=
 =?utf-8?B?SmNDRUdzeUprMzcyZmI2UldvUWh5UnhESzBpNHNodE1WT2pxNHVvV0JTRW1Q?=
 =?utf-8?B?V21vK0NhRm4xZ1l5YWtZNDRqalVsVkp5bGQrZS9WVENjcFptdE9zdWxsZzBk?=
 =?utf-8?B?ZkpVbE5uV0NEYnArZGpXR1pKNnJNbHZZNnJQYXFHbVBaYW9URlpRNXBXVUNC?=
 =?utf-8?B?b1JJTy9JK2owQ2cwRC9NSmpQR01ScE1GelB5REQ0ajhCcUpTQzRaMWZIc3U1?=
 =?utf-8?B?WlNYZ21qZWRUTU9xSThocU5yQXFYbTlEU0JNbFVDOUZHekxmWkZCcDdteW9D?=
 =?utf-8?B?ZTBnbEFmc2kyZmc3UERWVHFaK0cwUzFIaTQ2ejJzZFdkZ1VrQUxKTUpDZE5l?=
 =?utf-8?B?bFlad1RTTGdzQTJLRlZ4T0lub1RsSzlVc21ZbFAvWUpVdnVRbzluS1VkN01F?=
 =?utf-8?B?SWFYNldMWWNxNjNxdGhySkwxKytvMGpnc1hackdUNkIxMC8rcVVIbThXdXVa?=
 =?utf-8?B?dkpzMGV0bEUxclBXMHlWMXIvMVZOY2FHWExMYkJtSkFpL3p2NzVCcDNGczY5?=
 =?utf-8?B?WVdEVC9oWnBKK1lVMmpsWlJOMTBkVUlrbG9uWjJVQTEvZGtNQnBValgyTUdE?=
 =?utf-8?B?R2puRlFZTWVJMHZQdEt2QWZPbEJJcmRkaXB0MWkrTDFlQXpFWUN3WUNQbVd3?=
 =?utf-8?B?cjB0T2x2YW9mU1d2eVQ1c1ZScnBGcVhTYjJESlF2dmViQXIwbTloU1B2ODRR?=
 =?utf-8?B?ZXZFakJhRVVzVUFDdURJaklQWlkybzlrYUJhb3hVaDFiV21pRFhWSzcxS2xB?=
 =?utf-8?B?bHVCdWxsa2pSTUowNUg5cUpYYW9ZU0hBUURpZi9VUnFsUFdZSU9FZFAvU3Y0?=
 =?utf-8?B?Y095ZFVxR2FoakJpd3htUXVvd1BmUFRJOXZmYVJkeXdiMVhudE9nN0xheHFh?=
 =?utf-8?B?RGcwNlNWeWxQRFUzMDJoaS92SFF4YzVNK1BnZG1FZGpmZmJzRWdDMmxKSloz?=
 =?utf-8?B?bXZiTk1xZ3NldjBWb1RIVjZFQzRRNzdNRzNML3N2NHg2ODAwSS9MNXl4N215?=
 =?utf-8?B?eHdkbzMxeWM5TE8zT3cwVWlDdUNZa0VqMm0yYlRzVjVpMDZ0UUpaYkhnUEYv?=
 =?utf-8?B?akpVRjR3d0lYRGlMaytRdUtZLzM1T25GUXJ1QnFuSUdSSjRxMHZWYmg2V0cx?=
 =?utf-8?B?WENxOXpzNlo2Rm5PNTd5WmZrYWtJUjc3ZTBZUjJCZnFrVVNZaEtwSmd5Wmht?=
 =?utf-8?B?YlNTRnpZb1BDKy9zcFR6R0d1WE1YU1oyd2daYkJXaGNXMC9zZk1sMFdLQkNv?=
 =?utf-8?B?MDNzYWRjSTVvTnVLMXhvUVA0d3drUThTNHdPUGVTb2xvdWtYeWsvay83cm5s?=
 =?utf-8?B?NlFMSEZBVStrcFhOc3RDekJPVWlYczczNE5nRGlicTNvTnNlM0Jad0t3Q01s?=
 =?utf-8?B?aW54ZEc3a0JDeDN6OFd1ZUpzUjVmV3RmSytHK29uQU5SOEtjK2E4S0k5VDBy?=
 =?utf-8?Q?xYe/U5aYxMPIn8m6Sc9Bykvpf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ffe2ba-c95a-4ee9-0e15-08dba27196be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:08:15.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jwa1NNoucrgo0Jhh0PnnhiUDROoMtObZBbZVW7zAcbmG6Hsr6YoHQAWyGvzAiXfDAnYAr7vHly3yi2R8JMWUbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6581
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
Cc: shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/21/2023 11:36 PM, Alex Deucher wrote:
> On Mon, Aug 21, 2023 at 2:55 AM Arvind Yadav <Arvind.Yadav@amd.com> wrote:
>> This patch adds a function which will change the GPU
>> power profile based on a submitted job. This can optimize
>> the power performance when the workload is on.
>>
>> v2:
>> - Splitting workload_profile_set and workload_profile_put
>>    into two separate patches.
>> - Addressed review comment.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> index 32166f482f77..e661cc5b3d92 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -24,6 +24,62 @@
>>
>>   #include "amdgpu.h"
>>
>> +static enum PP_SMC_POWER_PROFILE
>> +ring_to_power_profile(uint32_t ring_type)
>> +{
>> +       switch (ring_type) {
>> +       case AMDGPU_RING_TYPE_GFX:
>> +               return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>> +       case AMDGPU_RING_TYPE_COMPUTE:
>> +               return PP_SMC_POWER_PROFILE_COMPUTE;
>> +       case AMDGPU_RING_TYPE_UVD:
>> +       case AMDGPU_RING_TYPE_VCE:
>> +       case AMDGPU_RING_TYPE_UVD_ENC:
>> +       case AMDGPU_RING_TYPE_VCN_DEC:
>> +       case AMDGPU_RING_TYPE_VCN_ENC:
>> +       case AMDGPU_RING_TYPE_VCN_JPEG:
>> +               return PP_SMC_POWER_PROFILE_VIDEO;
>> +       default:
>> +               return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>> +       }
>> +}
>> +
>> +static int
>> +amdgpu_power_profile_set(struct amdgpu_device *adev,
>> +                        enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +       int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
>> +
>> +       if (!ret) {
>> +               /* Set the bit for the submitted workload profile */
>> +               adev->smu_workload.submit_workload_status |= (1 << profile);
>> +               atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>> +                                uint32_t ring_type)
> Maybe rename this amdgpu_workload_profile_get() to align with put/get
> naming semantics?
Noted.
>
> Alex
>
>> +{
>> +       struct amdgpu_smu_workload *workload = &adev->smu_workload;
>> +       enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
>> +       int ret;
>> +
>> +       if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +               return;
>> +
>> +       mutex_lock(&workload->workload_lock);
>> +
>> +       ret = amdgpu_power_profile_set(adev, profile);
>> +       if (ret) {
>> +               DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>> +                        amdgpu_workload_mode_name[profile], ret);
>> +       }
>> +
>> +       mutex_unlock(&workload->workload_lock);
>> +}
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>   {
>>          adev->smu_workload.adev = adev;
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> index 5d0f068422d4..5022f28fc2f9 100644
>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
>>          "Window3D"
>>   };
>>
>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>> +                                uint32_t ring_type);
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>
>>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
>> --
>> 2.34.1
>>
