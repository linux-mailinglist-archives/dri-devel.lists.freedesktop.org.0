Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F5093BF86
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 11:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823810E09A;
	Thu, 25 Jul 2024 09:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zCKNhrDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193BC10E088;
 Thu, 25 Jul 2024 09:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INWCJNidh0RFDydkLLA2Qq21iX880zOyGRb+75pqc+Snliba53oPre4taZ2mpBHAAok9yVov2GHqicaMLBjIWIWHDR1ElnGk8pJNzMUwa+JYTE90tUPK7te5U5BbYZCwT114MRZkHNCVjyLFXlUKZJCXGbFvAc4EFc8YivTgoq6VcIV52zHhWyHn4SJMHkaJlRNoCmA/vFMZa0cKjnOipLJw2yYRFMZnWwCX6O+3KEO8RQYWBAlAXwS63ykluQgHJdCJpQmygc4TSgh5hj/8c1c3vLXEixHHbgBvJPXnvUEiktNr3rTGNGx0yP2mE9oIlTXyL5MHbNLmTJA2fgfN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=504yrNbvi+XwZ0VFfkyu3aeTG2+PAbr/FftqgNZRKGg=;
 b=B7s22uW15PWSy8QIhTuCkY5M3TLruAMOU/Uk1ZgglB5ZZ8NmZFSSQQuf8t91bmyy3Qo5wNdmFjm2Z3HLH2BqNxHEK7fZtqbnb+pvWMoOrwHlY6B7hdjoXR6D4ULstQOL4uAqYrBUoKrmYvnqsSoqTInYe9Hi794blqaYR9zFIEQn/djvmYEpXV16HqBJO5pK06GBwY5l0MpmIAt9S9g/oNt7k07rcVqFxD1xu+QrMibyXIv1VSF3yDfexGOAA75tLvKeC3LpDqn0Ha/oRrUT9aiZrbXqIDhUMHwjY6/iSGUufTmzX0wQoaTS24qJ2RerUpCn0QipL181F9eU9omClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=504yrNbvi+XwZ0VFfkyu3aeTG2+PAbr/FftqgNZRKGg=;
 b=zCKNhrDhUuUSA4FW6k7bKpQJhj2LXjOikHlr0TjIgRF0XX6XkEbp0nC7Vj8KqXQTPz6HYg2ZUPfgM1v+1o0t3JjOcUpT7HvErZy/0KKplpg0Y02K7uSqT5P4tm0M4k3KHQzq1Ke+pot+Eae7RgTeVTglbPf2rPW3n0p2wGXwnH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Thu, 25 Jul
 2024 09:57:49 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 09:57:49 +0000
