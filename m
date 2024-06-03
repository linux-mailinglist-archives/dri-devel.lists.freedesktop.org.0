Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7B8D870C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 18:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182410E256;
	Mon,  3 Jun 2024 16:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0SF6+xN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14010E1EF;
 Mon,  3 Jun 2024 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717431639; x=1748967639;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=zrAUx+LXjOr1xqonaERsKtVHSdBPo3YOAMh24KlsIJM=;
 b=n0SF6+xN+k6hZtTR4jpKVNX5e9B1CpO+5Ut/AsjFHgvbaRu2I/KwvMSF
 zpZVQJo12IKw//A/im9eKe7e4yIuCCe+EBx/7IoJuV6a1t5Ci0IUHjyFs
 9jOuBdz3BF1gJIiql0Cm/Uo5AjvJBZ4FHgGKNJ5vHlvdbh8N38mHEWOOc
 X4iYFpR3ZSUmAW3DT7FK2JSoyiaiftx7p2SVNuGs6GDQXBdTgdVxRqm6U
 PcGDpjy1NaSRIXHR2aTueW3itUSM15DRtvdH9rOmv3EH82sJyeosspF0E
 6nbwbA/6yyqJZ+A11E4COOT7mmvOyY7cOXVWydSWihPv4ibYbv6DVSBtm Q==;
X-CSE-ConnectionGUID: 2uqMtApQTGOE0apGRQpWkw==
X-CSE-MsgGUID: kybBHnNHSYCJ/GH2cKkUaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14159577"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14159577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 09:20:35 -0700
X-CSE-ConnectionGUID: JlJ52/zGRZ2pvb6+n2RYfw==
X-CSE-MsgGUID: 3XfAB7MBQ0Owz+oyPfFztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36905711"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 09:20:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 09:20:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 09:20:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 09:20:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 09:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCc+zHTjprfUJDqG/4fxy0Ix9WECgWNFtUG8gvojmNT5/YyEZtwoicq+HgS7E2T5hoLDj/YS36rCqDNzGZUuRVbu5dcRgWTc5Y8wUlzF3tHIiQJgeNn5zUCE4r4bKwKmXwUir5TYwiTfIZnopJwdcswjwPvWtHsVCOrNU3xwIVySdXSqJ3D1ubbqGrZIDrdsMQeGrGI9ZqNcjifeuN6UUR1MLgOQCkPLBU7m8RpAyP2qINm0tnnnyZJd4MK83C6uYQiYgA1LtocIXMaag9iHKOOtJSxhsSXfc8HEqK0aam0fNzGJRmGSYTfIs2+jjZcxs7FvuGFUR3rnyVao5SSJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+N7X72YZpAmJCSHs05X6sDxR0QXnsIkXopgUlG62E9I=;
 b=E0/635K9S17x88R7ViVYSJuJUHNsLaVHAdfzYVfB3IPDHLiW2YNtat8rlHjXLJKuVB2HGESsdRAPatWBNBrMZQfSEjP0YljiEKGpfTxg5J8tJMmdyvkav0FXEUkAPU215+LcAnnwwkIOl5qVrE30YZ1YVATVXHQvGb0FBs1D7OOOPop5LwVcOEikIvCUVfNPbK5nL4ZFCWSPIkclAS6wZWrftD8Tn9KHV7fjLcPYLR6Dkp1qlGKCOZ6SDm1kUQRfA+5PUqqn7GVH5RTNmo60+g0xcene05n7DvOl+zI75PvD4Tg0L2oGYmWn1bjd9YgXYCbyiww5y8Ut3+Lp1EqyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4001.namprd11.prod.outlook.com (2603:10b6:405:7f::32)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 16:20:31 +0000
