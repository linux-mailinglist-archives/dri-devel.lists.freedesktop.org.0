Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372D58D551
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 10:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89F6CB6E4;
	Tue,  9 Aug 2022 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAC9CB6B4;
 Tue,  9 Aug 2022 08:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xml2weWBSXi8AqOzUkYHHuOzxzHIWUWFHHKzW/+E1h2G+VeTtJ8og+z9kp8QZToHeZHxAkCZPEy3qRA0AjPx4/bdXwyggHEu8I834bwuf5vptXKN7lHk1Lyyi4YGmtUWrAyRYGeHPDio0Rg05FghUBHAKshtquTe/XJc1KnSdqBbmPt0ebvHGN+rnzR1WMCptg41lQoa2vx31PjAecVTJSFbh/svai1pdTRs5oxhmEtTsO6rcQFqWppzhhgH7aAtHwYY/g2EwYYIIoevDqkNav42uXHlWuYGvTxo7uqDsf0fTsishEEcFDMDMvpTH/8siJtzo+8a+q9LdY15hGSsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSG/xG8nN2tqkfCUWkQbAHPc4qL0mss6vSMbOIPMF7U=;
 b=bhwJgYePFsGttNq/ZgiLcP8OZ7x3GCv+ciHh+WZZMXn7CDPWbPIwz2l/A2wdnu/6BjWDaX9grrYKAB0crRLl80ZdM5dtgxCudxs/vvf1YmcvuY+s8QpCKgs1FWSpvrycDFygxrZjsC6IlLUDLWpA4qljcM8+O86cskRbjs1SROutOeX/n2RzRoCEQnDBtY4u0J3fHsgoGUAV/P9Zg440mt5FAwvs1GA0S8aHtVH5Vfah7/pRNHeKSqdJM3PyCUDB6iB1FNQXC57aSQTKnRtE2WTXH0/mncb1qDAH2+hFGVUpDP1PRQdlxhT34wu1CixwAgqks7tG+RLEseGKB6mgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSG/xG8nN2tqkfCUWkQbAHPc4qL0mss6vSMbOIPMF7U=;
 b=mFlOoaU1/+Lwz2dWDF7W5lHByfUpi1fIjLGokupCxEGGn7evKtuh8trLlJ53xgx5ooiPpeWNd73oMlRRJx8Y10tlDoLRqK7BpNb5l4a7pgH81QrG/gusNxI7hdiLkzKs6DSh/Ccz5ErHHy0ZJgfSC3/79z3kFN+VGT87URxvc2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BN8PR12MB2897.namprd12.prod.outlook.com (2603:10b6:408:99::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 08:26:46 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 08:26:46 +0000
Message-ID: <9d08224f-b1d6-fee6-4536-5ad34dc7773e@amd.com>
Date: Tue, 9 Aug 2022 13:56:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/6] drm/ttm: Implement intersect/compatible functions
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
 <20220725114240.4844-2-Arunpravin.PaneerSelvam@amd.com>
 <8398d805-a749-dac6-9bf8-6f93935dd2ec@gmail.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <8398d805-a749-dac6-9bf8-6f93935dd2ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::19) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22312ffd-74c1-4e89-91a7-08da79e0e5ef
