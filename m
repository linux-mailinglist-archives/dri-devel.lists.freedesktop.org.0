Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428D82DE45
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8286310E344;
	Mon, 15 Jan 2024 17:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470B510E34F;
 Mon, 15 Jan 2024 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705338867; x=1736874867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Iw0VZEJ+HFEd6paKWv5g2Vn0NbAPDmus/BwEoKJu0q0=;
 b=EZGFLgtaxBSbaP57VpRNJkF7b67XQdjmhvoo98c0RRSFwI8VPMk+wfRK
 MGFliLQ8/bwQykFzkyouIANLFV8djjHjAZ+qkBYHPs/v3I6nnTUgrIkd+
 TYR1AlISN0F5C2i6qTrnkLBUuG+yxoPAn5RIZU9W/k/eB9yg+OQUGu24I
 SdG83WrXjs+jYGdA045yxFmDdb4szP2ETdmat899NWXlPQzlwoDhQuaJq
 HggO1M7N+9tjXsa2snT6P3jQj26EAPjgUG4fc4G8J84sknlTDYhU9Rnp6
 KUBj05jNV92QK1XlSDp1JD/T/rkuseOUjig653svJreKJWoNhVXcbn+H5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="21139074"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="21139074"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="854063885"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="854063885"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 09:14:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 09:14:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nem4TSHaWaYccEpKhNjHJe8VbVTayE6mTHjGkc2r701o6D4Y/x1TGdP2Q+PXdyue5RG8xSzh74YZR4vSB/MnE97ocHSX/MyCnwrjB4jzV9e7d50ocyjB2DNONF4ROSPqTUHbodGJiQrkAYDBd+Y4a/Yp/p8vzLsX964Qmbz+FK6sbtlQpzRmL+wYmY0ypGd4LIH3jFpNWjTj1sFg6xVIxhxMypt7rcj/gFe7VtTvmVblaYum6Ubl0ezkP4a3k53mIU1X8VVd8jILscqQPW/ETI8wSTsdXOwSb81IIX7AFnL6S8Z6n7gPGawQGeyoq932uwsMmgiPkPABU0JFY5OWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQcC7ohGVAYgzqfN/kkAjJJfljR/41ywz9GsUAACHcA=;
 b=EPXTd/uwpKqntFMyZeIhmdSvqJUD66yF+JqHLY/tiw1w2Jxjp3vX2JIYkvNlVoHpmmLbIF0V1gDIbINtEpvxvRgCvApYuHAGhG+YOkmNjWFAMwYboj5C48TJsqlBAmQbC48ZdEGjfht1ueUz71joAHJfQFJgukhP3qyAWoGyoZcMIO56axJQuRub9BvIi2U5a0l19Zy/84xh/McbmcYfU4WAEvdXxjo73yG7thEMs03g9RQLXsufBIh5UNjywaFPhYVFvHeK6djxAxkMIonkHJIRF9YQtn0+JJh+6KqOtyk+RfeGz4rgJsjao75Yd2gknntpABSRbjjyGsE+jNoIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Mon, 15 Jan 2024 17:14:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:14:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/5] drm/tests: managed: Add a simple test for
 drmm_managed_release
