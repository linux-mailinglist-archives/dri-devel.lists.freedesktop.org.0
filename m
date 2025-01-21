Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031AA18304
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 18:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0642D10E618;
	Tue, 21 Jan 2025 17:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OCg6nl5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263DE10E618
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 17:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlVhasKcYa0vStXjisgMFOAVsRuwpbqt2FiExzvtSPpBgdqZdbEqQyTkWh3nCZ4lAzPjmRfKSuqzmNG0TM/OWhFE68iGjd2B2uLIfHfJ0n2Ig+kHdXKcGhAedeBuo+u+OumXalFXjm9OG2oDOoKDHvTKxoUzG/H+SG0iv9HuwerxzkyZA5FzWaTTCjxISoco9gRmLOZf+cVJv7moGbuTLiK2euw6MiEea60fO56OXL9qsm0w1jGsBZL/ddN9dGeiOo6UFRNfrhrtNmY0BuzxENEGSeRa1QQykqHtueHSsrYwMYXVbqCtKjW6pJ7ocWWN0OxmeSHFKATfHjhD/dXcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDh4rUwZpBIAG3sfK5QrswT/nUdtatxAPWY7uLb/Tx0=;
 b=nZdYgsGz8GVEJy6WeVS1UONlG2ingoS/t3FO7A2oQ8PXIOSLCnMKc63iPouwRo9SrMdJDcvU/SxqniewnIDFy/cTE8bijPaVYO/wlQIgpMCcwoFG2ThugMIHmNs66V7lRPO/XZjt+59TlJn4avvK+v0bqHk3FxoCflDdc7OZBWjzVYhihly186MImN7isjV/2gec45nGbQ3bqdvDzWLdp+LnNahBtNlGh9AmXAuIxd0fsXqmbOPSdEzPZK+3IeGuBaIsOZvH4xTJj1dL+mFcdgzxBdpTvnJzW2O2PDCF8omWQJHZz4YrpQFNPYJ+yyohiDoA8seYuNuPwXVL4ELyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDh4rUwZpBIAG3sfK5QrswT/nUdtatxAPWY7uLb/Tx0=;
 b=OCg6nl5nA3Zs1SHOlVleQ3wAL7vMFppDf8tprGIN15CzgKrYIobzvNCuPbWBZccSIvUPaFRpmJzoMRNp7r6E3mik34Ft8skjqU7ksnXdFwG0XSiCq45Mfy/2OFU5FvrXxLFu6hCEgiU7FQHMznGXQIncB53L6U1LwwY+QyeJJcenXncFeHKDm3WfLaAloNoDm/ncFOzQwn8Jgo7xrp1phHysfH5lUgnHgFUeKlYzJd3qb9rGB6+MpBPR5n1tQhqrtT6W+X0DkMwNUcUg/Bc0OuhbA+cTkn1CezWzw2p0UJTq56YuC+ZlLD0L8XaYupBx2GXnkgPXoYtz6WecOeKCqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 17:36:35 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Tue, 21 Jan 2025
 17:36:35 +0000
Date: Tue, 21 Jan 2025 13:36:33 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250121173633.GU5556@nvidia.com>
References: <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com>
 <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com>
 <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
