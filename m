Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5F985F36
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 15:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784CD10E0D7;
	Wed, 25 Sep 2024 13:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M/pcgM8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274410E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 13:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFUxdIzwLDaubw2MKvNK38PWLB5eWJZKstqWzhrdndHhEyVLE8Puepmdsj4ZwBhIC9jVbkR0CCsCkP1eyFxjIFqewA2Lgvd1itO/w5jtJ4o2PJgJAlGSCOy9fYSxRWKvNZ7p0Pw5V84TPOtERoCYxBA7SEtW/tUBnULrrj3Q7PTNXmj1BSaYTgqe5xocxWJmwmuxTuDmeFi/jvzL9u+l5wDOwoqJ/hd3cT0GZvALjwXSJLkjl00ZpkGUT03P8p91yzoCGGiZ9i0bDA+1u6NvJc2TSvqMXIt58bvkcBeuJcG9TFdV2Ja0tGcjHh8TQXGyeF7Qul48hgatnS6l/AoilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8pz+FVSBrup+VEm83dyfiBImmKM8zwCQP7fWfYh1YU=;
 b=OxXn9HyAOjuual1MTc1StVMiK0+igysvuTYd3NpKmQs33zBLM2K7sGXFFPmP0Kiy6Vhvh7pt9lHPwH2aA4T+6yCLLoJ1drGaK3HEBrWo9Yk5E//mdIW6YAHtnQkCEYKCEk8manOw2Vo01qCSNPk3q8wmf5ALHo8bgufpIPOC4ppFGYrn06rgsC+nBFJH3pxtxS8EiMYervQtsqsL9gtR0FXpry7nYfVJ5rsY9oLb/EgftbEF+Kj3v11edKWy3F037Ln6OoLzO0ANywlCYGq5jlXfgy/tORCvSY/l/AiFNfk8ngJkvVsL/vCGaQ6iY+LofQ+agOjezEeMYgaOkDOs/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8pz+FVSBrup+VEm83dyfiBImmKM8zwCQP7fWfYh1YU=;
 b=M/pcgM8ScpWjbXEduWhOrrb8GmYPDrp+qdUFh94PiTmQEJ5tHJ5dlszY2/sXuk7ZU+iyHcj+ToPJzhJ3zOeZ33m7CwPjolupQAFC919y6FnW2tWX3Ed3mvaWLajv0ayQCeGPMtDU8oeJZ6uOXw+Vcca/k9dn3VyxDa+5O4nRKeEnGdNFFd4k+fQrKMce0hr0nZZSfBrwXRBPRVThdfXwjVLnfbS0g2FxA701iwhOohnSeKZDHv6xvn861Lcgwq5An7jRpFVHonFIe7/8rlHJBJz7Wtxrq25wL1/ij1YrRzArzQL0edYI80/Ar9yMFcACGOMw4UZJzz+8h3GTtGzdGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 13:52:47 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 13:52:46 +0000
