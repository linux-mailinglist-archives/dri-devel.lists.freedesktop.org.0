Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CFFA5B72A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 04:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3858410E510;
	Tue, 11 Mar 2025 03:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+IIa0kc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5D510E078;
 Tue, 11 Mar 2025 03:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741663060; x=1773199060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=R/O2jij3LtdWEWZM38sqYsWzy26YrnmWJWSjUheNfes=;
 b=g+IIa0kcn/0CK/uTDANz3vHvk31QXkpN7uma1ROOZYYDeuxVwCtQMZn/
 xNu4MJYrU45uzN7WlOVBGclpObCXqUXtdJo+UHpxiMB9St+8IV5yxPMkB
 7YMSVzh8DXuWnZgwKT4dDTGmoF3jlG/1MXmrWSyPyA8eqqWlcxpqvYeTw
 myI2K18fthLgCT2SNz+CfCIdyc3ZPBSf+YXmQcNpgv+/dkvm40rAukDKM
 KCTE0yWfKtRMhbkWO+TQF6715/yvWAzcF+vqrR0Pk4VfLY2rWgRewT6fx
 rcBQfOxPxbTe46HOfKwmIt/fnatSHdHUBrCy5UHj5+ddIfzL98HhBZDhV Q==;
X-CSE-ConnectionGUID: hVkpvZOmQCeFFHb/EFNnOw==
X-CSE-MsgGUID: JvIhYpIdR8uyyd/iXxQAIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42899623"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208,217";a="42899623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 20:17:39 -0700
X-CSE-ConnectionGUID: P5f3dAtNQSy/jKdJgcXWdA==
X-CSE-MsgGUID: f+ka12IlSrGlIItrLLRu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
 d="scan'208,217";a="125235173"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 20:17:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 20:17:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 20:17:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 20:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhPe3/CVkyWnsYp1tA0PA7yzGs1lhIX7/25Q0p2h24xAunfCUxT5R7X9M6thUTU/OUvvL20ZY8VyWZBkNK3mHznaSYiiU20nI9TBTEVFANXBpgMCoO3eo3JQE/aQEdioyyy3WJP6kpoL8hNTKD50TsZ30TAP/bX+g03JsC94PYucNmeRG1xzRlQlMMLojEEzurWT+YPOYReUjYYms1+EhLr6tq0AbpcQOGNkVxgLKmG5+j/uQslhJh6snjsSjG0Y6ganpYrBFWI6eykN8qXYflRvK24T/8jDQPlbGW9bPI/xt54SDkZNLMYqQ7GJyJvZmsjN/A7/zO0mEvd/rWXSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc0evUJLgPKnfEMsg3TAwGmtCxwGNjkZupO21ZLyVZM=;
 b=CWE/0v/fMppLaO/vCJwA0ZYnszhkbZDBbp4yZUak9bOw4DLAks37KP7Pl0xgsHNsQLL6uFtfYhFdqCOfyg0gCyJ65ZpczssXKTvPJHxc17K7O8wR3DP9VdixrK2537MsmV5DzqvWJSRmSeP/37+WygIoznC0b7fjcSitzhC8W16P7Y8CO2E60ML+tpu9eA/Qa/E6Hs3WwrMdJooyeeN5/g/kuETufF/WIqZGs3dnvEDfY2tjF/WMycliswIjgcyK4oLfUZdeLtc8gzbJLUyjilzwpmXfJlq3sHHNmqHOmi+WvFic4TW/ptZRSW1kIFAGyhtHvMtPPFoXC2AoQ0sQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 03:17:31 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 03:17:30 +0000
