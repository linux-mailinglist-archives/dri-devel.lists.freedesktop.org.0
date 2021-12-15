Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C64476370
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F99310F8E1;
	Wed, 15 Dec 2021 20:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DA410F8DF;
 Wed, 15 Dec 2021 20:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcXGelerV2twjtc1C9n481mMMNNMhdaPGc5MtNaw3f7dMVRm4lIJYeDMQhdLBfVSvGhPe42P4IemopGRVBogLYBIjeAoz4SoGuhtWJO+GenKZdclVq5YI+jULJxiyPj5A4RYLPZVkI9e6lsNK1Kgm53UUcQ7B0dvSAqsk7+xECZ6Elny3c4nKGq5fElnzLE27cyzyJCKPeYg/IbWJIyVxlcMxt0MuOeXIISYgKV2jUvXk+2wK3tFhYAEr6tWd4MM/tE/FZ9kGLKMsAW8dkWNqR/z+pmzedUY2O2dtHFSaomDmPQOSOegE7zWIwbRT/cmtdsa+Khi623n7WqrzGV+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LkUJAVvmGgH0EnhQEFtwtA2gMrU7uWnDTluaRh9RC0=;
 b=iLmb47FIzJsRUEQzr5zEIgaBR0CRsuFai+YmZ0uFocF122MavKp6L748Ou+lqJ5/YP72Cbw+wSeXijQ8ASCNQ2dGA3S8PLBx/P6Y1GDZFx1pxdWqycjnoO5iANhlwHi5WwpKuFbFjiNhDnrz45/ZkfEiBQeNBOPxQ84kCeVb3YSpTenQXTJ22fMTBT7xGeIY8eQ82IDfcRTvcLneZUrSU0omvp4+UbgKlbAuRdfsXqa+fbaDGvcYMXmqlU9xIaC+YonvrGfUCzSP6vBAb32ar+WohSKMMnjiYp83SKdYHi8CZM4elOuTmddgaxlVo3DgR+W+IURkDhZpWM96M0y9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LkUJAVvmGgH0EnhQEFtwtA2gMrU7uWnDTluaRh9RC0=;
 b=ewT2Em3fbeJEHNj/MqnghlkdRtJljKas3rJBvNzkvJ1q1WGSVImcsaITAsxaLrf0n7iOkNu16yP9oMMkmMJolad+aBC7N3xQpEWXSUQOkPyc70X68DDoVd3yPaA1lAJFDTxlv/HhJsCcluMvTTyo1IgsiabHbt0IHB4ItzD1keg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Wed, 15 Dec
 2021 20:37:42 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 20:37:42 +0000
