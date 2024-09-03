Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295996AA1B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 23:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D023010E5F7;
	Tue,  3 Sep 2024 21:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lZHlM/qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA7510E5F5;
 Tue,  3 Sep 2024 21:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6oA6vP/N9YwgOlXdFlXCa7wXdpeqrs1SOdndHu4DbuQ07pPB8ZmBe/QZWHL92ZcS6HIzb7lXwwzMdUE1Mnc2uadyllZgt2BIc7aEmPSSRzJ+2mR4XciC0PCPDssGryvpF9umUNDV6eogZTiseIRkK7Af+Ti8I+cyDFSkvv+qNAE0BUheaG/HoYhugHzevAbOlQNAHlaLCZfLZv+n00UuPHJUz4bfcZoAZShH251VWyeD2T8nO3pSwdiA6t5mw/zQtsX9HbVW0fzExmueAHzknXuWL3v3kPSCy/OXMcGPt6Ff7Xi++0yUR1vt2mFSZMOxHI0o2NPkJBDEJhKdLAKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3+HH1tea/tRjyWMjgFaZVEGfHu5U3Lz3UMopdytIbE=;
 b=vQKvI/LQJR0d2GMJXEY5T15WKVMEeLml9rw2GUVLpYz2OxM4aV/ZfDOEyeHrezfrHlPoD26FtKYOzNzB+kDYoaiOD2HtQw+1E8Flj8my2D5MmA7EN0tz/STUS3IG6z3CMI11Vfoqgk7zIcn3FCccOJoS3BmOzpbPhHDXkaZS9RtzU/qfyjkrEHQpq7+Z34pV/OJVkLqrEBX9eRIUE5LFzntbuMoEVmCI/uKpN6p9l5p7vLBsOxJHpVTdpA47F7fQYVXP4j6G1B3b3KfLpgNstR5TwFeQVFMjR8+KSAbZa4tY0ov2aaRf/RvhxzxwayUq+h+WGrQ2RcfOltxPQ4Q5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3+HH1tea/tRjyWMjgFaZVEGfHu5U3Lz3UMopdytIbE=;
 b=lZHlM/qzdaPC3mYg42BwUXzaVl7Y4HmP/PNJggYdKwvEPyNKDMoMC7QXlAiKogxXA/UGUiDdCpp5waD0zdyVDn3nkpVCJbVX1CfdN9kH06utyyV9ud8cgV2X2485TVTkpMz7RZ8/9deZ6F2GswJT12azaeVmthheogpb0FcrHvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 21:28:15 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 21:28:15 +0000
Message-ID: <621ccd83-033d-472b-9072-266ab6978058@amd.com>
Date: Tue, 3 Sep 2024 17:28:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Avoid race between dcn35_set_drr()
 and dc_state_destruct()
