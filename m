Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862517938FD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C189A10E031;
	Wed,  6 Sep 2023 09:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573C10E031
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866CjBZ015358; Wed, 6 Sep 2023 10:56:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=L7I48Lmc7g6XYgluZw288
 iEWjGckzxbZFAh/S+EeSOM=; b=Cll1j2gbJWfjaB/WPBrnJdBwzjXsLuy8n2BZA
 g5okeUgqT4G4kIh5F86S+rujPt0dYCWdhtzy64jNHpqEhvejeyAMvcJlChT77bt0
 +DHfhD8bcrXSoAdtDmGHttjhrcMngddM2nF2JofuoBfT5wpRb316CwZsQysfDgxP
 dhv4Kavk/d9clmPMstPtWE6wJLDBqlrUutq+OIMz4Appif4Gx8Ppzzabwdtyf+Rr
 1W8zSIu4kEfjNNB+H6HixmQ1WT9aR5N1dKWlRY63Bg61Qp69lUDOOaAO7wvhU4uw
 u7NR1AMjcqPrC/95qtwluU9m5JpzVvSRQUQb+/SfBffXtuygw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu2rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:03 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:02 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:02 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdGPf+p0WiOnetxWWZ5TKMk7TdrbAp+R9n6T5kB19x5/34tICNU5kioCFY+3pr6xmtn6cQsCF99KkMO0y8Xcw9ILnOGVN/RvdodO+4w/ORWoQ7Awfgw2bCKe5V3WkyZeX1JwWVZ8irXmW5uD8kpkCLCyGoDFV2AC5u/4g/dVXcQBUrDaB9qlzEvLmcwP7OOGI6mRFPveZV+Muv2z4M8gtr8kI0XcIhrC9TbSmt0eyYlNkCAxGKmFBlcYi/ifassoMB86VRNkS5taxOAMrMJbjiGRInAM77ZifL5GDX1uJFEqY4GjhBXFB5IwYdIRwpMN7p+1/STkpUsUCiAWFrddUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7I48Lmc7g6XYgluZw288iEWjGckzxbZFAh/S+EeSOM=;
 b=N/zCMx+xodMuhhy5IoSAW7skhrkg3puU5t8Qhes14B2QHju+vfFPHPNqLHzDDdPjNrJfUxWv8Qc712nzK6fZ8eZdWkzlmVwjorfyHeEkZ00+rS6ACYcee02I9j5YzAIyKCkrjiDwqidaTnJtPgrlVSghAOUbSpEdo5ly7XsRek1UWoMlOgtBC4y7VCTv/LgaN40XdY2BfCfyKnpk4PVUwgaYZuA+3wT6kFy8p+5Va7/VCqRG6djTdkU6VRNrnfyDtwx2In0uRgdo/4d0ypikxVcl5jhN+JPhYfrgwM9zD1tzHFycUN7NPl53OvuE3ofWh+XcVRak7Guf2ediMbkzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7I48Lmc7g6XYgluZw288iEWjGckzxbZFAh/S+EeSOM=;
 b=km49xQ3Q/vGdNqdr86RTRFsZDfrGBfMfrrnlm8lS66NK2YN4Oy/PB3djYMf+mjAzNNfrytaIKnqm1jGXIEcOGLbE/pVy88HeULOZGjPBUxefrNfbPlOvV2e714DVNGHIynQ2NS7R55XrPQEsxzkpQRar1DovBXWzyeQAor3QJmI=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:55:59 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:55:59 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 00/20] Imagination Technologies PowerVR DRM driver
