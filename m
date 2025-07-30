Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AAB15D22
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 11:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D2510E15E;
	Wed, 30 Jul 2025 09:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sbg2zmnf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E772B10E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 09:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQpIjRjBuKK9iHX1wPEgLsmnDx8yUCSZufQX1K/bTVFW3KFeDB1KdOTB9M55sWjidOFi6Eklg5s80GGjrfkX4Mhimf4lP9TSaxDUC9FTkP+UyZ29VI6dJsteFJrBuojjnqiHbGIeILTpyi187MJDuUCU26Le+ap6JjIXw+WEfStch5MQ744OZ+CGPSWuXLWMX5DWmFpqt1VC9J8LGuMaBCSagM4Hr6hz29/He6xLxVSyGieXgFzXPfZjKzEmSM6tB1hlvL7nOIW7kMG7kZwRfGfgrrAu/gdUiSC7GWdNg7/f2zKMmq1NhQFiHue9V8ybD4Yz+zPeSEXjzwTS6XeOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFZ3Z2X2/oPH8X8X12+RjpsVIA8zP2VrWfFJMWAX9mM=;
 b=xLtV/mVwtlgi0kZlFx9cOetqA0SNdZSVvweqIW/rmKkKms3MEYNF61ovjzaHYjgVQueI/PRX4QoS52U0DuzqrDUgH13oYbKmpVzwWYHgXW+ZG/ByqDfJHbplFQ5NMKerc1yQadZw4+4gFDOeKkGWSNk6/Vi7Y4iTQUkv4ok8Z7Vc1bBpVQkPGsz5llLChsCQj3rO4Q/2Cz50P+ffYsSK0uznEyA9/WQKN3kPiF6HkhjbGh+Ymeua47vcMXdzFlNu3BrigXoiYpD/BRy3Bf5yQNLsxDOxX1KhqaIoHwWs8KOs8LEBefRXWe3rbsuosGWzYmTkm84D8mfS2Mgl+rjOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFZ3Z2X2/oPH8X8X12+RjpsVIA8zP2VrWfFJMWAX9mM=;
 b=Sbg2zmnfLYLss3JIG8eGsoccfnYXOf/YVk1theqo1yc5I/wHAj6JZVDsoE2qpnD4qmiCY7RF0UxHadulspAJs0SqWz8+YCHGdNpHwecU3HS08RZc6gfJ6VOEIIPl6f7ypQTNUvzA9gkAj9FkQx4qltqI/zSnbgNN5VBXyIuRSjo=
