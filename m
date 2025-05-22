Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0FAC0AD4
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32E10E9BB;
	Thu, 22 May 2025 11:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BruNwTXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7727E89D8E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 11:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVOge2Z3l6Unukpuzsr4gzsRsyc8yQ33gkv+Ghk+P2ETEtMpBxaHsqU66KyeYxvhbcj+uWMuGxCjR048o3ECT6B4IqlANiAl5k3lOK9KyNMmPJCa203L1xbYBoNHKoGPFLYq4v5x17i9SgOfqv4j2Td3YoabMdg9LYQOFGqbCtgiA0yY27hJtV9APM6fWVNULHyOwOrSlhZmyy+VYBggWlMw36ASW0COXm32FLggMcVirhQnFcE3N5HdGYKdbgS22kw3j6MXHjoiODNeVqqm3lRstx1EsVyseSnCzUvlkHGQAeGMabQ5z1GeArNDJOW7EMwnvW4UxsafSrwc8ix32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHFj+wccSli4xIjqO4ThZCUElvKzih5X1GTp4368Ubc=;
 b=p5I9PyUt6E2z1dtB1UjpJL6eWzxk+CzjE2az8To3Oj7HiRS2MJxtk2Hkdb4ZJa0fRJLG9+lzviGhD4UgOaq2d7VoRWaf6JzJURsRArFjWVlbaW7xX+QK8kfcbFAQi0FMJM10g2IkkgSuNAZY/oXEx7f9TyYUoZ0DhcrHxjx8VnqdUANH4m95cVEDK87MtPgY+pnNn2a9Idl9aN/u1YmBlVyeIbjC+Pjm69TpxrsmCZXRprUMfKjwyFhIpDLHacbYy0dSgLH6OCKB9OP5huQpuWyW8gqN4B4EQySFs1dl7qD5XxnTiGhAvPaEs2OHBDyzFFSRYJICtknXkDk/bSdeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHFj+wccSli4xIjqO4ThZCUElvKzih5X1GTp4368Ubc=;
 b=BruNwTXgSjzZwZkFtzU/SHg8BDeooZ4HPbU04ZXgzP9/ejX8OpT1HREZ+0HfdH+TDdNTr7gedrMa9fqI7fCrDGGmTjPFMudnK8P3pGBOExIHLHbelR5E7E/G3Jxp5uzFcXsk7BVaBQ/5txXRHqaAI04O2tLApt2bjTGdAYgji1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 22 May
 2025 11:52:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 11:52:22 +0000
