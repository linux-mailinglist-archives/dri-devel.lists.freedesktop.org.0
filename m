Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HBZC5eglGknGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 18:08:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD714E86D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 18:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B56310E27E;
	Tue, 17 Feb 2026 17:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fs8y43lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892010E27E;
 Tue, 17 Feb 2026 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771348114; x=1802884114;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K8OiBZ/46rP/CapFScWGbW7GHWS8+IrWrXZAbhK3Cm8=;
 b=Fs8y43lmv+ZL7l+mzIYDwfrhE5tKKUTrsp/U3SWcAT78kmsFIlt6yMDU
 zxaj2wsJa44pxZs8F2QJd31DS8YiVvF11fERltrzrrpo/ZSEgLJ3RxpwI
 2LMe4elfo5RQaHnNhdFlIrvFdlfNKrbE8npjl3KUZYQOlH+SgGZv9lCGz
 Ivp2A5PbxmM3UhHRJyMLdt1a3LtElwBZe92EvCNzunqAM+BOZ03mE3/wz
 xnoQuStLs6wQ/WrZr9Ztr6GOHERtEUKPQyZStph9ZF6ZZoJak06RIvdR/
 INpdn7RjwC4UU9Pw9nBV/iLW7OK7rFlHrslghG/IEFTIuAdRHq1WpCe0G A==;
X-CSE-ConnectionGUID: AYGsw+F8T5Cld8wOcowm0w==
X-CSE-MsgGUID: Om9QzQF3RK2zZBAclAK2oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="89833580"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89833580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 09:08:33 -0800
X-CSE-ConnectionGUID: 2CyqgKgJRfafKj4p4B/91A==
X-CSE-MsgGUID: uq3radDjTcSx2jp1g5jRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="242891861"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 09:08:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:08:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 09:08:33 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:08:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQozpT8rW5TazqoyKdsdbk7T6W0mnuinJp80rpQjDwZGig0Yedyr3jHYbmSLf4AJdF1xpCQFNz/2opaYO0x4QKH1bWJse8e2jFhQ6YApmsTiH/dCak5Kt8CzDkU7ERMEuHFzRymFEzpqidFvAtU5jpNLwXROwJc2aUV4/HycUtsKLux2+2WLy0W5i+y+/7YF/rP99SMo0Rigw3GHCA69UVOIG1JjmVEhfN6sDv0OrZlJYJ+abQ/VHYgI14t68yoP87ACH50HGGecipNf5SSNOrrEnhjiWxtzArFnjaefgJEFnBncpsC7vzYE+z+BZhd08GJXCo/8RQ9YQlL4Gg3KJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoBcwWecobMjd5mQqmQHEIhwxkiy9ctNxjtisktpILY=;
 b=LOxTxluTAnzLRTSYTOb/89cp42L6AMITJLpBopwIYTDZpatoyYYTrCORQhj4+pOb3e32zM0P8rFlpJvQq1Irquf7jScrHX+a+nikYNtmm/4TDXxux3x5j2paeiXTakVj6AEVJlxjhLcfh8iifNMgl47NuQGYEPsnL6FbvPzoKmFneLSJTpkz2Pn1mUESSiQXY2mo21lntwq1T4uMCM1xDuSFkcRNeFkl3qMudVsjpQpk1YCuIT4nODF35K2LYPjswsboSEkKJGXnpKZMBC8cQln/CAb2Hwg8Q4cgDz+3ZrjpgR6sWYqvPuoOTvxZAqhb2p66BiZ6p3k6mGPOK5dmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:08:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 17:08:30 +0000
Date: Tue, 17 Feb 2026 09:08:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v34 2/6] drm/xe/xe_pagefault: Pack engine class instance
 into u8
Message-ID: <aZSggvgWye7qvW6q@lstrano-desk.jf.intel.com>
References: <20260213223410.99613-8-jonathan.cavitt@intel.com>
 <20260213223410.99613-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260213223410.99613-10-jonathan.cavitt@intel.com>