Message-ID: <d090fe36-76fe-4d74-8c88-5981a73cecd5@amd.com>
Date: Thu, 25 Jul 2024 05:57:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Add error code parameter to drm_sched_start
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 jesse.zhang@amd.com
References: <20240724184340.183606-1-vitaly.prosyak@amd.com>
 <429968dc-03e3-4755-865f-b6a844db7f0e@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <429968dc-03e3-4755-865f-b6a844db7f0e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::26) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e84a5dc-89da-4588-e657-08dcac903d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWtUTFg4OG9xS0JJaDlqS3Z2aTdJREhKZFRCaU5xdllkTnFjLzFEZ0ZxdzJQ?=
 =?utf-8?B?Z21aTWY3UERHZlBHM0NoQmViYW0veHc4T3RNZFZMTjcxVXpQMENLNVA4WEpi?=
 =?utf-8?B?bWcyQ3lweWVOdmdsN1NBU1JRcVpxcEZYelp2NXpmdUpXOUNwNW5aWndHYlN5?=
 =?utf-8?B?YzZRU2s2Um5qVWErNEgzNTlpbENhVG1PYjgzdHVQNFo3RitCMmk5K3hPek5k?=
 =?utf-8?B?S0pvOGU1ZUMxTE5lVTdrTFZDR2k5MGRaU3pwYlQ3cDNqQnc5MTBTeDhvYm92?=
 =?utf-8?B?VVduUHk4Zm11UUkxVXFQdFdoQ2VqRWlOaU1LcC9jU01JNk02dXVlYWtyZDkr?=
 =?utf-8?B?UStPV1pza2Vwbk1pVEJzazRzbk1mRmliK0FnVkE2ME85R0lZWkZTY0hoVXF1?=
 =?utf-8?B?aUJGT3lJbjdXK2MrMTZHZE1ob3ZHTEF5UFZzdEhFZm1EUEl6YXFzRDR4dndh?=
 =?utf-8?B?ZGtBMGpuVElMdlIxSEtyOE1zTGliZWpaVE5PQ1ZQampXaEtidVlUeUhDbURt?=
 =?utf-8?B?Y0ZFdkZQZ0JDdDdTak9aV3ZPZ3BJazJqcXlIdjNoNkticnc3bVlOdUhBM2xw?=
 =?utf-8?B?UXQ3Q0RPS0pFSXJkQzZOY1V1Yy9qT0drYmYvV0o2bmw1R0ZIanV3cEdZdjVk?=
 =?utf-8?B?RDJlc0JCMEdKb1FQb3BhemNpY21MUm5QYkZDRG9HT3ZjTVZvVXdQa21tWU90?=
 =?utf-8?B?WnVza29iMUdRQWZUV2VDTzR1L1BCMlRQQ2U5UXBjOWJRZG10SStSKzk1VHFP?=
 =?utf-8?B?bG9leW5saVlOYXVBNjJoMFQvM2xQeVR5TktmbWR3dlYvbmhJd0ZWVXdkTXJ4?=
 =?utf-8?B?d1Y2MWk4NzV4VDZ1V2VSa1Q1Q1JkQnNkYmdlYXhCdmhyN3IwcjdUVldaM2t1?=
 =?utf-8?B?ZEFGSWFlYlhzL2NrMmMvNnAvTVdkd2g4cXA4dUdkNGNMeTZUSHRRVzBoMk56?=
 =?utf-8?B?TWJwVkNWQTh3a1haRHFjNXVVYzFlekdqU1lJbTNHUmdHcmZ6OGFSR3RaN0pX?=
 =?utf-8?B?QnhyTHR5VWZ1N3F2TXovZW42OUYwTDlFZDVoQm5BM2NURFkwSjk5WE9TenNy?=
 =?utf-8?B?OFoxOGw4eDFrVXlkbXhITExhbVRvcFEvMVprTGh6TEIxYnZDUUNibVZxY3Vl?=
 =?utf-8?B?Z1cyK2hrb21BLzdXSE1oYjY5cDR1aTJ0aCszc0RZUDUxSkVJWHdpT09vbnJK?=
 =?utf-8?B?Y090YUs1RE5ETk1rbENWQUN1d2ZteThweFBuWTdiUGJxbElDNkpUVHh4alhP?=
 =?utf-8?B?Y3hnSGVLU2pNcFpBTzFtUlI4UTJXdVJNRUVTQnE4c0JDczM4dGVXZXJIUm9p?=
 =?utf-8?B?ZS9xSFQzVFRrZlNBVXAwc0gxZ3FVNGliVUZVeVd3My8yMWc5bmdJbG4rajIx?=
 =?utf-8?B?cS9MdmhNbjlUd0sxYkhRZjUyWkZWYUF0MEpMcU9xRDBYSVQ0ZlBMRFRQU1VT?=
 =?utf-8?B?SzdVTkcvdHJBVDdBS1ZQMldUUm84QktJei9kUllsSEJCbWYvQ2l3cElaVkxZ?=
 =?utf-8?B?M3g1RTl5L2ZMZEp0YUZGcGl4T282MDI5Ym94MjdDQ0dleGNNdm91NzdmNjJn?=
 =?utf-8?B?SzB0U0VPS0VqMW5CM0trQVR0K0R6bm0wWGpGNzNMZ0ZsWFRDR2ZQQ3E1Sjlw?=
 =?utf-8?B?WlZramVCdEVzbWFJcEkrakQrMUNOcjVOT0xTU0w2YTBOdVNldUViZUJXelpz?=
 =?utf-8?B?UE13aGhpR3Y1dmt2dzJYTTJKK3dBekw1bno1VS8wTGtPSnZZUW5pQm9rR05U?=
 =?utf-8?B?N25EbmpOS3QyZllqclJndzNhMWhpR1AvY05XVW1tSmZydlFOb24wQ0JZc1Yy?=
 =?utf-8?B?bnpUNDUwUHRleWdoTnp1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azUvS0xYQmNyUFBXQkt3aURqbzNIVStZNzBDNVRQMVdQbVZJU3h0QWxzQ3VT?=
 =?utf-8?B?aWhkcHpsMlFUUTBCQnpLYlBkdE16NjdBVTY4MHJQUytwbGFrcGRDalh3VmlT?=
 =?utf-8?B?MmtHY1dLNzhvTXlpSldzYkVZSjBIZ2hQdExqdStiU0p5ZFNiQ2s4aHVWd05w?=
 =?utf-8?B?UmplMFJOYTNhZHQ2MEdydXJBTHd4R2dvdjhqQWdJbnVnYTlxR3k5TERHeWpW?=
 =?utf-8?B?NEFRRTJOcTZGaU12UXQycmVvZnd1ckZoNXE2TFF6UzIrVHRaTFlpQXVkampp?=
 =?utf-8?B?NTBBMTZIaGRTY1JxZ1hEblQ2cUJSZ3FmdCtHcWZqbU1CZVhOdDhuazJRZGRF?=
 =?utf-8?B?b0RhaWUrOVBoOWFWcjZlaExGamJ3cW1WZnpRU25KU2tZMUgrUWZEVEFmOFl5?=
 =?utf-8?B?SFZxMmdlZXFzTmhuUVQ1ZWpHMzl2VXBHdlFkMU45ckx3N3VCZHVIcEJWbXMr?=
 =?utf-8?B?bEt0SkZiS1MzcHczRnVsUHFSYlFPajkzbEVXM2RCSElvQTI4Yy82dm91bTNj?=
 =?utf-8?B?clVvbUtxWFUwc3VQK0FCb1NQWHhucUN4TWRRcVdUdTBvUHhqUm9ucUFNM0V4?=
 =?utf-8?B?TURLMkNjbkU0TWlSRXVKU1J3Q1BTVEZCaVBvRWN1Tm14dXlEdHZIYmNYb1dp?=
 =?utf-8?B?elBSUmZLdmdyd3laQkhZa0plNWtuSjl0a21FbjdIMTFya2JkZEVQbWJhcmh2?=
 =?utf-8?B?NldEUVY2S0VEWHJ0TVErRzkzejdWS3o0Vkh6eHRqaGVaTW9qVGJWSXd2ZzV4?=
 =?utf-8?B?QWZZbUwrMFNqU214RnJJb1VIQ2tuRVJ6bkZzTTlweFhNRWEvU1pwbldNQm1N?=
 =?utf-8?B?ZDMvalJmNGs2d0Z5VDZWNm5WejA3RkhuQTUvRlBPa0Y1U1VENDYwaDIyMGdH?=
 =?utf-8?B?U1V0clA3WWtjSVdManZRV2R0RCtTVXpGN3p4aU9pTDA4K3dUSGdzaDMxNDV4?=
 =?utf-8?B?SThSaEcxU1pqN0xYWHRxWW1ibXBhb2hGZXI5U2tmMXkwYmhyd2U3ejNpMEdU?=
 =?utf-8?B?cTBtMUUydHI1R2RrUkRxZExlZzRPemtweUh3dGtXTmdXUkZ4UVU3WnBWdnB4?=
 =?utf-8?B?UXRkbWUrbm9ZbkpiMXg1ejlxNi9ibzNwK0JHYUh6WHpDQjNOZTYzRTUzYjdC?=
 =?utf-8?B?cXpHVUdDbFFPelNCcTBXRWZ4VnRxUGJpNFdhRGd2eU5nTXhFMkliTnVKZVpW?=
 =?utf-8?B?azYraTlPZXNydmRFN1FlRXBxTTV5M09UOHpOUWpHZGt2MVFvL3ZPYkc2ZVNj?=
 =?utf-8?B?NFRia29YdTdJRktCZ0tQUnBHVlNuY0RqNTc1WWZJNWFOZHh4NkMrRXJyRGxZ?=
 =?utf-8?B?djR5WSs5SVpyNW81bW8zN1BSTUlQWkFOWFFuNkpwa2FZb0VQSG8wejUvc0xl?=
 =?utf-8?B?Zk1nOFQyS0RCalJYVEV2KzVSNXltMmVUTEZZNlQ4a1Z6V1h4ZFVFZURSWEFW?=
 =?utf-8?B?OFp5UTNiVE5ubkwyT1lITjdYb0N3Si9BYnp3L1Y5Ti9HRXgxOFFmd1hkLytH?=
 =?utf-8?B?QzQrNTVNZFptZWRmcllnVi9zekhobS92UlVZNjd6UGpBWVpscnNXZVd0cmJK?=
 =?utf-8?B?MGRlQW5IUS9kMUg5QlVYUDFZUHk3QzlXMUpCMlBoc0lWZzdzRisxZ3lKYTNF?=
 =?utf-8?B?V08ydUJtaHBmcDNiU3FrcWdlL1I4WTd0YUFpR0JDaTFqRkJQQ0dGaDBqTlFY?=
 =?utf-8?B?bllyeVU5WWw4cFEweFJ0QjYyclRCZ3FZMVN1Q1JwSnFvYUMxeHpuWERwZ2Zr?=
 =?utf-8?B?NjB0NjQ5VDdWWGdlYnZrZ2h5K0h0OXp4VzArNGNDa1Zxb1NJVjhnazRoblRN?=
 =?utf-8?B?U3pjelVFY1ZBb3pEMWpnWCsvRmlPdU9SMmtVQnp1dFNUWE1mZ0t3L1ZwOXY0?=
 =?utf-8?B?NW1nU2crWFZ4aWp5RjBkL0dWY0xDRWVNb2RhSll5aXdiTDdGSWJLTjNrYS96?=
 =?utf-8?B?cUVuWWNkZWt4Y0hnV21xYmk2L2J0U1pTcFlkblhyc3N4ZnZzNFBpN1pLNHlK?=
 =?utf-8?B?SmNxeVJCSW9wRG1GSWZHVFNMcENQUjNXNTlkME5KTXZXdkdleTNjc1h0eUFF?=
 =?utf-8?B?LzA3VkxrM1FPSU5lTzRySkY2VFg1eGZqQlZRanNCNDFnTTdmdSs4dEowTlI0?=
 =?utf-8?Q?BnQQuVEtOQdks1ruYU7BpG2ai?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e84a5dc-89da-4588-e657-08dcac903d8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 09:57:49.0637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlgX7D+rXT2Y92DdRAoniOZUOqcWKqRXVyd/idv4qUBCZN6UiNEZfwsFDlsBR3fJdVPPi/6mPJb7Ifkv6tOHMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
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


