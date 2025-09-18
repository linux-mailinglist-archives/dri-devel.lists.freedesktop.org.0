Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3336EB82AF9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 04:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5610E62C;
	Thu, 18 Sep 2025 02:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pxTMGtyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9CF10E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 02:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CckbLtH9AxGbraslws1vTdRttq4cSP+eFZBOj4Co0hTbK8BfZQY3htZcgA3eV11Dm+cJW++IXk/A8H0OK0TOsmAkXwfn6rKBmSqYV0407Y/R+f9MoAcsD6JCZjWkwsoKhOaPrR9nWy52NiF22XfpnXZ6I5HT8Fu0avptZUP6rc+kyvNBOwKos5glItF7QfGASU7BZtDifj6g2NNZmmfh+ffnk9szS5XYSwbQz/VWnUJ6qpB4DWagF2jAqjSqoUtj+FlBPm3RSNPB6J4uMrzgSpT1DK9dEAsQ8WALyQQ0c2BuZ2y/6IIDk+9YYS54EQxDuOPZcYKf6mfQAvVCKLlgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU5SdNc5e4oimPWpzyj5B2U17xB2FMzAi8d37PaG41k=;
 b=cDuW4iQxZNtQfrlQG/an1o9UP7PE6I3G/OfBeyD/8BxDNshbpwcPRoVOrv21hDUbIdVduyXBJTPEoE3Qe1Oip2Y0iNCfBWYbh1NkRqKYhFi/1oHY/F1UWhPCBka6GLNrRU69Xebf7lnTLRG4w7oJ0k03cGEL8AW880jERghf6D0XPoIThI1k35nUPj7WXhkzr2Di+Gx5+uL5+JqZ7Q3/K8SLNBG7qjCOdlyUaDWHjYC1ybH/fiPcX252tMjrH9GOF956wgW4VNkf65Ei4Xs+64i3R3BtIJWgFZ/J+UMhLLEB7Ahwr3tAKGQAnSh6HvI3GPQDLeH5fO4o8HF2V9OVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU5SdNc5e4oimPWpzyj5B2U17xB2FMzAi8d37PaG41k=;
 b=pxTMGtyFbCB/33GW1Cv1uGj1XqiBsoo6jqqeA0kGVnPLTfSkvloBUuISfMu0RCr85VN9hgMvrptsFkCf0MyEtPZ78QKWqzps1B9hOm7PyuFICZyO8eN2FeO1iVXGks7SKKxqO7SL4DuSGii4pjM4YuQYklIPbyC02IyUgTIASqUxMIiVqiRH5bgyZA4w7/L+SVG/hzjmHJZGPTJMIAUhbqbdhhjQhWsVhpruo7JX+JTCP33JpyyM5t9At4tLo+lqVaSGLYlQJFv8jeUN2Chwi0/cKega3l3vaXJopm2g9vOJubR8S4r94NXWQwMaQdQZu01gx1M4Pxd22jup4TyDRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.23; Thu, 18 Sep 2025 02:49:39 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 02:49:39 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
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
Date: Wed, 17 Sep 2025 22:49:36 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
In-Reply-To: <20250916122128.2098535-2-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:208:530::11) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 1710466e-d755-42be-a328-08ddf65e02a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXlGcVZnTEJLOWNGZitKTndoeHEyUzJBU1FCVjBSejlEVkxVVmZhQzJ1Vk5r?=
 =?utf-8?B?a0N1eGxlMHdGRzJKeWJuVnJTTEpla0JyQ21lT3h1MkZXa1N4czlLL2NqV2Fn?=
 =?utf-8?B?NFJYaVNwbkg0eGhiQmRnbGxqczBZdDRiYUIvWWk3alNkaGkyZm56U2QzS2o1?=
 =?utf-8?B?UW5nbk1STDhodVNOWG5XMDZZYkZRb1pSZTRYOEhVaCtMUTBFUVNIVkVEeEJ1?=
 =?utf-8?B?NlJwOXo2WktLVzIrbm9maFoxcC9uUHdWVjV2VFNoUGhKZ05VUEFEamN5Z3RR?=
 =?utf-8?B?NEplbHppeTYydTQ4TW4wcDBIS09ubUdJM1J5cHEvdmNweWlWc0haYnBobzFw?=
 =?utf-8?B?Y2JzRXRTaklDRFg2R1BnWjNjT0dxTXZEdm9tQlhtT2Y5b0R1YkZndU94Ymh5?=
 =?utf-8?B?ejA4YnQwZFhyQnBqL1JqOXpxcHNkc2sxVkxKL2JPN2xDNHpBcjhKQTJVU0xq?=
 =?utf-8?B?Nys1ZVVLWlJ5cElBZEo0T2NiaHpIQWRaZUtsZ2NjVzkvSEtLUS9qYU9FSkMr?=
 =?utf-8?B?VW1rZ21JSjJxOW5BakttWXZOdUZFVjVjdkV5SE5GQ2hBWXVjNGZWQjRrVWor?=
 =?utf-8?B?ZktqVU85czY0aGord0hyVGRSUVlCV2g4a1grK0ZUcnhVcW0zRmZCUlR5cmZt?=
 =?utf-8?B?ZU1OZlJrYTl6dHpzek5tZHJJVWdJVloyNnJoanl5OXhNQlE5SUVxOFJNa3VD?=
 =?utf-8?B?citCeEhEb0ZHVmk1UlU5MzJZYTBieTJFT3VQaUpZNC9uMHFqRHRvc1VtODMr?=
 =?utf-8?B?aG8zU1JBRXh4R3pqOGZhWU5HMHlyZ3NYNFExZlgwWG8xZ2FJdGpBMi9rR0ND?=
 =?utf-8?B?Tk50UXZCQVJ1bndGMzJERUlNTHlIZ0JaKzNLdE9KZm1rNEQ2bTY5UGJ6Ylpu?=
 =?utf-8?B?RHNpNmxSNDFOdThDdm90dWlkeDBCQ0ZPbnVzMEUraGR0cTBEUHFCMWFuUnZa?=
 =?utf-8?B?R3F2YlpvUTRueS9WVGJ2b2s4Z0hNeU4wZHRJdXpqOWhPdmYvd1o0V1ovc1Rl?=
 =?utf-8?B?ZWRrOFdmTVp4Z0p0TG9tOE9FcWdIUkxHbk00aHhQeW5pM1kwNG5LYUpwUWs4?=
 =?utf-8?B?aDZnZ3ArWVZLcitXS2FCRmRsY3lZM2UvSEJJQ01Hak5aalR1M0RxZHFIRm9w?=
 =?utf-8?B?WTIwMGwwRzlZVDE4SDgzUk9DZ3Nldmd1dlFjcTRFVDY4anVZb1RSWFoxTUVP?=
 =?utf-8?B?K1BLZmRyNWgyTTBpcWQ3dzlUbHlUYnpuelN3S2xHckE5ZHFUY1ZCZFdNQUta?=
 =?utf-8?B?UUg4eEhMb3gzWkFIZ1loMDN1VjUwa24wUElQanNQK24xOTJ2cVFuakVobWEx?=
 =?utf-8?B?YU1qdVFNK2pYZ3hTZE5BbW9XaWgwYzZua0RLRTMwVGdwb3MwaGdwNXdwZ0ZH?=
 =?utf-8?B?ZStzZ2hzVkNRTjAzNldPd3lhZ1RwcUxqSW85bU5pM0RGdmZ4c0tJNTl6emth?=
 =?utf-8?B?eGpqTlVxaUNtOWNTVURBZzcwSk9RU2tOVEFtTzllSlRyUENIQWhaSHB3RW5H?=
 =?utf-8?B?TjRUQ3lJVjBoVjducVB1aG5WUTFtOUpNaXYydklXK2FUcDlmTGg2WXR1QVVX?=
 =?utf-8?B?dDFyaFl5ak9yQkczeTU1QVdBa0tYVTlNanRRa3VZZ0lrS2hlbzA4QjFRMHUz?=
 =?utf-8?B?V2p2ZXRWWU4xTXJlTzQrR0lCR3F1endUL1RIOWFzM2JxZU1pWTVIN1d0eUh5?=
 =?utf-8?B?SWpqaXduS2cyNEZNZHZoNDlqRmswQ1JJNzRuUXFoNS9sak1aaFVSRkVtRGdJ?=
 =?utf-8?B?ZEFWQUNneUEzajVhU1pkdktIaEl4L0xGR3ZScnBkT1RyeTdaMnFreVBzKzRX?=
 =?utf-8?B?NVk5UDhyL0ZmTENPQ3pjUkFobEFxcC9yVUtSbmdsUWpJVTRRMmlxamI0NW43?=
 =?utf-8?B?NVZpTGppblZqU0U4eXlYaVZLL0IvSUFCdWRXc1dnSTZRL1BsVDVwUHF0QXp0?=
 =?utf-8?Q?KkKpbzPQ4JI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFArR1o3anZJMUt0OUp5cWZ4bjFuK003WEZ4eFhrNWFiT3djRk00cURMRGlW?=
 =?utf-8?B?QVpvUlFOTTk2VkpadHlkQzhGUlBFY1VJV21tVjZZb2JYN1NRcnRnVERpT0I5?=
 =?utf-8?B?Mm1IcGtadHdaMEtCRlc0UVlVcEpLUlJRMm5IaFpjODF6Q3dxeUUyaXlTOWls?=
 =?utf-8?B?anFheHM0akxZd2ZSOUZBcWQ4bzMzV2VPUkNWTWlNcWNLTDM4c2ZaQWVoRzZV?=
 =?utf-8?B?aFNrWGwwRUZWcnQwY1hUMEdoaXg4eERtcVhoTlhRTkN5bTR1d3RZWnA4dklW?=
 =?utf-8?B?VVF0elZ6U3Y4OGJzRTRvbDliNXFRTVVIdkpEMGN4WU5FVlRQU0hnRXBabENL?=
 =?utf-8?B?VXI5bDJVWkIwN3RlRVU0dWp4bkVtOWNwalQzYnlNK1JiWkdBLzBCYnJRZWla?=
 =?utf-8?B?Qm80Q3RFM3d2NE9DTndienlGditObllVWjhPV1V4aEd1K1ZlZEs4TlhHSU1w?=
 =?utf-8?B?d1pYMXkrblI3bkdkVDF5YlZpanBUSVd5Y1Y3dkRydUl6TkNrTVZTV2JWMlp4?=
 =?utf-8?B?UWoyL3p0b1FXNFpMMythZGFQRmg0d01zNGpuZGt3dlloZ3kvdm5ZTlNqOEVn?=
 =?utf-8?B?Y3RsRlI2ZXloMVhCSDAvbnd0TkFER3I3OThmMzJFTDBLWkxnTTNoNUZ1L3o1?=
 =?utf-8?B?ZkpuYnlsQmNweGIwYTVJa0cvaEVPbGtadzRtS3AyZ3VmRlN3bmNsR2xkcjg1?=
 =?utf-8?B?V0kzdHltSWYvaVV0RW5oQnJoYXY4SWl3R3ZMYlJrYWh5NGVDTk01RUNEczFT?=
 =?utf-8?B?TEQ0eS9GM0E0bGNaeGduTTgzUkEzQ3oweitORG9qTGdKa2dmSytqNkNoWGc4?=
 =?utf-8?B?T1RsLzFVelhneXZoai9qbkdONXZlQXQ4U2Q5OGZmdjZtS3FFU2huNVo3UjJq?=
 =?utf-8?B?dWs1QjE0ZVJUUHhmUUZZaWZJK1IySXFyTGJVR0VyMEVNcllTNENlZ0IyNElt?=
 =?utf-8?B?NFQ2S3FoWFFTcnpjWU81bVBxUmlXSjJJWU4vaURUNHltM2lLWWJRQXN3emNU?=
 =?utf-8?B?S3BLa2h3Q1NnQTdtMVZicE9DNHJGNTQ0OXJlaDdXTGlxOGI0eFJ4V3hOd3FC?=
 =?utf-8?B?K1FETzRRQ2VhcFVBKzc1eTJzR1pkeXRheC9hcE9zcHZPRkJGck1xQ2ZmM091?=
 =?utf-8?B?QjdqZThacWVwVkpIYWhDaUpSRXpkUEtmU0FodW8xTVNoNTVobzVHNGNjT25B?=
 =?utf-8?B?bXJIRkVid3NZLy9rMXpjeUR4RmMxdnF6V0V3NjRuRjN4M1lMbC82MUZySUY3?=
 =?utf-8?B?QUN3UE01aWlscjBHQ0lGalc1aGd3QjZGalljTnJBcis4WWhQdWZWQzQwcGg2?=
 =?utf-8?B?bzlSRG1PVWg1enFURkNLRFVLZ1NSd05WTkpWUzl1ZUtSNzUwWGhqVWVMVW8w?=
 =?utf-8?B?UFdGZkRzUEp3MFBYSjZ0Tm0rMld1U1BzTk9uWGNlMDcrMnBjNDB3RUlqU2Fm?=
 =?utf-8?B?b2hQeWdMK2VzZGsxQWdvcDgxWGovNGIvdStGRWRUZmVyemhGKzVmOFhZNmRi?=
 =?utf-8?B?QjdUejR3NC95MlAxeEJUREZuYTYranJsL011Tnp3QXMzK08xL2h5bUZqTDAx?=
 =?utf-8?B?WnlycGNlNkJCWWxBaG1aRS8vYkJnRmRyZzVpMG9nNUVZQVdFQnd3S0lQTEo3?=
 =?utf-8?B?VXdVcFo5K2NLeGJNalc5bVFtZ1pRUXRIL3dKRVdMUVd1Vjl1L1BGd3ZRVlM2?=
 =?utf-8?B?c1o5ZmpEa1NLeWxLWU5HQ1grN3JYcGo3K0JXcmNycXFMamJTZllIcEJoUVdm?=
 =?utf-8?B?SWpaaFR2RmtoRVJYTXYxNDB6VFZIMVlFamxkeG4xd2dwSS85WjF0bHRlcS9H?=
 =?utf-8?B?aWVlMzhzRy9ueVZUSFQveFN5UUE3Nk5pRm5mTXpTSFltbDZLNk5wN3YwRDVB?=
 =?utf-8?B?QlYxbkU0bnA2MVp6WFFTaFFvVkVLdSt5ZGlKSWpmS2pEY3RjNFNlR0ZReGhm?=
 =?utf-8?B?c0VBYmhWMmlPUEhnYWExcWtuME0rQzJ4S0trU2p3L0crbzB3YkV2NDRvSVlX?=
 =?utf-8?B?NjVwUEVPL0RIYkgvWUJkR0lvSVphQTJ6bmo2T2FXMm1CVUR3YmtXYnNLRzg5?=
 =?utf-8?B?bXRyZ1M0d2tFbzNGTytLWTBaNVRJSWM1dE5zaWVFY3BqOW8wby9mbjgyNytV?=
 =?utf-8?Q?XWBP8BIFCtS5Abk3p/+ZU9OhH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1710466e-d755-42be-a328-08ddf65e02a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 02:49:39.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Qihr83K18gZn+lfD76t2ru3Iyfns19SZCp07SiBuDTOBHalfsz0KSe64VJZVEnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190
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

