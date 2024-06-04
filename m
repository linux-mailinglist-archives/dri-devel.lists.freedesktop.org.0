Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEE8FBB03
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EFF10E58F;
	Tue,  4 Jun 2024 17:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHrDorZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271910E58F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717523687; x=1749059687;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6a4spuH3oa/hpyuJHHWMnMDMYtxgJLTlARIuDcNpyno=;
 b=WHrDorZdNmHaGEE06Xpf4JW7etsCweAqa/9/2VPWqZYDQwSmA/0+lNzR
 6m3pTRMZDL6U502P7RI5sz+vJAtJ3wReooDXKy3n18Wd9ci3LmvdF2euH
 tLeag0p0iFamPXLn3vslBjs8FAPGpRDyLlUbuNfSAkFcCe5lSK0ImAHsN
 YzM2fvCjOtkPFyAgWbOXiTMwM2EJN12Trjc9B1L0QGQIM08mquOPa1T/i
 oo80c8xdoT8MKWPcQ3UGIayfNEBX61ppyCXVGtgsnMSDY1/mi44yZ6Aqv
 /mf1D4eSQyd5J1xQbdTb+ZOOV6axboXBq/qLFgAlOLaSYmtQWKXRiapFl A==;
X-CSE-ConnectionGUID: 3i76Q4AnR7CG/wf41phiZQ==
X-CSE-MsgGUID: +F6/TxtwTRWbf9Mw7Dp+/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14226768"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="14226768"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 10:54:47 -0700
X-CSE-ConnectionGUID: EANJ2knYQXiO1TbCVTKWIQ==
X-CSE-MsgGUID: dUhWrLmTQpiyz4RIu0x6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="37434611"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 10:54:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 10:54:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 10:54:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 10:54:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 10:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzVkIq46tjlzUizvQSzuZKm2qySdiIFpEFNX7Uq0t9lHmnnklbj5qKtheSKHhSqxtLpoAJcBNgW31qNHlybJa2hBfF4/HzjCejvTWTekzcQoUFI0m5ZR0SzZ6gh0hvNsFBANuEZLepvC5cRrB8X2/h8067OKLPaITidUghlbLLc0ECBAf4hFY+lyf3zSqvwaDi2dwhCV5FfaAnN8y7dIFZXhOCUJMbp7+wDPmudS5vdGr4/6KE+TGoJ3axEFvfiwrrcP2Q1HtYGy3/jb6dZ0g/Fc9D+K0MTZD1w/qcrl1yvyAA0ToYFIwhHO2P+FMqlluOVMM8Tp31PbO92UD2sWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKv0pdvB0T8WYeKRkwn7yu2GtG6CqzTairKNgh2nC24=;
 b=ZxBZP2WE9ECwrTqBzNRJR16NMmu/uq3aWhFNUpjWrPkNIxwMFRBVjTiQ/AJtfhjOUxP/xD7uF/pWwzJxt5dmudc6oreHzoY0CkYVhQ0uvmfetGF66FOqBbj82KM7bUZ5wrcmyQe5OMPyjnopUFzD7059xqdJkMaRAPDeiyF1zLC9UekAiLM1WWhtzWypmlN6AiMWegdGf9LCWoyT4LqHImze2LmMIQC3k60iKZW2gZ5lV6HdyGEK/AJ75d2k6LWRpMHI1x7C4k/k4PYPAihcZd1y7FJ9jSLn/rG+lzW0n8xorIqrYgX1+m5cXMrCoXDP7U9uyYD5qXWED9JULivuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 4 Jun
 2024 17:54:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 17:54:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/mm: Remove unused drm_mm_replace_node
