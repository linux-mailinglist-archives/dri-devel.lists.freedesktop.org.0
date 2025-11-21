Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAFBC79125
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9577810E2B7;
	Fri, 21 Nov 2025 12:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="adbVecaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013067.outbound.protection.outlook.com
 [40.107.201.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FED10E2AD;
 Fri, 21 Nov 2025 12:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW91ciKgX4XSNiWQlqvYN7+BdGAKUHWb3r17iUZb8C4Asilq1yqW73a6M5wmXZHeYuY9MOvZ4FMJN28x6FTNPFST5cas0+mApfmuFsqIgb3tedX7iHuJn0WGla3aL5VJuimmYxsbs9hJqCi+6PpqROAmSXGIJbuRjpZ5BzibWl3szYa0AckfIu59Fy63XDv5BwN+1OejXbEObqEhgYV727Xd0XgWIB3ST7k7j21vzSeLJ4Ve0z/Y+eqLE1rj1mYiz4V0jowBfX3et6RmJHQizHSUTVFqiV39+DsM2IwqHvP9cMQdVTnah7La3YaY1Jh0k9TWVqCGwRqZTtJ5kyn80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOBZr6tTxutbhwuR8Lkfgy5MMjzfKDfbFN5uN4REeAE=;
 b=P36mu5kSfTW80cMxamomBmAyeXpUG82K9wfEV5t9FCkXAFcJkeu/oW8tBvH3KM/SpLxyoyHBs3rk+ttfk7u4W9Rn6fWsd2MQSGG5rNM8UAAh/79A2aSCDWhj/Qeco4dI+wMcqGpyyQUsvy/FEe1wGv2Y0AopZDiOhUvg7UPIM2wd70X62AhsM6blJnJ1W7N+RdxXMGWZ10CHGVqyDmNVv9yWVP90lR8MGkTBRmzH0ykej5oTx5eIeOEOsgxT2yAQZn/eDPfYKyLjlqBBWYZ7fpNXDsHyjRsO2yWUP03xsCM+2k81WXTiJrRxnQcSEeyJDNgemt4Gp2ML0Y8kHHIEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOBZr6tTxutbhwuR8Lkfgy5MMjzfKDfbFN5uN4REeAE=;
 b=adbVecaQ5MWN4bGST10uQZd4AnKwCS3IRhXlgaRJE+bxpxeKuODPyPEUrrTvnikfIGgG1eg9VtSx1wp7DozWjz105dLFZ+wFRd2j4Qrhdvr9RczOhLnJFh4jc1+GgWzKAaf4y4T5PpjfdQOul6GrTS9q9vYx6LLiXPJanlpGgsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 12:52:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 12:52:08 +0000
Message-ID: <64e8cebe-0f68-48ef-938c-7307da1b6393@amd.com>
Date: Fri, 21 Nov 2025 13:51:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/28] drm/amdgpu: give each kernel job a unique id
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 427ba241-81ca-4697-bd5f-08de28fcc75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFVFWGg4ckUyWHRNK09QL3h2UUhsTHRyNk1iZnZjNm5XSWpaVjZ4OXZ4VTlJ?=
 =?utf-8?B?K1pjeW5NZHhwTmo5cGMxMGpkM0s0L1R2d1NaSGhkL3J2dFM4YkprRnNFSjVN?=
 =?utf-8?B?NVdEckRIUXhYOE1kc0VWL3BYQWxzZWIwUWp6STBNVFBRaEdCWnJsdHNjU2Qy?=
 =?utf-8?B?YVBzQmYzaGVjYUtEeWY2OFJ4WTRJV1BTZlQwZGJUZGdla2lxQXkrT2tiaG1H?=
 =?utf-8?B?eFB1Ri9OTlFlY1ZYV2FLempZZmFzV3pkLzF5WlBadFE1UERJWSt3WlZLVnNV?=
 =?utf-8?B?TFQ5Znp0NklVQmhTcFBiZEZFdVBxTWRRZjBPMEFDbURONnVyQXMyLytuaWRS?=
 =?utf-8?B?S2p4UTRLTktrM2RMdkplRlMrRHIzeFZjRW5sdzB4alloUmlIQUtnSFNTL3pa?=
 =?utf-8?B?dk9ya2hFQnZmdVpYNnVCaG52Q3daMHQyRExqUGtCd01PNVRCOUtFZDc5cm1j?=
 =?utf-8?B?S0JEemcvNis1VjlUWk04bWF3ZUNVdjdSOEpBUDBncEtmOEthNzdYcjRQL2pj?=
 =?utf-8?B?WlR4STQ5Uk12dmxYbktpYVZudDA3WjNOT0lPWXl1eGFjM2ttc1hoTEtnZEdT?=
 =?utf-8?B?Q3ArWkl4ckI1U08vc1RDUSsrUTc4bWhPazZmeXNPSU5YMFp0VVpUdFR6TmhO?=
 =?utf-8?B?OFdTaHFhYjJmbmw2SEpZV3N3bit6dnlNbkFKc3VsZ0VCdmdJY0Z3bVQ4clBa?=
 =?utf-8?B?dmV0bGtHeVRaYjRiUHMzUFJFTStVNmVEMzJYeVh6Zjdwdmcwc2xoMEkzNFY4?=
 =?utf-8?B?WjdoajdqK2YvM0hmRFhESjNuVEthbjBFakNHaFc0NDZ1VXlxS0tRbnM5cng4?=
 =?utf-8?B?V1lIOVpTbG45Z3dmdUVzTDMrZWtjV0I3VmMyU0JaY08zK0Yzakw5cFV1endj?=
 =?utf-8?B?UU1OVUFtbHhzWllGdm5vS3FpTEFGMXRPbmd5dXJwaWNONEExcFpxMFRJUnll?=
 =?utf-8?B?YVZtUVhmc1JHTEZiQ1B0cVNjVzFJSXVWS0wzRnFET1JIbzluaTRwSlBodXBn?=
 =?utf-8?B?YmNmWnJRdjVJTVg5Y2lDc0NCOHpCSENVY0I3QUFLMG1hNGYwOUlBYXoyNWNS?=
 =?utf-8?B?cXBLa293Mk5NdVphQmo1OVA1Z3VZSDVLQ3hOZlpQWUJZWHRvRWNHUVVYcEp5?=
 =?utf-8?B?QUhuMmpUL2NycG9ZMDlmOFB5c3l0eXVnNTF3UlFwS1d4SDF5eGFoYmxRRWJU?=
 =?utf-8?B?c2laV1ZaWjJEcEZCSFdsS01PNUtPWnRDdHF2Q2I2ZWd4YWpHVE1tenVJZkdq?=
 =?utf-8?B?Q05OOFY0SzdORGlnMFJ5UzBhTnlvbDNiM1QvWGRqWWVQeGFFaS94SFN2NFY3?=
 =?utf-8?B?UmZoTllTR0V4REFESlIxOTYzbVltT2xJS1AvaEdBWVNySTRXMW43MEVtQWRH?=
 =?utf-8?B?RGhma1pIN254TkxkZkxEaUx1WHJHRFhRL3ZjVGh3L3g2SldjQ0pmQ01TQVNW?=
 =?utf-8?B?T3dIcnh5d213VCtpdEY2bzNNTS9VZDZmRXg0TWRmcU1tT0tlQmtIY1FtREJk?=
 =?utf-8?B?dU5saVFMUnNoRlBFVFNZRUQ5bG9scG00eDczaEwyRXRwLzMvZm5reUtQZEJK?=
 =?utf-8?B?ekxyMHVlRTdKQnhxeE04aXplWjVBZmRaekpOdVQyeEM2b1l4VHNzSjIrOHJP?=
 =?utf-8?B?c1lBVXA3TjZ5ZjcwSlplc1hsSVFWRjdzUDlnWEcrRGNXU1EvejdQWG15Nm1Q?=
 =?utf-8?B?YW5scUpQQkdOUkMxaXhoWUxFZWpHaWFvZ0ZqdFptbnBjdTZ6NDV3UDVwa2ZH?=
 =?utf-8?B?YlhKb2F1Ym96VURrNzRaa0JxVmhEdEJ0bDQ4UUZaMm4wSUFDekQxM21EVFkv?=
 =?utf-8?B?dU85cVlmS2dmTTZPL3d2ZjZhclJNRTRxM25TVVdzbnlyMTRkK3VZamVobFRL?=
 =?utf-8?B?ckdMaHZKdEpsK1dqYWt6d3o5UVhPejY4eS9idjd1MVVDS012UnJpNmg2ZFA3?=
 =?utf-8?B?enZicExpaWw5OXhidXpVQkh4N21wYXdwQUM4YXh0aGhBZVI5SzBEN3VDbGFy?=
 =?utf-8?B?VWFTSDJjek13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFULzFFMmhFTFdCMTJMdzJaWGZmMlFHVk5MN0wwZGwyajdobUo3TUU1WWMw?=
 =?utf-8?B?TE9DS2RERGtpdVFhb1EvUzZSRDVYaUkxeTV0OWtseG9FdXBsUk1tYTc4UmpH?=
 =?utf-8?B?TGwvMktWeGU2MkhGY2gyQ2xUNWViYmdDZlFUVGQ5MCttVEtiZkRZZnZUSHI3?=
 =?utf-8?B?QWJ5K1pHd1lDeW1scXRseTdTQjlnVXgrNDI0WWcwWmo0WDBtZUVPTzNNLzVW?=
 =?utf-8?B?dHJnR0Z1U2pCd1ZNWS9zcnMyWnorNnlLN05CQ0ZOcWIzaVJjaDJZRlRYV1VX?=
 =?utf-8?B?Tm9ydXA1VUhmKzVWZHo0SmFqUFYybGNiNWJFbWxESTQ3MHY2WWRuRjhzWnk4?=
 =?utf-8?B?Rjhmc29RSHkyK05Dd2JTa1VHampUNkUvdm0xNnR1dWtXekFVc3ZMQitpNGJ2?=
 =?utf-8?B?dzJESm9CelRKSEZFdE5kd1FZblFsREJHNERVZDFVWFJSUXRUYmpFRUUzcU9r?=
 =?utf-8?B?ZVhqSmhua0ZxcUlQelRHZHlnMDgvNlZvRndwQTMwWTZBd0ZxQktqcnlVem80?=
 =?utf-8?B?ZlZYdk9TdEdLdVJjVENUVTI3WnVVNXg3NVgxbEZEVEUxRTNLdHFkZ1o5cHVt?=
 =?utf-8?B?dExNc3JBTjRPNS9aeUNoSDNuRUJZWFA5cCtuN1NBbWVqYWlVbEJFV1VYMjhE?=
 =?utf-8?B?cjlzbE5pUERnRWU0b0dKbjZ0aDlHQmlFY3JFQTlraXRMcTZkZFhEdkVWanlE?=
 =?utf-8?B?WEcveHpwK0VIVkN0bWxNeTF3WmlWUmZOMUtlSnZsN3JsR2dmZHhWaGlZSWZD?=
 =?utf-8?B?S2lldWFTNGpZUDhhSFNFazM5ZGFGZWdRanh4ZFZCQUxCY1BBNEpLRVNmenZK?=
 =?utf-8?B?YVlRbFR3cGQ0a3Z1Sm5YVEIrQmZXTWRvQ3JBUzJuY3lEdU8raW5ZM2FYTlh5?=
 =?utf-8?B?REtya2g1QUgvSDZoWDE1cnNXUHJhNkRDUXA2akhkSzB0enl0U3FwT3hKcFBt?=
 =?utf-8?B?SEt5MkJzekgrRFV5K3RwUSt5Z2gvM2tzS3hHcy82QWFQZnhLNmRiZFM5MGdj?=
 =?utf-8?B?UWJGZWk5eGFzNEthVDVaQjZoMUNtMFd2bTJOSjNyWXE5MmNkUEtjVm50MmI1?=
 =?utf-8?B?UTl4ZVRiQnVJeDBXMTBDc3g0VlZOLzB5czNlTk4rckVhYXNLOWFTZExaZTBF?=
 =?utf-8?B?Y0hSWUJ2M2xicXRnNVRNK0paaDd1aGhNQlVVR2hGdnpiZWlKaTgrS3FjSUtM?=
 =?utf-8?B?cllxVjdUT3NsaEhSU2MwZWdiY1BKeUt0Z3I0bHBwcTQrQUJsMlBZRmEvbURi?=
 =?utf-8?B?QmFFbkhTOWxjY2ljSXp3UWZQclA1OUxqc3A0Q1ozSGcrdDBqQUR6MTZ6SERl?=
 =?utf-8?B?VitMUk5pWXF1LzQvZGZmK0RkK24ycHcrc1pmRVhBRGFoZU5CbWEyNkhoVGM2?=
 =?utf-8?B?b1RHeFRCV3h0dU5VcnFnWjZPSjNCazQvY0Vyb2h3TUM3UDdwTE5QR25DVGJJ?=
 =?utf-8?B?MVduNWFzNzZQUG1UNGlWSkNKaDUyRVo1ZU5zaEZVK0NXQTdUUU5sNGFhV01i?=
 =?utf-8?B?QmI4MitQbDJlSkxMOEJJNGNZVlNYTE44QWY3Qmt0aWU0aVZDYkRnVzNIOUdW?=
 =?utf-8?B?UDJFVVN3OFpvN08yV3l2QVNuMk9WUGNqVjZDSzdCZjN3MS83RE1EYzFIekpH?=
 =?utf-8?B?M1M0ZkZqNC9BazBackxjM0RhSjUwNkNoV0hjTWtaZUJyL1paeTg3RHVBWFdX?=
 =?utf-8?B?ZlRLN2ZRMTdjcEFlT3JiZm1QMU9mTUFEVXR5c3Bnd0VPNkgxbVJXblNLRXBH?=
 =?utf-8?B?ODJIalYzMzJvRnZVNzVtQTNJV3JtTHUrSnQ1ZFhIUnYyMVBxMHVNaGZ0eno5?=
 =?utf-8?B?clNmOHdxQzVTZ00rUG9NZi9PWE1qN05HSExSUmFHeHRkQS9maDU1Y1d4UzV5?=
 =?utf-8?B?d3FkR04wUGZsRnJmUDh2RWRncnNRcU01WVRGT1c1QnJJYk0vanRRVWtQbllC?=
 =?utf-8?B?NGZiY3FjQjdHY1NldGNkRU42Q0tyR3g4Z01VbEF1K01SZUZIYTlhRXRRZG1t?=
 =?utf-8?B?UVoyZ2dXN0ZUaHBXVUJYUUdnVFJIdy9pOCtmTktTcjBMcDZzNWlCbEhxcyta?=
 =?utf-8?B?bTQxZ2ZaTHdiZGhrT2ViSDlORlllK0xCcGRRbzJESDFoWkJMaTZxSXdDVTlh?=
 =?utf-8?Q?GAm2BGDKxU2z92ATFscbNUyFh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427ba241-81ca-4697-bd5f-08de28fcc75a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 12:52:07.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAQEfrL3Oi7Ga5AL72u/IwesXXimMCieQ1beZMWVcZ/bux+am9ODjDr2oSVVIYpN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> Userspace jobs have drm_file.client_id as a unique identifier
