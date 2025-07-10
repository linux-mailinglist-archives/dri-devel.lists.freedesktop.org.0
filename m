Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B3B005FC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB3D10E8F9;
	Thu, 10 Jul 2025 15:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCmk3e8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821BB10E8F5;
 Thu, 10 Jul 2025 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160138; x=1783696138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IDHCw2Jl37cRzeBjG0QxyIQSJhm5h8XZmib3QM7KAv8=;
 b=hCmk3e8mT+UxxDXoCVZQ+c7z/w2bEKdwHlvZt/AO+SmDmLrxYQ2JSuhT
 wntWgP0X4meI5lmWJoAY44giWQsA/hTIR806utfVDdZ+L5L9HHh/TxBV5
 52vqM5WnmQdn3V7YVE32L/0ltgHhLkUald6Xjfyux0rJ7k+nNmsg+OUwm
 j/YgNsxqTUxZVE7xhCSw/8ybFg/EclOXQdYUlL22UxarvW1DAiXhbXrDx
 uQcvd6BbyssVOGQgtkRbgTQHNz7kjmKM6PpU8PAy28RGVPj1FW0NC1uJl
 /YbT1UKJKk1kbzTJVPZ+tnTyOh137/9N5kK3XFOYv+aakv2vG3dCM/czq A==;
X-CSE-ConnectionGUID: tKc8GJgsSMCqa6cx9rrwdw==
X-CSE-MsgGUID: 9pMfsZTSSp6Eh0u+QeBK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54572980"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54572980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:08:57 -0700
X-CSE-ConnectionGUID: 5+x/Mb1tRoW+kpWiqOgKjg==
X-CSE-MsgGUID: CfuFssVRReqMg/FQukHYag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187119243"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:08:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:08:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrV/BixFJwHOccuYJx8otynuxn2vUofCo+qv8G4NlbhZ2yZh1W7+1yQVKtjJlskJpnLrGtKOPAKj2u94UxWU20BV4Qxjo8khOyUF9ZcKuvG703FplBDTMn/JmsoNoyYscRPP4PQNRL/FkgvGRiNS/8m44wWOmFNKGoEnjUlZwS4h5MOgjXwOutVEopFeNgKkLLcOoMfT5Vya/UD5wNPojiiBko3lF4MFQfdSdJYoHJ9644GiZpqerjItbRvYVZsGIEOcTAYDvTIoiJ9b6x4JHJGh0UGtIAaJ0KVkEdE739T1mn+uYMUD5Z8eO6BhJ024ALNUcEzcL9JswuQ5l4T03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUeK+Y9oNc6dsGRW+3q2zYEbSVfraJgRT1MVJ2F4/uE=;
 b=IIJFIuvTROxE2IE1MYkYf2M3vcn6MPt0FJuGbURaAkKD2gnqP0+E9sSd9l3aPEff04lvcmDuKwwTrMPJ2j306vMvqba8bAWacOMxYFJbpagZb6jupI3smu1FQ8L8fRf5R/EpDJ4Zcoq8P+JrEdYFXOW3PD+pgZkqG3v1QBjUro+NL4pibrI96f56zoZpkziM1Pa8p4gVmIRDsNF7+0RamE27BK3dNcfZdNCRPJ6MVh99KQaVn9WIdVVdQnQTgUTEy3nSRiPi6QjWWBSa/DCgBzhmWP5jVSd0xcNLnRLdiK2q/YzGDzeZ11EtG7jFFWcYFplVScXLaukyQjSFkYaK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:08:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/9] drm/xe/xe_late_bind_fw: Load late binding firmware