Date: Wed,  6 Sep 2023 10:55:22 +0100
Message-Id: <20230906095542.3280699-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad90851-f46b-4c4c-7c51-08dbaebf7903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgCmxe+P3LALq04m8iRTspwzcw40Hj2UK4pbEQ/zYOsHm33t7GGTaVY8lUakUVxzNAwiF1kkKSH2p0vAOWNN8ZR4wIpGiArdubNjpp4krvtBMJz9U0ZJyo5Kxsbo3rj+zAyOp9T2cc0tH4SdqhVdDRPCSku71CMTmNghKqwmQWe0eu+Uu5Mmb6sr5P+gBy1KDlcT6ZC7wJrU1pHXnxxHJ+PoQZIwWcKOr1+1WrCqwTSNK7dcqb6HQJaTF+Ppx96P4AlTA+Ot9DVsjKXeQ+u/65MjidqXcUzAmPe41BBhkcZT1rrEZzVHMGSt8QeetoHIFf+nA0vX+GHHxJbka69+vrkx/k/WYebcyUsD0nXHI57tilbCXCfm3i+9gGUCFm8U8MYjfeEZdk+UzszV/0xWDE6TNnRYghu+Ha8JL8vQe/4d7lOkgY90eOvAOsrW4T/tUVYK64O4OFPkT26MMvEQYQS4mS+HUwSWgifPffMu4d18uE/7293/MfmnoCtvIpVni8nAcRWBaaEfhgSMjQ4UWyiwX8P+MICJt4FpoiVpZQeA9LVNgtlmjj15sCnVhjjJ9QNyrpMZM1sGmmyoIQ1G4nEOLwINbIDYvvqNuuEDtHCx9ffrougAktfI4kJgsXpTdgfmBqMHKXTEiNIqyuovWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(30864003)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(966005)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/PxR8P4XCsEYRB7u1GTNXuLOpXqrHrkAZPFUqPZnoZYo0okEC0/PIG6B+yv?=
 =?us-ascii?Q?bxUOw+cz9htbEmujLFr6iOE0GZ6b1W3lV+u2ZBib3b9sJZaorNXhrP8BWY7P?=
 =?us-ascii?Q?TDLu8N314sYepOMBPqEEdEDxO1wITZ9py4XL2JE2hKWDiaIzitNA/QI0EERq?=
 =?us-ascii?Q?pXPjZkGhnM3QmgiaznLmvD8Q8sMQigg5+dwPag6mNSzGR1alADyik8uN0bHY?=
 =?us-ascii?Q?dPc9PzCQe41GEjeTE4p+SrszR2CxaDdj7Hk261vkkAhBW+O1OMP8p7NFSRl6?=
 =?us-ascii?Q?lAQDTNppIsM66r32yjc58lH44VaVeelM/tdWh45EC7E9QHce4em+Oy6jQ0yH?=
 =?us-ascii?Q?onMQj7f0zuzwKcNBfzryeDDHWQWLvt8+eBfWMAXDfqzK9d/9rlhA5IKJeA9W?=
 =?us-ascii?Q?wEykvRdU81Y+bYpKaqYpztM1/GQ0lC4AQqSz5pyg6aHwzLAnchAJ1sID4xYm?=
 =?us-ascii?Q?mBBh/FizobSDdAmk/UPHVZUf53V2ZjjDeuiNqReeg0QUTM/JV5vAFcCQ7lfX?=
 =?us-ascii?Q?jtWb+001/+muDjz0G5l9URncP6eBuzTE9qaiaunj3KDg6hafBBSOatGd/0Se?=
 =?us-ascii?Q?XyGli6kVG7V+hk9eaZWj4WdEzk2EcLI859/D+ox8NjX1kzcm9w6WY7Z9P4eZ?=
 =?us-ascii?Q?Xt1Oh/LaLL41ulsSGbsy0VL4DigChjZxaiIlTHb4MeXnKzO97raqGGns+Rnc?=
 =?us-ascii?Q?P6SlVdKDiw2ZD3J3zjTvkxam4a8T0UYcWDLMXpbmi1ifoFTJWk3OdBoxFLlt?=
 =?us-ascii?Q?URB3MSnzSY1vv1nC6w1zDXtUkt0TnAc0QjWeOLULRatBSUqo0lLeB4IRxGpg?=
 =?us-ascii?Q?SXL6sVzI6BbdBpDDJ4SeaaTeJcibr1ir+lz82eOR2ZiC87vtEOa0X2AHptvL?=
 =?us-ascii?Q?nrLrSZYdPFCGzIzDOHq4/I56oD+4yWX1eeuKUpbIH3G+86FdnwLIodKwjUBY?=
 =?us-ascii?Q?4RvOvq6EXC18u2xDnZznt3O3SuOm60A7em8E34GaPmnTo1/ou61/o2DymLBt?=
 =?us-ascii?Q?YsuFOoW6qDOQQtKGF+9F63V2rQ/eut9CCQOSVs3OT4aM4hVqtGWRcVVqQFzy?=
 =?us-ascii?Q?hG8wuIcGDEYBbuuqDlFQRjpwS1KhRhtw8xL9w+TeWb7qx/tuiSysbUEwYGcj?=
 =?us-ascii?Q?/e8wNwCc0HjA8O/sqIKKYv+LapE737G6SKYT3nM2R6XQFQaIv8rVubrDw3pZ?=
 =?us-ascii?Q?hBDeZfnE/OgaM7OEAdLABC1nK/s2jicnQQ/fuE6Mzhf2EQpZ/W4r6ntoA+mL?=
 =?us-ascii?Q?DtfghQj6TdjMJp9ymNId+lN2+JHhoj5rYLNnpqtC+9EoPD9N21lE7+a3+a+f?=
 =?us-ascii?Q?iTnv9c5KAE18nIbjaSiAJRIWYN3oGaI1LLWx+du3xjpeKFa9nM0Y7JIjluHc?=
 =?us-ascii?Q?cYvQLf9e1hISRTjxDsASiX01WDoiceAw2swSAfkZcvPZmLRxN76qEbgGTQrD?=
 =?us-ascii?Q?6YQy+3PvFeivNYqERUneqQa3OprlTSRr3h/Rx16CLiPgFIB+We9vyaUowdm6?=
 =?us-ascii?Q?hsyu5Gwbco69Bgz9AShup3JQ6gyixXGq3qll444YrHc7hthpmI9K3I5obOXu?=
 =?us-ascii?Q?f9ct/GkJtdaglDTY4BWPr5YwWU2Fiob2383P4Lne?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad90851-f46b-4c4c-7c51-08dbaebf7903
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:55:59.7247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgtBSWPakqpAIFAxuG72lgiBn/o+PNe4+PG8zW2nG/k0yF58vry456uP4ALjOsLSZx5ZSmspD2R4E3Rx8W2mCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: FfnU_4eLzojefIGFFScRJV0vOVq3Gtdh
X-Proofpoint-ORIG-GUID: FfnU_4eLzojefIGFFScRJV0vOVq3Gtdh
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
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
a merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

