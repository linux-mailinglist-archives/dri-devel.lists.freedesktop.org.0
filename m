Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD1A7819D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0468810E0F1;
	Tue,  1 Apr 2025 17:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OX/lWPra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14B10E0F1;
 Tue,  1 Apr 2025 17:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0yz64AGc654KOO+KS9IUnpcxCON9D4lM85sohHH+GB3BriEKmp+rGvJbP8fr6xKc7c8O2A+pgDDx9sxDXjuTvtC2urqqVyBhczkS5YyovWgY9NsPJJldqYZ1ka4CvHZPa95dwGXmOnwCqlqqcuOSmt7e/RhX21dpmlsmTWbZhouZkN78NE6rn84Zoo6r8qq6VdkyQyK25Le1V60Ewb1YeDv5hwvRwa6DcaodpsNwI3VxODpwWuixSHzGFaTEUTc6DeOzQh2P4fB2vAvtF9ALfrXInAVZW78kyoKLChhBP2o45Gdg+nwt5d3MlN5PJ1WDrtWYuOJZ6PQsExkg+ij6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYKPJRZ4TT9QJ15wgM4EmOY5823IdoVoZcR8EM7Cfsg=;
 b=tab3RshvKj/8CCWDEIPaF102bULcz12oTMHAVmdoqSlwwbRuA8bwTa6ZYqvkTKTyVn8xoqiUsPnkzuSgVKvTabetFVMByb/RA0PCg8yS5veKv/8jSB34XaIKFhGW1lYetTC3FK0NwLCD3HiCmEdkl+yEwnNsW4Hrq+o5TBSx/tDOC69LQvg8OGsEIkxvveF9R8rZaT4zvHqoFjwcCld4E/Y20iz8egiGpwpxgt1RFWwbkILqB02lC+FJdzJdmW5HPw8OsUJJ0aIO74WNilY23HiCOeqKyvWip6OU49HeQkHoEBZSg2poixJ+uZTbEVZFbod59FUaF6uCPRN+w/s0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYKPJRZ4TT9QJ15wgM4EmOY5823IdoVoZcR8EM7Cfsg=;
 b=OX/lWPraPbsRp3DQc2BW7uBeAIsmSGqe5w/VA0Ap86Y3L+Ssm6Lq45e10S9GhU6i+a4C/QISCX/Q25xcFTqLF03ygDP1QUeDBiS9r/sj1M3i7o6ABzDShFhI5iF8M76vIkD1H8ccT2dwNrSMvHPWj1UDdWJgqx57NlSbvDjsCtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 17:44:45 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 17:44:45 +0000