Message-ID: <69683d5a-e2f7-4603-be44-7a6009e8fdcc@nvidia.com>
Date: Wed, 25 Sep 2024 14:52:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20240531070719.2138-1-cyndis@kapsi.fi>
 <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
 <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
 <tsq6hbbeyxu5uqasx6jijijvxfomnxj4c2qakf7lmd2eut2zbk@z72tkzlzlfu6>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <tsq6hbbeyxu5uqasx6jijijvxfomnxj4c2qakf7lmd2eut2zbk@z72tkzlzlfu6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0247.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::18) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: c5192cd0-c70f-476a-7a87-08dcdd695628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RU1Ua0pwTFM5RHdQQ3liTU1xS1Frb3RwNXczNmZxNlltYU42T1htWUVBTTYx?=
 =?utf-8?B?ajIxU3poUjlRdldhcTNSOXp1VStaUW5QM2N2Y0t1cW1ZZ1gxby94ZTQxcmRV?=
 =?utf-8?B?bUtxK2FWU3RYeHNuT1NPZVpMNHJsbzZDWm9STnd4L09kamZRNE1FcHZ5T0tB?=
 =?utf-8?B?Z2FCV2hya3dPSUhhYXFJYWlXd2N1dHRyTHBQV05pSVl4Tm94T00yVEoveC85?=
 =?utf-8?B?enlYZEtEQ2ZoWWY1QTVDbkc5Wi9BOUQvenlaQWI3TFZ1QUR0ZW5IekQ1VGU5?=
 =?utf-8?B?TlNXL1J6aFRNWnZQcExkZ3pnMExaSlZIcmxFUW9kd00xS2xWZmFVd1F0dzhQ?=
 =?utf-8?B?Uk9YdVFxU21ONGQrTUdzMmV3MGs0Q1JPRVVTWGZmNUoyQ2VEc1NtRThxRFVh?=
 =?utf-8?B?QldudjFFN01MdUllRzBncHh2UjFDRmpiOEtRMXdvSWFkM0t6OWlGYjBGYUla?=
 =?utf-8?B?REhubWlYUGRwSWRaT2tLYlE4NDNqcXlYandWbHNhUktEYWN0OCtKRTRYY1Ar?=
 =?utf-8?B?cXVGcFRaM2ZaU1oxS2NIZjFjdmJYZWsyU1VsdUpwRUYxVCtXVTVzU1p3d0U1?=
 =?utf-8?B?VVJQWEdlUG5maEIzY2l0MkFmNkk0NEhkV3RORHVHUTRTcS91eWxIVEVsWFF4?=
 =?utf-8?B?NzNJTHB4aWxpSGdFclVjdHMyWWRHTWs4cDR4bllqeFpsYng5YlVnKythaDNn?=
 =?utf-8?B?MFhReitGdEVaNm5pbXBma3FRT2pmblZLQWZvTWJJMjV2OTVLZkdYRmlIRXA0?=
 =?utf-8?B?Q21lZUM5K3RFbmh2V2YxeEk2NE4xTGFMbklMb095U0g0OTFad1JXTHYvVEpk?=
 =?utf-8?B?V09UTkVObEVSbHRpQWRwSEF2aWV5aXFVbVJtYnpRZFd3NzVrNHNxdjJPL1JD?=
 =?utf-8?B?dEFCQmplRklxYlk0NXc0anRoNzBGOG5Ub2ZoOHBPQnJQN1B3dmdPd2trSElm?=
 =?utf-8?B?bzVQOFU1VlF1ZllKU0djZi9haDI5c3AzQ0cvY1dudkd6bGlEamJFMmhYR01l?=
 =?utf-8?B?NHB2TFVxS0dFK2ZCRklQL2xpZHQrZnArd0ltNDJXajdwZHJyeE9MLy96SGta?=
 =?utf-8?B?SUVZMm13WHRBV292THA0M1hmQjN4MEx2aEJPVjJtekIyY2k1NnFHUFI3RnFC?=
 =?utf-8?B?YkwwQjNFZ1ZjQ2ZFOUtoajZxQU5RalRBOXhqUHE2elM4Z1pjMmtaeTJpcEY4?=
 =?utf-8?B?VUErdS9yTmVVQUpIOEhKendmRWJhK0hnK3NiZC9ZamVUTmF0czVjcWE3Y2NR?=
 =?utf-8?B?SGdsQ0k5eHF3aFBpdU1waGZxSHNDNEpmaWt5QnFrRmxsZm12VytkUEVUaWl3?=
 =?utf-8?B?dkRtZ010WFQwMTQybHFPbk15T1lpSDRFdExnNjBRbU1QSTYrOFpKUC9oMVZG?=
 =?utf-8?B?eFlVZU12OUhPam1mSy9VeU5OWnZ2QXRCSERxWWtNRE1lNzd6YTU5WHRiZmhj?=
 =?utf-8?B?YTBULzhPbFZxaUozeW56YVZqQWdmYk1wUG1pMGFTM0dtV2NndVFoKzRqNDZh?=
 =?utf-8?B?bkh1NWxwNmhGVFE2MGVlMFNhSUo1WVV4YmdDVnFad0szM3FXQWRDdkc2SVRj?=
 =?utf-8?B?bHY3VFo4MVhyUDBMQXhpdTJaN2tmMnJLUmw5UHRsNGZQQlgyTlZPM0ZHVUdz?=
 =?utf-8?B?TWtuU01uVWFYSDVtM09RWDZ6V2pHMW1LVUwzL05Hb1ovakNCOUk1Qllrd01W?=
 =?utf-8?B?ZEt3OU94VWo3bW1EQU1xVEhZSmNhY216RHlWTWdSR09NaU4yV2lXWEwzRFp4?=
 =?utf-8?B?MWxxcktUbWZNM0VNRjF6TUtNQmlOaDYwRXRzTjEzSncxTWlwakNqdzloTmJB?=
 =?utf-8?B?eFA5SGE0UlJ0czV6Y0NOUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5447.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5xS1JHSXJCVHRGc1dwZXBzaTBlMGw1ZC9ycVRTZmtNNFJhREY0Mjg4dUdQ?=
 =?utf-8?B?VzB5MCsydDJlSmtoSmY5cDlHNGZNaWVzTE02M3ZiRzVPbGo3d1RiNE1hUEEv?=
 =?utf-8?B?U1lreUdZRTFJWGhqRHY0WHlUdkdzTEg5elNvUjZZK1Q5UldmVGg2WnB5bFNm?=
 =?utf-8?B?OTh0WlJKc2Y2ZWNwN2VqMkxia3hzVEdCNGhGWjNKd3JtMTJRMkpzRDdoVkc5?=
 =?utf-8?B?K2RRS1dHYVZURnpqSFNVMjZjRGtDbU82TW5kRXBKQ0ZRTjMyL0ZsdWh5Yjkw?=
 =?utf-8?B?ZDFyT3B4RXgwRDQ0UWk1bXMzS0RjSEhLVUNJQzJQckdaYitjeEs2ZDBTYnd3?=
 =?utf-8?B?QkFKSFFyd1RiTEZqbWM5U1VOd2IzMnhKMW0xaFQrbmVHMHlqd1hBeWE5Nzk1?=
 =?utf-8?B?WmVWNko1UWRaM0VGaG14M3F1MlBrMmY2clFaZ2tBVW92emQyOWpVM3kzTjBH?=
 =?utf-8?B?eEJPSll3dkJRR3VXcWM3ZUdtRHh6VHNOSVlHOW5hd3lBanZ1ZUVCM28xaDN1?=
 =?utf-8?B?THJEbExCNld1bGF2UnYwdEhFZVRrWmU1Y0V1VDdnUURVZHlDUm5hd1UydGwr?=
 =?utf-8?B?ZE4zUEJoYzBQYlZGSDFpc3l1SDBzOXd6eGdWZG5SVkVhVXN0WnZSazk4NFQ1?=
 =?utf-8?B?TXZ3WGdpaFN4RFFOdmRPVjJLaUVQYzZRVnNwMng0bUdzcTNJNHdxbHdkMlFr?=
 =?utf-8?B?OGZoVGVRWGFlS0F3clNuanZDT0JiSjZGeklPbWxTK3l1Zlk4RHQybmVqdHJ3?=
 =?utf-8?B?OThpRU9yZldrTGsxUCthN3RaOXpRSFIxQVNTdzg2WkNCU2FoZEg5ZDFBRDl5?=
 =?utf-8?B?WHVpWENnOEJZMm5HYXhqaHY4a1BqTko5cUVabVFIOHIxeGsxTUtCZUhQckZC?=
 =?utf-8?B?Ymw1S3Q4Ym5pbGtySVhWZExkRHhlZEloN0tmdlNpN05GZzFsd0l3a0JHSGtY?=
 =?utf-8?B?MW9LSXUxQ1VlSUlUbzE3Q2xDSUc3aldnb2pKVUJHditFUGxheU1yaG5oc3BD?=
 =?utf-8?B?Nk1zN2wzcCtsRCtaWnpuRnN5N0NHMEd1RW5KTm9TNUd1bDB6OHVuRXVNdzN0?=
 =?utf-8?B?YVZLcnBBbWZlbFNKdzl2QXB3cUxFVWE3SFJhWjhNbjlndGpLQm55YzFvQ3NQ?=
 =?utf-8?B?OGdmbGw2TnZlOVdzTXRUbkFVNnN2ZVFsQzE0T0daT0lWK0t4V0Q3SHV0Nm5a?=
 =?utf-8?B?cnVnVFNmRXlWM04vNHgwTWdwU3M3YXpkY0NZUTd3Y25NVml4c1Y3cTArQWZS?=
 =?utf-8?B?TjBnc3BpRjNlVVV6TU5tczZLZ25BdTUrSENQV1RPbXUvd0VRYWpzNy9YYWJ6?=
 =?utf-8?B?T1RCSDhFNVZsMGxpSzN3V2hZOGJCWmpMdkRCa0FvdDlyMUJEbWI0TFZnOFAw?=
 =?utf-8?B?Q3ZQa1RSU21zZm5ITko1SG85YXdEdzRMbzBoMUsxQlFkbDJMRms3UnZlckNy?=
 =?utf-8?B?anJ3R082M2JSVXdqeFM1bzIxdCt5bUdxT3U5TUJHYVhHL2RtaWNjdnpDVW1D?=
 =?utf-8?B?R1NtdG1iQzRGeGp1NXpqc3hCMXcyT3U2dU1YMmZFM29WOXUzY3JLRFgvVnF6?=
 =?utf-8?B?NmQxZzN3Q2ZGZTllL3hycjY1QVh5czZSN3JYdW45M0FWeGtpMUZzQ1NKVExy?=
 =?utf-8?B?dEJrZ1k0Wm9Wd2ZnRDV6R0Y1QUhUMVNqa2MyZW8xV2ROQXJMbnhVK2N3YWFQ?=
 =?utf-8?B?cG9zNDNYeGN5K1ZpaDBka09xS2hVbXpUUHhZdExpZDFBZXZkTmRIK24zQWlE?=
 =?utf-8?B?YzJUaEQ4SmVCMElCTTdVazdYMXc3T2VVKzFpb214S0FjeWxoL1gvSmRUOGRu?=
 =?utf-8?B?dEozZ1NCd0tzKzAyUlhJL25VL0xoZ2k4b2hZNGN5UGFWeXBZaHpRWWN0ZHl6?=
 =?utf-8?B?aHNlQXB6eDlPU3liaG1NdUt2bUsvZHp3bThsbVBpVXBEU3puYmFCcUh3NHZU?=
 =?utf-8?B?dko2dCs2SE1WVUZwTjJOZHh6QlQ5SUFZTzVwVklWS0hJMThZYkl5M2VIQUQ1?=
 =?utf-8?B?bTlUZ0pxUFJ4dVR1RmhmNWhpS0VKcEhKcXp2TkdHTVk0UnlLenhtSTdLbTY3?=
 =?utf-8?B?MSsxYUxUbGZPcWFQV2lKZzE3ZjVBU3N6UHE5bXFsMVBXTGR1ZFR4ZnNwZFor?=
 =?utf-8?B?akhJNlZvcGtyc3FhZEVHeFRDUWsyK0NnMnpZc05waGhnTlRDTFY3YzB2ZjNK?=
 =?utf-8?Q?Yys1wWGqnadcB77iQjHlL9HOlLsSKomXB5cEfeyoaS8K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5192cd0-c70f-476a-7a87-08dcdd695628
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:52:46.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K16VxgC4RUaZtAOWeSogdkEzNYXKF6UpklJ2eXpNAHUs+R4B0Xyva19Gfpofn9qCJurlQrM/4JtHaUfFlAKj3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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


