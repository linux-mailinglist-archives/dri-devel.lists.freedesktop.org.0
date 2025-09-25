Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5280BA0595
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB96B10E97A;
	Thu, 25 Sep 2025 15:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nMirTc3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F06710E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQymeCo1OOzRyWeryCQ4L/x1C8bykLpfOyCKek+pvwg+VpTkdcDqtx0+I5cF/iXsptVuS8rmj4CIKTiXnk1AFrpFS2//Fb/wAqi9de+OMOP9CAC/qSupOrsoncNtETlHCvpJqszgCH7ZdA6Kqi0jrOE+mJV6hwIaF6syVeNnVMHTKgQsgcZ9fJxnfH5sIXMbjIFbzaSIK/R2ZpdxYRofLUhI83uQp7IkrqsPPiQx69d1sWd/m2vzRh39Zvoq+f7eTVuHFnR8F938l/FtYvLDjD/tr/1T6dF5M6bpajlc0ctMpEyZuBFyKz+6UmV9dwBRz8Ek67UAVQopYoBTe2NpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TakJKk2Qq9qtwEWmtNu1vySEWyrY6oL1j6erKicmlc=;
 b=yObmYy2z2GteXOG8gIUnr8/wiKj/3KGggVYiKF+s9XVmRUhLHobRUh8ft2Qm0t8r6M2+Qd6UslryA5cD/Hf+rBle74UIo9qsH4u3oSSVb4dq38VOHMLAz9m1ukcTZiUJeA6vUQ+QhXZKmmGFlatCaP25lSSpoLONOgbhyt6jjhiVXD3UDl1bj2xivs5pf/O26j0+m6IwMo4KAv5+Qipq/qyBUL6N1vo9utmGsVi7KkCr2GezK/pF1Hbv1LutrLrEYHoIPladj9FyIbzCVVD7SL5xaPjeEV+IkMj5eEqRIy4mUFKhE2au81UrZe6AbmwPdHm43rTINV8rka2YL+pVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TakJKk2Qq9qtwEWmtNu1vySEWyrY6oL1j6erKicmlc=;
 b=nMirTc3UfdQDPXiy/auP5Nqr2nZjDjvnK+R35RIozXlICcDtB+KfYIkGkx5wQRBF/vahdMa7UwSiqpEj2yONWCOCZDiUMGjcc1xTPYcCz2SnosJEfaneYm3rU9c61NoXWzZHdINDRhlro52z4UHZCDVG5alpiD3B1jFJ93Qd62o4RZcTEbW+X6noSkPhKuH2O3MbcvQizXA3f0LzTN2DyhQ9kGPF7LDxv23ldXT4H8eZsDQH1f68zZvSnah4lbyk380OJLGg0fivVjooFWC0enqoQg121libkVCIN/KPXz+QJDizr0rey2crCm6eadA7AJbCBnTif6u0Q7AK0mZ4lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 15:32:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 15:32:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
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
Date: Thu, 25 Sep 2025 11:32:52 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <ADE18042-86F1-4E6D-BEC8-CFF75B13D31F@nvidia.com>
In-Reply-To: <85e7c025-a372-4211-be00-f00f439d319d@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
 <66A59A5C-B54E-484F-9EB8-E12F6BD1CD03@nvidia.com>
 <lcuuqa3e3txmhb55c5q3s6unugde4hp2wsmvkahgddeicyn2tp@xdx2zqjmd4ol>
 <85e7c025-a372-4211-be00-f00f439d319d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:208:32f::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 206eb485-6519-4a46-a863-08ddfc48cc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3A5aldSMVB5WklqWUN3RWlDdWZoQjdmSm9zUElZZjBpNGRhcW5OSVVIMWVv?=
 =?utf-8?B?VzlqNTdESjF3Rndmand5TTlndHk2RFhwbWdQeTYvUkNHWWw5SVdMTkxERWZO?=
 =?utf-8?B?V3hIVXc4d1M5UnFYSDBwb01QeFovL2ZCOEtBVTlJS1ZLamoxeU9BM21ZSzBh?=
 =?utf-8?B?aHV4Q3A3V0xpQzZKTVNqSlNiMkR0NnRRQkJUdmd3NUlsaytoeUNlZG8vM3BB?=
 =?utf-8?B?bk9JSzBzWUNid3dEYW15bm9Ua2hXbnZSOGZOV3AybUNwRG5oWUtWdW1icXZ0?=
 =?utf-8?B?VGlSLzMwMjV4bDVVbk9Qc0RkQ0VFZTBnUVlxdVpDSXMwUE4zT2ZFV1g1MHJ2?=
 =?utf-8?B?RisyNjZJQnlscUNuY0JPVnQrc3paRWljenlIZ2hXNEkzMmp2em9iNmFJaU9n?=
 =?utf-8?B?dC9PZzZpSUxjdVRhSGJpNmo1elJJQ0tSd0F6dVJMSmkxSE51c0FrUVRSS2Z4?=
 =?utf-8?B?SW03Z3ZaSkNONzcwdk1oN2JqRzJBWkxBZGxxbW5VSjNzbEVhUHVZTStTS25t?=
 =?utf-8?B?MGF0TytTditvRFB2OFV6bWJxdHQyb1BTcDZJcXFCamlQNjN2aDYwVWR6M2kr?=
 =?utf-8?B?VFViUEZSNDkrR2U0bllYcnBQQU8xUERaVE5MMjFtbVNvOVdiWEpnYjF2WW01?=
 =?utf-8?B?dExmaUdLTU13NzhNU3lSdk52VzhDOE5ZU3JMUmlaY05BNDZvVTgyR1p2RzMw?=
 =?utf-8?B?Mzd0aUpKdmhYdDR5MDR6SmhGbWR4UGtDcldpSUlGcUoxb1hyTEJwN1lHTk9v?=
 =?utf-8?B?RzRPQXBjenlKc2xwN0grNTQvcVZZR2hLN2RkUWhhS0RaL2Q4NFZaQzNyR2JX?=
 =?utf-8?B?QjNMZXpWNHZ3cnFoaFVlTVkydEROOWxDRFVJOXlkL0FRcEFqRWsrUk1hR2FJ?=
 =?utf-8?B?SU42c1dJSkM4ZUgzYWNhcW9ZazB6OGxQZ2kwZXJDMG9HbmE3QkVmVWQxbkl2?=
 =?utf-8?B?ZEd2ZHNXQVdyK21uK3R6WDdOME0zeXJhWitNV1NMQkNNdGZCMTNzd0VTNVdM?=
 =?utf-8?B?R0g0L1B6Z2dub2NldnZ5V3VzTlREQlY4VHBaWkQ5cndPdDlaRW5YaHU1cmhS?=
 =?utf-8?B?UkdUMmJ5RTU4QVdEQXZUMVhDYS9RaVZUa3FuMXprOWgvWUpSbXJGU3Y3SkJv?=
 =?utf-8?B?ZHBxWjJmSnNOaU9YT1BwZjg4MmVOSk1LVnl0RGpIVkxtTGowempaTFNWcEJS?=
 =?utf-8?B?d0VmbzFGc2FoeGsrRFhuSW1kWlkyVjhQZUYxWFVBSHk2aU1vVHNyTERnUlZY?=
 =?utf-8?B?KytYejh4VytITkVIN21GTTZINVlIc2xVZDNzOWtwUnE4V3ZkUVFldG9hK1ZZ?=
 =?utf-8?B?Y3dhUFliZTl4Ymh6ZklZaFF4UmJ3ODVTaVFCL24rYnFKdGVyZjdndDFTWDJJ?=
 =?utf-8?B?dzdrVjBBQjB6VHlTYXNPdGpZMU5ETmdKKzN0VFRLdW1lNFJpR082aXYrN1Zp?=
 =?utf-8?B?dzRhcUxlSyswS3YxOUF5OXRCTnZrcHRQN2MzcHdBMGp4R09GWW0xOTdhd3kz?=
 =?utf-8?B?VFZReHRxZkl6RmVodHAwbmxFYzVWNEYxN0hOSWV2bDBRU0lBNTc5dUxYWVll?=
 =?utf-8?B?QkNFNWV6VlZmWlFqYlp4bHhobWpuaEVDcDFaSGYreG04Mm1pc3RyNUNPMTJN?=
 =?utf-8?B?T3VjbDQzbmRDR2NDcVZLK0xzSDlRZU9TbXZQVUt1bVR0V0w2dGRZbG1Uc0Rr?=
 =?utf-8?B?d0dJcjk5OEtnU0ZsZU53QzRvZHpMUlVGY2wyMUFPRnl0YVZ0NnE2UjJ4RUlG?=
 =?utf-8?B?NzRpcHBVLy9YTGtoRWV4a0ZpSTRhU3NVMWsvU1F6T2djb2VTMHdqVnhkY0ZE?=
 =?utf-8?B?TlhHT3F6em1ESWF6Tlhvb20vb3lIeE1GYzAxdjB0NmF5cHJxUzhuRlpJVHBt?=
 =?utf-8?B?ODNnRW9NT2JwaEt6azZNczlsOWJMQXpseFc5Y0UzOFc0ZFlTSGZsZU9qNTh6?=
 =?utf-8?Q?4iXNP0G6Oqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1NISGtyZW1FSi94Qm5DNUxtb25EN1ZzK0kxRUMxcEFGTDVEMjE3NHcrajMw?=
 =?utf-8?B?eG9YY2c5OXIvWkpUWjMwcTVSZHJaMUU1LzF3YkpldkErWWorOWlsci9mcjdj?=
 =?utf-8?B?Ny8renFPU1BDaEFCWDB5R0puMEFSMVhXL0ZSUmVRUlp0WXBEcVA2Q1RUTnRY?=
 =?utf-8?B?NkZScFd5ZUNucjJGTUQzUjZGMHdSc0UvL29jb21kMXFOU0R1NXRueDF4cldx?=
 =?utf-8?B?dFR3SXNNUW9sbDM0VzhVQng1NzNoZ1daSjdQalBaVnJIc0ZyU2YzNTl5VjVM?=
 =?utf-8?B?aHhxb2NDblp6YUEyWHdLRSs1aE5KTFdWLzh6ZFR2cEtSR1ZMdlV4UitNTDMr?=
 =?utf-8?B?UHE2d0Q3cGNjbHJJOXNyVEdpTCtPRTZpNm5iRGdYOFZvTTd4akttL2I2ZEtL?=
 =?utf-8?B?MThlOWhsZ2hnQ1Z5bzU1QXdtbkI1c3lHTGN6YThVUm5pYTNXV2Flb2hJNXNR?=
 =?utf-8?B?aVNMbTZCa0JhWlRRRVhvS2FONXJuNTRrOWxKdktqK0lEbSt6UXdrVDV5YVpa?=
 =?utf-8?B?WVRKTWtTT2N0VGZjbjF1dHZCWS9xQTFLYlo5dEpYaisza2tzTHJMMWY2SVVs?=
 =?utf-8?B?R09hWTIzVUUyd2xEMGVCb2VqdjhjSzRvWTMzTHhsUE56SXV4RmJpMTl6VUMr?=
 =?utf-8?B?T0dOb1JtYmdVNWJaRHVsSU5MMHppaGVpa3lGRi9GY0E5L3d2d3hqRXAzaEx5?=
 =?utf-8?B?NGdjTkZQU1RnTXhOSDM1bzZTWGNLSVJWbVY4bFQ4WFdSbWlxR1JPT3RyWmls?=
 =?utf-8?B?bHJTRHVpSTQzYWJ0QmtDS0YxbmlMRVNZeWhBQU9DeTdidlpLZTNHS0JxV1RV?=
 =?utf-8?B?TWFLaUk5WDhWbFFmbkEzOVhmQkxjdE9JWndiYkdLaU1GYWRiQWwwdGZLeVYw?=
 =?utf-8?B?UWlXTWJNYTJDL050ZUUzeXlFTjhtb0hZTjAvMmZJR1RmSkVjejNvM1BYYmFR?=
 =?utf-8?B?Y1pNWGtBaE9rQ1V0R25HUzFwUlE5djhQUDFzeU9YNCt2R0NiM3ZqeE5Baldl?=
 =?utf-8?B?NitPZzJBMXNDTUkrOGFjeDhHanNEcnlsYzIwYjNoeTArVWdyR0l0ekNTaUhM?=
 =?utf-8?B?MHlWOUhRNWdQNzJJVjZQR2prWXdDL056aWdJZTRudEtnRWlkNm9nd05keVQ1?=
 =?utf-8?B?WFpqTnRrM1EzREcxbit6NHJZRGRVMmUzQTMzOU9ZenBrUXVqbTNUY0ZveFl4?=
 =?utf-8?B?YjZNYmc1cFhpMVZ4TjA3OG1qRnJxWWdXZlM4VnVLRnFLbG5nVk5HcmovT0pi?=
 =?utf-8?B?TTFYcGJTUEN5WlJLVkwvRERVRnlDSm5CVGkwR1BZdG1oNVp2QWJmR3hmZ1Y5?=
 =?utf-8?B?Tzk5UFQrRmd0MW5YWXpibmZSZHRKRFdvN2M3L3E0T1RFM2hDcm14MmVUNmZK?=
 =?utf-8?B?cjR0cmdMdnpJdGVsajNuZ2orbXZveXk1anU2N1VGSW02MkdyWXBpMnAxTDJG?=
 =?utf-8?B?bStZbno5WWliN2ozYzFDUVpWdnlWWXV3ZnFNQkl6dk95QjJMQXU0UDk3empw?=
 =?utf-8?B?d2pXczRIMTJ4MEFtTEdwM1Vub2tKQzV0VnhvbkErWWFURnoxUWxYTkJsUi9I?=
 =?utf-8?B?NGJCTmpTdk4vSVZxbjc2WHNLd1lzMVZxS3d6c2RmOTZWWFlQRlUwUi9VVm9I?=
 =?utf-8?B?WExRRGhuU1UybEJSR3h6TGpVZ1pzOTVpUW9sV2wwcXg5cWprOEpuWVVxMFo5?=
 =?utf-8?B?OUlUdU1zbnhjTy9BS0JQbk40aDV4cmljMmlMRWR6N1lEL3RvcmdRWllBNEhu?=
 =?utf-8?B?Wkw0SmFzUzMzbm9pSG54MURaNWVRcGdKaENYb0crUFJBa3VpdlpBVUFVYi8z?=
 =?utf-8?B?di91Um5sWDFDNjF3NkowdEZmWEJIbFEwcTgzc3JBTFBsRWdtWkRkRi9BeTht?=
 =?utf-8?B?UmFkcER6Y3JLMXQ1bDJ3M05wTHFwSkt1K1ZYeGxmcTRWaVhWMVlaY1J6UzNz?=
 =?utf-8?B?S1dpU3pacnZRUVFYQ0oyVkd2emlOUk5zSmFWdEFoZld4TDlMVlJxVXovdUdC?=
 =?utf-8?B?cFc0NDhuTzVNL1ZzRFNmNXd0Q1NkSU5wR2pvVWNsbWR2UmVqQXgwY3U0QnNl?=
 =?utf-8?B?cWMwMVpmMkxWK3FCenJJa3NaZVRLaGxJVkFvazBCcHlETG41VTlwWm0wTzcv?=
 =?utf-8?Q?FZ4y1/R7eMzGE+hqRVfpyojlX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206eb485-6519-4a46-a863-08ddfc48cc8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:32:55.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c15CqmOgTs9+I/fiETBlPOVwDL4Fn300fem1E2O+c9DlbmQOb2TPC/iccGSQCHUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052
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

