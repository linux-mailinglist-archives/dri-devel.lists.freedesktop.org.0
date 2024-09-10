Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1D972C52
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A624B10E574;
	Tue, 10 Sep 2024 08:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PNc6jbkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793D610E571;
 Tue, 10 Sep 2024 08:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXe0f+7gPdW13Cx7cj1DgXJK24A51RuVFGD8LKHcnT51ZjAOfnojUzle0J8ghgNWC4nyPaUCeUjlbPsfQD+Cg74sQGU20z5q5giHrsV/arLMsHOnd90irudLqqukmNT8g0FV2aKLnTQqUP5tG8nkuKBUYDT9NPl3PJ/Hqn5ulz3MUJSZAAXum27aIuhOjOMsXhDWAoargx70sADBueVsiNG3q05MOk1l2OUbU3zW2Bp7/3klTcvqxKamNAgU+MSa7Ha6+uK5UOiPimfTDKC9A+cA6beuvGZpRw2J0PM8g+5EkcMVr0iPjAjc4daNq+ge87E5btZqsxC4RTc8q+O1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMQHMy8aCUpydibf/BEax0e0bttL6LXwt6589WFgJsU=;
 b=ZcEvz359l4dRtUshFkNgyfL0NqsdD7FqIU0dvkBxFQ8tdaeKUgnozMuOBvEuPXO5ZudbMA5e2lx/0YeUEunyM3OMjrIx5Vc0B1SrA4kDhkuHiqNB+ymUiooMKtftyXNpBzRftZ4nIYEN2XLBaUqjIgEBNY6I+th4h+sQn5PsRKtqjZihMolW9JRR+2ixCbMuHSu0MmFD/z7bIAWR1ax6s6uBml0kHY+17JEagDOcTw6yZ4NJn9/KaVkWlyv6zke2TBCIZ24DGLjnhBpO1xFMDqWXRCZ141vb+NRMjWwJalh+J5AjMOK20E6T5wq2XS04LU7ws3H/jjoWrzgG8Lfkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMQHMy8aCUpydibf/BEax0e0bttL6LXwt6589WFgJsU=;
 b=PNc6jbkpg/6I3QJv1e4Yw+u0iCsDEMYmrSjOY0vzvkmhYhY0v6nTTRnb9oCEUWKsPcXq+WzhNtq+iNxa7DkKxpSMb6848EIWf3GLiJAKCW7IlssopO7l/OxEh/eUEIufZ+axmdw18LEX5ptATc/lbsWx22HsgRlkww8dXLED3DY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 08:38:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 08:38:35 +0000