From: "Zhang, Jianxun" <jianxun.zhang@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Topic: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Index: AQHbkeCBNr1za9vwG0GyIufnEkKJtLNtQJFi
Date: Tue, 11 Mar 2025 03:17:30 +0000
Message-ID: <CH3PR11MB87077BE438C71B06180771F5F4D12@CH3PR11MB8707.namprd11.prod.outlook.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-5-jonathan.cavitt@intel.com>
In-Reply-To: <20250310171834.78299-5-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8707:EE_|SA1PR11MB7061:EE_
x-ms-office365-filtering-correlation-id: 88d29f7e-b9e2-44a5-379a-08dd604b4255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ZYa3tgMm0PSMnAo8b/Kc/8OboMqQulT2fQlx5upkixWzpcMgzDpZfoeyWa?=
 =?iso-8859-1?Q?jfCwmGCwYqVWoGqbLepqPZboFnxCkapOMY1z9gCJJLxzQ+NaeVqviBn/fD?=
 =?iso-8859-1?Q?6Y8iENGHDl4qxTQYxu5Sxn2dTIGcPaDomPVrO3Js3th7WxMFS4rJlDD3qA?=
 =?iso-8859-1?Q?qv9mukODOBP7uUK3xICK2mSdMAZ1qPgfonEosY6FudaLQ43nIN05JY0n74?=
 =?iso-8859-1?Q?Y6hfav08qsISsCjcNT9JEcDa59oQdhOKgKKRqQUVeb/2IL+8bW4a2cYqjI?=
 =?iso-8859-1?Q?syBGSxxjNZIqdHxMBBv8OYmoIh5qUx78QTfUPyTz+iSi7HTgBrK3uWUF3V?=
 =?iso-8859-1?Q?tTYvSO2kSGjdWjMytUMZgNQLfdIPCOCqLgE46tW+Jp3j/qoOZ2KjAPQNNc?=
 =?iso-8859-1?Q?YxQenuKpDt8pRD2H16KvLmkyJnkcERNjyj0l0kN1VuOtwqERUvjLZ95NMx?=
 =?iso-8859-1?Q?3phHLefq1CZwtoA18U8wi1Ak8gB25RoNLsREds34T+qpIhNdBiuv87aJ+0?=
 =?iso-8859-1?Q?SiTeVqXw9v3ASj/JOLVvd18pfiWSgdgZzToCrvf5RVa7BrwFofSqkj4ZWD?=
 =?iso-8859-1?Q?CFnoyakE/ObnX28S6RuGPrjWjAMfQDJM8sb/kA5dGSdPo7Ta9xyIApE8ms?=
 =?iso-8859-1?Q?klnSiOPfEmxbgHHbHvkAmElyVJI4q2/sL2Huh0dERNBMo4Sft0ODDbKCqG?=
 =?iso-8859-1?Q?fxeY085Rf08mtPt73DWyVI7wdZorsQREQby033YY9FGKGHX45rYdgr+agn?=
 =?iso-8859-1?Q?uWMxRbhcIJx8ZxZZl39+KTbs5IENz+QmQBfOjNMlqNLSi0nO/VWFxy5XwA?=
 =?iso-8859-1?Q?iJNreuL59b+O71Tq5TucLByPMNJAju+coJzUo4RzNOBc3W2IMBBSOxRNwj?=
 =?iso-8859-1?Q?gXr0yNKqvEqGA08Q1bT1W/nv5VA+HacLKckB9/QK0HBBFuvm13UFOOEKv7?=
 =?iso-8859-1?Q?GGZNomndsj2Yi5IMAnsnxStiN57gh8Smz/50/sz7OBa6bRjrcSNSgi1hhV?=
 =?iso-8859-1?Q?nSnkV4jOPwq/WQ5OGQXmdmzo2191k5bvYAAmJRF+ZufPzYxAkNnUTKvugi?=
 =?iso-8859-1?Q?r7ejGSEOUW5Y+cc8LYVKG99bP8QgUEFYlfrKM1HmbPrtpB0eN8T2OmVidv?=
 =?iso-8859-1?Q?9WEBrYvgpnzmTd9X8KIqANCr9qcYlqTj6/BL1aqumXBdWC50uhaqpFVu9P?=
 =?iso-8859-1?Q?7tB4lUiw/1eJ7ymn6WOpiRjr+kBjQHGdoiYf7odcz4xITbq9ESEQ9ekBZh?=
 =?iso-8859-1?Q?aKh6CY49xdRD8oq600ZO3NqksLedYlt+vh/XLil6CjbIPxFOiYFIZ4zfmZ?=
 =?iso-8859-1?Q?qvAoOX5BmUwLXijSS5lr8HOuyPDFMZqo/WKWHPgqfkasEpsw0nGiASEaht?=
 =?iso-8859-1?Q?P5MssnqXAWc+QkH8mA6bFzhRMWUjI/K8hpQheZU2VVfVXVi6qTpO4qpG55?=
 =?iso-8859-1?Q?9WTjoWYSw9h3JrJDhDxix+AEiXwiMMaVhtt49rnccXrXh+89ap1ERt4WXJ?=
 =?iso-8859-1?Q?8ZSQ6jN1L+c+xHDGD1aimn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?L8oqshy7bVjgB0emcTHjImz+pSYuKs4lmVYK617/mtu91FGF3JKBBcT7fe?=
 =?iso-8859-1?Q?1WP59KWnkEXr4Cn7x7vB0a16qtQ0t7rZQqu0kZVAI1L6bsdKnYQE9ZA9n4?=
 =?iso-8859-1?Q?N+RmKtSB2H8AxW3u64z1lAs9msSbTyd119QEtixRL161dmlWaX4K9KVfQ+?=
 =?iso-8859-1?Q?M3fAVgQLIaFTxzssWKvVSz8O95BgiFqQgTNYITWyAWhrco/eUbbmqm7JlF?=
 =?iso-8859-1?Q?+abYVkLuKd2LTiQ31/sW+VoUxy9NLiR9E9PhAmt0CaUEmrhLW7frDBqbYC?=
 =?iso-8859-1?Q?aBnpCfdM9a4yy8YKkOoTpXBxXHVX4uBfFlQK2fTuEQbzpTZ4yuV+3sH6kW?=
 =?iso-8859-1?Q?iIVid673wWOUdQukCnEQbXja3oOEFz4vDG1aQGxdJm2z1WqTFwLPcbKwQg?=
 =?iso-8859-1?Q?GNWuUqlJvFjv/JkYku23atAr4DONqTY8obIBZyX3I5ZLIaMf0Xhq7I7wfJ?=
 =?iso-8859-1?Q?c/fwWeBsGigfjyvNiu7uOq/rW654DoUlBfdEepWPd1jme65OyUK78OhHIm?=
 =?iso-8859-1?Q?zqIe88xne7ps1p+5PDKYf6DVjz9cjglGQ1GIWH7JKwFhPb1OA+WcsHzRz1?=
 =?iso-8859-1?Q?2Au44WYMFyI3DhtQ1rJL5Sf4gMqSrCXLvvB9oFiL2N+bzKnuK++nrHmoKV?=
 =?iso-8859-1?Q?tnhPjSX83TBCsPTs85zquLYicA/pCGKcfcT3ud0QXXwkkxX4EUVuEqUlB2?=
 =?iso-8859-1?Q?qFcHVPKmPjd1mfkaF6hGpAFIQPwv7tXeKPvskqeeYZGnBb6chzZEVM0Iuf?=
 =?iso-8859-1?Q?J/IQmg6282qRkoRHvo4+9siy5wmXJPo3QAzTwzPZzbWopQt+ipkSCoaKp6?=
 =?iso-8859-1?Q?mTuM2UMS3nuyWkiBpKeQIHTgIldonoCm3jaidlEwulT6X81ZABuNso7Hk1?=
 =?iso-8859-1?Q?CFxLxbdlFn0AYY0ghEOVx1keMmMRCQYfZXGTamIRRyZ7bs/v3n9toLpCXW?=
 =?iso-8859-1?Q?WDVQpfJIOwPRQroJ+8EYHmRQuSMEnTNuD5RBAh3Bw6Vu1n6irtuikowTIY?=
 =?iso-8859-1?Q?QYBojDIW+nZqxhGkfsRpjEu64t0K/BnjPGrPKpPMamahhiWvvT+EAPRyJg?=
 =?iso-8859-1?Q?AitNB66UuJxTG/thMJ6WRxXbP1t8+w1wqPOL2LArPcaVrq8nrlzsolydTM?=
 =?iso-8859-1?Q?+ftCL5tcPdVKxk9Y/kBnvVk3s1cvC3jQVcEQbH34eI3ifZ3+9d93RLHkAv?=
 =?iso-8859-1?Q?C3TjhmWg3erCQdyr8dT98efTrN+ouDRV5ZCVl5Cfa4Pta+feNWtjHvoTdB?=
 =?iso-8859-1?Q?tyoAD33L2nYMYRLAmlksoTT6sGl88AGFKBBYLxqTmq//LXJnHtkrhFfZxr?=
 =?iso-8859-1?Q?aXr6w7QmHD7tJ2EzEva1bmtIsf8wwV95r4gI3aRHR3U10o+jM3ESl2ve7z?=
 =?iso-8859-1?Q?X474mYplbJt5iE8US5eOyPPlknRNHGMNevdr0V0OkB1Si6a+HGPzQSaY4M?=
 =?iso-8859-1?Q?Gwm4Xd4dEF/E2/QDF6fwCVPbFfC7N3+c60tEJMWGCvKJ3GDbrQvvEBmhHN?=
 =?iso-8859-1?Q?GIi1O7Iev2KzyASGc5CcB1pFKYLbjAt+LuVBc162P3pnxSEe9CTq3P+QrC?=
 =?iso-8859-1?Q?kg/in+pO7i4W0zldjIPogCpwUBh8mpT8ivsnN6aEKAAIbqyZVJPvNwPFtv?=
 =?iso-8859-1?Q?X3E139n5u+Jl7/K8PIfoSDc+zjR/7HB0T9?=