On 24 Sep 2025, at 20:05, Balbir Singh wrote:

> On 9/25/25 09:58, Alistair Popple wrote:
>> On 2025-09-25 at 03:36 +1000, Zi Yan <ziy@nvidia.com> wrote...
>>> On 24 Sep 2025, at 6:55, David Hildenbrand wrote:
>>>
>>>> On 18.09.25 04:49, Zi Yan wrote:
>>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>>>
>>>>>> Add routines to support allocation of large order zone device folios
>>>>>> and helper functions for zone device folios, to check if a folio is
>>>>>> device private and helpers for setting zone device data.
>>>>>>
>>>>>> When large folios are used, the existing page_free() callback in
>>>>>> pgmap is called when the folio is freed, this is true for both
>>>>>> PAGE_SIZE and higher order pages.
>>>>>>
>>>>>> Zone device private large folios do not support deferred split and
>>>>>> scan like normal THP folios.
>>>>>>
>>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>> ---
>>>>>>   include/linux/memremap.h | 10 +++++++++-
>>>>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>>>>   mm/rmap.c                |  6 +++++-
>>>>>>   3 files changed, 35 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>> index e5951ba12a28..9c20327c2be5 100644
>>>>>> --- a/include/linux/memremap.h
>>>>>> +++ b/include/linux/memremap.h
>>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct pa=
ge *page)
>>>>>>   }
>>>>>>
>>>>>>   #ifdef CONFIG_ZONE_DEVICE
>>>>>> -void zone_device_page_init(struct page *page);
>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order=
);
>>>>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>>>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>>>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *=
pgmap);
>>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned lo=
ng pfn);
>>>>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn)=
;
>>>>>>
>>>>>>   unsigned long memremap_compat_align(void);
>>>>>> +
>>>>>> +static inline void zone_device_page_init(struct page *page)
>>>>>> +{
>>>>>> +	struct folio *folio =3D page_folio(page);
>>>>>> +
>>>>>> +	zone_device_folio_init(folio, 0);
>>>>>
>>>>> I assume it is for legacy code, where only non-compound page exists?
>>>>>
>>>>> It seems that you assume @page is always order-0, but there is no che=
ck
>>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) !=3D 0, folio=
)
>>>>> above it would be useful to detect misuse.
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>   #else
>>>>>>   static inline void *devm_memremap_pages(struct device *dev,
>>>>>>   		struct dev_pagemap *pgmap)
>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>>>>> --- a/mm/memremap.c
>>>>>> +++ b/mm/memremap.c
>>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>>>>   void free_zone_device_folio(struct folio *folio)
>>>>>>   {
>>>>>>   	struct dev_pagemap *pgmap =3D folio->pgmap;
>>>>>> +	unsigned long nr =3D folio_nr_pages(folio);
>>>>>> +	int i;
>>>>>>
>>>>>>   	if (WARN_ON_ONCE(!pgmap))
>>>>>>   		return;
>>>>>>
>>>>>>   	mem_cgroup_uncharge(folio);
>>>>>>
>>>>>> -	/*
>>>>>> -	 * Note: we don't expect anonymous compound pages yet. Once suppor=
ted
>>>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>>>>> -	 * PG_anon_exclusive on all tail pages.
>>>>>> -	 */
>>>>>>   	if (folio_test_anon(folio)) {
>>>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>>>>> +		for (i =3D 0; i < nr; i++)
>>>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>>>>> +	} else {
>>>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>>>>   	}
>>>>>>
>>>>>>   	/*
>>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>   	case MEMORY_DEVICE_COHERENT:
>>>>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>>>>   			break;
>>>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>>>>> -		put_dev_pagemap(pgmap);
>>>>>> +		pgmap->ops->page_free(&folio->page);
>>>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>   		break;
>>>>>>
>>>>>>   	case MEMORY_DEVICE_GENERIC:
>>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *foli=
o)
>>>>>>   	}
>>>>>>   }
>>>>>>
>>>>>> -void zone_device_page_init(struct page *page)
>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order=
)
>>>>>>   {
>>>>>> +	struct page *page =3D folio_page(folio, 0);
>>>>>
>>>>> It is strange to see a folio is converted back to page in
>>>>> a function called zone_device_folio_init().
>>>>>
>>>>>> +
>>>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>> +
>>>>>>   	/*
>>>>>>   	 * Drivers shouldn't be allocating pages after calling
>>>>>>   	 * memunmap_pages().
>>>>>>   	 */
>>>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>>>>> -	set_page_count(page, 1);
>>>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << =
order));
>>>>>> +	folio_set_count(folio, 1);
>>>>>>   	lock_page(page);
>>>>>> +
>>>>>> +	if (order > 1) {
>>>>>> +		prep_compound_page(page, order);
>>>>>> +		folio_set_large_rmappable(folio);
>>>>>> +	}
>>>>>
>>>>> OK, so basically, @folio is not a compound page yet when zone_device_=
folio_init()
>>>>> is called.
>>>>>
>>>>> I feel that your zone_device_page_init() and zone_device_folio_init()
>>>>> implementations are inverse. They should follow the same pattern
>>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>>>>> zone_device_page_init() does the actual initialization and
>>>>> zone_device_folio_init() just convert a page to folio.
>>>>>
>>>>> Something like:
>>>>>
>>>>> void zone_device_page_init(struct page *page, unsigned int order)
>>>>> {
>>>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>
>>>>> 	/*
>>>>> 	 * Drivers shouldn't be allocating pages after calling
>>>>> 	 * memunmap_pages().
>>>>> 	 */
>>>>>
>>>>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 <=
< order));
>>>>> =09
>>>>> 	/*
>>>>> 	 * anonymous folio does not support order-1, high order file-backed =
folio
>>>>> 	 * is not supported at all.
>>>>> 	 */
>>>>> 	VM_WARN_ON_ONCE(order =3D=3D 1);
>>>>>
>>>>> 	if (order > 1)
>>>>> 		prep_compound_page(page, order);
>>>>>
>>>>> 	/* page has to be compound head here */
>>>>> 	set_page_count(page, 1);
>>>>> 	lock_page(page);
>>>>> }
>>>>>
>>>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>>> {
>>>>> 	struct page *page =3D folio_page(folio, 0);
>>>>>
>>>>> 	zone_device_page_init(page, order);
>>>>> 	page_rmappable_folio(page);
>>>>> }
>>>>>
>>>>> Or
>>>>>
>>>>> struct folio *zone_device_folio_init(struct page *page, unsigned int =
order)
>>>>> {
>>>>> 	zone_device_page_init(page, order);
>>>>> 	return page_rmappable_folio(page);
>>>>> }
>>>>
>>>> I think the problem is that it will all be weird once we dynamically a=
llocate "struct folio".
>>>>
>>>> I have not yet a clear understanding on how that would really work.
>>>>
>>>> For example, should it be pgmap->ops->page_folio() ?
>>>>
>>>> Who allocates the folio? Do we allocate all order-0 folios initially, =
to then merge them when constructing large folios? How do we manage the "st=
ruct folio" during such merging splitting?
>>>
>>> Right. Either we would waste memory by simply concatenating all =E2=80=
=9Cstruct folio=E2=80=9D
>>> and putting paddings at the end, or we would free tail =E2=80=9Cstruct =
folio=E2=80=9D first,
>>> then allocate tail =E2=80=9Cstruct page=E2=80=9D. Both are painful and =
do not match core mm=E2=80=99s
>>> memdesc pattern, where =E2=80=9Cstruct folio=E2=80=9D is allocated when=
 caller is asking
