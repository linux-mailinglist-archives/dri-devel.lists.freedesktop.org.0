Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757EB595EE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46BE10E0C7;
	Tue, 16 Sep 2025 12:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YysSwm/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013020.outbound.protection.outlook.com
 [40.107.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A08010E0C7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxsdNdk6w69QZjgJnMnQI5qHkT5H3yLgRBwySohmlbel5I6LUpW11ZJCXg2MNulPpbuJu5y2aMVnTGgFIJ+vXXzRoZ9WlHYdbwHYZkf1MhYRxkoNGTE1fbrbFnLIUdQu8H1aBdLg/k1GdyjnjF2I/8cru1ylAUuZrnPI3DzKDnSZrLHa0sQBsLJb75JegzZR4Ht9lvpDMWAp8lp77WtThwCzTWsCTgD3Q5z5nrqf5tEsTM4L/gpcYadeoELsXaM78rSp3uHgeSbZXFMvTn07VIeBxkzZ9pJkrmr/2S9boElrZSx1NQ4c6In59FTC+51ToBKRvp+HSTkRcPzCu58K6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg+ea0eUAzgt43KP4cc3TjifBYM29vCCztFgQy+gQfk=;
 b=uE5UNjSkZ2dFmjN4GTTmMnwdRuiAsR7ocgsVGbWJVnpvkpzzNutki2vX8bqwjqa+k+ceHeJXiefaTTzzdSqCN3xoWl+Pjydg8WmTtIU6C8MCjauUtxOAHPQ/P4dnQALOG0Jnnivprxpfk7vn+sRNO6hZq6AsN8G7nbooUeyYer5mVqTzKxeHbev7M18spSplYkl0ZBrWniKxrrfO5j/ueNBIP3VuXIYaB3XPU5g3EV1kLQrd2KUPnSU5fBcK7BjqLK1VpW9MWDJ+KHGH+SbYHo4uHWfUq7ipHBKFtOynqLFgWasiIJGAyZ+0XSyjwd3U0pmkjfyRqRetvseSG1+BUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg+ea0eUAzgt43KP4cc3TjifBYM29vCCztFgQy+gQfk=;
 b=YysSwm/iISOpxAjgoxXG/LGhPAp06aGtoOLiqP1Es0j+nXqZlxfTwzMi/lDQkIV3yv341uUlDJeDdQBwyXvP5pzqk/2qdSOphEI0RTCG9pvONbmftNgn9HN/9xyNJmlFv4yZHeIDSMJi7rDd3wZPWjQ79ZPHwfeGS6tCIijpl//HbQZs/AJ7EB3LMFiu2xUJqDAf1y7emFO53PxiD+AR5bplnUP+YAawYIm5FjEEu5zANIZ+J42YyCU4jixX4HAAf2Z3eFVBak/c7S8iVSMLEeK+gxmVEqG6/wvPxqYTAGTK1IDyCTyPzp2jerC3z0r1rteSr3Sn5wTJG5xZ1BOhfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 12:21:35 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:21:35 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
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
Subject: [v6 00/15] mm: support device-private THP
Date: Tue, 16 Sep 2025 22:21:13 +1000
Message-ID: <20250916122128.2098535-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0086.ausprd01.prod.outlook.com
 (2603:10c6:10:110::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9518ce-46bf-4289-7e8d-08ddf51b9421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXBTL1BtRjhYOHVxL04vdWRmdkx5TzhYMVBSQmtRMEpQazU5ODdxUFJGbERr?=
 =?utf-8?B?dUhxM2tZeUVhZkxxOXJGZXNqQTBKZ1ZZVCtFbXVSZ3RHeXQyaEY1WWVxc3dh?=
 =?utf-8?B?QjROUE9tYUtOQnVQd01DTVN1VzhPdFBqUjNFL2YrdmR6dW1YTExKV1lnekVC?=
 =?utf-8?B?dkhUaFRaaFZEQld1YWpNM0FUUTVSS3VEcXN4aXZWYk05aGZwYzE2dGxvN2J4?=
 =?utf-8?B?Zkg5QXhhcTVqYzJ2cGlvUWxNT1hQU09jWHdRSWxENk9oUUlnQzY4aU9wNzM0?=
 =?utf-8?B?ckR0U0E5WjBVM1kxSVcxMm5NSERaWSs5Q0d5eVR2WWhJTlBVV0VZTEJEY05L?=
 =?utf-8?B?WVNZMTQzM2N1RG9OU3dhUUFQNm1WcUZvUGtyYml6d2QzUHRKQ0s4Y2Y5U3c1?=
 =?utf-8?B?VDZlaXNpd0E4dzYwVHkxNjMwM3Fob29QUlZXR3IrQ3RtY0NERWE4aExqY1V5?=
 =?utf-8?B?aXR2U2tWRXFEYThZM0laeFlUbmQySzM3cCs5cmhDSzRvOUpjeENQZGZrd01m?=
 =?utf-8?B?a3pTUEg3YlRYWk9CSlRWaDRRZVA1N1A3cGs0UjVOYUd0VldJVllPcDI0dGY0?=
 =?utf-8?B?SEk3VEovVlo1c2ZTYmJ0MkM1TmNvY3FTaGxaMkphUkQvRnUvMWZBa01LWGpq?=
 =?utf-8?B?cHBXaG90a1V6NDU5ajB3dUlldWtKcTlTNmZPTEd5QURoMGxSVk0yTlFGaUJ1?=
 =?utf-8?B?KzVnbFpIL0NFVmx4WlF0cW4rbFI1YnhFUStITW15ekRHL0hHZ2REYWdOM3JK?=
 =?utf-8?B?NE1rcSs1TStNeTd0TG5KdTNaRnZ3UTZNbFNVSmkxOTRibEhKUHZTUTc5SUda?=
 =?utf-8?B?MUdSQlByb0dSbTlBMXBLZGJwMlhNdTMxeWFWZHpBc1hFWkRqUkJ3Zkw5ZGhp?=
 =?utf-8?B?YndMQTh4SnBRUWhuMTVwTC9aY242ZmE2MVhHUXRvaUowTFU1UkVJNEtjV2VN?=
 =?utf-8?B?empPaWxFeUZLbDNmNWJhc1RVQlpQaFM2VjZwM1IxS3VNMW1rTUdtbFc1Y25L?=
 =?utf-8?B?NkVDWWVxZXJ5MUpIZVBtNjUwcVlEZzNxbG5HQkFrQWpjcUlsS0hJVXoxS0VU?=
 =?utf-8?B?Kzd6UHFzdG41ZEdETW5ibFVERFpFSE16d1VGbi8vZjNRK056ellsc0xNMlRh?=
 =?utf-8?B?NFY5QnZ3Y0Uxcm1aN3pPVGlsblhYUUdiSFJVVTlVY2Q2R0RVdlI4ZzVGa242?=
 =?utf-8?B?MlovSkVlbUxxM1ZzQjRaZmI1V2hhY2ZLbTJ3cEt4dncwZy85emFaOFRhb1dz?=
 =?utf-8?B?SVVRL0lWcEdzWTJSMUZlUE1tYVhUK0JmeGc3dTBGYk16TEt6ejNRQ1RLMFY3?=
 =?utf-8?B?ZUlnc0ZpbmwvZFl3azRNUTlyWVFmWm1lR3VncWtqNjA5TCsyaVd6Umh3bEMw?=
 =?utf-8?B?SHF2amtmcEo0aVNXZndGaHhDaDIrRytlVWdrdjB1TnZOb1BBZm9tTy9QSkFh?=
 =?utf-8?B?Qm9kYnBHWVI5TWZlR0FkSzhXVW5mUHlsRW1ZdWM1dzh1OUowWnd3RzB6Zkdu?=
 =?utf-8?B?TDJmRS9abjVXQStYY2lhUDNvREJjN2hkZGhXMGdtcXVEMVdnbWtFMXlHVXMz?=
 =?utf-8?B?U0E3MGJrM3dFYnpsRTBiWmlCQzBCZ09TZ00zSVlXajM5TU4rYSt1anA4bFV4?=
 =?utf-8?B?aVRiOE5HNHRsSWtSQmsrMGo3b3Q0MGxRZ2oyemJiRjRMZS9tcVpselBKTHVm?=
 =?utf-8?B?d0RXUUlLcExMTkFDUkJUcE1DUXV2T3hHMVpkWnUrWnVJV2E4bTJ6WGsvdWEw?=
 =?utf-8?B?SGJBemlQSWNJclI2Q1dkTTVwbU0xVVEzM1M5MUp1dlZLWTlmV2hRL3JQK092?=
 =?utf-8?B?R1dmcStxZzBKc3B0QXBKQ2tEWVZjSXRmYXZxMVBsN05YRk9sZS9TSHh1a2FM?=
 =?utf-8?B?QWk1OElDRHZINzhiaEVvTDN4OE5HcUxmZzJJTFFaWHNYZnpvTlVaakZLM1ll?=
 =?utf-8?Q?SfF4nqaVN+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkc3WG5FWW1TVXBOQmdBdHBnaWI2aXowOWh6RDBKUjhxY2tUNnlLazdGRHZC?=
 =?utf-8?B?RmdwNmhSbllOTldNbXZ3bzVGV1YxeHhHUEdHRUFod1lOQkdma2dQS3FxeUtC?=
 =?utf-8?B?RWNkL2tVMDdaMVFpUWdEUnRqZXRWbmJnMjR5SDVhR0gvSWt2WUdoUjhOajNC?=
 =?utf-8?B?Ylpzblh6bmMzNmFSVlJOY2tBN0lUMjRBVU5MYTdRSjZRdlJDTm5OMHBrUmJv?=
 =?utf-8?B?R3lSbkNyL05hbXVtV29IeTl0UHZZU2pFcFlMVVEwL1ArK3R5Wms4QXhRYk1C?=
 =?utf-8?B?OGl3RG95YWhuSURXR2p2UzNVMm9Ud1Y2VTlxMXBzRGFhVTRxWW9ETjdQU0tB?=
 =?utf-8?B?cUgvaFMrTE1XL1pvdlBwaXhxU25IUTRFU0pua2VGcnI2Y1liR28yWVJqdWRS?=
 =?utf-8?B?aVpNa3lZZWs5WXhHWXR0QzhCUzBUTzY0ekp0SEk2ZGp4MDdGdUk1MThQNTBz?=
 =?utf-8?B?RUpoM3NUcE1QTXoyOCsvZFVyeW5Uei81dWhTRmI4TUh6cXBaNmNvWE1OT2NT?=
 =?utf-8?B?MFU1RTA0QWpKTG9yZzJHUklLaXlZNVB0NFo0ZHh0MFI3dkdXL3JJSG96bHI4?=
 =?utf-8?B?bGU2c00ydVJFOFRBUGZwZ3o1SkduZ25iZmZCTUQvUUl6OEl0bjZsTlFibjFt?=
 =?utf-8?B?ZWVIa2tkWDBzTktCcFZRZEFHbWJwelVMbDVXVHI4MGxFV0I4NklhTHl2WndW?=
 =?utf-8?B?L1NxcUZOU0J2eHIvR2tKSEl6YW9IV1hsSDhhcjBNMFdhU3RneGJLVXNBNi85?=
 =?utf-8?B?T1dOTzZxUHBMMCtHbjZFMmN3UnJ4OVM5K2ZYZGM4YVZVYW9NTmpNckl0V0ZM?=
 =?utf-8?B?WGJRRTJHTVVZV3hMRGIyUWdPSyszWk04clF3dGU3dE1USTBpdjNINlR4ZFVn?=
 =?utf-8?B?TnM2cU1sTkx1N29ZRk5oZDFGQlNMdnd5TWxJQVJHSXduMm5tZTc5Q2svSHNj?=
 =?utf-8?B?S090OWs1MjlKRTBLOTBQOGw1OGs2b3ZNbElLaU1sSkg5RUdkQ0FramRHMFdn?=
 =?utf-8?B?Zkp4VmY1NmF5dWRRN1MwbFQxbXVSNGFrZ3YrR3pSRStVTURlb1RIaC9ycU1L?=
 =?utf-8?B?VmNHVHdFZ21yTnJSdDNlSVBVOTRuQUdXWk8rZEVXemV3MWQyM3d2UU5VdW5P?=
 =?utf-8?B?K3dtUWliUGZ4Y0lrTmZkMXAwcGtib1NSWDRzL0RBWm12VmFWSTFvV2FybG4v?=
 =?utf-8?B?UGdTVEZYVDAwWnY1U2FPWDNveHhadGFUU09NTmdNaDZzcWd4cHAwNGdiWkk1?=
 =?utf-8?B?aGdpZzlRUWxsRkRDR2pSQnd5NUhkTHRNRWgzNlRWeTRTRHRMc1hyODJYS1k5?=
 =?utf-8?B?clRqN1pPeFdUcUFMNVIrRFhrdUlIa2xJaHBOUDNoQzdnd3NYQTBaRXpLMmts?=
 =?utf-8?B?bEtRVkN2bmxQeVVBbU5hcVlCN0l0M3I5RHJDenVWODJBYjhNUnB4VkphUHEx?=
 =?utf-8?B?dkduYkV4WDhBRzB6Y0xjMWZJNWo2L2JJZHdIUW15TWlSbGwwRFJSTGp2VlFH?=
 =?utf-8?B?WkdiaTFmWmZITUY3clYxQVA3MlYrWU5tb1QrSGV6RG9QbDUyS0s5bTZpY3Y4?=
 =?utf-8?B?eHo1REtQdnY3bXNQYTFvRU9kWXI3anBZYldyQ04xVWV0cWRPMmVsbjVPUThU?=
 =?utf-8?B?K3crRENVbVgvT3ZxVVgvdkNGOTRNcXc2enphcURVK0V1VWlFdjZwZzNYWGxH?=
 =?utf-8?B?SEVRQjNXeFhMb1EwSGNOV2g1dWo2NkFrVkVzVGpRVkZlY1V1b0hIZHpNT0VT?=
 =?utf-8?B?TlR6MzBoU1NsTDdhdEZpZVBnK2lwcFptRGJEWFBqbUgwYjkwc3o2K09EZk1Q?=
 =?utf-8?B?VHI2NUMyd25oTi9aNEo1cXZqQ1FDN0luQm1ZbmZ1c28rMWV6N05ibTZvSmhP?=
 =?utf-8?B?SXpQOE1DSFF5emhxL1dlQzJVZ2FCcTBFZ3FXNVZ6ZmxwcmJ0M2s0ekEzcVVL?=
 =?utf-8?B?WnpqQXZIUmw1RDkvSzdma0RRN2ttUFlhQWlBVDlJS0ZrSnZvMUdGMG5HVWlI?=
 =?utf-8?B?SUkwSmpqbS8zaTVBVkdJdFZFbDZMZjFmZ3BNckZvRlE3SlJ2RDc4V3B5SENr?=
 =?utf-8?B?QXhsaFZsalpKR1MvZ01XdE5VUzY0MjVJTXBENE1nKzN5enAvM1dMU3lhSjNj?=
 =?utf-8?B?cDFDY3RmR2s3RUZ0K3JvZ2paZlhsOFlQMndtY0xaWW9GOUkxbHphbVpWQ1lh?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9518ce-46bf-4289-7e8d-08ddf51b9421
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:21:35.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDppgrUHIImX+fs3LgwVYf8vCf9PaAV7gjCwT+Nu6AsAsl/W8mt3itfUkk5I2qrJvHgLyWFCVrtNV4yi9qmCJQ==
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

This patch series introduces support for Transparent Huge Page
(THP) migration in zone device-private memory. The implementation enables
efficient migration of large folios between system memory and
device-private memory

Background

Current zone device-private memory implementation only supports PAGE_SIZE
granularity, leading to:
- Increased TLB pressure
- Inefficient migration between CPU and device memory

This series extends the existing zone device-private infrastructure to
support THP, leading to:
- Reduced page table overhead
- Improved memory bandwidth utilization
- Seamless fallback to base pages when needed

In my local testing (using lib/test_hmm) and a throughput test, the
series shows a 350% improvement in data transfer throughput and a
80% improvement in latency

These patches build on the earlier posts by Ralph Campbell [1]

Two new flags are added in vma_migration to select and mark compound pages.
migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
is passed in as arguments.

The series also adds zone device awareness to (m)THP pages along
with fault handling of large zone device private pages. page vma walk
and the rmap code is also zone device aware. Support has also been
added for folios that might need to be split in the middle
of migration (when the src and dst do not agree on
MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
migrate large pages, but the destination has not been able to allocate
large pages. The code supported and used folio_split() when migrating
THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
as an argument to migrate_vma_setup().

The test infrastructure lib/test_hmm.c has been enhanced to support THP
migration. A new ioctl to emulate failure of large page allocations has
been added to test the folio split code path. hmm-tests.c has new test
cases for huge page migration and to test the folio split path. A new
throughput test has been added as well.

The nouveau dmem code has been enhanced to use the new THP migration
capability. 

mTHP support:

The patches hard code, HPAGE_PMD_NR in a few places, but the code has
been kept generic to support various order sizes. With additional
refactoring of the code support of different order sizes should be
possible.

The future plan is to post enhancements to support mTHP with a rough
design as follows:

1. Add the notion of allowable thp orders to the HMM based test driver
2. For non PMD based THP paths in migrate_device.c, check to see if
   a suitable order is found and supported by the driver
3. Iterate across orders to check the highest supported order for migration
4. Migrate and finalize

The mTHP patches can be built on top of this series, the key design
elements that need to be worked out are infrastructure and driver support
for multiple ordered pages and their migration.

HMM support for large folios:
Currently in mm-unstable [4]

Cc: Andrew Morton <akpm@linux-foundation.org> 
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

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/
[3] https://lore.kernel.org/lkml/20250703233511.2028395-1-balbirs@nvidia.com/
[4] https://lkml.kernel.org/r/20250902130713.1644661-1-francois.dugast@intel.com
[5] https://lore.kernel.org/lkml/20250730092139.3890844-1-balbirs@nvidia.com/
[6] https://lore.kernel.org/lkml/20250812024036.690064-1-balbirs@nvidia.com/
[7] https://lore.kernel.org/lkml/20250903011900.3657435-1-balbirs@nvidia.com/
[8] https://lore.kernel.org/all/20250908000448.180088-1-balbirs@nvidia.com/

These patches are built on top of mm/mm-new

Changelog v6 [8]:
- Rebased against mm/mm-new after fixing the following
  - Two issues reported by kernel test robot
    - m68k requires an lvalue for pmd_present()
    - BUILD_BUG_ON() issues when THP is disabled
  - kernel doc warnings reported on linux-next
    - Thanks Stephen Rothwell!
  - smatch fixes and issues reported
    - Fix issue with potential NULL page
    - Report about young being uninitialized for device-private pages in
      __split_huge_pmd_locked()
- Several Review comments from David Hildenbrand
  - Indentation changes and style improvements
  - Removal of some unwanted extra lines
  - Introduction of new helper function is_pmd_non_present_folio_entry()
    to represent migration and device private pmd's
  - Code flow refactoring into migration and device private paths
  - More consistent use of helper function is_pmd_device_private()
- Review comments from Mika Penttilä
  - folio_get() is not required for huge_pmd prior to split

Changelog v5 [7] :
- Rebased against mm/mm-new (resolved conflict caused by
  MIGRATEPAGE_SUCCESS removal)
- Fixed a kernel-doc warning reported by kernel test robot

Changelog v4 [6] :
- Addressed review comments
  - Split patch 2 into a smaller set of patches
  - PVMW_THP_DEVICE_PRIVATE flag is no longer present
  - damon/page_idle and other page_vma_mapped_walk paths are aware of
    device-private folios
  - No more flush for non-present entries in set_pmd_migration_entry
  - Implemented a helper function for migrate_vma_split_folio() which
    splits large folios if seen during a pte walk
  - Removed the controversial change for folio_ref_freeze using
    folio_expected_ref_count()
  - Removed functions invoked from with VM_WARN_ON
  - New test cases and fixes from Matthew Brost
  - Fixed bugs reported by kernel test robot (Thanks!)
  - Several fixes for THP support in nouveau driver

Changelog v3 [5] :
- Addressed review comments
  - No more split_device_private_folio() helper
  - Device private large folios do not end up on deferred scan lists
  - Removed THP size order checks when initializing zone device folio
  - Fixed bugs reported by kernel test robot (Thanks!)

Changelog v2 [3] :
- Several review comments from David Hildenbrand were addressed, Mika,
  Zi, Matthew also provided helpful review comments
  - In paths where it makes sense a new helper
    is_pmd_device_private_entry() is used
  - anon_exclusive handling of zone device private pages in
    split_huge_pmd_locked() has been fixed
  - Patches that introduced helpers have been folded into where they
    are used
- Zone device handling in mm/huge_memory.c has benefited from the code
  and testing of Matthew Brost, he helped find bugs related to
  copy_huge_pmd() and partial unmapping of folios.
- Zone device THP PMD support via page_vma_mapped_walk() is restricted
  to try_to_migrate_one()
- There is a new dedicated helper to split large zone device folios

Changelog v1 [2]:
- Support for handling fault_folio and using trylock in the fault path
- A new test case has been added to measure the throughput improvement
- General refactoring of code to keep up with the changes in mm
- New split folio callback when the entire split is complete/done. The
  callback is used to know when the head order needs to be reset.

Testing:
- Testing was done with ZONE_DEVICE private pages on an x86 VM


Balbir Singh (14):
  mm/zone_device: support large zone device private folios
  mm/huge_memory: add device-private THP support to PMD operations
  mm/rmap: extend rmap and migration support device-private entries
  mm/huge_memory: implement device-private THP splitting
  mm/migrate_device: handle partially mapped folios during collection
  mm/migrate_device: implement THP migration of zone device pages
  mm/memory/fault: add THP fault handling for zone device private pages
  lib/test_hmm: add zone device private THP test infrastructure
  mm/memremap: add driver callback support for folio splitting
  mm/migrate_device: add THP splitting during migration
  lib/test_hmm: add large page allocation failure testing
  selftests/mm/hmm-tests: new tests for zone device THP migration
  selftests/mm/hmm-tests: new throughput tests including THP
  gpu/drm/nouveau: enable THP support for GPU memory migration

Matthew Brost (1):
  selftests/mm/hmm-tests: partial unmap, mremap and anon_write tests

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 304 +++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/huge_mm.h                |  18 +-
 include/linux/memremap.h               |  51 +-
 include/linux/migrate.h                |   2 +
 include/linux/mm.h                     |   1 +
 include/linux/swapops.h                |  32 +
 lib/test_hmm.c                         | 443 +++++++++---
 lib/test_hmm_uapi.h                    |   3 +
 mm/damon/ops-common.c                  |  20 +-
 mm/huge_memory.c                       | 292 ++++++--
 mm/memory.c                            |   5 +-
 mm/memremap.c                          |  34 +-
 mm/migrate_device.c                    | 611 ++++++++++++++--
 mm/page_idle.c                         |   7 +-
 mm/page_vma_mapped.c                   |   7 +
 mm/pgtable-generic.c                   |   2 +-
 mm/rmap.c                              |  27 +-
 tools/testing/selftests/mm/hmm-tests.c | 919 +++++++++++++++++++++++--
 20 files changed, 2392 insertions(+), 395 deletions(-)

-- 
2.50.1