Date: Mon, 15 Jan 2024 18:13:51 +0100
Message-ID: <20240115171351.504264-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115171351.504264-1-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: c76bf226-f372-4391-dbd1-08dc15ed69db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fokfRYOHgP09IOIvLSUrxDQSmcgwtm2GAkb3LP1HRLKqv5QcWsbk+MHHfMgv2nHQ/sC7jmi0lOnIhNqUgS/EqQa24pIFyI8Qa/CsaidstMIPsSgtmACS/kjGR5fHGknlpIXU7F8VVqw3M7am3Yfiars/Fn13FuJtrpDuwECUL/49Eyl2YeeUi34SxZRwRnoNqiAD6EbxT9meWtwabl+/EbNG3Yu1Ty3VclNConzfFZGNr1fo+GGzpWkSPfv45f6lYF4rYt7Y5IPauyGcgJdXJ32XyATTNgiyun45J9IZp4rG7AbG6uRbvARS9U9lEO7HVNMvEquhlC70hE48l+c948GnNw4pOvsyGyoGqjV/nmoPP/YzmMY6sXXnAtQuOZJAtbjHHdH9Cuj6ngWcCJ9syz7xFzgqa3cUu/LQYA19ZR/W9gHKYyYrVXFIxvnOREtiDolm22NzIX6YMmkt/ohGEsh1COBvsile56ZoXCBR5Xf1hcQKLtDXgDzr2S0nG6U5L0CGJjYylriWqCAvCJMjG4pTP41vToB8toBfv3y0qj6JZMCpkrlJ9g1pWqVN5q4X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(6666004)(2616005)(478600001)(82960400001)(66476007)(86362001)(316002)(6486002)(66556008)(26005)(54906003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(7416002)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2F3TUkyWEhVMEFISGFLaGluYzZvN00vb0V3d0M5QTBRSms0WHNyakJvemtm?=
 =?utf-8?B?ZlRvdVpOT3IwTlNEajc3QkIzTkNNaXRoZjFZK1VnQXNDTndHREdmVGxNSUJS?=
 =?utf-8?B?Y21jV1NvaGZWdExxbFgvUTVBcHRoVStDbnNYMTVJZm1qRjNVcndQdE1MN3F3?=
 =?utf-8?B?N0cwVDAxTzh5RG1ZM1pPcXBoRHdKSkdWN0FCTjdqNVNQWjZtK3hYY2JPM2NZ?=
 =?utf-8?B?L0Fwd05FR0VMdVg3M1ExZTZBZEtSaWxlRFNmQ1h1YUltMnA2bUdRRHhEejdj?=
 =?utf-8?B?SEtUYk9XSXdqOGhtSTR6bW5TbitJai9yNENGNy9iOEV2akdCSkhLeHdqSEVS?=
 =?utf-8?B?QndIdDN3blcrYS81ZmpQVU5aZWhSb1BraHc5RXpBaXVmSmZRU2w4NTJoYnhZ?=
 =?utf-8?B?bjNGR1ZyNER2WlYrRkk1YldqOVAwNm90WndPb3Q1RmlOMDlWbVppM2t6K3FX?=
 =?utf-8?B?V3Brb1BxOTJ6VmpGVHpCV2JuOUJXcWcwQ0hKR0thOHRQWm82MUV1TTVCWDBX?=
 =?utf-8?B?a096N3FtYjdLMFpoNk9IUVYwLytDbDRtYjJhZTVVc1JkU3VQd3kxK3AxalBW?=
 =?utf-8?B?S3gxSDZvVHZYNkZkK2lUSW1VZldhTTBZaGVUZDRBbWk2K3hxaEh0OXY2TTNx?=
 =?utf-8?B?QWlpMWlmQktaVlBJQWE4cmNDenJLOERhNTRkODl6eWVHaGxmenJScDFFbnN0?=
 =?utf-8?B?ejgvNG9oTjNVRis5bWZsWis4Q3dOTE95Nk5lUTZjVHd0bXpJNTFwTG5XSWVz?=
 =?utf-8?B?Q25qNWdJY21rY3AvL29uVm9sNjNnOHJEV3Rwa2dMQStDV2ZVSmN2RWhjSm9S?=
 =?utf-8?B?NW9vUFBVRmhkeHppdDVqK3lTMEMvSGRWRCtVYWkwaHNTMFkwbkpKby9IdkFv?=
 =?utf-8?B?UGZqWE5MSFk0MDd5cWpkeTFSRUJDbmxPRW1HZWZ6ZWdhNVc5TkpjaWM0VW5u?=
 =?utf-8?B?dENkZjd2MWJadldEOHgxVER3eHVoRytsdXVKS0k2N2xWcW1rS3A4SG96Y3Vz?=
 =?utf-8?B?cklKaVdxclJkWjcvQUN0NTg5d3Q4c2h6OUVLSUFva1lFSWtIRnF5eHZYVjA5?=
 =?utf-8?B?OXlyV01aTW11QnlCMmZpMmFUd2tkaXEvTkdCOUNnZEZIRFprMnB5SXQ5REtJ?=
 =?utf-8?B?cXVIakZQa0ZuUG9XdGFaazh5Wk9ZTTAxQzBmZFJwRmJCdFJGUU9wMUQ1dkxR?=
 =?utf-8?B?cjRPeTZCdGtzbDR4dUF6dTdoTFErMXg4bmRmeFNxd0REd1NHc0RBOEY3ekhj?=
 =?utf-8?B?TE0yUXV5WkM1QWk5cjFxZ0VIRFNaUUw3cWlZVzY0Mk1Hd014MTl3MW81cGZS?=
 =?utf-8?B?RU5aM214aXR4OFFzdzhVUFR1anZ3Zkh2VVlPZlFGenBGc3phNEc3NklVbmxZ?=
 =?utf-8?B?UUZlbTZETTlRNEFvOHJOc3k5aTFDbDVOdG04cER1NGRKbkZ6V01PTWM1RkR1?=
 =?utf-8?B?bEk4V0FzMlpWajRvWEN2T0xXOTRubEdDdGsrSTZCMUh5Ung0dEdmVnhKMmhx?=
 =?utf-8?B?RDBTSUpLa29mS1F4dWxvbDdod3BxYisrOFJ1MTdWeW1QSGZhbDRnVytBL3dm?=
 =?utf-8?B?Sm1TY0czcmVUUGh6MHJBcGtYblpWZDQ5ZkxacG5nQzI2MEtiQllSc3JSVjly?=
 =?utf-8?B?U1ZxN1hUYTQ3Y1pSVWlOb2lKSzJiNy9TMGsvVlBaMWpiTjltU3FYYXFRSWZo?=
 =?utf-8?B?eHN1MFAzZFp3dlVOZGFFK1VXR1YzK2UxUUZSbTdLQXk2U2JVV0orWHFFN0Zi?=
 =?utf-8?B?eXptZXREM05Ccyt0TkJoU2FwSFRjV1BQLzRZbkIvcmpvSWJIQlpOQTdhSlRr?=
 =?utf-8?B?UjcwWE5aWDlqaUxNSnl1MHFQUDh5WFY4SEFvUEY1RlJzVml5L3NHamo2MVNC?=
 =?utf-8?B?NkQxRjVPNnVYVlJ1S2JicWhUb3hsdXZyZlduWU1YVVZydHZ4QmhCL2lJNnhY?=
 =?utf-8?B?SzN2bk5UQ1RLM3htcnVGYjJBZExCQ1E1SjJFRitadDRxb3pYaWdETWJnYVRM?=
 =?utf-8?B?cTNMbGRxVm4vc1JndDVpR1N3NFZIUjVSOTh1Yyt4N1ZaWXI4MjlQa1p5bTRN?=
 =?utf-8?B?T3VKYnkxdDkxOU5reEQ4OHhVQlJRa2xnT1pZYVF0b1J2ZTR4SVZqZ25mbzdL?=
 =?utf-8?B?Ylh0Unkrd2NhajZQZy9ybTNoaEFtODNnVEUwSWtjR3d2OE4yMVNwWE4rbXZr?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76bf226-f372-4391-dbd1-08dc15ed69db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:14:20.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9HVE2Ut+lwuvj6HXWoLn1/lKyhFINQDmt82N3ZezEgf8HpvVSDCtohPiMorAWw+xItzOoAznV1RBmQPlli8hJXdP4fu4UH1QS8cRZjhfMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a simple test that checks whether the action is called when
drmm_managed_release is called.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index d936c879a4a30..76eb273c9b364 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -25,6 +25,30 @@ static void drm_action(struct drm_device *drm, void *ptr)
 	wake_up_interruptible(&priv->action_wq);
 }
 
+/*
+ * The test verifies that the release action is called when
+ * drmm_release_action is called.
+ */
+static void drm_test_managed_release_action(struct kunit *test)
+{
+	struct managed_test_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(priv->drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drmm_release_action(priv->drm, drm_action, priv);
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->drm->dev);
+}
+
 /*
  * The test verifies that the release action is called automatically when the
  * device is released.
@@ -75,6 +99,7 @@ static int drm_managed_test_init(struct kunit *test)
 }
 
 static struct kunit_case drm_managed_tests[] = {
+	KUNIT_CASE(drm_test_managed_release_action),
 	KUNIT_CASE(drm_test_managed_run_action),
 	{}
 };
-- 
2.43.0

