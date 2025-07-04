Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25BBAF8E38
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070610E9C1;
	Fri,  4 Jul 2025 09:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w3XKZPXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D7C10E9B9;
 Fri,  4 Jul 2025 09:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ/4ehlmjaxjEXYlBv7SAYQ+NkgIVLznnX2eaJ03CgelsbvV0Gr+JrMDV1NSAibZbTWbQcqKiwKtNDdGu2IDafVe3oldfu/ZAdevOrFDJ3dD5ngngXNkmaqkzyS5bGov7/oHJqN6UYYoly0ZVt3q9vLKxHaeDsQRj9pA4NjFbCLTB6lw4zicNC+HOVY1wKcCLsEx0p1lYMiqN8wfn6qvzW1ISwF0+CEf0R4Jmo3A7WJO2AA/EZFPRzoHjZne5Ar+tczUcI2mhPJbeQjWv9SGcBFsTOPXys5y9cF6gLQ8ZTmU6KnLk3oPTJaAwh6v3bRjqs9MKJTAilq+P2wneiIJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3orMCRS1ZwpttPCQ39hGJEk83cXGcwch1IxwQHdl50=;
 b=uEm7Z2XZ5aYWLYKxyMOFu0L9ZdTISOwmSSEdRNI2QGaoh3E8uMW8c3rX7McV17BAKKCsc/v975YdhsVEfGoC9N/cKQzrEyutpC7FyHVrfJak/cMY1U8PglzhZIrCV4YtuZiiuswVlBrvmqlvdfnUR4PhlLxbRiAm1cuO5Xp/RFSba1UV9g7ZfrURhNVkeZ+45fu/tArda9QL4Z144hohl1A8pPpYQO1TrAaKrKiu5FfSdB8DtWiGxaNCbjMcPLl0pyrCRQEmA9triJUizsKXL1+bt37/2nR51ZwVuQdWnTlHiPZtOpute/h/uYORGeXTTu962XrYgogb8cf5EiRozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3orMCRS1ZwpttPCQ39hGJEk83cXGcwch1IxwQHdl50=;
 b=w3XKZPXCON1tymwU6T1ZvHepTw495GIXhgpdyDlJYIHrZqate6kvHb6jDpfb0/PbB2xnlSmoCG4LZSFCfwoH2uTFNlakFgUDgN+qXLvXR5TdNF1Kw7Mg7ST+hStoaNo1ZviMVrCoKWtbPKKsdefOhD6LmuypVlo0C9Pm+qpPO3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9157.namprd12.prod.outlook.com (2603:10b6:806:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:20:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 09:20:12 +0000
Message-ID: <a13fe778-a766-4221-8a60-5ee4f25f88d3@amd.com>
Date: Fri, 4 Jul 2025 11:20:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix lifetime of struct amdgpu_task_info after
 ring reset
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>
References: <20250704030629.1064397-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250704030629.1064397-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9157:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f0dc8b-09c2-4e05-8dd3-08ddbadbfa74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVpoT0IxcWVwSVhjOHRmRlZZc1Q0NGptSWlsQWVQT291em9vZ3JScHV0QXNu?=
 =?utf-8?B?WGNSbU5kZFhtMXZjNXhJMFNLNHc5cHhFcFphTWF4Zk5jNVpFUEllZXZ0WlFJ?=
 =?utf-8?B?OG11dFFrT2FXMzloemJHNHpwY0tVaGtYVG81aWZhcHBoVWpacUUwYmJCNVpn?=
 =?utf-8?B?M1g0bkJDZGNrY0MrbnpJV1NFQnh2d2JzN2hyWE9vTE9qZDFKeURoT0ppblN5?=
 =?utf-8?B?ZXlEYzIvWW9ZODZ3YmlzeVFjeno3ZDE0YS9UVml1ODNaN1ZzVk1RNUIvN3Iv?=
 =?utf-8?B?aytMajIwODdxczh0c0c3M1VOZ3hmd0Q3N21ia2k3bVRWNDNiS3huUGsxdTVE?=
 =?utf-8?B?SnFleW1JQXk3a2NWNW1iUE1qQVZYd25NM3hXMkZJUHM1MDlnZ0R0M0ZpSnlx?=
 =?utf-8?B?aE1mQWFCV2xGTHpGZFNORDFocXBrNHViMXJSZG14b1BiVGk1NTNCL3Q0UFc4?=
 =?utf-8?B?WWpBc2RRWUtXUENwNURFL3dqalRsQk9QdHN6ekw2MlpMbEZoTWFSVWg4OVo2?=
 =?utf-8?B?dUhhZVpKdDJ6Q014SFVsT3ZjcjRlRVBzTlhCd245UFJ6Yi92cERLdDZjdTVV?=
 =?utf-8?B?K0U3cDVjTlhkM08veHZiYk5HYXBadGl5REdSZ25XSDRiWlFrRlJUcWNkQm4x?=
 =?utf-8?B?YmErOUkxZ1JhSjltbnJjSS9Nb3g0NUxFVi9uMEZJdWVDSm03aHlxLy9IMlQ4?=
 =?utf-8?B?S05vQ2duWTVHYmo0Rmo5U25uWU9Bc054VjFkMDlmckRiVEFjNVEwRzAwVWlj?=
 =?utf-8?B?TENNU2UzL2lPZEhLSzRhVVdEUnRuMC9OcitRbG04ZzBnVnVpY3F5bGlXTGpa?=
 =?utf-8?B?RnlRdEltVzJ1NHdXcGdxMDk2dTZDQngrRWl6ajVVbVFhMkdraHgwTS9kSUlw?=
 =?utf-8?B?ejhYVXFnVk9HMXZKcHlpSjdTU25wcU5kREt3TmRDSDNOYVVESmpmd3IwWWFN?=
 =?utf-8?B?b05QbXBPWXMxZXVmdmVrMDhxOVdlazZ1WFlBSjdTV1FFLzZ5a3JyUG9iOWEy?=
 =?utf-8?B?dy9OL3Q1MjVveVc1QmRWVk5rSktPK0hZaWtLaDRDR1JoUXZaTTV5MHJyZFlH?=
 =?utf-8?B?Ym1FWGN5UThHc29qNHo1ckgxRWU3bzJLNzVWbXNIYVFSMGhhdHZWbEZSNzR6?=
 =?utf-8?B?elB4OGdra2VrSzVFNkFyS05tQlA2a0tqem5WRHNYNWpxNHVvdUpwMjRUeEV0?=
 =?utf-8?B?cGtIMjRDdTNnRGZoSXdyWkNsOGVFY1JNcyszOGR0UFNWRUd6Z2xra1pKT1R3?=
 =?utf-8?B?YXArZVU4bG8rQ1hCL3NtUFZGcEJ5YXI2WlJkSGtibmQyNG5xY2Y5d2l4ejcy?=
 =?utf-8?B?dGIrdmg0RFZOV2dTWmZZY1U4em5DM3oxQUVTSVIzc1kwWXV3MWR2ZXg5cnNQ?=
 =?utf-8?B?Sklqbmd3TWwwc29HTCtwRS9PYUN2L0VNbksvU2hOZ1h6b01oWUFxK3VuRktw?=
 =?utf-8?B?aGljUlU2bit4cmo3b3JobHNkeDhqL0t5cDNpenpBcGVVeVUxbnk1SlFETEcz?=
 =?utf-8?B?MTJ4MTQrb3VRY3lQYmFLajRVK3JxSTZQczgvYXorYmNweGU3T1hUNW9pTnhZ?=
 =?utf-8?B?TG1xS3BOakpMUVM1aDlzYjUyQXYwdzhoa2xIRWNxdVdlSExhc1h0MHVvRzZt?=
 =?utf-8?B?NnVBaXlXOVU5T0d0a2xTRzZGeHdNL2kwZXM5eDF6NTdmWVlZcGNpM25BaGo0?=
 =?utf-8?B?U3Y2aXAxSTN0UnpBS2tReFY1V3l3RXJtRzd6VmxtUHI4U041cXJiRDhYbnJq?=
 =?utf-8?B?V3dNSHNMVVJlTjRBZy92V1JaVFdvbURMOWpLY3BXdk1oMExXK3hqY1ZLVGg5?=
 =?utf-8?B?Slk0THdsWE52c3JVTHZPSWliMGg4bXd4U3RwSnR5NUpLdmwwSWp1QTd2T2xQ?=
 =?utf-8?B?djlsQUV2a2RuUVhXQXVrbEd2UnFPdkNwUE12NVRJL2ZqcmRpUzJQTUY0S090?=
 =?utf-8?Q?0b6+exG0wP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzNsWUg1K3hHdG0zbFQ3bmFmczNPQkZGZXBwQUtLaG16RENnK0FiRlA1M3pJ?=
 =?utf-8?B?T2VMZzJpdDM5K09oS3VVendlZUFoMEFmaEd5dHNWZjdqZFA2Q3dBbUJ3Umd6?=
 =?utf-8?B?b3ltekRqb1krbkFheURKQlAyTXF5M1ZmYUh6YkxWemViMFEzZHhyWExRSVBV?=
 =?utf-8?B?WXBZUzU5TzVvODhydnZMRWlkMlJUdGF6aElpRGxQMUZ4RnNLN0w2V0pFc25k?=
 =?utf-8?B?Mi9ZUDlpa3V3UFgvdzZQYnh0ZG92SE5pOE5OeHlneWloOUc4aGxTTTFrajRS?=
 =?utf-8?B?dzJIVS9ONHZmY2lBZ1RQaHp4Y01JM3FvVXFVcUJDMFlTZ0xuNytCQWZYQkJJ?=
 =?utf-8?B?L2pneExYRkNnWFAvWjZWd1lTakhjQUhsWU5lNkFESlJpL0FvdHc1UVRaK3o4?=
 =?utf-8?B?Vzl6U1FyMTBDMXBTUDhsUHg2Rm9xYlFtbTNlVmZ2cC85cnIwMnNTS25vR0Y1?=
 =?utf-8?B?T3p1cC9XdnlqRzBDOU1LUmYwS3NKZjh3Q21UUGxvTk5iUklKb2NwajI2QVZM?=
 =?utf-8?B?SzNLaGNSTWtiRkxvc2FqVklkV2pNclJTYlY4aVllczJoV1VicFFqYXFrUi8z?=
 =?utf-8?B?cVFRVDFwS1BFTlovNGlkTmZoSldRTm5qYWY1ektCMnl2UWxieTNmRE1LQzVW?=
 =?utf-8?B?NXhPbElxc29WS2tLaHhxWVVWZnhSNzlyYmtTbnovaVpsOTNiSkw5MkJHNEMv?=
 =?utf-8?B?OEJ6RzZjWHVac29uVDkzTlNmV09pdUNXaVBXWDN1a2hEQjVRMUZWbHBTcnBY?=
 =?utf-8?B?cFZFTXRjWXR0M2NTWTdHQnJTSW51WE1WTGJJMVIrcUw1TDZZRC96NzNmU01R?=
 =?utf-8?B?RlFlc2oyQnVBSEY2L1RtRWpTR1hHOGE5QXlEeGZFMi9pckJxU1QvSENKdVFv?=
 =?utf-8?B?Vmg4dnIxa3Z3ZlVoeVd3a0JXTWZnOFVlellJV0RabnYvZzFSaDMrbTlBZ2k2?=
 =?utf-8?B?UjRFalpTT0JKRERYNzM0NVRVT2pEci9hWE1pZUd3VWhNcitWbjMwd2lkMkMy?=
 =?utf-8?B?bGxpM3orZjhock8wOWNqQ01CbytLQlF2aCt5OEdvQVQraUlhZmF4NG03Qm9r?=
 =?utf-8?B?TkhMZ0ppbThMQzY4a1Z1M0d6K2xIdU0xaEdQbElWTllEV0dSbWdYSnNNaFhr?=
 =?utf-8?B?K01NZEp2RWluL2FKOEJFUEROOXdyWklHdEtpYi9aVkVqTW5sOW5NMEZHQmFv?=
 =?utf-8?B?UDFnaGhzVHV5WnpqR3k2ZmxQcndCUHE4Nmw5MkhGVE96UDcxbG9qeHNVKzAz?=
 =?utf-8?B?Znd1blBhcnNtZ0Zpb21Sd0pRcTJkK3lSOTYwNFdBR2VId29HeHpIMWp4S0tZ?=
 =?utf-8?B?RVdlLy9Ba3Q3OXVSVHhCNmJJMDNJRHhlVEdURkhReDB3dkhDSUs1MFAwR3V3?=
 =?utf-8?B?NnpydDlTelJMSTdUNkR1a1A2eTJxVTZERFRrNUx5ZTJoU0pGam9JcC9LNVp0?=
 =?utf-8?B?M2RtWWs2Q0pMN011bisxdmMvVkxSR3EzNUJWalZ2OXZiNkVSckZTRmcwaDVF?=
 =?utf-8?B?K2t3R0c2TERQZ3NLejZkbFFIOHJmMWx6S3JIN01MR1d3R3U3UGRBRlhUbXZE?=
 =?utf-8?B?SjBpcUlZMU1ieERBRVl6dHdSK282YjRTSk45N1laODZBdWhCbys4WWVsMHpj?=
 =?utf-8?B?MVl2YzB2UzJhRm4raTdaZkc4ZWRtbjFXTXQrOFZuK0xiTmYrdUxoZ2ZNK3BI?=
 =?utf-8?B?WGc1b3MvYXNUY05XZTBsM0RzUy9iSWw5K1N6b3VZblA4RllWUmVYVzJTSjZU?=
 =?utf-8?B?dXdpOTBad0VYS0tzNXJ4MStiOHU2dC9xYllhc1g5Mm93andGMUF4NkovQ3hR?=
 =?utf-8?B?cjIrU2ZxQ2FEbVQ3dXpITHRtYUprbnFrbjYwU2hJb0pEbGtyckJPTUx2dm1H?=
 =?utf-8?B?TnJuVEk3N0szNXpnU29rV3BtNUI0eHdIaUNqemt5clUwRkw1aExEQnIyNnYx?=
 =?utf-8?B?TGZsNHkxUmM1T3podlhvbkhRRm1JdHJuSW44STduOHBtOHJTbnkrc1FndklX?=
 =?utf-8?B?RzZWTEJwVi9lWXgrZWttaVY3RFBVNkx3eUNMTEdjd1NqNHJQQjVYTk90clB2?=
 =?utf-8?B?S1JONWhRV3ZUKzRhcnppbTBUakh0eUFVbG1RMHA2aFl1QjdnUlhJam10a3pw?=
 =?utf-8?Q?Cx3Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f0dc8b-09c2-4e05-8dd3-08ddbadbfa74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:20:12.2446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZpCf5e9o67txCmJGcdFWQorP4MinVPsURCNN/HgnLyIoxJ2M7BPJlubNGHxorGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9157
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

On 04.07.25 05:06, André Almeida wrote:
> When a ring reset happens, amdgpu calls drm_dev_wedged_event() using
> struct amdgpu_task_info *ti as one of the arguments. After using *ti, a
> call to amdgpu_vm_put_task_info(ti) is required to correctly track its
> lifetime.
> 
> However, it's called from a place that the ring reset path never reaches
> due to a goto after drm_dev_wedged_event() is called. Move
> amdgpu_vm_put_task_info() bellow the exit label to make sure that it's
> called regardless of the code path.
> 
> amdgpu_vm_put_task_info() can only accept a valid address or NULL as
> argument, so initialise *ti to make sure we can call this function if
> *ti isn't used.
> 
> Fixes: a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")
> Reported-by: Dave Airlie <airlied@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com/
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 1e24590ae144..e69366401f6b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -90,7 +90,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>  	struct amdgpu_job *job = to_amdgpu_job(s_job);
>  	struct drm_wedge_task_info *info = NULL;
> -	struct amdgpu_task_info *ti;
> +	struct amdgpu_task_info *ti = NULL;
>  	struct amdgpu_device *adev = ring->adev;
>  	int idx;
>  	int r;
> @@ -172,8 +172,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	}
>  	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>  
> -	amdgpu_vm_put_task_info(ti);
> -
>  	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>  		struct amdgpu_reset_context reset_context;
>  		memset(&reset_context, 0, sizeof(reset_context));
> @@ -199,6 +197,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	}
>  
>  exit:
> +	amdgpu_vm_put_task_info(ti);
>  	drm_dev_exit(idx);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }

