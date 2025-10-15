Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3677BDF7CB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F374110E84D;
	Wed, 15 Oct 2025 15:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zJ3sIt9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1A10E84D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itRY7Nz3nFVJr4Ji5e9CX/jabk4QYCEPRJr+OLBFVAdWeYUALM+pc9gV+58EBDUuJT0rX+NGYXcnoYLdWS1aDTFYjfIAWGE55n9tgYyuTR9U9udRJhAb921/5zr2vE12PAxgW0dyDh+NyceSRp3esx5LOLWsl46CaOtnDtiWNlMw/Tk3w13hn4BGakoHjUimp+YoyF5nMPuaPGRbfs+b+bQSo9UpTnDOFi9MMvqMAD1RnnYhKHFokNj8mSzvxglRlaTsyVek0W9/pq+x5NEZfxLMKWHDiZUOuPpNzWZ40dUWdiGh5Who0u+YS8fFbPX7ZjRn0LaTYqEwmvQw6BLM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMd7+GIrr76tJeGb93oQaKKSkKb539FIsnzCJ7vv8LM=;
 b=VmlrHtQAoTPnZRCQdY01stZ7qAU6dHhadqbGzgA3KDHL/KK0d3zaU+3Q1FzFCk+zFMTg34oYZZwpHDbhRv9jIaQukI+tA3QrGABYvtocQyi0GSEL0zz90VQaaHceEc//Mm8MDtEYTb88IWbVYgEXNsjFj1omSu2Fze7Z+F5yunL5nsNg++/cLrv7G1ppr1NG8y2uFOLLaqnl9xJT16UxcS4rxHE2eFrzQzdiKB5s7R8VJ9NRfg0L0Xs7s3KBo9x4DUsgMVGPEEMzBH4q22LAp62aU4Zb0L+3jy0I40jdeQpyJgKMdM3GqbiLxTgn+HPVwv16eVC63VtsJy4cW+8bSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMd7+GIrr76tJeGb93oQaKKSkKb539FIsnzCJ7vv8LM=;
 b=zJ3sIt9jMechAlvtK29Xb5hC0pZwS+0YTb7WNkRhYOuA8CIuCVMYVBgCXZ7CnBitNvmpLvNHGtU9YHlbQLdxAaP9EnB0VJL3IrmlKRt3kljcjiHtNuNcVFdgGk7MC7fRKMvujhrIePDHTD8BGbVMJZ6j9SnO8I1x62bj3ZmS7Mo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7274.namprd12.prod.outlook.com (2603:10b6:806:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 15:52:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 15:52:36 +0000
Message-ID: <d137c7a5-5bed-4497-9332-3c0677488c4c@amd.com>
Date: Wed, 15 Oct 2025 17:52:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v2
To: phasta@kernel.org, matthew.brost@intel.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251014142430.2470-1-christian.koenig@amd.com>
 <c53ba5989296ba1360e7c6a2b7901ac1e671bff1.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c53ba5989296ba1360e7c6a2b7901ac1e671bff1.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: ab47c93e-61af-4344-dee5-08de0c02dc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGxHRm1yMDVMOVhlYmtSTVBNYURLRHZFckhlMmlScnlLUjNOU1JHK0o2ejJr?=
 =?utf-8?B?NkY3dmpOaFFoTWZTSXEyU2N6MDFFZVZPNWZ0dC9yd1BEaXZkZzlnenBoMHNX?=
 =?utf-8?B?YUFhUTlzNnU1cnNNcVh6VTlCWDYvc25OSlpLRjZmbU9HNUEya1lTa2ViL1dp?=
 =?utf-8?B?NUN2OG9RVEM1VlFUOXF3cVNsZTdQWVBnV084K0wwKzdVVjh0cDlPbC9XODZs?=
 =?utf-8?B?dW5SQWJLY3JETm5mc3I2Wis1Q1ZvVTQra0VSZ29Ra0RXZGcxSkMvYzdQVWtJ?=
 =?utf-8?B?QUtYbGwyNGlKSG9DNW5UejFPU1VXUjhvZ1VhdzJ1YUdJUEpyc1ZMUG5yVS9i?=
 =?utf-8?B?dXBCbGR4WktML3BEZkRtQ0dqZUFMWjFCcnBaVWhZWmZHVmFKM3JPTTRhWmVR?=
 =?utf-8?B?MWJOeXdSdlpISTZ1V1RRREY2RkRISXV3WmNiMno4RjJrMUdxcitMbGNLaExh?=
 =?utf-8?B?T0hWOGk4ekVhclNCakhQa3FDWCtjQ3FWT1k2K3hMK2lzK0plV1pwb0s1T2Jj?=
 =?utf-8?B?WXJ4WGZJTy96MndCaThBdFFHUUpYdDdMSUJpaEswekhabTdDYmRBeTI1T2lL?=
 =?utf-8?B?YmJ5WEF2ZVFELzZQb25saEprMmwrWWQwVDdBUDFDUUFoTlBQZmpLM25KM0xa?=
 =?utf-8?B?WmpLUEN0ck5OU3o4NGdYdkpIYXBtMU1peWxTblN1Uk1SbVFRYjRVT25aRHpr?=
 =?utf-8?B?bXJiSjZoVnY3U1Noc0llTXJHTEoyVURlY1g0ekxvQkNSS1hqWDAzU0ZuaXNj?=
 =?utf-8?B?ZTZ2SkVYLzlnZzhHYkdQQWIrSkpablpoVHV4dzJNeTdKTGtFeEkzcWp6bXlY?=
 =?utf-8?B?ZklocSt6WnF4OWJFOE5vcG5LSEZvQzJLZXNWRHJlS1BSOVcrZ0dsR2duYm5k?=
 =?utf-8?B?dStRSllmMTdLRHZ1RkNDaTRxOTJOK2FFdHFrN2RsanQxSDZqMG56U2VUb014?=
 =?utf-8?B?ajZkdFU2UDlKeUVQMUhwenpMa1Nna0RFMzF4WlNKNDhmQ2tSdmZUYnFQZ09s?=
 =?utf-8?B?K2wwNnErWjEvMVJxSHgrNTdtdXREVDc5di9FRXFTcmttTWYzblVzbzNiN0o1?=
 =?utf-8?B?QlprNm8xTURHai9TSURrcjQwN2NacGxoTVFQNk5KZVdwdnRhU05ta0NFTC9W?=
 =?utf-8?B?Vk5PVnUvZmxSTVM5cTdyM0Q0SzIxS25sOEZWdlB6THZ6UmNTWnUrNUs2UGRL?=
 =?utf-8?B?ZU5kZUhObVk1WmlrUmxsakpOVEpmM0JMUHMveTFZaUVyMzY3WG1Fb09QZGla?=
 =?utf-8?B?RHdaNnc4V1lqendiZFU1MVV6ZzdDQzlJN2JNeldEZnkwdXpDZkRFRzhoTmg1?=
 =?utf-8?B?eDdIVWN5T2YxTCt4S3RsVExEcVVIaUs0dHJhNVRmVStwVkZHdXlaaGlna1ZR?=
 =?utf-8?B?TnBEMzZOY2FWTklBWE1YWldFNkxhbDk2Z1ljU3FmN2FsTkl1bDR4a0k3M3po?=
 =?utf-8?B?RW5iRUV1UFkyL3QzMXErNW5LQUpFUVAralFqSjNyVlEvRVh0d01LRCtORXNp?=
 =?utf-8?B?d1d2a2lKNC9WbVU2YXRYeFYzUG5iRzhZNlFoUU5raVVPZldTaGw4YndVTDlm?=
 =?utf-8?B?NkJ5d09tbm9kVjBrclJpM0lEanVtYVNwalJGTFcwNkZXdldFTmUrTnp0Yk5V?=
 =?utf-8?B?ZlpkTi9aL3p6eFVlcnNpdEdQVGpiZ29GZElqOUxtazk2WGdhaEl2Z0I5TVJn?=
 =?utf-8?B?ZHhiQ0hqRjViWnR3WmxHTWlLUWhJV0w2bGRYejlFQWxjUGVGcWJ6SGFOQnJM?=
 =?utf-8?B?Z2xtbDd5TEphK3VabDdud1RBd0lmRVNjbTI1aFR4VE1NSzFQOGlyd2ZBY2JZ?=
 =?utf-8?B?TjBpUC9KTVdLZG1YcjFzcUg2ZS9FNndjaXN4Z3RGQVU3TzlyeXpHby9LVVpn?=
 =?utf-8?B?UDVUU2V1MDZMeGFnM1RXc3hjKzB0dVNZN0NWdnR2MWhsbVYrdXgwd1JnZnNO?=
 =?utf-8?Q?bbyqdBKKO4snVw5XPubtnCjWArM7xVS1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBBZnh3Z2hScmw5Z2RXU3dJY2FDUFIrUkMvenhxRTk1L0dTRXBmSkNxaVJp?=
 =?utf-8?B?ZUhaUVZPQlQ2dm85ei8vNWwxZHFiMzNqRjg4OVFTUG9xdTd4TkUyNHJYeUpZ?=
 =?utf-8?B?WWJITHRkQnZ1Q2YxSTEyZVB1SjI3dnhBRjdTcXFtRnZUajVsaDlsSGo0M3Vm?=
 =?utf-8?B?Rnk0UHV4TXFRTzAyNTRiUjEvUjJWdjZPS2oveXNWMkNZZXVpaUNlUVlTOHZk?=
 =?utf-8?B?WmNVZ0hsVmZuWFU5c2hmSVNaRjRqazJDRkFJcS9KcENUc3pscG4zR1R0emdO?=
 =?utf-8?B?RHZQL1hFZG9lQ2RmNDhyWFFkcHZ2aGFuemVlVTBFT3pXcG5raU13WmRsSnJt?=
 =?utf-8?B?RzdqbVFZVlZ3Y2ZqYkt0cGlYK3dqVnNiYWNkWFdlb3BDZWhCS1hyTDIwMmJi?=
 =?utf-8?B?WUtkVDd2VnlvaXlzeXk0NlBFclppT3lNcGhtMmVkRW5UV1dCaTFEV29sTU1V?=
 =?utf-8?B?eGxtY0J0UjArT3RmNkRscjBHdHQ5SVhJaDcvNHRQUncxdVpsYUZKYlhuVDRr?=
 =?utf-8?B?ektJM0gwaHpiQ0QvRTJRajRkSkNQVVZ5UXh0azM5YnB1WStFNXZYdDU1RzIr?=
 =?utf-8?B?SHFaY1BCenBPRVVGZ09mV2wrWmRIZWhjV1JSdGR5S0ZhRzNvNHVsQ09rNzAw?=
 =?utf-8?B?SVMrQnIxVnBJQlVCL1dydGoxYjBxREZvREJoNGRjQjQ2RS95NUVncGNJQUlZ?=
 =?utf-8?B?R3NjUjFEeC9wWWFiVE04Y3Q1QVJLckIvRGdEZmdQcnphUmVJWDN2aHM1N2JZ?=
 =?utf-8?B?SzcyRUs2KzdjWTlaRSs1ODJPbzQyZ0oxd29vakR0RGNiYTlJd1dXL3ZuUVZI?=
 =?utf-8?B?NEpiemxJSXNjM1RkTEo3K0dua0xtL29TYldsdWx2TlhwODlKQ291SXlaR0Yr?=
 =?utf-8?B?MWlWSWRYdVNXYjBPM3pPQjJrSGZlTVJNaHg1NkpzRzIreGwwRXRpU1lHaUNi?=
 =?utf-8?B?cEZWWnVocTYrSTlaQURLY1dxcVVhL2VuWG1UcU9EaVZOR1Zkd2RxNW4vZ0xT?=
 =?utf-8?B?VXM5ak1uc0taY0dtdWREc25sbGNsMVgxc2JVOWZLdDJSZ2MzNktTYUcyWXpE?=
 =?utf-8?B?TnZHcmRCb2s2ODl4R0Voc09uT2J4K2VLQjRnWjJLWVo4Vm0yOEJjVEp1UWlq?=
 =?utf-8?B?VW9LRmJWSlVtZWpiazZpYzZVTU11ekdlUW41SHpPc081eVRVeFBHS2pXSXNx?=
 =?utf-8?B?ZVUwQ2VuQWF5R3hkaVNsY0JXaTlDcVg4QmpZZzh6VThhTjlaejhseHh6Rmpn?=
 =?utf-8?B?MStxTEJvb1krQjFIZUpYbFMvcmo3eHhlYWE1U29uYUl4RERWeEx4Q3YreUlu?=
 =?utf-8?B?TmNsU2dxZncrbERoeDBodmhNcDR2QW1PL3pqdlpoK3hKbHlZdWtGbW9ieStm?=
 =?utf-8?B?anh0RXNxRVVFUG9OK2MwYUdOMVI1M3hzUGI3ZGMvUDlqVkVUa0VFaWRMRGp2?=
 =?utf-8?B?ckViZ1NYQUZySno1L3dUc0E1ZkNQU1NqWXdwcGRiUUJxbWNzZW4wV3R0eFlH?=
 =?utf-8?B?OU5hZEJhK1NzVzYwZzNmck5ucnVqeVdud2J2aStXNkthT2k4dGMrZm8vTG1U?=
 =?utf-8?B?SUJHdURBd254ZjgwMTg2aTFrYmRCOFpBVTdMcjhtVjhlTVdoU0xDdXBRWDQx?=
 =?utf-8?B?Y3pkMTkrR1RXTFN4U1R1MUtlVlFTS3BSK0xUei92T3duRjZKSjNXNUxZMHpX?=
 =?utf-8?B?NzlQcmk0YWkxem14MXhTRTFJNzFTMENJc3BZYitUT2loYWQ3NWtENGNMdXRy?=
 =?utf-8?B?VVZHaG9DRFgxNnhMMGZCaVkrOUI5K1RMc1dmY1pIRWVnZ1JzV2h3Z3NYb0Ux?=
 =?utf-8?B?SDdaZEFIV3hqMjJ1RmJjUUZHNy9VR1ZYb1JTeDdhTUhwcEJPbkJ6MnJrSjRE?=
 =?utf-8?B?a3l6T053N2xNekxZMnExTlZJbkpodGdnYW5CazlQUXFZaUtUMGduNVBQWHov?=
 =?utf-8?B?Yy9zS2pEbWdoSzNId2hpQTJ6em8yZS9sL0FadGc0TC9GRlVYM0NmTzRLZlAr?=
 =?utf-8?B?cVNpV040ZnVQOEtGQSsxVWV3Nng4KzVsNkFkaEtreVBkd2lLajl1a1UrQjNl?=
 =?utf-8?B?Q1VwTm82RlFTNWVLc2d0TGkra0YzcWQvcXZjdzVWVUVuZjFYbjM1U0xmaGFq?=
 =?utf-8?Q?LlOs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab47c93e-61af-4344-dee5-08de0c02dc36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:52:36.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRNqNlpOdDUizwd7AbGbMzB2xSzhFURB0vfghfvyCJlU2ln9N2NU64fKH6gtAubh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7274
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



On 15.10.25 10:23, Philipp Stanner wrote:
> On Tue, 2025-10-14 at 16:24 +0200, Christian König wrote:
>> From: David Rosca <david.rosca@amd.com>
>>
>> The DRM scheduler tracks who last uses an entity and when that process
>> is killed blocks all further submissions to that entity.
>>
>> The problem is that we didn't tracked who initialy created an entity, so
> 
> s/tracked/track
> 
>> when an process accidentially leaked its file descriptor to a child and
> 
> s/an/a
> 
>> that child got killed we killed the parents entities.
> 
> s/parents/parent's
> 
>>
>> Avoid that and instead initialize the entities last user on entity
>> creation.
>>
>> Signed-off-by: David Rosca <david.rosca@amd.com>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 5a4697f636f2..3e2f83dc3f24 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>  	entity->guilty = guilty;
>>  	entity->num_sched_list = num_sched_list;
>>  	entity->priority = priority;
>> +	entity->last_user = current->group_leader;
>>  	/*
>>  	 * It's perfectly valid to initialize an entity without having a valid
>>  	 * scheduler attached. It's just not valid to use the scheduler before it
>> @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>  
>>  	/* For a killed process disallow further enqueueing of jobs. */
>>  	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>> -	if ((!last_user || last_user == current->group_leader) &&
>> +	if (last_user == current->group_leader &&
> 
> It's not super clear from the commit message why the NULL check is
> being removed. Previously entities could have been killed if there was
> no last user. That's not desired anymore. Why?

The reason that we don't need the NULL check any more is because we now don't encounter the NULL pointer any more.

In other words the pointer is now always initialized, even when the entity was never used.

I've added another sentence to the commit message, but I'm not sure how to better describe that. Is that sufficient? If not suggestions welcome.

Thanks,
Christian.


> 
> 
> P.
> 
>>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>>  		drm_sched_entity_kill(entity);
>>  
> 

