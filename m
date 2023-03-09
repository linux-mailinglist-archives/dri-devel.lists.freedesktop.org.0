Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5B6B1D4F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1864710E7AD;
	Thu,  9 Mar 2023 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8110E7AC;
 Thu,  9 Mar 2023 08:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRhuGT4MV7cDFUZfLZnmAj22Yng5OqY5BWySuPfu51bCq4/8efcD+ZLWkRElsetcMs1cMCgi7X625ShL4z0WOQPCq3F4bd6pEPZIXACbmg8WljfeoX10zBaWQlyQwNKEiTnWRYrKKzVdlDwZaRKszKAla7O9xzp5nTLFVSQQMdrS9cWRlG1GMs5AQkjnTDYjBgqAErcuKXotaBuFXzCybblhzjE4HkUAgjCcd4FwxOdDiKl5cq+G+l3Hh4CvGCke7lD+eXJD/pGqO6tNWg6Cct6B3Awztf85EPHXpbz1VURE8RmnQs6ncd07whQ6lRZ6FC4E9+JECEytSN+mGsV5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5M2muPEpy7TSb/KlWef+2gfaF9KL/IJWccuyBP1RuU=;
 b=GPShgS7vXtpb+Ep74QUYP5SLFe2La3ej3XvFYzRl6hTvBhcv6CrqZImjTvdnoKVBKJWA34JxhmdaaYdfzktjZKOTaLJ4LwHfqjx80fLwaAAQ/Kc2BbFZw0tG2Pp27FJ2jIynS46N0a1jWZXn4UmVpCGu6DqRvVUCsHH1apot4/erXOAhRznn2wQxkroK/C+7egVrj/m+Qyx56AVAqCRQVZ/+NJPCJsd/TsNOw+kAZRd0TtWJEIn2bErR4dVwFYBZrwQMcDnIzIGKsSh9t9PgndGMLgb2CffPSX6ax+0BiSFME58tNMLOfV+zzs8huLqFP4+20eCUEjbdLs2N/Cqjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5M2muPEpy7TSb/KlWef+2gfaF9KL/IJWccuyBP1RuU=;
 b=W8G1idiwSIS2ffyxQ7Jcz0d7js755loWDJKsBS8+SLdifScjvB6PgQVamHonVPazPrho9rewsERX7ChVodp5Hh9Gey0/r9fIk382p8mRA9zelVPofGOOp8BY2SyjlEjLtrrpYxuGB4nFwZzT/i3wxSB1GE9IEyZ1uZflGoGLsfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5328.namprd12.prod.outlook.com (2603:10b6:5:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 08:06:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 08:06:53 +0000
Message-ID: <39300a86-d348-b0cd-e07f-197ba696fdd1@amd.com>
Date: Thu, 9 Mar 2023 09:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-4-thomas.hellstrom@linux.intel.com>
 <c1a9f255-9ee4-c020-9767-afb2591faaec@amd.com>
 <68a6a01a-6a98-0f9e-9d4b-ede48ac6665f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <68a6a01a-6a98-0f9e-9d4b-ede48ac6665f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ea0d03-db43-4e71-d0e0-08db20753e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FM2Zya/cXpmv+/Vi+HQ5C50VVCknaIjp0MIixDRJo11QVT1bXW8oSLgMbWu1/h0eTWstUTTZ8DnrGP/mLrppVADV8LEG50uQAOvqkURHBMZB/wQpnuQMnawYCUXYjLC+rpkMX2yOX8x+78bPEkivl5/304RNVT614aCzQXnD5W/9cU5arUj6fp2vnYNAvr2zH5eLtQ8KOY7Vku4lb2/FZPQxc7JE9QKV/n5lKaLEgI8PwIZJBfF/VOnTrf7l+uZoWJlINZ8eQ0VNWcffz+1/CXC0hrZX25PwHspx1A55VMIRAyhBl8azkE92sle/wu9wKT+s4w3ryDdtKXulDcGPtvTSLgc6iGgwxLQWDy5CQPIESIihGbweiyWnOsUSgpe4+PlV7xDZQu21SgwlW8slJxwu5sT172GVHvD4JTjPi1vpVtI7oc3XQbcVWhNN6dfGn5oMWxhJyyWyvchIVcCHZxYDMH4iwFixMgKPGntyoKQSWid5tPRp05ZS1UABWTRi8f5HVVZHBJBr7c47PV1OgqMdX3JrtDr5ud6+vg5wEBbI0Bf373qiHUhidRQR8tu97rYDD9/WNRG8wWgwvvP07hS00QocZnVleqSRw6oMgAW5zPPELRwgie7rCdh2m2auh8nn3e0gBqKxveSnGaQewH35Ghjrd8SaNMVFvXMvsU292vE7Dsjvi7sx+Hi0QGBjsXn8ImvAnQCT+52qeUSLux+vlGLANi3yZIxLh9sx0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199018)(66476007)(66946007)(66556008)(316002)(41300700001)(83380400001)(8676002)(4326008)(31686004)(36756003)(8936002)(38100700002)(2906002)(2616005)(5660300002)(186003)(478600001)(86362001)(6666004)(31696002)(6486002)(53546011)(26005)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGYyRktmNjl1TFc2NzJPRUQrUitwZ2dzWXQySjJkdTRxMEE2MGxicElnVEl4?=
 =?utf-8?B?VzhobkdEYjY1Sy9lNHYzSkNUb3pyZHhDOTVtcENvVEpCVTE1VVRSbGJ0a05i?=
 =?utf-8?B?aUZVWE5MN3BVRFNhU0srT0ZCcy9CSUNHY0p2dVhKS051THYrZTRINGNsR3cy?=
 =?utf-8?B?YUFHbGU4QTBleGdvZW9wVWlIUFAxeXFRQkQvY0lIcUttWUppdTE0UHBwRDZK?=
 =?utf-8?B?UUZXVDJTalRETnIrQ0Q5LzA4K2JWUlRQYSs2TFVpSy8wSlNIRWU0QjRyQzVm?=
 =?utf-8?B?MzVBS0RHMng4NlAzSm5LSXB1RGRxcUNMSXV2VnRSZnJ6T0E3QkRzT0premhX?=
 =?utf-8?B?T2FrdkcwYjdwYkYrNTdoc1lXVnNyUHpaS1N6ZzVzNVlpV2RNR2IrMU5GWk9n?=
 =?utf-8?B?U0RhYUNVd1JHdCs2cVJzUWZLUUpCUjdtYkV2elYyTmxuaThKQndzSmNJRkFS?=
 =?utf-8?B?K2tjcGJ5Y2JPdXFaa0xJUG96ejRITm1BaFNyZWx4ZEd1SVdITXY3NXJKY3Zx?=
 =?utf-8?B?aWh4d1A3QXFiQ3ljbkVFbVNkSzZtTTZpMzhieTVaWTd3Z2YzTEtTN1ZraVVJ?=
 =?utf-8?B?a2hlQ25HWDZxVGVzK1l6TjUxdkRnWmRrMjY3NklCN3M2U1E5Z3NUOFR3eTMr?=
 =?utf-8?B?SDBpdEFNbHVER2RVUmE2YTFEQ3lkbi9CMFo5TDVXOEVmSGRONzJ0R1BRam9j?=
 =?utf-8?B?SlBJTVN2OFE4dnRMVWM4ZHRySHFqVzd6a3lMUUtKZitNU0xoTHdFdDdMN2Nn?=
 =?utf-8?B?bUxneWFnWmQwVkNVL2hBTk9ZRElPUldNVG5WM3J5cU1DaTBST09MU1R2V2ND?=
 =?utf-8?B?eWRBdDdBK25KVDdYTXlFWGx1YTlEMjRhN0RDWTkvZXQzUS80K2hqY1QrSS9X?=
 =?utf-8?B?ODhPbXZPWnBFZTJYS1FwTE9WWFM4MjIzS1c1U3YyaGhua3JmMUxkR1dra3My?=
 =?utf-8?B?Y281aVYwRWVRR0NNUTZQY1o0OVY3NmQxbDAzKy9Dc0xFZk8zSHNjMFFqRTVq?=
 =?utf-8?B?WVVwVERYUVhGMDFGU1hkc2RsZHV0OUtyaXhHQWRWblFoUHo5RHF4N0tIQ3hN?=
 =?utf-8?B?VG42cjdPTE1VVmN3MUlFNXVRMUVhRklZSUg4UmxQNHNyV3hCcVJJK0JrTTBB?=
 =?utf-8?B?OXdKdVp1N2krOGJVSEpmaXJQVXgvQmtxeXlFSWdwV08wNHNtSW9wakVYdzdM?=
 =?utf-8?B?YkpxeGFNWUliUGxBNzNvMTRVMEZtWlVETnNzY2IxY2UzOW5zaTRNZWNuYWtB?=
 =?utf-8?B?NmVjUGxXdGpIbnFsVlJ0ckZFNlR4U25mZVVIRUUrVWhXWUwzdFp3L0tySFdC?=
 =?utf-8?B?VTBvRFlxb0M2NCtuT3l0WnJnT1NobG12bUY3dUlCMFlub2UvOWtMM0dpeFpW?=
 =?utf-8?B?ZFYrWjVqdHN2N25TUStzejVqRktqdVNDTENDbklDRGRFcjZqdmcrdXZjUjNv?=
 =?utf-8?B?MGg2eC9ISTZFUWdvODErSFlvd1UzV1RFZ1lYejBnbms2ZHFzU29hSlIrMDVS?=
 =?utf-8?B?T2t4VGJnVE1xOXRIenFPREdieDFnUkJkMHpVb0h3YjloNWhxUGZ4WTAxZ2F0?=
 =?utf-8?B?Wkxqd1lkYzZScFUvT3VCcVI3VnhCQzRGU3MwNGF5NEE2OG4yKzQ0dDExRDQ1?=
 =?utf-8?B?YnFaZXNETGptbVJ6OGlhSnNXaGZGaFowY0d2NlVGRDFmWCtBeGtqZHFkTklt?=
 =?utf-8?B?RS9PQVdtclQwTEMzTmxTbTRkdjExRnpTOW9HczAram8yWTdERi9Wb3NNSzIz?=
 =?utf-8?B?VDMzY3F0Q0xsdmlvVkkvb2lLMVhROUZ2UkpwY3NKL3ZyWW9QR1REZnlRSUpu?=
 =?utf-8?B?UWVRUTJGd2loWC9OTjFLSDRpM0VHOFhEa0lHWkZmOWZMMFBiczAzYjhjdEo5?=
 =?utf-8?B?SnpNbkdSSE1YZ2pNd0hZYzQrcGYrbXJ4LzJBUm1oYWhWWlNtNWN4TG9uWVpv?=
 =?utf-8?B?NnhtcDFNYXplZ3RPeHdOeDNPOGNBSnViY0xnRTBpRzB2OFp4M1hndDhSUjZi?=
 =?utf-8?B?NkoxYWI4Mzl6bE5xcEh5aVBVR3Z3L3E4ZWc4N20xZTB1TXdHc1VQelFvVU51?=
 =?utf-8?B?T3R2VEtTamxiZDNnV2NRNlVLeDY5RTRQVEo0bVYzU2JEdjhSRExHdlFRbDV0?=
 =?utf-8?Q?tWETBDkKhwi5ZHMVVv2TrtNHw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ea0d03-db43-4e71-d0e0-08db20753e81
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 08:06:53.7045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNujm3xpuM+s27U2XwDp7ROzYMuJ4UKW0K/Erpgsn4s4CIBx6gTcXJ5mMmaV0SIw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5328
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.03.23 um 08:06 schrieb Thomas Hellström:
> Hi, Christian,
>
> Thanks for reviewing these.
>
> Ack to merge reviewed patches through drm-misc-next?

