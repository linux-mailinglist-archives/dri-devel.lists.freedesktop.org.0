Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D653B411CC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0F610E850;
	Wed,  3 Sep 2025 01:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gyyc4a8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0810E857
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=no3V5Hk2bzgmSUw3N62omFE+TMP0TU0t8vPuEk8TTPjJUTKFd/31YZQWN9E/x1vPCRVfVAA4iOS3M8qKcmeUKu5910nNm6NP4+63VjhRDHnk5nx82r/tvXoXvhTNRwH+FALJ5aamxCH1Y+Y2/rr8yxOdYeoBFt8wkn3j1+VUY2+tclTtgSr330dPvqQRF1yqjggFrtyumMpEQ7GoDMYHivVW9YZVVIZSAXhPMqSV+83zWRhi+/9hxln6siauuwcI92DRHoQ8QuuSq+Da5VW3f3JVPWEsFZVVh7PEvDkSHTx14e9MX2YatGLb5vPf2x2qzKAsD32jSBWFVnxYe6/c2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/6Gr7Dd12gyu1+QRc/r+CVQPBfgjiE+tc5bSEwfAZI=;
 b=vRHf1NiKSFVf8We1QGdhKV8x5JFWXR8kDPLZvQXgO8Rlyhlu9acPEWoFIPrZ0uI2RF7Aq5fhh4hMNeWG2+3Ish+c/Ja1XxbXdcTPSixs1qTfnfCzBLAQZENWs0WYrsrxvSvrGqw4bAzxLsc4DE69ts2o79hLOdkNXUQpAiV0eW9ax0ClU3Y22Ca5GkaS1Agqs34KSaDbTcsaVsNuBaKw+FIJ34aFsTFxjxq++y08+kPoX5AzjkDMtiOUZScG5PnbgEGt6/lcZVB0jtxbwypjsXFSudP7Bloz1gnLKmTQFSW8SPXEnJ4xBLhkWvLiDGl+B/uQSaIT3kFY0ye6WW+I+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/6Gr7Dd12gyu1+QRc/r+CVQPBfgjiE+tc5bSEwfAZI=;
 b=Gyyc4a8yZOxtueQ0RTv265jshYVTA/q/lypjPddM3m2eHxBxUqrwlyhYv3r+Qwmx+kw4SIXLcawFS2J+aTOJ++bqCl48MJhvQIEPKmxNwHZ2qPub06A6rmQDoPPB1XFJVXTcDUcqNfds/dT5+R3BX3YFLzSBoZcnT434mohNqe9J5gpz2/CVLUPgVIUwToGdnfCbHY/f7mGE5Qx/6DK3yjcXT9dBkc8LKn8VCXbOwYLroeRPLPXeETvS/XW/Uve8d+HiPCyx98qb0uoViek5MjGtvbC5YmMG7+hNxHRcBksFJLH6YfafJl5sgSfRC1OnRkcYAQbWnyq6uZ9GBHrL+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 3 Sep
 2025 01:20:01 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:20:01 +0000
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
Subject: [v4 08/15] lib/test_hmm: add zone device private THP test
 infrastructure