On 16 Sep 2025, at 8:21, Balbir Singh wrote:

> Add routines to support allocation of large order zone device folios
> and helper functions for zone device folios, to check if a folio is
> device private and helpers for setting zone device data.
>
> When large folios are used, the existing page_free() callback in
> pgmap is called when the folio is freed, this is true for both
> PAGE_SIZE and higher order pages.
>
> Zone device private large folios do not support deferred split and
> scan like normal THP folios.
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/linux/memremap.h | 10 +++++++++-
>  mm/memremap.c            | 34 +++++++++++++++++++++-------------
>  mm/rmap.c                |  6 +++++-
>  3 files changed, 35 insertions(+), 15 deletions(-)
>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index e5951ba12a28..9c20327c2be5 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *p=
age)
>  }
>
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page);
> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)=
;
> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pf=
n);
>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>
>  unsigned long memremap_compat_align(void);
> +
> +static inline void zone_device_page_init(struct page *page)
> +{
> +	struct folio *folio =3D page_folio(page);
> +
> +	zone_device_folio_init(folio, 0);

I assume it is for legacy code, where only non-compound page exists?

It seems that you assume @page is always order-0, but there is no check
for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) !=3D 0, folio)
above it would be useful to detect misuse.

> +}
> +
>  #else
>  static inline void *devm_memremap_pages(struct device *dev,
>  		struct dev_pagemap *pgmap)
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 46cb1b0b6f72..a8481ebf94cc 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  void free_zone_device_folio(struct folio *folio)
>  {
>  	struct dev_pagemap *pgmap =3D folio->pgmap;
> +	unsigned long nr =3D folio_nr_pages(folio);
> +	int i;
>
>  	if (WARN_ON_ONCE(!pgmap))
>  		return;
>
>  	mem_cgroup_uncharge(folio);
>
> -	/*
> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> -	 * and we could PTE-map them similar to THP, we'd have to clear
> -	 * PG_anon_exclusive on all tail pages.
> -	 */
>  	if (folio_test_anon(folio)) {
> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> +		for (i =3D 0; i < nr; i++)
> +			__ClearPageAnonExclusive(folio_page(folio, i));
> +	} else {
> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>  	}
>
>  	/*
> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>  			break;
> -		pgmap->ops->page_free(folio_page(folio, 0));
> -		put_dev_pagemap(pgmap);
> +		pgmap->ops->page_free(&folio->page);
> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>  		break;
>
>  	case MEMORY_DEVICE_GENERIC:
> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>
> -void zone_device_page_init(struct page *page)
> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>  {
> +	struct page *page =3D folio_page(folio, 0);

It is strange to see a folio is converted back to page in
a function called zone_device_folio_init().

> +
> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
>  	 */
> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> -	set_page_count(page, 1);
> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order=
));
> +	folio_set_count(folio, 1);
>  	lock_page(page);
> +
> +	if (order > 1) {
> +		prep_compound_page(page, order);
> +		folio_set_large_rmappable(folio);
> +	}

