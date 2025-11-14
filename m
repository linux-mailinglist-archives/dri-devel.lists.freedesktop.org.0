Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B6EC5DB34
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1B10EAA3;
	Fri, 14 Nov 2025 14:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D0UIjqxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A8210EA9C;
 Fri, 14 Nov 2025 14:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTpxa2+aE2WtPTk3q4giLwda1Hdn/+i1/KjTXz8rp1g+bnF2XmM8x5S9qspAGicwjiYvfJsJDGZ1i5uFFIlsilsr8Qo42cvDpFifrhUA0bE4aT3j3U68LQDinKClbhAYoQrfKTOkW98WhUBQhUJrHubUWKXZMTRdfJ0tVhm00YaOgMf0J5anEQzb6f1n3KgDLZYp5NuF88HEm3Jx6v3ocMoq7wBMBnDMKB7WCnyGdoF2Q9OEDiHecySfHrmiy2Jx0ezP5Hhe5k504vxqWLvYSCrN2ve2T7/d8ai8tWKzEMRrt0mrzXprZ9ha4499nQoD6rHK+wb1tiSSTFLdakh3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ycf1ztgMmmsyGrwKT4WgUTqBqUAKL2e+fwi2kf0qvpM=;
 b=FqdoyISo/U8Udg7H96EgtHE4SY1MMxZEocdG2KHJgIktVq7RcJ+yZeW0sF//gwCqqFmw8/8dFIqVafg6Y2Ut+glvEsJj+HyxsOOcf++CWG0SGmSQQ04CtnDfx1De/HHU6efhiq//dQvS9AuIBrm9vQpTZ8eeak3tawBnd/q1KafMF7AI2FujsuCttPy8onzXTlB6a0dKw6ORIgaQTlAuJ3xlAcguu/34Nf3cS4gIAlVU7AFa+oyAvZZXZ34AJ0hDPOk955GvAv6LzoM1LmLvktyS88mq15DcKGhDSaKdP+MJ+m7K0mnDOyp+kuuv42kYRmkOvzsk3nQvFw4TTu/gwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ycf1ztgMmmsyGrwKT4WgUTqBqUAKL2e+fwi2kf0qvpM=;
 b=D0UIjqxB+CIFCSpo4NzpGMJ9qBj5iZiC2diw9gRSRgwJz3Ikb1UyU42DzSAsZauPP0nd1oB+lYM5WxDcvn47sCcTkLLUD9Oj3Qvk+Uuc3p8ddouqLgmwedHajzfv5gx/LsCL3RA5vBOXg+jezwfmuJhdJ9x8bsYC2TXdOpkSE9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 14:57:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:57:09 +0000