Date: Thu, 10 Jul 2025 11:08:36 -0400
Message-ID: <20250710150831.3018674-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f327ea8-5329-45f7-7ce5-08ddbfc3ae1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q6RY4IlCQ3ewVoNoUt6FjueVIHKH6LjZryF42zkjLAUFBmUWKQLuS/0CApB9?=
 =?us-ascii?Q?S3hcp2tMMekUFFay1cOawkxwBKhl4k/hZ7PTjX70AkS3+DCmXwMA6P0stCll?=
 =?us-ascii?Q?u+Ek9hZDqr64VlzI5RRk72lmPMHzWeL21vr8j9oKA1Paoq7kTso8JrkKbkay?=
 =?us-ascii?Q?IOMd+vqJ67wUJnMUb48kWh2DvEoLF6K3e75UI/jW36bWo9ywBuSPGDKbv/TY?=
 =?us-ascii?Q?jcNiviXJMRvarNoh6zgPNcMN4PwAsZ8ATavmOES6MLwK+l6GM2wK5UAQxvMH?=
 =?us-ascii?Q?8CE8cOedmHEvhajujKY2c78sBWBNI0/uR4/IKjKChJ19HRPIS0l7HbS7Q4TM?=
 =?us-ascii?Q?FnCN6+LCg1LwzOvawXHjEgpwzBZpQoIIWg6nQFLqVCynaha3486Yv/L2dfGz?=
 =?us-ascii?Q?wVtgf/eOVsQYxbwkYEQVfCh2FdpMCm0/XQCZgH7ghQ24oHXQOcSrV2w3V3vl?=
 =?us-ascii?Q?jku9kuMFnef7h4kDotVj9uOrx10HmI6U9dZK9in1/WEigL5T9VS5NBvfWrJt?=
 =?us-ascii?Q?aLORsOVf552qCEgGoQsT1NYWVLrXXYlZwYIRw8kHcAy9+eAt219C24En6w2H?=
 =?us-ascii?Q?aHV7A2x8vgVhKNqrfxa8+1Z0zuClH/8+RPvlbuN5QB/f24ZJ/brB8uyB2KEx?=
 =?us-ascii?Q?Hg+ykYbiTN/oXOKN6UKLLGqhtjITL5gdw0ycxINnZduIS11AHILvYJc9uu3t?=
 =?us-ascii?Q?ltDPksSEzJrLvvnI69ZzQ7RR7uiY9JCWchtbkVBHAu203roUk4+yErA6yJXw?=
 =?us-ascii?Q?I01vp88gBFfz15SVV74Z03occmPgUAGWrVuFqFRt2pddwZAv+lDkWdOV77+H?=
 =?us-ascii?Q?X40A+So+Pgth9/nYun5rKSVUlNjXSh+o/S/duk5Af8Xg3VW/AiLvcLBZBEfR?=
 =?us-ascii?Q?mUTrsdqbl2hCfr8Al9UGiv6xuYIiSuI0Vz6fPO8WgfEpsUToOsgapv2SFm3+?=
 =?us-ascii?Q?U024VJrx0jn1lgiB2lvLWrdQmhvfyMkNZ/rCTqnF4IlLYY6A5tnZozQanrbZ?=
 =?us-ascii?Q?13Am9sBQCiPM+oHjJTu+mJsmPHPKpAR2nFTHi1ubGMdxC14sN01T1NEuqdQZ?=
 =?us-ascii?Q?hJrxTZ3NShscaRw/wxwaG87cMO4mFn5xPQXP75Zfi8FiiT9ezmG73ZmWPrmX?=
 =?us-ascii?Q?GwpqvCF9TWQ1mLObv9S6tpJoUcI/34g3Qv9bOCPKjPNjqQBlrzrnEXFjIQ8L?=
 =?us-ascii?Q?K6t/zxaKw8MI/NGFuNm/puRfIB//0QITyRIbkCI1LUH+k0aYwsD4dRnZtsJK?=
 =?us-ascii?Q?z0R9CRFVzF9J25CZUCgOEfTfpQhaBWbtjbuoqtaKddFCMsHWS19leuCiwuGy?=
 =?us-ascii?Q?YhFxf5jF2aulpgVeyytS+2RSUICNf1FU6tdZ/YQtngRzFn2Hw1s6FCOpxUek?=
 =?us-ascii?Q?g6/cmGKjmU0wq7c9PrH+JXZdGPmF7fFiOcRobLwYZvXduGSyCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tVBau5ngy1aaMhllwwYs46LfXad3GF0/HAUfUbnPirjh5nyRBWrfuhfsyis1?=
 =?us-ascii?Q?dVmPSxjL/x60TIRAcC4X7xBUFXij7ThmKSYYhxqVmpG3TptF/Z3IGlyl2RbD?=
 =?us-ascii?Q?74FqlCWSshfCM/d/qb69biDYf+5OhrG8YphR2XUNNaJ/G2xDAeRvrxNvewkC?=
 =?us-ascii?Q?g4BR7Z7LhvxuMAd0JNpMz/Y+44Z19Rr9bl5i75J6liajdUFyM0gamxRdxQKg?=
 =?us-ascii?Q?U/sIT4So7K7UQB2SGWlnx5tTnm34wicgNpajObwnqQQjfLgaPaC/ryPxfPv0?=
 =?us-ascii?Q?HjgHTUIkSlzh7h/cNteB9oipLA56JyxtjKn48i4pKca7/pzwJIkMz/WgPu8Y?=
 =?us-ascii?Q?kCDLIPaQPsP9O++cRPo61+WdJWUDWnRUqefnnttIn8ico2fZupa8++S051cw?=
 =?us-ascii?Q?iDuZ7zrFM6CfJFvVt1OALZDZwRVQx/8BVKZlBJqpC7eCni5ncrgSMdkePEa2?=
 =?us-ascii?Q?6q3TARCUYH2zgCLhk6O+rzoA9lrSx1dQ4fjScRivi4iVPrm48K3qWvo/YQDd?=
 =?us-ascii?Q?jBHjTTOcrE6x13Cie+6zRAS9pgqmrsrNkLS9wmxT4mohEoBfl9L1HKerf4un?=
 =?us-ascii?Q?mxpyOjFDQeWuA7r2rhujYIiNbs95OzQEZWWHBSBVo2YIPc8Lv8zo0eB7J77Y?=
 =?us-ascii?Q?lowHUkTfc8QEp5C2jyMMvc1IVQR9zznJeprM2UvhL2h7gbximKQwN6LbS3J9?=
 =?us-ascii?Q?I/BK6ELtYvnVmLqxLIe9MF+cRs/zvpgNmGoOrJthxvb2AZgio/fI8Oe0kujD?=
 =?us-ascii?Q?y+G8sAZDj4lLYQfSlbTqD7nKE8fsywSZ0ZQ+PsFW/MhvBcmTLxhzGsiBmfGw?=
 =?us-ascii?Q?/+r3BidwdG1BAzHfR8E+2H3qIL40TpVvI3QIxImA4zfM/ELj2wQiQo8+y3YJ?=
 =?us-ascii?Q?htRz0k+WlqvCYicBUbOBQpUnmAxXTucXIzedboptGsckpWAkVaQpjErp0lls?=
 =?us-ascii?Q?NBZQEJ503ah6/o53EL/Pola4S59gY+/ywZazEeKN3xBuBwNsLAz5gTbVV0Ym?=
 =?us-ascii?Q?gX8Awls6wL6WKOXcX6MqrsJfeYViPGDsJjFNWPF66Erf0uIK9TS5N860cdY9?=
 =?us-ascii?Q?ZiXZLyBugCI/jO+7GHIdgVBlGcUwIoBBIKRfMoo02ABIh1bAmboNR5bEQE6h?=
 =?us-ascii?Q?4QQSu4UWYUejB89dDxgkQVFx0X9KRANOiD8H2bQsiGqeKsHyKMub9T531otW?=
 =?us-ascii?Q?BuWffue2aEbEYbMhkNE00I0DSiPEiO1Kt+R/mlYEKdISyeiiwcCcMMoblLlq?=
 =?us-ascii?Q?XYug+KEpKuTbS8o4uv2Vbi/54cjV8DeyIweuVddg6cJE8qTUzQNfWa5Dch2N?=
 =?us-ascii?Q?/7y6Qpm15lOThF3QPPwUNtimZRSyWFytzhvnUPOhxHVssqxlVau1VItYV2X1?=
 =?us-ascii?Q?Pla5vV2GTf/Kg5YOIMnFbkRlJqJ1j6LvpO+r+kCh2dlzpBYqyHNAui3AKYGR?=
 =?us-ascii?Q?XCT+F+R7hjbf3Yok2HVsGYdCUSKYm+sxsH4m6AT/rMw7OqFurCKStS4+vWQo?=
 =?us-ascii?Q?Ib7JrUmkh4zefEiqMVlzsbEtKmbYUNOPkW1DYVulI7r8rp1sCFdL5bYjTHeC?=
 =?us-ascii?Q?nkD6NoVe2NwSxjx+oCjgdhBapAf4gdCmgl3fybHLTrXOoXlLEpnZ+baxwqZr?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f327ea8-5329-45f7-7ce5-08ddbfc3ae1b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:51.9086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhgyFW+KqzcbXxBfSimhoOP3n/ifkMPvLvpalyWp2JdhC/Eji9ZUy/DiovcC2fqi5fSlpg6/z+9+o3sLUxYJDA==
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

