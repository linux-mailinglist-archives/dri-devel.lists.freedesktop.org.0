Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAD8C8825
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5487D10EEF1;
	Fri, 17 May 2024 14:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WNabzrUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A7810EEF1;
 Fri, 17 May 2024 14:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP3sFqF90e4cp+Vv2YYNabIFSrRXjUgcJ7+dT2AxWOctZ4xttQMVTQB78FurDInTPDyESeZV4K1OAv6+oiQJRXlprnYoR+dSuHN9jbALsRfY6K7o6CqcIYifcrQfF+l/lFVl7Glwj6sbGEV5p7XbsQaf8oO0GVzXW/U+h8Faybhy3lTkQeRc98TZSQAYYGYuiJR0Jw/7KwnxOlEOD7HoEZ/VQMLWsZ8Be+QO5NzcJVoWKPaq+2I1p6nFKZlUiVpL5YqtIQyELAkqBExNhYcc8r90Xi0Yqni3HxRUWoWyN9M8NJ3sAK+U0BRXoANPrAJlmpAQmq6w2S3Z5mb1fUkUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUlwpOF9EVEzR1mJHu0Suv+TYAeDObZIZX+PTDL3Bq8=;
 b=EDcVsKWSSaQw5oMccqMbQvRuw0iL8wev4aWlk9YQYDyTWJ4lWHFIhdDJNo9GD2haeOovx01IuMYlMp2gQ4K+N2Hq9FawgjhETutcoq2uJB+FMmy0FkU9bwJkGbwx1o1yML1hRxD5ljIGol4foW9l5JPjVGSOJ+EBZAfTOOlE2YhY9d7iAmqM02zrTlzTf5UbIHM/X7hDjcflggumoDk0a3nC4wtNywsV5VGRtEcWenueLJ4Mcn14kSESqnMcfc/YncTgslSu/kdfqd9dYh9lWUQegzPFO3IOiTVXay/iMC4xbG49tjMyXUnM7whYygg69FJt900nS0bXI4oUnCAhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUlwpOF9EVEzR1mJHu0Suv+TYAeDObZIZX+PTDL3Bq8=;
 b=WNabzrUA8pg7AgFy6oc29rTFkZ6Z0nd4BPyTteQhaDujhTOoCQKzLJEuhJWFyPAOAZqeyzxds8RSuAcvbQHwANHurQGQZ62P5dfsWhvWgFjgPMw+JNLkzfekTTmyo6NCtoFuMRyYewSdhef+MsWMtOeieB9UV2yuhC87MvSfCsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 14:34:43 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 14:34:43 +0000
