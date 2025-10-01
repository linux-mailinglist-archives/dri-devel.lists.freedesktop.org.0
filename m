Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601CBAF513
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D1210E326;
	Wed,  1 Oct 2025 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="krNP7NcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010068.outbound.protection.outlook.com
 [40.93.198.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D5610E650
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyLA17htXA+XUdPw+v/kk9FR7sWYfKBhp0QNM9/WT1IHwNlvjr5J4MgGNfSRUoXzBERpdqhPg31tVjV/WOomBnUAVEmcf4XsNGd14TzMZ0QLRiOqwZWeXGYvfYWRo8ckHQ3y2M35RbR9atfnpHQ64CCga1uhTC9ran/3lOMZALDyVZXFru8vh55FwFXtOuq6SI/FzqLL8TbgEGM0VxbKNIa8qfciGEMnoyrK6p2CPGWCNTn4/rR8+LY8ztjqBVv94M+umgWVzBUQIqnRMLBl2HPmiueAFOmxp2D0ix1totJDewzxujC7u1W1JyEWAAzQ3599XFak/W+qTXV5RjTlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n01txRJv0lR0/+qa8fqOLUodrv003+959W2nsYdpc1A=;
 b=o/iV3QvjeND6l61kpyeO0s5ld1T4p8p3ia8R55mUD/V8+R6/EapWKCCZGptvsWFdyu655VDz5uBNpLdgTThm5fbqcY9TOunG4h5cuIEu56lkdJpGpIb5bS3ZSopoikF6dUAljW3ajs84KN17M3uCkCG15hYq7o1wkIs7yIWMa3O2kXvNJaxS9XUM8Lh/Z31SKSgnFfozwtu+fnKXToCPVOClqUjkJhBZ8ltcnMz7acP6KBOIKkljWpOE5D2+zsc8QF62ElkMdtzo4p2oEPEhIydIYop2xNffQOYzbil58PV3zBRGg6kRLd7VBNgfDOstejeDD7n4mpralZePDO6mwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n01txRJv0lR0/+qa8fqOLUodrv003+959W2nsYdpc1A=;
 b=krNP7NcMBINQzS33SDH0GhOAa0cdPNTuHu4A2g5gHTTFCOTQAFsf6ONl7YBYt3Igj+895tFDerz6u98yotn8ayCT6mRGnYiFNIUVRHMnlouqLaYnOwM5UYhaCMyMVlbeCuHNHgxqUshV6HYqKJDaIWbypZUw6+zQii1aIPSW4bejtJNoHGxfYqw1hokVMUWYcqxudCGRGTgGIEXTj57vtq0sveAua8rd6xQWyrR5+FTz1jNE18HHrRjh4Xn1u7KNBlvY/Nk+gXTtGvmJ1B9VdW7ccylNjo51Mx5AXJLeaz4GdaSCbA8v4Z1ZE59bwiiApHBtSXagX6BUg8XXP/iFcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:11 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:11 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v7 03/16] mm/huge_memory: add device-private THP support to PMD
 operations