Received: from DS7PR05CA0041.namprd05.prod.outlook.com (2603:10b6:8:2f::8) by
 SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 09:50:46 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::34) by DS7PR05CA0041.outlook.office365.com
 (2603:10b6:8:2f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 09:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 09:50:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 04:50:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 04:50:44 -0500
Received: from [10.85.43.78] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 04:50:40 -0500
Message-ID: <61b68b13-2482-499b-a550-a11580a61e9d@amd.com>
Date: Wed, 30 Jul 2025 15:20:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] WARNING in __ww_mutex_wound
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, syzbot
 <syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com>, <airlied@gmail.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <mripard@kernel.org>, <simona@ffwll.ch>, <syzkaller-bugs@googlegroups.com>,
 <tzimmermann@suse.de>, Valentin Schneider <valentin.schneider@arm.com>,
 Connor O'Brien <connoro@google.com>, John Stultz <jstultz@google.com>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
 <8ab72592-7e16-4d79-9e26-f98a1938cb2a@linux.intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <8ab72592-7e16-4d79-9e26-f98a1938cb2a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3a8c8c-86d4-495c-6a51-08ddcf4e8e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2x5Wlg3MytnSHU1TGZVYTlHZm5hVmpxVFRyallyZzNmS2YyYzNHMWg2NTQx?=
 =?utf-8?B?M3NGdmszK0pSVzcwT3JrZUpzalYzbzAvSm44dEp4Ym9rbkdKTkk2VDkxL0Vl?=
 =?utf-8?B?UHpiK3M5Uk1kSDB0SW50czFJekdvcDlxVjhkSk1mTUFuMmZWTmk5N0dpUFJr?=
 =?utf-8?B?N0o4Vmk0ZFE4bjF5SjE2Si8rUC9CaXF6eldhdFIvL2dQbkJVcTFvdjMzZGxp?=
 =?utf-8?B?aFFpczJaRThYTjY5M3c2aFR3Q3JGRjJLeVMxVEZMNjdPcGUrd29pN2R1NUtP?=
 =?utf-8?B?YzBzZ3RBRFRQdXlkNGk0OFJtdGU5RGFQZm9pMTR2ckJhT3drbHFxRHVkZmto?=
 =?utf-8?B?QXNWUFF3eGt4M0UzeEdOTW9HK2NWekxxbllacXlDWUtkZnFyVC9qZzVibzkr?=
 =?utf-8?B?OGRHKy8wRnFNTlJsUFZIcEZ3KzhrRndyWWx3OHlaNjZBbC82WGhpaW15VnU3?=
 =?utf-8?B?dVVtMldObXhZWnNERXdBSk9uZXF3VjM0ZWFpa3Y2enJIS2hRNGZuNFhnOVBS?=
 =?utf-8?B?MUdoU2s4WjdLVEtZeXRjZFdaU3k3TVpDQzI0YlZqSU80dEhwVXFTaGNjSFNQ?=
 =?utf-8?B?WTF4MTFobFQzSGtEeXNLTWx4RHdPeGxXeXpwc1BadE9mMkZGSk1wZ0JwVUxB?=
 =?utf-8?B?VXZBUU5UbGhBbld4cDhCQ3ZmWTJnSGkxVzFkaW8zaDNqdUVaWSszYWh1TnpP?=
 =?utf-8?B?Zk9vQzZoYkkvMjY0UjRCWDNsM3VRYWVQaU85dG01VElIOWxHd1AwdTRkemFt?=
 =?utf-8?B?TVFuWCs2dDNUOVp5a1VVUXNXOUNKanJRZ1pYRHFxbnBZVFhWaVozUmwzd1ZR?=
 =?utf-8?B?OEFqT3lLb3RDK1ErbWVISEc3VitKVHVyWVlTZWl2em9HRTlTTmVqc1diRTF3?=
 =?utf-8?B?ZXJTOG5ZNkJWdWZNZnNZVzVhb0tFMThiRnowOWZscG5jREVBenQ2RlpLbmtG?=
 =?utf-8?B?MnRJKzBTWEdHNzEyRUpkcVE2ZTBaMkxTYlNZSkJUQ3pkd0swdGJPcFNMSEZk?=
 =?utf-8?B?YjVyVzN3OXFMcHpXdGhUd0hySk9ZbW5OK0p2SExLcGsyYXZZNTNFVlF3b0tY?=
 =?utf-8?B?OTBQcHpIK2RocWNZY2xrYWVZakhsZE5SVDY5SkFnb0VBaHFuSm50TDJicGhv?=
 =?utf-8?B?Ym9aTnZDaFJGdUovcDVCQnNES3RFM1B3ZUZqVmZ2aGVNTldyS0FxTDRLVW5G?=
 =?utf-8?B?RWpTYVYvdnRBU3VGS0Mrd0F4RzdnbzVPYjlvakdKbjBoZkRmQ3RIcHYzZ1VZ?=
 =?utf-8?B?djhQY2YxN0FiTmEwcldzYTRZKzlFaG9udlpNOUVKUzljZ3hNRmtBNEY5cTYy?=
 =?utf-8?B?dHNQTmI2S2VQcU8vc1hLZWlWY1ZwR3RSMjQ0WWg3RERyaEwvQmxMVHM1SFBZ?=
 =?utf-8?B?OHQzU3lZZHBOOUhaYVNrYUZYUVRQVEdpek9zT0J6TjljMDJ1bzdWU0dMTlox?=
 =?utf-8?B?KzMzanFDVFQrenlsRDN2YmhzRnA3Zk5JR1liaGlCUFVLNlpiTFZLbnlMWU5s?=
 =?utf-8?B?NXhCVlVjZTlzeXprY2JBN3VFL3dwWVpPYU5icDRreC90TzF2K0ZYRXlBZyt6?=
 =?utf-8?B?YXBTckZPTVNMc2hGb0txMTd3OENxUFdJZ2NobUh5SWVhZHJ0UnJNTjBYS2Nw?=
 =?utf-8?B?bHdJN3o3d2ZZVE1sVVhwa2tQTHVreHh3Q3dsSkNCa0IxYjRwaTJ3dHdxUlNH?=
 =?utf-8?B?a05hcjE0aVM2YUxWcjZaZW5HVXpLbW0wZTV2OW96Y1NUQ0V2dDdleUdGQ1lB?=
 =?utf-8?B?TThiQnVLRU1Pd0pjUEVCbE56RGJ5Um5RN1VDUGFMWklXSmtoZlBHZXFxVlN4?=
 =?utf-8?B?YVZpanBxTXFtbElMS1cydURsaEs4NkYzYlFsYmtkOGhKd2RrRXNFVEtWVEE5?=
 =?utf-8?B?ODJGUEh4MFNwVlp0cWNNdnVwYnJtcFVYWVNTUHYxbEQ1cmljZGI5eGpmOTB5?=
 =?utf-8?B?R2FZYnZRUm9qWElQRCszU0dyZ0JCL0hCeHQ0Q2lTV2F6aWU1WEp1ci9GSlJw?=
 =?utf-8?Q?qJto3mlrbvwiV4V0vHdpSyRuZTED8g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 09:50:45.4022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3a8c8c-86d4-495c-6a51-08ddcf4e8e17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241
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