Message-ID: <ab0783f7-7b40-4160-aec5-f4fe31759ae5@amd.com>
Date: Tue, 10 Sep 2024 10:38:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/sched: Stop setting current entity in FIFO mode
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-6-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240909171937.51550-6-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e06f176-ebe8-4544-2e66-08dcd173f599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmtrWUsxTC9IZTQxV2ZFK05hZlEwZm9jNXlSNzdoRzhpVHVTUTJldWcwRlc5?=
 =?utf-8?B?U25wMVdNNkFVZk5rRTB1bktNL2FWUHQySHNPQ1Rxa1lLRmtjTjMyUmwwVU01?=
 =?utf-8?B?NDc3aDRIUG1wNHpnbkhCd2NMVEpsbWUrK1BMQ2xiMU01WXZVdUsrSlgvVFFl?=
 =?utf-8?B?OXVpWTBuUy93azZIb000NWtDTVpnVk9MZStiZHUvSUFXbXpONElIdWprelpu?=
 =?utf-8?B?MFBnNWtQVUc1ZFlsbWkraGdBUVROT0pyeXBhNUpSeDFUVVNPZWdBRjkyTllJ?=
 =?utf-8?B?QlM4bHkyb1ZkWk5HNHZ3dTV2UWczZzhuaVpvN2NwYXU1aitXUzlEZngwV0pY?=
 =?utf-8?B?UFZGWktWTFRLTnNaeCtKb2NTeVJUMHNnZVBkNVJMM29NTkpudHRNMHZSdDlj?=
 =?utf-8?B?em1tYVFUQlorcmFreElBR0E0UXpQYjA3UGN0blVlSFQ5M2d1Q3VVemlKOTI0?=
 =?utf-8?B?VzM4L25RUGV2V0lRaWRKNzVYbnFydWlWRUQyWTYvd1MzRm91RDdKK3ZXaDlH?=
 =?utf-8?B?bHdQc05PU0JBM2NXRWd4YXBvM0JCbzNFTVk5L2NGNWtGQ1JHNVdvajZxcTV4?=
 =?utf-8?B?TXM3NlBvWERzdzN4NFhvMk1aWGtzREZJZmFWV1pVRHdFUHR6cjVXbWV4dEZz?=
 =?utf-8?B?ZjZaa0xjQWQ2cmNLZTJQcjRzVHdQZlJFdjNrbkMwVDBHMVl5djVJUHNoMnVE?=
 =?utf-8?B?cWhoWTM0aENhREVjbm44QTZrUGhlZ3cwUm12MjJ6ZnByMTlrcStJVjNhcFdO?=
 =?utf-8?B?N05JVHNzQ2lOWFhPUDYxcWtHZFFiWFYwcDM4dnlBemd1MGpMWlJRdGxOeWF0?=
 =?utf-8?B?K0FJRC9nM0hnQ2pXekIwV0prVUtld083N0RkN0FjU1kwYXdNTkYwMUZUdWhV?=
 =?utf-8?B?V1VFbmttaGttQUZka2JXazZHNjltVURRbk96WDM3Tjk4eTY0dzdVdUFXKys5?=
 =?utf-8?B?TEdYY0x1ckpmWEMxSXp3UlMvMWRyY2JXanpUWEtBckwzVU0xcTJyTWk1RDN4?=
 =?utf-8?B?YjB6QStyR3pFZXR0cDFBaVE4N1M2R0x3aEVNY21kTjRydmFKOC9ReFRVZFQz?=
 =?utf-8?B?ZGVZNU5TbVA3V0x0cldnVEdHMFRXcyt5SlRGZmhubnE4dkRscFNkL3JJVER4?=
 =?utf-8?B?ZlRjOG8vMSthRzZTZm1QSTNJLzJNTG12b0tzbDlZdTY3dHpibkhnRnROUFJ0?=
 =?utf-8?B?bnd3QWJicWhidk81MjdtTjhwKzM1WVNCSXBFZTNYZmpKb2tkQ1BkcitIRlNi?=
 =?utf-8?B?bk16T01xR3NuWFhZR0QwYWxITll2UFlacXBHNkhNZEIvZmJNVy9mUTlZK1Fn?=
 =?utf-8?B?OHpDenZpTmlLaVYwSkZJdTMvTmt5Ty9JUjluSkw3Vlkwc0JpYURjQWkwNGNX?=
 =?utf-8?B?dDVzWU5tRjRMVmRUUjAwSWxZQ2VER1hpb1lBRXlPamZNWG5PemNZNFlPR29V?=
 =?utf-8?B?V0ZHMnFPYjlFaDVyVFhScFZSTGVGVno4eGdLbzJVVmUyWllHc2wzVmtCMjI2?=
 =?utf-8?B?Ykt4bXVybG5UaUJpYno4MEt6L2tlVEU4WFNyTlJKNGo2a0M4aXBNWXRNdzV3?=
 =?utf-8?B?SnhvZTY1TTQvTlF0OTNNVDhHSCsxajlqNEFmYVRPQXk5dXFKdkxsNmE5YThl?=
 =?utf-8?B?K0tuKzkvZFB1TmhGU1pTS3JmQStkenI1K2RpMk1aVkxJWUVNTWtqMW9xWWxH?=
 =?utf-8?B?ZmhyeVBSZituV2hvNHpSTDJ6aHBJNzBONlhwL1pOL2psZ1hlZzAxdUpJL2h5?=
 =?utf-8?B?TDJRNkR5UUI2L3BhNTNRWWRuWUR1Q3o2REQwcEhoZlZueHNSL0dtK3RPS0h2?=
 =?utf-8?B?dk9GQ1dZZFhMUm5HSDJQdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhEbThxOUJVemVIb21Ha21IQUQyS0VwN3VTZjEyUDBzVUJsQkk2SEhycHlZ?=
 =?utf-8?B?R2dWNlBTN0pUWU4xS0ZDY1cvTTMrYXFoVjQzWStOV3IvNCtDT1F3NWtFR2lE?=
 =?utf-8?B?SlhiNnR4cUY1dFp1NnNnTFFhMnQ2YmU5SmJ5elllb2JKWnd0NzNobzRnaUR6?=
 =?utf-8?B?aEVHc3ZjRGJObzdvN3lXbVhGZ2NoazB1RnY5N3hwZGlLSEF4Y3lNdEN5S3Q3?=
 =?utf-8?B?ekMwN0hNUHlocklTM1MzL3kxVlRlcVFZbS9FaE9nK0ttZDZ6TkxaR2QzYnhR?=
 =?utf-8?B?clhWU1d3MzRUd0NFNVFnU2hnVmFSMDU4U3dsajVxODQzV3NqTzFQbklPSWxj?=
 =?utf-8?B?eU1idDlJVys4OW45NHhad2RHb3d6djdVYjFab1UzbndUNWhhMlFhL2NIRFJy?=
 =?utf-8?B?L0ZWV1lOaDg3S1J4aFh6Z1lZdHpNMUtUWWdoZkJWdXFNcXhubkJhVnA3SWJ5?=
 =?utf-8?B?RTZDbU9zV3gvZ2lodWdoM2NpS1pRNzBTMjNJSXZITSt0Vm9DazlFMTZtUTJK?=
 =?utf-8?B?SjdiZ2ZoRHBCSDZZRGkzUDBPNmJXZnFydmtCRGhPRXpaKzFXRWw5RlpsdkE0?=
 =?utf-8?B?L01vR3pzdDZJS3F6YWNjWkR2OTJkTEF2Zi90RFBFTHZNZmVNLzZSUUNYakdn?=
 =?utf-8?B?UEVqeDVCazdaK1R5cmN1dEFBbjJsRksrWFZhSmJxd3h4ZnJ2ZU9lTGNsSFRT?=
 =?utf-8?B?NytOVUZZWDUrTmRlWDVoV1hhYzFWUmdPWjN5dmNnZHlueE5BNmNjWklnVmtL?=
 =?utf-8?B?NENmSVdwaGFyMUh2aVBYalNabHZxTzB4REdZbEhleXpjNHAvZ1U2UStBZHl3?=
 =?utf-8?B?NWZNQUpBK0RMUWVpRkRBRVFCL1VBektpMDlHbndLMG5uVHErZkp2eHphczhK?=
 =?utf-8?B?d1RmaTBMN1VTVllhbnUzcDFmTXdYbS9mSjcyQU50Y0paaEN5Q0w1Vk9zNS84?=
 =?utf-8?B?MEdDNWRFK3FCcGorZmVFL3VHNlNRT3dzbTc4MEFkRVc5TStONGRoWGlkTUhO?=
 =?utf-8?B?YnpsUFRxWDdXcTlELzBEd2M4Y0JraTB3Mnd0aDRWL253bnFLdWpHdXNybXQ4?=
 =?utf-8?B?aElsV3Y2Tkx1amxndEtrL2JOVlI5cWcyYlpDcEo1N1Q3VStPcFBDbW1RMGVB?=
 =?utf-8?B?OUZZajN2NXEzZmR4WEFtcFQyejE4TXNjYjVQVDB2Nkt0YU9uNHcvdnlUdlhz?=
 =?utf-8?B?bUdBdFJBcHhEOTNCUEpJcU5heG1TclRRcVV2RTRDV20yNk1SZTFwTGRjSjYy?=
 =?utf-8?B?dlBJWmdQci9kemZub1o4N2JiQlVLY0ZBTEU2bzJqTkJvK3g1TEdmTndEcW1z?=
 =?utf-8?B?YjJSbDNSMERRMElZVDVCQ3c5ancxZ2xtRm03dno2STR1WE5KTEd5dkNlK0h0?=
 =?utf-8?B?eWlUbE1QYktSWlNYZDVScVd2T1BEN0ZERTVYMkFwYzZYZ29LYStlYmF6TXRL?=
 =?utf-8?B?NW1sZTJraGozZTRlZjVuSFdvcHhidzErdUdzRlR2ZW9hTzZtMTVnc1ZqTmpH?=
 =?utf-8?B?bXU0SXAva3Y0QWRocUNmaWtOL0g5dDBwVEtrWWF3cVZRcndzdnl1aFVLNGgx?=
 =?utf-8?B?TkVlVXYrMzBROVo3cFRUc3VkQm1Ka1JETnFqV0tIWGFSTTlkU1lvNHllYlh0?=
 =?utf-8?B?cXNoSko4OGVRdFRRdSs4Z0JOZFIvZWg2SGdvdUt5WHd0QzA4TmhKeGlveGR4?=
 =?utf-8?B?eDhCb1FtditYbytpUSswRVdndXhPUXdLeFozcnlCemJqRlo5MVgzQmVtSUNx?=
 =?utf-8?B?Y0R1VUN4Q3VxazFSbFYvOHNaZG9oN1NYOEY1TmZ2bEU3SFJldittLzNGRU83?=
 =?utf-8?B?NllkV3NHUXhKMFQ3VlN6cURUNEdwaWpnY1c2bFh0Ui9uT2ZkM0FMdFZiQmhR?=
 =?utf-8?B?c1ZLSFdweUdSWHh5eUN4bnFCdUJTMm9qYXAzOTNiV0VQaDNRdTFvMGptQ0Vx?=
 =?utf-8?B?cGRHbzZZTVlTZWlYa0EwcllWM2hZNHg4WndZbzhTUHNTWk5zUWFzTVd6RW4w?=
 =?utf-8?B?Sy9EZGFvNDRXT3hpUVRkSmdWZW5xZUExSXE1Tk93VzBkU1ZleHdsMm9SYWRu?=
 =?utf-8?B?NTdUQnFwdDlDL2J0Y1Y2UTMzK3YvV1dPdzJqekVzSXppV3hTbnIwZEVYcklI?=
 =?utf-8?Q?1cmQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e06f176-ebe8-4544-2e66-08dcd173f599
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:38:35.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QY9wR+NYJclve28Z0wfTlQv2LAJEGe0WcMEeN+WCb1N8GZnnfTFyS6MMmRwhorMQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
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

Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> It does not seem there is a need to set the current entity in FIFO mode
> since ot only serves as being a "cursor" in round-robin mode. Even if
> scheduling mode is changed at runtime the change in behaviour is simply
> to restart from the first entity, instead of continuing in RR mode from
> where FIFO left it, and that sounds completely fine.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 10abbcefe9d8..54c5fe7a7d1d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -356,7 +356,6 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>   				return ERR_PTR(-ENOSPC);
>   			}
>   
> -			rq->current_entity = entity;
>   			reinit_completion(&entity->entity_idle);
>   			break;
>   		}

