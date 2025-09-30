Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2871BACC06
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEDD10E5B8;
	Tue, 30 Sep 2025 12:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lnx4TNbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010046.outbound.protection.outlook.com
 [52.101.193.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A21A10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNtRiSYPEpC2WtnHhg4ik/cTLVWPlO15NuGvd7VwepOc5FwjI8FX1PPWA0lYniI8qF3b5AWMcuVH8JI0QgGDLFaq1cjJ8V2/nZvGBE2xXA0r61rGopoLSzrhnXEHTZwzrpMAvcS6aTZIL4jbJXmyZrs0cnmez0GaRKZunbZnpryxijmrZe/9HWgvJrXphu+13Iy8N9zOhQtlJZq8W3wqaQCHa9llZ0zBzJ6AClVcFlmq45HONsUDPNrDgPoKqPQux8wabcOOOd6+kKnAEbL1qV5+FMC8pAqJUIE3P8/L41bIUpDgNVehfzwMgPU+8DL5vxzsbj/n7Iw0M0s1BYam+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSaKsj6javWizyFmLP3QDjhPQsCUIKnj0CCB1YlqJHs=;
 b=FVjoqPZH8y+n2sn6fpJTxNwbbj6r4grcKQpEtcEh9fEhqoDF/Ci0di1yUaC+cN9gVNxBAzcncHI9K/hd4StZTjDqKmuyqbUbbgrWlym+U0SIkVaLr55+f4ZuMrcs0BUxgJE7I1rlCgLmGiY5YwaxBJPniSNZI4Ra1zCiZZWwnLcmyVDkYouH8qrqTg6QjcURTGJ/Jrh4lMEC7WliXu2DsofwSri287b4a8Jj9REJP+F5sp4If2XdxsiULgUuJjY4eUKbHotDhIYO6vVRP4M++hxYjltQGWceWCjBSGFnU7WCWrDiCKIHOydulmu56EnpC+cIFz11jIq4Tr8b1CUP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSaKsj6javWizyFmLP3QDjhPQsCUIKnj0CCB1YlqJHs=;
 b=Lnx4TNbKqjZXzZqEBc5J5Qk2tQeMrtkuSqnK0YLnT9Zl/f28BQmI2qhOHqh24K7ynwdtrF/feMHX78z67rSvwFjt9k9E6sakVdwzyRLwBOK+FI7jxYYrGuXIT6Z8ODDrHG1E7i05FKxvGfb8tHuZOJrTgBX2RYKVQ54o43aMZ3RIYw3Nry4JFtPt64O3tOHKAShgiK1RTiB9MwPrONI1Tjr7RtwR8REbw4MGdFt4z2SWC0n1IfRmtP4Xh/Eq7f/LOhoDlohxaS79cj6U/3DA538TN2v7ZLzHhoCHuHblbwTWGj9UHa4AMgRD+bleTtOluC3kHuJJa+A/mdMtPeoThQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:00:24 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:00:24 +0000
Message-ID: <4d8142b8-a187-4519-a174-7b3bc594b4df@nvidia.com>
Date: Tue, 30 Sep 2025 22:00:16 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 07/15] mm/memory/fault: add THP fault handling for zone
 device private pages
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alistair Popple <apopple@nvidia.com>
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-8-balbirs@nvidia.com>
 <7fe72c55-fbf9-472e-8d10-5b6396994435@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <7fe72c55-fbf9-472e-8d10-5b6396994435@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ff8e9e-ae50-483a-1545-08de0018efff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2pXUENFRUVBVmRBWHovbGJGMGxBRG9uUTRvSjdJK2pvbHlvbURLLytlQW9t?=
 =?utf-8?B?c0ppcDM2TEYxQ3NWNnpoUFZId1ZBN0ZpbnQ5cFBLSE9JenR0eXZVaHZkOFky?=
 =?utf-8?B?NXhhbVp3Vzg5OGtkU0VxRzBiZVcza2RmYk1xTHlpUWF3VFVSeEVQK0pVL2g4?=
 =?utf-8?B?M05hZ0tpMUZqVFphRDNrb3l5RUk0YnlGWURXVEFDV3NTTlhuekhweko1Z1Bk?=
 =?utf-8?B?Wnl0d3hheER3dVptSWlLQ3dmR2VFeVltdGpDZ0tzM2FvUVJpM2czL1lJbStW?=
 =?utf-8?B?bDZPaHpSNnp0LzdleUtVSlloSStuMTdzQnlLOHByaitTRW9UQzZGZncxVXRB?=
 =?utf-8?B?R01YenJNN1lDeDVqMWNvSEFqeHArcTh6MDJSOTNWQXJKSUMyTEpGSENFRGF5?=
 =?utf-8?B?cTZpaFZyZ2FITG5PV05VL1VIL1ltNlRMN0VjM2tnYkdoYlpYdjdPM3IzdU91?=
 =?utf-8?B?cU5JckkrOWxvR0t3L1RWRTFiZWZmM0xZUXliTUVxWWJJZmRKNmJaM3dQc1Uw?=
 =?utf-8?B?cUsraDR1VDRvNzVpSmg0bE1PaU13aG5JWGI5NFFIQnRnQzJSSlhlSFl5VXlI?=
 =?utf-8?B?OUhEaVNkMDZNZm9MQ2NTYXh3ZWlMdlZudVN3c21sZExsODh5cnpHeTdWcVJh?=
 =?utf-8?B?eG43R0NzcmxNaVYrNWFnRythYndOTXdoTTdUUHAxUjFsTmpWYXVvcW1TNW0r?=
 =?utf-8?B?akpOSmdyNE1tKzZBVnVhQUxpOTdBMyt1NWd0WEtDV2V4Umpvc1VnNEFTNGh0?=
 =?utf-8?B?UFo4cjBhbnovMzdRRFpGYmNOVm84c2g0WTJITDd3aHAybHFNYUxNZUJYckJK?=
 =?utf-8?B?L2JZaVRoTFAxTUFkLzJvQlNNSkorL1Z0VmtCd2JUVms2K1NJdzhhUm0rakZX?=
 =?utf-8?B?VzBUSlVQcVE0QlBWc0FFU3IzOU15U1JYeThKWWRadGFhMHVqSU90TnV0NnVn?=
 =?utf-8?B?K3FzOTNxNjYyY0RXcUpoYnBtNzF5TUN4Z29rNGgxVDVDZ1ZIcWxFVmZFTDg0?=
 =?utf-8?B?dXZzbmxxbmdCT2dpajIzS3FMSFllakFycU5uL0p3VnZ1K2RxZUZjdVQ1dklM?=
 =?utf-8?B?ZzhaTmhaQkVEWXorRmJVbDJiTHQrQndpMFgzV2x6Unp2OGpaMkxnQ0N1eXNk?=
 =?utf-8?B?WGJGMUJQYUMzeHoydVNOZy85OHF0Yjd5WnZYOXBxVzU2UXVnME03ZWdxOTNL?=
 =?utf-8?B?VktDOEFjNkswK3BoUmhCY2V5TFkzYzlmeE9walV0ZWV1OTJSWVhhcGJNYjNE?=
 =?utf-8?B?WTVaZUFralh4V09DYWlkSHFJMTJ3YkVBYThVd2J5NjZvZ0pFVUMxUmE4amh3?=
 =?utf-8?B?TFdlRlk2bERkV05FbW1xdXRJV1UzMzdYM3BDOFBaYkpCQXdXNHpqYjVnemtD?=
 =?utf-8?B?SGRKWFFBT2Roa2RTSDgxNDhhQWFrTk9ZTVQ5czBhQUl2ZUdZbzBQRm5HeE4x?=
 =?utf-8?B?cnBtYXFac29oUTc3T3VsTmFjb0R6Y1J3UEVLaWh3MzZlNGJxbHFlTWJnNkt0?=
 =?utf-8?B?KzczNWgvUFkvRUV0ZjRtVllSZlAyK0dqUUxSVk4xNkhSK1R4c1JjamNyT1E4?=
 =?utf-8?B?MDhTZTh0amZYQStEZ3RKbENNakFiS1ZTZE1XOVd1dlMvakJ5N3B4UmVKVWFK?=
 =?utf-8?B?eERGczFmMzhkSHpBOU9sa3JGY2tYaFQzWGxPTWNTMGZ0UDFOZDgvbWd3V0FF?=
 =?utf-8?B?MmlZTVNkUEZIQ0RheENWUjdpT1phL2lWa1IvSDJzK3dlUGxqNW5UcUZVNnVh?=
 =?utf-8?B?YXh6eW41UzF6RkN5djlUMEZ5N3hpNUpLMEVtM0d5Ukc3NWsxVis2U3Iyd2Mx?=
 =?utf-8?B?NERBUHNpdHhNQnQvQzdYVGRRSkZRMW9VaVZGTUtqc3FzaWVvc3M3ZVAydFlW?=
 =?utf-8?B?aitDcklTOGNxcUxxL3BZOUt6OVlJZDQyY0V1YXJsZ3BkYXA2dGR3OFd3bG5Z?=
 =?utf-8?Q?9MYFHOfVv7aYnLZjIMpVEYOV0TiiowHJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THY4ZlBSc2tnMHVJZTF2MVdNZHRpdS9TbVFTb1JIQU5sREJTWE10ZURqWXd5?=
 =?utf-8?B?bVp1SHFHNS96UC9qYVgrdzg3ZEVGcE94Tm9tVGd4allaQUNPWExKSDkzbzFN?=
 =?utf-8?B?WkMzN2RsbTRZQ3VQcnAzaDV5QWd3MkpzRzdQeEo1QVZJdmNHWkwyZGQvd25w?=
 =?utf-8?B?UnZlYUhHQXpDa2JDTFhocDdyLzZHcG9tSDRlWG9qYmd2TDVNdC84YSszT2t3?=
 =?utf-8?B?VTdJT2F5NS9RUTJiRFBaNnAwNkNmNWNOTERCZUFMNThpTVN2a2F5a0Y5em92?=
 =?utf-8?B?VmZRR241NmxnMFFtYXRmN3hFRmhyTm9iNVZCVU1GUHdMblpIQXR5c0xWRnQ2?=
 =?utf-8?B?eExGQmoyOHlPYlI3TUFldEttQWNSZExOajlzdlFTTTV6NXphM1ZlbnlIdURh?=
 =?utf-8?B?UmN3RXd6SkY5OWQyZGNFSUpPZlV0SzlPalkxOGFsSGZNN3FadDI2V0JVUUVL?=
 =?utf-8?B?VzVvUVJGeXlabkRTcXd2VEw4WCtQeU1GR1RiajI4c3VYd21OMkJiU1VOdUtB?=
 =?utf-8?B?WlRXMXpRRE1aQVJvSnZpdjBrTXY4YUdRYWM4Mld3c280eHZtZUcxT2NwVFJl?=
 =?utf-8?B?SzZEYUxod1lVNjR5cEpuaXUrVlJNWTNJWDVxeE02UmQ2QUdzZWF6RkZGMllT?=
 =?utf-8?B?elZiQXErQnptdDgxSElEL0VmNS9LMk5aZmlMNU9BTzc4dGdzM0hVL2tCTEFz?=
 =?utf-8?B?M2g0V3NUUUgvb3llUHRVemgxQ0tSY2E4ZllBSDY0NFgzczJKQ1ZVR094dWlD?=
 =?utf-8?B?dEpCc3VnbkJuRENSVlpZdFFiMXB6ZlNpWUxNc0w0allOaWI3SkNaVGZnakZY?=
 =?utf-8?B?TUlsWXU1NmhKYTRnZWwrYTdBeC9PQUlzN0JrRWpPeWQ0RWM4Z1NLdi9WbThO?=
 =?utf-8?B?NkJNM1dLWTVOUWFaTnJpZEd4YlczbGlFMGJwWUJYaFdsTHEyYmVad2RKRk5D?=
 =?utf-8?B?OHllZ3dDSC96MUFhOGs4TEI0dXZsdGxqaWhHRU01SjVxb1pJaFErWmplYkNv?=
 =?utf-8?B?aEFPZzI0L1I1dlBGVFh2STNVaytJS1lSbjNrMER0MjB6M2RsNkNETldVNm9a?=
 =?utf-8?B?U1RGN1FLd0labWpFbXdyL3ptZWFnWUFvZmNoQ1J5ekQrMS9NYnFzMkR5cnA1?=
 =?utf-8?B?YzY1K2d6OXh5Vmc0N3A1dUxlUERHR29HTkFMTVpudWdMYXM0Q1RTVE9lREVn?=
 =?utf-8?B?VVFJaE9waThoa3VuSm9icUh5RzdYbm1Mek50WkxMaU1XYzBESzc4WjZST1Ju?=
 =?utf-8?B?a29jc05NUzdVNUlhSUU0b3hWZThaaDhHcHp4TlZHVFpRbXdGK1lYSHhNYnFi?=
 =?utf-8?B?ZWNEbmdwK0NaTWtaemIzc3o0N3kwQ2pCYXJUamVNWnlicXcyaEpySTVqQXZR?=
 =?utf-8?B?eTRPaUVMMWtML1Q4Q2hZSXJBdjNHWmxxU0tnZTdxOVQ0eUIvQ3FoN0ZpNmNk?=
 =?utf-8?B?aEZkRDNqS0Y3OXRGTWhVZnBBTURPT2graTNkNytQMTNpVFo4RDNiRlQwUHND?=
 =?utf-8?B?aDJLeXFrSUF0TmdVNmhZMVhnQTlzdERmQjhjczVIRTFVMUJ4VGhRUDlYck9v?=
 =?utf-8?B?UmUyd3VCNTZaMzRTaDRGczBZWnBYT21jcVpaaFRJYTlXQ20wUS9rdFhNd0JK?=
 =?utf-8?B?M3ZPR2VqalgrU3pXY1hWaWFwSkZBZHVVVGdITHlvL2lZTkxneFE2T0xiYjRZ?=
 =?utf-8?B?dS9IZ0RQd2wza3ZlL1NzODluNzJUT1hrenJNck5GcHV2TExJY3doTkIvdFpp?=
 =?utf-8?B?MzJBTXdYejlpZ3hSOFdsTUhRdkFyK1dvUHVXTTlzY2hTSE5tY0RYVXhVdlk5?=
 =?utf-8?B?OVY5cjh1V0Q2NytsNzNvbkxjMUJjZ0tFMVpCUUN3YTcxd3JGb1lILzRSQTZs?=
 =?utf-8?B?MElqQXVZOWxGMU9NRlZOdW5oSjNWbDBQbEVrLzFMZE5tQkVHSXJOdnczMm9j?=
 =?utf-8?B?dE14NzhtVUVkR3FhbVZwcElKNVBzVEVJbDl1TXIyZHZhZnBBSGNJa2VJdVRK?=
 =?utf-8?B?enV6aGhudWU0M3NLNnp1UFpkOUhENTVzd1hZOWdCS2tKUHBObEpqaStFMnkr?=
 =?utf-8?B?aEFxM25saXFPR29WMDZTalRFSnNzWWI0V25aOTM0NTlNc2pkZFJnY05VWGI3?=
 =?utf-8?B?YnQ1bDJQU1NjYmhBY0F1OEhyLzlndll2eDMyeHY3S1ZYNURMeVM3YTVuMUVu?=
 =?utf-8?Q?43yX/rUPNsdFxXXLGZJovc0WOfYv6tkibmmCfxFDpgPw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ff8e9e-ae50-483a-1545-08de0018efff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:00:24.0635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WC5UKB1wZ7XxXWIYAV8s5lFHwifbpzgDr27yd20+QUtMUUqlYbrZP01wj+zCxrNw+AvlLDp9WML1TgNaRFLfxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
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

