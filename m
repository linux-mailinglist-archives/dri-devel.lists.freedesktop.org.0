Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCULI1ltfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA80B8705
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7410E957;
	Fri, 30 Jan 2026 08:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CKXUgdb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EFC10E957;
 Fri, 30 Jan 2026 08:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLTAEgs2YTxEaOEjq7DyS/r2agrDklNbFSc0Eft5C9wprN4XmPaF1OsTuj8q7+woLBCCaHSlVm/b9AntcCDojHUg5HooI+UTaTg0LzNp74aFUi9p18QludPt+7zSE4Rd5Y1d5F8K1l25hHDikvUaADvXPMerwiNKXRqAnAh3p9uyhP3bbLWkDstlIUxik8gA08xfhlI+gZIDuGKyeDmh6iMFEdP9d3iXwgns9QFij9YRs4wfTmBfOjW0TCBcf/KoyT5Yt0cjMFAKeLj4BIEFa5XXHKAbp7CrBhce4G8+dcwX+ymiDRUsisZxRAdqhlCcvRDyh2XCNJIGVAW5dsrZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA9R8Rxz1G7iPOKp8pYm905Gu/KbLbGJ3myVy5aVskE=;
 b=zI4tqpUk1i7fPUYfhN/F2+cWd6PdgtGi8ZWGdDVc1knszDnJV3cU4BWIDG//hOAQ/pF3xlM1IpbiIqPsG/Krx4vI7t3ZyU+C0GAjvmSVgSIlB8y7/ppEpAllfw/KshaQusF8ojoZ1VChkj6jH0BgY4fsgFkrK6kam4Z5alU4+t95Htn28PExC0x1TVkNGvgfabxYIK0Z/Tmq+ENHMH+OpujOfE/faGt1/mcBP3Y/oDgCC4oZMhhGVGty1iFsaAuOI9XHZoOOsriZQL3QRLYDLA0YXZCu4Po/0HMh5QFTnYpo4jabOp4gjcZ3WmdIjOMBps+bS7zQewLV9rm4hzpVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA9R8Rxz1G7iPOKp8pYm905Gu/KbLbGJ3myVy5aVskE=;
 b=CKXUgdb5sANlkb9lEO4Fe/Bxv3FunTxgwE1ltXNAb+9O7iLJ192JK6VL7rRRK0TuBqqYlviME9mR2o86F/qwkb8/i3/CMX9KN7nwQt2ibym1ANqH8Cxc7eccDwgwnptFcruSQN1+hxRPrHRQ2F36XAG8VuoO8uvwArS+zc0iYlBHJcwPLX0G6LTXVlUNSYkad1Vjl4PFQkBmjVi1I6XiKxoYyUhKqJhMB8nUJ0MP9BhXt9B3coZMwNRX5d+3uw7ojp9rT92h7hPM9GFbkUNV0GFJ2Q14jfwRbYK99SdjV/FNSjvTS8qMwWwxr252oF6fkmaYm/f1KAu5oDHrN9HXrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:35:28 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:28 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:04 +0900