To: tjakobi@math.uni-bielefeld.de, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <fd879fd0595e9e7e47c3442da10a5aede21bf895.1725269643.git.tjakobi@math.uni-bielefeld.de>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <fd879fd0595e9e7e47c3442da10a5aede21bf895.1725269643.git.tjakobi@math.uni-bielefeld.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0245.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::18) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbeb11b-c74f-41ec-4459-08dccc5f51eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWpoNmxKM2VQTGNSMFJpakducEVKQWtvaDJTUE4vd3h4c252NjkxSTNPTGox?=
 =?utf-8?B?d2EwK3Izb1dTdWdreWZubmU0WlJ2Mzk5cVd3S3ptS04rLzJ2NzBXc29tT2Yz?=
 =?utf-8?B?MkRJVXM5WFA4QlU5YjlrejFuazVObkpQWFpMVjZzK3orbzc4SzQrKzJodlps?=
 =?utf-8?B?UCswWldBZFpLbjJYd3FOQVRPb1ZPaW5abWxjWVBDLzFVMFU3U3ZCUU12UnQ4?=
 =?utf-8?B?eFRid3VKeXErREoxbzBDeUlSU05kL0dhenJHbkUrQkdNL1kwK3J3MVYrVmhN?=
 =?utf-8?B?d1FSQU1GUzhNak5wOUQyVVBUdzN4NGZYT2llRlZTMW9DZGc2OGhVRWxxNjJl?=
 =?utf-8?B?NFRUYWVqSFJ1NDM0T3lxL1VoaDQxUTF6VnlPay9HK0JHZ2RPbDdhTklFa29m?=
 =?utf-8?B?T05STVBxNnVMNmtiWUlaWVRKUEpFRTFDQ3pmN3FEcUxsV0xud1Rudi85cVVF?=
 =?utf-8?B?T3VURkU4MndKUFp6OFhzTWdqNGRUVW5ZN0JaTVlXTmsvVFJGSVZTbE1ib3Vq?=
 =?utf-8?B?M05TRWVYTWMxLzJPNDhPUjdGMEVMcHVOTGRyMTlMT1czWkpCR21Gc0U0dWl3?=
 =?utf-8?B?ckRiTE1uUFZTRUEwcUZpZGtyLzZxazc1MjNDaXlkd0RPYm52elE0K0hrZFE5?=
 =?utf-8?B?MFVOOWxDc0pYQm8yUmVxOGphS3dtZVpHNzlPM3JVYkZad216WmdqbnZEUmtB?=
 =?utf-8?B?ZGpsMndhQlVOVWh5ZHhPVnF4Z2s2cmxIMWlLOXNxRjNqMHBKcEJvdTEwNUFG?=
 =?utf-8?B?QnJIQWs0dzdPcHdMeTlGWlhUZVV0Y29DQW82bEdFd2xJcWJSS0tOWUhGV1RQ?=
 =?utf-8?B?cjlpZUkwVXFLSkJXbUZEdkhmZUNCM1k2MFFuWjBqdUxPUDhqOVk1dnF1ejFL?=
 =?utf-8?B?amNWQXRVUUoyUUlSMnJkalpIUnpFWGRhWkhCZEZyVHBKMWNpNkpKUy8wYUtj?=
 =?utf-8?B?N0J5UWw5OStwbjBmUDQvUGVVdGUrTUZIdFNaNHphK21KSERpVVhhZlQ2SFJk?=
 =?utf-8?B?dEErTlZEeXplQVlzaWVKbE5BU3ovcmovN29Uc3BvVkxqWXI1TlVaMFFzcGdE?=
 =?utf-8?B?aUF3dU4yam4rd251UjVHaG4yYncwbjBrcHErdytWWlJWMm5YMDZZQVNjVVVH?=
 =?utf-8?B?bW1mZldkN2lWTDlCMDlGQkQyT1pucERuamVONkplM2dNRjBKYnovanZpTlpk?=
 =?utf-8?B?V0dqYXlrNzc1ZWhVcE5ldzZpMHB4K3VrMjdXaXhib2xWN3pVeFlmdmpxdVIw?=
 =?utf-8?B?c1lJcnBqdVhSYlhBZ3FRd1J1akI3b0crbEQvMGx5ajh5QTZ0dEVhME5MUjBM?=
 =?utf-8?B?WTZmUGdBM0JIbWVBWmtMWTR4TEdZWExFRXRQSjl3blUzdzVtMVVpTjJHZmk1?=
 =?utf-8?B?ZEIxc1NWc3FZOFJWRllKOHlCNCtwUVdHNXdONTJGNmVDdG9SOEZyWnA2cXUz?=
 =?utf-8?B?c3JCSDIrc3JpRVUwZkFtcXNoaHE5UG9QTzdOMWtWK2luYktVZnZuOXRqYkl1?=
 =?utf-8?B?WWk0ZFcyQ1RYMWZaQS82TE9aVDlDdVNtVVdVaCtUUkpvTEQ0MWJwU00yb09t?=
 =?utf-8?B?bGtVaWxJL3VXMjdVY2hYSlptQmdFbzBpVGdIbHJUQmVlRWhEU2NpaXFZdjYw?=
 =?utf-8?B?OHZzdlMybDRsVDBNRmpjZFRjNTRhWlB1dFl6QU16TnB4K0lGbWdRZk8yZzVm?=
 =?utf-8?B?R3ovVXN6RWJVVmtjbXZFVGV0Yy91MTJ0VUZsOUp1MHh2QlRuNktWUUNSZmJI?=
 =?utf-8?B?YlZ1c3JzRE5pTldxeG1rM09LYXRiajhNeldDRGpXcWl1bFg3TW1pWEd4ekRZ?=
 =?utf-8?B?RkRqTTlvRGU1ZzBOREFVdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdCN0RUNVlBRXJTQVpkYkNCVnJhWWlzbWZZL05CS0hNZzJ2eEdoM2tLSHlP?=
 =?utf-8?B?VjNQNGhnYWhHeGswTHNVT0tPSkJveVdhOFpPRmZFUUNPTjJ3NXJ3ZTB3VWsx?=
 =?utf-8?B?L1RlNXZEOUEyWmw4bHpzQUFhQS95ME9GZkRVa2YwQkdFemhQY2QzNU9HcXBp?=
 =?utf-8?B?bit0YmhNVmtJYU9oV1NiZ1lCbUNNOXJRbjRwVHQvU2ZxeGVpSnZjSkVyK0hN?=
 =?utf-8?B?NUFMdXhSWHZKYXk4aDBlSzlLNTVQV2VHcDFoT09UbkFtWFg3Y0dycnhBZUR3?=
 =?utf-8?B?QnlSSnJiMFo2QnNyQ2FCeG0rQXpDalZuZWFOUTRqTTI2dWFxNVY3cEgxdldN?=
 =?utf-8?B?N0pMR3o3WUR1UC8wN2VBakdxMUxQR2pJTmNkTnZYQUVITjQxZXBwRjZFa2pJ?=
 =?utf-8?B?aFpLV1dnaDVyamgwaHRQTFFOUm44c00yNXpOeHN5RysvclBGR3ZwOTBBZi80?=
 =?utf-8?B?Tko5cGdibnpwVTQ4aGFoRERTNlhuM1JjQ1ZaeG1sNE1YZDIrclkzY0EzRVAv?=
 =?utf-8?B?dHJlVk1lSThENGtqNzFXS1lKOFhhUHFqK0taNVhoUXhMRDV4SWtiTUt5TjRT?=
 =?utf-8?B?Z3FYalZTandVTVNtQUp4cVVVZ1dUSjBJdEJRVW80YktXYnRJR25Kb09FajIv?=
 =?utf-8?B?eTRaZC8zUFFXQnBFNkU0L2pRTkl1UzVYQVBrYXlJaGdUaThvSFNjdmdMVTQ4?=
 =?utf-8?B?MnhFNHowcmswemxzK1JWN0RVMmcxMTllVDdNV0xobnlSQ093RTFDcXlETjZR?=
 =?utf-8?B?Q0UyT05WQXZYZUltK2N6NFRDc1FUZzUzeDZzMnIyTWU0bnc4YXFhaWMwRGVp?=
 =?utf-8?B?WE1XQURxWFJpVWpyeWZ5NC9qNGxFS0VoamNoQ1BBei8xdWtUNkJKeWRHVnFw?=
 =?utf-8?B?YzhwK3p1b2Uxc05yYlRvSWgwK2orUDlseFhDUC9WKzhZc2drMXNTSDEzRjBH?=
 =?utf-8?B?NVNLQjZYa3A5UmFqOWltM3pnY0ErWFpDQTVtT1NVeHlBSXBoZ051bFZraUhZ?=
 =?utf-8?B?bzREcDUxQk5nK3FBWmRPSFZlWDBlbzFiSFNSazdhcVFJUzNaNjdaelFiSFBN?=
 =?utf-8?B?K0ZRcUIrSmlyaDBJc3AvU2VRbUpmOGNZRVgvQ1FNczdOL1BYTXFET3lidUxy?=
 =?utf-8?B?Wnc3MFdwNHZBYXRSVjVHdkhadlBUMllNdEI4WUZnOG14bW1DcjdXN3NGM09x?=
 =?utf-8?B?WDVpK2tRK3g0WVVaNFdqSXhZczRDbjZZMkJOcDl4TVlabWVHSWQvbHFZemx3?=
 =?utf-8?B?UlA5d2ZGaDZOOTJXL0dMUUxUalFRT0ZIZFFZYjZGK2Jlamg3a3BLOXJFM0tT?=
 =?utf-8?B?MEFSTWM4N1NGak1BbUtMdDQ1ZG1ybmFvMEJYaEYvMTZqNVRBL25RclIzekJt?=
 =?utf-8?B?RWovUllqVjVHNWU4d1gxR1ZFajZSSmxYN3l1Q0RvbEQxSm1TYjNicHByd3d1?=
 =?utf-8?B?THgxYVZYMm5nUXd6aFhCNE43NG5LRWR1ODBKaDRzZ0pPSFFNdDRZbjR5TW0v?=
 =?utf-8?B?a1M5VVZKYTgydldYOE5jRXl3a25pb0FPQjZLcVZwQ0JWd3gyZEZERVM2anhN?=
 =?utf-8?B?SzFuem5sY2crY0xBZUVQcUk4UjNhZXVBYkRFYm1UQ2Nwb0Y0czBXZGlRSWNW?=
 =?utf-8?B?VHpMVVZHQngwUG5SQWRVNmIvRy9DTlRwQWRrT3BxMnBEOURqT1FSMmR6TTRH?=
 =?utf-8?B?M3B6LzhYYnQrdWE4SFZYei9HeUVCZzltYS9LTmxjL1lKY3BKemNrSGZVUFNl?=
 =?utf-8?B?S2RNRnd2L1I0T2dwWWdreHU4NjA2TzRNdG9kcC95Mk4zK3l5WUowTHdOeFcr?=
 =?utf-8?B?cWpJa1laSE4xTm4rTjQ4dnZIazJaNmhaR0djVENQVWxhTnZZUXlNbjIzNmFl?=
 =?utf-8?B?S04yTDM5QjVXOXVMMmlmSmdJWXJPMXlwRTlJbE5oRUJGQUtxUzc3WXpuSGk2?=
 =?utf-8?B?b1Bvd1NXc1hKQlh0OWM1MERudlp0am5TVGdJWlIzRHA1UWt5NFJnZHN1V2t1?=
 =?utf-8?B?dFNWYmFuUzVHYjE0YjJHamNSdWNXN2tsOGdYS0gzWVVUT1BhczNWZmxvZHcw?=
 =?utf-8?B?ZjhxNmxpaEQvWUhUT2lqT2Ntd2dqMFRaRmRWeUk0RFlKL3FseTFBeWdBMXpM?=
 =?utf-8?Q?0rqrqRXrSbLyveVUpzJfEjH4x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbeb11b-c74f-41ec-4459-08dccc5f51eb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 21:28:14.9905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJZ/R6yozHSPPqmPb2peZWsgJLas6W90UfM9e/HFZSiYGo2zspFcsj4dISzJvzfod+LlVnGLSpyzW93UkreJ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169
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



