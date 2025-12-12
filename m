Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F169DCB9382
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFEF10E8FF;
	Fri, 12 Dec 2025 16:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VuIxTHle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FF310E8FF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utnA4Y4RSFlFvl1Xp65apxlvxvwk53WBuFjK/LDh++WU/XKw2WX5YlNerPTNqstL3Vf2ipvveL0DHxNCp+mv33Wssm1f1Pi9uoJ334boDF0W+RuE8XXwi69hAA9YaMfj1GOqKekPyE3XDtpUy8hRIp48RVfeOPNc150bbVDrQRCJcpPWC1xnBIXq0UC8uZ9rLmEuCukEkRurwx0BNKw+dzF7uLtaurKdVyLL1/wWExYOsE69OaFIyDXoZ9wTi66WCtoXksLhfgoxmOhVX7gy/EV9TPFbS6cqazeL2oT5QgvZU9ajZox32DTAjN56U/uSzhpqZvcqoAZM2brfHYJlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fPdq/3YQhWLsrLh1qM9WnRhVSpik4YOO+F3kjdVdJo=;
 b=VeCRjD/MYSvMlwqMVhmvSJZr4wHe9Jem6UgrtVeg9ej5nxltQIpAukR45VDWzHknHj7iKydTZd2soX+7mdOJLrrhTTnzaS66caQCSIIuNdMRgHFnBlhLOTML1Drejd4FFTuuefllOxFPfPKgw0ohVpiqcOfAJSmiJd+7A4KQrXv8yx2l//0T/e5CslqEqbTXFvQb6T301frNEYVJ3+m89SpFi2rL79chSxAtX4pK3RDD5lpFKW2b9VgKkiZYmXLtSE/QZRIjF1mIYz9xgRGyhYfLlgHo9MtLRCSvs01cnzcnXpJ/AHikyH6o7IhVTAmX2YSXeZnayyf0KJPghG6NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fPdq/3YQhWLsrLh1qM9WnRhVSpik4YOO+F3kjdVdJo=;
 b=VuIxTHleR1jzd7fMvg35PTy9y9VE9hEc4NGwp+9IbllpveRb//Y2nV9PolMVCXqim8Stcl1jhe/Fgu0PadC7GZNP1yiqFm1kB9gBsp2aPKe6NfT0UnntomA2mzrJXFKVSn6djl94dFjstQsF0hcJqnuXJDzvujy1EX8AUQ8vHKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Fri, 12 Dec
 2025 16:04:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:04:16 +0000
