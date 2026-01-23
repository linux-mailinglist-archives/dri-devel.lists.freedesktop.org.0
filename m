Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJKLM+mKc2l0xAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:51:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E226773FB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C728710EB10;
	Fri, 23 Jan 2026 14:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0w/2bpuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CEA10E2C7;
 Fri, 23 Jan 2026 14:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/HLGSe59IhQ8n0yQro4VyTOLCZi7z/UMPbR0d5zje84Nd09zqvRU1upNWY4n0vGpIPUTTubc+TUliYGweboVoL5Bh+JrpyXQcl+FtBp03gNK+lI97lxoLZZ/6yl3jr1qnEwZzvgdRh549o2Ab2zyv6O14VeDS4ED+UV2CpoPSQxmZOznhE6tAEmr5sV8cTSpFl4UXc4RyP+hu1g+x8Ox+plUh+QSxgta/y3Sk7WcRUfn8u0S6jzXJ//LRolq78Tra+UoS3fBIPobKmG1iZjU/KXazgPmKJ/cZoI7AcuJEocGOxxbYWtfMXMUcFY4mZRirAMgqLcLmhzn305Q3Qg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ocZn+8Tm1uicKZMJnZY2md6g0fxQPTz51CRdlGJ2rk=;
 b=e/wEQasi2ScgoBtduStq5tukOzIucIJRKoTii71wyWiVTILVLSWDEMn0W6Wj/H3udvLQJgwDumG3fz6AQZgZy1R68WaEv18B64isFjBL5/cUFQgxXjBNdVxI75CqgoCrFWeR162hfq3DnVJS34X3GyksMVxD8IAvYEJt04ybwVvROLRHw9S81PoJJ2LN/yP7sd04phkzBhHoztVqwzn7sdVS0RdGt++L8HnWs3UMTpjQyBVdp3K4IK+bdfWyhV+Wnt/F9zGwl8deRQEYYDawmtaeEz0o+pcKgFL6AGrzie7j8RR5YwQd1EEP08l8OMFXiXFswNkuJaoEYyFtFX2AYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ocZn+8Tm1uicKZMJnZY2md6g0fxQPTz51CRdlGJ2rk=;
 b=0w/2bpuh/BX9o35bPa/+X5PgoV862FC1WXOk41egSUrGpiXyL6Pn5wSIyIzSqf+UpNg4Itlv4I8cqQ0SkTbcZXjlF+Fjw+jxJFjPiS4fKHzFVe5yqYi00Gdq5TDLvsGkQM9uTWaSBwAfekHsYylxXvciPbdBPuQ+5wijkY+DVkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8765.namprd12.prod.outlook.com (2603:10b6:8:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 14:51:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 14:51:10 +0000
Message-ID: <6e019848-7880-4758-ae15-35db86ff7f93@amd.com>
Date: Fri, 23 Jan 2026 15:51:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/amdgpu: remove
 AMDGPU_GTT_NUM_TRANSFER_WINDOWS
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
 <20260122170218.3077-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260122170218.3077-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 0982cf7b-ec2f-4543-6c83-08de5a8ed84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1pwcnNnOUVjQkRtYmNTMWF6Z051WDY0WlJSYWxSbU5weGR6bnJZR3dSYklp?=
 =?utf-8?B?OWVJcGdWdkxUSTQ5LzErczZwL0prRWMyL2U1L1lrNXQ4d1RNZFpKVUthRUFS?=
 =?utf-8?B?YlBXanQ3ZDBWRmREdmRZYmZrWFBGZXBKVnc4L0JoOXRDNzAxb3pwTVg2UEl5?=
 =?utf-8?B?NE51S0lPNjN6VU9FWkRGUzZaRGtZajdVaTZONWVJVzlvM0RGRTdkZ252d1dp?=
 =?utf-8?B?UzVHcVY5dkZ2R3Z0MHFsaGdRSzc1Wm1oQUtJQktBTVV4NUJtQ2x6SWJGb0NW?=
 =?utf-8?B?Z0p6YVFTd0hycEdQK1BINHZRTU03MXV3YkF4STFmb1NlenBnSEYwMk8vbVZT?=
 =?utf-8?B?OC95ZnhyS2tycjVpRzg4bGQ0VmhTZjQreUNDb3lxYTlJU3FkS3M3M05EL2VV?=
 =?utf-8?B?L0dCWHJNd3FnRXN6b29qT2gxS2pwbWN0VCtCRFNYQnUrazlHZGlQdVZLQUdn?=
 =?utf-8?B?VTNqZ0VCYlJqa1hDakdHOHRNNWRPYUtzcjR5NkJxTEIxVjIzcUxWWmE1YmRv?=
 =?utf-8?B?UTNqWVpSSDhNelpyMzAzQzlXQm1BNWphaVN0cW9ieTRsNllvVGY1aGk2T0RX?=
 =?utf-8?B?dkJYcWFPeUF5UlgyRTRobU9QMUVReS9ZaU9zdm1DeDlRUE1Md3hIeW1kaEFn?=
 =?utf-8?B?MG9OY2tlaTFqeUxuMHUyMkRIT0FDdXBERWdFVDdpbjdUenJUNG8vdG5KNE1v?=
 =?utf-8?B?UVoxYjVkQSttKy9KeVJ4TFVBQ2F0TDVCWFl4S1JPcUxEZHNydE9tamZHTjFj?=
 =?utf-8?B?TTNOUk50Tkt6dzhIeW5lUjhwL3A2OUNSenRHZG1ORDhkOFlxMHdpcFpZaGNH?=
 =?utf-8?B?bkpkUGZrQWswNFVCNUsrL2Foditpc3V1bDMxM3BBMUdTSXhpQWRLQ3FTWUdF?=
 =?utf-8?B?YVRwcWx2eVJpOUlyMUNQdzhORk5GRTNFdHdzdmxpU1JIR1prK2IzZ2VxRHh3?=
 =?utf-8?B?c2NWdStkM1gzekIwTmVoSFB5QTNZSktCZ3VMS3V2eWgxVmdRNXZCbTRjVVRB?=
 =?utf-8?B?TDJIVjcyOXRqVnRzY3AzZllJMWRJM2hUK21zYzZ0YnJNaFIwaVF4MlhGbXBr?=
 =?utf-8?B?T1RITnkrbGN2eGNTb2F3c2JXaE5wMjFpMG01aG5SbU93ZmdkaUM0b0dlazZE?=
 =?utf-8?B?Nkl5dTMxcVlJL1dqS0dJSTMvMnljOVBoSU96TXlJZGwyMGNnaXhxNlNNOHdV?=
 =?utf-8?B?WUk1WkN4OE9EaE16TzdqdTBFUXBkVHhUNjNVVnhkSnJ3TGRXNXAzVXhSaDk5?=
 =?utf-8?B?YndnU1l6Q3NYdmpVa3ZVek5LN0Q1UTBoZUxZUG9FaE5XVDR5VUFmb2NxWWdn?=
 =?utf-8?B?eG8vZkRzUndFYXU4OEFkTnNtbG84NDhmOFRyanRMNzNaalJJVUtLU2dvODVF?=
 =?utf-8?B?TzJDRWFyNk5WYW9jbW1mSitrWWh5WlNpTHcrcGMwaWo4TWZJdXpXQ1NUdHo0?=
 =?utf-8?B?RzNUY1J1S3o4T1RVdXNMKzVtS3dpeExiQUxYUEE5RWNYbFJ0QkV4ZW9SYkE4?=
 =?utf-8?B?b1JwODh1STVCVjRYSWhXMkJ4L0Rlc0MvSEMybXNzNnZDZStWcVJQVFBIMWll?=
 =?utf-8?B?THFlSVVLcU9qL0F5a2c5cDBkNWswTXJZV1VodUFUcUdXWFhrYXByK25yM0Q0?=
 =?utf-8?B?VUVwWEtDMzBKVGZUcjliUnZTNUFFTWpUYjcwZjhQNU5lOThra21HVVVsbGE3?=
 =?utf-8?B?WkZkWHFZWGYwcXVpL3FBZTBzYlJ1S3Y0ZVdLVDY5cmV1NTI5VVZXbUtCYVB1?=
 =?utf-8?B?N0ZNb0t5d2tpN2l0RHpNc3pIUnJlUUtoNFBMRDNCakJhejJzYU1wV09VWDZR?=
 =?utf-8?B?R25UbThvZjc0ZzJLZzNPckZnUDE5QU5NRm9rcUFyL0ZFZHhoejhzTk82RXgz?=
 =?utf-8?B?a0tRU1JaaStLQjNEMElxZFFWOVYwcUFXRDZHOHd2L3IwR1Z5UmQ4d0hqTFRH?=
 =?utf-8?B?ZklWZ3B4c2NoTVF0RWRLbmxvVDE1cld4UVNlb05WOWtOTHJZQ25wMmRhUHlk?=
 =?utf-8?B?NG1OM3pua1plWUFYZEZZZmt5MHJDcjhTdDMrblBXNVJlSXk1T2VEVVBiVnVJ?=
 =?utf-8?B?MkZ6alBTdjB6U1l0VG8xc25wMUZMZHRkNzJnTkxKRXAwb3psUVdORGR0dFVD?=
 =?utf-8?Q?VH1Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXNoamVCNzRMMUJRNVZZVTJkTnU5R1JtSGlLQU53MHFlWTUzZ2tLVFI3Vk96?=
 =?utf-8?B?SWtqNlJlYnZYVlFpeWN4NlArZkhKbnhRZG92Q2lCT1pUajdtaG0xdk9ZZU91?=
 =?utf-8?B?aWdXcXFsNXRyS1NCb2hNREltWjNxQmxaOVBBczByK1I3WmlIRGI4R2J6UTJ2?=
 =?utf-8?B?ZWJkeGxHbitnVlZDb25QVnVrb09MR0s5aTE3N3U3VStkWXN0VHphS0pGa0c2?=
 =?utf-8?B?cExIWXdPVHhYNVZ4bkttY3lQcFdKZjBUN1VkcVMzRlV0aVVLOGFrZ3FoUHpk?=
 =?utf-8?B?WEJsbmxwakEwL0t3ZXRNVmluSjNOWkRBYU1GbHd6M0xYcFNUTzZBcGozMTJC?=
 =?utf-8?B?N3FHV0lFMytvSE9qMVFJRDNldHU3UGJ3MWNEeUxSckNWZ09lemt0UkgzaTBW?=
 =?utf-8?B?WUVSdnhFcTlkZ0xwM1J1NVcxTnAxMEtDZVFSZTAxYzVOREROZUQ4UzlTSjJt?=
 =?utf-8?B?YkVuSWVhY3duY3BQVG52dWtuSS9UMzkwcFNQSlFITHVnUXdkNFdudGZNKzFN?=
 =?utf-8?B?S1RIS05hcUU2dVlpcVppay95NWQrR0JUU21SOXRqZDRxL2VQTkY2aUg4cHk1?=
 =?utf-8?B?OS8vVWlRYThvL2ZLSGZ1UnBkanlFS01EdHViRTd2SkJuQkFPSmVTWDZEb25C?=
 =?utf-8?B?QWZDMlhSUE9NNXlvN0xXSDBQKzdxTC9SOEY1U3VjL2dxTXZQRmxGZG1qS0VB?=
 =?utf-8?B?LzJYZG4zYklwNXhXVDFKMkM5SnB1dnlhZm1hR0k1TXZIMHZzNW4rN1pFUURI?=
 =?utf-8?B?MmlmanI4UDJYd1Y0ZFdKZjZtZEIvN045OGNYWlVibDllbXJoNHpwMGxPS2Y3?=
 =?utf-8?B?RGJINmM1dk9RWVY1UkFEeUFCQThzRzBKS3Z6NERobmwvbzJSTVprSWNTVWpJ?=
 =?utf-8?B?Zy9NbXRWd2RCb3JBRDNTSW9BSXYyYkhNNGdoNnJMQnl2ZVdXbjhnUml2ckhi?=
 =?utf-8?B?RnJUQjh3Z1l2NGd2VXNaenJlaGZPNU5GSXYwNVgzRjZFamRMNzVBOFdLVkpm?=
 =?utf-8?B?VDhScTlham1qaElxNXF5MEZuZTNDWXVkdCtzK2YrZElOSVp1aUNZa1FvdlZT?=
 =?utf-8?B?Y2U0Y0hkKytqYTFzZVRxK0YzR2NLRDBraG9MK3BSQ0N4T04raGd5amxpKzZX?=
 =?utf-8?B?ciswU2Vma1JldzNYQTEvU3lWdmM0ZFQ1TXpSUHc3Y3U5bm5wRE02aUlaWVBE?=
 =?utf-8?B?WUhDeXNyeDFSYjBGeXh2ZjNGTjVJTU5pODh4SVFXK1AraGNXZEZnZmVadzNz?=
 =?utf-8?B?Z216WGh2blVjYXdjVUkwWUxOeHdjUVpibkhIY2tpSGdDQmlkR1RpbFN1ZHRt?=
 =?utf-8?B?MXJWQzRqeVduVjRnaDN2MmYzSmt6MlBNRElHd3pUSXg3Ym1UYXNZb1hGUWxr?=
 =?utf-8?B?ZVlKV0RYWFNISlljR1hqc3c1UFRZNlV5M0VQVzhjNTFrdllWcTJoSGxNWGUx?=
 =?utf-8?B?R20rTVkwWkpSRFBydGE5OHdRb0lNUnVNS3JsVXQwTSsza012ak51bDhNakZa?=
 =?utf-8?B?clQwb2E0TkNSS0pWenRTMVF1c0VySHZJWHBaaTliSXVBdnQyV1dzV2laUXAr?=
 =?utf-8?B?RnZsYmdJUnRNaGVPcGdrcG5LZUtkamtCYXMrby82ejQ3SnhEbCt5ZFhMMjUz?=
 =?utf-8?B?NXE1NWNVeXFyRzgvQUZ2UUYrNEFyNnJFakdXaTlFN2t0VEp6MkNzT25KWnhp?=
 =?utf-8?B?QXA4NmN3ckFSRytoS2Uzd1JQa1FVMHdRWEMxc1k5MmtMb0tVVVdqU3RKZXRM?=
 =?utf-8?B?QzdyRTZBeVR3dEI0S3phVXpUbUZvMHlYMVF3eUFXWjhNODd5OW9mbG5BVjBv?=
 =?utf-8?B?U2ZJaU45NGF5RngxUS95anNFSzd0NU9WU1FEUWxwOEJtWEZXbEJiNEMrQmRQ?=
 =?utf-8?B?WFZhRnMrM2p5UUU3K3hWM0FsU1g4dDRFWkR2M1J4MStieTZpS3FOekwvUHIz?=
 =?utf-8?B?YmVuQUFyUHB3SU5sS09IeUNXb3lrRnJUUnNCeHNWNEZFQmcybHZtK1F3V2ll?=
 =?utf-8?B?TmpsU2FhTzd4SkpUNzYvc1c4UXlmdThvSWNXSHVDUy9XOEJ1NnFyZGVSRUFI?=
 =?utf-8?B?U29reHFjMW1TUW1oMWJ4STJmUVJURXpYTmlHR0RndDhOYmd0SXFXUkFncFBp?=
 =?utf-8?B?QWd4eEdpc2hJNXE0Z3I0cEVBaVRZTmlkazlKVXM5QXA1TzRSSGVsNVNhaDU4?=
 =?utf-8?B?Tk1sL3E4MEFrc01OdjNXYk1NdzBVTWlsalZsZXNCRDVSQXJSMVBLN2IrOUVt?=
 =?utf-8?B?ZGtMUHFUNmhMWXplVVZsaUxjY1hHRFluU1ljTmhoMGVTbGZmRTJlbktoRktM?=
 =?utf-8?Q?dbQD1upCpDc6dqRjps?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0982cf7b-ec2f-4543-6c83-08de5a8ed84e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:51:10.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JM2r1UjkG5ARtQKL/fBjh/IMbmmA4Ov5Iz5rj5DlUVbrr+8qRmNKLhSvs3Knq/zF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8765
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7E226773FB
X-Rspamd-Action: no action

On 1/22/26 18:02, Pierre-Eric Pelloux-Prayer wrote:
> Instead use amdgpu_gtt_mgr_alloc_entries to avoid hardcoding
> the number of windows we need.
> 
> It also allows to simplify amdgpu_gtt_mgr_init because we don't
> need to reserve some pages anymore and this makes the
> amdgpu_vce_required_gart_pages function unneeded.
> 
> ---
> v5: switch to amdgpu_gtt_mgr_alloc_entries
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

I agree with Timur that it would ne nicer to do this step by step in multiple patches, but it's not a must have if you find that it is hard to unfidle.

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 66 +++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 18 ------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 27 ++++++---
>  6 files changed, 63 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index dd9b845d5783..9b0bcf6aca44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -324,17 +324,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  {
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> -	uint64_t start, size;
>  
>  	man->use_tt = true;
>  	man->func = &amdgpu_gtt_mgr_func;
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	start += amdgpu_vce_required_gart_pages(adev);
> -	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> -	drm_mm_init(&mgr->mm, start, size);
> +	drm_mm_init(&mgr->mm, 0, adev->gmc.gart_size >> PAGE_SHIFT);
>  	spin_lock_init(&mgr->lock);
>  
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 8b38b5ed9a9c..d23d3046919b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2012,37 +2012,47 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
>  	adev->rmmio_remap.bo = NULL;
>  }
>  
> -static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
> +static int amdgpu_ttm_buffer_entity_init(struct amdgpu_gtt_mgr *mgr,
> +					 struct amdgpu_ttm_buffer_entity *entity,
>  					 enum drm_sched_priority prio,
>  					 struct drm_gpu_scheduler **scheds,
>  					 int num_schedulers,
> -					 int starting_gart_window,
>  					 u32 num_gart_windows)
>  {
> -	int i, r;
> +	int i, r, num_pages;
>  
>  	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
>  	if (r)
>  		return r;
>  
> -
>  	mutex_init(&entity->lock);
>  
>  	if (ARRAY_SIZE(entity->gart_window_offs) < num_gart_windows)
> -		return starting_gart_window;
> +		return -EINVAL;
> +	if (num_gart_windows == 0)
> +		return 0;
> +
> +	num_pages = num_gart_windows * AMDGPU_GTT_MAX_TRANSFER_SIZE;
> +	r = amdgpu_gtt_mgr_alloc_entries(mgr, &entity->node, num_pages,
> +					 DRM_MM_INSERT_BEST);
> +	if (r) {
> +		drm_sched_entity_destroy(&entity->base);
> +		return r;
> +	}
>  
>  	for (i = 0; i < num_gart_windows; i++) {
>  		entity->gart_window_offs[i] =
> -			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> -				AMDGPU_GPU_PAGE_SIZE;
> -		starting_gart_window++;
> +			(entity->node.start + (u64)i * AMDGPU_GTT_MAX_TRANSFER_SIZE) *
> +			AMDGPU_GPU_PAGE_SIZE;
>  	}
>  
> -	return starting_gart_window;
> +	return 0;
>  }
>  
> -static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
> +static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_gtt_mgr *mgr,
> +					  struct amdgpu_ttm_buffer_entity *entity)
>  {
> +	amdgpu_gtt_mgr_free_entries(mgr, &entity->node);
>  	drm_sched_entity_destroy(&entity->base);
>  }
>  
> @@ -2343,36 +2353,42 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
> -		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
> -						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
> -						  0, 0);
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
> +						  &adev->mman.default_entity,
> +						  DRM_SCHED_PRIORITY_KERNEL,
> +						  &sched, 1, 0);
>  		if (r < 0) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM entity (%d)\n", r);
>  			return;
>  		}
>  
> -		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
> -						  r, 1);
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
> +						  &adev->mman.clear_entity,
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  &sched, 1, 1);
>  		if (r < 0) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO clear entity (%d)\n", r);
>  			goto error_free_default_entity;
>  		}
>  
> -		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
> -						  r, 2);
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
> +						  &adev->mman.move_entity,
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  &sched, 1, 2);
>  		if (r < 0) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n", r);
>  			goto error_free_clear_entity;
>  		}
>  	} else {
> -		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
> -		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
> -		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +					      &adev->mman.default_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +					      &adev->mman.clear_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +					      &adev->mman.move_entity);
>  		/* Drop all the old fences since re-creating the scheduler entities
>  		 * will allocate new contexts.
>  		 */
> @@ -2390,9 +2406,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	return;
>  
>  error_free_clear_entity:
> -	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
> +	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +				      &adev->mman.clear_entity);
>  error_free_default_entity:
> -	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
> +	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
> +				      &adev->mman.default_entity);
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 871388b86503..c8284cb2d22c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -40,7 +40,6 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -56,6 +55,7 @@ struct amdgpu_gtt_mgr {
>  struct amdgpu_ttm_buffer_entity {
>  	struct drm_sched_entity base;
>  	struct mutex		lock;
> +	struct drm_mm_node	node;
>  	u64			gart_window_offs[2];
>  };
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index a7d8f1ce6ac2..eb4a15db2ef2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -450,24 +450,6 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
>  	}
>  }
>  
> -/**
> - * amdgpu_vce_required_gart_pages() - gets number of GART pages required by VCE
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Returns how many GART pages we need before GTT for the VCE IP block.
> - * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
> - * For VCE2+, this is not needed so return zero.
> - */
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
> -{
> -	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
> -	if (adev->family == AMDGPU_FAMILY_SI)
> -		return 512;
> -
> -	return 0;
> -}
> -
>  /**
>   * amdgpu_vce_get_create_msg - generate a VCE create msg
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> index 1c3464ce5037..a59d87e09004 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> @@ -52,6 +52,7 @@ struct amdgpu_vce {
>  	uint32_t                srbm_soft_reset;
>  	unsigned		num_rings;
>  	uint32_t		keyselect;
> +	struct drm_mm_node	node;
>  };
>  
>  int amdgpu_vce_early_init(struct amdgpu_device *adev);
> @@ -61,7 +62,6 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
>  int amdgpu_vce_suspend(struct amdgpu_device *adev);
>  int amdgpu_vce_resume(struct amdgpu_device *adev);
>  void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
>  int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
>  			     struct amdgpu_ib *ib);
>  int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> index 9ae424618556..bd47fda52e7e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> @@ -47,11 +47,6 @@
>  #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
>  #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
>  
> -#define VCE_V1_0_GART_PAGE_START \
> -	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
> -#define VCE_V1_0_GART_ADDR_START \
> -	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
> -
>  static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
>  
> @@ -541,6 +536,16 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
>  	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
>  	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
> +	u64 vce_gart_start;
> +	int r;
> +
> +	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
> +					 &adev->vce.node, num_pages,
> +					 DRM_MM_INSERT_LOW);
> +	if (r)
> +		return r;
> +
> +	vce_gart_start = adev->vce.node.start * AMDGPU_GPU_PAGE_SIZE;
>  
>  	/*
>  	 * Check if the VCPU BO already has a 32-bit address.
> @@ -550,12 +555,12 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  		return 0;
>  
>  	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
> -	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
> +	if (adev->gmc.gart_start + vce_gart_start > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> -	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
> +	amdgpu_gart_map_vram_range(adev, pa, adev->vce.node.start,
>  				   num_pages, flags, adev->gart.ptr);
> -	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
> +	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start;
>  	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> @@ -610,7 +615,11 @@ static int vce_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
>  	if (r)
>  		return r;
>  
> -	return amdgpu_vce_sw_fini(adev);
> +	r = amdgpu_vce_sw_fini(adev);
> +
> +	amdgpu_gtt_mgr_free_entries(&adev->mman.gtt_mgr, &adev->vce.node);
> +
> +	return r;
>  }
>  
>  /**

