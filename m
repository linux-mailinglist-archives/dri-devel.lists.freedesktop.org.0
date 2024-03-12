Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A07879FCF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 00:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88B10E71B;
	Tue, 12 Mar 2024 23:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJL5ntKM";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A096B10E71B;
 Tue, 12 Mar 2024 23:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710287440; x=1741823440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o8DLKLAoO/+Dl6O4p+xJqeWWwVavwAF3sKxw4Dh/asc=;
 b=eJL5ntKMiuEBz/Ub65raKSxVtqxV4s/i6FLnRWouhA7Wmkz0zaqZPPlP
 LbE1X0C8XQAeY5hkbq2ZO2IUsDqXqmaNX0fsb01CNjyK5GecYecvRav24
 qbstr0q3ahMeFDksVldpeCXzcMSgn7k+Nhabnkp4IBjmnktLKAHWL07Wq
 cQL/vZLLMKrodbjTXQ3rnBD2Mv2Xd7FfodNwvtIRbXu4bVWSsu3udt/Hp
 GZibhVT1gOOMWzs2nMgnul/jFe9EIrFCWJyXMzpselHJK2c2M3QTz/X4e
 QmPzSbKIBrdUMb2uXYu2j9bgXxhEyDcZWI+vKZ3biaLXj6e/t0hCChLno A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22482940"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22482940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 16:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16307842"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 16:50:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:50:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 16:50:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 16:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFmPRzl3In8BLhibTsjEgVLFSWcy7/YEFRqgcx3uLcL6oKWyXOaSDkPut/xrWoTFyg6zTJRf3POq23Jg+rsPWxnYNRUgeParfBwgyQp9Fvs8YInrGQxvV2uy17o/37qmBajwr97ra9tTvN7lgkNG/82PM8l+O31240fVmXz/ipY9VFY1Ml7h6GJCb9KFTuWgLfV3kV5Nm8Z5WonRrZ6X7zTGwzGKfSPnYewPpEJl9HZKSWxGKx8bvfiJyXhjccxhyfGy1+c30Kh11sWocmmZkLSWzGCd8WS1qgFY3keNpcHat4vNDr/DTDPqlPl5pMZB6x7FPkAi+Sz84IOoI6wIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3WAyj/uVU+YamJT49GmVFr5/vsCEvbRsRvCTV3uZFA=;
 b=Qjv6rgZ44KzX06ev+lEdVE7m9wieSFH2ojdY/EoFFy5Wx5Nr5wBK8chRxrAK0n+XV64raMNn9q6XXIqOTNbDaTHsj8TqmKBfD1T90zdvrLqqVkXpPV+DGXFpN1z8lghdVL2tePtLlahN1iv7RvGoRqpJkfet+NjNM7t+Ht1enoTmbFfzPbY57aOVv0yfsBKl8+fXrcdV1B8FX5mlKmYFYnC+NAXQWyZ+2gK2YWprSCd1aJQ/IFvrrkr/TL74A/hduu+KCnI2pUG24PMScz/t2H/yQlr8cQAZW+WzKd46Plwric2fAEjQ0eWAyVyR6nUAdzVG9h2OeTBWeMSSlCr+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 23:50:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Tue, 12 Mar 2024
 23:50:36 +0000
Date: Tue, 12 Mar 2024 18:50:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <Intel-GFX@lists.freedesktop.org>, 
 <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: Update w/a 14019159160