On 25/09/2024 13:58, Thierry Reding wrote:
> On Tue, Sep 24, 2024 at 07:33:05PM GMT, Jon Hunter wrote:
>>
>> On 06/09/2024 09:38, Jon Hunter wrote:
>>> Hi Mikko,
>>>
>>> On 31/05/2024 08:07, Mikko Perttunen wrote:
>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>
>>>> Syncpoint IRQs are currently requested in a code path that runs
>>>> during resume. Due to this, we get multiple overlapping registered
>>>> interrupt handlers as host1x is suspended and resumed.
>>>>
>>>> Rearrange interrupt code to only request IRQs during initialization.
>>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> ...
>>
>>> This change is causing a boot regression on Tegra186 with the latest
>>> -next. I have reverted this to confirm that this fixes the problem. I
>>> don't see any crash log but the board appears to just hang.
>>
>>
>> I had a look at this and I was able to fix this by moving where
>> we initialise the interrupts to after the PM runtime enable ...
>>
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index b62e4f0e8130..ff98d4903cac 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -625,12 +625,6 @@ static int host1x_probe(struct platform_device *pdev)
>>                  goto free_contexts;
>>          }
>> -       err = host1x_intr_init(host);
>> -       if (err) {
>> -               dev_err(&pdev->dev, "failed to initialize interrupts\n");
>> -               goto deinit_syncpt;
>> -       }
>> -
>>          pm_runtime_enable(&pdev->dev);
>>          err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>> @@ -642,6 +636,12 @@ static int host1x_probe(struct platform_device *pdev)
>>          if (err)
>>                  goto pm_disable;
>> +       err = host1x_intr_init(host);
>> +       if (err) {
>> +               dev_err(&pdev->dev, "failed to initialize interrupts\n");
>> +               goto pm_put;
>> +       }
>> +
> 
> I think the reason why this might fail now is because host1x_intr_init()
> ends up writing some registers during the call to the
> host1x_hw_intr_disable_all_syncpt_intrs() function, which would hang or
> crash if the device isn't on (which in turn happens during
> pm_runtime_resume_and_get()).