Message-ID: <be7e62de-59d1-9c52-ee4a-c2d1a512f28f@amd.com>
Date: Thu, 16 Dec 2021 02:16:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
 <MN2PR12MB4342EA8DD09D84589AE3C0A0E4709@MN2PR12MB4342.namprd12.prod.outlook.com>
 <7613e294-eab5-b034-aad9-857bd049d9c6@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <7613e294-eab5-b034-aad9-857bd049d9c6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::34) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdf79919-4300-4ee0-2171-08d9c00abe0b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4961D25136B80B820C31CC1CE4769@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsqavfRvcffKkvSR6m5xS0Vq3CaBCdKnUuBmJVnos58iOLzK0bFL9XS15shB6D5GqoN8hop82Bhkl/OXrUdc14OfQa/bKsMquLSJwWmXS/1yOWZL3NIT0zJUYEXcgJH9QNOVcsuB3dTAZgx4PhI2iECyggiiIIPO8u01oKZy2yJmGO0J4N23rv8IyrDs2dyYsRGJMfohPD4wf6a65ToHMUYLVloz2U80Z4oo7WrGPpOsrcyJR0TOlQ3l/+esbcyJGyvc+i9JsJXqNAw0LeU+T687GSjLfLAhPF9RGFZRRO4hVKithB8zaqrwpsgzXtxQy67F2uLhLa1iC6y0b3BtdJvdck/ACw8gveIust8xXnnOCNKs/iwye335ti8g4pRT+5sK/7iD9FCLB5ubHgAzXt20IsiLXem6641PmG+2XAsFsgcInNqAJ20s4rgFW2FNY8CmWCrm4W4HQSGd/hZq6n7OKZsHSJRZVJUKoJibmVNoRkZyTtGYii6aC4hsnkj8ISwqjhJ+AoKe91qWoEpXuxvimAZA72PzHmzyyIEEdCemKNQzO0qUzVy/jZOa3coc4FMzNgL1G2SWyS4W4Kl9UIrGwZ2pz1w9gd2lsExAjdz4gUt/hHgoVnc4n64Z/Ay3DwxFBcIjB73OA8rRd9wf77xYPjAxpXm9rQtuK/xnHG5s5BxMH8mbJGQL+aWkw//VHEaa3WAbGolngaEFP+RppyCB4eXagzV2d/2n7IRsbsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31696002)(4326008)(66946007)(30864003)(186003)(508600001)(6486002)(6512007)(66476007)(66556008)(2616005)(26005)(2906002)(8676002)(53546011)(8936002)(6506007)(83380400001)(5660300002)(38100700002)(86362001)(31686004)(316002)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBhbmUvckVYQlNKd20rQ1NUVHNTamkyaXkvcTlPUzRtcVk0Rk14cFEyQUJt?=
 =?utf-8?B?dVN4QmlRZ0Q2Wks3TzR3VXpVUTB2RHNGR3QwcVVwemJtSEFPMWRScWJTcUto?=
 =?utf-8?B?WS91cEVGYTEzZ1pzMTVwbG5YZFp6YnJINzc0MUF4UjNublUzNU9SUWdGNEho?=
 =?utf-8?B?SitPeG5PNEp1SkhhU01uRS9qZC9UekFRMlJ3dUNpY2czWmtTUnZPaXNBRkVP?=
 =?utf-8?B?N3Z3VVNQYjFUNXRRK2pvNnRhdEUxUjNlR1JPblBkOEFxNEtSdmZZc0FJUGs0?=
 =?utf-8?B?aEF1UlUyZHdGb2xaTW1KcnlCUmdtT0tLZ2Q0WnAvUFhCVHU4MzdoZGlyV3VI?=
 =?utf-8?B?U0V6UnFQS0JzQmRrU3FjL3RPQVJLM1d6RkpZdmZFQ3ZNQS9EbTVmblI3cnV3?=
 =?utf-8?B?cWtFZTlNUXZveEdzSmlKN2g5VnQ1YzJ2UEJRVHdiQXlockFmOTU3cjY4OFBE?=
 =?utf-8?B?cXM4TjdGa3BKY1hRckc4dWhuYnpBUHZueTM3aEsyd1RQNEJpOXMzeHZFZmRi?=
 =?utf-8?B?Rnh5TUdiZVVFM2drY1F3cWhpckVyNEpmajRVZXZrc240c0lHTm4ycEJnNEJp?=
 =?utf-8?B?S014OVVYS0kvSnpZaUNTRi91bzMzZmJTeFY4SWdSR1RvWDJFSlc2YnpqV2h0?=
 =?utf-8?B?eHQ3a011VndOTjdYS3RQM3pTYUlObDFiVTlLMkVyRStZQ3ZzY3E1cXJ0QlVP?=
 =?utf-8?B?czNYRmZycTBMcXhWbVFpbkduUGtIb3FaMVJid3RaWVpMK3pYWkc0QndPY2t3?=
 =?utf-8?B?bWx3SHNPc3NTTWhrRmhOd1ZFZnpYU3ZOaEZRdG5YekJ2a250dGhrZ2VYSGZW?=
 =?utf-8?B?TmptbEJUMk1nc0tMbGdVTHRQRlFFWkZBRjVTWjhOdTNoYndZeVlUUVhIZEZE?=
 =?utf-8?B?TmRPTVV6TXlXZUVpVzlHcndDNWVhL2JXMlN3OW1RSHVhR29sUnpQOWg1M2V0?=
 =?utf-8?B?enVES1MwWnpHcjBOR2NIMzZZaUJEY2ZmdzdGaWxSZ2ZJL1FyTmFodnZZMDVz?=
 =?utf-8?B?d1dMVVo5eXBaNUpMaUtkS0kvRnpxSXVteG9kQ3MvblAwQ0ZKN2srRlplRFh4?=
 =?utf-8?B?UnYrZExoREgrMm1mbnd5M0o4dXNndWtGMmhiNWpqY0lsdTFDbjlueUJCV1Ns?=
 =?utf-8?B?RFQ4RGZyNm1zQ2FLZ2ZoaGZxVjV1Y3ZSN1JhTWpBT2JlWFhLKzhZYjhvYmJz?=
 =?utf-8?B?YjNJZTgvVHBvNEkrbjBWN0FzcmJObGpXWHFqc1lramlQeUZTTG83Y0pxZTNZ?=
 =?utf-8?B?L3pBRkY1Ky85NnNVOUhsVmR6a3JLQzduMzJ3WGNxaEZBeFYycmEwbmNXbGNJ?=
 =?utf-8?B?elJvSFc4akxETkhaSDJNbk5rNGw1L0IrN3A5SEhhLzZBK212aTFGRHlDaWRM?=
 =?utf-8?B?RCtPaTNJNGIxL0JtRHBsQ0Y3cktsNlZDVVp5QVo1T0IrZlIvaUNOeTJ5UTNK?=
 =?utf-8?B?UGdBbWpycGlqL2gvUnVJaDcxeU1pNHJZSDhkRjVrWkJZOXNrNHlteTVCUjU5?=
 =?utf-8?B?WXpHM0pnZlV5a2NSUEQycEJGTTVxdUlnSjF0S09BNCtPTkU3YlY3aWVLT1NK?=
 =?utf-8?B?SGtCVmhacEFQTVo4Qk5OZCsvMG5mZ0dDUjVMN1IzL2F0ODYzMXhvbVBxSUlu?=
 =?utf-8?B?VVZuaE90R09WV00xeGtLQ256aTdwd1M0dHdpd3V0SmhMek5qZ1hPek1wUWYz?=
 =?utf-8?B?Q05MT1B2OU9ycWRmdmtPRHVpS3lpZTdQTWZHY2k5VXMrNSt2cWpYZ2x6enVr?=
 =?utf-8?B?THlpTUxZb3JuTWJndVJSOGpRVmdHMzMvVEpnTWJBWVN1UWR3YmQwUyt6dlNW?=
 =?utf-8?B?anBMU0RZc29PZ1owd05xNzZqWDZCbndGU1F2S0V6N2RDQUtvWVkvS0x5Y3ZY?=
 =?utf-8?B?dHBNZGtsL1dydUExbE94aXY2VHAxVmhXcDJlVWNHdlcwVmRPeU45enNJdFE2?=
 =?utf-8?B?Q3d5ZmZUVlVDeTJjMzIrL0x0enA5TGtraDZrVjFGN2ZQWnRXbmt3TGpld21Z?=
 =?utf-8?B?ZFlRSlhsSlZrbW0xSXlJRktaUHhzM0hMZm9manE4WGhXU1Jmb0FkRjVzTWk4?=
 =?utf-8?B?Yk1qUlVFbE8rbUNMQm9UWHR2MWZaU01yTmxveWl2a2RnMFRXaGhUOTV5ZTQ2?=
 =?utf-8?B?ZTVlTldSeFpTNytYdVpCRmQzT0d3VmdvMGhlVlgyQkIwQmJQTC9PYnVFMkYz?=
 =?utf-8?Q?3ShO249ITs4LDNOxWaNgdsA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf79919-4300-4ee0-2171-08d9c00abe0b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 20:37:42.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cW+klVskV30azAX16sZ87khkMoLZu/P6F/lfxjh6vfr1lOHE1P8V/vVcrSi6i4s71AhrIFfTGmBzSfKFeBY5/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/12/21 12:29 am, Matthew Auld wrote:
