Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E864825199
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B9A10E5D3;
	Fri,  5 Jan 2024 10:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C010E5D3;
 Fri,  5 Jan 2024 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449644; x=1735985644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CV9CQhOlT0/5VGvMDC7Hks2hAE59AabLvH3u/gvoTpY=;
 b=dlsQpkTuXMyEf3OZSqjGObXqBBTLxJ3Atd/2pyW1ev1R2PtAUEjbR33S
 M6yQ8FlHNSy9nA4VajBEEbzoQyLYOQ+nj8y8wgWHZV/1cfCyaCb5b+dWO
 6ytQauI149n600u5PsJ/LlJB510MrA57H4Zysrzxjz8I2iTbaWhsWpd5L
 adhmFgrBsTN/TfrkaxGVB2E4BCDGiStJQ9MBwNEL/RfrK3i5RFnNdJNBE
 712JtWnZey/Jel/5PoGfZ/xBXNhy58+dWumjEDXB8xoHXM1HGGByvkFT8
 xSdEw0daVqgucEFfv3gnLkZ/664/hl7mJ/MWcNnU8BnYVcKjhIcQw65H9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="483651665"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="483651665"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="730435491"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="730435491"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:14:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:14:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:14:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlyfoMTLKUMDl1wTc7YAG6WwjhxZ8Uuhgbu8h+Y1ovfemOSatzph2wlPccmphclXTSkgQD2fXW1BCz2HPs3M5bmw261h+ouO3anIa4jkXYAiKS20W9Bu1qDk2oTDY2clN2Rjx7huZzEZaxyI5vaK+bfQHQwei74+XllmLMv387XX+Lb9wEZ4QqAsPrhNawoLkAzYjLixN/c9e5cietKMCpPq02SKL67tq+OnJ4+Su2V5C8mn2347mkgm+vPa/+ZGvN0nmpTzFmfidjoYwKsDamqKagYANYrAvtCdUd7yZSLt8gdccDjN2/x/v9V784loq9THDCt3c56N+HQjr0rZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3oaXJhkeI+gqFKTkMLFxSpRvgAZzvlkvC4yrcHGNik=;
 b=MtlqLjCk/uxliHdfqRrdPYjq7fYy9lPeP8wfPn5utSgkv4/Ef6SAPFgC4KD1DDyCxOhLy+jnWHm32A/+21jsJvzuN8XTf6B4CNZSEvhjWQNF6wvHgHp55Z7AD2lTlIXcYEU7mQC3Jf2H7jJXhg/s7/EktE+0qmXHVc950ePD8qVJP6w7RcPI4d8KIPUNm0vYPDxlNgcNSuDBtxjORMNSmWqrZC4lqgcAv3W2fOpI9rVlQ1v7v54yUtRSm9k9V6/I0jD/IhOQJtoh1/9pQUfkztU+owA61TLNSOUgefsgG14U2gAliZbU6trujgBns5OJUBq6aXSeCK0Z6/Ds2eGeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.17; Fri, 5 Jan 2024 10:13:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:56 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 6/6] drm/tests: managed: Add a simple test for
 drmm_managed_release
