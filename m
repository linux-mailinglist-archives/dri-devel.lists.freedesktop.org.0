Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8ACB00602
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4331110E8FE;
	Thu, 10 Jul 2025 15:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvJgdD2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DC010E8EE;
 Thu, 10 Jul 2025 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160150; x=1783696150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mWQhRVEAdugKbCqp4ueaa+8W8nvp7T/979BhbR407To=;
 b=SvJgdD2NA6ITORPYf8PqKLtKG0mxTPJ1bMtah9BiXyOPbDn9LBQNagUX
 3+AVa/q6lM2u14ALzbf0Zh4SB2JuGlo+EEQLJ/sfxEksOqqSNVPoWvKvj
 d6OGkGngRe8LRIwchtCYA52UOq4E9BrhI2vr01rNVnpd62DpBmDkOWTVV
 o0rIU2Ew+YE4/5vmUviMiAVs5oTVH3WLZ1kGhpZ6CjDUNuYDMAEB8INBP
 Y9EIl8MxXxoDtdBAORwCAztPUsSbcc9zF9ny3P4TN1ghTiLF9pnzZWgPc
 jthxjG7CulDuuRh44SBA7fF4X48DKZiLEDxPsEaM78SB3qqTy9lIOn9L1 A==;
X-CSE-ConnectionGUID: bvqDcYuHSOeq7vwGvF0Skw==
X-CSE-MsgGUID: aEnijwo2SA6HkB6OOE4CRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54573032"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54573032"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:09 -0700
X-CSE-ConnectionGUID: BP0NLxIGTninJ3FXuYELHQ==
X-CSE-MsgGUID: X+pN17FEQUOCiDJsy3U8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187119294"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:09:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUETDdelCesU46JGsFIb7y5+6XjTxoIhe5ABqEbb5nPTVYvk3PBTnBcp/LUm6kXtn8X07FN/9dPFSO3EdW1Gb52G+EpnQhIdgUq6nmvwQ8bBdEWbeIO5s6WGpT9T6/0s/3r8XYUTYq9aVrtCgNPVdIiAIhN22OYbZ8Wj1kE/ErviC5GvtYRoq68raRTovAjUJWS0p+vOYa5GoQICrc7QWXJ2Ietk1zwENzo4K+ju6JZvcApXdEpXGacg59Q48qndRQav3QgQDKyKTqO/nIc5z4QzbhwDITXx75jGmhYpt3YCBMpysuAPMrIUmRn9bo4dZs01b26oTc5Ee35wxCIWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4dB4vDOB1AdohHF9UNtJaYLaayvUOKD3BQdS9NX7xU=;
 b=jAKlZP+2Khcg8sFVHkGJwxBeb5oSQEQeUaQyAqm0dtvE9FS92wgc4ycilbw7DzeC6SsC/iQcX531k/cMplNzTihnaJQd4kty9hFGyht80wU09cfOza2lIJcxJFNutjVb/61Vj+7ybNHOgsHq8xaB015/SPOWO8NfXGbZDtwnxsGZ3xaGYYRwzeQG5M/5bJ8s4zIredvmBbm/zCbjQE90ieB0Dxg/5vuw9Vl9pk4hRzDsdy5iGdw49NUe3xtQr/u+skPeR+Uinxj1X6FzOFz5tgkn7VKfR//h+WuLBgGqJ/+kOz9G3uNm0IoM1019m7hxYerX7MpuMQm4cwHkIBj2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:08:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to
 disable late binding