Message-ID: <88f53243-6591-44fb-b9da-ead49c82a2cd@amd.com>
Date: Fri, 12 Dec 2025 17:04:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] drm/amdgpu: independence for the amdkfd_fence! v4
To: phasta@kernel.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-15-christian.koenig@amd.com>
 <2ef69b00035fe129bb3f8d4b4b4ad931fa26dc8a.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2ef69b00035fe129bb3f8d4b4b4ad931fa26dc8a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:408:e0::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: aecbd8a7-2667-4afe-460f-08de399819cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTl1NEVSOUFBVE1YUUluNzBYeGhoK2oyZmZTekZNS090SkNQdGtkb294UzUv?=
 =?utf-8?B?NmEzeTlvQnA0RXBuR2M1M21UM09mcG82cFFmZ0RnekdNbmVicE9YaGR3b2pG?=
 =?utf-8?B?VlVTNnI5VWUvMFJVa3ZWUUVsRVRZSkVCSVhnSGRtVURmS1ljZ0xIK0F1Y2xG?=
 =?utf-8?B?R0NzbXhISEMwdEZDVW5ySUE0NmppUGUzS3p6Y25jcERKRFp6SzU2amFUUHdV?=
 =?utf-8?B?YXZ0Z2ZjekwwUEpBdEppbWkyaVptYTdWN0s3NXdqT3RPTjU5U0NqbFhRYjBL?=
 =?utf-8?B?THBDWWhpcVQxZnFtN2RONUZ2VWgwRzNOL0F5ZC9DRGVvL2lMRXB6Y21URlh5?=
 =?utf-8?B?OEJIbllralF3ektST0ZRSGltd1hyK3hnb0ZXQTh0Z0hmaU95OUxRa3QrT1FO?=
 =?utf-8?B?VUdYczAyT1ZOaWN5N3BsWEdxd1hHNmRVWitpQlJucDRFY1RKRjN2NC9xL2JB?=
 =?utf-8?B?RHl1R3NVL2V6REpEWFl2VUVqWVZyQnhjMDE5VWkwaFBwc0hFZWdaeGVuU2wv?=
 =?utf-8?B?L0hxRkJYU2g5TjlOSXdmMCs5QmpxeVVWTVNHS094WGt1U0ppTExMQlBzWDFS?=
 =?utf-8?B?RzVLMW53V1MyQmp0b1NjZnk4WTFnUGhLM29KME5XSkZTak90MkZlek53ZXo4?=
 =?utf-8?B?cE1LUE13MGxlbERjMHJOcGNIWVJtbjNSSmxEQmUyQm92TWZNeGg5a0VYTk1Y?=
 =?utf-8?B?UHZJanhkeEFMeVZxSFZDTDFrNktmc0RmbWs1dzI1cy9DUnpBMEhua0tOWXhh?=
 =?utf-8?B?QkJ0WHZoT3NzNUloMStoWllsYURkRFE4am1VblJCd1BnMnN0SU5aaE5lekdY?=
 =?utf-8?B?WVB3WFVyODdZeVMrWmp3NTRJYjV6NlJ2UFkrSE5VaWpjWElOc2NSbEFISktL?=
 =?utf-8?B?dHAwekNNSThpR3VVUXAvQ3JVNFBlZmdvdzMvWUdOcStUS1BCNkFqTGxUKys1?=
 =?utf-8?B?bWxiOEZSb28wTmY0Ym1KbWdJSEhjTVZVU3FRcTQ5eEZiRjZlM3h5Z042N1BE?=
 =?utf-8?B?Y3RoZTgwaTQyTytCUGZiMXBoTW9IYlhHYW5ITFBMKy9lU2ZUQUVlM0F6S2NQ?=
 =?utf-8?B?Uk5zb1Y0OThFTFdvMmFBdFczVDhsUGJZRVRWOER6MFhWRnRhUlRZaDY5REJM?=
 =?utf-8?B?aVJZek5rRHU1ZUpHb3pxK3hCZW5EMHZ3Qkd3YmRFVTNKMTFQT0Q3LzBLMi9Z?=
 =?utf-8?B?eTRjRkJxUjlUN3lwQWxrYXdtMDQvQ1VVUE0rT3U1d3FCUW1rZm0wRWppS1BB?=
 =?utf-8?B?dkI3TkdSQXZTaExKcG12YzBZdGN3cUVrb3M4RG1WZDNaNjR2UC9mRUxhQTFF?=
 =?utf-8?B?V0R6RVpFLzg3eWNNZE0vRzZINGtobE1JeTVWcU1xY1RiOWVZYXAvUHNQUy96?=
 =?utf-8?B?UUNCMldYd2QyOTFUTFZJLzhxYTJtdHVZM3FMNWwvT2g0R2YrclhZK0FJU3lQ?=
 =?utf-8?B?RW5UOWprbDhWeUlHWGlyTFdZSzdaNnd2RXN2SHhjM2RRV2xxb2Nrd3Bnejd1?=
 =?utf-8?B?c1ZwUk9qWE82Wng3SHk2azhiVUx3UXkydGpwd1N2dG9sV1lQRmR6KytodUpm?=
 =?utf-8?B?d0NlMndQajFqNWpkL09lemxTemo1WnU1Um1aMCtnZjlteG9PdU5nOHVMcTIy?=
 =?utf-8?B?Wi9MaUpNUWpySVJ4WWJSaUkzU1FsVmo2amVXcEsyUUdWbDBVSytrRlBtRUJT?=
 =?utf-8?B?b1JpdGVjSkVEai80UWNGR0ROTzFEME55UjJxZkoxVlRZdmxNTE00dzQ3UUtB?=
 =?utf-8?B?bUtzZ2VocDg5c1FHcitPTWR2dDJmYkRFMG5KTGNucXNsaHU1UklhTFRTVitR?=
 =?utf-8?B?c2NRazJIOEh2L2xCM1Zsc0xpTnEvcEJENm5rMlZySytkN0RNaGhIVVJlUUZi?=
 =?utf-8?B?alhOQzhhTFR5L04xR3F4QXdFcG9CSmJaTFFJT3ptekpmWnBwVmh0c0dYU3U2?=
 =?utf-8?Q?X6enTJ/bIZfnuICtXxMbby0DoPUNYmgi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdGM0xNakFtZnk0RE53Mm9Ed2VEbzZLNTVleFB1dHBnbDJWU1MzaEM3cWov?=
 =?utf-8?B?Uk5GNVk2c1ZGZjFZbWZBNmxYZUo2YmVOTkVRUGM1d1RnN0thRkxXVE9IbEg4?=
 =?utf-8?B?UEI0NGYzR1N5ZS9URmpGZTVrWkZHRmpadWxxMjFvK2V3NThQQndzUi9ORlVx?=
 =?utf-8?B?cjhVWjJla3Z6T2R1bnVlWVR3S1JYeWxxcTVnd1RCbGg2Wi9tQjBPdTZBWnhZ?=
 =?utf-8?B?YjFZYjJIMS9rK01ZQTNlbzNET0k4YmJFOC94TEJFSERLaVZIaDhqRTVTVzJW?=
 =?utf-8?B?WDNaNTZNcDRiOG42SzNSL0t1YjVUWmdkUmZrZ0h5dmt6Rzc5NHlKZllham9o?=
 =?utf-8?B?WW1Pdk5jT0dZM0FoWDlyM0h0bWtmQ0hoaGc4VE9YcjdFOWhxbEIyc0pZUzJQ?=
 =?utf-8?B?Mmd1RjlsSW9ZY0RRNG94Q1FWTDBVMTFvMWxrcjVhV1lZeW0rams0N0FIMlhG?=
 =?utf-8?B?cjAwTGswbGRaN3BLeWIvandPVlRMdURIWllCVWxtOU9KTmtoMkFVdXNRRzdM?=
 =?utf-8?B?RlJiODEraCtsMkxMaHdIUWp2Tm9zR0p6bm9QTHo0dXExbjd0NFZQdE1GTUFD?=
 =?utf-8?B?a2hxekhpbmNOaHR3a0t3QmVrR0NFMjQxam43YkhxZFVKZUxGWkxaeFZ6SlA1?=
 =?utf-8?B?K1JVU1dvdUVhVVc0enFLUXZmRUw2SmRNN2ttSmJqVVhqNGNkUkYzbG5SOEQ0?=
 =?utf-8?B?TmF3YVBaS29VcmxWQ2lucjd3S0dzNElZVHlGa1RBb1pzTVRJZWNVS2VIU2Ey?=
 =?utf-8?B?aUlpelhLOXdOVzF0R200YTY0cU9IRlJISGZDZjUvRWsvMEkxU2FsZDFtT2tx?=
 =?utf-8?B?UHJOdU5CTkkreHhCQzRmK2RIdSthc3dabWdqV0hDdUVZcXR0UFYranQ3c29q?=
 =?utf-8?B?elNFeTRVNkJXcGNrRWY1bXJDd3hFR0djdDNaRHdLbTg0U2h3SzQzMjBYaTQv?=
 =?utf-8?B?OFdpN0Z0RjFNemRrSjhvM2U0QVlsSTVReC9GaEZiK2JyT0RSdmx1dmNGMHVQ?=
 =?utf-8?B?YUNkdTIrVkRZWXpDa3lYeVlaaW45YUFZS05kcGR4bnRPaGVRSlVxWUFZaUtz?=
 =?utf-8?B?bjNaOTRLd2JsR1BiMXNjQUFEc2NpSG9NOGNnZngrQm1MdEtRU2x3d280blJt?=
 =?utf-8?B?OFJyYmFsOFNTMGwyeEVOSmFrU1ZvRDJVSzZ5UlUrSkkyRmRYUmZwNkJ5eUlN?=
 =?utf-8?B?Q3VZUDdRT0NXVDd3dmsrT2FEMDhMbnRuN0hORzVzRCsvSk4wSXJJeDY0RWJC?=
 =?utf-8?B?d0YvbXB1dFhncWNLUCsxN3lYa3hsQVJtazhlRmNRODJyZ0tuaVJkbExxQnpn?=
 =?utf-8?B?SmZRTEVpc2hpWGw0QmFhVDcvbWlvRkNIOGZtRmRabnQ4RXlWTHZQVDFOUXVz?=
 =?utf-8?B?UVMwSzNsWGtvWjRvTWdvS3JVbXVXbW9tbFpiUU43SzEvTkRPWkF2M0QxOE9E?=
 =?utf-8?B?NHh5NUo0cWtmM1RHZXN1MDBGaXlveFhvZy95U0h4QS9SSjJGYkRqalcrMlc2?=
 =?utf-8?B?K3k3aHlrWWlYSFhicXhpSzZiQlYrSzFzbDNxM3pwQ2N0R1U2clJlekdod0FV?=
 =?utf-8?B?TWpRdDNkemM0cHRCNHFwbUQ2NkhpVmdNVGh6SXJsRlFwWFREUXVWOUdMMnAr?=
 =?utf-8?B?RzNCcmtxWUNzcXQvMFF3SzFGNmxSVXo2Ylp4Q0hOV0RHa3gyR3VjSUxlUVR0?=
 =?utf-8?B?MkVpUkhrelhUT0FmUUdnOHduNnVDbkVqWDY0a2UrNlloRFN1MTljcEFmTzlD?=
 =?utf-8?B?aWc1eGNxbTFlVHVYN0pmSXQ2dUU0ZmlwYVUrMjlkMi9WcXVRZ05VNDZMbmcw?=
 =?utf-8?B?aDFRUFo2RExqYXNsd1h0WldWeVR6T0JnTGhWSjk2QTE5TXhaLy9meEtpS1ds?=
 =?utf-8?B?akV0L1RaT05YSTRPVkpCdVYrWFZQZHRPdHBTOS9TNVNFYkdMMHJWTkd3dnhj?=
 =?utf-8?B?MGN2MG9MNk40ZFBKTWI3V0tDM3NxK3ZLcXNHQ3VlNm1JMGJDSFJNTnhzR0I3?=
 =?utf-8?B?MStGditNd2RNUkpzc2s4T1ZjaGRhc2Y3cFd1Nml0Q0RWSjFKd09JSGpDczVT?=
 =?utf-8?B?b2EzeHJvd2F5YjFBd1NPZW1FQUxPclZhM0lGYURRUSttYXd0YW5wcXJHV1Ux?=
 =?utf-8?Q?8r4nmdrWeO6j4ZM82M/YKOWTr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecbd8a7-2667-4afe-460f-08de399819cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:04:16.8651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6GwqXi0cTuD+8QhI4pEibYV6oNkofZ+EYzhZNnOrA9wwgt41STN8d4Pkbq/B2WX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