Date: Fri, 5 Jan 2024 11:13:24 +0100
Message-ID: <20240105101324.26811-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0092.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: 66606960-96ed-4533-711f-08dc0dd706fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZblOjlWvychQRsrbO5HkSPIQwJJeuwp3WSwSmWnSzLRj70jF9DR4ex9A09vCDvGNPaR6oATRQy9Wf8exu4SDVWZrJ8m+M//cZ7nyjiGlb6LHnBsAf8bpc4mlsxjKK0VDMET2B9v5/d/Z00oWoZHZQAzyGL7FoESBwV1RnX4+RfsT2bx0xGKEzOMqo1/4zda5eKDo0IWaIY97nHRNPNZQjTUZWePO1xJyBsgn9KRyP31y3LwrnesZjIOEI5O/PDzZIjGfWFXVk26vtkTZ6AiLLK1NSuV1c7nUH1IGnfhUC8zV/CJvTwa9WQ412zoQ52GQGEBNB1BzkI6BMNURE9HJz1Rc1QXUO+cdvV+sRaMOYLh6GYnWGPCFdfgLThVr1qIrg4D+iYdD6HYyl+1Utf/OJXwHM/u+uBTuGKlNoy3oCY3rqv8ATDqVqgDNxm6SAEPe/8qzQdW0rVYGudWFq8dmKNr86u0Co1IrwSKOUzbNP+73bPsTX/TlNGUMZYm5lAeVpjBc/KR67HXbm6jd8pTLofjRTiEFVSg0mRq7P3Xb789Gj922h3L20YLS6v6jHWqM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2616005)(26005)(1076003)(6666004)(6506007)(6512007)(86362001)(83380400001)(4326008)(8676002)(8936002)(316002)(54906003)(7416002)(36756003)(2906002)(5660300002)(6486002)(478600001)(66946007)(66476007)(66556008)(38100700002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hiNlNBWVNMcFVUYTJjR2tVTFZxTEQyYmZIMWJQV0lBTUVxcllBeTJTTUxl?=
 =?utf-8?B?Q0x6cTFHNXBpUS9JOFlpODl6elNXcWFTaU9XZ2VDMmV5OS9PbHRZZ0ZqMzVN?=
 =?utf-8?B?OFRnZ3dOOWlud3R5TnlnSmFGRzFaYmFWMWhQclJqVmlEbCtjajA0UUNaenlt?=
 =?utf-8?B?UGJzNU9pQ2lodnhJQ0dSTWJLb0JQaW9MWW1zTkpzYWRWb01sSmJBVkw2WTlM?=
 =?utf-8?B?TXpWeWE4MlBFZFlYWm51MzE2NVM0ZnlaV0RnekFVYy9PTTJWc3pTaWxGQm0x?=
 =?utf-8?B?VllUV2tzUnVQcTExSVFVbXhFQzBJVEFBOTVvREhFb29SQmx1M2JQMXNSMFhD?=
 =?utf-8?B?TG1QNlFuK2FuQ0RYeE0wUFFSUzZPUVJkTUs0NE1KcDdzOUdCWjRkUDF5U3hB?=
 =?utf-8?B?akI0WFVNN3ExZmJXYVhGNndrWDdvYTJYQUdtU1pQQnEyRlcvanJnbkZzTSts?=
 =?utf-8?B?TEM3UWtmWEFickFWbzgvNkpmMnFNR0JERDNFYi9CSk1jN2VjalNiWGZ5aGNV?=
 =?utf-8?B?MCtBR1c0TldoblJVMGtOYSsxWUszOWhuTFB0aU5NeG9wTVBOSmZnVzdVdzNm?=
 =?utf-8?B?YXlKeWdNallYUlJFeHJqOUF4b3VGUjhUMi9DV3F6OXhHY3F3Vlo1MkhBL3hB?=
 =?utf-8?B?YXVCODIycjBsOTlqSGZYTDAwN2NKYmRienVjcEtyU05TOHpJSFBFUkpqRXRt?=
 =?utf-8?B?TkpLZVpmR3l4NGEyQngwY3ZvRmcveTBrREtxN3dUVTZwOFdHTUNNTzVIK0hO?=
 =?utf-8?B?czdGTXZSSDh5ZU5KSWpRZVJrcXBqM2dYOEpYQmI2YWd4RXNDZFhJWHBRTTRX?=
 =?utf-8?B?cVFUb1c3Z3N5NmdHUVkxRTdtcXQ2VU9rNURGcytWQTZDS3piYUxTdVIwZVg5?=
 =?utf-8?B?cmF5MnIrK2hNbElhVlNZYmUrYlR2M3RJN0pxNVpxMlNYdjl3aHVIRUxFSnF6?=
 =?utf-8?B?RHpPWk4vcWRBdHFiWUp5Y0V6aVllb0RtWVQyd21EL3c0RWpaWG50WVFsK2o4?=
 =?utf-8?B?VUdINHZjZmx0RkhOSzNiM2NzVXZtSTFjT0FsUHZ2N2NDcXBSSzA3a09hNE55?=
 =?utf-8?B?eDZ3UmIvdWRYU3NLclpUb3hPNzVGcUg3eTVYdFBaVkt5WVVzYk9HUzZpa0tJ?=
 =?utf-8?B?SXJRQ1FnaXVBaEFDTU5YdG0xR0p6NWpxUE5CTU85VzBTVFE1TURwclE5d3Zx?=
 =?utf-8?B?VTVQN0xPK0ZvNW95Ny9FVHQzWmNpQ2YvcE4xS1dZYmRnd0p5ZEpxempWY29l?=
 =?utf-8?B?MjJ1SjNGRnpJV2VyTkQ0V3NtdDJZbm8zSTdLRzZkaXVSSU8yb0U4VWtXemhC?=
 =?utf-8?B?YkpGaFNMQW5mb1hmQ2h0bkw4L29PZzlPaE5Ub2twa21nMnVOZXEvOFNXTmNF?=
 =?utf-8?B?Yzg3YWQxOFgrYlppNEtBS3B2bmRPNVRaZWFJeWt5RkN1dkFHWFN6cTMwTmhk?=
 =?utf-8?B?dmMvZndCRytZTUlxNGlTYnZZQlJucTdncVZFWjFpaVZSOU5WeVM2WENTQzhI?=
 =?utf-8?B?bS9xYXRsMzBZZ2FuaW5nUUFNWXUrN1hZYkhadm4wL1V2TUptdHZzTGx3VjlX?=
 =?utf-8?B?ZEVERWdUaC9sRXE5aE1PYjRzaCszdWJjZUJnbGV0UkF6SFU2UnVYNUJ6bTRP?=
 =?utf-8?B?U21XWU9ldVFqVkxxRk5YV0ZFZUpnWVp2Nk1JR1h1cFhNd1ZDVE1mWnF2Q28r?=
 =?utf-8?B?NmNRVmpjZERUSndOaDNhendwNW5iMDJ4TW02d1dnTXlUbmx6dm0zQVhzcnpv?=
 =?utf-8?B?NUZoZDBrRkdZbzZoTlY5STBiZmhlZWFkNjc4TUFaNUc3bnhhVFYzNmtIeHBP?=
 =?utf-8?B?SDljQm1PR1liakZiSHVkejh5dElQK3dBdFZzNk9tUkEvVVc5M2VmSzJwallp?=
 =?utf-8?B?S3V2akFBTk9iS1JrazQ2bEVvdXFhcWVBVHA2UXdZVGZRckQzRmFuWDJPOThM?=
 =?utf-8?B?UUdIcFdNT0RkeTVQaDQvbzRCSUU5OXJzejgwT2VGRXJHWkN5bXNjcE5WcHB5?=
 =?utf-8?B?SXlFeXRhTHZxeVpDYkNldSsyUUF3VytLQjhoZWI4WUZOY2t0SkMzd3NLZFNJ?=
 =?utf-8?B?RU51RU9VeDdjS01hQitsYkZobTJ2cFQzZE43VkQrS3ZiUHdlcExDUTZraTBF?=
 =?utf-8?B?eEZsQTJPc3BsbE1meWJ4UHprT1NyVDJmaVV4M0RKc0h6VTdKTFYreUZVNnBC?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66606960-96ed-4533-711f-08dc0dd706fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:56.8875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfX6EsbBimyYe6l5VmwTT7barni7XdGsxChFBYX5Ck41qUf/BeI5zyMu9w0XCpXTjiQNd8HJ2F/fqS/d9FVoYbc2R2IUF50kwEMBIq2YdNI=
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

Add a simple test that checks whether the action is indeed called right
away and that it is not called on the final drm_dev_put().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index c1fc1f0aac9b2..91863642efc13 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -41,6 +41,33 @@ static void drm_test_managed_run_action(struct kunit *test)
 	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not called");
 }
 
+/*
+ * The test verifies that the release action is called immediately when
+ * drmm_release_action is called and that it is not called for a second time
+ * when the device is released.
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
+	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not called");
+	priv->action_done = false;
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->drm->dev);
+
+	KUNIT_EXPECT_FALSE_MSG(test, priv->action_done,
+			       "Unexpected release action call during cleanup");
+}
+
 static int drm_managed_test_init(struct kunit *test)
 {
 	struct managed_test_priv *priv;
@@ -67,6 +94,7 @@ static int drm_managed_test_init(struct kunit *test)
 }
 
 static struct kunit_case drm_managed_tests[] = {
+	KUNIT_CASE(drm_test_managed_release_action),
 	KUNIT_CASE(drm_test_managed_run_action),
 	{}
 };
-- 
2.43.0

