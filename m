Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF78C43DA
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AF010E7F9;
	Mon, 13 May 2024 15:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dnjlhQrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994FE10E324;
 Mon, 13 May 2024 15:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0tK25xC/nxz7OXnHX3v2tJDiPRZ/U7GuksQK97SXzBhI8A5wwisyvaFstLML/WcYjmCUnpdCoMtqUjd/fz8mbQA5a+DNcYYvprnPTf26gQ2UgJ2VUG7x+AS6hOPUMHI9CS5FXPYf/uXxCrzBUlxlIZ3WtAdHg4Mx4330+V8CWHWzsfYyXRNiX+sbGC4st1X4at5hw336yO1LGkD4EuZIupVz7H8b7LnrqHao+muiZSqGXAw8mrfg9X3ryR14+qqqjVoQnOxfmPJsUR1v2NYcCFJkdevDUFour/L9bUv9dt+48EsEe5sVzOMpvkz1q1nIPQZ/W4QiP4vAWGEoEWemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uwQTVjJMs7nD4gOc8cl8LAraAmiscMhderFmAw9Xzg=;
 b=HEYXpPSrFSIL118giROwc3AMKHouO/dsRpEselp4Hty81x3hfrEGZc6EEInN8vcl01c1YkseIibb7cVThj0xJR7+2wgZI/I2EXFI0VLwwQ0p20J/BQx8OWVRSpSTp3HOgUwrLpe7/TiB0b/Fo8el3P8QOxrmgpx7wBHzOrtkXWxb5oTBRFW1mrI2atA+WQJtHnHkV79UXHELwgiEDdIc0EjJoi5Qic6CZ25m5YYUumkU+xSS4+ue6YWwXuCD58nq9Rf1iQO4DipMvUmR48jmwHpHF/UY/E7bdbSw7wS1h8OezTLh/Ulaz2znjzBEmqdqDFA2TbvP0OsQS/LRxmj3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uwQTVjJMs7nD4gOc8cl8LAraAmiscMhderFmAw9Xzg=;
 b=dnjlhQrS1ZCuSCeZ2qJ1GDXIQtbG0bwHjaiKKsJ7pedaAr293qSsjhJZY1Ug+cgYRIuOlJPRr40dYW2tS5mpldAq6eW2JFelbKtI5L2q6EY9RPzBGNxlIXJr8HxF30kOLTMCwoEf3YFSHUZ5UMt03B7WErUhPnlKfc1VS1c/ARo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:11:59 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:11:59 +0000
