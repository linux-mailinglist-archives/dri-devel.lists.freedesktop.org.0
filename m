Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD7BADCBFD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251D010E64F;
	Tue, 17 Jun 2025 12:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eZzb7Byp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD4810E629;
 Tue, 17 Jun 2025 12:51:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7TJUv6q45TJInzSEb3YIAnPBUkeo+NrOow2vzBcZx+pnJIx1iwh2zIjaVRsYB/wRx3CAFogz/ZazTLpM7vOLsO+/WC6hZ5bEiGRSle44oEBlKoB08tlnrkgfpWIEBMHFZN8uIJp8hTsHaLuaaxGyp/AjyJ9QEkp6Y/RTOax2ZsvJz+AK/ZH8hNr26JguD4wB25wRcHcIPNJDUwfE3B7UJkw2tGugva6Y6csWi+Y8VpRiiQUrD+f5bVKA0adkIXJzMsDxuTQxRDDjmi9XjLkDqj325ABQk1sV76NSx98QmIKi3idhDiEuqoeXEJnL9dqKL8L42ZYrB7E01cyY3rwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVmJZbdfmcpBfPSLZ93yNr6G+xO0su2/R0ZqNBL6XAI=;
 b=hmO1svqjw8zZtQjFIZ94BII6ZJcJIYdlraVHpMTQ3XyubOYUkjSFSNptJoHhP1SMXyPUEJ2H/+/3304w9BTqPjXIX+qpkd+qxv5jUL48Y0/AGdt6908Xr+XseTmrUK/vP+W7XjzJ2GdeG8Dag38HOQEjecnHu6mywpf4EE9Hb+HTcTNvb4pJZZ5SlHjkuyD31G/XYDLRCUP8Yf0NEIkPUUcjpUbRED7AKOjHwSfKso5hgz77QiPnJloyVnBDAXRKqpITJuHcmMyYLCYQGeus7kE4SqF1ia3rGdO9BqMsO9z45/mH549f8WZa0Am1A3nOt0Dtw9Op/vNRKKR4GzG4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVmJZbdfmcpBfPSLZ93yNr6G+xO0su2/R0ZqNBL6XAI=;
 b=eZzb7BypxRKKobFjxqulnQaE5FWDmwB7a9st2E7OTxkKadRKGGvbg1bVigPFXXs6/Klb+1Ug6l7eOgKk1DLcc2yqZ+4C9mZ+99o9vOq12TkzOHl2vYKzTT9F2henlOzplOMBHx0Z5cUaCPfYxGb7wPK3YH8R7ZxTDU0NgCD2Jx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 12:51:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 17 Jun 2025
 12:51:35 +0000
