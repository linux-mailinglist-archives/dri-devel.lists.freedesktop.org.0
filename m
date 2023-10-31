Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915817DCFED
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBB610E51A;
	Tue, 31 Oct 2023 15:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F9B10E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:47 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VDoqY3030766; Tue, 31 Oct 2023 15:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=9pL6SJ84mlnFKhAF6Oc5x
 3UgCZPBPaHrYjQtgNSexqU=; b=JVatyVqxXJubFp6OoRMX++rTNKxjTRqXnNhHp
 9jLvYz+Qyvoh+I78eLQjOlKpXB+mfvENOxnXhxnbta+lxt/VO3b4Els2yCETPnEI
 0xCPsJA+Ag4VBcEVvHAXZuJ54v+sXUJh7sln5K1ZNqNcBicD95XnRQzX88ZTWkVY
 KEjk/f+4my2OrH/Ae1w11DESBE/OrKMmB+TwqB/q0sSL2+WLv6w4WBKBLryNWd1M
 pJvaQ2sPANrKZR+xZAN8mfxf60z2o20c4/EFnJStOJQh55rxR4EZC7AUXOs8dMV0
 nJRdh9J/WVrX881/JW2snfwmXQgDv9OkuAu6INOA6KWKGU3Yg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf3v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:15 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:14 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wgypemhj9pm8P6cf+dyVVkigdYGgnloBKjWfyYCa/+v1EUJ8N3EbIXEZKTEAv9p6i6mAgMOE8WXRlvD+7Do4ZHZF2r8P781X+BJl2OdQ4FswA/IkJK/jrTOECVSHFh9oUaHfZfNdxW/k/KJ8c++YM+BP9E8v+acqZKTxekoGKk5y5Jqttq//Qb3hhHla3fqTa9/8EOUxhxVJAA28P+HxMUZ+202mDfgzEUYZkJLwH1XDiZo4plK2meL1DweBanLImTuBHBdeI9CTZ9b4rDJLeBC5wDOhG+GdgdpEKa/G4dAuF8lFW5Tx+l/pyUChBxfiUz7NA4Axq2hu4PGbGzN+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pL6SJ84mlnFKhAF6Oc5x3UgCZPBPaHrYjQtgNSexqU=;
 b=e5A5f+ZTIYHfqwRGWyJysaJbqat3YjGsUC9CpRZ91aedvGrqRoGLQqCrshxvkcPo+xoIVeyJCj6wYejKsfyjz/SkUmykUAj+PhAHjdKf12t6MZyIQ52g/rJVi9yUEh3Vu6pKdFJbeDiFCPZ1Hh6SVW9QKipRBjKKIZZyDRNKlwCyQp8kR7BvhLUr1rvdVC8b9mmTqWUxPDud77kd7tfgPfpV36QaAN3F7JzY5jQMOtqsJPX7gOjx63TrPqadvMEyx6GRd1CRvjH0rJ+O2pyttB1eD7I/qSYzya5Rtqo/2dcQMhZto/X90F53ZcYsdfpS7CcGvaRe8nDfMwlMcpCnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pL6SJ84mlnFKhAF6Oc5x3UgCZPBPaHrYjQtgNSexqU=;
 b=jwIascto0JUqTUeVDMqoHmbQLkXFtfoRT00vDCsufej+x0uxStaJ/+2BkrodMXtKuJ53JWhddE8pgmFlcjm682ZgMI9ztFso7mE+FmXmlcr+i8o6Il7VOKrJbhQ77YBklr40CxnFF1QWBdPa9DRE+Be9gnQc3XzR1DVhz9zkmnk=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO4P265MB6572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 15:13:12 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:12 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 00/20] Imagination Technologies PowerVR DRM driver
