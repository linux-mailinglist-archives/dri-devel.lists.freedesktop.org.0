Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD3AD0597D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 19:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E132610E7B2;
	Thu,  8 Jan 2026 18:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ds57u9lL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0CD10E376;
 Thu,  8 Jan 2026 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767897390; x=1799433390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZPpPVymaFF3iZqxjzaAGbKai8mQVrqKTbaTslVqQjxk=;
 b=ds57u9lL8MJ/r+qLhdEa78B37tnBxLlGTEEkA2yDd6vsfSW+LCaLD5yg
 BAFIzFY4nx/ZFbhxgZZCsrSMATbQz9IGoCemCVEHD3KKY8dyTeR5Ak/jp
 FNM/PQ60Dg1PAuVYr5ZL6Mq+it7Gk55LhbpG36L8LLdaL0HfxAM3NXIT2
 ++ZaQUSoRCTdzQA3fNoRB8nPnxSFvzVLPhPwlB5+B5TSZNVcy3yn/gcC3
 bp/AKSrQ3ENe/K8pTmEFv+Bpea3OCWfY+rrPLVEGUNz33TfhytaI1drSk
 hhvtqIyXLOJ8GQgxCguuJS7J+0gqwHQMKbZsH7YRfwtCOGtzEYR8c773Z g==;