Date: Thu, 10 Jul 2025 11:08:39 -0400
Message-ID: <20250710150831.3018674-19-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 052e82e0-4e8a-4e68-baa5-08ddbfc3b2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QD5rJ0/KcLryW5/w+k36zc4+UmfZBNe+0Db/DNnCWtSKkkOM3kHV9mvQG/Ry?=
 =?us-ascii?Q?dCGNEIasY36vasIsu5x1w5qNJzuICYrXxWKEJzrwyrlHIZiSs1mTV8EwYWze?=
 =?us-ascii?Q?F3OhX9nf694ANprD1nLZcT0WM+7qGUqyzMdBYY5ZESM+LPs2NXOZDXz6Zldi?=
 =?us-ascii?Q?vK4MgqTulsVvW3VootAjY6WahJuFM4Xu854W87b/IGyPJj+BnJJfyvSWHN+m?=
 =?us-ascii?Q?1557VQ5NihsH+jt3ak2adkrtum/UgTxgXFUjqps7Il3ztxM2qLO+a5DlAz7w?=
 =?us-ascii?Q?0nXF830lnZ7xzwNyWmdY4Vqf0NVHqWJoI7yGQe+hZ5ek32e7wc/X9fRmRYOq?=
 =?us-ascii?Q?PoRuvx43s0ZT319lBe2ObOmudiGlcv0qQ6cJL7iTHiK3TcUe5b5iuUcnZRHb?=
 =?us-ascii?Q?/N7QsO7WvjDXVuv+xwF+JA8yycCJJgTZQ9BOcvgdRgk8qezCjEfQX/Ub6k+/?=
 =?us-ascii?Q?NjqFu19GA7ysQoG1/VysHWeHBJ3+RdG8HE/O2hgddLMiA5UbObsfe05z61Nb?=
 =?us-ascii?Q?Qa9CJZTD9ZTU/rUJyglOHOmPgD54FRr1UTtA2o2Wxy3cRfL5/xVwI2z7Ge/N?=
 =?us-ascii?Q?aFkTkENXp5RuYlpoMfxoa/rvWmYWQ0MTi6dhtiqEr6qN7TIJqrJPjJ9uaUA6?=
 =?us-ascii?Q?3rAJ1+EvyYOH1Hnowznc43o4Y9XGo9vDgZpDvN8mdyk05hq5UheXC1PFsJH9?=
 =?us-ascii?Q?+zvmN53xEinb8+NHtPE3wcim80D/5b2JFloaUonBNHgiAnZIW7O9rY5QH1zX?=
 =?us-ascii?Q?lR2nOBiBycA2wuh84c0rEumUwWIbvAdT0AWqTZurLk0XLb1vcR0DBh159YRR?=
 =?us-ascii?Q?lZLiDctFDaVEAbT8Ohm8cEUMs+d966nuKsRZvZ8Uh4zPYaxZG94TFgTNx2do?=
 =?us-ascii?Q?Y5AHAUgY2XHwNhCc0QY9giVVKp5/YQ440/U2llKXbvX7MVgDG7TRRbXVHzme?=
 =?us-ascii?Q?6998DWZvAW6SRDT+fNLSKYVmpKM3cGAJhOjwTRiIMheeUZ6R5VBJCBPxxFlz?=
 =?us-ascii?Q?O8FoM+QM/pwRf4ziB5EbLIeVEDZWdCCKPJGqfwF9sYoIA40LP2if5BG78u6i?=
 =?us-ascii?Q?vhpVCloeZkVoD9UhLOdVMiJAwzKtkmztSMQL2ra642D2iq2iMC7sqFHLip5l?=
 =?us-ascii?Q?loJPt2WxzYD3OCNYrXdC37IJb05hSuLvuk4QiEq1WK8J49Dwqa2Uqq1wv6DE?=
 =?us-ascii?Q?R5J9czTlqIuAa0g5BMxEC6LA7163njufu9XSWvV8gt7JVD0DHO/21guOjvRS?=
 =?us-ascii?Q?JVbfefs15KCaWOtmjYRJQ8ZuknqAqAlhiyN2mBTaRdmCbDeG7Uk4aExVSswI?=
 =?us-ascii?Q?SCLqRO72MWkHb/eb5dMxGlHAbxy44g0X6pf4bg+B2zEMJM0Cgt1Bmudj7c2e?=
 =?us-ascii?Q?GcRo/cdwTMGAb8YRjlQQ51wsABfDEBnUnUhnnD9cvIdTZYVd546Rzo/Bt/Bv?=
 =?us-ascii?Q?cmrKnVs5kJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXger8PE/uJpjQSoXQspiEFSsH+xDpHeB3mVeuEpkz4T4APe6OiNnLLtb9Q+?=
 =?us-ascii?Q?gKUZsEPeacdWwnsDb8y0bwg8kHYro2G5BwTxxQPM3EEKi8hhJntBpXwf43kH?=
 =?us-ascii?Q?h76tsVYhQxm5n41+UC+nggJZ7a+aji68Xa+pHCpfkyATuX9IYgAc6nj2ULXc?=
 =?us-ascii?Q?1aEsgt+lxm0NpXyaOGbsxvc/VLkTM+wKTDJgs+fSIcox2OuKviYcyPvQrgld?=
 =?us-ascii?Q?ngeEDl+QdDroZw0XA0ztS2dNgfhRgOV/hhQa7hqaRvlrjY8h0ShwV/BaZD6q?=
 =?us-ascii?Q?bb3U/U+fNj6ID2y2agxA6AISRMSoxoYXy8nbanozapYh9HI9M2bRB7pP6hN9?=
 =?us-ascii?Q?t1dOh1pZESdDlo9hH74PZCOsm1ZwvEPF+zCCLsLFlNClLkJGalzxqQVXCyXI?=
 =?us-ascii?Q?kZE30a/jKOvY/9669+5fThBsyl+j1kLQz55QqQAJBaH4GEi8AeDtB/6Y7tR9?=
 =?us-ascii?Q?ped41LzgEjO7Ri/U0/FZa97qiFHwKOTfv7GWiqjCLNnq/TUlrkv0b0zSk0IN?=
 =?us-ascii?Q?h4ig5E/84ikfAQDRlnioKs2dho+oSw1lAGid3JBLHW7UMYJ8DGk2MfoB1odl?=
 =?us-ascii?Q?sKnYSqJDVKXLNI57BaVM6ryHCe3Oqwp47Ulwc6o9uZoIXHo36DX1iBVJJypi?=
 =?us-ascii?Q?BURuOUjosDpNS9SOZJAdO0WUhEcVmqJUbmnk/jajDogpBXnoUousjYA8XJgb?=
 =?us-ascii?Q?IfF7xj0vT4T5bH27/fH3yJo26laQLN0f66kDbBsUqQjCSMZfBs8qPEAtTgf/?=
 =?us-ascii?Q?rl2VhruLiRw6whJ+/dAs+4tCPIX5PugZ/SttjKUvkf164QwgfDu0X+tUR9tZ?=
 =?us-ascii?Q?ZgGXvRHe5RvvAyjlU8LcS5iRIHbh6B5qBBuGg9igR2+72nanRkZA5j0pWXJf?=
 =?us-ascii?Q?Vy8TSxFjbAziaoyF8FkY6Ho0PNXtfkgcuEJcfyhNR1sbTJpxk9SBllVN/bVn?=
 =?us-ascii?Q?U5pl3attiXAxuJdJb2lNwXZbcsUzAbeedXUcxHDXSVTFjBWnb/xUfolkYKGa?=
 =?us-ascii?Q?BrmN6+4Sz3iRqKxU6o/5pvEGEE8THHKUKpDRbGG/mSUWEnBFmnUtCMb6uobG?=
 =?us-ascii?Q?VPC8PxZHjt2C9NMyFuLgLvf9UAbSShS5CIPNe8F5+YO0vKHf3pC8Sf5h4f6R?=
 =?us-ascii?Q?3Raad2/3qk5TFqBfKIBjDxnJoea1tguAl5DCmMU9dG3yJ4ASZj+QIvbvI8U3?=
 =?us-ascii?Q?AMxOuI8+VMf7zU8g+F8JnVJLEJ5hi3bk7XTBPQ+HmLiqCjmP1nHRR1+n0t1V?=
 =?us-ascii?Q?cNpUyxyduv0+bT0WUtef5UahsS+C9ORVVO9jQg/ZrAcydqvgVB93Z/z3iJEM?=
 =?us-ascii?Q?GhBMbq9u+JE+7WAQsjR9dBxUqivLMreS4olDriOrftf7OY0r2hBUZ+Hajn9x?=
 =?us-ascii?Q?BAO2trZlk6urjFufcwT2h0rVU4wR2BMGMXPKpBx0ng15LoniSILuFhiyfBui?=
 =?us-ascii?Q?SOQhH4z+M6qlnINZAUi8A4oTXCqWyej6iOKktHjlLZM4UrWol9xJAVoIaLmC?=
 =?us-ascii?Q?wNc/qDgPtIiIgVPVyHENfube0DsSXKb3RHztMEdCLmPIPpf6bG+Cqv6tnT3f?=
 =?us-ascii?Q?9h5OnbLrBCsn0OeRjyqGAYMi5Rd7OSyDAsNiXJxm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 052e82e0-4e8a-4e68-baa5-08ddbfc3b2c2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:59.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZBZE8Lr+HN2gvwHbOCU08jV+YfqLe8pXh5z2Wc4bwWYB1Ug/znQAeBif1Qee3udiVf9Dk0WopLUL9vn16gurA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
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

