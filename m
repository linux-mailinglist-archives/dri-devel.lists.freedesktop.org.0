Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D490C9F124
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876BF10E7C5;
	Wed,  3 Dec 2025 13:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K21+Qfca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60710E7C4;
 Wed,  3 Dec 2025 13:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OI6Hwg2DiK7kHLK4l1WpSooLct7GeJq+ocUNw1tBcIcqPp++mDsb+N9KZKwGFZk1vxTl3kgFLOPMF/Ddz0LB6u1G9SFgwWWYkQiRfOLtE4Vdr7a7riyvrSpm25OmPYpePBk9qlddzh8D1FVMbCBDdY6hmuUAnAvvoynmuFg4of0+cpTxA0fw4K3OOEe96xZjh5s1UMr6HILJpGw/h2kKInOsO8ZoGG0/prS3aH86zAdu01WuSQJP++hL8Br22iD9UWo3RJPBAWyTETu0KQcGjzhxmzuKNU59QUImWtfoXy3/af1JoO2GZxsU+am6wC7+s+oow0OWEmoizJWMeMZEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVe7kK8R98Xhbkz8d9sO+KH8v7QVw8UaPRAJlULYyF8=;
 b=NHTP0+0+imiYds24XAm94p32NPpTVpC4zOQeHuw5Dnl7c9qxXgiPR6EC+xrVb5Qdg+9sAPWSAV0+VZRuiWajHzUmNNL16W9KbnKwWcjW3Cr+lD3mpLWx9t9JII9hvretVRPXPnykgGtg6CvHv6+88FpIjwZe3SitInNYgm13ZxHPv0KvUKrsmvKTCiN03hWh21xLWjonIOa8w4yrPtpxXhp0HvpDB1doQOhWhM9/C77DVW1LfhjhEZBXMzPvI/NN9G3l9WDs5DFlIBDfHIR+W8rFNF6fOQJ96BSkHyd5gZMZvzTt9dMUR8gSb2/0JMwA4Hy0iprPpFaVY3FfPTiszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVe7kK8R98Xhbkz8d9sO+KH8v7QVw8UaPRAJlULYyF8=;
 b=K21+QfcaXgjly9BDizFVxDXbKjDqshUC6E6C/ZUzYUU2L7JNbMTX3iWX4yLzH+L7YrhY8gRRS1tN4xjzxTSsm6wW9xbmKJ5Uv+8Rjds97dzXu7EiNoU+vXjJD9P+Q3FoWEmtc8FuOk02qArjLqodS5XW4qBlm+Ctjwdz/bs/Rx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:10:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:10:21 +0000
