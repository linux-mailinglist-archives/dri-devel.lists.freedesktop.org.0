Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D3A33D4E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC5410E2CE;
	Thu, 13 Feb 2025 11:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5dh2ICH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290DB10E2CE;
 Thu, 13 Feb 2025 11:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSq4Hx9jCUUnQfApdYne1OVQgUXjxYvz1B3z3CUVecwafOQlvWA9jvLQRO4nnjvdx+BghqS6QJbVGLYhh2SyOMawpuhf6TP61LfVRINwNSzWfSGg6i6zOUdmVl64Cuz3jfWDqvMj8YvG4y79zER5VnFrd8UpDs1rEuE78WgxDCKYXKk+Lw8827899Q7Ge5vW4g5XgsziM8aTfVxM9qlFyIhCugg2y/tUmGQ0EidPTkTsA27I9i6e81lMEf4UYosP3FWoXrdNmg/pOKn5vgEc5pvKgkL6qwkasAIjfFF9kV/DehRZ4szmoi1j6NHyy878NXIzPqkBDt1TC6y8ucwSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1hYe4JVNkjQ/efTfskCdcqtZDd8tMNHxyQzlK04Iwk=;
 b=r8Tq1xSVeodACxK3XL4dxiwVcFgY1+bXbBDzXZyYimCHkugg3Z5SS3f4vfX6U4XeXAqwhlifdNtHRi+PhWtaqdUjL6CLvquClII29upmQS2o+TlcXy77d3e5cNEMqR94vDi0cF3EpUHryOuYAKtsEidacCg+SShAfSZFaACf3nJPWFWCKbvsgoYtnu0M3xDdtR4O8zK3GaVUjsOaujnZXYMNoaNN5JZDKCbb/zkq4kadNUgmKjdB8HBcUEV4jd9dbCB4EDG6GCBKpKlWo4y2O29J8RTHTCqtOguMvaX3FsRYpPkVZl1nN1ngq9UlzW0hH3PZeIqEp8octsqfgiSZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1hYe4JVNkjQ/efTfskCdcqtZDd8tMNHxyQzlK04Iwk=;
 b=N5dh2ICH2d3luXXWZDICkQmI5AfRuKBG6r8YBjK1mxTNqL5cXWlNnMxctqb+XqCbZnssTwvVF6jTMxz1FafyWKIkWlq+zmos/B4P2fVsB5WM52JbFsqXs8a56cSeLfsX8GgEnJYzSmwuhh1QA74B8R2Z40w6VsS26ZhD3oj5RLuvkWeBD7OwjRbjtaPI4j+x1Y2QU0SMCbhmnn8wV99lXQZn70wXhctkgM9hvszUB/qjq8PB9Mo17fJ/arJmv5zW941eAfX0qGQGqmKkCP3IkwMm7DMYweXGDJxwJKvVGapoZ5H/m7Zj8RMv+mpLpE2Ebex0hrnvNmgKX+kAGBrkaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Thu, 13 Feb 2025 11:03:30 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:03:30 +0000
Date: Thu, 13 Feb 2025 22:03:25 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
Message-ID: <6sejv2hauce3il5lq6sw53xmjjjglxkhz5copm62oryga6jioi@u66wl2nc3hoy>
References: <20250210193801.781278-1-david@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0069.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 5448ca85-2664-4a2e-fc10-08dd4c1e0c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bAogHz1DRdhgCv9GFw+NmitlXuxDlRIqe0k4jbAaaxayO8M/QHCCGEKanu?=
 =?iso-8859-1?Q?Y7lxMaKLJeVIip4gxqcxcEmP3FMCzjkKmCml8g6kqhEeWtEdBlu7aU/045?=
 =?iso-8859-1?Q?qMyqNYw7crN7kP9WjmP4n68CeEFCX+NcAF9wrv84CqZqGTOFAQ2CBVYjDH?=
 =?iso-8859-1?Q?h62AgT9h2FkcdBqFzbwguJs/zY7aXUiUjby5OWNqrvGrwjK4dB2558Vki7?=
 =?iso-8859-1?Q?LDKopPF7mcA24bWLRU3jogeJDGJr+2LL8ezzsuz1sITiGvH98jUdH60Lry?=
 =?iso-8859-1?Q?KsX9R2SdKZlX2Cf8IkKaLsYnhRLLBQZYCByhgz9tK/7q+s48+jIrv8/Sf1?=
 =?iso-8859-1?Q?LL+wlFhC8R4aTBuQ2x1MfBHloDuJQnLV2vNx1JUS64b4vqpNMRD4b65oYk?=
 =?iso-8859-1?Q?ZynYuq8Gk3wfs98hkzvffInps2WeyQMa2Qz83GQ2QCTLrid/I8TAgLEMSh?=
 =?iso-8859-1?Q?XQCkeBcu9ZU9ffdJgU014YUzKfPxUXl+KCHRCTZU80rOuYo2b0RrXnrnRF?=
 =?iso-8859-1?Q?5mj0pBeOSZbCpyEBOxI2Y4sVJLALcsDUAi8jpdEz52g5zmg2jUh73bj+d8?=
 =?iso-8859-1?Q?rbnIWRgfXCDkwn+lc1iRVvg56RNkbSoGR2V1uc3IqqLcHg6Dm411JdTCp+?=
 =?iso-8859-1?Q?AM1GNJsRlxCna9+CbGzblWCZN08dud2DHW8Uy0tKRFN76nMydP5+dclYkH?=
 =?iso-8859-1?Q?CxxiSjzdl8j73RlkNB744HwFzx+Xc8I/ksDgY493etDDaL2bi6v2CwjPan?=
 =?iso-8859-1?Q?mcdsq2SDr4+49kUQngjZDTivYrKhzzHpIieLcCNxcDle5lZQtPVrKrlAUy?=
 =?iso-8859-1?Q?Z5a6OAFjwCl24+OdllCxilWTDRf3tDNrMrF0AJfHcusfYh9u+uB9BX9gAY?=
 =?iso-8859-1?Q?qKf9x3FAkomGMdtL5tpRZsVV3vfWP8xNZRmUNLkV/2j/h3vArHyCy00Urj?=
 =?iso-8859-1?Q?lIHM52xyDE9EK0FOH1aykr3E0tgNAsyMUzsLq6HExijx4gF+HPi/f8IWGT?=
 =?iso-8859-1?Q?nxVOtTMj/PDyzD1qHdvOOgmyYWgIsBDL1Ge3KXOpqi0B4+ytwuuscdNm78?=
 =?iso-8859-1?Q?2l6raAbyr+BCbmiYzy56m1qPF8k8SN42CNh/WxpRO3aAxAkTpF6tqNv+yO?=
 =?iso-8859-1?Q?s2JPylPAt4zgJX1FBXs8LZoqLmfgZTros0CnFQKfoUN1pJwSXdQb4afjG3?=
 =?iso-8859-1?Q?hTXuEGE6mfb3WFjDb136/jWiOyyKuBqC9V5bEaWIDL7d+JQv5ki8CigJxL?=
 =?iso-8859-1?Q?dGm7He8Dl+nmG5AhRaCKj1SxAudmBJGaQco/QWfLZsu2ExYktfFIUCxwhS?=
 =?iso-8859-1?Q?EQ+VsSL752STg52+SnKqrlP1V/zizF/vIBliBQBX7LLgu22fdUqGYVuqxA?=
 =?iso-8859-1?Q?UZcaeksB64/xLSkZTlCmL7T+J4Vplk8VYHcxqhSOAE6GIdP3eMpbt76koc?=
 =?iso-8859-1?Q?mBzgYuYu8m9ZRrxu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vzAWsNwnrWtO3Y6h7e4vOL9iwN/BCubjbAIjSb+gxMcJOJJdgxfzDfyWFk?=
 =?iso-8859-1?Q?n8khfJ2FEeKdIDCb0vPhWTqC1utZ6PPc1RQS01XM4uqU81Ebyg61oLyzsk?=
 =?iso-8859-1?Q?gsA4M6lii5jDE6UtWnY/d9S8eaQwFsjk8XMyctzCfU8ZHBEesMRCnAv4gl?=
 =?iso-8859-1?Q?IsxL7VhbbHXSxTANsaF01o1dBC1u2nUfTQNu7vdLRkTOWTSPxSi0plHG5D?=
 =?iso-8859-1?Q?C7boFbVp0EpKJFhczBhdaYJS1mdHdLBBrPtbgkuC+iRiFJa2J6fR2vuSaZ?=
 =?iso-8859-1?Q?m/BxQMnLw8B2zLCFiMxiRGVP0ZZLBy0YkdUSRdSk5JgcmUMUC38U0OX0il?=
 =?iso-8859-1?Q?hMlbgDu8dcbu3Iqumw+Ntu+K302flPFx2Wbjl3UZ2w/FbBLa0jQ/qk3rQS?=
 =?iso-8859-1?Q?BcoKGMfFikoRcqS5Gjt+d5hL0hE7x04p1Il/4EByoR5junjRs6n/IEYnQV?=
 =?iso-8859-1?Q?iaBAwPk280fI2FaurTC7ntf605CowwsyKX6Mox0rvpOmfkoHKDPHev8ATQ?=
 =?iso-8859-1?Q?si+rD92G6DwtSeG4e3X4vJ1kcjCf2X2C9S0c1GfUUgEIQuw3fy8P870g4C?=
 =?iso-8859-1?Q?ZNpe4wwsxtMuJL0kyNtHHemhn7AszN/tcUHz/Czrr6yUUP6G1+60q6o8K5?=
 =?iso-8859-1?Q?v7jVCaLvT4eah8lR7JjV//hFob8knm5idgdqlizutZXgY6d+OBm6TgRiBe?=
 =?iso-8859-1?Q?P/z3jLjcS5mw1CwzbIIBpRgfuGdQRUsAykoknA7tRehCcN2x6E71J3cYYW?=
 =?iso-8859-1?Q?Ftzwlyl/UCrzkffdwNxl9z0Ngzmr6R37XU7mUGyZ9rQmfDGn+yFff1K3IZ?=
 =?iso-8859-1?Q?6LwJEGn7hrK2otHNTPyZFbo4sU7oG6pk4hmq9+zh9hlkMOTLVXxxaih2ri?=
 =?iso-8859-1?Q?YuV1hbnM0rPCI4cL5FQNJ0mAnCGE3J8d57zLIVrL17JC1+5tsd+PunonGS?=
 =?iso-8859-1?Q?G6izLPSu55TKmzd6dooq98rooXty7CQBNjLCOPUYIyXQN9e5d8p/8W/xqk?=
 =?iso-8859-1?Q?xBnWghrrEQYSrSuKrdfZi6ox5LnDdE8e+f4zJVXq8vclOrB8eZ+W6hhqgW?=
 =?iso-8859-1?Q?jP6aDVQ80S1xlg5iacc1BTrUnbI4n2e+edlxzdkzTQRLftfzyduUSbFG/Q?=
 =?iso-8859-1?Q?xmUWE8oWFSFGdEeYarkMoCA1gloG3cTSJFZWj9gyiF3KLub1aarPWHvIis?=
 =?iso-8859-1?Q?SghP5IwISMngTlmnrDDI3lXSNfucj618jKjHqasZU1+deW72uEcb1MFEEM?=
 =?iso-8859-1?Q?RZIYh7Aj641uEMzCV34ORydG1UvvMLtng10IhBT8jCJRS/B/vDW3KuL2xy?=
 =?iso-8859-1?Q?9zzKCnff0oJwxCvSUGD8Eha3RGOSjkbB6DGVnBvfJD5o7riwMxJX+RqeH3?=
 =?iso-8859-1?Q?LGYPXcBQBFZyfreiRowq2VMrDwgkXMdaWwKJplBwojba2TlXvhY5CyLK/i?=
 =?iso-8859-1?Q?LWFhC9wOhsTJ3WBMCO6V7thJA7aboN4cUK4gPt3wFQQ8DdmRqOY+i6fuk8?=
 =?iso-8859-1?Q?d28fJx732R5xkOC9WIss/HDGigfCMLtmHCRUY8BDHhN9GduD3oKX1WllCG?=
 =?iso-8859-1?Q?G/nREB0WrxyTCFnWZkXjTMwzeWAykDgHAq3uT3aWxogiTVfIJ2YtjqViAo?=
 =?iso-8859-1?Q?Xv5CjCzg6dwT7586gXqkxeAIukll+IM9uD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5448ca85-2664-4a2e-fc10-08dd4c1e0c60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:03:29.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AWZubZoWQ05DdF6QFrJ3NSwrZTX96CY/qjkLA/uhLb5kcTtQ7eQZTquL7/8n1sgw47mzYraeGxnhDtEge+kxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
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