Date: Wed,  3 Sep 2025 11:18:53 +1000
Message-ID: <20250903011900.3657435-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbaa99c-c10d-4f23-ee58-08ddea8800f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHBZVWt5SmU3eEp1YzF0ckhaNW5KeU5vdCtiSFFtK21xYVpQZW5PSU8xSWlB?=
 =?utf-8?B?VGU4UXRLbS9yRlNMdDhMVlJ1WU1CQytoY3l1NFF6alhWb2E4dWdVYnJtNFho?=
 =?utf-8?B?MnkyTVFNS0tRZmFqOTdqSzNGeU5jVHcwRjFlNmsxZzlqTS9YZ3h6VjBaTmpS?=
 =?utf-8?B?LzBMNnFmK0ttc01KdlNnMVNWMGJHQnl2anVUNlc2dHk2Z04xMHpKWFRBWTN3?=
 =?utf-8?B?YlNlMTJBUk1aWWtnME5rWitrTEEvV3pQNCtBMnBPUWhPaEl0VVB6UURqSGpa?=
 =?utf-8?B?OXdsMXloM015VDhHZERUZlpnQ3dwRHMwWWdDNFkzdm9qMG1kMG9XeUdaNDVv?=
 =?utf-8?B?MmZLV1NFM2MwQ0pVVXJ5Sk5iZXNQRWlSRkh6V05YNURMdlNXa3RrVG1uNkxj?=
 =?utf-8?B?dVRQMzFvenh5UStSZ0R3eTR0cGwrOU9mMXJtWTFqVDBjTFg2NzJmV3Axa01Q?=
 =?utf-8?B?SG9VaDNNak4vdnBvWWQrdlFNeDhhQjJub1d0TEdtVExZRUVjcE1JaGRsMUIz?=
 =?utf-8?B?UjBTVm94TGpTcThaWDhyQVdnQit3TXF6YTE1cW96UzRoaEo5QjExMUJPVnJN?=
 =?utf-8?B?alNhM2VjQ20wUkkxa2NCelUwTE51eE1BQy9sN1d3WlowajBwbmZUU3pweVBC?=
 =?utf-8?B?TmEwV0tla1B3eVZnblJQa21UQmpTc3FjMjZFUTAyUWlabFV4REtDM3A1TU9z?=
 =?utf-8?B?SFBPVGR3QzJGYUx2QUI0cUk1WFlQOTROdzJRa3BBbUh2M2hJem0rb1dMTC9Q?=
 =?utf-8?B?R2tQbjhmYUVqMmZqZzgvYWhGcjR0eUcxb0RiWGJ5b2dScWZGenJvTDMzMlpP?=
 =?utf-8?B?WGVlWVh3ZWNDaUhwWXRiNzgvbWRZeTBXV2YyOEdZRDBIVDhLdkloZEt1RGw0?=
 =?utf-8?B?NXdvbnJiQVNKN05XdjB1RGJPT3dMWnpoR0pHMHk5dno3a1VFNVlEYkxWc2xP?=
 =?utf-8?B?U1gzRktWOERCTjNFSTU2Z2poRFVUcE42elgzNlR5VXJxRFgzZ3d1MFhPeGhr?=
 =?utf-8?B?YnpUaFJjTzMyUXh2OTFKZ1k2N1MxSkRtT3M1cHo5TVNWZ2pteVJRVW9rOWd1?=
 =?utf-8?B?UWxQRHpKQ3R3U0hiTHllM1RtSzBpd2RaNDc2SWZkTkZNSWpCUWlUNFRrTDlN?=
 =?utf-8?B?TWlrblh3bk5ZTXd0R3pXRnIvcUJtcFBFY1BwYnUzc1JzSDZQbnJMSGZ1d1dV?=
 =?utf-8?B?ME16dWdFUU42YnpFKytJcThKcTJnL3RrdHdiamxwTmN2SkFTK0lqNDlTK3lJ?=
 =?utf-8?B?Q040U0JHVjdnb0xWdlRxRE1NQ3NGOUJZSWtXRHMvSzg2VlNPeWhvc0ExYzF6?=
 =?utf-8?B?OEJQQzFTMGtXWlp1Ujk3UXV0bmp5bUIzRW1TYyt3OUtUbDZmNjZ4K2E1N2hT?=
 =?utf-8?B?d1AwTmNheTFoZi9PMFZNVDZBVkxQbEJ0Z0xFc08rZ2hvSWRsbElSdEx4Zzh0?=
 =?utf-8?B?UDNSVHU5dUtHOWpSV21MSUdBRkJZY1MrdWdKbzJ4T0F0c0YwcDZJQ1lkaXFn?=
 =?utf-8?B?NWEwN3ZkZTI5SndzYmZ4SXdrMjVBSExBVGxVd1ZZTnRKUUYrd0tVbFJzWlM4?=
 =?utf-8?B?dU9xZytxYzZKU0x0WHBIdEZKUHBTeTNRTTdEMXBlQkhzWUJBeDVsaFZJMEFk?=
 =?utf-8?B?VllvaW01NGR2ZzVTNElpVmVmOW9PZkx5Rm9ZT3FmeFdyRGFGTWtVZ21HRE1l?=
 =?utf-8?B?aU9rdksxSnFHSkh0UVZ5SFdjaUNFdHhEeEFQaW5va2tsVlh5blh3Q0tUWWZw?=
 =?utf-8?B?VUYzVjZWWTNaUHFZVTR6eit5bFRZeDJIbmJyWXcrM3VLR2t5TDV6OUwrQjRH?=
 =?utf-8?B?VFFFNHVpQ0ViMFdIcVRaemM3citpeEVZREp6ajhBRlkybjdxY3pBTkw0cGhP?=
 =?utf-8?B?SDJpRmtha05NTGpEaTgvZitkOXpxaitqMzNJWmJXOVMwUmN6ZUhCQlFpTUpZ?=
 =?utf-8?Q?WTVS0K1EtwI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elorUzJJR0dBNjFmMlNnbm1IeitQUlBKTmE5ci9oeW9OVWUreHN5OE5lWmlH?=
 =?utf-8?B?VmVzMHQ5cm5qUlRKNUdpOHo0Y3F6bGdrSUxFRGxTdEFEZ1V4SC9XajFUbXZQ?=
 =?utf-8?B?UnAvM2dSYnZXY3oyT0pkcmR0Ny8razNaQTJEOVJFMHhPL1BwMlk5TzY3RThx?=
 =?utf-8?B?cWZ0WFk5TU5qQWlITndLLytyNHNCQVVuSzE2ZllmTTZxSXF4b3p1dFU3MENU?=
 =?utf-8?B?bDhJWENVQTJhcmdJdXc3cjk2YXp1d05XM3ZGbXB0UlNhbkhRenptdUE1ZFJQ?=
 =?utf-8?B?Q0JtdGoveHdiQmNtcm02SUJMeWZlUWN5SmtablN5UXAySkl4ck1rUjE4dHlh?=
 =?utf-8?B?czMyRk11QmR1VTFidm1tYVBuSTl1bkliRXd2c2JSSk1seUErc2ZNOU1BMUR5?=
 =?utf-8?B?Mk1EWDdKSkNDZjgvOUdLNVRBWGhnOUxjaW1WWVdveTE2S2FCd0RGSXNQM2V0?=
 =?utf-8?B?d2g5N2ZXMjFUUnpONTNFcklEc0V0WmhPSE9Gemd2Z1NjVlV4YnB6dHp4V0tS?=
 =?utf-8?B?SHdlZm1KUlh4cVg1TUYwc281c2JxNndhckFORHhxdDVVazVXTjAwZTdiQUh6?=
 =?utf-8?B?Sit3a1lFTlVyS0JtS0FORUU1dGtOM0RTL1diUXlaWjdSM2pmV3ZUS09mQndQ?=
 =?utf-8?B?bWZGVTJsNjEzMWVTcEgxb09RdThWMUI4ckdGdzM5b21DYjJhZXg5ZHhSb25Q?=
 =?utf-8?B?Z25vTDNnZnBFRlQ1NE5yNm9nK0FaRzhyZkFuMm1EZ25GdmMrREN1YlJ4b2d2?=
 =?utf-8?B?QmQxSm5yMGNQYmhCNHhlYVdXNkdlVDBvL1JQeTRLWCtkUFNvOGQxOEZFR3dy?=
 =?utf-8?B?cUxUYWYwUHFYTDYzUVpjZVNsV0lETnBkYkpPWVVMeldoeEQ0ZS9EWTltQVFT?=
 =?utf-8?B?S1JxZldBZXZYWXV2Z0xaRHhXRUpjQksxTUhKQ1FjNmNZaDZzZUFxZDNkRHJl?=
 =?utf-8?B?T1RYazNxRklQUU5tOG9Iczc5bXpPK2EraTdya1lYdFRSNHhZWitYalIwNXlM?=
 =?utf-8?B?YS85RFNFUExlclExNmtUTzk5cHRqaG9kQk5jNFJibk8xTW91TXY2ODk1VlVh?=
 =?utf-8?B?WnhjbWhnS3BnNE9GLzhETDkwYmFYdENlQ0s4T2M1Kzd2Z2tJTFBRaXM1WGNU?=
 =?utf-8?B?cDZIb0RSMDdpOGxHeDZNR1prbWtTNWN1SDZGcHBEaGkvYWgvSS9sTTFMVkIx?=
 =?utf-8?B?ZDJQN2Z0czZSVFJmdjlWV0RLWWVrMFZ1dC9aRDExb0crM1NWOFB0L3dZYjhi?=
 =?utf-8?B?WU5zeGxHNml3a2hQRkJPcjlwbEFKS3RRS0lMc2RrbzQwUmNSdVZYUnE1TDVU?=
 =?utf-8?B?ZlpkcnUvSGptQXN1aHBxdkpNbUVBRDJ3VW9uQUxDd21wM3VUYWRJMS8zRlIx?=
 =?utf-8?B?UHNiQ3lOVUs4ekJCSXpwdUlQU2lOUjN6VU11ZlpvY1l1dVdJNFdaV2FPQmFv?=
 =?utf-8?B?bUtMY0FhZzFyaVZXNVhGWDBtYjR5V0R1VjFPQ1VxN1p0cjducXVIVjdLZ2dU?=
 =?utf-8?B?Rnc4aEJiZ3RQMzJUM1BYZHlOMlF6NWNsREtzdXpJSzNqUmkwWXFycEt4aisz?=
 =?utf-8?B?bkFJeFBpWmpiQzdBejc4T2lBTWViTDVQcGxjRWltbStmd2tBcW5KZlNacksv?=
 =?utf-8?B?MDl0d0toM3M5MDlZK0JOcTlKTlpQNk9xVTZtaHFXNG5VQjBCRFBxaWRMZjFN?=
 =?utf-8?B?NFZnNnc4UUxYVUtCc1l0MktLR3VKcmg4MmRVdGRhdU9iSW9EV1MyeERITjQw?=
 =?utf-8?B?NUI5UE9nOHpIZzJqRHJaa1hIL2VVTSs4NGF2b1JoaGxGODFJYXMxSE5JWFJy?=
 =?utf-8?B?RytvOTN0aUxUOTBmMzV2ZTJvMTNOVzgxRk8zVWFuYVIzYlRDbHVpQ2h4dXNP?=
 =?utf-8?B?Qm5RZjhWQTNrajNIUTEzdmJTa3N4bFZ0RE9iRittb21aQm52cmhNejlETGN4?=
 =?utf-8?B?T1ZDNkczNWlSWVJqY1JlLzJoaTNqZGNkaHU4T0V3MmdVVnY2cXRtSDI4d0hk?=
 =?utf-8?B?SzhrRzV4b09HVlJpZWI1bHBRUkU3VEFVN0g2WjIwMy9UZE9xRHVEeEpQR3Y4?=
 =?utf-8?B?NmVWTjRYWUtzVW5wSi93ZkR0YUhrTlJWUjlUMFV2YjJuM0R6ajNGNVo5Ti9I?=
 =?utf-8?Q?tIPwxsS4cxsMx/gMDS/XGpcL8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbaa99c-c10d-4f23-ee58-08ddea8800f0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:20:01.3248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptoucvLSmp+wL4EoR526mRbwBqxaB8/3EPZQgy/KMDy070YcdOB32fHDaWcwd9TQwtmpw3cMrEcyb5iqocTsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708
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

