Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDACF41C436
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 14:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4336EA56;
	Wed, 29 Sep 2021 12:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356276EA56;
 Wed, 29 Sep 2021 12:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxCqPaEzbm2/rWn/UnqYpQyJ73MiFggut5Bbvwvo5Zlyf4rTom1cJxeh/reEsmhEKGKrRIxiqNQKwdDmzUDvujKBWEpF3tLi905OF19lb7w3asRxSHgTfjJos7AF1HrgS1XJThsYWLeMMSDbUNeTtyqLitE+0jmMB5bIcIjb+5LY1cYpsHIoIFL0DwQZR4387epYi+iSGqpHTbdJeZWXC2b4+XfCUg00X6Kx81T6DsJ6gHcpJATAXdtsJmCU5HnGwt9+LlnwMGzyTCke0wSPAuZUJGJ8v9+csNIbwa5wJl4dvcnsnuPwAG2npnXAgmWAWhLSZ+9mVdtN3Py86qbbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=POxz2Y6pnjL10jsz7gGzAT/fXwDpZpyrttAsUtp/V/Q=;
 b=LoF3m6VdzXXy8lUkJDRs+thzjzoeBGPWYblPV5dNkChvwiJnc9LxNK+Rns1G05f5F1wqRzZxJJ9YzOhh5YBLW2OSlnE4MOI2fi2JIRYAqCzAW/0CGBwZfBU1Fn83u27J5NHXSSWx/1wSbxuIUPbDWua3fi2wU5rvzdMI5S6CgULbqpPoO0exCUI4Mhc5+uX1d+zUJkfU5brStgBB/Ylk56ecdIYid8/XDHVAxm3TcOjQZ4o0MPBQSI7tIGMF9n/8LTlXgzpuOK+vdzA7H/u7UqWPR3TEbMzFDLMA2iFRP2arZNu4/nwOdKPTKJwv7wA1rQc3zrk+z46Z3vu8TR++oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POxz2Y6pnjL10jsz7gGzAT/fXwDpZpyrttAsUtp/V/Q=;
 b=wnAWfprGvISC+Grz4hmYcQAJYSjwmMIiBQ73/iICYlnNmpo09jWFIj0wzDV3PoCwVVuL3gHgwd694g7D0zGPPksnYb06W17LqWp7DyMe4UAe8b5l7zauIQ0aqu1QxOs4QHHcwXiqora3zH2pyckSIKU8e1Cd0a6YGFl1gfJE/M4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0032.namprd12.prod.outlook.com
 (2603:10b6:301:4f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 12:01:36 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4544.021; Wed, 29 Sep
 2021 12:01:36 +0000
Subject: Re: [Intel-gfx] [PATCH v5 01/13] drm/ttm: stop calling tt_swapin in
 vm_access
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <a0ff7b4a-2433-7ff4-a998-c2c286d3c497@amd.com>
 <CAM0jSHMrYPM9Wb2WCw5ktLjhN=+0H-qD_1cQbrnPhQRg0_U2=Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c51bb1b9-5243-d14e-c5b1-df698d1172af@amd.com>
Date: Wed, 29 Sep 2021 14:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAM0jSHMrYPM9Wb2WCw5ktLjhN=+0H-qD_1cQbrnPhQRg0_U2=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::35) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4405:6e4f:ef81:78d1]
 (2a02:908:1252:fb60:4405:6e4f:ef81:78d1) by
 AM6PR01CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 12:01:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d0fe02-b794-489c-dc41-08d98340e28d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0032:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0032B48A7173ED72C0F9168983A99@MWHPR1201MB0032.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BC3o6LSSrCpdips1YOpmrsaL4xqiTIruGJXAL0rkUG2c+PDtEmcFTvHogHFt1zQ2FxTDGkIiuZQvTlMZjfDU78QMdQI6xuPPpus9l/JAgLOu82wDRi3l2CbSlVktMDlykb8HMheZPZjdYCsZOkBqMaxStXuFCD8D4KGCh95kUYEASoxKXCYpXVe9q1tFPHNDcxQqLt9UsV74BmUNS8UVC212n8mAW1avIYVanN5fUaxGgPaGDlvbhP1trYX6V60aqqzn3Mc08sw2ZueRVMd1uKA6RNQX64flOUFSfGfvosO+LYQNfbOZHZJFoXVvQVK6zmhOvkUHxmLQ7qzYrFgDwNBMSorSt+2e1ul59P43teHT6/s077PBIq5A9L8yMp21BDza5FhmnjxXgZQGSgABVsmu4Yc8qxglnbA80Ib9V54U0ThbTFbkBdxuf6eS4Ni4i3y24YrOo1q9N21Stml/O3Jz+0p8Ji7p378G02JXOFZVRmmizzlmszSVh+FGXJWwc9YVkovh6BbdLSMN8IeVPda8TVNEqnlcsBH7Ex6yisvT4CWkEDWReslzxSG+qbq74xhHicM357o13dYgseDnipBnKD0qD/tAS7jwfGWCatXkzT4RGqsQuF+xq7UD7jguhQdnCQ4dPht1BEqOcc9ho6Jxhw4atG/YTt0QoDwiwoxdzyS95HotqGYedulXn8hMbPAjixroo45NBuiIbAoT5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(83380400001)(4326008)(31696002)(66556008)(2906002)(66476007)(186003)(86362001)(8676002)(316002)(8936002)(6486002)(66946007)(2616005)(31686004)(6666004)(36756003)(508600001)(6916009)(38100700002)(5660300002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdQd2Z0QVVLQnMrdXFzWFBSUGphVTVuY3ZXa0E2UlhYdU81MGlmQUczN0NV?=
 =?utf-8?B?d3RQSktQekQwSjNHcDFncjE4bkpUTERjR0FhYmRhV29RQi94cXBaNGl3SnJ4?=
 =?utf-8?B?N0wwREN2OFpQbE1hTmZJVHlDcE1tK2JjQlNBQnpxaXVVc2FRc0l0aXpXbTU0?=
 =?utf-8?B?a2gxcU9mTnlONnNNVEh5ZG1zczlFbVZzeWJmY3ZiOU9PYUMxY25URWdwWjFt?=
 =?utf-8?B?dEM4RlI5bjVVU0xiKzFLMTFqbjRwQ1J1SkFiRWI0Rlh6ZURwYVlaQkQ1Z0ZL?=
 =?utf-8?B?bklzVVdFQzJRYTl4SFVVRC91bzJHaGpCRGl5bEtrc1lqVXJBT2xkb0d1NmFa?=
 =?utf-8?B?aC9nRU5sQlg2TEVvem1jbW1yZjg4ZVphdmlRWUNNMlQ5dDVXN3RZNTh0ZFhR?=
 =?utf-8?B?VEN2enk0SERKVFpydEdmUTFxd3pDSDU1V0dJekVvZXZqbzF5ZkFHR1dRczhi?=
 =?utf-8?B?eFJ0NE9oLzd1RFNyelNFVkFOMTZxYXlyclpUSUM3dUxGWVN3djJKUjBqMzJ0?=
 =?utf-8?B?dEhYbWZwbnpuaGFLWHp5U0dodGdhdERvb2RMdExpNDRuUmtzNWRtSjY0VUxW?=
 =?utf-8?B?TlVDS3E3aXdrTlN1YTQ3UGtvZEJ2ZGxmMzd1aTNhczZZMzFMaENaMHAwTGJq?=
 =?utf-8?B?dk9IeXJEMXlmUW1hT1Q4R3plTHdyUzNURERHK3gxWlIyazFSNWROdGZobU5G?=
 =?utf-8?B?N3diQjRFeDNVMEt5ejNLVnNtK0hFcEZqOXlnaDRvcE10aXNYMEhFdkw5TlJH?=
 =?utf-8?B?NVRkbXFIcjMvaUdSTWhPakkvU1JHL20vQ1FFd2ZsTEtDV1NzVW9xSWE2bEtw?=
 =?utf-8?B?Y3M5SktmeGJtQ3d6V0tMV0I4QlFsNHdpU1c3cVN5dkpUWURGcWJXRWNoN2dh?=
 =?utf-8?B?QXJkMS9kS3JoUUNFSytWWnhrb0pZNFZMbUFFenBkYkN4bmpQM04zRHd1VHVH?=
 =?utf-8?B?ZGVOU2JWTlJoOENYNmVwUGI2MEhra1NNNUx4Z2FNbGZFRzNhYlhKeEFJZis1?=
 =?utf-8?B?a3BSWHVEbFVvNEc1M2VCamYzcUw4VXJJc2RTS0VjUHpTTC9OWVViL0lpQTNC?=
 =?utf-8?B?NjBPMzVXVHNSMjZnenRRTzFrYzM0cDU5bHJYUGlEejVWMEFVdTAwcVB3T0xi?=
 =?utf-8?B?WGViSGFET295S2NxM29pS3gweENzWE1rVUtYTFBQUDBjdXZvWnlKbkFBOWxF?=
 =?utf-8?B?NHRwK3VneGVTRENVMjVTdUxSUnlzVGIrMGQxZDQyQm5QMkdldW5iMG5qYzZj?=
 =?utf-8?B?ZFk3MzlxZFZHcG04dTFvKzQ0RWMzWmlNdTFBNTIyVjhWSVVwTXM3bDg4OVlu?=
 =?utf-8?B?LzM0bzdmVndmSWppMy9oU0VrdTFoc1Z4VTZNY1doZmo5cStYUk80dW1TenhQ?=
 =?utf-8?B?Tm4rTnY3YitCazFvQnhSMmRDY3pscFN1eExwOUpFendCNS9BRU9tZy9LdUQ3?=
 =?utf-8?B?T2hKTTFUdTZLTkkvZU42WWlHT040Rm9WRzd2NnIvRTZiejdQMzQwQmxQTHNG?=
 =?utf-8?B?Unk5cmd0Q3BlT2xlZmZYUk1GcmVISFdzNFk3R2pudXhyR1Q4SEJrcks4LzMz?=
 =?utf-8?B?eTFCb21ZQVB5dmxRcGMxMkR2czk0M2twUFNFWTAraTVtcksvS0FpN1pJUmU2?=
 =?utf-8?B?UG5GRk5YOC9MTXNHbTFiOWZMZDMxWC9zNmYrai9id25rdGsyb25wUTJmdHh3?=
 =?utf-8?B?Y0UyZ01aeklKWjBxS0R4K2dDVUdnZVA0REVuekZmMURKWTdSNSt1YnlLblkr?=
 =?utf-8?B?Vlo2ZVd5Q2wybFpmYlR4enlQN2Q2SnRydXM3NmFnWFVWN3B2UHgydGRkbFJo?=
 =?utf-8?B?dHhxNjF1eFdSTkVqMnh2L0JYb1c0Q0Q2MHk1NDFTNDAveDRLSjZpU0Z1dEVv?=
 =?utf-8?Q?vVL9JiRbUpCcY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d0fe02-b794-489c-dc41-08d98340e28d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 12:01:35.9465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaMRgbDKLwq2/wMqOM+ZpQ9qkarrZvqQVw4mYG4KneDsp4L+n6IDlqpdJmGxGeRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0032
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

Am 27.09.21 um 18:14 schrieb Matthew Auld:
> On Mon, 27 Sept 2021 at 12:47, Christian König <christian.koenig@amd.com> wrote:
>> Any objections that I just push patches 1-7 to drm-misc-next?
> Please go ahead Christian. Thanks.

Well I've pushed patches #1-#4 because #5 won't apply on current 
drm-misc-next (some conflict in i915).

Could you rebase this an/or request backmerging of drm-next into 
drm-misc-next when potential i915 prerequisites have landed there.

Thanks,
Christian.

>
>> Christian.
>>
>> Am 27.09.21 um 13:41 schrieb Matthew Auld:
>>> In commit:
>>>
>>> commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
>>> Author: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Date:   Thu Jul 13 17:01:16 2017 -0400
>>>
>>>       drm/ttm: Implement vm_operations_struct.access v2
>>>
>>> we added the vm_access hook, where we also directly call tt_swapin for
>>> some reason. If something is swapped-out then the ttm_tt must also be
>>> unpopulated, and since access_kmap should also call tt_populate, if
>>> needed, then swapping-in will already be handled there.
>>>
>>> If anything, calling tt_swapin directly here would likely always fail
>>> since the tt->pages won't yet be populated, or worse since the tt->pages
>>> array is never actually cleared in unpopulate this might lead to a nasty
>>> uaf.
>>>
>>> Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access v2")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
>>>    1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861..5b9b7fd01a69 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>
>>>        switch (bo->resource->mem_type) {
>>>        case TTM_PL_SYSTEM:
>>> -             if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>>> -                     ret = ttm_tt_swapin(bo->ttm);
>>> -                     if (unlikely(ret != 0))
>>> -                             return ret;
>>> -             }
>>>                fallthrough;
>>>        case TTM_PL_TT:
>>>                ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);

