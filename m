Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9FC5AE9D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 02:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89810E980;
	Fri, 14 Nov 2025 01:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iCVuhKlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013055.outbound.protection.outlook.com
 [40.93.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E85F10E980
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 01:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXtRO7yiIKuJ822300Nix0CC1imGnVNf7yFOnSTc8N3uDqQAVmMyu6rG7BUXsCl/MqpCvO022I4kUFSTsV7eovH9sWw7lsVX8RY4U2nDbFhejtMYdi0dg7/j5ewDG3sNjUsE6nF1GuNBATBoNQCRObIGzlf5iBBGgvjQCv4aszsvSYYFUqka7W43hUclDQkrxC/KsHQWkJsMjVkI2M9zEDLyw5CL+mO1+HhdZKoFmqfSDSOu2J11jSQbRan3QInyW2Eu0qMLuiZRZHkQSQpRBRWqrZdMcEEPt94SJMDC9Vbb0P6q8BnnOMGN6rwGwedhLo2U0+nA2EkHykqncyjJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/rjtZ5BOnt3xt12w7EyTHsI18ZxVoHk5QRzcP4bqys=;
 b=TgN/l8u91aQ3tj1ezPnKzZBelH/peWmC97cOTQRttcg+i/ddgg8sWCb5NM+dHqMnb/H9RfrIhhaKl3mbkIXL9eLm1TsL3MJDnuYRoGJeY+BMoKyEkHK+0KD3cdXmNBDggt13BmNdvx4XpJQJh/X/kLGXp7pY/k7aq5HvnF0oHnlHaal9hGMpXQTXRkkFZDpLblx0VE8MW0VDj97Qfvt4jd2hd6OJI/D0aCRsfe9pTbdo+rIsfEOT0+BJSYO1UFNPaHoxyVukcNZRGRIsWsooVeEBEk8JD1iKoEOL9FIjWC4I+1VbVBIwI7l9pLY3C9Cg/xO/6jlXvs9+0a+mIHFz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/rjtZ5BOnt3xt12w7EyTHsI18ZxVoHk5QRzcP4bqys=;
 b=iCVuhKlTUC2jCqlkgObMHaVsNOez71Gp85qkjC2isxRV5B66lbzMvIYI786zCuEUMxEzn00QPBT21SPUUo12Kt60BDhJp47LW0OgCIAwKX6gfzVHOnPTrsM8tErXnGbdIoEvUnWX/4jsyVHQ5WzV5bKUIfvJ5S3jB28KY6F2tgcYWSEAAz7cp1IvSOO8Q1pJsX0SFM/+PdcZLgSmDvpnsJd68eVRS3Gr5zxlx25+o5rwqi84YZ+ZTPMu4qtdcH43g+LHPQakmEZbR+Qs65IGsbn6HTZed/gW8RxMqLvg+n5ahk4Bt9iKf3jcsGW2hcp+1olGSr/BhiUJzk9kinlwrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 01:27:25 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:27:25 +0000
Message-ID: <a208375c-3850-407a-af00-6f67f2c594e9@nvidia.com>
Date: Fri, 14 Nov 2025 12:27:18 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix override of entry in
 remove_migration_pmd
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, Zi Yan
 <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251113051352.1753714-1-balbirs@nvidia.com>
 <ed523668-92a3-4eaa-a999-4fb7a43e197d@lucifer.local>
 <dd1da795-d37a-47d2-87f5-50853ba43519@kernel.org>
 <5092cfb0-ad25-40ff-9a07-3de86d37665f@nvidia.com>
 <20251113150811.081a6dbdcca8b5c474d6e399@linux-foundation.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251113150811.081a6dbdcca8b5c474d6e399@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: a2de846f-faaa-40dc-53df-08de231cf7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGpiaWtnME9nMkdTVXhXZGl0M3NjVjRwSlZabzhDTityVGowYUJEZ3ZJVjV3?=
 =?utf-8?B?dklRU1pCc282cG1DWTl4TE5kRmZ1Yy9wTzR6aEtwUm5VT0E5eEhjYjU0ZUdj?=
 =?utf-8?B?MEZzcmo1UFdjNU1NYXloeDdpN2tjeUVoZVA4ZHFYOFlkbWhXaDE2dFljSS9V?=
 =?utf-8?B?TTBvRmJ2N0tjaXFOdnlyQytHdGd3dlFMSU5WU3dkazNKbHJtb05TanV5a1VL?=
 =?utf-8?B?ZGRPMDB4OGcrUm5DaVRFcThoMXVUTU9udVZGRjNjY0krYmRRd0F0UWNvdlZC?=
 =?utf-8?B?c3RTOXpRbVJIVEc3MEh1Mjl3bWE5bkcxcHVqbGs3REgzcW5lWklCMjJmYzdv?=
 =?utf-8?B?U3B1ZStEYVFpQmhCMVo1WmdVT2kyRUhNazZmMzdBNyt0QlFuYzl6cGRXVURk?=
 =?utf-8?B?b0pweFJPWmhHaHdMbnhhK3NNRHFvRTFZaXhueXQ2SGt6TFBQd0s0RDZydFNC?=
 =?utf-8?B?RENoNzM5V3A5RzNxaWhXRGY3UktYc3htM0hrNC9GL0tQZExjU1pKbi9md0xN?=
 =?utf-8?B?QlIrblFCbmYxcXYwcDNEUlk0V2tIUVBtMkRPREtvMU1heFVCUUI3TlhPak5p?=
 =?utf-8?B?TnNFSXB3c1J2N0xMd3ZPL0JkbWtWVUlSVFI4NVlFRldTemNwRXllNTRJWU9W?=
 =?utf-8?B?MURFRVllVnI5ZzF6VkZ0VlE3NUNCTlp6dmRZVER5bmdSZGlYNGR1bHpBeUJu?=
 =?utf-8?B?dExRMmgxd1BPcFZRdGpuWWVxcE5oTnovV29NcjFmY3VJaHNPTGlGUERkUHZU?=
 =?utf-8?B?NU1Nai9CQ0pZbTdFK3lRWUp0SEVmL0NrRjRBNHh0d244dEVGakVoeXpINzRn?=
 =?utf-8?B?Q2dpWDlnWWhyd2szbG0zMzZ1QlBFT2I4Z0xoemJIa3BJeDBvckhETFV5UWQr?=
 =?utf-8?B?U3IyTVlocDBhblBodytuK0lFOTNUbGsvNXpadE0rS1BNT3NOSFVUR0s2elhQ?=
 =?utf-8?B?ZzNSSVFHNmwzdFlNaWJ4RktTZGNHdU82RGwvcEl4bFhzQWlSMGtZVWtUVXBa?=
 =?utf-8?B?VVhoV0hQcFAwZGJjM0FUTEpHRmtBMTdxNTNGWWROUjN1SUJYakJDaHJDOEtJ?=
 =?utf-8?B?bHVLdDJwaG5aVE9tQkV5Ym1XNXd6cXlnT1BUd0tmN3dNeWVuRmZ1dnkzcXEr?=
 =?utf-8?B?NnpLRTM3dEkzbXZrd0ZkYXNmQ1ZWT3BBR2VjblV2TmNtRUd5OHNKYTN1aGpp?=
 =?utf-8?B?c0pXb2RtZkttaFVKWGdzVHYyYjRuTkVDZW55U3ZzK3laZ2J0N0hWMXNueFJ2?=
 =?utf-8?B?ZXpleTJzM29iNFNOSitvYkp4enJuaVo1bG9sM25WRnl2NDJYR2kzbmJnWW1K?=
 =?utf-8?B?YlVSODVuQi9pRThjdmhiYzhqS1d2Z3NwV0J4U3h1VzY3Zk9MOHoxT0tYU29W?=
 =?utf-8?B?ZnJHRnBuT0dldmFRRzV1U1djY0p6Nm5wVi9Hem04UitGcTNIbWM4djZhdzBL?=
 =?utf-8?B?TnBkeTBRU3F1MGR5UEVRUWZkL3hZdnRDaWNUTGZBbzd5YzNydy9USHBXbmgw?=
 =?utf-8?B?ZUZQTUZhcVdhZ05rK3lYWmk5QmVkNDJPUmI2WlM2eXVZVjRsK3Nrb2p2VWl2?=
 =?utf-8?B?UWt2SmJBL1cxN1ZzRkRGb3VSUStzd1JpcDhjeGIrRE9VcVhDNVNrTmk1RnFC?=
 =?utf-8?B?b1hjbVVaT1cyOEVySUQ5VG9oeGJjNzcrdk43Q3psM0JjY2wxd0RPL29Qb0gx?=
 =?utf-8?B?aUxIZUtVSS9aeTZYUm1pRnE2YTlWWm1YTTdmaGc0dUJ6aTE3cTFxa1U1YWRa?=
 =?utf-8?B?dWM0RlJwSFNrelU0TE0rRkxFdVkvcDRPMVFVZ2RIWmJCWGtGeDZsT0tuOVp0?=
 =?utf-8?B?UGYvNGQvY01UaHBIVldxU3daTWwzMDR4MVNKb3ZuWkhDaWtnZjVuWjlPSWFL?=
 =?utf-8?B?SXZRRWZkQWt6eGExS2xXQXhWdVBEZjVJYnJ3N1lvcDlHbGNBeDNYUG1sbzJj?=
 =?utf-8?Q?tRHzg0LlvuGB29F7toQkkrxOG4rSte2q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clRGaHBRUCtqTlNJd1p6Q29kckovckVpS2JYc3k5Mk1zRzUrZ1VlUkZWTkto?=
 =?utf-8?B?ZllGMVl3dGhuYTVTYjdIcWpUeW1Zd1M3bVVpcGpYZVVGUEljWXplaWdnWktY?=
 =?utf-8?B?ZTdGcXYxWk0yTEtDZFhkdW1wQjhhYVBGVS9KVWRIR2tJWTluN2pzMWdUcHp6?=
 =?utf-8?B?Tjcwdi85b1FKR2d3eGpuZm8wWDc1RE9PRkw5TmZReDVVR0VxUUFKZGhMNnE1?=
 =?utf-8?B?aTZ5STRxemw1cnVMRE15MzFWcS9LQ255bVdNdVJoSUtnUFFTNXhLQnRIczhH?=
 =?utf-8?B?akg3bDZpZlpNM0REQ0lKNHZaRkVWSktyNjBMNWpmdEdaeU8yV0h6aU9ETkV6?=
 =?utf-8?B?OEZxdjIvRWVaajdxdGxwQ2lrOTlZVVRSdzRlUHdCdTBLT0kwdkxuWmZMYXFm?=
 =?utf-8?B?ZFpxWHplVnRxTktSMEtFaTZ6OXFlY3kvTHVlWW04RUp1MFRqYTB2WHIwbm1M?=
 =?utf-8?B?MGRkQ29qNU9HSC9aeGQ5T3IvZTRCUHVZUmhwbjRHZFJvc0s1RzRYN1NySks0?=
 =?utf-8?B?WVBNeTJxd2tORkoyamUyRmM2YjJHWjRmd3hjZTczOFZMekxyTUs4ajNzUWQv?=
 =?utf-8?B?bTZGN2RpY1JKWWVCa255SURoOUREN2tLL0F6b0JvN2ZOWk5xczJmWklTREpR?=
 =?utf-8?B?aWZaVmZKSFFVVks5Szk2REEzRWt0bVRCaDh5OXlKcUNXbit5UFJ1ZTFoUUJv?=
 =?utf-8?B?VGVUTmpKNURkalZEVmxaMkdRc0hTMnBaRk1ISkEyK0p4dk1jMXZuV1pKSSs4?=
 =?utf-8?B?WEhPNG5LQmxMUkRnL3p2d0YzSmlJTFRqanAyek54QnAvMVh3Z2FyTWZMaUxU?=
 =?utf-8?B?ZTF2eEVJOENRL1ZpejNmWVViM0ZUc0g5VlNycTV1aEs0NVlLSW9YZk9wY0oy?=
 =?utf-8?B?b0RUaEN2NlFKNUNFNUs3V0JqN0xnVjkwQmpGV0tsY3h2eVh4SG1wOXhXVm4y?=
 =?utf-8?B?c0RzemU5eU5Oc051ZG9mWUQ3OU4wbU1CTEhPQUlERjBWZlUvaUR5cDg4NDVO?=
 =?utf-8?B?eGNNQk9Ic3JWTjFHK2ZNTnI5cUN0OHc1RHVJT3JsdVo0UDBwWm13MVFBN2lZ?=
 =?utf-8?B?TXRMVnhFZ2VUYWx3cmpOdnNGU2tZMTFTNWhEQlNWT01JcHM3Z05vU2VIZ2Vz?=
 =?utf-8?B?bXorQ1MrVVh5WHdUbDFuekg5Yk44QjdwRUFMMjArOTM4REpQRFZpVTdhbFF5?=
 =?utf-8?B?SFpTV1IzVnhUMmJ3R1NYUm5yazZUMGRCZkdjMW5SVnc5eTA0SjZPSGRMS25k?=
 =?utf-8?B?NWpqMXhjdE1RY1pjdkJJNmJJVGZrQzh6VFExWEJnYjVtZERIc3dlUXM4S2tS?=
 =?utf-8?B?c2dqVzFDQjNHVjJqNkxHRnVDWFlpcXNkbEp4ZjczbTNzMURkR1JDVlhCazU5?=
 =?utf-8?B?dmxxNGFuZXJvcUg1ZWs0dmxUajZxWFFxTGRhdU5JcVlqNytQckRNYkRVcUx3?=
 =?utf-8?B?YUtxZUgwTGl2dXYzWkhpVXQrKzJDZ0VUNUdldkFFcUgrcEZEUGpJVkRSWktI?=
 =?utf-8?B?SWlCbjIvWHBUZHV2UHRaMGZuTlZLL3dHbUcwa3pRdDJ2eUEzUEgybFNkK3dW?=
 =?utf-8?B?djk1Y1EzWFJtWjVaMHBQRWlBdFB0U1lPT1NYRVRROStNZGI5UmJuRVFYRHk1?=
 =?utf-8?B?RDBpWklqQXM2QTJhQkJIN2lHc1NvWDU3Ui9id241TXRyZjN4Z1h2bmVxNXBY?=
 =?utf-8?B?VEhNMnArc3g4OForaXcrVTlNUTdTWGVkUCt1bURIOHpwK0ExRkhiaVB2eGV4?=
 =?utf-8?B?cFRsdk5qL3hHYSt0RjAvRU9vNGFiZFNwV2RIYXNLOWtOWHU4TzdUK1Y2aWRT?=
 =?utf-8?B?OVR3QVpCcE14UnhoL2lWUVJpMmwyMlJzcUhLcDlHdnYza0RtK3Y4ODVZeVZL?=
 =?utf-8?B?REdRbDVzL25BeDE1RkRZQk5BM0hwV3RzUnUycnBteVUzVEY3MlVDdS9UZENL?=
 =?utf-8?B?ZTEyVGxpQTAydUFvcjRiMkRNQ3Z0UXNNSUFLY1R5bU9EUGtxQ1ZMVTUyeTMy?=
 =?utf-8?B?ekU5LzJWK3VreGFaUVVzRlRtcVNaTERrV1E5NWw2OVBYQXRQa0xMSkMyaFpW?=
 =?utf-8?B?cjRxcHZES3hBRjQvbGlRN2dZekNEL24zQ1NQWEM3QXA3c2ZHVGJTb2MyYmdC?=
 =?utf-8?B?U1RyWWtnVDA4L05kQUtONHJBS1JNY1piY25CMjVha3FHYjU2VUxaZXNFWW5V?=
 =?utf-8?Q?35SbmZW3TUKEoChinCGaRjS02x87Wnc5GkJ0zcjicEZa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2de846f-faaa-40dc-53df-08de231cf7a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:27:25.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eZLoZsGyQ7pVKEfDKNwdrunHG6XBUJiVh3OmgMwatPqfeR09RyOzGxScZcDgEbp7v8gvfAGC0fkMZBwAd5TAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

On 11/14/25 10:08, Andrew Morton wrote:
> On Fri, 14 Nov 2025 07:55:29 +1100 Balbir Singh <balbirs@nvidia.com> wrote:
> 
>>>> THe logic LGTM but we don't want to have a bisect hazard here by having the bug
>>>> introduced earlier then resolved here.
>>>
>>> Exactly.
>>>
>>
>> The hazard is a VM_WARN_ON() that checks for is_migration_entry() in the
>> call to softleaf_is_migration_young(). I am happy to go down that path,
>> let me send out the fixups, it felt weird to break the rebase, but I
>> am sure Andrew has a better way of dealing with this stuff.
> 
> Yes, please tell us which patch introduced the issue then send a fix
> for that patch.  We can figure out the softleaf changes later.  (Which
> this patch provides anyway).
> 
> Also, confusing that the changelog says "The softleaf changes exposed a
> BUG in remove_rmap_pmd()" but it's remove_migration_pmd() that gets
> altered.  Please expand and clarify?

Sorry, it's remove_migration_pmd() that is effected. I've updated
the changelog and sent out the patches. I've sent the fix to the
original patch and the fixup along with it, hopefully I got it
right :)

Balbir
