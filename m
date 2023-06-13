Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715C72E6EB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8AF10E39E;
	Tue, 13 Jun 2023 15:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713F310E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35D6A1bB019659; Tue, 13 Jun 2023 15:48:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=bgl8pjfDjlGkPHVfRm+Sk
 SFQOKmNDyh/hZ1olVNok/o=; b=UL1qPGzzKcV4Jmx7dXAV26gXm+RozO9idiA/k
 4OYmbOLnvNY0gwRXICivWfPezzTtbOQhRAodon0tmneLF2+/9KpWUbV3mjedekBP
 Bt5t2CJzE/81UoPe5EiP8t49fxHoikfym3Nm7pviaHVarOME3hpXnobd6QBaE5Bs
 pC+8OnUPxaJzR+9VanEHBjAZAWr+kdB3Q7OeuMT387EmAHzrM0CAfNfxI93AVzBt
 3vvBkt3RrMc2qPuU/fAeJg3mw8kYmKSfUGS3KG7TwRRkf1elUd7VriLLM40wgsNx
 jFpHXvo1nmaHjIMIPie8YBoE4bKejZ2ihzWeRxH5QXw3NiQAQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0k7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:15 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:13 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XntWRl9FBRov7uYpisk6G+uJaFkyfLyhfqawvCaG8RD/aZlul3NlQh5mawKHPrbGCmE9eP6J5pAMTTOEg6XUXycHcyQt9SEBRZhUCX0Wzt5X0k8o8bzt4h3XMV2vae9QhiR5cbnYAfC/qkZNLfzb2MRCYg6L8Jh45eiOmlIQO0WzjVbHjhJKn3OsU6jm20IPSfuJ5ettl4O37TGtmBd+73YAZ0rOytzPBeCWN+h+cVl1xuK1aNqh/0hCERY8JZMepJZhv4A4fuMgpbivacYQtA5grlEzuB4LGN7x7N/MyRryl8j4wIs9R9giR8mNJd0zkpmS3Eokbdc5hE6duFfmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgl8pjfDjlGkPHVfRm+SkSFQOKmNDyh/hZ1olVNok/o=;
 b=KWCz4YeTb1N0QXnmXr4Mzj/A7Lf0xbzDA8NC70mAv5LTfIHL/or2pJGLUT9ziblzeHlLGt4TyN139ZCI6/9dQq7sNL9faTS//Yr8xinj4TRdErwyOTB1efxUPPNqC7Nyxd6x6BurGSLgGQTT23Cn/JpV+7eSomQkwPI6OFxSCZNe/c40iU41jHcsz7uXbp7N82ITzLBCMXS5jlsJcYy/4SR7qdRywQOZicdby3zRW0ok9W8+nUpKPfjJn6nUpLZTOB+mVjl5rj7z/Dt/Ajwr9YY4PTxgbN0XdHjwtyPktFJW1PYpi3W4lGXQDtOEbjukxVybyBxTXHhhFlD8cMOa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgl8pjfDjlGkPHVfRm+SkSFQOKmNDyh/hZ1olVNok/o=;
 b=HPBSBtCI82/bLNYKt5NeTylgGTzelc2OGSuJpH38hQv60mk3EODMQY8yikMwwFqMM2367XaFSkDdQH0oET82N0eojZS76Q1nothoka6eBlGAlMPq0Vbws3iI9XTjHWyvxPbPnu+XTArL5KU4TwHQvm92nySOC1i32aN7rh1Nc5g=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:12 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:12 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
