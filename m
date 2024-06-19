Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353390EE35
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 15:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3B710ECAA;
	Wed, 19 Jun 2024 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSG+CvCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BA610ECAA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718803610; x=1750339610;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=mhRkH0QkVmPRQhuriZHNPxfVrM2YqxHz0HgTt+d6N6M=;
 b=YSG+CvCnSgIfOXUpLuk5wh6GR9v72uJZng1sbSNBNaCH3gSdELql9Fvm
 oM71XUy8hWZhT/Z5nH+dqtwgAm+59WRVcQ94G+1wSpUoo4yXL4cXU+zom
 8URdaDg9NGjT5BMOMlpPdiLXm1wUwjWts0Kxft76CA3biG1h9WcR5kX9Z
 7EzOHFh08I7Aj+3/Yv8izOMUV7ADh1RJRgBbntTL6KLxbiQ6OPhC5XGYr
 k8oSuXmFOD+R2c/GHj/UMd+14E4U5eeatdMjQHDkU5oEAUujh0udjOLbh
 DfBoaxVuNY5qf+UF3irL6Y0ahS5WEGpyWKufzPZNrTov06MY/4hh6hBIA Q==;
X-CSE-ConnectionGUID: tUaGMB2HQnumSL7WtOk1Zw==
X-CSE-MsgGUID: NQVMBT4jQbu4zWu9oyNvmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15579862"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="15579862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 06:26:49 -0700
X-CSE-ConnectionGUID: Yp8W51S5Tsil/tIG52E2Rw==
X-CSE-MsgGUID: K4qxWeKZRfqtBo8m0+5z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46862840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 06:26:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 06:26:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 06:26:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 06:26:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 06:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp7lGgjQE7rFnMURYjPAbengEi2dyZuDJTttjWvoxZ4baKae8FyTmEalraGQTik7yQsfS8naYagzul4C0hOJhoH07QahwaqkYiBep5tlIucRdnXDGM/ujeqGnKM3bBty8XOMaD2j0yv0AHZjH9eALsSO795rv8R/SGlN5Fd3LsSFWQIkJ0obfYovyMQagcN/ymt4ee6bbBi7LH3/n1q5zotKyPfsNC4UURMYquncXPmbiJs9tQwdt9F6mcQjAiESLmRT7zIwJhIzZcUzSi2ZdEuWbqgHUbt5h7LFERs5JwqwCYWG4QSYZ57Ua2I73mglNl4YmzcmYRxe4GRL3ROBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKJ32WcFtnGRXhoOGOnGiOLvrIxMoG4jdQsgHa+VRxY=;
 b=PL0wLscmBFZN9hte9KTbWgG+e0vUxQIVQjW40opCB001RXxV2wAkJgMfKZiqiPEi4qsEX2bqB1kKbeQKv8nTvH8XZoCVrykbU7HPM8nQisWGj3qRt3Xi9sI7F2WOGlWj0cAVxeJDnvYv2mPi0H6JyF1bku/ET0u/o9rKNWhmmKMwEonPiw/nyVXtdTcCRq7q0Dl1OhuH9/981zN1NCCAmko20yNsF6y9i37dIIY3xbNgM0qpVt24FSCGM4F7C0Gm1hVBf17rO8YXA9hkdhKd+RIpPiE15KotPd7zYyvnjmm+JIT3YjL8/FlWyD8UhUf3r817Uo6A0hyJzo4yuncbZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 13:26:46 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Wed, 19 Jun 2024
 13:26:46 +0000
Date: Wed, 19 Jun 2024 21:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>, Sebastian Reichel
 <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek
 <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
 <ukleinek@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, <phone-devel@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 18/23] regulator: add s2dos05 regulator support
