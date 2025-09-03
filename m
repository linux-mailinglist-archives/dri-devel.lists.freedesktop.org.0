Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E86B411CA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F275210E855;
	Wed,  3 Sep 2025 01:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S8SD12vS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAF110E851
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaOnElKazLx0QzcR/2ch3qqCJm4PjYQr1/SeMXOpPHU8v5rH0W102aoFXsj1qisdCN86/JYuCnzYnHQqvTH3RUm+C1PLzyG+QqqmfhHb16P07Tyjhf8IriVoYPVkZbY0SPHipWP8EJPpOjkhOF+U6z6Njjykra3blB2Gb1jXupSbEUfBnbJ/uZH0Bj5mx10545FZz6SeJMGaiaWGX8H5cWOTRJNAUQcRA/zJZIAPeio8VlwUbwJlCF9XbxVUOA2qEsufsFDfhoLovNXNVDXgRXu6QIXg3evH6ny3MyvXDeRbf9tx0mQ8wX4FodA0Z05TfsVq5HWrYehdU7xPTZmT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0wSAh0eRacdYU8lbRZJ4JSZzQAEKq4KqanSPA+2n8A=;
 b=BralJusQHneXskVfrYmW5LYuvZ1R248jqb8ckjvQYBUbrjcRqfHRbAmlaW59DqC5YZuNABeuSyZ7Mv8tXGfU02i+8b3fm2Kfl/TyO+76F+6cv/DpaMtfEARgVx8pcnvU0yxsdZsAXa8rfaPCRXMcE4B+I9S0EEjoksg0zrGPfx0XrvczHPV8fhZiZ3OetffO0XQ24Bzv3sw/GGBXowysebMgozUq+ybml/vWjaoWY1vOx/oG43PEFIcmWxsKiGsWhhMmcpffNIVQal5mYgJa+2VumEi/zkDm/QCFKG22tnYXF9a0XO+NyDBeLhM1v2Kth4z+PYVmhWpXp/9Dh/9O0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0wSAh0eRacdYU8lbRZJ4JSZzQAEKq4KqanSPA+2n8A=;
 b=S8SD12vS2KGTWwTZ9UVjDDyZNqHq3TI160LRJerkIasTiat1Clt45ABL+LnTrOyl5vfmXejlw4aaMeCYvzR2JX803OWlrsOXJPo3514VgDEaj5pqQfYhivKInNgN1EP/so+N3EgvKs6uoifCX5ncwg6zBRkYDfBaBHFUIMSfJDN2vWrGFyZimyvhuQ8bPJGnEDDgN/ZulacUX1f/STxq6MkX3kQWaZDZLkDLgAi3d3qmiQxkSXb8+ul55WxezWoIEwjETpogxeoGm1nCVdk43tnAJSPTrh2YQJH1xzd6dyOtk7cx3PKqLG7/mubl/VOOjLm2ALuhAUYcCOzx2HgtJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 01:19:54 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:19:54 +0000
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
Subject: [v4 06/15] mm/migrate_device: implement THP migration of zone device
 pages
Date: Wed,  3 Sep 2025 11:18:51 +1000
Message-ID: <20250903011900.3657435-7-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0120.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::20) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 9025acfe-3a1d-4446-1acb-08ddea87fd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzhiWStjRTZuSWdNenBvSitxRkVxQlU0cm4zVi9rSU91emJkZ25GdmE3ZW5a?=
 =?utf-8?B?eE1CRkZzcCtQRFd1VUdHWGl6czY3Wit5djFYNlpNZXJONmNzMXE0MjhwQkMw?=
 =?utf-8?B?Q2pmYStNMlordXJtV2QxMCt4WTJTVDdzTmRuNW9FbjJybDRUS2w5QUNGNU52?=
 =?utf-8?B?ekFCeDFqdlc2M1dncklJckVRcWdsY2xWRUdHNzBWYkU4SCsreG1Hb3VDR09V?=
 =?utf-8?B?QWpiVDR5UXIvWk83U29nY3pIR0NIZm9hbzgycW9PTU1xdm1Bb3JVT2orTUo5?=
 =?utf-8?B?SkpIWWticXQwWkMvQmhUemhQVDk1UThiUlFRKzVOMkVIL2VHam9BQWhENmhK?=
 =?utf-8?B?UzgxcGZEYmtoSG80YXZnNVdpVzJwWCthM1JsY3lKOTcrT1hLTW9GN3VBU09T?=
 =?utf-8?B?Q2RJYzhTMlN6bGEySUdaN0xUNEFCN3h3Tmg3eUpwNnR2cnVzdUtxdUhuY05t?=
 =?utf-8?B?REtNWldubm5WaUQ0SWJkRGhmT3pyaTMvNkdiUy95djg5aGRrKzA4TzVEQVlR?=
 =?utf-8?B?VjVPWjdxa0R2L3Yrd1RrYkdvVTk0VnNTVWFGZHlnVE5pMTVsSkZ6amtQRVY2?=
 =?utf-8?B?dHE3VGVpdGFDMEhlbXV1UkRtUWxod2lPVWlnZkwvc1hpZ0NvNEpFSFZnMS9k?=
 =?utf-8?B?b2E3Q3RsZUVxTDNvTENqQndhNDFGdHhVdXJpZGxwbnJDWFBNSG9rRUMxb1Vk?=
 =?utf-8?B?NHNPWDVrbWhXNGdVMERlcVZjd0d6cktITjkzaE5NaGpjZlhGVk9pd2g4eVpC?=
 =?utf-8?B?VHlRa1U0eTg1SGhmeTFaWktHU0VZdUwwbUhFTnl3STZmK3orVlpWZFpmMzJw?=
 =?utf-8?B?V2ozSjNISE4xNUZzU29pcmZXc3Q0T2t6cHVRYnY1MmtFRFBLRGtiSjV5TnAx?=
 =?utf-8?B?bXpab2h2NjFIU0ZoYlVXU0NGS01mM1U5cDRVc0NqQXBmV1lpVi8wTk56Zndm?=
 =?utf-8?B?VGtZVjF5Z3ZOeG1zT0wrNFI0UXQyenVGbzFlWk9XMkRvNTNXNmVYVzNHOHg4?=
 =?utf-8?B?ek1iYlZlWG0rNGRmSXpvTk1OcXEySEZ4U0htKzZ5TDJyMU44SXlocFpXclNE?=
 =?utf-8?B?Y01ENlRuL0lTcGlKSW5MSlBjckZkcnZzSXkyYS9vb1ViZVRCMEcrUXJ6aXo3?=
 =?utf-8?B?UlpkckdDWmlGbjVBV200RHJrWnVBQUZLdTIzZ291L3RLY3oxQThqVXhUYmtL?=
 =?utf-8?B?T2JHK0pyUXhCb3JLUDlVUUhMV1JjMFVIbVk4Vk11Nm81WnBPdUFqaWhaU3Ja?=
 =?utf-8?B?c0JUaUQ1TGFodEFNaWM2Rk1zTlRhWGU0b3VpN28wNjlSdGRRVk93VVk1S0Ni?=
 =?utf-8?B?Kzg0TDRxQ1k5RjZaRGFFL25vek5XOGt5YjRaSE0zdWc0bGZkMUxsVkR2Qm9k?=
 =?utf-8?B?S05GWTVqcUp4RGRNeDA3cEFiRnVCK1ZvVUR6amR4c1hjeUNFbVVPSWhFb05i?=
 =?utf-8?B?QVkvaWRXNi9qYVFwS1J5L2hDWGU2QUlqOXhtZ2Rta3FDa2ZFdWJhT3hSKzBU?=
 =?utf-8?B?Q2RqWU12SG9KVjJ6cjl6SzZ5Y25MclJvbDVNNWNSM3lmOGxqbXdkN01lWnNt?=
 =?utf-8?B?UXJaUnBiMlExWXpvbVZGWXJxSFpadzZwemliTlIwZWVOUmFPYXVNMy9RaWlS?=
 =?utf-8?B?Mkk0ZjI0bGY2OEliQnNIQ2VURkw3Z0FGS2JjbzFUTk1mSFVDaFk2a0haaUhm?=
 =?utf-8?B?bTQ5RDR0eHk2ZkVPc3RzWXg5ODJ2SVNxcEhNSXdSekRDZDUwWkJRWHRnNXN1?=
 =?utf-8?B?NlJmbURWUFhLblhuSnlLc29IaDdMVXlta3NVamtVQWRzMkRyVTEwSDRRWFFp?=
 =?utf-8?B?TEM5MlN0SFFGaHNjVzdiOHUvUjJKYytHMDBMS0VCUmZ4RmdqWUpqd0RKSUxo?=
 =?utf-8?B?U0JjUlpUaEZ3T2tUc2hsMHRsSGU3WHVBY2hWU2pjYnRHTTc3emdoaUM5aVRi?=
 =?utf-8?Q?2NGPecFbZT4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5aajNheTBBU01iQytOQllrRUZIcFRjK0Jhb2hyeVZPcVBUYXNSanNrT0hp?=
 =?utf-8?B?c0Q1Y0M3NStEYzFMV1AyWlc2c1o1QVJUU1N6YkZjd08rRHBHZ2NaKy9BVHAw?=
 =?utf-8?B?UFNxcVcvai9oL0Y1TUNXck9ETG5uUnNQcW9GNCs1bXRtaDlPN2FtZXlTU0tr?=
 =?utf-8?B?NWUrNnVQemRhR25Jekx4ZjhVQTJsbXpDbGNDR1cvSWVybXNISDI0Vk1nSXc2?=
 =?utf-8?B?b0t2WlhjbjlveTAzeXhhUnlibE5HaC81bmhkUnlMNUxYVDUwRkQya1FIckE3?=
 =?utf-8?B?Q2dnSVJaNStHS3NJaEVsZTEyOWdRbHRTdi9QVFp2WVI4NkxaY0l4WlVHR3lK?=
 =?utf-8?B?KytSb1RjM01EcUJzZTljdC9iZGxOV2tRZDQ1VGdBbDd5ajB1S0loTDJoeVlv?=
 =?utf-8?B?Zlg4S2dKQ09zL04vd3NqMEhOOTU1L05YRkN2dCs2M00yWmcrLzlUc09Kcnln?=
 =?utf-8?B?V2VNbkcyODA4bStCODJpRTlBTmwwQzdtTm9TMDdWNXlmZFVRM0IxWUpidVNY?=
 =?utf-8?B?cGpsUEIzTnRab29YdC9JS016R0RVVEpxL3d3UVFrY1o4WEV6YVFIdjlRaHht?=
 =?utf-8?B?OWtoZCs4RzVTN2R6OGxKbkxlV0RsR2lqaVFlb2I5bVVRcVBtTFJjc09SeGNW?=
 =?utf-8?B?NUtIamdROS9CWjVoN2VnMUdOc2Zxa0lqbUU3OUJoU1BJaG5SazZlbHVQTnFE?=
 =?utf-8?B?eUNYM3VwTWVWUnk4UGxGQUJsVzBOTVRYaC9YY3NEK0FNYnNMUjk5VVBNbldx?=
 =?utf-8?B?YXhaRDdFd1JnbkgvMndGalJkc1RVMTVRN1JrSlIxSjNqbExuQ3J4SVlydWxy?=
 =?utf-8?B?bkZWNnhROGtta3diS1VYUmM0ZmZma0ZFS1czbVFOT2JYWWZLNGpDVEhvWXND?=
 =?utf-8?B?dElVaDFRSGNkUEJJVXYwY1RyZGF2dklPbzdUbmxXK2NmM3V2bnhXb2ZTWU91?=
 =?utf-8?B?R3h0Ylc1QUxMZXp4c3R0VHk4VGhtdU9vQU9DMVRidm85UGNINVptWXNpQXJ6?=
 =?utf-8?B?V1A2bzcwcUgyMG5hY1BuOGJFT2dKTHYrdFdVTUJsOGo0eE8wQkVFcDVjSEpq?=
 =?utf-8?B?ZlFMV2ZSSnp0QkNtK1g4T3JiZnVVaHNlbDFnYUtqQ1JhZlNYeTVBd2xqd1dE?=
 =?utf-8?B?YjdMeVUxTVlwNTkrZGNNemxhZTBDazRyMldsTGlYY1d5OWVYSUp6cmh3dHpP?=
 =?utf-8?B?RGZvL3BESy81VG8zWGFlNXFYZC9VRGxLZ0ZDMmRMTndUQlV2dnpoNlZyeDh5?=
 =?utf-8?B?YjNid0Y5RlZzbjRPZ3l4SitaVHJzTGc1NnJrWTFPZFVUMU5uNGNLcExjKzRh?=
 =?utf-8?B?cTBzTU00bWNGUS93K3hwZ3g4OGJBY0FHU2x6ZW1nNStSd3UrWWdkSld0dWxW?=
 =?utf-8?B?RndySkVndnpJd0U4NUVPaXRMRHJDZklxQnlrZzd4Tnh1Rm1QdjFnRHJVT0Zo?=
 =?utf-8?B?YjEwcE4vd0R0M3B1eUhCbDd0WnBTZVNCcTNFZk9DY1h4U0xsRmZXbmxmVVVN?=
 =?utf-8?B?RzYxYkhtanVPWVE3RlNWTU4zaytqS3kyc2lZQWdiYWdZOFQ1YjVSSW55ZFNu?=
 =?utf-8?B?bzhSWmI3eVBBZnRBN202NlJRelA0SjZ1L3kwU1VVRnBzVjFvN0dtTFk5cE1X?=
 =?utf-8?B?RDVKbVBGRmNmZGZlRkkwb1JpNGlIa3BVd2NHSlRTeDVMM28yanF1ZVoyVllu?=
 =?utf-8?B?dUl3S25YaW9WNDFXbkpUTmhyK3BYRiszSXNldkQzbHA4S2NDclZnSkJBK2Yw?=
 =?utf-8?B?dkpJdjJUY2N4MVdMTVpiRlkwVTB2RjlBWmQ4OE95ZzN5dlBsSzNrcWJ2WWFn?=
 =?utf-8?B?WDRGRWZIQzZqNE5DMlNlRys0QWFHRUM3eCtNekQ5aU1yUG90aDNTR2t6YlBx?=
 =?utf-8?B?UGcrbnRQdjdtajJJdGFycDVOVkc5eFpyVXlvL2FKMkpJMUg5cEtucGlUY3Yw?=
 =?utf-8?B?SENJTFdLM1BCcGJ2aFU0T0pQNjNPSGNHWlZ4dit1ZG50d1FtYmhWWFl1ZmZt?=
 =?utf-8?B?RC9mSDhOSFJESHp5RHBYMTIycmR1ejhJQWtQZ1JrN00wR3JDMkdoZ1J6WEFh?=
 =?utf-8?B?TUd3ZThMeTFMVEVYMUlEWnh1Yjh2eE9SNWxhUkJWRUUwWDhFQXV3dFZaUWYv?=
 =?utf-8?Q?VyShxoz3PGFoZPvYB2u4MJg1b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9025acfe-3a1d-4446-1acb-08ddea87fd23
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:19:54.8188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LndSrhV4tI98vW23JdqeE0rCHUg3il49y/jB1Ri+TfGW6ri3YTB2IowvBMDkqVe2mIKpneWgbdse7zpz10KJwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
device pages as compound pages during device pfn migration.

migrate_device code paths go through the collect, setup
and finalize phases of migration.

The entries in src and dst arrays passed to these functions still
remain at a PAGE_SIZE granularity. When a compound page is passed,
the first entry has the PFN along with MIGRATE_PFN_COMPOUND
and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
representation allows for the compound page to be split into smaller
page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
page aware. Two new helper functions migrate_vma_collect_huge_pmd()
and migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for
some reason this fails, there is fallback support to split the folio
and migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in
later patches in this series.

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
 include/linux/migrate.h |   2 +
 mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
 2 files changed, 395 insertions(+), 63 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 9009e27b5f44..40e1c792eb54 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -134,6 +134,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_COMPOUND	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
@@ -152,6 +153,7 @@ enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e58c3f9d01c8..aba0cd7856da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -14,6 +14,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swapops.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
 
@@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma))
 		return migrate_vma_collect_skip(start, end, walk);
 
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
+						MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages] = 0;
+		migrate->npages++;
+		migrate->cpages++;
+
+		/*
+		 * Collect the remaining entries as holes, in case we
+		 * need to split later
+		 */
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+	}
+
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->dst[migrate->npages] = 0;
@@ -102,57 +120,150 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return 0;
 }
 
-static int migrate_vma_collect_pmd(pmd_t *pmdp,
-				   unsigned long start,
-				   unsigned long end,
-				   struct mm_walk *walk)
+/** migrate_vma_collect_huge_pmd - collect THP pages without splitting the
+ * folio for device private pages.
+ * @pmdp: pointer to pmd entry
+ * @start: start address of the range for migration
+ * @end: end address of the range for migration
+ * @walk: mm_walk callback structure
+ *
+ * Collect the huge pmd entry at @pmdp for migration and set the
+ * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
+ * migration will occur at HPAGE_PMD granularity
+ */
+static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
+					unsigned long end, struct mm_walk *walk,
+					struct folio *fault_folio)
 {
+	struct mm_struct *mm = walk->mm;
+	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
-	struct folio *fault_folio = migrate->fault_page ?
-		page_folio(migrate->fault_page) : NULL;
-	struct vm_area_struct *vma = walk->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long addr = start, unmapped = 0;
 	spinlock_t *ptl;
-	pte_t *ptep;
+	swp_entry_t entry;
+	int ret;
+	unsigned long write = 0;
 
-again:
-	if (pmd_none(*pmdp))
+	ptl = pmd_lock(mm, pmdp);
+	if (pmd_none(*pmdp)) {
+		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
+	}
 
 	if (pmd_trans_huge(*pmdp)) {
-		struct folio *folio;
-
-		ptl = pmd_lock(mm, pmdp);
-		if (unlikely(!pmd_trans_huge(*pmdp))) {
+		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			goto again;
+			return migrate_vma_collect_skip(start, end, walk);
 		}
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
-			split_huge_pmd(vma, pmdp, addr);
-		} else {
-			int ret;
+			return migrate_vma_collect_hole(start, end, -1, walk);
+		}
+		if (pmd_write(*pmdp))
+			write = MIGRATE_PFN_WRITE;
+	} else if (!pmd_present(*pmdp)) {
+		entry = pmd_to_swp_entry(*pmdp);
+		folio = pfn_swap_entry_folio(entry);
+
+		if (!is_device_private_entry(entry) ||
+			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			(folio->pgmap->owner != migrate->pgmap_owner)) {
+			spin_unlock(ptl);
+			return migrate_vma_collect_skip(start, end, walk);
+		}
 
-			folio_get(folio);
+		if (is_migration_entry(entry)) {
+			migration_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
-			/* FIXME: we don't expect THP for fault_folio */
-			if (WARN_ON_ONCE(fault_folio == folio))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			if (unlikely(!folio_trylock(folio)))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			ret = split_folio(folio);
-			if (fault_folio != folio)
-				folio_unlock(folio);
-			folio_put(folio);
-			if (ret)
-				return migrate_vma_collect_skip(start, end,
-								walk);
+			return -EAGAIN;
+		}
+
+		if (is_writable_device_private_entry(entry))
+			write = MIGRATE_PFN_WRITE;
+	} else {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	folio_get(folio);
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		spin_unlock(ptl);
+		folio_put(folio);
+		return migrate_vma_collect_skip(start, end, walk);
+	}
+
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+
+		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+						| MIGRATE_PFN_MIGRATE
+						| MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages++] = 0;
+		migrate->cpages++;
+		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (ret) {
+			migrate->npages--;
+			migrate->cpages--;
+			migrate->src[migrate->npages] = 0;
+			migrate->dst[migrate->npages] = 0;
+			goto fallback;
 		}
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+fallback:
+	spin_unlock(ptl);
+	if (!folio_test_large(folio))
+		goto done;
+	ret = split_folio(folio);
+	if (fault_folio != folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	if (ret)
+		return migrate_vma_collect_skip(start, end, walk);
+	if (pmd_none(pmdp_get_lockless(pmdp)))
+		return migrate_vma_collect_hole(start, end, -1, walk);
+
+done:
+	return -ENOENT;
+}
+
+static int migrate_vma_collect_pmd(pmd_t *pmdp,
+				   unsigned long start,
+				   unsigned long end,
+				   struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long addr = start, unmapped = 0;
+	spinlock_t *ptl;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+	pte_t *ptep;
+
+again:
+	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
+		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
+
+		if (ret == -EAGAIN)
+			goto again;
+		if (ret == 0)
+			return 0;
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
@@ -270,8 +381,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -442,14 +552,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 	 */
 	int extra = 1 + (page == fault_page);
 
-	/*
-	 * FIXME support THP (transparent huge page), it is bit more complex to
-	 * check them than regular pages, because they can be mapped with a pmd
-	 * or with a pte (split pte mapping).
-	 */
-	if (folio_test_large(folio))
-		return false;
-
 	/* Page from ZONE_DEVICE have one extra reference */
 	if (folio_is_zone_device(folio))
 		extra++;
@@ -480,17 +582,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 	lru_add_drain();
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
+		unsigned int nr = 1;
 
 		if (!page) {
 			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
 				unmapped++;
-			continue;
+			goto next;
 		}
 
 		folio =	page_folio(page);
+		nr = folio_nr_pages(folio);
+
+		if (nr > 1)
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+
+
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
 			if (!folio_test_lru(folio) && allow_drain) {
@@ -502,7 +611,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -521,10 +630,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
-			continue;
+			goto next;
 		}
 
 		unmapped++;
+next:
+		i += nr;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
@@ -670,6 +781,147 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @folio needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @folio: folio to be inserted at @addr
+ * @src: src pfn which is being migrated
+ * @pmdp: pointer to the pmd
+ */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	struct vm_area_struct *vma = migrate->vma;
+	gfp_t gfp = vma_thp_gfp_mask(vma);
+	struct folio *folio = page_folio(page);
+	int ret;
+	vm_fault_t csa_ret;
+	spinlock_t *ptl;
+	pgtable_t pgtable;
+	pmd_t entry;
+	bool flush = false;
+	unsigned long i;
+
+	VM_WARN_ON_FOLIO(!folio, folio);
+	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
+
+	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	ret = anon_vma_prepare(vma);
+	if (ret)
+		return ret;
+
+	folio_set_order(folio, HPAGE_PMD_ORDER);
+	folio_set_large_rmappable(folio);
+
+	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
+		count_vm_event(THP_FAULT_FALLBACK);
+		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
+		ret = -ENOMEM;
+		goto abort;
+	}
+
+	__folio_mark_uptodate(folio);
+
+	pgtable = pte_alloc_one(vma->vm_mm);
+	if (unlikely(!pgtable))
+		goto abort;
+
+	if (folio_is_device_private(folio)) {
+		swp_entry_t swp_entry;
+
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pmd(swp_entry);
+	} else {
+		if (folio_is_zone_device(folio) &&
+		    !folio_is_device_coherent(folio)) {
+			goto abort;
+		}
+		entry = folio_mk_pmd(folio, vma->vm_page_prot);
+		if (vma->vm_flags & VM_WRITE)
+			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
+	}
+
+	ptl = pmd_lock(vma->vm_mm, pmdp);
+	csa_ret = check_stable_address_space(vma->vm_mm);
+	if (csa_ret)
+		goto abort;
+
+	/*
+	 * Check for userfaultfd but do not deliver the fault. Instead,
+	 * just back off.
+	 */
+	if (userfaultfd_missing(vma))
+		goto unlock_abort;
+
+	if (!pmd_none(*pmdp)) {
+		if (!is_huge_zero_pmd(*pmdp))
+			goto unlock_abort;
+		flush = true;
+	} else if (!pmd_none(*pmdp))
+		goto unlock_abort;
+
+	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
+	if (!folio_is_zone_device(folio))
+		folio_add_lru_vma(folio, vma);
+	folio_get(folio);
+
+	if (flush) {
+		pte_free(vma->vm_mm, pgtable);
+		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
+		pmdp_invalidate(vma, addr, pmdp);
+	} else {
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
+	update_mmu_cache_pmd(vma, addr, pmdp);
+
+	spin_unlock(ptl);
+
+	count_vm_event(THP_FAULT_ALLOC);
+	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
+	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+
+	return 0;
+
+unlock_abort:
+	spin_unlock(ptl);
+abort:
+	for (i = 0; i < HPAGE_PMD_NR; i++)
+		src[i] &= ~MIGRATE_PFN_MIGRATE;
+	return 0;
+}
+#else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	return 0;
+}
+#endif
+
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -680,9 +932,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
-				    struct page *page,
+				    unsigned long *dst,
 				    unsigned long *src)
 {
+	struct page *page = migrate_pfn_to_page(*dst);
 	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = migrate->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -710,8 +963,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp))
-		goto abort;
+
+	if (thp_migration_supported() && (*dst & MIGRATE_PFN_COMPOUND)) {
+		int ret = migrate_vma_insert_huge_pmd_page(migrate, addr, page,
+								src, pmdp);
+		if (ret)
+			goto abort;
+		return;
+	}
+
+	if (!pmd_none(*pmdp)) {
+		if (pmd_trans_huge(*pmdp)) {
+			if (!is_huge_zero_pmd(*pmdp))
+				goto abort;
+			folio_get(pmd_folio(*pmdp));
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -802,23 +1072,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	unsigned long i;
 	bool notified = false;
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		struct folio *newfolio, *folio;
 		int r, extra_cnt = 0;
+		unsigned long nr = 1;
 
 		if (!newpage) {
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		if (!page) {
 			unsigned long addr;
 
 			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
+				goto next;
 
 			/*
 			 * The only time there is no vma is when called from
@@ -836,15 +1107,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = HPAGE_PMD_NR;
+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				goto next;
+			}
+
+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
 						&src_pfns[i]);
-			continue;
+			goto next;
 		}
 
 		newfolio = page_folio(newpage);
 		folio = page_folio(page);
 		mapping = folio_mapping(folio);
 
+		/*
+		 * If THP migration is enabled, check if both src and dst
+		 * can migrate large pages
+		 */
+		if (thp_migration_supported()) {
+			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+
+				if (!migrate) {
+					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
+							 MIGRATE_PFN_COMPOUND);
+					goto next;
+				}
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			}
+		}
+
+
 		if (folio_is_device_private(newfolio) ||
 		    folio_is_device_coherent(newfolio)) {
 			if (mapping) {
@@ -857,7 +1160,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -865,7 +1168,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -877,6 +1180,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -1038,10 +1343,23 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, pfn;
+	unsigned long i, j, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++)
 		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+			pfn += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
@@ -1059,10 +1377,22 @@ EXPORT_SYMBOL(migrate_device_range);
  */
 int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 {
-	unsigned long i;
+	unsigned long i, j;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = pfn_to_page(src_pfns[i]);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (i = 0; i < npages; i++)
 		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
-- 
2.50.1

