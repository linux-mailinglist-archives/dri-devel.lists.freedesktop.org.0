Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F352084F68C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFB910E272;
	Fri,  9 Feb 2024 14:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RX4upDDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791C810E26E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707487715; x=1739023715;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zXekn73AeqhUKvpHC4Vl6vRPBq0O3p/BafQFOQQO63Y=;
 b=RX4upDDbj/XDdmOstIpRt1BhCRrkQVmucpbcQ9dC/j1gySd2gQDk2wSj
 V7Q2sgz8x0tOu/vVqPqvdKVwvqp5I+ORYIiuyVCKGJXrh59Tiqw2rfN6C
 PxeTGQetWWHK/Bi6GaVOCqgZE54wmDbogFsC8mQoXiLQ5R3PHZX89kYPK
 R7HP8E/xDVfYb6k+ILMbAb4xM9UfFisIO8mTtgfxPHA2vGgVCN3lwkCFH
 wzjWlqq7XxoA1sKtAvAa03Jcc7QVrkzwRW6D+XZvdiQYBCsn4+e8+8jHT
 eauhHH7NzGay4W9Y7Hb2ekrdv4BArjbGbf7WXsyMA8ZWlt03ggwhkU72B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12081233"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="12081233"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 06:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934432885"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="934432885"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2024 06:08:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 06:08:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 06:08:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 06:08:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 06:08:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNBAfoem0YqlTdfSLmkLOPkIh2MFM5H8IlfBrDzWMVW6DK7IlL/W5PBpoOEwqXzUit3sH0LBT/RRLxhK31Ehu6HcU42hnFLRzyX+rM973Tr86stV0IbcsbICLP7iqjvQloEQGe6I3p//DKjX6CIfq84EH5qZ4J3Re6HHB/8eOQmE0Opo6BxRZ2VkczvBiQ+vcT4Q9DmVnvwwur5q2102kJij9XKgPHhvvAZKom5tBFeoMSEkpnf90qS/2rgUeU6hWpHX6bVNeJSbDgnnbdTJmAT3lC5KCSCczCAwZs0RooV0aNkyaaHxh5MA4ItOaBoyfOmoSznudd4gA+f3/tW2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVh54wBMadB8xQHnD4RxZN2DI5bFjDm8tzv9WMEWmOU=;
 b=DokJv6VyPelyXXdpOkuwMsk8z0i8Y+3+gVaKUZoEdbB+vkKaV1LV5Umq6UgOUXwqHJ1CeDnMLiW1hBVQfdEVHEYl85UL5Av+G35FqBu6uT+CWDSOSEHlUOs2sLpcy0w2N9iuy5FQ+EXgdg+iYVd1ZNOCRSLNCwTfAHoJ9n3Dp8r+/hIis2HDuA36esZ8a31ubvJmUs1+k1RGCFvGQV6+RKvgMQ3tU4NeyoanVstUBCmzoBM/WvM7mUrrw1a2HQ/+bE+IMcoc3uEbbSS9Zxn4RyPKbK3rPNzz9uQDZvnVd3u9wYe6aOSVFD7sEyorCHMC8LT7BITGzUJ4YVN93mUjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.38; Fri, 9 Feb 2024 14:08:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511%4]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 14:08:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/tests: mm: Convert to drm_dbg_printer
