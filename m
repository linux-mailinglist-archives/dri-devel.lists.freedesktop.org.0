Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B6825195
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114510E5CA;
	Fri,  5 Jan 2024 10:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7049D10E5CA;
 Fri,  5 Jan 2024 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449631; x=1735985631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+g82cLTvUsGz2O7XsukpBKdt2b9RHeeaq9tCoTcWAok=;
 b=dyz2OkiQfZIb6Ywmf+Lps/+3fGbtzqLMOzUaipzPRLoIff6kOQwJB+Xb
 yomdcXYZkdaJZgK2Ej0fiU3b7AGORZNmx2Lo8vioajPOh+LiI8dfTZQS/
 6+8XJg4w/IYiAyizeaNdKyNmEcPpY9+Bt+WQz5XyvQ34YeFXcClSV676d
 jCOsD4JnscZR+J87UArXTU+mvO8GGgB1mZHI2FJDOoahLTwlHRi62z2Tp
 q2+5h8dgnzngayesyXrNf67esl1OshLiOitfFRHAL6MsrNjdllODFD+W6
 t0kv540rrY7GHOGuYkxU3ujqaAOdtnRmppRGz83X/LqyUMv1FZyHRqLHO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="483651616"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="483651616"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="730435432"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="730435432"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:13:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:13:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJDRpd1t7VCg17o5kARFJJzchI9C6DW5dtApBh7kmBjSGolWD926qXDm03SIk0HgBjieIJeZ/TLpAUCYRDsAayA5owJmYTFz9s/2wrDf1aM3L6bc1NMjmU89HG/jB4PPA4ktcP/lt1ZLdw3NtAMldRuDPsHWAQ0bJ15oZCB+fTLxZRnfR7PMZGTSHbI4cfdT0ODO/u/JQDAh6YQc64DvoHtFXZ+MCQbUlqLy/sghfu3Mubk2e9fepVDZNURR1qxzzloFVw7gn+gGuwRxqE2DKesi6KPGs00NKtoznbMoUpD404RfgftjJRKDeDbJ+GegK2zbCpIjWKr7gCGG5GUlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6GlbfUjH/bsmaWYDJhAQjSWjM3UvIDXd4Dwp770O5A=;
 b=RXBeqvCUkY0/kJ11y2/f2uS8GamM/Sh4xMMADFBjQxIC9SeBn1hGFdLd5DDDdNYIK4eSdQgbVbjk4qVbB6VlEcLJCZ1toChggIAF0cg2AvIxT4v1BHFWbM7pZzK4ZISOqpVxKgOViigKO+PhBhEMMeAGCvEqnF77qox6JohdLMVSVFMRuo2kYZp7pJN+DfNedBZEAjimHYRFE2MIl1Kw2j7dSelVi4M7CAtlozRS5i0KAc87VnRFFUQsP41tFjJZYXpoILDGQckl8YSQtdoL/KEJEkFiZcYNTUNfSNz84k9aEb1C77ScGc6AtljIYEsL432m2rlTJAwujOwQz9Dq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.14; Fri, 5 Jan 2024 10:13:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/6] drm/tests: managed: Remove the waitqueue usage