OK, so basically, @folio is not a compound page yet when zone_device_folio_=
init()
is called.

I feel that your zone_device_page_init() and zone_device_folio_init()
implementations are inverse. They should follow the same pattern
as __alloc_pages_noprof() and __folio_alloc_noprof(), where
zone_device_page_init() does the actual initialization and
zone_device_folio_init() just convert a page to folio.

Something like:

void zone_device_page_init(struct page *page, unsigned int order)
{
	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);

	/*
	 * Drivers shouldn't be allocating pages after calling
	 * memunmap_pages().
	 */

    WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order=
));
=09
	/*
	 * anonymous folio does not support order-1, high order file-backed folio
	 * is not supported at all.
	 */
	VM_WARN_ON_ONCE(order =3D=3D 1);

	if (order > 1)
		prep_compound_page(page, order);

	/* page has to be compound head here */
	set_page_count(page, 1);
	lock_page(page);
}

void zone_device_folio_init(struct folio *folio, unsigned int order)
{
	struct page *page =3D folio_page(folio, 0);

	zone_device_page_init(page, order);
	page_rmappable_folio(page);
}

Or

struct folio *zone_device_folio_init(struct page *page, unsigned int order)
{
	zone_device_page_init(page, order);
	return page_rmappable_folio(page);
}