Date: Wed,  1 Oct 2025 16:56:54 +1000
Message-ID: <20251001065707.920170-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:8:2f::12) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 65267f84-7d08-4993-c9fd-08de00b7e294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFpNT3dYaDBra1Jic01leUxCYWNkdFYvT1ozdTVxVTFEQU4wbFkwT3VqdENw?=
 =?utf-8?B?MXI4clFZNWRHaHVGRHd3a2xKRzFuOWx4bno5cWc2VjZ1MVNXRUI4dDgxd0ht?=
 =?utf-8?B?aFhYWTVVRTQ2WktXeEtCS1FlSWVOQ3NQbU1uOWxGQ0dIaXNlZjgrL05GN013?=
 =?utf-8?B?NHpFSEhFczI1OGgvOXNKS3BRWnZzUTBxQ0V0dms5a0FwbmVETFVKUnpvbWRT?=
 =?utf-8?B?SUpjb2p3U21nQjZvY29LZnNMaWtPc0J0aFludlZhM3RxclQ1WWJIcDlPdmhH?=
 =?utf-8?B?ZmMxS01NMHdsdnBOZUNOaDNuOWN0ZStIWjRFMnhiMWovekRsT0R1N1ZYSzN2?=
 =?utf-8?B?OUFKYVRBanMvQWt4RlZyNldCWTJEQ3R6ZXJSQjlnaXJocEF2M0J5RzBVNTVQ?=
 =?utf-8?B?eEVTWHZyejgxR0U2MS9VTlZjU1JVdWhjZDRmYzBTM2tQcmlNSDdhTGRkdDhl?=
 =?utf-8?B?c1JncVFDWlZpUitEbmZkcGt4N2tCd2x5KzhmKzA5NktwWk5Id1NBWGFKcXZR?=
 =?utf-8?B?NWtlNEFER2JYclQ5VDdWdTBBYUZwa282aU1WaWtaTHVDak9xZDVTbHR3a1Ux?=
 =?utf-8?B?OS9UQzVENm9HTXdJdHdTZUZMZzQyL1pzbS8yWDdRdER6VGhGUDVySzh3a0Iy?=
 =?utf-8?B?WWEwbno2ZVpVM09JNXpyNk1SbGhmOFZjQVlCZitlTFQzc0FEdFE2YThCNito?=
 =?utf-8?B?TnFyTTIybG45M3lDYlE0RXhoaDd5Q2gydXRIOTR1UGEzRS9pTnI1MWY5dGIz?=
 =?utf-8?B?dG0yalo0d0NKZG5ETjRUU3QzVVZkaFVTZ0ppN0VLaXgxeE52MjZ4MGhJUm1L?=
 =?utf-8?B?SUhybHBldTFMbU1BYU5NWEc2SHFpcSt2dkFEQmZxVnYwTUc3YlVSQ2FEdlUr?=
 =?utf-8?B?M0xOOUY2Rzk3aFJmOS8xUnlpcGQwa3ppQlJnRi92Y2pTR2FMWENtcU12RzZZ?=
 =?utf-8?B?WkQvNnhmVmlmcmFLRG5NTmJqRzIyYWN1eC9HUW1KcTRvQU9YVGxLUHNPcG82?=
 =?utf-8?B?cWVhckU5L1ZrN3YrOVlKRUxma1JUR3VBdGlFZlpYUnV1MklFYm9TRlJrV1g3?=
 =?utf-8?B?SVZnRkd0czhURFFvWlVMUFMrZFY4a0lTMUhLL2xFcGIvR2FVQk4wR0lnOE0z?=
 =?utf-8?B?QS9TR0JxODNGWFo2T3dmdmNaUVZEdTNrL24xNXZFcHlIMDA0QUhPdDlPSDZu?=
 =?utf-8?B?QjZZbWw3Q2o5azIwSkorcWovTlUwYTRDOGlRM3hTZW9iWHA2Ump1bTZmYUxY?=
 =?utf-8?B?ZENGdEkxRGNua3JyWU9jSTRBb21HcDZGUlNjZVdyeU1WWHhpYWZqdktCUGo2?=
 =?utf-8?B?YXlaT0VFZ0FpZllPems2NDdhVlBIeHUzb1crVTliVmg4MzBTSktVb3FTYTNK?=
 =?utf-8?B?WWExMERuT3JZZXJwL3ZYdk5jajIzRlZEZVNuUU1hZEZzSlMvL1VhMkhuRDJV?=
 =?utf-8?B?RXhlYWxDbVBhWlJBZjFRcysyRlhqeWo4NlRDVWpGVlB0ZzQ1V0l4NUJ5Z0dP?=
 =?utf-8?B?NlU5dFV6S0hnc3FwYXZEUW1MZzJiV1FGV0x2WE9GUjRqU2ZMQnhlUU9UZ1FI?=
 =?utf-8?B?c0h3NlVpSkxTNTIxRkVDeXNWTGU0WjdieHVaL1FWSGhEN01pTEFUd2trZmJS?=
 =?utf-8?B?SUFzenZSVjVDWXkrYWdwYm4xWFNnaUJqMlV0VjFXNjRRNzhrSUh1U2t4V2FI?=
 =?utf-8?B?V3dWZVV5c1FFd3BocVNWdTIxNWd5S1MvVFNmTzk1NzMrWXdFdTdhTzlidDlQ?=
 =?utf-8?B?TXphT0NFUXJXNXpRc0N6Q3Y1NDcrZmxWOWF1Ny9NZXVRY043bHhibk5USC83?=
 =?utf-8?B?Rzc3Y1ZUSitPUDMzNnNtVTBEYUdhSW8yeUxXclVCMENLbGlmTnBmMjlvSWxs?=
 =?utf-8?B?L2Fnbi9KdjVrNnFEbXc5YXFyMS9jZHgrYTJMUUJDTjBYNGIrTmxpQWJyZjFo?=
 =?utf-8?Q?LjKLJsprj3F+HB4QS0XNoavEFJtv1eHh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dMSk05ZWRoUll6Z3lzWlZGbDRzc1VrTVBYY0llY25TNnAwRE1WSjhvcGpS?=
 =?utf-8?B?Zm5EWlhKd0FZc1dVNXFTdGJkQVJPREJyV0tNamUyRGZMRjQ1MkxnUDd2bHNI?=
 =?utf-8?B?TDZZV3dWM2NtOTduaWkxMEFaYkRyTlZxMEhqN0RXaFBtQUpRcUZJQ3U4Wldy?=
 =?utf-8?B?VWVOeTNjamFwU2R4ZE13WTBYdU9jTks5RGpEV05vM2lndEcyc203Sk1ITGNF?=
 =?utf-8?B?SzJxTjFKMnJ1ditpTXdGSjhPMUg0TnVtU3lOYWI5ektPbnhTYmlaYU5saSt5?=
 =?utf-8?B?cW4rNEQrWkdPS2NBQmY4amVWanNjbG4ySDdNK2tvNndQVUM3N2dQS0ZiZ3lx?=
 =?utf-8?B?NmVSbTJWNy94Zjd2RDg2RGNoQnZaVHJ0LzNPbGVHUUM4QmZjbmlQbHhOUVE2?=
 =?utf-8?B?QXQ4bTEwdWxqU3h6VTZldThCLzVNWWUvZWFZamZIOFhoUkNFdysxMTZId2t0?=
 =?utf-8?B?eWY1Q0NrV1dJVE9qMnNjQnhGcjcreGZDTS9FSzNJVFBXdXQrVVpNVWlxelpQ?=
 =?utf-8?B?aUtKTjF6NUlRNjZlZUdCV0hVQVpBcWpBT0VPQUJrTzNwWEhQQWNiWENsd0Q4?=
 =?utf-8?B?Zk9HZzZsekxTeGJrNWNGWWs0RnBoZUM3L2ljb0I2M1F4aHpzd1NPMmdUa1R4?=
 =?utf-8?B?ckM2akswYkdvd0I3K0R6RW9qdlpIaTA4TzY5S1g4RjRnYXF0VStKTzVBWlVB?=
 =?utf-8?B?UW9kVzBqZ3p2MU50QnhsQmVIQkZRQ0N6aWFKOTBjY29DZHBqZEZuZ3V3UDBZ?=
 =?utf-8?B?VXA4UlNnMHN6bXZRNHhvdXVudk1TR01WWk1WeUQ2RmNIZEVGbDNkaU9jdFBC?=
 =?utf-8?B?M0ZDdDl4U1MwNTJDYXA5WVAwN2xHU01ZWWlwVkkwblk0TkZWb0VnVy9mTzlV?=
 =?utf-8?B?TUNWbUVramprb3dyMDE0RXlMczR4cE9rL3NuUEJ1S01MSXVUT0QrQTJnV1Bv?=
 =?utf-8?B?elp2QkRPUTREUTR0REZ3SyttZHJleGw0Q3hzYVhLZUhUZkwrTkNIa3RkSW40?=
 =?utf-8?B?R2thclBLZ3FnZGx0MFNVYjJPdW02M0tsRmp0NUlrTXpyTnRCWWMxSFdML1k1?=
 =?utf-8?B?M3BhWGtOb2Z4Y05naGdkMFJmelAzZmlUNG5Za1ZUSzJ3clRqTkw5bWF0Rzha?=
 =?utf-8?B?VXZpMzZsaEZhd2ZHUW1nbUN6MUdYMFBURzZCVjhnS1dFRjdRMmw3SGRIaEV3?=
 =?utf-8?B?d1hoOE1jbVhRM3JtTWk5WTBvRWhTVzlHbk5PTENPaE9jYisyOHJvTXN3dnd5?=
 =?utf-8?B?ayt6V2x0aEpYVXhFaGYyUVpyMWpwM0pQTVlIY0ZFa0QyZSs2aTc4TFZ5M2J4?=
 =?utf-8?B?b1hvMkZHUjJ6aGtUdE9mb0pHZENjVWVRM2FLTDZncUZHbktlZ3lKVnVIRDJy?=
 =?utf-8?B?UDNUZ1VtblZITEFpNFVCQXdyUmIzTHhQUUZ6eXR2aTJVRnFGUyt3dDhwQkpJ?=
 =?utf-8?B?Z3puYm5NWWk3ekRFLzJJTWVNdWxsNnRkRUwzbkJsYXJrSFE3T2tPMS9zbUFJ?=
 =?utf-8?B?UkRKdlhIYURUeGlvRVZYWWNLbVYvUzVzdzdZVmZFOTg4aTZDNDdWeGsvU0hD?=
 =?utf-8?B?MHAwaEhpR3hSRVJiK1V5cXh1T3RwTVpOWUxCa3BzUmpNcDMvUCsveTdvM1F5?=
 =?utf-8?B?QXRTVDFHRVdMellEejVLNmc4WUFSek1mUTV6QnljekROK2Uya3YyVms3dFVL?=
 =?utf-8?B?V2w4QlFXcTJwQmcyM3ZGeEJmY0Q0MnBXNE1wK1FmLzQxZzJScEViZ0s0N0tC?=
 =?utf-8?B?WjBYZ0xaQ0NMR1dxTnJoSzg3eG9ZS2QrZ05QeGk4SHdrSHdST0RCRlpKNFdG?=
 =?utf-8?B?UEVPVmx1c2k0ZHNSSk1zUnBTQlZJdzZHNmJSL0o3eUZPZDhoUUg0OXo4UmNK?=
 =?utf-8?B?aG9vMitZT3drTnZOay95KzNMUlhkVEdEUHVCbGM2R3JoaXZhSkhBTW1kZjVy?=
 =?utf-8?B?ZlFhUlJGSk54N281ZE5NU1VWQ1VBb1Q1K1JqRCs4R2JYczltNW9GT2oyOFNk?=
 =?utf-8?B?QWhzbkJWZzdLd3VydW9IVU1pNXRYbGZVcVhkZ3h5aWNHQ3RheVNRSXgxZExI?=
 =?utf-8?B?SjhZS2JYWWVNb0FVUVhGdmFadzZzaG5xVXU5TU5Xd083RldYOElnZnl6TzdV?=
 =?utf-8?B?VWlTK3Q2MDhUUGQrQUtneXV6a3B3Umc5UGVOd2FZaE04WkNvUHI4VEpMTDc4?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65267f84-7d08-4993-c9fd-08de00b7e294
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:11.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3JpXmPWT1y0+08cl4OWpN2cc3PXBD0IbaKVqNz0XRX5enB26RU2n+Bx8EkoKa/CGWG3vxhzIWPu3lJYxoPZjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