Load late binding firmware

v2:
 - s/EAGAIN/EBUSY/
 - Flush worker in suspend and driver unload (Daniele)
v3:
 - Use retry interval of 6s, in steps of 200ms, to allow
   other OS components release MEI CL handle (Sasha)
v4:
 - return -ENODEV if component not added (Daniele)
 - parse and print status returned by csc
v5:
 - Use payload to check firmware valid (Daniele)
 - Obtain the RPM reference before scheduling the worker to
   ensure the device remains awake until the worker completes
   firmware loading (Rodrigo)
v6:
 - In case of error donot re-attempt fw download (Daniele)
v7 (Rodrigo):
 - Rename of mei structs and callback.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 157 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   9 +-
 3 files changed, 165 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 008be9b12fd9..85cd42a1ec05 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -16,6 +16,20 @@
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
+
+/*
+ * The component should load quite quickly in most cases, but it could take
+ * a bit. Using a very big timeout just to cover the worst case scenario
+ */
+#define LB_INIT_TIMEOUT_MS 20000
+
+/*
+ * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
+ * other OS components to release the MEI CL handle
+ */
+#define LB_FW_LOAD_RETRY_MAXCOUNT 30
+#define LB_FW_LOAD_RETRY_PAUSE_MS 200
 
 static const u32 fw_id_to_type[] = {
 		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
@@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+static const char *xe_late_bind_parse_status(uint32_t status)
+{
+	switch (status) {
+	case INTEL_LB_STATUS_SUCCESS:
+		return "success";
+	case INTEL_LB_STATUS_4ID_MISMATCH:
+		return "4Id Mismatch";
+	case INTEL_LB_STATUS_ARB_FAILURE:
+		return "ARB Failure";
+	case INTEL_LB_STATUS_GENERAL_ERROR:
+		return "General Error";
+	case INTEL_LB_STATUS_INVALID_PARAMS:
+		return "Invalid Params";
+	case INTEL_LB_STATUS_INVALID_SIGNATURE:
+		return "Invalid Signature";
+	case INTEL_LB_STATUS_INVALID_PAYLOAD:
+		return "Invalid Payload";
+	case INTEL_LB_STATUS_TIMEOUT:
+		return "Timeout";
+	default:
+		return "Unknown error";
+	}
+}
+
 static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -44,6 +82,101 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
+static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload && late_bind->wq) {
+			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
+				fw_id_to_name[lbfw->id]);
+			flush_work(&lbfw->work);
+		}
+	}
+}
+
+static void xe_late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw[lbfw->id]);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
+
+	xe_device_assert_mem_access(xe);
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component.ops)
+			break;
+		msleep(100);
+	}
+
+	if (!late_bind->component.ops) {
+		drm_err(&xe->drm, "Late bind component not bound\n");
+		/* Do not re-attempt fw load */
+		drmm_kfree(&xe->drm, (void *)lbfw->payload);
+		lbfw->payload = NULL;
+		goto out;
+	}
+
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
+
+	do {
+		ret = late_bind->component.ops->push_payload(late_bind->component.mei_dev,
+							     lbfw->type,
+							     lbfw->flags,
+							     lbfw->payload,
+							     lbfw->payload_size);
+		if (!ret)
+			break;
+		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
+	} while (--retry && ret == -EBUSY);
+
+	if (!ret) {
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_id_to_name[lbfw->id]);
+		goto out;
+	}
+
+	if (ret > 0)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
+			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
+	else
+		drm_err(&xe->drm, "Load %s firmware failed with err %d",
+			fw_id_to_name[lbfw->id], ret);
+	/* Do not re-attempt fw load */
+	drmm_kfree(&xe->drm, (void *)lbfw->payload);
+	lbfw->payload = NULL;
+
+out:
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	if (!late_bind->component_added)
+		return -ENODEV;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload) {
+			xe_pm_runtime_get_noresume(xe);
+			queue_work(late_bind->wq, &lbfw->work);
+		}
+	}
+	return 0;
+}
+
 static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -97,6 +230,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
 	return 0;
 }
