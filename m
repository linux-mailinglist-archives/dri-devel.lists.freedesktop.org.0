Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230CBADCC07
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF4010E67B;
	Tue, 17 Jun 2025 12:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jq2addlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935E10E665;
 Tue, 17 Jun 2025 12:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyOiKP5tZRG4w3OXQD4OGAAQG+sEA9YcIPoiWapWeUcXGEfqlueJc9lxVFF+z1SsiDSWEmNxnTZGKyIAN+9agvmvaolghfuwEpCUeH7T4HHv5+pGw8Ps0OYDqi7y+v7s8nVBNHawRdK/X0SqT7yxZqz4Fw/BXLFWbHLmn60tpemRViCZ30X2c9L4xjCuhKTwAPzOs+wOr35zUJBmGHAJuBtuy6qF8hTvhoUdXE96Dqoz8W/Wz+tKbCQCb1UlL+rdSy2LMvK4CSDwjcOKuCiXwaNsWCERu6+sXKEz7a/Wn/rlr/1toyYH9iHcAAoN0G6tLRkWQwn4CQA0PvUzOivhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XulKWskdU1/0oj+5O75KzvryJK4jqQf+4OYXDPMbQK8=;
 b=zPQ7Xqu2+0CFb2poqFaUJ6GQS6ig2e5Hpv4jfTKIZ6Jv579PA4EDbOIKxmv0Q5cJ3Re1W9oZoWKfPBcHl9BePIj6ksxyzGLHyNUUDTv2J1oXHTfcFIE0ER4syC1k8RwSS/1CKokXrc8R5B+Bm3iERyh6y3c+1aVjI6mZLZsztTqZQX7lzJkkD8fnoW1OCf37x8lHjpcLTNm/rFcHLByUa83MDhnWVdOZtIDjRJ+6y9FG66xZ54D5T41wwfVN3cB7fupy4HaUsS1xahc8lSQgMypNQU28oYusypJgudyhthYOXcxMCMQ09b0iSo1sqk6EJNYsNvqkyi8vrxjuROM10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XulKWskdU1/0oj+5O75KzvryJK4jqQf+4OYXDPMbQK8=;
 b=Jq2addlDiXM+q471KaL8DkvC3jmXr1dYpWJmYFii+esqdFsX7YamJ4XFv7cEOjJlGQ3i2SazdQcQLoZvwwNbDWAe5b2ynKsIFmauvzCzxLm050Cve1buOhSWMjahUw1Ze7Zf72yW3xSsV8uepXURYj1jXs7Bf1v+x8/3SXOslXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 12:53:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 17 Jun 2025
 12:53:46 +0000