Date: Tue, 4 Jun 2024 13:54:38 -0400
Message-ID: <20240604175438.48125-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0044.namprd11.prod.outlook.com
 (2603:10b6:a03:80::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b637a76-04e8-4802-9c41-08dc84bf6968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5e7MKtI/QFxnVH0zS6SuIod9MDYwbQxebMEjpUabDKX3V0+IhUTGq+OSqpQm?=
 =?us-ascii?Q?l0RmJDghE/hEG8hIn6GgBPVtE2aRyRZjqDvk+ZBN72TvH0LbG7nhkXVtpCNy?=
 =?us-ascii?Q?YSlTMKO1ostj+fL4uStqoydCuTn8fR3joF4MsyQDrlj9J/P6qFNY61fu5/gf?=
 =?us-ascii?Q?HeBm+2rjZUVmijZHDdimXX5cKpj1tB26OroeSrLFktLdshtSLADhO+GK3TKK?=
 =?us-ascii?Q?LuxHJxzmIPUlbhWoUmTS6P/QpX8F2zmfQW3+HrOa5XvHc0sgF43Xp//uiavo?=
 =?us-ascii?Q?30Djwt5scPD0qbJvBjHxDbOfNobrAV/zLb1el9XgC2Kaj9WjVUQzRenvPZbQ?=
 =?us-ascii?Q?3chQlUzlsNOzT25Q067qGXLb++qt7DM+RzDh7tSWIF9hTI62qLdJxbe11k8F?=
 =?us-ascii?Q?BYfBTmSy6SiviAm1nM6v3QDIep/H28emRil17mkaAmKcwXULhRSiqP1zrB/7?=
 =?us-ascii?Q?wXff+lcqkepfrPge7R9TZ/tpr3gfzJLnDW0uv2I2pMPIqOg4QnKi4zrR6sgB?=
 =?us-ascii?Q?7t8EJraY4IjT+LoJsg9r50aw3GZECjwegPzSJ8eZj/e+1jgi00Gire9LqLQ3?=
 =?us-ascii?Q?VySIYLfrGi28Ji74qAHZG1p1pXVgmokzdLABZstk1yix31vs7RLBct36hZJs?=
 =?us-ascii?Q?zpFKltWtik9czGdxAdZy2UpymIi+nSxPGlj5D2G5MoWZ+1mvk+FpcPOVfMm2?=
 =?us-ascii?Q?xZnifMbrHIM4hXrl39RuVkLXjQ5cqSmbZbxaUH67o59FI2tanaigNGfTAFNN?=
 =?us-ascii?Q?a6gLzzYOzJu8tOVpMDMXIicQarMvYi/mjSSABIPJu2/oKj/p2TW/4MEHA6KC?=
 =?us-ascii?Q?GNZkeBYO/bIPgAqcrF5MroUiicMaOHO4s7eML5TO/sJmv9JEK3XLaRgE+soE?=
 =?us-ascii?Q?mWDPHucus8KkLYqUrkc11Hd1n4f7MlKVwPw/IziWa9AS2oPTXrKJCtdSzH3I?=
 =?us-ascii?Q?LHS0dy3FqHqYl9pTfLac+hGAAscDlWgtKhSPme/2B3l2sXUK6SpqB29872Ww?=
 =?us-ascii?Q?uX6VsXUBsqVlLUdXt99bpDxEzCZrWMgB6gZLH94xGlBanSJLOVDIVz+9+mUv?=
 =?us-ascii?Q?DLYAkXpNhvqHdZF8VmOZFfUflWV7w/xN67weZdOFqp71kG+j7Q/cEfSXWN2E?=
 =?us-ascii?Q?5nPD6J/yhrEkty3TW3y7C+yuTlVzgOe4jAGJQ7FMPS/MbC1SVgitrqn/5hbB?=
 =?us-ascii?Q?kKAux0U3Elaw1ZcXs9N4hbuhPnz5y9mrcWTEAKQzKZl9+UhZr5sCLFyKgr9P?=
 =?us-ascii?Q?pRpQJgCqIAMX5UpKN7U7EAezETQzuESaXjuirNtdyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?neP/6kIwbzz+5CR9c3lKiewUc0Z2CYo3E6p/fkfd9KYFdo3q5As8n9Gd/QiB?=
 =?us-ascii?Q?AMotxiCiJ+KCfP9qwzP88kqyNFdjzzaLtarFA+Y1DFqLuOoQfe5kfehwIX5O?=
 =?us-ascii?Q?H4pzxVSLECu2J1Ej56o0K9jJxjhIrDkWV6UyKudvIYWVjoDTF5Gtw48WVUvZ?=
 =?us-ascii?Q?rJQ3iMtHRXGuDO4Wk7yNh49LV1F09D8iKkksdPvfNpnIHnsQ+/+dcyEpFttj?=
 =?us-ascii?Q?utd4S5eeuU53aYJTVlmCrivGmA01DdlxzfoGXBvS+ucpO5vM1M2ZT26JpAIH?=
 =?us-ascii?Q?bM7nLEtC9TWvexzEsZiKGmsnaiZmmti6AaVoTxp1zt8Lh1CYm4TJRkh/5Yhm?=
 =?us-ascii?Q?e7mH/x/NksS7c7muEo7mFOnRB7SxinDgVj8xaut0GfQpoChhg3UV4UXmTks2?=
 =?us-ascii?Q?+tHuXlghgD1IAc/ybjkwgNOikmjR5+A3zds5M+H8w7rlUiDhE8EZhxf5qYbB?=
 =?us-ascii?Q?dpID86yZjaNDxtXnz9Qmuibavo6h4gJ92lVRpFNwIjFwrZC/3qRgXcVtWbHg?=
 =?us-ascii?Q?82Of8JU7OUiqcAtgsszPoOA1veOEvE0vsD92vZ6LU6q6DKXxtf0Csj4MHXvg?=
 =?us-ascii?Q?hEh4+xYFy+4w/8UaI76EbeeR3q++uevxVSLCoUbhSy83KZgIG6qar3LxGkTc?=
 =?us-ascii?Q?YHWyouK4NnhoFqaviVX/Bd9ZlRQDVov6lBp3AMkT9F91FDKumfSn07bh4KBX?=
 =?us-ascii?Q?iWq9Lvu4AHljTInDqpTX05bB2yLrsyzuS7Hls6A1jTXPgyS3rrkM4x4c+3F/?=
 =?us-ascii?Q?5VekY3b/Kkkzh++2jhuadDQtrloG9uaj+G0ks96pMiGsnRMpEFydOjxLK+uE?=
 =?us-ascii?Q?n76sb6d5I1bhVFydgj5BammbTLlLbMyU0b9LdtS2W8RXFzdHASRll4fiUemi?=
 =?us-ascii?Q?++PfQPDVjbANpH6N8lCw+wkjWkJdQTsBmxX/2RA3A1RuJDO8mwURkYE6OeLH?=
 =?us-ascii?Q?YjpgGOErvJ6rJttGRcyrwl5XrxSgZQGB8Qnou0M7Xxa94z+G3BWglinaIBZ/?=
 =?us-ascii?Q?wczSDYopiWYKHHBVHzMrGp1k7hqWxxyEVNArOVob1EYqI1TtbwX0Qmqplc9n?=
 =?us-ascii?Q?3LQxK4oiruEkcPARZmAaOIDL5fE+l9ZBWFOzLZOYKmRoNoJARyksBok8IME+?=
 =?us-ascii?Q?Wvb6MaEeqVnAibU/GpqqnEcptIFBMIJ/xANmdTGi7QJHOIZk6+5t0KSUNa9A?=
 =?us-ascii?Q?KSa10C9NC0YXXfTVIMi5lOZWn/kTbB0d+Aw7V+4OCyBWia/92Vq04cCAIqE1?=
 =?us-ascii?Q?fEYZFznunxMMpZu9xRfSKiPE6X8UcDmD1GVj13IpfLtFyGUJf0pEfFddyoYi?=
 =?us-ascii?Q?48ljIrHWbgOi8cnkqaLY8h6wNxdb7cJe/uNa5PGiPjMpfQrfXFb9JGLor2E8?=
 =?us-ascii?Q?BcHuaI0uDMtc8WqOvh8CsmmWJWWyhSjqrks4jN/p11Zu1DCtT3PAll0KO8yi?=
 =?us-ascii?Q?s29M9+bd3bb/RagnuhYA2DKRda5KoUb5eMaet6peSy6wjD2t5Ax4yzkKBKxq?=
 =?us-ascii?Q?s8Kh/QLWtz2pUE1eusQ+UmyfkyDY0XMMvKw7RUt3xUm345i9bDLhgUsydQxg?=
 =?us-ascii?Q?+ShDCHedxe5qxbn5W3YfrYQ5DY3r5xkxqc3sRx2/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b637a76-04e8-4802-9c41-08dc84bf6968
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 17:54:42.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNAYUEHeo/YWm29+AI31mVEL3uBODmIe6y/m4yDuKNLIdc2gXfn5axMgHY7Oy6AW/xr7hxdrC4QENcdRYdbeSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
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

Last caller was removed with commit 078a5b498d6a ("drm/tests:
Remove slow tests").

Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 35 -----------------------------------
 include/drm/drm_mm.h     |  1 -
 2 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..5ace481c1901 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -648,41 +648,6 @@ void drm_mm_remove_node(struct drm_mm_node *node)
 }
 EXPORT_SYMBOL(drm_mm_remove_node);
 
-/**
- * drm_mm_replace_node - move an allocation from @old to @new
- * @old: drm_mm_node to remove from the allocator
- * @new: drm_mm_node which should inherit @old's allocation
- *
- * This is useful for when drivers embed the drm_mm_node structure and hence
- * can't move allocations by reassigning pointers. It's a combination of remove
- * and insert with the guarantee that the allocation start will match.
- */
-void drm_mm_replace_node(struct drm_mm_node *old, struct drm_mm_node *new)
-{
-	struct drm_mm *mm = old->mm;
-
-	DRM_MM_BUG_ON(!drm_mm_node_allocated(old));
-
-	*new = *old;
-
-	__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &new->flags);
-	list_replace(&old->node_list, &new->node_list);
-	rb_replace_node_cached(&old->rb, &new->rb, &mm->interval_tree);
-
-	if (drm_mm_hole_follows(old)) {
-		list_replace(&old->hole_stack, &new->hole_stack);
-		rb_replace_node_cached(&old->rb_hole_size,
-				       &new->rb_hole_size,
-				       &mm->holes_size);
-		rb_replace_node(&old->rb_hole_addr,
-				&new->rb_hole_addr,
-				&mm->holes_addr);
-	}
-
-	clear_bit_unlock(DRM_MM_NODE_ALLOCATED_BIT, &old->flags);
-}
-EXPORT_SYMBOL(drm_mm_replace_node);
-
 /**
  * DOC: lru scan roster
  *
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index ac33ba1b18bc..f654874c4ce6 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -463,7 +463,6 @@ static inline int drm_mm_insert_node(struct drm_mm *mm,
 }
 
 void drm_mm_remove_node(struct drm_mm_node *node);
-void drm_mm_replace_node(struct drm_mm_node *old, struct drm_mm_node *new);
 void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
 void drm_mm_takedown(struct drm_mm *mm);
 
-- 
2.43.2

