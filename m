Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75B753D35
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8BA10E88E;
	Fri, 14 Jul 2023 14:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14010E88E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:25:03 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBJNfk020760; Fri, 14 Jul 2023 15:24:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=8ApKk9SwiEAvpPOCeaH9r
 bqohRi0OejEsJPEp1sThjw=; b=mWIjf/THfoyBR1XnS0kCxfRBfL4ZHpzT+dwS8
 i6NSGsAyUZTVwmUlUPw2UWprudnsDuudmHhCFNNmJuF95TZhqEwO9twcSvfBw+ki
 46kgtO3yAKopK9abRjMDaGQFN5C0O1SUeP3XheS2tKcw9V5daskYyq3phX6ZLH9y
 ia30cGT4o3q0mcOPFz+hELJKDIjQCSVJ07PKTjYMwBhq1gGVtm8sEEmhndDrvFQ8
 BQQ4eA0cQgyXPvP2HKPCxWqgaYcjXT99afLStGWM9fIKTmEWzgnapwlLQ9AVVSsk
 JPWTMjWCa5iDSix7iSWr5XMgg4JDAOJyJYBF3wf5dB5jCDvRA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gmaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:24:21 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:24:20 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:24:20 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD8dFXNbssz/4JDnP5Kr5kMxlTqi5ZS0GfhCqpj/us5koTaCgARMJpEsTZXcAtkr9R33Blsl46/I6BlSNlX3jlPXSYuhxGjGuU+elQ/nuXoUfqlbT0oWgLsLCiQIDFXWkWKWxzq1jdEBoz219mExHa8dBKb73Jt4xvzfbrrtXbQIibZDU11j33XIMxfsDeELOR6RYzxal9iiNdVlhg3CfDSkNfIviqMZCy29z9QworCYbLKOhpStKrHwqaoXLS/p4qpx+JfVaF1ndHFQCd3f50qn/dFJlv0K8C1qP3Wo1zHV6ntKogde28LeDGt7dSKuJO2xkm2f5WfkfwxLLTCK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ApKk9SwiEAvpPOCeaH9rbqohRi0OejEsJPEp1sThjw=;
 b=nBug34DexEWLg5xSOUa1N0my0mCDL67IID8wihP7voOUjNsaW4ct1+8iNvv7uOLdVqdHn0C2xqbjFZNSIxQf9Qlzu0rBuNGjGhyDByGEgVyXAmVb2Y0PMQXG92BBg0KQJ3iV4QOmflV718k3ZBcfHksOe4+xOUmMsA3aL27Cmx/NqdwIe4fbNArKdMzWx1N23vYVP2ScbdRfJk6XSWjMo9F7kvs6DCVOvhUjjzzE2vnx/a7G5rw0Ae10tbvLyVGiz1OHxuCE+dPaNfy8N7aekgsZiGthMpQzncgf1Chp/E1MDsCrUcGI8XYB8uZ6Su1PmaWkuXsVRTVIg49QS7qsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ApKk9SwiEAvpPOCeaH9rbqohRi0OejEsJPEp1sThjw=;
 b=DHiHz//G2M7riQVMQ3Couj/PcO2M5JyzZ9noCpCyWgdPkSozcUHieIIdfvCJXjH3jt4pXQ66ZxMIlrfSRP+6OMwP81mGHXc2AKjUvhBmZBH8dXVtiDFkp0p+myEhvpVfOCiz+IjhcAzSULYblWPD+xc/a370itCtxtGi3ZG0pzg=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LOYP265MB2077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:24:18 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:24:18 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 00/17] Imagination Technologies PowerVR DRM driver