On 9/25/25 20:11, David Hildenbrand wrote:
> On 16.09.25 14:21, Balbir Singh wrote:
>> Implement CPU fault handling for zone device THP entries through
>> do_huge_pmd_device_private(), enabling transparent migration of
>> device-private large pages back to system memory on CPU access.
>>
>> When the CPU accesses a zone device THP entry, the fault handler calls the
>> device driver's migrate_to_ram() callback to migrate the entire large page
>> back to system memory.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   include/linux/huge_mm.h |  7 +++++++
>>   mm/huge_memory.c        | 36 ++++++++++++++++++++++++++++++++++++
>>   mm/memory.c             |  5 +++--
>>   3 files changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index f327d62fc985..2d669be7f1c8 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -496,6 +496,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
>>     vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
>>   +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
>> +
>>   extern struct folio *huge_zero_folio;
>>   extern unsigned long huge_zero_pfn;
>>   @@ -671,6 +673,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>>       return 0;
>>   }
>>   +static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
>> +{
>> +    return 0;
>> +}
>> +
>>   static inline bool is_huge_zero_folio(const struct folio *folio)
>>   {
>>       return false;
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 5291ee155a02..90a1939455dd 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1287,6 +1287,42 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>>     }
>>   +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
>> +{
>> +    struct vm_area_struct *vma = vmf->vma;
>> +    vm_fault_t ret = 0;
>> +    spinlock_t *ptl;
>> +    swp_entry_t swp_entry;
>> +    struct page *page;
>> +
>> +    if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>> +        vma_end_read(vma);
>> +        return VM_FAULT_RETRY;
>> +    }
>> +
>> +    ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>> +    if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
>> +        spin_unlock(ptl);
>> +        return 0;
>> +    }
>> +
>> +    swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
>> +    page = pfn_swap_entry_to_page(swp_entry);
>> +    vmf->page = page;
>> +    vmf->pte = NULL;
>> +    if (trylock_page(vmf->page)) {
> 
> We should be operating on a folio here. folio_trylock() + folio_get() + folio_unlock() + folio_put().
> 
>> +        get_page(page);
>> +        spin_unlock(ptl);
>> +        ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
> 
> BTW, I was wondering whether it is really the right design to pass the vmf here. Likely the const vma+addr+folio could be sufficient. I did not look into all callbaks, though.
> 

The vmf is used for address and other bits. FYI, this is no different from pte fault handling and migrate_to_ram(). I can do the folio conversions

Balbir