Subject: [PATCH 1/9] rust: dma: rename CoherentAllocation fallible methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-1-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a4548a-69bd-4688-0126-08de5fda85cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0hWd25lS2MvL1FFc3h3OGtTNGhUVGU1aHNtMTQ2dTlRbVlPMDJGRklqdmVi?=
 =?utf-8?B?UTNqaklPMU1pV3hpQWRQZGFFMytiOXVUY1N0VHM5WGN4dElQVVVYQ0VQTi9N?=
 =?utf-8?B?MEYxajFscndvaWFTMXVTL1dEcko2aTNBK0E5Q2d3QnVwTHc5eWR4V1l1SzJX?=
 =?utf-8?B?bFNaV29aaXR5TzlrVG8rZENCbnJBak1ubTBrNzl0OVdqUG4wVjhTSHlVYW1z?=
 =?utf-8?B?Z2xHUW8zdW56RGhmbnExMW15RXAzYVo3eEx4NWVudTV3Vm4ycmlOYVh2a0JL?=
 =?utf-8?B?bEZnb3c2dzNJaHZwNVpXYXI2QWJmQlZZZjlINDRNcXZHdVByc0J6RW1GSUdr?=
 =?utf-8?B?am11SlFnR3M4bWRBUGprYnhoUHhPQXJVSFViNTJlbVNVa0ZTdEhtOTl2SVRq?=
 =?utf-8?B?R0p0YlZORXM1enVnQzhPRmtEM1RYQUZRNVZZbkZpTjQ5QnNHSmVocUNLY2Ra?=
 =?utf-8?B?S1gwZWgwRlpleWJsdUdIdGM1TFFNMDJPUnNFU2lZa0ora0d4QjhXRW84Y2lH?=
 =?utf-8?B?MkowWHRaeG9MalM4NllDOXd1R2tpa01TVVpBekVPQ2dFRkp2YW5TTmd2OFpy?=
 =?utf-8?B?ZEdJa05aK2tKam5jczEra3VJR0w3S0luQVgvUjl2VWR0YUU4Z3VTOThnSThl?=
 =?utf-8?B?VjhLMytoR01vWElOZFJXb2ZlclFGOEtpbXgxNjg5QWkwS0VmZ2RGMTlaZVV3?=
 =?utf-8?B?V244YWE3bURUeHhEOUdsVlpjN2ljMXltcXNCa3RCQ3lPa2d5NTRiUklFdHM0?=
 =?utf-8?B?blQ3QnpjNE9sQ29XYkJ1Q2hCQittdE1CY3l3WUpKTlFJcWRtb0V5NlRZbWRu?=
 =?utf-8?B?UVV5WW1EaS85TWYrRG5lME1nUG5QSGRCNmMwRFcrbldjWkpxcmJIRTRGZEFE?=
 =?utf-8?B?KzMxOTlsbk9uUW42QnhuRHFnZEcyclp3YnRNYkdtRGVNSTRtL0R5bndsb1hh?=
 =?utf-8?B?MjRpWHpGMXVkTExRU0htNHpicEpINmZzR1FkZ3BRN0hqT3JucE5GV1dFKzQr?=
 =?utf-8?B?SFdlRnVZakdHU05hZncrT1hCL0djb3BpZ1YwWmlReW5HUDZ2U1VaVHoyZytP?=
 =?utf-8?B?VHA1eERPOFZ1WlNjeWlRRWQ5RkVkZG5NbWlMVjFnUzRRYnNvU1AzcWtuOERK?=
 =?utf-8?B?RmMybTlndDF1SDlDWnRwUFE5Vjk1V0xvemhDcVAvbkNWaDBkMFFDSUZCSytL?=
 =?utf-8?B?UXJjOHZVTjVFNDE5a1NrMXJzRGhIVEgzd1dSTHR0dXNSTnZUWDRETEVOVnc4?=
 =?utf-8?B?WWNaSktWUnFtNFpyL3c5MlhlOXJUWFB6L3RleHdCNzZzN1ltRDltdjdPSzk5?=
 =?utf-8?B?bHlETWJxVmgwelZxejNQeFF6NE1wSnFuSFlkZVQyY3kwMndtNnFjbjkxY1o0?=
 =?utf-8?B?bkNhZkhBbDlhSk5NUGYyNWtwUHVZWGhQdzB4b1QyN1N1ckRjdHdGUnVUR0oz?=
 =?utf-8?B?TVhMKzRMUzNLYmxLcjhKamZzMHNwditoRitGdmlvN0VwUkhmYk12ajVaMlNv?=
 =?utf-8?B?ZjZ2Q2lGcDZiUWdWUW05RGovOHRCNkkvTmtjYWtrbDBRek0vaFBXQ0lpUmVJ?=
 =?utf-8?B?eWpTYk9vR0JNcnNqTDNCcmRVVzRLT2NQS043NEFseUpnalhqNGJ3K3p5SDk5?=
 =?utf-8?B?cjI3SkZOQ2o4MlQzZS9ibCtiWHpKZmZjTDEzMTFxajc3SkZ2QlZZOVFpUUtS?=
 =?utf-8?B?Tm8va0tObi9pSDBNNCtUVGpRWmhSWG9ScXN0M1VpZ0E3cU9mQjRLS1NocCsy?=
 =?utf-8?B?SzZQS2JvOUVVd3FhKytRS0VJdjJoY3crT2xGaWNCNlRTWnI2ZWJjb3BGSTBa?=
 =?utf-8?B?b2xjNk1RWmJQWFJoaDZGQTd0QnNNNWhDVTMvQ2tGTk04bkV5aWY5d1NHODc3?=
 =?utf-8?B?c2ZzYi9mK25RSk0yVlptWjBYTVVvd1I0SVNVdkZNZmpwV2JzMFNidU8vdVRu?=
 =?utf-8?B?QUZLS3ZxUGJUNW05YTJMTmFTa1IzVkFMWWVHNzRVTXFOVmppejlBbnpnaXRw?=
 =?utf-8?B?NE5kdzlYTkl2a1ZnaXd1Qk5oZWUxc25DWkI2SllQQitDQ3VHclBCejVkUXU1?=
 =?utf-8?B?dDY0WEtmaGloUzh3UWtHUUJPU1dTQ3U5OENMZHVMWlNjM0QzTEFVMHJvV1Jz?=
 =?utf-8?B?ZEJzcldYRXphbnNzT3I3M25uV2t5emZwSm5lMkJyUUhNNStQZFQ4VzFTNGU5?=
 =?utf-8?B?TVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnYzVTJ3TmF1eG43ZzNGNTV0bkMwYUpoV3JxYi9abFgyVGNVQWFNeFJBRGVI?=
 =?utf-8?B?dzRLTjFrcE1Dc05TMWJxcy8vbVRRd3Fhb3UvRVhOcFFlVU80eHRHcnJ5c2lO?=
 =?utf-8?B?UzRad2JsMWJOWEdEaUZZL2NUWjdwS3V6RFlxS3AwVGJod2ttVmNUMUhPZlhu?=
 =?utf-8?B?SDZsQWk3dnByRUUwbEhvcUVOdE9EV0djWjBRNDRvUVFzeGZma3YvaFQwdFdP?=
 =?utf-8?B?MFREancrV3V3OE1DaUNHNXI3amVWODlXTE1vcUFYTGlTWUdtbEZIYVdwWFln?=
 =?utf-8?B?SnoreHM4eVFjTUV2Zm9vc3k4SHZqWGhUcmZOZFlpVjFoN05GV0pWRDRrc2VK?=
 =?utf-8?B?dnZFeFdXbFQ4b01SMHh0VEVmanpiV0hEOWthTEhnTW90T3NjT1lPVENUc0NE?=
 =?utf-8?B?eHMxQkoyOGMydzRzTmpNcURyNGZiTW45allEQjVkUENjWlkvcG1aaWdueFFh?=
 =?utf-8?B?eDZQU0kxVFR0WFd0Vm9IZ215Tk5QY1V3NThsbnVjdmtzRjF1SWdIaE1rVmtu?=
 =?utf-8?B?ZldxcEEvV2ppQlRrRlVFUkowVm4zdjQ4YmJQTkZjR0h1TDVSZVRwSXZrakZZ?=
 =?utf-8?B?elVaNjhSRmFyd3VKajJWQ1FFY1lxb3FldHgyNlpJc3ZlMitxZHpuSjdRRjNk?=
 =?utf-8?B?WjJ3S29tTXVuU2d1QXh6Y2x1ZkJNbERab3lMTk5UQ0JlR1B6WGNOdnlrVDNB?=
 =?utf-8?B?YkpQRk9MWnVTczlRME5vT3R5QVVZNXcrS0ZNOGl0Z2tqdmJFOG12bzQ0RGQw?=
 =?utf-8?B?MUdtQ28yd0N1UlI2SDZ1Q1pkaXJvVWQyZVMxUEdqTkJRaGlXTkVCaG9haEp4?=
 =?utf-8?B?bXZKSkVOdy9Ec0xVc3lacStyZW1RMXdTU3c5aFdaR0NQUkViUEQrd1M4Si9r?=
 =?utf-8?B?bmtWNm0rcFpERW1JRWtDTmo0cXIyQ1NOeDlPUFA4MGEzcnUrUllYem93M0k5?=
 =?utf-8?B?dVpadnlmZnUyY1lpN3NkTTZ2ejkreWlVd3JvTUZoVEc1ZTdoWWZZYzVSTjZs?=
 =?utf-8?B?dDNRMndxWnl1SzZRclZndWdaZzAvYTh1eWliaGhrbXQzMVJWTkdUQXIrelBu?=
 =?utf-8?B?bnBhYllyL2pTa2hGQnRwLzY2WVRzZ0tFZ1NoM3diVzdidjRZMHZicHprRVpE?=
 =?utf-8?B?MFloWGQ2aWE5YmplRmdidFZsRTlycm9mRUJBYVMvMXpabm5CS0RCaDBYamFQ?=
 =?utf-8?B?eUVmVkVWVG5NZWZTdHMxdDBSNnQxN1hEUE1VSzkrNWVuR0FDRlBlK0NKcnpk?=
 =?utf-8?B?S1FwUlVOSXplc2dGb1RYVXFSWUtham15bG12cHRReFpCK1lzSDlwRmhiaFBt?=
 =?utf-8?B?R2tidGFCUVlxZHdGb3hvKzV4ZTRjRE1lMURhSHlkREJjeHpqR1RkSEEvNEUy?=
 =?utf-8?B?UmFON3lkZjVJemVRVDkxek16TzZLaVFWaEdKTzNhOHl0Z2pxdFovRjVOMFRK?=
 =?utf-8?B?bUtmVVpETDRlTVIxNjJvaDBhMjlpUlB2ckNyVk1vUk85dWRyN2cvMjVyV2ZR?=
 =?utf-8?B?VkVxcUU5N1BTcWFBQU9jT3pmamZmcnlEMjUwM29jK3VkcG9TOHYzT0h1a0Js?=
 =?utf-8?B?VWcwam4yUE40dDE1dTVIYXB2MU9JQ3JjVjh4N1d1VGJQOWNaQzJYZzlkUUJz?=
 =?utf-8?B?YUhTZlRwZU0zRmNwaWJQZExvTEl0OVIreE1rV2NEY2tNQXFoRlg4b3F0YVNp?=
 =?utf-8?B?QjNMb1ZWOVloKzRMU2xOTzBlT1dBUEZhamo2SmlnUUdvRitPUmg0YWsveHla?=
 =?utf-8?B?SkMzWWlnbzUvR2o5ME9JWDIrUUZrYkJ3TzV6Nm83bDlNMFNkRTFyQ2FPV0Rh?=
 =?utf-8?B?ZlNtV3lUeGM0SitwY0U5OHlydVFRcnM2Sy95RmxYbldPU1Qza3ZQZEFjMGJu?=
 =?utf-8?B?Rk5ORGs5OUg1QlFXUktyMjdLVU50bG5sNXkvWVlCZ0VsTElMWEJPYmZSalVw?=
 =?utf-8?B?ZDRTc0dBQUtzMUJPV3JmYnQrdFgrSktsTUluNFJueDBiK3lDb1UzbTRRS0da?=
 =?utf-8?B?QXlOZWlyTkNmRHZOaTVTdWpONUtLY0xIZ0I0WGlwVzFmZHdQSm9rTjFsVnVW?=
 =?utf-8?B?elNYTUJWeWF0bnNiejZnakJwcDlITy9IdzZKVFlURWxmMnFtMVhFYzNCdUht?=
 =?utf-8?B?RGRaclorU2Zld21FeEpEWER2NDc5amVrSGZJcFFFYitDSFdIOWRUUjhTY0JX?=
 =?utf-8?B?UUsxUCsxRkpWNTJlYUc0Rm1LcDZ6ekVEZzJEcE5kam9WZlh2YVFKcFRoSndV?=
 =?utf-8?B?STdKM2VkNmIzdHZnaGRUZkNqRXd5NnFXbHpDTUV5OE83MHBGR1hEZ3BxNE1u?=
 =?utf-8?B?UGFDS1A5Z0lwSjhPcklxY2x0MTNpOVFyYXNBSXBGTTEyeDA1czAzeTFleU84?=
 =?utf-8?Q?f/PzpWG7tvnhQ62jiiJmiTfBT/5tkRmHmAEN+MGcI50Ge?=