Message-ID: <04337032-de43-443f-80a6-7ab5670b3d3a@amd.com>
Date: Fri, 14 Nov 2025 15:57:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] drm/amdgpu: give each kernel job a unique id
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-2-pierre-eric.pelloux-prayer@amd.com>
 <e1371dbb-a33b-4246-b71d-0b56d5ad85cd@amd.com>
 <bd3938b1-0eef-4fc5-9fd7-3f2518cf1cd5@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bd3938b1-0eef-4fc5-9fd7-3f2518cf1cd5@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0445.namprd03.prod.outlook.com
 (2603:10b6:408:113::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 621b485f-75f2-4dde-7000-08de238e1569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnZvSGppOXBrZkgwRENScmNxTE1nRWgyWEN1R0wybld3Ui9YSFNmYzNScjVU?=
 =?utf-8?B?aGV5L2h3RmUxSXl3bzF6Sk9wbDlxRlQvSHBZNHBpRDQyM0p5VnJ3dHJoMCtV?=
 =?utf-8?B?KzBtdFJOaWUyOERXYTdoQ21taUV6UVJsOXBRV3ZRS09hWTN0TjhJaGdjQWsx?=
 =?utf-8?B?TFVIenlnL1g3clZJb3N0NXc2YnRPUVVjNjk3bDZ0Sk5uVXh4d2VpSTJ4dklv?=
 =?utf-8?B?SHAzSFJqQ0RDNGtRa0hlWFVUZEpUVVl2cG4zRnJxSERWSnNEZTdTUTRMOHB5?=
 =?utf-8?B?U2t5N2JsOXZ4RVBRR096RCtuR0xXeURIZWJkUXFtRXovNGtnU1ppTSsreHhG?=
 =?utf-8?B?TTdQM0pSWW9NVm92WUhaOXFpbnZYWG1nNEJMRk1reEx4a0VIcTl5d2FJMWk1?=
 =?utf-8?B?V0VlOTJrWkxldFNzMlNsZ0pWZ1h3WU5Ob2R3SXhoaFJQcEFuSzZBMmxjMS9I?=
 =?utf-8?B?dlUrQWN4ODNTaXl5VDE3WHViTEVkVUxRNnRVb2kvRUVCNitubHEwUGJpeXZN?=
 =?utf-8?B?YThSdVdYcVZFaEVGajVxL0pDYlZIc0M2aGVRbmczNDNkeEFzSmhpNGo4UHlm?=
 =?utf-8?B?dVlzZzgzaHV5MkdCWnBaVVo0SGo0bFNxV2FxbnFwZ1ZNODNSZ3Bya1NVY3lB?=
 =?utf-8?B?a3VEamRsOFNheThNcXZ2dU9ZTk5zWXpVRUE0VkhneWM0Y3hvWExJYVpjN2lz?=
 =?utf-8?B?ZXB4SFAzZUtIejd5SjNQSk5zdmtNTjZ0d0d4ZGVENTEyN1JsY1E0K3ZHL3lL?=
 =?utf-8?B?aGU0QWFtczFuS1J3UU5pZXNUb2Zwc21GamE0VHlQOERsMG44NHZOOUxZVE80?=
 =?utf-8?B?UGI1TmNPcWtLbUQ2b1dTRHVaRGcxZGhmN0hIYlpzYVVsS3V1OWpFRGw0SlFM?=
 =?utf-8?B?NTdEWFNwTksxZzN3L1RlV2ZpbmIxRU5UazVPdzFmcVV6dW5GMk9LVG5Ka1hx?=
 =?utf-8?B?MU5xOUVLN2ZZM1ZiSG9lQU9RU2FJQ3dOMEtDTVIyV0pYMmxvMG9JY1VBZTBM?=
 =?utf-8?B?bHdaOUNhM3lFc2o0dlRGa21na0ZUcEYzQndqeVRyUC9rMlFtd1BiKzAyenhF?=
 =?utf-8?B?WU9WNVBHZFpVOE05amt4eHNZdStHdUZMUU9VNVVnOVFKdko3anJSTXJ4S1V3?=
 =?utf-8?B?SXZhU2dYYnJleHd2UFRBakI4UkV1dW9tRGNLU3NKU3gzbWRIUnZWNi9KZmR6?=
 =?utf-8?B?alp5dHZhL1RMV3VaandCU1JUdStEbkpjd3lLMTBqdCtqY3FOd2RmM0JYVDI2?=
 =?utf-8?B?OTRoM09XTVFsWG5XWi9IVzJRYytzWkFJc0xKZkhOR3I4Um05dDNXNnQzdnJI?=
 =?utf-8?B?ZmNheHBhS0RuVXJxR3VhSVhlVWJ1Y2lreXlyczg0TnVYYU0wK0wrSEIxSExj?=
 =?utf-8?B?UFpQdkJ2ZExGYngwaktVV1c1cGZ0MjZOOWVvSWJpa0xGYVBYbXRlWS9xc2FX?=
 =?utf-8?B?N044bGIvVVZOQnMrcE92eStaeUFmWGJIdGpCN0JsNFFaZElPaVhVUmhBV09P?=
 =?utf-8?B?YnIwZGhMTkVTdG9aRzhsYkgvMndnVUh4WGlFbGRNR0lkck8xUms2SFd4SDQw?=
 =?utf-8?B?K3IyU1NsTDY1VVROWnJESlA3TkU4cjJFQ2J6dWt1UVpQcllzWlRuMkJHeVJ2?=
 =?utf-8?B?OFd6K3NxL2R0K2Y0SmJyczg5ZEhIdm4zUXNhVENNOVpkdjhIcGpIa2pPSGtw?=
 =?utf-8?B?ekw4ZkRSUG5DWnZyWmlYQXQydWZVRDZFSFM5d2NjV1oyNVVmR2pkWnlqa1pS?=
 =?utf-8?B?K1duTFhhN1BzSUFXanlsdkUwM3lzbndYWUVsYjc4TlFZMFV3czJvQVVXTTE1?=
 =?utf-8?B?NjNlSTFnV3cyVDErNkFPcWU2bzA1NS9GU3Y2dTQwVXdQcisxYXcvOXNqRzlC?=
 =?utf-8?B?QWs1RUJNNXF4ZnhudWFLTWxhWE44dCt2NEU4REJoc21aTDJKVGFITG51KzNn?=
 =?utf-8?B?N2ErekgwNTJ4MEdSdmxPU3lXVnJyakxCV05yandFK3JaYmpXTlVFWTJDcDlN?=
 =?utf-8?B?VGRmQm14RnBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUZhM3dmTXdQZUtpTkxSTGNrLzN0WmIwaXVhaDZ0WUNaZDdaOFpucGtUalc4?=
 =?utf-8?B?RVozVjdPbDIvOHJldWxseFRKL1RlbWhhQzZMaDBBNElmOG8vak1EOVlZNUFH?=
 =?utf-8?B?NVRVMGU4Q1FDTlRoM3g5NktXWERwRXJuci9ya293Z1dMR0lpRWozWFJ0UWY4?=
 =?utf-8?B?ak9uQ0lwVG1sVWZUZU9KY2MydVhGVGMrMFliSnRaczRxOStsRmpxS0t2elk5?=
 =?utf-8?B?WWV0bUhZT1JYaDRkOHpJWVdyOVBKNnVPVHU4OSt2RkpTWndSNGRQOFNwcU10?=
 =?utf-8?B?aTJiMmZWeDZlV3I4dkpWMDkyY1BCNTMrQzN6OVUyanQ2akFZaUtncVI4K2pW?=
 =?utf-8?B?NzFpTE1sTG5NRzZYREh1NHMzdWhsanYxaU10MlUwc095dkNoQk9xL2x3Slhv?=
 =?utf-8?B?d0FwSE5NNjFHMk1yd3ZmNk91aDJVb2kzV3RpcUpIbFVYUjVsUm5TVG9NdFVr?=
 =?utf-8?B?WC84cTdLNUxrVmRnNjRrMkJvdnRPZjR0TFRPSUVJYTBvbUZmYlBuWVNoSE45?=
 =?utf-8?B?dkhtT2RoZHZNS1pvWGw3b2p3KzdwLzg0REZ3RWdjbHQwUE1WRzRXTTlvNEdp?=
 =?utf-8?B?SzkwTGVxZ2F3RFpYY0dQam1jWWpWcWVXdWg3MldSSUtOZ2FneUNobXJFY1Z5?=
 =?utf-8?B?eXhCNTNpdzJILzhJR3BFbWRrWE9SK1Z0eE5hK0FlLzlNREliOUxzSGU1ekhs?=
 =?utf-8?B?Z2tydi9BRTJGSGdkb0o5YzVWakpNbTZSOEgrbHdDWm5tdEdIdTU4dU96ZGhO?=
 =?utf-8?B?SnZXeGg4OVNzR3Ryd0VjU3FDb1IzR0QxTW1XemNFd25OYjZ5dksvcHRNazFx?=
 =?utf-8?B?YXlTempDQnVVMXRuMjgvcW9udmlHS0wycndnYTdlamtxRXpCL2phWFVkcWdv?=
 =?utf-8?B?K2FTbm9TRGpPdm9mVC9vTE9lRm9OMHZMNVBKSTdwTW4vT0VsU25iRndpQ0dT?=
 =?utf-8?B?akQ1cnZxMGNxQW1FbDBLUmVPWmJ4cFYzTjhjY0dxT2RBODhnZldLN2xET3U0?=
 =?utf-8?B?L3ZjcGFRRmVHdlNzNWxZU1htWUpnYmIwUzNKemQvZVk4K2hqQy91eGRWSmp4?=
 =?utf-8?B?QjlsZFZJYkpDRW9VL0ZqaDNZaUlUU0RlbWl3Y205TzlRWE51dENRNXhTRzI0?=
 =?utf-8?B?eXhpSytxQTZqamVYS0RTcUlNK2wvMmJZdW1hcCtMTno3N3ZFN29SNUl1Yjdo?=
 =?utf-8?B?bUtXQUhiZUdyVUhSRkRpZy9DMHBoRWI5aEhhZ25RekNKRVlCQ2kyWXRVWHIy?=
 =?utf-8?B?NWFIU2F6d3pxeFB5anhzYjhmSWJEMVdkTk81WG95Vlg5cERlN1NHVVpsbEFW?=
 =?utf-8?B?bzgreWFXRklEV3V5RTlPc1lTWEROZGR3ekU5aFVLWmQyRE1hTmUzdTVnTE1m?=
 =?utf-8?B?dTFrNWdUY3A4aEtOK1UvVzlib2VPT054KzVnd0laUktvQlRNNFF2cUY4ck11?=
 =?utf-8?B?cExjaEdUdEVkVC9QTSszNVFrQlF2Wnh0VEhVVTY3RHJySElXWmVOMGRhWnNl?=
 =?utf-8?B?WVdnUktNbVVRRDJ4TTczVGJueENzR0JPcWlXOEJWSlp0S052VmdrWlpPYTJJ?=
 =?utf-8?B?aHZHZnRXRzFyeWx3aHduRmZlelUrRUlrc0F5YjNya1V6cStEa0RVT2l4VEFO?=
 =?utf-8?B?ci9jOCtCSEtnTHdMY1hCN1NSSVMzYTJ0bVpRQWl4YWdlWDRmTWRZdzZaU3VO?=
 =?utf-8?B?d0hrKzI0aHAvb1RuRGVyTmszSVlJMEtEazRLQm0wQlltRXdkMUlJcE5GUEpp?=
 =?utf-8?B?c05NOHcwa0pVSERZN3ZuWkdySEJUaDE1UmVucWUyc1lTR1Z1ODltMzk2RWg3?=
 =?utf-8?B?OTdjNHNEU2dFcjRPa2ZyaVdiSm1zRldGbXYyVVQxTlFuVHZXVy9ZY25BYXVL?=
 =?utf-8?B?OHpyRHh3MWFJN2NkODFNT2hjM29XNVdIVityZGNRQjRxTWRVY3Y0RTFKZmpr?=
 =?utf-8?B?WHFDOHdPZHJMMWdBMENIODNWU050dTdqSmhVTDM2OTZPSXprbjUrTmNEZjIw?=
 =?utf-8?B?eWU5QmxUOVBtZmVtRFI1QUVHUXptYXVtZkVtVlBJamdKUU1EMnB4WUJlNVlF?=
 =?utf-8?B?bVRWNHZtZFdYT0kyTjVrejdhWThrV0s2ZjgveHdsenhySjloQ2lOZEo5QmxB?=
 =?utf-8?Q?6J71iEy1gfg6r+Q7rXi5G0IUR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621b485f-75f2-4dde-7000-08de238e1569
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:57:09.0122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D87Z2yC3lKvlClOaaH3ODVV7XEUAP1tBd5aA0aOJxYrkowz5/h9Dnd5C3cokXRf+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791
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



On 11/14/25 15:36, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 14/11/2025 à 13:26, Christian König a écrit :
>> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>>> Userspace jobs have drm_file.client_id as a unique identifier
>>> as job's owners. For kernel jobs, we can allocate arbitrary
>>> values - the risk of overlap with userspace ids is small (given
>>> that it's a u64 value).
>>> In the unlikely case the overlap happens, it'll only impact
>>> trace events.
>>>
>>> Since this ID is traced in the gpu_scheduler trace events, this
>>> allows to determine the source of each job sent to the hardware.
>>>
>>> To make grepping easier, the IDs are defined as they will appear
>>> in the trace output.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com
>>
>> Acked-by: Christian König <christian.koenig@amd.com>
>>
>> You should probably start pushing this patch to amd-staging-drm-next even when not the full patch set is reviewed.
>>
>> We need to get this partially merged through drm-misc-next because of the TTM dependencies anyway.
> 
> I've mentionned in the cover letter that this patch was already merged through drm-misc. I'm including it in the series to avoid conflicts.

Sorry, I've missed that. BTW please base the patches on top of drm-misc-next if possible.

At least the TTM patch need to got through that branch.

If the other then don't apply any more cleanly then just send out the TTM change rebased.

Regards,
Christian.

> 
> Pierre-Eric
> 
>>
>> Regards,
>> Christian
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
>>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
>>>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
>>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
>>>   19 files changed, 84 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> index 3d24f9cd750a..29c927f4d6df 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>> @@ -1549,7 +1549,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
>>>       owner = (void *)(unsigned long)atomic_inc_return(&counter);
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
>>> -                     64, 0, &job);
>>> +                     64, 0, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
>>>       if (r)
>>>           goto err;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> index 97b562a79ea8..9dcf51991b5b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> @@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>>>       r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>>> -                     &job);
>>> +                     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>>>       if (r)
>>>           goto error_alloc;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 55c7e104d5ca..3457bd649623 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -234,11 +234,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>>                    struct drm_sched_entity *entity, void *owner,
>>>                    size_t size, enum amdgpu_ib_pool_type pool_type,
>>> -                 struct amdgpu_job **job)
>>> +                 struct amdgpu_job **job, u64 k_job_id)
>>>   {
>>>       int r;
>>>   -    r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
>>> +    r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
>>> +                 k_job_id);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> index d25f1fcf0242..7abf069d17d4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> @@ -44,6 +44,22 @@
>>>   struct amdgpu_fence;
>>>   enum amdgpu_ib_pool_type;
>>>   +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
>>> +
>>>   struct amdgpu_job {
>>>       struct drm_sched_job    base;
>>>       struct amdgpu_vm    *vm;
>>> @@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>>                    struct drm_sched_entity *entity, void *owner,
>>>                    size_t size, enum amdgpu_ib_pool_type pool_type,
>>> -                 struct amdgpu_job **job);
>>> +                 struct amdgpu_job **job,
>>> +                 u64 k_job_id);
>>>   void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>>>                     struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>>>   void amdgpu_job_free_resources(struct amdgpu_job *job);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>> index 91678621f1ff..63ee6ba6a931 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>> @@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>>>       int i, r;
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>>> -                     AMDGPU_IB_POOL_DIRECT, &job);
>>> +                     AMDGPU_IB_POOL_DIRECT, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index fe486988a738..e08f58de4b17 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -1321,7 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>>       if (r)
>>>           goto out;
>>>   -    r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
>>> +    r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
>>> +                   AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>>>       if (WARN_ON(r))
>>>           goto out;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index e226c3aff7d7..326476089db3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -227,7 +227,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>>       r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        num_dw * 4 + num_bytes,
>>> -                     AMDGPU_IB_POOL_DELAYED, &job);
>>> +                     AMDGPU_IB_POOL_DELAYED, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
>>>       if (r)
>>>           return r;
>>>   @@ -406,7 +407,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>           struct dma_fence *wipe_fence = NULL;
>>>             r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>>> -                       false);
>>> +                       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>>>           if (r) {
>>>               goto error;
>>>           } else if (wipe_fence) {
>>> @@ -1488,7 +1489,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>>       r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        num_dw * 4, AMDGPU_IB_POOL_DELAYED,
>>> -                     &job);
>>> +                     &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
>>>       if (r)
>>>           goto out;
>>>   @@ -2212,7 +2214,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>>>                     struct dma_resv *resv,
>>>                     bool vm_needs_flush,
>>>                     struct amdgpu_job **job,
>>> -                  bool delayed)
>>> +                  bool delayed, u64 k_job_id)
>>>   {
>>>       enum amdgpu_ib_pool_type pool = direct_submit ?
>>>           AMDGPU_IB_POOL_DIRECT :
>>> @@ -2222,7 +2224,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>>>                               &adev->mman.high_pr;
>>>       r = amdgpu_job_alloc_with_ib(adev, entity,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>> -                     num_dw * 4, pool, job);
>>> +                     num_dw * 4, pool, job, k_job_id);
>>>       if (r)
>>>           return r;
>>>   @@ -2262,7 +2264,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>>       num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>>>       num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>>>       r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
>>> -                   resv, vm_needs_flush, &job, false);
>>> +                   resv, vm_needs_flush, &job, false,
>>> +                   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>>>       if (r)
>>>           return r;
>>>   @@ -2297,7 +2300,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>>                      uint64_t dst_addr, uint32_t byte_count,
>>>                      struct dma_resv *resv,
>>>                      struct dma_fence **fence,
>>> -                   bool vm_needs_flush, bool delayed)
>>> +                   bool vm_needs_flush, bool delayed,
>>> +                   u64 k_job_id)
>>>   {
>>>       struct amdgpu_device *adev = ring->adev;
>>>       unsigned int num_loops, num_dw;
>>> @@ -2310,7 +2314,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>>       num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>>>       num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>>>       r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
>>> -                   &job, delayed);
>>> +                   &job, delayed, k_job_id);
>>>       if (r)
>>>           return r;
>>>   @@ -2380,7 +2384,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>               goto err;
>>>             r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>>> -                    &next, true, true);
>>> +                    &next, true, true,
>>> +                    AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>>           if (r)
>>>               goto err;
>>>   @@ -2399,7 +2404,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>               uint32_t src_data,
>>>               struct dma_resv *resv,
>>>               struct dma_fence **f,
>>> -            bool delayed)
>>> +            bool delayed,
>>> +            u64 k_job_id)
>>>   {
>>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> @@ -2429,7 +2435,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>               goto error;
>>>             r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
>>> -                    &next, true, delayed);
>>> +                    &next, true, delayed, k_job_id);
>>>           if (r)
>>>               goto error;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index 054d48823d5f..577ee04ce0bf 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>               uint32_t src_data,
>>>               struct dma_resv *resv,
>>>               struct dma_fence **fence,
>>> -            bool delayed);
>>> +            bool delayed,
>>> +            u64 k_job_id);
>>>     int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>>>   void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>> index 74758b5ffc6c..5c38f0d30c87 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>> @@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>>>       r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        64, direct ? AMDGPU_IB_POOL_DIRECT :
>>> -                     AMDGPU_IB_POOL_DELAYED, &job);
>>> +                     AMDGPU_IB_POOL_DELAYED, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>>> index b9060bcd4806..ce318f5de047 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>>> @@ -449,7 +449,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>>>       r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>>> -                     &job);
>>> +                     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   @@ -540,7 +540,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        ib_size_dw * 4,
>>>                        direct ? AMDGPU_IB_POOL_DIRECT :
>>> -                     AMDGPU_IB_POOL_DELAYED, &job);
>>> +                     AMDGPU_IB_POOL_DELAYED, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> index 5ae7cc0d5f57..5e0786ea911b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> @@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>>                        64, AMDGPU_IB_POOL_DIRECT,
>>> -                     &job);
>>> +                     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           goto err;
>>>   @@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>>                        ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>>> -                     &job);
>>> +                     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           goto err;
>>>   @@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>>                        ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>>> -                     &job);
>>> +                     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   @@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>>                        ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
>>> -                     &job);
>>> +                     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index db66b4232de0..2f8e83f840a8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -983,7 +983,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>>>       params.vm = vm;
>>>       params.immediate = immediate;
>>>   -    r = vm->update_funcs->prepare(&params, NULL);
>>> +    r = vm->update_funcs->prepare(&params, NULL,
>>> +                      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
>>>       if (r)
>>>           goto error;
>>>   @@ -1152,7 +1153,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>           dma_fence_put(tmp);
>>>       }
>>>   -    r = vm->update_funcs->prepare(&params, sync);
>>> +    r = vm->update_funcs->prepare(&params, sync,
>>> +                      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
>>>       if (r)
>>>           goto error_free;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> index 77207f4e448e..cf0ec94e8a07 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> @@ -308,7 +308,7 @@ struct amdgpu_vm_update_params {
>>>   struct amdgpu_vm_update_funcs {
>>>       int (*map_table)(struct amdgpu_bo_vm *bo);
>>>       int (*prepare)(struct amdgpu_vm_update_params *p,
>>> -               struct amdgpu_sync *sync);
>>> +               struct amdgpu_sync *sync, u64 k_job_id);
>>>       int (*update)(struct amdgpu_vm_update_params *p,
>>>                 struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
>>>                 unsigned count, uint32_t incr, uint64_t flags);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>> index 0c1ef5850a5e..22e2e5b47341 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>> @@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
>>>    *
>>>    * @p: see amdgpu_vm_update_params definition
>>>    * @sync: sync obj with fences to wait on
>>> + * @k_job_id: the id for tracing/debug purposes
>>>    *
>>>    * Returns:
>>>    * Negativ errno, 0 for success.
>>>    */
>>>   static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
>>> -                 struct amdgpu_sync *sync)
>>> +                 struct amdgpu_sync *sync,
>>> +                 u64 k_job_id)
>>>   {
>>>       if (!sync)
>>>           return 0;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> index 30022123b0bf..f794fb1cc06e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> @@ -26,6 +26,7 @@
>>>   #include "amdgpu.h"
>>>   #include "amdgpu_trace.h"
>>>   #include "amdgpu_vm.h"
>>> +#include "amdgpu_job.h"
>>>     /*
>>>    * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
>>> @@ -395,7 +396,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>       params.vm = vm;
>>>       params.immediate = immediate;
>>>   -    r = vm->update_funcs->prepare(&params, NULL);
>>> +    r = vm->update_funcs->prepare(&params, NULL,
>>> +                      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
>>>       if (r)
>>>           goto exit;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>> index 46d9fb433ab2..36805dcfa159 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>> @@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>>>     /* Allocate a new job for @count PTE updates */
>>>   static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>>> -                    unsigned int count)
>>> +                    unsigned int count, u64 k_job_id)
>>>   {
>>>       enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>>>           : AMDGPU_IB_POOL_DELAYED;
>>> @@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>>>       ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
>>>         r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
>>> -                     ndw * 4, pool, &p->job);
>>> +                     ndw * 4, pool, &p->job, k_job_id);
>>>       if (r)
>>>           return r;
>>>   @@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>>>    *
>>>    * @p: see amdgpu_vm_update_params definition
>>>    * @sync: amdgpu_sync object with fences to wait for
>>> + * @k_job_id: identifier of the job, for tracing purpose
>>>    *
>>>    * Returns:
>>>    * Negativ errno, 0 for success.
>>>    */
>>>   static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>>> -                  struct amdgpu_sync *sync)
>>> +                  struct amdgpu_sync *sync, u64 k_job_id)
>>>   {
>>>       int r;
>>>   -    r = amdgpu_vm_sdma_alloc_job(p, 0);
>>> +    r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
>>>       if (r)
>>>           return r;
>>>   @@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>>>               if (r)
>>>                   return r;
>>>   -            r = amdgpu_vm_sdma_alloc_job(p, count);
>>> +            r = amdgpu_vm_sdma_alloc_job(p, count,
>>> +                             AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
>>>               if (r)
>>>                   return r;
>>>           }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>>> index 1c07b701d0e4..ceb94bbb03a4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>>> @@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>>>       int i, r;
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>>> -                     AMDGPU_IB_POOL_DIRECT, &job);
>>> +                     AMDGPU_IB_POOL_DIRECT, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   @@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>>>       int i, r;
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>>> -                     AMDGPU_IB_POOL_DIRECT, &job);
>>> +                     AMDGPU_IB_POOL_DIRECT, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>>> index 9d237b5937fb..1f8866f3f63c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>>> @@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
>>>       int i, r;
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>>> -                     AMDGPU_IB_POOL_DIRECT, &job);
>>> +                     AMDGPU_IB_POOL_DIRECT, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   @@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
>>>       int i, r;
>>>         r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
>>> -                     AMDGPU_IB_POOL_DIRECT, &job);
>>> +                     AMDGPU_IB_POOL_DIRECT, &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> index 3653c563ee9a..46c84fc60af1 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>> @@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>>>                        AMDGPU_FENCE_OWNER_UNDEFINED,
>>>                        num_dw * 4 + num_bytes,
>>>                        AMDGPU_IB_POOL_DELAYED,
>>> -                     &job);
>>> +                     &job,
>>> +                     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
>>>       if (r)
>>>           return r;
>>>   

