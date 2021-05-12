Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D737BFEF
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7878E897FF;
	Wed, 12 May 2021 14:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CBE897FF;
 Wed, 12 May 2021 14:27:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmT0TMvnOoZ4gQJZbpuxvURVdklP1/rjP/R0PGDcBScbIHPy3Q4xa30OS00OSS6xZrakD7HQkNotRN+Y2Wib+RRGiMlwny7ppX8JDeQ4qp0CSQ9dA1IJQ8YzKiJV8UH4svkUTLVnTXtr82kZlk81OMey4Cy14sZxnbvp54ITkcZNyFTh9+zsweD8MsOZ0mB0foCa0SaVWi3oaLBkxTRm/9AS46nrEouKjima6Vrvg81gjwpjOyhBPtCuufFVG4mA8jQT1MyKEeBPqXByl7Kw9ir0XKbJaS90zsjl3cuffkplnq+K+uP3xO4tfBt4WYEWqxrnUMUvKfPl50B2f9wz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcvYwkuZL0nRSl7IMje1cH8uSXCMGXPXefGP3da0Pk8=;
 b=ZrX7NBPJDtgwfLBHeIekmUNUpkniGMkwcepdUsqUajapdrIs0rrmb8E1+RnmRcBStyfr3vx9v5N8njaXYdkcCwXYbWDShhLGJoetSekUhJ4EQHdvB2e+vgbhP2Viz76yy4idsy/ZsStpPlrdiiE2W69wIYKpVyJsou5cjG9OzXhxN54B8AbLGwg2pdJ7zt3Btqn8Ul8MDN/NI4CxdmdMkVFiXmOgEtEivtDTfNlbyGR1lwGHhA8ljRf4dd0P2mrTwOUk5ma8Bpzuo8h7zBfBFULr3eWNwdf7x1N1cflOY4NeqjNErHG8qQDt6O/pFV64DCBzyZk9lc3OLc9YOdw3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcvYwkuZL0nRSl7IMje1cH8uSXCMGXPXefGP3da0Pk8=;
 b=WAUz8DUcv2quR48g+R/DoyZ/y1rM0t3q8c44nfEf8nyJu3ZHBHRhzArChkBV5eAehCQCaDvy0W6tgnBL84TXxuZw6tmDPhBvZGIl8TIemRdwtVwEjAMF0tZIHXL6SSA9Hik9s+Mf5RaIxuxMWLjSD8zglZ5H8cC/lcUJ72YU2nw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:05 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:05 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 00/16] RFC Support hot device unplug in amdgpu
