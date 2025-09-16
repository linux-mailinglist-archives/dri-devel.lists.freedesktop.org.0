Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689AB595F7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD59A10E7C0;
	Tue, 16 Sep 2025 12:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vaa2vcj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013007.outbound.protection.outlook.com
 [40.93.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FCA10E7C0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQnUhcK3N3GGd7Vt+PTVzCWJJtchGECkxF0F4CA6BqOEJ51VuSIvHMyx9pqP903OXLm5Tz0yWN+By70+N3Ht56s0lVLOPsDShw1igxOiP77JyZ+bJaGqcBu9qFWd+XkjThFlbKkzxt4cHmdiLO5OVAem24DSHnzzEWSE96OA3B4wDorm7PsSqO2jG5RCLmb8A8Y+1+2dNzCwe6IGfPpMUcZGE13m5nGwWb0dp12qDlEAJI07DiXcodHVWYhvTACCQwTZXR+ls0VKq8Zg5W9xysfhB5Eb0yanf80Kc9RXPCl19DLCjn0ZXWJLOTTA4sG7+oKD39Wz6roSRZljXaBY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbebhi4rDi+2+9Ux4+5dm70Z2XmVj0OLgUYznIlY3V8=;
 b=fOd2XRZaBWCxT7YrRHWOkCzEY5uGCoIk4ZR3WiPYcamqYq9zD4ZqPxZk6YC4gVc6A2A1NyTUiYrQaOHLA3Syan3mAOFXCqm+w6bP+ug8n1XfmvUNWtbvSbsOiMDauEBQmSCjiWU20yNSM/DMYGpvMjwPywu4mNvUCqp1i59qPEIToOcSFPGbWFOeZKrMMjKAMTKo1tsD9ku0imcx0KatJxZiN0JYOrzUoJsaTRmh0vue04jC8Q2CffI/TJAvz5vzKAwZM/Gyaa/pcXhxRSJCkR3HxADp905EeEhJO2OZvFMyhFbp/lTPXTLOg4cbpJmhgvLa9cnPTVUJuqvjElhKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbebhi4rDi+2+9Ux4+5dm70Z2XmVj0OLgUYznIlY3V8=;
 b=Vaa2vcj/qrEEb3nOCbUC476hQ0FvTlBQFU1UpUpx+c6Jhy0onmW+AZvJ3vif7ZmmxrAo5Y/Z1UX/VQsMLAPjup/cwyig+jDW93B/gQHhQSV2ewFXypq14A4njtTsroWINM7Q7+ChfvAlALM4NkWKOIWg/wfAAESYqCMU+WHBnZcWDJXqcJAQAp0yxTv6q92Ofb4pCQZ8idYkukY6VT+8PGhXCIVl6IWDVGUO4Pl55m12jiPWu7j1YH/GN59L0jSAryx8Ryyb7Qp9HQuA7A8ohxKhjoyEag5gswr/xuUk7aMOduK+p+/Z9EruZuw+dHa8liVdq2Ie+mkUpz5fhy/rKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 12:22:00 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:22:00 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v6 07/15] mm/memory/fault: add THP fault handling for zone device
 private pages