Message-ID: <deedc450-e349-44a5-bb9e-05eaab351983@amd.com>
Date: Tue, 17 Jun 2025 14:51:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] drm: amdgpu: Allow NULL pointers at
 amdgpu_vm_put_task_info()
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
 <20250617124949.2151549-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250617124949.2151549-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 19be623a-0ad6-439c-2852-08ddad9db0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0ZKVWtwRmE5dTdieVd3RnJQRER1bzFIbEVKK2VFY1NNRElhOFlENGYwTEE4?=
 =?utf-8?B?blNhdzJoQmhWaCtvUnM5cXc4OXhHaTF3RXB0aXpES3dvM3VFNjM2MFZXcHRr?=
 =?utf-8?B?bDFnNFVYUzBwK2lFVnJwaUlVc2pTVFZ4OWJLNkJsTXhRZHRxQ2NQaFpIQnQ1?=
 =?utf-8?B?bTIrK25sWGhtTUtCSDVFdHBrTlgzWHJ0aDN1T1BNYmRLMG1rb2ZEY29LQjZz?=
 =?utf-8?B?NkZrVzlHcE9zZldRMjN5ekpycmkwU0k1K1VZMDBXcW54SDQyUlY1MkpoSC9P?=
 =?utf-8?B?TW9PWXlIMWRhNGhrWXBQU05mTnQyaHJiRFE5Szc5dER6VTMxOGZsOEQzWDVv?=
 =?utf-8?B?MGwvMHRSL0taQUtrV1ZsUEtpM2tkckpWdWpQd05oZGRrRzIzZDhONlp6Yzcr?=
 =?utf-8?B?YWNzYWYrbGRKN3FtZmhIcVcrN2lpN25rWHVlMlpHVStZaE1nekRuaGtObGdt?=
 =?utf-8?B?YXRUQW1kY2NwYW1WWmNMQUNUYm1aN0ZOTHl5czV3TjRZSG1rUk5DV2V6Qlcv?=
 =?utf-8?B?VEFRTzgzS0xEcWdpVHMycHFLRTZRTWVMYzduV1UxMldsWExTRUcrUDV6VHNT?=
 =?utf-8?B?ajJCSUpjWWowdW14bG5HZGVxZU9pVlduNnFBVmI2dDFVT2hOMzQ0TEV5Zkxv?=
 =?utf-8?B?Y3dGSktkQjdDTjZCU3pIVHRsQW92NHJpandVZjZpRW9OenRBbjNZcGo1NmhO?=
 =?utf-8?B?UVlGYytzdHZKYTBtTWxiS05NSGthZThia3ozS1pFV1VOUHJvRDQrdktQaHBy?=
 =?utf-8?B?VVpRSTZzMDZpY1FITzF1dWhaeEtVeS92Q0tiVnExRlh2V1h1VmVYRzVtM21E?=
 =?utf-8?B?bDZkMHBmWHFVSDFSNFNEWjg3UkgvTXJ3dm9CdkpZeHpoOVhhZDIvQjhQNkVt?=
 =?utf-8?B?T0ZaWkp3dXFuQmlEZFJpZXczOU9ockorMGw1YWY1L3Zqc2xzdzRrVXRiZmY2?=
 =?utf-8?B?bDVTWjJEaXNJcDZHRHc5SmpWU1hHdld2VWw4WjJXQ1JaQnEzVzFVUytOZWps?=
 =?utf-8?B?VWhFRSsydVdTRWpXUTJjQi8rT2FUd0NFbkc1bklBRktEZVIyeVpSaU0xVGFV?=
 =?utf-8?B?RjVkbE9WSTMzR1dnbjdJVlMyNGV2dm1xdlJza1VCYWlFL3poTVEzRDJwUU9J?=
 =?utf-8?B?aStqTk5qU09BUmNhY0tHUzF3allzTHE0SDlvMWE5TG1La3I5d3VHSFEwWE11?=
 =?utf-8?B?UkFKL3NBaHNLQVpzY2lvRG8xZEw3Y2M5cDJ1bEd4L1JtOGJWMlN6MGhOWnFw?=
 =?utf-8?B?UjJqeWprNlhrMmhhQXRwcitvQjVGNVZJdlB0aytOQ2Rza24rbXVPQ0duL1Vw?=
 =?utf-8?B?MStsOVpXQmlnVlR6Y0hnTVZ4UVJpNGZqeGxUalRLcG10Q0R1RlFSeHZTM3R6?=
 =?utf-8?B?T2daOGp4UGVyN2lIR05IdXJabVAvd0JmTmZGOUpYb1V6YnllM3Y4Snp0bTNi?=
 =?utf-8?B?RGl6Zm5GMjdPcnJnWktvNS83RWdIRG1CVmVoZVJUcGg2dVRHYm5PVTh5aHVP?=
 =?utf-8?B?YitSOVp5czFFWk1KS0xOVFZkRGdVNGlFVnExUS8xUGlFNDRQVjZmQmhtNm9M?=
 =?utf-8?B?YjRSRi9ETkVNbzVXRzVrWFIzUHpTcUFWT2MrOGZwZEZxWUd6VmRDRzJzSkRX?=
 =?utf-8?B?YW5ZMUZlczdVekdYRzdabzFkM2VKMmltd1QxUHpMNlN6dTYrdEFBREJ6eE1B?=
 =?utf-8?B?TEN2aEx1RzdjYjhyVnFIck9mQWxWTzRvaCtmS0x4MzB6bVhMZW10VEpGWC9R?=
 =?utf-8?B?YnJvYjVvVy9nbWhDbjluMldWU2ZPQXZZenBsdnhVclJyUmZpejJOWWtZczdt?=
 =?utf-8?B?cjBZNVJZTUU1UE1qU3RKT1dkK2I0TjRGMmVYZ3lqQ3Y2bXk1UFRuYzVMRDNt?=
 =?utf-8?B?b2JySUsyYWFDOUxiUUJ6ZzZHaHdrSlZud3ZDVjNQc0hYOCtNVGdDa0Nma0hw?=
 =?utf-8?B?enZWN3lYcXljTTNSdlUvL1JRRWdlSXh5a3pwNzl2WHV3TmNtSkNVSVFCTmNn?=
 =?utf-8?B?cnRUQmhPRTVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtrampRMWVoZzBZcW9OYUlYZHBrQ2R3ZGdiSElRZ1BETm9mSzlod284SHZq?=
 =?utf-8?B?MmZqeUp3VlA0dlYwcHlGVWI5T01QbFNIeUZNUUxITytvQnFzakhkOGpselVP?=
 =?utf-8?B?ZTk5c1R0ZlFmUGtBMVF5MUF2QVp2eWh6WXU5NVBpL3NCcFNVZWIydnlSSUpv?=
 =?utf-8?B?SERWT1huc1hIRkd5d3FOT1AzNml3bTNYc3ZEU0RsbDlkQlJrdTFGZW1BbTh4?=
 =?utf-8?B?TVhMWnFnV2Z3d21RclRrd3JBZ2VMeFFMVDdrSldjYXFEVldyaWZUbzBBa2xw?=
 =?utf-8?B?MFNEd2lGUFEzcEJDeG0rcEMzaVE3MlplRFg4TjdDeXdUNjUvUzZTbkVGakY1?=
 =?utf-8?B?TmRJZER0VWFFVExmaXJSdTR1OURRNS9PRXNURS9pSG51SW5mTGE4cDNtTWFC?=
 =?utf-8?B?Wng2TUdleitzaHROTHAzdjdNemtsdm9BUVE0SUtPYjNRM0Nzd0ZNbERnRGk3?=
 =?utf-8?B?V1U2ZzEyRG5iVzY4TmczSkN2SSthZDR0cDFvN1N1R21yM1dIZFhraFl3bTla?=
 =?utf-8?B?MGtGWE9qelh0TEVRVkkvd2J3Z3hRTG52Q3dtRjFDSFRHTGhkSkxFejN4aVls?=
 =?utf-8?B?QkhTWkN5MGE2WldPZ2UweDIyT2JMeHpFeDFES1VMRyt4eUZveEwyeGhNSlFY?=
 =?utf-8?B?WnpYYjJJaXpIY1YyK0NEZ01RdmE1bkNsWFE4dGxXNm5FZ3JSWno5aGdLODVo?=
 =?utf-8?B?YTQvdTM2SkNJaXFPUHZrbGl0d3A1alJaRnJQWlR5ODRQeGhtdW9oY1Q1ckpI?=
 =?utf-8?B?OEFkdzNJQTFyS2czUUxXQVUxTFNxZWw0b2xkVElXalc5RmdWcjZtdE1QbGxo?=
 =?utf-8?B?KzdoWDUzTitaTit6SFU3bzdIMHp5K1lrVTVvQi9IdlhDUmVVL0VqbDhScCtu?=
 =?utf-8?B?NUpNckpYWHRjUDJ6UUhvQUZxWEU0QXNvMVh5ZDZLOEprU3VCaXhVWFdzbC9W?=
 =?utf-8?B?TkExZERUeUJUYjVGYXBnNFVnTFd5MUFacXJWYkZpMU1WL2U1dmVoNWJnS3Ji?=
 =?utf-8?B?SHpmL1dNTVM0VWliUjBZaU5qTXNxdVUxOERhVm90aHk2YVArZFpKU3BnUTZs?=
 =?utf-8?B?ckZCaXFlYUJpT1ZKMlMxQVhMdGpYQmx5eHF2SXJIeWxnZnhhZTQxZXZLbUJr?=
 =?utf-8?B?cE5aVXc3NDJBTEFjbFNSd1lhVlVlNEV6VFBBVTlCZy8yQ2hpNXVscEE1WEk4?=
 =?utf-8?B?bFVHUWVnemhLNTUxV01MdTVDSVBQdExrK21Xa3J0SFpxOU1ZZW43eENCUkFz?=
 =?utf-8?B?d3I1VHdPTTBIRFdvOGU2SXMwMzVISTRHcU95SW1ZUDMyVVF0TjIvYVRwd3hw?=
 =?utf-8?B?MWo2eURNQUJtczJMWHgzM29KZytNTElVTkN3WWhhRnhoZTV0OUMrZjJERWNH?=
 =?utf-8?B?aE5YdG9HZy9zM29KT3JabmtCUjNMaGJyL3YzOE1Pb3RTOHQ5RDVWYnZhd1Ns?=
 =?utf-8?B?ZGpXTy9aZXdlTUQ5S3Y2bjRlM3RUaVplK1RNWC9leU9vSTJ4WWVqcnNiQ2I1?=
 =?utf-8?B?dXl2VkFOQkpLYXpRbTdLT1pPSWFhc2dFMkgxQmN1K2lqbFZwL09GMUttS2pw?=
 =?utf-8?B?WlhNVHN4YWRyaFVSZWVyR2ZRS0VDN1Rmazk4MWRnUnlTaFlyem1EcEZSUmJp?=
 =?utf-8?B?bE92R2lqeENEK0EwSUl2QVVJQ3V1U1FUTVV6b1U4YXZPaURwT3FPUy9oOWdB?=
 =?utf-8?B?eDFDdU8rKzhIM0txbmlwYVpwdjZtOTFjcDNYdFg1N2J0aGZOVnpGL1RkQkUz?=
 =?utf-8?B?NHIySVM4dFF5dlUrYUtiTktKaExUbERXeklnTDV2WWxIa1k3dVljUHdob2tY?=
 =?utf-8?B?dkJ6bC9BMjJPaXlmeUpnOHh3RlZka1FoRlM4MVM1M2V5ZHFiTmNPWHcyc3FP?=
 =?utf-8?B?a3lkS2VOdG1TRDFpeFI2ZFRORnhBUDdCdE5rNGFoWjRBMXVTUzBDWHV1dUhR?=
 =?utf-8?B?VW5wTGR3aEJMUzY1MXhtRnNCcjUxZEd3RzU3WUhLOTR1NTEwYVpGU3NiRGdL?=
 =?utf-8?B?ZDZQY2JDS1FVK1lCV0JwOUF5ckVkdTRPMVhUMkpFbDdKenpyZld3b3hpc09B?=
 =?utf-8?B?YmtiZmcrTmxMRUV0cHVScXZ4d2s4MWdhbFFJZVhJc0JTYmFpUS9BY1NLVnpx?=
 =?utf-8?Q?i7X4pteW5PcpkZTsVftwxAJsW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19be623a-0ad6-439c-2852-08ddad9db0e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:51:34.8919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98dgQt/jOv5nZTgOKmy8lwTo4HwmXrkm3qKDehV97fO9Pg8sm6dCUiKkNpBnAf3g
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
> Allow NULL pointers at amdgpu_vm_put_task_info() as it common practice
> for "put" or "free" functions. This avoid an extra check for NULL for
> callers.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v9: use if (task) instead of if (ZERO_OR_NULL_PTR(task))
> v8: New patch
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3911c78f8282..de914a39e3f6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2447,7 +2447,8 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
>   */
>  void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
>  {
> -	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
> +	if (task_info)
> +		kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
>  }
>  
>  /**