Date: Wed, 12 May 2021 10:26:32 -0400
Message-Id: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6854c8c3-8493-492a-e63c-08d915520412
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576CAFD66C969869B94AE0AEA529@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBHUOoLrJDMJNmdfXVwwWPJBL7Ikn3ZvqN+1+40bG4+kPqTDg4eY+dl79x1mlKYZa5CA1MpjtltOkVPXdMZpL1xr0OhK/41N1APB9sUWgLf7d5IszS9MFqI/sCLAi0eG19pxXtgEe5zhIBK+wFQVf/NBNZjJOii0mtMypQyQXkAvQWlp/RmEzFSAp9U/nN2ATxmATr8eFv0GEjK36rThmE/jPf5MsgOhDbWoRXjr0BEUtCvhIvyYFP407B7fmEMu7+izQxRgUHWyrE+HgHCrYRtLb3KL2TYJCroFWgPUjVsUNQFip2wSzv7yD7Nwjicqu2+kNHJr9TsaKU/n7lNaPRJxus/95wzyLCISoLaDMgU+k8n9oPAjOxuTXNn4O0+0skY0MlOROmyH96A3N6LpiZBNflcHRlUWswfdzIdlfcp8cA/EBY7qWvK4o9yuL/QEi00pw474plTwweutis5h8M+5lKZlmp45lKqC8OKu9hgwn1qaz2kfGqyRxIdFvI+DqxmS/4O/cxN4L0upZ4YM7d7T0OwYzKCPbWpMWgCnmB81pTYws1YxNw2Ort7XXL2ahuEyXnXN3LsZR39l0SWufDi3f/uknzDtEGmru4/jOngdYYoUg8iTvfykRBMpg3rFOG9tNy1NCorxESNxuwjQ8DxdXaiOdu23cZ98DH4cYD7/vCLkf2KxtcYRjD1PbLCER7wt6BZ5OPp3aVJ4iinRkzUCvCg6h/1xF5mAw8KaU0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(38100700002)(5660300002)(1076003)(6666004)(186003)(316002)(16526019)(8676002)(83380400001)(66476007)(2906002)(6636002)(86362001)(52116002)(966005)(36756003)(2616005)(66946007)(66556008)(8936002)(6512007)(6506007)(44832011)(478600001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnFSaUptQVNKNjZVdzcwdGdrcmIwNWMyVG82b05hQ3J2NDZYNkZCN2FFWXJa?=
 =?utf-8?B?aHBVZnRTSnRmcVRVZ1VqdEp6SnF2VWgraWZWVjBiSXlNRnYzZVhBWklVQnVh?=
 =?utf-8?B?MVNEeGtDc3c4TmtGOFlQbjhaaWhER2J6T3gxWTZPM05DZDhYeWovNEdCM01R?=
 =?utf-8?B?c0trRFFTc1BMcExNQTlweWdDdTRtckUyWG1sUWtuZWdjN1d0c0h1QTRaVkpQ?=
 =?utf-8?B?UVBqYVFxOTd0bFFqUXZLR29xUnIxc1NrdVpFTFFFNnZlUkRsM242dFFDZEhE?=
 =?utf-8?B?bStEL1BxZWhCeFFBakVUZWNjOTJ4WHBPeU5DNHRMU05VRDU3T0x6a3hYSWJV?=
 =?utf-8?B?dFNHZysrRVFHRlVYMWVVcGNuUHRVZEZyc0Q5eVZMUkd0NUxqTlJEanNkaW1V?=
 =?utf-8?B?eVY4TWhVUHg2YVI1T1ZkVE1McWhFaDYycXlGQjVlR1ZuU21YdkxOYkU5bHJk?=
 =?utf-8?B?MXY4dm5PNDVpSi9OZmUvRUREVlFNNllPZHF6UGhUMll3S3YyanVFcURpdmVV?=
 =?utf-8?B?ZHBaaS9ySmlpdllpakJ5QXFxaG5ucE9SQ1pGbnhhOWFFRXgzdmRBSkFXSGtv?=
 =?utf-8?B?TldzTU9BV0s4Z3luSGNxV0x4Y0JFMmhOYk9GMVlCdFowaDNpTFRaa2tCOGU4?=
 =?utf-8?B?Y1RKanlSWnJSTyt6SXk4WERvL0VKQXVJQVo1OWJTRDF2K2F3WjM2bktmZXJv?=
 =?utf-8?B?TmdaNVN1YnZZOTZlOTlWN3p5UTh2cmdkQk81T0dEQVFhbERHMDJBYTgyazUy?=
 =?utf-8?B?R21oWEtaQ2gxMkF6VDJSdTM2VVBpcGl1bjBIa2F3dUdGMWxpS0tWR3lwWWVQ?=
 =?utf-8?B?ZWFTNk9SQ3ZOVVZJU3NTaHJ2RE1RaC9XZnl3cWUzV0lmempnc1RrQldBa3JM?=
 =?utf-8?B?MGVId01reEl5NWUrRHlqTHBuUmZ5ZlJLb1JqaStwUzZEOU5WcjkyQ2ZVckFh?=
 =?utf-8?B?ZURqQnoyY2NxMncxTjl6N3IvWkRXUjB3Y0VzdFk4WHpqTlRHa05ZdTdSZjF3?=
 =?utf-8?B?bThXN1l6b1BCQ1NxbTdkOTJwSEN3K1F5SHRHY0kxaDR4bXhEanBOWEFLcmN5?=
 =?utf-8?B?NHZnK0ZEM0M2UEc2MTBpMXBsUlBnSThLQU1RbjBEd2FDYkoyVGc3U3ZDcmd2?=
 =?utf-8?B?WDBQZUhrcW9pMGRLOWhBTi9FRGhnRWYzdWVLbGNDRDFPNXNQdVR1VzVzSldN?=
 =?utf-8?B?ZmZ1Vm0rU2JDUVZqcDRNZVdKUGQ3V3pCWmZvVDhIaHFZSHJzM3VWREJYVS83?=
 =?utf-8?B?T1N2NlpLeGxMdXhyL2xhZURjNnpUa2U4ZXhGU2VHalNlUmdzYlhoTW1vb003?=
 =?utf-8?B?end4LzVsNEZnRWRiZjdSdmZWdWpWd2ZrWTZoVThyUm9NUnVnTXdCdGFCSWVJ?=
 =?utf-8?B?S1pDSFVHYnJnZnZ6THFqcWllT29YV0k4eW02R1g4SjEydW9iRWNESGFiOXVk?=
 =?utf-8?B?V25RWmx4clB1WmRPZ2V1M0J2cks4djZQQUltUWxaekhGczRiVkNabXgrYmhQ?=
 =?utf-8?B?ZWk2WHFnVm81ODY3aWhFVTZVL1Faa1RRWFB0cWtYSlI3WVU2Tk5vcUNPU0wx?=
 =?utf-8?B?ZmFCM05raXJqZ1VSeG9iWWcxaG83dUgyS3VNeGRHc21YMlR6YzgwaXJFYVNB?=
 =?utf-8?B?K1U4OWlqQjZ6cHo4QVM3UXhCWmEvMEx5Qm9nYTA0dkxtWEpZMWpOUXR4eTUw?=
 =?utf-8?B?ZysvVmdOZi9WQmhUbjFaZ0xiWHVmZDFHL1lOUnpuOHJSczFIYWROL2ZWeHpK?=
 =?utf-8?B?N1RKUEp2ZXNmUjdqdTNrVTB4Q0lRc0tONGZGQndxTEpSWkxKbmdtY0I2eEJQ?=
 =?utf-8?B?Tk5XZUoxbHo0Wkk4NGJrZHp0RmFvNXNQWjNqbWxEME1TTXk4L2JXa1NZSFQx?=
 =?utf-8?Q?KZyehjeK9+bLZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6854c8c3-8493-492a-e63c-08d915520412
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:05.1103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2IckFI4LTMLAsOTCtjULxcGghCzVCdJF8CLc/vdaSWKGXvrfoJDtl1Os+AvAwVy8Hmpd3w9GMs/EQZQXS7bYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now extracting a card either by physical extraction (e.g. eGPU with 
thunderbolt connection or by emulation through  sysfs -> /sys/bus/pci/devices/device_id/remove) 
would cause random crashes in user apps. The random crashes in apps were 
mostly due to the app having mapped a device backed BO into its address 
space and was still trying to access the BO while the backing device was gone.
To answer this first problem Christian suggested fixing the handling of mapped 
memory in the clients when the device goes away by forcibly unmapping all buffers the 
user processes have by clearing their respective VMAs mapping the device BOs.
Then when the VMAs try to fill in the page tables again we check in the fault 
handler if the device is removed and if so, return an error. This will generate a 
SIGBUS to the application which can then cleanly terminate. This indeed was done 
but this in turn created a problem of kernel OOPs where the OOPSes were due to the 
fact that while the app was terminating because of the SIGBUS it would trigger use 
after free in the driver by calling to access device structures that were already
released from the pci remove sequence. This was handled by introducing a 'flush' 
sequence during device removal where we wait for drm file reference to drop to 0 
meaning all user clients directly using this device terminated.

v2:
Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document 
produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and 
waiting for all user clients having CPU mapping of device BOs to die was dropped. 
Instead as per the document suggestion the device structures are kept alive until 
the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs 
belonging to the device directly or by dma-buf import are rerouted to per user 
process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2] 
since i am trying to get the minimal set of requirements that still give useful solution 
to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my 
test case is removing a secondary device, which is render only and is not involved 
in KMS.

