Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E9B9A986
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1E510E760;
	Wed, 24 Sep 2025 15:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZqPBzZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1ED10E23F;
 Wed, 24 Sep 2025 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758727451; x=1790263451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aggC5aj1tNLp5CEAhi0E0+kEswR+nZdk4EYpDmZ7BfA=;
 b=LZqPBzZkCVR4G4fwSI/mYp/TzcljBlmuMn4mR1Z03JU2wO6E8WkIPiJ9
 IdcEHq0zizGItMPSfapIpyenSvyVLPH4IobchfT9phh1vqPOJaiLZHZKM
 ZF83H4a9+B3J7vkWVC8WTBG9hC6JvyFNTHsBBfWo5AUBOc3wpTNzU4QOV
 bwbKOvO54nGMLP/JEtyl4XFxA1U+3myQ1eoisoXfAP838cfT0yZBeFV65
 ownuWmOl5rgf7jJqHXxDp8uMkEhK3MEva7Z7z3S87JXB286pAa1TeiiYx
 JowDPB0Yu1nRRAj87iVMC3HV3T/GjeE17ncDMzrtzJvbcIQdCo628BBxJ A==;
X-CSE-ConnectionGUID: MIzCHjVHSB624RfPTSlAQQ==
X-CSE-MsgGUID: X9oY7fMZQJ+Oil0VDIQiqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60942479"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60942479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:24:10 -0700
X-CSE-ConnectionGUID: yaWLW5QHT/O/N6X8HxA4Hw==
X-CSE-MsgGUID: 2KezDFZ+RJ+86fXZUH0chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="207806658"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:24:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 08:24:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 08:24:05 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 08:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukWwydY1lFzMwB02NnobkSEX5xY3Qsmy18+RM0sAW/e/ZbjJ7PZ4hTNQFdHyj6Dwx+aN0weFfrl5H9cN2sJrj7rJlbZY6/IqN31KszmvA+vIxmK2XocICGxEEOk2pQCeKHxnWEBha0LrBPkusah4ylr5RfVEhEjshhT5+DN3zlqgWKh5nXT7oI6B3Zhpu+uB8N6o9OkTNmZ/DtcszAhEjE88h9nHjZMyQLwBdFfEQtl7kTo48k9CDUaC+CaSc0zMfpodomKQhkn7km9mUnGEyh0OkZ6f3WMkHf3zx+nOL2h6MD5vEPdEME0o59ifNI6ieJDDoijeM/v7ry60YvfTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6+f/eUqG3A6R47hq2VmtQZzEPAIxmFS+HY8K72FY8U=;
 b=fSv6GoPnZhuY9Dw/Tl0BoyfnPIW3CY7qJ0ZKV8oLspfFk/W3U7xBmOCC13s/Gc47Si3AtyTPLoaJFujv+AHY7JDNpTBGDi4DH7uQWZbknpE/b9VCPhuDkJhLksvh87yTv+omSAb2xDFeXqDUcRIwrfirEywy9IorE6P4Q5Etm3lRLAZAmJImCaYZrm0JqzzjpeGOh1t33EvgFwQdxAxgARrlgs09qyuB9sXYj6dowH0m7k3L5s7XY83SxPeZY3tRfKCBhybN8glKg3AjzxJ9TBuG1Do+bak0E19S13b7L7Q79SU4LrAw9T85dTuIcNfo217qyRVa/K/XOVMnL8PNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 15:23:57 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 15:23:57 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vidya Srinivas
 <vidya.srinivas@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v3 1/6] drm/dp: Add quirk for Synaptics DSC throughput
 link-bpp limit
