Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C77ACC71D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754A410E1E6;
	Tue,  3 Jun 2025 12:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U+43bRm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9526A10E1E6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 12:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNvAAsVvjBQwsJ3OExOrF+kx4dwr7M3thLM45Va2j/eAJ4+KoJIifHzDOPaWAWycf6e4VmIAxsqFhKcPmQxBkKS5ubzZjDtXicnWiN7So5TdGEaZesYth5HfGPKSKChvQHBa/uoXyyWGlMeTOOufgCaZaPVw6pj/xyiXACLpYB182/N048iTNZkcrwex9y2/z5wC265vcdyzIqmJD8W/gN7P2xN8M312Vd0sdlvQKYyineFxb9DKg4ubCXRPL2Pgl7zGvt1OQGMUYWvcjwaNff6h9zb/QoTPgqnbjAJVJZh5d0mqB808GHU+CgNThD0H9A38xBPz/k6hH1iHoKAOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDO1BLLgCcZ3zVIlwYV8NtE+OkmBiS+MN7zGG18Kr0c=;
 b=diFlJAJOZys2ngaFuhAKIxdE6Xmy4aYsQtnl7o5aTIm8MJdnUC3VPCzwg05bnhUs14pEfCqYJYjVUAHEAaSN378/8leLmuHbnOB0X4Dyjqk9drJyaq9o/lguJewrFcHKdhGJP4mG3xKVUNaGkNwA2kUu8hvxQzTn1qtU6y5K8cARbz5uojZ+unRHt2heLutSJe3FbBUb3aHZV3DoLwuQdr4vbE8grq4TwTFgo4A0N9JjcL54f0qDrWHhnIk9m2G6g5g7iOWh02HsSCPVMunie0rir+HubOER7ka7ePhB5iXwWmojB8SWBRvqhklC6fa9eeqq45tWE5WHdNS8oHDrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDO1BLLgCcZ3zVIlwYV8NtE+OkmBiS+MN7zGG18Kr0c=;
 b=U+43bRm6fL2Bh7uGLi4xs9a56U/6/g5ndkZia2rNE8dQhcX0zvqwWoPaViMHBsvhzGL/jXEb8MlOe5ZHDpRA4n5A1r2UReD91O2jLo9Mc5lWyGA31hgeSQNithsRtGosrEpIbeh5+uCvwnU9Oi+t7T+1iLiWoLnmgjVGKAGeWkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:57:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 12:57:59 +0000
