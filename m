Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A3B21AD4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0683D10E570;
	Tue, 12 Aug 2025 02:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lMbXMniB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9329B10E571
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6W8eZwVmtNoI+eaElKmHK+Oz1lAsU5PfNT0/wSZe/0sbJ6lhPnWUe9Ic+CgDayxCjZA4rzMKGs0DnrxJBMi/FqJmtWMYUc791OE3siHQAFPoVWhvD4ZNBfA6dHGP8B6YC3UDGtnPPChysCtSFRhBcIyGm4yL1hzeNBhAXEWY2/DxRZ6V11qbq5k1HanbliUXOCIL16mcTLzUzVSte6cYHIeIEo618aCUHYntcmXeimNInYwYp9JMoOKiYhWMPSa5QEpXh4NpxCZYRD2rrGN8k8I2KrDVvHAFey2IP6ycmM8FaNYxRmkeTHLwNb85JB94G0Ybgzv6LcputGzDxuFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wepY4811lCD/cHhl4YfPbchgnSW4Dq67Ffvdh3Ykvx0=;
 b=LMCimuX9i0gOiODUEsgiPjrc1PcDYrRSWymPdEKTZ69ghquIBIil6FiYPVf7Q1lnzs9v7uKc5KHgeDB/Y5IoM3XEcz2W1Wl0HE+7GixQoGHQOht4OS4b0PoNHzo9ZdebFw8iU4lLgyD2VdP+HSmiv6GpPkPGLxnVV90+IXhyfGAtZPugb+9ekPjF/22fwWSkq4L3CV9HyBrkaYx0XzTB3tceaMaQ+037iz04bZpAshnqgs8uhhSSCOqZrJty70lWteFKXUhs5Jl+11QCTr+qcQdw8vdZg6lZdTGfEhTKD1FkECJRqW+3qmh2eUiZCYeCAy3OyC0AR+FoSNaplNZqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wepY4811lCD/cHhl4YfPbchgnSW4Dq67Ffvdh3Ykvx0=;
 b=lMbXMniBtFEDe/ocwmAPPBJUuq0WFvUBzAszULztgnvBASwGhTXgm9mTDgm3jjnaWlTx4WIwt7UtOWTywbP3vLXAbkBc/ubLO72OMDGDALrKi3AqwRFc5zWpAX3o90VJwHtvOvKd2PKU3Q4tRf+qOvlcXAWSzt+EPng8nWgmb2B8hP9WFpyAtAH832W5Luy4rW0UXBUE8lQXaSQBk4M/jRmt83+uM6LyswHNj9yqDbXJbha/u91uVfWPwUMaU48K1akOuGyuOmI/qVVF2We9pUyR6kJRGUnG1heLLqys/HCdKT/bINtawe+y16zFfcUqbk3s61pnHq234ov4YoXG5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 02:40:48 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:40:48 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v3 02/11] mm/thp: zone_device awareness in THP handling code