v3:
More updates following comments from v2 such as removing loop to find DRM file when rerouting 
page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving 
prevention of GPU recovery post device unplug from amdgpu to scheduler layer. 
On top of that added unplug support for the IOMMU enabled system.

v4:
Drop last sysfs hack and use sysfs default attribute.
Guard against write accesses after device removal to avoid modifying released memory.
Update dummy pages handling to on demand allocation and release through drm managed framework.
Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention 
of GPU recovery post device unplug
Also rebase on top of drm-misc-mext instead of amd-staging-drm-next

v5:
The most significant in this series is the improved protection from kernel driver accessing MMIO ranges that were allocated
for the device once the device is gone. To do this, first a patch 'drm/amdgpu: Unmap all MMIO mappings' is introduced.
This patch unamps all MMIO mapped into the kernel address space in the form of BARs and kernel BOs with CPU visible VRAM mappings.
This way it helped to discover multiple such access points because a page fault would be immediately generated on access. Most of them
were solved by moving HW fini code into pci_remove stage (patch drm/amdgpu: Add early fini callback) and for some who 
were harder to unwind drm_dev_enter/exit scoping was used. In addition all the IOCTLs and all background work and timers 
are now protected with drm_dev_enter/exit at their root in an attempt that after drm_dev_unplug is finished none of them 
run anymore and the pci_remove thread is the only thread executing which might touch the HW. To prevent deadlocks in such 
case against threads stuck on various HW or SW fences patches 'drm/amdgpu: Finalise device fences on device remove'  
and drm/amdgpu: Add rw_sem to pushing job into sched queue' take care of force signaling all such existing fences 
and rejecting any newly added ones.