On 2024-09-02 05:40, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> dc_state_destruct() nulls the resource context of the DC state. The pipe
> context passed to dcn35_set_drr() is a member of this resource context.
> 
> If dc_state_destruct() is called parallel to the IRQ processing (which
> calls dcn35_set_drr() at some point), we can end up using already nulled
> function callback fields of struct stream_resource.
> 
> The logic in dcn35_set_drr() already tries to avoid this, by checking tg
> against NULL. But if the nulling happens exactly after the NULL check and
> before the next access, then we get a race.
> 
> Avoid this by copying tg first to a local variable, and then use this
> variable for all the operations. This should work, as long as nobody
> frees the resource pool where the timing generators live.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while keeping DML and DML2")
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
> index dcced89c07b3..4e77728dac10 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
> @@ -1370,7 +1370,13 @@ void dcn35_set_drr(struct pipe_ctx **pipe_ctx,
>  	params.vertical_total_mid_frame_num = adjust.v_total_mid_frame_num;
>  
>  	for (i = 0; i < num_pipes; i++) {
> -		if ((pipe_ctx[i]->stream_res.tg != NULL) && pipe_ctx[i]->stream_res.tg->funcs) {
> +		/* dc_state_destruct() might null the stream resources, so fetch tg
> +		 * here first to avoid a race condition. The lifetime of the pointee
> +		 * itself (the timing_generator object) is not a problem here.
> +		 */
> +		struct timing_generator *tg = pipe_ctx[i]->stream_res.tg;
> +
> +		if ((tg != NULL) && tg->funcs) {
>  			struct dc_crtc_timing *timing = &pipe_ctx[i]->stream->timing;
>  			struct dc *dc = pipe_ctx[i]->stream->ctx->dc;
>  
> @@ -1383,14 +1389,12 @@ void dcn35_set_drr(struct pipe_ctx **pipe_ctx,
>  					num_frames = 2 * (frame_rate % 60);
>  				}
>  			}
> -			if (pipe_ctx[i]->stream_res.tg->funcs->set_drr)
> -				pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> -					pipe_ctx[i]->stream_res.tg, &params);
> +			if (tg->funcs->set_drr)
> +				tg->funcs->set_drr(tg, &params);
>  			if (adjust.v_total_max != 0 && adjust.v_total_min != 0)
> -				if (pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control)
> -					pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control(
> -						pipe_ctx[i]->stream_res.tg,
> -						event_triggers, num_frames);
> +				if (tg->funcs->set_static_screen_control)
> +					tg->funcs->set_static_screen_control(
> +						tg, event_triggers, num_frames);
>  		}
>  	}
>  }

