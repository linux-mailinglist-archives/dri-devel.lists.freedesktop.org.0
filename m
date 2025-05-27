Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372CAC49D0
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F408110E3CD;
	Tue, 27 May 2025 08:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="firTspXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58F810E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9tIz11lI3XCTdtjjrkVXDoFZACnOn03nYtlb0eoT8I0U0f6/peLaZexVrXlfjRyI0oQEo2jC4C2QNmeT/iLdTTBfBWSs+/ZbaDEFx8axYKwC1N9xvthNc+M8NbmwhfdyjoTbE8n34INrZebY8AjxEaOtkgopcd0IZQhF9z/sRbPuA/ooTaIy/KJaxTypK0gruY2YNHdi2GmzWHx3fdITEu6h4Ghc48LWfolYSlAkELHyzzh7GcHQQN5HGZ3nQc6lfeHX73uLPzyguM5dMNpCnMw3M4uYtD+8MXXUW8Orxpvhqq/1V/7u6OCfIpMrtKytFDAxKgXhTLOl5lx5YJQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOxmJFBqDRuDn5MivIsId0G5Q9u9wiYik43ICBbjQpM=;
 b=ZOzaFrfxyeeHmWJCteQiTzIYhwN+5JWJ2XTsUPi9kGc+qQqlJc6iHYnOuINgM5oWyrQkYKgPbbJM3Tukf0+D4hScMTbDuejdgIcPq/Gyq9DbqYJ/9OZ/k5hCfSutw0aWXdndXqkZ/95s9BWupceX96bEwXF+lF8viX2asFkOQ2QQjx+iY4QDR2ipqKSN/ymzXblza1Jv3cg25manPghPjWzwEO1iz9iPRNsF8P7pqTtk72Hy/kPttPcntcKpU9CTMMu/Ux7lyGrJxJNhYPaCp5qRDJGXpyt+feMRoeAGKPjboT0ec4LAwJFLYZCKAZexlOMeuWjVoXU8IiMKzsS7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOxmJFBqDRuDn5MivIsId0G5Q9u9wiYik43ICBbjQpM=;
 b=firTspXHCBAMhk4pTWkVopFdAw1u4fobXcsJ5eQlgYjcE1wE9mP/YSzoklqFz8kIRpPBPwl/nM5NWmT1UkLV7kyn73/yFfZFztx3BIs7arculPCOzPJlOvjsQbqMfjhGOpc1wKcDlB+Bmbdau8T09bwAgddF3qTt29TxrRk4nl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 27 May
 2025 08:01:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 08:01:15 +0000
