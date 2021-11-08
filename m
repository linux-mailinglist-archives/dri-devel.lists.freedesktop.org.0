Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F9C449E8B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 22:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7926E402;
	Mon,  8 Nov 2021 21:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274B76E402;
 Mon,  8 Nov 2021 21:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khH3CaqNjUQ8B77sor1ixYO3gHoGDg7OFMYiTUn9KGhCHGgA4hetq6icomu0WXnKHCyUdGqVPH+1kYz+G8QtC26FlR5y5vo+sjKTB4WkDygxTMTK50zoDi5LB3t0tl/YmNlBg4TxAVw+oe2uz84rd//FS6fEr0kY3GdsqNl1kATgEQMkUm8YzHYimFdAnzg44jJYMQ73YRXoytMOHVVkzBBgtoLbqfveBmUr77OZJvFSd0tdzCE4d9LnPxABGFfLtUSPDPbDQRon2ouaVGIGukUd3xo7/c3hJUc4B2R3dPPr9+W5/HvTOJEQedimUvtaFYIOqzA52f1XeKRx9qZr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pmwOa8wie0WQI4wGnq+QE9p0En2k8RTJlOukdK4zls=;
 b=SgscUdGcRJSfKRrO1hDrhV0pUnsFKWVwgfZNarzllhBkqqd16tNNksPsqWHRGADqU8PlG/ONsPr9qxLPoMl7y2/6QfH9er31j89EZnM+apZd42hFbqR7BLCOfTX6ohdKTGoKPeZH8R7SHY3hueQhThnaX8FRAeushP0OzrQAiatG6Zg37iNFE0jkbT0tGomqW7pOOeMOXHd6OnsEkNoPn4xV6cySwJbTIrgHl4ATTXhr5rG41E5sOKca6G0+pAZWQrv4t+nj9/lFz5ZaHFbp5x5Q6IokfeXEiIBoTmQMAskMgvZtf7cgkny4EfJpBf+ev1p1UqxTvVuExfddOysvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pmwOa8wie0WQI4wGnq+QE9p0En2k8RTJlOukdK4zls=;
 b=yQ0xeGUB5yWppW6GrDfPjyJCq+Zm/Jhlb5yM6b2Qvi/2wF7kR7TAjywv30I4hl7lBg96Nr2Ccrck9OKAp8hn5AgG7q2SkWEKN1viO83lF8AmpJPwbH/tWfD6k6/gIwzMmE06A7eCftwfq8yu26IYuExEbOzpeWXnqHv6VOhDC+M=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB3776.namprd12.prod.outlook.com (2603:10b6:208:167::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 21:59:30 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 21:59:30 +0000
Message-ID: <2b472af8-acb4-a204-1502-f4b5a9466a32@amd.com>
Date: Tue, 9 Nov 2021 03:38:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 8/8] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-6-Arunpravin.PaneerSelvam@amd.com>
 <55adb714-45f9-5af5-33df-ce4f4526a8c8@intel.com>
 <3b5fb9bb-13a0-a7db-cea2-1515aec96742@amd.com>
 <40e7dc08-9d5c-4ddb-3875-e018eb2791b9@intel.com>
 <07390c37-e1ac-5343-c5b5-6e1da10f8d5b@amd.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <07390c37-e1ac-5343-c5b5-6e1da10f8d5b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::31) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 BMXPR01CA0045.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 21:59:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba0dd45f-6a1e-43ca-2adb-08d9a3030a76