On 2024-07-25 03:37, Christian König wrote:
> Am 24.07.24 um 20:43 schrieb vitaly.prosyak@amd.com:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> The current implementation of drm_sched_start uses a hardcoded -ECANCELED to dispose of a job when
>> the parent/hw fence is NULL. This results in drm_sched_job_done being called with -ECANCELED for
>> each job with a NULL parent in the pending list, making it difficult to distinguish between recovery
>> methods, whether a queue reset or a full GPU reset was used. To improve this, we first try a soft
>> recovery for timeout jobs and use the error code -ENODATA. If soft recovery fails, we proceed with
>> a queue reset, where the error code would still be -ENODATA for the job. Finally, for a full GPU
>> reset, we use error codes -ECANCELED or -ETIME. This patch adds an error code parameter to
>> drm_sched_start, allowing us to differentiate between queue reset and GPU reset failures.
>> This enables user mode and test applications to validate the expected correctness of the requested
>> operation. After a successful queue reset, the only way to continue normal operation is to call
>> drm_sched_job_done with the specific error code -ENODATA.
>>
>> v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain and
>>      amdgpu_device_unlock_reset_domain to allow user mode to track the queue reset status
>>      and distinguish between queue reset and GPU reset.
>> v2: Christian suggested using the error codes -ENODATA for queue reset and -ECANCELED or
>>      -ETIME for GPU reset, returned to amdgpu_cs_wait_ioctl.
>> v3: To meet the requirements, we introduce a new function drm_sched_start_ex with an additional
>>      parameter to set dma_fence_set_error, allowing us to handle the specific error codes
>>      appropriately and dispose of bad jobs with the selected error code depending on whether
>>      it was a queue reset or GPU reset.
> I've already send out a patch to remove the full reset parameter from 
> the function and have another one in the pipeline to add the errno as 
> optional parameter.
>
> I'm currently just waiting for the feedback on those patches.
Thank you for informing me. Given this, I will not proceed with this change further and will await your response on your patch.
>
> Regards,
> Christian.
Thanks, Vitaly
>
>> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++---
>>   include/drm/gpu_scheduler.h            |  1 +
>>   2 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 7e90c9f95611..5a534772335a 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -671,13 +671,14 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>   EXPORT_SYMBOL(drm_sched_stop);
>>   
>>   /**
>> - * drm_sched_start - recover jobs after a reset
>> + * drm_sched_start_ex - recover jobs after a reset
>>    *
>>    * @sched: scheduler instance
>>    * @full_recovery: proceed with complete sched restart
>> + * @error : err code for set dma_fence_set_error
>>    *
>>    */
>> -void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>> +void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recovery, int error)
>>   {
>>   	struct drm_sched_job *s_job, *tmp;
>>   	int r;
>> @@ -704,7 +705,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>>   					  r);
>>   		} else
>> -			drm_sched_job_done(s_job, -ECANCELED);
>> +			drm_sched_job_done(s_job, error);
>>   	}
>>   
>>   	if (full_recovery)
>> @@ -712,6 +713,18 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>   
>>   	drm_sched_wqueue_start(sched);
>>   }
>> +EXPORT_SYMBOL(drm_sched_start_ex);
>> +/**
>> + * drm_sched_start - recover jobs after a reset
>> + *
>> + * @sched: scheduler instance
>> + * @full_recovery: proceed with complete sched restart
>> + *
>> + */
>> +void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>> +{
>> +	drm_sched_start_ex(sched, full_recovery, -ECANCELED);
>> +}
>>   EXPORT_SYMBOL(drm_sched_start);
>>   
>>   /**
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 5acc64954a88..444fa6761590 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -580,6 +580,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>>   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>> +void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recovery, int error);
>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>>   void drm_sched_increase_karma(struct drm_sched_job *bad);
>>   void drm_sched_reset_karma(struct drm_sched_job *bad);
