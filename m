Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216F5B20CC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581210E5DF;
	Thu,  8 Sep 2022 14:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BAB10E5D6;
 Thu,  8 Sep 2022 14:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvjj/q5VNoAbsN50PjCkfOjMiyjmWNWZLIy/TZlPcmInfy2ogAKtD90YqgbSpHXrQjusQPXm4UsTxMVpNF7uoqzDYSEduZl/8W42zNBHGh/+PTs7Wep7zF5CjCpxwbWE44F+9kDEG4IWL/fi41ROhqG6lbRkWZ0rWo6gTFNz9XmMEyos03lkdTGaWmRl6J/FR+2LmXTPftCrXU99d7qc4896kTxSbMfFrQoXnqjLNkSatzaTPemHMPT9dHCwtGha2XISOsSesLE2+BNb4Mx+MkM5mWLMhiDwpt9m6GxPJohjmnZsJklx90clsepUQSp6jNo9l5PTn+ndwZsUhoEZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3kEPflfGSik/wZhcXJMt0lyo+lM1yY9SBk5ql+2/m8=;
 b=TNA/chYTJLGF6zyppy8/BFkOKGsjwgMyswdfL0Qhbkn17nL8XAVk8WA5KK3hIeZmcXvHGenGXgW3IokvRkDnLuM1l975J8BYbH9cHr7IcVmTQHT5CzSP39UBQdB7YQsZMPJhWaNWWt1h1eofnvjHqN5ODxNjr+0lJDVEBZFERz6luVUthrar1ThICdx6S2G0jSrRhIp6c1RMUqYRPjPmxUjUNXqRveBGwJ5KagUIdk1ILFhHdQv29r/MQycfECxOs73WbCMbcoVRawrYbxCwLo84qkL7VnNOTvck6nG3zIDxt1XZR/MpzwN3JzRg7qm85OrrYIjMeq088mR3GFZAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3kEPflfGSik/wZhcXJMt0lyo+lM1yY9SBk5ql+2/m8=;
 b=v6ytOnHf86D8kcTTvj3fjGPaYgiYgC9T0uXihQtzlFBCfUKlc/aBLNwm5K04vxVKzvIY+oxwg5iW32+5LVb2ezuCbNZZyKhbjrEWaHKcIvbi4Ck7NcaZ0btnoZn5m2tCNKoBe05EznHvYb/Af9BLcUZNQ6Pchs4KyjHrrvqPNOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 14:38:47 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 14:38:47 +0000