From: Badal Nilawar <badal.nilawar@intel.com>

Introduce a debug filesystem node to disable late binding fw reload
during the system or runtime resume. This is intended for situations
where the late binding fw needs to be loaded from user mode,
perticularly for validation purpose.
Note that xe kmd doesn't participate in late binding flow from user
space. Binary loaded from the userspace will be lost upon entering to
D3 cold hence user space app need to handle this situation.

v2:
  - s/(uval == 1) ? true : false/!!uval/ (Daniele)
v3:
  - Refine the commit message (Daniele)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..d1f6f556efa2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -226,6 +226,44 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	u32 uval;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
+	if (ret)
+		return ret;
+
+	if (uval > 1)
+		return -EINVAL;
+
+	late_bind->disable = !!uval;
+	return size;
+}
+
+static const struct file_operations disable_late_binding_fops = {
+	.owner = THIS_MODULE,
+	.read = disable_late_binding_show,
+	.write = disable_late_binding_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
 			    &atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file("disable_late_binding", 0600, root, xe,
+			    &disable_late_binding_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index df43523e9043..88355adce1d0 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -167,6 +167,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added)
 		return -ENODEV;
 
+	if (late_bind->disable)
+		return 0;
+
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
 		if (lbfw->payload) {
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 5c0574aff7b9..158dc1abe072 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -65,6 +65,8 @@ struct xe_late_bind {
 	struct workqueue_struct *wq;
 	/** @component_added: whether the component has been added */
 	bool component_added;
+	/** @disable: to block late binding reload during pm resume flow*/
+	bool disable;
 };
 
 #endif
-- 
2.49.0

