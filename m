Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E26878202
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510C010F5CD;
	Mon, 11 Mar 2024 14:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v08lnKaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BA1112AD3;
 Mon, 11 Mar 2024 14:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9WQmBUP6uVKi8DMUxW088sREbHh7Y213mQbdDxgP2cjKF2aG4/IFRU54inqfarPczXoBp839/JeXAnjiIU6RFO8hRjTTUp2XB8C0PcmW9owDT/8zWXkdYY1llfbZoKQO3OM104hweXJMrrdvoPccGC8Me4wZsv0AKIVJoh1fitNi+MPKwSqh/aItMe6chu81wcfuX59EBcx0nxoMQCQDNOdkh2CpG614R9t/Zj9Ld8NIy70jZuvI6f4fFwpKuZ+2zDJ8ApQwPYdGZ1+mfhL2k91okv/YTmaECQ7lpbJaR06WgaFDyOnp/sLPv0ADf9XQsJB/FWEKam00ASW5PsSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nNpP+RheVvnOEGJLv/BnKRqbgHJqI24w1TTX2WWqjA=;
 b=Y+A4hLEAUpztoBOoZACF+EHPiwW33tVYrpSqxBDrXt4dcxNzaSQtCB9Mvsnf/CBNTbaI+xI+BxqfxvY0MTrsjUZKHhqAR3PDXU6k9+9fEPSpsc0J9162KP3tdA1s5u1qj8aFZ8+fw/OJ3OsN0dbh9Mr0Mn2H7/52abGUgr2QphO/4b3PwBpHFQUrYH1Tj//BbZOWiXJwSt6RQUtOM1LBBEhODPsxyMoFFzynnP4cD7XwEZUU7UkRZ3+GSycHNbQWQiVLgKCRslog9v0sItMWmUxdpEpTHbX3WBnfg2NBdVgLjWegG4f39PEF3HBVfmI7M+boI72HXWvV5PC2nU54vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nNpP+RheVvnOEGJLv/BnKRqbgHJqI24w1TTX2WWqjA=;
 b=v08lnKaG99NkbHg8BrQzQdqzEnYyL92ahkJPfgPPt7JXDhmPKxG1XpYEWrCTcGSKI2B6n5aXc9JjOcb/ZBcphXrQg71w79WWN+oZMwUbfzVlSVKn83BUaZOUN8XdP58f78/vT3nvUT/xVr0mF6Y8lf/eYb0rRVjHsOjaXUq5oe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 14:49:09 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 14:49:09 +0000
