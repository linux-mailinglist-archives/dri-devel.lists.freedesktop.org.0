Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58940973AF3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C138910E84E;
	Tue, 10 Sep 2024 15:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="skzUzBU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD5B10E84D;
 Tue, 10 Sep 2024 15:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sp5plN9czAXo9MR+95uPR3e9O3kbgrNG5E7L5DlAfoBi3/5M42E1+mVR3+c0hp2OMCClno1sMkDFI6QUMI9v+TJ89ahCDJ5J6g4Ot1xhCMioibMFf0qb7RG759s4RpYKlD+26GSf1sarpmPSLt6p/6f2MTwOKy+FvGRTIQ2lc5YxFREcLbS3yWtauGele9YOF7McOiQoRGXtvClDGhmO4GZmVit2/i5N28HlWOnv7daLFrPNwbR1n2ct3lX6vfxJXVsJW08Aw59h4c715UY8yVzZaaaeYTSGr971JqjkfrcHH2KwsQA+2F1OJwE/FuK6ja4Xf1DZanpczn+XDPLBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZcKmspxf3G/+qIzL0a/St4dSktVFpQPYk4RaZ+XfaU=;
 b=g2XEkai4gsc3pyjWHnsXdfK/K+Shz0uZAswXMk3NbjyaOeuc3j2d4Hw9rnS7q1FNqEbGFg7lDEvboq8UfBu99LtiuUp479NwmQV4kAktrkZ4/+0MXpaMdX5yT/ibOHvC9x1uJNWhNTaox/1KT4kp2LC54GKsZHUyD45YLji2Y+PP4bfvQdSiuLS5p6scKYtHYambm2hEd1If5Yj8MpH3yqxhhXTarQoKMTqLsyXncF0EuCZbWd2EuZ4TvxuRtoP0dxNVZRE/K9xIbRuRgKauzI2DaiWkzvsda0jE37VBBo526i6CViY0sL0VAjrttQEjExbGQFYD/KsEa7hN0TxOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZcKmspxf3G/+qIzL0a/St4dSktVFpQPYk4RaZ+XfaU=;
 b=skzUzBU6Lb2xKHOVm7iaWo5YB7w0CjR9d1+WHYW/dhistc9CSVRtuH0DgKwErjmRfqlA3hMEaHBDPpcmtfV0dgmqMKbW/Edvnk0FuWe8BtQZ9TwzRC+msIiuIKJShgO1xXEnSyzlxIWKKr0YrMI8rSQNKmxSR/4sEHkpyox+6Rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Tue, 10 Sep
 2024 15:05:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 15:05:27 +0000