Date: Wed, 24 Sep 2025 18:23:27 +0300
Message-ID: <20250924152332.359768-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924152332.359768-1-imre.deak@intel.com>
References: <20250924152332.359768-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 234058dd-ffaa-42e4-3316-08ddfb7e6170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ORK/H8x0eS1cdwDv15Cbk/5qcKtnkLk8835mC+yRRy+dtsgXW6jc4UZxnOS?=
 =?us-ascii?Q?XStQdqZobFXUnLw98M2frqM+SQ1J8IDELmj+k0pRC9aBmLZxnmrf6oe+v1W3?=
 =?us-ascii?Q?PKWf+LPR3bVR8jkAbKnKEqpnUK5yx3P506zbGqCWeXoz4GpdbUlr4B76OJI3?=
 =?us-ascii?Q?sBTMJcLOvZdacdK/aBwMB20CbZLIUto2VPS4eIBmybgFUF8DZN4f7nT9paZl?=
 =?us-ascii?Q?dapA4S0/GxSNWc42NJG/VhsyNnzzUlLfTrz8JdtPMgvFDbt/68UeDCNxPvO0?=
 =?us-ascii?Q?9c13UWjUirMDKc/zt9bfpoF2DgJyYKfsJE8tDT9KCvDnLIyC25nykOCoUkft?=
 =?us-ascii?Q?FztNaZI0MX5hiKW/E9Oz881ntNeNCXB5m7OmHKusbdtgoKEW2QoV1NoE5sWX?=
 =?us-ascii?Q?4YGs8GfRCmmARHjQDNOV4XQCSSzmottjNsxV9MgrolcHGlyGfr7oW15NamY0?=
 =?us-ascii?Q?tZ9Z57P0rZPD9rd6IU0eCF/DZR7t70ZmtbEZ9d6qgVqBrWHesNZVXd/F7Vi2?=
 =?us-ascii?Q?td5RwO/wZdfp4n31Jlbi6yKCpMmAvS+W0+hrvfAN60DJZCCvETqrBHgUQnMS?=
 =?us-ascii?Q?Pzk31vv1p81gDorMC6X+/+/lxhsW8A+mQRbd6DsfGMwK0SRH0UjHNODG9YaH?=
 =?us-ascii?Q?hr0n/kuym+Q4Q+/gdEK0Z7PktvpUcHdVn5EFcadquQpQv3JTeM3cJYKp+Zjl?=
 =?us-ascii?Q?dMNk23ilua2lrel2dzbx9D5h2BEnS37W9k4Ee98VQrjy3Lb+JjvCzYrfWj1k?=
 =?us-ascii?Q?mmIe+u36IFQIKdew8iUmBLWGRkv41FbIPSB/GXoWPc1N0Xsi5C1Decebozjh?=
 =?us-ascii?Q?MjUDhQlNMdophiFHDuLchPPKBi7GCgi239fhuJX3T1MwzbvtwR3U1gEruBDu?=
 =?us-ascii?Q?/FK+MNi3ADR8TD7rfDHIfDWr0C4JS8sQCEZT2wV70CMYz5Dj/iNv+E1pi483?=
 =?us-ascii?Q?q9tLRn6Bsq5xNfRNVtpi3SqMha1Lqkbx1K0geDI4pF1qjt6fyxH9O6Aj+Oiq?=
 =?us-ascii?Q?hNTxtl3/XGbWejYuUwML5L3HBjejBVEDoUg0n06NGL220sqyNUNMhPwu/GVl?=
 =?us-ascii?Q?UBgEAoE8jral04cakhzGohy9FLABOK4/WNTiEzCkKajumfZf7KErdIHgrziT?=
 =?us-ascii?Q?Q1NVFm5J6KuHu0sglvWuitEIbSB49KxH1SOg27Dcsgsuh60sd9mkm6QvtrGc?=
 =?us-ascii?Q?NmYoQ8N9u6kknnOhJn7iaNN0A3xwerEQZYvQGwb1XFigKMHb0ps0Jmk+vHLn?=
 =?us-ascii?Q?pmsZ6QvKcZmv7ZKC79KyvJZuzaheYV1EuuIJR9+u9WwXhzwAJJQ8fHD8guFU?=
 =?us-ascii?Q?g7fC1bv7eEzM4uVrkKUIcLN23Yhbu5XZq1Z7QpeRdrmH4Jr3MmJ7tEgEAhyv?=
 =?us-ascii?Q?oQ4VqGHJ4yb/Co0XEr+MDks4+I3ov1Khcr8TFkFxMUlgMGtXslp2ixKr1a2G?=
 =?us-ascii?Q?eWA7Wy1UnvE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0EnFE+qO/jnt1X7whbtZ40l2/PpUWgsHJenZ3pCjIn7VZhZkF25WyUSoKuRz?=
 =?us-ascii?Q?7wwF5nTuBlPF7zpvLankr8ig2eirWifpTFdbTKRiND1O1ci3DIL2/vxv6IC9?=
 =?us-ascii?Q?+SnnrPPaWwcAQ7DI9Yspw2VUGpl90rJaKaXMYhLaQWbP403pjuKRn1AXxk1c?=
 =?us-ascii?Q?n+em4ckRF9hhhLkUWLaojY0gVKuUOn7nfQKmulkB9HcmTPm5zQxJye/QXtUP?=
 =?us-ascii?Q?Ptj56YL9EKmVeJIPzK72lU+A0sa4WFmyY3UKsBOeo3SHrHHN1XXRFBFMpzTf?=
 =?us-ascii?Q?qoyTFqeFvGDORSxgudFRUL4o6LoOsKGSBIF1JE1OiSRBv9WdJMZWxoa89z6A?=
 =?us-ascii?Q?G2EazU2i6F41iwhYmsfNY8vCtCxhM9sylwgVTN8ezWYLia2blycANU49tFCc?=
 =?us-ascii?Q?MSYKtHCX14Ejd+wVTWjVdCUuXQL440n9o2fCvNJkwBzSp6pdHKHFe780YjCs?=
 =?us-ascii?Q?uN3cXY45G+dPDn7Jns1bnPUaThwjFLC3P+RGhBeGjO/3kvFcPiMIDhaqIe7a?=
 =?us-ascii?Q?yuSNzXQR5j93oGm9zgBa41z4WsQOV0VIwCz+P2vZ1VbbPJjYyaGZYsR7IOtl?=
 =?us-ascii?Q?1boMLKGJls8kLPcWElds6/2nmz/GBtcbTI4fVN5yUqGyTlInFOnZaMWMCh1j?=
 =?us-ascii?Q?UlYOBTcv+iyQ9+8Dkra5+2/yjkYjw1t/ops2N3dqnFx1JwuewtxAnosLk8pz?=
 =?us-ascii?Q?UiDp+LkqK3WbJ/BsY/gVWEDEqyYqGmjuqfInACcyCozk+R0eDZYXmNYZK/JD?=
 =?us-ascii?Q?rHZDbLZqfpalGmFzy+Xtyv4sMEd2XNXVKNYDCMKPU4ps7Y2prvAZsjdzXv0e?=
 =?us-ascii?Q?RLBA9/bHlKJ8UYHRGUJJc/ejAgtWMC0W/9SMD213BgKSSOyhKg8+jOz/kgQu?=
 =?us-ascii?Q?HZQJdl5w8tipbvsGn5rFsxpKm0ZzXvtv2mHeVXHi+tIThY/ObGqhl5+L54Uj?=
 =?us-ascii?Q?DLMdv3x+vELJfstdsxB7xAKzKvw5Kpvny2BXCIpwN7L3GbgjkRoe5PXqf3wq?=
 =?us-ascii?Q?OQvNsUHLrWUJtyaoAY+FuPqmrrpj+jLgmEP4qwS4TMqU/cFevgJJPtwNX9wZ?=
 =?us-ascii?Q?J04P2ndvSPVBBApzt+BEYqE/vP6Ph4el0XdwdbWcL/FWrKJ4sWwAHbDwUdsY?=
 =?us-ascii?Q?d+HINyh6pDFMbgxAXTgqjJNAwluBS18NpfsFKnahnxPw5mANkf6+TwRhFvBF?=
 =?us-ascii?Q?/tWH6K/yI7CyjD+pfoQ2mHi7VlWEj5CXBBJzMzkr+Y6u6LwlCI03i1uer+WU?=
 =?us-ascii?Q?iqDBi1CzOtYGZKMighFynaxHhCAqEL8WDS334rVnM9yLT7yPqveW8gbuMIOG?=
 =?us-ascii?Q?A/TaDnB9RjReCt6GTQG/ZkY+LqG0ZJ9M96Yvy0SDAzq/aRFAHTtRts0bHKZD?=
 =?us-ascii?Q?WxZA00wOhPxEzZ8N9CG71iNxxzuZOUk1I0guuW1CYB+NgjkVQxlRHuvYCzkf?=
 =?us-ascii?Q?lossP8xoeYlmz1CfLtLOlJHr3KX8EDuTSK4U3PWIb94SwYJvYzMALk5oDPXm?=
 =?us-ascii?Q?KcKnkSwIxGLQwmf90Xcbb1vJ9WGEuHKb3WIffNHO25MXAWuVclgSZgZJ7E1w?=
 =?us-ascii?Q?CG3q7hAFBOwCilm+2RQg0RvDNqha6Ga8LZsg9vqYf6Ceg6f8gHdIc5tWFfj4?=
 =?us-ascii?Q?epoq7NahuTOY77DIOPCnq027mTM9p6hMyNwniqLdUlS5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 234058dd-ffaa-42e4-3316-08ddfb7e6170
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:23:57.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2LVVmkUuEiLObSd7yfxuUkgwV7jtYcBFSvn/MnqnafMz1ZVG5TULwx9fo4Hl6OlXFWeq1iiM3fFZCLAmBD+5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Synaptics MST branch devices have a problem decompressing a stream
with a compressed link-bpp higher than 12, if the pixel clock is higher
than ~50 % of the maximum throughput capability reported by the branch
device. The screen remains blank, or for some - mostly black content -
gets enabled, but may stil have jitter artifacts.

