Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D892EB93F54
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC83888D9;
	Tue, 23 Sep 2025 02:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DkOhhbYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE6410E530
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiuIyfO07N1277EoFFzXZfNe06QhGV0p3XBSJXKAVpolljzxqjr2+/+Oa1FgrbMVXNAZPOGJEwurceCCepD1acM/QMQVI4p89AuhKdOv0m33WeYRUYaMirW6mdjvsFFUllyJz5QIbqkr+GwW1lB1pr9PMJb+PzYh+gKIvNy/u2t2lSJB5WXK2ZMYMDvyqQ+deKrEGmHgi7snGPzksYTcYj0RTnLT/hAPqJBnhqcEonMl96dQQNSaT6RYeOeG7Tiw3FRHd+YeIqEHjgeMzox8ah3/SWI4CzA4ldJwG15lsx0xFzIDE79IJGY0yzrllD0FG1EQOpyHcuFAU+sv2WvK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t06OChLdy+qAotjzbKZDlKk3Szz4RueoZsScK4WG9NU=;
 b=xIuuodZvlJM7QGE4/A7LbhNT74Xws44+8VUWFGwhopGqFgRUABGlMitj4F3scq4tWBISPlElHWfml+i5opRMgt+xnr6hdQ+ZV9TS70pEKCkpm/XOdYgB51nEWw0pF+PcPu85juvNP6HdsQ35mYqJHv/fh9n6Y34BFOnvALcvmRf8sWzHx3OEA68DvjWwP4Y3znBgof3q/umAMFgC4888HZKT8xSTq4/VKR/Nqy/5TEVtnCgL0UKegZ65RHZn7iQO1sDgZ6+VsLzCrI/zKWIZdIlfi1BrAsQgx/l9it2cRDAMlpXlTx2iatMNj1WMtImNjgrgzFz0mUd2qakKlBgwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t06OChLdy+qAotjzbKZDlKk3Szz4RueoZsScK4WG9NU=;
 b=DkOhhbYVGKA/1wQkpyAgMuy/2UTQSDRAW2kqFhrpa1H6mJ0NhWMIyAg/Enz+SDLXPrEJLWeB92VwHY2AhcbSQa8rs8Ja3FTRnqtFfOoUxMuJXYqj/aqcuY4QxMjPwvtl1aPSTkNkfoLvra4+Fe6HynMPCBizp0TdNDzbC1Lm7VbxMe/AmY7Rr2NmnUt0GIGGwHrcYes9R4YSZrDz7e8hGV/OP8vSp3Jc6ojxjapn068aJssJdSHR0pg4iW3R3u9jTCAV+Ag7RxDe554Du2wVQThupkQkIBTWfeLkM8knPNVqGapyFq55XupnEV9FODlKesD0CN1pyb2c8j9ncCwmPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH8PR12MB6819.namprd12.prod.outlook.com (2603:10b6:510:1ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 02:09:19 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 02:09:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
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
Subject: Re: [v6 04/15] mm/huge_memory: implement device-private THP splitting
Date: Mon, 22 Sep 2025 22:09:17 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <F6F6DB2E-C08B-417A-A8CB-3E759FE2C3A7@nvidia.com>
In-Reply-To: <a77b03b8-508b-4bad-8913-fb825ecd8a0d@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-5-balbirs@nvidia.com>
 <7987AB89-4E80-4A0D-8736-E95F998698DA@nvidia.com>
 <a77b03b8-508b-4bad-8913-fb825ecd8a0d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::12) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH8PR12MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 135ab6a1-02ee-4801-8a24-08ddfa4634a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3dxTG43b3pjNWVkbXpTM0poQnFhUktaQ3JCTFFmZVJnZ1Vja3IzNitvQUhi?=
 =?utf-8?B?U0lyQk9aOHE5aHZ2R2NqTHlvOW9teGlBVmtuZzJIdnRZTWFxSE9HZzBVdkYw?=
 =?utf-8?B?bFdsSDhpUERONmpFc3NrekR3Y0Z4blJKMWlyYkVZQkd3MTEyTlBhTDdVVjdT?=
 =?utf-8?B?NTgrNy8yZ0tuLzRrWWZwV1AycmJlTHN3ZkZCTlU1bVpycld4SXZYMmI4OGVG?=
 =?utf-8?B?cDB6UC9tS2p6Y0tFb0JaY0lZZGZVYVNVNXUrVG8wYk80MTF0VDBHRTdNQTZj?=
 =?utf-8?B?S3Urb0d2QVViZXFGMWNXdW9uZVJON2FubVFGU0E3YlpiNDJCelBITHV6ekoz?=
 =?utf-8?B?NjBoTGFBTUZYK00wZms5bGxiV3dzMEFQanRGTTFFZGRtZG83V3hXbGUxMjBE?=
 =?utf-8?B?cEo3dmU3SzBPWWxXUGtHZWpSVjZtM1VRT1ppVXFCR21FekxkN0pHb2xBcjN5?=
 =?utf-8?B?TnYrRE9PWE10RkpuSjFzMzZUdWFiZ3YwaGpkaDBHY3dKQ1BlL2grcWlkTHIz?=
 =?utf-8?B?dkxGUEpnczhjNHJGeU1jaUVmMGpyOEdMU0dnT0k5T1o4aFMyRnRVaHFDMjNn?=
 =?utf-8?B?LzNROHNBSTQ0a0R2WnN5dXhMbVEvMjRNc3NtdTI2RFRxcTNiKzh1RkU3Tzhu?=
 =?utf-8?B?aHhkT1ZxeFI0ZzhSR1huaExaZGJsVmUzQ01vU3VzUWtNSUlsV25iMnhEMWVS?=
 =?utf-8?B?ZDUrcXRHTTlHbHhQZEN6aGZ5WWROSnlFYk9IRVNYa29ob2RvT1NxUDlHQTk2?=
 =?utf-8?B?OHdJem5lTm5jcUVSdzl2RjFaNGg0elVPSnZnY1FlL2VZZmZEM1hOdFNaOWpx?=
 =?utf-8?B?ZFVwUjlhTXpsVjUxMFp3MWlITTluU3ZhQ3hqOHhIMm9jVEpJRnFrVS9rYjBB?=
 =?utf-8?B?N09uRUZGRHZwRkJIeFN3T1R5VklXbzZYaXljOGU1TXdZMmkrQ0RyRGdmSnF0?=
 =?utf-8?B?M2hXVUlpaisyTVI2K09ObXg0TW82YXNrRzJ5amNCd1N1SXdTODdmN3NNY3JT?=
 =?utf-8?B?dmJRcnpFUzJTV2lCZ1R5RU1DNlA0TkFsZEY1aGRTNzZrWFUva0UwQTk0cXZG?=
 =?utf-8?B?QUhXSmw4WjZmSDdEckN0OGJldjRzRHByYnhBVXMzcUIyTUZ0OVJSaFVvQk4w?=
 =?utf-8?B?d2pmVy90OVIrdSs5U3FNd3ptbFZuaVRvM0pjRHgyOGJiVTVNcGQxaEVxZGZo?=
 =?utf-8?B?NHF0Q1hYVGlVNXdSZ3lQZGtTaDk2Y20rM3hSV005bEd1VHYveFBmR3Z4L2l1?=
 =?utf-8?B?WDNDdHhKMjdmQjZGdXZFUXp1NElNc2NsMGZxazZLOHp0L0Y2TTJJa3VLTi81?=
 =?utf-8?B?Qmp6L3dJem5vWi9kbEZWVmkxUTBCeWRQdnlMdG9vYTlnZ2ttbDZZVXBvcXJ0?=
 =?utf-8?B?aHkySlJMVnorQXB5YTMrNS9kYUdUTlk5QnpYc1IzdjhDUFg1VSsrYmN5YkRk?=
 =?utf-8?B?ZGwwUU1mZGZTUkdkS3A5aDVCNnh5TTFhMFJaV2h1anJNSWdESWp1RHdKVzYx?=
 =?utf-8?B?cGVzak5xNmNNTjl1OGFaSHIvaUZQWGUzR3pJNytNTm55bmYrZGMwdzQ3NldM?=
 =?utf-8?B?RjJwbHhpK25NclV3N2UwbVQrdmhqTlFOMndQWTA0Y05rQjg2R2RSTjVsYlhV?=
 =?utf-8?B?dVV3MS9PT1k2ZlhPSkUwQkhMaER2QThsck5OakRwSmZCOEhUQ1lQM3NNbW1W?=
 =?utf-8?B?WllhV1JmdmtZYkFRVjZSWWd2MDJwbFovUks2c3RLcG9sYUJrR1FJSWZtMlFY?=
 =?utf-8?B?d2pWazRBbVc4V3dkZDZCUlFwQTZVT0Y5blp3ZHBHYWJTclJxWUZzQXFSNGpu?=
 =?utf-8?B?OURsaTh0U0xUTTRCOFcwWGlpbS8xK21GMXR6S1RXeUtlbTdOK2twT2hpVWdo?=
 =?utf-8?B?dnpla3ZYWlVjTmpKVWduV0I5WmE3dXV3K3JUL2hsajNtRmNxdnk1MCtCUWRk?=
 =?utf-8?Q?jAswEc5Jk7c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL4PR12MB9478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZDZlkyaEhCZ3ZVUzVWU1lVU3ZwUkV0Q2piQXFsU2NDMnk5cjZSRnhPNW9x?=
 =?utf-8?B?dy90Y1FES1M1VGF0SVVDcFRPODBMTEhJVnZFU25FWCs5Wm5meWFUWElia0py?=
 =?utf-8?B?OWFhQzEzb0JsQVBSRXI5NjVTRTJJTW0wN3FZOEFFazFyWU0wYndOallwSWxp?=
 =?utf-8?B?SVljaU5TZWcwSVEvN0xoYVZ2aE9iWDBIbWF5NXhKa1Z3YXVobTR2UEcxMk9O?=
 =?utf-8?B?QmJaRFEvT29HQmJxV2JaOVN3WmJBMlJSUDNVc2FnYXRnQmViNU12dzVxTmdM?=
 =?utf-8?B?RXRlRUdWSVhEMGk1WllxajRCQ0gwRXJEMStvd1h2RksxczI5cGdSS2k1ZHhS?=
 =?utf-8?B?K2xxRVM2TWxMVGl5L1JLNklQYVlTVGJkUVlRM0g3VHdtcmk1Kzk5elVoaW1T?=
 =?utf-8?B?RlYzWHp3U09TcnVqcmZhL2ZrcHF6ZEt1ek1RSVQ5QmNIMlJmRWNYNnppckRx?=
 =?utf-8?B?bkRhNE9KeGpFdlQzY1hpRXVLZ0FRdzR2WVFEUURvNk5DWEhFdHpkYjNLeGdR?=
 =?utf-8?B?TTkrOGR3N0xMYUVHSlhBS0JvMXpKVjdqRXlVQkZkK21vWDdCSjZYYklIZWpG?=
 =?utf-8?B?YVlVWUwvRGlwbW1DZU1YTWFSVXA2MFRDa2t3MkYzSy9NNkZqZ0tqcWdWbjFO?=
 =?utf-8?B?YzVZRHcwZDlPcU9Ta1JhUTFoclN1Q24zRXlNSHR5cmNPWkpON2ZJTi83WTUw?=
 =?utf-8?B?c3NlQ1ZCc2dyalFJZlBac1E0d0ZMamxrUWxvbDJYU2tjT1V2czVCQUVUQnpJ?=
 =?utf-8?B?NDlvcjRucXllUlplRGJ6M3FQM0xxb3NXMGhRMGt4aUFDTWl3SEVCZ201SXlP?=
 =?utf-8?B?anYvUGN3amZNclhEL3lHdWE3Mkd0bmpwc05XVmhWd2VrY21OakI4ejB1R3Z6?=
 =?utf-8?B?QVF4bm1UQjVHclR1RTZHODRJNjlVWExrdkUwVjFvT3lhMTlJQTU0Z1ViOTk3?=
 =?utf-8?B?OWlYK0R4SFJJSjQ1REpSMnNrQW41bzI3Uzk2SWFPVS91ekg2NUlFbThlcUhN?=
 =?utf-8?B?Tm1tdmJrRXpURmNYYmlDdlhoOEpLaG9jSjRSSkZUUlZUUU9MSnJGUXVQRkJM?=
 =?utf-8?B?d2psdDF6b24wOSsvUUIvTUdFVDNWL0l0RkRabU1TZmIvK0c3U2xPaUYyUUE2?=
 =?utf-8?B?SkM4aCtrbm9GeDRvV1hyS0loT1F2Wll5Z1BlQzZGQkFtWmU5K2Yyd3QyVGx5?=
 =?utf-8?B?VWdRSXduL1dHMXN4Nm9TRHNEUFpGUGlKQ04wQ0dlYTYwNWhValZCM3RDYVZG?=
 =?utf-8?B?dEdYSlE2b1kyTGdQUXdPSm1CMmUrMHJhRmNjSVQ5UUl3TmhwUVpYeXRzNWc3?=
 =?utf-8?B?bm1LcGNMeE42aWxCeVFWVWtXckxqQklRYlBUZjJmSDBPeW1xdkNnaG9uY0t6?=
 =?utf-8?B?eTIrTnhvMWdJZW5yYUVIVDVrZ2ZJa2psTWpCZWdwNFA4VWVFQjV3WFZmRk1N?=
 =?utf-8?B?RWprL3RtZFVWTHc0Tm9RbEZsaTFKcDhXeHJTdDkyaG0xaWVHMGhUSTJDV05k?=
 =?utf-8?B?cmc3cG8vU1djcXNWd3N1d1NyVU1vazRkZmkranYwTHJtbFd0NHhpd3dZWGNs?=
 =?utf-8?B?VW5lUjFRazFVd2l1VDQvbHpPbVBFZjRCc1NXZEpUSmNmemgxTEFCWGNWdlZM?=
 =?utf-8?B?UmlnSnNVMjJDZ2pmZTRlcmFPRk9mSGxNbTVyZDFnQ3VhMVNJMGR2S1VkNGFh?=
 =?utf-8?B?clBqRVhjWU5IR1JzTDIyRk1MemRiN0QwYnJNMWxzamxvaHJBdGd5cmZpVVdx?=
 =?utf-8?B?MzlTY05LMnNkN1VVQit5TkdmYm9SbWlSWDZxR2pGeElmeXBIenIwaWtJRXJK?=
 =?utf-8?B?cC9iNmkyNlcvMzFYSGJhU3p1bCtmNFlYSHVUQXBiYk1JVXdnaHU1WVlRcXBU?=
 =?utf-8?B?VVBIMDg2UHAzM3lKMUhwWGJUN25ib0lwV0FCTTNPdFdWVllBR0lNUndEMVNU?=
 =?utf-8?B?OXJJOVVncnFwTGVnMHpsVEJ3TitycnhwTWFDbFNmNmxVeEtDZkVMVXJKb2hm?=
 =?utf-8?B?OGFZWHFkWG1rUzFLV3R2bDRFTGZ0V1EwV2tyVXMrMlZMdXVZQjQzNFV5ZXdm?=
 =?utf-8?B?VVRWZUpqRVllRHkwTWFFU3p1UUUyVEhkVkZNa2hLZEdWKytxSCtiS25XRk1k?=
 =?utf-8?Q?IrJ/7UtpveO/396mpNiYDRNUj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135ab6a1-02ee-4801-8a24-08ddfa4634a1
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:09:19.6041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yk6pAj+m+RuZostrs4n9b4lE8Al3HFf6sPd1HDshYbdg/Cr+YW8XFqNgHpR3PinB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6819
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

