Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC48758D6E7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D8F90CF4;
	Tue,  9 Aug 2022 09:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A658491FBC;
 Tue,  9 Aug 2022 09:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aA6SjZu1XyfEnex9cEFsylH6aG4487OyHMIt1dAhr0uN8aeKYAOtPO2GG6ZZkakNx2tpfLm8exNmcpu1bmybYn8/3lAVmol838xnQ/IiFa4X5k5B2LQUfO/W9JGUEOL59fRocZP7iR75Z9I6N8s2Zou3oUALG6naakvvxoUPEXesk6OGD0fEq9+iwfMKjxajk53xAHse1dSG+FWmpUtyvsuryCH5wxZZj+4MXunnH73tz/miUCqU0Tvjumr3gDb5QbR1rwLR+5HXFkFkEU3RCw3KvYs585NJAIjjbMrn+alrD8KLB96AQvjH/qnv0u23SCfvKciPqJm2GJpA7wvywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3/A4KEOXfVSek8ADEi9m5U6F/50lsXxwu2CpX9/SN0=;
 b=CKvCxa/l6lyYoW9hQQMKNL0w0UTOpObie3NcF6Wsv/YM09kEzOCTmONEkyf/AEkOHIptBgQBOaZaWRGv4PDsj6dmnvEEC//QUg/5elakmRhrTvoYjfgDV342hFi5vzBPdpEs3eh941Lng4p9kh6JK7RYKXeSt8+N9HgCK7qA/7gyGHG85oSnOoXGh3F05gsQCVSxW+9NdYv0VXm4oCo81kmJHDKdyZF/lruu/lM8lFxvS5970UAyAFgAasxhZjMFnEBZNh4VJkuFeT+86Bv9hnNUNwAC7haS/00cwd+QrWq63nC0GDGgbbD+nWNIE2cLsUsjqiswaVaDSmYLVtoKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3/A4KEOXfVSek8ADEi9m5U6F/50lsXxwu2CpX9/SN0=;
 b=MLW3hK5VVj3j5IgwTt1JH0fnWlN4/Uxweew/iuapUTKMUh8K+rtht6kq6DGttzESl+ZczYS+KzQEopWUJGEblDm2vczt2XEkmV0J2tN2A6ysXKk3L1gINsHkYIntOHhz/q3aDOkoMyz6HP01rZJe0VCZIWxcW3ueFhJnNpn2PmQ=
