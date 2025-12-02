Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DCC9C347
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0809B10E187;
	Tue,  2 Dec 2025 16:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDAul8gN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AAE10E187;
 Tue,  2 Dec 2025 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764692949; x=1796228949;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wOqDXLjLQuHYRBWCYiK7N6N0zv67U5diIs4oC8srfas=;
 b=CDAul8gNTZXr84L3gOnIk/kOu/1PJdia4qwZfT+s4Iq1ymthnLIEcGKC
 9M+QggfoiZJv6E9uaPGPSSkXt4x3vZKob4HgpcU4M/IhQJANPcxgzBBKt
 snYpDVRLEJ+Eq15yqJ2fPpUqm9AFB558H6xMdbLVxGR/SM0jkyY1Lnpp+
 /AKE5irO9deaBzM7Lj1HYVJpF5UxSR0nlol/Q1ZHxPMp2VgtbnIAD1T5m
 iqKvDM9d6/wJwBBs5194wNppityY4b5YIEHi4HttM5n+E16b/i9Unqtyl
 4Y54Gljzn5ET6YqWBuLeOwLmVoZ4pBUrqbhnV8Yt+b4c8ST5nOUPHNlBm g==;
X-CSE-ConnectionGUID: hEn8gxNvQc6GjtohhKhNLQ==
X-CSE-MsgGUID: EZhr5SenTLetocAHg2+XMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66700085"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66700085"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:29:08 -0800
X-CSE-ConnectionGUID: DWRLjAfxQkC/uKNT7hc3Rg==
X-CSE-MsgGUID: 0Ai+v6DpTmaXgRhlbSJBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194844159"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:29:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:29:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:29:07 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:29:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYJnnayKAB5L6BGOxQZq6ZLWMT5nlMC1k5qfb9plmYlspmj5aH8qwuEyAbjYJoD0r87r4WazhpIiF74FTOAoJ5B5ZHql8bwNVOUA5//licUbPP0htd1Og1vUZbsUsyMGjIV8tXWW0FA4oFisKXgFb5+hHg46/LpzJk/ri76L5ODKvUmR0BLZ4fyjZz2MRoAF4Rta+x1uiB8x6hIaMNv4XgCOXlCIP360QmvBMsZhvElkktx4gvn77wjUpoPKrXElUh7yfts5GMCPWldMsHk+4cud+XuZHjqieqCc59RyejIeAR3OmdGVRQkQ46nkxXnSWF1fI1dNDC3Le7RUJNRRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qF5fMQOUN0t4nVtPLhI5zkxHfI0UG2SeMfBnChUZ97Y=;
 b=dbwEoUicCbjEwxeCS7OEnqN5/5+niNQ1d1vLcAHs8uuP01F1STploU/jxOHXpoLx5RI+Q3CFXFT9sP21MHpB7RYUoNITGYm4JWnnqymJcMbkIdMNU/5fuwmTUZqBBsbTRrEZPlUI9aIqIeijze1hH8tT9Gg/tdl6G4lnMcbMQStn5tUEMD7yETU4FV8iW04uboSO+E0LxICRRGqEkEDG9EWJXUqXxtcfdf3eVNZA/GQ3Gesn7WcpGeG99wsSz6m4oRAVyemCUHz8vjjl36BoCh/JgrGx3ovYE6EtIQXEqAktEaCW6VtDbwRinmN2ZsbbI6NJMIhez1wMGeg0hqkVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:29:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:29:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v28 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v28 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHcYx4Fv8BJSpISqka7L0hdNHlMwbUOhPKAgAABCvA=
Date: Tue, 2 Dec 2025 16:29:00 +0000
Message-ID: <CH0PR11MB54442BF64055A807AADA7C1BE5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
 <20251201235539.236686-10-jonathan.cavitt@intel.com>
 <aS8OeWtmbaP/gsL+@lstrano-desk.jf.intel.com>
