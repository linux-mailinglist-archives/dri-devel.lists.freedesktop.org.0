Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166FBAF53B
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B71A10E67C;
	Wed,  1 Oct 2025 06:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JRieOw9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011046.outbound.protection.outlook.com
 [40.93.194.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8B10E67C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbd7nS1/OZSzwjiLWb6r75a3oD+e3vyDRaH9ndBbV/dBEp4mw7Wy/6hY9vbQz2VRgZNArwlSx13uN10wOWcbbWRMRcgS0KgCTvWGZFClQ+0fttTYs3P2z1lULR3AVsIZekUIW4YWr46IgwoXjOTC3L5qCrk5x7yoNAyxeVVZKaupTCKZwUFGGO1zN1cSLa65qaqL5Uw18aXKcOQE/t1WIkoS33Pkuo0hSuDOVbO+5JJR75Ikv4rjG0SCHWsyouShK+kwz5TGf+BoTYSimgsQLwMZHgoP35s+bWUVI6KnWkBZVEoGxMTxbXj9tAhKgede5foO7rdR+AWZmjJldRkizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyfFGjia/uCud+lxVakYLHhIMLokQgesD4bJ4nnagNQ=;
 b=QsyoiAyQ4cZoA9GtMos0C0a/KazSHZLpJ6XD4RstAOrWmiMFfXyoend3FRnvM7soj1WvlZGpEagYjuuUkhQuAHhTEIdkj6cg9vyOkNIXJoc5oACDiMl8DkKeKMXHyEjocJPHzg/0Fj7d9x6xxwVjYtHi+xFUvUvzPlZd74QP5T+vxJ+cYTLAxxkLdpoT/Y98ZJMFOtfJFT25LOZqshPNMRvd0qxQkCSLre8Mho1bAGg4n3Pl6dskz6hoW1kbJvJMdYt6zkcRnjahhB0iV5e7bU4DqM9WHZB01xLCzvVPwh9a7XitHckwAdt65pB+9oRZStDq4+ZTyoO+UQrqyims7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyfFGjia/uCud+lxVakYLHhIMLokQgesD4bJ4nnagNQ=;
 b=JRieOw9teW2vKNt15Lkp5l26K62/9S1RmBHh152AuuMJRjM+e+sJpYr3eWxc/5ge8Pu1Ny+AXxvpSXo/ZZ1zw90IIEAoSxnEpVoMlzcp18RDbP2f8ZAmx/gX2xrazQd4ryby8IrjQSDosWQWzu1AyxhuDRrIqrRJVp2D8AO6DkW7GjmPR2Xi3lQKHq+SCv+ocbpwQQTr1ZatNy/zeVWxQf4lXhRgSOKYvsucSK5sEZvqlV+0d9BUqWmeQy+hoCGHa5zzsSvzM0St4/tYXeE72CWTAh+Yw9qfYFIn6/uPiBE5FIBIyc0RthuVjPLagqTud/2QwWn4xTN1t9+9crZF5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:49 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:49 +0000
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
Subject: [v7 12/16] lib/test_hmm: add large page allocation failure testing
Date: Wed,  1 Oct 2025 16:57:03 +1000
Message-ID: <20251001065707.920170-13-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0021.ausprd01.prod.outlook.com
 (2603:10c6:10:1f9::11) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e18367a-910f-4bc6-8c1a-08de00b7f93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzY4K2RvQnJFQ3ZtbkFKa1F3TVNINTFpdUp1dkh0SytQVHUwTGlxR3ptbVFu?=
 =?utf-8?B?ZkV4ZDJQN3BzV1lzbkZXaGlsK2gvNnJGWjVvT1Joa1VDV00zcUU0ZU5WckJX?=
 =?utf-8?B?aDZBdlo0aC9Rcm40MkliVy9GcjlTNjhBQU1ZaVVRS0NFazJ1YVhXNEdic0pt?=
 =?utf-8?B?YWs5STJCRituYzROd1lJZ2tMMDFXNWYyZElwRUpjUDZXMWszWHJIZythU055?=
 =?utf-8?B?RjI4dklHYzU5MWRqRktHRWUxRysrdXFWRURaY3BJYlBPaG9VU0VKMDFGcGx3?=
 =?utf-8?B?Z1RMMEF5Q09kSE5lb3VCNTZVOFhweWI3bEpWWmNwTThqdmluajlFSm45d1ls?=
 =?utf-8?B?ZGpkZVZiU1BzQWpkWWZjaTM0VmxhSURwQm9Tdm9GSm1ha1BqK0lKTjRqazQr?=
 =?utf-8?B?SFpUeTNSSVJJc1c5cTIvZDgvZlovTit5cFk5ZUFmMmNaUmJ4SjFUc2dYN20v?=
 =?utf-8?B?WE1USE9SN0JZQ3JCVXpaMjNEUEpFWkJUT1VmUlBhU1pZRldkNDZGenVmbXZO?=
 =?utf-8?B?djV3QWxWQUpGTytDZ1FWRGdmcFljMG5TdkpWUmV2bk44YWlFQnNJYmR5QjA4?=
 =?utf-8?B?bWR3ZDZPZk1OMEcyRWJNZVNkNEVQMWRJTFRkTUg5UnFUT0VpOGxPT01wK2w5?=
 =?utf-8?B?MWtxM0tiTGg3MDhKNmRZeWwrNkg5UWhlTkpTam5WaUwvSzVpWExxWFJINDlo?=
 =?utf-8?B?OHVNTDhCVFd1V3B2SlkrTmdxZnVDc1A5NFk5c0lKaTBYVjA3eG5tLytRNWNZ?=
 =?utf-8?B?VjZYaW55ZGRlb3VmbUFZdGhrRFljVDhlWEFZVUJwdzNmSXppZXpoNVdrVVYv?=
 =?utf-8?B?UFlpbjczczVkaDZaWERqaWRnbXpYSmNJTTFZNk9Yd2NNMjNVVnA2R1F5eHpI?=
 =?utf-8?B?ODhtbmF5V1I5Y05kOVB1REdBbDFpZGl3cGFnVGI4cTQ3V2YvQVVuU0NoTzgz?=
 =?utf-8?B?eG1KUW4rVXJKVVpVVnIwdCtHSGJMY3lDK290Z0lobHovNXVNZHZGOUZiNkNr?=
 =?utf-8?B?bmhicytGbU5NblRUcm9ITTJqZWsxZnAxQjZweU5aM01FZEFnaUJJZXpTZ2Ns?=
 =?utf-8?B?ZEpmNzRaNHdlZmdSWTV4ZXMvT1NxVWNLK2RINzh0a05JYVBIbWpxT3RUTGJV?=
 =?utf-8?B?V2lvdUJFSGpmOE43K0h6NisvSnB6RlFISHZpZHlja3B3bGJrejdiN3pzQlZ6?=
 =?utf-8?B?NG5QSFBOcnF2dFMyb1pVcWpXYXR3RUpYZGZqSXFJZ09mTG9DYzJGVzM1UFA1?=
 =?utf-8?B?Vk5rSDlXVlgxZFZZTnFER1hqQjd0eUpjNTVCYXAzcFRYRHV1aFNISzA0MHlh?=
 =?utf-8?B?VXJIYWhaRTBWcWtUak81TDR0eThHUkxiRHRyOGtGcUJVUE5wV1gyUUo5dkMv?=
 =?utf-8?B?b0hML293M1pheXJ6bGpSdDZqdy9UUGd3M21WOUg2d2pJb2Q1UXgxcy9kUllP?=
 =?utf-8?B?VE5ocGlRSmYzMEZqRE8wUFJ4ZEdWSHlPTnM2RnZXcnNXSDV2N2NHdWNaN0ZT?=
 =?utf-8?B?TVRzb3R1Z2F5YURXSDFucjEwOUdpcGFVUG43VkxLTGtFTEVzR2JQWWtWTFI1?=
 =?utf-8?B?NURaNTJ4c1p6dTFmMkRNNG1Ya3hYN1haR0tNa3hTdGhOSENhMWsybW9KV21l?=
 =?utf-8?B?OTJDNG1xV3AzK29pWGNvMDVFRVJPU3pYVVhpNE5ZenNSSDdyYU5MRzJUbFNm?=
 =?utf-8?B?ekxGOEpZRE92NncwV1dTbXRha29PSXNMOVM5dytyUzVTWEpvcVp6M1d4VjRU?=
 =?utf-8?B?VGpZUkJ3NUo1dTg0aWhDSndtM1VhZ096Q0Z4Ymowd2FBSkg5YzhrN2NqRSti?=
 =?utf-8?B?cUJMbVZSVFk1cFhmUzZzV3RVS0RvL0VOU1ZZaDBqeFhicnJkdVhGdExMNEtT?=
 =?utf-8?B?VVB3aUxKYVNrbWNOU1lZbDhHNjBGbWZyMGt1UmdkUUNVaUltM0JZaUpUV3Nx?=
 =?utf-8?Q?G3U7YEh8pTEJO2lNOzTsGmu4Gmpjshlf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VldXNIclhISzR0dUdvYlRNSHJDNVMzZy9UQVZjNk9PM1doRXRHUnh4cWI4?=
 =?utf-8?B?MlBTSnljUFY3T3hqTC9QZktnbm5najloZkIvR1VFUXBTcXdTRXFSVXJoSXNa?=
 =?utf-8?B?cGRwQlZ0b0Vyd2k0dTFnSklTcGJuODQxRUlSSy9tUGdUMCtxV0ZvN1ZETnBv?=
 =?utf-8?B?cHVkdXE0MDZieHhYdGF3ZnVFNWtlN002clJsOHV6SC9BZ3JjRUV3UzBXeVJi?=
 =?utf-8?B?MzhDSmdGZUtuRHd4YmhybS9vVEZhcGNzdHQxenZUalBQNEVaOTdsSGpYem1S?=
 =?utf-8?B?azNBRFFCWTRsL0F5TnhzVit2MGpNcG45cVRzTHpjV2twdjBVSzJ3Zzl5QUxK?=
 =?utf-8?B?dUk1ZTBuNU9nVE1jcDhwcmEyK21wZnRwOGFsdzF4bkUzV2dDNTBKOVUrdjJw?=
 =?utf-8?B?a3BFQXlORkNwVFFwdHFvM2xtQUFsWDA3NzJhcGhLMzFIV3pJUTlaRzF6NWtT?=
 =?utf-8?B?UkQwT1J3RnZPYmVxUlBDTlczRCt4OHlMYnZacmRKMVlvUkpUbFRyRWdqWDkv?=
 =?utf-8?B?YkVEVDVJeXIxckl5bHRsZWZvTUwxbDJFVXpSdTlZbUloR2lIR2tEVXo2SU9G?=
 =?utf-8?B?QWdKWndDdzN6WkRqRjBDelhrTHBFMGx1ZDBMSmlOZ01UTTNmeG1jeXVGZEQx?=
 =?utf-8?B?c0tBeFl3cEUySXFOZjhYVWw5dVliaHN0L2xRZjhoTm9iWEMrWFlnYkdvRzRl?=
 =?utf-8?B?cG1aNUU4RWsxMzE5SWRhMkF3WXg5TWN0SWhhbzErNmZKMVB4cDdrbUlielpM?=
 =?utf-8?B?blBQME1hci8wSFBVanBNV3RiRU1HcjBIbUhJS3BYWUFNbGUzSWk3dGtNaElG?=
 =?utf-8?B?U0RzbkFLa3h4WkhsbmY3TkZsYjNaNXdYOHUvMTBTcXlOWDJyaUtSeUViQzY2?=
 =?utf-8?B?K2MzWlVhS1B1RWNhcVAxSnRMa1RRa1ozZHptTmkzV0ZPMzJYVktuUVcrUGdN?=
 =?utf-8?B?a00yeUthZDlhVUJCS1VoK2Z5b1IzeWowbDFMb091ZXFYUk5TMW04K2ZJZFNy?=
 =?utf-8?B?anFySStnMzQ4NmQyVGpDRjMvaVZ3Q2VYZnJKWkFpR0c3WnhYK1RIdWVBd2J1?=
 =?utf-8?B?MWo4U1pkYkJCTEZ1YXlrZ2JxQUNscmxOa1lJZU80Q2tid09MOWNlWGo0bEpm?=
 =?utf-8?B?UlhnbzRuQm9IZk1uci9uWnprMGJ5N1BsUjNFaXBGNFl6WXlrQTBvZUVRM0VW?=
 =?utf-8?B?QUNFUmJVbzRYZ1lmODlsME5xRkNZQTBtUGRNa2NyQWxIN1BVRURJUmIwR3hU?=
 =?utf-8?B?Zms1TnVjekpjMkt4TGNBeENXOE5ZZk4zTE11UU84eEVIVWNyeFA3QXVyOTVw?=
 =?utf-8?B?UExDa2hXWWhMTlJXZlBkeVdrVDd0RXFLL2pnL3phK2k4eWd5czZJTXAxRURT?=
 =?utf-8?B?RkExb3hkNUdHMU9seDZrVmU2OS9oT2VkcDFlL0lYVko5c3NnZkR4TnVibVRz?=
 =?utf-8?B?ekJoajN4cEZSdzA0NStZRlM5eEFFdEFKMHhTUmIzZmVMQmdSTDJKVk1ISGJk?=
 =?utf-8?B?S2NPT0N1SnJidnJFQTVZSEZwbXROcWFzNnBPM1VJc09zNUdHdzdxR1BNOUt0?=
 =?utf-8?B?MHJDNmJYN2JtNmFUOVBEWUszVGRtZ3RYSGJRU0RqZTBlbW82eEkxZG1aU1NH?=
 =?utf-8?B?Z0NZR1VzWDZ2aTRIUWVsWmRvMjduSHNRZFlQK0ZDRnlFS2pBNTRjaUNiVVRY?=
 =?utf-8?B?M2xjbEk1aHRMM0hJUWxVdG1MbjU5YWpwQXRpQ2tXYXNLOTBqczRRUTE2TmZR?=
 =?utf-8?B?WDJKK01CQWRjTVgyNERtTDBQL0VVU2o1M09sWEg5TjRrR2lDUHNtWkFHRmsr?=
 =?utf-8?B?Y3Bxanc1V1YwMzdja2dURTBlUXRTYUhQZkRWdHE4TjZ6MitUR2lYdnk2WXZM?=
 =?utf-8?B?VkNQd3NiT0h0aVdNbGNzd29iY3BRdlhRL3VBV244YWFCKzRkUW1iYXo1eVc4?=
 =?utf-8?B?QjdtRlZ0bTdMcVg3TWtSYURhVjdiaFp5bndTRXJCcGdIVnRqVXk4aEFEdFBl?=
 =?utf-8?B?azVadnJSNy80SjkrYVBlNEQ1Q0hHWnRUTkFUa3llWkc2UHhPdDJ1bFIvb1Bl?=
 =?utf-8?B?NEFyVzNkanE3RnZ1WU0wY3RnMERvclVra0VFS2pyVjhiY1A1K1Z6enNQdlBq?=
 =?utf-8?B?blJabDNuVmJBWjZmanBDOXpSbHJQZ1EvRkNuRDhwbkJJVUlpV0w5b3pTTHVn?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e18367a-910f-4bc6-8c1a-08de00b7f93d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:49.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEz75zQmlgDIVrbys26MOTe4UWIBTNHaUnhrmv9ByjHcIDUWbW0RiCVqekXl4oD41CXq2PCpn+0/EiEBROOdRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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

Add HMM_DMIRROR_FLAG_FAIL_ALLOC flag to simulate large page allocation
failures, enabling testing of split migration code paths.

This test flag allows validation of the fallback behavior when destination
device cannot allocate compound pages.  This is useful for testing the
split migration functionality.

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
 lib/test_hmm.c      | 61 ++++++++++++++++++++++++++++++---------------
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index df429670633e..72a8b2f38d8a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -959,44 +965,55 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
-
 		if (order)
+			*dst = MIGRATE_PFN_COMPOUND;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			*dst &= ~MIGRATE_PFN_COMPOUND;
+			dpage = NULL;
+		} else if (order) {
 			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
 						order, args->vma, addr), 0);
