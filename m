Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F356E3793FF
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1D06E89A;
	Mon, 10 May 2021 16:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2926E89A;
 Mon, 10 May 2021 16:36:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLQ7lNFzHwMmiZdt8qAMYmQJBXCdFNft6y8/EOc1nAhs415oFtRqGXlrhEgL3Cd/TQ9aNOmElceD9yix0/EZ4kphj9MLWZZ+7Ggo12Rx+qLDLKgASpqG7arFqMBQB6RfIii8tC9tDdR6ErqolqgYw8pMcLQpqxGw0eTqe3x07PLxVlyb7O0HVfvYQe/IKaIwpWJlAKeBd/kbZlZO56fTQ6bWT0VLStws41OSqgy9PnIfyJaWjNwx+abgKxNAgi8h4ieRIc+krAmsA98+8rV/1fAwlhHjqHAkSPMMJAOOHndb4hvboZFU1PO7iQLRtnXHXkKFSrV8VGcBsI6lT+XPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH9mV/4G+pvjgm69H/sukJ+57rWHS6bSAKI6Wq2WwqI=;
 b=TRIjNJZXfjXKcKg0XR/Pon6Sne5iP+gglrTAclgwzMJNqTD8HGXou3qcV+3UZugJd8+Em4kXWX2nCxNfy1vTjnyHF7AJuXsJIblCQMZ+O/+St2FgTOzhw6Vbq0djSHqTa6Kp9DP1fzjEYXCOIPcsA9uLwGus00W96rgQ2mhm2SGkXEZbjwW8BlHIp3OIh4ggw3Rir2J4Srowzf5ocEP2tWPNn5YJvPEUe9Lx5TgGJUs9Me3DBHG1cV9SgFIqgNZvY/ppJVmkCrmkvrfNgI2Roxeg7XKzj3XbaX9Sx7eJXOqpJ4NKTjU/OVdcrq7QU4gHKaE5F6L9ZY+0GywbF57OBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH9mV/4G+pvjgm69H/sukJ+57rWHS6bSAKI6Wq2WwqI=;
 b=fLD2k7OtJ+7J+/1Y8V8ZjfYE7uM8dYtaUOLaBl2Rlft+ypuXMUmyEOOtQo5JxP5iyKhTGsVzvR9deVh11THQG7QfxNy3HN/gRz8mfwwN9g6AmMTQB70n57lI5z8p+zVhkmsI0lveMwt+hZCu9bl0WX4sUlMm/GY+sMlZoQqv4bI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:41 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:41 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 00/16] RFC Support hot device unplug in amdgpu
