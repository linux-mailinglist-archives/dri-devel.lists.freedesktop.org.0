Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D744D1A2F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D505610E5CE;
	Tue,  8 Mar 2022 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3B10E5B7;
 Tue,  8 Mar 2022 14:16:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEQt9jXSt6RAaOiEOcaaFzgjpP+AdbQPT81TQxPw8Hd21E4ddAaN9tqQjSPa1rFlDOiAeI7OmK0CExisW5V2w2g4fy8ZnQY2tDZWxas/4Gy1m+Sba5vjVc3Mfj54/P1BaTi2Ajd1G5gQOkGfz3/E8jeBQf0/C23CA4qxMDWdJVa0kt4MUDqFS/iEqpLOn5bCM1jqcUsqHlBP03Fj665slhkBBT7M02He3mlu4rBiMsaDVUrwwhpKveHJ2nougFXBPQgpCYAos5SRITyQA/x83jK/a5GrODjObZGI8aDvn8fj3MiLMbwZwGoBXRzcTSZLTiSV7fEyFQr3jllUy6cAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjGLw/2g/0nXPm8aOunRnBomYkOfQNuh59pBCgHO/Ug=;
 b=hOieOGW+rvv4tp5R6/L2O4UXmiFAsEaOyea9pSaeAnGjGgVlFuCcpI7EXd8T82K7Z3Qr0fsTxpyJOFPWp1YydV0KRBYTP0Cb0C0cqnHWMdoohmgKcG4wZd/FHmmsUR8P8oiJTsybA8i/hx4KOhcpaqlmXVXK3sfBkeXiskWazs0EOT1SHys0wIDlk9eGvEX/WOZNXMDGy8pbLaOCPavX8bS/LnJle5MUXjGEQs8sjsNgfuaZGYadzxZzExd/g1XAkBNSknoxZ/nsCnjLCZiWLNnYEVGBbJohK2iy7REUHLJ4nKHZU23Z8M9ib12uOlvgFHX55gwQ6P+UpFuIVDVDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjGLw/2g/0nXPm8aOunRnBomYkOfQNuh59pBCgHO/Ug=;
 b=KQ6WriaBKH2Gb3sVfFKwVeW+roIXz0sVYwjHnTrG/qkz4Qg7leCfO2w+mlbxWTjeNvxwml4nUpQ1l6cmsLOHTicwg1O0ic4DVi/fy8SgEFppARoO4Zk+zhhG4ZRkSI3fTwUfUHmn4nC+YMwf+jVUskrIbl+qgt/+MVqEH8r8Ttw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:16:30 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:16:30 +0000
Message-ID: <e2c7f60b-5ee8-d52b-9b05-0b13c41562ef@amd.com>
Date: Tue, 8 Mar 2022 19:57:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
 <841ff816-b93f-34b3-4868-364f2943c039@amd.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <841ff816-b93f-34b3-4868-364f2943c039@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::26) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ceaaa5-88e1-47f1-e927-08da010e3daa