Date: Tue, 16 Sep 2025 22:21:20 +1000
Message-ID: <20250916122128.2098535-8-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0098.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:248::21) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: dc285ea2-53c9-49b7-e258-08ddf51ba2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDRUbkQxSGkvWWsvUUgrOEo2SmEyNlcyWFVjNE1vbVZudjZkSjBKN3FkM2pk?=
 =?utf-8?B?dm9uaUpadjM1S2tRV1R2eHFka0ZJbloyaFRaMUMraFFXaUE2V08raEJhdUJI?=
 =?utf-8?B?UU5QVktWdTVTUXN4WlVNOGR0S2FrSWpNRFowbUZHR0p5NnB5RDJUcGlNODNl?=
 =?utf-8?B?ZG9DUGJ4UU1KVUxTckMzbGxrM1JyWXpqMXpTczIybFNvMEZ6VVVGaS9ianFO?=
 =?utf-8?B?N0VOS3VkYVpqaVAzSDZvMWNYOFc0MzIrcEl6Q3JKSHUvUnRGQ09rK1Z3QnV4?=
 =?utf-8?B?UUtzWUFoZGg1QXk3MlRxeHUvTzF2SVI2SDRvOHJuZ1IvclBtK2VnT1k5Q2hl?=
 =?utf-8?B?OE5ob3puNm43UE0zYUZjQjRHb0p1anZZelRrQldkQXNaMWhWQW1pMFRaOFh2?=
 =?utf-8?B?aU9RTnpJdE15SDdBZWdvdWtvRzBIbVE0M2V1Rm5aendOd3pzcmJ2cG16RDU1?=
 =?utf-8?B?UnlvbVNGcTZLcjU0UTdZN2QxU3hrcTZIcjIzZ2JpbjdUazRrQ2JoT2REcVZx?=
 =?utf-8?B?QnFGQXlsZ201U3pDR2VXN3d3Tlp1VGIxVnNnQnlGT0ZxaXM2UzNoM2NySk5j?=
 =?utf-8?B?ekI4ZitudVlINElUVWhja0xHRzVBcEh1WEdoZVdyTDczaThGTllDMWtFR3Q4?=
 =?utf-8?B?RUltNXcxNlpvTXdCdE1YUE15cC9WMnVLSFdaZHczR1FQUkI5dnNudzhURmtF?=
 =?utf-8?B?SW5aR3oveTB1NGdwY3dPY0FhZmVIc1NtWVMzcFdYNmtJeEMvc2pZM3FHUC9y?=
 =?utf-8?B?VnQvOGh0dnl5Um1MWkVDU3pocXQybFkwM29BSzhDZmlUOE9yUkVsUnhITW40?=
 =?utf-8?B?VGZaWTVZWEJvdTVKM2FwVm1OdkpRSm03M0E4a2JSM203enkyZ05JRmdIQUg4?=
 =?utf-8?B?dlFMS1ZNWnFQZFF5YVRJSlREM3YzUnFtWWI2SklkZXZ4a3FXNFoyVjVKNXFU?=
 =?utf-8?B?aFQzQTVFaHBzK25DUVpWY01YZFBpODlCNnU4cjYwUitlR0V0T25Gc3Jyc3lI?=
 =?utf-8?B?YTV3VHdzWDV1Zk1RTWtEZS9DS2dKUTZudUhILzlDSXgxN3hveUZMYnRHcnZI?=
 =?utf-8?B?anBYM1FmUkNtOEVFU3d2NEtoS0xqdXgwSEJuRytDTFNxYXFvS0ZHSy9OdU0v?=
 =?utf-8?B?UFhZVEoydkhlZUkvUjFWa0NDck4vdGlUQmN1RUU3bXJaZEFQVzR6NkE2Vm1I?=
 =?utf-8?B?UjZycHI5MElzYjhsdGlnYWZoVFNjTFE2MEVEcFhZaER0N293U3lGYkZqb0JW?=
 =?utf-8?B?a1lRVEMwNTNjMlVSd0VSVE9TV3dSdDZSQXVTb0E3bDFmcHZXV0F1dFBIQW5a?=
 =?utf-8?B?cGorbTNoNzZMUERCSGkwYjRvbnhiUzZtRXJRbElqVkltWWlqWG1ScHZBanJz?=
 =?utf-8?B?Zit5VWVOaHUvQ1lwMTdNbiszcnZheEEza2FFaUVoY1hNc0M5MTZwTFFMa2VX?=
 =?utf-8?B?NUFjMTVaeUN1SkFwaExsblVLdUJsaWlaNmRZMFlKWTZ0NWNrNWhUME9lUDRH?=
 =?utf-8?B?VS9hQmd5OGRrc0JjcG5WT1lteXRMMDBVWDAyTTJSRUdzMkova2l1bjJhRnBB?=
 =?utf-8?B?bEFBc2FjZDN6RUdnMEo0aFZwT2N3blgxSkJzZTNhdE5LdU5VWFdyLzA2VHdl?=
 =?utf-8?B?L3ViNlJvSWVXaXhZT3FJQlljbmVrMXdyL2tmN1ozMzZaT2xpeXlLRlQxLzBF?=
 =?utf-8?B?aHlyd3pSZEVqaW0ydDhUbW00SjRxcTNDVTRiSkFJeGZDRm5JdEQ2V3hVWmpp?=
 =?utf-8?B?VW1iZkR4UWJ2K0lWdEdybUtZM21iSm91eEowY0Y3YjFTVzhnejcvSmk4UWlN?=
 =?utf-8?B?a2xsdEUxcndaa2drbnAxYitoQzl0ZjFOWloxSlpNRGI2blRyY3ZJdzhlbGtD?=
 =?utf-8?B?bnpybFp4UE9PVlAxQ2ZNSXROaUJHWCtQYkw4K2dRWVg3NndvRms5dHF2TXpi?=
 =?utf-8?Q?Ck4WPLeLhBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0taNkR3b0w1Ui9lMC8vdmpPNmJBU011L2pYUDUzUS9ZaUdYRVJUdEhpdFdT?=
 =?utf-8?B?ekdqWEVHeDlKeUp0WWVNWExuR0pnSUxWVHlhbkZrUHQzcllCek9UU3E2YTM0?=
 =?utf-8?B?T2dzWkRFVGptcmZKVVB1V2xwZjZJcGw0dE9vMDdvM25mZkMrSHZxaG1qRk5i?=
 =?utf-8?B?ZnBraWhyRk9ldDdBZ1ZYdUsxWDFmdkM1RWxtUlVJejl3MmFHSW5tNzc5RitC?=
 =?utf-8?B?QmNtMmRqc3JCKzA5djk1OFpjNGw0MU5VNW50YVU4Y2lyVU1peEpPU1pvWTI0?=
 =?utf-8?B?czlIK20yY2pLYXROeUdBaVpDblZ0cS9ySENoN1BGOWJQRGUrcVgvM2x4TDhq?=
 =?utf-8?B?Q01wR2xjWlBDNS93L3crYTZEdFM0NFZPSVRZU0dYaExsZm1VTGhrVjN6RFNI?=
 =?utf-8?B?SllhUkw3NDY4V0lTdk0zSXZMWXJiTS91dGtKVGxkMi9ieEZJdkFGSFF1bEV6?=
 =?utf-8?B?a3hva09EQlF3U1huTkIzeVJCc0J0WFBvZU1EYmhtOVBpMi82NnpnUlJRQW54?=
 =?utf-8?B?R0ZxZGxIZDE1YjJSZzFES0pGMERDVk5CTVBzcFc4cXRRcERYTGRqclhhTFM4?=
 =?utf-8?B?VWVKbmRkTVBLN2VQaDBKRFkyK09xQ3pYUXlGU3NOeUNXUkhKVUFFUzZjK2ho?=
 =?utf-8?B?OHdTZDc1bTI0cGpIRUJjbG83dWNPMmhVeE80S0wraVJqeXJLT01tNnZITXMw?=
 =?utf-8?B?TUI5Y1JORnQwZm9ZaUxQZ09BZnVnRU9mVmc3dEo0V081bzZkVytFOXo4RGln?=
 =?utf-8?B?TjVaTEI4NG1ORVZPbnRMUHRsVVVrVU5xSVpIazlvdGNFMjE2NFFWS2xnWkZv?=
 =?utf-8?B?QkUxc3RlVS90RkFRZmVMNDdYU0o2alUrQmlPWXdxNUJSUzZoa1NEVUkvMi8v?=
 =?utf-8?B?L2xHeENUMDBpOVJBakRHblRCNkJ0Tk12M2QxS1RzWHlBdXFNcERNVGdqWmJL?=
 =?utf-8?B?d0Nad01yUGdGeVE3SmF4SWxCRXhaamxxVXpsQTFucDlLWWN0dk9GK0ZmMDEz?=
 =?utf-8?B?RDJaRVdXbHNkeFRrVWhJM1J2eG0rQ0ZCQVFWVmhReldvOTl1R1N2R2VFZ2N1?=
 =?utf-8?B?bmpISVo1S3NOTGw5TGVVMmg0UU9uQ25GTDB0NW1sL3c4ZElxZ1Bjak00bGd1?=
 =?utf-8?B?cTRjVW9nQitBcjFnL0o2KytaeXVlMEZjNG41QXoxZFowdk1mYmhjZjVjRSsx?=
 =?utf-8?B?OXFMOE5ubUkrelVVN3QxT0VXRkU4OHdlZjlLdWdRQnRRZ3FyMlE4bU4zczRj?=
 =?utf-8?B?NytteWw5NGxRRnpMNW1zWlo2UmphTm9IaGVYazNTTjk0aHBNdXV4Vnk1NmM0?=
 =?utf-8?B?eDUzV2JheXh1enZnQUhMRWdIRXhreTMzVDNPVVU2YmZnOERYT2x4MFR3YUhr?=
 =?utf-8?B?c0R1T1pvUDBsUW1EYVdxVUJqWDN2MHJDdkFZM1hlODNyZUhWUUU3VWVmOHNF?=
 =?utf-8?B?Z2ZnV1I1Z1J4L01YNjN6WVQ3NzI0cUE4K2pGaVh3NVM2d3NVazJSUU90dVRl?=
 =?utf-8?B?ODFheEpFS2s2L2hWUzlzYi84Y3FkeHhVSC82d25zVnpWRjFxa0Y1MWZlK09C?=
 =?utf-8?B?eWxoNTNHcC9mYnZtTDIxaHExTmZrYU9SN0U3bFd0VlRtRjAxQXdxZnNYalFl?=
 =?utf-8?B?dDdZVmhyUGNySzgxRngwR2s4Z2hQN3NvbXF3b216R2NGSkhhTU5ReExuMjFO?=
 =?utf-8?B?b01FS1gvbmRSNThYbDJjTUZlR3lxdUNvWlZ2WTI1UFdMLzFwN1pkamNZLzU4?=
 =?utf-8?B?Y2M1YVN1Yllxd1J3akVCUWE0Q1F0WHhlY2JSVURVajM2Tk5DRm12TDMwd0Vj?=
 =?utf-8?B?VjNYVTRLVTdUakpIY1dFSXN6WXhnckhHZUtEZmhhVVpKSFkrQlBWNXhZOWxY?=
 =?utf-8?B?WXBkdUozQ0l3b3lKeDdrWWt4dEtyNHJkNmxvNzJQaEk1aXdqTWpnNnV6eEdW?=
 =?utf-8?B?Z0Nobk0xQURWU2hYallaS0w0b0kxb1JnenFtb3IxK1RsM1hJTkpDTW45TDY5?=
 =?utf-8?B?VSswZ0dSb0NDWXhvVVR2S2R5WktYTDZ6Znd2WE9HTXFweFV3SXA3S1p2cC9C?=
 =?utf-8?B?cW5TWGdkQUhSb0Znc2pBMjAxZjRSU1NSd0pFMUorcEZHd1BBV0VrUlVBYjBR?=
 =?utf-8?B?UnBBR0w4L0JPWVVGNDhsa21SZlhYR0djOFAyUy9vSlNhM0E5dENJS3VSTDU2?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc285ea2-53c9-49b7-e258-08ddf51ba2f0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:22:00.5977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI5Ux/yA01Tb+OV7xOTzzlFiBO1MIRoFDdWvQeJICm9gv3N1Ylcp6+bOpHfLZ2FdU70MyAFJPI2lJDkE1yNo1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