X-CSE-ConnectionGUID: CXNmp0tkQqCvh4VKgXzcdA==
X-CSE-MsgGUID: 34B9v13OQE2hCIpJTwRdkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69185477"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69185477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:36:29 -0800
X-CSE-ConnectionGUID: Ux27WCBxRGaHnwcm69ufCg==
X-CSE-MsgGUID: qJzYw5k6Q+mokpTO8GKzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="207410024"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:36:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 10:36:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 10:36:29 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 10:36:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6pPFgzM+cIr9bp8GZVt95yIdkqlEq5BFM8gcgRP2q0N6m8dFDECtah2gpKL2s2avTjUTKqYvmAzsW+fpBi08u1h3CZXNUMkn9Blh3mlO8gUwSnoItL8CeHn7q5TJSrLrAPe1Wqw/0bWcUgR/lkDbJIy/pTpT4krTCs0LDdX/Yhu6n6mRIuUdWsMp4ZUFn+5q3Pg2Ab+rCTDWxOzDQVYv5U9LPAApaBvItaGYSCAqDWyd0chvtzEPAMnSAeOwRt635Uez6XeJc+r39EX2XKKBYCvVFOijks98qHMjv+fsnt6M5+e/N2huqgrhs1j9Fl4EqyAo8u62iIgX/sKBB9rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1cC2RbgxOcasVX8QF6RfSMCubdKg/Ol0ArxQNB2jlA=;
 b=ZcMsDENd3UcaZNsvpX8ryjiMYo0x4CNmsgIBIL87f3h+uIBr5iGXY9OX2kvcEE9YlZGl3tt6aRcuX1uda7Sffi/kqGjhacps6s2f2g3JerEZJYp8zbGbya2Wvi5rqU29bc2GLnkVTlh8BwprwTvFe4dwWT/HGft4uQomaw7x/Jyp+xyFAbo4Vslf7ojP1zxrYz2XVb7nYoOac/Bi3CGuauLAitnWGXrsFty2eCch4NFsgEosaJpTUD043qEtsh2O6fa0qGaGuFJsm2UCwLMJgBGcKBj7lNcUTbwmNwkaly+F/NsufrRApUiZKWULQjvpW1RNT/6pFcomYhykyZ+ggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB9495.namprd11.prod.outlook.com (2603:10b6:208:59f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 18:36:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 18:36:28 +0000
Date: Thu, 8 Jan 2026 10:36:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: fix WQ_MEM_RECLAIM passed as max_active to
 alloc_workqueue()
Message-ID: <aV/5KRqR6zma/ZnR@lstrano-desk.jf.intel.com>
References: <20260108180148.423062-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108180148.423062-1-marco.crivellari@suse.com>
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3c613b-3ce9-49be-d0e7-08de4ee4d600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3o2AKUAJcZz4PofdcH2DNpb61uH/ylcMP/MOQ912+wSAsMCcqh9h74bJWH2c?=
 =?us-ascii?Q?YCuPIuxEM0L8LT/u7oNG66yU1axyXTMVR21Tx0kNagPgAY31w4xn+4+Orybc?=
 =?us-ascii?Q?YQIEJPnYuaAfzY/UXvekrVl3zCZeV4O2fHMw1KnpkRcn0wBeuK/sXT7xdgIw?=
 =?us-ascii?Q?WlRPc49wJF3bkL+4AuHEFY6FMg3jSzlDE84qxUtSu9wcE6qdsiIBv2w3Vuab?=
 =?us-ascii?Q?3fYeoD7WqRcBg69SwnfkUEA7IZpz2W90k6Mk/IwJMCd818A3AOwRoaWBYB8F?=
 =?us-ascii?Q?tA6bIX6tD2oTVpFzrYocTiXJQmThf3SKAYXQlKdkB0KkTjEZWaD20kN2jdEt?=
 =?us-ascii?Q?nCPXNF0ThMXLjZKbOKODdG5/oMJNqZL76odYupQn9ELe/tNTdH3X3/6nRuG5?=
 =?us-ascii?Q?pvG9Whd5Cp/EZc94XdbVInZbxpFvHtFLjJ7QG0ZrURnz/PT+Uk1Cu8vpnrK5?=
 =?us-ascii?Q?sbUjWOzrs2Vu8TI2O12Y6bo8L2zHAO4sNMi0bzu6Cg473g4WtoGuQM62MyKU?=
 =?us-ascii?Q?SeQGE52pA9jKF2brCYWqNjkGujRGlL7HlkY0D8UB53EOe0frhfR2WiJC8EaJ?=
 =?us-ascii?Q?l0XH1KddDLiRwAD0UPxna+T3pTavGy1yAAkH+fh8gCmQhuclLr1+skqAFYrc?=
 =?us-ascii?Q?BdXIDJ+YA+PaJ7/XugllFr/G85t3Ph/RqcWbeutexGCKPmzZNW+iLhrviK3S?=
 =?us-ascii?Q?HRv1bjN9mwidWbpaIZjhKiq64oSYRp3qSNsKntWBbnA5U3lCf3KaDUbpad+X?=
 =?us-ascii?Q?f29jEYC5HkITHRlNov0iu5cm+P1SOrQvnYHgPHebkVb+4uWCy8DH92HtAO0b?=
 =?us-ascii?Q?Gl+5BKWegraX48MwU/bm9KBAISGkZ6U3v6w3EQ+17aUoG492LqYj756zOYfp?=
 =?us-ascii?Q?/xJ/VVxdGcv7O7QEjXduXvsJDyfLPphJmlaK9nuDsa4ri5FOBTF3y+YO5lp2?=
 =?us-ascii?Q?8z6fcZ0PfOlcCE+9j0Bh6UnkQC5F5wJv6dhIAPHqunWIRKBkmgOI4r49CvXB?=
 =?us-ascii?Q?Y8JhvYxb7HvUouctVX9kZCAZIHY4l5Xc9dqqOio/XlVWok316Lmb1+9F0Vz+?=
 =?us-ascii?Q?61+LImHy7FNmvOqavVF2QPc4lDDj3oO40HGbflgoRglUBMN2DQucuTHpIpF8?=
 =?us-ascii?Q?odhKQEqsYwcUtmxN4vSTTBMTQrgWpp99o9d2WbFhtRzdWxtpjaey3nWVwpvs?=
 =?us-ascii?Q?urcHhxMIcRHBOrxKaKdu3TMZnKKH6El9WkUCsAIETY2pYhxdWcGgHB4Nx9D+?=
 =?us-ascii?Q?DF3IQBGOYrutSPRN6ddH6LBkzIyKgqHELUjWUg5udGCLUzs+qn1vyCPOorfA?=
 =?us-ascii?Q?FRzbiPOQb809vp2SA0oGS/wIuxm69zsRcOZZDaBA4Rs3Ai5r7cZa0B5nYXOi?=
 =?us-ascii?Q?t7nWY0LVv0NP0FFECHUCYuxb8ucN8WlVjmrzMbxWrUzfgfiGwlMth7mmqJ8/?=
 =?us-ascii?Q?htONnPcUTRoSf0ztbkXkwVCQGgO0F/SD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oNl6xNjoG4fJOgAEnP2OS6W9nGbgoKWDEhtJMAWWLnrm4kgkW5jqPKJMYP8T?=
 =?us-ascii?Q?MeBKqvYqfnJzuVjCwPJ4hemZRX+rDy9h5nEIvM80OwjyGRIlhrfQaxrtLL7Q?=
 =?us-ascii?Q?wjypLSdSKSHbmDK1Isv3Ft0ZDsGNT47F/upozegMK8JjWsN6+GTKnT024Lhq?=
 =?us-ascii?Q?sAXvcGnkk9ygsrYS5kJCOoYi/D65aWbFfmLbqASP1GSMB10InE87l9J6bMHH?=
 =?us-ascii?Q?tqe5EqoLlrUkxjk4Rg5AXMn22VImg6l0pyPOZAjyUuRysHUgiMd9ipzvOaCF?=
 =?us-ascii?Q?bK6ZB5R4EeJ27it1ep9Hw5e2duE2Sxs4BT/eGq0MvBPch0mXS0BD65fG7Dcj?=
 =?us-ascii?Q?8HYoBMn/yOggDIEeAL62st5RIYTI9+iCNLL8FmeazEp2PzxLEFo7ok039eAY?=
 =?us-ascii?Q?hyJf+qBSLQaEvj/dHLwQJ7WFM6GBJxafW8gU2HYyOWh/Q8XXT7Gl9WwFTssj?=
 =?us-ascii?Q?X/eM7krlOtCDLXwqH0VJK6VuzGOZ6oJcEEzZNyYCgVdKx37thCjbMUSESyaS?=
 =?us-ascii?Q?EVgQCE1M6RdNjJF7Dzy2NgDGJOwqRTnAYA0lLRsbIAXIpNYPa/WZe4WqWXdO?=
 =?us-ascii?Q?TQKVmijVXPAbMTmqQyCS026plCUxS6+kFqu58px+q3adz6tnHVNbQrkb1qQF?=
 =?us-ascii?Q?EQeTbPLw5Bi4RGk2eFL1PW9vEG8tFj/bU3gYj/OnnLynz5fahbaCZJkjOPnj?=
 =?us-ascii?Q?5haGJB4JO/4Zmy6ZccQY+IoTWERFRWeekqbnhQSp2wqHJqFc5k13LYYIHWLn?=
 =?us-ascii?Q?DmcXYkhMjfrntykZF1Xj+1cXyXOzutDmqFEg0QQeNnYoNWpW/n++llqwTkV7?=
 =?us-ascii?Q?nJq7aEkfC3ME87oKW9UyEZBeFOz012+4qOyGJrK55R0os/1KF5sMoo70GnDv?=
 =?us-ascii?Q?H+jvnGDiLKkVQNm7tJ53Y1Qv82qJwzPJJ8w5QzW4DccFAtdZn0pJVQWSRuMa?=
 =?us-ascii?Q?CcHjFLwHgjne5x3Okppo2dy2kGjDwYbR3MwIrVGzsZbaAH1NF1mHXzTX/M1K?=
 =?us-ascii?Q?bLPSs3HuQnVCXgOu7RD18KC9V9KyECdqp1OCYQHtT4q+bwVM3PdvMRV+83e8?=
 =?us-ascii?Q?yhR0OHO+Kyla4RF0svkAh9qiG/61mT60HZH7rfaXXKlj4iXJINwpZ3R4KJHu?=
 =?us-ascii?Q?LXdohjymWzx7xDGhV9C/xfCH5SP2xlzvWlNizAO5e1ZCcq/M1FVAfurFOmrx?=
 =?us-ascii?Q?sge4oT0Vwh/V+nIx9OquUC48Gnfh8oSX+DWnCtCNUK3yMvQ1ZUa0yw8xB7Xt?=
 =?us-ascii?Q?UdO8ZXSXDytqY9lSxzPprRidm3D8Plr9uEfrBpn8nFq3sYjzpv91oPo7oa31?=
 =?us-ascii?Q?IcGz3KbOk03rmE0VE2T1Gp//RUhmuxFPTZ5lEk8XZY1x8Oq1CZpz3Orvjyhz?=
 =?us-ascii?Q?H6Wg3dBU4x4piMaFOkFEukoctY6y4gN0FNYQ+5Yl90v421iVd6za6bewUoxB?=
 =?us-ascii?Q?ywoTc7ncoEq5iGM59Yw2fPkNyVqqM+l6X8142inajkwYidRFuimfVTGZogYI?=
 =?us-ascii?Q?oxrK0kcT6cYfxc7HUn+X0aF6W4nndQhSB9Q3dAh7vyrkCFjFZx++b40IPlzT?=
 =?us-ascii?Q?/kJfgMwuYZiIUXIpwaVP/wdt33DEtwZXms9nA1+Ajm5s2IOcmJBV3zAGL+sB?=
 =?us-ascii?Q?o9ufJVJ11rRYbqxovi2X2MJcriG6u5yesb64Hh8eiobsO91pI9QONTrwvO7t?=
 =?us-ascii?Q?sl2O41tvgyhOPPnuiyTeCv8lNPt9P1YI98tgj+R+SqDEFpfreWUJpuhNRXdV?=
 =?us-ascii?Q?gMKqnXSfXrFiEiem1rD7BgxsOwZACco=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3c613b-3ce9-49be-d0e7-08de4ee4d600
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:36:28.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWLOu8xcD4+Nd89uwxFna2O0OjLVRS4KiYqUCNXgYMhVxIFdudHjiE0EsIi4t1kO0xq8tC9ApU21jIrylg16jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9495
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

On Thu, Jan 08, 2026 at 07:01:48PM +0100, Marco Crivellari wrote:
> Workqueue xe-ggtt-wq has been allocated using WQ_MEM_RECLAIM, but
> the flag has been passed as 3rd parameter (max_active) instead
> of 2nd (flags) creating the workqueue as per-cpu with max_active = 8
> (the WQ_MEM_RECLAIM value).
> 
> So change this by set WQ_MEM_RECLAIM as the 2nd parameter with a
> default max_active.
> 

Yikes - thanks for the fix. Will apply our tree shortly.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 60df57e496e4 ("drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ef481b334af4..793d7324a395 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -322,7 +322,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> -	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> +	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM, 0);
>  	if (!ggtt->wq)
>  		return -ENOMEM;
>  
> -- 
> 2.52.0
> 