Message-ID: <97abe9f0-38f9-41ac-9f56-05ad37a61250@amd.com>
Date: Tue, 27 May 2025 10:01:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
 <de476962-194f-4c77-aabb-559a74caf5ac@amd.com>
 <aDCrLTNoWC8oSS7Z@slm.duckdns.org>
 <d21be860-9cb2-4c21-af30-2c724ab58756@amd.com>
 <CAPM=9txhOq9NvTJ9sYpntQ5ajSXrCPAKwkPqBssycwAxqn05dg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txhOq9NvTJ9sYpntQ5ajSXrCPAKwkPqBssycwAxqn05dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0426.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b3f7d0-24de-4eae-ac63-08dd9cf4a76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUg3dHRvZldOa1ZkUWkzNithRVd2NFBQbG5hb2pwYi85ajlJUWE0Yk9LTFhD?=
 =?utf-8?B?dnVyUk9yVlAzd08vYnBZOC83aisrT21sMWVRRnJyNWhCSnI1djRVeDh0MWc5?=
 =?utf-8?B?bjlMemJubU5SN2g0ZkRJc0xMZ1p1ZVVhd2RNV2xZZFRLQlkyWlpxU2hUdnZj?=
 =?utf-8?B?TDI0ZGVnN3VlbG5GZmRwK1l2czR0WlBrNnlZdjlKVlIzazQ3aGZpYXdTYW1a?=
 =?utf-8?B?RFNGV29vUU1id0Q1NUphMU0rSVlIbEVZY24rbGlSU0g2TzlnZEMzUUZaNHVE?=
 =?utf-8?B?T3l6SXk4S3hwVGJ2UFFNVWNNYXpxa2kyMHBhM1JZUXdoRUFtN3RRTGk5WEhm?=
 =?utf-8?B?M1ZSdEtrRzR2aHZuNWFRQTBMU3ZGdVcvRy9pNmxlemtlZjVyRmVKL01zK2dC?=
 =?utf-8?B?emZ0WUVnd25DRHdPWmloQmZ1UlFxZlpsYzdZbUpBWHhRZzFCUGJlMjhEUHdB?=
 =?utf-8?B?bm14MTE4eTlUWTBiYUhSeEZONFF5SGpiSGpkQ3ZzQ2dpejZkT3NGSjNyMHRq?=
 =?utf-8?B?Wno1d1dpb2pWWHdxVCs3VWRVeXdsNkV4aThmMTAvRVRjT2liZU41ekZJcjRH?=
 =?utf-8?B?NTZxNUNhZ2xZZFZ5aVpPVHJTdGNBR2xxMlRTT1NYTi9LTDNWRnp4U2swb1Az?=
 =?utf-8?B?M3RFQWZ2d01pZzNidm96cE5ibUo2d2JQZVlzWndsQWRrR21hZmRKbGJpVnBN?=
 =?utf-8?B?VUh0dGpRWndDbTlOa0xSTERJYzJmOU5WZnVZWDNkSEd4ZTR2R28rQ0NIVW5q?=
 =?utf-8?B?MTd3K1Y2eVpsWDg0d0ozQklpSGsrdHl6UVdIUWlNRFhLbklnOEx1M0tHNHdV?=
 =?utf-8?B?R0Z5SUxqWSs5SXJOREEySzl2cUUvZEg4ZWNJU1pCRmJoN0RQdkdvVHZ3Zi9F?=
 =?utf-8?B?OENpMGRLdFZCd1E2NmVRZkN4RkF0aG9qUW8xWFFhR1kzRmRsRFJVNXdlblpC?=
 =?utf-8?B?QUpKd01QcDFJUzZPVXFRdVVWSE9mQXNwNVRDMWtmRHhmY3F5OUhtQTNNOEhW?=
 =?utf-8?B?bEtsbTlDamEyNXZkOURzTkVxd0N6S0ZiKytJUHVvcnFOWVNFUmxJa3BZOGUv?=
 =?utf-8?B?S1ZvZDNSSkgrSFdNRGhVUlVpZDNkVUFybGFvY2d3R2l5Tmc3Mnp0UEdmbXM5?=
 =?utf-8?B?RWJuVEJNSTBIVUxlS1N2Z1hLNUpyYTlUTU1qMTBwakZuSUEweXdQUDRudFNV?=
 =?utf-8?B?VEI4ZVYydU56RjNUSzdxeWs5dU84N0lsM2duRC9FTElBNllLZFhaRUIvalhn?=
 =?utf-8?B?VmRhNEF4Zi9odEllclkzNDNDRUZIWjBpczBsbzZvQUR4ek5tYWNIU2Y0RVhE?=
 =?utf-8?B?U2MzbHZUSFBhN0VPNjdKRG1LM1l1VWVweFp1M3VCUWk3aW9rWFlJS0tUdElX?=
 =?utf-8?B?cWc5OHFJbUV6QWtna2FiMDRaR0xFMnB3cnVmbmdyZ2J4S2ZkbER3ZmNHSkdX?=
 =?utf-8?B?ekN2cVpxVk4zM0Fzem1HMVFoTkdET29ZeFdaUnpPTDJXTDFaUXBPM2N5MVB3?=
 =?utf-8?B?NWlJcitFNVhnd1JFdkVvSGw5dlR4dER3aHlDZEF4S2ZDK245eHpjNWs2d09R?=
 =?utf-8?B?a1NTRlkwMFVtYmtzVFZpd0liMlBMcy9Fb3VZRkdpSklpMnBwZmZRM2JNVWtz?=
 =?utf-8?B?bE84Y2NYNDhLNFI2WE1WbEpxUWJIOFlWemlvOThSQml2clNnSnRnNml2aE0y?=
 =?utf-8?B?akJpSXBDNWNNcDdPalY1cTRwaEljSUZsdjluMHFxVnJrWkNqUkdYN0RRY1BX?=
 =?utf-8?B?MzRJTHVqMWM0WmdDdmc5aGJhZlJyVXd1UGgwTGp0Y1ZZbno1eDdIUVhEYUh0?=
 =?utf-8?B?dERDekppSDlYWUZPRHdwZWNDQWV5VW9wSTZ2RHFCSE5XdDdxckRwZzdQOVk1?=
 =?utf-8?B?a3VzdUk5S0YybmtTY2g1ZkdPQkdSOWJpelN3MEJaUkZQK21NYThQMG1xMFE0?=
 =?utf-8?Q?3Xjry3YCd/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVoeC8rMXRVdS9EQW8vbWtidndZd1NtK1IzZXZlQ2FHc1FTYkpqWEc1RmVp?=
 =?utf-8?B?N0Iwc01XNzVlMWVOVmE2aDcwakd1blh0aGd6b1Ywc0NUZTNVNnNvdEJETkNy?=
 =?utf-8?B?QjFOVmIxZktoWHQrcjRtRkRCNnptdElPNzlQQ3NMTVoyam1jUWNnekoxUWhh?=
 =?utf-8?B?S1dFam8zQWIzTFJ6S1k2bS81Z3pUbkJaUUlMY1NDaFVBakdmaytLWU1iU3pv?=
 =?utf-8?B?VVMwZUlaZzdCcHFReXpWUzg4dlIvMDY4R0szVW1JTjFWUVhRSGZPQ3JISXF3?=
 =?utf-8?B?TVZMQWN2clJqSStoL29SMFh5VDdvcW8zZno3ZGx4d0N3QkNWYm5Sazd3Z0sy?=
 =?utf-8?B?UUp4VEdaREp3OEhTK1g1dUZyck1ZNmtsc08xcUJQdURwV2xHVldRZ0hENExz?=
 =?utf-8?B?S3A2T3ZNV0pmZ0lZT3pkTlNrOTY4VWF5dUxuYVR4ZUl4bk1VbVNabEZCeUJ5?=
 =?utf-8?B?L2xlSWdFTnhtckhxbGdaK29qTkVybGVqVDlhamhGM3BUZldUdStucHYzOENI?=
 =?utf-8?B?UGFNOHZyL2V6ZFVzc05VSVcyS251eE5wM252UklLU0psY3VoTlFsVjE0TTRH?=
 =?utf-8?B?TmZwZDNTY01rcStKeXUwSVJXSzNDN0UyREpRaFphdWc3c0NqTUltd1dkazFC?=
 =?utf-8?B?Z2NuR2JNMXg0SXRJOC9NSkN3STRmSVE0enZFbDhyWkNTNG85dUlNdWNJaTQ5?=
 =?utf-8?B?WmoxdVNyZ2p6aUk2Q09BeThwM0ZVeFVaTkczbEFHKzdTMm9Yck9hT29FZHN2?=
 =?utf-8?B?eUlwekliZ01Ub1R1cWgrcTNocElIc3lFSTFyU1VSVzcvb3h1aGJ0UURlaFF3?=
 =?utf-8?B?b1hxQm0xSXRDN3cvMHltZGlQUGp5Rms5blBxWjA3UTc0d2lTdDR4b0sySElr?=
 =?utf-8?B?M05PMmN4UlA0MHdyTWYvSUVMWnErbkIva09kdFNiLzgyQzgxVXRRbDVSWWVG?=
 =?utf-8?B?bVJqSEQ5RXh0cGxyc2VJdmVUMlltMTBlK3ZoUXpXYlJ3WTJDakFEWGlrOTgy?=
 =?utf-8?B?L0tJdHZ3TG0wVnFPNm52VU55MWZqSkFZNXVqUjV1QU9NWjRjRG1CRCtnSXk5?=
 =?utf-8?B?Rmc4ZG9qNUdlblVYamQyN0FUZ1Y0M2ZNWmhEeDR2d24vTk5wWDRZRW5mV1c0?=
 =?utf-8?B?ZGZscFRJRG9QdC9DajU1RmsycHpzdnB5M3lLaEZCT3QzWXV4N1ZPVFZVZDVT?=
 =?utf-8?B?dnArUld2cW1PUXRBSTZxMDhBL0diMmR6UDBwamRQYjF6V1QwVzM5OUljWG1x?=
 =?utf-8?B?elkyTlMrRWtQaVdXamtpQndrNFJJWGlTQkFZNTg1SE9hK2JWWVV2V1V2NU9D?=
 =?utf-8?B?dWpLdmRNVjEvWVpLMEpMVW90K0dhU1J1Z0d2WFFUSzNxNy9pSVpodVRNNXVi?=
 =?utf-8?B?UjhDZEcxem9UUDNybTZpUzVYeFc0K0lhOXlvVXdxdUR3bW9IbCtEeTJqMlBl?=
 =?utf-8?B?Wk1Lb2NHbW5BajMvNm1FVkp3YzlNaWRTL2tGNmxZbE5FUGQ2K01lcXB3NUxW?=
 =?utf-8?B?SnJWN0xGMnNCS2lVSHFuUXY1TzRVN0Z4eERWTEJiMEJnR3NOTTBMSE9qc3cy?=
 =?utf-8?B?Z2UvSW5sRlk3aFF0dnloUFFTRE1ReFFaaGg0bnBFc1pFb0hsQ2oxck8vajdR?=
 =?utf-8?B?SUhRVGo0Nk54UGpYN25GbXYzQVlHUFZkWHhYZ2RFbHIyWFYwZm80RWwyaFFn?=
 =?utf-8?B?YlNBeHVRbmw2ZGptNlNBWHNLQTFYK1F3d2tmSExwTm9OMTB1eXRjVWtRSTlU?=
 =?utf-8?B?T3ZTNEZvRmJrSU5WbklxQkRPM1RUdUl1US9OdlhFeXBRVEd5YlJPMGFYdXEz?=
 =?utf-8?B?U1ZjaVRremRjVS9SWTFtYWhudUgzWS91MVg4MHRWc2JtQk5sOGN4QmpWRWpE?=
 =?utf-8?B?YXBhNnU4UTRGbHRmTER6VjB0cFRIYzVYaXljVzUrVzJFVllRc0JrbmxNQUVT?=
 =?utf-8?B?V2I3RTFlOVZiYjgyWDdFWmlhQlhndjBUM2h2NXJxeEFLL2o2Ynh0Q3ltM1hB?=
 =?utf-8?B?d2h0cWI4SU04MXp4RTd5WHFPc3FOKzAzUTFQc3BBbWlEUGZQeDl5MHptbW50?=
 =?utf-8?B?TzYxTGd4QzR3QitjUnY5bExtRXdrd2NFTmtvM1BOMXdGb09XeDlqRmhkdjRH?=
 =?utf-8?Q?ZjZA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b3f7d0-24de-4eae-ac63-08dd9cf4a76d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:01:15.3363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YdR1F28LjbiuJ6CVsG+gKhjwrUpthvCPG49pmYcdBG9Li32s1FLRjNV4IkyEEHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348
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

