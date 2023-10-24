Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDB7D4E8C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 13:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0710E347;
	Tue, 24 Oct 2023 11:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835D210E344
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698145648; x=1729681648;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=5Bdi6X6/cY75CtGnE3qcdg4pXA8z6SQRb61GREk5O0Y=;
 b=jBhcGrhEDoZ/EZAju9ldvW9jk6YwgbhF4nW/CMgjuZ0dvqXNpZGENUPZ
 bx/vSKaS0S4fe9ofADN65D7lQ3Xbde8YFYkcGZSoSC6eT3o66PiFXOYRE
 r86eWPim/d6u6GMGDGkf+C1Upcb4f6BzOL1uRhsry0uGuXFqKPy2C90ri
 oKt1L4pzN5bVGr9KxSohI26WkaDVJZ3GCZfYIVgpCzmYeG6XaHAFLa4GK
 KCX4Eg7S4b6Ed1SJm3yFr9KYMkpGqtpbJTV234W8KEd5FZF05FfyJrXcq
 molm1IIGgjFYZBrQKpEV+Cy9A7iakPpNcYSfa+7eAU81VUXv3QwHP+z6z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="8582998"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="8582998"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 04:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="787743165"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="787743165"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2023 04:07:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 04:07:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 04:07:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 04:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcMn96A/Y51i7751UAHRPxDCatC6PFEdhLg3MSd8NKKoOShtij9+hRPGYybnInAorMoLi2aJp0P3BbryVmkJnEg45LQcZJwDwzfI1tstWpgweVdZi7VqeEMpGhxovTeB/h+1Uoc1cbU+UH9nR5o9GgYzJLUjYcvBS/8FDUSSIcjaSi1ACVS6xOxGSbtXejaPs2iQrNupjbzhjXzbokaPWOy0s0iWrh7DG6xP3gWF+xLUECDq7CRD2+TQRx612Jxbr7btthxDu1O4NOGmwEIJIsa0Ew3N+J+8835IThAZlmAJAUrCcr+NSYVodkoL4DQQiNM/UvagQZe54sBjiXw43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQsmiX6XQK5AoWVlYxZX0aH5JNRKss7E9hVaFvQ52Jw=;
 b=V21NYxCDvCFC0h7Nry1/PIi7YcSoIGUeOCza2pWDBWbKNv0w66jKfW6fMPriSWeMSbnC4am+dFm64y3TpJLRYbhuOpn1AxXnUC9PMfuwMJ+NjH2vRcSIMc9Zhu9tEpwtiS+zEzT/v35FI0FWASkfSEJfpJdNtJw/5D1qB4oP8b9dlemNQQ89V1PMUCkUCAjo7wSYy4rpH6Nm/xJJcb4u2QPu2W/8wud9noKgR4ULpme+5LSJm5AaAvYvHIKxFpZz7YANiS/hvzd/C9Q8jE/wgxO0YPf0028yE6Qq95wyuCalB5jXU397NtHM6DJvJNyA+1KueWxNKYGt/X7Eo6I7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6042.namprd11.prod.outlook.com (2603:10b6:8:61::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Tue, 24 Oct 2023 11:07:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 11:07:18 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Subject: [PATCH] iosys-map: Rename locals used inside macros
Date: Tue, 24 Oct 2023 13:07:10 +0200
Message-ID: <20231024110710.3039807-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3c7ed3-a17d-4c92-a998-08dbd481631a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qxp00wZalG0XibhM8T9OuMe6y5lF27SuCjBe0CmC5WFvonwvJBwgWDeyYQFdV6xF2Cz95ToILIMpRYVnG2EwSxJhZmqELPuNbBYmOSC1YRMiWF2W4ZIeohPVZVC+/KqQfHCc5UWihFbUF63vMt2mfKg+bYaQjF7FEb3CMxja2NN0/520swXr/XCO6FTOJ13uQTO05UXRvPDL3z1doNCGOmDw5x3jb/ZU/HOefURH8x6zR9akGrx8WvrGbY10WyRYTMUdkPRhoX19CurUCE7W3bQqtol7vnY3uCX81biPC1FNWFQckOatiMZEGBaqa69pOt6vJZCYSg+SCe4jZ/uhc96EVoacZrfa+c7CZaTEdhIHgDmI4B/VUzVF6ZKahl7zK7noaZbilh6MVE1lHI6qLRyYfonxKhFVdqd7uM4dSIiDMZTXjQAi1ci7gPmyDry/TMamhTq4nI08h44QdL2Xivj2awuqqa7VDbUbzLhQLR94smY4ju/H7W6l+604U9cfzHt+rrrveawdGpuGTCdRkpPbnECOnVnaJ03f1PbzZIfZiLb5QAFaHP2q2D7coIPl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66946007)(86362001)(66476007)(41300700001)(54906003)(6916009)(316002)(6506007)(6666004)(5660300002)(6486002)(478600001)(6512007)(8936002)(8676002)(4326008)(36756003)(2906002)(1076003)(26005)(38100700002)(2616005)(82960400001)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFRiUDJHU1JCclhucWVXZWU4WXYwWktHMGcxK1BIUkJNaERNZkJBQmFyRUho?=
 =?utf-8?B?eGRUK3RWN1VOLzY3MFMxbVRBL3dQZS9lNWhvTmJuZC81L3J5Zkl2NFRuQk05?=
 =?utf-8?B?Q2xIUVVMajlVKytwQzJBMjc3MndJY0Z5dnY4SzdMdXFuVk9XdlRWc2ltbkNk?=
 =?utf-8?B?blVHb1lPSUh3eWV1S2NwMGErdUFwaGRHdURhdEdpVCt5dTVFb1BJTDZFQ0tG?=
 =?utf-8?B?K3dJS3llaHNxdS9Od1E1RUtvRExvNjdlWVhTcHBySjh3bm5PMldLbkx3U1NN?=
 =?utf-8?B?K2c1enpvVDdHUlZpOHl4V3d3L0hVT1JVbXc5aHo3VTZFRzh4WnZQUmRjaXBh?=
 =?utf-8?B?cVFMeEJaQnVwN1dJL25VTTBwaDFiMXJ6dUd1WnVkVHR0ZCs0MFFwMWprdXVK?=
 =?utf-8?B?eDE3RUQzSFU5TFFTZzArU281NHl0R3lhVEVLaTFEcDZGTVArUjJNSmtsY2pq?=
 =?utf-8?B?SmtyZkhqZTJ1VlFuYkJ0SE1hd0JQck5ZaUQ5U2JVeTlXbXRDRy9vT0h6bG9q?=
 =?utf-8?B?OU5IN1E3WXFiL2M3SzB0ZlpzVUUyWCtCZG5kZS95aGV2ZFpiTmZTK0RycWMx?=
 =?utf-8?B?VUtxYTB1U2pJVVBhY1lqcklkZFhYd0ZpWjA2ZHpVRG01RHRxd1p3T0xQSWxq?=
 =?utf-8?B?R2ZsSmFzMndtSitiOGtnZVhHbW5wOExoempQUlN5bHVQMkJmUlhiRmhuMlBR?=
 =?utf-8?B?ejVqaXlvQjFkUUdHZXBSU3NIY09iMkMyN3pLaWZVU3FrS3JhRDI3Y0ZETTY4?=
 =?utf-8?B?K1ZMQzZCVjBrZXZ3V2thdjBQY3RDR2ZvSUdTQ0c2WVE1c2JWMDBQc2l3di9U?=
 =?utf-8?B?Sldtc25UQ2tFK2d6bDJmSk9LUXQyN2t0Y1E3SzZRcUc5djUrMHRNWDkvM0VT?=
 =?utf-8?B?a0NMWUJvZDlRakNIOVVkK0tlbFhtd0dGUnVkcDkzeHBRTElKMlI3b3RLdjZV?=
 =?utf-8?B?RW9DVm9pUTFBS2loS2txcEFMN0U1T0ZHRlVzaCtybUNNWFhTTks1VDVUeWFL?=
 =?utf-8?B?NWJSaGFiMjVNdFJKVk5tdk5QK1lWeHQrZ1Bjb1VaRlg2S0E0aXdVQkplUnBa?=
 =?utf-8?B?L3Zrd29Lc0hnNWU5T3BGTUJHV2p5MkNiNG82cTJmZkxjKy9TMFU2M1JvUWt1?=
 =?utf-8?B?MERQeWNIby9md2dWaUhXQTE1UlQ5eHFjcHJZZ0pCdk5ENG5lSWdSajBLNmov?=
 =?utf-8?B?MnF1bEJ5NzRMblVXNXFvbXBLd05FSGdRTmlZdzhXRWo4V1ViY3FJejE3SWVs?=
 =?utf-8?B?YklSWFpubm1menFVMkZUTElFVTFBUlpxQ0ljZ0ZWcWhPdjFkZitXQXR6TENM?=
 =?utf-8?B?dkswcWdXVU5HWnEwK3VJUWpSM2RLQXI3V01YdkNyQW42V2tHc2xwR2tBdGJS?=
 =?utf-8?B?S2h2WUkwSkZSMXZBMms4ZjRTaDdSSjgwZnJsdDFKQ08vS3ZObFJaTGd6RlB6?=
 =?utf-8?B?Z0d3OUY0eWZZSFpNNkhlV2xsOVk1SHJHaHR3Um91WVNuaHRHdi9BY09KL09v?=
 =?utf-8?B?bG1xbm9WdVZ3SjhQNnl1eUQzYjVxYWxRdnRlQXU1ZUJSYmY4TWIyYTFobnQv?=
 =?utf-8?B?RU9Mamc5VUJxeXQyRWdYcXBVQUxjbW9weC9aMVV1aUtybHVLVUgwR2pOcmQ3?=
 =?utf-8?B?RkJQbUJsbVZmQWdKSVJ4aDNJcWR0RjBWUUxZYmVqaTFCRSs5YWc5dzZlRk55?=
 =?utf-8?B?RDAvVU9ieTFtdWcreDM2cnV3dVZRbU9hUUYyMHpUTmN6ZHY0ZlRka3JNZExL?=
 =?utf-8?B?cDRyUHBkNFVWeXU2YThEa0FIbUpVTkV2dHFCNkZNTFA3TmZqUkNPTCsxbzd4?=
 =?utf-8?B?SHlpZngrQ3V1V3Q5VWFGc2lVM2pqTFJabUZYYVpIUWlFaTFxb29uUE9KOHVr?=
 =?utf-8?B?NDIrSnZXNG9GKzJPR0g0THQzSll4eHpGZXoyVUFJek5hVi9hMVA2VUJNdUFD?=
 =?utf-8?B?RGRKTnBRRGtVLzkxd01ldGJLWWswekwwdTRoSGRET1Q4YnVPdm1FTDZWTmV4?=
 =?utf-8?B?QzlVQ3hZZkNjdlgzMU05SWdzR2FnSUQxSjA2eFRKWENlZUJSSHVkLzN5N20w?=
 =?utf-8?B?dGExUTd5L251SlVoWGZUR3FrSU5JdEE4R2tBUTdvQSt2ZUpBNnQzUGVNeU9D?=
 =?utf-8?B?YlZvRWlpeC96cFo0YmY5SmhhRGtxRW54WkJFeitEUTlWazAxL0FEV1lQTDZG?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3c7ed3-a17d-4c92-a998-08dbd481631a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 11:07:18.3039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdHuFq1XMv5GhDqRlWQvz7wfv1TU8IEQw6uk50BnxtWa0Z/RlUgUUArh/WhNl+qO8sIn4SvwQT0Hd7FTqLbt2oeGglLIVN4PD+6W5coK3S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6042
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Widely used variable names can be used by macro users, potentially
leading to name collisions.
Suffix locals used inside the macros with an underscore, to reduce the
collision potential.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 include/linux/iosys-map.h | 44 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index cb71aa616bd37..bb3a8c30fb920 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -168,9 +168,9 @@ struct iosys_map {
  * about the use of uninitialized variable.
  */
 #define IOSYS_MAP_INIT_OFFSET(map_, offset_) ({				\
-	struct iosys_map copy = *map_;					\
-	iosys_map_incr(&copy, offset_);					\
-	copy;								\
+	struct iosys_map copy_ = *map_;					\
+	iosys_map_incr(&copy_, offset_);				\
+	copy_;								\
 })
 
 /**
@@ -391,14 +391,14 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * Returns:
  * The value read from the mapping.
  */
