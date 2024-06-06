Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E88FEF8C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 16:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64A410E993;
	Thu,  6 Jun 2024 14:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xMxtxtsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640D210E0A2;
 Thu,  6 Jun 2024 14:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bskGYhxoPWcK9ZXYFGVlYEKCgvlSYbO4aSADRhAINKxKBfSG2NXw/Fr4IoDAotnZVubLjS7v1NXYCidA18Yu7cltJFwUbBBmXsKbI9Ja28VGiJ1oT94E6lBmIO7f3iTM/96IAsqRmPWO6I0S64tuB9pGGO1blcxSQSpmMfVJet3JPW1QPVpC3YqdIkKDw5psl6+l/JJwauU0QK9yutzQg86XznkM8AdPLUuuJBj5b/6dNcxhjXZ2vG0bq6mp0SgVPeySsFbtJE7j0Q8XunYlR50r2biPeQMOIi+oVSAu17uJRdaRYsoldvVajlWI3+T9vbh1Kcy3oGfYJStc3X3pMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YziFwISGRk/54QQzvEM+ijVeJ7bspXSXGyHsIU2IYeQ=;
 b=UzMH8SMIoVlyFfqMPNQGkRFeyB9/AVlH1fge2KB+jnGIkHJ/SzeVfG3pI3vYnvEX4UitW88lF1SOLbiExmcY7oayy+hEV/fAV+H68QTbRxEpANo6t7R0jrGzrdCzMhBw0MccCdI/wNrND0s8lqXnYLIWUbmZqbmyOZORP6gleGxnRI5ra9uB+a4jyX67cOXonCulupqMaEZF45omhvhsKZ54a49UcOT+oN3AbJG4ghG7KXY/5KWNC3YgZ9xe29inB8g5DbJj95kWcFijJPbmIaUkrKHaO57BVif+Y+FLzf6yZebFyWkRIbphq2wLGqmDlJHcSAECmXhQGjURqXChBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YziFwISGRk/54QQzvEM+ijVeJ7bspXSXGyHsIU2IYeQ=;
 b=xMxtxtsHbqNuWS3ulkL8zCwtFepoQPyEWLaIPcI5VBW0bf2rjcHqdzGtQYZIs9yclSpJaXjIKW8LLaBz5XIpwsILwaRlfulsJ5S9mLSK0Rrzs610KVG13jXgOxpuG44QqtL60WAgnP0QxjlIsSCAGdJS77/bBqFIccalslfbP4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6352.namprd12.prod.outlook.com (2603:10b6:8:a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 14:55:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 14:55:59 +0000
Message-ID: <a7fe940f-5f97-41b2-9843-95a87843c1b5@amd.com>
Date: Thu, 6 Jun 2024 09:55:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] general protection fault in
 dequeue_hugetlb_folio_nodemask