Message-ID: <09c1a4e5-0c9f-4f4b-8c4e-214095a7270d@amd.com>
Date: Wed, 3 Dec 2025 14:10:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] amd/amdkfd: Use dma_fence_check_and_signal()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-5-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 904d0b8b-d4c7-4700-652d-08de326d5083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEI0eS9TQjlBOTVlWTR2U2M3VWdaRFByV1FnNml4SE1CZXdnN0JJTldiZ05R?=
 =?utf-8?B?QmlCQUdPMTBEZHFsT3BSeEgzMmcySnVSMEtxQkEvaHplNlQ2RDhYYjBkMXlq?=
 =?utf-8?B?bW0wYVhiQ3VxYVh3aGNaY3VVSjR3V2NRQmpnb0pCb1Y1aE9zZ2tBQVdaQ2dn?=
 =?utf-8?B?Y0J4UmJWbVhEc0tjcTAvQ1RjS2NieVJNd2JHL2xFdDZaOHVzdGxEL3ZsVFFP?=
 =?utf-8?B?TEhZbDcwWTk2bHVLYmJpTjcycjcwbnlvRlI1SEgrYmpLajlRMDFBVHlXV1VW?=
 =?utf-8?B?aXZtNHF3ankwa1ZtRC8rNDNCRHN0dytZcFI1SUtMZ0t5SzRJQ0R1bzdDRU9s?=
 =?utf-8?B?NFpMeGxuTGlhMGpRdElDcThnQ1lTRVJaWG5iNUVqVEQxK0liMkpwSDl1eHVT?=
 =?utf-8?B?bW1XWXczdEJyTmR3WitiWEhZbnBJY3Y3MkpCaFFyNEd4QnpxMTY0VWt2NExZ?=
 =?utf-8?B?dGR3VmhPRjJ2eWRxNWIwUjJia3VVeFlrV0tmZ05lekt0OWt5L0ROd3NzbUZ1?=
 =?utf-8?B?UFRlTDd6V2tsc3lWQWM2ZmJ4dEhWNTR4SEJhQ1JYOGlGb00wUzhsNDJuaUw0?=
 =?utf-8?B?YTVrL1h6d3k5RGhPMUhkNHNFZzZWM0NvR1ZrVkEwSXRqMElFMEdiNjdJY3lJ?=
 =?utf-8?B?emZQQzBXSXkzU0Y3ZU1tNVp3MEpOVFZGblVIREN6NkF6cnNUcXc5L3dYVXZC?=
 =?utf-8?B?RUtTUURSQTBPUU00U3A2RHhmYy84R1dsRnU0UmVPS2xqWGRxa2hoMzQrM0dV?=
 =?utf-8?B?Z1lEMjNiOHZ0MVkrUXBqUURmRkVsSXRIUFFycTErRlE3MmRSNE1MelY1Qjk2?=
 =?utf-8?B?czR4YnJZUUZpWFZpMFI3ZDYzTTB2SjVGb1dvL3BhU1VnNjdDeEtPWStSbm9w?=
 =?utf-8?B?Wk0vYmx4NnVyeHlqcWd6S0RObWcySlBMdkZzSE91ZlFMVlRLM3ZwMGtqUjBH?=
 =?utf-8?B?QStXeThycyt0d1VhcWsvR0Z5ZW5WZnI2MDNzT3lwOExkTkFRM01jWlNnL2N1?=
 =?utf-8?B?WCtjZEgyUTJJSDk3WWM3RHlDbGJuNWVTUlYxMDNmSjVzTUQvdUoxMVV3ckZo?=
 =?utf-8?B?NDc4dy94SFM4Y1ZROGtiSENtM1lwMkVrbEtMOGRiam1PdU91anIrbitqN2g4?=
 =?utf-8?B?azBLQ0hoMWJhQ0NIWmpPY3NIZmVDVHBmSmVxMWtoMzRKTkRXQldtNS9CVHRH?=
 =?utf-8?B?bUI0b1FlK09BS05jT3BtZ2pCMjBTSC9aK1ZTc2ZvTFdMdU1kbi85bDJMQjRw?=
 =?utf-8?B?d3B4MytwQ3ZXcmlRd1dWWWxSdSs4V2l4bS9odC9VUUJtL0xkanFNMHhHSWVs?=
 =?utf-8?B?cVVFTThPOEVsMlh0YUZuNEpCbTdXWExIdS9TaE04YW9qelY4dzJTZkhjcEV6?=
 =?utf-8?B?eGJkdEp1dlRkZzRYMUxIdHhROFBVY1ZCanJYUmdybDFCVVpLeVVXQ294cEVL?=
 =?utf-8?B?RWw0RkwwTmI2ZnoyaVgrcHBNU1VJUXQrZjRXazVXeU0xaGhwTkVqZ0Nwd202?=
 =?utf-8?B?c2R4K2FDS0Q2K0JHTktRRmxuTElZeWtjMVNKWE5XVVZrTXNSd2syWEVnR2tQ?=
 =?utf-8?B?Y285a2V1UE55bzVsQkJaM2JaVkVMVVNMTFQzcnMxZ2NNZjRFMk5saXpDejJr?=
 =?utf-8?B?bTZoZkJLTHcrVkZkd1gxNi8rbEdXZk16dlFCUURQYkNCeEExa0tiMFpRdlBT?=
 =?utf-8?B?VmlmelhTVTRERU1PNkJFblJyejF5ZGhBRTNZNzhta0JtQzNuZkkxRWc3cSt4?=
 =?utf-8?B?K25zT05CUzM4NW5YVFhScmlDK2JZV0t1MjVFYlVUMG9Mdk1ETk9jNkY4c2NM?=
 =?utf-8?B?cFhQaVY0blp4bGsvU1JabU9mejF0dzFQZENJR3FGMDNseEh2V3I2ZThCZy9r?=
 =?utf-8?B?dktqQ3ZSdUpVVjZWaWUrTk9CTmhNU3NWRVE2cVowSGJLSklva3ZWemxCMlBq?=
 =?utf-8?B?a0JSSUZzTUhjb29tcDRTV2lDTWZEQnFuNFBZNXBwN2psYUJDR2pCNkdrUW9L?=
 =?utf-8?Q?JjhiSQTOYAKqrYlNtSFMcM3uzkUYB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlN0bWFCdnRZbjZKaFZhNkU0K05CYklrVXFGZWlSSm1KUVJNWHlNSkIwZkhw?=
 =?utf-8?B?Ylo3ZWJINkdBR1BSVWtPd0VBY04zQTNHUTlVYitxakVnWkpxU2Q2alNiYytr?=
 =?utf-8?B?dEJ4elBSazJtYkRSakU5WlVCZXI4VXJaRDlBTjlrMkE1S3h0UW9LeTBHb2dV?=
 =?utf-8?B?Qk9yY3NIVDB0dTFDd2wxNE5ZTmhTUENNcUNidjNGMjlaTDhSSDA5MXpmOXdO?=
 =?utf-8?B?TEtHTG0rbWp3OGxUZlV6RXluSDhBZ1VRdzJkbHFBTVQ1TUh6ekNsbTZMcEtO?=
 =?utf-8?B?eXpqVjUwVUhGZzhZQUdTRkRQT3ZGV3NwcXpOS2lOZHN6bjE3Q0hSV0hTU2Ns?=
 =?utf-8?B?Ylh3d1pXT3h6bWNOazlrOE1ydkdybGo4VjlGQ1ZoVDJjL0VQT0lIenZidzk2?=
 =?utf-8?B?YWd2Z0pQQmY0T3U4WlJWRE5VL1BWUVZGakFJSHp3RTI0RkNHcjZWbGRLSjhj?=
 =?utf-8?B?UngzZkdaZFpyemlia1YyUG1lSE51TFliYzZrYWRJeDdtK3E4L1UvNjJCMk9t?=
 =?utf-8?B?WGkrNFZiVHhFUFBnVGZodHk0OG0zNkU3N25CRFRteFg1R2N0U1IxVDdVajAx?=
 =?utf-8?B?K0xDS3ZnZ1dvbW9pWHppaTM5V0ltT0MzMzFjZmRNU3piZC9lMWw5MVJ0Mlg2?=
 =?utf-8?B?NEU3RnJIZzhOcUsvT1YveTBsd1UwRlNBVDllMlNranFIWlZqN1lNQzlKR051?=
 =?utf-8?B?Lzdmc2FBSmYzMXFWSWNtT3F0VDNIaXk3U1d3Mk1ObEZjNmVzMFpaZ2t2ZGh6?=
 =?utf-8?B?dUdwanM0c3BucTNvMUFoL3NGeU90bXUrZlYrYWtYUkFRVzNIZVlwaU1UMUtY?=
 =?utf-8?B?c3lDWHAzUi9HYUpEMU15TmU2RnZ3dTFJVzFiZXprNERKV1lMYkNDanI4MDFm?=
 =?utf-8?B?aHZQRDQ2WG5PZGF5dEU2TXFSUUdGMTYxTGhwL01NL2dSbEVEdXprRWJTck1M?=
 =?utf-8?B?eFREUUFERVFmajVMNVpudmpFT0tGTDZCb3VQTEViY2ZCTDdaN3ZPS1R4dTVr?=
 =?utf-8?B?UW42UHN5UzVFa2VVcklmQTNOcVNKNnltU05lcktwcmNNdHNaRU02bjNabGVa?=
 =?utf-8?B?NFRPZzllRmpuTkFuOEp5WW5URmlPYWtZUVFoeGQrZFlRaU9icm8ydjJYYTRN?=
 =?utf-8?B?UDBVVmZxUm1BbGpjUUplQy81TGN3WVJ6SEZXU3ExMnp2dGs4TmlzMXRKY0ZF?=
 =?utf-8?B?WlRqU3hKSi9aSC8rRHNHMkZSdThvWEdPQXpiZTVwU0g0NmhvZTYvWmVoQzhs?=
 =?utf-8?B?VENrZkNibUd3RGt4ejFkYWZLbmg2bnh5bnZQK0cvMmM4bFZZYUtJd0p3WDdE?=
 =?utf-8?B?QkhUUDdGbXpEaDVuN3YxSkJyV3VnVWx5b1VqK3QwTWd1S2oycitTcVd1NGs1?=
 =?utf-8?B?dzZtTVFuNXVucVdCUWxjTTk5QjlmV0NPVWtqNXd1RW5RaDJtcUp3SHpTaXNG?=
 =?utf-8?B?VE40VlRzYTJYTG1WR1YvaHJDdndxaGZnOEZqaCtjbUZSdkR0ZkZ0NkRvWmYr?=
 =?utf-8?B?Ym82OUJOdk8zbTBSd0dwM2pzZkRHUlNpbktzb1F6bERBTGVQS1dEUWtDZWty?=
 =?utf-8?B?SEdxb2d5azR3U1FOSUIyZytaWGZpREN3N1ZlQldrZ0lSaTRkYWMwWkRzcEx5?=
 =?utf-8?B?QjlwdXR3LzlXdy9EVXFrZ1VkN2x6Nk1KTHkrQXFRQXg3VHlteDBlYkw0dXN5?=
 =?utf-8?B?NW9EQTlsUEdBVGJxNHJ2Nnc1dHBWT3ZuQWczZkt5cHJYYjBSd3N2dDQ5WDBl?=
 =?utf-8?B?U2tkYXppZTAzUjRFUGFHODFmZnBaNXdzMElOK0wvRklyK2V1M0o5ZG5qM1VF?=
 =?utf-8?B?NzhTaVJ1YVNWMFpUUnAvM21FRTBaaTZxZzAvd0V2Y2VtU24zZnhsUndzUFh0?=
 =?utf-8?B?cW45ZmxqbWNJYytGYjgzK0x5bFFObDIyTlFMaDNVRGM5VDlYUWpXbk1kWHVU?=
 =?utf-8?B?OUhHajZUWFhUTEtYUUxYVU82d1dqVU1LcWJueHh2TzNyWXAwRytXT3FNaVBr?=
 =?utf-8?B?N0hxaWdiUDNlMXA2dDBqdlAwT0lOK21VNzliaHY4Z0pHK0pUUTRTTXVhR09m?=
 =?utf-8?B?RHRlTVFhdzE3VWZpVXdiZlRmbkZ4bU1QL0NJZ0ladkFTOFRyWmtpSkp4YXlH?=
 =?utf-8?Q?ue8CsqQmLNayPXIzQqx7rDF3N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904d0b8b-d4c7-4700-652d-08de326d5083
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:10:21.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XldZEmVP9ctxLBesC1w+uS9bz4Go77u4dcahxjXJ+OyCVGZVCF2QG4JrhULa/b1i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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

On 12/1/25 11:50, Philipp Stanner wrote:
> amdkfd is one of the few users which relies on the return code of
> dma_fence_signal(), which, so far, informs the caller whether the fence
> had already been signaled.
> 
> As there are barely any users, dma_fence signaling functions shall get
> the return value void. To do so, the few users must be ported to a
> function which preserves the old behavior.
> 
> Replace the call to dma_fence_signal() with one to
> dma_fence_check_and_signal().
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..4dc46ac6a65e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1983,10 +1983,10 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>  	return -EINVAL;
>  }
>  
> -static int signal_eviction_fence(struct kfd_process *p)
> +static bool signal_eviction_fence(struct kfd_process *p)
>  {
>  	struct dma_fence *ef;
> -	int ret;
> +	bool ret;
>  
>  	rcu_read_lock();
>  	ef = dma_fence_get_rcu_safe(&p->ef);
> @@ -1994,7 +1994,7 @@ static int signal_eviction_fence(struct kfd_process *p)
>  	if (!ef)
>  		return -EINVAL;
>  
> -	ret = dma_fence_signal(ef);
> +	ret = dma_fence_check_and_signal(ef);
>  	dma_fence_put(ef);
>  
>  	return ret;