> On 09/12/2021 15:47, Paneer Selvam, Arunpravin wrote:
>> [AMD Official Use Only]
>>
>> Hi Matthew,
>>
>> Ping on this?
> 
> No new comments from me :) I guess just a question of what we should do 
> with the selftests, and then ofc at some point being able to throw this 
> at CI, or at least test locally, once the series builds.
> 
sure :) I think we should rewrite the i915 buddy selftests since now we
have a single function for range and non-range requirements. I will
rewrite the i915 buddy selftests and move to drm selftests folder?
so for the time being, I remove the i915_buddy_mock_selftest() from
i915_mock_selftests.h list to avoid build errors?
>>
>> Regards,
>> Arun
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Arunpravin
>> Sent: Wednesday, December 1, 2021 10:10 PM
>> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: daniel@ffwll.ch; Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; jani.nikula@linux.intel.com; matthew.auld@intel.com; tzimmermann@suse.de; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
>> Subject: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
>>
>> - Make drm_buddy_alloc a single function to handle
>>    range allocation and non-range allocation demands
>>
>> - Implemented a new function alloc_range() which allocates
>>    the requested power-of-two block comply with range limitations
>>
>> - Moved order computation and memory alignment logic from
>>    i915 driver to drm buddy
>>
>> v2:
>>    merged below changes to keep the build unbroken
>>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>     - apply enhanced drm_buddy_alloc() function to i915 driver
>>
>> v3(Matthew Auld):
>>    - Fix alignment issues and remove unnecessary list_empty check
>>    - add more validation checks for input arguments
>>    - make alloc_range() block allocations as bottom-up
>>    - optimize order computation logic
>>    - replace uint64_t with u64, which is preferred in the kernel
>>
>> v4(Matthew Auld):
>>    - keep drm_buddy_alloc_range() function implementation for generic
>>      actual range allocations
>>    - keep alloc_range() implementation for end bias allocations
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 316 +++++++++++++-----
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>   include/drm/drm_buddy.h                       |  22 +-
>>   4 files changed, 285 insertions(+), 122 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c index 9340a4b61c5a..7f47632821f4 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -280,23 +280,97 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)  }  EXPORT_SYMBOL(drm_buddy_free_list);
>>   
>> -/**
>> - * drm_buddy_alloc - allocate power-of-two blocks
>> - *
>> - * @mm: DRM buddy manager to allocate from
>> - * @order: size of the allocation
>> - *
>> - * The order value here translates to:
>> - *
>> - * 0 = 2^0 * mm->chunk_size
>> - * 1 = 2^1 * mm->chunk_size
>> - * 2 = 2^2 * mm->chunk_size
>> - *
>> - * Returns:
>> - * allocated ptr to the &drm_buddy_block on success
>> - */
>> -struct drm_buddy_block *
>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) {
>> +	return s1 <= e2 && e1 >= s2;
>> +}
>> +
>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) {
>> +	return s1 <= s2 && e1 >= e2;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_range_bias(struct drm_buddy_mm *mm,
>> +		 u64 start, u64 end,
>> +		 unsigned int order)
>> +{
>> +	struct drm_buddy_block *block;
>> +	struct drm_buddy_block *buddy;
>> +	LIST_HEAD(dfs);
>> +	int err;
>> +	int i;
>> +
>> +	end = end - 1;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	do {
>> +		u64 block_start;
>> +		u64 block_end;
>> +
>> +		block = list_first_entry_or_null(&dfs,
>> +						 struct drm_buddy_block,
>> +						 tmp_link);
>> +		if (!block)
>> +			break;
>> +
>> +		list_del(&block->tmp_link);
>> +
>> +		if (drm_buddy_block_order(block) < order)
>> +			continue;
>> +
>> +		block_start = drm_buddy_block_offset(block);
>> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>> +
>> +		if (!overlaps(start, end, block_start, block_end))
>> +			continue;
>> +
>> +		if (drm_buddy_block_is_allocated(block))
>> +			continue;
>> +
>> +		if (contains(start, end, block_start, block_end) &&
>> +		    order == drm_buddy_block_order(block)) {
>> +			/*
>> +			 * Find the free block within the range.
>> +			 */
>> +			if (drm_buddy_block_is_free(block))
>> +				return block;
>> +
>> +			continue;
>> +		}
>> +
>> +		if (!drm_buddy_block_is_split(block)) {
>> +			err = split_block(mm, block);
>> +			if (unlikely(err))
>> +				goto err_undo;
>> +		}
>> +
>> +		list_add(&block->right->tmp_link, &dfs);
>> +		list_add(&block->left->tmp_link, &dfs);
>> +	} while (1);
>> +
>> +	return ERR_PTR(-ENOSPC);
>> +
>> +err_undo:
>> +	/*
>> +	 * We really don't want to leave around a bunch of split blocks, since
>> +	 * bigger is better, so make sure we merge everything back before we
>> +	 * free the allocated blocks.
>> +	 */
>> +	buddy = get_buddy(block);
>> +	if (buddy &&
>> +	    (drm_buddy_block_is_free(block) &&
>> +	     drm_buddy_block_is_free(buddy)))
>> +		__drm_buddy_free(mm, block);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_from_freelist(struct drm_buddy_mm *mm,
>> +		    unsigned int order,
>> +		    unsigned long flags)
>>   {
>>   	struct drm_buddy_block *block = NULL;
>>   	unsigned int i;
>> @@ -318,78 +392,28 @@ drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>>   	while (i != order) {
>>   		err = split_block(mm, block);
>>   		if (unlikely(err))
>> -			goto out_free;
>> +			goto err_undo;
>>   
>> -		/* Go low */
>> -		block = block->left;
>> +		block = block->right;
>>   		i--;
>>   	}
>> -
>> -	mark_allocated(block);
>> -	mm->avail -= drm_buddy_block_size(mm, block);
>> -	kmemleak_update_trace(block);
>>   	return block;
>>   
>> -out_free:
>> +err_undo:
>>   	if (i != order)
>>   		__drm_buddy_free(mm, block);
>>   	return ERR_PTR(err);
>>   }
>> -EXPORT_SYMBOL(drm_buddy_alloc);
>> -
>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) -{
>> -	return s1 <= e2 && e1 >= s2;
>> -}
>>   
>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) -{
>> -	return s1 <= s2 && e1 >= e2;
>> -}
>> -
>> -/**
>> - * drm_buddy_alloc_range - allocate range
>> - *
>> - * @mm: DRM buddy manager to allocate from
>> - * @blocks: output list head to add allocated blocks
>> - * @start: start of the allowed range for this block
>> - * @size: size of the allocation
>> - *
>> - * Intended for pre-allocating portions of the address space, for example to
>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>> - * here is that drm_buddy_alloc() is still the main vehicle for
>> - * allocations, so if that's not the case then the drm_mm range allocator is
>> - * probably a much better fit, and so you should probably go use that instead.
>> - *
>> - * Note that it's safe to chain together multiple alloc_ranges
>> - * with the same blocks list
>> - *
>> - * Returns:
>> - * 0 on success, error code on failure.
>> - */
>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size)
>> +static int __alloc_range(struct drm_buddy_mm *mm,
>> +			 struct list_head *dfs,
>> +			 u64 start, u64 size,
>> +			 struct list_head *blocks)
>>   {
>>   	struct drm_buddy_block *block;
>>   	struct drm_buddy_block *buddy;
>> -	LIST_HEAD(allocated);
>> -	LIST_HEAD(dfs);
>>   	u64 end;
>>   	int err;
>> -	int i;
>> -
>> -	if (size < mm->chunk_size)
>> -		return -EINVAL;
>> -
>> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
>> -		return -EINVAL;
>> -
>> -	if (range_overflows(start, size, mm->size))
>> -		return -EINVAL;
>> -
>> -	for (i = 0; i < mm->n_roots; ++i)
>> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>   
>>   	end = start + size - 1;
>>   
>> @@ -397,7 +421,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   		u64 block_start;
>>   		u64 block_end;
>>   
>> -		block = list_first_entry_or_null(&dfs,
>> +		block = list_first_entry_or_null(dfs,
>>   						 struct drm_buddy_block,
>>   						 tmp_link);
>>   		if (!block)
>> @@ -424,7 +448,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   
>>   			mark_allocated(block);
>>   			mm->avail -= drm_buddy_block_size(mm, block);
>> -			list_add_tail(&block->link, &allocated);
>> +			list_add_tail(&block->link, blocks);
>>   			continue;
>>   		}
>>   
>> @@ -434,11 +458,10 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   				goto err_undo;
>>   		}
>>   
>> -		list_add(&block->right->tmp_link, &dfs);
>> -		list_add(&block->left->tmp_link, &dfs);
>> +		list_add(&block->right->tmp_link, dfs);
>> +		list_add(&block->left->tmp_link, dfs);
>>   	} while (1);
>>   
>> -	list_splice_tail(&allocated, blocks);
>>   	return 0;
>>   
>>   err_undo:
>> @@ -453,11 +476,144 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   	     drm_buddy_block_is_free(buddy)))
>>   		__drm_buddy_free(mm, block);
>>   
>> +err_free:
>> +	drm_buddy_free_list(mm, blocks);
>> +	return err;
>> +}
>> +
>> +/**
>> + * __drm_buddy_alloc_range - actual range allocation
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @size: size of the allocation
>> + * @blocks: output list head to add allocated blocks
>> + *
>> + * Intended for pre-allocating portions of the address space, for
>> +example to
>> + * reserve a block for the initial framebuffer or similar
>> + *
>> + * Note that it's safe to chain together multiple alloc_ranges
>> + * with the same blocks list
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> +				   u64 start,
>> +				   u64 size,
>> +				   struct list_head *blocks)
>> +{
>> +	LIST_HEAD(dfs);
>> +	int i;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	return __alloc_range(mm, &dfs, start, size, blocks); }
>> +
>> +/**
>> + * drm_buddy_alloc - allocate power-of-two blocks
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @end: end of the allowed range for this block
>> + * @size: size of the allocation
>> + * @min_page_size: alignment of the allocation
>> + * @blocks: output list head to add allocated blocks
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>> + *
>> + * alloc_range_bias() called on range limitations, which traverses
>> + * the tree and returns the desired block.
>> + *
>> + * alloc_from_freelist() called when *no* range restrictions
>> + * are enforced, which picks the block from the freelist.
>> + *
>> + * blocks are allocated in order, the order value here translates to:
>> + *
>> + * 0 = 2^0 * mm->chunk_size
>> + * 1 = 2^1 * mm->chunk_size
>> + * 2 = 2^2 * mm->chunk_size
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>> +		    u64 start, u64 end, u64 size,
>> +		    u64 min_page_size,
>> +		    struct list_head *blocks,
>> +		    unsigned long flags)
>> +{
>> +	struct drm_buddy_block *block = NULL;
>> +	unsigned int min_order, order;
>> +	unsigned long pages;
>> +	LIST_HEAD(allocated);
>> +	int err;
>> +
>> +	if (size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (min_page_size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (!is_power_of_2(min_page_size))
>> +		return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (check_range_overflow(start, end, size, mm->size))
>> +		return -EINVAL;
>> +
>> +	/* Actual range allocation */
>> +	if (start + size == end)
>> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
>> +
>> +	pages = size >> ilog2(mm->chunk_size);
>> +	order = fls(pages) - 1;
>> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>> +	do {
>> +		order = min(order, (unsigned int)fls(pages) - 1);
>> +		BUG_ON(order > mm->max_order);
>> +		BUG_ON(order < min_order);
>> +
>> +		do {
>> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>> +				/* Allocate traversing within the range */
>> +				block = alloc_range_bias(mm, start, end, order);
>> +			else
>> +				/* Allocate from freelist */
>> +				block = alloc_from_freelist(mm, order, flags);
>> +
>> +			if (!IS_ERR(block))
>> +				break;
>> +
>> +			if (order-- == min_order) {
>> +				err = -ENOSPC;
>> +				goto err_free;
>> +			}
>> +		} while (1);
>> +
>> +		mark_allocated(block);
>> +		mm->avail -= drm_buddy_block_size(mm, block);
>> +		kmemleak_update_trace(block);
>> +		list_add_tail(&block->link, &allocated);
>> +
>> +		pages -= BIT(order);
>> +
>> +		if (!pages)
>> +			break;
>> +	} while (1);
>> +
>> +	list_splice_tail(&allocated, blocks);
>> +	return 0;
>> +
>>   err_free:
>>   	drm_buddy_free_list(mm, &allocated);
>>   	return err;
>>   }
>> -EXPORT_SYMBOL(drm_buddy_alloc_range);
>> +EXPORT_SYMBOL(drm_buddy_alloc);
>>   
>>   /**
>>    * drm_buddy_block_print - print block information diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index c4b70cb8c248..7621d42155e6 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct i915_ttm_buddy_resource *bman_res;
>>   	struct drm_buddy_mm *mm = &bman->mm;
>> -	unsigned long n_pages;
>> -	unsigned int min_order;
>> +	unsigned long n_pages, lpfn;
>>   	u64 min_page_size;
>>   	u64 size;
>>   	int err;
>>   
>> -	GEM_BUG_ON(place->fpfn || place->lpfn);
>> +	lpfn = place->lpfn;
>> +	if (!lpfn)
>> +		lpfn = man->size;
>>   
>>   	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>   	if (!bman_res)
>> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	INIT_LIST_HEAD(&bman_res->blocks);
>>   	bman_res->mm = mm;
>>   
>> +	if (place->fpfn || lpfn != man->size)
>> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	GEM_BUG_ON(!bman_res->base.num_pages);
>>   	size = bman_res->base.num_pages << PAGE_SHIFT;
>>   
>> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   		min_page_size = bo->page_alignment << PAGE_SHIFT;
>>   
>>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
>> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		unsigned long pages;
>> +
>>   		size = roundup_pow_of_two(size);
>> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
>> +		min_page_size = size;
>> +
>> +		pages = size >> ilog2(mm->chunk_size);
>> +		if (pages > lpfn)
>> +			lpfn = pages;
>>   	}
>>   
>>   	if (size > mm->size) {
>> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   
>>   	n_pages = size >> ilog2(mm->chunk_size);
>>   
>> -	do {
>> -		struct drm_buddy_block *block;
>> -		unsigned int order;
>> -
>> -		order = fls(n_pages) - 1;
>> -		GEM_BUG_ON(order > mm->max_order);
>> -		GEM_BUG_ON(order < min_order);
>> -
>> -		do {
>> -			mutex_lock(&bman->lock);
>> -			block = drm_buddy_alloc(mm, order);
>> -			mutex_unlock(&bman->lock);
>> -			if (!IS_ERR(block))
>> -				break;
>> -
>> -			if (order-- == min_order) {
>> -				err = -ENOSPC;
>> -				goto err_free_blocks;
>> -			}
>> -		} while (1);
>> -
>> -		n_pages -= BIT(order);
>> -
>> -		list_add_tail(&block->link, &bman_res->blocks);
>> -
>> -		if (!n_pages)
>> -			break;
>> -	} while (1);
>> +	mutex_lock(&bman->lock);
>> +	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +			(u64)place->lpfn << PAGE_SHIFT,
>> +			(u64)n_pages << PAGE_SHIFT,
>> +			 min_page_size,
>> +			 &bman_res->blocks,
>> +			 bman_res->flags);
>> +	mutex_unlock(&bman->lock);
>> +	if (unlikely(err))
>> +		goto err_free_blocks;
>>   
>>   	*res = &bman_res->base;
>>   	return 0;
>> @@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,  {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct drm_buddy_mm *mm = &bman->mm;
>> +	unsigned long flags = 0;
>>   	int ret;
>>   
>> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	mutex_lock(&bman->lock);
>> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>> +	ret = drm_buddy_alloc(mm, start,
>> +			start + size,
>> +			size, mm->chunk_size,
>> +			&bman->reserved,
>> +			flags);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	return ret;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> index fa644b512c2e..5ba490875f66 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> @@ -20,6 +20,7 @@ struct drm_buddy_mm;
>>    *
>>    * @base: struct ttm_resource base class we extend
>>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    * @mm: the struct i915_buddy_mm for this resource
>>    *
>>    * Extends the struct ttm_resource to manage an address space allocation with @@ -28,6 +29,7 @@ struct drm_buddy_mm;  struct i915_ttm_buddy_resource {
>>   	struct ttm_resource base;
>>   	struct list_head blocks;
>> +	unsigned long flags;
>>   	struct drm_buddy_mm *mm;
>>   };
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h index f9ff48a3f3a6..221de702e909 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -13,15 +13,22 @@
>>   
>>   #include <drm/drm_print.h>
>>   
>> -#define range_overflows(start, size, max) ({ \
>> +#define check_range_overflow(start, end, size, max) ({ \
>>   	typeof(start) start__ = (start); \
>> +	typeof(end) end__ = (end);\
>>   	typeof(size) size__ = (size); \
>>   	typeof(max) max__ = (max); \
>>   	(void)(&start__ == &size__); \
>>   	(void)(&start__ == &max__); \
>> -	start__ >= max__ || size__ > max__ - start__; \
>> +	(void)(&start__ == &end__); \
>> +	(void)(&end__ == &size__); \
>> +	(void)(&end__ == &max__); \
>> +	start__ >= max__ || end__ > max__ || \
>> +	size__ > end__ - start__; \
>>   })
>>   
>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)  #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10) @@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>>   
>>   void drm_buddy_fini(struct drm_buddy_mm *mm);
>>   
>> -struct drm_buddy_block *
>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
>> -
>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size);
>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>> +		    u64 start, u64 end, u64 size,
>> +		    u64 min_page_size,
>> +		    struct list_head *blocks,
>> +		    unsigned long flags);
>>   
>>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>>   
>> --
>> 2.25.1
>>