To: Alex Deucher <alexander.deucher@amd.com>
References: <000000000000989d2a061a39a667@google.com>
Content-Language: en-US
Cc: syzbot <syzbot+c019f68a83ef9b456444@syzkaller.appspotmail.com>,
 Tim.Huang@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 akpm@linux-foundation.org, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, evan.quan@amd.com, lijo.lazar@amd.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 syzkaller-bugs@googlegroups.com, yifan1.zhang@amd.com
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <000000000000989d2a061a39a667@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b45985b-889f-418b-380c-08dc8638c6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnNoTkxWTUIzRExkY2swa2tBUko2VFB5SFpMZGZ6dS9tMmw3R0ppbEZtZFlD?=
 =?utf-8?B?NWRVS09UTkVCL0FkZGJkaVBEdXUrUDIxNXJndDROOXhadUgybkxMZ3dCakxM?=
 =?utf-8?B?SnF0OUtoSG93ekVRRUlFVWRUbFNPK2ltS0dQV3FUOUtVNkg1YTRJZmJQYnFp?=
 =?utf-8?B?OVNla1dJWWNRem5hSU5ER3NBODdtaEpmcXgzZmRVMWkxd0pKRm1kRGFUbDVF?=
 =?utf-8?B?VGgzbTlrLytPR2M0WEdJdDdxVGtocEZNUkJIeDhtdXhmYzVuNG8rSkk0ZG0z?=
 =?utf-8?B?NDUzbWZIUjZtTHgvNGFUbWo2QzFKUXJDVnNLTWtxN090T0VpczFnSk9ndEJp?=
 =?utf-8?B?K1dqRHdGeThrc3M3LythQTlLT05vc3JxMUk3RjVySzVaanl2bUlhU2M1cGNq?=
 =?utf-8?B?bFJ0NDl6K1NsT09xL29nSjVYSy9TeU55ZGJGQ01FMFhOeTF5ejBScVh4RDM5?=
 =?utf-8?B?L0Y2b01iQ2kyQnBmcHdJajJTRlg4M0Jwby9GeHA5UmZ0ajhqU3dQSTVlbERm?=
 =?utf-8?B?eExqSDhJU1F1UHoyT0Q2SVBBZXN6MlExVkJyQmtLQ2ZzQlV1TTlPWFlKajQ0?=
 =?utf-8?B?Q0VZU2xWVzR0M2hqemZySFV1c1pRc0pZVjF0aSt3WjE5dDBzeTFodUllZ1Rp?=
 =?utf-8?B?R0ZzWHlEa0lRVHhxNEFyNTlCdzQ2a0laWTdkSlh5MEk1Zlo4aFkySnA3Wmp4?=
 =?utf-8?B?T3JON3dFbVpvWHNVWlpTdEhZbjRRdDRoYUIwQlU2cmZqbitoQUxmaDd2bnVv?=
 =?utf-8?B?eUhTN3NkQjdjQkVtRVR4TUNheDR4a3NoaVI3TFFNRVhtY2VlQW9tYmo2RUkw?=
 =?utf-8?B?VUNscDgxTFpxSml1VitONHNsVGR0WU1LUHlJOE1xYnJNbFl2ZUp4RU1qRUZw?=
 =?utf-8?B?MkNnYUNLSFVVVGpIaDhTMGZVRmRFQVpmTE1nWFZFMSs5MFhGWjd6cGJhQUJP?=
 =?utf-8?B?RE1yWmhzbWUweGtyT1NGMDdkYnRSekJLMEFIVlNhM1ZQbmswalZDeFhMZlN0?=
 =?utf-8?B?OW5iL2xWY21PSU1laEVhbWFPaGY2VG5SRmlqb25JNitCKzgzRDN5b0g3aEw4?=
 =?utf-8?B?Z25BbWpaZE1RQmZKVXVKeDRqSTA0REx5NmNCNGRqZEtGK05ERzZVTDRIT2dE?=
 =?utf-8?B?bFFheG1oY052Q0gxVEV0YkxGeEgzeFpuNjM4S3BkaXBmcVlpRkVYWEMvMjht?=
 =?utf-8?B?RU0wZ2FNMTUwZkJ4TVhnd0JvS0dkT2tBT2FzSDlsTERRSi90OE1KOTJQaFVQ?=
 =?utf-8?B?RDF2STJUeSt2czliYm9ZSTUzSWI0aFZ3OVV6WlQ5b2RaSjZTY3MvTi92K2Nx?=
 =?utf-8?B?NXFwOGFzeGc3V0NNTTlBVE1YNC9CVFFrSURjUlhsM3lKNHBXeGtCZ0xzOUR3?=
 =?utf-8?B?NzlnOW9OdjFGZHZnVzZiaU11aXIwdDhMdmJpU3UwUFgrRTNVcWJQaGIweE0v?=
 =?utf-8?B?dHhGaXVBSGlKZW9MeXY5QXVZU2lidUJBNFlqK0cyKzV0QThaWUFNYlBqYys3?=
 =?utf-8?B?RXNrOThpOUtsd2lRcFJXdUk0VXoxaTlWVGRNZ2dwTUVxZU1ybklJTTdrWC9N?=
 =?utf-8?B?Y01jWHE4NDZlWmdXdmVrQTZFZlpiVUthTTBNZXAydHJUZnBldnJ3N0hhQ0Ny?=
 =?utf-8?B?cXVaUjRHR1Y0eTBwRlZEZjQ3OENBMm43SXFBRHh2c2lhOGdSNzYwd0hMa29Y?=
 =?utf-8?Q?cj6OtG/VeX/0VX7vHNyP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFowUjJXMWpUVTdROFVvQ0ZpbUU0NVFCU2l2eEF4RW1EVXV4YmJiM0JtTVIz?=
 =?utf-8?B?Smp4SEYxaXlJT1NKenF6bXNPRmJTNGZGbGhkT0hNQmZGMzNLWGpNdTk5N1ow?=
 =?utf-8?B?V1RxYXU0aUdqb1ZCSUdlN0ZKWDB4SWhPNGUycTNTUGlXdTBuMEd4ZDR3SkpX?=
 =?utf-8?B?ajVxYVdueFNHSnY4YVRYajgyN0xJdDBjcnJQU3JWWTU0R0Via3EydzE2VVIy?=
 =?utf-8?B?c2p5ZEt3MUREb0l1K2grYTlPRFMxT3VpbUl6WlRJazhnTmxFNkVLRTlWKzVF?=
 =?utf-8?B?QWFhSzQweWNJbEdBb3VRUllQOGxUOHZ1ck1nM2tXUUJMcFZaOGZyN1FvdG13?=
 =?utf-8?B?eUhMUm44M1JCOXJuYUZKci9tSXY2c05naXBGMHFjSll3TVoxckRlREdpMmFx?=
 =?utf-8?B?bFVUeTczT1U4TmdHREhvWkFUVGprS2hyL2ZWc3o5Z3VRcVhja1IvQ2tjOUtu?=
 =?utf-8?B?UXN2SHByZzhybnJjNHJRYldjMXQxM2NsMDFRZFhXeElUemxQK3A0UlVBUnY1?=
 =?utf-8?B?NWRxSUFRZWtWb245eTQrV3ljR01PeG1BeHo5RXk2dnMxWWpUSVo3ekFXMXdx?=
 =?utf-8?B?MDBRWG44S1VUbHNUQm9aaGp5YTlMTU5sNnN3Q2RJT3MwNE5vNWljcGI3T0ZN?=
 =?utf-8?B?c2o0SEEydnltV00xTzFPUy94dy9iNWFsTkZqY04ybXd0a29LZXlBd0ZwZmxl?=
 =?utf-8?B?QitITTNMTnZmWm01TDUreURkREc5a294dzlBVyttcC9xbXozMWdHaGNFM0VY?=
 =?utf-8?B?dGU4dGc3L0pGQnFUNTV5bzJpWXRNS0pwUTlSTitubkJ6QzgxK0VJaFkzQWgz?=
 =?utf-8?B?NlBpNHd6ZWZucDFGODF0KzVYSGFUWFAydkZyNTdqSTl1SFNtMzUxTjRWbitm?=
 =?utf-8?B?QVZzTHg5QWxIRFg1Tnhtbm5iM0pUOUVPU0RHcG1JSkRoalZqcklOS3hDQytU?=
 =?utf-8?B?QmRyYmt0UmNscU5BZS9TL1hBQThaMXRqRk4yeVA3L1ZveG1STlZtNTZPQlNG?=
 =?utf-8?B?Rm9ubmtzRXNXeDFQeXEvVUVDNnJ0TXczUlY4QTdNS3BwcWFBcmI3bGtHdjlr?=
 =?utf-8?B?bWdpM1FtWGhRbHZ6QlNjaUJHb2hieCtVK3c2akE5R2VJQXo4SEtxblJURFVW?=
 =?utf-8?B?OXRFRC9IVGdWZ3BydkppTnN6NUJWbU5pWnhvdnJTQzhyVlk1UDV4TC8zc21L?=
 =?utf-8?B?Zjlxb3lrdzZLYkRCKytwblE4eFNEQ2R0ei9HWmpxcWVJajBsYmxBc0RuMzRT?=
 =?utf-8?B?U3E0K3o1QmhmTmJBamE1ai9mSzVlaEpmRmZHVlppUnV3Q1dVUWU4Vi9DbU0w?=
 =?utf-8?B?Rkltekltc0sxYjhVdmxyTjA0clpreVFwVytWaDl3ak9xMCtPNmdRU2dBNjlJ?=
 =?utf-8?B?YlFIamF0OTFDU2NVTjhHRllSa2xEc3RlaGJTT2czNGM5MVdFdFUzUXBMb28z?=
 =?utf-8?B?MHUxUVRTNStiWkdLWEs4amxXdjdjbmZOU3RTclZKMmhpclQ3eWkxaC9EOWt4?=
 =?utf-8?B?dUQ3M2FtdVQ3SnBzd2tVOHVqVDJQeFhEOW9LMUs3ZFNYVzh1ekkvYlNJVzdG?=
 =?utf-8?B?T0ZWdkoxd2E2aitOZHRmZ2VYZHJDakRSdnlkMzlrdlpJQWNvbTh2NE9iRUNn?=
 =?utf-8?B?YTYwUTdsZmQ1OThrUFBjNTZESUVsNDUyL2JFRUxqcUFoblNWKzBCdG9oaTdT?=
 =?utf-8?B?Ym5UM2dPeDdXa2JwUDVTSGZqMWZKM0N1cjFUNGhCVkVZQ0liWjhvYmxTdERC?=
 =?utf-8?B?UmNWbjRPb3c3TmUzN3FzKzRmci93OUladmZyaGpYcUYydmYvQVhVTlNRRGZX?=
 =?utf-8?B?VStaTWtOZ3RoclhqaldiUmIyRlpEdlVSVFFNM3pmQ3Uxd2ZRZWZZL0p2bWhq?=
 =?utf-8?B?MlNvNjU0Uk5MelVMb2s0TzJEM3Iza3dRWExocVIxM0RPRjc0dUhmelJ6V3R6?=
 =?utf-8?B?WktKL3pKeWlXNGpsZTRvSFdNWGlKR2RWbUliOURLN2M4ejROMGhHb2hvbnlU?=
 =?utf-8?B?UUpFYlpjSlVnQjN5YkNjZThLOWtGenY3azkzUC9PS0d5TGd3dFRvYVN3QlRD?=
 =?utf-8?B?VnNwQURWQXFlWlJVTVh3NmFvSjZqaEgrclAzd1IvTTJ1d2xETkdOcFh4YnY3?=
 =?utf-8?Q?eNkhRKsJsfOQqdBcSfPhF+CDs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b45985b-889f-418b-380c-08dc8638c6d3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 14:55:59.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Amqg8+RIRXsNw2+5mAXrUk2OKZ991TEz/id9Dc5Kfx2yGc3BSnys6QiR/vHC5snlJ8iTgg2gugf1ZJ0Eag0P8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6352
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