Content-Type: multipart/alternative;
 boundary="_000_CH3PR11MB87077BE438C71B06180771F5F4D12CH3PR11MB8707namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d29f7e-b9e2-44a5-379a-08dd604b4255
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 03:17:30.7597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgXpsnRBp9nY1OeHcguYqgtL/0/hn/D6EhaVd48ZL7hVSEZMTaZt19xNGSrRzAnapPBr4gYpmE/QvNtx3Imw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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

--_000_CH3PR11MB87077BE438C71B06180771F5F4D12CH3PR11MB8707namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Sent: Monday, March 10, 2025 10:18 AM
To: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; joonas.lahtinen@linux.in=
tel.com <joonas.lahtinen@linux.intel.com>; Brost, Matthew <matthew.brost@in=
tel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuiche=
ng.lin@intel.com>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedes=
ktop.org>
Subject: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults

Add initial declarations for the drm_xe_vm_get_faults ioctl.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..90c2fcdbd5c1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - %DRM_IOCTL_XE_VM_GET_FAULTS
  */

 /*
@@ -102,6 +103,7 @@ extern "C" {
 #define DRM_XE_EXEC                     0x09
 #define DRM_XE_WAIT_USER_FENCE          0x0a
 #define DRM_XE_OBSERVATION              0x0b
+#define DRM_XE_VM_GET_FAULTS           0x0c

 /* Must be kept compact -- no holes */

