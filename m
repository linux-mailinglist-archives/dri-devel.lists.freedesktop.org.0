Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C7C5FE88
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DEA10EB6F;
	Sat, 15 Nov 2025 02:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GYVNgRk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653BA10EB6F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSF1BrgVuaogOTPNUwN0MaEs2/YgBYhIWxbqAmgcd0i5s5a+chc7TRzOFf6p57BRFsCa9aJ5VrHdYtxNNP66rgpt0j4gNzoTZD8+aixp0D6baPBS+GLKJN1WN1Fu/pHKc2YSXmq7300ulsQ6IBkBJu9Z+OYnYduJejX1K5TRRcInfpnqFEH5LpFhlxWCT98LStspyb4Q91Wt/9pV98wLNBFAXNVFRNeVSy8Si3ghccq3EhOk0wE7hq59OrzYqceB8xvpB7UjPK/sdxtLjl+Tlkw6GPn879xCPr+QTK0msitzXHWVx4I2C+R8RoMCMcGVYu60mHUa6Pp9RPBFXj2sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjbOGOnaYFQpFrbIJzE8hDn3dyPnxqq+kUK+7o9PM9E=;
 b=FZEBthvfI8cDfpIbjndh/TAvt6Wce2hq3n1dzuMq9EpKnqoFB8LlyM+KAX2DR1C7LU1MBHdNJTLhoxD1PMrUTega8g8GOah4RmMn5CrxMNwAEiRCL4dP6/Pz+vR4FcMsOa6pWFq2e3XLuHhK1yswpz/LOz9pQTntg16tkphr1ORzA3IFD69mJW4QRnatCAARBTVhc/J8+ur1FoqZPjGuXhInxbGjWv4SPQQ+yO527O+YFBSXiZD5cwAl6cKpElW9PvhOelOxjHlEm5SlXCTOCd/i9X+qQqcCHGDcdJMVmH+AaXa31TCtQLwuBklHcFQ26zpacDdY7VC9wc33Rz5bFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjbOGOnaYFQpFrbIJzE8hDn3dyPnxqq+kUK+7o9PM9E=;
 b=GYVNgRk4EdNroBG5a++YKkNBrByvbCh68DMJ+1JKmd9LRrj/leg9GMO24reoCiJ4xpd1xHWvTSyY1nNyvgV6UJ/CiW/ILFJqqubbU+V5OdKVS4zHzYUbghXoAZ7Eh0exC2sUnD1uuMCO9mfvtBtD1zKebThNUY6KV1L9qFt/u8XkGMBZ/5WjgigNDGkqr09hkYAR9nps9rVqnT8zHjgOeEVU8KNbrO6cFgWRgoDUeqbrDDMCAB0n/DMMbETsQw7P0gUG0oxAswtpHg75ajRNO3GI5tYEjrC6TUTcK1OqxMhdAbCWMrxmcBus1pcK7S4sZ07FtEZSMTI2y4YugFFPkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 02:36:09 +0000