X-MS-Exchange-AntiSpam-MessageData-1: 3k7R/UpR75IBeA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a4548a-69bd-4688-0126-08de5fda85cb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:28.6437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6M2yVZmO+G1gDn9UwFNdv27hOrehoQ2d8wxu0r2sQ3vt+j7ira8Sjn5d6zQeWUwna7z50M/if0cFNfRFOPTGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3AA80B8705
X-Rspamd-Action: no action

Prefix fallible methods in CoherentAllocation with try_. Prefix
dma_write! and dma_read! macros with try_ to better indicate they
can fail.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs            |  2 +-
 drivers/gpu/nova-core/falcon.rs         |  2 +-
 drivers/gpu/nova-core/firmware/fwsec.rs |  4 +-
 drivers/gpu/nova-core/gsp.rs            | 16 +++----
 drivers/gpu/nova-core/gsp/boot.rs       |  6 +--
 drivers/gpu/nova-core/gsp/cmdq.rs       | 14 +++---
 rust/kernel/dma.rs                      | 85 +++++++++++++++++----------------
 samples/rust/rust_dma.rs                |  6 +--
 8 files changed, 69 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 7215398969da..f77754f12f02 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -33,7 +33,7 @@ pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Res
         Self::new(dev, data.len()).and_then(|mut dma_obj| {
             // SAFETY: We have just allocated the DMA memory, we are the only users and
             // we haven't made the device aware of the handle yet.
-            unsafe { dma_obj.write(data, 0)? }
+            unsafe { dma_obj.try_write(data, 0)? }
             Ok(dma_obj)
         })
     }
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..9cd271de0554 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -460,7 +460,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
+                fw.try_dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..515b19926b49 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -191,7 +191,7 @@ unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Resu
     // SAFETY: The safety requirements of the function guarantee the device won't read
     // or write to memory while the reference is alive and that this call won't race
     // with writes to the same memory region.