v6:
Drop using drm_dev_enter/exit in conjunction with signalling HW fences before setting drm_dev_unplug.
We need to devise a more robust cros DRM approach to the problem of dma fence waits falling
inside drm_dev_enter/exit scopes -> move to TODO.

v7:
Small cosmetic changes after V6 comments.
Added back the patch which invalidates MMIO mappings in the driver (register, doorbell and VRAM). While
waterproof protection from MMIO accessing from V5 was dropped until a more generic approach was developed I
do believe that it's better to cause kernel panic once such access happens and then fix it then let those go
unnoticed.

With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears is running off of secondary 
card (DRI_PRIME=1) without kernel oopses or hangs and keep working with the primary card or soft reset the device without hangs or oopses.
Also as per Daniel's comment I added 3 tests to IGT [4] to core_hotunplug test suite - remove device while commands are submitted, 
exported BO and exported fence (not pushed yet).
Also now it's possible to plug back the device after unplug 
Also some users now can successfully use those patches with eGPU boxes[3].

TODOs for followup work:
Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
Annotate drm_dev_enter/exit against dma_fence_waits as first in deciding where to use drm_dev_enter/exit
in code for device unplug.

[1] - Discussions during v6 of the patchset https://lore.kernel.org/amd-gfx/20210510163625.407105-1-andrey.grodzovsky@amd.com/#r
[2] - drm/doc: device hot-unplug for userspace https://www.spinics.net/lists/dri-devel/msg259755.html
[3] - Related gitlab ticket https://gitlab.freedesktop.org/drm/amd/-/issues/1081
[4] - Related IGT tests https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master

Andrey Grodzovsky (16):
  drm/ttm: Remap all page faults to per process dummy page.
  drm/amdgpu: Split amdgpu_device_fini into early and late
  drm/amdkfd: Split kfd suspend from device exit
  drm/amdgpu: Add early fini callback
  drm/amdgpu: Handle IOMMU enabled case.
  drm/amdgpu: Remap all page faults to per process dummy page.
  PCI: Add support for dev_groups to struct pci_driver
  drm/amdgpu: Convert driver sysfs attributes to static attributes
  drm/amdgpu: Guard against write accesses after device removal
  drm/sched: Make timeout timer rearm conditional.
  drm/amdgpu: Prevent any job recoveries after device is unplugged.
  drm/amdgpu: Fix hang on device removal.
  drm/scheduler: Fix hang when sched_entity released
  drm/amd/display: Remove superfluous drm_mode_config_cleanup
  drm/amdgpu: Verify DMA opearations from device are done
  drm/amdgpu: Unmap all MMIO mappings

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 121 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  26 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  31 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  25 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  31 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  63 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  25 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  31 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  22 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  14 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c         |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |   1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        |  44 +++----
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c         |  26 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |  22 ++--
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  13 +-
 drivers/gpu/drm/amd/include/amd_shared.h      |   2 +
 drivers/gpu/drm/scheduler/sched_entity.c      |   3 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  35 ++++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  54 +++++++-
 drivers/pci/pci-driver.c                      |   1 +
 include/drm/ttm/ttm_bo_api.h                  |   2 +
 include/linux/pci.h                           |   3 +
 54 files changed, 514 insertions(+), 254 deletions(-)

-- 
2.25.1

