Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C309B21ADB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2B610E57D;
	Tue, 12 Aug 2025 02:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MBboPy2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860D10E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=popfRSY8UPAnGNzge05uRoFVIGsnWl/IFQ4CZhobK+zmseEg9dgwY1c9sGnxKwATEqgu6gTKXFWgHx/nC8BGAD+GihlIPrepGIqtlfLGyd8wHd8jm4XWESqe9AXKy/xucakLOYw1kfNRbV7vwrCPiNaDgYBnjXgFD3dVFVIrmOLGo0Az+/ztfLZD6sqd6NG6+um3i2faST/lp1+XClMP+2xqHWW3jc+BLe97/88BUlcr6Ln332EA+p7D0T3e1hZtbZoBI8IIAnXp3ZHY6JUf/A9ZJVcbsg1Ik8WPryJ+sq9OL8qd7xQua6xTtYZqFeufeRHOkvy+9eESe6S4RvuuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV6wQe/UiG2uRT1eVCn/mImD80c08zH/uViys4jM0M0=;
 b=DAszgh5Bf6BMQIRznJFb5Yg9eUwcP8KdzBhuN37rI3jbC0H8EbLOW8/MzoKsX5WG7lW12S2yEukPVqEa9sfNhc6L1R5IXHlKbOFIADT6vzE24e2tuNe4laoKW/s3xvKWakrLzehh5nTBjYZGJEc9GZpye0dfg/f++ny1ccIdlHQEF+dospb5RzgD11XihnxazTAUNM5QuSpRtOGoiuf37JjugmdNuGloYEKR3ffutMop2syUqn5vTdobDMNxTPrkvbluiBSlHubZV1+rPYr/XftKK91WLsyuAJA0VZ/ljFdn6b3zmO1p8svYnJK70fglQzFgSnomDfk1yRAMzIvjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV6wQe/UiG2uRT1eVCn/mImD80c08zH/uViys4jM0M0=;
 b=MBboPy2La6pCPG2bhwospGQFdBCVEGLRocBPFh4KFoSgLMkKJhhT4YFgMiQZXoKFHbH82ticfqyyA7nRaohM++HLMr1qv78Lm/AFpju8PYgjcD5fcQCwhav4lu4REz0B84g4Uwos6VWnfqyoP1r6YxOua7LiMg143+7oVa41SHdM7Nm7zYzfHOPCYXpI/c+lG4j5Mvh7/UFyfhQIGDr7FClVMH75Rp7mSwlUIYCtPtoFvFjCf4Vm3h01xvFd3z+b4wLwlb7yrKWa0PLfosT9C7ROSLXOmj7EGiVMqhUqHMjz2kjR0yYpXZMeVZyDqvwftpIEF7JTltu5vU+65+8Dtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 12 Aug
 2025 02:41:10 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:41:10 +0000
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
Subject: [v3 08/11] lib/test_hmm: add test case for split pages
Date: Tue, 12 Aug 2025 12:40:33 +1000
Message-ID: <20250812024036.690064-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ec7676-f587-4a43-067f-08ddd949b1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEJzV0xiZWdQM01nWDhQOUtRSFE0aEgrKzdKL2Q2ZVNJTVV3cWR6TTdsOXJG?=
 =?utf-8?B?UXZjN3NvQVdIRmJON0RUL2o0SnZCMUVJT2xTN0NBWEhWTG16TFp1ckJtWjUw?=
 =?utf-8?B?TzUzQnkxdjBudVRqeHNtVFg1RVBuQ1FlV2t0R3pKakZucEtMTXA1YTJva05h?=
 =?utf-8?B?YTM5VVJFYmZDUFBPSE8yUkN5UmI0OXFpck1MMzR4YWp6eHVBOGFmR0FlSUhI?=
 =?utf-8?B?bXBOWU9TdmhWdHNZaVdNWmdxNXdVTythMFZla2IrV1RELzMwMTM3eXlnTHEx?=
 =?utf-8?B?Nzl0WGE4a3cvUVBSMUw0Uyt4Z0t6TnVCUzhIUUE3YnM3NGxkU0NiR2tuSlNm?=
 =?utf-8?B?TG9MS1lra001SHhPNEpuS3Rid0tNRWgyZFg3V0orMTlGTTAzRzJSK0hFb1dP?=
 =?utf-8?B?Qk5jY1pKZTIzSDBNbVVac2xybHIxeWNsbWtacjlXbkRNWXg5WXA5V3ZwaTl1?=
 =?utf-8?B?VENSeE5yMjdtM01hdGZ4STVzK1Q5QWpsVzIxMTdrU1lqeGdHdFd5cHpQcWFl?=
 =?utf-8?B?K1diOXM0cnE1WklCdStGMmtpM0NZaGlTZWNuRDV0RjZ4MzdhRUNHdHk1Zk5r?=
 =?utf-8?B?dkpCeHpjWFQxVnZRbnJtSnovOFkwazdpUUcxeCtWa1djb3l4ZUNkU0xQY3Vr?=
 =?utf-8?B?T0hXenBDdzBBVkJUck9qcFl6YkJ6WnZ2Tjlpam04TUlVOTVlZGgva01pWXJz?=
 =?utf-8?B?UkZVajNZYVZGNWlHNExWdlUxVFk1RTdBaDlpSXlJVXFKUWdvc3JWTEN1bGxB?=
 =?utf-8?B?OGFuUHNrNEVoVk9XeFkvT1RNMHdUMmE4RjJVTWtKWm9XZGhRbkl3OE52N0x5?=
 =?utf-8?B?bUlMeVgxckVJNCttVnZMK2I1WkRXRkFxaC9VVldUTzhIYVlKeEd1VU1qVXoz?=
 =?utf-8?B?Zk1KK3E1QWorYW5SOHc1YU93dm5TV3N2L3U4TjdaZGF3bVdoZWcveEU3cm1T?=
 =?utf-8?B?YXRUZkxhYWdpUXdrMW5LT3BpNXBGa3phanVwajJUVGhiek9vcVI1S29NbmVX?=
 =?utf-8?B?RGs2UTIzaU8rQnkxYmhQVG02dDRSQjlaTnBiK1NzKy85MjBlR3A5UEZxc25l?=
 =?utf-8?B?Slk3K2RtMk1zTlZsTTExS296ZTZVcG1YbnhNZGdKclNhK3U2WjFGNXM0Tngw?=
 =?utf-8?B?bHEyYTV3akEyeGhiZXdSWXN3c1B5RUV1R1BHRzAxbFlGejBZbThuQjAvWUt0?=
 =?utf-8?B?V2ZtOG1PVTZsMTJJU1hrVVl5dEJBRUx4UUZZUmc4VDdZSXpCQ09HZkxGc0ZD?=
 =?utf-8?B?Zk1rcTkrWC9mZUZ6WGRRNldEdnJ0bGVIZHFWN0lDZXBsamFBUHFFVm53czVD?=
 =?utf-8?B?dVZRd3lnL3lKYzcxMmREd1orZmF4WFNZUFZnMjBwanczdzFsTXJoYkI4UEtq?=
 =?utf-8?B?NGg2eFdJS3B5TmRhekxhWU55TDJ6OWRQQUIvMkp5UVE5bHYzYWlnbnZNdGVv?=
 =?utf-8?B?VFZzcXdrY3BlL3U0Vng4c3FhMThmRzkveitKRXdZa1NjZjgwdDg2aDU1ZVV5?=
 =?utf-8?B?KzJHVTRTYi9hOTNoTXNLV3FYZzBpT1gyN3FjKytrWVArU2k2aFAvL3hmYktM?=
 =?utf-8?B?aXdUUWMwY3BWYWR6Rm82bVhKc0JoUml6WEVDeGpIQTNVNXhDZUcxVXhUZHB4?=
 =?utf-8?B?OHFGd2lCUGhrY1J4bzdIaExMU3BkWnkwZG1TUDlMbUE0bXIrMUd1Sk5EVHZ1?=
 =?utf-8?B?eFBrdlNPK3JuMG8xK0RhaGJjbnYwNTk5TTRNcmowSDlwM0VLcGRGRFR4NUha?=
 =?utf-8?B?TTdONFQzWUExNkNQUEphSjdSbXlMZDIzclU5dklxbFhCNWNNYjNrazgxTk44?=
 =?utf-8?B?VVYrSkdicS94S1BHSUFBemp5V0tyZmpBanpLSXQxSDNIT3FTSzB4STdWYitI?=
 =?utf-8?B?ejBsWTliRmF2NzByT2tKYTAyVWtNTjVOc29reERjbURISnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkpwOEJGRS9vQzhrNHBhb2JiNTN1N0hIUDJqLytGZyt5eUxHREk0TXYveUhJ?=
 =?utf-8?B?cGs4V256MlNHcnZMa0ROTXMzaWQwRW94djc0WStLcFBIcXMwUVBSSEN6WExj?=
 =?utf-8?B?Kys5NmFOSkd0cjRKVHhJbVpDeDNhQmhmS3E1TTVoTXlRUWV2VXBQeTVQQTdX?=
 =?utf-8?B?SVdxbWVxZHpKd0NhWWVOWXEveGdDVERCaGRFSnhSWXFtQXVUUFRlU0x3NHFs?=
 =?utf-8?B?TzN4ZS9LZXVsTW5kZzRkcElPc21TQUlLcy9Od2RybnBlY2VXN0l5VWlwMjJv?=
 =?utf-8?B?Y0xrejlUSmU5c0FPK0VBSWFSZCtBWDZXSENMQ3BsVW9yVytIUTR5MDZkQkZa?=
 =?utf-8?B?RDFpWk9aYzhpTkdCaWdtelN1YWNJK09ZeEZsZUNtMDQ3akdvYVgvRWthc2R4?=
 =?utf-8?B?TGQwSUVrc1hzK0JxRnJVVWtPZUtheVRxaloyQU40L1RXYkd2QjNWazFXUlVj?=
 =?utf-8?B?M2RESGZZbURiNmpkcmhKWENkWlB4bG9vVUliVWIvT01qZnN0aHVYMkdFM0xM?=
 =?utf-8?B?QVdmU245a3lHSkxycllpZmpTRnljRGNlOUE2TlRRZTBlZXlnZVJKQjgvdkdV?=
 =?utf-8?B?bCttVHdFV1ZZYWE3QTMwWTBZL2FjSm15MENweU4zcXhEUE4ra25LL2ltalEy?=
 =?utf-8?B?bE9YYU5WT1JmdUZSRnQ4NTBvMnlCY3lVSnN2T1NHYWdyOVNDL2JQSEh0ZU4w?=
 =?utf-8?B?cDdQbVBNZ2pzQzQvdFh1dGZJemJYbU5TUDBDS0xPQmpuYlRqZVJUMENYRzFQ?=
 =?utf-8?B?UjArbFdGZlpDNEJwMU1reFc3TGlKdndzUnhqckp5dFh2OVZqQ2lPSDRwQXBN?=
 =?utf-8?B?a1pJck1FYzgzbXNPbzlyZ3VPeGtlZHloNUszKy9zeGdNMkpxYU1lbXhqSnR0?=
 =?utf-8?B?dm1Pb1N3UDdNK0FDVmc2M0JMaFhKdndlSVJ3WU9OdW42NU8yQW9xcGttcTlG?=
 =?utf-8?B?QVMwU3VIWXVwUkVaTXJCa2psS2VKTTFtWjNPeUlZY3F1ek9kcDZvRnVLMVBj?=
 =?utf-8?B?NWNjTGxQM3VQR0FOZEtUcUhwSlJ3enJpN2ZLYTFFUFBZWllxOFJlNVJRaHp4?=
 =?utf-8?B?K2JrYVVjNWFKcTJoaTQrblNvbE5UaG53V1lnYzAxd29VQ3NCZlV3RkdrOU5Y?=
 =?utf-8?B?dEZnNFpWZWRWSXNMQUE5b1NJVit4WWs4YldqQ2haOWdDdjIvV01oKzBkWUJt?=
 =?utf-8?B?Y1ZJNUFkZG1ERXhLOXFiYUVObWE3Y3R4b21WbEpaUm1LTUREY2gxcEtoL3RR?=
 =?utf-8?B?RHBGMDJlZ0l2RDU4dlZsTncwN29HbThWTTNpak5ocWd6Z3dQK1d1ZVZsV3Zx?=
 =?utf-8?B?UFVaMzFJaUUra0dXQ2pUR2thRHpzU21VR0RySTBGbUZmQkZTeVUweDNZZWNs?=
 =?utf-8?B?d1lyamZySndVTldXZE5BeUxXM0hiOUJvR3prZTJoaEMxcGI4d3lGeEh3TDR0?=
 =?utf-8?B?VCtlYlQ5eFhjOUI2SCtTUzVZMk95S0N0d25UOENWWUk3N2hjYlNzaFB1VGFO?=
 =?utf-8?B?YnJFT1RVZmoydzVHVmpkNXBPRVpoMEtoS2Q4VjdJT2x4cFdmcXE4R2hUbG1M?=
 =?utf-8?B?Vld0UllLYjZ5KzAvREh6WHhSeC9zY25SOUQwZzBveGlpQmZKOHBvN2R2Vi8v?=
 =?utf-8?B?ei9pR3RvR2poZjdCcG5VMFFKSU9MR0NqN0U1bzVPY0ZaeENOSXYySUdyMlZh?=
 =?utf-8?B?K0E2OUJRVDZ5aG5CN1BWNXdCaVFvMEh4THpRaWhvNjd3eHFoODlRUWJ5dnIv?=
 =?utf-8?B?OEprVndOTjlnY1NheTQ5c1VLcjBVOWo5STJCNE9jcndPbjFHbjNZZTVPbEda?=
 =?utf-8?B?NE9ybU5vanJQTnJFT29VUFppOUVEbHhyYVpBVHIzNU5vVkU0RjFGTlZoRVhw?=
 =?utf-8?B?TzI0dzQzR2dEMkFxdFVuVXBHSCtyZkV6T09tYVlRUUY4MnpxSytUMVVFbnlj?=
 =?utf-8?B?am9sMmxSZ0Z5emxYc2hzQ1ZUS2FSZDgyY0ZaVHVmUXJkUjVZQnJ5NkVrYmFR?=
 =?utf-8?B?VXRUSEVMR1YxQ005dHhrMkVCMVV2ZjJMZEtUNmJqK1dpWmc0TkRoTlE4VUpt?=
 =?utf-8?B?bjlEZStQclRjOWxxQjFFbUhnRGRnUmZmZnMvMnA5b2sxUXg1SWViNEk2WmVo?=
 =?utf-8?Q?SFWItsywIB+ARcxLrctMeqTW4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ec7676-f587-4a43-067f-08ddd949b1ed
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:41:10.0473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDHcfCa7XDiNw1Lx3lY3vWkSs9qZjzom+dx4JPf1MbS6TX5cIcO4FjTjzHtPywxXW8HIs3IPxdFdaasx8+/Uqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
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

Add a new flag HMM_DMIRROR_FLAG_FAIL_ALLOC to emulate
failure of allocating a large page. This tests the code paths
involving split migration.

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
index dda87c34b440..5c5bfb48ec8a 100644
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
2.50.1