Message-ID: <b5ddbaf7-9f74-49d7-a45f-ed73ed5df0ac@amd.com>
Date: Tue, 3 Jun 2025 14:57:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/ttm: Increase pool shrinker batch target
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
 <20250603112750.34997-3-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250603112750.34997-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad5d09d-e7f5-4cc8-5880-08dda29e4440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVRiTE9WcFpscXN6SzBVbnhvUENiNW9MWmxzQUVFbFY0aDlBUFlLNmJzRVh5?=
 =?utf-8?B?ZUZGa21raUQ3VTFEVGtUNG92eldDMURjRTFqME5vTVBCSmJMZ1FaZUUyeTRy?=
 =?utf-8?B?TGZ2TVpxbnBEK0FKV1FqOVBVU0NFdW5IOTJxeUVqUERCRC9zcnhPYnlacmlT?=
 =?utf-8?B?TFhsc2VjVXdHVnNxdDFlV1BiQVFqSHBmYWNOMW5KYS93SkpDbVNRQkM4WnZ0?=
 =?utf-8?B?ZTBqWUFFZ2k2OVFzcVdUVExBZklkRTAwK2w1UmQzNjB2OERITGh3WUlsLzFy?=
 =?utf-8?B?M1J4VVVsUlBHcHNqT09KaExWcFZkcWVFZ0o2VERiWHp3WExvV0hkMWJ0RUdR?=
 =?utf-8?B?TFc5djYxUENkYnZZS2F0Y0NzRU1FcjExeFB1MENaSG5PMlNHY05QcFFqWTMw?=
 =?utf-8?B?c3dETE1scC9id1Q1MytCVlhkWlZURndZaGlUeHgycjQwQTlXOXVsVG1JYUFv?=
 =?utf-8?B?b0szSG9yaHlBMGxzcEtNTWd2VUNBclQ1QWlMNTZLSDZqdUhJNUxXeFpLdUhE?=
 =?utf-8?B?eEJPYjV5SmJONHk2UGV5MVlaQVF4U2FLazNwNmdneHZRN1hoc1Z6QkdLVTJ1?=
 =?utf-8?B?dFhmZXlsOUZXMGRWenJ4UDYwRFpNWGdFSkJqbTNlcktGdW1mM21keDBqQ1Vk?=
 =?utf-8?B?ZVNadVlSQi9URUwzRWM5TDQvTzF4WWx0YWpyQkJsRW9uRWVFTEJIVThJTU1E?=
 =?utf-8?B?Q2VZdXdubEkvS2puOFNEeHdJcTFvRTU0NEV4OTk3NDNOd1dOOE9SbC9XeGY5?=
 =?utf-8?B?TDIrN0FVWnoyTksxNlJxd2RTcEpZV0oxK00vbWprUDhDRDV0cGZFcGxMM081?=
 =?utf-8?B?UTFXUmR6ZkRYRmdnNzN3Slk4WVk3SnUvTmFUWlNKTDZHUjFFbExkVlZ0Tjlp?=
 =?utf-8?B?bHpveTJ3Nk1SQnBsUm41QnJRdDBNY1E4SmhUU29waXdyeVhTbE1JMU9yVVlr?=
 =?utf-8?B?ZFZsdko3Z21IT1c3SWNtNTVyQm5ibndmd1N3Z1BBYnRmVU1OSGVzc1AvQ2Jp?=
 =?utf-8?B?VGRVWVhVZW54VmRhSXpUVkpBdHBvMFhpYUIxeEc2dHhhMm9iTFhsZWViNlZD?=
 =?utf-8?B?YzFpQmhLOXBGUW9MZHRVNUx4VlcrdjBVQjRzd2k1OTg5NW1SWHFHNGdPQ0xZ?=
 =?utf-8?B?SWFtOFByd0JPd0t0UUhodW0yUkE0ZWp5cmJxU3dYRCtlaHgvb0VZZ0ZQb2tU?=
 =?utf-8?B?bDhVdEdXR3N5OUJZeWFVeTFnVzdhdHJjSHR0YjNmeXF6SzkyMVpqT3pFSlk3?=
 =?utf-8?B?OWxPSGtPZU9MeFRYclVvendKd1dOMEVaZ3NENnhOZnJNRFV5VFdlNGZwcVFx?=
 =?utf-8?B?L0FqT0JJSGU4Y0lNQ1E0TjFYVEJYb0c1NXZoRFNLQTRKV0tSeDY0Q2NBeE43?=
 =?utf-8?B?ZXZJd2tGMjNqL1ZEOHg2bU12N3NEVzZTU1pZRVRabEg0QVRNYXJMQ1BPK0Z1?=
 =?utf-8?B?UlZmUGo5RjhPT1FzR1hZSFdZVkh3aDgwVG9WdWFlOE50SmJYT0p4eW5FWEJj?=
 =?utf-8?B?cXpnSVF6YW5tN2lYYW1Ec3JMa1RMTFV4dTUvYkszSnBXT1NadkhjQnh5L0NZ?=
 =?utf-8?B?cmVpeDUxc0s2dGtSUHVCU012c0IxbTZ2RFJjYTA4ZFAxY0J4dm43NzdEbzha?=
 =?utf-8?B?WitnMlhtYzRmZ01DWHhkakxWZ2wwUmR1L01nV3dNdXc0VTNOaTlXZGdJNGVz?=
 =?utf-8?B?MkZXRExKajZsVjRQM29iRVBGazFydjVMSUdhazl2cVpQWkp3QlJqVExQMmtE?=
 =?utf-8?B?aXNRNXErME9vMEZ1L01IazNidmRpb0gvOVZGci84V2JlOWNWVlB1dVlhOUl1?=
 =?utf-8?B?T2l6SE5oTm9JR3BtQUJwdHQ2YTZEdWRMY1FScFJ0Tk5xdE5UcERmK1V0Tnlo?=
 =?utf-8?B?K3NjUEMvdW8xcFoyV0F0a3lvc1I2aHEyYWEvcVYxQ2swM0dVME9adjRvOXJE?=
 =?utf-8?Q?m5OhkOQ6fhM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajhaeDhjRVRZdWVuT0ZoZHNwZ1VZL0RYRGRJL3pwQWRBckRncGNtMDhTYnlw?=
 =?utf-8?B?TnB1eTFWRlhtaG1GRGlsNWFyR3EvQjBNVGdEcURZU01HRG84RS9OalY5c1Ez?=
 =?utf-8?B?UTh6cExYWXVRcnYzRmFmYlQxd1ovbjhuK0ZPVUxrZjJFWC9MbU04YWRSK2Mz?=
 =?utf-8?B?eE9HUWtMQmtPT2xkaE44SUt6ZElmODAyaDNiSlRaOFk0bnRNdmlwclcybmFO?=
 =?utf-8?B?Z2kvSHdvd1dvazFyNXplV0tnWDJDUE1SRzQ2Y1dQbmxqRGVEMmQyVkZkUzZj?=
 =?utf-8?B?UzlDVmovNUdsbTkreXF5TkhmTEV6SlZtVzE3QjhFa0hwQWk5VnRHSGg5NUFs?=
 =?utf-8?B?ZGppTk5Nd2liRmpQWHpIUUdNKzRwVHRpdjVMUGdibWFZZGlIWmVIQTFTNkNy?=
 =?utf-8?B?SExqby9BZDRLb2ZrbGxIMUk3RmZXM0g5YnNVWXJIYjBrdkQ3Z01YN2tGRGlH?=
 =?utf-8?B?Q2tGY3FTNHROckh2aVNraWVscHU2dkJKM2pVYmIzenQ5S0dVL0ZWZEVRdy9n?=
 =?utf-8?B?S1dHakVtb1NMSnkvb2JMVmNlbytQZkYyRldiRmxIeDJkOTZWTFFJaGt0bEVh?=
 =?utf-8?B?YnlHZFE4ZzN0R2pTM3M2UkNycHJiMjMxbENMQUxLMVZkUitBdWNtQjNoK3Ax?=
 =?utf-8?B?K2FwZ2cxeXdaRER2YUpyRmFDcjlqRGdibGlvdzVtdk1yVXgyRVg2TXVFL0tr?=
 =?utf-8?B?Z1RPTkhTWTJVS1kxUjFKWkQrelhnV1A3WE9WNnhFcTBvSWxHaUVpV3RtQjJo?=
 =?utf-8?B?dGlZVmJ2blEwYWIreXltdERuTmN5ZEt3T2dOcnU3KzlFczRUSVI4bFU0d1FM?=
 =?utf-8?B?S2ExbURtZkxFV1RvNUVTZ0hxa1A4aTluNS9nRnhiVEJOdVBDdkJSSSs3L0FD?=
 =?utf-8?B?NGd6VHYybWc4Z1VsRWRtakhUeDJ6N1VZQzhhNldiYVFsQjdUd0VlTUpPdkE4?=
 =?utf-8?B?UGFZdENoS0puWmprRm5QNzNuS0pPSEZ5cWE0akxQU2ZCZklHMUlmY1dXOUJQ?=
 =?utf-8?B?WHdFSys5NEJnWW43SjVvU2ovL0R3VnZyTzhMSzNMT2kxTzA2VDVrWU03bjla?=
 =?utf-8?B?dzBRMDZnMFZGSEpmSTRhSkF3RWx0QWcxNzgwUzVRSFhBc0NMYjZIR05TMXg1?=
 =?utf-8?B?TkZQRUlmWWU1UkFOQmJRemttVDIrd1VJOUlxekhPSnlzNFZLNlBpMkxGdkJU?=
 =?utf-8?B?NTJ5ZVM0dUlrUHl5QkFFcEMwL1BHWnY5MWt2YmFKVDZzTGZ1MmNPWGxtYmxK?=
 =?utf-8?B?ZGE5dkkyTGFyVW81SjlNdmVvcDd6UXUzRW5TMVZKSTM0T1RxM1Rkakg1YlA0?=
 =?utf-8?B?L2p5bEZNKzNaeGpjOXRCUHRZUVpYM1NDNW5FcXNKSVhyS2F1UFYvazhjdysv?=
 =?utf-8?B?OTdIOWxlWGd0WjRyWFJQalp6ZEZVRFhIZFNGQlBSMHcyRFh5TFZGdnAyNjNH?=
 =?utf-8?B?dm5qbHAyY1E2RXRGSzJ1MUtVcEpVUjVWalc1QkVlRE9HVTZhbTR5QTJhUVpj?=
 =?utf-8?B?cm81S2dPb2pScG9nVEljWlRCQzZQbGFwQjlpTTlPRW5JSVBBQjRLMjFSNlMw?=
 =?utf-8?B?UVhDMlRSSWdBZmk1Si9PWmRxYTdnaGpTeG8vQndNNlFZaUd2bkVVYTFmWmJj?=
 =?utf-8?B?Mm8xNi9rSy9XZFhWRkdtOW5hWXI2S0MyQ1ZibGlLNHBMWStjaGo1d0ZjN2Ni?=
 =?utf-8?B?bVJibEFzVGJ0TkhSY3RRSmRLMnlzSVN6MkNyK3NhVEc1aGswS1pRdklLR0RF?=
 =?utf-8?B?REhGbE05b3JyRVRuYXhxZU1nYWEyeW91RjBLbHNBYkZOODVkOUpUNXMrRjRG?=
 =?utf-8?B?R09kUUJMNmRHTk1WSnZtdUZMeUc4SUhwTGZ0V1BlNmxiY2MzTUk1SVE3Tlcw?=
 =?utf-8?B?N2dUNkVPWmNONUpnVFhUWndhVCtQVEtMaWJzdXVrajI5RkJxRWY0RTFSMlo5?=
 =?utf-8?B?SGVqNXRITnI2ZmplY3FCanhCMWFzcU9EbGd5d3BGOWNWeGJSVm9yODZZblZ5?=
 =?utf-8?B?VFJ3MkhvaWV4Rk1aUkM4S0lKeVNlR2RqQVVXVWhuYUs2NGNsUHNTRzE1U2RK?=
 =?utf-8?B?RGt4WUlEZXNhckpLM2RPb29IakNGSllzbEhiYkx2RUN1a3l6UjQ4WjlIVmRs?=
 =?utf-8?Q?uG+8IAerRXuLBFYF6i5jHqxB8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad5d09d-e7f5-4cc8-5880-08dda29e4440
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:57:59.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWZFjg4JGm3L9mlLsoUNWXxOvFZnhfKQjFKbxkczg8VwxV0PktQaO7TNCHsfiUbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661
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

