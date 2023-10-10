Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39997BFDB6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150A310E370;
	Tue, 10 Oct 2023 13:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2010E370
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:35 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A5YLpw004177; Tue, 10 Oct 2023 14:38:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=kM8jwGCUJcMdWptTvqbrL
 t6GRMGtNZOJJX6SOOTiRQg=; b=E1gVmnvLc2sL/C2dSJwQziit9FXKPLEkRRlu3
 vJWKSUwu+sUIlWdFpduF/qbc4h2BCNPs8yy+MxqbXhlSbubCZnJhMFEIm4tLJL8O
 4BTgaEeVgHY12/kVGR5sKfNt4fl9mEandEpc95/cJf+J22poJX6QKSMbQ73wXi6X
 aJ7tpDGHl542rp9ty/3gG+yfBgk65NwJRu0jZ1DQXTJvpYoqNq4q2jNOxu8e5mpq
 Xfr5orJOcFRYNzXbQK+KAJdeP02+klHRsSpFUJfGBDAayM4xSxBB6mbL4c9xVy+2
 DAiOQ7+x0DnQyhO7hM/huL6eF96TS55//oa0bqs8NLbXr6Qog==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3tjwkq2a5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:03 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:02 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:02 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5rL7hWlBLQNv7TE/DkDlLJmGgy4fH2hCplD7+IdpGio1Sarb4MoT83JJ1gBU4ga5k0Irc51tF5vTy0dJEbn5ImOHtr15FTSC4eHgJpcgvfoDaT6UV+k3QFAUhkmL5jl6K24af3hamt6Vk9RcxxUIEoqRLM5ycSHbRd/7O88NWGOYp0V4J/Xcxxnn2W+KADEoRa+zKTzP0oJaB6/iAfIDIZYKWRkc3CoTk5KjU4Ya7eI0t52DSgO8QwdN5jhN65szVqF0Fz33IqqevUTsA9egYg5BRkFRzZP2kgk2AZgfxaFeHx8utBwq7uEjYuI1+cK08ahl8T1A/aqZhk9MrQofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM8jwGCUJcMdWptTvqbrLt6GRMGtNZOJJX6SOOTiRQg=;
 b=L85QX5sdVRU9JZKR6GSu80RlnJ144aewQCZ5k4AXr2dOk13GsXpvFeJMhHWh2ZbOWt6B9GR3Nca9s8YKx8OJ19KyQOdepQLuVgavbJBc++qb/1Ef/0SgdB+mI6oKjoDjOgGeVcga8QFdGOKROAPnWmf6p0NncgbE7aYKErdFRM4yDT27x9QsNvxud5fEH7eZH0iRzDiUZWIIDnwFXSn3vRofkLBxv2c2H7kqFtCQwJ0q0g/HY+5TmQWKllaqQj5IfuZVxeWUhS3vaV5UGDq2T3puBGDiGfC/Dj9p94rgijMhw7ozGN9dgKPRBWUr3oHom62DujmCBJ0/xM/vlXEC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM8jwGCUJcMdWptTvqbrLt6GRMGtNZOJJX6SOOTiRQg=;
 b=nIeAYdW2DxmFzol+5hRx+84kpsLaIc+0SxEFjI70OpK+yUFamN4TQlMCQ9bMp6dpstD4x1gb5L0aYViPUpxwpTxwLwcZ2YDe/oHyg8ztjj1om18hSLeiI2KFfqmGgABnFX4RQPsabLJ2dnGN3Qa+yQlqi8eOyeKZV0m1X3M2LdA=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:00 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:00 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 00/20] Imagination Technologies PowerVR DRM driver
