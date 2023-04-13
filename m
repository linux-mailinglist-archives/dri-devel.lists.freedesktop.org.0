Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEA6E0BC1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E410E027;
	Thu, 13 Apr 2023 10:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 873 seconds by postgrey-1.36 at gabe;
 Thu, 13 Apr 2023 10:49:14 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B725510E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 10:49:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33D6UVY7012615; Thu, 13 Apr 2023 11:34:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=dk201812; bh=dWcj8D/CFEmsbk/kz1KadhlkTU8+MrrW/Gak5e+QElg=;
 b=VL5MRFiUG/dV6aVECfF5zTY4Ne7aRSIObpmoGoVVURZh4Vs3N/8SlLOIs9VxBITnwGN7
 BbTQ8mTuuewH4Rn30OJACgHdWBe12peb+AHKN47EzisVG0IdN8xw2P8m3/Dlhleaf7ML
 nzoUBA/SKU37vAgItQ9VyB5hNGk8CVgre+rUuF8Naszd0rrdi95SxxckY7MJ1P50i6Dh
 6Wox5fpFWhuu/Aagp/lffCxDCO5Uo4utkIFtFf9hbfoi/ttCxi9ARpso54qiHQJbXl3E
 49rxxz+4xChu491Z7tG/GOjvImPDN9h8ZgiFRYGDufB5xloVe20JQ1jPALrQA+iRp8hq sQ== 
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3px7cg8bs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Apr 2023 11:34:32 +0100
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 11:34:31 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Thu, 13 Apr 2023 11:34:31 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXKeeQucl2ndgT0nV1xRIpWWsVw3T2HpAtD3uk4eeKZZZnp8aOVnDpZJNnOP911/Kg7L0jpskhK0xji5Rf8LIKFVTmw99Y7GKauXZI7+PxwKD/hdv/lTHkzvwulb+UvDjZzUbP5yg7TaUuovn2qqu0zBaxG0RjDI+O6sCH1wpBIvBoKlXdum5nUpFncF7iDc6W4tca384fbOrqKAhHPTczVbgM5PpP4SOlRcCgXiQJ6F/LLEe03bMGwV36XekfdnchIDfz5FIZctYjPBwyzh9jRc6ODcVVvNnfv1PCIFPlGmPfUCNaYbtPUCyNs6i1ldn+iE+Xe35iLkpyY1i7TLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWcj8D/CFEmsbk/kz1KadhlkTU8+MrrW/Gak5e+QElg=;
 b=RZqtYBJKkDujH97UlPngu7K9qeKHKJh6+UnbOJZ5Oxvzn9uoTvE/AVbgNG5iaiwFcRI2ziiAuctzWHAma/tcXn/UzVKQi+S329eD+UouyUoOB/BJ1biNNw4FAbFFR22nDprKI8LjxnmCZWEqk7sMNNy0lP8LuELRTZO9/gBkdl2nS5+Ih/jTNiNtuGbmGD4NEzlZv3bAyJCfTYWdjDrMH7Pw1iWf5fFVGkJ6poj9IA82Y6HRJJzIYlHZjfFyc3UmQT+UtATYG1CBNL0xDhsjoOpS7wyes14j2ph9W7OId5i20xOAB118uGKSNmbXLGu1pv0sQ0Xo+75sQOY/rSt56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWcj8D/CFEmsbk/kz1KadhlkTU8+MrrW/Gak5e+QElg=;
 b=QT89PfVic+y7v+4TrAVfCguHYO6OUyKjS62pClmC4o/B76LPtq9Zj+icawv+mpt08YWQior2BCf6va/sBY/c32yvi+Di3aRVd52x+q5jq+YaE67mGTd1qOB3/IQtLWb6rl1EWHfVma3hx9oBklvgPDHDEibAYqg3/Q70l/noiWE=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO6P265MB7113.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:34:30 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ff6a:9fe7:c5a:7f79]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ff6a:9fe7:c5a:7f79%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:34:30 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 0/2] Imagination Technologies PowerVR DRM driver
