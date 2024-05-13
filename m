Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71438C3BA1
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 08:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C1F10E3CE;
	Mon, 13 May 2024 06:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FXC93SqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA35F10E2D2;
 Mon, 13 May 2024 06:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwCas77vzzBArG1PJzp1Pjsy/ty0aaZuLDbvHeZ5RMtfGMPitglHr/YAgnT8vzrEvRjzSTG8G9y4O9ygkBJfUyqqwNlXBFiGlNdtuZOn/auO7mRO6cWWAh9Q13ka2HcP9vEyqVkyYNrw+FdQOYY+NCZmH/2Uq4DtgwQNFZWRmZrrUyntfYBeQ7gNCWHb8TL2fIn9z5f5RKlNXUOJElvHp1B1HxrWevUnm2dD/t755npZgKoxofniY98CsS1cC8ko2OhxdZ+4GRHIcnKz23kXbdzcRvC7+7dAVO5N43BBBFBX7BEWNKIaj8aluXjTiURQiG5LQ5HykiAjUXNq5oWlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNnS/ZZhAAQwHIGwCv8ez+TCXjd+kEYeeD4iXIQlTVM=;
 b=a4Jhh3dDNuV558bf1/uwzhjwc/w5wGT3aDgE2T0yUbuGopwX6OoV3wcu1ktVpmgIHozttPPaDLXw2aRrmLApYtyUS7V8kYwztuvg2fq5hHBP0EqrCVbuSYP1hxpsO7R4gssMzKj53JvPgGuJkdtb9CwU/MtQoZLJIi9RAiZeP2qyBgb4bch5ehMDjkThFmHbj3QPCITn0JOiSEAmLwDK/EPsRn2hnOow1XvY02TSlhCuhxc9zX62c5r6ehCWL1IQq1fJTDpc0blWwNxFrzP1d/wKT6yosnrynI/UiC2NpCNJELm/Xc1af7efHyEeuwYO+sKBdEiiZvCgqSUpChsAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNnS/ZZhAAQwHIGwCv8ez+TCXjd+kEYeeD4iXIQlTVM=;
 b=FXC93SqZk0uao2EIzqE8kDJW1ZS2tmGqdjNT999GDicPcdh1qFFnOwk6kVLEzhl3k2q+4ZQB2Ig0Kp2yOlWm3+dp5F2xG7fKUaPceWjr2KSOibYEKRnZk15C7gyzYr6P7mQEN8etVsGmsEuSFj1YQrktPKLi4LxeJaOPFyCijxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 06:50:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 06:50:19 +0000
