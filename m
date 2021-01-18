Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E62FAC0D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08C66E593;
	Mon, 18 Jan 2021 21:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B976E591;
 Mon, 18 Jan 2021 21:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNUnHAbECbY5fySfB6sHC2RwojmWOFqB6+XE9OWQtVKn5zEiQUVYDSZGSawHS/2nOfsci4ahH8IHt+XXWShTOUMwnJV8gCmrOkm5KOPu3NwnXF4w0SkAxS4nZXuIv0CxoSX5cF6d4F1cVpD7PvWCyTHMgBelElD94ZGwuNTbdLr2svOr25Qcgp23jCm8AKW/GtV3zNEoVdYNEU1f3nHDvhOSAke5iP3bJ5z0co1jjOs0ziVOvYHOD4m0SvAW7Hd9vmBQQL89PRxJoHtD9Fs0f6yP03mZ5AEklYenGy1hulKHsywVyj/av0Qnhe0ANDAuPCHUObb3n8DWM7KehnB/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxArjqIQd8mdWnuKs/ykjW/NMmp8abNtjGupteRZuYQ=;
 b=MNFaKlIvW3r8MBqsZbQVktVd7tYiMP83g1V5oD0Ps7Z1Eu847M8N2v0Nf6P5RsxaP7nvL+bqCzMTl7DLZ6pXBQ64vyj5yqQHF55zhHpspQGoyKKndlr+fNIArp6Wf752PsuBTo3brQVU9TYQnIGp1VfZTyuEh5O81jsg8vLPu8YCSyeJAWFWNgWzVnxEwM8eVzEh33aMGBGb3G8cGQBSj8l/kvq+HmyjNHwQB6uo4QjOT7xSGj8kCJidmYkWFUhyU/LRHnaGXY3IvmWn2474D4EU/0iVl0msxZwaoFaOYpcpxSEmFwXTdp+X+hOIkZa+3/oPlK//lqf7IVo2DADTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxArjqIQd8mdWnuKs/ykjW/NMmp8abNtjGupteRZuYQ=;
 b=iKyrhOgFw6w0OHOjNSYLqvgAoh23iwOvbt0xMwGc6Jnq/wFGTVjeAaiQHQ5AWCB9jI2PmimqisALp+fDnMvHfSrbmjOMbP1cGdbQr0N+ibt6hg55+g8CJH1ep1zPkqABwQIGg/8tb5MeRYLqoq/MvgFEA+Vz6JyomGWqtfZtWdo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:17 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:17 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