Date: Tue, 12 Aug 2025 12:40:27 +1000
Message-ID: <20250812024036.690064-3-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:180::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9514fa28-5d3a-49d8-f660-08ddd949a4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WklhS3Vpcmxuc2c3NTJzdS83bEs2Y3l2Z21VZE1sWTFlYUtERDg3QldCNVVk?=
 =?utf-8?B?ejUxQ0xkVGYwTUZ3V2RvZU5xU1VISWxONzlZY0dqaDRZZ2ZKaC9NdXNVK25N?=
 =?utf-8?B?Yjljb21BcDc5VVZsV2kzSUJxWnVsMUJuTHk2VHZkd1BvNXY2Q2NGcXdNOHZh?=
 =?utf-8?B?M3RWOHcyY3FyRm5PREhHMWhFL3VFbmE0VWlRZWJXUXJieUVid1NWSkg5V3ky?=
 =?utf-8?B?OU96QXZhdDBtSWhNNERpMzdoWWNHZXh1eEZ5cHZJVUttZ00wSzdBR2x0em9w?=
 =?utf-8?B?VmM2Qk42bEFpMVNxeHI1RTBGY0RpSDBKTEdkRUY2MzZZMDFUNURKTW5jYXc4?=
 =?utf-8?B?T01hNlp0S25Vck9Ga2ZHQXF6dXZkNzZGV2VrdkNobWZYUUQyeE5wTTg3RHBk?=
 =?utf-8?B?Y1ZTY21IWUFJWDdULzRrM1BLdkVzQnhvTWd6b2VkU2Rzb2ttVlBwTWd5ZWhv?=
 =?utf-8?B?N1Jqcnh0WmlGcDNYVWYvMDM2b0lRMURTRjFJWEUwYkQ5dVlEeGpvOVVLWEpr?=
 =?utf-8?B?QXdTZm9DN1lnWnBPbjFWMFZRUTYybFdnTVc2SDVsaE4rajlxQUFSdEZBeVY0?=
 =?utf-8?B?b1J6NGpYK3JwNCtpRkNwSDhSLy9EWWNaTDUyZndBS3ZhalhlNTlpdG4veTM5?=
 =?utf-8?B?M1JXcW9DOTVKTi96VDJPYUo3QzErdFVkdDhNNGhzQVA0NFlxbkQ5QVlzdk1k?=
 =?utf-8?B?dndlc3VvS1EzUTgvRHcwM0lZMkd4YXVaRHh1dmFHR1hDSzdsYjFWWmh2ZjNO?=
 =?utf-8?B?SldkS2NURCsxUGRUNENqNWhEajBVb0FuNFlMZndHZ3ozSGREei8zWUNjTVFL?=
 =?utf-8?B?YjU1YlpHcW9hNzliSWRFend0SGYyTTZLZFVXZFRBUzEyWmxpSlA5djFEbmt0?=
 =?utf-8?B?YTFkQ3RiWUtoS00xbzRwNzVlV0RZUEMzQUxmZEZ0VVFlR2pIbnREM3k2bVhy?=
 =?utf-8?B?MHBibURhZ2NmcnBsQ1A4ekdHaEVTMnYrVDIzT1BZZVlWMnBIQ0ZaTEptWTI2?=
 =?utf-8?B?ZFQrMHJUTFEybTNlbkJEYmVzUjV2WHdnaGZIN3EvZmJHR0UxU0VQWUJROEN1?=
 =?utf-8?B?VkNVNjl0RTdjTWlER3JoWDVSNXNveW4xeHBnd1ZCdVBzQW84Wkc2U0hKZlBR?=
 =?utf-8?B?cXNVZ09WWWdsVDFta1FwOFY1SDBpUlExSXRKdXcxRmw2T0Z4OEJnT3hBcklq?=
 =?utf-8?B?S3JYTHhhZG54c1Vud3MzWmlma0xCNG5CTHc0NHNnMVB6cEo4NWxxd3AwYkJv?=
 =?utf-8?B?dHcvWDNJVFpqTWg2bnp4Z2FTeEpLaXpFbU9ncStXWWhNR0ZzZGRGS1lXNjM1?=
 =?utf-8?B?TjhaUDJKVmViMEhFWTR5OUVuZWdqNkkrUUEzNkxsd1FXVUNPcHh0WmVWcnlE?=
 =?utf-8?B?TVJYdVIwaXdWWkhHMGdHNHFQbTZoc0x4VzJGNHl5MTNnWnRyWVdPUXp2RHo2?=
 =?utf-8?B?bGlwR2UvL1FzUmlkYXFEeVB3M0phQnJKd1AvWitTSmJSa2l4bHVrZXo2QndF?=
 =?utf-8?B?YTUyQ2h5a1RNdXZqYnBJY1pjZGZjbTVHalFPWjArQzZWaHRDbDZ6T0tUUW82?=
 =?utf-8?B?U2ZsSVlSYkxzN05WZERvZkptK2pDcUJ3Rkh0VW1DRGhtR05MSVRYVkJ0V0Jm?=
 =?utf-8?B?dDNTaGNpdjRGWnp3UW5XdDVGcFJPZkVYTVRnRmVLR244VGtBRTIwREx3R3hi?=
 =?utf-8?B?ejJONGhhWkIzN3R1b0VMTG5kVkRpR2Q3L2RFMXYzOHBPdERxN1YxYTNnZjZ6?=
 =?utf-8?B?REZjUGd3NXU5emdSZDVGa0lnaVo5d1U1NHVFdzNDSHhsSnYxU2dTb1kxdmJV?=
 =?utf-8?B?bnduNWxPVUJyV0gwK3J1NTQ5MXVuTzFhdWZXdENDMTVsOGc2dlNGVFJsUVF5?=
 =?utf-8?B?RjlyYnMvM29vVEtwNk52K2Jjam1kd0xaRVEydHRjUTZUdGZFcU80bUh4N0pN?=
 =?utf-8?Q?oN57+u7O/lw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjNTTGxNaURqalFyUmpsNlNNZEUvQS80TGxOYjFiMDFmMTdMRzliUVQrQUxm?=
 =?utf-8?B?ZmJEYzhMSmtQdld6VW90MFpBRHJCTFRVeVo3WEdpOTFBU3NJQko4MGJBck85?=
 =?utf-8?B?dmJtY1RTeEtCQ3haSlJnQzB5L1RFUXgvcW9ld0VUeTgzRHdJY3hFc3V6U09w?=
 =?utf-8?B?UnI3T3luZFk1cFUzOWZ1N0l3OHZ1MFhNRk1hcHhnZTN6NWJNbTc1Q2tGaU96?=
 =?utf-8?B?RnIrQWcwYzhSTWUxeGVENGdFMzViSlpITmhFZi90QURxRGVVL1N2L3ZHZ3J6?=
 =?utf-8?B?VG9aaVdyejY3b25iejdZVUR1NXhHSkhFSDM5S3JPQnhoTXFranBMS1pjYTNu?=
 =?utf-8?B?bTFaNU1IMEM2MHlXYUZWQm5NWHRiN2k1ckwyWFBZTjdWdFlDMHFZL0dNaVNi?=
 =?utf-8?B?QXc3djNvbHk2MGJhdHdOMm5XS2pkRHRlQnZVdXo5dWxvZjcwbm52R3B2SXd1?=
 =?utf-8?B?WGQ0NVJJbXZRZEdrazNkVkNUZHhiNnBBeXZuNUJWVzMzcDArMVgrZVB1d3Zh?=
 =?utf-8?B?WW5tZ0paMHpjMnBGUjFDYWxjdHBDeHFKeFNHWE55d1JrVVFVaWo2MFI3cmdI?=
 =?utf-8?B?c0N4bThjN0JoNUdBWkxZbjAyTlljbjBOSkZIV2xCZnJtSElzTDhCSFRaN2gy?=
 =?utf-8?B?bXMwVW1ETG1wcWNVRm9tSFlHMG9TckVwR1JkWG55L1RQbGhVMXY4TVNSWS9j?=
 =?utf-8?B?UXJYVE1yZ2pUWUpocWxRclIxVXl5WnZoNW5FWXlPRGE1U0xlY0tYa3NsMlo5?=
 =?utf-8?B?Yi9RSUg2bUdZbk5xL2E4Rkt0MkN2MnlZTTZxWS9EVTJkYmp4RGJZU3Q3aVgv?=
 =?utf-8?B?dUZpSWpXdXNHZEZCYXhZOXFLc2w4alNMMlViY2haZEhSOXczVFRFVHVzRWow?=
 =?utf-8?B?bk1EdDNIMVN2VFdLT05YOHphTU40U3AwWGg1T0R1d1llQnVFRkliRXhjWmRB?=
 =?utf-8?B?YzZQdG1JZGtEczd3WndlUFNzZVAzc2NWU0JhZzErL01wMnZWSldKVzFmVDJr?=
 =?utf-8?B?OGNWNitmbGdqbnhkVHRPMUZlNkxlaDZXRFlkRFFFVzFkeDEvb0NSdEo4ZkJF?=
 =?utf-8?B?ejltRzVnYmpZSitmUmdkbmVGd0wway9yNDlibTFJa0NQdEl5ZkkvSkI1OEho?=
 =?utf-8?B?RFFNK1dTMTQzV0VMNGZZRDFvT1BlRE5CTUdLY1VtaG1pOW51MnBNQnFGaVpP?=
 =?utf-8?B?cVE4djBsS3lGNWdkYzZmaEVNL1lXY2ZmbEZBZk91WElzOHVOeVZLUUVWVE1S?=
 =?utf-8?B?Sjd6Zjh0WW1pbDMwS2tFZm1jcFdNM1NsSzA5NlJtRlpYNm1RZlZ5UTRLSFM2?=
 =?utf-8?B?NE1LeGh5VDdqZnBFRE9MNWJ2RkhnZ2t1N2JMdWR6YmFQZ1VOZkdHL2x4dEky?=
 =?utf-8?B?MlF3NUN2WFViakw2Mk42VHB3THgzUk51V2R5dS9lWEpGNTliUUlEaVBaQklv?=
 =?utf-8?B?TkhWdjhqcW5DQlhVZzdiKytENmZsN25SbTBTZkNiTTNGOGxTc29nZkgzVXFm?=
 =?utf-8?B?MStrMEF0YWVkNGljQ25xMGlFNFZNMDEwZ2Jtb2dsNFprdXFtdjRFYzkvQU13?=
 =?utf-8?B?U0JLd2RrMkZZdkpwcWhCWkVHTjBLTjRjdXNxSWZqY01WWHE0ZUVxc1lxK1NW?=
 =?utf-8?B?OXFOVFNIdEJNZVR5cng1TGViOFRaUGtVUE5zVk5Ta09vVXNnNDJJUFZXbUZJ?=
 =?utf-8?B?cXlERFptSmNhaXZZUU9oeVFJWmhtbXFtd2JzODdDRWt6b3JwSHl2NUFMU09s?=
 =?utf-8?B?ajB0QXQ3aVlPZFlORUJKNXdDWDhkVWRFbjk4VEw0T1l1UmE4WEZjZUJQNDZR?=
 =?utf-8?B?NUpISWtLLzI3ZG1Kc0N4bVRobHUycElRUzlJVEFVV2ZCOFU5ZTJiQUI2RHRS?=
 =?utf-8?B?ZElyZDUwTXljUEsvcDB6N3RYTjk4dzM2Mm9kd1NIYmJMcU5yb1ZOMTRVbmd5?=
 =?utf-8?B?YlUwdU5YTGNERlE4NS8wMzQ3UEdPK1kxTWIyR2tNRmxlREdOVmdwRm9weFlW?=
 =?utf-8?B?eStzUGRoVUsydkRLSFRHNFZxU2RWd3RjaWFROFpmSThXMHZDT2FleWhqOVd1?=
 =?utf-8?B?c3JFOVRqcThXSFhqK0haUGYzTm93UFVTWWg5aktUbVY2ekIxM3NDcFFDZ2VS?=
 =?utf-8?Q?2ZDgbwY2cVipgQ6y0STfxab54?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9514fa28-5d3a-49d8-f660-08ddd949a4dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:40:48.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXfexiCx4U7mnJBoY8xFxNgXX6p+OQ9y7M42Jj9WYbrv0om+gxXXPLQvJ9aw1TMCMamTCkE7URrrzyPPApWkPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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

