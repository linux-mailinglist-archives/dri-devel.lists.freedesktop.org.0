Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27548A1D5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451D310EB03;
	Mon, 10 Jan 2022 21:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E1A10EAF2;
 Mon, 10 Jan 2022 21:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCUNxlSLyQke3hi293JSsRLh8Vfq1KvfNWSxGi3w/v2vfGo6d2RqVoodhkjx9STsJwETXF1a3EW0b1wX8jErjJreMMdxXEKoR8OnKOERhBMKmQKKW86FtDrZNOeBlnpHZCum0OHwYSKcYemkGYhZO14515ePQjqbwME2EQZuctINLy1X0LDHYa6paeXOCGumg6Hh6fmBBUXi9AoIzmi4Fe0PKUrQ+wiAMQ7h9ane/zJS0IYGBxjYzS5r+13HLF8/UGY9A1yAQwPJAi8TcVUPzxoRu03r+ZSnKrnVDkR3fIFRp9Y1f9Bq6bv/kg1NdR4GyAdQzzPkzQsrEJc+j6vXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2r9W5bT7ryVmKl12u6Iit2THDFcaW9M3cPN513F9ug=;
 b=ThmDP1hgV1oycNzFKYOhkX64hEXC/qdc4ZHBaOIZZFgmrByHxdfh4CJNz2P7SSVLlXV1NJKAwMaDBolJPiNQyT0KCwve7LUUdO4SGgvWdes0OlGPIvD6FP+DEVwNGOjNFLtUgS+rY9JGw0Jkj/8xOE5OxJsjgx3GX2j7ARWk19pRiJTj9aMsMLtIEfnzqM0T8zdrYUCNbqcKr5UIaZovpWNypYcYPwBotlHSj/VwmY6KGDEURyjuajZRAbJ1jE821xbw4/K3BFkxOF3qC2MUZQF1L8S/sHQio/DRMzKUDkxPlodV9Z8mKshfg93ly01EWpY0WTs6wl6A8jARe3mSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2r9W5bT7ryVmKl12u6Iit2THDFcaW9M3cPN513F9ug=;
 b=rI9FlYDE96ZPUr+k47fQ5pKlQ9EecMl+XMFSbm+jSgCwevONGWkhrHLJfPeFpXcqxwQU962nxR9iMUC10/kdIs35nz64Vkqwhqh8WdpSvJFQ3m+IhbtuDOtnxPqPv751IPilH96O5wCZjfjc589qEuNk6UNetCMbpEWM55p18Ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5324.namprd12.prod.outlook.com (2603:10b6:408:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 21:23:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 21:23:32 +0000
Subject: Re: [PATCH] drm/amdkfd: Check for null pointer after calling kmemdup
From: Felix Kuehling <felix.kuehling@amd.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220105090943.2434040-1-jiasheng@iscas.ac.cn>
 <3a1a14b9-3bde-ed44-ea43-42845f4b568f@amd.com>
Organization: AMD Inc.
Message-ID: <0c34571c-6330-9258-a6cb-6886b170e8cb@amd.com>
Date: Mon, 10 Jan 2022 16:23:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3a1a14b9-3bde-ed44-ea43-42845f4b568f@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:2d::41) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f61b852f-d7f9-4a1a-89ec-08d9d47f738e
X-MS-TrafficTypeDiagnostic: BN9PR12MB5324:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5324513FF1FDE2263938DAF992509@BN9PR12MB5324.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CrLVTuYtjLc3vyOqJUarCsf++j9cPY3uGIvcCkymKSfxx7g5gf0tSyR9xeAL7nNWMpUcQXoAGfVidIeNqa9+OZVd4a0JkgWqe36vW1zu5gQ0dOIk1CAurNwE9g79vjEWpzfbQiik4zGd6GDAmqsVNBS0AhfMbgb3JmV4BY0lnlS403SMBkqbxRuleARgDG4vuzJgJIwL+lbsJw6eSUgSXoq2osaPW2/BFEGpNl5noCWpEux3/NbglGBSspOzTQHJyGJu4l75md9dZm2nKCqwjkmOCah3EohPGdS5eXqnDGxTnCg+ssNrtdVGXBXZ+M2ky6LFSMUxgrVZ4duOELmdA7R7YACswNkeY80dPql1JRNdUjPDOadYuLKK7ZcuOXj9mAUTvL7wyhQRvRs8OaMWyEi4P3omFGifHwAaYBr5U0iIzYPGjXZeuhbi6uI3u42oOBZv42YJG6DgApdMWNYZybY2yoChR63rJu013z+kpG7+aCpz8QI8R9pg2htY7GcbmEwttuYhqNrHgdS54m79C2lowxRV3tybP3HvXK1zARvKQzIqSeQVzUvd4bmsWrwqmI/Fz0cSpl0bBgRvsEDSvT5BL0ce/mRe0LOXAxcLG8D6GkJ0pCRQQSRnxfleeofJDjDIiunM+r0dRNgfka4mnqdlRItUQwk4b6MVf8YtBBrdvcy5Keh8RiNFBLnu4JmR/7GwkliLWfLfD440KPdi3UZ1cHI0cclw4pYmtmW2i+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(66556008)(66476007)(66946007)(38100700002)(4326008)(6512007)(31696002)(36916002)(83380400001)(6486002)(2616005)(6506007)(316002)(8676002)(2906002)(5660300002)(8936002)(44832011)(86362001)(31686004)(53546011)(508600001)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxwa2xlYndOUWRFR1c2OStaNEI2dXg1cmdTcVhVZnhDNkd6MzQ2RWJEMlFJ?=
 =?utf-8?B?YThwTkptelN4NSt3dFQwQmNOOE9DSk4yRTRnbDRMTVZhMXh3VzZyNmMwR0dE?=
 =?utf-8?B?a1pVcWI1WWxVck4rZENIdEEzcHJzMjdYMERST1NUTmV6SU82dE1wQU9TV2tS?=
 =?utf-8?B?QWw1bW43djU2Y2l0ZVk2YmtwVlFQQkN6dHQzSWwzUHpCc25maDhWc3ExQ1g0?=
 =?utf-8?B?V0FHNHVQK0FIS2NvaTFsNHdWdTNxVGthcVl4bDZRWHI3bnVOdVVobFU2UFpD?=
 =?utf-8?B?NmptU1hmRUpQblNyMGJPaUs5WmpweG1WeTZpMjBnODZSR1NudFUwcjVCWFZL?=
 =?utf-8?B?VWYrVzROK3ZTWEtNOFlkR1JyU1lVc3VlY1E5Z1d5SFBsaCtKaThnUlM1c29m?=
 =?utf-8?B?NVMrNXdKdnpCVUlMMjlzVjNuUVJtU3dPYk8xdnpxeXJLd3dnZE9Pd0FoaVZR?=
 =?utf-8?B?dk92UitCeWFXYXp1amVTMlR3YzVaeGROYWdUc1lLampOUnhTZ0dTZHRqUVJH?=
 =?utf-8?B?SVN4NVUvVmNQVFJtTGJER3BUR3FMby9ZeG9EZ2RqQmp3Qkc1WU8zNVJpSjFS?=
 =?utf-8?B?NER3NW8yNldDeTJHMUR3NW00M2dnVFhjcWxyMUdFekRwcnd4Q2FjemVGS3o5?=
 =?utf-8?B?aVc2ZUcxZm9yNUNIN2dQY1crTldxN1BlUzlWd3R5OGdIWXEwM05FUmdKNDFL?=
 =?utf-8?B?cnRYRDdzTmtuRmk5M25wR2lnMmQ3S28zOHFudkNQR0piNmJBN1llQnAyZUlN?=
 =?utf-8?B?WlU5STNJa3RwbVI0ZE5HT2Q0VFVWVDFBYUZpM3RJYTlWWElJOHhVdTRyMHVa?=
 =?utf-8?B?ZStXRUFPT0dISGgycFhwcHR3SzRWWmRnUjNobzVRbFRmMkkzWmIyNnlUQmxk?=
 =?utf-8?B?VGJ1b1BxaDN0SWFlbkpYdzNnRmIva0tLMHJaL0F1MDlnRnFJU3JzSTJ5NlJw?=
 =?utf-8?B?K0JOTkkreWpRaGxPV2ViSldzVWdRK3orczVudi94K3FMeFlINkNnMGY3OURI?=
 =?utf-8?B?VHlXUVJKYisvNFQrUkpHMDNlWis4ZllTeksyQ0dEK00yYm5HdUk5aU5Rb1gr?=
 =?utf-8?B?RWMvekczNXFWdTJ1ejhEUEZwTURFVm1ucVc5QTIvK1RhdmVKa1NLYytaVk44?=
 =?utf-8?B?eVJ2OFFlVDZKak5zRTQzazJrVHV5ZWs5dDQ2VWNGdkI3N3VDaVFQK0dvUmhV?=
 =?utf-8?B?am5GYnppNTk2T2h3TGVSbGE1cUI0SmI0RmIxRHRmRjFGNFVDbmFaYnBjVllG?=
 =?utf-8?B?RHVTd2xReVpVYmRzbnlZM3k3U3pRdXVyZVRkVE00cy9CNlF6VjYwamlUdVhX?=
 =?utf-8?B?VHFHRDVKWnFkbDM0eVNGaEZYSHRPSWEzQ1VNSjdodnc1b3c0WENrYk11aG1P?=
 =?utf-8?B?ZnVQU2FXNDAyalFtNkdmZGRZZjNRNkNadjYzNFRXWUJjNlVsZGJUVit5KzZR?=
 =?utf-8?B?N3V2SGViVjdpNG1XSjFHOFNnN2c5WnFqamM5VmRidkRTWUFLTVFGUlhNZUJp?=
 =?utf-8?B?alNoVjRWSEU5TDBYbnllREtUZ2JEL3VQMVcyTm9Pc3VCT1RiaXVxTGFYYjFP?=
 =?utf-8?B?UlRmSDBYZVdZci95YTVzWlE3M1ZqWXNLZmVhSnVVMzUxYVYzaHp4STNnaXJ4?=
 =?utf-8?B?Wk0wTWJmd3JLdkFhbmhBd05ZSTFnTUNHQnJscjduMlQyTmM5SVpGSER5bFVi?=
 =?utf-8?B?NnhHcEJCWVpRbTQ3TVJkNWJoSWVTVUZwellLK3l3QlVnSEw2R3d4ZW1GQ284?=
 =?utf-8?B?UkVscElqdzg4b3dqYytlaVphcUdWaGtGNS9HQ0xRNENWR3dtOXFPSDQzZERz?=
 =?utf-8?B?MGFRNDN1Z0prR3ZwRGtCMGI0NExzSjdjQTVEV2c3ampHcnNvOGh2cTNSbGJK?=
 =?utf-8?B?cEE1aW5HWndocTgzSVN6cENvbWNBd21vZTBldDhYZ3krWkZVSW9TVDRCY251?=
 =?utf-8?B?ZnVMUUtleDRYbk04d3JsbjhWR1FRS2dZYkJNa3lsUDJtUjcrMUMyYzh3d1JO?=
 =?utf-8?B?OHQxVXdGN3lJYUFwRTNWYmtNT1ppN2xGenYxTFRsOWtLUkhkc3JHNzNWQ1Zm?=
 =?utf-8?B?bXhHcDBDUUxTVEQyZk9jVVYwMVZ2U29JWDVCdWhoR2NGNzFIK1lhUG9Lak5S?=
 =?utf-8?B?SGF6c2liaUJxVWR6MlRnTjM3Qm1JUkZBU1lEc21WK3lBcit2L3BzL1o1YVpa?=
 =?utf-8?Q?dxaus3jp54WXxMmJ6iqnQ14=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61b852f-d7f9-4a1a-89ec-08d9d47f738e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 21:23:31.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eICdgBw+0kL69Mz2jno5FEibPoN60nFNrP78tG5lmgbefXWCbM/9qndSPh1bl1ZXgyva+LX6zzrCAlo2yhlIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5324
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-05 10:56 a.m., Felix Kuehling wrote:
> Am 2022-01-05 um 4:09 a.m. schrieb Jiasheng Jiang:
>> As the possible failure of the allocation, kmemdup() may return NULL
>> pointer.
>> Therefore, it should be better to check the 'props2' in order to prevent
>> the dereference of NULL pointer.
>>
>> Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
I applied the patch to amd-staging-drm-next.

Regards,
   Felix


>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> index c60e82697385..d15380c65c6d 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
>> @@ -410,6 +410,9 @@ static int kfd_parse_subtype_iolink(struct crat_subtype_iolink *iolink,
>>   			return -ENODEV;
>>   		/* same everything but the other direction */
>>   		props2 = kmemdup(props, sizeof(*props2), GFP_KERNEL);
>> +		if (!props2)
>> +			return -ENOMEM;
>> +
>>   		props2->node_from = id_to;
>>   		props2->node_to = id_from;
>>   		props2->kobj = NULL;