Extend core huge page management functions to handle device-private THP
entries.  This enables proper handling of large device-private folios in
fundamental MM operations.

The following functions have been updated:

- copy_huge_pmd(): Handle device-private entries during fork/clone
- zap_huge_pmd(): Properly free device-private THP during munmap
- change_huge_pmd(): Support protection changes on device-private THP
- __pte_offset_map(): Add device-private entry awareness

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
Cc: Andrew Morton <akpm@linux-foundation.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/swapops.h | 32 +++++++++++++++++++++++
 mm/huge_memory.c        | 56 ++++++++++++++++++++++++++++++++++-------
 mm/pgtable-generic.c    |  2 +-
 3 files changed, 80 insertions(+), 10 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 64ea151a7ae3..2687928a8146 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -594,10 +594,42 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
 }
 #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
 
+#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
+
+/**
+ * is_pmd_device_private_entry() - Check if PMD contains a device private swap entry
+ * @pmd: The PMD to check
+ *
+ * Returns true if the PMD contains a swap entry that represents a device private
+ * page mapping. This is used for zone device private pages that have been
+ * swapped out but still need special handling during various memory management
+ * operations.
+ *
+ * Return: 1 if PMD contains device private entry, 0 otherwise
+ */
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
 }
 
+static inline int is_pmd_non_present_folio_entry(pmd_t pmd)
+{
+	return is_pmd_migration_entry(pmd) || is_pmd_device_private_entry(pmd);
+}
+
 #endif /* CONFIG_MMU */
 #endif /* _LINUX_SWAPOPS_H */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1b81680b4225..8e0a1747762d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1703,17 +1703,45 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(is_swap_pmd(pmd))) {
 		swp_entry_t entry = pmd_to_swp_entry(pmd);
 