Date: Tue, 10 Oct 2023 14:37:18 +0100
Message-Id: <20231010133738.35274-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2442:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b81aca5-1ada-4b44-3faa-08dbc9961f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VUwblM8TcsChlczSMBW8NuRRrs/Dn6rNLr1YAt9S34KJ35tJQKuej3y3w3jK1eARs4w6fVEKpsDWMUYLEfZEPQTPgqMkR6pLLoNPBgCPpxd8GJhFsp4GCaOGdaJaTAVO2KgKH4iJF74KHT06ABhi2rlPISh93QdFnMr09mbE2z4b+SkRKBJGHhMtMFukQF+Gmi/HbnclyrQkL+62xdFbK+2ZMkXcSlZJw0Nj0jtNw8SYKBLJuqH8fRha4AMyQ+9m0xSX8W1PifIeABmLLp4bAUMY/nbtinRyDq4K/0dEAOpslHxbaCnQ/dZBUBNO/VI95vTJf8tIR/i+7vtytBaXyhYTD2ekVqZNecBpQ3CpAnsfBg9DrsLhvxwpwFfa9N17Qp5ouDWp6+qD2oVRCq2GciADG9gvlIEpNODh4vH0EOxvVyhvgby4gEFXHlhY/VO1LanDSVuR9rRXlslVuuqdSE4sNhAF0QJG+myHwoQe1gNXXQZVRJL1RuhFTropWf83h8S0QwDa8fIFGdXAUSVhsUbAe+gSC9boZj7pGGIUd8ohPjp4P++8wDBv23BnAUtttCEhlXDs8k9G65PJyR6V5vgsEKauLqBKstf3mGxAIHsDSdTq2mL+x++fL+nEsO9HZX4eVSrv3CUY+cfOW3te7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(52116002)(1076003)(6506007)(2616005)(478600001)(966005)(6486002)(6666004)(44832011)(26005)(83380400001)(7416002)(2906002)(30864003)(5660300002)(66556008)(66946007)(66476007)(8676002)(8936002)(6916009)(4326008)(41300700001)(316002)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?furJQWXgsDE9QOPd9XZSkyIHzTo96S9ZyKJiLkuOerlstFExMBeQ85lGJyK7?=
 =?us-ascii?Q?T3vOjFBKEuksQL6omJlYvR3SCQHWycHypMnTqirXlIID0bm8fjFcfcouQObj?=
 =?us-ascii?Q?EJdYKbQbntyHvAnjVI4sP0y7qm19nSF7u8krVlEo4NISFCuGZcN5tivNeBu7?=
 =?us-ascii?Q?wkISQ+Gjvp0Xt++TUkTe4xn5YFFC8++KsXMg3dShIrGt/OZ7HtiP5nBq1PbN?=
 =?us-ascii?Q?59y6K4j7cooqSflq0oWDddR7fohbKkVAOs8QTl+S8WOdbuayJThugDa9O6rb?=
 =?us-ascii?Q?8Im9vYWDSS9UhhjPv2BMxOVsxLMryaA/NlCtHP1tZMEKO8vlZFXq6xXwQ2eN?=
 =?us-ascii?Q?rcoNnrOeoEZScjj2HH8IGqy2mbUrnpOhIZIiQgmOv9I/iaFWc9Q7qRkxneO1?=
 =?us-ascii?Q?c8O1LD58uzsh/weA/5RFQv/y4xHSa5oPvgwNHqqMcqBniIig6tK7O5mGUCGU?=
 =?us-ascii?Q?rGfEptDGJOxsAxiCknAGcDLmIflAh2YEakpgWsgIGbaYPVG1CAenlDbeAq0f?=
 =?us-ascii?Q?Wz1ISQT57z4Frqtfw+tivt5a6QhDucCOPdfDnD+JLDy7oy15Re0wsFjTsgPx?=
 =?us-ascii?Q?uPVaRieTO4BBOxnntOfU/toakDSybBCf0xehM8X9oum1+UjDIECZc/n/Glqd?=
 =?us-ascii?Q?xk/ph5hOJ+oLeq9IMjVTizRUk+7tjGyj8g7+3I/vE03KGzm7B/+botj1mxS/?=
 =?us-ascii?Q?uUdFHAZMuwin5jpVy2dQH2hgi08CLTyOZMaF38Wdp8+i+JNDVFHQV2QMAgnl?=
 =?us-ascii?Q?vj8QVQV+SBQDtBlLc6qR/bjgtiD3CqJ/SG36PHv6ggTM3MJS/W8xvMwUKJeh?=
 =?us-ascii?Q?XExoE3AsLopk72nx1AzQ+D89xtFbDqoj/INKRcsxyn68Nf9qr44SRE699kp/?=
 =?us-ascii?Q?Rx16smbUfehZ1dVgAx0q5YK7PJHwBy9Co7hDmhRSslzZG/9K1hNgTQ/K4SVZ?=
 =?us-ascii?Q?xxGZUWMixMpd6WK23WA5003danIKDuRO/DFsPd+8HrevbjjAlHZediiZCe8s?=
 =?us-ascii?Q?W3a5XFsslhJCzV8lhtRns0yPs2J/lj7kB4tPZkvT5KUpdPz0pl27dWnMvSmo?=
 =?us-ascii?Q?5LurQxP8VjlhfvKplVGYtEBz2lygmei34btNN6bE5Qn2eFUZ3Ne+BvS2gT9N?=
 =?us-ascii?Q?XlNFnW5yt0ZrsaD+d6SxmainYncrsEiksf9F5skG3bdGcsb+05wKm8SuU3wH?=
 =?us-ascii?Q?jWXjaOlxmtLOfIN9G6/u6R+irHKF+69t1EjLzz0GtJO2gaqhqS1RCusGeeef?=
 =?us-ascii?Q?Ob2oKePJb9QgeeA6yG7932LnMFiZPP9HkwiPvAczeaCdj0Tzf8SV1jT50aFB?=
 =?us-ascii?Q?+T+xpk0Cy5M4mMIsC52Ls8Dc/jFTNgNCmaH3C4fb++HNZhCJfeFsyBzThgSv?=
 =?us-ascii?Q?zuVPBcI+kzWFMhJWLdVsUwRX1bii4mg03Im4EcbWvVJ3nVnxL2jJ625+hH4C?=
 =?us-ascii?Q?w+T08nV1AdDq/5uf5kKPRvISP7eE1bT3XkbRc+QyRH8nLLd5vndGPqyLUfaM?=
 =?us-ascii?Q?QkU4z4zdiGaOVQqbvvVvE3a4fbZztn3E4EV9PZ5CZKFwb1fJCVrQA9Dw9Gjh?=
 =?us-ascii?Q?zlg1cuVtnnxkt6V3vqxKoW8cOAJ1+NbGGFAeHKY9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b81aca5-1ada-4b44-3faa-08dbc9961f07
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:00.7436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCPPBwza9fcy22UDeAWErAHZGuNC5XcTY+YSGRkqn0cLBnycvK74cq1HUFiuZouFNLWPVeK/b+b06+djWp8Wmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2442
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: QCPZjlNyzi16COoaXjejpkd66hFqhlsI
X-Proofpoint-ORIG-GUID: QCPZjlNyzi16COoaXjejpkd66hFqhlsI
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
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
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