In-Reply-To: <aS8OeWtmbaP/gsL+@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4835:EE_
x-ms-office365-filtering-correlation-id: 1fdb3be0-0deb-48dd-180c-08de31bfe629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?acxAxbUxHUKg/pG/5IuDcWiMHwyZ5NBa1eE2QqlAHu/CJUnYrb/d6YpNmP8J?=
 =?us-ascii?Q?x5Aic0fiCC0aZgHoXf6l4ovFX7kNhuU4/Kvubbg7il6u/TgzCO6+w0jwLmwk?=
 =?us-ascii?Q?i/O0RdrZwZdNX2egJRixSCEmzNzBwfmUFvDgjd1ntxnHeCszcE8wPV1oiOcF?=
 =?us-ascii?Q?BF6z2l9Uis1t80wuPZDiFZlefJ7n5mkyE8O1Gn8FYuUbenRjSiqwze8EJqpI?=
 =?us-ascii?Q?DJGhqFBJlUdHS5EvrXktWymO6602gbC4G/INP9/byEXyDHjTls/VYG4EpW+b?=
 =?us-ascii?Q?PD9J46YTFnpQY4vBZZcsLJn4MKv2d2dL/4vI7pCA/gCPXG6QId/XIfJRts9D?=
 =?us-ascii?Q?Ghli7RVsO4oW8umQc/aMKpSRAPlag0jSBFMvdXEze/lcJjzNFLFu6ZPL1Z1Q?=
 =?us-ascii?Q?j9eqwuv4pUGgq4hzWbimdrMd49RLUzgOzh2fF8kIBL90aEZMXuvoZghGaEUX?=
 =?us-ascii?Q?TYts7e7nHFt0Y9SeJTn24nXp28nBbnygckaKZ6y9Gat4CnHYtvcSaxTJBZ+S?=
 =?us-ascii?Q?13dhNfsbGyhmFpVK8dG4os8yUXcfuA/eYdTsWHv8Eo+/rduYEWTjYsgyPqa2?=
 =?us-ascii?Q?s3qqVD/YwDyd7aLMnwwRTF5I36A2XT6sX+Hl3uOwszO1U0diYVLJuijZJuLw?=
 =?us-ascii?Q?n0W4OBZjgkCojCfZSUSpryhvFgHLcbGdwBRBs8TrfjbqxtWoxCaIhf9Xgvz6?=
 =?us-ascii?Q?ugebuqROjJXmdYWd1wgShyV0MNs7trO/BAqMRmf/Tzocl9P9t66u3I7nVaqc?=
 =?us-ascii?Q?1VRcLf4sGSDEUlVOzWlzdm6s3MSApq7Ou0j3iIlN/AfWVPoeo75//2KXumoW?=
 =?us-ascii?Q?/uUQg3HV3R9f2CX5l6fkhYR9goAHjH7sT45NrHxV1efavCsPQQ8sV6MtRr3R?=
 =?us-ascii?Q?WyVdaWQFs3uOE3QLrpitO6SebE/FaDTRRj6wFeyATYjME7j6r0nCU+xPDfiF?=
 =?us-ascii?Q?xw++pyDDN/1IeAd3QcL1rZXGTvgg0K9ef07FaU8U/P8OXelHlRnF51skg81V?=
 =?us-ascii?Q?0Gb1OrzWmYyGsL0NEpVuuRPluxDQsCR8zGmdjt0MZVPbVU4pYYUV7a2zUlDx?=
 =?us-ascii?Q?RHLSt1ifydTCfPm8itQoBcq/69/6J5go7OMb5biRhNEEiSLKFR2nXoOAA9JQ?=
 =?us-ascii?Q?MHGZBVuI2owqxp6qIHQWi8GHuAYFjQB5K1srB619+aIB2uNQPQ+XkA3gmln/?=
 =?us-ascii?Q?I5FouM59n5NVNqEpAftaQYlf4+vWlBCju9dhKq2Ln0ssSi0jzfLlKbDyQACy?=
 =?us-ascii?Q?mFn1eDGHcCkPY79JhhfODxr/zYfTALEJl3OEgMEQiQvXU/GXb09QeBMx0hhj?=
 =?us-ascii?Q?fVP2MwIPawLnTpeVyLLRt7zqYV1x5gIpAcyLZ7KKaE7GLF0hg2xz7keSEXXM?=
 =?us-ascii?Q?Ub71ud0f8NlHwe2OLZIeXNBV2JpqO8eMpTwrPgmrpH/VOxxsjQyCn8oRoIiw?=
 =?us-ascii?Q?XW7RDz+rbtilw9bP1YnU4pD6PUgovUy10NorRmh2LVx4Ra3TZ51eYz+o/cI1?=
 =?us-ascii?Q?JeipVyytUwHI2cVTTqcOGva18YBQApahGnWA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gvCmcDUbdBQegMal/ZDmGEZOBTRaC1HMMUKPsm6kuULrQXbWo4yWkGF5eTwm?=
 =?us-ascii?Q?RL7WXE7jJJd8YUKBpS4TBgf6LrorSu6ExZN3vYnOoT60Me0GKDSgwbg3H4Rh?=
 =?us-ascii?Q?CBjs1vmOqYihJIpg5rw/RxzNU7Jvl6n1gSZ4GrL9OEo52uPLCoqqTdmGPDSH?=
 =?us-ascii?Q?oKU8wUPr9oNs1ykJcldgjSiwlpjTzkgAufxBpR3AK/7HoHZ41mjJw2hmfi0b?=
 =?us-ascii?Q?bIFv71oWvoHw59Y3cAVegNvLWzBELRRiXY/RSyNBYsxj+YYbm0rbO9c9rF1J?=
 =?us-ascii?Q?rsOs91l9IeTVAnIBvI9Qx/pbvVT0BKO3VHxb6+oC9uM5k7hMNaJUq+a0YHwy?=
 =?us-ascii?Q?EVGyB5bWyM4PB8HlcwIlkN0Fh3sRRKJC6XqToa4BYOowLuBcC+tWtA4XmosL?=
 =?us-ascii?Q?fKfaF7GPgRGeF/C5c9wntiXlWsGETybnvgWpxER5edQY5P2pLDoa3hbAQjvv?=
 =?us-ascii?Q?4YHiOHGaWpXoVYpAqxab2BsG3m7RtB5+2zVYMo5O8L1JMz2Fxy+F0JHIvzHi?=
 =?us-ascii?Q?U4IX5k4BH+KjwxIflIv36wjOjTO0tex8FAywjwPwazUw2o/IrMveRpDQ+n9M?=
 =?us-ascii?Q?7l3b2zItsr2GuFXcmh+GOeJYs++tSiUH9/jePBi/g37kFx5PXhm8n7bkYyS3?=
 =?us-ascii?Q?fHLBZMjLUZO7RpYREAcB/i1/+wwxXlco46Q9Fj5pJbQmWjU9EDQ6m0l+2uEs?=
 =?us-ascii?Q?rrffHQaNaAh8mSnsAug61butW9f5bgDhzMD82ZaGjIfandx9owfjy8J8E1Ns?=
 =?us-ascii?Q?B1RUUN1YAmV0jXsYNMdQ2ELj1ujVZpueZDbD0TCY5UTbkFQdmyVpH9uh0feX?=
 =?us-ascii?Q?O1MqwMoMKGTO8Q/juOmtZFVGLivRzaXbBGL71pB7JxobazocvD3pXkDqeNjy?=
 =?us-ascii?Q?dzEL7Sc5D2DiImG6S9nbLyE4EnAvjNnnoLL5dfUPQSsWlGSO82nHbfoBlOF5?=
 =?us-ascii?Q?iTWkHHDUaA+9oAj6Eir9JspeYtjRhjH2GuHYJxal7nURF4GwXbXiPJ3OHSNL?=
 =?us-ascii?Q?FVrQPTNiFBtOj5mvF4fjlts7nm63eXVMpRfFTHdGJK0WdCRqNRm6khu3jz9z?=
 =?us-ascii?Q?rEOEASzT4cv6XB38wImLq2NjJ2MC6MoXuiMv4g/tWnXGY4XzEW+sCuruBCT3?=
 =?us-ascii?Q?ZDzzit5lY+AuQrBVCf4UpamRjqPtHRT8RLJLO3FJ0HWKn4iyU2yD9KbZV6MC?=
 =?us-ascii?Q?Q/vxT87mPxXdfg49sNEYMIu/XMYGlWOgnt+Ykd9XHn1czW3RYLDamppF7Br1?=
 =?us-ascii?Q?Igu7zH26uZkbbm1BebTMzzsGJ19U805uhAgyhSpxQRErRvp+5Z857BuWqU9Y?=
 =?us-ascii?Q?dlw0EpHNw1DQx1m1qY7p1/g0QgUCJM5Y1e359QPe5y6Lme2COExsIdejkLPm?=
 =?us-ascii?Q?Vtz2hX+sQhf8XGtbrCNzPfksfHAIvj43zN85aWEQVRG/vrhDHI0sSJZkR3gJ?=
 =?us-ascii?Q?BMLtAFlIn/sh5ixTnUFbybXsuGnwcq+FnLqZKaMmPk/A7kPArLK2pgl+QwHJ?=
 =?us-ascii?Q?8k0mErsCkOw20dF7hUa/EYUVJoN+WDE8i1bHswVlm2EVzEBpXKMcLv9/N88K?=
 =?us-ascii?Q?b+RohUfOV7x3fgRd64HFPY2YWV0JJbuU15KXL1wI3smCV42nr8O195+dHqQm?=
 =?us-ascii?Q?ED7Wb7rLezmsSJh7Kpi6v+ypy8z7ChsykY4ALvh18D/u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdb3be0-0deb-48dd-180c-08de31bfe629
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 16:29:00.2827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jflTy4ki+svMdus4H/h6LtxGB2aMpGfs2/54wGeArJ+BM32ntgReyfbDFx3wznbHWvesHFwVlc9LfHsWkONbVwTqA5S2HmkXO07qnWjvJ+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, December 2, 2025 8:06 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.a=
uld@intel.com>; Hirschfeld, Dafna <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v28 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> On Mon, Dec 01, 2025 at 11:55:44PM +0000, Jonathan Cavitt wrote:
> > Add support for userspace to request a list of observed faults
> > from a specified VM.
> >=20
> > v2:
> > - Only allow querying of failed pagefaults (Matt Brost)
> >=20
> > v3:
> > - Remove unnecessary size parameter from helper function, as it
> >   is a property of the arguments. (jcavitt)
> > - Remove unnecessary copy_from_user (Jainxun)
> > - Set address_precision to 1 (Jainxun)
> > - Report max size instead of dynamic size for memory allocation
> >   purposes.  Total memory usage is reported separately.
> >=20
> > v4:
> > - Return int from xe_vm_get_property_size (Shuicheng)
> > - Fix memory leak (Shuicheng)
> > - Remove unnecessary size variable (jcavitt)
> >=20
> > v5:
> > - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> > - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> >=20
> > v6:
> > - Repair and move fill_faults break condition (Dan Carpenter)
> > - Free vm after use (jcavitt)
> > - Combine assertions (jcavitt)
> > - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> > - Remove return mask from fill_faults, as return is already -EFAULT or =
0
> >   (jcavitt)
> >=20
> > v7:
> > - Revert back to using xe_vm_get_property_ioctl
> > - Apply better copy_to_user logic (jcavitt)
> >=20
> > v8:
> > - Fix and clean up error value handling in ioctl (jcavitt)
> > - Reapply return mask for fill_faults (jcavitt)
> >=20
> > v9:
> > - Future-proof size logic for zero-size properties (jcavitt)
> > - Add access and fault types (Jianxun)
> > - Remove address type (Jianxun)
> >=20
> > v10:
> > - Remove unnecessary switch case logic (Raag)
> > - Compress size get, size validation, and property fill functions into =
a
> >   single helper function (jcavitt)
> > - Assert valid size (jcavitt)
> >=20
> > v11:
> > - Remove unnecessary else condition
> > - Correct backwards helper function size logic (jcavitt)
> >=20
> > v12:
> > - Use size_t instead of int (Raag)
> >=20
> > v13:
> > - Remove engine class and instance (Ivan)
> >=20
> > v14:
> > - Map access type, fault type, and fault level to user macros (Matt
> >   Brost, Ivan)
> >=20
> > v15:
> > - Remove unnecessary size assertion (jcavitt)
> >=20
> > v16:
> > - Nit fixes (Matt Brost)
> >=20
> > v17:
> > - Rebase and refactor (jcavitt)
> >=20
> > v18:
> > - Do not copy_to_user in critical section (Matt Brost)
> > - Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
> >   Brost)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c |   2 +
> >  drivers/gpu/drm/xe/xe_vm.c     | 119 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h     |   3 +
> >  3 files changed, 124 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_dev=
ice.c
> > index 1197f914ef77..69baf01f008a 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D =
{
> >  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> >  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs=
_ioctl,
> >  			  DRM_RENDER_ALLOW),
> > +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> > +			  DRM_RENDER_ALLOW),
> >  };
> > =20
> >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned=
 long arg)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index dc6c36191274..ccc0aa3afe58 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3850,6 +3850,125 @@ int xe_vm_bind_ioctl(struct drm_device *dev, vo=
id *data, struct drm_file *file)
> >  	return err;
> >  }
> > =20
> > +/*
> > + * Map access type, fault type, and fault level from current bspec
> > + * specification to user spec abstraction.  The current mapping is
> > + * 1-to-1, but if there is ever a hardware change, we will need
> > + * this abstraction layer to maintain API stability through the
> > + * hardware change.
> > + */
> > +static u8 xe_to_user_access_type(u8 access_type)
> > +{
> > +	return access_type;
> > +}
> > +
> > +static u8 xe_to_user_fault_type(u8 fault_type)
> > +{
> > +	return fault_type;
> > +}
> > +
> > +static u8 xe_to_user_fault_level(u8 fault_level)
> > +{
> > +	return fault_level;
> > +}
> > +
> > +static int fill_faults(struct xe_vm *vm,
> > +		       struct drm_xe_vm_get_property *args)
> > +{
> > +	struct xe_vm_fault __user *usr_ptr =3D u64_to_user_ptr(args->data);
> > +	struct xe_vm_fault *fault_list, fault_entry;
> > +	struct xe_vm_fault_entry *entry;
> > +	int ret =3D 0, i =3D 0, count, entry_size;
> > +
> > +	entry_size =3D sizeof(struct xe_vm_fault);
> > +	count =3D args->size / entry_size;
> > +
> > +	fault_list =3D kcalloc(count, sizeof(struct xe_vm_fault), GFP_KERNEL)=
;
> > +	if (!fault_list)
> > +		return -ENOMEM;
> > +
> > +	spin_lock(&vm->faults.lock);
> > +	list_for_each_entry(entry, &vm->faults.list, list) {
> > +		if (i =3D=3D count)
> > +			break;
> > +
> > +		memset(&fault_entry, 0, entry_size);
>=20
> This memset only needs to happen once, right?
>=20
> So maybe when declaring 'fault_entry', do this: 'fault_entry =3D {};'.

This is true from a theoretical and practical standpoint.  But from a desig=
n perspective,
it's generally bad practice to reuse a memory region without clearing it fi=
rst (at least,
in the case where that memory region points to a struct).

On the other hand, there's apparently no precedent for calling memset on th=
e same
memory region repeatedly in a loop literally anywhere in the XE code, so ma=
ybe it
would be more fitting to just do it the way you suggested.  I'll apply the =
change
later once more revision notes come in.

-Jonathan Cavitt

>=20
> Otherwise LGTM.
>=20
> Matt
>=20
> > +
> > +		fault_entry.address =3D entry->address;
> > +		fault_entry.address_precision =3D entry->address_precision;
> > +
> > +		fault_entry.access_type =3D xe_to_user_access_type(entry->access_typ=
e);
> > +		fault_entry.fault_type =3D xe_to_user_fault_type(entry->fault_type);
> > +		fault_entry.fault_level =3D xe_to_user_fault_level(entry->fault_leve=
l);
> > +
> > +		memcpy(&fault_list[i], &fault_entry, entry_size);
> > +
> > +		i++;
> > +	}
> > +	spin_unlock(&vm->faults.lock);
> > +
> > +	ret =3D copy_to_user(usr_ptr, fault_list, args->size);
> > +
> > +	kfree(fault_list);
> > +	return ret ? -EFAULT : 0;
> > +}
> > +
> > +static int xe_vm_get_property_helper(struct xe_vm *vm,
> > +				     struct drm_xe_vm_get_property *args)
> > +{
> > +	size_t size;
> > +
> > +	switch (args->property) {
> > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > +		spin_lock(&vm->faults.lock);
> > +		size =3D size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> > +		spin_unlock(&vm->faults.lock);
> > +
> > +		if (!args->size) {
> > +			args->size =3D size;
> > +			return 0;
> > +		}
> > +
> > +		/*
> > +		 * Number of faults may increase between calls to
> > +		 * xe_vm_get_property_ioctl, so just report the number of
> > +		 * faults the user requests if it's less than or equal to
> > +		 * the number of faults in the VM fault array.
> > +		 *
> > +		 * We should also at least assert that the args->size value
> > +		 * is a multiple of the xe_vm_fault struct size.
> > +		 */
> > +		if (args->size > size || args->size % sizeof(struct xe_vm_fault))
> > +			return -EINVAL;
> > +
> > +		return fill_faults(vm, args);
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> > +			     struct drm_file *file)
> > +{
> > +	struct xe_device *xe =3D to_xe_device(drm);
> > +	struct xe_file *xef =3D to_xe_file(file);
> > +	struct drm_xe_vm_get_property *args =3D data;
> > +	struct xe_vm *vm;
> > +	int ret =3D 0;
> > +
> > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
> > +			     args->reserved[2]))
> > +		return -EINVAL;
> > +
> > +	vm =3D xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_DBG(xe, !vm))
> > +		return -ENOENT;
> > +
> > +	ret =3D xe_vm_get_property_helper(vm, args);
> > +
> > +	xe_vm_put(vm);
> > +	return ret;
> > +}
> > +
> >  /**
> >   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
> >   * @vm: VM to bind the BO to
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index e9f2de4189e0..f2675ec9e8c4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -210,6 +210,9 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, voi=
d *data,
> >  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
> >  		     struct drm_file *file);
> >  int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, s=
truct drm_file *file);
> > +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> > +			     struct drm_file *file);
> > +
> >  void xe_vm_close_and_put(struct xe_vm *vm);
> > =20
> >  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> > --=20
> > 2.43.0
> >=20
>=20