Received: from MW4PR04CA0193.namprd04.prod.outlook.com (2603:10b6:303:86::18)
 by CH2PR12MB3783.namprd12.prod.outlook.com (2603:10b6:610:2f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 09:56:43 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::76) by MW4PR04CA0193.outlook.office365.com
 (2603:10b6:303:86::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Tue, 9 Aug 2022 09:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:56:42 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:56:38 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/ttm: Fix dummy res NULL ptr deref bug
Date: Tue, 9 Aug 2022 02:56:23 -0700
Message-ID: <20220809095623.3569-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87f2479b-80f4-44da-d6c9-08da79ed764c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8RFKtPA2jIIIR6dOLYrrwsOhhAmpZ+/n+BqYpNao8AWZsEicWYPcfcmiKLPhQOjZVdzExtiA+3d80kskbvyM1rhjRVaseMzQdgwloFo+0BRe5032TvlSzS3PF1M8je6xpKPOc4RiTyn0mL2jYdjXBDQEOuRfx3EW0SbzAYGELF/y9kfA9iAvEB0PRqfANp1Tx979i+rRoRr4dMLmzOyK0gRMMglszAnNbLPulOdj+CX20R8QCYyGYRdG/2p1kEzCaJ1oKk32gpg6bDZ5SLL6+PQiFPLL4mCpm0LB/KszV4pdprk2iCtnTBnIjHumFZ5b6tdL/ZjryYiiHrZw4Y4ff8tV2n3ZQOON+X5/tWGOWhxjI4/mWmGFDJkJWC7T2N9xiOxXr1C1D0UKVytHJQj9UoXFYYHmVgvi+BJeb/lSzC3F7Of3oUvgKmD/sYqP7O4QkSdtlsVrbREr+AbKCSIM9Gb7b8zyJR37ubKgnvRUcJO+IW+xesHstTpRSfb9dsXQ747/6fI04FsAv6UiWi/hXe840tirrJf2Nb9+s1EP9VJs9U9Yg6h5Zbj7PFf5hGH0Ypf+2tkKquqjOH9Cin7VvmZD5DLjI3bLkjINw7G4Ga6jiQdjdQDLov7yZMnmAYOLO8BLsWHI+DscLvOGz4ZCedPe2NsqF+Q376+oYpeIt+KX6KJHSFJy3eklfsaienP9t3tYM2Y8k1xMKGRxhnOh/FDo/KkN4rftz+KPguhJi6Z+ujTLbGdS8X/s5uE5BCgeXS85sSzmhl0tdyTez+KVwGP+ZDuQIainC6L+5hceT4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(40470700004)(81166007)(356005)(82740400003)(186003)(2616005)(966005)(426003)(336012)(1076003)(16526019)(26005)(66574015)(47076005)(6666004)(41300700001)(7696005)(70586007)(110136005)(82310400005)(36756003)(40480700001)(478600001)(86362001)(8676002)(4326008)(40460700003)(316002)(5660300002)(70206006)(54906003)(36860700001)(2906002)(83380400001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:56:42.3116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f2479b-80f4-44da-d6c9-08da79ed764c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3783
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com,
 kernel test robot <oliver.sang@intel.com>, christian.koenig@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check the bo->resource value before accessing the resource
mem_type.

v2: Fix commit description unwrapped warning

<log snip>
[   40.191227][  T184] general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
[   40.192995][  T184] KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
[   40.194411][  T184] CPU: 1 PID: 184 Comm: systemd-udevd Not tainted 5.19.0-rc4-00721-gb297c22b7070 #1
[   40.196063][  T184] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
[   40.199605][  T184] RIP: 0010:ttm_bo_validate+0x1b3/0x240 [ttm]
[   40.200754][  T184] Code: e8 72 c5 ff ff 83 f8 b8 74 d4 85 c0 75 54 49 8b 9e 58 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7b 10 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 04 3c 03 7e 44 8b 53 10 31 c0 85 d2 0f 85 58
[   40.203685][  T184] RSP: 0018:ffffc900006df0c8 EFLAGS: 00010202
[   40.204630][  T184] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff1102f4bb71b
[   40.205864][  T184] RDX: 0000000000000002 RSI: ffffc900006df208 RDI: 0000000000000010
[   40.207102][  T184] RBP: 1ffff920000dbe1a R08: ffffc900006df208 R09: 0000000000000000
[   40.208394][  T184] R10: ffff88817a5f0000 R11: 0000000000000001 R12: ffffc900006df110
[   40.209692][  T184] R13: ffffc900006df0f0 R14: ffff88817a5db800 R15: ffffc900006df208
[   40.210862][  T184] FS:  00007f6b1d16e8c0(0000) GS:ffff88839d700000(0000) knlGS:0000000000000000
[   40.212250][  T184] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   40.213275][  T184] CR2: 000055a1001d4ff0 CR3: 00000001700f4000 CR4: 00000000000006e0
[   40.214469][  T184] Call Trace:
[   40.214974][  T184]  <TASK>
[   40.215438][  T184]  ? ttm_bo_bounce_temp_buffer+0x140/0x140 [ttm]
[   40.216572][  T184]  ? mutex_spin_on_owner+0x240/0x240
[   40.217456][  T184]  ? drm_vma_offset_add+0xaa/0x100 [drm]
[   40.218457][  T184]  ttm_bo_init_reserved+0x3d6/0x540 [ttm]
[   40.219410][  T184]  ? shmem_get_inode+0x744/0x980
[   40.220231][  T184]  ttm_bo_init_validate+0xb1/0x200 [ttm]
[   40.221172][  T184]  ? bo_driver_evict_flags+0x340/0x340 [drm_vram_helper]
[   40.222530][  T184]  ? ttm_bo_init_reserved+0x540/0x540 [ttm]
[   40.223643][  T184]  ? __do_sys_finit_module+0x11a/0x1c0
[   40.224654][  T184]  ? __shmem_file_setup+0x102/0x280
[   40.234764][  T184]  drm_gem_vram_create+0x305/0x480 [drm_vram_helper]
[   40.235766][  T184]  ? bo_driver_evict_flags+0x340/0x340 [drm_vram_helper]
[   40.236846][  T184]  ? __kasan_slab_free+0x108/0x180
[   40.237650][  T184]  drm_gem_vram_fill_create_dumb+0x134/0x340 [drm_vram_helper]
[   40.238864][  T184]  ? local_pci_probe+0xdf/0x180
[   40.239674][  T184]  ? drmm_vram_helper_init+0x400/0x400 [drm_vram_helper]
[   40.240826][  T184]  drm_client_framebuffer_create+0x19c/0x400 [drm]
[   40.241955][  T184]  ? drm_client_buffer_delete+0x200/0x200 [drm]
[   40.243001][  T184]  ? drm_client_pick_crtcs+0x554/0xb80 [drm]
[   40.244030][  T184]  drm_fb_helper_generic_probe+0x23f/0x940 [drm_kms_helper]
[   40.245226][  T184]  ? __cond_resched+0x1c/0xc0
[   40.245987][  T184]  ? drm_fb_helper_memory_range_to_clip+0x180/0x180 [drm_kms_helper]
[   40.247316][  T184]  ? mutex_unlock+0x80/0x100
[   40.248005][  T184]  ? __mutex_unlock_slowpath+0x2c0/0x2c0
[   40.249083][  T184]  drm_fb_helper_single_fb_probe+0x907/0xf00 [drm_kms_helper]
[   40.250314][  T184]  ? drm_fb_helper_check_var+0x1180/0x1180 [drm_kms_helper]
[   40.251540][  T184]  ? __cond_resched+0x1c/0xc0
[   40.252321][  T184]  ? mutex_lock+0x9f/0x100
[   40.253062][  T184]  __drm_fb_helper_initial_config_and_unlock+0xb9/0x2c0 [drm_kms_helper]
[   40.254394][  T184]  drm_fbdev_client_hotplug+0x56f/0x840 [drm_kms_helper]
[   40.255477][  T184]  drm_fbdev_generic_setup+0x165/0x3c0 [drm_kms_helper]
[   40.256607][  T184]  bochs_pci_probe+0x6b7/0x900 [bochs]
[   40.257515][  T184]  ? _raw_spin_lock_irqsave+0x87/0x100
[   40.258312][  T184]  ? bochs_hw_init+0x480/0x480 [bochs]
[   40.259244][  T184]  ? bochs_hw_init+0x480/0x480 [bochs]
[   40.260186][  T184]  local_pci_probe+0xdf/0x180
[   40.260928][  T184]  pci_call_probe+0x15f/0x500
[   40.265798][  T184]  ? _raw_spin_lock+0x81/0x100
[   40.266508][  T184]  ? pci_pm_suspend_noirq+0x980/0x980
[   40.267322][  T184]  ? pci_assign_irq+0x81/0x280
[   40.268096][  T184]  ? pci_match_device+0x351/0x6c0
[   40.268883][  T184]  ? kernfs_put+0x18/0x40
[   40.269611][  T184]  pci_device_probe+0xee/0x240
[   40.270352][  T184]  really_probe+0x435/0xa80
[   40.271021][  T184]  __driver_probe_device+0x2ab/0x480
[   40.271828][  T184]  driver_probe_device+0x49/0x140
[   40.272627][  T184]  __driver_attach+0x1bd/0x4c0
[   40.273372][  T184]  ? __device_attach_driver+0x240/0x240
[   40.274273][  T184]  bus_for_each_dev+0x11e/0x1c0
[   40.275080][  T184]  ? subsys_dev_iter_exit+0x40/0x40
[   40.275951][  T184]  ? klist_add_tail+0x132/0x280
[   40.276767][  T184]  bus_add_driver+0x39b/0x580
[   40.277574][  T184]  driver_register+0x20f/0x3c0
[   40.278281][  T184]  ? 0xffffffffc04a2000
[   40.278894][  T184]  do_one_initcall+0x8a/0x300
[   40.279642][  T184]  ? trace_event_raw_event_initcall_level+0x1c0/0x1c0
[   40.280707][  T184]  ? kasan_unpoison+0x23/0x80
[   40.281479][  T184]  ? kasan_unpoison+0x23/0x80
[   40.282197][  T184]  do_init_module+0x190/0x640
[   40.282926][  T184]  load_module+0x221b/0x2780
[   40.283611][  T184]  ? layout_and_allocate+0x5c0/0x5c0
[   40.284401][  T184]  ? kernel_read_file+0x286/0x6c0
[   40.285216][  T184]  ? __x64_sys_fspick+0x2c0/0x2c0
[   40.286043][  T184]  ? mmap_region+0x4e7/0x1300
[   40.286832][  T184]  ? __do_sys_finit_module+0x11a/0x1c0
[   40.287743][  T184]  __do_sys_finit_module+0x11a/0x1c0
[   40.288636][  T184]  ? __ia32_sys_init_module+0xc0/0xc0
[   40.289557][  T184]  ? __seccomp_filter+0x15e/0xc80
[   40.290341][  T184]  ? vm_mmap_pgoff+0x185/0x240
[   40.291060][  T184]  do_syscall_64+0x3b/0xc0
[   40.291763][  T184]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[   40.292678][  T184] RIP: 0033:0x7f6b1d6279b9
[   40.293438][  T184] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
[   40.296302][  T184] RSP: 002b:00007ffe7f51b798 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   40.297633][  T184] RAX: ffffffffffffffda RBX: 00005642dcca2880 RCX: 00007f6b1d6279b9
[   40.298890][  T184] RDX: 0000000000000000 RSI: 00007f6b1d7b2e2d RDI: 0000000000000016
[   40.300199][  T184] RBP: 0000000000020000 R08: 0000000000000000 R09: 00005642dccd5530
[   40.301547][  T184] R10: 0000000000000016 R11: 0000000000000246 R12: 00007f6b1d7b2e2d
[   40.302698][  T184] R13: 0000000000000000 R14: 00005642dcca4230 R15: 00005642dcca2880

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220726162205.2778-1-Arunpravin.PaneerSelvam@amd.com
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..590110fdf59c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -912,7 +912,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * We might need to add a TTM.
 	 */
-	if (bo->resource->mem_type == TTM_PL_SYSTEM) {
+	if (!bo->resource || bo->resource->mem_type == TTM_PL_SYSTEM) {
 		ret = ttm_tt_create(bo, true);
 		if (ret)
 			return ret;

base-commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1
-- 
2.25.1

