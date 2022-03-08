Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CEE4D1991
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4797110E77C;
	Tue,  8 Mar 2022 13:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66510E764;
 Tue,  8 Mar 2022 13:48:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoR6qiv3/ZRgnjxa43iI4vD2Osf1zM548jhdjV9PPCLif7WhKPExrZl7qRSGCgmWUdb2z6Afs1h+qlEoDtAUlVnRNFDnhQ9yCbbb1bLtgthgmkoQNQvuJR0i6j4jZLYwoS4ebUORq2yUkPIjSyzBv9aNKB5EzNIbK5rH6NWV4FAyDkA5KooUogbOQFLEp3yCTx8dA7GzHd4D4QKuwnlQVwkcaa6EDLYgAsYwUtTGlPz2Vv3f9FJB8eiDGr74gzm3/t9ZNL9QIII1DRzWki/hHq23cfsBR6NR+qefP3B0wowGi03984aaS5NL60h8n1uOyRuVdJDG2uoDEAOp3eTK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSKeaW8bjyTav1RrJyP9ZLqjOgoYt69iqPaqJC2OwPE=;
 b=nu/3ne0xcPfXmBRkIJyceFcSDsErXauFAORu7EAWku4YOPwr7UYdVanU0gRsaXcXDszgPDDZX3q6FwQgt2rXnPLBu47HRAw1ClKIXuoNx66Jmxv6WQkmxRhM2siE/9oWxbsOvb/KOXPEA7SqG2BwvqFs126Xj8iyW0uItyswk1COnA6eDBqUEUSJxJA+waqkZ0pp+aIALh4WSmkc56yXCCF1UqRnmyDPlfD4Yj87VrtHeDG8D3nAUcTLDPjHwe2RtxMBp6txtpZgzIu0Oe/AnpGGDLY9AM5o7QcD6yUkssFw2SrZEJhr3+ZhkFaKTczyG3bY+4+yqWWo3uW2K5jjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSKeaW8bjyTav1RrJyP9ZLqjOgoYt69iqPaqJC2OwPE=;
 b=OIklMy/vLCSRKE4PGsMUNwgm2GXlFDrBL5jlQeJavA0dANSrpx4Ey0Zaae2TqOdcThXOTIVyY3a/dS+rnx1qEO8RerdDNyFionREe/VWplKpQ2U2j/KsvHpNTfuavQNPAK81OAlWHJCsGl9ocV90OXWbjWg28318/MnWCXNJtQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BY5PR12MB3652.namprd12.prod.outlook.com (2603:10b6:a03:1a7::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 13:48:25 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:48:25 +0000
Message-ID: <1ff8a246-8df9-c098-302c-f73b4425ccbf@amd.com>
Date: Tue, 8 Mar 2022 19:29:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
 <78232c15-0d0c-3594-ab59-63560e63eb4e@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <78232c15-0d0c-3594-ab59-63560e63eb4e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::14)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a41232a-850b-40bf-f8d3-08da010a5142
