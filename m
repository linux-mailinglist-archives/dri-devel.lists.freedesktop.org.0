Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA7933F25
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 17:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4240110E29A;
	Wed, 17 Jul 2024 15:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xUCG9Ll3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2601910E290;
 Wed, 17 Jul 2024 15:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3MnGTCnM7oauCmkeGei8jGOls5UPRk7p/cpdlQnkBaq6ANDk/1BjAL8S2dzJg9uQ+/uzKXw7J/lcIW1ZO0Byo0zgdoBV4LncRQQNrx98KjM0yaU/lfcWWSsZpIu31XRkPu1czDY7+f5cYjVAx0QRnfYxd++XuKFc+A2+F93fa2Qco6Y9yW3cni+2chfYQnzkDj+MUzqOjY3VP2lwG1uJhhpkUH4NpMAzSa6oXVTdEo4Z1P7zKyKFOwW14bzwxQbgKxyImQgoj0pC7eJNpg2Mq+nK/DRS7kQLY9TQoP00rv5Z+P3ijGey7EXLbVW0kWxKWXbE6Reo2Bf2z6Aoo3hSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idYRWbBpWiSqK2SrsWPUs1+KV/5RGxCjYDawcWzVqD0=;
 b=rH2RcsiQJOSxW0qfl1gNUNfRCZga+jK6u7zrA1n4jJ32WJVAG8sO9s6AKNHLPxvmvlqdv8Ni0Tbb4VhALbedlnbO/d1ztZ767SQQNgJyIGaY8NEsSeGQaopCLqwVh4FFZD+AdwzdDamNaP+LE0/6okkqnwmvZs39kiOBq/aum3We2aBWS7FmF/ZEoM28z0k8EyTluia13EP9BsaYGl1PMCowsrRBsdBFmYRFt/33iWZiClcrRi72WXQg8gGDXB16S0/xua5RNRlYgQ0owx9jTT3qEFj7qPvya7mzAUWfwgR71MmSmQNLp/YE8L2Gb0kXqCSNibHyczGzXHs5QAGXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idYRWbBpWiSqK2SrsWPUs1+KV/5RGxCjYDawcWzVqD0=;
 b=xUCG9Ll3KDM+vxLnnzYefPNS5D8qZRipCCRpD7sKku5eHCOE88oV8HSyASqSfkLI2HL2BhMJOW0ulWPKfiAbD786GR0MPE741FPnvq5W2hf8v7uZotAKi1nQZbSd4HKQrZ1C5U0SLdO4VByLJpT+DQSEDiLZ+FyQFoOEI6dWvuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 15:02:56 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 15:02:56 +0000