Sure.

Christian.

>
> Thanks,
>
> Thomas
>
>
> On 3/8/23 09:49, Christian König wrote:
>> Am 07.03.23 um 15:46 schrieb Thomas Hellström:
>>> New code is recommended to use the BIT macro instead of the explicit
>>> shifts. Change the older defines so that we can keep the style 
>>> consistent
>>> with upcoming changes.
>>>
>>> v2:
>>> - Also change the value of the _PRIV_POPULATED bit (Christian König)
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>>> ---
>>>   include/drm/ttm/ttm_tt.h | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index b7d3f3843f1e..977ca195a536 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -83,12 +83,12 @@ struct ttm_tt {
>>>        * set by TTM after ttm_tt_populate() has successfully 
>>> returned, and is
>>>        * then unset when TTM calls ttm_tt_unpopulate().
>>>        */
>>> -#define TTM_TT_FLAG_SWAPPED        (1 << 0)
>>> -#define TTM_TT_FLAG_ZERO_ALLOC        (1 << 1)
>>> -#define TTM_TT_FLAG_EXTERNAL        (1 << 2)
>>> -#define TTM_TT_FLAG_EXTERNAL_MAPPABLE    (1 << 3)
>>> +#define TTM_TT_FLAG_SWAPPED        BIT(0)
>>> +#define TTM_TT_FLAG_ZERO_ALLOC        BIT(1)
>>> +#define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>> +#define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>>   -#define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
>>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(4)
>>>       uint32_t page_flags;
>>>       /** @num_pages: Number of pages in the page array. */
>>>       uint32_t num_pages;
>>

