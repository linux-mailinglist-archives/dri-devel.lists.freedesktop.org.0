Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD79B559F0
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 01:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3266510ECEE;
	Fri, 12 Sep 2025 23:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LyJD01lD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2623410ECEE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 23:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWlDsff20w5Y+vj/EGm46CodC4YAcDcTDsUDpE9zlUOuQelfYc8O2E7pI8O0Nw4toazh6QEUD4bIAJ9XYSrIEHW4szISdoRzA00VrYrS5HTk5yhf+vfm47aqRptN4VzifYsu7m1H/Abf9FPVMXzujZi1qJzo2cZu6anaWd1ScwgqJHgpWUCQzRqq63ZiZkHzf2JOruA/xP94LBgS+u2U01KivIam2qXxVQJMafFPMpHtDWm7Nyspjt6rS35GsH4wbsfq34RstS2+sA8qFRZPxwBo/SjclUvWJZPo8KRs/mzFRLoLl6oHVl1Obj5WH49sZ39jicV0/Wx9skcIS2nGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0GJrWQW18rrwXetn9WijfsN5kh9rwX+lO2q+ED6en0=;
 b=Zqum07fVKjc9+SeRzp8Rj0tY07JN5ujAKf5kF+grcq0rD1qYu5RXhdYat+Gn32Sg0PxkolhFs3SCXMIBU/7sSt7uFWz01uYSdyp8qC+06vdifQ8Sjk/P554BO1JpelWHjPOspdSLERtdBfUjarqnsV6B1dByJGVZKzMBhzb07qsipd68AqTEOY6qbSV4Fnt2fKf2TP6Mp/UNLJN6lg0/5B2AEhyPCS/SQxtlVrUDMsjSiwmRbebiBfz8CQHqu6bonmqGsstL02lfiQg/19QCj63/pYFJtJJPOXar48Lba2PpDOnumffW6Wq9Xzh1Ng6zlDlrKSDyLb11HXzCzrxcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0GJrWQW18rrwXetn9WijfsN5kh9rwX+lO2q+ED6en0=;
 b=LyJD01lDMheO8taI7DgSPne/LeW4yN8Qv09ZxFcB4xtXPm8FAYDFUjaUxjQEEwc86Z3hWQLlAKidpcKBjUqg9/5h8F/2k/M/NcH1O7G4darat3T2V4Y1u7AiX0j0/R6f+1nvOgk6y34qOfXVgXnC2/eo62EF6wgEBrw8JsmEd/ibcaDSJ8AsHMmDoteR12TL6FCc1gHMV5G/HhwVSL3b+W5ggNVEtaHPRWTpq4gqX3mHon7URQe8mjnnEhWwP/Exyf7SJQNKXSNzzo+yLxuwgKG9TLlMKKSUmthEd7asA+zGV45Vq49/YSxd6HuuD+KhEkK/2Xeh1sVhMx0Gi8C5Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 23:14:37 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 23:14:37 +0000
