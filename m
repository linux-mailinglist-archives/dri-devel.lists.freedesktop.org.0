Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68EC55C5E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 06:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802EB10E233;
	Thu, 13 Nov 2025 05:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MLjenyDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBF310E233
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 05:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSoCyJ22xiA6Bpp1PUlIyWjshHJTTyKhWxc1cKhChzBUjrz7k/FbDXr/pCj1v/sLyZqC0A5Xd2gbTvACDq1sYrD56Jq5A7+p0Xy0e0zcgqkyhGaFVDgX1IbJeiN/F2gmSR0h3cSuXXn5cDITUM7ipW1O9to2+nNr39+LcY4mpxWo3jEduldAzj6meTecE5k6XhykpAtmDE/kHlrnTBark5ybWfArt+a4eTx1VDy26Rt5iM6oPsT0C2YFH7W1cpeuu7xXBAnfHCd3au05UeUY3xrIwewBIzQVxtGgX61eO0K6bgiM5J+YeqERfaVdxGp4aJn548ySWUUUKeoEf6c8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+KOso5kuzdb0mKYxnSU8eASV1nTnsUiupIbhzVcmKw=;
 b=aYsuJ41R3x1zHmTP2Wb2J+h3cLH33kZjM7AOwIBBt58q/ikOe4Mq9EsMIwbEuG0WMBhWA+WCL7IbqUnBqENJVnx9EQoByh3BbwHze4NBU7+n5dgo2jUGR/DwQ4/b9IjHQMTXzF7K2JnPoZDMheUXkZq26usAZ/iIbw27EhUdlqkdGEeiLFdJZEUTazZdFtOlDKmr5gZRzW156hEpwE414M6nUJDkWzGI5bXh7XnklWoQpCbxwVNmpQubRhJ9gA7gOaJI9pqmodpbm5DEvFzl893+eaiZrzwqak8Ivh+2YtHtpdlXk6S6oq1FX6hUCNglFm2l8rqzgtNneUUZTzG1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+KOso5kuzdb0mKYxnSU8eASV1nTnsUiupIbhzVcmKw=;
 b=MLjenyDsCBJGyIs8XbPvwa+KPNHAT6xXZS+urZsl3M227IqK/5u8zU6KFYD6J4a9Z3NJ05ZdqWsJHTie4xANDpXqpgIDB5V3iz892VDr4siF9yY3uxGfqcYFqPp2OrAkKXhLNMSNci8f1eqFsao+1cUf6sRARe1Lde6h3LRs5lHUsBpVFjDXd6ghpOuAX/2/dPDQQB/NrXI0X1OmLzG4XvsM+v1gm4VSy9w97jCGB2lROGQx+GaTq6PNmzKM0tLrV6T7rdlefAjJ8XK3cZkL4Ef45W4Gys7aPrX4D83jz5K9Ykbv8LRWtVuwgS0Bg4tl1IXSyCnwOcUgwgW1ZnFRcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 05:13:57 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:13:57 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
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
Subject: [PATCH] mm/huge_memory: fix override of entry in remove_migration_pmd
Date: Thu, 13 Nov 2025 16:13:52 +1100
Message-ID: <20251113051352.1753714-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0035.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::10) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV9PR12MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0009d2-2a2d-4d33-5b2e-08de22737290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNsNTQvQ0lBeWVoSitzKzBqcjBuYVdHMjVvZEtMNEVFajlHbC9MaUMxSHdu?=
 =?utf-8?B?SS82Ti85WEFBRkduQW5MN0FmeFZrTGt6dXJObkNHTTg5OVlLUmxMdzBMZTlH?=
 =?utf-8?B?ZE1sZzNVU0Zvak15enNkQXp0MmdtZHFRQWdGT3ZFY1p0VDJHR016MkN4cHZZ?=
 =?utf-8?B?VWNLZTFYWkRlT2J6RG94aW9Oa1lUVmNqQm8wUnFYclUrOUphRUFyZExnWEFI?=
 =?utf-8?B?WGw5elFiRHZuV2ttSTdEcDYxK2J6ZEVDNUEwaGlQUFU4ejRKUkFrREJsTnBB?=
 =?utf-8?B?V1p4dGkvQmJ2bUhhM0pFYzAvdXBKWWxxYVZJN0ZudkQxbXFWWTdZSEwrOGhu?=
 =?utf-8?B?Vy9qZnFRa0ZjdTRUYXRiZXB2U3VxdjJmY0orZ1c2bGJtQlJ6OFlTTitKeHVU?=
 =?utf-8?B?WCt3NmFWRHF3dHViaXY4VVFaN2UwaWY3UzEzOXNJNER6MjQwMitMd25OQzB1?=
 =?utf-8?B?UHMyWjYvQTYrUkVOd3RpZFRQKzBEekpHOUxuU0JmOE12ZlpkMHhRL28yWVpj?=
 =?utf-8?B?VnZGd2Z1Z0JKZENJdzlpci9GOUJrTmM4RHlqZzMwM1hURmpDWGRDamZUanZv?=
 =?utf-8?B?bGxweU1keWZDaFZ3K1ZDcU1IV1JnUUtyVXVUSTdnVThPT2h0b3U1MTVMRWFL?=
 =?utf-8?B?NG9WVkJLdldQa3lzampid1I1d1RNZ3UvNms0Y0Zydmx5YWhkQ0RScE9mSXlP?=
 =?utf-8?B?SU85SHdhM1d0RlpZbGRNUENrN0ZSdml3cXUrSmY0aTFET2hPamNpR3laVnNO?=
 =?utf-8?B?M1Vvc3llSkpYcStkNmhlM3c2NUtMUG9uaGhjZnlCeFJTTUk1UjJYT2oxWW14?=
 =?utf-8?B?WnNBaHNPR3UvNUVVTDQzajJJWDdTdXdrOEFNdlBLNzF4TWgyOENqRDV1WHly?=
 =?utf-8?B?YkZaMk1tZnpDV1RwdGxiQ2s2NXpacE5mT0lPcTBlQUM0VjhVdVBHb1RMWGpw?=
 =?utf-8?B?cVJyMFdHNlJPY3RCbXc5dzFKWkJmVDBNdG9vSHNZRWtPMGI3K25kMDF6ZWtP?=
 =?utf-8?B?MW53bTRtVEdtb0JSU3g5T2Qxa3Y3TStKOUhxQjRHQXZrUVVLa2J6eXM0RWxM?=
 =?utf-8?B?YjhHTTJyZWIwdGhiYlVuTlNUZVdMMWNVSzNkbUFKdkFGbkxPUWwyZlBrbkZt?=
 =?utf-8?B?WERoVk9uQWlWemRDOWFlTndwVFR0bDJ4SDVrR2JRSDd6VzREK25nbmZwKzEr?=
 =?utf-8?B?ZnNqeERCc3lGdi95SGJueWZxdDNxSmxqam4raVpyNXp3OWRWT3dib3lNdUYv?=
 =?utf-8?B?Q0VRcjFROThUT2l6Ti9NeEcrQlNjdHNiaW9yYk01a0FHRkphcHArTnNHRHZR?=
 =?utf-8?B?eWlUMC9hUXZtVXdKMTFhVzc3NWFhWm5aMmU1UUFRVHpERmJKaDZwMmQ1Qk1M?=
 =?utf-8?B?WWYwSmc3MXZvamVjWGFSVTJNVkdnVmxzK29TbnlPTys3UE85YkxlaWlXd0NY?=
 =?utf-8?B?N2MzcmwyZk9WSENhTVloOE1jekdjam8rVkRNRzNrTU5VaUlyZ3ZGMnJBdXV0?=
 =?utf-8?B?ZnpER2h0d0pyK2NMNjdVelZHYUJnZEF6QzBiQnNEcURsR3RDQjhoV3gvY0ZJ?=
 =?utf-8?B?MTVXc2tTa2EyTFZqYmFQNmZwdndHZWFOSGJNSHJHNElhcEVZS3I1c3l5dFUx?=
 =?utf-8?B?ZUNIeDRUSG9zK1g3VGxpTFhleGp0YkdJQ3RoUVZMd1ZJSDVsa1pHK245ZGty?=
 =?utf-8?B?aDJxSjJrdlptbHNveU1sWVVyaVFNbmxpZG5xcDRsVWxOSFFocCtXQ1BrVXJj?=
 =?utf-8?B?RE5tNlNaTURNb3hXSXVnN3gwVkRSRWRTOGlCci9vcG1jSXhIcUNvbCtGNkd6?=
 =?utf-8?B?QzdMSVhFYjdNc1hLWTQ5clpvditMamdLU0N4dUZ5NEhaRUdtOG9nK3MxZXVm?=
 =?utf-8?B?dExxL2l5bWJ2L0QwaHZIZWlsTGh4TWFGSHEvVGVxdUY5M1gxQlRQQ3ZiZnlC?=
 =?utf-8?Q?QbC/ZwLxqsnrVXf4KQFi6NTNoVH4BOdu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXRPM3k1OWJObU5GbmJPK1VsUlN5Q1hqa2krZ0JqSy9IdnphSjdWSHVVeUNT?=
 =?utf-8?B?bTc3WGI3SWx3TkJGK1VIVzlMdTBMOGJxUE1pclB4QlRieElEUjZGYjU4VkVR?=
 =?utf-8?B?bHJMMmlJY2JUUkxzNmdyZjVlN3lhM3ZXVlFDMkFIUDg4b0FXckQ4bVltUzh5?=
 =?utf-8?B?VHdnZlY2MHp4WnIrSnI0Q1F6emZJTGk0WFM4SXRBNHV3bDh3QzRyOGRwWWUv?=
 =?utf-8?B?MWdDMS9TSUhndzJFRXNVM1piRlJYQmdQVHhFZGdXbTlsVFpJOVVZS1FwTEZQ?=
 =?utf-8?B?WGlPZWhmenJSdkVDbmtIUGV0bERjeEQrZCtuai9KLzB5YWpoQ2FDREZnNitJ?=
 =?utf-8?B?NGhFT3JwOEtRZkxwTE80UXYzQXRUZlJ5dDBXV0VENC9SV1hTN0xKdlVxTlhZ?=
 =?utf-8?B?bkVhSlBRb1FldTFQeUdvd09sWS8vcTFRRFJwM0FmOVJRUXdKdmlIMVZmVHFN?=
 =?utf-8?B?OXNodVdDNGxJOHVQUXJmd015cFY1N2dFeUF3YmM5WThRcDNvR0FEK3ltVG4w?=
 =?utf-8?B?VGhhcGhFcTFDV1Y5RVJKSkhQNVRJbnRaWTBCQ0RaMjZzWnRJOTNtcXV2R1ZD?=
 =?utf-8?B?VmYrMFFQbXB6VDlKVjgzNC9qUUlPMlhFbi9nQlJzNEdHdkJKNktldlR6STF4?=
 =?utf-8?B?UW1hWUYwckc2TTB2UUwzTmp6Y0krNTUySjNkR01Kd21LQmtMVkhFRy8vRFVU?=
 =?utf-8?B?UmFYeC9OZjc0WUVzYVBNL3FIcDYvODhTZWVOckFTZGd1YTk1c2hpOWVOQWpp?=
 =?utf-8?B?c29Dakt2Y0hhRkw2NzFvVGRxeGlnSHREY2lFbTI0RlJkMWJCTFpKdURQeTQ2?=
 =?utf-8?B?akk2WHdjL054LzV4ZVlqcWFvNHVyelVqVEUxbHNtRSs5SDhVbXRtNEZnMWZx?=
 =?utf-8?B?cnNoemJ1aGg0QWlQUmJUckRDeGYwMkdmenA2MFhaRW9Rem5TeVd2OFlXY3NF?=
 =?utf-8?B?NFlSRXBNaXpQdzNickdRREpKdGFwN1NLTFRla2N1ZnY4Y05ZQ1NyQXQxU3Jq?=
 =?utf-8?B?bDZOeXM1eE5FcVVFU21WYmFOdnZjMHpLbW1PcG9wdlhqK0x0bUVqSURSVzFr?=
 =?utf-8?B?eUIwQzNXVGswKzk5bHdVU2xqdklqSjVkcTczbTZkUWtzV2M5M1pQVjBwZE5Q?=
 =?utf-8?B?THRXaTZ5UHdzTkJnRHZNMDZrS002WEVURUw5dk9sN2JGeStGWlBWZmUySW5M?=
 =?utf-8?B?U2ZtWWRTSXRuOW9USHBXWnlSK09WTER1c3dqRzRickZ5VmhRKzRVZ09kVGc4?=
 =?utf-8?B?a2c4QjdOa0NTQ0JJT3VyMEVOeDdZejZRaEZDSFU4cE8zSGhpTFVpZWF5ZmxT?=
 =?utf-8?B?SlU4b0k1ZzhzL1gwdVgzanZwM0dBTkZwRmFNQzU0NkVlZ1k2MG00alN6d2NY?=
 =?utf-8?B?VlhIazdSUnBlTE1nZW03MjA1MGM1amZReG43RzJ3QjdpcnR3cnVBNEhpRlBN?=
 =?utf-8?B?cTRyK1pmbWEvTjJlcXBDQ0JOdW9RT1BIcnVaME5PUitKTktrUnVkWHZLN3FL?=
 =?utf-8?B?Q0c4eEg2Z3FnaVJpSURCa1E1U0lsT0xHSWpRaTZuNjRTaUZheDdBS1I2WUZm?=
 =?utf-8?B?bmIvdG9zZUlic3hvdjNGNjlZSFZqYUN1Ykw5SzIxa3Jpd2MwMnJqeFRLWFM1?=
 =?utf-8?B?UFhnU2JPd1dFTVVqSEV6aUExWFluS3k1RzRMc3VXZ2NDSXB5bHJvcmRJYlM0?=
 =?utf-8?B?dW90VE5sVSs1R0ZocG9TMWM1eTlaVXVVc1dCak90bk54Y0VjZEJocEgvWGZE?=
 =?utf-8?B?VlVtTVF2dzBUSVJyMmFuNDVnTzJIRnExSFZoaUh6Z0xLc1RJQlFwYzVuNk85?=
 =?utf-8?B?QUJaQjZNclhyWWgwbW1FajYxZGVUcFpXWlpFSS9VaEtJQmpHeS9nd2ZVckJ0?=
 =?utf-8?B?WU9Ka0pTRFgwVVIyNmwvQUlrMnpENzZtT0dTWmRPbFRZcnlmandFbjUzcHE0?=
 =?utf-8?B?UmxFUzlmY2ZXL3Znd25kNDJIVXRGcmlmbzZ0alhnclFiZkxoU3g5aUozUlpr?=
 =?utf-8?B?WS9CcjhoYkdGWkhyeXIybjUrdXRMdU9JUmk2NWJ6OVZUMWpROTNqN29PdnEy?=
 =?utf-8?B?ZjAvY25Scmk0VW92Wi9saHlyWnNWZjhMd1h2SXFQMTZCOWpBdjYrNFNPd0J3?=
 =?utf-8?B?d2M5RmJDWS9EKzcvamx4Sk82ZFFUNnRYNXRjUXNWbmZEWTI2enpJQ25PUHBa?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0009d2-2a2d-4d33-5b2e-08de22737290
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:13:57.4586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CpN58W2/oQqEDij7dmyxm8Rl6FFgv4sHEoE3e2D2PMQKzry+Aqfhs5JX3ufU/0aDX5XIPXuVSwqfyYTcYLUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
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

The softleaf changes exposed a BUG in remove_rmap_pmd() where the
migration entry was being overridden when the folio is device private.

Use scope local entry for creating the device private pmde. Make the
pmde writable if the migration entry is writable by moving the check
softleaf_is_migration_write() prior to creating the device private entry.

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
 mm/huge_memory.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0184cd915f44..e4dadcb9e90b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4850,7 +4850,12 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
 
+	if (softleaf_is_migration_write(entry))
+		pmde = pmd_mkwrite(pmde, vma);
+
 	if (folio_is_device_private(folio)) {
+		swp_entry_t entry;
+
 		if (pmd_write(pmde))
 			entry = make_writable_device_private_entry(
 							page_to_pfn(new));
@@ -4862,8 +4867,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
-	if (softleaf_is_migration_write(entry))
-		pmde = pmd_mkwrite(pmde, vma);
 	if (pmd_swp_uffd_wp(*pvmw->pmd))
 		pmde = pmd_mkuffd_wp(pmde);
 	if (!softleaf_is_migration_young(entry))
-- 
2.51.1