On Mon, Feb 10, 2025 at 08:37:42PM +0100, David Hildenbrand wrote:
> Against mm-hotfixes-stable for now.
> 
> Discussing the PageTail() call in make_device_exclusive_range() with
> Willy, I recently discovered [1] that device-exclusive handling does
> not properly work with THP, making the hmm-tests selftests fail if THPs
> are enabled on the system.
> 
> Looking into more details, I found that hugetlb is not properly fenced,
> and I realized that something that was bugging me for longer -- how
> device-exclusive entries interact with mapcounts -- completely breaks
> migration/swapout/split/hwpoison handling of these folios while they have
> device-exclusive PTEs.
> 
> The program below can be used to allocate 1 GiB worth of pages and
> making them device-exclusive on a kernel with CONFIG_TEST_HMM.
> 
> Once they are device-exclusive, these folios cannot get swapped out
> (proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
> much one forces memory reclaim), and when having a memory block onlined
> to ZONE_MOVABLE, trying to offline it will loop forever and complain about
> failed migration of a page that should be movable.
> 
> # echo offline > /sys/devices/system/memory/memory136/state
> # echo online_movable > /sys/devices/system/memory/memory136/state
> # ./hmm-swap &
> ... wait until everything is device-exclusive
> # echo offline > /sys/devices/system/memory/memory136/state
> [  285.193431][T14882] page: refcount:2 mapcount:0 mapping:0000000000000000
>   index:0x7f20671f7 pfn:0x442b6a
> [  285.196618][T14882] memcg:ffff888179298000
> [  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodate|
>   dirty|active|owner_2|swapbacked|node=1|zone=3|lastcpupid=0x7ff)
> [  285.201734][T14882] raw: ...
> [  285.204464][T14882] raw: ...
> [  285.207196][T14882] page dumped because: migration failure
> [  285.209072][T14882] page_owner tracks the page as allocated
> [  285.210915][T14882] page last allocated via order 0, migratetype
>   Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO),
>   id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 227402023774
> [  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
> [  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
> [  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
> [  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
> [  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
> [  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
> [  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
> [  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
> ...
> 
> This series fixes all issues I found so far. There is no easy way to fix
> without a bigger rework/cleanup. I have a bunch of cleanups on top (some
> previous sent, some the result of the discussion in v1) that I will send
> out separately once this landed and I get to it.
> I wish we could just use some special present PROT_NONE PTEs instead of

First off David thanks for finding and fixing these issues. If you have further
clean-ups in mind that you need help with please let me know as I'd be happy
to help.

> these (non-present, non-none) fake-swap entries; but that just results in
> the same problem we keep having (lack of spare PTE bits), and staring at
> other similar fake-swap entries, that ship has sailed.
> 
> With this series, make_device_exclusive() doesn't actually belong into
> mm/rmap.c anymore, but I'll leave moving that for another day.
> 
> I only tested this series with the hmm-tests selftests due to lack of HW,
> so I'd appreciate some testing, especially if the interaction between
> two GPUs wanting a device-exclusive entry works as expected.

I'm still reviewing the series but so far testing on my single GPU system
appears to be working as expected. I will try and fire up a dual GPU system
tomorrow and test it there as well.

 - Alistair

> <program>
> #include <stdio.h>
> #include <fcntl.h>
> #include <stdint.h>
> #include <unistd.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/mman.h>
> #include <sys/ioctl.h>
> #include <linux/types.h>
> #include <linux/ioctl.h>
> 
> #define HMM_DMIRROR_EXCLUSIVE _IOWR('H', 0x05, struct hmm_dmirror_cmd)
> 
> struct hmm_dmirror_cmd {
> 	__u64 addr;
> 	__u64 ptr;
> 	__u64 npages;
> 	__u64 cpages;
> 	__u64 faults;
> };
> 
> const size_t size = 1 * 1024 * 1024 * 1024ul;
> const size_t chunk_size = 2 * 1024 * 1024ul;
> 
> int main(void)
> {
> 	struct hmm_dmirror_cmd cmd;
> 	size_t cur_size;
> 	int fd, ret;
> 	char *addr, *mirror;
> 
> 	fd = open("/dev/hmm_dmirror1", O_RDWR, 0);
> 	if (fd < 0) {
> 		perror("open failed\n");
> 		exit(1);
> 	}
> 
> 	addr = mmap(NULL, size, PROT_READ | PROT_WRITE,
> 		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 	if (addr == MAP_FAILED) {
> 		perror("mmap failed\n");
> 		exit(1);
> 	}
> 	madvise(addr, size, MADV_NOHUGEPAGE);
> 	memset(addr, 1, size);
> 
> 	mirror = malloc(chunk_size);
> 
> 	for (cur_size = 0; cur_size < size; cur_size += chunk_size) {
> 		cmd.addr = (uintptr_t)addr + cur_size;
> 		cmd.ptr = (uintptr_t)mirror;
> 		cmd.npages = chunk_size / getpagesize();
> 		ret = ioctl(fd, HMM_DMIRROR_EXCLUSIVE, &cmd);
> 		if (ret) {
> 			perror("ioctl failed\n");
> 			exit(1);
> 		}
> 	}
> 	pause();
> 	return 0;
> }
> </program>
> 
> [1] https://lkml.kernel.org/r/25e02685-4f1d-47fa-be5b-01ff85bb0ce2@redhat.com
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <si.yanteng@linux.dev>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> 
> v1 -> v2:
>  * "mm/rmap: convert make_device_exclusive_range() to make_device_exclusive()"
>   -> Fix and simplify return value handling when calling dmirror_atomic_map()
>   -> Fix parameter order when calling make_device_exclusive()
>   [both things were fixed by the separate cleanups I previously sent, realized
>    it when re-testing the fixes here only]
>   -> Heavily extend documentation of make_device_exclusive()
>  * "mm/rmap: implement make_device_exclusive() using folio_walk instead of
>     rmap walk"
>   -> Keep MMU_NOTIFY_EXCLUSIVE, and update comments/description
>  * "mm/rmap: handle device-exclusive entries correctly in try_to_migrate_one()"
>   -> Handle PageHWPoison with device-private pages differently
>  * Added a bunch of "handle device-exclusive entries correctly" fixes,
>    now handling all page_vma_mapped_walk() callers correctly
>  * Added "mm/rmap: avoid -EBUSY from make_device_exclusive()" to fix some
>    hmm selftest failures I saw while testing under memory pressure
>  * Plenty of comment/description updates and improvements
> 
> David Hildenbrand (17):
>   mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
>   mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
>   mm/rmap: convert make_device_exclusive_range() to
>     make_device_exclusive()
>   mm/rmap: implement make_device_exclusive() using folio_walk instead of
>     rmap walk
>   mm/memory: detect writability in restore_exclusive_pte() through
>     can_change_pte_writable()
>   mm: use single SWP_DEVICE_EXCLUSIVE entry type
>   mm/page_vma_mapped: device-exclusive entries are not migration entries
>   kernel/events/uprobes: handle device-exclusive entries correctly in
>     __replace_page()
>   mm/ksm: handle device-exclusive entries correctly in
>     write_protect_page()
>   mm/rmap: handle device-exclusive entries correctly in
>     try_to_unmap_one()
>   mm/rmap: handle device-exclusive entries correctly in
>     try_to_migrate_one()
>   mm/rmap: handle device-exclusive entries correctly in
>     page_vma_mkclean_one()
>   mm/page_idle: handle device-exclusive entries correctly in
>     page_idle_clear_pte_refs_one()
>   mm/damon: handle device-exclusive entries correctly in
>     damon_folio_young_one()
>   mm/damon: handle device-exclusive entries correctly in
>     damon_folio_mkold_one()
>   mm/rmap: keep mapcount untouched for device-exclusive entries
>   mm/rmap: avoid -EBUSY from make_device_exclusive()
> 
>  Documentation/mm/hmm.rst                    |   2 +-
>  Documentation/translations/zh_CN/mm/hmm.rst |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c       |   5 +-
>  include/linux/mmu_notifier.h                |   2 +-
>  include/linux/rmap.h                        |   5 +-
>  include/linux/swap.h                        |   7 +-
>  include/linux/swapops.h                     |  27 +-
>  kernel/events/uprobes.c                     |  13 +-
>  lib/test_hmm.c                              |  41 +-
>  mm/damon/ops-common.c                       |  23 +-
>  mm/damon/paddr.c                            |  10 +-
>  mm/gup.c                                    |   3 +
>  mm/ksm.c                                    |   9 +-
>  mm/memory.c                                 |  28 +-
>  mm/mprotect.c                               |   8 -
>  mm/page_idle.c                              |   9 +-
>  mm/page_table_check.c                       |   5 +-
>  mm/page_vma_mapped.c                        |   3 +-
>  mm/rmap.c                                   | 469 +++++++++-----------
>  19 files changed, 315 insertions(+), 356 deletions(-)
> 
> 
> base-commit: e5b2a356dc8a88708d97bd47cca3b8f7ed7af6cb
> -- 
> 2.48.1
> 