Date: Tue, 13 Jun 2023 15:47:43 +0100
Message-Id: <20230613144800.52657-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: f39e3285-2492-4a73-16e4-08db6c1d35f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C4Vk97Njwe9JRsbqxuzv17tRAH3MXJ+NWkjLr+JGmxuRmuJKC0bqjFA8Hwu7MTp04OJIf0l/9XHoQDT0A4OLZpu7BrHEgkDbPSnck39mKZZXDu7igSQs810RNfdg8qzb9aMtfjFvNQLK9dYMGc98oBh6Had1UIySdJ189X3tGGV3sCivMAywLbuDmm0hP9yWSPR8yIfsLZV58uOukVC7jeoTl34fkh2F0w1oOLGM29xnLGkiTQg5DVisTMgAxq1/rLOOORFSEHiU2TxO3ccZ3W4H8RnL3SnjZfJ5YX1tFqniEmHadQx745fReMPdpe4tV2kh0Gjnhf8dLrYVL6JXAIdya3m9QrgBlU/7vrVphBKj2aXK0Qu7Z2rGkEC/nkbaxlSto0s9qtNlTYwiiZOQlJjG2BZWgHRCV1kuN5v0a+DKO5rdBdgDcmQrOGfwfEKYaRXClqy3iQLZxt4b/yE6N9fdDZbPVJ/kgwbwW7JHwqd/JyIpDcjn+X6FhZioyRDY2K1gZFP9XrK5dCifgJHJ4LQDIqafOvK/sNEDo3kIh1aXGQjC8W6KXfYpRwB2ABSE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(30864003)(66556008)(478600001)(8676002)(5660300002)(6666004)(966005)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BG6ZQoZznoQYYzFmuQFk+fN3Vsyk/VjyCw7afb4tfaTS4z/bLhywJDzlgLZq?=
 =?us-ascii?Q?bBeOZmTRw61zKX+/wLG7nqQM6Ci667iM4CF6HaK8D4paNOuWYJ5r454yO079?=
 =?us-ascii?Q?wz1q3C7k7F1RvguffeR2JylH+z/3BUtOxp1ziVzdnE6lLo7U/V4BcMYmEf3u?=
 =?us-ascii?Q?PASbKFF6PYcgnU7hjGPF6VOjVd8SFfAVDib3+XjOAusPialnh5H/DtO+rPml?=
 =?us-ascii?Q?5UGf09AVCRfESD4lq0WZe2s5+gjRhvFN7nRq4ea8UCVNf/VcnN5BQjTfoYdA?=
 =?us-ascii?Q?8KXMHDGioz0WVFzS3J785JmJfQ4BR+IzfCTTVTH6GagPUxw7X3EL2NfhhP1N?=
 =?us-ascii?Q?HLuhyEHhcGZ5Ew+lhk/rYxRHR+JolfQsmqMmEhMLrQgXQ8WDsacm3W9FesJt?=
 =?us-ascii?Q?QJJp7wIK4ji7SjrIbsi4vqKSfCu0suDgA2PWAL95iT6N2r6B2B1YVxYIo9sa?=
 =?us-ascii?Q?j0YlvL0bVN0CFN6R9+be7aDw9thFAoAJOJdQ+wPg+vMzVWPAlTPu8xz2eX2w?=
 =?us-ascii?Q?QizE6WmS0arA6M/B1kkGXfQ2NV4lNTen/8HgQDRxUgdlz1ZYPHyoAG2LMoeh?=
 =?us-ascii?Q?tXzMzVLqLqDNS2Py5naV2vtnWGyveU4vV+HvUWANsIh1/f5aStPEsgUE/x1T?=
 =?us-ascii?Q?sQAUKbjfj+PmjVuQaq2ZvrzSwYARySTsmiRAtZ6f24OzlhJ64Be+skaKyagQ?=
 =?us-ascii?Q?YoIzJtzeKnb4A5iz+Q2v28wMRAzlzdMFDDEgES5BhRFSMaPuOJ8SLtUdWcY9?=
 =?us-ascii?Q?jyUS6HmegrkhHdJDYMfARAXvJPBi8kg3FliclV+rWczmQwY422tdsx5o5EZa?=
 =?us-ascii?Q?ftRXspnIHcoIkg8P6v8TYijh2QEAqLlckODrer48XyQH5j5DWN/26CEY/XZS?=
 =?us-ascii?Q?8UAkBOPzjYfiC0de9AqEf/rzWuIqJcirqBTCyI3HYCQ+gzqZu+vg9leLksFi?=
 =?us-ascii?Q?jt8zY/PEbOVKVNRRsYzjVFPDvWWwyaj19edFHzKq9yCqVeE0pdvdJspzmnUq?=
 =?us-ascii?Q?o5jDoN8GrtKxlEvlcM4Ghj9agF8HToyVMV+RkpRuUtUIfLE+259KFNUYs9Ao?=
 =?us-ascii?Q?tdLY57cWkFfe6mJlY5pUCBt0uTP9LdNiUOCA6jf0UkuZW0rMJ5/lAsAWm7NL?=
 =?us-ascii?Q?pdY2gzJGMtHkWystbGjlIQo2w747eD1h9dgX99FM+jwJo3L1iXgukKajDjdH?=
 =?us-ascii?Q?Sq0Q7/PuZNXGkdID+mf1A7MvPc1Xds3krBa4ZmZiSg8cxHy5O4z61ZJALHcd?=
 =?us-ascii?Q?2YYGdEBdH9pA/Ra/u6NrtODM0mEF+giwxcd8g0n0cr+VXczpoHqQlTYSFe0i?=
 =?us-ascii?Q?5S2BG3YLBgcYai7ptkqPPc45HzG3q5MCmNp07LPQPvjwNgIARRnbELQUV0wf?=
 =?us-ascii?Q?ZYVnTwXbr7cuLEgZCOUawgomekCyhmsYAnL+7nfUcoTxYDngzOEpAS0Oa1RE?=
 =?us-ascii?Q?6Pg7+9gj1rUDkLi2TMDQRnCgxDrFNFiIWzHXrkeNOUEAm/l+0Rfvy3aVykNF?=
 =?us-ascii?Q?VvIvwi+4jqD7ww8wAfqn70aW7Os6QtdWfU9rkJzqdtToCnvtRxDDCI6yTAwA?=
 =?us-ascii?Q?N7nXVhhN5RM34FXOv9nLK0ZdTQYcYBwDgwSa5k7SB3WVH4FF9DbwIga4nbej?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e3285-2492-4a73-16e4-08db6c1d35f7
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:11.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ho02B4wrb+9+JJ9U87f1o7IKxDxmql/XvEYR5uwOiW1VYo3LD3WUJzYy2nGIa0tQsvshapqKlpB86BOuVe4Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: DfxwTezZrNLtEycnKyIMrG4yvOmg2QmJ
X-Proofpoint-GUID: DfxwTezZrNLtEycnKyIMrG4yvOmg2QmJ
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
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
- GPU hang detection