Date: Fri, 5 Jan 2024 11:13:21 +0100
Message-ID: <20240105101324.26811-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 0896ec80-533b-401d-b573-08dc0dd6fecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: orZQMHt4uMgHSG8qg1u35snUFrWwkAd+T97A3XDZrpOi0z+wavD/4LRAbs0EjaF9gZu4KqzOPT3VeKNxyJPm8GcoPD8+yt2ygFxUPkA0qEqQpFY3d478aXE12ugs9okIzxUHmq+edCYqGPLlgzL8Kskhtq7h3OxIya4kY1S5LY9hnPQCeqr0e1YmJCLIhsF0BBwC0MBgXSnNpaEwZhkCAVMV4ueKJmnFF34ogCJsjgI6vkmukoT5xwPq13HnVNwT/Nk3gomiCEQC0mcjaP6Gz01oxIFG/l4kIAZwCLBlMETAZFH68ezHA5ugqZod6BlbgvxfC47uC5nlmvBxmJTntquQF9lcx5Cj0Pg29HV1a39Ss2wjk6AtBAJhZqh4/W53xqtrWI5vVnoJXGRXoH+f3gnUFiUrgf9nBkELyvSgI0Ha+pp0bCXaNrL+7r5cvBXVqnQaj2JVC0gSfnORdOEgvm2DA0k1B8J5EjRiJEfdEfkL4FE2plpKHYxjvjB8YpbDdrkKtrTs8whZBnk1Ffu5PWAvyZpnXspjKU1MhmNJGnKUUzHf641oUNS1S0VVj+1A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(6512007)(6666004)(66476007)(478600001)(66556008)(66946007)(8676002)(8936002)(316002)(54906003)(2906002)(6486002)(26005)(1076003)(83380400001)(2616005)(41300700001)(5660300002)(7416002)(4326008)(36756003)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdKenJVakF0SEZxNkxPUlpwL012SUZpejNMdDZlT2tuR0ZJNDBNUHhreW1X?=
 =?utf-8?B?d21CRGQ4akhETms5aTJaMGZwb3pOb3hWSUFGemUyaTRBNkVYT1htbmk4a3hx?=
 =?utf-8?B?UVVXMjIwczF6U2JtbkxSelV5MUE0MTdnTy8zTDBldjNYbjNPbDZ0VEhWWkRp?=
 =?utf-8?B?cW5heHlWbk9WRThMTVV1Rm0waFcydDY4aFJrY0w3VE5xRFpLSmR6MDYvb1lP?=
 =?utf-8?B?NWhwb2lzS0FwWEVQM2JweWIxWENTUDN1N0xtN09kWTJSWUVCbDhxSG9qNVJy?=
 =?utf-8?B?WDU0cXJGZmlOZmQyWno4L28vT2s2QkgzdVgzRVRVRlBMSXZvdi9pZHlyNURZ?=
 =?utf-8?B?NjBqRXpRSk94SGtlRi9wRkVmSWM5Mkl2VFpFcjZvUUtRVEE2czc2SWVMWmJB?=
 =?utf-8?B?L1l4UnhMeG9HbkhkRWpNdEN6RUFRdFYwdUx0YjNpVENqVURyY01SUDhDRHFG?=
 =?utf-8?B?WGYvTTRzOTFyRHNHWlVRZklJcjdYUURuRm9iVUQ5SHNLVEhOeGFlczkvUWhl?=
 =?utf-8?B?cHg5OU9PWTBkN1lkNGd6WWFtS25SWldmS21KZ2VFNHJBYXEvZWlUSWJMWjdi?=
 =?utf-8?B?Q21UNGhTSTFENHd2Z2ZqcDMzam1PYjNlNHBKL2FiUTljWDQ2R3I5TEdHdXBW?=
 =?utf-8?B?MGJ2Rjhlb3VPQ3d2ZDZzbWtXVHVNWFdZLzROMXQ5b25rdldrQjFjSVdkMCtQ?=
 =?utf-8?B?RGNTd29hYWMwTXRtSmh1SnU1bmhmazBoY3JVRkR3RkhLV1N1ZVE1M2IzeGZS?=
 =?utf-8?B?NFdubGJzNSt2VVdtVDFZMnU0VzVGVVdZYWJYdGpkMGZ0Y0UrU1I2Tlo4OXZo?=
 =?utf-8?B?RmZad01RS2huNGF6dDk1ODc4b2ZsYmdqSHYxbjZmRGlQQTY1UWt0S2NGQ1NJ?=
 =?utf-8?B?MTZsWVRtb2RsTFAyTFhRTUNXdk5ORTh4bkNzLzFLTk04STdZb2FyazFGL3Jt?=
 =?utf-8?B?TXNLMDNEcUtvRU1tNHA3SmpXSDgvV2pSdXRNNTc2cm94bkZiVzRrTE1oQmQv?=
 =?utf-8?B?bGlxUnIzNDlPWWZDRHdZTHJYVUJyRHRYeStoK043VEhJMTREN0tTSjZhRDk4?=
 =?utf-8?B?TysvSVJMZlVPRitlcUtjZnB1VmdLM1VwY0p4WlVNYmJVT2g1YUFNTHBnY1Ur?=
 =?utf-8?B?Uk1rT1ZrU3NEMktvc1VWUnlNZTAzWHNYSm1ML1JVSHFOQi9kSmFKK0NDTkdK?=
 =?utf-8?B?d2ZVU2QvbWpCd3dzVjVocU9CaVZiOFcwVFZuTEl3aFF4ekpHNEJ1MXM4cjJM?=
 =?utf-8?B?a0VJbldhK2RFTGlreHRsckFuYU45MytyRVptbHFCQkZHVDRYQ1U5c3M0czdq?=
 =?utf-8?B?amdoVEh6QjJHY2hRQlpPRitudTBqWEIydEt6TktCTE12Y2xzWFFlWW4wcHRo?=
 =?utf-8?B?TDZLK2NEb1BsQUpISk5iME03eThlcm1UTmF3bDhGN2pDZ3lCcW1Xa09qMWt4?=
 =?utf-8?B?bkhseWg0NTc1U0VORTlycjRPVzhFeGIyaVBKWGZkdHM4VjkwMjJWd3YzUlpx?=
 =?utf-8?B?UjF6QWNCV241eG1JWkRRRXVYYVo2WG0yZjZZaDlkZ2xIQitMSkdEZ1RpQ093?=
 =?utf-8?B?b0RwbTQ4UUsxQjNaeWI2MzBUOWtVak1sVytyMVdpOU50SmExYUpGeG9keHdh?=
 =?utf-8?B?dVBnR0VXMGZTaE5ad0NLR2FHVkQycGk4WnRyUWpzbndDVkhPb3N1czdOUFhn?=
 =?utf-8?B?SnE1cUFjSTJDYUl2QXVEWE1RaW55akU0bHpHTktGUlB4bnpQYjVqQXZ5TXFy?=
 =?utf-8?B?RWZVbUhYOEZua1haNEcvaWh5NjQ3cGlIZERPTDVGMFhXTkc1MnpIUnROUnRp?=
 =?utf-8?B?QVpaUm9sTTJtZFVzR2VmQlZOcjgzMk9PcnY0MGFZZnROOGxyVVBpUTRhcUMr?=
 =?utf-8?B?ejFwazVCK09yYUxtdFZVNG1zTjdVZjFmbW9VRzNWMk12cHZNN2NRbUVHWmMw?=
 =?utf-8?B?SG9SQkNoS2JpRlI5WUYzcFA2OUhXODR4TElNRTBIajVWN3dTc201SjMzdkdv?=
 =?utf-8?B?T1lnRE1lWFZPcHVnYzJPVWJKc3BkZk1rV054WVl5QVFGOEFFYUdxVnpvTTFH?=
 =?utf-8?B?MmZYU0xwUThGWERsNXlhUlNCbSszaGdLbFprSUwxQ1BGVVB0aGVCU0FiSjVE?=
 =?utf-8?B?K2FrRGlyN1o0bFQxZDV3NnFLZmd5Rk0xVk9QenVMNjNBaVk1dGFZc0J2dGph?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0896ec80-533b-401d-b573-08dc0dd6fecb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:43.0143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayNhrgxH4BaZUeaSsFXfdJ04DiCoQDiwYbMFuarJXzR3PAvPOCZpCBaT7XDfL20Um9Kaq5uOjS7sKki4ZvWutlKFcBPbAmolujzXiL5/+EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