X-ClientProxiedBy: BN9PR03CA0439.namprd03.prod.outlook.com
 (2603:10b6:408:113::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3ff1fb-6493-4d9a-3b36-08dd3a4226b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVNKQysxeFhWbW5LbUZkdlFIclF5RHRxSlViaEZVS0tNMVlZVXZlVEE4VXJX?=
 =?utf-8?B?UnI4Ym5LQ2ZzaGJaZEsxUEFScGRWOGJCd1NyT0xlWjFibEo2akxnOC9CM2FN?=
 =?utf-8?B?eWFOelhyVTA1dFpHQzRWdThUQ3FuZUtuSEVDU1FoN1VVUTBxcElJOGhONFZQ?=
 =?utf-8?B?dnNwTmxlRVdjTDIzT2JHazBSYzlpT1hxMXhxVy9xK3BhMzZMb3BCamVwbWp6?=
 =?utf-8?B?NW5JU3NicnNQOGVPenF2bDVBdWFBRytyRnhYNXNwTG9rSFAzbFZ2WmNIbkZ5?=
 =?utf-8?B?ZXB0VVhoRTJKZnFTQ3hhSlVaeUovZkxGZE4rZFVWMHZsREtBMFg3M1kxVjN3?=
 =?utf-8?B?VE1EU2w2cUN4OVJ5cVBZMmhnU0RNNHZjNVdxQ3BGZ1l4M2V2bmgrTlpmb2Ex?=
 =?utf-8?B?N1FxMDNZZU5jbnRZZkl1dDMwUkZHNUhmMnZUd0ozYkxMZlVOdTBKME85czFU?=
 =?utf-8?B?cWdNM3BQQVkrYmpEcS9MOGxvaTlTUEpXREFNcFBHcGxoNis3R1ZTY2thYjY5?=
 =?utf-8?B?WTFqYWQyMmdOT00vcmFwRExaTGxPR3pSWnJlZXJmd3VEdjh5R2p1NHI4NHZk?=
 =?utf-8?B?dmQ4NTNaTzcwNkRyQkY0b00wZWFkamRoN0VvWWpEaENUcVU3eDMzYUJDTlo4?=
 =?utf-8?B?aThFZ3FaNTl1eXlGQ3Z6OFRhYmh5aE1oNFJCcEJRMzZCblRSQXpQWHh5NzIy?=
 =?utf-8?B?U0hyY1l1L0xiaVlsNVNrTDFRNTdnM3dRaWtHTDJvRy9ENHhIQjVSNHZuMHFV?=
 =?utf-8?B?U1kveHZSSm9pcWV2aTZrTjA2aFU0dlRPUko4OWtvamYxdmtUTnU3YjVVSng3?=
 =?utf-8?B?QWVhMXoyZHIzNHV0NDJGbmdRMjhQeXdYTTM1ZVBZM2plL3BqZFJua2hFSFV2?=
 =?utf-8?B?YlV2YlJTRllyYzJGb3NZd0RsRDdQS21qa05UeXBUMHV1dHZyOHEzZEFtTHVV?=
 =?utf-8?B?cjBRVmllTmNPUmNRRC8ySHpjYkJ1SnZyeGk4a01qdFRUZDloOGFvNEdwR3Bz?=
 =?utf-8?B?anllblJrbEpuM3UwSnBTQVBRWUJTVXB6ekRGTUhwa1pNUi9WM0Z1VXhjY2tP?=
 =?utf-8?B?bHZKL1M1NmFNYmZQUm1BSmxUYVhnS1EyUjdnWlY3TkdLNVFvUlkwZ3dxNzNB?=
 =?utf-8?B?bjYycnBPaCtsL2VqaWJYR3JPVWdLM2FKR01sM2NJb0VILzZUY2NpQW44VDR5?=
 =?utf-8?B?UHRreWRncUxUUlBEUk1sWU1yMExWa0x2MnBiM2czWjU5Ym1xRExjYTlORS8r?=
 =?utf-8?B?OFlTNFUxd0VVM3FjbUZGZkRVV1owWC8xdzdjNDNIS09adWJVVjFaOXBxbmZv?=
 =?utf-8?B?eTN4RCtMcG4wdmFEZ3R3UC9oanVqUzZieEFnV0d2VDhxU3p3Q3czdHNPTkVa?=
 =?utf-8?B?YmxiMm1Vc2Rib0l5cU02NDBhZ0psVVpvU1FmR2R2NE5QWU5mNkJwNWZhNXdu?=
 =?utf-8?B?N0lUR0dvYmxucXBaWFNwNHRBeWxOYVBTOWJ0WlNsRmFSY1JOc3ZlL0h3SFQx?=
 =?utf-8?B?RUQ2ZE4zR2FvRzRDNXBYZkZzOHNpNzZ3cG5pRFYyN2RyeDNoSTVrbVdmUzNP?=
 =?utf-8?B?L0pibmcvL2VERTRoMEo4WTBtbXluRGc0bmN0YTNmTlRTY3YwUzNoQldoSENt?=
 =?utf-8?B?S29kUTYwOThOQUVQNjFEQ0UzbEgzcUxDQllDaWxkeVMvKzErOGNqYzAwYVBS?=
 =?utf-8?B?ZVA0NzRua1BTd1prbExVN1FBMTZJc0l2S2JhQTIwY2dXQmIxakhBYTBZV3ph?=
 =?utf-8?B?WDQ2dzc5OGVVaFFpYmZ3aVJYLzhKN291U0RHZlMrc1Nsb2t0c1FoTzdtYWJG?=
 =?utf-8?B?dEM0WWp4ZVNEVW1BVGZCRFZIMEhRUVlZVDh0UFpqQmpITTRZSVpSanlXWTU0?=
 =?utf-8?B?SjhsN3EySjV4L28xYWFhbHZEc3pON1E3dHgrdWkzSDRXMjVBM3RZNUVIRnlq?=
 =?utf-8?Q?veS4vy0+EgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlNpUm9LRVQxK3h3Q3o4amJFRlpYTkpTV29ROTgyVG5DMjVLUkcrT3NoaVJa?=
 =?utf-8?B?T2ozSTZUN1dRVFZpMEFiMHFFL28ra2hYTVVIdFg2Tk8wcnZ4eUFDZ0RuMHMz?=
 =?utf-8?B?SXFBV2ZGaGxRVHJiSkJSeXlFdnROb1ZTTUppTjRTQnkydXVpTFBqUUxtVmxs?=
 =?utf-8?B?OGxjaWpORUtnSHNYSmxUa3BibVY0TWlxWmZMTkNUcURhU0hlUENjWE1USkNu?=
 =?utf-8?B?SlVKWlZ2dVRsS0RMRTZHZjlSTTRmK0x4RWVWN2h5U28xK2NFblQvZlN6Nkd1?=
 =?utf-8?B?WE1SK240aFlVU3UzYWh5NGhQWTVtdE9WYTFRMjhGbFJVei9MaHVHaDRGS3ds?=
 =?utf-8?B?b0V1bFFkQXJmc2RpWmhuQXZoTE5ZVjkzLzExM0lIcGRJbkhBOWRXT0E4SGxq?=
 =?utf-8?B?amh0aWptZXpYODlMMy9Td1dBUUloaGMxZHZJN3lERTg3ZE1rRnNYejdqbW03?=
 =?utf-8?B?MC9pdmNZSm5OZnBzN3JRMldDRE5ZajkyWUJpQUVYdXpGZVZEeXZkOGRQajZN?=
 =?utf-8?B?bDBPRGRrUmdwVVEzZWtidDdMT1ltOGYxS2RWaFE5ZFlNY0MxUjQxb0k5RWN0?=
 =?utf-8?B?ektHK3E1SkE4TW1mR1JaV1Z6OVZoc3VrZTFmRlRZZHhxNnMvYmJ5MXFQSmpv?=
 =?utf-8?B?WnI0OWZ5djl6UWlYOGg0Z3MyVTI0alBqVTA0YjhmY2UvZEhMV0FyeW1SaVhl?=
 =?utf-8?B?Mm1HT3N0TlVvQ2ZqTHRtQk9rbnRlRkN4Tk9ZbUx5bGtobG8yYi9IaXg0SXlE?=
 =?utf-8?B?ZGk5aVE0WFF3cU1qVzNCLzV6ZUtZUUovejhiOHROTVlRWi9ZTjV1ajhVbDl4?=
 =?utf-8?B?Uk5pSUVBd3hRZ0trYWxoTS9sRXB0TURMa3NwNllyZVdUVUgyZnNYaDdnRVJ0?=
 =?utf-8?B?ZlNpVkxhUzRjVmZkTGxOZ2pDa0pGMjRLbm1FcWplQXNkRzNPZDdMNWUyamhO?=
 =?utf-8?B?TkdtaC9YN0RmOTBWcG9JckFqa1ZmSjVMcFdwNldXK011MElUaWMwVzBhdlNr?=
 =?utf-8?B?M1Z4ZC9HTzkwWEhrd1RRTjBLS0paN3pTa1VFaHloTFJ1SjN0UHJheUxGcHgv?=
 =?utf-8?B?TFg0YW1EWlVCYVN5MVdDQ3JUcFA5aHF1Q0hOMkY5ZnExb01UY2xaRVNCTlNx?=
 =?utf-8?B?bFZQUlBEcXJaOEFWbU5sMms0MXMxQkJyLzhIa0VBSStzQjd5YjU2VGdZTlNF?=
 =?utf-8?B?eG5nMmRPam9zTDEveERwcW44UkU0WTdaOHM1Ny9QN0hudWRDZTZNUUlXQ3kw?=
 =?utf-8?B?dmNxanV0d0JIT1kyNjR2QVVESmJyRVBNam8yNEJ3RUNTcWhJcG5RaWtJeWkv?=
 =?utf-8?B?RUtjSmdQWDQ3cUdnTThuaHp5aDdLN1ZrUXBYN05KSDB2N29tT2N5b0tmS1Np?=
 =?utf-8?B?V3JnWnNzUllaa2d0SGdldko0T1BqRWYvKy9pNk5laFdDZlBTWXExUVFnL1lz?=
 =?utf-8?B?UTV1STJ6TTZHUGNCMWNqbk0rUHBpWGxTdEcxdFFyV21aOTEwR21zVERHM0Zl?=
 =?utf-8?B?Y2xoc3drU1VWc2RHSG1hcURlUThiYVpZcWNIbHJqemRoUGxlcTVFRHE2YjYx?=
 =?utf-8?B?WTVvdytxeDBuQ2RSTENiY0RQNWZZSm50UFF6S0xPdGEveFdRMUlFTVhiVXdV?=
 =?utf-8?B?aFJMcWU5SnhDNk9ucWpXT2JUeU55aFlSVitzYUdBMWN1eFUzRUI3L0M4Q2tr?=
 =?utf-8?B?bDBFWFh0Skp4anAydVBwT1lheGFaY25jcU1hajk4WUtsNnB2eWkzQmFqdVBC?=
 =?utf-8?B?OTNvcWYyWmpCaVRoZGRnN1B2eEpsU1psdGtOd3FvdVVnQVY3MmhaY2t0bXgy?=
 =?utf-8?B?K1VNNjRUWkdJRzRLZ1oyRm91UFBZTUJZK3UrOVU3c1pQOXhncDZrWkhwRGxE?=
 =?utf-8?B?RDhIQ0hmNWxXQS9INTZYWmYxY1VGb21PNVNGSjgyWHBELzlBd3I4bDdvUlBi?=
 =?utf-8?B?KzR3RFY1TWhhK3BoRkovckN3Z01lczUyc1RjYlZPbVc4YldwTjYxOExDN1Yy?=
 =?utf-8?B?M1ZTSmlXUVgrNUpLZ3JGcWs2NnZ3cXVyaGNLUHpjS2FZWWJDNnE0elJjVGdC?=
 =?utf-8?B?SlVFdmtzay9WWk56d0doZ3NWT3NCZmZSbEpwT1VKTW5ob0lBSml6L1RhQXJv?=
 =?utf-8?Q?R1ss=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3ff1fb-6493-4d9a-3b36-08dd3a4226b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 17:36:35.0823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jte3i8MA5m3gtd1AePgJlQsQka6r2A3FXEnfKlIWRwaJSdyzWMMu3Ma3ShC4Ahlx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727
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

On Tue, Jan 21, 2025 at 05:11:32PM +0100, Simona Vetter wrote:
> On Mon, Jan 20, 2025 at 03:48:04PM -0400, Jason Gunthorpe wrote:
> > On Mon, Jan 20, 2025 at 07:50:23PM +0100, Simona Vetter wrote:
> > > On Mon, Jan 20, 2025 at 01:59:01PM -0400, Jason Gunthorpe wrote:
> > > > On Mon, Jan 20, 2025 at 01:14:12PM +0100, Christian König wrote:
> > > > What is going wrong with your email? You replied to Simona, but
> > > > Simona Vetter <simona.vetter@ffwll.ch> is dropped from the To/CC
> > > > list??? I added the address back, but seems like a weird thing to
> > > > happen.
> > > 
> > > Might also be funny mailing list stuff, depending how you get these. I
> > > read mails over lore and pretty much ignore cc (unless it's not also on
> > > any list, since those tend to be security issues) because I get cc'ed on
> > > way too much stuff for that to be a useful signal.
> > 
> > Oh I see, you are sending a Mail-followup-to header that excludes your
> > address, so you don't get any emails at all.. My mutt is dropping you
> > as well.
> > 
> > > Yeah I'm not worried about cpu mmap locking semantics. drm/ttm is a pretty
> > > clear example that you can implement dma-buf mmap with the rules we have,
> > > except the unmap_mapping_range might need a bit fudging with a separate
> > > address_space.
> > 
> > From my perspective the mmap thing is a bit of a side/DRM-only thing
> > as nothing I'm interested in wants to mmap dmabuf into a VMA.
>
> I guess we could just skip mmap on these pfn exporters, but it also means
> a bit more boilerplate. 

I have been assuming that dmabuf mmap remains unchanged, that
exporters will continue to implement that mmap() callback as today.

My main interest has been what data structure is produced in the
attach APIs.

Eg today we have a struct dma_buf_attachment that returns a sg_table.

I'm expecting some kind of new data structure, lets call it "physical
list" that is some efficient coding of meta/addr/len tuples that works
well with the new DMA API. Matthew has been calling this thing phyr..

So, I imagine, struct dma_buf_attachment gaining an optional
feature negotiation and then we have in dma_buf_attachment:

        union {
              struct sg_table *sgt;
	      struct physical_list *phyr;
	};

That's basicaly it, an alternative to scatterlist that has a clean
architecture.

Now, if you are asking if the current dmabuf mmap callback can be
improved with the above? Maybe? phyr should have the neccessary
information inside it to populate a VMA - eventually even fully
correctly with all the right cachable/encrypted/forbidden/etc flags.

So, you could imagine that exporters could just have one routine to
generate the phyr list and that goes into the attachment, goes into
some common code to fill VMA PTEs, and some other common code that
will convert it into the DMABUF scatterlist. If performance is not a
concern with these data structure conversions it could be an appealing
simplification.

And yes, I could imagine the meta information being descriptive enough
to support the private interconnect cases, the common code could
detect private meta information and just cleanly fail.

> At least the device mapping / dma_buf_attachment
> side should be doable with just the pfn and the new dma-api?

Yes, that would be my first goal post. Figure out some meta
information and a container data structure that allows struct
page-less P2P mapping through the new DMA API.

> > I'm hoping we can get to something where we describe not just how the
> > pfns should be DMA mapped, but also can describe how they should be
> > CPU mapped. For instance that this PFN space is always mapped
> > uncachable, in CPU and in IOMMU.
> 
> I was pondering whether dma_mmap and friends would be a good place to
> prototype this and go for a fully generic implementation. But then even
> those have _wc/_uncached variants.

Given that the inability to correctly DMA map P2P MMIO without struct
page is a current pain point and current source of hacks in dmabuf
exporters, I wanted to make resolving that a priority.

However, if you mean what I described above for "fully generic [dmabuf
mmap] implementation", then we'd have the phyr datastructure as a
dependency to attempt that work.

