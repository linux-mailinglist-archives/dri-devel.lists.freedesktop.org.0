Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5944AF18
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571F26E508;
	Tue,  9 Nov 2021 13:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629D56E508;
 Tue,  9 Nov 2021 13:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZguNskMqq/xu8trgjMbRCyLAYT3j2tVG1fEIqCbH6cFvpZn6LYkYL7kLvJn7b8Uy3cWITSbRylyjfuShjzPceZn/y8+VEVGKLzvk1lrankCIBP5AOE7poEhX3hO9v0iLggWEhnZXkup68TfjuxGsWqad+PxriuNadxQ3yUZpHcw5dpPWkzy9lxANx2cmGR5UtVjwlKZubb8Ty0EJBzDkMs6lHzMzM0fQmd0WmFcm1z5anJnC4VNJGf6jv5lTAkbk+8PilnNR+iZPn9pw9BaOWRYvyHExpz7AEvrFh0ijirxcMenjZYoE43Ej+uvoBlibefuAmWI1oPTEzqhwdvCReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ/JPsbgDoa0b33nRzpHj+4VC9kr1UZmND+AuiJdB7k=;
 b=HK4GDnTN6AdPkl4EkyWYbPilNQBRDlLW3wqpFJg85tB+O2b6JtptaLvMwYCSop/zwDT7dOsYegYJnIS8bCvYZqVWkYeVkMguKvUAxNGBUvzXgyYWaB23AfLHW2Q9wqcXv9oey06ZfF2dU823atU9ME2+zXegigOcOfLkrKTCDC64hCUwBBvWmsW149eZrm3ZT9aMc9IY4kjVIsxNtNQa25wEPZ66QKQ+C+WVzRTXSSh81QyNFiGeRwaihxscmcQN5fXTT3U0GPY7JrRSX//WOeGwgwIZmTyyRLsrfAradr4Z6uPftdfJMKCAN/KhK88mmKdzuTxnkgk74KpBX8/kmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ/JPsbgDoa0b33nRzpHj+4VC9kr1UZmND+AuiJdB7k=;
 b=MDvyGbtjQL4EjUCNHmnVYupNsHMYfYPXf+qM8NS8bz/nVPQvUFpnPkuRBU3LKu4lauuKUNwwu7M1v5OkUjWeFX1tWq2iu46IgBKCyEbs0Zjp2Hifonoe8rVX+zleJ5EKCGizLgeYFro/9QtPFKcGL2vc9jx2lD0Dhyav5njmZzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 13:57:41 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:57:41 +0000