On 6/3/25 13:27, Tvrtko Ursulin wrote:
> The default core shrink target of 128 pages (SHRINK_BATCH) is quite low
> relative to how cheap TTM pool shrinking is, and how the free pages are
> distributed in page order pools.
> 
> We can make the target a bit more aggressive by making it roughly the
> average number of pages across all pools, freeing more of the cached
> pages every time shrinker core invokes our callback.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c060c90b89c0..e671812789ea 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1265,10 +1265,16 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  }
>  EXPORT_SYMBOL(ttm_pool_debugfs);
>  
> +/* Free average pool number of pages.  */
> +#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)

To be honest this feels random. But I can't come up with a better idea either and it still looks better than the default as far as I can see.

So feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> to the series.

Should I push it to drm-misc-next or do you now have commit rights?

Regards,
Christian.

> +
>  /* Test the shrinker functions and dump the result */
>  static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  {
> -	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
> +	struct shrink_control sc = {
> +		.gfp_mask = GFP_NOFS,
> +		.nr_to_scan = TTM_SHRINKER_BATCH,
> +	};
>  
>  	fs_reclaim_acquire(GFP_KERNEL);
>  	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
> @@ -1326,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  
>  	mm_shrinker->count_objects = ttm_pool_shrinker_count;
>  	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
> +	mm_shrinker->batch = TTM_SHRINKER_BATCH;
>  	mm_shrinker->seeks = 1;
>  
>  	shrinker_register(mm_shrinker);