-		VM_BUG_ON(!is_pmd_migration_entry(pmd));
-		if (!is_readable_migration_entry(entry)) {
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+		VM_WARN_ON(!is_pmd_non_present_folio_entry(pmd));
+
+		if (is_writable_migration_entry(entry) ||
+		    is_readable_exclusive_migration_entry(entry)) {
+			entry = make_readable_migration_entry(swp_offset(entry));
 			pmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*src_pmd))
 				pmd = pmd_swp_mksoft_dirty(pmd);
 			if (pmd_swp_uffd_wp(*src_pmd))
 				pmd = pmd_swp_mkuffd_wp(pmd);
 			set_pmd_at(src_mm, addr, src_pmd, pmd);
+		} else if (is_device_private_entry(entry)) {
+			/*
+			 * For device private entries, since there are no
+			 * read exclusive entries, writable = !readable
+			 */
+			if (is_writable_device_private_entry(entry)) {
+				entry = make_readable_device_private_entry(swp_offset(entry));
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
+			folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
+							dst_vma, src_vma);
 		}
+
 		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 		mm_inc_nr_ptes(dst_mm);
 		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
@@ -2211,15 +2239,16 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			folio_remove_rmap_pmd(folio, page, vma);
 			WARN_ON_ONCE(folio_mapcount(folio) < 0);
 			VM_BUG_ON_PAGE(!PageHead(page), page);