Message-ID: <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
Date: Thu, 22 May 2025 13:52:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, Sumit Garg
 <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org>
 <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
 <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b15f38-9e26-48d0-a632-08dd99271d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VndmVVNTFvcWNvckk4M0hJRXUyTUN2amFaSWRzeE5iWUhKdnlobDNyeStW?=
 =?utf-8?B?ZVcrWkVUYVhsaDFEWllxL2UzVktCQ0g4R3kwZDVENmVWOElqSGc4QWhWKzhG?=
 =?utf-8?B?RDVWSjRGbGxrZU5Vc0Q5VTRFNlFFYmdYanVqTUIvYXRTdEFFaEtvKzFGOTVn?=
 =?utf-8?B?SFVGazFPUXVKYUFnZ3Q5enUxSHBUYU1BK1REdzY1eEs2OTF5STRTTzRwczZU?=
 =?utf-8?B?bnFjdnFvZGFaWUk1bUxRTXNBM3BOaXBtRFZZQmhHbHdER3dPRFZObkswd1hT?=
 =?utf-8?B?RitWWk93YkVScmtSdWRKYWsvbWRjMytyVFdEMHhMbXZ2cEFnS0hCS3V5a2FW?=
 =?utf-8?B?OTdqVTJkVlFsSE1MMHk3b2JFZG5DdHpuRytqQjV3dktibk9aQStqZHZ3ZmEy?=
 =?utf-8?B?Ry9kTjVuTUx0ZDJEb2J4SVZNNCtscHhncWJ1cXR2MGxPdlZCUnFjTEs5Qlp0?=
 =?utf-8?B?UEJ4Q1FaNndpUTZFOHBaRytoVjFCMEg3WjcxY24wZi9xTVRJTkt3YW9yR3RM?=
 =?utf-8?B?eVA4WTA1VnlENVZLNk1BQlNjVFBIeEpjSHZNYUZaT2cwWHhwRDNoQ3d3aUV6?=
 =?utf-8?B?MkJ3WEtwbVZaZGlkemRhUGp0WWloYUh3cVFGSXlYSUN4bWQrNE9Kc1dlUks1?=
 =?utf-8?B?SlhZRlZiM3BMWmtZWjNvZVpGWE84enJIdUNOblVmYnFqTDdjTlAzUG5TcTNi?=
 =?utf-8?B?TzVOcmt5NlpFclJrWVFFK3gyNExkZ3FUSUEzNnhpZHNqTE52U09LVGxXcFRC?=
 =?utf-8?B?cW9hS1ZIaXFQUGtoU2N5UlhhQm4raVA5eTcxaEFhL2lSdjM4ZkFvbm1KSngw?=
 =?utf-8?B?NkZWTE9VZVA2K1pIWnF0MjMxS05OeGhQN3ZnNlBUTWhzcjViV3M1a2Ntak9G?=
 =?utf-8?B?aDlTRjV4Uk1mYkFGOGxQS05qQUc2TllLUlY2WDNHMThuSTUrOXlKWkRDK2Jp?=
 =?utf-8?B?RXFKZUhiVU5HK0ZBaXhUeVZKKzJET2t6MHFWK0FjYi9yU2cxZnBZb0kwdjFE?=
 =?utf-8?B?Wk5UWVZNdkxWNzdNN2hGZWl1TmlxeTVHczdydUdQYkYwRlg5SzRRTWt5RnlM?=
 =?utf-8?B?Y1hMaTBvUEZWTHB6V3B2bndxN05NOWxOQ0dNYm9ubVZmVHNmUkdIYzJEU3Qy?=
 =?utf-8?B?aDZrVWJ1T3ZBY3JnT0VpdFBSanp0OXpZUzFXaWVtdnJPR1p1OHlLMWplMWc4?=
 =?utf-8?B?RFFtN29ZejkxenBtUHlQdld0NGdxaURILzAraDEzQVczUzRPYUkva3dIdnJJ?=
 =?utf-8?B?RS9rMFNzTXlkZGk3Wis4eG5Zb2VBWmdOVjJTS0hwRzhzMnZ2NGZqRCtmZGJW?=
 =?utf-8?B?Mk5DM2MxWlZvc1NPQ0R4eEtmU1dCRENmNW11KzhITnhKMUh4TWJxZEtkSGp6?=
 =?utf-8?B?eWdjVkl0RVdWM3hTMEM4ZklVZkNRWHF6SVcrL0liUFlQWE03QVErK1hLeGRV?=
 =?utf-8?B?V2dpSjAvY1hxWmo2ZTZSbTJGRTZIdlBiY0xSQTdWUzZmUE5rdlNJR0NNVE1i?=
 =?utf-8?B?VUliU2RSWVdPdXJhaDB6aGYrSkpIUFc1aU1OY3Z0MGI5SUkzWDhYV3BwWDd4?=
 =?utf-8?B?ckw1by85ZFB4QXJqMWRqeEY4N1I1Y1NTK3djQUNHdkFncmd4Y01kcmNhK0Vn?=
 =?utf-8?B?OUJtYVlObzY3RGdWQ3Y0ZzlKbEVtLzl2RE4zOCtqZEIzU2R6QjJydzdFTjhT?=
 =?utf-8?B?MkdvWExKdkltSkErdFNYWUZYWVY3emNwVmU0eGhRMithWkNHVFdZYU5ISTRq?=
 =?utf-8?B?ck1XYWMxNGhYMElROS9BZFhrT0JqaWllUkZjRFpGUktQYTh3RjdGVGE1RE40?=
 =?utf-8?B?R1JhTHo0clhLdXFmTFBrbFJPTGtTVW03VjNSY1F1MGtXd2VmeEZBRkpaZU1V?=
 =?utf-8?B?OGRiRWRRZFJEOGpXTm9hcXd3Wlp4VC9GNkYzRDhMZERESG9HSWhSTkpyeER6?=
 =?utf-8?Q?x5RELh5ZnqY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2wwbzIvWnduczh4MkYzV09pMWF2cUE1Um01djFFNjdRMmQvby9RYWVVckNv?=
 =?utf-8?B?TVB6OHpEaGZmT2wvVWF2amNqMnRTOUdneGRtbHRuaExTaStpOElHOUZ5eGRi?=
 =?utf-8?B?NEpkWTIyeEcwdjVOWEVpMUJ4QzB4QUpvd3I2RkVjOHpkVUVLZmpBTFhydVA0?=
 =?utf-8?B?T21OTThReFA3L3ZQWUVHcS9ydzV0T0h6Ukltc1lkS2ljNFhyQUFLaXVXYWdJ?=
 =?utf-8?B?NFUvM3dWTWVrNnN5SVhOKzhVM3R0TWhtOGJLWFBTQS93U1Q3MllhZ3lRSU9p?=
 =?utf-8?B?aXNhcklmbkwxbDg0cEg1c0duVVk0aDEyV3NBSEZBTU9aeGZSUlh2TVFoQjBK?=
 =?utf-8?B?MGxEZWFIK0FRbG1Wc1M3aVFRZjZBemRxNUc1V2ZaZEgzelRYeG1wZ1NhOUhh?=
 =?utf-8?B?NmY1RUV4c2JHdjREY1JKZ2NQRWx4Tlc2MVZ3V3lZR3FKaHA1d0JQbXhkTm1O?=
 =?utf-8?B?VUc5dHl5bHJwak1HT3lsaVRiRS9jMTlxSlFVd3FwcFZhQVFMNVI5ZWRrMUJk?=
 =?utf-8?B?VC9iWmhmZWNrZ1hoQVNQbTFNKy9zaFJ3a3JreXFzZVVCSkRLRU5FSXBoOUtk?=
 =?utf-8?B?WXFZY04zb1ZvRmg4dmhQOEg4dWlsSXZLL1hIcU0wL1MzTnRYTkNneW1RNy9U?=
 =?utf-8?B?OUI2aGIyczRGQTZhZWcwNEhFM2V1cndWZ0hzSERlcjZNak02akU3dkhyeWNw?=
 =?utf-8?B?SDVUWG44MHNwelFvMEc5ck1HV3NzZmJDcm9hWWFLQ1VYdUF0SDVpeDNuZE1k?=
 =?utf-8?B?akUxU0U3UWJDOEpUMTlraWtjMVh3TW44cENnbFFvRkZlWHV1NEltRDdhRTZo?=
 =?utf-8?B?NHh3SDk3M2dUMDJaTC85ZldyTEF6RFRPanBwWDY5L0FPVWZVbzhCSmpKaW5n?=
 =?utf-8?B?V205Y3B2V09SR0F1eXhPODdmTU1OTGYvV1Z3WEZDQjZSeUorTVpCUFNtOVYy?=
 =?utf-8?B?cUxFQ0dQcTM1V25Sc0lPaDVxcEhvblpTL0FxQ0JpeDVqcVVjNjFTRVBYTHdS?=
 =?utf-8?B?UXJmcUhHTFBWWllhbGo2cU5TN0FwZFBSRTlqWE9Wd2tMd1plU0phZUcrSlNw?=
 =?utf-8?B?Zld6b0pmZ1FtemxQY2VERFliS3p3RC9tbEV6OHFNcjZvQWdHVnFPNlpGREJN?=
 =?utf-8?B?alIzeGNiKzhMNWtRWUZ6R2lSakVnT21xcmhSVzhHWVp4cisydmo0VjZkUjJp?=
 =?utf-8?B?emNZTzVTNkFMc3FZK05hSVZFUEZZVFhFc3pDNG9uUzRrTVQxT2JrV1d0YjJF?=
 =?utf-8?B?ang2YWhmOHRQUUwwOWg3QkNUb2l6Tk96TXR6dG5kQVN2Q2ZGR3FSWnVLQ2dT?=
 =?utf-8?B?RDdRTjNwblRjTGt6eXFVRW1YZFhwYXk5QXZrTTc2RzFtMzFnc01BL2d2VFho?=
 =?utf-8?B?WGY1TE1UQVhMOWtWSC9sZUhrRldOajNnU1dudkN1ZllwZkxWbzlmS3BFeDda?=
 =?utf-8?B?YkpaV1BKcjZkeWZycW8zMk1wbUthTDdhYVJhNGs2NFZISWNHTnRORVVhejRa?=
 =?utf-8?B?aFdLay9kRGxYdEVaTURPNFM0Y3JYNTRuOVR5Y1VUZ2UvTENJd24vTlJuK1NN?=
 =?utf-8?B?ZWRnb09XdGlieXNxSmpvU0ZsR2hDVUhzY2dtb01lQWNTQVRRekcwUWZSeEFa?=
 =?utf-8?B?NFd1RUlnTHp2OVNUSWRiNVYvU1FVZloyYzJrbkhPR24yMUFFeWIrWE5aYXJL?=
 =?utf-8?B?K1ZMY1E2RWJaeGFMN3JmQlNuaEI5bGdyM09uM2NJWlpyQlZsL3NaVjc5UXFi?=
 =?utf-8?B?ZnJFQ1A0U01KbHpaeVQ2NGtzcE0zYUtBWEsxWk80ZTZ1QllKMmVWS3VWWmE1?=
 =?utf-8?B?bWI1aXE1Zm1sdGVyRmJud3FqWkxwb1JNdWdQSUpMMTVScnJEdHdJL0ZJRExx?=
 =?utf-8?B?SWNIUzJwQVJnN3BveFEwWllnS2k3RUREMEpCOWVKTWxHZmpiSDVLNHpDWmxv?=
 =?utf-8?B?bGx2elZSaDdVUUVKK211Vk9xR1F4dXM3OGZqVEZuTEo5ZzBKSkhpWjFSQkpV?=
 =?utf-8?B?VlVwS21wNFFCaS92LzhxYXZvcEV0VDR2dFlhVUptRUNnSWZCNzBOM3lRdng3?=
 =?utf-8?B?eXlWNGhoeVVndVVhZlVHMytqWVF5bS92TUd1Vy8vZmNZQ090SjJvVWpjbi9W?=
 =?utf-8?Q?hyjYIEmdK3JBltDZRQdzkRRxD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b15f38-9e26-48d0-a632-08dd99271d10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:52:22.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAPxFLrPdHlcv8RI+ytpTaoy1EM341EWrGrCDQXmruHCeI55a84ea09tpug2H3yU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
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