Message-ID: <34ed7275-e1a5-4d93-8ba1-ef3c597eaef3@amd.com>
Date: Mon, 11 Mar 2024 20:18:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add ring buffer information in devcoredump
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240311122212.13713-1-sunil.khatri@amd.com>
 <9e1dbcbc-f00e-417c-995e-d9c539292e03@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <9e1dbcbc-f00e-417c-995e-d9c539292e03@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|CH3PR12MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: c47cb122-4000-4b51-9211-08dc41da6864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQuJe88pifnFZ5O7qDCttO0MPyYekMy6o5VFFvK52vXG2CaKR0eiIQPweUKSv/nCgSfrnIeduG9MEqpE5TKePH8mUkW+cXtFlv3apmUv8ItHsdbPe2sUvBK3zYN6KqDg1sOTaWGFjhed6OarvpmXLu33UlfqWwhoCNViLsd+50qRTZzkbfyeE/OpnwZ1lxpiPxEvj8PibVTPb7fwsfbDIrXPHO47SllCf+xCZZacXASBYo6pW9wGdiETHV9hq+GcYEr8FDGoXSDKCO88Qci6ijCa3yfwL6X+9Fjw9oKwsK1QTKNN0pRnfyVytCaab9UKGug3NcO9dwjhbPt8LLe043zJ+yOrNXxiMNreqDTttkMfz+kacdHELSHrI7GitXrNMaYiV2H7ZavOQmvaLD1ZjK6RMggYWeVE5uYUngkax6g2/TfGcqRekHBptf5YREr8ylsoQn2PCYtiEiuWyHOZeuRMoQzbDAekuaz2gdnAMOgsmNiZ9yrGvwf4xabKA1Cgc8c6c/29i9uqQM9v+T3X67M9TDKjHkFsOjHeB275T0LB2sH1QdXYtl2gLWqKtG6m/76TMtHF9O4rtBpKv4oWpIOvDtevfsp6wS8WMlgU51UTY+PGacI3FOXpGQZy/U5GWAG8gNWZq2iRUV9JHuypfgkbvhhxOvxUD9E9RKV1JrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhGQ3BGUVN1eEVySXd4aUlFU2JWcjYxRkQydzV6cnZhamV3NU0zT3ZKcDEx?=
 =?utf-8?B?bmVZWS9kWlhpWU9Eam03VUhDSkM1ZlJvbTZBYkZHN1NUV3drYXlDNGYydGg2?=
 =?utf-8?B?SUFRMG5VeUQrU0NHWUREbXlpcUpqN01qOWpIeG1aTzBPR2cvUG9JVi9NbFJS?=
 =?utf-8?B?UTQzeFh2SW55RTVpOWttY3VsRzFkUHpXMmVtMCszK0d0V2ttbVJ3eTkwMzBI?=
 =?utf-8?B?YkpGaWtwcEZLTzBxeE5uWVZ1aEp4SjJpVU9nYmozL1lOZGdvbkJ5Yk1oMW8y?=
 =?utf-8?B?WldCcVFnOVZWdERKNEN6YkpGL2oyS0FTblY2WXFQME9GK3pVRkoycWRreGlF?=
 =?utf-8?B?ZzkxT2NnTTFlZ2YxS3o2czNHTEdXbUVHWFVnci9MbHZqNCs5aXhpenBoS0pY?=
 =?utf-8?B?cHp4Q2pWQXlpckM2MmpVaTJjZjVNMjZLcTdmelRQbTg0N1M4dEFPTWZIQ0VQ?=
 =?utf-8?B?V1BOWjRWbDNuWlM4eit2cGZiYS9RM3hVLytPdnNqRm1LNWQ2Zmc3NkR2dDJy?=
 =?utf-8?B?Qzd4SlZnMnl4akI1TFRUOG9IWlFraE1DR01GUEdXczZQM3RxT3B4dkJDSlFM?=
 =?utf-8?B?dXRsSXNoWXJQTC9tamNuOHNieVpCOStzbXdDNitSL1JTNmZQdDk2cnlrRUE4?=
 =?utf-8?B?VXF6Tnc1SzVlNWVOTUthdUxLREoxd0NVQTIwUFRWZ05xb1AxbDBVek5QVmU2?=
 =?utf-8?B?WllNUVluWUU2L3RWQjExVmp4cjR6YzcvK2Q0Rkkyb0I3UmJkUnkvQjhpbXZO?=
 =?utf-8?B?bVhMQWhZODF1bTBBWnRMdzFaZFlvL3g4SXowaTYvK1MrVlBzL2crNTVpREdm?=
 =?utf-8?B?WWxhVlBYVWpCRjA3U3A4UWdsa1dXVkhTZHFpTHJEL3dyZUtZMEJkVnpVODdJ?=
 =?utf-8?B?RkZLZC80TzJpTC95alZvVi96cGs3SStZSmhCL2pDK3RnbW0rekRCODNHa29V?=
 =?utf-8?B?Y3hDUHBPUUZCUTlJQnZ4WHlTbVVkV0xrakg2QnpXakkzc3BUbytaVUVyZGh3?=
 =?utf-8?B?QVJxTkU3MGJLZzAxODI4KzlSZklndW1HM3JxME45RW83bk9VY3hEcWhxTzRN?=
 =?utf-8?B?WmhBYTEwb3dYaGVKaWx4VFJzTXgvaWZYRENpUkdVWlh3enplYmpwZlVXcFlt?=
 =?utf-8?B?R3pLa3pSbWJsV2ZtS08yWWZHNlh4cWV4Nmp4S21oQUtTcThNRU8yb0pwWmZr?=
 =?utf-8?B?cSswUXhZcFhhaGNIQzZkamY2UkNPZVl0MGFrd2c4VXM0UXlmdHEybzdEUTBJ?=
 =?utf-8?B?UGFyT3J4WEFjS25KZGZYUm9zajdVQk9VbTl6R3MwUnZiZDllMHB1U3o5VnB0?=
 =?utf-8?B?bGE4b2VBbExNWjJvUkhxMHBzZWp2YnVmcmFTV1BBLyt0SkVDVGhNR0o0Z0VM?=
 =?utf-8?B?UWJ2QWVVT2RiSzhaUGN6YzQ0dnJodEFJVkxkOEZrREVQMGszUkg4NG03TWlz?=
 =?utf-8?B?NXlDLzd1dDB3OEdPNEU3K284dTcwY3FEVW1nSTVIQVkxU0xxcFBWMExtTnpE?=
 =?utf-8?B?c0xTbVF1Zm0yOG40STdhT1dVczFRZnIvWnFrc0ZFZnliaWxDbWtBSnlyYWhh?=
 =?utf-8?B?SGxaYmVCcm01b0k1bzB5dUVQUnlvT2VmM3k2VGk0bERFdlVhdkkwelF0S2N1?=
 =?utf-8?B?TlREWm9JSDlzT3NXdDNpWlMya1VyZzc3WWdSMUdDWG5nY2RtaGtvOGNYMzJh?=
 =?utf-8?B?ekJrUjhMM0J4aG16MnN4NlZtQ0R3bXZlT3dXNDBOQzA4ODNZblUzdy9sbFVU?=
 =?utf-8?B?My9Ic1hmVXJSanJJMW95NTlEcm1yU1VLZkU3V0Ruejd2cXdTZTREbVhvS2hM?=
 =?utf-8?B?Y0g3SG1DMndneWlrNHFMdHBzd2hld2RBQXB4TFpUQ0RWM3FHdDcwTGRhTjVw?=
 =?utf-8?B?RnYyRnhRMTg3ckJ5dFBHMFo3REl1TGxRNVhNa2ovalovRUZFanlraGZBL1hx?=
 =?utf-8?B?Q05vbis2YXhpMEs4Slo2RTRWUEpBRTN1UXRNVjQ3UnNnajYzdm84SXJPRkFn?=
 =?utf-8?B?K3JHdGxna0E2dTMrbjlFbTNBZG9wZmJrUzhzWHdvaTQ0VjYzNnVVQStPN3ky?=
 =?utf-8?B?ZFZ6US9rWWp5OTRpY1A1YmRkQ0ptbTVrNi9HTE9MNHQ3d3RkeVNmcW5zU3Qr?=
 =?utf-8?Q?oPRIGq5GQxCRq1DrWL2qW2/PY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47cb122-4000-4b51-9211-08dc41da6864
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 14:49:09.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKHF84dm9uZfN2VuuMu/FYZ8c/xCn5ND3z70DOjymupPfMH7Eebq9HGjy4YzoG/6bcBkM5t6PTTwshaNFxJI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850
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