On 5/26/25 22:13, Dave Airlie wrote:
> On Mon, 26 May 2025 at 18:19, Christian König <christian.koenig@amd.com> wrote:
>>
>> For the HPC/ML use case this feature is completely irrelevant. ROCm, Cuda, OpenCL, OpenMP etc... don't even expose something like this in their higher level APIs as far as I know.
> 
> What do we consider higher level here btw? HIP and CUDA both expose
> something like hipHostMallocWriteCombined, there is also
> hipHostMallocCoherent which may or may not have an effect.

High level in the sense as things which applications actually use.

And yes hip used to have flags for WC memory, but because of allocating system memory through the KFD node never worked as intended we abandoned that approach long time ago.

What could be is that the userspace components (like hip) now use the render node interface with the AMDGPU_GEM_CREATE_CPU_GTT_USWC flag to allocate WC memory. That is one thing I need to double check.

>> The main reason why we still need it for business today is cloud gaming. And for this particular use case you absolutely do want to share the pool between cgroups or otherwise the whole use case breaks.
> 
> I'm still not convinced on this being totally true, which means either
> I'm misunderstanding how cloud gaming works or you are underestimating
> how cgroups work,
> 
> My model for cloud gaming is, you have some sort of orchestrator
> service running that spawns a bunch of games in their own cgroups and
> those games would want to operate as independently as possible.
> 
> Now if the toplevel cgroup or if none the root cgroup exists and the
> game cgroups are all underneath it, then I think this would operate
> more optimally for each game, since
> 
> a) if a game uses uncached memory continuously it will have it's own
> pool of uncached memory that doesn't get used by anyone else, thus
> making that game more consistent.
> b) if and when the game exits, the pool will be returned to the parent
> cgroup to use, this memory should then be reused by other games the
> are started subsequently.