On 5/22/25 08:56, Jens Wiklander wrote:
> On Wed, May 21, 2025 at 9:13 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 5/20/25 17:16, Jens Wiklander wrote:
>>> Export the dma-buf heap functions declared in <linux/dma-heap.h>.
>>
>> That is what this patch does and that should be obvious by looking at it. You need to explain why you do this.
>>
>> Looking at the rest of the series it's most likely ok, but this commit message should really be improved.
> 
> I'm considering something like this for the next version:
> Export the dma-buf heap functions declared in <linux/dma-heap.h> to allow
> them to be used by kernel modules. This will enable drivers like the OP-TEE
> driver, to utilize these interfaces for registering and managing their
> specific DMA heaps.

Works for me, but it doesn't needs to be so detailed.

Something like this here would be optimal I think:

Export the dma-buf heap functions to allow them to be used by the OP-TEE driver.
The OP-TEE driver wants to register and manage specific secure DMA heaps with it.

Regards,
Christian.

> 
> Thanks,
> Jens
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>>  drivers/dma-buf/dma-heap.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>>> index 3cbe87d4a464..cdddf0e24dce 100644
>>> --- a/drivers/dma-buf/dma-heap.c
>>> +++ b/drivers/dma-buf/dma-heap.c
>>> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>>>  {
>>>       return heap->priv;
>>>  }
>>> +EXPORT_SYMBOL(dma_heap_get_drvdata);
>>>
>>>  /**
>>>   * dma_heap_get_name - get heap name
>>> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>>>  {
>>>       return heap->name;
>>>  }
>>> +EXPORT_SYMBOL(dma_heap_get_name);
>>>
>>>  /**
>>>   * dma_heap_add - adds a heap to dmabuf heaps
>>> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>>>       kfree(heap);
>>>       return err_ret;
>>>  }
>>> +EXPORT_SYMBOL(dma_heap_add);
>>>
>>>  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>>>  {
>>