Date: Fri, 14 Jul 2023 15:23:55 +0100
Message-Id: <20230714142355.111382-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::13) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LOYP265MB2077:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c814eb3-708f-43d1-7db2-08db84760214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5k/mgCG28evgQReNVQGsjtvAjM9yARwnq5X2PLePmefnl3E66ED5MB+OBZQ6C6f2iCFX2I+/QJY3GwXV0w1MjTSWMoaPQ+jTtE389m9BPv8dk6njyVyZL6uzzzxpz61Nwl07htzszUpvACDSAXlHoWlxB+ixwx9HPWY7GvABhdW/gR95lFzFNBssMHys5MLSspuoezglOqMvylyArhnXJBtubr35n2RC2vgI9C4weCiAT0nNiNqTTawKwO3r64XjsCe4T3ZeL7NOlhdGcFA3HSQixT0fRXm9i8Kr+0cw+r9MDd0h0OfuAmOKYENHw3NMQfnp5fXXCfeojo9pLL/mbFqWxNn+/YMpiURjdaxXYCl01WOvSZ/bDuPCZZdk7xtCX1/sQvVqTXoS5oU0Z1Bd4zb28SijoD41vCydharyl8BQPBnhCS43QIc9v+hKl3DU0ZlYWZotCdwRmVNHM3U0EEuFmUwB2ny508Hvi//hgIg43DbScDaV8PmMPbGegsEtoRujU0UeBDxppWmkBSA+5Ai2fJ8It4Miyjt0eKrAzzVOI2DX7vBqAKqU/KUZhGH74DGzaunHnK0MGqVAp7m10vHRZnLktgnTWEKn+k0UJLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199021)(41300700001)(44832011)(66476007)(7416002)(4326008)(66946007)(66556008)(6916009)(478600001)(30864003)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(52116002)(966005)(6512007)(86362001)(1076003)(26005)(6506007)(186003)(83380400001)(36756003)(38350700002)(2616005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+MKRRwlYN/OiYH52NqdBixfXteYfPLlXOdHOIyYjlGUlAonyJN54J9kxG/NL?=
 =?us-ascii?Q?gYNK1WdlG5KpJZl2uMzpBZ1DhlGZUV5/OC3xg++zP/YU08kmpysiMsMmCvPV?=
 =?us-ascii?Q?tB3PGYcOv7eBrQRFRBOJ495EY16QHEDdqS6487C20eIm23+6mKSds7PnlLUO?=
 =?us-ascii?Q?sABqxoOrzMlSEiBLWbXUwUH5fcVHGiRsP/wV6iZXvFXerHYxHmzADuv+ejsq?=
 =?us-ascii?Q?0BRRY0wyju9ggS5CGdWJ6W8pGCcowU+p4cd9vKpZp+cvtpKMJ+TukU/Cb0+4?=
 =?us-ascii?Q?uyxKK/EcHvYLmHMbTrWEYjB/Mj84XvgEQ82xol2DjoyYvevCcVpTygHuArz3?=
 =?us-ascii?Q?J7edWtVmTgNs0V20ghGW/tr1sJXf5rk1gHMWao81zYm0c6oxdSGJHljDPb41?=
 =?us-ascii?Q?PknZg44/5laWbmStlF2ojxM+B7D5RDpCqWGUODRf2GP7vEiDFHc6CzWwq0BP?=
 =?us-ascii?Q?Y/5hV9doOS7ZgjAhk4YrUwnNARYlFzzafDpvvO9//JPot1/AVbOIxANda9vf?=
 =?us-ascii?Q?e6aUAJUCjtlQ1oxBQy6TzTW6f6K740D1NKnLpy8wiFKd6Rt2kv+35Y+uA/h5?=
 =?us-ascii?Q?ViC4151DHsVp0mmqBBNAoEMOOGnnJJ9kct/tmAMXUsAzl4H2tR4CJxtxMSZf?=
 =?us-ascii?Q?x3FK+4Ga6Z8+1ZMzbN1NAUABycRUFRzu3IktF/lFadNDfO01vBE53H4jopLd?=
 =?us-ascii?Q?QowQbI75RtXSGRdQLdLi8c1RSSgaQj/Lop6MyEdDDkf9ntdRQOUhK4NzfI/K?=
 =?us-ascii?Q?rl88qosomLx2YAQVRI6Wao1J5h/9U0YNZ1CK+IMMKTznIjJShvKhNxjA/+UU?=
 =?us-ascii?Q?H0vyE2T1o8vrzRc3NKI9vOpMHncSdSB+gPOR9RTD4P3aJuoAtCShhv5/4Cfk?=
 =?us-ascii?Q?x8GbmLhx/+6rrzeaOFvnAW500W0OXbdvYPliZ6u5jZi1QnspF+P1FBJO1+Hx?=
 =?us-ascii?Q?mx+6+CkkeZYIF2/ERvG/mHMUDCXcmapVxDVV8z62al6YAFPA696S0vwepuCQ?=
 =?us-ascii?Q?8KOz3h/jNwwUAcYAxkRhp5k5CwGjNmSMhH5jzpp7f50J+9ugZPSYyRJ717GM?=
 =?us-ascii?Q?/Syf01PHlsefpUXDfxH5V0wWSv8FU0kpbnAfkCi6d+QUX/bCfD0GFnQiNYod?=
 =?us-ascii?Q?iICsbIcN1lMfdhaF5MTAKa8+6ucnVRk4A+V8Y5tDtnWhCwTAKQC1/wMD5mjt?=
 =?us-ascii?Q?MiSYpitVNm7olOR4hATBVvTYcIvlOmZj0v8XzFPTRpPLD6Q8ZUPWmsBPlscl?=
 =?us-ascii?Q?Yi2DhU6ceF/Y0EW8dxTW9+qLuSA9mAsoPwp3KkMQyzXdAgmzYZCNWasff9HU?=
 =?us-ascii?Q?ye0H9WprbT0/Fy65HcLsB2AXi4qSKlqqjGuDw2necLOgyKNzLPU1mAn6Biml?=
 =?us-ascii?Q?nzl93fFsKVMxLV6FZfyBUH2zG/KIf3kVGdR4JZZpSo7hAxG50YsZmtOVKe5I?=
 =?us-ascii?Q?HwBfu7jVb/jFH2BwZCfDozqj6bADqxmF2tNZOnAjMPru45rgk+SYT5+MTWnK?=
 =?us-ascii?Q?K77grEbeeoR2C4Q51qheGH2I1U7iRLexZu1cQIkjUezoDaUmfQ0SNBm16pgK?=
 =?us-ascii?Q?a5/5wpWgkJ2ARnAkCLVYR+NwHZQkIXFtKVY8nJSz95Ms3eyBHrLGYYz0pIye?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c814eb3-708f-43d1-7db2-08db84760214
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:24:18.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwcvpZ+B8YctYaRM3Ajqz6Up/S1qgELPUAyOMM4G9lo0i9Hb50jX3b1vGjI52R2AhPRJOIU5hewTlqS8+2z6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2077
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: EGRwX7471kI2Ppt2I0ectx-PwZnslXzQ
X-Proofpoint-ORIG-GUID: EGRwX7471kI2Ppt2I0ectx-PwZnslXzQ
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds the initial DRM driver for Imagination Technologies PowerVR
GPUs, starting with those based on our Rogue architecture. It's worth pointing
out that this is a new driver, written from the ground up, rather than a
refactored version of our existing downstream driver (pvrsrvkm).