phyr, and particularly the meta information, has a number of
stakeholders. I was thinking of going first with rdma's memory
registration flow because we are now pretty close to being able to do
such a big change, and it can demonstrate most of the requirements.

But that doesn't mean mmap couldn't go concurrently on the same agreed
datastructure if people are interested.

> > We also have current bugs in the iommu/vfio side where we are fudging
> > CC stuff, like assuming CPU memory is encrypted (not always true) and
> > that MMIO is non-encrypted (not always true)
> 
> tbf CC pte flags I just don't grok at all. I've once tried to understand
> what current exporters and gpu drivers do and just gave up. But that's
> also a bit why I'm worried here because it's an enigma to me.

For CC, inside the secure world, is some information if each PFN
inside the VM is 'encrypted' or not. Any VM PTE (including the IOPTEs)
pointing at the PFN must match the secure world's view of
'encrypted'. The VM can ask the secure world to change its view at
runtime.

The way CC has been bolted on to the kernel so far laregly hides this
from drivers, so it is troubled to tell in driver code if the PFN you
have is 'encrypted' or not. Right now the general rule (that is not
always true) is that struct page CPU memory is encrypted and
everything else is decrypted.

So right now, you can mostly ignore it and the above assumption
largely happens for you transparently.

However, soon we will have encrypted P2P MMIO which will stress this
hiding strategy.

> > > I thought iommuv2 (or whatever linux calls these) has full fault support
> > > and could support current move semantics. But yeah for iommu without
> > > fault support we need some kind of pin or a newly formalized revoke model.
> > 
> > No, this is HW dependent, including PCI device, and I'm aware of no HW
> > that fully implements this in a way that could be useful to implement
> > arbitary move semantics for VFIO..
> 
> Hm I thought we've had at least prototypes floating around of device fault
> repair, but I guess that only works with ATS/pasid stuff and not general
> iommu traffic from devices. Definitely needs some device cooperation since
> the timeouts of a full fault are almost endless.

Yes, exactly. What all real devices I'm aware have done is make a
subset of their traffic work with ATS and PRI, but not all their
traffic. Without *all* traffic you can't make any generic assumption
in the iommu that a transient non-present won't be fatal to the
device.

Stuff like dmabuf move semantics rely on transient non-present being
non-disruptive...

Jason
