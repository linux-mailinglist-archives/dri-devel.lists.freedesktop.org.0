Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB26BA22B5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 03:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853610E9CE;
	Fri, 26 Sep 2025 01:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RH7jKwlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB2610E9CE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFlr9PU3utRvMncoGBOBYZPdKb4q0Gxlp4BVULq6gG9yaPKUDvrwY41WOsR5+lG50uWWEaFf6D3puXrCjHYIutVDkmxiQAlb5CX1tEPjFUzAPaWBHO1geji6SN1c3tlQRKujVgFYl2bIXQLswATRMPR5weA3ZufOhBO37t+S6BVyVKHyK4mWX+shKTSMNHzh7IJ1W+mCtSuDpHYaLqD7tuHbnzRrYrfn/ijwNHvcvBqEjE11RhwCPc46qaGq2YGJztQBoP5utmKAlVs0pqw8IyQ0IuBkMgvhmRxHoE3HnXZ4eNVeKDwtDbEjxwv/UEJ4gWuzjyiNfYScIDvR/vbyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZBI9rZleJnzOVk+zLOU31NIYOJmrtQ/resMy/Zl9yM=;
 b=BCcqu54Fl/zdU1HY+IHa/U40JsPR3+XrYOkhc10Q14RPLgw7Bkiie4snFMhqR/kJSBNztcwmGjxsO6kNzC3AXj21f/bZ/kuXhYMatS/j7H1LPgJprH77PH2jLz7TTWGTE8Q3FUD2neTIm1OPQ5Inejl2i1tqGSqwfXNFSHurwJbn1x8TcRw6t/DJwWQe/y5+tGAyklZqkrJDmX1KYWvFV0Kgfu6aRor8qXidM0/KliWo5HeNSyNTTq39z4Ud63zkvYIYbncgmmmr7GA8hsyefgCIoSJNr7ZarBytUZa/9mIht2Z8Yd0/Q0d1uDCF0hQD5wUhI6a1C6eeeHZZ5YeNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZBI9rZleJnzOVk+zLOU31NIYOJmrtQ/resMy/Zl9yM=;
 b=RH7jKwlP8JoNGjm0orhiTcp+OfOeZUfVPsQ0myKfC/OLVi7lKrxxTF/k5FJKcicyngb9LOiZLNpjX2Bw6unEC1tFiJDv6bdPeQwDkPZAJ2k9WRh2w/vOcqdMwDIQJN1S8DgTi1S+XFgKwugAiL2c+Wabe5CJ+T16RzyUbcgXW6qW3dXhYwj5EuYLkOfohBN8qzgC5dzEYcjgpgO5Fg/xM1Ik9cO5tSNaiav3g+Zyd4YvN7u/NAoYN9u0CBfAK88fiqgq10H74WcMLc+fJFaVzKaWtCjLW5op7KugVEn7TZWOCKkmDmwNgEsWBMNnGjNFZHqNGotjjmdDUrLxUicv1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH1PPFDA9B3771F.namprd12.prod.outlook.com (2603:10b6:61f:fc00::626)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 01:53:34 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 01:53:34 +0000
Date: Fri, 26 Sep 2025 11:53:29 +1000
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, 
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 02/15] mm/huge_memory: add device-private THP support to PMD
 operations
Message-ID: <3uxfirnfvki4kztyf3vac5vph6kzhnf623li46gmaqux5ivf5e@3uvtpfeymgug>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-3-balbirs@nvidia.com>
 <azcaqmqwdslvoei7ma4obtpxcdv7jdqfdc3ny4sylgwelwhfvo@okwd6y2oq5q4>
 <df1e62e6-57ac-4a5f-bf62-71fea47481af@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df1e62e6-57ac-4a5f-bf62-71fea47481af@redhat.com>