This new DRM driver supports:
- GEM shmem allocations
- dma-buf / PRIME
- Per-context userspace managed virtual address space
- DRM sync objects (binary and timeline)
- Power management suspend / resume
- GPU job submission (geometry, fragment, compute, transfer)
- META firmware processor
- MIPS firmware processor
- GPU hang detection and recovery

Currently our main focus is on the AXE-1-16M GPU. Testing so far has been done
using a TI SK-AM62 board (AXE-1-16M GPU). Firmware for the AXE-1-16M can be
found here:
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

A Vulkan driver that works with our downstream kernel driver has already been
merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
a draft merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

Job stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0ae39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml

The Vulkan driver is progressing towards Vulkan 1.0. We're code complete, and
are working towards passing conformance. The current combination of this kernel
driver with the Mesa Vulkan driver achieves 86.2% conformance.

The code in this patch series, along with some of its history, can also be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

This patch series has dependencies on a number of patches not yet merged. They
are listed below :

maple_tree: split up MA_STATE() macro:
  https://lore.kernel.org/dri-devel/20230606223130.6132-3-dakr@redhat.com/
drm: manager to keep track of GPUs VA mappings:
  https://lore.kernel.org/dri-devel/20230606223130.6132-4-dakr@redhat.com/
drm/sched: Convert drm scheduler to use a work queue rather than kthread:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-2-matthew.brost@intel.com/
drm/sched: Move schedule policy to scheduler / entity:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-3-matthew.brost@intel.com/
drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-4-matthew.brost@intel.com/
drm/sched: Start run wq before TDR in drm_sched_start:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-6-matthew.brost@intel.com/
drm/sched: Submit job before starting TDR:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-7-matthew.brost@intel.com/
drm/sched: Add helper to set TDR timeout:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-8-matthew.brost@intel.com/
drm/sched: Make sure we wait for all dependencies in kill_jobs_cb():
  https://lore.kernel.org/dri-devel/20230619071921.3465992-1-boris.brezillon@collabora.com/
drm/sched: Call drm_sched_fence_set_parent() from drm_sched_fence_scheduled():
  https://lore.kernel.org/dri-devel/20230623075204.382350-1-boris.brezillon@collabora.com/

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

High level summary of changes:

v4:
* Implemented hang recovery via firmware hard reset
* Add support for partial render jobs
* Move to a threaded IRQ
* Remove unnecessary read/write and clock helpers
* Remove device tree elements not relevant to AXE-1-16M
* Clean up resource acquisition
* Remove unused DT binding attributes