Message-ID: <227ee2b2-3c1f-449f-98f1-29bde663bfdf@nvidia.com>
Date: Sat, 13 Sep 2025 09:14:29 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 01/15] mm/zone_device: support large zone device private
 folios
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-2-balbirs@nvidia.com>
 <8c5267ec-cc85-4eff-b890-eb705472e2b2@redhat.com>
 <f98d3149-9cc1-4211-af8f-e49547134b8c@nvidia.com>
 <244005a2-4796-4985-853e-f916bdfd096a@redhat.com>
 <ce40579b-4ded-473b-8fdb-a41d5b5021d5@nvidia.com>
 <3674bdb2-0e59-4f0d-8adf-4794a6db546c@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <3674bdb2-0e59-4f0d-8adf-4794a6db546c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::13) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 487beb6a-84ec-4702-4365-08ddf25224b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm0xa0Q4ZzllWkhFS0FHTDEzMzBqZ3hjVFdaVWhRVFNJQSszYU5FNzNRaFpM?=
 =?utf-8?B?ZUFsd0ZMUEdMcnY4QTVJZlZUWkJuc3creWs5MXhtT3BScmZZcTlkSTFlcjUx?=
 =?utf-8?B?OUtadkpBK00rNEtVMm8vVlE3aS9EK1JRT3MzUEZxcXFkMEJhdGIyY1RweUQ0?=
 =?utf-8?B?RUgvd2FlUnVxbGtkckdPOUVYMk9TOVRmUnZrT3d0Z0U3UFZpUU5Jb3JVYWoz?=
 =?utf-8?B?WGRMQ3hveUR6R0pKenZFWHRuWUFpeUwzOHJpcVRUZlJMUi9MbFJXWC9hdmVy?=
 =?utf-8?B?cVdZSkNEUXU2ZXBuZlh6c3Z6YkNTK1V3c0E4S2Flc1dTY3owQU5VOWhyMXNU?=
 =?utf-8?B?MU1DcU8xeTZmZ25va0lNUlY0YThyQTFHRG9HQkU4N2VXeC9selZ6YTFWYUVR?=
 =?utf-8?B?d1A0TjhEZFpNUktMcXkwV2c2aEpDd3QzaFkxYnpwRWtrSjZ0K0I4cWpKSE53?=
 =?utf-8?B?Q1V4d1dGejlVSVJaWHFvTWZ4TnRidWZMdlBYWEhrWUN1UXJ0amJIUGhTenpz?=
 =?utf-8?B?SHFwbWw4cnlDNXJkWlIreTZXS2FFeTU3eFovN2lMMFZQdVc0Yld6NzBNREp4?=
 =?utf-8?B?TkNDQi9wb1l6OVdoaEszcWpYMFJrM3FMS0gwWWNXYlhhNXE1R3pYbHpmUU42?=
 =?utf-8?B?ejhqczhpVVVNS2lqNzhBdGc5cEFaUDlFcE8zdzNWc1ExbUZCRGlQU0dDUUZh?=
 =?utf-8?B?U0tyWG1mZlUwUVF3NWhWQWN1YzdKSFM4RHgwd1FwRFhLcVBoeHR4YTk1MUZI?=
 =?utf-8?B?N28xRGRyYW56Rmt5T2JqcGZsK3BBM21PUVNKS3NYMXhCRlhDeW1aUUd2WllY?=
 =?utf-8?B?TURHZTJWM2VqOHJ5WTBXSzMzekg1Qm53eDlTb292bTJ5M0g1OVMwb05wdHc4?=
 =?utf-8?B?aTQvWmZXNldxVjBoV3o2UTBNQnNUenZPRUFPRzRiOW10TDBQc3FFUURRc2pK?=
 =?utf-8?B?RnhVaEJKanhvb3VrZEZGQ3BKZFJIRFdXTHR4bGpTUysxRjZmaDZvNWxydGQz?=
 =?utf-8?B?N0E1aDFxSmNLSW8zaW9kNXhWMHU2VzRsdEVVakF6d3JWWWZsblN0ckN2enMy?=
 =?utf-8?B?WDF1TEJFN0dZYmQ5aWtBWmRMWGV4V1cvRmphUVk4YzZETkU0WWhENWtmeXpV?=
 =?utf-8?B?UGl5M3FVZ1RmbFlGR201bHdzcUNqVm5ZN0EzOTU2WmYwcE0ySmxTbkdrc0hm?=
 =?utf-8?B?djNUNGpHWmR5QnhjOHl2dEhVYUdJZTQwZWtuRkYvUnU2N0cyV2tpNEZwSVp4?=
 =?utf-8?B?UnZPS3JrdzhPMjRYckZtN0JKV0ZRckVJMTN4VjBLdW0xVDNoMlRXL0xGaEFv?=
 =?utf-8?B?cEhpTndWdkI0QlBkc3ZMVDlJcVUvMis0VG1WcWs5Z1hhMUVoVExXcmIxWXNa?=
 =?utf-8?B?ZityVlIxKyt4NEh2TVkvQ1I5RU5YRkxhR0tTalRkVFBRaDZFT3JWRmFYQXFV?=
 =?utf-8?B?Mml1WGZNVVF6MzNDS2FtS2F3c1Uwcmx6ZEdDc1NXQVJHWWxUT1VIN215NWhi?=
 =?utf-8?B?WUFzYStsaVFhaG1DUDhncldRYmI4bEVzWjN2YitwTU45enIyV1pranliai8x?=
 =?utf-8?B?c0VDcWovUmtJbW52RVlYMncxZTd2bGNPN2Q1bDJ1Y3hpaXZxU05PaEx5S3l2?=
 =?utf-8?B?aXFrbC9LY2F5UWgybEhIRXU4R0VWcGxjcmFSYUJGbERuVS84SSt5cUpFQjlJ?=
 =?utf-8?B?czlTcUlEUDhITWt4bE93K1dFNlBRYjNxWlJKVjdMT21zYkpxMzR0MmhMVkFD?=
 =?utf-8?B?dTNWaXhvbHFhaG5LWWhPRUV3UmhwcUp3TzJNTHBmWmoydndQWE5QVWF5NzM0?=
 =?utf-8?B?VTg3OGZZWmpJb1VJU0hTVlFzak8yQk9pMkJ2TU1rRFVlcHovZ1F3cHlCQnQw?=
 =?utf-8?B?dDFaR3A5bU15L3RVcWJIQUpEQzZIREVHblpmZVNOTDRjTEFJQVo5OVFuTWwx?=
 =?utf-8?Q?LHzwN3Fb/zU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk5GUlRRSW1FU2l1UnBxOVhlSGdTbnpWTjU3TDdLV0Y4a3RkTjVJUS9JYW8x?=
 =?utf-8?B?TDdXZkljakdrdStwYkVMMzdwZjZ5NTBuMlc1NzNMV1NXWEdibHpicHZUQktr?=
 =?utf-8?B?cTIxR1Y5WWlHb001QUJRcDhpbGFyay82QThCR2pPNFdGM0hHNHJNZmRnWVhi?=
 =?utf-8?B?YXlsN2xIUXNVVzQvRys5ZW51bGZYZ3YvTzJncDFQaVdZSytYakhIYzlSclNx?=
 =?utf-8?B?UktIOVIzWkUveUZQMDZvQTZUTXFVV0ZUQzluY2tMdWM0SktlZG9GYXVJMHoy?=
 =?utf-8?B?ZXlhRUx4QlV2ZVh6eGM3bTdweGZzSW83Y2lEemJ6NE4vN2QrbXh1VFpTNGdJ?=
 =?utf-8?B?WDc1T2JhSkhoNStVNzJuMGQvZG0vWWZTWE8zYml5RUJBVXJHVlB2THdjVFdD?=
 =?utf-8?B?SHFsSE1nUWF5TDVYNkF5SnNUQWt5OEZ4bU5GUk94ejdvYm9pR1daOU9PLzlM?=
 =?utf-8?B?YjkrWlNEa25sN3B2eVlLR1RpK1MySVVpQWx5ZnpUdytJZGpKK1QyS3doMlJi?=
 =?utf-8?B?bks4YUY5TFhUNkl1UEd0czJTdmhOeDk2N25oQ3V1UGF0VTl5dzc3S1k2WGFY?=
 =?utf-8?B?eHFGS2dIUVN5TDBSeEVpV09QeUdOUm5Hc3VsL0pxTEFlUndZN1FqV1hCR05s?=
 =?utf-8?B?UzJlUGNhb1phRWVZbFg3N3dUMHhma1oxLytFVG00ZGRGMTZBWHNkK2xUUWxD?=
 =?utf-8?B?dDlzMW9KUWVWYjdiWXRVdURwdk5Ba2JzRzB3Vk05Tnd3aWdBdi9zeWZZTExN?=
 =?utf-8?B?cjBFNHphR0tiU3NCdzBoUEdWS2hnbUR6MnBIS0FwTjZuMDBVcXZRSExnOHdM?=
 =?utf-8?B?OUZMeVJHSC95cjBxTG1ZWGVzTmhHZGlGaFVCeFhoeWJlenFsRWNoMjBTOFN6?=
 =?utf-8?B?Q3NudXFsTzJpMVRpbVQ0VTN0RE1GQUlxYThCT0FQRjlsS054cWVwMW9mYnIw?=
 =?utf-8?B?NmhISmdwbTNJbHRRTTdoWkowR0lGRXZuQXo1endCdWs1eFJSOTJwVm5YWmtE?=
 =?utf-8?B?RFZ1c29aWnEwR3Z5VnZtWEJaeU9IWVhTaUFjSDZnS3ZXYkFJUzNENEN1MnY3?=
 =?utf-8?B?NHpDR1Jpb2xGU0NaZitJa3ZwNDRzSE1iY1V0UXRIS1JhanovSW5HV2NLVmdL?=
 =?utf-8?B?d2tWa0lTbDdLTStZWUhrQjdsYVpzb0JTeXJXR3psMWZMWkozb0pJckJWL1Jn?=
 =?utf-8?B?c2QxMHQ4NHZtSHhiR1FrSG5tMitJOHo0Ti9nN0kzRmxsYUNDc0REWE11dWVp?=
 =?utf-8?B?UmxaY01MMGZHWElMRHNYVndVYWVKZjI5U0QwMGJYdWorbHpXUm53Ykp3dW5L?=
 =?utf-8?B?K3Q2b3pHbWlqMFhlQ1pkSXZxbUlXTVQ0ZDZNbXdqK3ZCdWNUSlFBZjNxejFI?=
 =?utf-8?B?c2RacVdpMVJyS0x6VnNEQjAxUmhtczZtVGtlOUM4Nzl3WXBLbEpDMFVCOFRq?=
 =?utf-8?B?TUpjblVZSHFNcWNkWXB2d0xlU2tSalZwaHlTZnFyMm83WEhkUnRnU0h5dGh4?=
 =?utf-8?B?L2pEZ2VKUmZub25rWXErczV1b3Qxa2xvZmlpSUttSjA4SzBoai90Z2tmOFli?=
 =?utf-8?B?cnBRNlNDTzlQTE9QelhOUXRsanFvMkVuSEZzay9HZktzRXRzb1Q0MUowandv?=
 =?utf-8?B?ZTRBaUxDK2pXM1dRY2lKL3FXY000ZFVYZk90U1hESVhDaUplQmVIM1NuTkxo?=
 =?utf-8?B?ODg1RVcrbXFYM3luMENoWm54cE1aYU1yMFUyREhCbFBNUi9jaTVCQVp2K0RL?=
 =?utf-8?B?ZzkxK1ZhTnBpbERkMittSkxLejdlMFpvOXdnZ0ZBNklNckR3Z0tzdGVrMTR5?=
 =?utf-8?B?NkQvb2MwSjlLcjFTRVprT0thUFZBUUNzaDBQdXI3azN2SVl4TEkrZHpUOU5v?=
 =?utf-8?B?M0Z5K3RxdzBwMzU1MjBkUlc1MWpNWkxsRG1zNkdrcDcrVVNaRi9rMzcyelVK?=
 =?utf-8?B?NUdYMUovVDhaYnYzd1ladzZlcmYrQXkxeUpjNGUyWEh6Y1ZlYUhqWXo5TnBE?=
 =?utf-8?B?eGtSdEF4eVNSRW5hQ0xwbytlTlhQWHRBY1l3N20wUTZFRnl0c3pOUGhqTzVY?=
 =?utf-8?B?dmt5MkVOUTdQVVQ5bVgzejM3S2JKZTVQTTkxY0wwdE9aNlBxVG82aFIyQUQ2?=
 =?utf-8?B?endocjhGbm5JMXV5dTdVak1KeFlJUFFZMjJkMkpGa25GNHIrQjdPZW02dUlF?=
 =?utf-8?Q?JEIwCGmknQI8zwuyzq3c6fC4e8VG3H8B1Y25YD3NMVgY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487beb6a-84ec-4702-4365-08ddf25224b3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 23:14:37.5333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8q5cSd5AGqg/FOZ6D1LCrAkFEEuOSgESmYPN+dyky6nqKwdKXMl18dgly1Sqae2vthcWFqL73Kp3NVQVt/qAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706
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