Message-ID: <dad0c7b4-2dc7-4c2c-bc75-ff70ead452e3@amd.com>
Date: Wed, 17 Jul 2024 20:32:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: Matthew Auld <matthew.auld@intel.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
 <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
 <67ca2d5c-a762-4627-94d1-532b0e3d2100@intel.com>
 <f4027aee-1ff2-4f0d-8230-6f6b2e101f78@amd.com>
 <9fce9f74-ebbb-4763-9f87-218055e61654@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <9fce9f74-ebbb-4763-9f87-218055e61654@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 10290ac9-9b9f-48fc-f6fe-08dca6718a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFA4Uk92RzdkNmdOZ0w2R0VLeWhtZDdPV2hKYXNxQkNzR1ZGK3VNZWU3NEtP?=
 =?utf-8?B?SlZlZXQ2cTNGRmE4dlozVityMkVqVVZzRU81U3hVaHF3dUh0TXptNGRPdzJs?=
 =?utf-8?B?KzZjVWVKSCtGQnhWZ0lPVDA0UmtXdGQzS2JFUXdmZ2YvS0QxaHlZT2tJR2I4?=
 =?utf-8?B?MHA0UHlpaUZnbnlTc1ZEanUyWEpWQ0E2Qzk1VWk1cDFmZHlrcG5Yc3FoV3Fk?=
 =?utf-8?B?U3RvM1NPVEZVMEtNWCt4ZHZPN21POSt6eGFyMHVzQTRUbnhsanBnYkJwbkxw?=
 =?utf-8?B?YmtGTzcyQXI1OHk3WlpvSzU4M0pFRm5KT2p4MlJURWx3dklBOGNCYW1jVDhZ?=
 =?utf-8?B?RmZPOGhDVGp2WExnVkxxaDAzd3NyY2JmUitpb2dSNFo4K0F6WU1DWWFCUUt1?=
 =?utf-8?B?Y2VCaitVZDdQNmpOTlJsS0lCZkRLZDdxL2tXRjkvRm1jdmYzOXRTRTl3b1d0?=
 =?utf-8?B?L3hnYlZTaXlxUHZSZnpwM3dhNGIxRGM5eVk3SXI5a1Jjd3FqUit3RlM0L3Mx?=
 =?utf-8?B?VVNZQWRRU0xzT2dqekFaUUY1Nk0wQnRrK0l3c2UvWitwV2MvbUhyUCt1LzhZ?=
 =?utf-8?B?MlFkakJ4SUFENWNkR2NCQ3NTWFhEZDRFZ0VUcHNGb1h2L2wvRGlHWWdZZ08r?=
 =?utf-8?B?RWFjNGpKbDRSY0ZxVi91YnNLeEJveVZuVWdBVlJrQk1HOEdoT3JHOCtoajE3?=
 =?utf-8?B?WnU2R0psV1lGUXM0RWhmTXpZaDlvRytrOFJhZnYxbGhZS2k4SlNDbEF4b3Vu?=
 =?utf-8?B?OUhMZHIzcU9zejB0TEIxSTBaalkyZkRGajcrMjhhQ0gxOXdWeEY1TVRRUmU0?=
 =?utf-8?B?RU1zYW1GNzU1Mk10L002T2c5VGgrVnhaUFRPNW1tT1l6RXlOMVQvMGNxMXBv?=
 =?utf-8?B?N3hwSWhxS25ReEZiY0lIYUVMcjhmS1l2OVRQNG54Z1Q4N21Va2FWanNUOUZr?=
 =?utf-8?B?OG9TZEhNR3BIWUx0YS9YZWF0SHpQV0dJZWg0ZEdVLzhpdGVZMkdUR2d5TnYw?=
 =?utf-8?B?YnI1UGJOS2RUYTVwaVhPOHE3S3UybW1TbElxemkzajJHblI1YkhiUTJsaHc5?=
 =?utf-8?B?R1ViRE9LM1JHcEpZc3U1WTFidGNEcE1JSnVRT1Y1MFl5bjlFZ0YwMlExUTQw?=
 =?utf-8?B?RnhzeC90WFkxNXU1TGNBQjFMd1grMjUwYk1SQ1BVRzl0U1FIdUN4VVhFVFRR?=
 =?utf-8?B?aEFmRDgzQWJaR21lcjhFZ3htc0ZNMjE3Q2U2ajN4ZVZUeUdiUS9hMTRWQXpy?=
 =?utf-8?B?STBPRGNRNWtldi9uUUt1d3dZMXR6RFdOU1VFM2V2d2NMbTFxckxnSmtXOWtQ?=
 =?utf-8?B?dHdJUE5sNDdxOXN4Q1UvcGtRdWNOOEJGQ1NLVHlSOFgyTnZtZTViOFl4S0xq?=
 =?utf-8?B?UndYNDVJUlY1Y3FmSWYvSVRpbTRUUE5IYThmeTVNditpVDdPdmxSam5jdk5M?=
 =?utf-8?B?K1hWZzU5WmFWWVM2dzJXRTBaNmxPS2U2ZjFjQTdPVFVnQmtzUy8wQlN0blg1?=
 =?utf-8?B?SmRGczNnVjkrZ2VkMHVlcXk3Ui80Mmltbk00MFV4MlgyOXJMQmpyaDdsenVp?=
 =?utf-8?B?S1ZlaTUya1BIRXVVMVV0U0VlWDF4dVU0MzFENlZ1MWZsd0dyWDUzV0FPOU4y?=
 =?utf-8?B?S1dza21JdUdSTm9YMVIrT0NHY0ZqS01uRGlsOWR4VGFHcXFMcGYrdzZ3Vlpz?=
 =?utf-8?B?V09WOUtpeEdSZGlWUjRRMXFDVzdmNWc2WDNabTk5WHpmT3NZOWVrSGtHMnJB?=
 =?utf-8?Q?Qb1f0RxYocgft8yXrA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkdUNjN3OERsNU9Wa3h6V2drdHdqUWV2SVZLYnkxZTNqSlMwU0lraTNvaUlB?=
 =?utf-8?B?ajdlM3NLMHN6L0kvcTVMOVZzci9Cdkl0TGRWUkYxa0phbDVqUkczdytSclo2?=
 =?utf-8?B?dXZVS0xmR3AxVFZrL055cnhETXZNYldKOTZ5RnB5M0M2U3RERUliR2VRWHY4?=
 =?utf-8?B?N3ZPVHVMZDhaeXBoa0VMNU5TWi9QMENoQW5CcWF1a1hhV00wRHNoMU5SSC9i?=
 =?utf-8?B?bUg0TWNPdFJQd25zS0YvcE9JeGI1eEUzckx2MVZGS3VSU2tqYnBNdTVkNWMv?=
 =?utf-8?B?ODUrbVNQZ1BLV3h2YmtqdzZwQVJ0MUd4ZzNPUTdKRFE3ZFE5ajJTbHg0MTRk?=
 =?utf-8?B?QmZLTG1KWFFFc0U1UGlXaVZueVpuSE9WZmZZd0h4R0Y5ajllYlhad2lzcnpy?=
 =?utf-8?B?TkZIRTRtTDVZaWMxNGhzSGZzc0gvSS9aVE0yZmd0NklybGtPSnRRVStqS3E4?=
 =?utf-8?B?dlVhTUxydkNCUFNmOW16a0JqYnZOWVJkV3pYc2RMOGJHQ3Z2ZWVkQ3pPQWJQ?=
 =?utf-8?B?VXczUlA0TWlLazhITDNnODRDZ1ZXTHZXOWU2TVgyUWQ5dWtUamZzRCtGYmxW?=
 =?utf-8?B?ZmhWSFI2S1k1Qm5uZER0YkhLT2tIcXZvS3NvaHhlaE15amZ5QUpxdW9GcEh4?=
 =?utf-8?B?WVpleGtVS2pKUGxqLzlBWlNXNGZUMFFXZHVtY3EvMW9TcEtDSnRBMjR4cXRU?=
 =?utf-8?B?b29tcWlVK0s1TDZCOVByY0g3ZnQxb3VDRkd1Z0xhUld5M01paEJzVXkxR29L?=
 =?utf-8?B?VnNML1NjWk0vK1JFczJYMDJ3OHBKTFJUd0ZUZ3c1ZDk5Q1FEVUdObTEvSGFI?=
 =?utf-8?B?bUVIVXkzaVhyMzVyZjBrQnI1eXlxV1NieGNpWlhwR252b3ZSVUR0WGtyM0tH?=
 =?utf-8?B?anlNUnc2N3hQcUlXeDIxM29md21WcW9VVFVKcUN5bHlkQWVXY2I5ZlhPN0lv?=
 =?utf-8?B?RDF2aXZVM1BGOGNPa1dzbXVMUWxOYWg0WGNjdHRoVko3cWNhTlkwczNPNE15?=
 =?utf-8?B?VHd6c0lNczM3UjRaQ0FJVkZjUVZCbjY2WlE1OCtlTzlZejQwbFBPTkQ4RDl5?=
 =?utf-8?B?TDIxL0lqNm9NMURoWnFLMXA4QXJNWGV0eHMrSXpCVFF4N2lHeTBkeXBwSVht?=
 =?utf-8?B?bjVFK0ttZU1GaEcyVER4ZzJ1Y0xhQys5N2MzUW9Pa25OZjUzbXY5djJ5SzBv?=
 =?utf-8?B?cmllT0FvczB6RzVLbitNbnQ1ZzNnbEpTNUxnTUhDTHQrZk5NTnRnenQ0YzE1?=
 =?utf-8?B?aDJoM2VTckpBOUg5RmMxSkxUQ1RqRnlLZXcyNVM3bFdzWmI3WEdNSWMwdTBp?=
 =?utf-8?B?ZGpZVVNkY1ZZdU5QNkg5Ym0xR0I4TFhmMFpWd2kxQWdPckt3NGllMkN4eUtM?=
 =?utf-8?B?eFk0cmg2d0lFb1czNUdGV0I1dHZqUjRIRGtjZzMyTkdLbGFhaVRkd3g4a3lD?=
 =?utf-8?B?SVEwNitvMENUT3htRzFvU1VmK2cwaHZDU3FRUTBicU56bXB1RlVIQ1FiUnp0?=
 =?utf-8?B?U0lKNDA3QmxYYmVWOVBoU0cwbmUxVUFkN0xKTGVUYzRYYU9IME1HTHNoaHJh?=
 =?utf-8?B?bVRLaUUySGdpWTAzVm1XTzE3cHZQZ1I4cXl0UkI0RGovMVZGWjIxZ0VOMlVN?=
 =?utf-8?B?dmRzUkNRMlBCRDJYdVFhUkNBL0hyenBqaHJDVU4zeVc4RHVTUXg0cXV1K29n?=
 =?utf-8?B?UmlrNzVtQk9KdmlXUGtmbDV6cHh3WkpBMENWVHRDaE5Ma0tPeWhjTU1HMEJx?=
 =?utf-8?B?akVQUytNZUtpSi9GZTJxVlpVOEUwNkh0ZC9mTFg5cU9Xd29VRzJOZS9XVksy?=
 =?utf-8?B?L3VjRFp5NUFlZ21KVnk0WE84NkVEZ2RXVXZHeEJoUHRNUDl5c2VMMVE2bFY3?=
 =?utf-8?B?RWg3NVRHNk5PT1Z3Z1BmWFFOWWZYdUVkQXBLLzVzYW5vVGx0Ui82UEZjVkdX?=
 =?utf-8?B?cHpBRFBPWllNMTJSMUxvbkJaZmNNbC9JWFFNS2dmb3Ryc2kzUGtUblVVTENs?=
 =?utf-8?B?eUZ4NHk0SENYdXFhU1czMzhnd1ZXc1RPYlkyRituVlVtbDR3d1dxZ1lqaXhV?=
 =?utf-8?B?TExNcVY0cmF5Mmh6ci92bEtKY3BIekJFWHVwZUwrdG5HOUhCN290blpnUEpn?=
 =?utf-8?Q?SA4nYPcrhmnXXxaUEq7F3n/lh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10290ac9-9b9f-48fc-f6fe-08dca6718a02
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 15:02:55.9597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkhqbFIoFxluGLhKLye63EpHgFkE3D3tltcabFmDRKHxoFySr7uAXB5b9dN1yi00kUXaN7qpIBAkqUU5j8rjxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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