The Vulkan driver is progressing towards Vulkan 1.0. The current combination of this
kernel driver with the Mesa Vulkan driver (powervr-mesa-next branch) successfully
completes Vulkan CTS 1.3.4.1 in our local runs. The driver is expected to pass the
Khronos Conformance Process once the submission is made.

The code in this patch series, along with the needed dts changes can be found here:
https://gitlab.freedesktop.org/sarah-walker-imgtec/powervr/-/tree/dev/v7_dts
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

v7:
* Fix fence handling in pvr_sync_signal_array_add()
* Add a minimum retry count to pvr_kccb_reserve_slot_sync()
* Don't initialise kernel_vm_ctx when using MIPS firmware processor
* Remove unused gpu label from dt bindings example
* Improve UAPI BYPASS_CACHE documentation
* Add DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE flag to UAPI
* Rename gpuva_manager usage to gpuvm
* Sync GEM objects to device on creation
* Fix out-of-bounds shift bug
* Fix integer overflow in MIPS MMU map error path
* Add missing commit messages

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

v6: https://lore.kernel.org/dri-devel/20230906095542.3280699-1-sarah.walker@imgtec.com/

Donald Robson (1):
  drm/gpuvm: Helper to get range of unmap from a remap op.

Matt Coster (1):
  sizes.h: Add entries between SZ_32G and SZ_64T

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
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   18 +
 drivers/gpu/drm/imagination/Makefile          |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  648 ++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  109 +
 drivers/gpu/drm/imagination/pvr_context.c     |  464 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  658 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  704 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  254 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1513 ++++
 drivers/gpu/drm/imagination/pvr_drv.h         |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1489 ++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  508 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  554 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  252 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   48 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  306 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  515 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         |  421 ++
 drivers/gpu/drm/imagination/pvr_gem.h         |  191 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         |  777 +++
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
 .../drm/imagination/pvr_rogue_fwif_client.h   |  373 +
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
 drivers/gpu/drm/imagination/pvr_sync.c        |  289 +
 drivers/gpu/drm/imagination/pvr_sync.h        |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c          |  963 +++
 drivers/gpu/drm/imagination/pvr_vm.h          |   60 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  236 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/drm/drm_gpuvm.h                       |   27 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1319 ++++
 82 files changed, 34404 insertions(+)
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

