Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB49B89A76
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C210E9FD;
	Fri, 19 Sep 2025 13:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GMidqoF5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010002.outbound.protection.outlook.com
 [52.101.193.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5856010E9FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 13:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK0604fsrdsi7ruOQWdWId/vo7zU74WoSrV4pk4wKSaf55t2DTykksBiQZSfQLFzh1+8eqHcNx6bIzg2jsaLDRDT409PoGa628eLkUHWugGlSSsu6Bk9xf3XofgzAuoYw9zrNRgOeKDokQVMBFxL6LYe0jbbwGX7JerBxhjhdilWxFHPnNAz3sO7CCK3YO1rQdux8r1LL6XM4nQBcVsnu4vBpcEkSuxWjUAlW2LjhVh+aJx7owxuuHTk3nBwcyAsy2EVzgNRNO5fUH+W0FP81hn0aS8h1C+bcSu88KEYLiS7TOgr4pskjpkurUNPURFfKsKpMXNdxj6rPUD3fxhlWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6W8bsolvOdtvCfsnbQharuAmkNvBfByx34hWWXw0EI=;
 b=pF6yVv32w2l/0ARRa0UAggN3iWfY+rbN3NDxAtxjFKKYD6XosEnlyiz0BAyfzo135NQ5gBj1+Sp18M71ks4SQ0ng6kEiL/qW2i+ma15MOrkXX5rhFfBY5wGtbhUBymoxiH5VH2zHhcmKm35AK+Wp5qc4yIBOBj9xNWyTYwx1RmmvAb54nhkU2t7K7/k26atZzP6pyd2u2CFEVbkEPTg6IHAZ/gYzPKUzwdURaxaCKd5FolQxtvAq8zTN5XoI6oDRbml3TxSn3/5queX6eZrDSgNLwXE9Vg2DA2k0qyH8JE3SQvv+LXUOR2i22Abf11oS0RL4JEaE8bz78qNNtBORhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6W8bsolvOdtvCfsnbQharuAmkNvBfByx34hWWXw0EI=;
 b=GMidqoF5BMhn4BTFnM1CWdP4eBuTNWnr7JMZ5EhJpkr+3IO4iuXyt4JrFlQylpcOzbvSsxwXbMrobg6pD93BIXk1OWx9JuajvAN7Q2kYPzAgxVDvEASxxbjbzhLM830Ps4l49GXO6z9POtfA7TMJZ8e/6SIOIHy5UqWvpsYdwunfuECZFNkH27jSDa2mv8QVMqNzzP8fVk3i4HcUGBUARSMcL75E0ifSN+XnRd4CKX/Od0C4CUY3crW++GAAP76/H4OyWvhP3rd+lTFm7Yl9EPwt2plIChjHvoi/jCVc9klCSNaGj3/s0IJhcHR0r6htim14aF5wYrGT7zjyO2Rqyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 13:26:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>, Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
Date: Fri, 19 Sep 2025 09:26:23 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
In-Reply-To: <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: b02e8228-d769-4f6d-1c8f-08ddf78022fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDdIMTJ5SFI2aThRTU1SbmNnV1Z0Ui8wYTVSaVltSURZMWlZbjJPTUZyU0ZY?=
 =?utf-8?B?VE4wcFlnczhoREtReWdSQzE0a0M2SFlPNkdGZUdzQ2dyZkhwc1NxMHBIZ1Vp?=
 =?utf-8?B?c1VRSjYvQmZmVVVpdGNmWEtoeTdhOXl1MituRzF3OWJNc2NZZm90WUY3WDZI?=
 =?utf-8?B?ZC9ZUlhQWDFLTVg2OWZmYkRQZEtldnRqVXlpbkpCNTdZOU1SVlp5cnN0MEVs?=
 =?utf-8?B?RUthNG90ODVlMkZ0L2l5SUpOZ3hEQkx3MkUvaGphV1ZDSDF4QTF6WlRjckti?=
 =?utf-8?B?QmZuM3lBY1BwTm5QYi9lSlBUWWxCU2dGYkJrL0JzeVRYcTZVdzNZSko5NUZQ?=
 =?utf-8?B?Mm9ka3k5L3ViSHllU3hSdTRvNlJIaXNEa2JEdENJY1NTV1ZoamF3UVhXTDBL?=
 =?utf-8?B?VFNWVVdsU0FibGc2TUJKYWpOSG41QkMwajNIaS9XS2cvcW9yTFUvdHcvTS9y?=
 =?utf-8?B?VjRDSCt6R3hoaWsvby9FTHNaSzJJNGg0NUo1WkdjV04yYnRsV3VUTHNTYXNQ?=
 =?utf-8?B?NjE0VHRBMWhjejlId2F1Q3FENi9tbE5PNVZTMFU1WHFyQTJsNmxzUVRsL25K?=
 =?utf-8?B?VHEvM3dEb2tuQWhuVVJrekgxSjBhaEtwa2xCZXJ5UWN3U29aRjZkNTMwb1kv?=
 =?utf-8?B?SWVDMWNkVGRGWkwrZEVvaHVNVWNHUGt3Tzc4czVPYjFlSmxHb2I1ZC96MWta?=
 =?utf-8?B?V1U3TEQyWnYydTZQdzc5Nm96eHEvWkRtT3F6MlJIcDZ1bDhsT1lUbm5nV1FP?=
 =?utf-8?B?MWlMSnh6U29oMGFicUw2Q1JDaFhsN005ZlI2MS9CZjZXMGFZMVRKWmxWQTVL?=
 =?utf-8?B?cTBvaHdHMHNKcWhSanl4KzUrQXQvSEFGeXh1U2xmenRBR3ZhQUNkcE81bkd4?=
 =?utf-8?B?ck5vOEF6S0RKYnl2MXRzSlRzRDRpOGNhSmZVTzZhREszVmxUQWprOGo0SU9U?=
 =?utf-8?B?UHN2YXdUbmNIU0NtbGpBUUNwSnlyN1ZpRDI0dkQrVWw1QzVRQUh6L21LUFN4?=
 =?utf-8?B?TnVmbEtDSjcyTlJCeFYvR0R5N0JUZW1JNDdzbGtkb1FvVU9YY00xTGUzM1M4?=
 =?utf-8?B?QzYxaExYMUJOeEtPWFZLZWxZZld3RVJIMGd0SS9wZEYxRTN5akxNRGRkSHY2?=
 =?utf-8?B?WG5pZGFXMk9QdDBEZ3RsZ1N5WUhyb29JdWZHdHAybEZBOGpTV1hkQ2JrRVlO?=
 =?utf-8?B?c1o3VWMxV1MxQ24wbVF0bms5R1RQWTRSZkd0d1ViNVVaakNSK0JnR2xnMXVO?=
 =?utf-8?B?Z3hkdW5rWjFIM2p2MjVzbUlob25jRGtOZ3o1ZnFKR3ZIdkFGRlV0cnk0d2hi?=
 =?utf-8?B?Yk1EYzBSdHQwZEFRVTVEbEdLVzJjWVRKZ1JFdEcvWlJmT3ZCZ1JHWHZLOU4v?=
 =?utf-8?B?KzlCMXlVdThkZDlaSGxyNFVSSFBvWHpZYU5RU0dIT0xramlaVHcrOVEzOEtm?=
 =?utf-8?B?STVFTlB0UGd6aTVrUktNajkxcU1ML1VwSHpkTEd1dFpMR3k1M3psdHo5OWxn?=
 =?utf-8?B?OGQ3YkVpRFdjUThKMVhQcjhSYXF0S0xoSVR1ZllrcUJ4Uk9KN0lEb3NKVWl1?=
 =?utf-8?B?NUtodU10eUdUMW92V2dvcWxqMk1Nbm1kWFFUakFVaHVtZGpWNWhoZTVkSzRv?=
 =?utf-8?B?djROMlpzNkdzL3E2cDdiTGRKNDRLUFhiM1RONWNicGlSaDNsZ2MvRy9FS1hS?=
 =?utf-8?B?K1hzSnVJVDlUcWJ1cFFYM3R3S3RiSUNHRkw0Wmt4S1ZUZU9YOEJkUzdMdVFS?=
 =?utf-8?B?Qy9uU010alI0eDdiNlIvL0RHUVk4S0hqTkFabzdwL21MclQ0Vis2dDRPTTZ5?=
 =?utf-8?B?NXhhTGhmVUNDUm81bTViZk92VTF6Nkt1S2o5OUEvR2x0TG9LY05SOU1UY2dH?=
 =?utf-8?B?aDdGV2hkMDFKMEV2UUJicnlUR0RlWFN1TjZBZHdtQTNSejljc0c5RlR0M25v?=
 =?utf-8?Q?5NK/+SlvW2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlObWJBUEszWDR6U1NnNWZRdFB1RExaY21SVjQxNVM4NlAvbi9lanphbFQy?=
 =?utf-8?B?V0E5MU9CTzg5RHZEODk0OGh5ZEN4ZXN0dzVXdW5QakFzU1hlRVc4cmhLQ2tz?=
 =?utf-8?B?WFNZVnlaUUp5OFdVcTVYdGNwU1RNUmRWdHhzYnBoQnFCV0RUbEVLcjNPUmRw?=
 =?utf-8?B?c1VLMVR4SlVJemtIOXJSQlplZHBVRG51UklvVlpWc09CVkNJeVNjR0orS29X?=
 =?utf-8?B?bG02ZE83Yk1rNnJFT1IzWUMvd3Jzd0M2bXF6WHU3OVphV1VoMW0waElSVVd4?=
 =?utf-8?B?WmloRkVLWU1vdUdGYk1XcnRMUE1JOUpGOGFSbzVockM0TmljRnV3SUx4dXY5?=
 =?utf-8?B?RVJiTW1SVFJVQ1hkWloyNExBMWVZR2MxT1BtRGZLdmplbmtDZVNiNzlGNjdE?=
 =?utf-8?B?T1BxbVFKa25BR1ZKU010eXFmV2ViZWd3THZpSW5xK3lueHdFd1hKVkp2N0pD?=
 =?utf-8?B?R2daaUpyOHVLZWZkNGFLMG1sZWFHZ29sNWVhb3l2ZUVxYzQxUlErWFdKNXFh?=
 =?utf-8?B?N08xc255Y3ZUQ0FWT3ViTjJQeTh5bVlsUTNHMi9PZEhZbTA0RzB5ejNPbHFu?=
 =?utf-8?B?cFJqdU8xNWJSKzlGMjNRRU1lT0xuT2NER1YxVWxDbUtHbUxtWXI2aG5aaHBW?=
 =?utf-8?B?T2RuOTRlamRRVUpyMTJGVEM4QmtZeEwwK2l4NmtCY3JKaUpCb0crSzRTemVX?=
 =?utf-8?B?Y3Z3TmQzUVRYbUpzL3RaK1FnRmtWRTEvT0JLOTRvWWNYdmNQQThqMVg0RS9L?=
 =?utf-8?B?WStMMWJ1bjNrb3lQVXAvZDU3LzZIdHlsWGVIc0prMERna25NMjArOHZJVzZL?=
 =?utf-8?B?VlVsamttNnVqOTF3Yk1UN2hLZzlPTk5UWmV6Q3YvbGNEbURhUGgyZUVYWi9q?=
 =?utf-8?B?VTRHbm9RdnkyQ0dVOWVVcWo4L2o2K2dBT25XZnFHNitnT3Q1NjgzMXhqRStp?=
 =?utf-8?B?a1d6SEgwRVprZ2xqeXBObDBtV2NpNDVLT0Y3SWZ3NFY1dDBwQnpyZGZPNXlH?=
 =?utf-8?B?b3ZzcVo4ZkRxV2pPaWZBclpzYzRSMnZWcExYUWU1bXgxTG9zK3N4Z0dIa2h0?=
 =?utf-8?B?U1RubTFWQnhVQmtVTmNvamxsR1NPa0hNR1Q1cHFoRDRWN0o3WjVlSVg1c2sw?=
 =?utf-8?B?dXFQc0dBRzBVZ1ltL0VNZW9mbXhveVNieDRqZ2Npdk5IT0lDSEdsRTAzZk1u?=
 =?utf-8?B?VTBSQTZONFB6M2NTc29rWEtjcnhnYjVUaXJaT0ZRU2s0NkwrN2RnSTYrWDBO?=
 =?utf-8?B?TWZDL2ZOSDBYbkc2REd3akRxVnZ3ci9WdTU1LzJvcVlwVDdPQWZybWF0T2tX?=
 =?utf-8?B?aEZQWlhtd3RGeDkrVks3eWZ6TytKZ2s2VGM4R3AxUUZzUFFxb0EycGlIWm1U?=
 =?utf-8?B?QnpFU3V0TFJJSnk0cTRWNjN3Z1haaDhPMTJKNWd1RVFrcExoVVZRRmVsbTFn?=
 =?utf-8?B?MTZybDlORk5aQ05Ddm9ZYlQzeTZZU01OMHlkWTZyRXo1ZFJwc203YmJrV1o4?=
 =?utf-8?B?TEU3ZE5tWDNMa1YxbzZ4WUxvVDAyb1RIMDVJQ2g2ZjZyejFUL0Qzd2RDMnN3?=
 =?utf-8?B?QURGWWl3M3p6MDU4MVNsVHpvdGdHUEl5eS80dWx5UmhGT0lPUGhFaFNjNmU4?=
 =?utf-8?B?eGhrUDFyc3JGMFkzMW8rcTV4ZTV1aWZ6anZuMWUyMUFuYlkyQ0pVc3BZaUFk?=
 =?utf-8?B?SzBSZGlCQlRGcnYxYS9XdXFTQWcrdEdXR1lmci9CUnZkeXpDRno0YXNYTGVV?=
 =?utf-8?B?TTdEczR2dmswaU5vYjYzUFROSTJyZTdiRDQyTWdydHliRGFUSmxmNFlGeFNM?=
 =?utf-8?B?MjcraXZ2Q1J4V3NERk1NZXljRFRWWUkxdzlVY3FMVjRQUHdQL0FjcEk2Qkt6?=
 =?utf-8?B?Q3N4SUtyRUkrbklwdTZKOFYwa09HUDZoei9Jc2VTcC9PZ2JtWjZmS0NDMEd5?=
 =?utf-8?B?dktVeThKQ2FtKzZBK0FjTG1DeFhZdHhnbEZqY3lSZ1BLLzd5RVlWdWpqWE4w?=
 =?utf-8?B?eFlhdUNESVZtUnE2bi93cE5XaDFsVHQxUTQ3QzdPM3BoM3BwczhzQTdwQThL?=
 =?utf-8?B?bDdsWnBkSWNmalV0bWU0S3lWbFQzSEJlZGg2RjJRL2dZRkxHbFNtaW5VT0d0?=
 =?utf-8?Q?t0RgAqkDbmxpfxWuz4VljLXBY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02e8228-d769-4f6d-1c8f-08ddf78022fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:27.3304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjBNEtbbeXCYmPLe59cNWLDcgVm+h6kCOkkgI7DBGlToREuoZQq/3qKLc/1l9qiJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290
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

On 19 Sep 2025, at 1:01, Balbir Singh wrote:

> On 9/18/25 12:49, Zi Yan wrote:
>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>
>>> Add routines to support allocation of large order zone device folios
>>> and helper functions for zone device folios, to check if a folio is
>>> device private and helpers for setting zone device data.
>>>
>>> When large folios are used, the existing page_free() callback in
>>> pgmap is called when the folio is freed, this is true for both
>>> PAGE_SIZE and higher order pages.
>>>
>>> Zone device private large folios do not support deferred split and
>>> scan like normal THP folios.
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> ---
>>>  include/linux/memremap.h | 10 +++++++++-
>>>  mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>  mm/rmap.c                |  6 +++++-
>>>  3 files changed, 35 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>> index e5951ba12a28..9c20327c2be5 100644
>>> --- a/include/linux/memremap.h
>>> +++ b/include/linux/memremap.h
>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page =
*page)
>>>  }
>>>
>>>  #ifdef CONFIG_ZONE_DEVICE
>>> -void zone_device_page_init(struct page *page);
>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>  void memunmap_pages(struct dev_pagemap *pgmap);
>>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgma=
p);
>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long =
pfn);
>>>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>>
>>>  unsigned long memremap_compat_align(void);
>>> +
>>> +static inline void zone_device_page_init(struct page *page)
>>> +{
>>> +	struct folio *folio =3D page_folio(page);
>>> +
>>> +	zone_device_folio_init(folio, 0);
>>
>> I assume it is for legacy code, where only non-compound page exists?
>>
>> It seems that you assume @page is always order-0, but there is no check
>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) !=3D 0, folio)
>> above it would be useful to detect misuse.
>>
>>> +}
>>> +
>>>  #else
>>>  static inline void *devm_memremap_pages(struct device *dev,
>>>  		struct dev_pagemap *pgmap)
>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>> --- a/mm/memremap.c
>>> +++ b/mm/memremap.c
>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>  void free_zone_device_folio(struct folio *folio)
>>>  {
>>>  	struct dev_pagemap *pgmap =3D folio->pgmap;
>>> +	unsigned long nr =3D folio_nr_pages(folio);
>>> +	int i;
>>>
>>>  	if (WARN_ON_ONCE(!pgmap))
>>>  		return;
>>>
>>>  	mem_cgroup_uncharge(folio);
>>>
>>> -	/*
>>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>> -	 * PG_anon_exclusive on all tail pages.
>>> -	 */
>>>  	if (folio_test_anon(folio)) {
>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>> +		for (i =3D 0; i < nr; i++)
>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>> +	} else {
>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>  	}
>>>
>>>  	/*
>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>>  	case MEMORY_DEVICE_COHERENT:
>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>  			break;
>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>> -		put_dev_pagemap(pgmap);
>>> +		pgmap->ops->page_free(&folio->page);
>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>  		break;
>>>
>>>  	case MEMORY_DEVICE_GENERIC:
>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>>>  	}
>>>  }
>>>
>>> -void zone_device_page_init(struct page *page)
>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>  {
>>> +	struct page *page =3D folio_page(folio, 0);
>>
>> It is strange to see a folio is converted back to page in
>> a function called zone_device_folio_init().
>>
>>> +
>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>> +
>>>  	/*
>>>  	 * Drivers shouldn't be allocating pages after calling
>>>  	 * memunmap_pages().
>>>  	 */
>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>> -	set_page_count(page, 1);
>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << ord=
er));
>>> +	folio_set_count(folio, 1);
>>>  	lock_page(page);
>>> +
>>> +	if (order > 1) {
>>> +		prep_compound_page(page, order);
>>> +		folio_set_large_rmappable(folio);
>>> +	}
>>
>> OK, so basically, @folio is not a compound page yet when zone_device_fol=
io_init()
>> is called.
>>
>> I feel that your zone_device_page_init() and zone_device_folio_init()
>> implementations are inverse. They should follow the same pattern
>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>> zone_device_page_init() does the actual initialization and
>> zone_device_folio_init() just convert a page to folio.
>>
>> Something like:
>>
>> void zone_device_page_init(struct page *page, unsigned int order)
>> {
>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>
>> 	/*
>> 	 * Drivers shouldn't be allocating pages after calling
>> 	 * memunmap_pages().
>> 	 */
>>
>>     WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << or=
der));
>> =09
>> 	/*
>> 	 * anonymous folio does not support order-1, high order file-backed fol=
io
>> 	 * is not supported at all.
>> 	 */
>> 	VM_WARN_ON_ONCE(order =3D=3D 1);
>>
>> 	if (order > 1)
>> 		prep_compound_page(page, order);
>>
>> 	/* page has to be compound head here */
>> 	set_page_count(page, 1);
>> 	lock_page(page);
>> }
>>
>> void zone_device_folio_init(struct folio *folio, unsigned int order)
>> {
>> 	struct page *page =3D folio_page(folio, 0);
>>
>> 	zone_device_page_init(page, order);
>> 	page_rmappable_folio(page);
>> }
>>
>> Or
>>
>> struct folio *zone_device_folio_init(struct page *page, unsigned int ord=
er)
>> {
>> 	zone_device_page_init(page, order);
>> 	return page_rmappable_folio(page);
>> }
>>
>>
>> Then, it comes to free_zone_device_folio() above,
>> I feel that pgmap->ops->page_free() should take an additional order
>> parameter to free a compound page like free_frozen_pages().
>>
>>
>> This is my impression after reading the patch and zone device page code.
>>
>> Alistair and David can correct me if this is wrong, since I am new to
>> zone device page code.
>> =09
>
> Thanks, I did not want to change zone_device_page_init() for several
> drivers (outside my test scope) that already assume it has an order size =
of 0.

But my proposed zone_device_page_init() should still work for order-0
pages. You just need to change call site to add 0 as a new parameter.


One strange thing I found in the original zone_device_page_init() is
the use of page_pgmap() in
WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order)).
page_pgmap() calls page_folio() on the given page to access pgmap field.
And pgmap field is only available in struct folio. The code initializes
struct page, but in middle it suddenly finds the page is actually a folio,
then treat it as a page afterwards. I wonder if it can be done better.

This might be a question to Alistair, since he made the change.

Best Regards,
Yan, Zi