X-MS-TrafficTypeDiagnostic: BY5PR12MB4131:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4131325C10A28A4627EB3D27E4099@BY5PR12MB4131.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FqJNWEbwnQQCI5Npg5+O4rWsFB+gnO+/XHjQQIb46qd7H4uVwGOwK3/rVJ9tQ92MmMdjqESIXQXcio0k2oMwgpxsyS36YzvAn5MVQlUYISo5HO9aDHKphqnhh7WvhQNUSCRGl8M5Evbnm5YvCRP7UgxEDWL//rA1tfQY3Q+X3zIQZ288LBtTn5GqQFNSeXdc1aPdtmQutsv4Bu3KCfg2ZI3EmZeV0pmj6aCrynESX+ZGK7wtTzUVcfWRoi91Bd24Y++TVc8C12Lyw8aAcHoARPmQ/uXV0uzazsGmfzoUBrdDqejG9GrWojCbidIrFP/ju9EzL27WEh73xy185ACNMc0G46KM29isFjQ1mb84FRXR3Xx+6UL665nHIylq525ZvlJEdFGcRwFbMrkB7J9EqOqxh+g1/UJ5oawkLtDDgvnZytI986UZzSw+laVOCrZQwJnl+1oAnToMf7L/lHmEG11XNCT1NNmRtuQJ93iUOm2Pcvxri4zx8UVjcMfVxE58KbmzcxY8eOmClgt4EZue88O3BNXkOr3JJ+5E1cZM2JtuNl7SfREoGLg8CCH7uWJ4MBlN0Q5y7HB3k9Z3lbRH+2f7Hj4ND4lqtHeIS20KkPLvBI4yuoqE/LLOcCCqmfeKrbRfni0tFqkr3OCSmchHIoC4o9oB7dFWRAAefltBRrPDKyzBG7oq+o+2CN1GuwXl96AKdCK5RHwXeX5k1sGsIKwG2bLqeKE0Ww4CH1ZID40=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(316002)(4326008)(53546011)(66946007)(8676002)(38100700002)(31696002)(86362001)(66476007)(8936002)(2906002)(5660300002)(2616005)(6512007)(66574015)(26005)(186003)(6506007)(6486002)(6666004)(508600001)(83380400001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NXUzBnT1FNWjZWQXBSRmpidS96cktWNGQ1ekZnMUwxd25Od1d6SUFtRWJn?=
 =?utf-8?B?d2pZWVNZU1VRNEVlc1pkcWxiT1hvZzk4MHpoM1Jjak1GL3NTNHM4VEhrZkpT?=
 =?utf-8?B?UG9QNS85aXZYNEwyRmZRWlVNd2tFeEpkSmNYY0ptTENKT0pzdkpkSW1pUlE5?=
 =?utf-8?B?NXcvWm51NnQyR3NNazNQZTNvVGxpTXJOWmNRWFlKT3pobkkxSm5mTnZiSnJN?=
 =?utf-8?B?WjJ2WHdkRldXbzFDclFpWGVaUkJtK24zV3ErcU1sT2w2TXpMUm9QRWxJdDVL?=
 =?utf-8?B?SEdQbWFVSjFBU01rZ29ZUWVTN2duaXYvV2J1M2hERmtPOUpMK2JGem9Ddmd2?=
 =?utf-8?B?ZWRwd3BsbUJtUlRKZE9wWmlXUHMveGYyWThWb1lrU2FQN1Q4OEJ2S016djQw?=
 =?utf-8?B?aWlwclU3SU1aTlMzZHBjNFEwYk1CeHpFNDF4cUdmdWd3d083ZVcxOWRCR1JM?=
 =?utf-8?B?M1lGMS9ObExMd1lwNDNaMUpSNHI1eVkyV3gvUkIzVGd6ZVJEUGFjOW9aTkZR?=
 =?utf-8?B?MnZZaGxwR01xVDRDYjh6VnhiVWJ5M0FVZWhHN3VrOTFhMVZ3bG5mMWJSSG5n?=
 =?utf-8?B?QThZMVhna3ZVNWJMcG9ZZGNNaVpEZmNRNldFVGtiTy9ic1h1TFJoczNwY2NV?=
 =?utf-8?B?U0NBcHJsNEVrRE1YSGN1SStTd3pLVUhBOXp4QzhTblV6VlFmaXVZaXBMVUZX?=
 =?utf-8?B?R08vYmFvd2FuTWhBcG40NjRwN01xOXYvbjZqRHZpOHhkektacHlBVFFBYk40?=
 =?utf-8?B?RytlSjY2dnNSenkxRG5xTTRsUVU3YktteVE1VXFYYnZWdENLMnpsZHMxQkhZ?=
 =?utf-8?B?SUVkaGVyWTYydkI4eGM2bzFhS051WDNpU01wUFdEeFlCSXhJOFlqb0MzL3k0?=
 =?utf-8?B?YzJBbXYrbWxTeHhOQjl4Q2R0b1lMTzltYitWdDBKWEs3R2ZibTVaQU9uTWx6?=
 =?utf-8?B?TVpSMC9UZzNOWnhkMVVxMjF1R2w4NnpVWFJYREJ2ZnRGb281TDZ2OXk2SEFr?=
 =?utf-8?B?TzZrblNpOGZFUUErWVdFV3hTTlczSUFxQitoWUdIYzIrMFRYdlFoVmRsRGhH?=
 =?utf-8?B?ZGNrVzFPcWpuSFJsejRJNlFOUjVoY2d0RUQ4Qy9xRENYczFLaVVqbVJqQ3J6?=
 =?utf-8?B?MEJ5bmhvUTBmUmNmMDFrcHBIY1JlQUUzS3BZRXRHdWh2SHlLYnBUR0RWWVp5?=
 =?utf-8?B?V3diVkxTRHNKSzIyTmV1bmNhbDFZV3BWZ280Wm4zdTlhZ2NCd2V4VVlPUzk2?=
 =?utf-8?B?OWlxMWVoY1RPTTRqR0VOZW4zWnN0SFM5anY4NDFXejBEZ3ZJMEphb1plTS93?=
 =?utf-8?B?MTBRNmZINEhObDJ6UThESnM5VVVmZE90ajl0VTVYRFpZOXg1L2FoVVBQdTNa?=
 =?utf-8?B?RWhlS1dmV1R5a3VrUk9KcTh0VlBicTN1VTBXekZkbWxNd0w4bWM5SDVoM0hB?=
 =?utf-8?B?Skl0R3ZmQ3pWTXZpbHdsa0w2Z2F2dnpJOU5MOEl2RXp5ZzlZWGtZUjkxeUVJ?=
 =?utf-8?B?b25WSWFMTVdYdGcyMnliZlBSS3daYk5mM2dIQjJWM2RYeGcyZHh4TGxGY3pZ?=
 =?utf-8?B?VWJEbUV0YkppZGZmNm1rcDQzUXlCVFJpTitOY1g0QTdvM3ZyNWZnNkp0Vkhk?=
 =?utf-8?B?SGVnN1JuVThLM3BxcEpZZXJFVmxocVZmbGdjazcrTENPOUp5S2JpSWlYMjFx?=
 =?utf-8?B?VjhHbWJXQW1aN1JLMkVQYW9ZNk94eXB6Z3dGQ25qYzdjT3J3dkpmblFlVDJy?=
 =?utf-8?B?ZXhmMUhHS2hMUGFXMGZzazZyMklOYWZsSmdqMkZFU0wvdVBIUUJPbVdUMUpI?=
 =?utf-8?B?MUJwRnVIc3VXTU1JWUVXTGRMQjducFF6MnNQVFRFUFRTMVVVRjVrUklFMWRS?=
 =?utf-8?B?VVNNNU45MC8zQk5zdE5RN2FuNTFQTnlCZjRrc1RpZ1VMQXdBWW5BMm9qQTZN?=
 =?utf-8?B?bTcrT3ZKcmNCWWNZbUN4dDhseS90dXdsMGZEWVh5eXBjeHRwTnE1UmNYdk91?=
 =?utf-8?B?L3JnaFM1Ry90eHpYYmNHbzJMOFhzb016L3NYam1nWXBGT2xsbFFVbkFKZjdq?=
 =?utf-8?B?R1ZNUW91QWtQVXBna0xCVWNONEdtbm1iNkQrR2N5dnZ4YUo5YS96RTZ4cm9s?=
 =?utf-8?B?ZXpqUG14MzZsTW9nNW1KVE5UMHRyUEREcXpKRzFKcDJVTEh0NEVWZHEwVmdu?=
 =?utf-8?Q?gLcQOuPEm4ZeLjHwHnr34es=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ceaaa5-88e1-47f1-e927-08da010e3daa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:16:30.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VG5sloqzYSme1BWIHQBze9zUrPm/o3Udnk5zb/qGv6eMYPJFeV/CsYukkjw7mYXC5i9lwvV5EfQJACbfB+eN2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/03/22 9:23 pm, Christian König wrote:
> Am 07.03.22 um 15:37 schrieb Arunpravin:
>> place BUG_ON(order < min_order) outside do..while
>> loop as it fails Unigine Heaven benchmark.
>>
>> Unigine Heaven has buffer allocation requests for
>> example required pages are 161 and alignment request
>> is 128. To allocate the remaining 33 pages, continues
>> the iteration to find the order value which is 5 and
>> when it compares with min_order = 7, enables the
>> BUG_ON(). To avoid this problem, placed the BUG_ON
>> check outside of do..while loop.
> 
> Well using BUG_ON sounds like the wrong approach in the first place.
> 
> A BUG_ON() is only justified if you prevent further data corruption, 
> e.g. when you detect for example a reference count overflow or similar.
> 
> In all other cases you should trigger a WARN_ON() and abort the 
> operation with -EINVAL if possible.
> 
> Regards,
> Christian.
> 
ok, in this case, I think it is acceptable to use WARN_ON and abort
using -EINVAL

Regards,
Arun
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..ed94c56b720f 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   	order = fls(pages) - 1;
>>   	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>   
>> +	BUG_ON(order < min_order);
>> +
>>   	do {
>>   		order = min(order, (unsigned int)fls(pages) - 1);
>>   		BUG_ON(order > mm->max_order);
>> -		BUG_ON(order < min_order);
>>   
>>   		do {
>>   			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>
>> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
> 