Message-ID: <dcca2b9c-f0d2-4b9c-a385-a1b5e3fd4ad6@amd.com>
Date: Tue, 17 Jun 2025 14:53:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] drm: amdgpu: Create amdgpu_vm_print_task_info()
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-3-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250617124949.2151549-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0129.namprd02.prod.outlook.com
 (2603:10b6:208:35::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3a59d1-df22-40e3-4713-08ddad9dff4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzJCN0RENVJYVGR0S0ZPdXdMNzM1bTNmd3BmcDBjRGwrSUpKUkQ5dmpUMDZy?=
 =?utf-8?B?QW5ud0tZTGdNZUY2MHZhQUNiVHdVTVQ4cVZoNURlbGhidkJnVm9GTXg4T1BR?=
 =?utf-8?B?NXV2VmI4V3Z1QmRZMDV3YjJCdlJ6RHY0OUYrUEhXRkdxWWRZdU8vY1pVbGRz?=
 =?utf-8?B?K2FGcTdpZG1aemRWYkdiUTVXNjRiekswbXJwekJwYzUyVTE4ZUZ1ZVZNckFv?=
 =?utf-8?B?bTR0UldlMjYxNk1BM1JBa1NaUVIyNGU4TThFU3dYRTJOZ1dMTUsyd2U4b0pk?=
 =?utf-8?B?VUw2SGViZXNJMGQ5NkcwUmhHVTU5NEFpYWxlS1FqaUFoSk0vcTUyelZnWVdt?=
 =?utf-8?B?TEVXQXk2aHBmMDljWFN0Yll2K1JLSm9ESmVDbVhNRkw0SkhEN29adVg1Zy9Y?=
 =?utf-8?B?VERmdVp1NmdaMzBsVW5oOVBseHpMR2cyWldZMElDbE9JWWhoT09sa0MyVTVa?=
 =?utf-8?B?VTNQdzJQZWlBd25vNzlZT3RMTnlWL0FULzVhSW43NlZvV3B1Z3FXSmE2TExx?=
 =?utf-8?B?VXkzVlAzdWRGZmhYYVF3N3hsVFU5M3gwS3ZCNkhLQi84SXBpeVlrckFlQUF2?=
 =?utf-8?B?L2xQUGlDRFZ4QTNNRWFxUHlvS3ozRlNsK1h2YU9mcEdBT2pKRTNDVjI5N2JL?=
 =?utf-8?B?dXFJbXBTOG5GY3lteklIalNrUVR2cUJaOW5xaUlEYXZyZ3JQYTBoVG4wRUE2?=
 =?utf-8?B?U0diM3BkNkpmc0VaSWlIc3BHZlRBYm1jenBBb28zL3JVWUJhTk1tMGU5VDVX?=
 =?utf-8?B?bVlXVkl3T3Jzc09NMi9VT0FFWjJnWWJUaE1GM1RrbkpWcWNBSnltTXBmcWox?=
 =?utf-8?B?Y0N1YUZVK0diZGV6VmVscGlDUnM3VjZOWjFlRW1ONXRLaHVyY0duUi9McjJD?=
 =?utf-8?B?c2Z0VDB2TVhCdFpNN015QmxxclBjWmNxN1BjOHViZW9aODhjMGM2NlplU1NR?=
 =?utf-8?B?UkpCdUk3R3ROcXlDM0pLdWZHS1Z0dkx4ZzJCU3RacFdJSUJRRFRUTWVPYVE0?=
 =?utf-8?B?ZFU2NzY3SEYwa214NkpPQk4xZE1wRm4vTElaZjlsSk1zbGkySUoyVDc3Z0tE?=
 =?utf-8?B?bG9KcEt3T0ovdmo0bEo5alpzVjdlSElUM1cxSDFtVjlMWWt1U29uVEI1Qk1C?=
 =?utf-8?B?Uks0VGtsc1NxUkZFcnJlMEwzc3V6R0hMM3pwNitDSjJRMnVXQk9sTlc5SVY5?=
 =?utf-8?B?SmFpMFBkcENic2FmWm1IejNmVy8vUHhKMW5NZlpKbnlZR2U1cnk4V1lkdS9t?=
 =?utf-8?B?U2ZCbzJJWUt3TFVxd1hwZEUxdXRBc3g2MzJwR09jYnZaOFptTE9hY1N5MUw1?=
 =?utf-8?B?VUdxYjAwSU5tVHNsSEkxT2VxU2RZZ3BZd3Eya0lRc3JBRU1YR01aNDRHL0xY?=
 =?utf-8?B?SU9JeHJBRU8xTzFUQXFiYXZ4dWtCOE5vU0NWRmgzUXBFcUoyU3BjZHBFUFBG?=
 =?utf-8?B?Zm9LN05IV0IzRHNRdXdXQnFiS1hhMmpmVnZuRjgxYlFOaEJ5aStLQnlSd3dO?=
 =?utf-8?B?TjdQSllqZ3JuUmc4OEl3UGhWc0tEQ3Q0OXZjd1NtRUY4S2VDMDkzajBRRnQ5?=
 =?utf-8?B?aktDT25lKys4K0dPUDFUU1c2UVQ4ZEhwdno3eElWSnZmWWpYVmFnUytzQXdP?=
 =?utf-8?B?WGpUejFVSDU3SGZYdDE2QkxoSzV1UUd1TURrcm9uNTNRcDVtdGVieXIvZDJn?=
 =?utf-8?B?bVAyNHhOdFZmVEpac0NCMUZHQ05VZ1NuUmhFeHczbllJcC9QNE9ZVTNBWmtL?=
 =?utf-8?B?V1hiL3NLemE1d0d3elFYdDVscnp5ek9pTy9XamdaZVlqRWJ1dWJ0czV3TUV1?=
 =?utf-8?B?Qng5d0U2aXk5aDFqMmlBbnFGWThvSjIyVUZicnBIK20yZXgxVjZaQ2JwYTh2?=
 =?utf-8?B?OUd6VmpYakVuNUpGVDlUYy9zbFo4MklBOWduYmJISU9LcHRsUXA3WEo0VlJq?=
 =?utf-8?B?em9YWW8xVTVUZTdPSVloM1VQbklMMzBHMUNYV0ZRTS9lRnVkb01sU3J0dXE1?=
 =?utf-8?B?OHB2ekt2WW5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pCWk9BYlBGUWRwRFl5TitZbWhibHlWdXpza21ZbldxRWJmS2I3d3IvamYz?=
 =?utf-8?B?ZFo2YU0rK0dMeEY3cmMxcmJValEvMWF5cnR5c01xY0QyanBOWWdUVGhnU0Vl?=
 =?utf-8?B?RnJybGV5K2R1clM1aXhidGZMZldGcjE0OTh5RitIdjZVbVh4N0E2a21MTjVm?=
 =?utf-8?B?TTRBVmJycmVQdGQ2TWMxVWsyVnJlUmpFSG1qRjJJZ1Vnc0ZHbXVId1lNVlFW?=
 =?utf-8?B?YkU4eXdXbm9uUjdVZmc0NVdFdUUrV3VYMWV1eXZkVkZFQVNENlRPVVQvN1hj?=
 =?utf-8?B?ZjE0RGxWenRYUHpSdURqWGxpYk4xL1lyRE43cjZ0K1F4VDd6T3N5elk1MnQ1?=
 =?utf-8?B?dWtuNWRhRHZodmQ4aFE0WXJOZTNqZXpqb1Y4MEYrK2JsL2FUd3U0THNQREhD?=
 =?utf-8?B?YW9EUkZUZ2ZESlh3NXFjZjRoZDlpSDJSbVc4ckJObWFNclcxYm1xVUQzMnFF?=
 =?utf-8?B?NHdXaGJTQ1NJTjFBK3NwblorNllacWNKYTVaVlY5Uk03MFBQMXphOVlZL1hy?=
 =?utf-8?B?Qis0WUFtQjlINUl0aFJ6RWFXVzBhamozcXNqZFNNMXB2WS95NzJrRmhWK2kz?=
 =?utf-8?B?MjhDcE5JREx3ZXl2ai9hL2xOR0oxSi9IMzdOUHhaa2VuLzBUWlovVVFiV2RZ?=
 =?utf-8?B?RkRpNHBnSmNFU3ZJQW9FcTJPNU4xaW9XczBhWFg0YVhEM25tSU00RUdsZGFj?=
 =?utf-8?B?bFZ2UUhFbG5EaXJVWWdLdXV3c0kwV3dpRHpDcXF6TFlJR1RyeUJlK2c0SDlk?=
 =?utf-8?B?eVZHd01PRUpLZDloMnpiWExXNWZIK2hQQW1naERJMGEzYUhzMW93OWRXRmc0?=
 =?utf-8?B?dWhJM2FsRUNYTEk2NDN0Q1pGUVZkYVFPd3pPbVdFSWMybFJBTktmK3YvQmJw?=
 =?utf-8?B?cE14NkxTTk9zTVNTblhUMGhGT2JnTUR6aVYzOE9lbVY2ZkpkRmE2VXlmNEVU?=
 =?utf-8?B?T0FMZlBPaVpMYnVhRUFiUC9QZjVhQ3JVSm1vdHFjS0ZKdDZQSUdWbG1wa3FP?=
 =?utf-8?B?Nzk2K2NyWEk5MEJrZ2dwbngwUlNabjhlSktWZ2hoN3VQU2szUXRuV3c2eWhq?=
 =?utf-8?B?VHZVZkFkNUhyYlA3ZW9Jc0FiMjFiUW1LdkFRdWlzdE1ZVU1RNjFndlljVllZ?=
 =?utf-8?B?OWkxZHFOWFNNbXp0SEZlaG5hOWhobHI5K3UrL1F2Q3lYcng5VHcyV3VvL3FV?=
 =?utf-8?B?T0xNeFRLUldLVWlBN0U1ODdSY0FBZ3VpOXVIQi9BU2VVY1ZYL0N3ejNqRk1i?=
 =?utf-8?B?eW9uYWM2VGhSbWpwVDF2b2kxWUhtZUJvVzF2MXZ3MXJSYW5KcnJ4dDUwa2Ji?=
 =?utf-8?B?a2l6eGV4dXBkbVZoamNRZ3pLVG5YRWpZdFN0UU1rTzVNYnlaUUZscSsrN01s?=
 =?utf-8?B?SWs2dkFWaThLUWNQNDFVUHZpaGJsTldLeTFSTjYrUjFxdnFUNGlrTUNRRFA3?=
 =?utf-8?B?d3IxazVxMGp3RUNsVUprUzlwMDJEZHZpK3FOeDA5TGhxZlJWeXVMU01QdVZF?=
 =?utf-8?B?RWlqSjljQVV1VWdzaGxYQXdoWlZiNVUxb0R2bVlsalpKbFIvNXRCV3RpTVFh?=
 =?utf-8?B?aWc5amFBWXZKeU4yRWEwSTV2NDh1c0ZXYVFDRm4xUHlBZHRnUmZpMEIzcVVW?=
 =?utf-8?B?ek9qRWNVZkZqOWZ1dVZuZ2hoR0owSnBrS2JYVHJ6VE9pTFZzbkF3UEZSOVNi?=
 =?utf-8?B?cFpiMFEzeE5MTXFMWXRJalNSbW9JeGlzTFlRWjdtaUNJK0JmQlNvaWcwYjNG?=
 =?utf-8?B?d0FGbEJIMVByY2ZMRFc4VjRXMlhCTWpRN2l6VWNDdHA2OXNsQ0FtbDN3T2tR?=
 =?utf-8?B?U1BZY0pYZGJVMU5ZME4rSjY4dUJZRno3UjNEKzY1Qklta1p5b0lMRVUyU3JY?=
 =?utf-8?B?TlhGZnRoc3ZSa2FZbDV3T1dCdVgwTW9jenpTYlJaM1p2L0xwaGgwbGtTcFMr?=
 =?utf-8?B?L01ZU3JLcUZnNFFUSnA2VDVrT0FWSE0raS8yNlVDOFdmV2c3RFhSWFNrRFFj?=
 =?utf-8?B?cGUxbnd2UzRYWGlZV2dVa3pNeTZQVHJ3MU5DYklndzY0NC9kY3FTRzRGOTRp?=
 =?utf-8?B?WW84U2l0Z0dlTmNHa3pPWktwYWdYRW5Gdi9SK0l6dTJPZUxUTERMSlMwT3JI?=
 =?utf-8?Q?cPQZKkLQvjAaTqtNe5fK68lOf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3a59d1-df22-40e3-4713-08ddad9dff4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:53:46.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13xxppqGsG86c+a0KYK7SStOnRkBnsyhqgFGvwh8GxGC8grgDLf0XRmydC004yBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
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

On 6/17/25 14:49, André Almeida wrote:
> To avoid repetitive code in amdgpu, create a function that prints the
> content of struct amdgpu_task_info.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v8: drop the inline
> v7: new patch
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 9 +++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 3 +++
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   | 4 +---
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 5 +----
>  8 files changed, 18 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 75262ce8db27..3d887428ca2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -124,9 +124,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  
>  	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>  	if (ti) {
> -		dev_err(adev->dev,
> -			"Process information: process %s pid %d thread %s pid %d\n",
> -			ti->process_name, ti->tgid, ti->task_name, ti->pid);
> +		amdgpu_vm_print_task_info(adev, ti);
>  		amdgpu_vm_put_task_info(ti);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index de914a39e3f6..3bf63eee2d4e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3157,3 +3157,12 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
>  {
>  	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
>  }
> +
> +void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
> +			       struct amdgpu_task_info *task_info)
> +{
> +	dev_err(adev->dev,
> +		" Process %s pid %d thread %s pid %d\n",
> +		task_info->process_name, task_info->tgid,
> +		task_info->task_name, task_info->pid);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index f3ad687125ad..9ec5d94200aa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -668,4 +668,7 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
>  				 struct amdgpu_vm *vm,
>  				 struct dma_fence **fence);
>  
> +void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
> +			       struct amdgpu_task_info *task_info);
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index a3e2787501f1..7923f491cf73 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -164,10 +164,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
>  		entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
>  	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  	if (task_info) {
> -		dev_err(adev->dev,
> -			" in process %s pid %d thread %s pid %d\n",
> -			task_info->process_name, task_info->tgid,
> -			task_info->task_name, task_info->pid);
> +		amdgpu_vm_print_task_info(adev, task_info);
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> index 72211409227b..f15d691e9a20 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> @@ -134,10 +134,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
>  			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
>  		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  		if (task_info) {
> -			dev_err(adev->dev,
> -				" in process %s pid %d thread %s pid %d)\n",
> -				task_info->process_name, task_info->tgid,
> -				task_info->task_name, task_info->pid);
> +			amdgpu_vm_print_task_info(adev, task_info);
>  			amdgpu_vm_put_task_info(task_info);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index b645d3e6a6c8..de763105fdfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -127,10 +127,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
>  			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
>  		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  		if (task_info) {
> -			dev_err(adev->dev,
> -				" in process %s pid %d thread %s pid %d)\n",
> -				task_info->process_name, task_info->tgid,
> -				task_info->task_name, task_info->pid);
> +			amdgpu_vm_print_task_info(adev, task_info);
>  			amdgpu_vm_put_task_info(task_info);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index 99ca08e9bdb5..b45fa0cea9d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1458,9 +1458,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
>  
>  		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  		if (task_info) {
> -			dev_err(adev->dev, " for process %s pid %d thread %s pid %d\n",
> -				task_info->process_name, task_info->tgid,
> -				task_info->task_name, task_info->pid);
> +			amdgpu_vm_print_task_info(adev, task_info);
>  			amdgpu_vm_put_task_info(task_info);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 282197f4ffb1..78f65aea03f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -641,10 +641,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
>  
>  	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  	if (task_info) {
> -		dev_err(adev->dev,
> -			" for process %s pid %d thread %s pid %d)\n",
> -			task_info->process_name, task_info->tgid,
> -			task_info->task_name, task_info->pid);
> +		amdgpu_vm_print_task_info(adev, task_info);
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  