X-ClientProxiedBy: CP6P284CA0065.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ad::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d976fa3-e37c-409d-0d06-08de6e472c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TK8YnxlonnDXsWRzMg+rbKZozqSz7YDoDCn73LziXW83sspnoxU93Wl3dgmX?=
 =?us-ascii?Q?idErlFxtlyVawFbwBu0ZTpKv1J0ZzM7ATb6aRS9cVxSry6wo7xrA0+A0JGsQ?=
 =?us-ascii?Q?PWQ/ONMOZi9an4tM4wf1/ZKnjtiqi7pMO+SNiVQS/efLwJ0Rr8NO6trO1TsE?=
 =?us-ascii?Q?EOV6BHhrAtx6mVUHk5nN+K8QQSgmiufqQ6XJ9JvnAz27yU+EiBVLNOw3E54h?=
 =?us-ascii?Q?dt2VoUwcngITOtkv8b5y/NCAQsS7DibSlhqbconDcsFurM8wMRNDTnw737wg?=
 =?us-ascii?Q?Tkaw6vozOtaNFOQaeD+hb4GONc8UbgPo2iFZKswrMYSjQFRAQDyLoCZWt8l4?=
 =?us-ascii?Q?2Jzmmb2YtlNBh8gpB5PCJwSdfPjIdaIikX+XdwlXvjS/CvRRjwyXzx7V+UAd?=
 =?us-ascii?Q?Wi9OSXWb+/sEqNSwunGwIDkMWOxxOmgHTVfdIMIr3mkgcXudoEuCGpDTG3J1?=
 =?us-ascii?Q?k1Vh8pYeZBR8rjDBcHZDmANQ27JTbyu7kqApEtvtT8KyhNaZzabToj5S75tL?=
 =?us-ascii?Q?pAnJsyzhjfJDgQMODTwdxqtEdhi+s8NaFuhZtu+hC4zI2z1ZaHkIAoYBoxdf?=
 =?us-ascii?Q?XnKIld5YOKsXDgRWT0qih8lUx++nhQ52br+5hppeA/BTkowtBORT2wCNJYjq?=
 =?us-ascii?Q?a6iwizHH416+0cXjsU7Bn+yAvZJKW72cJ9mf1ThYJPadRmH/T9NDj7p9enSX?=
 =?us-ascii?Q?OPc0JND9pd4+jXLmjAr29M7jFfGqoPQPZ13mL1/DuxhsLNruovx8oAXAqI9g?=
 =?us-ascii?Q?J6o7ML8UK/z03iQhHmHBRdyXoqclkTeNDYPNRhLpeUqHI74L0H/lqdMNYhcB?=
 =?us-ascii?Q?mmBCmrBgDpnhF7jS4Lwfe8E2VMkd1wIZdSg+pbb5dA1f1yNWrw7AqhvAUfUq?=
 =?us-ascii?Q?BPQLtD/0t/vCyy/IL9R+lJQgQYxTlBtlVnTLP+RAAuT76tsfxYqKi3XIWTBR?=
 =?us-ascii?Q?N8ysFPlizNzsQ7HqcXC9rY7fco8dAUBztLSEn0MYo8ucWGaRpeWxbFRb+Ztx?=
 =?us-ascii?Q?znKuiecHqlaMTOV4MdBKQUCjc77/OL6eZLCs1HPvtAbaj3o5YXHJtiDxmGIX?=
 =?us-ascii?Q?ZJE8TvCAVxi6D+bvWz84Ir5xfhx9e0FX5CE6p2KfGbxlOJmTlC7jTD+tOZt/?=
 =?us-ascii?Q?pVfZN37/c/l9uz1tSemqpKITmBbqM1w5W47bPg1pdrfjAfiOafDA0y5L9wdg?=
 =?us-ascii?Q?BlVYWgGNMWHVOLgLmuLuPC+fMUYbMdUfDi1199cfkmAnr+O2R+AaVy4LM3hz?=
 =?us-ascii?Q?s6tcwJMyJ1CiW0jfSlWN7ewMVYpPxqu5+hzbOKz9LZFbxYQA9j2U2nKG59h3?=
 =?us-ascii?Q?DDs7c2joVH/bAuALagjfj744uTbStJJrnJACjhgp6bGk6l2HvGGdONvQtOVV?=
 =?us-ascii?Q?BbRxaXp2F8hNH74gh07VU6rt3aJAGVSeZ4IIxNON/hxxEJZjp0Uxg4qseJ2o?=
 =?us-ascii?Q?afLCdOJeyNW3xIfBV3k1TkJefgBprRu8O8HcE1HUkvj+qbXii8423V9bo9bR?=
 =?us-ascii?Q?7cvBEAUwLbrjejk9BzzhebvnusKjfb5utmrf/CdtcZvf7RrIkkxHvSPfE7Td?=
 =?us-ascii?Q?qnrKVyUSDdL4CmgH/C0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NjzjP4AOzXAQ/2TwtWUcFzaAyAPqiKVZicE7VtTqG/r8JkeiyFSkhdz2OTH4?=
 =?us-ascii?Q?uMVxR2SudVQygexSXG2zYPyZtu71hwzl1sRTirBF50PzQcloVWL9U7fgs0ks?=
 =?us-ascii?Q?ZNJ/uxihZUAQMm1eAKdDvpqpvy4+gV/WRvm98Q7JVY0b9a5CknAzHV38xvSB?=
 =?us-ascii?Q?JTTZMW6Bu9uH+Xt2Su36birSVatx5HeIdwHD1VBvf1/pL3MvfiawvV9itwag?=
 =?us-ascii?Q?vP0Crl4kVKnHms28hvSSORXxXLEylwp/w0bjcULXdAjz8xPxNKIl4FGSGnsR?=
 =?us-ascii?Q?vDusgyHXTjqYrFdpIISe5k7DG2FQ3Uir6NP+3ac1YmvtrYOeEcy70vCCzWZT?=
 =?us-ascii?Q?hUBRRkWTnbrHG00lILN1+/+oeoeZrEu16PHJaWmSM3YX9xcG577rQ0aFCZV+?=
 =?us-ascii?Q?OOrMDVHH2L3LBppwuYJ+o8fOn+C8zPRzdtinaPWbue1ZOY1ErfkZztHksC3k?=
 =?us-ascii?Q?uF4p4Cq8FLEGcNTGAy+P284AL0Sh96ILLTZXZDXGEA54s8LzvzwfnrT2I9dY?=
 =?us-ascii?Q?eYaUm84fZngMYzG4bBLlBlVPidcEFrLTUzcoKxwrXsr0uZEwjHPJy6OF3VEp?=
 =?us-ascii?Q?JEEnR++EPHD+kUzjXARHF56yL670RA0o5K3GBcY9OQMpjDTKTtgjsX6+apJj?=
 =?us-ascii?Q?BEcp4ZmtKwA4xrf9eJYaRPLGskKet0Ll505ILxCp2Q9Iu8iaPFHvVQR3i1VQ?=
 =?us-ascii?Q?AKZp1OwValP2FMkTQCTV4o5GH9XvU8FT82bkD7P5d6+m8KwybTvM6oVIMnVf?=
 =?us-ascii?Q?cb8gkprFYxiB61AWRklQ/1UzxRCRGCNtQ4j4BvRqXYGQHj1gVNuML8UavxNP?=
 =?us-ascii?Q?lY/0X99mMsNFvp7k76zVaRVrz/6FUYquI3n+fgYzk0j2VSiLEgmJXFpZacli?=
 =?us-ascii?Q?jjsQAIuwBPv5z/OxNL+zeQHALVT5IPmvGvfwDwkkgOucnF5z9HzwkcR1LMkN?=
 =?us-ascii?Q?vLNDsj4MUmQFzceT1M8Cdu/zs8g9NbBcGVWHo/onBux6EPDHDeEL0ED6Lefm?=
 =?us-ascii?Q?DuxCBHjBYgwjeSVppphbwvpVOOr8P7cGsDAUPxR1ixwfFcBjWObKi28bdtrm?=
 =?us-ascii?Q?C7S5EGcJDpjQ54IWIPF+5iEW+mG5ZP7692USpUtkR+1vokwXmCeLKRDfRIE2?=
 =?us-ascii?Q?N0VRuxluly+rxlJ30qmIz0C5+4t9o3TMW9sQV83SUZ/VZOHdfysLQRQVVtCx?=
 =?us-ascii?Q?Y6NkiGh/kaiAqg48iDOZxhzZ/a0tUlqj2sRBya1IjmoTvR/eBoAW8Uivu4qn?=
 =?us-ascii?Q?gB/sKmAqyQ0GF2lRajipUagwbfldR73LwhLc/tq4FUVw6Yn9OjoLNso6TCjT?=
 =?us-ascii?Q?Qc6d7Otv3BXeEZkMnJDdWLw1z/GMQOpq6RarOqEg6sk08fsNFlW/p4f9D599?=
 =?us-ascii?Q?99SjCvsoEh8E1ggBfyffE03MKzTlinAYrN3eJc1NSloe7gnALDgaWAGiTNkA?=
 =?us-ascii?Q?BdizacHkjU9LM9HSmC/pNQPLd4lXc7KnhGpZ/O+AYK1p8nHVYku7Ehzd5sUh?=
 =?us-ascii?Q?wo1yV3n2dj0hN9aN/E1SLDcQXpJwKdTCs90YxavHL+tx1N4W0keK8ioydCqF?=
 =?us-ascii?Q?LEi4pBzw8M5JBCHUfdsWuT5W4Y4f39za8fNeSR/cwtalssVGIF4BZzbeMigr?=
 =?us-ascii?Q?vHMOf4WUftvl5ksEmXmoJ8kr7wPqoMXhyvxMVIWkMq+oWsDo3hYcykfAyIiL?=
 =?us-ascii?Q?5EvFUpFWsLUXlzm6OcfgGkDkHVvbdkYMN6Hrfy3hpThwVMRVV9HtWuicXGFa?=
 =?us-ascii?Q?84dUDZQVUA+r/wQH30MY4QGB7Az85Mw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d976fa3-e37c-409d-0d06-08de6e472c74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:08:30.5867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLBx1O+WeiZoFymQBWxlUFLMXONujJpQ6z4PavN45qF5ayAnTISF7PB97C/QxV01kK3eda+nna2MNiV8zN4CRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 81CD714E86D
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:34:13PM +0000, Jonathan Cavitt wrote:
> Pack the engine class and instance fields into a single u8 to save space
> in struct xe_pagefault.  The saved space will be used later to store
> something else.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  7 +++++--
>  drivers/gpu/drm/xe/xe_pagefault.c       | 11 +++++++----
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 16 ++++++++++++----
>  3 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index d48f6ed103bb..8eaa1dfc1e66 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -85,8 +85,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  				   FIELD_GET(PFD_FAULT_LEVEL, msg[0])) |
>  			FIELD_PREP(XE_PAGEFAULT_TYPE_MASK,
>  				   FIELD_GET(PFD_FAULT_TYPE, msg[2]));
> -	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
> -	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
> +	pf.consumer.engine_class_instance =
> +		FIELD_PREP(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> +			   FIELD_GET(PFD_ENG_CLASS, msg[0])) |
> +		FIELD_PREP(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> +			   FIELD_GET(PFD_ENG_INSTANCE, msg[0]));
>  
>  	pf.producer.private = guc;
>  	pf.producer.ops = &guc_pagefault_ops;
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 0281b5b6d4ab..47b6a7628dc1 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -229,13 +229,15 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>  
>  static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
> +	enum xe_engine_class class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> +					       pf->consumer.engine_class_instance);
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
>  		   "\tFaultType: %lu\n"
>  		   "\tAccessType: %d\n"
>  		   "\tFaultLevel: %lu\n"
>  		   "\tEngineClass: %d %s\n"
> -		   "\tEngineInstance: %d\n",
> +		   "\tEngineInstance: %lu\n",
>  		   pf->consumer.asid,
>  		   upper_32_bits(pf->consumer.page_addr),
>  		   lower_32_bits(pf->consumer.page_addr),
> @@ -244,9 +246,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		   pf->consumer.access_type,
>  		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
>  			     pf->consumer.fault_type_level),
> -		   pf->consumer.engine_class,
> -		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
> -		   pf->consumer.engine_instance);
> +		   class,
> +		   xe_hw_engine_class_to_str(class),
> +		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> +			     pf->consumer.engine_class_instance));
>  }
>  
>  static void xe_pagefault_queue_work(struct work_struct *w)
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 0e378f41ede6..a14725a02f39 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -80,10 +80,18 @@ struct xe_pagefault {
>  #define XE_PAGEFAULT_TYPE_LEVEL_NACK		0xff	/* Producer indicates nack fault */
>  #define XE_PAGEFAULT_LEVEL_MASK			GENMASK(3, 0)
>  #define XE_PAGEFAULT_TYPE_MASK			GENMASK(7, 4)
> -		/** @consumer.engine_class: engine class */
> -		u8 engine_class;
> -		/** @consumer.engine_instance: engine instance */
> -		u8 engine_instance;
> +		/**
> +		 * @consumer.engine_class_instance: engine class and instance, packed
> +		 * into a single u8 to keep compact
> +		 */
> +		u8 engine_class_instance;
> +#define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
> +#define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
> +		/**
> +		 * consumer.align: buffer u8 to keep struct aligned to u64.
> +		 * Will be used later to store data.
> +		 */
> +		u8 align;
>  		/** consumer.reserved: reserved bits for future expansion */
>  		u64 reserved;
>  	} consumer;
> -- 
> 2.43.0
> 