Yes that is exactly where it hung!

> Not sure exactly why this used to work because prior to Mikko's patch
> because the sequence was the same before.

Previously host1x_intr_init() did not call 
host1x_hw_intr_disable_all_syncpt_intrs().

> 
>>          host1x_debug_init(host);
>>          err = host1x_register(host);
>> @@ -658,14 +658,11 @@ static int host1x_probe(struct platform_device *pdev)
>>          host1x_unregister(host);
>>   deinit_debugfs:
>>          host1x_debug_deinit(host);
>> -
>> +       host1x_intr_deinit(host);
>> +pm_put:
>>          pm_runtime_put_sync_suspend(&pdev->dev);
>>   pm_disable:
>>          pm_runtime_disable(&pdev->dev);
>> -
>> -       host1x_intr_deinit(host);
>> -deinit_syncpt:
>> -       host1x_syncpt_deinit(host);
>>   free_contexts:
>>          host1x_memory_context_list_free(&host->context_list);
>>   free_channels:
>>
>>
>> Thierry, do you want to me to send a fix for the above or do you
>> want to squash with the original (assuming that OK with Mikko)?
> 
> In any case, this looks like a good fix, so please send a proper patch.
> This is merged through drm-misc, so squashing this into the original
> patch is not an option any longer.

Yes will do!

Jon

-- 
nvpublic
