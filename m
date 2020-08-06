Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95D23DB59
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 17:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69876E8D0;
	Thu,  6 Aug 2020 15:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F126E8D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 15:28:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUOQUE2x9YHvIhzkifGWHz4VmgYWvLH0TR/EFlI7a3pfX6uPP9hp3fworqaMb6hc8JNDUr5u0zybEH7MfT17UiKVbTi7di+ODkPaamOnyFeml4VGd13JTZmgiiueiPu8tiXjvAzjVyaxn/6RbXBwPMe87DsVDAnfh057K1HQD7lQNmX1ZqbAhibD4F4clkRvIZrSAQpfceuDP5sW+84NpQKNaMd+mBuahJz1Po5i2TD4XveLly0XhhEc7u4mGhkX5nC8azet2nvzcYYNDTcDPephNugOG39cSnGZg1yz3TuA9lJQE/RiXvZeBoWVlzQpfx8NoBbgdstiQ0qqm2K6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6e8i7+A2xHRgfm1akwAgCXt3yuITXAOnYcxLXYlrd8=;
 b=Xyhfaa+6rEChOieeQ95bPqzLp98eMuzHmP4Vl15+S2AqevRw9BhSnCQGPF3HqlPmHtywqf+dH5JVZFZVnd1L3nQ7FFio7bvfUQtSqUdfVHcpBaw9usvmXmJJoZNLAI2myUECoVH8jqg34pVfEOLgQVq7b01VDz7Pdvstz5KAEEAchHAMwdrbL5tZi4yl4L2hzwG6MOaJBCXOVwkLx+gayQ0ak+D/05gSYmBPJ/QePwq6/Lr15taU0ReQ4ef9RPYl42Jaxse1qdE+aJgJbZxaM7ou0seoWWk6sZwc7cxE3HcLhfSeu2VHi8kx/pULJJYgIoZ3Jb/XO6dwFHG5jd8SXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6e8i7+A2xHRgfm1akwAgCXt3yuITXAOnYcxLXYlrd8=;
 b=1V5YlvXZiiwprRv7+47W2j0l0Lli3aGsFBWMm9jQmjiUVqbfc8zkfyL3i/TEldYzW2QklNNK85LNJyUE4Non8JQCUsNNM4AX+zqFwK+wEjg9NsJsqM6Ds6ku8KpFl5DVlCQagF07o84X0dreueeHqkUkTHW/O5cXYUPdNne1W7M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2482.namprd12.prod.outlook.com (2603:10b6:207:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.22; Thu, 6 Aug
 2020 15:28:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Thu, 6 Aug 2020
 15:28:15 +0000
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
Date: Thu, 6 Aug 2020 17:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0075.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Thu, 6 Aug 2020 15:28:14 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f384a03a-5cb2-4472-dce1-08d83a1d566c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2482:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2482615AFF917825E15FF7A783480@BL0PR12MB2482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQdeaJ5Q2vPTi+t9syfPNQ3guqU6YGcYgTp8YlF2w7sfwnRx3LDCq8B98uOkryw0I3cXc7w1cHBXRDIg3tLbAtdlTJ647i56PHFt+6avB56mEeQq5hKJJd4r2GhIEx7qRKILDYwSHJt2pyvnt9iVQXJxU7ALIMosh6u7otKJppfoWnHIExDm+VdNOG2PUSUvABA3ummAJSE6rx9kHo76IZijdLmPdi/Sg2WlLOlcWm4xH9CpYJkbpSdxWPD9B7605CnUiHeAXK/RfEm97n4dVCB7tqS32ZpH+P32okmCSxguoS5bmYzwgYMpTH8RQQGf52WCdUa1QAIU/WIwlZC5vCHQz5lNyJ14nmaw674T7EaDX22mqDlH397OITljXcqT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(31696002)(8676002)(36756003)(66556008)(31686004)(66946007)(66476007)(110136005)(478600001)(54906003)(8936002)(4326008)(316002)(45080400002)(83380400001)(6666004)(5660300002)(2906002)(186003)(86362001)(6486002)(2616005)(52116002)(16526019)(30864003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: k43d0yczhUu/sbwKIf5Xte744FTXnxlZGhLdEnJJcVMKRowheiXsMUKJRspwoC55XJvB3RiZfKfGgaMTZsuvRshupH1Ff4x2VaQ5Xafn0Old9rlwtug22fY2hA2UQ2eGGW0ypiGa2Flu2OiHBxaPhF9VtyCW9laf4IcZZTJuWBleAJzmsM0tU7a33xhkr8FbIPPHOBzHigPiJbN26E/cqx9AMTPP9ZmQlM8i7iFocBZmVaQcRScVq669mC9+MGkfJm3JdA6fKd8SULsqEKEifr8Cn3vjKwgGvk/8qJYloWBEJwiH/HSa1xK7Z9YXG5YLa0emsAsXrP8ya3yYaAElzUjj/lQcnPAmuZlbm1vBUagv+4a3GS6KWJAV3TarxP0DwcgKhxyR6u+8RxOs8kaBmT5Cl6viMwiTyZxqPmHBHvsOzBMrf/7Krz57vj8cqwqU5eAtE+R7NBnLHjEi+xKll8Rkprd3cBrSl5Y1wXAxNDSZR3GkO6LCTQb+O0FRFfcTP+U1LR0UU4uaI+G/1QB2oEB6E3vhv+dq369weqKTMnAaNf5myGmXWqaPS7ww+rVtOM6x6foo5Auos/MmPnrSQmr/rsSEGdCSSQCcXw5hsZMWHjGGMw4PBpts+X5UmTr/qWMCGnN+Z1icM/2KDg8u07XrHjO6DZXRw/MB0yahLlty3CFZXERDSKz2s7U7OtA6m8V22FxHalfemMtInHn/gA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f384a03a-5cb2-4472-dce1-08d83a1d566c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 15:28:15.5290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/ilak4CJSC/6zmiyt9URS3jxNdgkIdmn8YY7Nh/uBWtXMVWP/ISPBnsz71xigbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2482
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My best guess is that you are facing two separate bugs here.

Crash #1 is somehow related to CRTCs and might even be cause by the 
atomic-helper change you noted below.

Crash #2 is caused because vmw_bo_create_and_populate() tries to 
manually populate a BO object instead of relying on TTM to do it when 
necessary. This indeed doesn't work any more because of "drm/ttm: make 
TT creation purely optional v3".

Question is why vmwgfx is doing this?

Regards,
Christian.

Am 06.08.20 um 16:55 schrieb Tetsuo Handa:
> Hello.
>
> Commit 2ddef17678bc2ea1 ("drm/ttm: make TT creation purely optional v3") broke vmwgfx .
>
> At first I suspected it is "drm/atomic-helper: reset vblank on crtc reset" or around that,
> but bisection said it is not. I have no idea what is going on. Please have a look.
>
> --- Crash pattern 1 ---
>
> [    0.990745][    T1] Linux agpgart interface v0.103
> [    0.991945][    T1] [drm] DMA map mode: Caching DMA mappings.
> [    0.993009][    T1] [drm] Capabilities:
> [    0.993972][    T1] [drm]   Rect copy.
> [    0.994011][    T1] [drm]   Cursor.
> [    0.994049][    T1] [drm]   Cursor bypass.
> [    0.994984][    T1] [drm]   Cursor bypass 2.
> [    0.995972][    T1] [drm]   8bit emulation.
> [    0.997057][    T1] [drm]   Alpha cursor.
> [    0.997906][    T1] [drm]   3D.
> [    0.998947][    T1] [drm]   Extended Fifo.
> [    0.999972][    T1] [drm]   Multimon.
> [    1.000011][    T1] [drm]   Pitchlock.
> [    1.000932][    T1] [drm]   Irq mask.
> [    1.001972][    T1] [drm]   Display Topology.
> [    1.002906][    T1] [drm]   GMR.
> [    1.003906][    T1] [drm]   Traces.
> [    1.004975][    T1] [drm]   GMR2.
> [    1.005987][    T1] [drm]   Screen Object 2.
> [    1.006983][    T1] [drm]   Command Buffers.
> [    1.007981][    T1] [drm]   Command Buffers 2.
> [    1.008020][    T1] [drm]   Guest Backed Resources.
> [    1.008982][    T1] [drm]   DX Features.
> [    1.009965][    T1] [drm]   HP Command Queue.
> [    1.010982][    T1] [drm] Capabilities2:
> [    1.011982][    T1] [drm]   Grow oTable.
> [    1.012020][    T1] [drm]   IntraSurface copy.
> [    1.012983][    T1] [drm] Max GMR ids is 64
> [    1.013975][    T1] [drm] Max number of GMR pages is 65536
> [    1.015968][    T1] [drm] Max dedicated hypervisor surface memory is 0 kiB
> [    1.017983][    T1] [drm] Maximum display memory size is 262144 kiB
> [    1.018982][    T1] [drm] VRAM at 0xe8000000 size is 4096 kiB
> [    1.019972][    T1] [drm] MMIO at 0xfe000000 size is 256 kiB
> [    1.021466][    T1] [TTM] Zone  kernel: Available graphics memory: 1880776 KiB
> [    1.022965][    T1] [TTM] Initializing pool allocator
> [    1.023975][    T1] [TTM] Initializing DMA pool allocator
> [    1.026297][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000190
> [    1.027257][    T1] #PF: supervisor read access in kernel mode
> [    1.027257][    T1] #PF: error_code(0x0000) - not-present page
> [    1.027257][    T1] PGD 0 P4D 0
> [    1.027257][    T1] Oops: 0000 [#1] SMP
> [    1.027257][    T1] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc2+ #779
> [    1.027257][    T1] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
> [    1.027257][    T1] RIP: 0010:drm_dev_has_vblank+0x0/0x10
> [    1.027257][    T1] Code: 84 2f ff ff ff e9 10 ff ff ff 89 f1 44 89 ff 45 31 d2 d3 e7 89 f9 e9 f7 fe ff ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <8b> 87 90 01 00 00 85 c0 0f 95 c0 c3 0f 1f 40 00 8b 87 90 00 00 00
> [    1.027257][    T1] RSP: 0000:ffffaf8280013b50 EFLAGS: 00010286
> [    1.027257][    T1] RAX: ffff9149f6fe1a00 RBX: ffff9149f8812000 RCX: 0000000000000000
> [    1.027257][    T1] RDX: 0000000000000000 RSI: ffff9149f6fe1a00 RDI: 0000000000000000
> [    1.027257][    T1] RBP: ffffaf8280013b68 R08: 0000000000000025 R09: 0000000000000000
> [    1.027257][    T1] R10: ffff9149f6fe1a00 R11: ffff9149f6e3ac7a R12: ffff9149f6fe1a00
> [    1.027257][    T1] R13: ffff9149f6ea9000 R14: ffff9149f8810000 R15: ffff9149f8812000
> [    1.027257][    T1] FS:  0000000000000000(0000) GS:ffff9149faec0000(0000) knlGS:0000000000000000
> [    1.027257][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.027257][    T1] CR2: 0000000000000190 CR3: 0000000081009001 CR4: 00000000001606e0
> [    1.027257][    T1] Call Trace:
> [    1.027257][    T1]  ? __drm_atomic_helper_crtc_reset+0x1e/0x50
> [    1.027257][    T1]  vmw_du_crtc_reset+0x46/0x60
> [    1.027257][    T1]  vmw_kms_stdu_init_display+0x216/0x380
> [    1.027257][    T1]  vmw_kms_init+0x6d/0xc0
> [    1.027257][    T1]  vmw_driver_load.cold.21+0xba2/0xdf8
> [    1.027257][    T1]  vmw_probe+0x5f/0xb0
> [    1.027257][    T1]  pci_device_probe+0xcf/0x140
> [    1.027257][    T1]  really_probe+0x1b3/0x3d0
> [    1.027257][    T1]  ? rdinit_setup+0x27/0x27
> [    1.027257][    T1]  driver_probe_device+0xe3/0x150
> [    1.027257][    T1]  device_driver_attach+0x53/0x60
> [    1.027257][    T1]  __driver_attach+0x87/0x140
> [    1.027257][    T1]  ? device_driver_attach+0x60/0x60
> [    1.027257][    T1]  ? device_driver_attach+0x60/0x60
> [    1.027257][    T1]  bus_for_each_dev+0x6e/0xb0
> [    1.027257][    T1]  ? _cond_resched+0x14/0x30
> [    1.027257][    T1]  driver_attach+0x19/0x20
> [    1.027257][    T1]  bus_add_driver+0x14a/0x1f0
> [    1.027257][    T1]  driver_register+0x6b/0xc0
> [    1.027257][    T1]  __pci_register_driver+0x4f/0x60
> [    1.027257][    T1]  vmwgfx_init+0x28/0x3f
> [    1.027257][    T1]  ? ttm_init+0x5e/0x5e
> [    1.027257][    T1]  do_one_initcall+0x43/0x1a0
> [    1.027257][    T1]  kernel_init_freeable+0x14e/0x1b9
> [    1.027257][    T1]  ? rest_init+0x9b/0x9b
> [    1.027257][    T1]  kernel_init+0x9/0xf5
> [    1.027257][    T1]  ret_from_fork+0x1f/0x30
> [    1.027257][    T1] Modules linked in:
> [    1.027257][    T1] CR2: 0000000000000190
> [    1.027257][    T1] ---[ end trace 8db9188472e5abda ]---
> [    1.027257][    T1] RIP: 0010:drm_dev_has_vblank+0x0/0x10
> [    1.027257][    T1] Code: 84 2f ff ff ff e9 10 ff ff ff 89 f1 44 89 ff 45 31 d2 d3 e7 89 f9 e9 f7 fe ff ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <8b> 87 90 01 00 00 85 c0 0f 95 c0 c3 0f 1f 40 00 8b 87 90 00 00 00
> [    1.027257][    T1] RSP: 0000:ffffaf8280013b50 EFLAGS: 00010286
> [    1.027257][    T1] RAX: ffff9149f6fe1a00 RBX: ffff9149f8812000 RCX: 0000000000000000
> [    1.027257][    T1] RDX: 0000000000000000 RSI: ffff9149f6fe1a00 RDI: 0000000000000000
> [    1.027257][    T1] RBP: ffffaf8280013b68 R08: 0000000000000025 R09: 0000000000000000
> [    1.027257][    T1] R10: ffff9149f6fe1a00 R11: ffff9149f6e3ac7a R12: ffff9149f6fe1a00
> [    1.027257][    T1] R13: ffff9149f6ea9000 R14: ffff9149f8810000 R15: ffff9149f8812000
> [    1.027257][    T1] FS:  0000000000000000(0000) GS:ffff9149faec0000(0000) knlGS:0000000000000000
> [    1.027257][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.027257][    T1] CR2: 0000000000000190 CR3: 0000000081009001 CR4: 00000000001606e0
> [    1.027257][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
> [    1.027257][    T1] Kernel Offset: 0xf000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
>
> --- Crash pattern 2 ---
>
> [    1.458665][    T1] Linux agpgart interface v0.103
> [    1.459068][    T1] [drm] DMA map mode: Caching DMA mappings.
> [    1.460076][    T1] [drm] Capabilities:
> [    1.461045][    T1] [drm]   Rect copy.
> [    1.461065][    T1] [drm]   Cursor.
> [    1.462056][    T1] [drm]   Cursor bypass.
> [    1.463101][    T1] [drm]   Cursor bypass 2.
> [    1.464041][    T1] [drm]   8bit emulation.
> [    1.465012][    T1] [drm]   Alpha cursor.
> [    1.465032][    T1] [drm]   3D.
> [    1.466037][    T1] [drm]   Extended Fifo.
> [    1.467092][    T1] [drm]   Multimon.
> [    1.468000][    T1] [drm]   Pitchlock.
> [    1.468053][    T1] [drm]   Irq mask.
> [    1.469037][    T1] [drm]   Display Topology.
> [    1.470065][    T1] [drm]   GMR.
> [    1.470085][    T1] [drm]   Traces.
> [    1.471042][    T1] [drm]   GMR2.
> [    1.471062][    T1] [drm]   Screen Object 2.
> [    1.472038][    T1] [drm]   Command Buffers.
> [    1.473048][    T1] [drm]   Command Buffers 2.
> [    1.474045][    T1] [drm]   Guest Backed Resources.
> [    1.475055][    T1] [drm]   DX Features.
> [    1.476046][    T1] [drm]   HP Command Queue.
> [    1.477045][    T1] [drm] Capabilities2:
> [    1.478043][    T1] [drm]   Grow oTable.
> [    1.479044][    T1] [drm]   IntraSurface copy.
> [    1.480055][    T1] [drm] Max GMR ids is 64
> [    1.481039][    T1] [drm] Max number of GMR pages is 65536
> [    1.482045][    T1] [drm] Max dedicated hypervisor surface memory is 0 kiB
> [    1.483047][    T1] [drm] Maximum display memory size is 262144 kiB
> [    1.484064][    T1] [drm] VRAM at 0xe8000000 size is 4096 kiB
> [    1.485042][    T1] [drm] MMIO at 0xfe000000 size is 256 kiB
> [    1.486389][    T1] [TTM] Zone  kernel: Available graphics memory: 1880780 KiB
> [    1.488043][    T1] [TTM] Initializing pool allocator
> [    1.489054][    T1] [TTM] Initializing DMA pool allocator
> [    1.490057][    T1] [drm] Screen Target Display device initialized
> [    1.491077][    T1] [drm] width 800
> [    1.491999][    T1] [drm] height 480
> [    1.492061][    T1] [drm] bpp 32
> [    1.494078][    T1] [drm] Fifo max 0x00040000 min 0x00001000 cap 0x0000077f
> [    1.495081][    T1] BUG: kernel NULL pointer dereference, address: 000000000000003c
> [    1.496056][    T1] #PF: supervisor read access in kernel mode
> [    1.496056][    T1] #PF: error_code(0x0000) - not-present page
> [    1.496056][    T1] PGD 0 P4D 0
> [    1.496056][    T1] Oops: 0000 [#1] SMP
> [    1.496056][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc2+ #783
> [    1.496056][    T1] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
> [    1.496056][    T1] RIP: 0010:vmw_ttm_populate+0x2/0xa0
> [    1.496056][    T1] Code: 0f 1f 84 00 00 00 00 00 55 48 8b 86 c8 00 00 00 48 8b 80 80 00 00 00 48 89 e5 48 8b 30 e8 76 5f 00 00 5d c3 0f 1f 40 00 31 c0 <83> 7f 3c 02 75 35 55 48 89 e5 41 56 41 55 41 54 49 89 f4 53 48 89
> [    1.496056][    T1] RSP: 0000:ffffb0f880013b10 EFLAGS: 00010246
> [    1.496056][    T1] RAX: 0000000000000000 RBX: ffff8a69399c5000 RCX: ffff8a693a4c8000
> [    1.496056][    T1] RDX: 0000000000000000 RSI: ffffb0f880013b20 RDI: 0000000000000000
> [    1.496056][    T1] RBP: ffffb0f880013b70 R08: ffff8a69399c5000 R09: ffffffffaac72af4
> [    1.496056][    T1] R10: ffffffffab044e20 R11: ffff8a693683a178 R12: ffff8a69399c9800
> [    1.496056][    T1] R13: ffff8a6936815bc0 R14: ffff8a69399c5618 R15: 0000000000000000
> [    1.496056][    T1] FS:  0000000000000000(0000) GS:ffff8a693ae00000(0000) knlGS:0000000000000000
> [    1.496056][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.496056][    T1] CR2: 000000000000003c CR3: 0000000108009001 CR4: 00000000001606f0
> [    1.496056][    T1] Call Trace:
> [    1.496056][    T1]  ? vmw_otables_setup+0x120/0x330
> [    1.496056][    T1]  vmw_request_device_late+0x42/0x80
> [    1.496056][    T1]  vmw_request_device+0x67/0x260
> [    1.496056][    T1]  vmw_driver_load.cold.21+0xcb1/0xdf8
> [    1.496056][    T1]  vmw_probe+0x5f/0xb0
> [    1.496056][    T1]  pci_device_probe+0xcf/0x140
> [    1.496056][    T1]  really_probe+0x1b3/0x3d0
> [    1.496056][    T1]  ? rdinit_setup+0x27/0x27
> [    1.496056][    T1]  driver_probe_device+0xe3/0x150
> [    1.496056][    T1]  device_driver_attach+0x53/0x60
> [    1.496056][    T1]  __driver_attach+0x87/0x140
> [    1.496056][    T1]  ? device_driver_attach+0x60/0x60
> [    1.496056][    T1]  ? device_driver_attach+0x60/0x60
> [    1.496056][    T1]  bus_for_each_dev+0x6e/0xb0
> [    1.496056][    T1]  ? _cond_resched+0x14/0x30
> [    1.496056][    T1]  driver_attach+0x19/0x20
> [    1.496056][    T1]  bus_add_driver+0x14a/0x1f0
> [    1.496056][    T1]  driver_register+0x6b/0xc0
> [    1.496056][    T1]  __pci_register_driver+0x4f/0x60
> [    1.496056][    T1]  vmwgfx_init+0x28/0x3f
> [    1.496056][    T1]  ? ttm_init+0x5e/0x5e
> [    1.496056][    T1]  do_one_initcall+0x43/0x1a0
> [    1.496056][    T1]  kernel_init_freeable+0x14e/0x1b9
> [    1.496056][    T1]  ? rest_init+0x9b/0x9b
> [    1.496056][    T1]  kernel_init+0x9/0xf5
> [    1.496056][    T1]  ret_from_fork+0x1f/0x30
> [    1.496056][    T1] Modules linked in:
> [    1.496056][    T1] CR2: 000000000000003c
> [    1.496056][    T1] ---[ end trace 9f43ab7728d116d5 ]---
> [    1.496056][    T1] RIP: 0010:vmw_ttm_populate+0x2/0xa0
> [    1.496056][    T1] Code: 0f 1f 84 00 00 00 00 00 55 48 8b 86 c8 00 00 00 48 8b 80 80 00 00 00 48 89 e5 48 8b 30 e8 76 5f 00 00 5d c3 0f 1f 40 00 31 c0 <83> 7f 3c 02 75 35 55 48 89 e5 41 56 41 55 41 54 49 89 f4 53 48 89
> [    1.496056][    T1] RSP: 0000:ffffb0f880013b10 EFLAGS: 00010246
> [    1.496056][    T1] RAX: 0000000000000000 RBX: ffff8a69399c5000 RCX: ffff8a693a4c8000
> [    1.496056][    T1] RDX: 0000000000000000 RSI: ffffb0f880013b20 RDI: 0000000000000000
> [    1.496056][    T1] RBP: ffffb0f880013b70 R08: ffff8a69399c5000 R09: ffffffffaac72af4
> [    1.496056][    T1] R10: ffffffffab044e20 R11: ffff8a693683a178 R12: ffff8a69399c9800
> [    1.496056][    T1] R13: ffff8a6936815bc0 R14: ffff8a69399c5618 R15: 0000000000000000
> [    1.496056][    T1] FS:  0000000000000000(0000) GS:ffff8a693ae00000(0000) knlGS:0000000000000000
> [    1.496056][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.496056][    T1] CR2: 000000000000003c CR3: 0000000108009001 CR4: 00000000001606f0
> [    1.496056][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
> [    1.496056][    T1] Kernel Offset: 0x29000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
>
> --- Expected result ---
>
> [    1.282746][    T1] Linux agpgart interface v0.103
> [    1.284885][    T1] [drm] DMA map mode: Caching DMA mappings.
> [    1.287860][    T1] [drm] Capabilities:
> [    1.289812][    T1] [drm]   Rect copy.
> [    1.290785][    T1] [drm]   Cursor.
> [    1.291784][    T1] [drm]   Cursor bypass.
> [    1.292784][    T1] [drm]   Cursor bypass 2.
> [    1.293808][    T1] [drm]   8bit emulation.
> [    1.294785][    T1] [drm]   Alpha cursor.
> [    1.295778][    T1] [drm]   3D.
> [    1.296775][    T1] [drm]   Extended Fifo.
> [    1.297775][    T1] [drm]   Multimon.
> [    1.298775][    T1] [drm]   Pitchlock.
> [    1.299775][    T1] [drm]   Irq mask.
> [    1.300775][    T1] [drm]   Display Topology.
> [    1.301776][    T1] [drm]   GMR.
> [    1.302795][    T1] [drm]   Traces.
> [    1.303798][    T1] [drm]   GMR2.
> [    1.304776][    T1] [drm]   Screen Object 2.
> [    1.305776][    T1] [drm]   Command Buffers.
> [    1.306776][    T1] [drm]   Command Buffers 2.
> [    1.307776][    T1] [drm]   Guest Backed Resources.
> [    1.308775][    T1] [drm]   DX Features.
> [    1.309797][    T1] [drm]   HP Command Queue.
> [    1.310776][    T1] [drm] Capabilities2:
> [    1.311776][    T1] [drm]   Grow oTable.
> [    1.312775][    T1] [drm]   IntraSurface copy.
> [    1.313806][    T1] [drm] Max GMR ids is 64
> [    1.314780][    T1] [drm] Max number of GMR pages is 65536
> [    1.315777][    T1] [drm] Max dedicated hypervisor surface memory is 0 kiB
> [    1.316776][    T1] [drm] Maximum display memory size is 262144 kiB
> [    1.317777][    T1] [drm] VRAM at 0xe8000000 size is 4096 kiB
> [    1.318776][    T1] [drm] MMIO at 0xfe000000 size is 256 kiB
> [    1.320259][    T1] [TTM] Zone  kernel: Available graphics memory: 1880776 KiB
> [    1.320800][    T1] [TTM] Initializing pool allocator
> [    1.321780][    T1] [TTM] Initializing DMA pool allocator
> [    1.323796][    T1] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.324816][    T1] [drm] Screen Target Display device initialized
> [    1.325797][    T1] [drm] width 800
> [    1.326790][    T1] [drm] height 480
> [    1.327782][    T1] [drm] bpp 32
> [    1.330791][    T1] [drm] Fifo max 0x00040000 min 0x00001000 cap 0x0000077f
> [    1.345830][    T1] [drm] Using command buffers with DMA pool.
> [    1.346834][    T1] [drm] Atomic: yes.
> [    1.347825][    T1] [drm] SM4_1 support available.
> [    1.364948][    T1] fbcon: svgadrmfb (fb0) is primary device
> [    1.366787][    T1] Console: switching to colour frame buffer device 100x37
> [    1.471079][    T1] [drm] Initialized vmwgfx 2.18.0 20200114 for 0000:00:0f.0 on minor 0
>
> --- Bisect log ---
>
> git bisect start ec731e516acf22ce870b735721c6f59e39d0ed44 442489c219235991de86d0277b5d859ede6d8792 v5.8 v5.7 v5.6 v5.5 v5.4 v5.3 v5.2 v5.1 v5.0 drivers/gpu/
>
> # bad: [ec731e516acf22ce870b735721c6f59e39d0ed44] drm/ttm: ttm_bo_swapout_all doesn't use it's argument.
> # good: [442489c219235991de86d0277b5d859ede6d8792] Merge tag 'timers-core-2020-08-04' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> # good: [bcf876870b95592b52519ed4aafcf9d95999bc9c] Linux 5.8
> # good: [3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162] Linux 5.7
> # good: [7111951b8d4973bda27ff663f2cf18b663d15b48] Linux 5.6
> # good: [d5226fa6dbae0569ee43ecfc08bdcd6770fc4755] Linux 5.5
> # good: [219d54332a09e8d8741c1e1982f5eae56099de85] Linux 5.4
> # good: [4d856f72c10ecb060868ed10ff1b1453943fc6c8] Linux 5.3
> # good: [0ecfebd2b52404ae0c54a878c872bb93363ada36] Linux 5.2
> # good: [e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd] Linux 5.1
> # good: [1c163f4c7b3f621efff9b28a47abb36f7378d783] Linux 5.0
> git bisect start 'ec731e516acf22ce870b735721c6f59e39d0ed44' '442489c219235991de86d0277b5d859ede6d8792' 'v5.8' 'v5.7' 'v5.6' 'v5.5' 'v5.4' 'v5.3' 'v5.2' 'v5.1' 'v5.0' 'drivers/gpu/'
> # good: [ba47d845d715a010f7b51f6f89bae32845e6acb7] Linux 5.8-rc6
> git bisect good ba47d845d715a010f7b51f6f89bae32845e6acb7
> # good: [429f3d24384b049925771c56b5bc2850cede958f] drm/amdgpu: asd function needs to be unloaded in suspend phase
> git bisect good 429f3d24384b049925771c56b5bc2850cede958f
> # bad: [4145cb541668eb48ac7d028d4e27b5f1b7378e4c] Merge tag 'drm-misc-next-2020-07-22' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> git bisect bad 4145cb541668eb48ac7d028d4e27b5f1b7378e4c
> # good: [90d4f99ac56b4aadf4e87871a4e9128474da259b] drm/i915/dp_mst: Clear the ACT sent flag during encoder disabling too
> git bisect good 90d4f99ac56b4aadf4e87871a4e9128474da259b
> # bad: [39913934e67cab214480cc95a3632696aeb8e71a] drm: amdgpu: fix common struct sg_table related issues
> git bisect bad 39913934e67cab214480cc95a3632696aeb8e71a
> # bad: [1d4eff87878977fde110f311c4fa123e93ba2b3d] drm/meson: add Amlogic Video FBC registers
> git bisect bad 1d4eff87878977fde110f311c4fa123e93ba2b3d
> # bad: [1185c406f11a49335253036feaa0169c0d174ef8] drm: panel: simple: Warn in case of incorrect bus format for LVDS panels
> git bisect bad 1185c406f11a49335253036feaa0169c0d174ef8
> # good: [84e543bc9d1dc550132ba25b72df28d40cc44333] drm/connector: fix minor typos in comments
> git bisect good 84e543bc9d1dc550132ba25b72df28d40cc44333
> # bad: [536faa450e17f32fddb1a2124e3df71a966122cd] drm: Add helper to compare edids.
> git bisect bad 536faa450e17f32fddb1a2124e3df71a966122cd
> # bad: [2ddef17678bc2ea1d20517dd2b4ed4aa967ffa8b] drm/ttm: make TT creation purely optional v3
> git bisect bad 2ddef17678bc2ea1d20517dd2b4ed4aa967ffa8b
> # good: [58e4d686d456c3e356439ae160ff4a0728940b8e] drm/ttm: cleanup ttm_mem_type_manager_func.get_node interface v3
> git bisect good 58e4d686d456c3e356439ae160ff4a0728940b8e
> # first bad commit: [2ddef17678bc2ea1d20517dd2b4ed4aa967ffa8b] drm/ttm: make TT creation purely optional v3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