Then, it comes to free_zone_device_folio() above,
I feel that pgmap->ops->page_free() should take an additional order
parameter to free a compound page like free_frozen_pages().


This is my impression after reading the patch and zone device page code.

Alistair and David can correct me if this is wrong, since I am new to
zone device page code.
=09
>  }
> -EXPORT_SYMBOL_GPL(zone_device_page_init);
> +EXPORT_SYMBOL_GPL(zone_device_folio_init);
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 34333ae3bd80..9a2aabfaea6f 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1769,9 +1769,13 @@ static __always_inline void __folio_remove_rmap(st=
ruct folio *folio,
>  	 * the folio is unmapped and at least one page is still mapped.
>  	 *
>  	 * Check partially_mapped first to ensure it is a large folio.
> +	 *
> +	 * Device private folios do not support deferred splitting and
> +	 * shrinker based scanning of the folios to free.
>  	 */
>  	if (partially_mapped && folio_test_anon(folio) &&
> -	    !folio_test_partially_mapped(folio))
> +	    !folio_test_partially_mapped(folio) &&
> +	    !folio_is_device_private(folio))
>  		deferred_split_folio(folio, true);
>
>  	__folio_mod_stat(folio, -nr, -nr_pmdmapped);
> --=20
> 2.50.1


--
Best Regards,
Yan, Zi