Message-ID: <r7luaeos5pjdf2vvvm3pa3czs6rjvsn26sqc5fvju4injdmzga@rxkbkqfqgi6m>
References: <20240308020129.728799-1-John.C.Harrison@Intel.com>
 <20240312162449.GH718896@mdroper-desk1.amr.corp.intel.com>
 <5d68e959-7c4f-44ec-94b4-51489f3dfdc7@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5d68e959-7c4f-44ec-94b4-51489f3dfdc7@intel.com>
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3fd83c-4eba-4fef-7ef6-08dc42ef36a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0JUzV7AuG+bkEsxqhKI5QQycP1r5UmhRl+Y6s9UAq2hUtmZn/VPllA5vg68MCCku7grhaHym0Ee/dIqhzLHNyZchWeoSMklVLVIAlQcDA/zQEGkwJ+hFinImuvvrMBQt/O6ESYw3EhJwYYKuErYMe6kXDwk2AQDStKiVnOtuJZTrH21I2AEEMng5VcdGtd9CJJ9eOo06MgiWAXbaN56LuSbGmR+tYO8JlrnAznUo+MYKN1vhsqx85euol50NSJAlRyCKgNevag2uuQmoRwp7PKkI8u8O+8z8+vBlfaxo8VhNUrKud3VZJbJz3vc7Db+4jdXAXiZeMehgTnX5ac4I89ziCP0bA3Tq1hB8+C467ULq6iqtNK7Vkmhu6FkbqhgkcBB5bC40l+2Qj5Tcvzaly1Cl79C70cOMLt1zS7bRQxV3myJh0noSKSbXX9TMnVgtGhNOmh1zgAGAYrucSPT3Afev2BZPpp9XkGrl/8Zq1a7xyM4kAdPZUnxHAII2L7IN+5h7tkYwR5L9N3PjzWZltAaR80UUqabWNCoAduIGiyEfjZapvfmPDMpfPhfUbVXg2fGCsKDiRfFRTTu27bFbB940PLkKZ3ywS2y3Wv4q6TCwF7knXDCeh6REXal2do0xAE8AOKMOgm6JHMGSOSjX+zyLvDPkIC8mWQbvEfcoQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XfifLEg7x6dNbqQL94OdaCcHQwd/PZnff5BE89ANvWXZXj/Q5M/DXmRyuWpj?=
 =?us-ascii?Q?fNIjgj9pXPiNklFWh4BTyjgpS+4ZsA3IudVDMQrnangd2PHCOT/2iy5obg3U?=
 =?us-ascii?Q?dhvREOci72QE7rEn7uG2oYAVx43KJkRZBZtwZkEyPdqfeMHv66hclXWBUJ+p?=
 =?us-ascii?Q?LSUv1ZNNgsEWY55h8VL4OMfXWeMnohs97gQz+7B46+e2H6/ZkOyRcife2yKG?=
 =?us-ascii?Q?wQLmdvYa1m92LR3DMlDxDISPuC8qo6DyreMgjDXTMBN3LEYQVM4RYeTRUBcV?=
 =?us-ascii?Q?st/+wlp/pHaPlxn98fRJ+AkmSBX8BDozH1arkPbNfzMtvcgl4hXMVXM+JX+w?=
 =?us-ascii?Q?Fd73yA+VEYdI+4ZUns/O2XGNWCwBmlA24509CWsN10yrV1d4QvfLP1rSf7pt?=
 =?us-ascii?Q?qqUxKQCuXXNejoHR/Bxlhpg+jK5xd52Z5lyzIgaKRkhlnJTLZrJtvdlsNxre?=
 =?us-ascii?Q?Lip3F8V4S1W9/dFzDTvgY09m7h8EMqI1Ie1nv5EGp8Kb3EQQKUq8SbqkMPM4?=
 =?us-ascii?Q?e4gE5h65L5ZugMtTfFmgn/mKJ0o2xw9zau5MX5wAw98Rn0EYl38z0bDB4wkt?=
 =?us-ascii?Q?kDF2jg1F03O1u95Yx0GSMV3K8PUd6iShpeYEuYWFq3hP21OMFncIK9yJZpav?=
 =?us-ascii?Q?psJC9hzE7iQL+2DvIs6lyell66ZjRwfn0GwW/UhC4BmBkxMoIFebWEpXTLko?=
 =?us-ascii?Q?yYrt7arWoEw5PeyFVc3k74Pt3cyaEdYtGWfSWZCY5rNrSIt3uDhcmxJJLmPn?=
 =?us-ascii?Q?JGBelMpr970ur1w9InfX0eTS9VmheXc7xkQFqUQTj7scd6gFcaBgH82nIF8h?=
 =?us-ascii?Q?2vbOy8DgP0fAFQQY1F194W9cfcSAvEcWNiojuNM7jNOvH8yIkfFZO2c24nSh?=
 =?us-ascii?Q?iINoVskY3oRBTcsrqnnNkSbylfg2X/sT4wmX358z/sfbZQkaB2e0MylfxqLF?=
 =?us-ascii?Q?eMjgKj1ERemz8yAKaBH7zCreljmLNxThAs56cph1bqXxmR1hfyRBUbJz26Tu?=
 =?us-ascii?Q?bmw86/uXKO0YrXnohx1cpR5VQdeLGemaqSCCqLiis0iESwdDQasHU+YEZyCR?=
 =?us-ascii?Q?XTIIFxHIGe2rpAjmoFDawIlFHr/ctDTxAjL6h+hHVh4LRfRp9pOlX+BWU0UG?=
 =?us-ascii?Q?MSG6fIzacsqiWq6iXFyiWiSr8MW9VCz8yVFNgjkPZ2iQ8BoEsPLosF1HzDbw?=
 =?us-ascii?Q?EYlOVbPhQUEDbfgUh4FA2f113mKqfcNKMnGdtN9hm5iei680iwopakTwHagr?=
 =?us-ascii?Q?hz3gShz4h6iUfNLSecftQV6ncIf6FPxfm4mvV3/ye1mVdTiHMAZ+SMseYFIm?=
 =?us-ascii?Q?n2iVo53uOMkbMkbJ0rpwC8Yi/CTyd2Q+jxeYfwslWyixOxX8MqITNFQO896k?=
 =?us-ascii?Q?ideswuPguQ5QTf5ToOt5j5HSKKLkb0TCwD2K+125NGKzWgRui1h6sT4NTQgi?=
 =?us-ascii?Q?FEOMReITgxRO1ZESdt3EizahIqDnF58OC0H5qUyLY9hw9XcZq53aAPMT6dZT?=
 =?us-ascii?Q?uEiYwFSZLvPTg/xkY+tM9tbZCF/1vd8gj6bc7QzZkJBeI+zUDiL2hcF7RQzi?=
 =?us-ascii?Q?nUYJDBxOh/OtBmehmx28SbHv2ZTvL/RJz3JiVIUvi4S6bgDLmG0sHLnqeZnp?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3fd83c-4eba-4fef-7ef6-08dc42ef36a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 23:50:36.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trowvOP14fxH193z6PnVGRuBY5SteQGPTzX+qHC8cnaptOdl4R7p1FZIQftoAwkVwfqfe3iuRiuBDgbPJo6fBFvt6tvwDMHGsfM9fY9FCEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
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

On Tue, Mar 12, 2024 at 04:43:06PM -0700, John Harrison wrote:
>On 3/12/2024 09:24, Matt Roper wrote:
>>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>index 0c67d674c94de..4c3dae98656af 100644
>>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>@@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>>>  	/* Wa_16019325821 */
>>>  	/* Wa_14019159160 */
>>>-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>>>+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
>> From what I can see, this workaround is also needed on Xe_LPG+ (12.74)
>Isn't that an Xe platform? Or is 12.74 just ARL?

official xe platforms start with Xe2, with graphics version being 20

Lucas De Marchi