Message-ID: <00cbae5b-8955-4770-815e-50522bf22288@amd.com>
Date: Tue, 1 Apr 2025 13:44:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] drm/amd/display: Protect FPU in dml21_copy()
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20250327095334.3327111-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250327095334.3327111-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::31) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: f0db718c-a89e-4028-b526-08dd7144e42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzF5ek5lcVdhcXRlTUlhVjNHcURFblNZU05keDB2MXl1am1zRjN2eUZ3RXlx?=
 =?utf-8?B?V2JLbEVabldmNDZ5dGsybFdiSmI1cUpzdW5OcWdtd25IN3V2Wlo0NHM3ZUpr?=
 =?utf-8?B?cm96cVpQQys1b01Kb2tEb2RNZU5idDBPaVlGWDJRZG0rbzFpenY0cnhEOXhO?=
 =?utf-8?B?M3JOVTN0TzFCTzdoNEZUZVdQNXNOVEV4UnhQSGYrejkvK0JicEVWc2RpUk5h?=
 =?utf-8?B?OUtHNURwTXVHRXFUaDZ5eVhySlRkM1hNdGExZnJOc1FuZit6Tk8wTGpCclh0?=
 =?utf-8?B?NVZ6MlhYUGJpbmx0RmxyQTZ6czVrZkh1K1ZKdEZJZml2Z3IrZXVDVW1ZQkZt?=
 =?utf-8?B?bTY5ajdsNWRKTWRhUk1sYkFXdytsT25WWThTcHFqd1NSRVBaZDVQNEVCMHFj?=
 =?utf-8?B?ZmZtSFlucUNRTkJ1UDA1NGM0KzZhNExsbTB5TkZtNVJhWTBUNTFHZFdKS1RE?=
 =?utf-8?B?NjBmUFdDQzBTUGl3VDVKQzkxOUFwYnJVeU9RQWU5dVh5Z0UwYmNlN1RCbDdr?=
 =?utf-8?B?SDN1bVFkSEtKRUxCSEJJNTByaTdxYVk0Q1AwMmpyVEZCd3liMXllQ1YvZkZw?=
 =?utf-8?B?RGVzbVpLcFFwZFVTS0tkVHAyNGtqTDFDWkN0SCt2bmVWdnk3OUM3TzREWmd6?=
 =?utf-8?B?eGxxVHQxbmtjSDJTUDRMZXNmb3hUSHdXdDY4MGI4eVRHM3JreXE5cndZVWw0?=
 =?utf-8?B?MEZOM2tjd1lGd0laaWJoUXcvSGEvSUF1U3FueDN6KzRZMlNNY1hhVEwrQmQw?=
 =?utf-8?B?VGc3SGJINTdHN3dCelN2K3hJcHVldEFrTUhLWFdENEk1OVNoZExIcFpiZGQ4?=
 =?utf-8?B?YXJLRUk2RUxRVk03VnY2RkZ5UzFIZGU5SFgxdmtrREgzTUg0UHIyZU1KQ0ZF?=
 =?utf-8?B?NUt6dGp1OUN3NmpTYUNablJraVhuL091RTVicEdlVnNSMWFFSlJ1US9qQmgw?=
 =?utf-8?B?VzB5d2dSVWJMSklCRVVLMUZNQVVraDZKVG1KNk9qdUZvUDRJRE5EL2NHUE5l?=
 =?utf-8?B?TDlnQTdZTlZoc0QyVHNTdktiU0ZITDFCaG5BWThzU0NTR1hWc0VaZmxPblJx?=
 =?utf-8?B?WGE0cTEvajQxRFB3MkROU1NXUWc3VS9DQ2hKQTJlSXhGMVhKZ0E2YlU4azBV?=
 =?utf-8?B?SzB0VjRhZFhxdnIzd2poaWN5TGdwaEYyTVJPd3l4TnlqanQyQVlDdkF3NG1R?=
 =?utf-8?B?anBaYklPbDROcDBJTjgrK3A2ZDl3MWFrc2poZWxOdGhzeEwrT2NHSWpsb2xH?=
 =?utf-8?B?S1JHTVNnT3lWV1JZV1Vvd3piVDJiWEtiQWE4VkMrMmpXM1ZUKzh0RjRYUFFw?=
 =?utf-8?B?MXd2QU9WKzNydWNMU2JmelNBakZmS1AxYzduU0hISnEyTTdOeTlxaGwrZTVP?=
 =?utf-8?B?MkJhWEdZUlRSLzhTL055SkdVNkZXRXkrM21aTVQ1c2dkUFdRRFNiVW91TXlF?=
 =?utf-8?B?VUVpVDFLWEsxYWxIQ05jQXZvQ2Nla0p6ZUNlaHFHcUhQUWJnemxmUlN4a29U?=
 =?utf-8?B?UTBGTXBGTzhiUDlyeVlUUXRoSDZDZmVtL1ZYSGRHQ2pTZ244OUFyMFNQWU1D?=
 =?utf-8?B?aGt0V2ZBTFR2TFF2MWYwdXpqMk95Z3p6RkUwVk1nazhOQTFrc2NidExpWnZp?=
 =?utf-8?B?S01LU3gwajdrck9EcFVqR1hnMnEySWtzR2ZvNWhjbXE0SHhqWkROVmxvcTA1?=
 =?utf-8?B?MjdLSjZ0N0lIcEtGTXRkcXZndVhlV3oydy9uOWd3T0hXTTlVQjJ5djBqZldZ?=
 =?utf-8?B?NkJ6aHdwOWhCRHB0bkVIMEdXYkhzZjdBZHQ5R2pqZTZRbTZyRjA3elA4YVBh?=
 =?utf-8?B?ZUhReHYweWswdW1VVzltYmNPRmZXKzBhREhQSkh5ekd3L2VXWDd2ckVkcGxk?=
 =?utf-8?Q?/Op1lPMonkozE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3pWK1N5Qlg5UUZGbUg0RkpObEYyWitIV04yTGoxVHFsbWdSdWhLM2s0czJC?=
 =?utf-8?B?ZHRvVUY3czJrSmFldG1GenFMTnlkQ0JlWHBCN1BuUEJlQWRPVUZoQ0lKVHRu?=
 =?utf-8?B?TG8xM2hXd1IwN2VTWkxTOEZnTm51ZGRROFNsb2NCZlpsZHF3bDl0ZStWOFVO?=
 =?utf-8?B?TXlFYmNMQmJUVWJmcVBnRGpyL2pyekMyTGFUV1VHc29xY1RpM2hBTlpYdVBy?=
 =?utf-8?B?ZjhWYmJwOXo4TVNPaFkvcEg2aFVIampOdHNQS250bGZFNWpxeHdEOXdpSGZJ?=
 =?utf-8?B?RG5WLzJ2ZE1wanVZSzNsL2FDbFNQYnNFUFRlNHJBUXZwNTFwMS9oOS9MQldU?=
 =?utf-8?B?bWdUZ2RVa3VFNDRPbnJ6RkJKcmhLbzgvbjZ4bEIrTjVVUHNkLy81T3NxZUth?=
 =?utf-8?B?bnBuUHRmd1BLaGZoVmltMlMrZlFmdzFTY2o1M3lwQ0x4Uy9waHRjRHA3VUtC?=
 =?utf-8?B?QitKdDJMMitKbzBmak55OER6bmQ2R0NpbEc3TWJwTFZocVdJd0NDQS81Y1ZQ?=
 =?utf-8?B?UnVKd1JBdkFxdkVpeGxiUlU5bWNsU0ZjWVpaUitSdDdpd0NqQjY5Tk5hQ0dB?=
 =?utf-8?B?dEFjQjgyc2NLdUxUbWp2Y1JmekdCOWQ4bkFWMnh2d1BRM2M4REZ1V0drK0dn?=
 =?utf-8?B?Z3ZlaCthSlUyNllCS1ZMNHlUWkNNcmdnSm9haHFRUS9YVWtXMUppa0FUYkNT?=
 =?utf-8?B?aks1eWY0LzRnMmovKy8zdDl4Slc5ZzF2TnVveG9DM0JxQk82MXI2Qk8wSFBC?=
 =?utf-8?B?QmJsbjZWUThmNHVpeGJKZEFHRG16YVJ4cEMyRHNJMDM3cU1SbXlSUVhmSlov?=
 =?utf-8?B?TmE3dWhjTkF6WDMrYzRhd3NXckgxRTdsZ2ZWM1puRXNVU05WNjNJR0JXd0lo?=
 =?utf-8?B?V1MyZTBwR3VtMTJBeW1LT2tUeG8vQW14ZnpCWkpFYVM0ZktQSmN2QWZTWkFJ?=
 =?utf-8?B?aEdsWjhyTk5UQ1RRNWJaZlFNYjNtdDI0d0VXZnlqUHc4dk9nRHFsQm43RCtW?=
 =?utf-8?B?Q2RvV211ZnZhbGV0a1ZhZG5qbG9aaXl5Y3RjaThEZzdZUSsrVXdmb21QRFJ6?=
 =?utf-8?B?N1Z3MnFWc0VXRy9vMUpZMTRpK3JmTjhNcnZWUzVNaC9LQTh0RW81eUR4V21P?=
 =?utf-8?B?TXpUNUNBbElVaDNYemJpYWdwekpxamVFQ01Ubndac1krVjlOUTV5bFUwNVFN?=
 =?utf-8?B?dkQrTy9BY0kxUldkNlczYkErSzQ4c1hMMWwyaUQyTFl3Y0o0V0JYMXFIbzdt?=
 =?utf-8?B?dWJYT0VldFpNOFB4d0lza2RlMlJpb25JTW03d0N4bC9sSzVtRWkwY0lHVVc3?=
 =?utf-8?B?VVlEb092d1owUk82b3M0YWFQMkF6T0NMOFVKM0MvMmFKQXJYMGZZS21OazdE?=
 =?utf-8?B?L2JybzVaZDJUNlZIWEFZb0VXeEJ6QkJ6RlVrZXgrT2hYNVZ2WVBKRXRHN2l5?=
 =?utf-8?B?eE9KMFMwMG9pTFlxeU14UXk4U28yVW94ekNKWUo1YUY2eUpvWVUrakRYY3ZK?=
 =?utf-8?B?cFdtVXJ4WCtQQkhTVVhPUHlMYzUwcHhoMENROEhKS1RJWlViZUhrMno4R1Nt?=
 =?utf-8?B?dlFvcVduRWFiWWY2N1VkVWVmcEc5NGpWcis0OHhjZkhCSUQ3d1hhNUVaWHQr?=
 =?utf-8?B?L0F3M2RvREw5Rjh1VVNKYkNzSmNRQlFET0Nwb09IQ1dseDVUdUlsOVQ2eWZV?=
 =?utf-8?B?MFBOdzBJdlBka0JBOFhHd3NNbFJzMWhpOWx2cS82c2VXejFxK1JFajk2YTRZ?=
 =?utf-8?B?cXRIeURmd1JQYnorNVVudmFPV0VqbGEzTEtaSlZaR0RkLzl6M0RkR3NMS1g0?=
 =?utf-8?B?cU43RHRqOWlZa0lEOWdLSzMrckxyNG9nSk9mZVU5bmVPTUZ3S1NLK0cxQ1Ir?=
 =?utf-8?B?RWZuaTVNNDhDL3N2VlNPTDRXMXcrU2VIYUlxSi9PVFN6WDhEcjZDTzJyWmZH?=
 =?utf-8?B?VysxaDByczRHWTNRNTV6T1BwV2h3QVIyZHZoZW9QdVlnb1JPWkxoM25HaGNT?=
 =?utf-8?B?K1NpRnl3Q3UyOXM3dDRvZDFETWRRQWRYQ2xuVUdpMGt2UGk2akROaFpyUnZI?=
 =?utf-8?B?ZWhFMUYxUVFzd2RvSnJtR04zRUlmSlNTRkFRNDMxWDhjYkEzT1JuMXZSMWFF?=
 =?utf-8?Q?viklzDf7Iir6KKq8K2wshPcSH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0db718c-a89e-4028-b526-08dd7144e42d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 17:44:45.8093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQh4Iim/nWjRyZ7drmyRHqrfk4ksoDdWW+f1P+hoHLlUP8oMN4ktjSKmV7A72tFnH3OV6Ez0z9XpWjthuoTzFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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