Message-ID: <8e00b333-b1fe-9136-0fb5-a154bbbf5858@amd.com>
Date: Tue, 9 Nov 2021 19:36:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/8] drm: Implement method to free unused pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-3-Arunpravin.PaneerSelvam@amd.com>
 <e7a84d81-c069-ad2d-6b40-3e7574d0955a@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <e7a84d81-c069-ad2d-6b40-3e7574d0955a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:99::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 13:57:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8968cf16-419d-4f88-ee21-08d9a388e53f
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25781B8AEE28B7F14B6A1978E4929@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnErYPOrLUtqjVgI7l7Wl0z8+CxgGm8lmB5yK7GvGwe1d/X+/CLLo/g1bNjpuAbs3VQTp5vjzBjWEcG53qrC1rCoXKnfebAOgNtGtt+gwWufzfivYcnfBD6ssLBl5HqeVCug6dDjLghtxHLjhNK2Fd+lYFWsl/lAmzNTeZ5BEvH8Cm07yzE7RobhyN4uCaOyDx+EYQ+Ic9NgmpHFyyEvf27+YwNV/A3CginVNFRTOFrwkeGdB5Sy5ujIiYOMk3Y/41spup1iMdIGfx5/zLKiNF4H0EkU1R/U6w4JnnBluoN9aKJeFGq4Pt1qeEnppL/nCGfSRbt/ZZTdikm/GZwgqbT4OUzHXcJPFPtwHBVTcsynNEj0ieZKWXfJsMhCP9tAAvUOwuaxWn51jGRYICMOywyqmKaBdpqY9VCoptz8nWBjCNV6lD9QIWJV6J850IGbMzpZVJl1+eh4eP96Mk5iVb7nMw49Ua0kCxD6GXeKzZZhqENNwWYEOTx6f9di2lCOjmxDB3ObTuCnaht6itIplHOR9t6Xxe3O/sM6b7H4ubUM6TqdoyV631vh3zkCez2HrEizeasskwL9qln3/xG2cLHc35dc9FQGD0rDp+YcbjaCdwAhE26PGvIJHR4g48x+JDzbFJB2r6pr3dRw81g2/ldj/W2EvLxUEpGzpgGHOAj/VvLg2SEi43p/84kFygm5BkidlW/w3VOa0LHqg+NNgnQBosswl4We+1CpHw9W8o0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(186003)(31686004)(53546011)(36756003)(66946007)(4326008)(26005)(8676002)(6486002)(16576012)(38100700002)(8936002)(316002)(83380400001)(86362001)(6666004)(66556008)(66476007)(2906002)(5660300002)(2616005)(508600001)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzg4WEdqVW9sR01GbHpFWGZyN1kvNmJZUkh0QUlTWGVjQmtXb0FuM1ZLcldN?=
 =?utf-8?B?ckJaYTB2Q3NhWWNtOG1SUmRZRkFnN2l3S3pSeDBUZ09ERmMzdGtzLzZ5RDRa?=
 =?utf-8?B?NURDY1hKNDRoTkwyNEdPdkxyQUlLTXZyZzVIVWpJNFRQbkVmOHJlZEcyUWtZ?=
 =?utf-8?B?aXp4elBvVFB4emNKRHBMQSt1L2FZMjdQUjU5VEo0NTkrS1JNQTVQU3ZQWFpL?=
 =?utf-8?B?alVKaGhWWld0YWJzaC9TbmJKM3lPdHl2elJzWitscnFhQmV3MTgrSUVMNlh6?=
 =?utf-8?B?RTRPQUgwS1BOQ281dXU5ZUdJbW04eitnVkJiVU95Nzc1RXhwandnVE9Pb3Fj?=
 =?utf-8?B?dHdBU2dpSnR2THlxSlJ3TVk2OE5obzJzbkNTV1Y1WVhWWjJuTWtpbjN5L1Nr?=
 =?utf-8?B?NnZjd1E0R0FJZ1pSV3RDc1YzWjIwKzBGVWNGVGNOcXJXN3o5cUx2VnZ4dmJW?=
 =?utf-8?B?VEJVSVRhcGIwUU1EY2swZ2c1V1E5YlhBd1VtRWk4WjhBMzdQZFRjZmZGM1pq?=
 =?utf-8?B?WmIrTEFCc0E1WmkvaXBSUEtRZkJEc0NRQXNlMHg2YmpoZmlaOVRMc3MyekIw?=
 =?utf-8?B?S3BZZFQ1ekM1VnpUcUdtZitjTXBtZ1VmSU1XSTNnT1hrMlpCTWw3ZElTL3VS?=
 =?utf-8?B?SjgrOXVoVjdpLytKZEhsaEYvd3pRd0JyMGplYXBUYURac29mcDdMZGVXS1l5?=
 =?utf-8?B?VFdRUjVRcTVEd2dhdFJaYTU2dnB5Mm50eFFvY3IvUHl3V1l0VkFLeExLU1Nm?=
 =?utf-8?B?YnFjNVN4NGpEMFUwdFRSbDFZM2p3S0dDUFZoTzBYUjlaYkNTMFFlWWNqMSs1?=
 =?utf-8?B?d3l6OTNHYTBPa0l3aDZxTjh4cXIrZXgweThJYm5jOFlUNk12b3ZjYmJ4bHh6?=
 =?utf-8?B?WVgwTDVjR0xGMGRwQ0JNSmd2WUlicE5wMmN2VVRGcHlndUNHZnFibDYrVDlE?=
 =?utf-8?B?OVVWSXVXazZ1c3AzSlZlMlo4c1BKRWpMWC9tdkZBdXVyY05MV1JJTWdhR0tx?=
 =?utf-8?B?eDZpcUNmZEpPTHlPUUxKaGNCcVRzSy9pbVJrNmcxcEJ0OW5JblpXZlZIbTFZ?=
 =?utf-8?B?MkN2NlZ5NnoyYzdYZlc0eFB5SHkxZVNBMXU2WjM3ZTRxNFZUbU5sQVNFM0tq?=
 =?utf-8?B?anV4WGMzeXRnbVpTbnpLb1M3d3R4azhTSStBallyRTNJeUZnei9nb3hzMk54?=
 =?utf-8?B?dkNoN0IzRTE4RE56RmQveE5zQmlCeVZwdUM5TU9sMWVFSEFEdXBXc0Z6RmF0?=
 =?utf-8?B?eklaTUJ3Q211MjlTZXBpSnFscjRpM3Z6UG9INXpEN3FkUHAvWlhRTng3bTh2?=
 =?utf-8?B?d0dYRkRrTXlObGpHQjVVYTNoMVJBKzFUQktaNXJNSVlDZURNT2lsMFY5dUEv?=
 =?utf-8?B?bkJBWjAzcGVQWU9GejFUWmFGa3VyeFFheGJjUkdMK1RRKzlHcHhkTTNCYkdY?=
 =?utf-8?B?TVRiS3ZjR0p4TzVya1Byd3U3QUJxdVVpOTVybHdMRG5qVmp3QUR0bjEzaWw4?=
 =?utf-8?B?Q1NRVWJMMVpVRk5aN3F5dnRlaFVlcmxNeTgrQTk0dW9TMUdCMG5HMHV1bWsw?=
 =?utf-8?B?NlowYkJKTUF4S0FQY1VlNU4zTk53Ujc3TitseWVBbTk1NlZQN0ttelZZU1Ft?=
 =?utf-8?B?aEo0VlVWUTdzdGg2YWcxRXZxUjN6bHAxN1BBOHY3TytQS1hqNEVoVVF0cFNM?=
 =?utf-8?B?SU1HUnBrbVd5UkZoVm9yZ2xGckNna2tkMmRVOCtqV2EyMUQvbW1tL2x3bnU3?=
 =?utf-8?B?RVdJamNSd3ZqVzAxdzU4WldSL2dEY0lmQ3d1YnhMSGI2bStXQlFSeWorOG5w?=
 =?utf-8?B?RzBUL1liZStEN2xiRG1ZS3l5NjRiZ1ViaEJjQlVucUQ3Sk1JSHI2WmFWa0V2?=
 =?utf-8?B?Ulg2aExpWTBSWC96L1ZmNWNxTnlYenNUTzdtUzFxR0N3eDZoeFpyK01FMXQx?=
 =?utf-8?B?QVV5SGRnbG9ucTlnVWVXTEVoMCtzWkkrMmJ2dXcvUy94T0JtMjluMnR4NCtq?=
 =?utf-8?B?U01yM3BjcDI2VHZPSUpXbjA4cnoyYklwRzlyTmpjQ3B1TmEvc3pnd1gwSXFN?=
 =?utf-8?B?WEcyMUd0UmdIRmtnMXRDNmFIWnQ2blBkNnJ1SkpybkVaUzZSdmxFR3hUUEp6?=
 =?utf-8?B?clNvR3RRRW1JZEpYNnhPemdxWWZwUFN4b1prZVVNUHpJcUhkeFl3MXRLZk9V?=
 =?utf-8?Q?CIY1xekn3/3IDPrerKDuvgE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8968cf16-419d-4f88-ee21-08d9a388e53f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 13:57:41.0710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wSA+gj2aZPnL5hMYy0T1DxjOFw8I4VSrYoTcsUwwyRD4TQundgVm9d3XUMS1SfNMxHmR500YlWWXgPBHwpkbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/11/21 12:46 am, Matthew Auld wrote:
> On 25/10/2021 14:00, Arunpravin wrote:
>> On contiguous allocation, we round up the size
>> to the *next* power of 2, implement a function
>> to free the unused pages after the newly allocate block.
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> 
> Ideally this gets added with some user, so we can see it in action? 
> Maybe squash the next patch here?
[Arun] ok
> 
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 103 ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_buddy.h     |   4 ++
>>   2 files changed, 107 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 9d3547bcc5da..0da8510736eb 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -284,6 +284,109 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>   	return s1 <= s2 && e1 >= e2;
>>   }
>>   
>> +/**
>> + * drm_buddy_free_unused_pages - free unused pages
>> + *
>> + * @mm: DRM buddy manager
>> + * @actual_size: original size requested
>> + * @blocks: output list head to add allocated blocks
>> + *
>> + * For contiguous allocation, we round up the size to the nearest
>> + * power of two value, drivers consume *actual* size, so remaining
>> + * portions are unused and it can be freed.
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
> 
> drm_buddy_block_trim?
[Arun] ok
> 
>> +				u64 actual_size,
> 
> new_size?
[Arun] ok
> 
>> +				struct list_head *blocks)
>> +{
>> +	struct drm_buddy_block *block;
>> +	struct drm_buddy_block *buddy;
>> +	u64 actual_start;
>> +	u64 actual_end;
>> +	LIST_HEAD(dfs);
>> +	u64 count = 0;
>> +	int err;
>> +
>> +	if (!list_is_singular(blocks))
>> +		return -EINVAL;
>> +
>> +	block = list_first_entry_or_null(blocks,
>> +					 struct drm_buddy_block,
>> +					 link);
>> +
>> +	if (!block)
>> +		return -EINVAL;
> 
> list_is_singular() already ensures that I guess?
[Arun] yes it checks the list empty status, I will remove 'if (!block)'
check
> 
> 
>> +
>> +	if (actual_size > drm_buddy_block_size(mm, block))
>> +		return -EINVAL;
>> +
>> +	if (actual_size == drm_buddy_block_size(mm, block))
>> +		return 0;
> 
> Probably need to check the alignment of the actual_size, and also check 
> that it is non-zero?
[Arun] ok
> 
>> +
>> +	list_del(&block->link);
>> +
>> +	actual_start = drm_buddy_block_offset(block);
>> +	actual_end = actual_start + actual_size - 1;
>> +
>> +	if (drm_buddy_block_is_allocated(block))
> 
> That should rather be a programmer error.
[Arun] ok, I will check for the allocation status and return -EINVAL if
the block is not allocated.
> 
>> +		mark_free(mm, block);
>> +
>> +	list_add(&block->tmp_link, &dfs);
>> +
>> +	while (1) {
>> +		block = list_first_entry_or_null(&dfs,
>> +						 struct drm_buddy_block,
>> +						 tmp_link);
>> +
>> +		if (!block)
>> +			break;
>> +
>> +		list_del(&block->tmp_link);
>> +
>> +		if (count == actual_size)
>> +			return 0;
> 
> 
> Check for overlaps somewhere here to avoid needless searching and splitting?
[Arun] ok
> 
>> +
>> +		if (contains(actual_start, actual_end, drm_buddy_block_offset(block),
>> +			(drm_buddy_block_offset(block) + drm_buddy_block_size(mm, block) - 1))) {
> 
> Could maybe record the start/end for better readability?
[Arun] ok
> 
>> +			BUG_ON(!drm_buddy_block_is_free(block));
>> +
>> +			/* Allocate only required blocks */
>> +			mark_allocated(block);
>> +			mm->avail -= drm_buddy_block_size(mm, block);
>> +			list_add_tail(&block->link, blocks);
>> +			count += drm_buddy_block_size(mm, block);
>> +			continue;
>> +		}
>> +
>> +		if (drm_buddy_block_order(block) == 0)
>> +			continue;
> 
> Should be impossible with overlaps check added.
[Arun] yes, I will remove
> 
>> +
>> +		if (!drm_buddy_block_is_split(block)) {
> 
> That should always be true.
[Arun] ok
> 
>> +			err = split_block(mm, block);
>> +
>> +			if (unlikely(err))
>> +				goto err_undo;
>> +		}
>> +
>> +		list_add(&block->right->tmp_link, &dfs);
>> +		list_add(&block->left->tmp_link, &dfs);
>> +	}
>> +
>> +	return -ENOSPC;
> 
> 
> Would it make sense to factor out part of the alloc_range for this? It 
> looks roughly the same.
[Arun] This function gets called for non-range allocations (0..max_size)
as well on contiguous allocation. alloc_range() is called only for range
allocations.
> 
>> +
>> +err_undo:
>> +	buddy = get_buddy(block);
>> +	if (buddy &&
>> +	    (drm_buddy_block_is_free(block) &&
>> +	     drm_buddy_block_is_free(buddy)))
>> +		__drm_buddy_free(mm, block);
>> +	return err;
> 
> 
> Where do we add the block back to the original list? Did we not just 
> leak it?
[Arun] we are adding back to the original list if contains() check
becomes true. we are adding all the blocks within the actual_start and
actual_end, and remaining blocks are freed (added to free list).
> 
> 
>> +}
>> +EXPORT_SYMBOL(drm_buddy_free_unused_pages);
>> +
>>   static struct drm_buddy_block *
>>   alloc_range(struct drm_buddy_mm *mm,
>>   	    u64 start, u64 end,
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index cd8021d2d6e7..1dfc80c88e1f 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>   		    struct list_head *blocks,
>>   		    unsigned long flags);
>>   
>> +int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
>> +				u64 actual_size,
>> +				struct list_head *blocks);
>> +
>>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>>   
>>   void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
>>