Message-ID: <b272dd5c-2cbc-4c03-a981-be967bb85382@amd.com>
Date: Tue, 10 Sep 2024 17:05:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
 <5be10361b0b77f2eaf54c52367b5c4e3934443ab.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5be10361b0b77f2eaf54c52367b5c4e3934443ab.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 37520538-2f7b-4fba-7bb2-08dcd1aa00e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnNlYk83U2dYVEpPaFBJejk4UlZkTVRzRE9yU0I1Y1NRT3p2Q2lNcHBSb1Zy?=
 =?utf-8?B?OHZWUFA2YnZqZ2lSNnVYdTE3V3JDeDZNYTIycFhGS0RKQktWd3padzdPOENC?=
 =?utf-8?B?QkFSYVlCaGNuS0NGNWZFMVM1WVFPS1hmUEJnQk9JOWEyRUdjTGlTaFRrWnlp?=
 =?utf-8?B?d2ZROS80N1hIQlYzTENoc2ZaczFrZFlveEFUY1dDemFLd01hSkRONHNJd09P?=
 =?utf-8?B?TElkSjlKSTNDSWtZR1BEWG5vdGlCbGFIMzhRL3ZmRlBFSjRDQzdxM0w5UHlh?=
 =?utf-8?B?NUJ4b2RKTE9DaVlFOENuL0NnUHpBVFBEWExlTlN3Rkxza0FpajkzQVlyeUhS?=
 =?utf-8?B?TjlXOGFEbk1QODgweVRydzdPUTZPbnNuRXViTjk3WmZNRU5aYTdmVG5PbWhY?=
 =?utf-8?B?VTdvLzBuS09Jbk5rVjZLeW1MQ20zMlJvcVBpT3pJakJ3S3dwYmsvMmtpZDJw?=
 =?utf-8?B?WTliT0c3UEdHeDdxcnY2ZitzbTdoVk1NU05kRmZMZlpETjdLeUZnTCtmcVdM?=
 =?utf-8?B?WldhUjdQTWJUTUY3OW92d05WdWFacG9DMnQxUzFFaEdzMDlLVzhQalVZKzhy?=
 =?utf-8?B?blRkQzdFMkxHZC9pNzhEMTUzaU0xM05lMm93ZEh4M0tOOHNYRjNvQ3NabElw?=
 =?utf-8?B?emEvRzNmZmtXY2EyWm5PdFo1anBqakc1VWUrYjUwcUh5WWtCRkY3U09rZC9h?=
 =?utf-8?B?a1NtT0Y4ekxJYlQ0MUpZeUdKUkN5TytxYUFiZ1I3Y05ETlQvYmNuSFBhOFZM?=
 =?utf-8?B?MWdiWFR6Mk1lQllrVFZqRE5vclVSd3ZkdVN6ZVdjK1d0WUI4MHJZYzVobTNN?=
 =?utf-8?B?MkZoVnJqUXgydXQzK3JiUmtvcEJlaFJJeUJYeGRpRGZLUWpSa2QvaUVDOWN1?=
 =?utf-8?B?NW94VTRFUkxFcEdFaFg5SURYbVROancxMkliUEl5NXlkS05NZUpxWGIxMEZQ?=
 =?utf-8?B?eUVPZEZqRXNkbm9vN3JsR2NWYWZzM2NJbjJKRGpaR0dRZ3hud2NFV3c5dzZ4?=
 =?utf-8?B?akltRWJ4cE5UWVFibzl3amVka2g2MTJTZWpKWGVzQU1yM3NQaStlMk1HNGtE?=
 =?utf-8?B?T3p1TDRGdUlROXJJU3lMSUppc2hDcUxPU0d1WjYxWTg3aXpwSWVYbnV6SGgy?=
 =?utf-8?B?Q2JtNFlJUWRUSkdCaURBVTFLLzdnT1M2NW1qaW9WWVYxaHRhOWNMZnZVeSs2?=
 =?utf-8?B?RkZPbUVQNGFBUk4xbWU1L0VySEVKd2d6bUxwNWdPeStiOGRHbEx6SkJ4UW94?=
 =?utf-8?B?QTRWbDZvU0J2RVNhSUwyVWJRYjNtSitkWWZwWFp6dXBkTit5aGduTE9TQ0xu?=
 =?utf-8?B?bWJ6cTJrRFNDT05zUzVrR1IzQ1RRc0xENmtWdWNsbE11Wk5jL3RsQlZWdGli?=
 =?utf-8?B?ZHpKcVkvbU1qRzNJNWp4cHRsak11RUtRWFpsNEVJQmdOT1Q1ZXoyM05DQm1C?=
 =?utf-8?B?dzRxRTdpVzJBZXFQMzRqTWhyWlhRMTRPaGN1WUpQR3dPcHAzU29JV0hIWnZh?=
 =?utf-8?B?eTRpTFlyM3BCd2Z2RGhha1JXZUZUbUw4MGM5d0VNaUkvS2hVQksxcStiaXgy?=
 =?utf-8?B?Nkdyb3BjcU1xa3pnU0dkY0kwOXp6aGUrNmg0cUFVWE8yZnJzUzkzMk9uQm5q?=
 =?utf-8?B?ZDZ3K0tnaWhiTEF3THovclJ6d1loR1hmbS92UmhQdUpGTXNvVFNWSWM2Mmgv?=
 =?utf-8?B?U1Z4clp5eG1lZGRiL296dmVPNG00VGFhS2QxYU10TmN0Ri9sT0U2Szh6L2xQ?=
 =?utf-8?B?cjBFblA4T3pVWUlDeDh3QlVYVVRocmwwQ0JNK0t2b1g1NjFRWEE5NnFsTnE3?=
 =?utf-8?B?c1MxZEt3dDZlOTZaRzYvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FvUHR6N1QvTXZpd3drdTRwWms1aTJTMUNUTHVHQlZ1WWh4aDRZZGdWQi9R?=
 =?utf-8?B?YTJLUU1sS3VOYmJINGVmMlBiME9oZWZKTHc3Qi9uN0s3WlQrSzh2cEhzODNI?=
 =?utf-8?B?cEd5cGoyZmphT3kzTUU3cXc1aE5xdXdqeFVVdWZ0dVpPa0NvTldGL1ZNb0ti?=
 =?utf-8?B?M3ViUE1xQjFkWkdYNnRhZ1NESnNzWld1UUpPR0hTSXg5QWZTdzhBT3BjTTAx?=
 =?utf-8?B?TUorcktpSDhweEJnUjZnMnJyeVpXQUtPQjdja3lyQk51eGI4Q1R2bitHK0Uz?=
 =?utf-8?B?YmU1ajBGYXMreG9lTm1qalM0SzNMNkI5OFUzMkI2OUhweUZvaHJIdCtyTFdN?=
 =?utf-8?B?bFFBaFRiekVNV0pSUzRyOWdXUnVkcUpvdWFORlNnVUxrZGVRWDlxb0ZSakxm?=
 =?utf-8?B?SGZmVlFndFEvYXdHTm9oejZNTWxza3dQTHlkK0p6V0c4bWhsVlRlcWVxcVcr?=
 =?utf-8?B?d0lmRGNsMXc0NGc2UzJWZStBWTgvZWJYYk51UDRmcW5FZ3V6OWhFMzkweHBF?=
 =?utf-8?B?eDNvYkpUWUlkQUFwV2tMQXlyS2ZsbTQ3QUdkUkQ1aGYxSXdnT0RoRHV4NFJq?=
 =?utf-8?B?am5vNytKN21xMGJINi9sazJWcFNNUnhudUsrR0VSdnVQdXlabXdxbGYyM0Va?=
 =?utf-8?B?RDUwRlZFMnZYa1FDZ1FYckNZVlIrRnMwWExmOEJxQ0M0K3NlWmFnSU5qcTc5?=
 =?utf-8?B?MzdnTFRyY29ybmhCNjJ5b2NDcExjeGpZOTBjeHNMdTFBbCtVOGxJY01KMlVS?=
 =?utf-8?B?eHl0eGhLWjFmMXVMa29naFI4VUZuVk9tYVFPc1pwM3NteXVPNUNUZUFrMUUy?=
 =?utf-8?B?RVhXKzF6RUw5YjdFbjA2dk1mc3lDb3FYSUdaUnZkOWlCVWIxUWNHamgvN1c1?=
 =?utf-8?B?a1gwT3dNbyttOG54NmZPOTlueUZiSGRncDAzaCt6ZmVNNm85emc2ZWtpRHN5?=
 =?utf-8?B?NlZaUlVCdmFTMnhzS01MSG1GdmljNkxPVDcwZW95NlVwbGpKMVZVR04zaTZW?=
 =?utf-8?B?eTJFemtqcWMwUmwxV3Z3RGliNEJjc1Vyc1RxRDFUSFZxb01RUVVQem1LNkZU?=
 =?utf-8?B?eTFtV05jMy9rL0NacGJyT0E4a0JTZ2FyYWVKanp4cy9PSHc4MGVvemVWSjk0?=
 =?utf-8?B?d0lHMkJYZ3ZoMktwREx1V2o0ZExjYnJMNnJLRnAreWdiRjZRM25UanhubnNI?=
 =?utf-8?B?ajFPR3BSZnBJM2FwVEc5eVppTG5aZjZKT3JMQnlmdldtQTRGK3JNRnY1eWxL?=
 =?utf-8?B?T2JWai81M0diVlNTRmFzMDFpeDlnaFZrcjNjNUJkckdYVGNEVjZCd0k1VUIy?=
 =?utf-8?B?NExUNGpCb2h2eTdoZWRMWDloYkdPekNFOUNpb1BramVpaUhUSVFZV0grcmtq?=
 =?utf-8?B?Zm0xRkQwQzNlVlozdjdXTWgzYTNrUjhZd0RkL2VVOUI2d2xxd2liTlJQdG5C?=
 =?utf-8?B?RTMySFkxSmdZVFRWTE5LYkpQNFJ0TWJ2NHlEeUx1c0dWUDZmKytON296cnlC?=
 =?utf-8?B?LzVSa3BDMGdESXB3QjIwbnVncnF5N0JwUXFnbUdobzJ5Q0RHTWJXTEl0UEl6?=
 =?utf-8?B?SjZoMVRvUlVlaEo4M1F6SEduYXNpOHRaWkVVK0NCRUY3RFBHRjk3WGhHU0Qv?=
 =?utf-8?B?MkZLSmdFejhNMnVNbGpKTlM2SWpjcUVaN0NPbllkdkhwWWhQaUNhQk13anFR?=
 =?utf-8?B?VHhlcjcrUkJhTFFiZXFWRkk1TW56bWx6elUwM1lDcHBCaEJTamdzSC9MbDZm?=
 =?utf-8?B?ZEVYSTZvYWtZSzhZZ1BnYkRGU2tzNEtuU3Z4dXhmOFJ6VGsvZHoxNWpXZmd6?=
 =?utf-8?B?VWtFRkhlaStRb29Nc3AwMGlBRWRBQThKaGNEVGJoQTUxbmpiT2tvQ2k2MGg3?=
 =?utf-8?B?ZW5NVkRCV1JRSTFwcjhqeGNHUjJ4Vnd4NWpvNTlqOFNvOXpxUkUzclVEOXRj?=
 =?utf-8?B?bm13NG1TYklXU1MwUmZHdTNOekNWYmNOcFNuTzRiemJSK015amdaQThuZHpr?=
 =?utf-8?B?SUk3TlhaZlQwUGwyd0RmcWpqRm9XRGpQbVdNcFR3V280Y2ROa2o0SXpidzZC?=
 =?utf-8?B?bHd2ZWhkMGd0ME8rNlNsUFc2eXMyWk9GajEvUWxTM0RVQXNUZkZuTDBYeS91?=
 =?utf-8?Q?0Ixw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37520538-2f7b-4fba-7bb2-08dcd1aa00e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:05:27.1686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYKl8kzGS/oHumfKXk1IvzNc1rodjMb67h6hJUD36YHcdjqCpgrzH02vqRfIWa1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
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