Make THP handling code in the mm subsystem for THP pages aware of zone
device pages. Although the code is designed to be generic when it comes
to handling splitting of pages, the code is designed to work for THP
page sizes corresponding to HPAGE_PMD_NR.

Modify page_vma_mapped_walk() to return true when a zone device huge
entry is present, enabling try_to_migrate() and other code migration
paths to appropriately process the entry. page_vma_mapped_walk() will
return true for zone device private large folios only when
PVMW_THP_DEVICE_PRIVATE is passed. This is to prevent locations that are
not zone device private pages from having to add awareness. The key
callback that needs this flag is try_to_migrate_one(). The other
callbacks page idle, damon use it for setting young/dirty bits, which is
not significant when it comes to pmd level bit harvesting.

pmd_pfn() does not work well with zone device entries, use
pfn_pmd_entry_to_swap() for checking and comparison as for zone device
entries.

Support partial unmapping of zone device private entries, which happens
via munmap(). munmap() causes the device private entry pmd to be split,
but the corresponding folio is not split. Deferred split does not work for
zone device private folios due to the need to split during fault
handling. Get migrate_vma_collect_pmd() to handle this case by splitting
partially unmapped device private folios.

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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/rmap.h    |   2 +
 include/linux/swapops.h |  17 ++++
 lib/test_hmm.c          |   2 +-
 mm/huge_memory.c        | 214 +++++++++++++++++++++++++++++++---------
 mm/migrate_device.c     |  47 +++++++++
 mm/page_vma_mapped.c    |  13 ++-
 mm/pgtable-generic.c    |   6 ++
 mm/rmap.c               |  24 ++++-
 8 files changed, 272 insertions(+), 53 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 6cd020eea37a..dfb7aae3d77b 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -927,6 +927,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 #define PVMW_SYNC		(1 << 0)
 /* Look for migration entries rather than present PTEs */
 #define PVMW_MIGRATION		(1 << 1)
