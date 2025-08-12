Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F769B21AD5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B55D10E576;
	Tue, 12 Aug 2025 02:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JUzpHgsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7998510E571
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+QyMEOz+NDM+IXSjzQ7gpkPrcWbuMvl1U4U2r/a5yIVgbxlA7IRI5PmRP2+IzEhYV6FLtSyNnOqv7rtkJgVbUbw7OQBVZSoIuVF+L0d4qSZErFXms5GPiLK7u6GI8YgP3C1NfJK1bLZWtSlg0WZB9BwCJCu+W+Lm5WnpTma0OTchZDinRHbwW7onnhxsnTL08hpyLNE6veOCguc0/86oKR1M2pFo/WqmY3NEWRY6GDurtYV/nCQtpoNoWIGT+bpAexDzpPhT+NfCInu9gxxAdTbqAkx84E0jPOi/g2lrgt03vpXQtbC88RmnvZOQgGH53ceGFAyo7iCNNdzQaWqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY9WdugDnPOocmfuNJVlqZJtZk2WbFvx/um3nx8BpdM=;
 b=s1pOkoIR7/vmmBMI6sVP91IJMP5m/Tw+0oFxfK3c0KMRbnAWlqotgtj2kxeq09kQ5eHW8B5dU5Db8Hiv15zUmlzA1NuNqeYHXR+U6721dYnvlLuIsKFr6UbykmWrohcoc3GgYPnGnXw6AgSG+JTnPyCuRJkmq1KxeNVpy7bh3yp4bCfGsIt8wqfGSEjNy+HJ9zwwEmUTaKmx3VGBzUa2dcv5csNBc1y1AnaEuCFFecyv6usRxghlLfOkp2h6/nnUHhSKBK5uHglKR5qbugigbgCYU10HWSaOLBCJGIzlOnSIR7CPeRjLgQTbzfJFmPaf+rhxat85qc+q4pNhkCHHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY9WdugDnPOocmfuNJVlqZJtZk2WbFvx/um3nx8BpdM=;
 b=JUzpHgsGBOmGVGkw+TFOtKcDCm2rFz08oa2Y4uAUdhlDDwiAnQ2WPqa16pUXyu90S5f1HKSP/OTALA6MV94sQr3B1RHY8JdI3S0imgslKg5LA8/FRZVl4b2g1xVcxNU5+hrNwTvzTjV/UYo21zrwcMFVwEORLDvDHQEmcoLHbvCOPi5Z793n+X5mkFcvhgIKVs6snmMG6+pxIj+lqYGt3iA8eeMV1qwHuGot96PsXRWyXQ8pQEx9HRdmqLNZv/YlrI+/QCSI2mX0udaY7FHfPZ9vGXLMb9s4Fj65nZJ5jvCvO3AWj/3Qi2n+O5bLulO5gMCtSM+1a0LCRW3/0GyrnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 02:40:55 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:40:55 +0000
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
Subject: [v3 04/11] mm/memory/fault: add support for zone device THP fault
 handling
Date: Tue, 12 Aug 2025 12:40:29 +1000
Message-ID: <20250812024036.690064-5-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY0PR01CA0011.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::8) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc0e0a6-0b58-419c-acda-08ddd949a91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZGQTdwYUxTdXFpUHdhbUpBT1RNNTBhdU9ldWNjNDZBK0NrNjcrQi92QWRn?=
 =?utf-8?B?MWlVMnc3aFVObWpnSzZPVm5VUENER3BTYU96OU4rMEIrMlEybGtwQlBsczBC?=
 =?utf-8?B?QWlYa0RUK0tQVnVJbFBJdmVwRDQ1b0tRS2JrRXIrKzdUc29KSGFiTTM2R3E4?=
 =?utf-8?B?aGNyM0VyU0lMLzFsalROLzJuVjdIdm10cDQvb2lSZXFEaDhKcDhieWdKZ1hR?=
 =?utf-8?B?bzUxeHZaSnBmcVg1bHc3eS9icEhzRm0zeVA3UkZFRTl1ODJQVDM3LzlUOC9D?=
 =?utf-8?B?MEZMakV3bmxQZEJHSlZHYXBXSWFjYW01OGIvQWljYUVqOUlnREh5K3owdk8x?=
 =?utf-8?B?R2FMT0xYalc4c1VrVkdxeXpqNTVPTDBMZEJOSW9yMzNjNDl1blA0Ung5YjJB?=
 =?utf-8?B?WnVQZ0JOSzgzS0tDbXZmQ2RqbTh0ZVJZbEYwbGVyTnZFNkdlZzB5WkVtVUhV?=
 =?utf-8?B?T2NEalVoak1DMmhoSGJPSkM5UktkRzk0VXlKeWg2OGNNNU1zczNvRURKaG42?=
 =?utf-8?B?eVV2bWthVDYwYWtlOWQrVGxRKzV6N21FS3lIOXdFSXkzTmIxVjRzNEJ5Y1dR?=
 =?utf-8?B?ekl3MGxWU0lWYi9vZTlLbzJHTlVhTXhMMVkrMTlCMXhWdVNEeEpOMnI4ZGU3?=
 =?utf-8?B?KzUwdG9GU3Z1Q01lZTM5U1dSUlE3QUZPNzh4V3BXTlZqMERrNDdseVJxYmRS?=
 =?utf-8?B?NENIdGFEWnVOTGxIMVg2ZWZvV0xtQ1RlVHJIZWhUOWNQczNJZEhWU2NkMFRx?=
 =?utf-8?B?SlMrQ1RmQUdSaXFIaHhpbG5lSHdKUlVhbkE5Rnp2SU5DN2hwUzJYRU95cDBK?=
 =?utf-8?B?NEJLNmc5QTdLbVhTVG1COG5MaW96Lzd6MEdld1lOdVc3dWN5WGQ4cUxhc2Fm?=
 =?utf-8?B?dDNidWFCdXYzaHFDazg2VWxrRFZaQXl6MTlNeTZaUkxtYURrVmJCKzlSM2Y2?=
 =?utf-8?B?TENKbmRMK3RBMitZMGIzak11YTVmdm1NVzJBQ2JtMGhpajBiMlMxWjY1Mm93?=
 =?utf-8?B?em12SjRvd1hJVW1MMjJtT1hLVFpSbkdsSDdGU1BFUFR6R0xCNWNaTCt6VWpw?=
 =?utf-8?B?dGc4NFVjZjRERWJZby9pZVdFMGJ5emE3T0haUFlWOVlwdnMrRjR6L1h1eW5q?=
 =?utf-8?B?N2xIRFlpOEMxTnNOUDg3b0p4Y3Q5eFpOYWVkRUxTaExtK1R0cG1NeGp5YXZI?=
 =?utf-8?B?dkEvRFhQL1NINWowbHh1aUQwMzJrWFMyLzJzQ3lWRHYrVUErb0pwZU5na3dh?=
 =?utf-8?B?VVZuSlczdnNQNTQ5czJkL2VMWnhyTkJDeVNwNFNkeWRxSExFRFBGbnN4SGFT?=
 =?utf-8?B?VlBkYXQwT3oxYVdLdW0wNE9pTHYxcHl2RXZaOUNtdnE1azM2TmMzaEJvOG9R?=
 =?utf-8?B?VDRVcE9YNWYyRVZLa21ITmVjZjQ0Qm9mL0lpeEJFZFhrd1RRaVJJRHphRWxa?=
 =?utf-8?B?SEpjcy9PZ2xVU2xwN0V6NURuOTdPZVJrTVVFQXNiWnJHS2kydHBZRE9TY2RP?=
 =?utf-8?B?WlU5VmxoWEt6M3ZEZXRlZXM5S0I0Vm5TL1VXZ2diZERaNWdZbUhvb0tra00r?=
 =?utf-8?B?V2wwQWg2bGZyZTdJVVQyaHBlTmkveGtGWnNQcmtwZmtOQjZObHh1YUQ3ckxl?=
 =?utf-8?B?eXRzdWJ0RXJSbkVsMUVNMkdQRkFjWXE3c2dSQS9ac3NhV3FWZ21ybDBxKzND?=
 =?utf-8?B?NG9HUlgwZVhNU1Fkbmo5cVp3VE5XZjlCYjlEMEsxaW9rSEdaWnpoNGd2NUdw?=
 =?utf-8?B?b1hRazlvTVhCUUs0Z1FMQ1I4Q2NCYWtuYkZrUjBqZS94NFRrUWp1c3l5UHZO?=
 =?utf-8?B?a2ZOMm1vMVgrWWxyWFdFbmNGWDEvR3Q1QktJWStzdHlBd1JlbjMxeWlUSjVI?=
 =?utf-8?B?dml6QlpPTEwwMWJ2WXU0VFB3ZVNURW5sUzZ1cUp6Z1MwZDh2VUVMTG1Mc3VF?=
 =?utf-8?Q?rREEO7aJR7Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJCUTJvSmUvTWwxMkZ6UDNsQkc4ZFdkZjc3ZHFzWXBFWWJKNE4rcWFNNlF1?=
 =?utf-8?B?WWppemE0NUhHemtIaFdvWFQrTDk5ajBUYURtWEY3TTdpWm1tUEl0T3RqTFRX?=
 =?utf-8?B?V1VLS2NlNXFxb0kyL2NFcWhOa3hjOThLbnRKTzIrMVZmMVB0WEJkUjBDR2FW?=
 =?utf-8?B?Q2NWVFgvOGFuM3R0VHo1WWRyOVcveUdoa0xRQ29pdVJJUDJ1dnRWWXpMRElW?=
 =?utf-8?B?c0l3R09lV1QrbDMwT09Pc0xGMTdKa1JGSnEyRy8yamNmSUNLdUxDVWkyV1Ar?=
 =?utf-8?B?aER0SlFwT3RkaEpkendWREJxOEtWVmREY0hWUmFZaW5NUFZXa2FGMkwvVm11?=
 =?utf-8?B?U0dQdktiU2xlYXptc3NIVkd1bWNBelNwNm9scm9Xc0wvT3VWalQ5dC9uWkNW?=
 =?utf-8?B?c2lTT0cyWmNxbElJS0hySWZ3WlVuQVdCVVNEVUhmdGVIM3YzcTNPMWZrL1d2?=
 =?utf-8?B?UENOa3ZsN0dTN1J1dHl6d3ltVGdTQVhKNlQzbjhJaENnb2diRlZocnZUSjB0?=
 =?utf-8?B?SktBbzdRWUQzWmVRd3k0U1l1SUs2R3pTQlc4MzVRSHc3MXRHSFhIUkRGZith?=
 =?utf-8?B?MTdYWjF3bWhtZTVLUjhxZUMvYWEwcEZCMVlCVnh1VlliKzVSL2RlcG5uSVdl?=
 =?utf-8?B?VDJaTHovME8vNFpaQldCMHpOdXBUbGxCWnZSWVMzaXFDR0s2cUxpYkZ5bDk1?=
 =?utf-8?B?ZDJKUDd5eVlRS0JlQVA3UVlleFpBbERSekNqRVRaMlEwbzF0Mkcvemk2clZS?=
 =?utf-8?B?Y0ZFQTVuSStWaUlyWjFzbG55VlY5WHNURlZwL2hRUWxHblZacDVBOXdhMFov?=
 =?utf-8?B?UmtYVC96M0hBcU9JYkRqOVdWYU0vSGJDYVBKZUlhTVFLeFRwTm5Da21TYkFm?=
 =?utf-8?B?WkZjY1NXbkUyb0JIaldXRklpcVg2V2tTeFdBdkMybVNCU3N2bFhEUE5iQkNl?=
 =?utf-8?B?emJSbFgzYjR1YXJlZVJuZGxFdlpWaURPYnpoYUt1eWhrQk83WGkrYUpKOVZE?=
 =?utf-8?B?dnNxazdaNmM3TzNRc2FZRmVYNVBPNmd5eEo1cmpwd3BLSXRGUmp0ZjJJdW1M?=
 =?utf-8?B?K01sdnQrYkE1WnRBMzBvZTdnL3hsLzFZakhCYkt3eDdaeHgzaE1qMFVoVUhT?=
 =?utf-8?B?OHlDN2pQOXkwUWVnYVFBMGE5U3BBM1RTMHV3SXJKM2NKM2hvSWpXNm03b0RT?=
 =?utf-8?B?dTZiN3U2ckRYWktreEE3cUZ2bFhBRmoweXI3MnY3Z2E0cHZjRytDdmRwOWFQ?=
 =?utf-8?B?aFQ3Sno2TzhrZ01ZbldWZE5VZ3BWb1p0cW4vRFgzWnJabGZiYmhqOTNvazJV?=
 =?utf-8?B?SHdFYjR2RnZZTEllWUQvYzVCdWZ2VUxuWkEybjlSSHFlT0hFZXEyTVhiTFVZ?=
 =?utf-8?B?L0RmM09zYnArU2hDaER2T1hpRi8vTkNDblY5bHdhaVFJcUw4UUpqaVdyZWVG?=
 =?utf-8?B?NGFpcjQ2T1doZ3Zwc3l0T0o1aDRaLzZNZFRiWkRKbzZjakNHbXdzaVN1SnJ5?=
 =?utf-8?B?cWtPa3JMLzZVdjVBVHc0N3N6a0ZYYWsybVZXS29XTnkwRDhLNlFyZzBoOHB3?=
 =?utf-8?B?Nm8rV1ZGTm80MldPOXhINnVwbklKdEFwN0ZrOHNmU25vdmkvcFR0RkJsZjRo?=
 =?utf-8?B?MThzN3ZoSGduWnBUL2UrVm1NZFRydVlUSU9qL0UrS3NiZ3ZaUjAwais1RWww?=
 =?utf-8?B?NFQ4YXRrUHRmK0Nmd3hzUHMyekNmZW9PbkoxNGxJRjBrZEdvRUZ6WEVLNFJS?=
 =?utf-8?B?VlNaRnpMUWoycGdnZlltc0JwVVpJZzNnT0krKy9zZE8weVZaRWVIUVg2MFhm?=
 =?utf-8?B?UTk5WnQwNmc5S3laT0s5RjFsSis4Y2ZyeEErZ0ZMeEQyQTBUeFd0Ky93TnVh?=
 =?utf-8?B?Q1pidzBxUWxPMG1HR25jNjM5MVJCMGF1clFVR3ZiY1F1WjlQZnVPYldBVXlJ?=
 =?utf-8?B?TVB4UE1EMi9idUJMR0lwQkwxUzF1VWcxdTMrVTFmSjZvamxTMzFSWWFTM0ZP?=
 =?utf-8?B?Y0xkZ1JwUmVnQTJpeTNDSU5ZV2dBQnFIejhDektCY0lNYW0wdElHYUdjTXV4?=
 =?utf-8?B?WmFSQWFmbm92U0l4RzZnVXVVTXlPUEJiZnZNQjRDbkJ4K1ZOQnB0WHo5Y1Av?=
 =?utf-8?Q?4mpeISP6dLY3lQOVY6UkfDpxQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc0e0a6-0b58-419c-acda-08ddd949a91c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:40:55.2206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5mHGOJCJ17ELfXVbWFVRM+tUK0RBJ2Y0Dxj90N7JRjhDr1DnbxtVrDr/1eZBz34/6jF3PxMffdOXE/IRYH7eQ==
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

When the CPU touches a zone device THP entry, the data needs to
be migrated back to the CPU, call migrate_to_ram() on these pages
via do_huge_pmd_device_private() fault handling helper.

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
 include/linux/huge_mm.h |  7 +++++++
 mm/huge_memory.c        | 36 ++++++++++++++++++++++++++++++++++++
 mm/memory.c             |  6 ++++--
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 7748489fde1b..a4880fe98e46 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -474,6 +474,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
+
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
 
@@ -632,6 +634,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
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
index 2495e3fdbfae..8888140e57a3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1267,6 +1267,42 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
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
index 92fd18a5d8d1..6c87f043eea1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6152,8 +6152,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
 		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
-			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
+			if (is_device_private_entry(
+					pmd_to_swp_entry(vmf.orig_pmd)))
+				return do_huge_pmd_device_private(&vmf);
+
 			if (is_pmd_migration_entry(vmf.orig_pmd))
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
-- 
2.50.1