Message-ID: <afc9c570-b57b-87db-2d00-90376a030a66@amd.com>
Date: Thu, 8 Sep 2022 10:38:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-US
To: James Zhu <jamesz@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
 <f0f334ce-ca38-8a84-330e-c586fd813f58@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <f0f334ce-ca38-8a84-330e-c586fd813f58@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0094.namprd02.prod.outlook.com
 (2603:10b6:208:51::35) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: b50a85e0-2da1-4bec-b9ee-08da91a7d653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f2XV/2RZaKnpIwOJXmIugHQvriCLmcjLY+3p58vUMRawnVUPvFeHNrv4RiBrkJjIJf6jZr4bPw2dqGnmZ57ebWoVbHC+OhCK8ZPSyxRc8T3dREnO60W+8it+UVb7k7YXi7GvtzZeg9yVjRPxbO8HBLlz4HJfj1QTjhxjAamuTaiL7NZYXFocvwmPPgOi/7m4zF/urU5EwWi0omRG9jvlatTNhj6uVFhwVKt/N6qa1HCV9T07d/c/7xGDzLKYW2Sm7bELHJL70FZ6oGXYFg+NedCepJo9qdLVmo+2oBvsSBpoMctbBehGZg3tj2pHBpCz3P61fA+OGXWgez8A+5Wtr7iLDrdqzEQ0N5spK1YFD30/8o3lotAvdVMsy27fhlrfbyBZhQEOUs0PXEvvvxAUUE3/wJBI0GzI25UIjyrkAokEsp9hk52NBEzg5cSqthuYxMt4sV2fjk8JDmoIsj0vA9X0QdFyThZZo3RsV2yjSLB1LkUn6gwGIbrKmhFI7JpEtWmNuLKsb3BQmYQ234AX61Wuk3PIeaj9UW8sIBhCczH9GepnNR9wlLJ/DH4M3Mx5WyZ1Z31N/B7p4q50Bvnf1JPmMFxSGKAMC14FKkVktjQZOUa78uLdRzVIj6eSNwbwashDOvfloA8eS3fqZPZG7vZ6ukBa6joIINFZ/4hTbr9ZEWB8k40dK6qrG9lmpSrGLMBZsR2U9dgb99ekbXwSnQ2wYDGUoYI1JTcXMkTBCehc4/VxmUbWiat3eAMdstcRmGiAKxx2esPNSOMwYaT7l+THQUfBAHXaJneErBYing7YMFt+ImLvXGFaMejDzInrwVyrL0twpQiUnu0aC6E/WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(316002)(66556008)(8676002)(66476007)(66946007)(4326008)(2616005)(6486002)(450100002)(38100700002)(41300700001)(186003)(6512007)(6506007)(110136005)(53546011)(83380400001)(31686004)(26005)(44832011)(8936002)(86362001)(2906002)(5660300002)(31696002)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2F4T0NHK2N1SnZRL0pzaTF5QVloNGw5N3NNNnhCaEJ5aVdWUFM3b3VwMjUy?=
 =?utf-8?B?bUd2Y0NERk1GNitmVWVQLzBvTlphaVF2VFFDcTBEWVJMWjJWVTFmamRoYzNq?=
 =?utf-8?B?VmVCMUVIN2t5VjFINGIxaFcxRWtOK1djQzBRTTNEdG1NUGpaTXdhUXNRN00y?=
 =?utf-8?B?M084WER6VmJKSnBKYmdCL2hpSXI3cGx5ZG1xZkZORk9wc0s0U0p1OGVrZzJ6?=
 =?utf-8?B?ZnAxRnFaU0pGa3Y2amxpLytwMkhIWlB5MkJzUXVYS0VTWUlhMWRJMjNZQS92?=
 =?utf-8?B?NWtyVG96VktLVXhoOTdGUGl2cTZERGUwL2syV1lDZmJUcnNvZmN1d2dQM2ZE?=
 =?utf-8?B?eGJ5RWZScUY3UE91L1FWNnNGSzJtRUVBVFVRWEp1aldtYjRWbk1GNFhXbFQ1?=
 =?utf-8?B?ck4wZFFLM0dOSFpRSkNQc3ZFRTJKMlBGVjBGSVpaZVJHSkhTWkxzSlFNNjFG?=
 =?utf-8?B?a0d5K0lXUnlRcDIyd3lGM294TzBuRGFXM2JEUyt3KzJNMHVDeTNjSytMQzRQ?=
 =?utf-8?B?MC9qd2Fhak9YQ3p5dmtJWmRDU2xRM0RDbFBZMDdWWXRVYVFUTU5HdTc0OVgx?=
 =?utf-8?B?SUVLbng3cm81cnlMWVVicTI2REhsaEdUemM2Q09KbkdVQU5nZ2RnQzVRc1Z2?=
 =?utf-8?B?NERVRGVtb0htR3MwTTZsaU1lTytRZU5JRUNhT2ZrQWdOeUZwZXhMWk8rTlFT?=
 =?utf-8?B?RGlpOE5HellBbGNzL2NsTlJkdnpzZkpIYkFzTHdMc3NJZXo4Zml3QXRHcGpT?=
 =?utf-8?B?VFo2Z2FxS052YlA5bHF2VXZ3YVhjZ2xPSlpjdlRtNjRvLzNyU2hrRk1xNjVz?=
 =?utf-8?B?YXpEZTd4T3VicTBhNzA3WU9aNXJmTmhIVXZkdGtPdmZtZ1lZRVE4K3B4cFpK?=
 =?utf-8?B?THNSaGRRM3VmRDZyZ1lBQlg4N1hGYVhMdndDTkVhMWxmbXhBZ3lmeFUvakZn?=
 =?utf-8?B?aGxEYzNxWWR0eElIRVlFNi9yVk85RWdxNHdwQjM5MDJtUjZoWld4SjJNWk1U?=
 =?utf-8?B?SjBWVENBLzBud2hzTWJXSFdJOERMd1NIajdMQnBoeGlVVU15bVJCMzhQWDVz?=
 =?utf-8?B?eHJjdk5hanJhemtMelZad2JGMUU2STlmeE5Bb09YaVFYUkpMSjhNazZ0eDZR?=
 =?utf-8?B?eStuSGltVDRQODY5OVRnYjB1aXZkdUxaNXJIbUlocFdyZEVPcStPNmM4UE1W?=
 =?utf-8?B?Nmo3czBMQ0F3a0FGRHVpaS81SnNJTTRMcEVnYTVqcmZKZjdUQVlXVlRhZU1z?=
 =?utf-8?B?Y2dqaTgzVXJoOGZoQStjdWNVNFRlU05NMGNuYm1KcWg0RGF3UFFldkRVZEZn?=
 =?utf-8?B?TlNnekxiUkZZbXVXa214cXRLSHEzclZ3bDd3ZkpGbDExbzYzSkNPZVlRZ2dy?=
 =?utf-8?B?dnJWQytLVVpqa0FQUGxURnRIS3BYK1ovcXFEUUpVck53M0JYT0gxWGt5M3Rl?=
 =?utf-8?B?dEpLalBiNTc2RlBFNDY3cldUNGZsRTFjSjJhMVVHemdPRUZOOC9NbzRhRUJ6?=
 =?utf-8?B?UzlOSEJ5Wjh1djc0WmwzMVZXZEZDNnhITWRuTjlUUFN6TDZmUGtrQ3FDaG45?=
 =?utf-8?B?cHMwRDJVbFRZSjNBMFZ6S3dXRFhJQ2hMWTA3NnVtb3EzYnpSU1dhL3pIM3po?=
 =?utf-8?B?WU13M0t1UlY0dUdvYndGYUdiZzNhc0ZoSFF3d3E0QlV3UGptaUY0SXhBMXhH?=
 =?utf-8?B?aEt6djdkSmY3TDVObFg2eVlVUVBDcjN0RkhKdmJlMndkVm56Qy9mY2YycEJS?=
 =?utf-8?B?ODdaUGk0cXplSnZjaE5BOWpyNU1qVS8xcXlwajhYeGJTRW9zQ3ZwTy8yRUpT?=
 =?utf-8?B?TTB1SE4rUkFKWGRmSzVsK25XaFo2SjArNEhrWkJGdU1LWVpzNitYREtmb1oy?=
 =?utf-8?B?Yklva1ZmdDEyTVFNcjJQUHNOdnpaVmpUZnlOVHplSEZEVW41dUpoUloreThO?=
 =?utf-8?B?YWFDOWFYais0ZHhZYmZoVHBYK21oeGZQc2xLM0VzUnMyQ0ZXMnJ0bm9VSEYz?=
 =?utf-8?B?bHVFc0M5dGNQSzNaN2UrRHBIZkdlSVlsaWo5Y3JYTXVqWjlvQnp3OG9yamxJ?=
 =?utf-8?B?MDI3ekEzb1J4ZWQ0VWlzNm9NaUVmQkJsNHFRSjV4bis2NGtjRzlKY21TS2Y1?=
 =?utf-8?Q?b8VNBHKlKhoPSybpqOH6EqlbI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50a85e0-2da1-4bec-b9ee-08da91a7d653
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:38:46.9598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: og4RjFP9AUQDiEuTUnUMZ+D4BfutNkICrX7QKpDtqQbngdMLDxxEz3Mow8n/A4xM4XOOUwYRHJtc7V3Dm01eaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I guess it's an option but i don't really see what's the added value  ? 
You saved a few lines in this patch
but added a few lines in another. In total seems to me no to much 
difference ?

Andrey

On 2022-09-08 10:17, James Zhu wrote:
> Hi Andrey
>
> Basically this entire patch set are derived from patch [3/4]: 
> entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>
> I think no special reason to treat single and multiple schedule list 
> here.
>
> Best Regards!
>
> James
>
> On 2022-09-08 10:08 a.m., Andrey Grodzovsky wrote:
>> What's the reason for this entire patch set ?
>>
>> Andrey
>>
>> On 2022-09-07 16:57, James Zhu wrote:
>>> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
>>> struct drm_gpu_scheduler *
>>>
>>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>>> ---
>>>   include/drm/gpu_scheduler.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 0fca8f38bee4..011f70a43397 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct 
>>> drm_sched_fence *fence);
>>>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>>> *sched);
>>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>                           unsigned long remaining);
>>> -struct drm_gpu_scheduler *
>>> +struct drm_gpu_scheduler **
>>>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>                unsigned int num_sched_list);