On 7/16/2024 3:34 PM, Matthew Auld wrote:
> On 16/07/2024 10:50, Paneer Selvam, Arunpravin wrote:
>> Hi Matthew,
>>
>> On 7/10/2024 6:20 PM, Matthew Auld wrote:
>>> On 10/07/2024 07:03, Paneer Selvam, Arunpravin wrote:
>>>> Thanks Alex.
>>>>
>>>> Hi Matthew,
>>>> Any comments?
>>>
>>> Do we not pass the required address alignment when allocating the 
>>> pages in the first place?
>> If address alignment is really useful, we can add that in the 
>> drm_buddy_alloc_blocks() function.
>
> I mean don't we already pass the min page size, which should give us 
> matching physical address alignment?
I think we don't need to align the address to the passed min_block_size 
value for all the contiguous
buffers, so I thought that decision we can leave it to the drivers and 
they can achieve that through trim function
in this kind of a specific request.

https://patchwork.freedesktop.org/series/136150/
We are getting this sparse error from the Intel CI. Do you think these 
errors are introduced with this patches?

Thanks,
Arun.
>
>>
>> Thanks,
>> Arun.
>>>
>>>>
>>>> Thanks,
>>>> Arun.
>>>>
>>>> On 7/9/2024 1:42 AM, Alex Deucher wrote:
>>>>> On Thu, Jul 4, 2024 at 4:40 AM Arunpravin Paneer Selvam
>>>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>>>> - Add a new start parameter in trim function to specify exact
>>>>>>    address from where to start the trimming. This would help us
>>>>>>    in situations like if drivers would like to do address alignment
>>>>>>    for specific requirements.
>>>>>>
>>>>>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>>>>>    flag to disable the allocator trimming part. This patch enables
>>>>>>    the drivers control trimming and they can do it themselves
>>>>>>    based on the application requirements.
>>>>>>
>>>>>> v1:(Matthew)
>>>>>>    - check new_start alignment with min chunk_size
>>>>>>    - use range_overflows()
>>>>>>
>>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>> Series is:
>>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>
>>>>> I'd like to take this series through the amdgpu tree if there are no
>>>>> objections as it's required for display buffers on some chips and I'd
>>>>> like to make sure it lands in 6.11.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Alex
>>>>>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_buddy.c          | 25 
>>>>>> +++++++++++++++++++++++--
>>>>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>>>>>   include/drm/drm_buddy.h              |  2 ++
>>>>>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c 
>>>>>> b/drivers/gpu/drm/drm_buddy.c
>>>>>> index 94f8c34fc293..8cebe1fa4e9d 100644
>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct 
>>>>>> drm_buddy *mm,
>>>>>>    * drm_buddy_block_trim - free unused pages
>>>>>>    *
>>>>>>    * @mm: DRM buddy manager
>>>>>> + * @start: start address to begin the trimming.
>>>>>>    * @new_size: original size requested
>>>>>>    * @blocks: Input and output list of allocated blocks.
>>>>>>    * MUST contain single block as input to be trimmed.
>>>>>> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct 
>>>>>> drm_buddy *mm,
>>>>>>    * 0 on success, error code on failure.
>>>>>>    */
>>>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>> +                        u64 *start,
>>>>>>                           u64 new_size,
>>>>>>                           struct list_head *blocks)
>>>>>>   {
>>>>>>          struct drm_buddy_block *parent;
>>>>>>          struct drm_buddy_block *block;
>>>>>> +       u64 block_start, block_end;
>>>>>>          LIST_HEAD(dfs);
>>>>>>          u64 new_start;
>>>>>>          int err;
>>>>>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>                                   struct drm_buddy_block,
>>>>>>                                   link);
>>>>>>
>>>>>> +       block_start = drm_buddy_block_offset(block);
>>>>>> +       block_end = block_start + drm_buddy_block_size(mm, block);
>>>>>> +
>>>>>>          if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>>>>>                  return -EINVAL;
>>>>>>
>>>>>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>          if (new_size == drm_buddy_block_size(mm, block))
>>>>>>                  return 0;
>>>>>>
>>>>>> +       new_start = block_start;
>>>>>> +       if (start) {
>>>>>> +               new_start = *start;
>>>>>> +
>>>>>> +               if (new_start < block_start)
>>>>>> +                       return -EINVAL;
>>>>>> +
>>>>>> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
>>>>>> +                       return -EINVAL;
>>>>>> +
>>>>>> +               if (range_overflows(new_start, new_size, block_end))
>>>>>> +                       return -EINVAL;
>>>>>> +       }
>>>>>> +
>>>>>>          list_del(&block->link);
>>>>>>          mark_free(mm, block);
>>>>>>          mm->avail += drm_buddy_block_size(mm, block);
>>>>>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>          parent = block->parent;
>>>>>>          block->parent = NULL;
>>>>>>
>>>>>> -       new_start = drm_buddy_block_offset(block);
>>>>>>          list_add(&block->tmp_link, &dfs);
>>>>>>          err =  __alloc_range(mm, &dfs, new_start, new_size, 
>>>>>> blocks, NULL);
>>>>>>          if (err) {
>>>>>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>>>> *mm,
>>>>>>          } while (1);
>>>>>>
>>>>>>          /* Trim the allocated block to the required size */
>>>>>> -       if (original_size != size) {
>>>>>> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>>>>>> +           original_size != size) {
>>>>>>                  struct list_head *trim_list;
>>>>>>                  LIST_HEAD(temp);
>>>>>>                  u64 trim_size;
>>>>>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>>>> *mm,
>>>>>>                  }
>>>>>>
>>>>>>                  drm_buddy_block_trim(mm,
>>>>>> +                                    NULL,
>>>>>>                                       trim_size,
>>>>>>                                       trim_list);
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>> index fe3779fdba2c..423b261ea743 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>>>>> ttm_resource_manager *man,
>>>>>>          } while (remaining_size);
>>>>>>
>>>>>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>>> -               if (!drm_buddy_block_trim(mm, vres->base.size, 
>>>>>> &vres->blocks))
>>>>>> +               if (!drm_buddy_block_trim(mm, NULL, 
>>>>>> vres->base.size, &vres->blocks))
>>>>>>                          size = vres->base.size;
>>>>>>          }
>>>>>>
>>>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>>>> index 82570f77e817..0c2f735f0265 100644
>>>>>> --- a/include/drm/drm_buddy.h
>>>>>> +++ b/include/drm/drm_buddy.h
>>>>>> @@ -27,6 +27,7 @@
>>>>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION BIT(2)
>>>>>>   #define DRM_BUDDY_CLEAR_ALLOCATION             BIT(3)
>>>>>>   #define DRM_BUDDY_CLEARED                      BIT(4)
>>>>>> +#define DRM_BUDDY_TRIM_DISABLE                 BIT(5)
>>>>>>
>>>>>>   struct drm_buddy_block {
>>>>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>>>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>>>                             unsigned long flags);
>>>>>>
>>>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>> +                        u64 *start,
>>>>>>                           u64 new_size,
>>>>>>                           struct list_head *blocks);
>>>>>>
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
>>>>
>>