Mhm, my impression was that cgroups are not hierarchically any more these days. So pages would stay allocated to the cgroup until it is fully destroyed and then given back to the core memory management. But I could certainly be wrong on that.

When an application continuously uses write combined memory it would allocate that only once and then re-use it over and over again. The background is that even with the pool we don't make any allocation performance guarantees, the operation is purely best effort.

So the important advantage of the pool is to share the memory between applications which are otherwise not aware of each other. And that is exactly what you have in a cloud gaming use case.

If we would want to make performance guarantees we would need to approach that from a different side, e.g. have per cgroup config options on the pool size, background workers which refills the pool for each cgroup etc... That is certainly possible, I just don't see the use case for that.

One additional side note: A big original motivation for the pool was to avoid the WBINVD CPU instruction, because that is disruptive not only to the current process but to the system as a whole. This is not an issue any more on modern CPUs because we now have the CFLUSH instruction.

So the motivation of having the pool is really not that high any more.

> The only thing I'm not sure is how the parent pool gets used once it's
> built up for new children, need to spend more time reading list_lru
> code.
> 
> The list_lru change might actually be useful for us without cgroups as
> it might be able to hide some of our per-numa stuff.

Yes, having proper NUMA integration would be a really really big argument in favor of having this.

I also explicitly asked that Waiman Long, but it seems like that cgroups doesn't have the NUMA capabilities we actually need here.  

Regards,
Christian.

> 
> Dave.