Date: Thu, 13 Apr 2023 11:34:17 +0100
Message-Id: <20230413103419.293493-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO6P265MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da20fb3-8bc7-40ff-7301-08db3c0aa9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2XRSz6tQ/DKEQC4omrq7mOogB81vgqrkUWq8SagjckrVdoOomXnQSo2Kqh970oc+7VkeaWafdOZlnRy/xgo/QWX48naaJLVU5aKTPvDli9Vny4wjFNTrL2rdL7ABO+IrGzlsl2OeFuJvjMFX1wW4j3xKt5/VcEIi27PimY1r8bs3GL9ApkeRvGqdhewqP3ra01SnOQggLDbhJebDfhAvPwP+L7hPOumBRlYW7E6T0dn0G58I1ArEkt4BgohOCmU/rltRpkIYqFm+oRWlkbl2W4H+eue1hznsXGjPRxm22OBkaczyHE/T0FuKZuWzvoVGrQZxqd2HtpO5VVBjLwq9EpLvJsePLhvvj3hXq+0Ga1G3jLzyVMOczWxq8QmQjVvVJMdtdw+WORCQ5BR5dgg7/Qx7r5fD7NXe3nj2dFvHiX85edb60qi7J/UbYJgdT084qa7PZmly5j6nw7FK5/lDQeWjpJkjwCzL8eDvqNJOWOkQuFdqrB6LQfdflc8soBMAKH0oGBZQvXcgw+0KfZ/kQZZyP3KE+JEbUpED3bERIGzhbJ0i9k6PQ3BegqmXlLEqWymiKY3K9668gOmu7r1Qn79Lz7vDVshPZKXonsL/aQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199021)(8676002)(8936002)(41300700001)(5660300002)(44832011)(66476007)(66556008)(66946007)(6916009)(4326008)(316002)(2906002)(30864003)(478600001)(86362001)(6486002)(966005)(38350700002)(38100700002)(52116002)(6666004)(186003)(1076003)(6512007)(6506007)(83380400001)(26005)(2616005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+jomJyUONAtjyfEzlAQ+sq+SkO3M7IlxDFp6dSIy782VM34TpzNUsjtbu/at?=
 =?us-ascii?Q?U/Xhf6RF+jhnfYSzyOo8dM4+QiVkZcNQl5yDIztBjuYelNOnCfHbTEDsJBVw?=
 =?us-ascii?Q?f6ybN6UOGIf17zQ9PfgIjoxALr7/5n+nzINPsPewGWZr97phKYS2h4poHTqc?=
 =?us-ascii?Q?ofkeVsvQCtJF95BXQ7f7cATMzdi2lTZ7+8M8pCzPTRa7Z9dupbglGvUBAyPB?=
 =?us-ascii?Q?bRbahvFiJfdZtNZhBDvKMKK4JiGZxoUoa9ZgkCjnpa1XFPWU2kL0qDMwxHJA?=
 =?us-ascii?Q?PFNLLgbyE/DJ46/NiykukTvShwFJ9gAdg2S3YgBJa3OjsufzMfCFN84XUnMH?=
 =?us-ascii?Q?rKs0CL6iLykS2l7EkabVicTMuzMoXBqjOhtmchjU6C9fIjTns3SQ0enSnpw/?=
 =?us-ascii?Q?UAae73FoE5p1Y1rs1bSJzYJ+He2G3EJn3pQUeCZDjRzwRvyghyYynXaDuFSO?=
 =?us-ascii?Q?8cdNRWQEFfMZ0Ho363WGJzygxstj+ReHOZuo2k1nIxBzgRZrZWrJBrkZovr0?=
 =?us-ascii?Q?OKqqPn3XK/J0GTgsAnbCwTG/JH0d58t8gr2j4jEeclklKtl0XO6kioZ2stsy?=
 =?us-ascii?Q?Hpi04zO0JCLPIAc6ZYt0S5sFzg2pUDgsmfPm0rOzhp9/97W7W/J1UhBTDOVO?=
 =?us-ascii?Q?tsUbWE1JhhaTW8DASkyPGz2O1mMGnj68pAMCdprwtKvfS3l4PUIRXS6+OxoK?=
 =?us-ascii?Q?BP9vFa9vLQ3cSPtdioRtzvqB9Epr3EroirjLQNMvbpqLVK7kdfKonbIi5+MO?=
 =?us-ascii?Q?jbw6+QNjoKBUuFIpBmVlmqVjcRC4HROIZGFcF2ZrQzyBTkuCAftpORKq+2UV?=
 =?us-ascii?Q?vC15HfYK4JMVIhmkqjQ7pFSADVh9u9C/so9S5ds0JSOyRpfVyv7D4F/pvnsX?=
 =?us-ascii?Q?uoA/JwDrrpIxtQxQR4/z+uHjC0rKKvXgWjlozOLPcW2IpXS7M5O9Q+EZXfyc?=
 =?us-ascii?Q?HWCgv1g7PyMySAgSWAQN1oJoG0JrW6oweWUg+QSdtzjY36G7fH37l1tRBG8t?=
 =?us-ascii?Q?YUP5o6cwG8NJA73k0LMMoisdr89LCOtey647ZbYNXj5uTuvJW0j7o7KMEnr1?=
 =?us-ascii?Q?zc8/P9X2uFvemMzVUZA5S7d4UL3hHTjt5D2W9vaD/wiClfiraRYh5h6r9Lkb?=
 =?us-ascii?Q?tVFEcH8YjsrY0p1c8oZreXr/HLotpWukZ030eO6eSzfRte9TJhdPnjr/2IYQ?=
 =?us-ascii?Q?3py5iaJ5lyGwSzIHy3DlGPQEu8ysgQuejLmh0Wy6JXGyhPQribROi11OPCJ+?=
 =?us-ascii?Q?3PcVZJXB+rxh/GIISWYbEm04PjzW8tyylmpr4WOtg2IHiZIpJJFKL7Nc4vsh?=
 =?us-ascii?Q?2ROQOLopRGOWw8quFGdsNOfUiOyva3N60H46dJM5gKpjgP1erEjMn6/I5K2O?=
 =?us-ascii?Q?oAenz+cGdtPnw2eLPhwUG+HfHu965mEB8+02qsz51pn5fbGGSpwgpiWB+S91?=
 =?us-ascii?Q?vpHku1DO2nOnRxDKnFHJdQ6ZrSZtvAXWZSzzpiFlYUeduzYIR4eBHlrjgZDg?=
 =?us-ascii?Q?OE6t6l3vhxGYQIGE8SnUP1QDEmcx1hK918/hOLzN44jdZHsisDdLU3lnLLqI?=
 =?us-ascii?Q?AJrOIo1P6A6BvJPIMQQ8X/k7Ad0QFN4ArpngLwWL/m/Jgmu+qvLYcmXxzkPg?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da20fb3-8bc7-40ff-7301-08db3c0aa9ee
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:34:30.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bJEYeNGzFb3h48UVgpz0Xc2Nsg4cApHOYT/4d0RdSZMIYRg5g1gR5vyayvRoR6FoPRj2s9T0BsWTePf2TwDGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7113
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: YUUERj-JgFRNJ37wEfA-_fAY_p-kIzds
X-Proofpoint-GUID: YUUERj-JgFRNJ37wEfA-_fAY_p-kIzds
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
Cc: gfx-opensource@list.ti.com, airlied@linux.ie, afd@ti.com, detheridge@ti.com,
 boris.brezillon@collabora.com, rs@ti.com, donald.robson@imgtec.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the initial DRM driver for Imagination Technologies PowerVR
GPUs, starting with those based on our Rogue architecture. It's worth pointing
out that this is a new driver, written from the ground up, rather than a
refactored version of our existing downstream driver (pvrsrvkm).

This new DRM driver supports:
- GEM shmem allocations
- dma-buf / PRIME
- Per-context (device node open) userspace managed virtual address space
- DRM sync objects (binary and timeline)
- Power management suspend / resume
- GPU job submission (geometry, fragment, compute, transfer)
- META firmware processor
- MIPS firmware processor
- Basic GPU hang recovery

Still to do:
- Document format of job streams and static context state
- GPU hang detection
- Handling for running out of parameter buffer space (this has made progress
  since RFC v1, but is still incomplete)

Currently our main focus is on our GX6250, AXE-1-16M and BXS-4-64 GPUs. Testing
so far has been done using an Acer Chromebook R13 (GX6250 GPU) and a TI SK-AM62
board (AXE-1-16M GPU). An example SK-AM62 development board can be obtained
here: https://beagleboard.org/play

Firmware for the GX6250 and AXE-1-16M can be found here:
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

A Vulkan driver that works with our downstream kernel driver has already been
merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
a draft merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

The Vulkan driver is progressing towards Vulkan 1.0. We're code complete, and
are working towards passing conformance. This is a work in progress, so we're
not sharing numbers just yet.

We are still looking at whether any functionality can be replaced with DRM
common code. We are still considering drm_sched and the GPU VA manager.

The code in this patch, along with some of its history, can also be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

Sending this out now as it felt like a good point to get some feedback.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

v2:
* Redesigned and simplified UAPI based on RFC feedback from XDC 2022
* Support for transfer and partial render jobs
* Support for timeline sync objects

RFC v1: https://lists.freedesktop.org/archives/dri-devel/2022-August/367814.html

Sarah Walker (2):
  drm/imagination: Add initial Imagination Technologies PowerVR driver
  dt-bindings: gpu: Add Imagination Technologies PowerVR GPU

 .../devicetree/bindings/gpu/img,powervr.yaml  |  105 +
 drivers/gpu/drm/imagination/Kconfig           |   11 +
 drivers/gpu/drm/imagination/Makefile          |   36 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  380 +
 drivers/gpu/drm/imagination/pvr_ccb.h         |   51 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  390 ++
 drivers/gpu/drm/imagination/pvr_cccb.h        |  112 +
 drivers/gpu/drm/imagination/pvr_context.c     | 1428 ++++
 drivers/gpu/drm/imagination/pvr_context.h     |  412 ++
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  762 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  760 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  223 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  133 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1634 +++++
 drivers/gpu/drm/imagination/pvr_drv.h         |   89 +
 drivers/gpu/drm/imagination/pvr_dump.c        |  353 +
 drivers/gpu/drm/imagination/pvr_dump.h        |   17 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  559 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  185 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1107 +++
 drivers/gpu/drm/imagination/pvr_fw.h          |  345 +
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  115 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  598 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  276 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  279 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  505 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         | 1122 +++
 drivers/gpu/drm/imagination/pvr_gem.h         |  386 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  551 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  163 +
 drivers/gpu/drm/imagination/pvr_job.c         | 1096 +++
 drivers/gpu/drm/imagination/pvr_job.h         |  116 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  196 +
 drivers/gpu/drm/imagination/pvr_power.h       |   37 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  160 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2271 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  369 +
 .../imagination/pvr_rogue_fwif_client_check.h |  133 +
 .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
 .../pvr_rogue_fwif_resetframework.h           |   29 +
 .../gpu/drm/imagination/pvr_rogue_fwif_sf.h   |  890 +++
 .../drm/imagination/pvr_rogue_fwif_shared.h   |  258 +
 .../imagination/pvr_rogue_fwif_shared_check.h |  107 +
 .../drm/imagination/pvr_rogue_fwif_stream.h   |   78 +
 .../drm/imagination/pvr_rogue_heap_config.h   |  113 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h  |  356 +
 drivers/gpu/drm/imagination/pvr_rogue_mips.h  |  335 +
 .../drm/imagination/pvr_rogue_mips_check.h    |   56 +
 .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c      |  321 +
 drivers/gpu/drm/imagination/pvr_stream.h      |   74 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  270 +
 drivers/gpu/drm/imagination/pvr_stream_defs.h |   14 +
 drivers/gpu/drm/imagination/pvr_vendor.h      |   77 +
 drivers/gpu/drm/imagination/pvr_vm.c          | 3811 ++++++++++
 drivers/gpu/drm/imagination/pvr_vm.h          |   99 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  223 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 .../gpu/drm/imagination/vendor/pvr_mt8173.c   |  121 +
 include/uapi/drm/pvr_drm.h                    | 1502 ++++
 71 files changed, 33724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_dump.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_dump.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframework.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vendor.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 drivers/gpu/drm/imagination/vendor/pvr_mt8173.c
 create mode 100644 include/uapi/drm/pvr_drm.h

-- 
2.40.0