On 22 Sep 2025, at 21:50, Balbir Singh wrote:

> On 9/23/25 07:09, Zi Yan wrote:
>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>
>>> Add support for splitting device-private THP folios, enabling fallback
>>> to smaller page sizes when large page allocation or migration fails.
>>>
>>> Key changes:
>>> - split_huge_pmd(): Handle device-private PMD entries during splitting
>>> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
>>> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>>>   don't support shared zero page semantics
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> ---
>>>  mm/huge_memory.c | 138 +++++++++++++++++++++++++++++++++--------------
>>>  1 file changed, 98 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 78166db72f4d..5291ee155a02 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2872,16 +2872,18 @@ static void __split_huge_pmd_locked(struct vm_a=
rea_struct *vma, pmd_t *pmd,
>>>  	struct page *page;
>>>  	pgtable_t pgtable;
>>>  	pmd_t old_pmd, _pmd;
>>> -	bool young, write, soft_dirty, pmd_migration =3D false, uffd_wp =3D f=
alse;
>>> -	bool anon_exclusive =3D false, dirty =3D false;
>>> +	bool soft_dirty, uffd_wp =3D false, young =3D false, write =3D false;
>>> +	bool anon_exclusive =3D false, dirty =3D false, present =3D false;
>>>  	unsigned long addr;
>>>  	pte_t *pte;
>>>  	int i;
>>> +	swp_entry_t swp_entry;
>>>
>>>  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>>>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>>>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
>>> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
>>> +
>>> +	VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd) && !pmd_trans_huge(*=
pmd));
>>>
>>>  	count_vm_event(THP_SPLIT_PMD);
>>>
>>> @@ -2929,20 +2931,47 @@ static void __split_huge_pmd_locked(struct vm_a=
rea_struct *vma, pmd_t *pmd,
>>>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>>  	}
>>>
>>> -	pmd_migration =3D is_pmd_migration_entry(*pmd);
>>> -	if (unlikely(pmd_migration)) {
>>> -		swp_entry_t entry;
>>>
>>> +	present =3D pmd_present(*pmd);
>>> +	if (is_pmd_migration_entry(*pmd)) {
>>>  		old_pmd =3D *pmd;
>>> -		entry =3D pmd_to_swp_entry(old_pmd);
>>> -		page =3D pfn_swap_entry_to_page(entry);
>>> -		write =3D is_writable_migration_entry(entry);
>>> +		swp_entry =3D pmd_to_swp_entry(old_pmd);
>>> +		page =3D pfn_swap_entry_to_page(swp_entry);
>>> +		folio =3D page_folio(page);
>>> +
>>> +		soft_dirty =3D pmd_swp_soft_dirty(old_pmd);
>>> +		uffd_wp =3D pmd_swp_uffd_wp(old_pmd);
>>> +
>>> +		write =3D is_writable_migration_entry(swp_entry);
>>>  		if (PageAnon(page))
>>> -			anon_exclusive =3D is_readable_exclusive_migration_entry(entry);
>>> -		young =3D is_migration_entry_young(entry);
>>> -		dirty =3D is_migration_entry_dirty(entry);
>>> +			anon_exclusive =3D is_readable_exclusive_migration_entry(swp_entry)=
;
>>> +		young =3D is_migration_entry_young(swp_entry);
>>> +		dirty =3D is_migration_entry_dirty(swp_entry);
>>> +	} else if (is_pmd_device_private_entry(*pmd)) {
>>> +		old_pmd =3D *pmd;
>>> +		swp_entry =3D pmd_to_swp_entry(old_pmd);
>>> +		page =3D pfn_swap_entry_to_page(swp_entry);
>>> +		folio =3D page_folio(page);
>>> +
>>>  		soft_dirty =3D pmd_swp_soft_dirty(old_pmd);
>>>  		uffd_wp =3D pmd_swp_uffd_wp(old_pmd);
>>> +
>>> +		write =3D is_writable_device_private_entry(swp_entry);
>>> +		anon_exclusive =3D PageAnonExclusive(page);
>>> +
>>> +		if (freeze && anon_exclusive &&
>>> +		    folio_try_share_anon_rmap_pmd(folio, page))
>>> +			freeze =3D false;
>>
>> Why is it OK to change the freeze request? OK, it is replicating
>> the code for present PMD folios. Either add a comment to point
>> to the explanation in the comment below, or move
>> =E2=80=9Cif (is_pmd_device_private_entry(*pmd))=E2=80=9C branch in the e=
lse below
>> to deduplicate this code.
>
> Similar to the code for present pages, ideally folio_try_share_anon_rmap_=
pmd()
> should never fail.

anon_exclusive =3D PageAnonExclusive(page);
if (freeze && anon_exclusive &&
    folio_try_share_anon_rmap_pmd(folio, page))
        freeze =3D false;
if (!freeze) {
        rmap_t rmap_flags =3D RMAP_NONE;

        folio_ref_add(folio, HPAGE_PMD_NR - 1);
        if (anon_exclusive)
                rmap_flags |=3D RMAP_EXCLUSIVE;
        folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
                                    vma, haddr, rmap_flags);
}

are the same for both device private and present. Can it be deduplicated
by doing below?

if (is_pmd_migration_entry(*pmd)) {
...
} else {
	if (is_pmd_device_private_entry(*pmd)) {
		...
	} else if (pmd_present()) {
		...
	}

	/* the above code */
}

If not, at least adding a comment in the device private copy of the code
pointing to the present copy's comment.

>
>>
>>> +		if (!freeze) {
>>> +			rmap_t rmap_flags =3D RMAP_NONE;
>>> +
>>> +			folio_ref_add(folio, HPAGE_PMD_NR - 1);
>>> +			if (anon_exclusive)
>>> +				rmap_flags |=3D RMAP_EXCLUSIVE;
>>> +
>>> +			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>>> +						 vma, haddr, rmap_flags);
>>> +		}
>>>  	} else {
>>>  		/*
>>>  		 * Up to this point the pmd is present and huge and userland has
>>> @@ -3026,32 +3055,57 @@ static void __split_huge_pmd_locked(struct vm_a=
rea_struct *vma, pmd_t *pmd,
>>>  	 * Note that NUMA hinting access restrictions are not transferred to
>>>  	 * avoid any possibility of altering permissions across VMAs.
>>>  	 */
>>> -	if (freeze || pmd_migration) {
>>> -		for (i =3D 0, addr =3D haddr; i < HPAGE_PMD_NR; i++, addr +=3D PAGE_=
SIZE) {
>>> -			pte_t entry;
>>> -			swp_entry_t swp_entry;
>>> -
>>> -			if (write)
>>> -				swp_entry =3D make_writable_migration_entry(
>>> -							page_to_pfn(page + i));
>>> -			else if (anon_exclusive)
>>> -				swp_entry =3D make_readable_exclusive_migration_entry(
>>> -							page_to_pfn(page + i));
>>> -			else
>>> -				swp_entry =3D make_readable_migration_entry(
>>> -							page_to_pfn(page + i));
>>> -			if (young)
>>> -				swp_entry =3D make_migration_entry_young(swp_entry);
>>> -			if (dirty)
>>> -				swp_entry =3D make_migration_entry_dirty(swp_entry);
>>> -			entry =3D swp_entry_to_pte(swp_entry);
>>> -			if (soft_dirty)
>>> -				entry =3D pte_swp_mksoft_dirty(entry);
>>> -			if (uffd_wp)
>>> -				entry =3D pte_swp_mkuffd_wp(entry);
>>> +	if (freeze || !present) {
>>> +		pte_t entry;
>>>
>>> -			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>>> -			set_pte_at(mm, addr, pte + i, entry);
>>> +		if (freeze || is_migration_entry(swp_entry)) {
>>>
>> <snip>
>>> +		} else {
>> <snip>
>>>  		}
>>>  	} else {
>>>  		pte_t entry;
>>
>> David already pointed this out in v5. It can be done such as:
>>
>> if (freeze || pmd_migration) {
>> ...
>> } else if (is_pmd_device_private_entry(old_pmd)) {
>> ...
>
> No.. freeze can be true for device private entries as well

When freeze is true, migration entry is installed in place of
device private entry, since the "if (freeze || pmd_migration)"
branch is taken. This proposal is same as your code. What is
the difference?

>
>> } else {
>> /* for present, non freeze case */
>> }
>>
>>> @@ -3076,7 +3130,7 @@ static void __split_huge_pmd_locked(struct vm_are=
a_struct *vma, pmd_t *pmd,
>>>  	}
>>>  	pte_unmap(pte);
>>>
>>> -	if (!pmd_migration)
>>> +	if (!is_pmd_migration_entry(*pmd))
>>>  		folio_remove_rmap_pmd(folio, page, vma);
>>>  	if (freeze)
>>>  		put_page(page);
>>> @@ -3089,7 +3143,7 @@ void split_huge_pmd_locked(struct vm_area_struct =
*vma, unsigned long address,
>>>  			   pmd_t *pmd, bool freeze)
>>>  {
>>>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>>> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
>>> +	if (pmd_trans_huge(*pmd) || is_pmd_non_present_folio_entry(*pmd))
>>>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>>>  }
>>>
>>> @@ -3268,6 +3322,9 @@ static void lru_add_split_folio(struct folio *fol=
io, struct folio *new_folio,
>>>  	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>>>  	lockdep_assert_held(&lruvec->lru_lock);
>>>
>>> +	if (folio_is_device_private(folio))
>>> +		return;
>>> +
>>>  	if (list) {
>>>  		/* page reclaim is reclaiming a huge page */
>>>  		VM_WARN_ON(folio_test_lru(folio));
>>> @@ -3885,8 +3942,9 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>>>  	if (nr_shmem_dropped)
>>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>
>>> -	if (!ret && is_anon)
>>> +	if (!ret && is_anon && !folio_is_device_private(folio))
>>>  		remap_flags =3D RMP_USE_SHARED_ZEROPAGE;
>>> +
>>
>> You should remove this and add
>>
>> if (folio_is_device_private(folio))
>> 	return false;
>>
>> in try_to_map_unused_to_zeropage(). Otherwise, no one would know
>> device private folios need to be excluded from mapping unused to
>> zero page.
>>
>
> I had that upto v2 and then David asked me to remove it. FYI, this
> is the only call site for RMP_USE_SHARED_ZEROPAGE

Can you provide a link?

Even if this is the only call site, there is no guarantee that
there will be none in the future. I am not sure why we want caller
to handle this special case. Who is going to tell the next user
of RMP_USE_SHARED_ZEROPAGE or caller to try_to_map_unused_to_zeropage()
that device private is incompatible with them?

>
>>>  	remap_page(folio, 1 << order, remap_flags);
>>>
>>>  	/*
>>> --=20
>>> 2.50.1
>>
>>
>
> Thanks for the review
> Balbir


--
Best Regards,
Yan, Zi