>>> for a folio. If =E2=80=9Cstruct folio=E2=80=9D is always allocated, the=
re is no difference
>>> between =E2=80=9Cstruct folio=E2=80=9D and =E2=80=9Cstruct page=E2=80=
=9D.
>>
>> As mentioned in my other reply I need to investigate this some more, but=
 I
>> don't think we _need_ to always allocate folios (or pages for that matte=
r).
>> The ZONE_DEVICE code just uses folios/pages for interacting with the cor=
e mm,
>> not for managing the device memory itself, so we should be able to make =
it more
>> closely match the memdesc pattern. It's just I'm still a bit unsure what=
 that
>> pattern will actually look like.
>>
>>>>
>>>> With that in mind, I don't really know what the proper interface shoul=
d be today.
>>>>
>>>>
>>>> zone_device_folio_init(struct page *page, unsigned int order)
>>>>
>>>> looks cleaner, agreed.
>>
>> Agreed.
>>
>>>>>
>>>>>
>>>>> Then, it comes to free_zone_device_folio() above,
>>>>> I feel that pgmap->ops->page_free() should take an additional order
>>>>> parameter to free a compound page like free_frozen_pages().
>>
>> Where would the order parameter come from? Presumably
>> folio_order(compound_head(page)) in which case shouldn't the op actually=
 just be
>> pgmap->ops->folio_free()?
>>
> ->page_free() can detect if the page is of large order. The patchset was =
designed
> to make folios and opt-in and avoid unnecessary changes to existing drive=
rs.
> But I can revisit that thought process if it helps with cleaner code.

That would be very helpful. It is strange to see page_free(folio_page(folio=
, 0)).
If folio is present, converting it back to page makes me think the code
frees the first page of the folio.


Best Regards,
Yan, Zi