Message-ID: <82a9c2c4-5165-413a-b3b1-c8b59ec49271@amd.com>
Date: Mon, 13 May 2024 20:41:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/tests: Add a unit test for range bias
 allocation
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, daniel@ffwll.ch
References: <20240512075909.2688-1-Arunpravin.PaneerSelvam@amd.com>
 <20240512075909.2688-2-Arunpravin.PaneerSelvam@amd.com>
 <81aa9ca4-dfbf-4e2f-b931-87c3a91cbe0a@intel.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <81aa9ca4-dfbf-4e2f-b931-87c3a91cbe0a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|BY5PR12MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dddd511-9551-4a16-727d-08dc735f0935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVI3dDdCUngvTVRweFU2WTNxeDVwYkcvVVRUVk5JaG54RG84RWhFZUtpajM1?=
 =?utf-8?B?UGtpMVhzQ3IxcGd6MG9PdFpYVUpuUTRsNmNGaS9HWGVxQzBvWnRldXJ1blZH?=
 =?utf-8?B?OTI2Wmd2a0JWMVhmejZXYjI0TDJTd2xjejBpc1VGd2JaL0M4MGN2bm5TRC9B?=
 =?utf-8?B?VGVNV055dnZPMlBBRlIvM2VQbEthWU9yRW1taFVzWmZhbUZMVnVNVCtwY3NJ?=
 =?utf-8?B?THVQS3pzTzZySUxPMDlYWVhFcU5Fazd2MHJmSFF1RS9uTUhwNzZ3QjZkWllk?=
 =?utf-8?B?cXVIdmFOYjNqbzNxdFlkTCtZZ0w3VTRqUktkSkRmaklZMk54dXlJNkpGMncv?=
 =?utf-8?B?T1hTYkZMdGF4MFFWNytFalQrek5abWNRVmh1R3hOeG9UVmZqWnNoQmdQRzVM?=
 =?utf-8?B?ZTJEaWdkSkozSVNEZjhkdDhGL2RkdnQzaWJBWmU0dFAwTUxVNnRscExka2VU?=
 =?utf-8?B?bnkxSlJmZVVPREFjdEhUVEZNbDVNbjVLRGNmMEtSRXNtaEpxQjUrdXBjUmVI?=
 =?utf-8?B?WXRIM1BRc1hkNUthc3h6QVFHWnRyZFk1R0dLNnZnZzBKeWliZWZyZ2ZTc0ta?=
 =?utf-8?B?eDdzWG5wc0d3c2hlZStLMmtWUWxJVmtHaVFuQzR3S01TTGZvNW5iUUtwQUJJ?=
 =?utf-8?B?Lys5NFdGZU1CN3ZDYmpRbWs3K2dVcUFub1Z3YUlzTEsrYlBOZ2YvemwyREZi?=
 =?utf-8?B?TXNSTWpPOFp3dHB3VWIrSGpWZVlHbWVEWVVCVVdZMTJ6NGsySXZIRTlNQ0g3?=
 =?utf-8?B?TkZBaVZrbSszSkJXZ1REaEt0OE8reFB6TjRsWk1PaVIwNkdrOUZ6aFRibmRo?=
 =?utf-8?B?b20xWndhZjNiMlplUE9Pd0lHTEltMW9MUmZGZ0RkTVR0WUR0d1E5UXZDbm1p?=
 =?utf-8?B?WWlYNTQvMG9hYkNLcVVEblBDK2ZNN3BqOUlaaFJKUnE2cUlsQVJpVFJNWng0?=
 =?utf-8?B?TkNOVFRselVLWE9lcUdPdVk3b3kzaElpUWRkQUZaVjdBRC9ZenJTY1orVW8x?=
 =?utf-8?B?K0dHZ1RiSFdGT1ByYXpsT1F0WFMzMjRTSk01aUZ3bVVPaDBSOGNCU2JMMFFq?=
 =?utf-8?B?N1VyUGoycC93amQwTGhhSXJOaXovOHdQNmIxRE5oc2s4QVdCTVdaMEFuclI2?=
 =?utf-8?B?dGp1TVlrYWZDRWJxRnpxQlNVZklHL2Zmc1NuTmZFNFBBY0VQOU5MZXlzOUdD?=
 =?utf-8?B?QW9NeTRVd3JPeTR1RllIUzRxeHF6NGJHdyttbUtCSkpSVXVVZk5pVmMvcTZP?=
 =?utf-8?B?VitaTDF0dHNsT0xzREJCS3ZDQjgrZTgwSFRRelhEOG05RTJocjFPcjVjazk4?=
 =?utf-8?B?MmJEcjFBUVhVMkVtWjRTa2RuQ0VySjdtRlV5WExjNyt0QTQ4YWZxU0FERWFk?=
 =?utf-8?B?K1VMK0J0b0FTVTZNT3R4MUdTTUozd3MzamdwL01YM0ZEb2UzOEJpZmNVdXR6?=
 =?utf-8?B?d25DcTRvaWtqdk5GOU1Lam9LcFVBK3V1blUyakZldVYreGJCQzlXcXBnVGJ6?=
 =?utf-8?B?Q0YwWEF2ZThJb0tjSlFGV1VFd1ZnMXVPMHkxSmZRSW91Ky9GWUpTQmEvYmFX?=
 =?utf-8?B?Wm9COE01YklCUWViNmRuNHVXU21jMUtsSnVVQlZDMFBVaVhGRnBSOFl5RXcz?=
 =?utf-8?B?MXYzbVE5aWVSdFBQMTNxT1hIcHFwQkR2QkdvQUhFblFCRVRSMCtmMnFZUjF6?=
 =?utf-8?B?bWtZRHFWelpFNnBabG5xOUJyaDBxSXZsczQ1M1B2T0d5NTlTME94cGNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkJNNU5hdkIzVTgwYUR3cHpqSkRGTmJvNG95VXNuaEMzWlpQRll0VXBCM1dx?=
 =?utf-8?B?UE8zTXRKMk9EOE1IbGRwY0ZvRDlkY1lxc2daaG1BemIzTjZYb3dRdmFiRzRl?=
 =?utf-8?B?TUwzMmo5Yk10ZGViVHl3RVplL1Y0eVNSa1IwME05NTFoN1FCeCtxL3cwYkxO?=
 =?utf-8?B?dnAwZklhbFRQNG9QODNQa2JwUjVFYlQxbktYSG84ZUJ3cnV4djA2WFpQanpy?=
 =?utf-8?B?Y3JFRCtleEtKTDFzSGVOK3ZFd3IxMnBxYm1YbSs0YS9HKzdjTnB3UTZvelJE?=
 =?utf-8?B?M2c1ZGxmWCtTTTk3Vk1kUTJDQUtCQ1A1RXpFRFNyaDNoWUZ0eU5BQ3ZBTGlX?=
 =?utf-8?B?TVlqNFlac203S2lPSUI3Z29ZbzQwV3laK2ZhM0dNZW5aYWlaekhiVEh0ME4r?=
 =?utf-8?B?TWlTQllLNU5kcGViSEIwVXBpVGdoamorekFZaGFzRVlWdjJYWGxkWnRDbGlP?=
 =?utf-8?B?b1VUOEttLzNQMC84S0luL0VUbWowR1Q5VTZkYWVoNU5pSU8zRzloZXd0Umc1?=
 =?utf-8?B?LzlwdG8vTWgxU01VRkQwYWYxY2x5N0k0TElTSGVUMGxiRXhDaVZFWGY0WUsx?=
 =?utf-8?B?WlVnTzV5bzNUY2NDUHkxZjBqSUwzbFJoemhQUCtqMFdJUlV1cFo3dWpCaVdx?=
 =?utf-8?B?bXZKWjc0VCtScWlrSlBsYlQ0VXVXK0piREdDZWNaeFE5NktpMUVkaUtOdnZl?=
 =?utf-8?B?MDJEVHl6aitaSjFBQkx4SVJTRFF3a1o0NVVSN2lud2g5TlZFcVJJZmoxZ0ZH?=
 =?utf-8?B?MjdOWWZIMWFBdTcxRjVEamJlSXVFcDNFU29DaEVtaGlHeERveEsvZnhCRDZ0?=
 =?utf-8?B?QmdqRnlnODNVb2JnZmFJaDUrMHZLMlE3RU95SVFiRm1Fdm96cnh0MHBYeEFu?=
 =?utf-8?B?Q1g2Z21MV293SXJTbkVyT3NxWE44R005QytOSXlhQkpnRW44NlA0Z2FkU2Jq?=
 =?utf-8?B?MnNOU3psL1g1RkZqMi9QbUZLQ1p0MDIzdFBkd1IzVFluUXRrbjRCTDFEeWRK?=
 =?utf-8?B?Nkw2enlqNGhNaUNhNW1FMitTOEc4N1ZtTkRGVVN4ZGE0b1NldEZSL1ZmWkpG?=
 =?utf-8?B?Njl4VUxxbGl5TzBmbHI1OXp4QjYwTTBUN09YTTExdWJ6bERzdXQwbHFNSXpI?=
 =?utf-8?B?Q28xR2o4Y1Q0SG12THhXVzZaUjFyNGdRVnJ4RVFCVnhKS0tsTGNJaDVVYlJp?=
 =?utf-8?B?V2hFbkxhZHVxbWgvcHEreWE4MjR0RlFHeEpUR01uekNpZG5MaUtpUXFlK2dj?=
 =?utf-8?B?TzFCTHl6aUtBWG9lSThDTUVqQndiUWNTWUtTcUtwUTZRL0FqNDgwcUduUmpN?=
 =?utf-8?B?RmsrVkhYNjU5MHZmUmxZc0M5YmFhTDRTaUVtVnJvNjJqcTlEWThIN3ExaUth?=
 =?utf-8?B?NWMyeDdvOFJnK1dHZVpRRkJYRUViWTdGZDV5ZFYraTFPQWZVYWpjRWN5bHRV?=
 =?utf-8?B?VTVmZExGejloVzduUURVMzZhWTFnL3AvUm50QTFyZVpZRUFYQ0lyazgwYUJZ?=
 =?utf-8?B?NHoyaTJTSmY4SDlzb29abHh0aHU4ZzJnTkRLZkZLcHczQnZVdVhhYjlieFdy?=
 =?utf-8?B?Vm01cXRvbm1hMDNlYW5GTEVrN3BTcEU2bzQvNEhBZkhRTzVsQjZsa2poRndi?=
 =?utf-8?B?ZWRISGcrY3VyYnk4ZXhwaDVJN0NyeVBHVUt6WkdhSnJURlE0Wi9IVndiRFFL?=
 =?utf-8?B?ZHp1ZFdzKy83ZGV5R1VnVXkrbnpaOHdNaUpzUWNQaitFUXJlditBcXA0MGtw?=
 =?utf-8?B?V25DOUlXZ2xpZkVSYllLZit6UjBUM3RWVFlLVktBc3VFYnZqVS9KeGVwMTRw?=
 =?utf-8?B?cmYyb1ZweUdwa2xuOEl5ZndsdnV0M1hkQUtYNnBuMmtFUU16dmdyZWdMWTVM?=
 =?utf-8?B?akdZa1RRdUN0ejlTM3l6V0R3c3JiaG9lM0pUWGJ2TkllZTFGOTMwVGNlSUUw?=
 =?utf-8?B?cjIzMXF1ZnJuZmRRajZ1aWF4K0xVWEFaL1pSa1p0NmZwM0xRVmE1bzJFZjFX?=
 =?utf-8?B?ZDY1eUNjd0VHckd5QTI1bjJRQ1EycEkybHZ6TDRvSlMvZEdtUGVXeVc5c0dS?=
 =?utf-8?B?L0M3YTNwZE1jRS9JY0FENDI5akU5Q1FzTVJpS1NOSTJUdWJyd1NjUjN4UnBX?=
 =?utf-8?Q?wCrR0E2jOraCtRcM41tcUhzps?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dddd511-9551-4a16-727d-08dc735f0935
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:11:59.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhKL2ab9m8E9Ei863E5rJrQcqnNMPsvO/DjYc/DblKcqfpLi/GsEb9tKwro8zlAVFcntAzy5VhI9F4n5VvPtjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
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