X-MS-TrafficTypeDiagnostic: MN2PR12MB3776:
X-Microsoft-Antispam-PRVS: <MN2PR12MB377622941017ADCBED461A7BE4919@MN2PR12MB3776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72G+qcmCq8b6HkbcVOgjEETkVKvXaUfOUvaXl/vLozZoEQ0DI3KdLLg2PP7MAZ2UQiuZUWgLbB2Egf07Db3Obh7YseRZ7K8n457/wPYH39u0xs092g7DC/gxKohVvuzF3HCW7EhjbxZLAovlHLURRORoY60hpTnJmpnjcd2DVqTf1MGjiId1RJVkIGn7thxCojXy8tot+JnveYoE5egfG9TVZkD/L6l8Gu/tzYeSm1YIl47AHspZEgG+YGrOnpmUePbOxZuwGIB+bEC5PPCYNq+lb6KHuJZnzqK3DzcbjtKbuAzRCgSc1h7fQVrHBGIQUwcua8U4unXN8V3PsRnFbuJRDvF9oT+ldU3KH4aQ3WykPR31cLBN4qizbhJkP7d3t4sDeW00oMBMbCgkgTL7fuYI0ydaGqw15KcY1Ss4P4p8VP5DPjVb75/CnGLfPbr5/exqTYMk7zeicVZ+Pux1I4ErJAYUKFvQMDH9TdP8Aypi86LhQxTR7+B0ZLuNoMaBnFqaLbGpd9lTvGUE3OkfUfEcXf0FiV1OX69mhTbCesls8u7E8zf3N5K37Cw8s0UJX0EcABY11N/w3rru/i4pf8xR6honxg6+0xCoOAVIpAerw6xpDjRIn43QsAt0fVCLxQ0udvVVdO1+wBzO+4kFKGL6BnOXKxHyny16FH+hKnwbiHBlPBRHNYTeojv76t367YZKMMCqYgGk6+RGzAWsz5yGs7e2TqZH0jogz6dG21Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(53546011)(5660300002)(83380400001)(66476007)(110136005)(4326008)(8676002)(6666004)(66574015)(66556008)(6486002)(186003)(86362001)(2906002)(38100700002)(956004)(2616005)(316002)(31696002)(31686004)(8936002)(508600001)(36756003)(66946007)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzJ1NE1EcGlWR1pkNk5WMjh5TUJHdGJxZHo3aXZ5d3dKZ2JGMUR6K0NjZUNG?=
 =?utf-8?B?cXJMMEVRNGZBcGFvY05TVnB4TklLRmtBdERtZWxJTDBUSFQvSnpUbjRyVi90?=
 =?utf-8?B?UTFPbjgvR2l4SmJVclI3Qmo4U0pCemFzelFwN0lqZjg2bzUvR2dxeEVjaEUw?=
 =?utf-8?B?M3J2TDB1Um9mK1ZMQnZPVmtYQ0F2b0pnVjJpMGljY3F5TElKSVRQaWRYYnJi?=
 =?utf-8?B?NGhhR3pWUW5yWUZ5N1pvcGFmRVBoQTM1Tk9MNzhWQmVVeUYrMUllUjI1Mytx?=
 =?utf-8?B?YUlEbCtxK2ZSem5aUnVNVTlFd2UrUGFFekpvdkFUZXZjd0FNcHdyQ1RENWlL?=
 =?utf-8?B?MXFqZXdFaUxKdElwbVQ1TnM4dGhwRHRIdjZDWXNYVUlxWU5RYUMvZWQxSjh6?=
 =?utf-8?B?M1JSbFlpa3loYmkwMlhCYnJiRXQwM3kvUVdCRTNnRjBURHBUdUZFSlF4UTM5?=
 =?utf-8?B?OU9jZjVUL3RFT1JBcTB6eGFDbjlBa3JSVGN6ZWc2UmIzTlJUa0NjdUt3d0tm?=
 =?utf-8?B?a2lDL1M2QjdvYlR4NjIreDkxR3V4aTl3aENNNTlEMzhodC9qYjdOT3F5ZFcw?=
 =?utf-8?B?bGIwTDR4eURaUEtqSW81QjdaQXVvTHhOd1FDdHB4WEdHTE1XYlBPaVNPaWFy?=
 =?utf-8?B?VGhncmRIdUYwamJWNXFkN21TQVFOMlE0ZkVXVXV5TmFac0V2Rm0xbkkvbVJo?=
 =?utf-8?B?RzFkY1YrNFpNYStTdVIrUjJwOWd6ZVR6NERvVi9uY2t0Um5tN01mMDdEeTJJ?=
 =?utf-8?B?U0d2Y0d4MjFuOUlZcSszL0hMT29IcUxUenp2RlB1NVBNTlJBTTYyT1FOdGZu?=
 =?utf-8?B?RjRES3A4S1ZmU216VXo5TUdDMkMwWDJ0STl2VWtnQ3gwQmhobWpaV0l1ck8x?=
 =?utf-8?B?S0xQdlB4SE51TG9vdjhZNW9QVXFMdUdFakl2SUdncmtMSFVSKy8wdGV3cE53?=
 =?utf-8?B?MUJpR1FhaS9HRzZEK1pvblo2aEdoTnc2SXhkcTlrc3cvQm9RNU50c2phOWtH?=
 =?utf-8?B?cDIxb3JOVklKeEpsTjRyTzl3YkR4cnBMNzNsNWZLekVIQmtmNUxWbDZpTTVm?=
 =?utf-8?B?aWRreUJWSTl3by9wa1BGZFEvV1pGZ3J1c0sxMXZtWFhtZThscGRQeGZxYVJn?=
 =?utf-8?B?MVh0Q2FvMHpXbm5jMzNpdVZORFV5VmRBbTNxZ3BGQkRTQWJSN0FIcmhFeUIz?=
 =?utf-8?B?ZnFBZE9nOXYyYnJJUkVXOUhNUzhYSDhVRElCYlpTdjl2VnZLd3FZWFhqOWNx?=
 =?utf-8?B?Q0gwU3QrMmtiZ2xVaWgwWmhsUkUyWHEyM280QWtQS1pkV1NicE5zbEMrY0l1?=
 =?utf-8?B?VUpjWXFBTFZ0RGYrdGJhUkorUVNQWTBFNnlqSGpFL0pDTG5icWRxU2xSL2Vi?=
 =?utf-8?B?czEvVHJBUHpDb0xqcSt4ZTh3SjREcThOMnlDVnp3SkdqSDdidnM4UnVQZ3ZW?=
 =?utf-8?B?eTFENnA1U1J5NEE1TmJOajkvV2dmNVZuZmpiYy8yMlpVTzhvQ08xL1dFQkdJ?=
 =?utf-8?B?dmpudHQvai8yaEcxS0VrMmxCY2RsdHhTcG8zZzZQYU04anpGL095TEh5STlr?=
 =?utf-8?B?NkJmYWNqUGdRRjRuOU8vTEFaUjNVQjVWUG94V09uMkVqNW83eXVVWnphdHhr?=
 =?utf-8?B?WW5pNk1FQk1vTm12dGg1Mk5EYXpkbDJQTmpORGQ1TFAydnVjLzMyMWNNNWVL?=
 =?utf-8?B?V2xUeHBydVVTZlQ3RXBnQ0tQT1VXUVIxZnYrY2s2Sm5wMkh5eVdCK1ErZW0y?=
 =?utf-8?B?UExFM2dUeEpFeE1DdUNHalNWUHUzRkdTYldnYk5Cd0Jha2liQW1XdFNrdFJv?=
 =?utf-8?B?YXo3N1NCVUJZbmtXUG9LY3h4cUR5TGJxMXd1YzRHWVJGT0VpMFRnQ0JFbWY1?=
 =?utf-8?B?dkZBSkRoV3MxS3dWd3Z3NEVUUWUvK3hSQ1NhN1VOS1BWT3lDc2cwbVNUYkJt?=
 =?utf-8?B?ZUNwS1pXYjRPU2ZTbjM3bFc3Z3ZlbmltRUFGQ3Rla2RGTXFqZjRLb3M0bzhE?=
 =?utf-8?B?cEdEaFhIb3UvMzFVWTRlaWJCZ05SeWlNSmVKRVQxV2NpUEcwc2hpaHU5NmRF?=
 =?utf-8?B?bGdqaW1KQVpGd3FlR1d3SW8wNkdZQTQzOEd4NDN5cHNST3c4S1hVYlVlTEpM?=
 =?utf-8?B?bVBDcEo5d0t6N1dDTnQwZWhMSDdyU0NPZ0FJdkhwT2dVWlFZTGh6cjJpR1E2?=
 =?utf-8?Q?vXdeNf7mkP3OBkmA0sfuxlw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0dd45f-6a1e-43ca-2adb-08d9a3030a76
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 21:59:30.8239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFSPLq5rwEqehJ36SdJvBof2G7Cg3VaajINafNn8PM89gKJ1ogNbmWyhIOsEjZUQVaicZhhyv2RFJYMu5xF3nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3776
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/11/21 2:24 pm, Christian König wrote:
> Am 04.11.21 um 09:49 schrieb Matthew Auld:
>> On 04/11/2021 07:34, Christian König wrote:
>>>
>>>
>>> Am 03.11.21 um 20:25 schrieb Matthew Auld:
>>>> On 25/10/2021 14:00, Arunpravin wrote:
>>>>> - Remove drm_mm references and replace with drm buddy functionalities
>>>>> - Add res cursor support for drm buddy
>>>>>
>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>
>>>> <snip>
>>>>
>>>>> +        spin_lock(&mgr->lock);
>>>>> +        r = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
>>>>> +                    (uint64_t)lpfn << PAGE_SHIFT,
>>>>> +                    (uint64_t)n_pages << PAGE_SHIFT,
>>>>> +                     min_page_size, &node->blocks,
>>>>> +                     node->flags);
>>>>
>>>>
>>>> Is spinlock + GFP_KERNEL allowed?
>>>
>>> Nope it isn't, but does that function really calls kmalloc()?
>>
>> It calls kmem_cache_zalloc(..., GFP_KERNEL)
> 
> Oh that's bad. In this case we either need a mutex here or some other 
> approach to avoid the allocation.
> 
> Christian.
[Arun] I will replace spinlock with mutex
> 
>>
>>>
>>> Christian.
>>>
>>>>
>>>>> + spin_unlock(&mgr->lock);
>>>>> +
>>>>> +        if (unlikely(r))
>>>>> +            goto error_free_blocks;
>>>>> +
>>>>>           pages_left -= pages;
>>>>>           ++i;
>>>>>             if (pages > pages_left)
>>>>>               pages = pages_left;
>>>>>       }
>>>>> -    spin_unlock(&mgr->lock);
>>>>> +
>>>>> +    /* Free unused pages for contiguous allocation */
>>>>> +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>> +        uint64_t actual_size = (uint64_t)node->base.num_pages << 
>>>>> PAGE_SHIFT;
>>>>> +
>>>>> +        r = drm_buddy_free_unused_pages(mm,
>>>>> +                        actual_size,
>>>>> +                        &node->blocks);
>>>>
>>>> Needs some locking.
[Arun] ok
>>>
> 