-		else
-			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-
-		/* Try with smaller pages if large allocation fails */
-		if (!dpage && order) {
+		} else {
 			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-			if (!dpage)
-				return VM_FAULT_OOM;
-			order = 0;
 		}
 
+		if (!dpage && !order)
+			return VM_FAULT_OOM;
+
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 				page_to_pfn(spage), page_to_pfn(dpage));
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-		if (order)
-			*dst |= MIGRATE_PFN_COMPOUND;
+
+		if (dpage) {
+			lock_page(dpage);
+			*dst |= migrate_pfn(page_to_pfn(dpage));
+		}
 
 		for (i = 0; i < (1 << order); i++) {
 			struct page *src_page;
 			struct page *dst_page;
 
+			/* Try with smaller pages if large allocation fails */
+			if (!dpage && order) {
+				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+				lock_page(dpage);
+				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst_page = pfn_to_page(page_to_pfn(dpage));
+				dpage = NULL; /* For the next iteration */
+			} else {
+				dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+			}
+
 			src_page = pfn_to_page(page_to_pfn(spage) + i);
-			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
 
 			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			addr += PAGE_SIZE;
 			copy_highpage(dst_page, src_page);
 		}
 next:
-		addr += PAGE_SIZE << order;
 		src += 1 << order;
 		dst += 1 << order;
 	}
@@ -1514,6 +1531,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.51.0