Job stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0ae39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml

The Vulkan driver is progressing towards Vulkan 1.0. We're code complete, and
are working towards passing conformance. The current combination of this kernel
driver with the Mesa Vulkan driver (powervr-mesa-next branch) achieves 88.3% conformance.

The code in this patch series, along with the needed dts changes can be found here:
https://gitlab.freedesktop.org/sarah-walker-imgtec/powervr/-/tree/dev/v6_dts
The full development history can be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

This patch series has dependencies on a number of patches not yet merged. They
are listed below :

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

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

High level summary of changes:

v6:
* Fix a number of error paths
* Attempt to recover GPU on MMU flush command failure
* Defer freeing/releasing page table backing pages until after TLB flush
* Add memory barriers and use WRITE_ONCE() when writing to page tables
* Add Kconfig dependency on CONFIG_PM
* Fix a few issues with GPU VA manager usage
* Split up header commit due to size
* Update compatible string and driver description to match marketing name
* Use alloc_page() to allocate MIPS pagetable
* Remove obsolete documentation

v5:
* Retrieve GPU device information from firmware image header
* Address issues with DT binding and example DTS
* Update VM code for upstream GPU VA manager
* BOs are always zeroed on allocation
* Update copyright

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

v4: https://lore.kernel.org/dri-devel/20230714142355.111382-1-sarah.walker@imgtec.com/

v5: https://lore.kernel.org/dri-devel/20230816082531.164695-1-sarah.walker@imgtec.com/

Donald Robson (1):
  drm/gpuva_mgr: Helper to get range of unmap from a remap op.

Matt Coster (1):
  sizes.h: Add entries between 32G and 64T

Sarah Walker (18):
  dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU
  drm/imagination/uapi: Add PowerVR driver UAPI
  drm/imagination: Add skeleton PowerVR driver
  drm/imagination: Get GPU resources
  drm/imagination: Add GPU register headers
  drm/imagination: Add firmware and MMU related headers
  drm/imagination: Add FWIF headers
  drm/imagination: Add GPU ID parsing and firmware loading
  drm/imagination: Add GEM and VM related code
  drm/imagination: Implement power management
  drm/imagination: Implement firmware infrastructure and META FW support
  drm/imagination: Implement MIPS firmware processor and MMU support
  drm/imagination: Implement free list and HWRT create and destroy
    ioctls
  drm/imagination: Implement context creation/destruction ioctls
  drm/imagination: Implement job submission and scheduling
  drm/imagination: Add firmware trace header
  drm/imagination: Add firmware trace to debugfs
  drm/imagination: Add driver documentation

 .../devicetree/bindings/gpu/img,powervr.yaml  |   73 +
 Documentation/gpu/drivers.rst                 |    2 +
 Documentation/gpu/imagination/index.rst       |   13 +
 Documentation/gpu/imagination/uapi.rst        |  174 +
 MAINTAINERS                                   |   10 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   17 +
 drivers/gpu/drm/imagination/Makefile          |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  641 ++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  109 +
 drivers/gpu/drm/imagination/pvr_context.c     |  464 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  651 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  704 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  254 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1513 ++++
 drivers/gpu/drm/imagination/pvr_drv.h         |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1470 ++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  508 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  554 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  252 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   48 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  304 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  515 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         |  409 ++
 drivers/gpu/drm/imagination/pvr_gem.h         |  191 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         |  773 ++
 drivers/gpu/drm/imagination/pvr_job.h         |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c         | 2593 +++++++
 drivers/gpu/drm/imagination/pvr_mmu.h         |  108 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  433 ++
 drivers/gpu/drm/imagination/pvr_power.h       |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1455 ++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  179 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2208 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  371 +
 .../imagination/pvr_rogue_fwif_client_check.h |  133 +
 .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
 .../drm/imagination/pvr_rogue_fwif_dev_info.h |  113 +
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
 drivers/gpu/drm/imagination/pvr_vm.c          |  963 +++
 drivers/gpu/drm/imagination/pvr_vm.h          |   60 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  236 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/drm/drm_gpuva_mgr.h                   |   27 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1306 ++++
 82 files changed, 34336 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
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
2.42.0