Date: Fri, 9 Feb 2024 15:08:18 +0100
Message-ID: <20240209140818.106685-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: c26bd27b-9afe-470c-3114-08dc297897b5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Snb9XqjRQDgo67Jfk3lYU3+ZQkyzhU0WCVCBqzJBq6snm27IcW4rRaeJcgXTLOIdP5mJVVkrQIaoQ3htvwQDbe/SVgGknTDwh4BIWVc/MnkEfrtpLEmtMghDVOYtsIpshf5aAYYTY7D5xxX5pMDFhH4PRIddr6ChvIk6gTFWqaHVj/X72OUzhuXF00ThxQmI7TN1UT4qddIcmqChYzf2hPrnWbPz07h3XnPNBddj0vA1JhyeCOaZwmzaHanJyMO072Iv8l55AEKm23H0MgFkP49GUbzrHlAQG+IZaoNx7CrINwNq+R9pViESb23UX6Y7+KIDIEfD1bFAJGiu9hQklsgcIWbbFosFOtyuNP1JOVutqKVNm78VtSJCOyD8iLcnhT2ldWNvOIg9T+gZWdpxmnKkzGf4jFvdr5zncraEvKgVyMKpz23rG9Jqx/ozgU/GS+iig61R+73Ipy9O6NapD08O+OQmOZpmDAxgr+g8Epv/8LBiPbc1H5GGKRrJlowoE5ZGMni/kjvI1sKnxaiTx6gVi77tMtweZpCDqzfDzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(346002)(39850400004)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(6512007)(66476007)(36756003)(6486002)(54906003)(6506007)(478600001)(6666004)(316002)(4326008)(8676002)(38100700002)(66946007)(8936002)(66556008)(82960400001)(1076003)(26005)(86362001)(83380400001)(2616005)(4744005)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umx2STludGRkVFVMQy85TS9hNU9Rd0VXMkZKSXlUeUlXV041ajJEVnZoTklD?=
 =?utf-8?B?UzkwVDZzeTNEbkExVmxNL2dSMHg1K2xScVFIdk1pUnJkZ1dJTW0yTWY5dGhn?=
 =?utf-8?B?eFlmUURNd0tiRFZpWFNHbVNoME8ySzl3Vk5jclBQRDlnbWRDNWNzSjRkT2RQ?=
 =?utf-8?B?YkI5VnJtaHZyRkVPekJISjYzTXNHU1cvNWNHcStEMzZsZEpnZXlIalFHMGgv?=
 =?utf-8?B?amNISi83Y0NrT3ZzME0vaGNlODNKZUI0cGVBMlBscmdNTGE5bUVaWkJwcUp1?=
 =?utf-8?B?bkVXMGhYWjVKdGt1QVcxNlRtTE9VL2svSzdTTkRVK3pGSjRla3ZRMng5UVNG?=
 =?utf-8?B?a2xValNhVHdGc1h5aG9Ia20wdzhkbk9VbmtmNDg2L25xdWk2dmFKa3RpdGIw?=
 =?utf-8?B?SXFJMlQraUVhZ3p3YmRaNWMweDdSbW85d3hPOHBHUFppamtDWFJDTTNiV3pR?=
 =?utf-8?B?dlcrR09PTE9WUWQrZXJIOGdsL21GSStMYjNmcEZTcEZMUEZOOWdWelVpdnd6?=
 =?utf-8?B?SGl6VWZiQWMrVVc2YWpRZUJzcTdWOVNuR0ZFRjZEancvVFFTUWltVk5abVBX?=
 =?utf-8?B?N1NOVmt6VUh5UVRYV1ZjcG16ZWVheGtjaDZWcDE5WWdYT2RzN2VXZVZhV0gx?=
 =?utf-8?B?VStYWnV1anlmMGhvMkQvdjZyTElHQVpaYjc1NGJhaEMxcWF2dXhOYjVxY3Z4?=
 =?utf-8?B?T2NQSFBnTzQxSWNaWWxLVzJHVlhKTGl0cnVCSElzMno2eUgvY1gxWG9tb0Vs?=
 =?utf-8?B?SVl0MWRuWDkxSEJOa0lOYkRTbFZCaG8vZVgxNHgxdEFnQnNkRWYvMWpTbFJJ?=
 =?utf-8?B?MWhVSVVTVHplTUxnZG03SUFhNmxJK3pnVFNtSkE0WFZXR1ZnSkc4eXV0RXFO?=
 =?utf-8?B?ajBtOHRUYmZwTUI0Y0Q4bWJ3cVpmbHBSN1E5T2wrZWp6R0t6dXpiWlYvSWl0?=
 =?utf-8?B?UVBXM3d5TWliejE1M0EwTlhSMlVSQi9EYTloTVBDOE5ZYStabXN2YUlPUEFl?=
 =?utf-8?B?Y1ZlVlJSNGtIYkdSTHVucW56dUpsTGE3NDB0SE5Ddmh3R3NuTUYyZCtxQkRv?=
 =?utf-8?B?NVA3VTQwSzdWY245dUF5V3dxZjU5N3ZOdFFsejRwVmRQSGRyNVVWcVFBeVA2?=
 =?utf-8?B?cXZsbzJhbitkVG5QMXBzamc2a3dKRHF5bTAyUkVXd3JIRHRCd3l2a2t1U1RG?=
 =?utf-8?B?dnJ1VkVUb3BWSlk4U0tMdmttTnRCYjhTMlVQVWgvcm8xemxwZUw4SkMvZXl2?=
 =?utf-8?B?S21abDVpYldqRUl3TXozMzZqZlBLelpWVFZaTnBmaHRzTDZqeDkwejU2aGR2?=
 =?utf-8?B?dG5BM1dBZmNoTERFenQyMlRMT2EvWTdBN3FJSGZGNkI5dExSOXpOdjJLQWo2?=
 =?utf-8?B?QXdnUGJiS01PbFFqemtCNWorcGtpT1B4cWJacFhOaWdsRWdBZTZBVU1rU0Vp?=
 =?utf-8?B?SEx4V3A1MGR4a2R0WUpIU1JleE54WWJ3SU1ZSXpFanVMbVUyV0VFUGN2SVh5?=
 =?utf-8?B?QVM1enpHYys2VEhiNjFtdkFvYzVtQVViczcxY0doSUwvY0pzOVNTdENsb2xY?=
 =?utf-8?B?bmw0RUp1L0dkWFJUVjZHYUxUTGRFQ05LRFRXVzBNSlZpZGJWVFhhTlVXazUy?=
 =?utf-8?B?Q1lOaU5VWDBkTUlia2poRUkyNWRrZkdUWGV1amFVeFNsRGIrVDZWR29od21k?=
 =?utf-8?B?U1JTd3N3YkZPUmg5L3lZMjBleDBJdElDV3JEakdsanowemVjeHdhSDMvNFVL?=
 =?utf-8?B?QzJSVG8vWFFpQ2t3QUlCdGlrbWh5dkQ1V0gvQVZ3WE9oR0RhVDBSQmJ4RWhS?=
 =?utf-8?B?OER1WEcwUHZ6RWtWWTJvemNzck1yL3pUZjVpLzhiK0E3T2lBU0RCd3dzUng1?=
 =?utf-8?B?ZDBUc1lNR2MwL1BJa0ZNdzlRQTl5ZUowRzgvdUtLR3VtYm1JVGt5MUZZYjAw?=
 =?utf-8?B?TWs3VFY5OW85a3BPaEJHVXdaZG1EWk9PMC83UkdUbDc1VnM1V09FQkYvWkly?=
 =?utf-8?B?eUdGdkFwSDdXVktZaGZVMk9zZURjMWxtN3hnRmRIdjJLbzRDRGlud2V6b3RN?=
 =?utf-8?B?WTlnV2VFRUlURldpcld3VWk3SktQNytPbTNsUWM3L1BxVHNEVEtJYzNEYURL?=
 =?utf-8?B?SWJCNm1Bb0g0VGM3dHhYei9rSjFqbVcxL081ZE9iSUVDV2ZHOThFeGNKenFC?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c26bd27b-9afe-470c-3114-08dc297897b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 14:08:29.9275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgkX1B2hbBCCsUCWJhLM6WyLOJ8ynCDB0t29P0/Ka1kTH+AdwkonleCC5iNuc5AxLUjD1/1/UTg4WXHHan4fIXT02kuZcBrEcySCeMoPYuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
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

Fix one of the tests in drm_mm that was not converted prior to
drm_debug_printer removal, causing tests build failure.

Fixes: e154c4fc7bf2d ("drm: remove drm_debug_printer in favor of drm_dbg_printer")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 1eb0c304f9607..3488d930e3a38 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -188,7 +188,7 @@ static void drm_test_mm_init(struct kunit *test)
 
 static void drm_test_mm_debug(struct kunit *test)
 {
-	struct drm_printer p = drm_debug_printer(test->name);
+	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_CORE, test->name);
 	struct drm_mm mm;
 	struct drm_mm_node nodes[2];
 
-- 
2.43.0