On 3/11/2024 7:29 PM, Christian König wrote:
>
>
> Am 11.03.24 um 13:22 schrieb Sunil Khatri:
>> Add relevant ringbuffer information such as
>> rptr, wptr, ring name, ring size and also
>> the ring contents for each ring on a gpu reset.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 6d059f853adc..1992760039da 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -215,6 +215,27 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>> offset, size_t count,
>>                  fault_info->status);
>>       }
>>   +    drm_printf(&p, "Ring buffer information\n");
>> +    for (int i = 0; i < coredump->adev->num_rings; i++) {
>> +        int j = 0;
>> +        struct amdgpu_ring *ring = coredump->adev->rings[i];
>> +
>> +        drm_printf(&p, "ring name: %s\n", ring->name);
>> +        drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx\n",
>> +               amdgpu_ring_get_rptr(ring) & ring->buf_mask,
>> +               amdgpu_ring_get_wptr(ring) & ring->buf_mask);
>
> Don't apply the mask here. We do have some use cases where the rptr 
> and wptr are outside the ring buffer.
Sure i will remove the mask.
>
>> +        drm_printf(&p, "Ring size in dwords: %d\n",
>> +               ring->ring_size / 4);
>
> Rather print the mask as additional value here.
Does that help adding the mask value ?
>
>> +        drm_printf(&p, "Ring contents\n");
>> +        drm_printf(&p, "Offset \t Value\n");
>> +
>> +        while (j < ring->ring_size) {
>> +            drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
>> +            j += 4;
>> +        }
>
>> +        drm_printf(&p, "Ring dumped\n");
>
> That seems superfluous.

Noted


Regards
Sunil

>
> Regards,
> Christian.
>
>> +    }
>> +
>>       if (coredump->reset_vram_lost)
>>           drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>       if (coredump->adev->reset_info.num_regs) {
>