Implement CPU fault handling for zone device THP entries through
do_huge_pmd_device_private(), enabling transparent migration of
device-private large pages back to system memory on CPU access.

When the CPU accesses a zone device THP entry, the fault handler calls the
device driver's migrate_to_ram() callback to migrate the entire large page
back to system memory.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 include/linux/huge_mm.h |  7 +++++++
 mm/huge_memory.c        | 36 ++++++++++++++++++++++++++++++++++++
 mm/memory.c             |  5 +++--
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index f327d62fc985..2d669be7f1c8 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -496,6 +496,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
+
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
 
@@ -671,6 +673,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	return 0;
+}
+
 static inline bool is_huge_zero_folio(const struct folio *folio)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5291ee155a02..90a1939455dd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1287,6 +1287,42 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 }
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	vm_fault_t ret = 0;
+	spinlock_t *ptl;
+	swp_entry_t swp_entry;
+	struct page *page;
+
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		vma_end_read(vma);
+		return VM_FAULT_RETRY;
+	}
+
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
+		spin_unlock(ptl);
+		return 0;
+	}
+
+	swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
+	page = pfn_swap_entry_to_page(swp_entry);
+	vmf->page = page;
+	vmf->pte = NULL;
+	if (trylock_page(vmf->page)) {
+		get_page(page);
+		spin_unlock(ptl);
+		ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
+		unlock_page(vmf->page);
+		put_page(page);
+	} else {
+		spin_unlock(ptl);
+	}
+
+	return ret;
+}
+
 /*
  * always: directly stall for all thp allocations
  * defer: wake kswapd and fail if not immediately available
diff --git a/mm/memory.c b/mm/memory.c
index 39ed698dfc37..912c4f3367a4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6332,8 +6332,9 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
 		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
-			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
+			if (is_pmd_device_private_entry(vmf.orig_pmd))
+				return do_huge_pmd_device_private(&vmf);
+
 			if (is_pmd_migration_entry(vmf.orig_pmd))
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
-- 
2.50.1

