Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FDCBA3227
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D08089B46;
	Fri, 26 Sep 2025 09:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEK1LvMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286B89B46;
 Fri, 26 Sep 2025 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758878812; x=1790414812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TV2RrKkBDLsrgNwUiwBupKFW98gaIJhR9vX5Xp5n7bA=;
 b=NEK1LvMsNKeg3hzLEG84L6/nfxcK4zc6TE5iLFSoNFLhZL0Ai7RARWGE
 70APzwBhOdvkEmRVUQHmVGT21TjpeIgHu7l9Yfauh4bWLFRIqxmT2I4c3
 fGgAI1RctWwJIFOZ8r9BioJ7iHmBjwV7pHNhMZajTOVoY4f5cVus0hjfj
 odOWBKjLXBH4ZLy/Z+n6zGnPdf4CgmXtGASX73a7rlUBDkVsIOT7HF8Ou
 c0LMNgoyfGqPPwz04cby1KIcYynrCrHiWkKwAqqsgC9TgqLSt18tbnRqe
 UQGgFGfuSkjR6MWdZkHee2mySPqztpIVaRu4l3Lv836WFFsB7mUpUuX8u w==;
X-CSE-ConnectionGUID: xiZiHBHeTQeK5AU4zMX9mg==
X-CSE-MsgGUID: I2sJCaLfSjaQz79WvMST/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61379358"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61379358"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:26:51 -0700
X-CSE-ConnectionGUID: gva0A7IqQ5Wxkq8m0ZY8aQ==
X-CSE-MsgGUID: F6apM7U0Tm+DcKSvxc9AWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="176697341"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:26:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:26:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 02:26:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIMSU5K/d7X/asDYx+lObO8TxpV+AVtSn6VdQ0vmlXWr5Qp5fT9tcP0hwSVD3QL592Zn/AIr9HGTKmB6Dsl5/UuvjAE9qsdwaR9Bs1x7DKIRJ4Bhx6bBP/JicCAtZI5UeGsM0Zq+jCamZWrf8J5XHU7oNOdBT29L6FeMhpbBDuEUp394tj/9MaF/DoqONPxJNIHF6Wvf6tPd0rqMv0ptRndatQYi9NPoEMVMIx0r8pW3fqaplOI7U6EFdldaivvmF3XHUB7wAskgEWWP/DHDe2TKurAlJ/JGzPWDCQyIR2BhGlRaaP2c1bzIHkGaSZYej58XWEJuMNw17ZttxJulzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC7r4tZzFp9pkJBzPfXKyNPcXUpvyIYD4mEaL+99o2I=;
 b=f4Ym3yto0s8f7lpvyQL3Wazy2Qd5bDVfuzoctS7MPGY05nyEyawoPNwySGRl+7uDuySwvl9uEen4iUAHwTT+C6ky+Gnz2qecN5wEIMXzyGZrtb0MJdCSL+SdIf0JP3jInhEEXHG4fuLwFaUcaTcWTxVqYlsbPJyYVYE+IihZgh75n3dfaj3S237x6+PpmEi0ZKjMJe37OxE2Qyd0w7YkDUCF3wpZZkO20B6pXY+3p5rbfKrogJVlZHg/4XlUEpIu7lzKGm9EBCCeon8AJfuxfSjxWLw8CflMBVVQblgL3Ws+hHqHMyod11XuBNcuXuwcuPK8BnINYYlKpYIisAXlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW5PR11MB5786.namprd11.prod.outlook.com
 (2603:10b6:303:191::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 09:26:41 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9137.012; Fri, 26 Sep 2025
 09:26:41 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Aaron, Ma" <aaron.ma@canonical.com>
Subject: RE: [PATCH 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
Thread-Topic: [PATCH 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
Thread-Index: AQHcLsNdPwcC5+SjfEiot8pp/8NCeLSlMXag
Date: Fri, 26 Sep 2025 09:26:40 +0000
Message-ID: <DM3PPF208195D8DD3E38CF770DE7A86EFB9E31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250926085401.2808634-1-aaron.ma@canonical.com>
 <20250926085401.2808634-2-aaron.ma@canonical.com>
In-Reply-To: <20250926085401.2808634-2-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW5PR11MB5786:EE_
x-ms-office365-filtering-correlation-id: 82b98d12-d086-4707-4d11-08ddfcdecd17
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZXUWtf5D9bCJNgim47fzP/nUIMGU3eWuMLfC0f0dHcvUkWA/Nur2aOXZxbX6?=
 =?us-ascii?Q?CR6Gpd9Uq+i4l5smO+M7aQeMN7Hl/Jmrm5WyWnZf30I4nlmzVqfw3OTSrSwg?=
 =?us-ascii?Q?m0CIGrJP/hO8/ZPJ+eh+KInueTxRjmX07bmhXomFnWmoREItdfBlPh1IC2XD?=
 =?us-ascii?Q?As+Q1yo04EKD4Wmv0TDveA3On/zNjOd0qKObqzqudbDsjeFmRnOQSVrpOF75?=
 =?us-ascii?Q?IyeqPaqa43xoXPDcbMIfjOBKiu9vV2d0/iKy+ynwzzSKtuzPgv4ipcJOG99s?=
 =?us-ascii?Q?QqjZeyHCfkSjBL44t/6YD7iqXXRWa8JmxOn9e8TjZv4cG4UEo5C5KG2XiKs4?=
 =?us-ascii?Q?GAOVlWF5fkx2JFm+BJHxZSUZc/zjlCUjB4hzccwzQMnX//rOOBD1FwNAcz2f?=
 =?us-ascii?Q?ny0j0bOpy6uZVs1tisodMIFQWRJxr75Ej+Egsw2TDd9dbprsivj8MN3Ma7ok?=
 =?us-ascii?Q?LXHkYiLFdgrsNP+9yZtVChXOIrZhPZJEL1P0NDsuNl5X7HC8Ra5OMRtsyXhR?=
 =?us-ascii?Q?x44Is4gTCKllT3VpzaWNqKFTk0lzRMD9ajZV+HASV7A49xFhXCSOrAJQBqF5?=
 =?us-ascii?Q?ee5ha/NjHEZItCpJOtTEVABsAE8hlkFtffO5pPHphBcXAsZMDRMGf0O4jgUH?=
 =?us-ascii?Q?y9X+wzyrY1lyoKusLOHTQ9NXPZxB7GDOWMjtUUPcbKur5iPF70xMxjgJNW7b?=
 =?us-ascii?Q?df6or8ozVM6OkKcMCHEq8VMP+RgbNetYAWAGubibBCFT8slivSskMtIprLXb?=
 =?us-ascii?Q?NmuXF8oFDjDQ36nC3RFXBu5tFwWPNuzCOIxHpGR4vl3l3Yo84gb7Ztg2whnl?=
 =?us-ascii?Q?K+MJL4//I4q4bhBhPiWfdAodtBRzyg03qhj0swEiI71nBOHvoQaRMG4MDSMA?=
 =?us-ascii?Q?zwpakumXhSmOWxHaU5oeNko10L2wr2hx4VP7XI4xctjx/eNCG6QDv1adHm7D?=
 =?us-ascii?Q?Ng5vdn/Oq+fAM8s41GMIqRCNGXrXzmXr9HpeC67gWwcBMvbREaarmKdu/+JJ?=
 =?us-ascii?Q?kXHZqfKnyvCBpq9KVCIBueew7Y792feabQIUjYkOb4K7dPn4sEJX9DeAPoBv?=
 =?us-ascii?Q?PusACrf07mmwndH7NdqeTRw4qOXyUHtXFrtfOs+EYEWYYlNpWKsgUivt5K7B?=
 =?us-ascii?Q?kM3jp9ZH8uv7obUBxYk7Q/6uVlUgD7DZS1vPZkAdZBPG4cE9unaSf4JwWKkQ?=
 =?us-ascii?Q?4ZrhKDSrYXYQdqPVQ2huJJwHyij7JKkxVo2xyB1hdeFg0Vx6fq0PZWYmUl1p?=
 =?us-ascii?Q?NihbiiZfkao077tSKxQMxCd68onUXpu1Ml6r8YzlhEUM9+W5nMZDa6FBcvsI?=
 =?us-ascii?Q?UAkRt3dQoksGRsDeqwQJKZWMOkTv9N6dP6+vAOGCtdfSu2+cte4uVP7aI3kB?=
 =?us-ascii?Q?i3OFDC7OiidrVD1Y0uNkbjTb963hyf8wVzCcGfn78ZEc0oXgJsHGUqH5Al7L?=
 =?us-ascii?Q?RbhClzpvyPSupCkW2vxx5z133xcJLGbZJSfcrg32E8GhRz0b0ae1solWqS7Z?=
 =?us-ascii?Q?LsMugB1Nyxs+y2wxoyNL/DVEJAue8KsQPEgH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MErVcoQDZnaAUyyIQh/lEoXhxw2gvpH6h6H1Z/374yfXedIrGJr9CRr+J73q?=
 =?us-ascii?Q?rhGHRpJNrSzhNYnk1Kipko0L/y2f4ieLLdl1WjugyArywRPnTN8IJncSNcpp?=
 =?us-ascii?Q?zOH+cT8d/nFU6bD47KZCpgbYZLZb8w+xcNSVWR12PNDRvLtyH/IJG6lgmvnD?=
 =?us-ascii?Q?YSQ2tLxfzzRT5AxEZ9XYUq+dyHD28LS6tmGP9pGD4NksOPI2SPxsFAnYgPu1?=
 =?us-ascii?Q?gias4ATKeb2RaUC+49JvTevYxpbb2/SlTm1h748AstzCFU1jVpeVAtySWQdQ?=
 =?us-ascii?Q?Nb8BDeGjxk/P0qNPuHLZNL4Qe8/lzxYwf6JpE0uxYSQ3cGTCgvpwac/cAIIX?=
 =?us-ascii?Q?afaQU7Xh1lme9r2MLJuctb2bqjAh8BrFYWgueb/KdKQ08f6gPkf+F5tyrXdR?=
 =?us-ascii?Q?qzuxl82hNqrMwF+JVX8U2c0Pbr9siNDFKExXO6KBKKEyUVc4cIVxi6W4qgve?=
 =?us-ascii?Q?oxP+3ATgytuAcUMtyYKWFZukFeLv3tE58R+M/S/PjBazAIdnqzwSLwsXJhQP?=
 =?us-ascii?Q?AYgeciuy0tT0Fz+oJEDwLr7m0oRIsbriyxQ5++xdUdHCV24fHnvgnibOSCws?=
 =?us-ascii?Q?t2NSr4nYDn+8BA1x8a901zFiJhDrPq5DtLU1C5sinBVqiWHPFjbLVihYze6i?=
 =?us-ascii?Q?sw0IirTyKacoVUL05903hC4A5HC+4LWraA1rxMOYj6o54HvUYDuRsoHNDJFH?=
 =?us-ascii?Q?Qzp8iMPwUtI9ALWl9RyaI70Zji/2WqC/oNvYbgBnFCc2XDuC3oqtxgyTXrUG?=
 =?us-ascii?Q?B5XtJpBfWaLp5OGRSYF0UtWXVFyTW98yI+UyBTVne+PXCSNKdIqXTzGqMnwq?=
 =?us-ascii?Q?iyoWQn/46zT624DuNbzsSII102yseMJkScMMIbIQltp5CgZj9OdbFNUL13EO?=
 =?us-ascii?Q?zzbj8P7Rwc50DeMDTXRKHevDpsfP+bdiCJnaVKTt4L54LGnHs2eJOHrr4v8P?=
 =?us-ascii?Q?c+1aRzMtNmz37CagCYn7Kt6K3FCnfwhCsc6x3Z9D+ilptTbKwqpqEGqbVFPa?=
 =?us-ascii?Q?VhXLsZWdDbrNrbzzckDRu/9+TrRV1LSPE45E1vmwvB4yCdghfBSFZ0lJyFJA?=
 =?us-ascii?Q?RjC87WE0ShZx6LVZOozJrXOL+Z4YCico5JQcvkt9Blak9lI/Q+X/68rWOSCG?=
 =?us-ascii?Q?nQCnvSWBdE85x3xDz97g3i817wyaNDh0Hz2Pn3+jE8AUvFGdGOgsZfjW7Dxn?=
 =?us-ascii?Q?yGl+vTLw/eoQWKxzkLZY6kkGBJChplWsjm53GzQr6rkcEt7hAHoINPkqXNGk?=
 =?us-ascii?Q?bArwv5m2m4OA5RMUXLggxfbwzVHV1gszi2DXu+aVFnEKWEw1jjGEq0xugJyp?=
 =?us-ascii?Q?pB7gCzwkg6qoVz7fjuP5w+EFRMqgiwLOk48fK14TgAmnaTrgI3RNWdRc1CvO?=
 =?us-ascii?Q?x26WPCQBNrj6C1a7MvSmM2JXl5fbIQOyLn+7W4QVKwQvYyGsJbfZbUB75BWC?=
 =?us-ascii?Q?8MI1OydiA6g3RozlqufOSng0pMIyLTi2T84YmDzReLn4vbS531Wu2TFd7ecD?=
 =?us-ascii?Q?OBs8CE1wMT2zqR2mMPhg2C7AofpdkC1Gc/F0fe5p5qYQ9Qt2D7+o9nrsaFHy?=
 =?us-ascii?Q?DLAb16FQdOZYSmZOHOWHAaAZfgw7B72qNQPUPfvz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b98d12-d086-4707-4d11-08ddfcdecd17
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 09:26:40.9773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JsYks7FGciuJSwoLoOEOEA+yZfyWc6z8z29IxjFhLNT5Kiyvw4Q2UODruOVCRLfU6Jiyn4AdxwnLm8NdlkmbKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

> Subject: [PATCH 2/2] drm/i915/backlight: Add get brightness support of DP=
CD
> via AUX
>=20
> Use drm common helper to read brightness from both luminance and AUX
> mode to support get_brightness from DPCD via AUX.
>=20
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 20 ++++++-------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 0a3a3f6a5f9d8..0ee6fd0f41ef0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -454,24 +454,16 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> intel_connector *connector, en  {
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  	struct intel_panel *panel =3D &connector->panel;
> -	u8 buf[3];
> -	u32 val =3D 0;
> -	int ret;
>=20
> -	if (panel->backlight.edp.vesa.luminance_control_support) {
> -		ret =3D drm_dp_dpcd_read(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> -				       sizeof(buf));
> -		if (ret < 0) {
> -			drm_err(intel_dp->aux.drm_dev,
> -				"[CONNECTOR:%d:%s] Failed to read
> Luminance from DPCD\n",
> -				connector->base.base.id, connector-
> >base.name);
> -			return 0;
> -		}
> +	if (!panel->backlight.edp.vesa.info.aux_set) {
> +		u32 pwm_level =3D panel->backlight.pwm_funcs->get(connector,
> unused);
>=20
> -		val |=3D buf[0] | buf[1] << 8 | buf[2] << 16;
> -		return val / 1000;
> +		return intel_backlight_level_from_pwm(connector,
> pwm_level);
>  	}
>=20
> +	connector->panel.backlight.level =3D
> +		drm_edp_backlight_get_level(&intel_dp->aux,
> +&panel->backlight.edp.vesa.info);
> +

Just call the intel_dp_aux_vesa_get_backlight here and call the drm_edp_bac=
klight get level in there

Regards,
Suraj Kandpal


>  	return connector->panel.backlight.level;  }
>=20
> --
> 2.43.0