Message-ID: <f739b4f9-9c04-41bf-9ebe-fcd933baf698@amd.com>
Date: Fri, 17 May 2024 20:04:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/buddy: Fix the warn on's during force merge
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com
References: <20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com>
 <24ed2c40-99e4-4d8d-9cf2-1e1c4a1560b6@intel.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <24ed2c40-99e4-4d8d-9cf2-1e1c4a1560b6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: ab001446-fda9-490d-061b-08dc767e7deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0RkaDRmNHRwdU9ZQmpySjVpSTBMcFJGUFFlMGFmU3FIUCtZekhMNThxejdo?=
 =?utf-8?B?bGdkQTlTeHhCS0hVV3VOZDFOYkIvdXBWV3hkYlRqNWUyY2FWRFZxRVcvTjY1?=
 =?utf-8?B?QUt1ZTJpRXdvY1VwRlQwNkFBVk5ubFJnaEdHNGlKamNsMlU0UDJHbFlGanpt?=
 =?utf-8?B?eDdqSkJpVVVILzZWNkUvVWY5bXRadmw2WEYrTmY2K3J4Uy9iczdRdyswak9P?=
 =?utf-8?B?eFhWbzhncytvWnE2TE5pTWM3RnNFaXZvRE1zdVU3WlNaM2FOeUhBUnNrSDUx?=
 =?utf-8?B?YU00WlZBTDFSdDJjaks0a2RIemJSbmxROCt5OEZpcGVaRW4zSGFTSGxHZDQy?=
 =?utf-8?B?NFN5OUg5SkY4bVdKeEh4TWtxNGlhUXRhZXd0VW9vTDdWSm1VQzc2YlJuNWZk?=
 =?utf-8?B?cFBPejNBQk5wUVJrOEdsQ2Fnd0x0dDFveWE1ZUNRdVE2WEpjcEwrRlNmOExP?=
 =?utf-8?B?NldpanpiaXpyQm5mYnV1bTZxbnZCc2hLbEs3eTlTbGhRWGM0TFhRV0ZmV1M0?=
 =?utf-8?B?UjJaY1VIb1RsTlp6SnZrNlE5dU5lZmRTbHVQQzUweXhhOU1pUitmRXpzQ0ps?=
 =?utf-8?B?SC9VQmpjNy83aEhqWDJMSkdOWWpFbTUyUWM5cFpaNEgyenRVSndZTlFiQnhn?=
 =?utf-8?B?UVZSWFVSS0E1WHpjQ3BsdEU2RzZ5SGl5d0hsNEdWZmgvV2hRT3BoSGhSTTcr?=
 =?utf-8?B?WExtYUhHamREbkxsN3V6N1ZjZmtMOWs2dlhrK0RzYmVlalJ1Unc3Rlc0bHdn?=
 =?utf-8?B?UXl2b0JISEszZkI3MGFHTno4cDQ5ZXIyTmpmY1BCbTU3VHdrUWgrRk5YNFJD?=
 =?utf-8?B?ZTdUNGtFRFZaZ3NnSFZPZ2hMck9NSDRFVjV4SXJ6MzdQK1F3dDJrRVpoTms0?=
 =?utf-8?B?VDJjSS9qeUtvalY3RUpnVzZkc0p4cCtuMGViZ2oxeTVwVzh2eitVU3JCRy9x?=
 =?utf-8?B?T3FtN2JnMUFaVWh4c2tZSm9WcWJlU3d6Z3JmR3B0RU1WdDZWenZqUHNWZ2li?=
 =?utf-8?B?d1ZQbkZaK1NtemlSRW5Ndkd4UFZzcFNwSWt3RnVvT0t2VWxhSGloRHk5NEtk?=
 =?utf-8?B?NDY2ZGh0VmxSSU5DV1VDcHhjZUlacy85eENyd2R4WFR1RkRNTXZEbGdEY2Jo?=
 =?utf-8?B?a0drT1UvN3dMYTVuSEVKbEFOTXlzZklpbEJKMHhsNnp0UVp0S3NlTG1PanNT?=
 =?utf-8?B?ek9XUE50NG84SjNhNThZVXpqNVhHTS9LTW80OVJ6OUZCbWllc0ZjNVVKcFF3?=
 =?utf-8?B?QjBzeE05bC9OSUpxdTVNZEw5NzFrT0c1OTY3UlpjcUVhaHNsK29CNnhXS2lD?=
 =?utf-8?B?MmtlM0ZnWmVrS1pTWkhmZEdzbEpXaVZEbDd4ZWEzczF5NmJFQmZNNGFPOEtI?=
 =?utf-8?B?UjFzcjF2SW9FR2l6blFXZlFMTHRPRTdpRVJad1c1dGJOK3lLU1BDVmd1UVRF?=
 =?utf-8?B?YXhjbUNzUGlqVUFqcUhvakVPZkpvVnFERG5Ea0FkbXM4Yi9oNWN5Q0xjREZz?=
 =?utf-8?B?Y2daQ20yNEhvdU1SQXBDK3FOVGhhQWM1bWtWNUNraGJwbjlDRXNLdHV3Z2t2?=
 =?utf-8?B?Yk1Lc0VINWJiYm5iWC80SDdudmRjR0xmWmR0WGYvazZXR2duUzRKZUVhT3BL?=
 =?utf-8?B?dVNIN01ZNmNidVd5UnhydUkwT21UZGI3MlUxRlJNQWl5RVZXZ0wxK0tjUUMw?=
 =?utf-8?B?YW9LQUhKMk51NGxpRVJUMENIeWpWQ1FPeWVpRW5EWURPYmVBWTl1cTNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVR3dzVQQjRxVE5iWms3SXVJUlovbkVHeVgrcGhKKzJFZlE5aFI3THRtWFJv?=
 =?utf-8?B?OWEzU3FLUm1GUUtKLzdEK2I5aDJQTWhqNWJnKzlVTjRLRnBWVW5oTVJrLzRp?=
 =?utf-8?B?bmEvSnRSQmV4M2l4aWJ6SGlEOHpudTFDSnI2bnZpSWhDL0tzekhuM3dQb3Jl?=
 =?utf-8?B?dmNYSTR4NmJVd2xRVkRPSVFCVWY5Q2NONVhGcnBuNXhDb0duVUtxVVNpcXhx?=
 =?utf-8?B?R2xoQ0VyY2JhdHY4N3hUOHJOQ1hxYlQ4bDYxN01vZzRZeDdtZGdVcWVuVk9B?=
 =?utf-8?B?TGtCbVFuVlBoenBpbUpvaVh2cmZJOFdTUzVZTjI3cFpPZzBjaVFtcjR5SzQx?=
 =?utf-8?B?MkswVHlySTNTU2FpMkxYanpZbllUWkVDQlRWQU5SelJwY2xkdDQvT2pUa2V0?=
 =?utf-8?B?YTlJVnhFZ1hONXJjWXhuR2tXQVhZUjk4NEVtZ1VGSFUwOENmVGZtQXpMQ2FS?=
 =?utf-8?B?YUdMc1JTeXRuQ3JDSmVrS3I3bnVNcVBzazBVNi9QdFVLSnBzQXJ5ZSt2NitI?=
 =?utf-8?B?TzA3dHRBZWpyN1c0cVFFaUI0UWYzNVp1N3FQb1NYanVoTEdsVURva3Roc3pO?=
 =?utf-8?B?YXZrL3lML005SmhoaitGSytPUFRyUnNTc0lMaVVKY2VzR0o1b001NE5Uckc5?=
 =?utf-8?B?TnN1VkJhZkNDaW9nT1FmNGh3aGVDOTNQL09wQ3c1Ync2NTZwZUJaV1FOTlRI?=
 =?utf-8?B?RDVvbk93TWd6Q0lreHVQUisxNXhEeit3WXp5bm85NGJqUThBdjZlanRqTmVJ?=
 =?utf-8?B?SGwrNnNMTnQxZjcvbE50bnBjOWtwN21pZkx5VU1ZM0xRZWVZZEpaNVd4a212?=
 =?utf-8?B?azJVYksyQXYyOG80NFYvODY1LzZpV1VOYzBFcHhYcjZXaVorZzhzeHJ6YUJ2?=
 =?utf-8?B?TVhHL1N2cXhKR3RpbjdMT1NGK3E1U0FDT2g2RldvV3pLM3BIMW1RMENGV3Bz?=
 =?utf-8?B?Z1RHZjRHT0NnOHVrZWFpTWE1MEgxV2ZBbjIwOVEycTR3VCt5NWpGM1o2VktD?=
 =?utf-8?B?K3FRajQ2RndMemNNNW9CWVJaejZwOFJXMVdlN2Z5OFJQTk5jRWZub0dzVFQ4?=
 =?utf-8?B?a0FEQ05kTmM2Nit4bkQwRStuUFRJQUo0cjNia3g5aTF0VUFQa1NCU0l5NzhR?=
 =?utf-8?B?WDArK2ZiSFMzbEJLeGJNVVc2cDRkM08vOHVlSHUvcmVDcDZSTlYrR2g4RTNV?=
 =?utf-8?B?bFNJWnZSeE1vdTdLb3JhUEtCY05hNkQyb1RJamF2Rk4xTXg5aCtEcGllMGV3?=
 =?utf-8?B?RnBWV1U1SVlQTjhRYWxOQ2xVRlJZazFlZlNlSWllY053bXVqL2tCQ3hIZVMv?=
 =?utf-8?B?N0ZiOFFhK2xwd0hOYVB5WXFBTjFPZ0RYcW9QdERUSTFoT1RuTDNpVXc4ZVlp?=
 =?utf-8?B?UVZmZDd6Y0xLQ1VBWG5zT2thTS9KS0hRTmYyWFNpVFZyVWV4ZEJwYVZITWRp?=
 =?utf-8?B?UXRzOHpZb09XT0dYTENpRmtWWTg0T0hHWndPRWtDMG5SMjR0Y0lNb3JMVVYz?=
 =?utf-8?B?MTM2b0pPYjQ0aVQxenNhZnhzT2lZTUc4d0FxbWxrMjIyR2JCZFdOcW81cGp6?=
 =?utf-8?B?bmU0LzEwVnd0WkpRUWl2eDFnMEtPM0tMU1l3ZzZBN0MxN1h6Nm1ER2lVeitq?=
 =?utf-8?B?bkRzQjM5NC83NDRwYVRDY0d6eTBBNXVnaHB3b2E1dDFrNXVYSmpqQzlxdlV1?=
 =?utf-8?B?V3pBVkplWHo0TkJJK3Z2d2tRdlhNRFVkcmZjUWRKN3duRmZQUDdQbDdCN2Zr?=
 =?utf-8?B?cEhxaVVqeEdIZnMyQUVnOGlKQVRSZ3lOeHZpbmh4ajJkSmYzdkxCcnlIb0tD?=
 =?utf-8?B?WHRpOTVabXRiRUdJQ0h2Nm5lcm1JeTVQVzFvUFZCRTJnY2k3cVpzaUcxQlRU?=
 =?utf-8?B?c05vRXdmVFFoOWhZbzJhdzZLQkJMMTBCTnFDSktqRFVYTGUydXJsWTJJZDRu?=
 =?utf-8?B?OWNxWjRGQmlZZ0xweHg1TmhKQzhUOGxlZ1VqVGRYbi9rSDhzU2d4aTV4WDdR?=
 =?utf-8?B?Z2F6TnlqdVVwR3hxQ0Z2YVZvU2tCZjAvYjlNWkVvUVBBd20rLy9Ra0liWStG?=
 =?utf-8?B?bEIwV3pCekhxNGhnbm1ra0tYcWhKWnZ0T3h3K0NDdU5zdURXd0prWVF6N0R6?=
 =?utf-8?Q?EAAWMfvsA9G1FDB1SxNC5+Yn9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab001446-fda9-490d-061b-08dc767e7deb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 14:34:43.3328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 065PIkJ1wjwqsesSKfxcPDRIptdm44KhAbDq6DW7Z1aZlKpPwTlEF/AWCu512wuE5WIknlafrp4v9cGSfKitYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
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



On 5/17/2024 7:30 PM, Matthew Auld wrote:
> On 17/05/2024 14:50, Arunpravin Paneer Selvam wrote:
>> Move the fallback and block incompatible checks
>> above, so that we dont unnecessarily split the blocks
>> and leaving the unmerged. This resolves the unnecessary
>> warn on's thrown during force_merge call.
>>
>> v2:(Matthew)
>>    - Move the fallback and block incompatible checks above
>>      the contains check.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> A follow up unit test to catch this edge case would be lovely.
Yes, I will follow up on this.

Thanks,
Arun.
>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 1daf778cf6fa..94f8c34fc293 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -524,11 +524,11 @@ __alloc_range_bias(struct drm_buddy *mm,
>>                   continue;
>>           }
>>   +        if (!fallback && block_incompatible(block, flags))
>> +            continue;
>> +
>>           if (contains(start, end, block_start, block_end) &&
>>               order == drm_buddy_block_order(block)) {
>> -            if (!fallback && block_incompatible(block, flags))
>> -                continue;
>> -
>>               /*
>>                * Find the free block within the range.
>>                */