X-ClientProxiedBy: SY5PR01CA0051.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH1PPFDA9B3771F:EE_
X-MS-Office365-Filtering-Correlation-Id: 458c1150-e028-47d3-6fa7-08ddfc9f803a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?I5kOgucwaxQK+ly+VWIg7LrKOMpBkgRHR8GBa2bpFjznOXlBkMssMSqtmr?=
 =?iso-8859-1?Q?HCuIOFSa60qQIEYYdnoHmDZEVnQbxp8sxmeFY57umCKkVttdHhSvjv0jko?=
 =?iso-8859-1?Q?RrEfW86tx433Pe63HdtZSbPTRPKk3c+1X8rBfsqsvy73GzmfrCaXbEg3Tn?=
 =?iso-8859-1?Q?GY649lZ7qjEazjbs/c8CSxQb+HxnyyccR2YokEizsm3loH2tcKdGq1ULgF?=
 =?iso-8859-1?Q?v7lAShxR/mJQxFlbhmD62qdLmoENzcv2yR42z4SC3Rzl3Ttrciu0E2pK+w?=
 =?iso-8859-1?Q?Rb+IX8baSBt9FiCpEWZD2o2j+q0NyEclS3I2w96ORzULMBxYt2XP1vRLue?=
 =?iso-8859-1?Q?hFE8Ch+uhAmPec1uWjD1al+fXQzn1AVfAoGpkS0iAZgXT5laZs0Fq2fuRH?=
 =?iso-8859-1?Q?0+KTQt5QnbLlM3GgnfUINJK5nxTkpU3+KmW9ABAqALoyKdyGcq5KhdIdBU?=
 =?iso-8859-1?Q?oL0NoZnIf5oL/GvHQX7koUgGEVOsusG2L7DJIPyZ5WXCIeOrKR+TqCspLR?=
 =?iso-8859-1?Q?QnwcN6NH1ce88W8SVn6fRpFiFtTgQ9+gX3WPiJxrYBEsUXtviY9i24qFbV?=
 =?iso-8859-1?Q?DaiQGhLt5mqmcnGAa6+rxq0rThR+V3DTK6ogZyeBIsy+W/B0tgLCh46s/q?=
 =?iso-8859-1?Q?3G5QO2IG4DqnWhPMjeUsqwL8iq5etMWVcyruzHSZxpiEKaFGqSLlkW+etj?=
 =?iso-8859-1?Q?7IWXa3wUa0TBB7pw+Kn69Bk7DgWpTzFxNXKdyRWKJ50JI87zGEbfF/6J0m?=
 =?iso-8859-1?Q?BACvjZLodgTLlFv6VjxeEvuF6qNeekj40Bf1uzkTWzLeF8seJgU+QMTDOz?=
 =?iso-8859-1?Q?tNmzSmpHG0UJqbG8AlXk5k+qh4n7xD+qgOCmAeedSSPzuHtLYsSo07sNmH?=
 =?iso-8859-1?Q?xFNWno/IYPz54EP/xgDMa/ypEz/dgiAicCVRqHD4m0hboeDhhaJUQvCWJL?=
 =?iso-8859-1?Q?6ELZ3uRECAjD6nt0lyxrl7AKPv07sVDFTzd0xgqO1ctEkgdrmffebYKt8x?=
 =?iso-8859-1?Q?X8W6YqtGCphd6uVFE0QBcngstXhvknWfA+a/xDu2HQVq80oNd7mWmFtWom?=
 =?iso-8859-1?Q?bUXrikdw15kKeNO1/8NRP2NCgSvF7Ag2kamplRo8AFgrN5pWy7+mP6drfr?=
 =?iso-8859-1?Q?brP/HwbTCDmd9n0nmjMPNxZgF/hrKvhuKXqvlj2ttRajMpaiXTxoZUXpIP?=
 =?iso-8859-1?Q?3oem9akr1hKgeO0IfSCFy5W9JeToJCf2qMN1P2m+fMhBe+X7F3orIWWWn0?=
 =?iso-8859-1?Q?IBvUo9UAeVd+ht+Xrw+pTl37y4K7RDLYSZ/zlM/oh7BYR6vBh8x7KXaAxb?=
 =?iso-8859-1?Q?fmuGzYhz5GkOHt2sGsEixGJsOjRpjeGZRQrXF/bJav+t6qFsNPm4EMkKRv?=
 =?iso-8859-1?Q?WXhDj5umOIjERQr0dlhvOiJtViTW1o3uprDqQvv7t3WVMNkU0zSJMeVone?=
 =?iso-8859-1?Q?lslN/SVu+Cl0m8Ivc8PdKhF/YnbsyzquOLYLfTsy5aC7MfgAiKIT+AWFJM?=
 =?iso-8859-1?Q?wJz8f/WAgAPUkM63GIbbxy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uDlflAWu0uuH3c8H5QWujlIJH3BuhdYQRrNDAelHLGK/psv6p9zkRV3L1G?=
 =?iso-8859-1?Q?asF28mwoPaLdNetyowj/rumR2jr2AjFeOs2QZ/8LJd+5nZTacVR8ILxvq8?=
 =?iso-8859-1?Q?zNagkOnoT6LyJAY1ud2AsJufkElZCkMv379JwTEkgMwxSlkkET0OLeKlia?=
 =?iso-8859-1?Q?maE2z6C02R5nEsayUHyazeQXDeJMF5MDkFnd1CkT24rao/h4Rv17/NbKuu?=
 =?iso-8859-1?Q?UR10bbuIZbGD+T2UZVQN3ceRF75wkxFGwPPrNSpfpYxp2OSEAYE64Fnf6Y?=
 =?iso-8859-1?Q?LdkL7XcQQJlzmGjWOtMY0Dq2jFy4WpumMzmMOmQM4t3L8jbZvq+ye0435t?=
 =?iso-8859-1?Q?uilb9M2b6ffTRS5Plg0KV+9L5BvGUad3bvYceaRTdlgU+WNrw9Vo4DXys8?=
 =?iso-8859-1?Q?Swa8HKTMGhiDBvlVw5yBVBKOZ4k5l2YPN+QlaexSk8nJ9PgIO+thp0A3QL?=
 =?iso-8859-1?Q?oUlghQEkXszIW7yGKqpJpBJj4YqF7DAK2S+ltN3vFxu6JfU9NagArpXnpa?=
 =?iso-8859-1?Q?CHe4PpIgx3L63Huq3A3sIQq2eeKTE7IaoM3rK+T3mcOcXgzK+vzMtJrPM9?=
 =?iso-8859-1?Q?g/racwmBeuAyL5KwcIugoHRlqYCJh8pLEURQcBk53kN/grNGd5RtoknncU?=
 =?iso-8859-1?Q?pni4zZy0zHPW/sxpLZtytHYAynJLk9ZJdPhQ3m1TW+/zZCTb3t6ZovRUeN?=
 =?iso-8859-1?Q?bkOss0J6+3wpafqD8lktla77fQlcSiXl5P42gMH9CU6UUgzIZxGYoDBkOr?=
 =?iso-8859-1?Q?jTgcGuaX4kIHYc0/cM8ipHtXuwpcwf394BZuoEzFDC2yIkmmwzimzxTvBj?=
 =?iso-8859-1?Q?RWHcmCTxKGi48io50YjFhZ3VJElRvv5XBEoBNv9xS8hMl2+RMkO9B/Cbsn?=
 =?iso-8859-1?Q?bTBIFO1GV/klvVAjc4mzH0fUG/9/jSpT/DIc43HMQcsSiUgYiUXqtTbBa6?=
 =?iso-8859-1?Q?95WCbHr4QG65jxHHV74SlbnZMlPjwKWpMTKdRZopTZ2iimszgUoIcT/QhY?=
 =?iso-8859-1?Q?zO5GQZiYdB21DK++Ky76RJ6ijBWYllqQDKSwntllmzHACjuh9gfNN4uxA7?=
 =?iso-8859-1?Q?LU4rVTkY9qCV1xeLd6PGDGJAqVnOsgReccD4ZBBthG1CKwj5JyWsN6LyvZ?=
 =?iso-8859-1?Q?Pa1SYyrQPj5r3RuaiPMCKg8+pb4PYpZKkVyy5X/M1yz4M0Z7kejvYi//G/?=
 =?iso-8859-1?Q?wEEVV2T35SU947WkTuNqssvM8uqYlgyrF97QnPUOGgrgxMfygEIT79011M?=
 =?iso-8859-1?Q?pINt4+eGcR6dzYWrYteCPdh2qyTOuetYjx3jFus1Op1/E3mY1wn2WCWRHl?=
 =?iso-8859-1?Q?5bLtQyPzmmUyQXJJGMzL+Dq+jZIMbIhA/s3UPHorPJewO3Ad+1RpzEtWhR?=
 =?iso-8859-1?Q?UNTS9H7xuTJZ2OwgaLJkyMywYrrbBNRLUiY4WNbSGvX8MVTuoZmTj2ftjU?=
 =?iso-8859-1?Q?eY6Pcyxk4aNrCV2lVgWvGZ+FatGdJtxQ984zrTq+zLTEZ+yzGbsb5aBGdW?=
 =?iso-8859-1?Q?q8s7p6gCfGQILQVEeAhUZAKsQGWcVVoT8tB5IwtqNHSSTEeUjXYq00mlbD?=
 =?iso-8859-1?Q?KruzbF1wUaNQXqmOvxjNuQS4m7hOcT2PrHnlrw8z7ufO8tQ4HgQhUolYyx?=
 =?iso-8859-1?Q?8Rzbsy9WOmgZYde/zl2TJBeDL6UiHOXEwz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458c1150-e028-47d3-6fa7-08ddfc9f803a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:53:34.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ohyy0UMyeshq1/+LjIQf3wAAu242bmGXha1Y9ukBo1Y4i/gNzORI7bHtmCGINsGEtUGeYoxIXILsvXv1QjBlZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA9B3771F
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