On 6/6/2024 09:39, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    0e1980c40b6e Add linux-next specific files for 20240531
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=166086f2980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d9c3ca4e54577b88
> dashboard link: https://syzkaller.appspot.com/bug?extid=c019f68a83ef9b456444
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f4094a980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15e1e432980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/44fb1d8b5978/disk-0e1980c4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a66ce5caf0b2/vmlinux-0e1980c4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/8992fc8fe046/bzImage-0e1980c4.xz
> 
> The issue was bisected to:
> 
> commit cd94d1b182d2986378550c9087571991bfee01d4
> Author: Mario Limonciello <mario.limonciello@amd.com>
> Date:   Thu May 2 18:32:17 2024 +0000
> 
>      dm/amd/pm: Fix problems with reboot/shutdown for some SMU 13.0.4/13.0.11 users
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=176121c2980000
> console output: https://syzkaller.appspot.com/x/log.txt?x=10e121c2980000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c019f68a83ef9b456444@syzkaller.appspotmail.com
> Fixes: cd94d1b182d2 ("dm/amd/pm: Fix problems with reboot/shutdown for some SMU 13.0.4/13.0.11 users")
> 
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000489: 0000 [#1] PREEMPT SMP KASAN PTI
> KASAN: probably user-memory-access in range [0x0000000000002448-0x000000000000244f]
> CPU: 1 PID: 5089 Comm: syz-executor257 Not tainted 6.10.0-rc1-next-20240531-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
> RIP: 0010:zonelist_zone_idx include/linux/mmzone.h:1613 [inline]
> RIP: 0010:next_zones_zonelist include/linux/mmzone.h:1644 [inline]
> RIP: 0010:first_zones_zonelist include/linux/mmzone.h:1670 [inline]
> RIP: 0010:dequeue_hugetlb_folio_nodemask+0x193/0xe40 mm/hugetlb.c:1362
> Code: 13 9b a0 ff c7 44 24 14 00 00 00 00 83 7c 24 40 00 0f 85 97 0c 00 00 48 83 7c 24 20 00 0f 85 45 09 00 00 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 58 09 00 00 44 8b 33 44 89 f7 8b 5c 24
> RSP: 0018:ffffc900035ef720 EFLAGS: 00010002
> RAX: 0000000000000489 RBX: 0000000000002448 RCX: ffff888026ef0000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc900035ef858 R08: ffffffff81f5e070 R09: fffff520006bdee8
> R10: dffffc0000000000 R11: fffff520006bdee8 R12: 00000000ffffffff
> R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
> FS:  0000555564010380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000005fdeb8 CR3: 000000007bd96000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   alloc_hugetlb_folio_nodemask+0xae/0x3f0 mm/hugetlb.c:2603
>   memfd_alloc_folio+0x15e/0x390 mm/memfd.c:75
>   memfd_pin_folios+0x1066/0x1720 mm/gup.c:3864
>   udmabuf_create+0x658/0x11c0 drivers/dma-buf/udmabuf.c:353
>   udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:420 [inline]
>   udmabuf_ioctl+0x304/0x4f0 drivers/dma-buf/udmabuf.c:451
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:907 [inline]
>   __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f5151a7a369
> Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd962ee9e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007ffd962eebb8 RCX: 00007f5151a7a369
> RDX: 00000000200002c0 RSI: 0000000040187542 RDI: 0000000000000003
> RBP: 00007f5151aed610 R08: 00007ffd962eebb8 R09: 00007ffd962eebb8
> R10: 00007ffd962eebb8 R11: 0000000000000246 R12: 0000000000000001
> R13: 00007ffd962eeba8 R14: 0000000000000001 R15: 0000000000000001
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:zonelist_zone_idx include/linux/mmzone.h:1613 [inline]
> RIP: 0010:next_zones_zonelist include/linux/mmzone.h:1644 [inline]
> RIP: 0010:first_zones_zonelist include/linux/mmzone.h:1670 [inline]
> RIP: 0010:dequeue_hugetlb_folio_nodemask+0x193/0xe40 mm/hugetlb.c:1362
> Code: 13 9b a0 ff c7 44 24 14 00 00 00 00 83 7c 24 40 00 0f 85 97 0c 00 00 48 83 7c 24 20 00 0f 85 45 09 00 00 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 58 09 00 00 44 8b 33 44 89 f7 8b 5c 24
> RSP: 0018:ffffc900035ef720 EFLAGS: 00010002
> RAX: 0000000000000489 RBX: 0000000000002448 RCX: ffff888026ef0000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc900035ef858 R08: ffffffff81f5e070 R09: fffff520006bdee8
> R10: dffffc0000000000 R11: fffff520006bdee8 R12: 00000000ffffffff
> R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
> FS:  0000555564010380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000005fdeb8 CR3: 000000007bd96000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> ----------------
> Code disassembly (best guess):
>     0:	13 9b a0 ff c7 44    	adc    0x44c7ffa0(%rbx),%ebx
>     6:	24 14                	and    $0x14,%al
>     8:	00 00                	add    %al,(%rax)
>     a:	00 00                	add    %al,(%rax)
>     c:	83 7c 24 40 00       	cmpl   $0x0,0x40(%rsp)
>    11:	0f 85 97 0c 00 00    	jne    0xcae
>    17:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
>    1d:	0f 85 45 09 00 00    	jne    0x968
>    23:	48 89 d8             	mov    %rbx,%rax
>    26:	48 c1 e8 03          	shr    $0x3,%rax
> * 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
>    2f:	84 c0                	test   %al,%al
>    31:	0f 85 58 09 00 00    	jne    0x98f
>    37:	44 8b 33             	mov    (%rbx),%r14d
>    3a:	44 89 f7             	mov    %r14d,%edi
>    3d:	8b                   	.byte 0x8b
>    3e:	5c                   	pop    %rsp
>    3f:	24                   	.byte 0x24
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

I don't believe the bot did this right.  Running in a VM outside of 
shutdown won't exercise this codepath.

#syz invalid

But FWIW there WAS a different problem with that commit which will be 
fixed with:

https://gitlab.freedesktop.org/agd5f/linux/-/commit/2541609cd583dd13bf809934806df141e123d35f

Alex, I don't see this in the 6.10 fixes branch, could you pull it in an 
upcoming one?