@@ -106,11 +240,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 	int ret;
 	int fw_id;
 
+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
+	if (!late_bind->wq)
+		return -ENOMEM;
+
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		ret = __xe_late_bind_fw_init(late_bind, fw_id);
 		if (ret)
 			return ret;
 	}
+
 	return 0;
 }
 
@@ -132,6 +271,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
 	late_bind->component.ops = NULL;
 }
 
@@ -145,7 +286,15 @@ static void xe_late_bind_remove(void *arg)
 	struct xe_late_bind *late_bind = arg;
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
+	late_bind->component_added = false;
+
 	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+	if (late_bind->wq) {
+		destroy_workqueue(late_bind->wq);
+		late_bind->wq = NULL;
+	}
 }
 
 /**
@@ -174,9 +323,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 		return err;
 	}
 
+	late_bind->component_added = true;
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
 	if (err)
 		return err;
 
-	return xe_late_bind_fw_init(late_bind);
+	err = xe_late_bind_fw_init(late_bind);
+	if (err)
+		return err;
+
+	return xe_late_bind_fw_load(late_bind);
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 4c73571c3e62..28d56ed2bfdc 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -11,5 +11,6 @@
 struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index c4a8042f2600..5c0574aff7b9 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
 
@@ -36,6 +37,8 @@ struct xe_late_bind_fw {
 	const u8  *payload;
 	/** @payload_size: late binding blob payload_size */
 	size_t payload_size;
+	/** @work: worker to upload latebind blob */
+	struct work_struct work;
 };
 
 /**
@@ -47,7 +50,7 @@ struct xe_late_bind_fw {
  */
 struct xe_late_bind_component {
 	struct device *mei_dev;
-	const struct late_bind_component_ops *ops;
+	const struct intel_lb_component_ops *ops;
 };
 
 /**
@@ -58,6 +61,10 @@ struct xe_late_bind {
 	struct xe_late_bind_component component;
 	/** @late_bind_fw: late binding firmware array */
 	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
+	/** @wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
+	/** @component_added: whether the component has been added */
+	bool component_added;
 };
 
 #endif
-- 
2.49.0