Date: Mon, 10 May 2021 12:36:09 -0400
Message-Id: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee1b6dff-ae9c-49a8-d82f-08d913d1ca14
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB446289615760E861B938F100EA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIQxZkXXTman37N440jTguZDI5anXlTIleZ9e7Ci34SiXFUwgfcZHWnX3eT9Rxpvpgo9swllWMHBRdds6fveymthIt031gnGC0/NaxSve3YEXtHqTLRUlobpNEsxcw86dEq92ndkEm9DYuiw3ddsl4LnNCywmbFd0KiDKVzK62b9CJkRw0mygDazpIwC65X7Vxrzz/mPZEAhu6QsXHi9BJl2PPAJV6OzNjJ2u+lMSous6FhQ/5ZBWhuq7BEdl7QKMaFhyBHGjmFyBCW1NGWCi9pAnWc+hS8jCrCYczYIpHmBwtpYHQdzRRWuraIY7ThrS8h7+wmbwico2kCxuuq3kD6vbnSURm1JZWsoidVCtnRCku2RUK4UiqBIJ8w7JJvGMiE3+JuHXn2DxzjiP/6qNBuUvMA+fIfDoWSW5lRikLvyg5VsqIC2VJTftb+yHdZkSZFWufNx09kOWSFZfwdezqdbnYFxT+Clz4QExNZqPF+VLqhbvyYxJ+8vuN+FFarni31eRrtEIwRMjQHHGQBcuGBUz4u8Y4iX8SeVmO0GCjaLpr45am9Spq2k9uK0Vd37F82/a7k5D8+YvTUfbRDt15YD8EtwhnJl4PPjU0PsyH0hpY5eGES847FeoDA7/BNedA6fFAgik+VupxMqicLdjixl6AcmuclhJLrMdlGp7hk+wtz1LKJVECJxLkx6AFFgXjsYv2WZRi5MlpJatv0pCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(966005)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(66946007)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YkR4NUJlaHBjQVNQMU9hQVFMMFFEUXdFdU5kbVB3eHhJeHZ3MHNtMFVCblRK?=
 =?utf-8?B?UmIwRUN4UzJ4RENhTk1vWWRNbWREeDhZN2JBU3ZLeEh4Ry83L0ZNeW9ocG5L?=
 =?utf-8?B?eWcxakUxL3dta2pFODVBbFQzdkU4bDlZYnU0MXhYanY0RW1WenZiK1ZnUmtp?=
 =?utf-8?B?NFhWcmZnbmdJNUNQa2RzY2wyRysyNVQ3SjE5eW95VS9FRzk4L3hhL01hb1d2?=
 =?utf-8?B?aEpBbnNXdkF6S3hQajkwUHB0a1Q5bWRNSmlJU3dHRTBwbFN4OFZCWFN1djFS?=
 =?utf-8?B?YzdOT1lvRnJ4cjI2eFNhUVVJbXZYYklSMCtVSXVudHV4OVJmZ0M2WE1pdEZJ?=
 =?utf-8?B?aXBhRU5EMndvbDltOEtyanFPQ0k3NXVybVVSRzdlVnJ3R2cvdXhHa1E3dkU4?=
 =?utf-8?B?YjNEOFNiOTZuK0V2MklKRmQyR1ZJRUI4RWQ2OEw2WTArcG43N2hFaGptUk9m?=
 =?utf-8?B?WlRTQ0YrYWhBN29scDFzWElPaG5oNndpbXFXNUl3WDNmRzJKUnZ5enZ5ajNB?=
 =?utf-8?B?Yk80SGYxWkQ5ZTdxcXJNSW1HTjhQczBLYUk0Zm1YTHE4Z1RRK21NaXd0dllD?=
 =?utf-8?B?YUZvazRpb1FsaGtGeUtPeXdHcVZxdUZkTW9obVY5VkV6ZTBCSWx6QnJNd2Q3?=
 =?utf-8?B?clVtTnFvSmFDK3dZNzBOZFRUUGZ3TStkQUY5QkQ1OXFIRHJPa1RuYUJ3QWh6?=
 =?utf-8?B?QWJpRmZSYmRLendYYmlSeE4yNlUwRHpScFVWMDU5RDU1U1pRRVM3OTUrYXJY?=
 =?utf-8?B?ZTRFZlZDSk9mcHlNbkpvQ2huOER4RStFZVRUOTV0djYzR3VJNWxwNXhFK1N0?=
 =?utf-8?B?dTByUXJoVUdHeFNoOFBCSkdVWFV5NW1kdlNNbnAybndqVFgzbjVHMnJSaDY0?=
 =?utf-8?B?a0c0dXl6SlhLcjQ0L2JPL1RGOGdDcE1PR0VBeWx5dU9aM3NBRjVjZDJMNWd4?=
 =?utf-8?B?S2o1clphTEpFRDdXTnRYdXFVa3pKRjJ2Y2s4cGg1bVN2Y1dyWXpXZVE0OXBx?=
 =?utf-8?B?NmRqekE0aHhjTWc1MWl3QXNPT0ZoSm1LUmQxUUdDNkFMQTc3L3BOTXFnczRu?=
 =?utf-8?B?MU03d0Z3UVdHK0JrSlAyYzZ3S1lKVDlHR2g1aVdXdTZPa1E3SGNzWlQ2MXgy?=
 =?utf-8?B?Ty9XNEpXMmxmWlhnL2YxTmxBZzgzTU5iNWRFN2hIY0xKaDJ1SmhmZlo2MjBx?=
 =?utf-8?B?SlNvYndnMkZvSWZGOXZMdmtXSHVPYUVSc09XS2NnalVFK0c0ejdlbFB2ZnVD?=
 =?utf-8?B?UnRUUmtydGRKRE9OdzJmd2hxUWI5aEZRem5XS3FQTW9KZUhiRXhwT2ZWVjhp?=
 =?utf-8?B?bGNsVjFEUForejVJZE93aUtKTjgxV1EzTmZKZWhNK0JUS2JJNnpUbFdQWFVI?=
 =?utf-8?B?SkNOYnp4QTgzeW5WcGQyRENzMzJtZmF5NExNNHV3N1VPdHhYV0pLU1dDc2Iw?=
 =?utf-8?B?NVk5RzZvMmlEdTlZbVNCVkNFNjBHRW9YK1BSU0s3RVVqWjJCZExqMnp2eXlU?=
 =?utf-8?B?N2lLaUtENGxVN0RrOU4rd1hLZW5tdWY4UFc1QlE3V3BPKzJQL3I2bTE5OTJU?=
 =?utf-8?B?RWIxbDR3WVlDWVZjYVJjTjFHS3oxOWdWOFF1U1htWE9CWjdLQXplVzJFblEv?=
 =?utf-8?B?WnR2MDBnd0VSSXF1TWJoTmxqOHdZR3JLNkhScWFidkMzTEtuUWNiaTRaLzJP?=
 =?utf-8?B?YnhXdm4wVFMyYkZBbm5BOEx1d0RBbEhZSkZHSHkwOWNpeVNCcXJyZDJTempn?=
 =?utf-8?B?SkJJYTVhaXJzV0FORzZ0NStObmNTVDZEQjNxVGNBaGlYZjE1aEpQOHN3cjdh?=
 =?utf-8?B?RGQybXU3UDNESVBkR09qYmNpd2gwSm84UloyMmdJb0kzeGJmcVNUOFNYU1NF?=
 =?utf-8?Q?6FlReWY/dBT+5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1b6dff-ae9c-49a8-d82f-08d913d1ca14
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:41.0761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg2/cqAcVOkyV5by/Vh5xQyiFz1Po2KRvwU7imuk5QeMgJgAAx1f97+nyO00cH2m5lOTeGnD5ReSTQ3YbIwzeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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

