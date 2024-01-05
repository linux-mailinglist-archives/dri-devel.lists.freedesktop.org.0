Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF3825196
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071510E5CC;
	Fri,  5 Jan 2024 10:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFAC10E5CC;
 Fri,  5 Jan 2024 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449636; x=1735985636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yngqZG8Spc06NTUdaXFEbO5cTO9IfPcH40tZek15x7A=;
 b=bEcfQJktuS7mLupe6kbxNc3r0LI79YmUWpLBk6qEdIiOq7tT/G/IQKH8
 1cvyQZxBohNgZnMcBexZvQ+gnmTIg0txbkocH9TimI92aFFU22i39K8dC
 IRfLtX8/DG2n2ow6yzXr/y3Lt7JGj0QcO/S7yJZVd9UZfLZpsACulafo7
 WPFMxU7Cqbz5MiAVUM2W+kFvEd5ztB0kGswzLKF5j29KdwgcJneFI3guo
 asrKT5Ul7qi235PlqmF6dzciQWS78mK4YJuG5lXqORpLW9NInAiVRgmQY
 HaPFKe7NmEtpwNo/sjl4AKFG0qFuJtmfzDUvupB/zFbbZR9kfXzYXrDSz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="483651634"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="483651634"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="730435473"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="730435473"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:13:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:13:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpR5RtF1eUQtOFq1o/wlSlGClbX/rgRqjQbEqis713MFwJ/DJOvt5+IAbcXQFQTnTC6JJ93JzTiO/aVUR5cC16uYa8uL9ASxkZ5OWdTKpeuXrF/GllcvLsatEew7MluPNj4iunKKHwJ+asBV4+HAUQpZA6Mlh18PDxvESf74sAAXqO67YNiqJZkPmJ04+1IZnEk+IdyNf3rMbqg2FhxD2IH8ZptbcmIrxRl1zbyypUDzaBc6j6dNJAI5t6+BmShHirf2CJLGqmVRYGq21WLCxdxeMI3CToO2xyazeNsRPI2+rOpmom2XORx05hzzrA2W2pU1jDJVCI72Kl1FqcpNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36WGdOADJ6H/0w6QoNAwTeI1Doo4V2GznzvvWmIxLvs=;
 b=cF+hDv7YhvTwQg4BoDsMriUzkqYt+RHt37/ljx2A5c9DdOcy+95FyXuEfYOos20OlaR27SX10gL96DXE5IVbeHqTP5h4gUEH/dU8u5ZHoyEigPkm+dejfV1pJuf/ePohmRf+FPmHlv3xYdph0rzf3ZD+v1ii7BYk4ePOdM6J/NRpka6yBtXnvGDu7NC5/0dppsj1mZG4/xt6086XXu2WY8nqD62DuyWpCaJ/8WJbGlbt0wLK1LV7IysTMuUP4Mu30464KGTD8MDrAi7AkpoEu1z8gosbXaqPF60AtobnGRfhSpP46hoOWJsfRohuoCb8K7XawDezxucJSakH/vvzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.17; Fri, 5 Jan 2024 10:13:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/6] drm/tests: managed: Add comments and expect fail
 messages