On 2025-09-25 at 19:53 +1000, David Hildenbrand <david@redhat.com> wrote...
> On 25.09.25 02:25, Alistair Popple wrote:
> > On 2025-09-16 at 22:21 +1000, Balbir Singh <balbirs@nvidia.com> wrote...
> > > Extend core huge page management functions to handle device-private THP
> > > entries.  This enables proper handling of large device-private folios in
> > > fundamental MM operations.
> > > 
> > > The following functions have been updated:
> > > 
> > > - copy_huge_pmd(): Handle device-private entries during fork/clone
> > > - zap_huge_pmd(): Properly free device-private THP during munmap
> > > - change_huge_pmd(): Support protection changes on device-private THP
> > > - __pte_offset_map(): Add device-private entry awareness
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > > Cc: Rakie Kim <rakie.kim@sk.com>
> > > Cc: Byungchul Park <byungchul@sk.com>
> > > Cc: Gregory Price <gourry@gourry.net>
> > > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: Oscar Salvador <osalvador@suse.de>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Nico Pache <npache@redhat.com>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Dev Jain <dev.jain@arm.com>
> > > Cc: Barry Song <baohua@kernel.org>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > > Cc: Mika Penttilä <mpenttil@redhat.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >   include/linux/swapops.h | 32 +++++++++++++++++++++++
> > >   mm/huge_memory.c        | 56 ++++++++++++++++++++++++++++++++++-------
> > >   mm/pgtable-generic.c    |  2 +-
> > >   3 files changed, 80 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> > > index 64ea151a7ae3..2687928a8146 100644
> > > --- a/include/linux/swapops.h
> > > +++ b/include/linux/swapops.h
> > > @@ -594,10 +594,42 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
> > >   }
> > >   #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > > +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> > > +
> > > +/**
> > > + * is_pmd_device_private_entry() - Check if PMD contains a device private swap entry
> > > + * @pmd: The PMD to check
> > > + *
> > > + * Returns true if the PMD contains a swap entry that represents a device private
> > > + * page mapping. This is used for zone device private pages that have been
> > > + * swapped out but still need special handling during various memory management
> > > + * operations.
> > > + *
> > > + * Return: 1 if PMD contains device private entry, 0 otherwise
> > > + */
> > > +static inline int is_pmd_device_private_entry(pmd_t pmd)
> > > +{
> > > +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
> > > +}
> > > +
> > > +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > > +
> > > +static inline int is_pmd_device_private_entry(pmd_t pmd)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > > +
> > >   static inline int non_swap_entry(swp_entry_t entry)
> > >   {
> > >   	return swp_type(entry) >= MAX_SWAPFILES;
> > >   }
> > > +static inline int is_pmd_non_present_folio_entry(pmd_t pmd)
> > 
> > I can't think of a better name either although I am curious why open-coding it
> > was so nasty given we don't have the equivalent for pte entries. Will go read
> > the previous discussion.
> 
> I think for PTEs we just handle all cases (markers, hwpoison etc) properly,
> manye not being supported yet on the PMD level. See copy_nonpresent_pte() as
> an example.
> 
> We don't even have helpers like is_pte_migration_entry().
> 
> > > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > > index 567e2d084071..0c847cdf4fd3 100644
> > > --- a/mm/pgtable-generic.c
> > > +++ b/mm/pgtable-generic.c
> > > @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
> > >   	if (pmdvalp)
> > >   		*pmdvalp = pmdval;
> > > -	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
> > > +	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
> > 
> > Why isn't is_pmd_non_present_folio_entry() used here?
> 
> 
> I thought I argued that
> 
> 	if (!pmd_present(pmdval)))
> 
> Should be sufficient here in my last review?

My bad, I'm a bit behind catching up on the last review comments. But agree it's
sufficient, was just curious why it wasn't used so will go read your previous
comments! Thanks.

> We want to detect page tables we can map after all.
> -- 
> Cheers
> 
> David / dhildenb
> 