v3:
* Use drm_sched for scheduling
* Use GPU VA manager
* Use runtime PM
* Use drm_gem_shmem
* GPU watchdog and device loss handling
* DT binding changes: remove unused attributes, add additionProperties:false

v2:
* Redesigned and simplified UAPI based on RFC feedback from XDC 2022
* Support for transfer and partial render jobs
* Support for timeline sync objects

RFC v1: https://lore.kernel.org/dri-devel/20220815165156.118212-1-sarah.walker@imgtec.com/

RFC v2: https://lore.kernel.org/dri-devel/20230413103419.293493-1-sarah.walker@imgtec.com/

v3: https://lore.kernel.org/dri-devel/20230613144800.52657-1-sarah.walker@imgtec.com/

Matt Coster (1):
  sizes.h: Add entries between 32G and 64T

Sarah Walker (16):
  dt-bindings: gpu: Add Imagination Technologies PowerVR GPU
  drm/imagination/uapi: Add PowerVR driver UAPI
  drm/imagination: Add skeleton PowerVR driver
  drm/imagination: Get GPU resources
  drm/imagination: Add GPU register and FWIF headers
  drm/imagination: Add GPU ID parsing and firmware loading
  drm/imagination: Add GEM and VM related code
  drm/imagination: Implement power management
  drm/imagination: Implement firmware infrastructure and META FW support
  drm/imagination: Implement MIPS firmware processor and MMU support
  drm/imagination: Implement free list and HWRT create and destroy
    ioctls
  drm/imagination: Implement context creation/destruction ioctls
  drm/imagination: Implement job submission and scheduling
  drm/imagination: Add firmware trace to debugfs
  drm/imagination: Add driver documentation
  arm64: dts: ti: k3-am62-main: Add GPU device node [DO NOT MERGE]

 .../devicetree/bindings/gpu/img,powervr.yaml  |   68 +
 Documentation/gpu/drivers.rst                 |    2 +
 Documentation/gpu/imagination/index.rst       |   14 +
 Documentation/gpu/imagination/uapi.rst        |  174 +
 .../gpu/imagination/virtual_memory.rst        |  462 ++
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |   13 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   15 +
 drivers/gpu/drm/imagination/Makefile          |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  642 ++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  268 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  109 +
 drivers/gpu/drm/imagination/pvr_context.c     |  461 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  656 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  723 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  227 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  135 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1530 ++++
 drivers/gpu/drm/imagination/pvr_drv.h         |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  639 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1452 ++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  506 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  115 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  569 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  261 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  302 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  517 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         |  388 ++
 drivers/gpu/drm/imagination/pvr_gem.h         |  194 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  552 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         |  605 ++
 drivers/gpu/drm/imagination/pvr_job.h         |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c         | 2431 +++++++
 drivers/gpu/drm/imagination/pvr_mmu.h         |  103 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  421 ++
 drivers/gpu/drm/imagination/pvr_power.h       |   39 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1457 ++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  179 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2208 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  371 +
 .../imagination/pvr_rogue_fwif_client_check.h |  133 +
 .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
 .../pvr_rogue_fwif_resetframework.h           |   28 +
 .../gpu/drm/imagination/pvr_rogue_fwif_sf.h   | 1648 +++++
 .../drm/imagination/pvr_rogue_fwif_shared.h   |  258 +
 .../imagination/pvr_rogue_fwif_shared_check.h |  108 +
 .../drm/imagination/pvr_rogue_fwif_stream.h   |   78 +
 .../drm/imagination/pvr_rogue_heap_config.h   |  113 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h  |  356 +
 drivers/gpu/drm/imagination/pvr_rogue_mips.h  |  335 +
 .../drm/imagination/pvr_rogue_mips_check.h    |   58 +
 .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c      |  285 +
 drivers/gpu/drm/imagination/pvr_stream.h      |   75 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  351 +
 drivers/gpu/drm/imagination/pvr_stream_defs.h |   16 +
 drivers/gpu/drm/imagination/pvr_sync.c        |  287 +
 drivers/gpu/drm/imagination/pvr_sync.h        |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c          |  948 +++
 drivers/gpu/drm/imagination/pvr_vm.h          |   60 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  209 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1304 ++++
 82 files changed, 34209 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 Documentation/gpu/imagination/virtual_memory.rst
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 include/uapi/drm/pvr_drm.h

-- 
2.41.0