Received: from BN6PR11MB4001.namprd11.prod.outlook.com
 ([fe80::c76e:a00a:561f:2db7]) by BN6PR11MB4001.namprd11.prod.outlook.com
 ([fe80::c76e:a00a:561f:2db7%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 16:20:31 +0000
Date: Mon, 3 Jun 2024 18:20:22 +0200
From: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <andi.shyti@intel.com>, <nirmoy.das@intel.com>,
 <janusz.krzysztofik@intel.com>, <chris.p.wilson@intel.com>
Subject: [PATCH] drm/i915/gt: Delete the live_hearbeat_fast selftest
Message-ID: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MI1P293CA0010.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::7)
 To BN6PR11MB4001.namprd11.prod.outlook.com
 (2603:10b6:405:7f::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB4001:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd5f453-3100-4947-2d19-08dc83e916e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rztu6oj48OmZIv/h0YRyKRSJVu4sW8bxUj8tttaA1In849U3rhYyA4flhiDi?=
 =?us-ascii?Q?uQAx2e9yoYZI6raPz87ESB1lJpqiiyD0uLGxcGc0BW2Q6gOp3o5AWWrc5Env?=
 =?us-ascii?Q?gZBTz7SlSdnqZf0HMwCqzRZMtjsRUniU9stR7YFbEF7njmL5rv1t1r1ypZJp?=
 =?us-ascii?Q?InxhoquufAEVgfjPbbT6txLbA1esT6XZXloQxu/tSkrvmY+e/z92uLayNxQq?=
 =?us-ascii?Q?0XQPbrO85oRah433gEIWrn+pSX6glkYH9FMDDH4T5Fez7qr/UcwY2rfaLAd4?=
 =?us-ascii?Q?wPV7dfwoHZdibGRC+GBMmGV+FEd2sUgKV5iPmZ/vVvlHGrgXqQmLj7sNP2rE?=
 =?us-ascii?Q?8anV76sU76XDdGJKnPhlwopRQbtZGrq5zTKbhDKGk7k3JsZyXTw+iNFws407?=
 =?us-ascii?Q?UhFwRRpm9UM02cq7+8mpD/duNaqBG9EvyzfnboLL5+ZncTzYpoNcVY9FF8Du?=
 =?us-ascii?Q?KRpCoEKDi9GL8ZZdGH69oVmQgvILkw8aljxeXC6mpk0OcU3GVPYiuwEMkFHD?=
 =?us-ascii?Q?pppXu42numF0JA624H9rF9WNi8lyixKGfmUMflhYrQqn67PihN9BTCg7jTwi?=
 =?us-ascii?Q?x7v64kw5hJ6rcWZYNrTDN6ekQU1MiltNWhXUH2Yh7M0dAoDIYR2VFwHgA9YT?=
 =?us-ascii?Q?VdbYej/1XlB8NpUXHIBttkMnHXsPEy/aOng6L0Ho3l2QV4aZduzxbvv4qMSq?=
 =?us-ascii?Q?CxxmcILLlszPGr30RMAsuHW5PuiZk9Bl6C8MZhWOCyiXyS2QA3BKHWLv1Mw2?=
 =?us-ascii?Q?nQ6jVVqbdKXhIYCH6BsDmo+Uz2TQtvCHHazuC4LTnmBN0vfTfvyALSiPG2+Y?=
 =?us-ascii?Q?mgq3BLJ0HJL0QS//aS5t9CrfLxta+QuBZ/22AUG3de2GnnqY4x9hWVh0LDei?=
 =?us-ascii?Q?pS/MtFNMxO5nDQ0vbR4ZmKa/w2AmAMhGu6lgEZB6ouQMRpzse3t0rxlfpWyY?=
 =?us-ascii?Q?J/bNdK4EhjGeKBiREiwqiXN/skoHc270kQuPJ76JmcsZbHVJNOBJNhzjdVWf?=
 =?us-ascii?Q?lFo0jNV9Fp3URrhFIi26XpNuz8iJdUIPmnlu4GCIlyZEaEoeYU2FV1bVXNvj?=
 =?us-ascii?Q?mX4jopSDlqHo6Qqjq65zGBvt9Mb+wizP08c8g77uJg6QBjUT2m1LnyB9uIWA?=
 =?us-ascii?Q?wGry+KpVdZLfbgLW9fnNICKZJmmLgm9O5vYbgxW09t7Tj6sB0/z5NX2fFMBd?=
 =?us-ascii?Q?ffYqzivGBeTFc/KtPVouXzkBrngBe2TKbkq1i/rAzJVLSbuDdrVcskMR+tI0?=
 =?us-ascii?Q?ZFletWEZXG+mdXXM0kHMjw12wRyIW5nz5CfiSv25lh0yW/VAFac28Kiipwm+?=
 =?us-ascii?Q?fddIBWd3YyfqByNYYog7mUvS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4001.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GLHYeCvfO7MJMkjDOMpliqoJN5q3pNNupaNdneTuyiIptUOznIW5wXnvbal+?=
 =?us-ascii?Q?EbEvFIOf9v8FMYTcSz6VTk0pLP95lGD80F4SHMHWIBzioZynKLmxIR43gkE3?=
 =?us-ascii?Q?5d/7eZs6zYyWo6tihgx6nXyOLltoUV0lhw7hSoO/jPjT7SPAf9T01gtNVvMq?=
 =?us-ascii?Q?z57XXQPl7b/ri4sbNpG3/UlDj4o5+bhN6SpQA9gvwBhvBSL0e71rZIKcnlnh?=
 =?us-ascii?Q?+xqoth+eXAXthH/ypdDRI1BHvKuxKOmKgDFiVmZGxSVbzRFMJPl88H91MZR3?=
 =?us-ascii?Q?Z/zbm1b1lXD1BPm+HxHGB5hg4J7yPn0cRiX922hKqnSmWNNO6cpC9MEOoKg8?=
 =?us-ascii?Q?VfCYoHSfImlMFjOP/WeovHOEbsE8Hi0d1oVC+zC9kC6gDPd3aJJJOOLYuyvB?=
 =?us-ascii?Q?Ar9aKQEYgGo2ij8iHMzteehu6ODmMRUoqNsOW+9sdQ76mBjM+51uGFrE3gOM?=
 =?us-ascii?Q?j6j8AQucesE4LByf6gbSPcRFzAbCu5/X+FUT6nJ85lNl/9XjFT89DjCrx6fX?=
 =?us-ascii?Q?qI8Twqalg82+mtOdtq1zZYExAH6b0uedUxn+rVMkwKeHdtlH4jPK7aHCH+FO?=
 =?us-ascii?Q?eaA7rNazq6c8fl7B94h0kT4gebIujz/gAVh6ufoA9wfDZbUkYWkazUTDsAok?=
 =?us-ascii?Q?38Jed462hvZXWK/NKxfloJEFP9IIx/K9XSwQyMx44nyYOx7JS6rmD/Fdb9fh?=
 =?us-ascii?Q?mJe86bQNg6e6xVqJyTYiFDiS0f4vgdjviDuVs+cQt/6YceTGXloSkaTHY6iO?=
 =?us-ascii?Q?4slNYeCtozGiIWmtpmxTg6PDCfMhlzl2EFJgmVvYOLX8eiQjXcJFWi7qpUkA?=
 =?us-ascii?Q?9GcaTZ22X++3LJyUxn10ErKHqF5cSVVFURFjoiTW2klw6H5yryUP9VBTAEvV?=
 =?us-ascii?Q?yP7ETNBXJTheuHtx9TRF39/4sKLu1z7EcsfcpAgqJQLIa4kaIT9RyuN0GPtf?=
 =?us-ascii?Q?2JNixzuCJMIILDTXg39OJEoeTyZ45xfbN2wt2k8zqlygtTaVgve6Rn3LcX8R?=
 =?us-ascii?Q?IN6SGGFKq1fNABpVxtE+zixkk54XAoQcRLaVUE6Jj0ODvDWGXJtH/Iw2iaPA?=
 =?us-ascii?Q?MMPXQ8hiCA43ifpRFqmuY3VeyxB03feMIrLuVL0wWR8zAkK1W9zP9+aPLnmQ?=
 =?us-ascii?Q?8q4CNLgNs/P165mvwhu3a1JY+L94VKcoqOR07Gg0OAbFDlDKJEcZ9fu/VTZj?=
 =?us-ascii?Q?Y9KI12t3HOSkAm6nPyO1sAPTXAnqnlaIt5hZZUQVs3yVjb463AZPPCx7duNN?=
 =?us-ascii?Q?zOwVfPfsZaBYMkmebWKrTQI8rml29JjJaM7vR/v9dzWjhR8MRDymiTWNmlbQ?=
 =?us-ascii?Q?z2IyAitUCBOfMGaYaVpIS2Xgue6XWoct9Z3uWd0zO+Jy+VF915A3/ivp+Tbt?=
 =?us-ascii?Q?oo52nfJ83ePvcR8g/GMo3/OHzTrFwku8TuorALD0VRW4+DO8wXBTyIOUx6K/?=
 =?us-ascii?Q?TvBHFSSBaofMgCTsDDH1yU/BF3DRcSbyBOITukmcdMrtf+nQtiv7h8UVDKGX?=
 =?us-ascii?Q?TlP07Tl2Xo0n3JDWItux4wkJbSqegZR6DMX8H9sFDwj59aMLC6VrMNa5LSeM?=
 =?us-ascii?Q?B1PmGkYEmr7+nEAGajINvG36IMtY8vnrVNWfyPH19nvOw3SVrOFLT3qIj8Ed?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd5f453-3100-4947-2d19-08dc83e916e8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 16:20:31.5476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mu/01sMa4ln9m3ZHRP10dkEAds9shSoNF9vHSAmTNqfiaaOYwMiBJzPSoaEX2cgw9LX5TUpMPFxybyGCoOjVtO8KG2M4CWT64I0FcCSnc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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

The test is trying to push the heartbeat frequency to the limit, which
might sometimes fail. Such a failure does not provide valuable
information, because it does not indicate that there is something
necessarily wrong with either the driver or the hardware.

Remove the test to prevent random, unnecessary failures from appearing
in CI.

Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>
---
 .../drm/i915/gt/selftest_engine_heartbeat.c   | 110 ------------------
 1 file changed, 110 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index ef014df4c4fc..9e4f0e417b3b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -193,115 +193,6 @@ static int live_idle_pulse(void *arg)
 	return err;
 }
 
-static int cmp_u32(const void *_a, const void *_b)
-{
-	const u32 *a = _a, *b = _b;
-
-	return *a - *b;
-}
-
-static int __live_heartbeat_fast(struct intel_engine_cs *engine)
-{
-	const unsigned int error_threshold = max(20000u, jiffies_to_usecs(6));
-	struct intel_context *ce;
-	struct i915_request *rq;
-	ktime_t t0, t1;
-	u32 times[5];
-	int err;
-	int i;
-
-	ce = intel_context_create(engine);
-	if (IS_ERR(ce))
-		return PTR_ERR(ce);
-
-	intel_engine_pm_get(engine);
-
-	err = intel_engine_set_heartbeat(engine, 1);
-	if (err)
-		goto err_pm;
-
-	for (i = 0; i < ARRAY_SIZE(times); i++) {
-		do {
-			/* Manufacture a tick */
-			intel_engine_park_heartbeat(engine);
-			GEM_BUG_ON(engine->heartbeat.systole);
-			engine->serial++; /*  pretend we are not idle! */
-			intel_engine_unpark_heartbeat(engine);
-
-			flush_delayed_work(&engine->heartbeat.work);
-			if (!delayed_work_pending(&engine->heartbeat.work)) {
-				pr_err("%s: heartbeat %d did not start\n",
-				       engine->name, i);
-				err = -EINVAL;
-				goto err_pm;
-			}
-
-			rcu_read_lock();
-			rq = READ_ONCE(engine->heartbeat.systole);
-			if (rq)
-				rq = i915_request_get_rcu(rq);
-			rcu_read_unlock();
-		} while (!rq);
-
-		t0 = ktime_get();
-		while (rq == READ_ONCE(engine->heartbeat.systole))
-			yield(); /* work is on the local cpu! */
-		t1 = ktime_get();
-
-		i915_request_put(rq);
-		times[i] = ktime_us_delta(t1, t0);
-	}
-
-	sort(times, ARRAY_SIZE(times), sizeof(times[0]), cmp_u32, NULL);
-
-	pr_info("%s: Heartbeat delay: %uus [%u, %u]\n",
-		engine->name,
-		times[ARRAY_SIZE(times) / 2],
-		times[0],
-		times[ARRAY_SIZE(times) - 1]);
-
-	/*
-	 * Ideally, the upper bound on min work delay would be something like
-	 * 2 * 2 (worst), +1 for scheduling, +1 for slack. In practice, we
-	 * are, even with system_wq_highpri, at the mercy of the CPU scheduler
-	 * and may be stuck behind some slow work for many millisecond. Such
-	 * as our very own display workers.
-	 */
-	if (times[ARRAY_SIZE(times) / 2] > error_threshold) {
-		pr_err("%s: Heartbeat delay was %uus, expected less than %dus\n",
-		       engine->name,
-		       times[ARRAY_SIZE(times) / 2],
-		       error_threshold);
-		err = -EINVAL;
-	}
-
-	reset_heartbeat(engine);
-err_pm:
-	intel_engine_pm_put(engine);
-	intel_context_put(ce);
-	return err;
-}
-
-static int live_heartbeat_fast(void *arg)
-{
-	struct intel_gt *gt = arg;
-	struct intel_engine_cs *engine;
-	enum intel_engine_id id;
-	int err = 0;
-
-	/* Check that the heartbeat ticks at the desired rate. */
-	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
-		return 0;
-
-	for_each_engine(engine, gt, id) {
-		err = __live_heartbeat_fast(engine);
-		if (err)
-			break;
-	}
-
-	return err;
-}
-
 static int __live_heartbeat_off(struct intel_engine_cs *engine)
 {
 	int err;
@@ -372,7 +263,6 @@ int intel_heartbeat_live_selftests(struct drm_i915_private *i915)
 	static const struct i915_subtest tests[] = {
 		SUBTEST(live_idle_flush),
 		SUBTEST(live_idle_pulse),
-		SUBTEST(live_heartbeat_fast),
 		SUBTEST(live_heartbeat_off),
 	};
 	int saved_hangcheck;
-- 
2.34.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