-		} else if (thp_migration_supported()) {
+		} else if (is_pmd_non_present_folio_entry(orig_pmd)) {
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
+		}
 
 		if (folio_test_anon(folio)) {
 			zap_deposited_table(tlb->mm, pmd);
@@ -2239,6 +2268,12 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				folio_mark_accessed(folio);
 		}
 
+		if (folio_is_device_private(folio)) {
+			folio_remove_rmap_pmd(folio, &folio->page, vma);
+			WARN_ON_ONCE(folio_mapcount(folio) < 0);
+			folio_put(folio);
+		}
+
 		spin_unlock(ptl);
 		if (flush_needed)
 			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
@@ -2367,7 +2402,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		struct folio *folio = pfn_swap_entry_folio(entry);
 		pmd_t newpmd;
 
-		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
+		VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd));
 		if (is_writable_migration_entry(entry)) {
 			/*
 			 * A protection check is difficult so
@@ -2380,6 +2415,9 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			newpmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*pmd))
 				newpmd = pmd_swp_mksoft_dirty(newpmd);
+		} else if (is_writable_device_private_entry(entry)) {
+			entry = make_readable_device_private_entry(swp_offset(entry));
+			newpmd = swp_entry_to_pmd(entry);
 		} else {
 			newpmd = *pmd;
 		}
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 567e2d084071..0c847cdf4fd3 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 
 	if (pmdvalp)
 		*pmdvalp = pmdval;
-	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
+	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_trans_huge(pmdval)))
 		goto nomap;
-- 
2.51.0