+/* Look for device private THP entries */
+#define PVMW_THP_DEVICE_PRIVATE	(1 << 2)
 
 struct page_vma_mapped_walk {
 	unsigned long pfn;
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 64ea151a7ae3..2641c01bd5d2 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -563,6 +563,7 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
 {
 	return is_swap_pmd(pmd) && is_migration_entry(pmd_to_swp_entry(pmd));
 }
+
 #else  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
 static inline int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		struct page *page)
@@ -594,6 +595,22 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
 }
 #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
 
+#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
+
+static inline int is_pmd_device_private_entry(pmd_t pmd)
+{
+	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
+}
+
+#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
+
+static inline int is_pmd_device_private_entry(pmd_t pmd)
+{
+	return 0;
+}
+
+#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
+
 static inline int non_swap_entry(swp_entry_t entry)
 {
 	return swp_type(entry) >= MAX_SWAPFILES;
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 761725bc713c..297f1e034045 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1408,7 +1408,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * the mirror but here we use it to hold the page for the simulated
 	 * device memory and that page holds the pointer to the mirror.
 	 */
-	rpage = vmf->page->zone_device_data;
+	rpage = folio_page(page_folio(vmf->page), 0)->zone_device_data;
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9c38a95e9f09..2495e3fdbfae 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1711,8 +1711,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(is_swap_pmd(pmd))) {
 		swp_entry_t entry = pmd_to_swp_entry(pmd);
 
-		VM_BUG_ON(!is_pmd_migration_entry(pmd));
-		if (!is_readable_migration_entry(entry)) {
+		VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
+				!is_pmd_device_private_entry(pmd));
+
+		if (is_migration_entry(entry) &&
+			is_writable_migration_entry(entry)) {
 			entry = make_readable_migration_entry(
 							swp_offset(entry));
 			pmd = swp_entry_to_pmd(entry);
@@ -1722,6 +1725,32 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 				pmd = pmd_swp_mkuffd_wp(pmd);
 			set_pmd_at(src_mm, addr, src_pmd, pmd);
 		}
+
+		if (is_device_private_entry(entry)) {
+			if (is_writable_device_private_entry(entry)) {
+				entry = make_readable_device_private_entry(
+					swp_offset(entry));
+				pmd = swp_entry_to_pmd(entry);
+
+				if (pmd_swp_soft_dirty(*src_pmd))
+					pmd = pmd_swp_mksoft_dirty(pmd);
+				if (pmd_swp_uffd_wp(*src_pmd))
+					pmd = pmd_swp_mkuffd_wp(pmd);
+				set_pmd_at(src_mm, addr, src_pmd, pmd);
+			}
+
+			src_folio = pfn_swap_entry_folio(entry);
+			VM_WARN_ON(!folio_test_large(src_folio));
+
+			folio_get(src_folio);
+			/*
+			 * folio_try_dup_anon_rmap_pmd does not fail for
+			 * device private entries.
+			 */
+			VM_WARN_ON(folio_try_dup_anon_rmap_pmd(src_folio,
+					  &src_folio->page, dst_vma, src_vma));
+		}
+
 		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 		mm_inc_nr_ptes(dst_mm);
 		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
@@ -2219,15 +2248,22 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			folio_remove_rmap_pmd(folio, page, vma);
 			WARN_ON_ONCE(folio_mapcount(folio) < 0);
 			VM_BUG_ON_PAGE(!PageHead(page), page);
-		} else if (thp_migration_supported()) {
+		} else if (is_pmd_migration_entry(orig_pmd) ||
+				is_pmd_device_private_entry(orig_pmd)) {
 			swp_entry_t entry;
 
-			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
 			folio = pfn_swap_entry_folio(entry);
 			flush_needed = 0;
-		} else
-			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
+
+			if (!thp_migration_supported())
+				WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
+
+			if (is_pmd_device_private_entry(orig_pmd)) {
+				folio_remove_rmap_pmd(folio, &folio->page, vma);
+				WARN_ON_ONCE(folio_mapcount(folio) < 0);
+			}
+		}
 
 		if (folio_test_anon(folio)) {
 			zap_deposited_table(tlb->mm, pmd);
@@ -2247,6 +2283,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				folio_mark_accessed(folio);
 		}
 