Date: Mon, 18 Jan 2021 16:01:09 -0500
Message-Id: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aec121b1-0d69-48b9-e117-08d8bbf45685
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47671D5DC0DDC6DECBC1142CEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAb73J19TEDrlTF0EnKcjmP70lIWFexNJ1l5yAMoJ//jeKWzcMF+5TzyIEEhoCok4iA7qoxxxWUpJjhgE61FQyvxzkGuwBQN/9nPDyWdb7m0QS+sKK1m3XZP9nFTQ3KUX5JCcjDNlwTu+PgJsFPQ5YC2rIXZaBAlQ5wD43eM+dHlYxPKd3JXZcwF58/e9X/hQDx3kJ+tnFAOC5ia56hHvvHKVAjJL3fs8c0g08wZeXAzw6LP6X2ytPO4FOnGSA5jfzTrwxxIKtoZpWKDTDMIlP0AeecJlTd8iFIpTRzwpi8uiV8PYbxVVdbk3QMqa8dI9kMJr7eeAQINXsMBmEOgdo02axdLrOYLQ5Rwegcv6oIePDAM2oe/wHhTHzUZtAQXtt7XrFjnsFSRtWFEUidbGUoFwunx/XzZAvNURWuUnL+344EJMFf14T8DA5/+7kWud46ETfc+0OT3Nzs3IWmPCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(966005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dThjakV4ejA1NEw2dHJjTXF2YTJSclcrcldRLzc2aG9oOC9xRHduOERxVzUv?=
 =?utf-8?B?RDQ0RkhUVmV5M3BCdnFUK05oMmxLODE4ZkVkYmhjcHN6d0Z1M2FkOFdQMEx0?=
 =?utf-8?B?SnRTNWtBMXp6UEZlMFRHRS9sSDN2alhVMFUrNDlvZDhURGp1Um9LM2k4UElm?=
 =?utf-8?B?YWFVdiszQUdmcFkzd0xFOU5XOVlRU1FtQ3RVQVlURWl0Qm5CbGpITkhoNEZr?=
 =?utf-8?B?OVA5U2ZUSU42WTQ5N2p2WFdFaGlkSUtoQVFBdEhRN3A0SnRKNUJDVDU0ZkdX?=
 =?utf-8?B?ZEVBWGtkT3VPcDdYN2Fpa05NRUFMbVJoVmQzaGMxaTZTTWRVZk1ZcUVMT2Z3?=
 =?utf-8?B?SEtEdEcxNnYxOTF3S2E0SFNTTHd4OGRkcFJ6U1JadndLQlJlVW1ENVpuYmxm?=
 =?utf-8?B?YTZYMy9iMnhkV0lSVWdWYjBIVmEreUtpYkg2dTNMeW15YmU1eWxWQ3BDQm1p?=
 =?utf-8?B?V1I3MXB1KzIySm01bHBrb1g1MVJsNURscU1FVXI5czljWXVsdjM1QzJvcWlF?=
 =?utf-8?B?MU1nblNlaVZlcVRwWUcwa2hXS211a05tbUM4bWhDVXlLRmNRZmJVUnYvQXpX?=
 =?utf-8?B?NXdKeXdlMzRMUXVpdk5vSjdCNm5LalhGL01aSWp6eUxwOS84aVVyT0lpQysz?=
 =?utf-8?B?ajZGeUE3dEtPWkxkdHlKZGZPT0hEVThjc3NRRTdkTUNxZ0tDY3JEeSswc0pE?=
 =?utf-8?B?SThUUWNPcGkzaVFFMGZlRG5kamNJbk5xcjY4QjYyL29mdjRlU0hDdkFHc0tT?=
 =?utf-8?B?Rm1RL1lKNkkzWTdKWFQvNlJZSklibUlIcWhMMWNoSnNaU1p1aTJHUXBaWXlM?=
 =?utf-8?B?MHRSY0JCMmdFS0dEZ2JuT0ZiN3BpZi8rQlp6MTdUcWVtb09GRUVRWExiV1pn?=
 =?utf-8?B?ZTZwWGswUE1STFU2bnJHRGtRSG1KSW85elhHbFFkZVBpR1grdkUvMlpoSHFV?=
 =?utf-8?B?dGdEcGRiNk9YWGRjZTRZcGFhTXBIU2FJYVlDYnJqSzNuU1dFcVpaSll2NFBm?=
 =?utf-8?B?cGQzZUJsc1MweGdTMTZreXpCQW5vZzR3ai9yVG1QWWZEcjZUOU1iZTRPMExu?=
 =?utf-8?B?dXk3cVRZVzYzb0hqQVhWWFduWStDZUFjdE4xdWh4NllDSEtOVitwd3JOVE5a?=
 =?utf-8?B?RHIxRTNJVTRXQyticGt3TU1wdE5GVEVkbXhhdWw5TnJmUVlNeGRERGZjaGRQ?=
 =?utf-8?B?Y0p0SW1ORXV5ZlNwV040OTFabU5hckovbkRjYUdhcnlIZkIxN2VJVlFuSzc3?=
 =?utf-8?B?TGdZdFpORWtIWGR2SzQ2akpzd1ovci9xdW03VGlCT2hHS0VCZmpGL1VoRVNB?=
 =?utf-8?B?R3l4RjN5SEJ1c3dwR291ZnV2Ykh6Y3FKaWFLSUJ3WWNKK2ZLYVQ4TXcvNXhV?=
 =?utf-8?B?QUFTTGlZYXNsdjJKaVNMejBiVjhyVTVUTHd6SVVpVk1pMTkxVUdQRjgrS2pJ?=
 =?utf-8?B?a05BNFZ0eldtRkRDbjdrY3VaYkpEaGZ3dDBQWERJT3lHNVIyODFFT29vWmk0?=
 =?utf-8?B?NWFUSzE0WUdaMlpHOXhOL3dxdllWMFNnaEdZUlpUVWxxM0RDWW9ZaUc2bGxI?=
 =?utf-8?B?QTBnZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec121b1-0d69-48b9-e117-08d8bbf45685
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:17.2383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OR0fe8DNFpm1Fp3dom6gtIgUqswK4A21PSrpInWhs9zhXMARYZcWnpMO7nBG4ANISMuEQdoIyOKqBidPBBGyCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now extracting a card either by physical extraction (e.g. eGPU with 
thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove) 
would cause random crashes in user apps. The random crashes in apps were 
mostly due to the app having mapped a device backed BO into its address 
space was still trying to access the BO while the backing device was gone.
To answer this first problem Christian suggested to fix the handling of mapped 
memory in the clients when the device goes away by forcibly unmap all buffers the 
user processes has by clearing their respective VMAs mapping the device BOs. 
Then when the VMAs try to fill in the page tables again we check in the fault 
handlerif the device is removed and if so, return an error. This will generate a 
SIGBUS to the application which can then cleanly terminate.This indeed was done 
but this in turn created a problem of kernel OOPs were the OOPSes were due to the 
fact that while the app was terminating because of the SIGBUSit would trigger use 
after free in the driver by calling to accesses device structures that were already 
released from the pci remove sequence.This was handled by introducing a 'flush' 
sequence during device removal were we wait for drm file reference to drop to 0 
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

With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears 
is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working 
with the primary card or soft reset the device without hangs or oopses

TODOs for followup work:
Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.

[1] - Discussions during v3 of the patchset https://www.spinics.net/lists/amd-gfx/msg55576.html
[2] - drm/doc: device hot-unplug for userspace https://www.spinics.net/lists/dri-devel/msg259755.html
[3] - Related gitlab ticket https://gitlab.freedesktop.org/drm/amd/-/issues/1081

Andrey Grodzovsky (13):
  drm/ttm: Remap all page faults to per process dummy page.
  drm: Unamp the entire device address space on device unplug
  drm/ttm: Expose ttm_tt_unpopulate for driver use
  drm/sched: Cancel and flush all oustatdning jobs before finish.
  drm/amdgpu: Split amdgpu_device_fini into early and late
  drm/amdgpu: Add early fini callback
  drm/amdgpu: Register IOMMU topology notifier per device.
  drm/amdgpu: Fix a bunch of sdma code crash post device unplug
  drm/amdgpu: Remap all page faults to per process dummy page.
  dmr/amdgpu: Move some sysfs attrs creation to default_attr
  drm/amdgpu: Guard against write accesses after device removal
  drm/sched: Make timeout timer rearm conditional.
  drm/amdgpu: Prevent any job recoveries after device is unplugged.

Luben Tuikov (1):
  drm/scheduler: Job timeout handler returns status

 drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
 drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
 drivers/gpu/drm/drm_drv.c                         |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
 drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
 drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
 drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
 include/drm/gpu_scheduler.h                       |  17 ++-
 include/drm/ttm/ttm_bo_api.h                      |   2 +
 45 files changed, 583 insertions(+), 198 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