On 9/12/25 19:20, David Hildenbrand wrote:
> On 12.09.25 06:49, Balbir Singh wrote:
>> On 9/11/25 22:52, David Hildenbrand wrote:
>>> On 11.09.25 14:49, Balbir Singh wrote:
>>>> On 9/11/25 21:45, David Hildenbrand wrote:
>>>>> On 08.09.25 02:04, Balbir Singh wrote:
>>>>>> Add routines to support allocation of large order zone device folios
>>>>>> and helper functions for zone device folios, to check if a folio is
>>>>>> device private and helpers for setting zone device data.
>>>>>>
>>>>>> When large folios are used, the existing page_free() callback in
>>>>>> pgmap is called when the folio is freed, this is true for both
>>>>>> PAGE_SIZE and higher order pages.
>>>>>>
>>>>>> Zone device private large folios do not support deferred split and
>>>>>> scan like normal THP folios.
>>>>>>
>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>>
>>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>>> ---
>>>>>
>>>>> You missed my comments of this patch in v3.
>>>>>
>>>>
>>>> Hi, David
>>>>
>>>> Looks I missed your comments, just checked those were largely about alignment and
>>>> integrating the code for DEVICE_COHERENT and DEVICE_PRIVATE cases into similar looking
>>>> bits for zone device folio free and code-alignment. I'll take a look and update as needed.
>>>
>>> Yes, and the confusing folio->mapping = NULL that I cannot connect to THP support.
>>>
>>
>> I can remove that, let me reunify those bits, seems relatively straight forward
> 
> BTW, I was wondering when we invalidate folio_test_anon() by clearing folio->mapping int he current code flow?
> 
> I mean, this must happen at some point when freeing device folios.
> 

The free_zone_device_folio() code does that. Lines 434 onwards there is a comment that explains it

Balbir