[1] - Discussions during v5 of the patchset https://lore.kernel.org/amd-gfx/20210428151207.1212258-1-andrey.grodzovsky@amd.com/
[2] - drm/doc: device hot-unplug for userspace https://www.spinics.net/lists/dri-devel/msg259755.html
[3] - Related gitlab ticket https://gitlab.freedesktop.org/drm/amd/-/issues/1081
[4] - Related IGT tests https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master

Andrey Grodzovsky (16):
  drm/ttm: Remap all page faults to per process dummy page.
  drm/ttm: Expose ttm_tt_unpopulate for driver use
  drm/amdgpu: Split amdgpu_device_fini into early and late
  drm/amdkfd: Split kfd suspend from devie exit
  drm/amdgpu: Add early fini callback
  drm/amdgpu: Handle IOMMU enabled case.
  drm/amdgpu: Remap all page faults to per process dummy page.
  PCI: Add support for dev_groups to struct pci_device_driver
  drm/amdgpu: Convert driver sysfs attributes to static attributes
  drm/amdgpu: Guard against write accesses after device removal
  drm/sched: Make timeout timer rearm conditional.
  drm/amdgpu: Prevent any job recoveries after device is unplugged.
  drm/amdgpu: Fix hang on device removal.
  drm/scheduler: Fix hang when sched_entity released
  drm/amd/display: Remove superflous drm_mode_config_cleanup
  drm/amdgpu: Verify DMA opearations from device are done

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  | 17 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 98 +++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 26 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     | 31 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 25 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        | 17 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       | 35 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 19 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 63 +++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 70 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      | 52 ++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 21 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       | 31 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 22 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 14 +--
 drivers/gpu/drm/amd/amdgpu/cik_ih.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 44 ++++-----
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |  8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  8 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c         | 26 +++--
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         | 22 +++--
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 ++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  2 +
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c |  2 +
 drivers/gpu/drm/scheduler/sched_entity.c      |  3 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 35 ++++++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 57 ++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c                  |  1 +
 drivers/pci/pci-driver.c                      |  1 +
 include/drm/ttm/ttm_bo_api.h                  |  2 +
 include/linux/pci.h                           |  3 +
 51 files changed, 585 insertions(+), 272 deletions(-)

-- 
2.25.1