@@ -117,6 +119,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC                       DRM_IOW(DRM_COMMAND_BASE +=
 DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE            DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION                DRM_IOW(DRM_COMMAND_BASE +=
 DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_GET_FAULTS             DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)

 /**
  * DOC: Xe IOCTL Extensions
@@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {
         __u64 reserved[2];
 };

+struct xe_vm_fault {
+       /** @address: Address of the fault, if relevant */
+       __u64 address;
+#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT             0
+#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT     1
+#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT    2
+       /** @address_type: , if relevant */
+       __u32 address_type;
+       /**
+        * @address_precision: Precision of faulted address, if relevant.
+        * Currently only SZ_4K.
+        */
+       __u32 address_precision;
There could be a few more fields we need KMD to report to meet basic suppor=
t of the VK extension. I am going through them and will let you know.
+       /** @reserved: MBZ */
+       __u64 reserved[3];
+};
+
+/**
+ * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS
+ *
+ * The user provides a VM ID, and the ioctl will
+ *
+ */
+struct drm_xe_vm_get_faults {
+       /** @extensions: Pointer to the first extension struct, if any */
+       __u64 extensions;
+
+       /** @vm_id: The ID of the VM to query the properties of */
+       __u32 vm_id;
+
+       /** @size: Size to allocate for @ptr */
+       __u32 size;
If this for the total size in byte of the memory of `faults` array, it seem=
s redundant. We can just use `fault_count`. I think removing it streamlines=
 the interface design. Some code like dividing ops in patch 4/6 can be save=
d, possibly.
Knowing fault_count and size of struct xe_vm_fault is sufficient to UMD to =
allocate exact size of the memory too.
+
+       /** @fault_count: Number of faults to be returned */
+       __u32 fault_count;
+
+       /** @pad: MBZ */
+       __u32 pad;
+
+       /** @reserved: MBZ */
+       __u64 reserved[2];
+
+       /** @faults: Pointer to user-defined array of xe_vm_fault of flexib=
le size */
+       __u64 faults;
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CRE=
ATE
  *
--
2.43.0


--_000_CH3PR11MB87077BE438C71B06180771F5F4D12CH3PR11MB8707namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Cavitt=
, Jonathan &lt;jonathan.cavitt@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Monday, March 10, 2025 10:18 AM<br>
<b>To:</b>&nbsp;intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedeskt=
op.org&gt;<br>
<b>Cc:</b>&nbsp;Gupta, saurabhg &lt;saurabhg.gupta@intel.com&gt;; Zuo, Alex=
 &lt;alex.zuo@intel.com&gt;; Cavitt, Jonathan &lt;jonathan.cavitt@intel.com=
&gt;; joonas.lahtinen@linux.intel.com &lt;joonas.lahtinen@linux.intel.com&g=
t;; Brost, Matthew &lt;matthew.brost@intel.com&gt;; Zhang, Jianxun
 &lt;jianxun.zhang@intel.com&gt;; Lin, Shuicheng &lt;shuicheng.lin@intel.co=
m&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b>&nbsp;[PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_fault=
s</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Add initial declar=
ations for the drm_xe_vm_get_faults ioctl.<br>
<br>
Signed-off-by: Jonathan Cavitt &lt;jonathan.cavitt@intel.com&gt;<br>
---<br>
&nbsp;include/uapi/drm/xe_drm.h | 49 ++++++++++++++++++++++++++++++++++++++=
+<br>
&nbsp;1 file changed, 49 insertions(+)<br>
<br>
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h<br>
index 616916985e3f..90c2fcdbd5c1 100644<br>
--- a/include/uapi/drm/xe_drm.h<br>
+++ b/include/uapi/drm/xe_drm.h<br>
@@ -81,6 +81,7 @@ extern &quot;C&quot; {<br>
&nbsp; *&nbsp; - &amp;DRM_IOCTL_XE_EXEC<br>
&nbsp; *&nbsp; - &amp;DRM_IOCTL_XE_WAIT_USER_FENCE<br>
&nbsp; *&nbsp; - &amp;DRM_IOCTL_XE_OBSERVATION<br>
+ *&nbsp; - %DRM_IOCTL_XE_VM_GET_FAULTS<br>
&nbsp; */<br>
&nbsp;<br>
&nbsp;/*<br>
@@ -102,6 +103,7 @@ extern &quot;C&quot; {<br>
&nbsp;#define DRM_XE_EXEC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x09=
<br>
&nbsp;#define DRM_XE_WAIT_USER_FENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0x0a<br>
&nbsp;#define DRM_XE_OBSERVATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0b<br>
+#define DRM_XE_VM_GET_FAULTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 0x0c<br>
&nbsp;<br>
&nbsp;/* Must be kept compact -- no holes */<br>
&nbsp;<br>
@@ -117,6 +119,7 @@ extern &quot;C&quot; {<br>
&nbsp;#define DRM_IOCTL_XE_EXEC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)<b=
r>
&nbsp;#define DRM_IOCTL_XE_WAIT_USER_FENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_U=
SER_FENCE, struct drm_xe_wait_user_fence)<br>
&nbsp;#define DRM_IOCTL_XE_OBSERVATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOW(DRM_COMMAND_B=
ASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)<br>
+#define DRM_IOCTL_XE_VM_GET_FAULTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_=
FAULTS, struct drm_xe_vm_get_faults)<br>
&nbsp;<br>
&nbsp;/**<br>
&nbsp; * DOC: Xe IOCTL Extensions<br>
@@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 reserved[2];<br>
&nbsp;};<br>
&nbsp;<br>
+struct xe_vm_fault {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @address: Address of the fault, i=
f relevant */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 address;<br>
+#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
+#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT&nbsp;&nbsp;&nbsp;&nbsp;=
 1<br>
+#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT&nbsp;&nbsp;&nbsp; 2<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @address_type: , if relevant */<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 address_type;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @address_precision: Precision=
 of faulted address, if relevant.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Currently only SZ_4K.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 address_precision;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">There could be a f=
ew more fields we need KMD to report to meet basic support of the VK extens=
ion. I am going through them and will let you know.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @reserved: MBZ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 reserved[3];<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_xe_vm_get_faults - Input of &amp;DRM_IOCTL_XE_VM_GET_FAULTS<=
br>
+ *<br>
+ * The user provides a VM ID, and the ioctl will<br>
+ *<br>
+ */<br>
+struct drm_xe_vm_get_faults {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @extensions: Pointer to the first=
 extension struct, if any */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 extensions;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @vm_id: The ID of the VM to query=
 the properties of */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 vm_id;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @size: Size to allocate for @ptr =
*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 size;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">If this for the to=
tal size in byte of the memory of `faults` array, it seems redundant. We ca=
n just use `fault_count`. I think removing it streamlines the interface des=
ign. Some code like dividing ops in
 patch 4/6 can be saved, possibly.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;">Knowing fault_count and size of struct xe_vm_fault is sufficient to UMD =
to allocate exact size of the memory too.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @fault_count: Number of faults to=
 be returned */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 fault_count;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @pad: MBZ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @reserved: MBZ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 reserved[2];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @faults: Pointer to user-defined =
array of xe_vm_fault of flexible size */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 faults;<br>
+};<br>
+<br>
&nbsp;/**<br>
&nbsp; * struct drm_xe_exec_queue_create - Input of &amp;DRM_IOCTL_XE_EXEC_=
QUEUE_CREATE<br>
&nbsp; *<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB87077BE438C71B06180771F5F4D12CH3PR11MB8707namp_--