At least the following docking stations are affected, based on testing
both with any Intel devices or the UCD-500 reference device as a source:

- DELL WD19DCS, DELL WD19TB3, DELL WD22TB4
- ThinkPad 40AN
- HP G2

At least the following docking stations are free from this problem,
based on tests with a source/sink/mode etc. configuration matching the
test cases used above:

- DELL Dual Charge HD22Q, DELL WD25TB5
- ThinkPad 40B0
- Anker 565

All the affected devices have an older version of the Synaptics MST
branch device (Panamera), whereas all the non-affected docking stations
have a newer branch device (at least Synaptics Panamera with a higher HW
revision number and Synaptics Cayenne models). Add the required quirk
entries accordingly. The quirk will be handled by the i915/xe drivers in
a follow-up change.

The latest firmware version of the Synaptics branch device for all the
affected devices tested above is 5.7 (as reported at DPCD address
0x50a/0x50b). For the DELL devices this corresponds to the latest
01.00.14.01.A03 firmware package version of the docking station.

v2:
- Document the DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT enum.
- Describe the quirk in more detail in the dpcd_quirk_list.
v3:
- s/Panarema/Panamera in the commit log.

Cc: dri-devel@lists.freedesktop.org
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ++++
 include/drm/display/drm_dp_helper.h     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 5426db21e53f7..1c74fe9459ad9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2551,6 +2551,10 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Synaptics Panamera supports only a compressed bpp of 12 above 50% of its max DSC pixel throughput */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
 };
 
 #undef OUI
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 52ce280970151..e438c44409952 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -828,6 +828,15 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT:
+	 *
+	 * The device doesn't support DSC decompression at the maximum DSC
+	 * pixel throughput and compressed bpp it indicates via its DPCD DSC
+	 * capabilities. The compressed bpp must be limited above a device
+	 * specific DSC pixel throughput.
+	 */
+	DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT,
 };
 
 /**
-- 
2.49.1

