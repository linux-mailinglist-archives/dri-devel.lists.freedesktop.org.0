Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B73A0CA5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672B089FCA;
	Wed,  9 Jun 2021 06:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2046.outbound.protection.outlook.com [40.107.212.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4E289F9F;
 Wed,  9 Jun 2021 06:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaAquvYDsZVmTpt3nTl3bQ68fEw67ddmASQfv1ihrCkiRcWABTE9Vk7YLJhLWgKwIn+WAzj8NwLAjLJaWkASTBVGtZpDEO5gSBy6iF3E1MX/i60ZVV18+QIgtLd5lelfEYcY/FQqY79cBlcSOUduLlAea5nSvb+HwF/84allaEu5OQPqy0i5VpUaqsm5bpcRmdhljCO8UZiz2sNSsr9KHkgkrSZYhQ3lnE9vxbGdlMRKyPKB8YaHmRkYp5frbEYRZfz5DcF5f2grCS+wWVXKVANmAunuXp6qe3nPJVWAE1GR7jvGME45t6IVPSJFTOfIj8rYPXkEzrYG5MtBq9PV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYf13dgCWJ+IUC/r+3PjBNHWBzP5fKvDkrxfxMkc+6A=;
 b=fG6/Uuy21i2hqTQIEzdkhBePFNPJs9P92mr8tCkEb2L3+jGG3UCIC0B7LmRDaNnEQyxRgu/3qOvjwxE8ybhGmz6LHrtDDtvQwdKdpON/ilkIf3gSIaxBfKHObjkMJZucxND+/DHUlnrFDmnUEduJCNKSQwNVHP5E3/ZJ0DuotPMnWAvl8MxxzLwizUIFLVmyDZ05wyQEBkTE9wCIS2+ALnccx+oaMKocMFkQsqvWB8pDy9FP0Ua70N6Ck8BegkY03o/kg0J0UMrmFU1BKtTDUST0SbT9RZSpwS6gkUs4wl3s4efrwtQSSr/lHPo7g7crTGENbsLZ8+3IFSo5lLnQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYf13dgCWJ+IUC/r+3PjBNHWBzP5fKvDkrxfxMkc+6A=;
 b=Ux1fSWDQ5Q9KJFnLlc0dUn2IIbQk7d3MxEovOZl3Halt40r+xlvmufC0W7z2iMvlUZwKKZgE2C6Fbzvm8at9hyQoVIknxnwDOZiZjvEE6nRkq/bJgEoyZcsXLA8dTErfoNqQ6MI1smD2/zNuTDOq4qjT4h5tG0ny7xt0hEyO6KM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BY5PR12MB3905.namprd12.prod.outlook.com (2603:10b6:a03:194::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 06:43:07 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 06:43:06 +0000
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
To: Ondrej Zary <linux@zary.sk>, Ben Skeggs <bskeggs@redhat.com>
References: <202106052143.52488.linux@zary.sk>
 <202106082047.42658.linux@zary.sk> <202106082201.56781.linux@zary.sk>
 <202106082359.12109.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ab40bbc8-2c0f-0652-c9b8-bc7fda7ca2a9@amd.com>
Date: Wed, 9 Jun 2021 08:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106082359.12109.linux@zary.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 06:43:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b449bdff-79eb-4504-5e79-08d92b11d6c1
X-MS-TrafficTypeDiagnostic: BY5PR12MB3905:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3905535C11F36A021992D50483369@BY5PR12MB3905.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MKPkZ1deOW78T7suFoqp77ntCY8vpy0Lom/lFad2ISOYX1aD0SMcD6ltUz+dcW4g/rS1BfYE4Vi1zTRxwGoTVHmiAdjwsk29EQXahTmQ7WYSNk2k/5U4Q/q8DD0ooRjCxkLa78SiZQP+bitTMrKjVr5ZK+MRboTl/GduHK3lIuw/Z3Ih0aui2aUsM1TivDi8bRCsY8DrmEFh8cSQTtVwuLLBaixsQFRnDQVlEqfaHhP0pHvC+ex+x8o53TjcY+/LGabujLa7H0Y3x13LKE3RAuDjAj1+ebvrE1PJh8xwBIdnONIZQtyFXt5YAzxnGecrxKqX0FhrqXc3zCZwaiEkRGlK+5hXEQiYL4VPZ/wI+8S/Gx/a/aIISgOiupKa42x7d7e8A4V7f7mBcgeUbAS+nPrehbHf3dA+NXQqej2NDPYxXKvGC3+rF+10xcFqeIwkfvo5b1P1sP3juK6WB/jccEvcwAWU65OfMIb2TS9YWTr0kAMX/n9Sh1hteBK6FJa/V6h3tR7GIgC1KXNU7yF+/jBjqswqgc/1qsYw8Oc4xVqrpbSc/g8zV29zBQ3PWujRZR3ZAnk8XkSSncJsid9gtcwTczNLHAB4vWMiaXgu2oebetGcKE6ux5LNFh3WO5sbrOWu/7EJJSjueuFSbydJ9EtRYRxSi2EV2x53sXZMEqUaFWeL74rXZKCojQQkMpan7+P1NtFzfxX4gFQAw2IlBE4bDVZAwLHOpgA4piETPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(36756003)(6486002)(45080400002)(478600001)(8936002)(8676002)(2616005)(2906002)(16526019)(966005)(31696002)(83380400001)(110136005)(66556008)(66476007)(5660300002)(66946007)(66574015)(31686004)(86362001)(316002)(6666004)(186003)(4326008)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUVQcEp6YnBIWFQyMDU4ekxGT2ZNNGZsUlBBd0Z4TmxGVFJUSGRHdFlHcU8w?=
 =?utf-8?B?R0NqVDMrWFlpV3ZaM2ZZV0d0UEdFMkVJOUozMkc1aXN5YzNXVXBubjQ1aEZU?=
 =?utf-8?B?Tk5vbUVXVWZDVHZsYzlKMUFkYkhUcGdlVlNoZENXNDByc0NxVVl2WU9pYjdt?=
 =?utf-8?B?bHZpSHNvb3lrRHVnd0pyR1NvYkRUbmdIQnhhWW1CQ3VXM0ZNbkNuRDg2a3JS?=
 =?utf-8?B?Sm53SG5lV1djR2tnOGJrRWMvMWh5S3dwNHBrYTBOd29oc1Y1RmtyU3VkNmtB?=
 =?utf-8?B?d1lMeTNhZlByUVZtZ0VuKzRTVGNnMGU3QjBXd0huaU9NTDM3V3RBa1BZY2Vj?=
 =?utf-8?B?blNVbTd0am54SEx2OEt3L3QwZUh0bzMrWFNMQllrb0t5ZGQxTC9QbXRKUUZF?=
 =?utf-8?B?TkxVKzFFVkZadmFqTVpDN2xYbFJ4VFkzUzdyL0RLUFJkNnp1bnliREZBUFh4?=
 =?utf-8?B?Tmh0WTA4RTRtM0xxV0tLZG8rVHl2blE5VkRORHZXVTlxbmFTc1FnU2NjNEY5?=
 =?utf-8?B?aDdlUm5ldnFIQVJSdURzdWRpT1VQVGZiNDl4T3J2NkJaTEFUSVZQZ0NWVThY?=
 =?utf-8?B?dXJVeTZvTk54b1VMWDRLdDA5RzFlRlVwUlpLU2V3aTErVGRhTERsdFUzVlBs?=
 =?utf-8?B?SkxDVUxMeWZkcnpSL2ZMMHhlN1VmRmM5UUhnSTd5NG52VVRWdUdDRVFMV2JL?=
 =?utf-8?B?bk1vMlI5dlFlMktMb1NOTHhRcVJ5MnFqL0Q5UzhORVJwN3ZEQzhpZGl3c1JI?=
 =?utf-8?B?T0ZMWHhOeEN5NjdoRHRXeStWbnJOTlVrQUJUbjUyQktOWHR3MkQyWVd3WTYx?=
 =?utf-8?B?YU9VVUh1WTA1ZnZQMlNYbWEraGZCMlU1N25pb3FhZUcvREx6NC85MW5QUVJ2?=
 =?utf-8?B?UzhJK3I2TERjbDdWVHI1VHpmdUtrVFZHY0M4OFNMZE4vWTVnNmpISTFCS2NR?=
 =?utf-8?B?cTZEYnBMMCtmdjRydEpNck9wcDZCamJMZmd5TFpYaVF3TDR2ZXBBL1d3UnZm?=
 =?utf-8?B?dHBXeUpVYkxMUUZjZi84VytwZ0VreVN1angvcktQcmx1SjNYUlNwR3VWczdL?=
 =?utf-8?B?am5kaHovZEs5ZnhTTmUyL2crdWNhbkl4dGpNZ2lQMHpUODZaeDFrQURvOE5W?=
 =?utf-8?B?MHgwWFpCQStycmVralhmaFl3c2V6UG1tZ2RCTG1GbUJyZHFiK2ttNTduZFE4?=
 =?utf-8?B?Y0d1WjN5OXl4dUZMNGVXS3pXNTNNRnBsZ0xCQ0xEV1IzWEtSdENrKzlQYmdF?=
 =?utf-8?B?VVlTUzBPbEVpbDhrT2hRSnpjcGRVWFZQd2Z6bjgwOU5IMS9LYVViTU9kdCsy?=
 =?utf-8?B?eTFOaFBHZnlxSVgyZWVaWFBmUDdXMWlkWnRCR3dTbTFUckQ3MTI3QWFJdFU4?=
 =?utf-8?B?Szc5USs2OGpCb2ZUU2tJRit0c1o2eVBqczBCRW9NN3h5dHRSNkdER0o1MEJx?=
 =?utf-8?B?MzZ6ZkExWGhPSWVUL205cHhpMmxLcmhxWk5kRGJRMTRMc1pjcXcxTWhYSHJn?=
 =?utf-8?B?RExMemd3U3l1RGlzU1dsV1U1TjdwNHlOSEVXNXByRXkzN3JvdVY0TU9FZld4?=
 =?utf-8?B?WWIrNkczcnI0MVFJdUJxamhKTmRGM0R6eGVEblpOT2t2eUdMM0c4RHdubjhI?=
 =?utf-8?B?MXNDWkpQWWVtOUEyTVBpdC9Namlwa01NRStobGsxUFBRVWp4VzQ1UDRQMWU3?=
 =?utf-8?B?WnE5RVNBUmxBM21IODNMbFFKQjBHM054djZSK0JIVHJ6cXdzU0U4TU1FUmxK?=
 =?utf-8?B?SzZqTE82dy9DeWNiMkRGaFQ0UzBoV3lQamIzRjVzbURnWk0wbFVXT2E3NDM4?=
 =?utf-8?B?SERycS9YZ2NUVEdqSjlVYXNhVWNUN1E2YTdVUGltL2o4QmpYcWw4VDJMRlln?=
 =?utf-8?Q?vJIrf/Ky+s1wC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b449bdff-79eb-4504-5e79-08d92b11d6c1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 06:43:06.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY1t2fEUygiBKBheSr+qsyf9vxclTn1pJ+g6ZvHYiQ6dS+3PMas0f8nO6fzYI/NZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3905
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.06.21 um 23:59 schrieb Ondrej Zary:
> On Tuesday 08 June 2021 22:01:56 Ondrej Zary wrote:
>> On Tuesday 08 June 2021 20:47:42 Ondrej Zary wrote:
>>> On Monday 07 June 2021 22:58:43 Ondrej Zary wrote:
>>>> On Sunday 06 June 2021 23:16:03 Ondrej Zary wrote:
>>>>> On Saturday 05 June 2021 23:34:23 Ondrej Zary wrote:
>>>>>> On Saturday 05 June 2021 21:43:52 Ondrej Zary wrote:
>>>>>>> Hello,
>>>>>>> I'm testing 5.13.0-rc4 and nouveau crashes with NULL pointer dereference in nouveau_bo_sync_for_device.
>>>>>>> Found various reports like this but that was back in februaryso that should be fixed now.
>>>>>> So it is the same bug. Broken since 5.11. This revert fixes it in 5.11:
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2021-February%2F298531.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C605d2e3757ba466bb02a08d92ac8a895%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637587864017853132%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=M5KXSwD%2Fnro3cnCo8Nx4llFu%2Fj2T%2FGQAaMBLeGl0XMc%3D&amp;reserved=0
>>>>>>
>>>>>> Added some debug printks to nouveau_bo_sync_for_device:
>>>>>> [   22.225048] ttm_dma=fc33b500
>>>>>> [   22.225066] ttm_dma->num_pages=18
>>>>>> [   22.225071] i=0 num_pages=16
>>>>>> [   22.225077] ttm_dma->dma_address=00000000
>>>>>> [   22.225094] BUG: kernel NULL pointer dereference, address: 00000000
>>>>>>
>>>>>> So ttm->dma_address is NULL.
>>>>>>
>>>>> Tested reverting f295c8cfec833c2707ff1512da10d65386dde7af again and it does not work...
>>>>> Not sure what I did before.
>>>>>
>>>>> Bisecting between 5.10 and 5.11 is impossible - I keep hitting neverending stream of bugs.
>>>>> As always with nouveau...
>>>> e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 seems to be the first bad commit
>>>> Going back one commit makes it crash in a different way:
>>>>
>>>> [   55.444208] BUG: kernel NULL pointer dereference, address: 000001b0
>>>> [   55.444219] #PF: supervisor read access in kernel mode
>>>> [   55.444222] #PF: error_code(0x0000) - not-present page
>>>> [   55.444225] *pde = 00000000
>>>> [   55.444231] Oops: 0000 [#1] SMP
>>>> [   55.444237] CPU: 0 PID: 1740 Comm: Xorg Not tainted 5.9.0-rc5+ #361
>>>> [   55.444240] Hardware name:  /848P-ICH5, BIOS 6.00 PG 02/03/2005
>>>> [   55.444321] EIP: nouveau_bo_wr16+0x8/0x27 [nouveau]
>>>> [   55.444326] Code: 85 ff 74 0d 80 7d f3 00 74 07 80 a6 f4 01 00 00 fe 89 f0 e8 0c ef ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 01 d2 89 e5 53 89 c3 <03> 93 b0 01 00 00 0f b7 c1 f6 83 b8 01 00 00 80 74 07 e8 40 49 69
>>>> [   55.444330] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
>>>> [   55.444334] ESI: 00000020 EDI: e7a14400 EBP: e786fd98 ESP: e786fd94
>>>> [   55.444338] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210246
>>>> [   55.444341] CR0: 80050033 CR2: 000001b0 CR3: 27896000 CR4: 00000690
>>>> [   55.444344] Call Trace:
>>>> [   55.444395]  nv04_crtc_cursor_set+0x148/0x1d8 [nouveau]
>>>> [   55.444442]  ? ttm_bo_reserve.constprop.15+0x1c/0x1c [nouveau]
>>>> [   55.444451]  drm_mode_cursor_common+0x13b/0x1ad
>>>> [   55.444497]  ? ttm_bo_reserve.constprop.15+0x1c/0x1c [nouveau]
>>>> [   55.444504]  drm_mode_cursor_ioctl+0x2e/0x36
>>>> [   55.444509]  ? drm_mode_setplane+0x203/0x203
>>>> [   55.444514]  drm_ioctl_kernel+0x66/0x99
>>>> [   55.444518]  drm_ioctl+0x211/0x2d8
>>>> [   55.444522]  ? drm_mode_setplane+0x203/0x203
>>>> [   55.444529]  ? _cond_resched+0x1e/0x22
>>>> [   55.444533]  ? mutex_lock+0xb/0x24
>>>> [   55.444582]  ? nouveau_bo_add_io_reserve_lru+0x53/0x58 [nouveau]
>>>> [   55.444589]  ? rpm_resume.part.13+0x72/0x365
>>>> [   55.444594]  ? ktime_get_mono_fast_ns+0x5e/0xf2
>>>> [   55.444598]  ? __pm_runtime_resume+0x5b/0x63
>>>> [   55.444647]  nouveau_drm_ioctl+0x65/0x81 [nouveau]
>>>> [   55.444696]  ? nouveau_cli_work+0xc3/0xc3 [nouveau]
>>>> [   55.444702]  vfs_ioctl+0x1a/0x24
>>>> [   55.444706]  __ia32_sys_ioctl+0x583/0x59d
>>>> [   55.444711]  ? doublefault_shim+0x120/0x120
>>>> [   55.444717]  ? exit_to_user_mode_prepare+0x71/0xba
>>>> [   55.444721]  do_int80_syscall_32+0x2c/0x39
>>>> [   55.444725]  entry_INT80_32+0xf0/0xf0
>>>> [   55.444729] EIP: 0xb7fb2092
>>>> [   55.444733] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
>>>> [   55.444737] EAX: ffffffda EBX: 0000000e ECX: c01c64a3 EDX: bfe89750
>>>> [   55.444741] ESI: 02580b40 EDI: c01c64a3 EBP: 0000000e ESP: bfe89704
>>>> [   55.444744] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200292
>>>> [   55.444748] Modules linked in: i2c_dev nouveau serial_cs snd_intel8x0 snd_ac97_codec wmi hwmon ttm ac97_bus 8139cp snd_pcm pcmcia snd_timer snd sg soundcore psmouse yenta_socket serio_raw pcmcia_rsrc pcmcia_core intel_agp parport_pc parport
>>>> [   55.444769] CR2: 00000000000001b0
>>>> [   55.444774] ---[ end trace e2b0d4c3c2e4e488 ]---
>>>> [   55.444827] EIP: nouveau_bo_wr16+0x8/0x27 [nouveau]
>>>> [   55.444831] Code: 85 ff 74 0d 80 7d f3 00 74 07 80 a6 f4 01 00 00 fe 89 f0 e8 0c ef ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 01 d2 89 e5 53 89 c3 <03> 93 b0 01 00 00 0f b7 c1 f6 83 b8 01 00 00 80 74 07 e8 40 49 69
>>>> [   55.444835] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
>>>> [   55.444838] ESI: 00000020 EDI: e7a14400 EBP: e786fd98 ESP: e786fd94
>>>> [   55.444842] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210246
>>>> [   55.444845] CR0: 80050033 CR2: 000001b0 CR3: 27896000 CR4: 00000690
>>> Bisected this crash:
>>> # first bad commit: [141b15e59175aa174ca1f7596188bd15a7ca17ba] drm/nouveau: move io_reserve_lru handling into the driver v5
>>>
>>> Adding Christian König to CC.
>> Tracked it down to an uninitialized variable bug.
>> I see now that this was fixed by aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
> So the first bad commit for the original bug is e34b8feeaa4b65725b25f49c9b08a0f8707e8e86
> (as bisected before).
> Going one commit back and fixing the uninitialized variable and endian bugs manually makes nouveau work.

Thanks for the heads up. So the problem with my patch is already fixed, 
isn't it?

Regards,
Christian.