-    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
+    T::from_bytes(unsafe { fw.try_as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
@@ -210,7 +210,7 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     // SAFETY: The safety requirements of the function guarantee the device won't read
     // or write to memory while the reference is alive and that this call won't race
     // with writes or reads to the same memory region.
-    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
+    T::from_bytes_mut(unsafe { fw.try_as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..43bc35fd3b55 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -8,10 +8,10 @@
         CoherentAllocation,
         DmaAddress, //
     },
-    dma_write,
     pci,
     prelude::*,
-    transmute::AsBytes, //
+    transmute::AsBytes,
+    try_dma_write, //
 };
 
 pub(crate) mod cmdq;
@@ -92,7 +92,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         unsafe {
             // Copy the self-mapping PTE at the expected location.
             obj.0
-                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+                .try_as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
                 .copy_from_slice(ptes.as_bytes())
         };
 
@@ -131,13 +131,13 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         // _kgspInitLibosLoggingStructures (allocates memory for buffers)
         // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
         let loginit = LogBuffer::new(dev)?;
-        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+        try_dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
 
         let logintr = LogBuffer::new(dev)?;
-        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+        try_dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
 
         let logrm = LogBuffer::new(dev)?;
-        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+        try_dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
 
         let cmdq = Cmdq::new(dev)?;
 
@@ -146,8 +146,8 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
             1,
             GFP_KERNEL | __GFP_ZERO,
         )?;
-        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+        try_dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
+        try_dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
 
         Ok(try_pin_init!(Self {
             libos,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..69e2fb064220 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,11 +3,11 @@
 use kernel::{
     device,
     dma::CoherentAllocation,
-    dma_write,
     io::poll::read_poll_timeout,
     pci,
     prelude::*,
-    time::Delta, //
+    time::Delta,
+    try_dma_write, //
 };
 
 use crate::{
@@ -160,7 +160,7 @@ pub(crate) fn boot(
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+        try_dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3991ccc0c10f..9c94f4c6ff6d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -15,7 +15,6 @@
         CoherentAllocation,
         DmaAddress, //
     },
-    dma_write,
     io::poll::read_poll_timeout,
     prelude::*,
     sync::aref::ARef,
@@ -24,6 +23,7 @@
         AsBytes,
         FromBytes, //
     },
+    try_dma_write, //
 };
 
 use crate::{
@@ -201,9 +201,11 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
-        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
-        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+        try_dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
+        try_dma_write!(
+            gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES)
+        )?;
+        try_dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
 
         Ok(Self(gsp_mem))
     }
@@ -221,7 +223,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - The `CoherentAllocation` contains exactly one object.
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
-        let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
+        let gsp_mem = &mut unsafe { self.0.try_as_slice_mut(0, 1) }.unwrap()[0];
         // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<= MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
@@ -256,7 +258,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - The `CoherentAllocation` contains exactly one object.
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
-        let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
+        let gsp_mem = &unsafe { self.0.try_as_slice(0, 1) }.unwrap()[0];
         // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<= MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5118..02321d5f3f06 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -482,7 +482,7 @@ pub fn dma_handle(&self) -> DmaAddress {
     /// device as the DMA address base of the region.
     ///
     /// Returns `EINVAL` if `offset` is not within the bounds of the allocation.
-    pub fn dma_handle_with_offset(&self, offset: usize) -> Result<DmaAddress> {
+    pub fn try_dma_handle_with_offset(&self, offset: usize) -> Result<DmaAddress> {
         if offset >= self.count {
             Err(EINVAL)
         } else {
@@ -494,7 +494,7 @@ pub fn dma_handle_with_offset(&self, offset: usize) -> Result<DmaAddress> {
 
     /// Common helper to validate a range applied from the allocated region in the CPU's virtual
     /// address space.
-    fn validate_range(&self, offset: usize, count: usize) -> Result {
+    fn try_validate_range(&self, offset: usize, count: usize) -> Result {
         if offset.checked_add(count).ok_or(EOVERFLOW)? > self.count {
             return Err(EINVAL);
         }
@@ -514,8 +514,8 @@ fn validate_range(&self, offset: usize, count: usize) -> Result {
     ///   slice is live.
     /// * Callers must ensure that this call does not race with a write to the same region while
     ///   the returned slice is live.
-    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
-        self.validate_range(offset, count)?;
+    pub unsafe fn try_as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
+        self.try_validate_range(offset, count)?;
         // SAFETY:
         // - The pointer is valid due to type invariant on `CoherentAllocation`,
         //   we've just checked that the range and index is within bounds. The immutability of the
@@ -525,8 +525,8 @@ pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
         Ok(unsafe { core::slice::from_raw_parts(self.start_ptr().add(offset), count) })
     }
 
-    /// Performs the same functionality as [`CoherentAllocation::as_slice`], except that a mutable
-    /// slice is returned.
+    /// Performs the same functionality as [`CoherentAllocation::try_as_slice`], except that a
+    /// mutable slice is returned.
     ///
     /// # Safety
     ///
@@ -534,8 +534,8 @@ pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
     ///   slice is live.
     /// * Callers must ensure that this call does not race with a read or write to the same region
     ///   while the returned slice is live.
-    pub unsafe fn as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mut [T]> {
-        self.validate_range(offset, count)?;
+    pub unsafe fn try_as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mut [T]> {
+        self.try_validate_range(offset, count)?;
         // SAFETY:
         // - The pointer is valid due to type invariant on `CoherentAllocation`,
         //   we've just checked that the range and index is within bounds. The immutability of the
@@ -561,11 +561,11 @@ pub unsafe fn as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mu
     /// let buf: &[u8] = &somedata;
     /// // SAFETY: There is no concurrent HW operation on the device and no other R/W access to the
     /// // region.
-    /// unsafe { alloc.write(buf, 0)?; }
+    /// unsafe { alloc.try_write(buf, 0)?; }
     /// # Ok::<(), Error>(()) }
     /// ```
-    pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
-        self.validate_range(offset, src.len())?;
+    pub unsafe fn try_write(&mut self, src: &[T], offset: usize) -> Result {
+        self.try_validate_range(offset, src.len())?;
         // SAFETY:
         // - The pointer is valid due to type invariant on `CoherentAllocation`
         //   and we've just checked that the range and index is within bounds.
@@ -581,12 +581,13 @@ pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
         Ok(())
     }
 
-    /// Returns a pointer to an element from the region with bounds checking. `offset` is in
-    /// units of `T`, not the number of bytes.
+    /// Returns a pointer to an element from the region with bounds checking. `offset` is in units
+    /// of `T`, not the number of bytes.
     ///
-    /// Public but hidden since it should only be used from [`dma_read`] and [`dma_write`] macros.
+    /// Public but hidden since it should only be used from [`try_dma_read`] and [`try_dma_write`]
+    /// macros.
     #[doc(hidden)]
-    pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
+    pub fn try_item_from_index(&self, offset: usize) -> Result<*mut T> {
         if offset >= self.count {
             return Err(EINVAL);
         }
@@ -602,10 +603,10 @@ pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
     ///
     /// # Safety
     ///
-    /// This must be called from the [`dma_read`] macro which ensures that the `field` pointer is
-    /// validated beforehand.
+    /// This must be called from the [`try_dma_read`] macro which ensures that the `field` pointer
+    /// is validated beforehand.
     ///
-    /// Public but hidden since it should only be used from [`dma_read`] macro.
+    /// Public but hidden since it should only be used from [`try_dma_read`] macro.
     #[doc(hidden)]
     pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
         // SAFETY:
@@ -625,10 +626,10 @@ pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
     ///
     /// # Safety
     ///
-    /// This must be called from the [`dma_write`] macro which ensures that the `field` pointer is
-    /// validated beforehand.
+    /// This must be called from the [`try_dma_write`] macro which ensures that the `field` pointer
+    /// is validated beforehand.
     ///
-    /// Public but hidden since it should only be used from [`dma_write`] macro.
+    /// Public but hidden since it should only be used from [`try_dma_write`] macro.
     #[doc(hidden)]
     pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
         // SAFETY:
@@ -684,18 +685,18 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
 /// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
-/// let whole = kernel::dma_read!(alloc[2]);
-/// let field = kernel::dma_read!(alloc[1].field);
+/// let whole = kernel::try_dma_read!(alloc[2]);
+/// let field = kernel::try_dma_read!(alloc[1].field);
 /// # Ok::<(), Error>(()) }
 /// ```
 #[macro_export]
-macro_rules! dma_read {
-    ($dma:expr, $idx: expr, $($field:tt)*) => {{
+macro_rules! try_dma_read {
+    ($dma:expr, $idx:expr, $($field:tt)*) => {{
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-            // dereferenced. The compiler also further validates the expression on whether `field`
-            // is a member of `item` when expanded by the macro.
+            let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
+            // SAFETY: `try_item_from_index` ensures that `item` is always a valid pointer
+            // and can be dereferenced. The compiler also further validates the expression
+            // on whether `field` is a member of `item` when expanded by the macro.
             unsafe {
                 let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
                 ::core::result::Result::Ok(
@@ -705,10 +706,10 @@ macro_rules! dma_read {
         })()
     }};
     ($dma:ident [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($dma, $idx, $($field)*)
+        $crate::try_dma_read!($dma, $idx, $($field)*)
     };
     ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($($dma).*, $idx, $($field)*)
+        $crate::try_dma_read!($($dma).*, $idx, $($field)*)
     };
 }
 
@@ -728,32 +729,32 @@ macro_rules! dma_read {
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
 /// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
-/// kernel::dma_write!(alloc[2].member = 0xf);
-/// kernel::dma_write!(alloc[1] = MyStruct { member: 0xf });
+/// kernel::try_dma_write!(alloc[2].member = 0xf);
+/// kernel::try_dma_write!(alloc[1] = MyStruct { member: 0xf });
 /// # Ok::<(), Error>(()) }
 /// ```
 #[macro_export]
-macro_rules! dma_write {
+macro_rules! try_dma_write {
     ($dma:ident [ $idx:expr ] $($field:tt)*) => {{
-        $crate::dma_write!($dma, $idx, $($field)*)
+        $crate::try_dma_write!($dma, $idx, $($field)*)
     }};
     ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
-        $crate::dma_write!($($dma).*, $idx, $($field)*)
+        $crate::try_dma_write!($($dma).*, $idx, $($field)*)
     }};
     ($dma:expr, $idx: expr, = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid item.
+            let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
+            // SAFETY: `try_item_from_index` ensures that `item` is always a valid item.
             unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
             ::core::result::Result::Ok(())
         })()
     };
     ($dma:expr, $idx: expr, $(.$field:ident)* = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-            // dereferenced. The compiler also further validates the expression on whether `field`
-            // is a member of `item` when expanded by the macro.
+            let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
+            // SAFETY: `try_item_from_index` ensures that `item` is always a valid pointer
+            // and can be dereferenced. The compiler also further validates the expression
+            // on whether `field` is a member of `item` when expanded by the macro.
             unsafe {
                 let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
                 $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 9c45851c876e..7a87048575df 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -68,7 +68,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
+                kernel::try_dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
             }
 
             let size = 4 * page::PAGE_SIZE;
@@ -91,8 +91,8 @@ fn drop(self: Pin<&mut Self>) {
         dev_info!(self.pdev, "Unload DMA test driver.\n");
 
         for (i, value) in TEST_VALUES.into_iter().enumerate() {
-            let val0 = kernel::dma_read!(self.ca[i].h);
-            let val1 = kernel::dma_read!(self.ca[i].b);
+            let val0 = kernel::try_dma_read!(self.ca[i].h);
+            let val1 = kernel::try_dma_read!(self.ca[i].b);
             assert!(val0.is_ok());
             assert!(val1.is_ok());
 

-- 
2.52.0