Am 10.09.24 um 12:25 schrieb Philipp Stanner:
> On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Having removed one re-lock cycle on the entity->lock in a patch
>> titled
>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
>> larger refactoring we can do the same optimisation on the rq->lock
>> (Currently both drm_sched_rq_add_entity() and
>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>>
>> To achieve this we rename drm_sched_rq_add_entity() to
>> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
>> held, and also add the same expectation to
>> drm_sched_rq_update_fifo_locked().
>>
>> For more stream-lining we also add the run-queue as an explicit
>> parameter
>> to drm_sched_rq_remove_fifo_locked() to avoid both callers and callee
>> having to dereference entity->rq.
> Why is dereferencing it a problem?

Maybe add "without holding the appropriate lock".

Christian.

>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  7 ++--
>>   drivers/gpu/drm/scheduler/sched_main.c   | 41 +++++++++++++---------
>> --
>>   include/drm/gpu_scheduler.h              |  7 ++--
>>   3 files changed, 31 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index b4c4f9923e0b..2102c726d275 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -614,11 +614,14 @@ void drm_sched_entity_push_job(struct
>> drm_sched_job *sched_job)
>>   		sched = rq->sched;
>>   
>>   		atomic_inc(sched->score);
>> -		drm_sched_rq_add_entity(rq, entity);
>> +
>> +		spin_lock(&rq->lock);
>> +		drm_sched_rq_add_entity_locked(rq, entity);
>>   
>>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -			drm_sched_rq_update_fifo_locked(entity,
>> submit_ts);
>> +			drm_sched_rq_update_fifo_locked(entity, rq,
>> submit_ts);
>>   
>> +		spin_unlock(&rq->lock);
>>   		spin_unlock(&entity->lock);
>>   
>>   		drm_sched_wakeup(sched, entity);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 937e7d1cfc49..1ccd2aed2d32 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -153,41 +153,44 @@ static __always_inline bool
>> drm_sched_entity_compare_before(struct rb_node *a,
>>   	return ktime_before(ent_a->oldest_job_waiting, ent_b-
>>> oldest_job_waiting);
>>   }
>>   
>> -static inline void drm_sched_rq_remove_fifo_locked(struct
>> drm_sched_entity *entity)
>> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity
>> *entity,
>> +					    struct drm_sched_rq *rq)
> So here we'd add a new function parameter that still doesn't allow for
> getting rid of 'entity' as a parameter.
>
> The API gets larger that way and readers will immediately wonder why
> sth is passed as a separate variable that could also be obtained
> through the pointer.
>
>>   {
>> -	struct drm_sched_rq *rq = entity->rq;
>> -
>>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>   		rb_erase_cached(&entity->rb_tree_node, &rq-
>>> rb_tree_root);
>>   		RB_CLEAR_NODE(&entity->rb_tree_node);
>>   	}
>>   }
>>   
>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>> *entity, ktime_t ts)
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>> *entity,
>> +				     struct drm_sched_rq *rq,
>> +				     ktime_t ts)
> The function is still called _locked. That implies to the reader that
> this function takes care of locking. But it doesn't anymore. Instead,
>
>>   {
>>   	lockdep_assert_held(&entity->lock);
>> +	lockdep_assert_held(&rq->lock);
>>   
>> -	spin_lock(&entity->rq->lock);
>> -
>> -	drm_sched_rq_remove_fifo_locked(entity);
>> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>>   
>>   	entity->oldest_job_waiting = ts;
>>   
>> -	rb_add_cached(&entity->rb_tree_node, &entity->rq-
>>> rb_tree_root,
>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>   		      drm_sched_entity_compare_before);
>> -
>> -	spin_unlock(&entity->rq->lock);
>>   }
>>   
>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>> ktime_t ts)
>>   {
>> +	struct drm_sched_rq *rq;
>> +
>>   	/*
>>   	 * Both locks need to be grabbed, one to protect from
>> entity->rq change
>>   	 * for entity from within concurrent
>> drm_sched_entity_select_rq and the
>>   	 * other to update the rb tree structure.
>>   	 */
>>   	spin_lock(&entity->lock);
>> -	drm_sched_rq_update_fifo_locked(entity, ts);
>> +	rq = entity->rq;
>> +	spin_lock(&rq->lock);
>> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +	spin_unlock(&rq->lock);
> its caller, drm_sched_rq_update_fifo(), now takes care of the locking.
> So if it all drm_sched_rq_update_fifo_locked() should be called
> drm_sched_rq_update_fifo_unlocked().
>
> If such a change is really being done, we have to go through the entire
> scheduler and make sure that the suffix "_locked" is used consistently
> throughout the scheduler. And even better, as consistent with the
> kernel as possible.
>
>
> To be honest folks, I don't think this entire "optimization" patch is
> that much of a good idea. The scheduler has real, big problems, such as
> race conditions, memory leaks and lack of documentation.
>
> I think we should for the forseeable future dedicate our attention
> towards solving those problems, instead of optimizing things.
> Especially if the optimization might decrease readability as with the
> naming here.
>
>
> P.
>
>
>>   	spin_unlock(&entity->lock);
>>   }
>>   
>> @@ -210,25 +213,23 @@ static void drm_sched_rq_init(struct
>> drm_gpu_scheduler *sched,
>>   }
>>   
>>   /**
>> - * drm_sched_rq_add_entity - add an entity
>> + * drm_sched_rq_add_entity_locked - add an entity
>>    *
>>    * @rq: scheduler run queue
>>    * @entity: scheduler entity
>>    *
>>    * Adds a scheduler entity to the run queue.
>>    */
>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> -			     struct drm_sched_entity *entity)
>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>> +				    struct drm_sched_entity *entity)
>>   {
>> +	lockdep_assert_held(&rq->lock);
>> +
>>   	if (!list_empty(&entity->list))
>>   		return;
>>   
>> -	spin_lock(&rq->lock);
>> -
>>   	atomic_inc(rq->sched->score);
>>   	list_add_tail(&entity->list, &rq->entities);
>> -
>> -	spin_unlock(&rq->lock);
>>   }
>>   
>>   /**
>> @@ -242,6 +243,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq
>> *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   				struct drm_sched_entity *entity)
>>   {
>> +	lockdep_assert_held(&entity->lock);
>> +
>>   	if (list_empty(&entity->list))
>>   		return;
>>   
>> @@ -254,7 +257,7 @@ void drm_sched_rq_remove_entity(struct
>> drm_sched_rq *rq,
>>   		rq->current_entity = NULL;
>>   
>>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -		drm_sched_rq_remove_fifo_locked(entity);
>> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>>   
>>   	spin_unlock(&rq->lock);
>>   }
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 5a1e4c803b90..2ad33e2fe2d2 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -591,13 +591,14 @@ bool drm_sched_dependency_optimized(struct
>> dma_fence* fence,
>>   				    struct drm_sched_entity
>> *entity);
>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>>   
>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> -			     struct drm_sched_entity *entity);
>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>> +				    struct drm_sched_entity
>> *entity);
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   				struct drm_sched_entity *entity);
>>   
>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>> ktime_t ts);
>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>> *entity, ktime_t ts);
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>> *entity,
>> +				     struct drm_sched_rq *rq,
>> ktime_t ts);
>>   
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   			  enum drm_sched_priority priority,