Received: from BN5PR12MB9464.namprd12.prod.outlook.com
 ([fe80::e83f:10b6:1259:d000]) by BN5PR12MB9464.namprd12.prod.outlook.com
 ([fe80::e83f:10b6:1259:d000%5]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:36:09 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
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
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Date: Fri, 14 Nov 2025 21:36:07 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <60B3DC06-7135-4410-BBDD-9D7B914598CE@nvidia.com>
In-Reply-To: <c1d57140-fc6f-460a-b017-6662778aeaf7@nvidia.com>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <202511151007.F1gixfc8-lkp@intel.com>
 <c1d57140-fc6f-460a-b017-6662778aeaf7@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:208:256::8) To BN5PR12MB9464.namprd12.prod.outlook.com
 (2603:10b6:408:2ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9464:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 77563d6a-eed6-45b1-67f6-08de23efbc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0uUwIuP2MEMJN/kUiGLpHXbfr23pBGEcnw6AYCMdVAEhjCFePUMg3y1TXpYC?=
 =?us-ascii?Q?okU3do/pb6JTG3n5gMCqBMs1CR1iXaXzOamlYAem7UDG/q/ay7AcanbcdXXQ?=
 =?us-ascii?Q?gmcB8y9xBHELILO6fwVy8gbKVTG3RWSYJbQjzK96TMDvJGbCQDTK536GthMe?=
 =?us-ascii?Q?CTx2MBv2kUrOZDNTYg6k+LV1J+pVLFYiL3x3m4iFgAEC7Th7UldapfJidabg?=
 =?us-ascii?Q?RubCCEz5OXPbEvNsh27Z7uU1zKHnhLyi4R/k4lIJttdtRzT5yv0DbkGxwnMd?=
 =?us-ascii?Q?enCrHfppTVIJ2jbSjsy4FyTO8EDj/SWl+k6sLjdQrO7znCmUsfYI+en6yWPH?=
 =?us-ascii?Q?eR1fuYzwOkRE7Lvg/7FVR4mIu4K4EkwUYLqfdtiQm0fA/QxShzOAf2E9Vpd/?=
 =?us-ascii?Q?Z/ZKt8yqSYLEpDjf+2OL3Q8vVtr+EAfURVB4275AqmnB1IriWT2H92LPPbIS?=
 =?us-ascii?Q?HhllljvzrGpOvaFIUncfC6Qbj48U8S6T4nyHUDS1FFVHHAJylnhBy6BDFm1l?=
 =?us-ascii?Q?4IfLzUsv3wRjwb+98jLzANy3vLSCB+KnxIbTI9OAIp2FIxO8fcDQd4U+mcAi?=
 =?us-ascii?Q?NoUsJJ9ucxuIs32RLtt4PyL8j2iJd6jJ2ZSQdJnBWFpJJ7LvtUV0FZHwEB4L?=
 =?us-ascii?Q?+nSNTR8+dclhYgO/wjQHtviuigTEluxrwSwF+6HHw8ZU33Ugje+ApMASIowV?=
 =?us-ascii?Q?h/eaARa85OcyzWHxVWNnBLTieRQ6QvXp0KDcGWWv0JKKkVuK4ptDi082T+Yu?=
 =?us-ascii?Q?u4zhvtj5a4YZs6jpEAFN66tNeWQWmpJvJulM4BLwnWgLZ6lSbURmANth0XXm?=
 =?us-ascii?Q?3d2PonrKGvSNRh/CrchzsZDJrF3ioT7HHZTz2Kr2w32dOTZo+Vsb3qlJPnqM?=
 =?us-ascii?Q?P1lochycpJ6+lfhAYow8qV57PLjQjis3YLqeT96gHqv8VA6uw3GXsG84kaSA?=
 =?us-ascii?Q?ZgPRwCNY+SuaW5jiLfZl28/1ELJfrNU47jmND2Hat/RpB63swNTzcBqOML7V?=
 =?us-ascii?Q?sTunFvGC7orI/30iWbyZ7EhKScTlI6LWVxMWzVfC6jQ9UFsVqW1wzoJJi9VI?=
 =?us-ascii?Q?8vFYNPNGYvllDY9mEvQosdU61YCFs7clJ8b1Oec3GTgo+7iigMvOyig7EIP9?=
 =?us-ascii?Q?hgx1wJwX4n33rFBJ/KdxQSmmjdeAHnomE1puWtGo13SIvi8DfarZ8ktYjNRO?=
 =?us-ascii?Q?slVHw+223bgfaD9ceG+/rsxkj2pVkJe1o7Tx5YGZgRgfLJ+hWTcB4Y20LVc4?=
 =?us-ascii?Q?DIxhI8LaywBYHA0QpCGQF5HWB2KHaXLevw7A2kUo3DrTHKWeU4SjA7lZzgaU?=
 =?us-ascii?Q?oMxi3Urrv4TYD+DJsV7TI+y6qoNlLxNHwSN9xtZrwilqAhmWjPhJMB23ev7N?=
 =?us-ascii?Q?2eERBByi7qStpm2xbTJR0SP3IxAatXZGrXODfZ4T2ohEWIQp//NlAV5jzTD/?=
 =?us-ascii?Q?sZfV3Up/hroCYt20rLt8DyhErwtZTjtqrw9N20BzWtNj2A5+37wCAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN5PR12MB9464.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4usgqySU4PlJ/BrSKPFp54Ia+sLtgGBV0N80kgBbbZdsKOh+Bl4vp514R5uK?=
 =?us-ascii?Q?YsY/YMsLXB789ZOXCEB5C/KKEhg1ntiFD8jaKD4n/5oHuiT41GYj9Vr5Ztoq?=
 =?us-ascii?Q?z3rQHCtj/JIN++PeVeYQ1vr8iXSYt+JmRavJMb0bZFwccGyufjMzcAkYJcFG?=
 =?us-ascii?Q?qHzNbuVEfbpEOPWaRnnHokOuSRDhQRwhX0Pw3blEq3TGlsFD5mQsbJr3aLs3?=
 =?us-ascii?Q?D6TXtK2Z4Al68zaPwaI2jMoTqTlLzfKndePH+Cr89YlfwM66blfeQ1MXXvvC?=
 =?us-ascii?Q?ut4NVtCx40XuV8YuaDNoqZW3FaBO0RMgIntiBEwkaDK1U9Y/kv/1IzYT/1zE?=
 =?us-ascii?Q?OIAxZv2tpJqdMajg8IOdDepGdLeQIHolydvLNlmgwueR7ktBh4JInjPLAfqc?=
 =?us-ascii?Q?olpXzL5PlpmV8pntn6jfY1UKUs4OaEP9h1CWVxNrHIFnfLcpME2LOrKn0Sun?=
 =?us-ascii?Q?NtKX06fUWEGpfZaSmlRknA7mH+PvpVMvM0QlyJaTE6qDn36kTfraAQmfWLDV?=
 =?us-ascii?Q?iBazzVt6jBPamNnsaH6xE/1edM6CFtQGpgPnHavvP2kZj3zh6m48JaCiGqeM?=
 =?us-ascii?Q?Cpw0FrcohILgvEw+7hPixC/dRASg+i8W+i9hjejk28Ekdrf2UNw4wqyIgEHN?=
 =?us-ascii?Q?3sp1o+5Y+9SZjPeqZVlFACjiZipHTIySuoKxN4JFMPGbf7BW87c2dHcqnKdZ?=
 =?us-ascii?Q?ETGvYf4IM6NY0SpcbTH2FZnKD0btWamG1a+kJI9o6jX7MXa+LNGFHHpUhQNQ?=
 =?us-ascii?Q?AZoTKF2i1BJyiSDa3eNfUQpYu+0t+QaUqHrZ9x3BInPoOKdgPgEU2LtqtgUX?=
 =?us-ascii?Q?PT1i6mfcViZEm7bGRIZLjkPxLtGP8I907+ijImBvVmplOvP5dxk0S1QntiOu?=
 =?us-ascii?Q?7kRJze+zJ0MfJAOCiZph0aVPehipJZP4r29ZfUJrCoaGBAczgkgj0wZlWudt?=
 =?us-ascii?Q?q4BHR5SmDxzwesFEWNgTg+/i8rFiVYQCW6JH5vTOuKYGzfgm0n48Gj5TLvty?=
 =?us-ascii?Q?U65w0MexZc0rbPZ5bGHkCiE6LdV0o5VnLIYGGWqzuZVbGpSxqEWrM7vypbwM?=
 =?us-ascii?Q?ZPFqPkgwbJz4dE+72pmbejGiElMKlDXOzHffqJaS4Jtiucq5b4fjD1Ca21No?=
 =?us-ascii?Q?dcHFl3G1LMOw5bbw7+clq6wZMylfBO0qCreHhtFJXhWYtvmL9QDrQY84iKwq?=
 =?us-ascii?Q?iszlo2GwYuRo4VlHJKYrCbYfloAeIX5FLgHpn83I6zYd7v9xPjGxAh+I2fy1?=
 =?us-ascii?Q?TUW/zRYBewOQsbTUiYhZ4XEqrcXZ3GHAltRAf4FuG5KJH33y60BQMBE2Ws26?=
 =?us-ascii?Q?YZo6/7efMaJ5ldzE/kIcmQ9PfC9prJETZtQ6yO1uR/ozhnxpYXedv60PL0lt?=
 =?us-ascii?Q?bK4OjUJ0MCOIt5chCQs6GxjFpwryXyqqYq5LNlMEzTTO9QAK/vLv0K7eW6SR?=
 =?us-ascii?Q?zckTzbk7AyhMkn7fYOKyexbK6WR8VUQSu16+82Ve05GB2K/f63o7RqyJjsIy?=
 =?us-ascii?Q?vrS3bICQl4EFUQsg3RjUqpJaZHSqB0pKbHfMcc+tP0fChkYmiNoOeL5FtQ9a?=
 =?us-ascii?Q?Lf11OWFBQ+kDZfMHtSynje3ayo9L3wUTa9A+YSbO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77563d6a-eed6-45b1-67f6-08de23efbc1a
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9464.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:36:09.4315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugtx59sw/tVzXsuHN3J1+Zx/83ljpWTqhhytvRUscY/NvdpiaBX9VRowXsLSRE+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
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

On 14 Nov 2025, at 21:33, Balbir Singh wrote:

> On 11/15/25 13:15, kernel test robot wrote:
>> Hi Balbir,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on akpm-mm/mm-everything]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm=
-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm=
-everything
>> patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balb=
irs%40nvidia.com
>> patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmappe=
d
>> config: arm64-randconfig-002-20251115 (https://download.01.org/0day-ci=
/archive/20251115/202511151007.F1gixfc8-lkp@intel.com/config)
>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3=
b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20251115/202511151007.F1gixfc8-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511151007.F1gixfc8-=
lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> mm/huge_memory.c:3751:6: warning: variable 'nr_shmem_dropped' set bu=
t not used [-Wunused-but-set-variable]
>>     3751 |         int nr_shmem_dropped =3D 0;
>>          |             ^
>>    1 warning generated.
>>
>>
>> vim +/nr_shmem_dropped +3751 mm/huge_memory.c
>>
>
> [...]
>
> Thanks for the report, I'll send an updated version after I investigate=
 it

nr_shmem_dropped is updated in __folio_freeze_and_split_unmapped() but
is used in its caller. It needs to be passed into __folio_freeze_and_spli=
t_unmapped().

--
Best Regards,
Yan, Zi