Hi Matthew,

On 5/13/2024 1:49 PM, Matthew Auld wrote:
> On 12/05/2024 08:59, Arunpravin Paneer Selvam wrote:
>> Allocate cleared blocks in the bias range when the DRM
>> buddy's clear avail is zero. This will validate the bias
>> range allocation in scenarios like system boot when no
>> cleared blocks are available and exercise the fallback
>> path too. The resulting blocks should always be dirty.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index e3b50e240d36..a194f271bc55 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -26,6 +26,8 @@ static void drm_test_buddy_alloc_range_bias(struct 
>> kunit *test)
>>       u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
>>       DRM_RND_STATE(prng, random_seed);
>>       unsigned int i, count, *order;
>> +    struct drm_buddy_block *block;
>> +    unsigned long flags;
>>       struct drm_buddy mm;
>>       LIST_HEAD(allocated);
>>   @@ -222,6 +224,39 @@ static void 
>> drm_test_buddy_alloc_range_bias(struct kunit *test)
>>         drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>> +
>> +    /*
>> +     * Allocate cleared blocks in the bias range when the DRM 
>> buddy's clear avail is
>> +     * zero. This will validate the bias range allocation in 
>> scenarios like system boot
>> +     * when no cleared blocks are available and exercise the 
>> fallback path too. The resulting
>> +     * blocks should always be dirty.
>> +     */
>> +
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
>> +                   "buddy_init failed\n");
>> +    mm.clear_avail = 0;
>
> Should already be zero, right? Maybe make this an assert instead?
No, since the mm declared as a local variable in the test case, 
mm.clear_avail is not zero.
>
>> +
>> +    bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), 
>> ps);
>> +    bias_end = round_up(bias_start + prandom_u32_state(&prng) % 
>> (mm_size - bias_start), ps);
>> +    bias_end = max(bias_end, bias_start + ps);
>> +    bias_rem = bias_end - bias_start;
>> +
>> +    flags = DRM_BUDDY_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
>> +    u32 size = max(round_up(prandom_u32_state(&prng) % bias_rem, 
>> ps), ps);
>
> u32 declaration should be moved to above?
Sure.

Thanks,
Arun.
>
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> +
>> +    KUNIT_ASSERT_FALSE_MSG(test,
>> +                   drm_buddy_alloc_blocks(&mm, bias_start,
>> +                              bias_end, size, ps,
>> +                              &allocated,
>> +                              flags),
>> +                   "buddy_alloc failed with bias(%x-%x), size=%u, 
>> ps=%u\n",
>> +                   bias_start, bias_end, size, ps);
>> +
>> +    list_for_each_entry(block, &allocated, link)
>> +        KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
>> +
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>> +    drm_buddy_fini(&mm);
>>   }
>>     static void drm_test_buddy_alloc_clear(struct kunit *test)