+		/*
+		 * Do a folio put on zone device private pages after
+		 * changes to mm_counter, because the folio_put() will
+		 * clean folio->mapping and the folio_test_anon() check
+		 * will not be usable.
+		 */
+		if (folio_is_device_private(folio))
+			folio_put(folio);
+
 		spin_unlock(ptl);
 		if (flush_needed)
 			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
@@ -2375,7 +2420,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		struct folio *folio = pfn_swap_entry_folio(entry);
 		pmd_t newpmd;
 
-		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
+		VM_WARN_ON(!is_pmd_migration_entry(*pmd) &&
+			   !folio_is_device_private(folio));
 		if (is_writable_migration_entry(entry)) {
 			/*
 			 * A protection check is difficult so
@@ -2388,6 +2434,10 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			newpmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*pmd))
 				newpmd = pmd_swp_mksoft_dirty(newpmd);
+		} else if (is_writable_device_private_entry(entry)) {
+			entry = make_readable_device_private_entry(
+							swp_offset(entry));
+			newpmd = swp_entry_to_pmd(entry);
 		} else {
 			newpmd = *pmd;
 		}
@@ -2842,16 +2892,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
+	bool young, write, soft_dirty, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false, present = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t swp_entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
+
+	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
+			&& !(is_pmd_device_private_entry(*pmd)));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -2899,18 +2952,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	present = pmd_present(*pmd);
+	if (unlikely(!present)) {
+		swp_entry = pmd_to_swp_entry(*pmd);
 		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
-		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
+
+		folio = pfn_swap_entry_folio(swp_entry);
+		VM_WARN_ON(!is_migration_entry(swp_entry) &&
+				!is_device_private_entry(swp_entry));
+		page = pfn_swap_entry_to_page(swp_entry);
+
+		if (is_pmd_migration_entry(old_pmd)) {
+			write = is_writable_migration_entry(swp_entry);
+			if (PageAnon(page))
+				anon_exclusive =
+					is_readable_exclusive_migration_entry(
+								swp_entry);
+			young = is_migration_entry_young(swp_entry);
+			dirty = is_migration_entry_dirty(swp_entry);
+		} else if (is_pmd_device_private_entry(old_pmd)) {
+			write = is_writable_device_private_entry(swp_entry);
+			anon_exclusive = PageAnonExclusive(page);
+			if (freeze && anon_exclusive &&
+			    folio_try_share_anon_rmap_pmd(folio, page))
+				freeze = false;
+			if (!freeze) {
+				rmap_t rmap_flags = RMAP_NONE;
+
+				if (anon_exclusive)
+					rmap_flags |= RMAP_EXCLUSIVE;
+
+				folio_ref_add(folio, HPAGE_PMD_NR - 1);
+				if (anon_exclusive)
+					rmap_flags |= RMAP_EXCLUSIVE;
+				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
+						 vma, haddr, rmap_flags);
+			}
+		}
+
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
 	} else {
@@ -2996,30 +3076,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
+	if (freeze || !present) {
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
+			if (freeze || is_migration_entry(swp_entry)) {
+				if (write)
+					swp_entry = make_writable_migration_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_readable_exclusive_migration_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_migration_entry(
+								page_to_pfn(page + i));
+				if (young)
+					swp_entry = make_migration_entry_young(swp_entry);
+				if (dirty)
+					swp_entry = make_migration_entry_dirty(swp_entry);
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			} else {
+				/*
+				 * anon_exclusive was already propagated to the relevant
+				 * pages corresponding to the pte entries when freeze
+				 * is false.
+				 */
+				if (write)
+					swp_entry = make_writable_device_private_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_device_private_entry(
+								page_to_pfn(page + i));
+				/*
+				 * Young and dirty bits are not progated via swp_entry
+				 */
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			}
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3046,7 +3145,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (present)
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3058,8 +3157,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
+
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
+	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
+			(is_pmd_device_private_entry(*pmd)))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
@@ -3238,6 +3339,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
 	lockdep_assert_held(&lruvec->lru_lock);
 