On 12/11/25 16:08, Philipp Stanner wrote:
> On Thu, 2025-12-11 at 13:16 +0100, Christian König wrote:
>> This allows amdkfd_fences to outlive the amdgpu module.
>>
>> v2: implement Felix suggestion to lock the fence while signaling it.
>> v3: fix typos
>> v4: fix return code in signal_eviction_fence
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  7 +++
>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 44 +++++++++----------
>>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  2 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +-
>>  4 files changed, 31 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 8bdfcde2029b..2f2b277cfaed 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
>>  #endif
>>  #if IS_ENABLED(CONFIG_HSA_AMD)
>>  bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
>> +bool amdkfd_fence_signal(struct dma_fence *f);
>>  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
>>  void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
>>  int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
>> @@ -210,6 +211,12 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>>  	return false;
>>  }
>>  
>> +static inline
>> +bool amdkfd_fence_signal(struct dma_fence *f)
>> +{
>> +	return false;
>> +}
> 
> Huh? What's that?
> 
> That function seems to be just a NOP. It's return code is used nowhere,
> is it?

It's the dummy which is used when CONFIG_HSA_AMD isn't enabled.

Not sure if it's actually used or not, but we have dummies for all functions declared in this file.

> 
>> +
>>  static inline
>>  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
>>  {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> index 09c919f72b6c..9cd413e325f0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> @@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>>  		if (!svm_range_schedule_evict_svm_bo(fence))
>>  			return true;
>>  	}
>> -	return false;
>> -}
>> -
>> -/**
>> - * amdkfd_fence_release - callback that fence can be freed
>> - *
>> - * @f: dma_fence
>> - *
>> - * This function is called when the reference count becomes zero.
>> - * Drops the mm_struct reference and RCU schedules freeing up the fence.
>> - */
>> -static void amdkfd_fence_release(struct dma_fence *f)
>> -{
>> -	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>> -
>> -	/* Unconditionally signal the fence. The process is getting
>> -	 * terminated.
>> -	 */
>> -	if (WARN_ON(!fence))
>> -		return; /* Not an amdgpu_amdkfd_fence */
>> -
>>  	mmdrop(fence->mm);
>> -	kfree_rcu(f, rcu);
>> +	fence->mm = NULL;
>> +	return false;
>>  }
>>  
>>  /**
>> @@ -174,9 +154,27 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>>  	return false;
>>  }
>>  
>> +bool amdkfd_fence_signal(struct dma_fence *f)
>> +{
>> +	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>> +	unsigned long flags;
>> +	bool was_signaled;
>> +
>> +	dma_fence_lock_irqsave(f, flags);
>> +	if (fence->mm) {
>> +		mmdrop(fence->mm);
>> +		fence->mm = NULL;
>> +	}
>> +	was_signaled = dma_fence_is_signaled_locked(f);
>> +	if (!was_signaled)
>> +		dma_fence_signal_locked(f);
>> +	dma_fence_unlock_irqrestore(f, flags);
>> +
>> +	return was_signaled;
>> +}
>> +
>>  static const struct dma_fence_ops amdkfd_fence_ops = {
>>  	.get_driver_name = amdkfd_fence_get_driver_name,
>>  	.get_timeline_name = amdkfd_fence_get_timeline_name,
>>  	.enable_signaling = amdkfd_fence_enable_signaling,
>> -	.release = amdkfd_fence_release,
>>  };
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> index bb252ec43733..2cf39e3d3fae 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>> @@ -1173,7 +1173,7 @@ static void kfd_process_wq_release(struct work_struct *work)
>>  	synchronize_rcu();
>>  	ef = rcu_access_pointer(p->ef);
>>  	if (ef)
>> -		dma_fence_signal(ef);
>> +		amdkfd_fence_signal(ef);
>>  
>>  	kfd_process_remove_sysfs(p);
>>  	kfd_debugfs_remove_process(p);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index 97c2270f278f..0e94f3a976b1 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
>>  
>>  	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
>>  		/* We're not in the eviction worker. Signal the fence. */
>> -		dma_fence_signal(&svm_bo->eviction_fence->base);
>> +		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>>  	dma_fence_put(&svm_bo->eviction_fence->base);
>>  	amdgpu_bo_unref(&svm_bo->bo);
>>  	kfree(svm_bo);
>> @@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>>  	mmap_read_unlock(mm);
>>  	mmput(mm);
>>  
>> -	dma_fence_signal(&svm_bo->eviction_fence->base);
>> +	amdkfd_fence_signal(&svm_bo->eviction_fence->base);
> 
> 
> And why do you do those changes and why doesn't the commit message
> explain it?
> 
> You stop signalling those fences, after all.

Hui? I don't stop signaling the fences. I just delegate signaling into a separate helper function which does some extra cleanup before signaling the fence.

Regards,
Christian.

> 
> 
> P.
> 
>>  
>>  	/* This is the last reference to svm_bo, after svm_range_vram_node_free
>>  	 * has been called in svm_migrate_vram_to_ram
> 