X-MS-TrafficTypeDiagnostic: BY5PR12MB3652:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3652431259C95424F4EB3E34E4099@BY5PR12MB3652.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJSnhQujOAQ30A1zWExBKgWT8KhkwkpJ7ZZDbTaikknaJiDyLULeM5tkH+rvX4G/ft+Cpt7a7sR6ilqLvSMBKnBOha/yzQycEZGOwJV1n4owhk+hoT1cA06hfTO2Ex9+/e83JbsaWKGebwRqT9sAGyIyar0GAugFGC2FeEfJaW+8BqKSkUm+THK0c8FrrEvXnZAK5CC8hZ56T9HZVfLlITnr3T5HsLHqiabqt9h6NB9lbMJ8jWEG181A0lWS92itv1L9FQCgiR45NOGgHujhibHyuVZnEmUaW2AleVIBit9ujyoiPcqBqn9/JVJ2ZzapOyKnlMFVV29vKP2BvLuA+RNKel2nx+/5aIU6FfCBptdONU4id25uOP3/QbOXw0kC/ihcqgrXyv0N9qhGnHBVFpaaEott4+yZOWxWKHC9k3ezjKWGyii+G//9zWYGGySg80Nv/Hva8n8yfzDfmtsJr5RT9SABEH7G1NNrA3rSpQ+SEZGQ/X2Lqc6VKTyG9WvxwgTOiFFY4REA+tM9IE2DAZyTpUVc/TzIz1D6wXzwl4F+WZ0xE3/l3vSC49igcJ/ETYKA1qkXLPVwupzIaf9Xcn26B3ciHEi53wrW6aV4v9TooQORrb82MfbhXT8jVslAVWj8v+yvO+nhonPDzDZ+6miDm+BJZBtv0ArYtwep2riJXrJTgrrVnCOmtGR+XPitLptcEGIpRFyoBA68za39EDalz8+hf0ItewYE2jdkYAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(2906002)(36756003)(38100700002)(8676002)(66946007)(66556008)(66476007)(2616005)(186003)(26005)(53546011)(31686004)(316002)(508600001)(6512007)(6666004)(6506007)(86362001)(31696002)(6486002)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWRTL0dQNmUydTArTGxqbnBkUlR2NnFHbzY2ampnYUNZTHdhMGlrR1loNTA0?=
 =?utf-8?B?cDhxTzhOWk56Z0twZU0rOXBCM0JyTWl1QmFPQWV1a3JwU1BwN1NWV3lBanNC?=
 =?utf-8?B?K3YyT0N4Lzl5U25nZCs2QzVETCs2c2hUWkR3MUFReFA5Y0lROE9CWkZjSVB0?=
 =?utf-8?B?N1hrNG1SeC8vejB6ZVZNVnJHN1JzczlVcXdrb3RPRUFEZnBlK3p1bWVsZ1I2?=
 =?utf-8?B?WHZuV2dkRVNpYXlkK1VkWWZ6S0ozV2l6T3U2SlpBcVNYNG9CSVhVQTFNQlJs?=
 =?utf-8?B?Y051Z2VjUUV2MFluZ3QzN21FYnYrK3MxdWZjSU9pRkVpVzV1TEkyQzZMZHdG?=
 =?utf-8?B?MzR2NG1lU01XMlZCWk5COWhMekx1WmE4UjRyZFF3ZnVqbFZHd2xEQUdYdUZK?=
 =?utf-8?B?REY2cnRzVEw5VWZOQXkvUndjaTBzSjcycEQyOU54OGN1Y2pTUUVoNTM5T0hW?=
 =?utf-8?B?azdvWTVkUGQybEtiaUYwSHhSYkRmVndJUzh1OUJXdHBiSlVpU2tRc1k3NzBP?=
 =?utf-8?B?ZTdRMFF5M3phZUdxdzJmTUhlU3ByblRKYk5DbWpuYnJibmllQ3BBUHVEYzVP?=
 =?utf-8?B?RGRTZ2xPWXVmSk55ZDB6VnBpTEs3dktwakJ2dGN5RFdTZFZGVjUwa2pEMUkw?=
 =?utf-8?B?OVRkaGFvNVV1ZVNGamRoNCtZVGpmK3E3SE83dldoWmxXNWdXWXQ5c1hDVDhr?=
 =?utf-8?B?dnNOUTNjSTZuZ0pRMnVtRGxKT2ZDOXhyRnBTcTFrd0I0QnFGY0Y5RjE2TlFD?=
 =?utf-8?B?RDhuTlY5RGVVU0x3MWNJTFA3eGNlSE8yTUNRQXN2b2lGSzM0cGhjN1hZL0hm?=
 =?utf-8?B?dHFrbWU3QkFTRjU5cTkxM1EyNWx0ZStVcFFTbGhPaDJBbnJEd2NuNE53QzF6?=
 =?utf-8?B?M0lzVUpnQzhXYXpyVEFsTDZXMEcxRXpmTFNXdEdacVZUVndhTStrbE5QVzNP?=
 =?utf-8?B?czdDVCtMc1RnY0JyTTJidXRDdGRmN0NjSXRhVlZVNEdIS3EwcWZaRUs4TWdk?=
 =?utf-8?B?RWR5ZkwwdEhQbnQwR1YvT1R6VTVNdlBub212S2hkMlJsY3FLNzJ3YVJrMktC?=
 =?utf-8?B?emJQOWxRU3JsdVk4dTVKaVpvRTNzTWJhSFlZU1MwemQ0VFMxRFMrdHlSeUs3?=
 =?utf-8?B?YTJ4aVlqOFlxYndNak1GUkoyMEpNYVB4UlNvWUVNc1RFRW9RWkRSNUlpMEV0?=
 =?utf-8?B?MGx5b3lwWUsvYjJKa2oxYVpmejNnY1RaWkE1SWgyU1N0Yzhaam5taWxaTTdi?=
 =?utf-8?B?SmNvcW1wb3BjUkpQQjJvTU1VbGpLaUFsQTdwN1ZQaWVIM2EwU0F5eWQwbXBo?=
 =?utf-8?B?VVlSZ3hIZ09CZDA0SmxzRU9NK2YrVDVXWW1Zc0txSjE1c2ZselZjMUFTbDdo?=
 =?utf-8?B?OUlrejRXN0grc3RHOENmVXJDY0FNR3VFbEM2WG1MNWFsRGVQYzVxY2JjdzFK?=
 =?utf-8?B?eVFSNzlJSHdDRTJweGE3aUdZTlk3Tk01ellFajdKV2lHaFpDa0p3b2xqcFNC?=
 =?utf-8?B?eTJYRXcyUnFpaUZTdFZBSk9qYVAvUFFPb3cxNWJYZUVHclNIdW0yUFpjWnVy?=
 =?utf-8?B?eWptK2RCNVc1T2Ywc1ZHVk1Jd2tzSVFCU3NmNGJZS0JpVlowUUdpUE1lTFdi?=
 =?utf-8?B?RnhhSnNmS0NyZEVDRGFmd1ZhVXRwTFZJRXUvN1BaUmQ5NUovZWdIdE5MSkpB?=
 =?utf-8?B?MTQyc3l2V3Z2VnpvTHBrVmtkaVV5SHVwZmNKOElvM0I2K3czTGdTRWYvTmVi?=
 =?utf-8?B?eDJRSDd2TVZQN0M3bXBQUTFzb0MwOUFSSkUrQXUwNlljNEtUOStadm93eERx?=
 =?utf-8?B?aVZkbHlUZDN3N3p3czBKYXp3Q01QSk5ZTXRKVXZRa1pGOFVIV0xKSnBOZ1Vy?=
 =?utf-8?B?a0s0ckM3Y0dKekpFMWF6NDhhdjZIL1dOYTgvWHJ4dFBtRjB0RmQxNi9ieTVT?=
 =?utf-8?B?WHpQMTc2S2tTWHNVODkzTEpRRFZzNmh2VldFRXhZdms1bit5TjBzOTJ5VElO?=
 =?utf-8?B?WGxobmNTdkw2aWhoWnUzTVJMUW1qKzZvQXlHeHlrQmE3YVBnODJHUVRMalpy?=
 =?utf-8?B?WlB0cU1qdkZMZyszbkVLYTlIdWVLLzkzSzk5S253UWo2N3g4VWpxaVVqaGVV?=
 =?utf-8?B?ZXd3Rm9iRk54R1gzdGhXcDMvL0tiMHM0SzFodGNYYWxzREpUYXVYc1E1c3Fl?=
 =?utf-8?Q?vl268tFhxTVkYiONJT2NxMs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a41232a-850b-40bf-f8d3-08da010a5142
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:48:25.5365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrMEwfDUKpr+2Ys2LNag1fn4MtH89FHtwNsPWn6Zz8awWo+QqFRwP1jmolOEZQ77KtbMsUXoBSvAaucbb0WIuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3652
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/03/22 10:11 pm, Matthew Auld wrote:
> On 07/03/2022 14:37, Arunpravin wrote:
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
> 
> Isn't the issue that we are allowing a size that is not aligned to the 
> requested min_page_size? Should we not fix the caller(and throw a normal 
> error here), or perhaps add the round_up() here instead?
> 
CASE 1:
when size is not aligned to the requested min_page_size, for instance,
required size = 161 pages, min_page_size = 128 pages, here we have 3
possible options,
a. AFAIK,This kind of situation is common in any workload,the first
allocation (i.e) 128 pages is aligned to min_page_size, Should we just
allocate the left over 33 pages (2 pow 5, 2 pow 0) since the caller does
know the left over pages are not in min_page_size alignment?

b. There are many such instances in unigine heaven workload (there would
be many such workloads), throwing a normal error would lower the FPS? is
it possible to fix at caller application?

c. adding the round_up() is possible, but in every such instances we end
up allocating extra unused memory. For example, if required pages = 1028
and min_page_size = 1024 pages, we end up round up of left over 4 pages
to the min_page_size, so the total size would be 2048 pages.

> i.e if someone does:
> 
> alloc_blocks(mm, 0, end, 4096, 1<<16, &blocks, flags);
CASE 2:
I think this case should be detected (i.e) when min_page_size > size,
should we return -EINVAL?
> 
> This will still trigger the BUG_ON() even if we move it out of the loop, 
> AFAICT.
> 

Should we just allow the CASE 1 proceed for the allocation and return
-EINVAL for the CASE 2?

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