X-MS-TrafficTypeDiagnostic: BN8PR12MB2897:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: renoYPX6i/ygLQgOtdIuWonOheGA9IhkQ/uW+Z3zkVqj+tSMnh7wrOvH+2LOdfTWLcZOvHZubKznLsBm3A9WlRs7qiX9XIpnpP+Iuimt2KyheKwnN2EimzsdqgFFJCF2o/ieAXiruIUPdGlJUkYhoaA96rzZz2YkEjbdH1dYuhIEyTcKilt7DDK8wCl24HhYH79257rhmZg6VNgVq3QdWDvsMuLwFjN3c/64qNKWcx+5Euhe/4q5Amo3OU7UeZ7tfF5RqQi9ByIw0J0utiNhYP0udjmjw3XGKJf4eHDF/t7eZj9Wh/KoTMHtbfjMeHJpYjDJHXrunUUovkvLIXOOZ2Wrdp3GZrjqI7RtA+q2+Aatwgg2mxS9tsrJKgL2AnlFwDo0nwTB4qsKTkaXzuMySKBPINOvbHRjlVxBg/NWln040igUIbpWQ9++kp5SCz4OtP53KpylXFZl0Y0qmoceYFKaK6qAMYgHv8MUk1OMybUy35UyTF4v0aRV6qj/uV2kp3dT1mps+T1TIq0UdX9FK0mRnPOtQnAH7U72Wa3juXYJmL39y+9+7EoU7IOzluFidzTLLdHAs9c/ucSIYY+UeQzpwMAQOKWO4glODkFxzEuqeJqF9F8ar4PM4qyZvqkwwmVM/PdMI8SCgRTz3qM5lVpMGhnHovVlxYYf/v0661z+Dj9dnWosvwqF7ZYIRt5hlYlb5KEKYc8tbLNAFH5oK/dTqk1PdanM+4XiZryinWrnUA+ss/3t/aSKJCqiwNJQU7LPQMNllcKto/ZEROQBRIBktgrcVU0tQ/yaHAUzwmzuyt/QcpNQx97qYbgxDh8v9uoVKfEakS5X45mDZOcdTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(41300700001)(316002)(6512007)(6506007)(6666004)(2616005)(186003)(26005)(53546011)(31696002)(36756003)(31686004)(86362001)(38100700002)(66556008)(66476007)(66946007)(478600001)(6486002)(83380400001)(5660300002)(2906002)(8936002)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VUUXpyWjZUOWR6RTNRMXQ3ZlU4VGR4ZFRQaFl1T24xMGtsNDdnNFAyU1dP?=
 =?utf-8?B?VmN4V3JuYkVjcElON1lPTDVEZHkxeHJBVStHaFNqWFVoM0kvZTBmR0gyMUw5?=
 =?utf-8?B?a3RHOC9MSldwZWRzY1FNckhQVWlHVlJ5WGQ0QWo3MXhscWdrcnd0ZDN4UVNF?=
 =?utf-8?B?cTR2YUprWk1waVV0NUU0c1NYaFNUdUlzNFNTSEVGN0FXaHFkQ1kvMVlxUDh0?=
 =?utf-8?B?UlpHL21IdnhxOW1vZHhWYUQ1VjVHQ2xMVkZ3ME5yS0xNYmxUNWdCK2ZzZi85?=
 =?utf-8?B?cWVLZm9Id0x5ekJDOWI1UlF4VVlXMmNLTVJJamt6WWtOMkNNSnBxd3BBOEYr?=
 =?utf-8?B?a0dudHROWU44cHk1aFBrNkhtbDBrT3BoYUFxQTl6V0U0RDNOUXZ3SDVyWTdV?=
 =?utf-8?B?NDNwT0RsaXdncS8wYlRnekFTQWJLMmlGTHgwNGFvdUsvUEVvMmhpd1F2WmpJ?=
 =?utf-8?B?c09hNHRHZ0R3MXFYdENpZExzQWs5dm4yOWgyZFNOeEZIUlByUFlrYU8wVWUw?=
 =?utf-8?B?Q0VMNjF0ZmZSNEZFUDBqTWkxNFBLRmlHazVEVS9jY2RDeDkrNENzakhubVpU?=
 =?utf-8?B?SGphcnM2SVM5c0t1UHprTnVER3ZUem45QjZxeHBjTkhFWHRiU2p2SGE3YSt3?=
 =?utf-8?B?eVcrL3B3c2tEN0RwbzNrZTFCVy9FRnI3UHJKTEdkaDRSbFRnVGxlYmN6MS9M?=
 =?utf-8?B?bFRyT2s4SlFyZ21GQlVnZ0VuWGszcDlidTZaTHhabGRUaXhlbk82ME1zOHg4?=
 =?utf-8?B?MzdIdGdIV0ZiMUw3SjB4VUlwNW9TMTZaUEhxeVRMdGFuZnN5Vk9YdEhXN1cv?=
 =?utf-8?B?M0gyRXExbVFocnU1MHBwdmxHdWNlUk5GQTRMWnhWRG8rb0lEUzBzT0pZOWhh?=
 =?utf-8?B?MTRSTGdLakw4YnlLVG5PaFRseVNqNzB6V2ZRNUlaSklKS1FWcnRFQnVETWx5?=
 =?utf-8?B?Q1pmUmpYZ1hYNGVWQXJGeFV1YzJPR2IwWXQvYlVPMlo4QzY1VE5FZGFwb3Iy?=
 =?utf-8?B?VkRIRGI5RGdab2x4MGNEWDVrTElhMU1YTm4yOFRBVGdjS0tjcHpqdnhwMy81?=
 =?utf-8?B?eDg5dWZTdDFQWnp3VjdLY0RHdmJldDZnU2duWnM1c2didis3V29MK0lHMjhn?=
 =?utf-8?B?MHlYcENuWXZ1V0lPc1EzTUJWaWRqTVgvYmZpTUIzMjFTRlg5WmJ3Q1ZLa1V5?=
 =?utf-8?B?NkJPZDY4ZlBORkRmeTl1V0kvOXF6MGx5bHBzZkMyWk5ZRzhRQkQ3U3ZOT3Ba?=
 =?utf-8?B?cGNtQk1OOWYremR2dWRTSi9PeS96WUhjT3M2VWJzTEUvbVM2ZmZrdGtDaUdT?=
 =?utf-8?B?YWhEYzhrVFcyZjJBZ1hnaTIxbTlMcytoblpsVk51Um5BRllEcnd0LzQ5Vzhi?=
 =?utf-8?B?Vzg5TUs5REtLL1BlYW1SUUpyWmxJeVAyWC9TUEdoTmV2ZE9MWm13UWlzMlA3?=
 =?utf-8?B?NlFTR1ZibUs2UU1GclQ3d1pWdnF1bGEzdnFCQlZneFl1c2c2c0VseHNXbGdG?=
 =?utf-8?B?eFROanc5b3FHSUlFYWMxT2ZCR1J3OEIyTUY3dHJER2g4LzFXWmI3ZGRCb25L?=
 =?utf-8?B?anZ5QmpXQ1lyNElIeDZUbGw4RStURENjQlIvK3JyS2hLRnBvT2pPNktqQ3Rt?=
 =?utf-8?B?RFdYOFFrQUl1NkhwVjZid0JZWGxFTCtuclF3OGw5di9EWnlnRWFkdGFrZ2xY?=
 =?utf-8?B?UTBqYkFEd1lNQTdjSTEyVndNV3ptWmRzSlFvY0dZcWNlREhGa0dadi9oSDBC?=
 =?utf-8?B?SldVZDhzRW5VR1dnS0VKWjFydFhuS3VRTVI2QTJmWS8zWGtYZndsWTZYQ21m?=
 =?utf-8?B?Q25JNTQ4VUdBajJXSWhvTmMvc1J4dlBIOUxrMm94bUhpYTNtN0l1VTNIUyto?=
 =?utf-8?B?dlFhVk1LVWNYNVRtVnVSaXIrWnJleXFwRFAvYnFIMjlYZUpUQU95S1B6VE5r?=
 =?utf-8?B?bzZUay9YTnlvbjNZdTNkRmJZWS9GVDNIcWdiM00wSmJUVlNYOXpBRDNCT1dw?=
 =?utf-8?B?UUxSbkVUa1dNL3MyVmp2Zlg5U0VRWHFoWGVucThzTU9NQTMyM1A5WXgwVXp0?=
 =?utf-8?B?clhBNmhtMDA4NW9TVHdWUXhPTWxFZmhPZFVneFdWa2owZGoxb3NkSkIyT1h0?=
 =?utf-8?Q?K/Wl/XaETFYy3ohsB7V+mWigg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22312ffd-74c1-4e89-91a7-08da79e0e5ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:26:46.6476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USt5vpJrVwW+bU5CKw9OSzTf1bAhmkLrIjyE2cvJ8gUFMh+KcwWWe6l+YvmM62be/u2YNlGPzAss+Daod5LRvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2897
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/8/2022 5:00 PM, Christian König wrote:
>
>
> Am 25.07.22 um 13:42 schrieb Arunpravin Paneer Selvam:
>> Implemented a new intersect and compatible callback functions
>> to ttm range manager fetching start offset from drm mm range
>> allocator.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 33 +++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> index d91666721dc6..12b8d9b36fe6 100644
>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -113,6 +113,37 @@ static void ttm_range_man_free(struct 
>> ttm_resource_manager *man,
>>       kfree(node);
>>   }
>>   +static bool ttm_range_man_intersect(struct ttm_resource_manager *man,
>> +                    struct ttm_resource *res,
>> +                    const struct ttm_place *place,
>> +                    size_t size)
>> +{
>> +    struct drm_mm_node *node = 
>> &to_ttm_range_mgr_node(res)->mm_nodes[0];
>> +    u32 num_pages = PFN_UP(size);
>> +
>> +    /* Don't evict BOs outside of the requested placement range */
>> +    if (place->fpfn >= (node->start + num_pages) ||
>> +        (place->lpfn && place->lpfn <= node->start))
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
>> +                     struct ttm_resource *res,
>> +                     const struct ttm_place *place,
>> +                     size_t size)
>> +{
>> +    struct drm_mm_node *node = 
>> &to_ttm_range_mgr_node(res)->mm_nodes[0];
>> +    u32 num_pages = PFN_UP(size);
>> +
>> +    if (node->start < place->fpfn ||
>
> This should probably be "<=".
We are checking the false condition here, if node->start == place->fpfn, 
then the node->start
value is compatible with place->fpfn, therefore, we don't return false.

Thanks,
Arun
>
> Regards,
> Christian.
>
>> +        (place->lpfn && (node->start + num_pages) > place->lpfn))
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>   static void ttm_range_man_debug(struct ttm_resource_manager *man,
>>                   struct drm_printer *printer)
>>   {
>> @@ -126,6 +157,8 @@ static void ttm_range_man_debug(struct 
>> ttm_resource_manager *man,
>>   static const struct ttm_resource_manager_func 
>> ttm_range_manager_func = {
>>       .alloc = ttm_range_man_alloc,
>>       .free = ttm_range_man_free,
>> +    .intersect = ttm_range_man_intersect,
>> +    .compatible = ttm_range_man_compatible,
>>       .debug = ttm_range_man_debug
>>   };
>