DRM managed release (drm_managed_release) is called as part of devres
release (devres_release_all), which is not async.
The release action should have already been executed once
drm_kunit_helper_free_device exits, meaning that there's no need to use
a waitqueue - we can just inspect the "action_done" state directly.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 659af5abb8014..e4790ae838ba7 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -8,12 +8,8 @@
 
 #include <linux/device.h>
 
-/* Ought to be enough for anybody */
-#define TEST_TIMEOUT_MS	100
-
 struct managed_test_priv {
 	bool action_done;
-	wait_queue_head_t action_wq;
 };
 
 static void drm_action(struct drm_device *drm, void *ptr)
@@ -21,7 +17,6 @@ static void drm_action(struct drm_device *drm, void *ptr)
 	struct managed_test_priv *priv = ptr;
 
 	priv->action_done = true;
-	wake_up_interruptible(&priv->action_wq);
 }
 
 static void drm_test_managed_run_action(struct kunit *test)
@@ -33,7 +28,6 @@ static void drm_test_managed_run_action(struct kunit *test)
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
-	init_waitqueue_head(&priv->action_wq);
 
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
@@ -50,9 +44,7 @@ static void drm_test_managed_run_action(struct kunit *test)
 	drm_dev_unregister(drm);
 	drm_kunit_helper_free_device(test, dev);
 
-	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
-					       msecs_to_jiffies(TEST_TIMEOUT_MS));
-	KUNIT_EXPECT_GT(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, priv->action_done);
 }
 
 static struct kunit_case drm_managed_tests[] = {
-- 
2.43.0