Currently our main focus is on our GX6250, AXE-1-16M and BXS-4-64 GPUs. Testing
so far has been done using an Acer Chromebook R13 (GX6250 GPU) and a TI SK-AM62
board (AXE-1-16M GPU). Firmware for the GX6250 and AXE-1-16M can be found here:
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

A Vulkan driver that works with our downstream kernel driver has already been
merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
a draft merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

Job stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/73fe6db819d951c02ce57eefcbd9b31b85900f33/src/imagination/csbgen/rogue_kmd_stream.xml

The Vulkan driver is progressing towards Vulkan 1.0. We're code complete, and
are working towards passing conformance. The current combination of this kernel
driver with the Mesa Vulkan driver achieves 71.8% conformance.

The code in this patch series, along with some of its history, can also be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

This patch series has dependencies on a number of patches not yet merged. They
are listed below :

maple_tree: split up MA_STATE() macro:https://lists.freedesktop.org/archives/dri-devel/2023-June/407927.html
drm: manager to keep track of GPUs VA mappings: https://lists.freedesktop.org/archives/dri-devel/2023-June/407928.html
drm/sched: Convert drm scheduler to use a work queue rather than kthread: https://lists.freedesktop.org/archives/dri-devel/2023-April/398458.html
drm/sched: Move schedule policy to scheduler / entity: https://lists.freedesktop.org/archives/dri-devel/2023-April/398461.html
drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy: https://lists.freedesktop.org/archives/dri-devel/2023-April/398460.html
drm/sched: Start run wq before TDR in drm_sched_start: https://lists.freedesktop.org/archives/dri-devel/2023-April/398462.html
drm/sched: Submit job before starting TDR: https://lists.freedesktop.org/archives/dri-devel/2023-April/398466.html
drm/sched: Add helper to set TDR timeout: https://lists.freedesktop.org/archives/dri-devel/2023-April/398464.html
drm: fix drmm_mutex_init(): https://lists.freedesktop.org/archives/dri-devel/2023-May/404863.html
drm/sched: Make sure we wait for all dependencies in kill_jobs_cb(): https://lists.freedesktop.org/archives/dri-devel/2023-June/408901.html
drm/sched: Call drm_sched_fence_set_parent() from drm_sched_fence_scheduled(): https://lists.freedesktop.org/archives/dri-devel/2023-June/408904.html

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

v3:
* Use drm_sched for scheduling
* Use GPU VA manager
* Use runtime PM
* Use drm_gem_shmem
* GPU watchdog and device loss handling

v2:
* Redesigned and simplified UAPI based on RFC feedback from XDC 2022
* Support for transfer and partial render jobs
* Support for timeline sync objects

RFC v1: https://lists.freedesktop.org/archives/dri-devel/2022-August/367814.html

RFC v2: https://lists.freedesktop.org/archives/dri-devel/2023-April/400149.html

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

 .../devicetree/bindings/gpu/img,powervr.yaml  |   71 +
 Documentation/gpu/drivers.rst                 |    2 +
 Documentation/gpu/imagination/index.rst       |   14 +
 Documentation/gpu/imagination/uapi.rst        |  174 +
 .../gpu/imagination/virtual_memory.rst        |  462 ++
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |   13 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   15 +
 drivers/gpu/drm/imagination/Makefile          |   33 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  660 ++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   62 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  230 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  102 +
 drivers/gpu/drm/imagination/pvr_context.c     |  450 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  190 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  761 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  795 +++
 drivers/gpu/drm/imagination/pvr_device_info.c |  223 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  133 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1520 ++++
 drivers/gpu/drm/imagination/pvr_drv.h         |  130 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  577 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  185 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1388 ++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  425 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  115 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  610 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  280 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  280 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  490 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         |  397 ++
 drivers/gpu/drm/imagination/pvr_gem.h         |  201 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  559 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  163 +
 drivers/gpu/drm/imagination/pvr_job.c         |  834 +++
 drivers/gpu/drm/imagination/pvr_job.h         |  147 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  332 +
 drivers/gpu/drm/imagination/pvr_power.h       |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1203 ++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  157 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2208 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  369 +
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
 drivers/gpu/drm/imagination/pvr_stream.c      |  309 +
 drivers/gpu/drm/imagination/pvr_stream.h      |   75 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  351 +
 drivers/gpu/drm/imagination/pvr_stream_defs.h |   16 +
 drivers/gpu/drm/imagination/pvr_vm.c          | 3417 +++++++++
 drivers/gpu/drm/imagination/pvr_vm.h          |   99 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  222 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1333 ++++
 78 files changed, 33644 insertions(+)
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 include/uapi/drm/pvr_drm.h

-- 
2.40.1