+	if (folio_is_device_private(folio))
+		return;
+
 	if (list) {
 		/* page reclaim is reclaiming a huge page */
 		VM_WARN_ON(folio_test_lru(folio));
@@ -3252,6 +3356,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 			list_add_tail(&new_folio->lru, &folio->lru);
 		folio_set_lru(new_folio);
 	}
+
 }
 
 /* Racy check whether the huge page can be split */
@@ -3727,7 +3832,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 	/* Prevent deferred_split_scan() touching ->_refcount */
 	spin_lock(&ds_queue->split_queue_lock);
-	if (folio_ref_freeze(folio, 1 + extra_pins)) {
+	if (folio_ref_freeze(folio, 1 + folio_expected_ref_count(folio))) {
 		struct address_space *swap_cache = NULL;
 		struct lruvec *lruvec;
 		int expected_refs;
@@ -3858,8 +3963,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
-	if (!ret && is_anon)
+	if (!ret && is_anon && !folio_is_device_private(folio))
 		remap_flags = RMP_USE_SHARED_ZEROPAGE;
+
 	remap_page(folio, 1 << order, remap_flags);
 
 	/*
@@ -4603,7 +4709,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (unlikely(is_pmd_device_private_entry(*pvmw->pmd)))
+		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
+	else
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4653,6 +4762,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+
+	if (folio_is_device_private(folio)) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e05e14d6eacd..0ed337f94fcd 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -136,6 +136,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			 * page table entry. Other special swap entries are not
 			 * migratable, and we ignore regular swapped page.
 			 */
+			struct folio *folio;
+
 			entry = pte_to_swp_entry(pte);
 			if (!is_device_private_entry(entry))
 				goto next;
@@ -147,6 +149,51 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			    pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
+			folio = page_folio(page);
+			if (folio_test_large(folio)) {
+				struct folio *new_folio;
+				struct folio *new_fault_folio = NULL;
+
+				/*
+				 * The reason for finding pmd present with a
+				 * device private pte and a large folio for the
+				 * pte is partial unmaps. Split the folio now
+				 * for the migration to be handled correctly
+				 */
+				pte_unmap_unlock(ptep, ptl);
+
+				folio_get(folio);
+				if (folio != fault_folio)
+					folio_lock(folio);
+				if (split_folio(folio)) {
+					if (folio != fault_folio)
+						folio_unlock(folio);
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				new_folio = page_folio(page);
+				if (fault_folio)
+					new_fault_folio = page_folio(migrate->fault_page);
+
+				/*
+				 * Ensure the lock is held on the correct
+				 * folio after the split
+				 */
+				if (!new_fault_folio) {
+					folio_unlock(folio);
+					folio_put(folio);
+				} else if (folio != new_fault_folio) {
+					folio_get(new_fault_folio);
+					folio_lock(new_fault_folio);
+					folio_unlock(folio);
+					folio_put(folio);
+				}
+
+				addr = start;
+				goto again;
+			}
+
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
 			if (is_writable_device_private_entry(entry))
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e981a1a292d2..246e6c211f34 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
 			pmde = *pvmw->pmd;
 			if (!pmd_present(pmde)) {
-				swp_entry_t entry;
+				swp_entry_t entry = pmd_to_swp_entry(pmde);
 
 				if (!thp_migration_supported() ||
 				    !(pvmw->flags & PVMW_MIGRATION))
 					return not_found(pvmw);
-				entry = pmd_to_swp_entry(pmde);
 				if (!is_migration_entry(entry) ||
 				    !check_pmd(swp_offset_pfn(entry), pvmw))
 					return not_found(pvmw);
@@ -277,6 +276,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry;
+
+			entry = pmd_to_swp_entry(pmde);
+
+			if (is_device_private_entry(entry) &&
+				(pvmw->flags & PVMW_THP_DEVICE_PRIVATE)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 567e2d084071..604e8206a2ec 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
 		goto nomap;
+	if (is_swap_pmd(pmdval)) {
+		swp_entry_t entry = pmd_to_swp_entry(pmdval);
+
+		if (is_device_private_entry(entry))
+			goto nomap;
+	}
 	if (unlikely(pmd_trans_huge(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_bad(pmdval))) {
diff --git a/mm/rmap.c b/mm/rmap.c
index b5837075b6e0..f40e45564295 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2285,7 +2285,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		     unsigned long address, void *arg)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
+	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address,
+				PVMW_THP_DEVICE_PRIVATE);
 	bool anon_exclusive, writable, ret = true;
 	pte_t pteval;
 	struct page *subpage;
@@ -2330,6 +2331,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+			unsigned long pfn;
+#endif
+
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				split_huge_pmd_locked(vma, pvmw.address,
 						      pvmw.pmd, true);
@@ -2338,8 +2343,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			/*
+			 * Zone device private folios do not work well with
+			 * pmd_pfn() on some architectures due to pte
+			 * inversion.
+			 */
+			if (is_pmd_device_private_entry(*pvmw.pmd)) {
+				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
+
+				pfn = swp_offset_pfn(entry);
+			} else {
+				pfn = pmd_pfn(*pvmw.pmd);
+			}
+
+			subpage = folio_page(folio, pfn - folio_pfn(folio));
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.50.1