Enhance the hmm test driver (lib/test_hmm) with support for
THP pages.

A new pool of free_folios() has now been added to the dmirror
device, which can be allocated when a request for a THP zone
device private page is made.

Add compound page awareness to the allocation function during
normal migration and fault based migration. These routines also
copy folio_nr_pages() when moving data between system memory
and device memory.

args.src and args.dst used to hold migration entries are now
dynamically allocated (as they need to hold HPAGE_PMD_NR entries
or more).

Split and migrate support will be added in future patches in this
series.

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

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h |  12 ++
 lib/test_hmm.c           | 368 +++++++++++++++++++++++++++++++--------
 2 files changed, 304 insertions(+), 76 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index a0723b35eeaa..0c5141a7d58c 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
 	return is_device_private_page(&folio->page);
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 761725bc713c..d8216fbae1ba 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage);
+	zone_device_folio_init(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_WARN_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,66 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE)) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
 
 		if (WARN_ON(!is_device_private_page(spage) &&
-			    !is_device_coherent_page(spage)))
-			continue;
+			    !is_device_coherent_page(spage))) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
+
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
 
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
+
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -879,11 +1024,14 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
 	start = cmd->addr;
 	end = start + size;
@@ -902,7 +1050,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -912,7 +1060,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = dmirror_select_device(dmirror);
+		args.flags = dmirror_select_device(dmirror) | MIGRATE_VMA_SELECT_COMPOUND;
 
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -928,6 +1076,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+	kvfree(src_pfns);
+	kvfree(dst_pfns);
 
 	return ret;
 }
@@ -939,12 +1089,12 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns = NULL;
+	unsigned long *dst_pfns = NULL;
 
 	start = cmd->addr;
 	end = start + size;
@@ -955,6 +1105,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1124,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1134,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1155,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1166,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1366,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1382,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1413,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
+
 
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1449,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1378,18 +1563,30 @@ static void dmirror_devmem_free(struct page *page)
 {
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *folio = page_folio(rpage);
+	unsigned int order = folio_order(folio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+		rpage = NULL;
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1397,36 +1594,52 @@ static void dmirror_devmem_free(struct page *page)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
 	 * the mirror but here we use it to hold the page for the simulated
 	 * device memory and that page holds the pointer to the mirror.
 	 */
-	rpage = vmf->page->zone_device_data;
+	rpage = folio_zone_device_data(page_folio(vmf->page));
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+
+	nr = (args.end - args.start) >> PAGE_SHIFT;
+	args.src = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1434,7 +1647,10 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
@@ -1465,7 +1681,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.50.1