Message-ID: <e6594457-a1d6-453b-9719-56888068a91e@amd.com>
Date: Mon, 13 May 2024 08:50:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Discussion around eviction improvements
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240508180946.96863-1-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: cf259b63-5f98-4cb8-9d64-08dc7318f3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NllsWE83QUl3K3BaUW1oS2dwRHR5LzZFb2ZabnJLUG13S3RnYVFXMVc5Vy9U?=
 =?utf-8?B?ZisyM2o1cGxyaVVjVEd4eFdRdTA2VXBFL1RSR3VxV3lUUW0ySGRjbzEyblRr?=
 =?utf-8?B?VTZOWkEwSVFXckFER2NrT3pxQmxuRUw4MzBTOW91bWhvUVNKM2UrZmFYVDVK?=
 =?utf-8?B?ekN5YU1sbkUrQStyK1lWZ0V1TmVRNVVNM2t5Zi9ubXIwVWp3SW03YWxIemtC?=
 =?utf-8?B?eWgxYlA3YnlFNjlpVW9HQWd1WHpVdkhWSC9YTXBjTStWL1VsYm45RHBPNWVv?=
 =?utf-8?B?M0krYjIzK1NPVzcxeG00TU5PblM2YmRESC9WQjFqL25RMFB3a0JrQThaRzdx?=
 =?utf-8?B?aXhBUGQ1SWFNNjdiRkg5WEdQZWt1emZXbHdZcU9wQ3lQQ0pGSlQyeUE0NVo5?=
 =?utf-8?B?eFlhcTRqN1F4em56dERybXN0NHhOeXo3TlpqODZ4Y0llakI3NG1YMjNrZE94?=
 =?utf-8?B?NHBnUGpRU0MzMjBtR1dNdzEwd1Y1WC9GOVhzenZSVkE3ZTY2SG5XYnJ5d1lD?=
 =?utf-8?B?czFSdFZkNTlKYlE4RkdPcytsOXVQdjlHNGJ2ZVZDa2ZUQVJ0NkY5T1haWHl6?=
 =?utf-8?B?dHhtMEhVdC9QOENyYld5anUzdHREVW5UMTU1YU9PYXBVUTFKcE00T3F4V29K?=
 =?utf-8?B?TFlQZTJpS3NIeEFQTDMzZ290ZGM2bmJIUkZYTGJQZkR3TVFIa2U5SWFHcXhF?=
 =?utf-8?B?V1M4QkRUZUhkcFdodnp4dVhiQ1Z6dml1RVB3OWN1L282N3JqS04vTEFTTmFr?=
 =?utf-8?B?YU1PeURJM0dHR3VjTjdTcmNrVWFrQjJleXEwNndtRVJwNkpsRVB5Z0puNFNy?=
 =?utf-8?B?NjZROXRJOWV0cWdoSFh0QmJNYWxOa0VWa1FTMjBQZmUzRmNKT0EyMVRPOUJo?=
 =?utf-8?B?eWZJQUFGTElxY2lZTTlIbjM1Tllzc21zb1BqVHI2a0MrempMSE4xKyt5eFF4?=
 =?utf-8?B?T2ZBWnI0T0R6R0Vnbjg4cDh2TnIrTVVjVTMyYThOaW8yTXF0UjAvZDdhdjdI?=
 =?utf-8?B?T09sMW9TMC9mMEZGbSthVWZ3bGFFRVhwa2ZyTDdrQ2k1cjdUMTZTbHEyb29y?=
 =?utf-8?B?NGpCVjdpeWtHMUZnSmtWSFppSEZ3TkJ6TmhiTVF1RGEyaitlelpUL2w4eEtl?=
 =?utf-8?B?dG9JckhqNnJsaytiajlPOCtmQXhDUTNPR2I0Sm5CUTJGc1VjVEEyZHFSN1dT?=
 =?utf-8?B?YkxWbGovNHNlTk5CRWJmTXR5bkRKMjNMVGc0SFFSbVRIa0NUVVlpcGRQUmtK?=
 =?utf-8?B?STgveUhVY2xDRE11R0JuNUxlQWgrMExYeGxOaGJVcjdZeFVVQ0ZrN21LcEVi?=
 =?utf-8?B?bGpVamZlbWRyQkpPeHJxL3FXR2NZQXB1U0dzNVV6V0J4QWNiYm9HQ1hlUjB5?=
 =?utf-8?B?b2NHR2pOM1JDbDJERDJGYTdLMmVHNjR4eXZWOG9Ud2Fsa1RpMTRNZ0xtM2cv?=
 =?utf-8?B?RUFFYjRUVmNOMEpkbjYycGllODNPTHl3VDE4cVh2ZEhvMEFXbnlrcGNuMmxV?=
 =?utf-8?B?R1ZockRJMEpodzFXaENkNitWVU82anczeEMrdFdpWFJVejloZTJaKzlFUnJR?=
 =?utf-8?B?bE5nYWkvVFgvaVFob0tieEMyZngvSExkL29MZzczU1ZYZ0hyWVlGNW9GekZW?=
 =?utf-8?B?OFdrWnp2SWN1NFJmQUpVNkowcDBqVHQzT0trM253RmZGeno0UzZ6dC9OZFBK?=
 =?utf-8?B?ZGFEVXdTNFRxeHJsSjZySmRaeGJrb2V3Zm1Ba1l1cU5xY2tmeWJzcmNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUVMQUYvSnhvWnZaOUVQWktnRVl2bnpnMVNheW1jOVFFamdlOGhMdExKZEMy?=
 =?utf-8?B?VU8xVjY2S3YvQ2tZd1pXMzV3THptdEk2Z0pRejY0aHEwYmkwMzVmNDN3aktL?=
 =?utf-8?B?Wk1DMU93WTRtOXdRVXRUTXVxOHVCV2ovejFBZUdjQU5RY2s2SEpGb1RJd2VE?=
 =?utf-8?B?TFBsWCswYXFURWhmZDdzMFV0bEpjOFdEbGJSSitxamJjTFV4RDB4cGRYeVl1?=
 =?utf-8?B?ZzNCQlJ5eUFZYkxVRWI4dXBGUS9UbUpXMlVkRXozZjZ5TUxNWENEVnZOenJP?=
 =?utf-8?B?SVF2d01KSjl1TFd3SkcxQzNoZUl2K2JNL1VEcmlMaWM2MTRsMmIxY2loSFc2?=
 =?utf-8?B?TGVGMThsUFZGK2hmUjQxUnl3aklzTTZYTHNQbUQ5dFNmYUtyckpqZFo5L05N?=
 =?utf-8?B?aTRkU21kTUVLUVF2U2ZDRVNVVXpBWTJXdzN0Q3RBTEZabkNPVTZaSW9GQnQy?=
 =?utf-8?B?WTlRM2NOY1BjejVBcllyQU11c0s5dys3Znkram5LMmtHbVBia0pORWNFWWFT?=
 =?utf-8?B?T01KWS9Nd21pUEhIOFNBa2xpakJnbG5CbXVWWVg3ZEhPZGQ0QmxqNENQbGh1?=
 =?utf-8?B?Y1AzcGptZ210S0d2R2orVlYxQm1CTzRPVzdUNk9FV1hpekhSZEFPakM4dWpa?=
 =?utf-8?B?SWVDSGpwalE4RCtMdzR0SExRcmJITk5aZWhsZ1crQTFnbkRYS2NsUlZmS2xx?=
 =?utf-8?B?dTlTZDhEN21jdnlOQWJjeHU2M2FUSzU0aEZKNXBaNnlLcC9VVDY2b2NiVytG?=
 =?utf-8?B?dU52bm1RMENhZHgwbkVmbFlJaHBCZ243TjQ2aDZyZXRqQnpDbVZwT3RDdTVQ?=
 =?utf-8?B?VFE2bWRuend4VFpYdXdPYy9XdUo4cW9yUmhvenhIN1B0ZTNMQkZMSDIveXpx?=
 =?utf-8?B?bmJpK1dXSWNuY2ZFaHV2ZGNqb0hRZkhhMmlwWkxSM3pybkt2OGJQTmJOdWto?=
 =?utf-8?B?T2laVVpUSXhQakJLY0lsSHBCTXFTK0Nxc2lKL0RiU1hGQ1JnQ3V4VHpkMVRZ?=
 =?utf-8?B?T3czNXFWL0VmWVhnSjZTdDByS0pMZFpWNWYweXJsWnhiTGNGOC9sdjBCQVl5?=
 =?utf-8?B?Nlo5bGZ2UDR3ODVXSkxCWkMrWDVWOGRXUkZNUEkvQ2Q1b3czR2NySXpoQjZW?=
 =?utf-8?B?c1JiNElPTDhlSFNZUEV3bDRnUDlpODh4amZFdUhTR0hsSTkyME5yaVoyL0tL?=
 =?utf-8?B?NnpzNHVGdnlKQjNWMVhrQmk5aDl4aGVIM1FRVVVFU0dhemVEdUFKRGYvNkdp?=
 =?utf-8?B?UXE3emQxZDBiRU9HZ1lHSnFyL01DckxsUFAybUNvRXgvTkVBaG1LSFBLYlpH?=
 =?utf-8?B?L1NQSE9WL0VNUmducThrZ3QwUEVwWEhucnFBbDB4YzZVNFpoN3EyaHFPYVJD?=
 =?utf-8?B?MXVnUDJqRUZOR3k1d2NXTEFhMHh5bDZjSTFpU3o5VjZXOEE1VjVZQm40SE5Y?=
 =?utf-8?B?UXJldG5sYkpOZnVUSUwxL0pIa0YxS29hMGxia25vYVRnMnNtNmlYQWxIT1pT?=
 =?utf-8?B?VHc5dStYaGp2RzJGZFNia09LSC81V3R4cEd4VlhaUmlYbkJ5QVBvbDBaT2NI?=
 =?utf-8?B?QTM2SEx6MHpKUlpsUCtNMGhLMmtsRGRvVXdyR1R0emtYaGY2dEYySjZXSEpy?=
 =?utf-8?B?S3MyUHhQcmRseHRrdDBRdENyc3VSME93Z3FCTGk4NktMUkxKcVU2cytpbHU2?=
 =?utf-8?B?N1Y1Wkdtc0ZZSEJoU2t2OXNvcnV3dHpuOXQxeTJoVFhqcWVxWCs0Vyt3UjBZ?=
 =?utf-8?B?Q2Z4V3ZGUjVobVhTZ0o4NHhxU3JxWU9URXNiNjlNTUh3QjZZWEtFU1VMSHRp?=
 =?utf-8?B?QURTZ2plSndha25JbHB4WmdaN043TFBBditIVmd6cFgrd1hhdnZJdjRFdjc1?=
 =?utf-8?B?VHBselZVNVFFN3pSSDNPRFdIWmZOaHZxdmdhV2hZcFpBOU9FZHNsOXVXZ2hp?=
 =?utf-8?B?RmFBRENPaEZueTZobzZCYTZTZ3p3N21RbFdUYnY5VE1oWnM4d1VBTk95Unlt?=
 =?utf-8?B?Y09uVVNyUkZOandjTkdEaTFrWkhlL0FidzMwRnZSckxkOXcxWjJocmJENDc2?=
 =?utf-8?B?a2l4NTdtSnVnc2FKdDFteFJETGoraXRYWjBoOWRFY2E5UE1mLy9tVW51Ry9R?=
 =?utf-8?Q?8Htk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf259b63-5f98-4cb8-9d64-08dc7318f3dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 06:50:18.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mwt8deHjbXUtqG0q7dWHsQzLk93MnPAOt27r/EFMjAxZzSqHs+LRWgwts2DDSZIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
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