-#define iosys_map_rd(map__, offset__, type__) ({				\
-	type__ val;								\
-	if ((map__)->is_iomem) {						\
-		__iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
-	} else {								\
-		__iosys_map_rd_sys(val, (map__)->vaddr + (offset__), type__);	\
-	}									\
-	val;									\
+#define iosys_map_rd(map__, offset__, type__) ({					\
+	type__ val_;									\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
+	val_;										\
 })
 
 /**
@@ -413,13 +413,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * or if pointer may be unaligned (and problematic for the architecture
  * supported), use iosys_map_memcpy_to()
  */
-#define iosys_map_wr(map__, offset__, type__, val__) ({				\
-	type__ val = (val__);							\
-	if ((map__)->is_iomem) {						\
-		__iosys_map_wr_io(val, (map__)->vaddr_iomem + (offset__), type__);\
-	} else {								\
-		__iosys_map_wr_sys(val, (map__)->vaddr + (offset__), type__);	\
-	}									\
+#define iosys_map_wr(map__, offset__, type__, val__) ({					\
+	type__ val_ = (val__);								\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
 })
 
 /**
@@ -485,9 +485,9 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * The value read from the mapping.
  */
 #define iosys_map_rd_field(map__, struct_offset__, struct_type__, field__) ({	\
-	struct_type__ *s;							\
+	struct_type__ *s_;							\
 	iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__),	\
-		     typeof(s->field__));					\
+		     typeof(s_->field__));					\
 })
 
 /**
@@ -508,9 +508,9 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * usage and memory layout.
  */
 #define iosys_map_wr_field(map__, struct_offset__, struct_type__, field__, val__) ({	\
-	struct_type__ *s;								\
+	struct_type__ *s_;								\
 	iosys_map_wr(map__, struct_offset__ + offsetof(struct_type__, field__),		\
-		     typeof(s->field__), val__);					\
+		     typeof(s_->field__), val__);					\
 })
 
 #endif /* __IOSYS_MAP_H__ */
-- 
2.42.0