Date: Tue, 31 Oct 2023 15:12:37 +0000
Message-Id: <20231031151257.90350-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO4P265MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d54ae29-e515-49f7-6fbe-08dbda23e64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBJDLXMZ0JgV6dJTp/kM8MGoNT2axcl40wwyBvh1Fs/HCNR32TJd4eFTY8lhoBO5NQLo+QUkFw4C5+x+Tf4Xnt25N6t8GJMPsNK0MbMpubMEkwPdUc2/e/DbM7SAr6uhmVOhMITQSGiY82TQKltWDU9oqwyi3pwqjsOH5nW3LYg3E8iCxj+iVySLPic5DwG6iMDVuLbyuzKTyWOiSpUY9L33nW/lirdkKTf/NXfDKOnW3yJsJclVcCek9j3F4qSuQbsUGvKB2W2YY972P/8pp4pI3QotV2ShMf/TseNLj7lfXvvUqUL6OLlIth6AKFOGrDXK3uPgdtSvoeQRUkB8QjC683Br3OYdSJef1NFOP7relrvZ3U4maviH8tI7Gs+i8P6+DeVJECDidW2riu+vyhUjgbhD7PCdKFJ69u3YQpQOGaBVxtTG1dVtcZuEQib8P6Z+Ze7z54awjoWJ3U6w/T50KqD6NGpKvfLDpjsPiZBb4CY1O/1UCsLrURV41viaY6fTbK/PGDKMGXbZeQWDbe3NzPv0M6y/kckBdaOvaC/gsgB+Tw3GsVctyFDiG8WYTgPrRSy0iFyLs0ZVYE8/wuMm32XCI/I0PyFuK3hgZw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(478600001)(6486002)(966005)(86362001)(6666004)(2616005)(1076003)(26005)(38350700005)(38100700002)(36756003)(83380400001)(6512007)(6506007)(52116002)(66556008)(66476007)(41300700001)(44832011)(316002)(66946007)(6916009)(5660300002)(8676002)(8936002)(4326008)(30864003)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fbigh6NjcAUJoY7vTsTs8n2MEnRqonyQSt3Vs2XuBJb/wjsg1ggLSAMdTJ0I?=
 =?us-ascii?Q?YCnzgby7nUlgecEcODvU0n4uXIszfNsPBRPEQNPf5o8AiDTG6Bl86Zzxr+3a?=
 =?us-ascii?Q?OHgnGqLBiF/xwKXV7vjur7HLcBS6CJPa6Iif6yeFS2NdBj9zxBpDDCBD28kd?=
 =?us-ascii?Q?n3iVvDUcqZFfMZPJVDCIQqiT+zbcFtUrtIBNsn0cmjoRHGOvCZtPsrr9+8qP?=
 =?us-ascii?Q?nDZBzjRy99nP5Vapiqd8/RjECHRrAYAMET0JJsDfWq3X7aDU8NrvMZLpBYf+?=
 =?us-ascii?Q?V46cXVEh+ob11gcfaKQAGKfess+Xn1grDVpceIOxEi1KunpjjNMnbKqn6hRM?=
 =?us-ascii?Q?p+67zKOxxMM3GMGcgOTrpPi0iTKvdWhGpo8XnJV0+o2QdqHpc1V3CiFQTKwf?=
 =?us-ascii?Q?2I+moDVTArC4YyVNNFqgYDA03lrkI3GQsDkcL4MjZpGpVQ7209IUqddN48SS?=
 =?us-ascii?Q?WZl+m3kuXUkVL6TKqv1ZMSelDy0mNOPCjLJOjrJ1lRY6Rgn2d9jzyI3FHklD?=
 =?us-ascii?Q?HKJJWsyHMyN/jw3EPIVjZNYQLMj2WwHuqKsZLriHZLU1z+Bcq0cj0BSlqoa6?=
 =?us-ascii?Q?ndugO2RO7ubveX+PsLV1YcH7Fv1397zfXg7dpxLcV3m6eWSf+DXvy32sN+mO?=
 =?us-ascii?Q?W8gYAE9VR1lKlJZPPtWSn7zLGTIrsfFG/puuaqWGTINArmEyzB1fEtQU46Mp?=
 =?us-ascii?Q?wPLPafOaQTAscxJ+kiHviGpLtQl4DStkwbgkxK8nsR+AzYE/grmQ/BdKLkDI?=
 =?us-ascii?Q?SlijNz1GxSb75XGJiV3z5WGW6BpdPtxIoLutVV+OP1J/ddLH//DNgODpTOCb?=
 =?us-ascii?Q?KMUsSYvx2u97Aeinf7br0Jw33/d2IBc4et9vpYnL2O1SmUrV1JKs6i80UNbg?=
 =?us-ascii?Q?8UQZSmTMQJaJEXrhsai24AW7XaNOaeUaiHaoAiy234rkhBapjm4ReF8yXP6e?=
 =?us-ascii?Q?USyfP0Pt+hvdfpzuIf280oddS61xGZGHjvHZjXWo4lg7jP6Fsk4+pAiLKXG1?=
 =?us-ascii?Q?+lzlUmrQT3b4tecnl03ZKO9vRdS7pX2WqXC15RPv3gCXWws//PcEOjdP0D9o?=
 =?us-ascii?Q?lV+klJ+OKQsqP7SxZrlFEzE7qm1ykyZBYXgzQK8Wx2BALoLzCW0O0HFRu55g?=
 =?us-ascii?Q?XjmQvCIHtX3VEwSfwAGoYwXrzUuXwFFgNBLw9+l5P5YGSTr9JbnbCCd7yOS6?=
 =?us-ascii?Q?wfrSlCyH8WudLLb17GFU4LfE+TuvKmJIVPdCUi61R4jysS7nsu7hGT1vLfFR?=
 =?us-ascii?Q?o7l1JI4wIj73518C2JQ22x0jVE6axReUPIE7JYkzs1E9AMpSZThcBVpgyoF/?=
 =?us-ascii?Q?h2Kbmf38XO3w0kd3KsNW60E4xxEWWGxUf0sGE0Tqg2jq5b03ZiQCyUB8NcL0?=
 =?us-ascii?Q?ITDYmK4tpZ2iVDLuKh+O+ctq3fd2QX0PUz6Cq4WPYBMU+US679fnZp2x0ji6?=
 =?us-ascii?Q?ADuL9NLgLr08UQaDTRdhgmo1+0mnGowel1HvtzpaOnXt0II3FivjYwqVvPCN?=
 =?us-ascii?Q?sxW5tif2/ZTm0TB0PU/obSyQJ1rdyW4a/PaISw4X958u/v0L18fPSle63Y/C?=
 =?us-ascii?Q?e4G5gLk8IcFpnW3VL5ZvHeAkY5v0xmFJlNkO7Qbib/uvJ0jfws/TH3shBX+5?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d54ae29-e515-49f7-6fbe-08dbda23e64a
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:12.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0SigQ1iNmt/fsVMaeUq1JXBK0rqapfsfdxcg1mE7sgWhj9dguUxm9pg2ZhO5H90aaG7jHw+rAvmEv7uDigzaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6572
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: NFRLX7ny4mu9q0WHdYlMQbgjS2qbACOk
X-Proofpoint-ORIG-GUID: NFRLX7ny4mu9q0WHdYlMQbgjS2qbACOk
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
using a TI SK-AM62 board (AXE-1-16M GPU). The driver has also been confirmed to
work on the BeaglePlay board. Firmware for the AXE-1-16M can befound here:
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
https://gitlab.freedesktop.org/sarah-walker-imgtec/powervr/-/tree/dev/v8_dts
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

v8:
* Documentation clarifications/fixes for UAPI
* CREATE_BO ioctl now returns an error if provided size isn't page aligned
* Optimisations to MMU flush operations
* FWIF change to support CPU cached FW allocations/mappings

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

v7: https://lore.kernel.org/dri-devel/20231010133738.35274-1-sarah.walker@imgtec.com/

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
 drivers/gpu/drm/imagination/pvr_device.h      |  710 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  254 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1501 ++++
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
 drivers/gpu/drm/imagination/pvr_gem.h         |  175 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         |  788 +++
 drivers/gpu/drm/imagination/pvr_job.h         |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c         | 2637 +++++++
 drivers/gpu/drm/imagination/pvr_mmu.h         |  109 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  433 ++
 drivers/gpu/drm/imagination/pvr_power.h       |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1455 ++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  179 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2188 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  493 ++
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
 drivers/gpu/drm/imagination/pvr_vm.c          |  958 +++
 drivers/gpu/drm/imagination/pvr_vm.h          |   60 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  238 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/drm/drm_gpuvm.h                       |   28 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1297 ++++
 82 files changed, 34396 insertions(+)
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