On 2025-03-27 05:53, Huacai Chen wrote:
> Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
> start") removes the FP context protection of dml2_create(), and it said
> "All the DC_FP_START/END should be used before call anything from DML2".
> 
> However, dml21_copy() are not protected from their callers, causing such
> errors:
> 
>   do_fpu invoked from kernel context![#1]:
>   CPU: 0 UID: 0 PID: 240 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #1
>   Workqueue: events work_for_cpu_fn
>   pc ffff80000318bd2c ra ffff80000315750c tp 9000000105910000 sp 9000000105913810
>   a0 0000000000000000 a1 0000000000000002 a2 900000013140d728 a3 900000013140d720
>   a4 0000000000000000 a5 9000000131592d98 a6 0000000000017ae8 a7 00000000001312d0
>   t0 9000000130751ff0 t1 ffff800003790000 t2 ffff800003790000 t3 9000000131592e28
>   t4 000000000004c6a8 t5 00000000001b7740 t6 0000000000023e38 t7 0000000000249f00
>   t8 0000000000000002 u0 0000000000000000 s9 900000012b010000 s0 9000000131400000
>   s1 9000000130751fd8 s2 ffff800003408000 s3 9000000130752c78 s4 9000000131592da8
>   s5 9000000131592120 s6 9000000130751ff0 s7 9000000131592e28 s8 9000000131400008
>      ra: ffff80000315750c dml2_top_soc15_initialize_instance+0x20c/0x300 [amdgpu]
>     ERA: ffff80000318bd2c mcg_dcn4_build_min_clock_table+0x14c/0x600 [amdgpu]
>    CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>    PRMD: 00000004 (PPLV0 +PIE -PWE)
>    EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>    ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>   ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
>    PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
>   Process kworker/0:5 (pid: 240, threadinfo=00000000f1700428, task=0000000020d2e962)
>   Stack : 0000000000000000 0000000000000000 0000000000000000 9000000130751fd8
>           9000000131400000 ffff8000031574e0 9000000130751ff0 0000000000000000
>           9000000131592e28 0000000000000000 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 0000000000000000 f9175936df5d7fd2
>           900000012b00ff08 900000012b000000 ffff800003409000 ffff8000034a1780
>           90000001019634c0 900000012b000010 90000001307beeb8 90000001306b0000
>           0000000000000001 ffff8000031942b4 9000000130780000 90000001306c0000
>           9000000130780000 ffff8000031c276c 900000012b044bd0 ffff800003408000
>           ...
>   Call Trace:
>   [<ffff80000318bd2c>] mcg_dcn4_build_min_clock_table+0x14c/0x600 [amdgpu]
>   [<ffff800003157508>] dml2_top_soc15_initialize_instance+0x208/0x300 [amdgpu]
>   [<ffff8000031942b0>] dml21_create_copy+0x30/0x60 [amdgpu]
>   [<ffff8000031c2768>] dc_state_create_copy+0x68/0xe0 [amdgpu]
>   [<ffff800002e98ea0>] amdgpu_dm_init+0x8c0/0x2060 [amdgpu]
>   [<ffff800002e9a658>] dm_hw_init+0x18/0x60 [amdgpu]
>   [<ffff800002b0a738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
>   [<ffff800002b0ce80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
>   [<ffff800002b008f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
>   [<9000000003c7eae4>] local_pci_probe+0x44/0xc0
>   [<90000000032f2b18>] work_for_cpu_fn+0x18/0x40
>   [<90000000032f5da0>] process_one_work+0x160/0x300
>   [<90000000032f6718>] worker_thread+0x318/0x440
>   [<9000000003301b8c>] kthread+0x12c/0x220
>   [<90000000032b1484>] ret_from_kernel_thread+0x8/0xa4
> 
> Unfortunately, protecting dml21_copy() out of DML2 causes "sleeping
> function called from invalid context", so protect them with DC_FP_START()
> and DC_FP_END() inside.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> index fb80ba9287b6..a6b8df1d96e8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> @@ -412,8 +412,12 @@ void dml21_copy(struct dml2_context *dst_dml_ctx,
>   
>   	dst_dml_ctx->v21.mode_programming.programming = dst_dml2_programming;
>   
> +	DC_FP_START();
> +
>   	/* need to initialize copied instance for internal references to be correct */
>   	dml2_initialize_instance(&dst_dml_ctx->v21.dml_init);
> +
> +	DC_FP_END();
>   }
>   
>   bool dml21_create_copy(struct dml2_context **dst_dml_ctx,

Thanks, we're adding this series to our weekly testing, and will have it 
merged if there are no issues.