Date: Fri, 5 Jan 2024 11:13:22 +0100
Message-ID: <20240105101324.26811-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0007.eurprd05.prod.outlook.com
 (2603:10a6:803:1::20) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: d960fb1a-3988-44e4-87d6-08dc0dd700bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4DqXvZf7zn2juiK45TfYS6bAOq4clc8FnN8tOHK50lyFlqOi5TIjHvHsiwdJQBGppwvuxr6CudcLKDgWJM4kYwOx9mlvNeYegF5VNRyzrVV4X/yF13o2bveBYEonEBoeNzDPqPITX5dvItnhf7+Wx2p1lHYYUrdWY3ilc5MUyDUu2ufK5vP3KjS2Cmy/9Z0JMIFQMIsxooqm24tlusIQZ+EWYrGcn8QvEZ+74JnJwHmmbr2K5Q8PllZfq5HeoYrWtdL/4X9a76Hl076/I8kg01qTzrXG5E6jaTGnks2jtN2cCts3wTA4pwG8NZXZbI74yG/nD2lkQA3RjATkJEugZBk20w54Uw5J9RxJS9h0mU0ymt+WKNXmc6dJDouL+dkKPVCkuHBwC5Avo0c0tiFyCPGvlc5bZhjBVrilWZ0BpFnTLB5I271qEj4iWJL+1I+hGaKYt+zwL37kP9bi4SXRmddMkRWmLDMP+fJoMHLfvOVmNX4F1XApEvjxJYiL72xf96h5whXHR+zT2oUlB4plS1vmKhR7Q8JY4waXl30jZz/ngC7hafZEEwKXdAzqGpUO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2616005)(26005)(1076003)(6666004)(6506007)(6512007)(86362001)(83380400001)(4326008)(8676002)(8936002)(316002)(54906003)(7416002)(36756003)(2906002)(5660300002)(6486002)(478600001)(66946007)(66476007)(66556008)(38100700002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHgzZ1hLUmNKVWZ5SERxcHlFcDQ0dDB3VFdhemRuTUZMemQ5bXAvSTVGTVZ0?=
 =?utf-8?B?U0xuUTByMVdMbTNIbnhzNGl5VDVUMU5PQ1QvWTQxa1RrcEVBTS9QQ3N2Vlo1?=
 =?utf-8?B?aHdsRHBhRURjaUxGU2o5aFNUT201ZTZpRXlXYmJLQ2tqZEx2YlZHUUtRUGIy?=
 =?utf-8?B?KzJlVEJJRnJmME5sQUZwWU5VK2cvdDFGYjhUNTk5SWx3bVVseWUxdlRmMmoz?=
 =?utf-8?B?dktCZ2pwaHZudFNkZDJsWE5lUHRFbE5jaDg4TmpQRzIzVmlCUEdqTGNEcVIz?=
 =?utf-8?B?UkpiWWpET010TzlQOGFQcmI0dkFFSTg3TlVNTHYrRFpNNXljTEhVK1M5SE1r?=
 =?utf-8?B?L1JpOEJwaHhnU1UyZ0d0dXpsRDJIcVFwOFRIamtwRUhFcE1BTDdTTndFTFpu?=
 =?utf-8?B?c2dGcStXM242elovRHMyc0dTQmNaYmQ1MWQ5NXRUbnZrbTJwYjR4dmRibFlp?=
 =?utf-8?B?ZjEvM2dRYUVTMUlyblJtZWx3MGcvZW5aNDJjTjdFMnMxcHFrbzBpUTZOMUtp?=
 =?utf-8?B?Qk5XREFxSU45VyswUXJvVWFnSGRMenFoSTF1cC82bkk2Q3htV2hSczhqbm1m?=
 =?utf-8?B?bDJaL0c1djZvOXZMVUJTNW5NcmptTHFka255VWk5bDZDTXo1QkcrbmpJUHBN?=
 =?utf-8?B?ZXBIVGFEVHRaRDFNTEhVNVpGc2ZSUE41QU9qMWdWMlV1TDFCRFM1NjVqQThn?=
 =?utf-8?B?U0VrVUN6VmUvcU5LbXhQUGticDE4cWd1ZTNHS3plb0dDaGV1TWJEa0gwNzlP?=
 =?utf-8?B?NjZUcHpGNTdZMVdJSmJlb1FLeDJxZlB6emJQeS92QVRUVy9UaHNRdThzMzNj?=
 =?utf-8?B?ek4vc0dtc2tVT1lhU0JkZjRuWmRWZWJHekpEc3QxcHZ2eG1wVnNhaytMU0Vt?=
 =?utf-8?B?aHc0OGhPN0F1MmxzNGthQk95alJ1Y1hBOEZETGJORWMyNzNJRWV3Tjhzc0FR?=
 =?utf-8?B?M280VkQ3R3JJOW5Qcy94bE9PWG1VUENQQ3pBOEZDbEdrMFhjTU5SUk11Nlo3?=
 =?utf-8?B?M3dDU1lLM2EwZTdCMTlYWHJkR1plbGo5ZnExcUpiUGZOdTVxMWFiL3EzcEZP?=
 =?utf-8?B?Vmo0N3pyUGlzT3pzcFNQL3hha2F2NE85VXdFblRqUjVMd2ExMnVSUHdHbkZ2?=
 =?utf-8?B?aVpDZkp0VWJBc3duTkNnMFVHMG9hNmJBR3hQYzU1OTlXUVg4Wk95M2MwRWdS?=
 =?utf-8?B?WlhKVE8xWjdwSmNlaTE3eGFTUEg0Q09lMXRxNldoZkRzMFowMXJPRkJoNFQ3?=
 =?utf-8?B?TWJ0TWRvZ3NGNTYrZFUxNzJXQ0NxVlMwWk1wY1VsejlCWngwRUNDY2pFNzhY?=
 =?utf-8?B?bkl6cGxCYndIZ2RycHl2Y2hFMXV4OFZZczFxNmJyWFlCcWpHbGlQMFg3WWw2?=
 =?utf-8?B?S0psVG5BNU5DY3lqSzRJRlhVek5Qck5RK3h3VnB0UDZQMUovS21QSmdCYWNH?=
 =?utf-8?B?dkx6c2Q4ZDJVd3lCcnl3QUNENDRXTEtoKzVZVmNZVmxOSjZOb1cvRmNIQUNa?=
 =?utf-8?B?YnJLNmJIdHVyMk9weGpveTZ1SW5hZytCYmtlRjFDbi83aXQ4OHQxdGZDdUNC?=
 =?utf-8?B?UzBiRi9IS000OFplSTB0NW13OEtCeVdTOCthazdOY21ObjlZK0VvUGJvckZ0?=
 =?utf-8?B?S3FrTTVjc1RZclFsM3BQc1p5aWYzSkF4SWVIMDNXQnFPUndzRVIvSXhPRFNr?=
 =?utf-8?B?NkFBakorZVRCZkk5WWdadUVmNnV4Z2FSR1BFdXpiaWxycVoxOXgwekoybTFk?=
 =?utf-8?B?cVoxRXJPc2Y3YmxmOW5kWm9HN1Y3ek9lL3BqSHVYWU9JWnV3dlZFNzFXNm5u?=
 =?utf-8?B?UUR5SCtNVURHbTZHd2FqdTdQSExpOEpIVXVxZnJTYms5cUYzZ0lPdFcyS09C?=
 =?utf-8?B?Nk9OaXc0Zm5XUjJ0blM5OHQ4QWlYcEUyQk1LNExTNmZoelJja3lGeEtrR2Iy?=
 =?utf-8?B?em1qM1VING1kbFFmMzlTMVE5TkF6SG0wU2lKd3IzSHV4Uy9DaUVqQTZOS2Zm?=
 =?utf-8?B?cjZQYW9kS3d0WGNtbzNzbzg0dWlWMVhEcmxJS1lBYmlDQmxBTVhCTi9UMWQw?=
 =?utf-8?B?NmJjNzhtdG4wOVBjWkNOQWx3bUx1bkZIcDFacGY0TWhlSysyWk5NQ2dLZTBS?=
 =?utf-8?B?NTl1RWx6NUVWN0dVQ1JwRTFhUVZSTUJnYXk5SmJkL0ttdGo4S0JKSU95cWxI?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d960fb1a-3988-44e4-87d6-08dc0dd700bc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:46.6390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnBS3Xq0KhmIAbrqLEYcMVDLROpXSuYfz8ax9F94iaGEqq0Ue+yRBIWv1MzvSMnUDgT8eAklSpjX6TvHWoz6ObugDd9nGd08Pk+0N00mPXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments explaining the intention behind the test and certain
implementation details related to device lifetime.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index e4790ae838ba7..986a38c9144a5 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -19,6 +19,10 @@ static void drm_action(struct drm_device *drm, void *ptr)
 	priv->action_done = true;
 }
 
+/*
+ * The test verifies that the release action is called automatically when the
+ * device is released.
+ */
 static void drm_test_managed_run_action(struct kunit *test)
 {
 	struct managed_test_priv *priv;
@@ -32,6 +36,11 @@ static void drm_test_managed_run_action(struct kunit *test)
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
+	/*
+	 * DRM device can't be embedded in priv, since priv->action_done needs
+	 * to remain allocated beyond both parent device and drm_device
+	 * lifetime.
+	 */
 	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
 
@@ -44,7 +53,7 @@ static void drm_test_managed_run_action(struct kunit *test)
 	drm_dev_unregister(drm);
 	drm_kunit_helper_free_device(test, dev);
 
-	KUNIT_EXPECT_TRUE(test, priv->action_done);
+	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not called");
 }
 
 static struct kunit_case drm_managed_tests[] = {
-- 
2.43.0