Just FYI, I've been on sick leave for a while and now trying to catch up.

It will probably be at least week until I can look into this again.

Sorry,
Christian.

Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Last few days I was looking at the situation with VRAM over subscription, what
> happens versus what perhaps should happen. Browsing through the driver and
> running some simple experiments.
>
> I ended up with this patch series which, as a disclaimer, may be completely
> wrong but as I found some suspicious things, to me at least, I thought it was a
> good point to stop and request some comments.
>
> To perhaps summarise what are the main issues I think I found:
>
>   * Migration rate limiting does not bother knowing if actual migration happened
>     and so can over-account and unfairly penalise.
>
>   * Migration rate limiting does not even work, at least not for the common case
>     where userspace configures VRAM+GTT. It thinks it can stop migration attempts
>     by playing with bo->allowed_domains vs bo->preferred domains but, both from
>     the code, and from empirical experiments, I see that not working at all. Both
>     masks are identical so fiddling with them achieves nothing.
>
>   * Idea of the fallback placement only works when VRAM has free space. As soon
>     as it does not, ttm_resource_compatible is happy to leave the buffers in the
>     secondary placement forever.
>
>   * Driver thinks it will be re-validating evicted buffers on the next submission
>     but it does not for the very common case of VRAM+GTT because it only checks
>     if current placement is *none* of the preferred placements.
>
> All those problems are addressed in individual patches.
>
> End result of this series appears to be driver which will try harder to move
> buffers back into VRAM, but will be (more) correctly throttled in doing so by
> the existing rate limiting logic.
>
> I have run a quick benchmark of Cyberpunk 2077 and cannot say that I saw a
> change but that could be a good thing too. At least I did not break anything,
> perhaps.. On one occassion I did see the rate limiting logic get confused while
> for a period of few minutes it went to a mode where it was constantly giving a
> high migration budget. But that recovered itself when I switched clients and did
> not come back so I don't know. If there is something wrong there I don't think
> it would be caused by any patches in this series.
>
> Series is probably rough but should be good enough for dicsussion. I am curious
> to hear if I identified at least something correctly as a real problem.
>
> It would also be good to hear what are the suggested games to check and see
> whether there is any improvement.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>
> Tvrtko Ursulin (5):
>    drm/amdgpu: Fix migration rate limiting accounting
>    drm/amdgpu: Actually respect buffer migration budget
>    drm/ttm: Add preferred placement flag
>    drm/amdgpu: Use preferred placement for VRAM+GTT
>    drm/amdgpu: Re-validate evicted buffers
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 38 +++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  8 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 21 ++++++++++--
>   drivers/gpu/drm/ttm/ttm_resource.c         | 13 +++++---
>   include/drm/ttm/ttm_placement.h            |  3 ++
>   5 files changed, 65 insertions(+), 18 deletions(-)
>