Message-ID: <ZnLchTQAUz6j8/ez@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SA1PR11MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eaf13b0-f08d-4f96-c55c-08dc9063777a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|7416011|376011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N4J64s51/nVCan7+c85qe33194NtHYGTziy349kPGX9CM5bWP7hNFbmLudMM?=
 =?us-ascii?Q?0chGckdIuJ7lvS0CqOH8z4iFN8UmLQvLEvDufWedjXN+4OMXVRWwBN4RyAAi?=
 =?us-ascii?Q?IkliLazY3ECzK72Fv693tBqF20YLQ6nKF9xpL37ZohvjsgzuAHpgtIuR7yZ4?=
 =?us-ascii?Q?k36IAHRU1v8d6oDHYmdXTfXEoxr2ok9ENAWr50/Rb8v8qdg6+lhBJzexd5bW?=
 =?us-ascii?Q?6MKulLgN0cxRBY36wzBbZPp/oj0QysgToei2lEqKWd/IpEkSkVdKXfgbY21j?=
 =?us-ascii?Q?771zR/Ee7o2swsdg62dgYAm9Ib747cbPpKzCq1qh9HZjkHi3x0+KV8/SoDnf?=
 =?us-ascii?Q?CN5A0FaoKCR2t0tY9VMd60urWQLOSiqM93T+t4iWwvwgPRiGcQ8HwRCx3oCg?=
 =?us-ascii?Q?TMXU74xTF4B2uAByKguQREzeKb3eeAbP2Bt+nGgma/yxYQVqym/LKqT0k1u9?=
 =?us-ascii?Q?WwBgIhXUvm9Mlf1WmFtVxO4gXigrDl3yKwVLAKqwNe0FBu2+mRjfYSf2viui?=
 =?us-ascii?Q?AgGRdyzxvUjSt4wPlagyXHRXIGrDP6aOJoj8v2JvUmuAe13Rd5o0ek6JyOTu?=
 =?us-ascii?Q?a3v1p9bd7a/x+FS97VFvgU723JW4mDPjJuh07SV8dKljgPFM0kHi+5pPEWgi?=
 =?us-ascii?Q?rKB7KPDimhqfKNzvgj+5+V1zGdY0oV43J5IaDgRpKRKPnxXye2hDj3KuYjPu?=
 =?us-ascii?Q?lS0HWwAblMtkrDcJNR1EmFIhx6fmObArAb6wSc6o5Ul/XfL+TAldOw48qG5y?=
 =?us-ascii?Q?INDkyvRcM/ZJYuDCsT5yQ69xczWgIF5Wt6Vsl0ZO2dUwpBMkzb8mrQx43cj0?=
 =?us-ascii?Q?auMKQ8nALSEbkXc1AlARCRSiFPJMu3bF4CaGnkX7a5GnMrxKNIfBkOTku7oy?=
 =?us-ascii?Q?hUt4HTZsiwwH2BauegrNPMu6iT/12PhVe9G5H3qqfxQhOIjMRgJQ2fySBtVo?=
 =?us-ascii?Q?pseyop/1GySRBthmJKxVzmcJ1Mk4oz+1lKx+9E6KfBZVEdeYC249PuN9Vaaq?=
 =?us-ascii?Q?GVFB/IgPHZ42awRwMun0B9ifGT6Q67g/TbiYXcoe3PfSXpmSMS0jTMmBsay3?=
 =?us-ascii?Q?ye1DTaAXGm/MSmlF90Tw1jcDgaeVM5lR/+V8ZB8E/n1DGHVroU+L/Eoeqjvo?=
 =?us-ascii?Q?m8cfkJvUqJpkweEnfph8JN89rQpFwg6yDBzCfdfGQMFdcGRpxYQJUwDk0wVz?=
 =?us-ascii?Q?tEH2sbAxYIhzQURupCqsv6VP9zw1k4QfNXpXgeXpQymvsCSqsrC7WhDtWpYg?=
 =?us-ascii?Q?LW5XGMmARNVOqlhAKXEpGY1tD0CkspjvJaxJm/zAWbXo/T4cJgmsX112/IeJ?=
 =?us-ascii?Q?+NU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(7416011)(376011)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9i/PVD7AC+lKNcyEVCNMm1YahQzsRpkPL8z4elamjoEEoWt6ulmrAYNjcBGl?=
 =?us-ascii?Q?RRNXFHPGXRBaB/CuIDK4AEoGanai0hVGo4K9xK99W1jnM+LSZKhQf1I8BxNU?=
 =?us-ascii?Q?MPq79VuVuH09r9SkDNb08HJMv8UzWx+WHl/i/RO2Nppaojb10VC939dWJGuL?=
 =?us-ascii?Q?NqiI1ElvVnQXN7S8xb/MNNN+L7HAh6HF5Z+TFmQXnFSRPuCIKqPdcLyuE24N?=
 =?us-ascii?Q?+tzV+YV98hHXJljQpbP/YjtedU6/VYcVOHBESScUReGLMe70D0NVWACFSziC?=
 =?us-ascii?Q?8JHF1G1F3Y1T66D718pyznP9IfaUQUcK7tXcAXhNoZDztRy9ENwexf8QZdvz?=
 =?us-ascii?Q?bNLkXjs9sXfkWPKpAB/GQr9lP/VR6LkuPFBik4ttdbza1wPL/cR8DDUJahPn?=
 =?us-ascii?Q?Pw/h/W8wqglYyLVJ7Kedz+155Xi8NgIsR5aeJL2bPUI4MLI7QL+t5H7E7V2E?=
 =?us-ascii?Q?wSb+D8nC8a4tdA06Nm37C62H6KXFG1W81NMr8fYM5XCXv4zOQzhZKkHy362p?=
 =?us-ascii?Q?rZKbfKTrdppfXBPrrXYDmPZqycgP9EPn7nbz8IroACBnQiKodIp7eq/Q5XHD?=
 =?us-ascii?Q?LFFZXvXkerDROQdzFDVtzJri4W8c4mNtm69H6kzXWFD6ViZ4unJoMfn1q9bL?=
 =?us-ascii?Q?ruDe1o3fujQoT2H1lbCo7yPj/xmlPvaXfLVj8h7iwu78i22E4zlpbKd7c5YL?=
 =?us-ascii?Q?YTisQ1MCQ/DgI/U+ltQpGCtGpjSez9cApwLkcWBNZ49YMq/2x+TWPt/QCm6k?=
 =?us-ascii?Q?YkG9msXOps5mc22XVr03j0AjOP3ODz7yXwJy8vrzSn+a4DSx2OxXeEZfoAs9?=
 =?us-ascii?Q?Fuzk1xh6TtQU4zuSXFDDMxsgfjc8z4A00Okvut0uYkk571GsLjBPsCoYiZQs?=
 =?us-ascii?Q?NUs1hAUbB3LCS3v45Z87yZzxTJgsz1x4z53Usx4jVUfRoUvAM56qRTsg7CD9?=
 =?us-ascii?Q?l6jLKYWaH8n5fyUaQEurDrAmCEMavSxY2q5aaxrqO1fKKlXPiO2zlMzHgV1l?=
 =?us-ascii?Q?qxUJe9JnaF+sY82GEsPoD/Y+/gzK66W3rmZrroX5NQNcSSzFwGtyaMBsU8d8?=
 =?us-ascii?Q?7OVQysg1fmrQhf0AdW8/F3/zkEuiDO+yPgpyog6qc7K1uTuZQaP/A6QN7L/9?=
 =?us-ascii?Q?PENo/+8+BYgWw48a1m9qH+Cz8FW+MbLWIR/PwFACBxvE8PD4tkaSdFj4dmLD?=
 =?us-ascii?Q?FFISORGqR2sbPVu6z1wTyZej14nxbNyxhVnLF0eMkLGomFGK8603KGeFCvo9?=
 =?us-ascii?Q?AU8EwddGaPOt0d8KXbz2mpVUzZJhB/+MjVLxF3f+QTwcb9TIfTnN3KHzdxjO?=
 =?us-ascii?Q?O9GB9JEmeoMFBsSayPKJgbrDcPbTCLVY6c1EmZC7MsV5OW6tYEPKwszQoTzE?=
 =?us-ascii?Q?04zWrnVnh8/YX7oPfvbXtfzvL80ue7Lx6VAJDWb6/SXimMBwosCBpr+XK/QP?=
 =?us-ascii?Q?Gq3MZ8gjK9NewSnphvZ+CZhcUyHMlV4AlbBbKDKNYFb1ech2UOLGRB8Sooie?=
 =?us-ascii?Q?/7AoFoerEmfncJzMeQpSAOAkrMOTA7xRDqKysrkado+2TdLheNj4Cbuk1UcQ?=
 =?us-ascii?Q?PZ+IMN/81t/lq+sH+4rrJTqzwVL/iwR3ORX2sEmq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaf13b0-f08d-4f96-c55c-08dc9063777a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 13:26:46.7277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoUk14WZcLvG6bAitwheFxfkuxqqWCKJESnY/SPuu7QN1JGj8dkyCel6CfoF+mbmrDo+uofPyLdd4OxfMjdItg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
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

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6906a84c482f098d31486df8dc98cead21cce2d0]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/power-supply-add-undervoltage-health-status-property/20240618-222456
base:   6906a84c482f098d31486df8dc98cead21cce2d0
patch link:    https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac%40gmail.com
patch subject: [PATCH v3 18/23] regulator: add s2dos05 regulator support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406191516.nzayiXgL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/regulator/s2dos05-regulator.c: linux/module.h is included more than once.

vim +10 drivers/regulator/s2dos05-regulator.c

  > 10	#include <linux/module.h>
    11	#include <linux/bug.h>
    12	#include <linux/delay.h>
    13	#include <linux/err.h>
    14	#include <linux/slab.h>
  > 15	#include <linux/module.h>
    16	#include <linux/regmap.h>
    17	#include <linux/interrupt.h>
    18	#include <linux/platform_device.h>
    19	#include <linux/regulator/driver.h>
    20	#include <linux/regulator/machine.h>
    21	#include <linux/regulator/of_regulator.h>
    22	#include <linux/mfd/samsung/s2dos-core.h>
    23	#include <linux/mfd/samsung/s2dos05.h>
    24	#include <linux/i2c.h>
    25	#include <linux/debugfs.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