On 7/30/2025 1:57 PM, Maarten Lankhorst wrote:
> Hey,
> 
> This warning is introduced in linux-next as a4f0b6fef4b0 ("locking/mutex: Add p->blocked_on wrappers for correctness checks")
> Adding relevant people from that commit.
> 
> Kind regards,
> ~Maarten
> 
> Den 2025-07-29 kl. 23:59, skrev syzbot:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d086c886ceb9 Add linux-next specific files for 20250718
>> git tree:       linux-next
>> console output: https://syzkaller.appspot.com/x/log.txt?x=161204a2580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=69896dd7b8c4e81e
>> dashboard link: https://syzkaller.appspot.com/bug?extid=602c4720aed62576cd79
>> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fff4f0580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111204a2580000
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/54504fbc2437/disk-d086c886.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/b427b00abffe/vmlinux-d086c886.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/5a87731b006b/bzImage-d086c886.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: ./include/linux/sched.h:2173 at __clear_task_blocked_on include/linux/sched.h:2173 [inline], CPU#1: syz.1.8698/395
>> WARNING: ./include/linux/sched.h:2173 at __ww_mutex_wound+0x21a/0x2b0 kernel/locking/ww_mutex.h:346, CPU#1: syz.1.8698/395
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 395 Comm: syz.1.8698 Not tainted 6.16.0-rc6-next-20250718-syzkaller #0 PREEMPT(full) 
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
>> RIP: 0010:__clear_task_blocked_on include/linux/sched.h:2173 [inline]
>> RIP: 0010:__ww_mutex_wound+0x21a/0x2b0 kernel/locking/ww_mutex.h:346

When wounding the lock owner, could it be possible that the lock
owner is blocked on a different nested lock? Lock owner implies it
is not blocked on the current lock we are trying to wound right?

I remember John mentioning seeing circular chains in find_proxy_task()
which required this but looking at this call-chain I'm wondering if
only the __ww_mutex_check_waiters() (or some other path) requires
__clear_task_blocked_on() for that case.

>> Code: 5f 5d c3 cc cc cc cc cc 90 0f 0b 90 e9 89 fe ff ff 90 0f 0b 90 e9 39 ff ff ff 90 0f 0b 90 4d 85 ff 0f 85 67 ff ff ff eb 95 90 <0f> 0b 90 eb 8f 48 c7 c1 70 00 e4 8f 80 e1 07 80 c1 03 38 c1 0f 8c
>> RSP: 0018:ffffc900030e7720 EFLAGS: 00010046
>> RAX: ffff888024a1b000 RBX: dffffc0000000000 RCX: 8f1a7ab232ebe500
>> RDX: 00000000000003ef RSI: ffffffff8de5b067 RDI: ffffffff8c04d400
>> RBP: 0000000000000001 R08: ffff888024a224bf R09: 1ffff11004944497
>> R10: dffffc0000000000 R11: ffffed1004944498 R12: ffff88802dee8a78
>> R13: ffffc900030e7ae8 R14: ffff88802dee8000 R15: ffff888024a224b8
>> FS:  00007fe6e4a7f6c0(0000) GS:ffff8881258ab000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007fe6e4a5ed58 CR3: 000000003115e000 CR4: 00000000003526f0
>> Call Trace:
>>  <TASK>
>>  __ww_mutex_add_waiter kernel/locking/ww_mutex.h:574 [inline]
>>  __mutex_lock_common kernel/locking/mutex.c:642 [inline]
>>  __ww_mutex_lock+0xba3/0x2930 kernel/locking/mutex.c:771
>>  ww_mutex_lock_interruptible+0x3f/0x1c0 kernel/locking/mutex.c:904
>>  modeset_lock+0x21a/0x650 drivers/gpu/drm/drm_modeset_lock.c:-1
>>  drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:398 [inline]
>>  drm_modeset_lock_all_ctx+0x62/0x300 drivers/gpu/drm/drm_modeset_lock.c:459
>>  setplane_internal drivers/gpu/drm/drm_plane.c:1118 [inline]
>>  drm_mode_setplane+0x577/0xba0 drivers/gpu/drm/drm_plane.c:1175
>>  drm_ioctl_kernel+0x2cc/0x390 drivers/gpu/drm/drm_ioctl.c:796
>>  drm_ioctl+0x67f/0xb10 drivers/gpu/drm/drm_ioctl.c:893
>>  vfs_ioctl fs/ioctl.c:51 [inline]
>>  __do_sys_ioctl fs/ioctl.c:598 [inline]
>>  __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7fe6e3b8e9a9
>> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007fe6e4a7f038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: 00007fe6e3db5fa0 RCX: 00007fe6e3b8e9a9
>> RDX: 0000200000000080 RSI: 00000000c03064b7 RDI: 0000000000000003
>> RBP: 00007fe6e3c10d69 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 0000000000000000 R14: 00007fe6e3db5fa0 R15: 00007ffdf1fa90a8
>>  </TASK>
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want syzbot to run the reproducer, reply with:
>> #syz test: git://repo/address.git branch-or-commit-hash
>> If you attach or paste a git patch, syzbot will apply it before testing.
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup
> 

-- 
Thanks and Regards,
Prateek