> as job's owners. For kernel jobs, we can allocate arbitrary
> values - the risk of overlap with userspace ids is small (given
> that it's a u64 value).
> In the unlikely case the overlap happens, it'll only impact
> trace events.
> 
> Since this ID is traced in the gpu_scheduler trace events, this
> allows to determine the source of each job sent to the hardware.
> 
> To make grepping easier, the IDs are defined as they will appear
> in the trace output.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
>  19 files changed, 84 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 5a1904b0b064..1ffbd416a8ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -1551,7 +1551,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
>  	owner = (void *)(unsigned long)atomic_inc_return(&counter);
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
> -				     64, 0, &job);
> +				     64, 0, &job,
> +				     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
>  	if (r)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 0017bd10d452..ea8ec160b98a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>  	if (r)
>  		goto error_alloc;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index efa3281145f6..b284bd8021df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -232,11 +232,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  			     struct drm_sched_entity *entity, void *owner,
>  			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job)
> +			     struct amdgpu_job **job, u64 k_job_id)
>  {
>  	int r;
>  
> -	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
> +			     k_job_id);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index d25f1fcf0242..7abf069d17d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -44,6 +44,22 @@
>  struct amdgpu_fence;
>  enum amdgpu_ib_pool_type;
>  
> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
> +
>  struct amdgpu_job {
>  	struct drm_sched_job    base;
>  	struct amdgpu_vm	*vm;
> @@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  			     struct drm_sched_entity *entity, void *owner,
>  			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job);
> +			     struct amdgpu_job **job,
> +			     u64 k_job_id);
>  void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>  			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>  void amdgpu_job_free_resources(struct amdgpu_job *job);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 91678621f1ff..63ee6ba6a931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 24ebba43a469..926a3f09a776 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
> +	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> +			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 04a79ef05f90..6a1434391fb8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -226,7 +226,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
>  	if (r)
>  		return r;
>  
> @@ -398,7 +399,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  		struct dma_fence *wipe_fence = NULL;
>  
>  		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false);
> +				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -1480,7 +1481,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
>  	if (r)
>  		goto out;
>  
> @@ -2204,7 +2206,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
> -				  bool delayed)
> +				  bool delayed, u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = direct_submit ?
>  		AMDGPU_IB_POOL_DIRECT :
> @@ -2214,7 +2216,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  						    &adev->mman.high_pr;
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
> -				     num_dw * 4, pool, job);
> +				     num_dw * 4, pool, job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2254,7 +2256,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>  	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
> -				   resv, vm_needs_flush, &job, false);
> +				   resv, vm_needs_flush, &job, false,
> +				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
>  		return r;
>  
> @@ -2289,7 +2292,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  			       uint64_t dst_addr, uint32_t byte_count,
>  			       struct dma_resv *resv,
>  			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed)
> +			       bool vm_needs_flush, bool delayed,
> +			       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned int num_loops, num_dw;
> @@ -2302,7 +2306,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>  	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
> -				   &job, delayed);
> +				   &job, delayed, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2372,7 +2376,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			goto err;
>  
>  		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> -					&next, true, true);
> +					&next, true, true,
> +					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
>  			goto err;
>  
> @@ -2391,7 +2396,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			uint32_t src_data,
>  			struct dma_resv *resv,
>  			struct dma_fence **f,
> -			bool delayed)
> +			bool delayed,
> +			u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> @@ -2421,7 +2427,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			goto error;
>  
>  		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> -					&next, true, delayed);
> +					&next, true, delayed, k_job_id);
>  		if (r)
>  			goto error;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 054d48823d5f..577ee04ce0bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			uint32_t src_data,
>  			struct dma_resv *resv,
>  			struct dma_fence **fence,
> -			bool delayed);
> +			bool delayed,
> +			u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 74758b5ffc6c..5c38f0d30c87 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     64, direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index 709ca369cb52..a7d8f1ce6ac2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -491,7 +491,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -582,7 +582,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     ib_size_dw * 4,
>  				     direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 5ae7cc0d5f57..5e0786ea911b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     64, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		goto err;
>  
> @@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		goto err;
>  
> @@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e2587eea6c4a..193de267984e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -989,7 +989,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>  	params.vm = vm;
>  	params.immediate = immediate;
>  
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
>  	if (r)
>  		goto error;
>  
> @@ -1158,7 +1159,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  		dma_fence_put(tmp);
>  	}
>  
> -	r = vm->update_funcs->prepare(&params, sync);
> +	r = vm->update_funcs->prepare(&params, sync,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
>  	if (r)
>  		goto error_free;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 330e4bdea387..139642eacdd0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -310,7 +310,7 @@ struct amdgpu_vm_update_params {
>  struct amdgpu_vm_update_funcs {
>  	int (*map_table)(struct amdgpu_bo_vm *bo);
>  	int (*prepare)(struct amdgpu_vm_update_params *p,
> -		       struct amdgpu_sync *sync);
> +		       struct amdgpu_sync *sync, u64 k_job_id);
>  	int (*update)(struct amdgpu_vm_update_params *p,
>  		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
>  		      unsigned count, uint32_t incr, uint64_t flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index 0c1ef5850a5e..22e2e5b47341 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
>   *
>   * @p: see amdgpu_vm_update_params definition
>   * @sync: sync obj with fences to wait on
> + * @k_job_id: the id for tracing/debug purposes
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
>   */
>  static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
> -				 struct amdgpu_sync *sync)
> +				 struct amdgpu_sync *sync,
> +				 u64 k_job_id)
>  {
>  	if (!sync)
>  		return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index f6ffc207ec2a..c7a7d51080a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -26,6 +26,7 @@
>  #include "amdgpu.h"
>  #include "amdgpu_trace.h"
>  #include "amdgpu_vm.h"
> +#include "amdgpu_job.h"
>  
>  /*
>   * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
> @@ -396,7 +397,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	params.vm = vm;
>  	params.immediate = immediate;
>  
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
>  	if (r)
>  		goto exit;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 46d9fb433ab2..36805dcfa159 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>  
>  /* Allocate a new job for @count PTE updates */
>  static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
> -				    unsigned int count)
> +				    unsigned int count, u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>  		: AMDGPU_IB_POOL_DELAYED;
> @@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>  	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
>  
>  	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
> -				     ndw * 4, pool, &p->job);
> +				     ndw * 4, pool, &p->job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>   *
>   * @p: see amdgpu_vm_update_params definition
>   * @sync: amdgpu_sync object with fences to wait for
> + * @k_job_id: identifier of the job, for tracing purpose
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
>   */
>  static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
> -				  struct amdgpu_sync *sync)
> +				  struct amdgpu_sync *sync, u64 k_job_id)
>  {
>  	int r;
>  
> -	r = amdgpu_vm_sdma_alloc_job(p, 0);
> +	r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  			if (r)
>  				return r;
>  
> -			r = amdgpu_vm_sdma_alloc_job(p, count);
> +			r = amdgpu_vm_sdma_alloc_job(p, count,
> +						     AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
>  			if (r)
>  				return r;
>  		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 1c07b701d0e4..ceb94bbb03a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index 9d237b5937fb..1f8866f3f63c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 3653c563ee9a..46c84fc60af1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
>  	if (r)
>  		return r;
>  

