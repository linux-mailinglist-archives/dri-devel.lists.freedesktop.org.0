Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096EADFCD7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0744D10E993;
	Thu, 19 Jun 2025 05:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIzQcCZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9106310E993;
 Thu, 19 Jun 2025 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750310504; x=1781846504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b8KR+cUgAB1Cg5XSsBR3FQUpsBOaApaHI0DH1DyHSQY=;
 b=iIzQcCZZgDWtgpe6jq5/F0uLdTNg5Wv+n/726CYn9XWZ1h9xVyUQyEd9
 nm0m4/hqbr1mQYtcrNNg1lRdC7SJYcLaNE44OU5Am3BSDbQv7gOfqhSFz
 wC/5nSZ1YQSPMCNqagZHT24+1M/CZPe6osIJCh6j5BuhAOS7nV1ahiS0A
 bOHcRSUz7vslNKV2vLKmMUeMKEibPHr8NEgw75d/bah2s+5bv+UTdWgk1
 5KXEoR5qSmvlR7PFUrRq9oKi3htkfEm1z50q05gRP4niz92hYFqWA9v6Q
 q59vYtdmSEqVlwtxm+eK9ZpJ1FYIjufOvFR/WhcooEiprPe5x+S7yfuZ0 Q==;
X-CSE-ConnectionGUID: +HAmjNsVTNm8qBmvSXvl3w==
X-CSE-MsgGUID: GqhCt3oWQUS9VfAOOPPl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62823997"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="62823997"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:21:43 -0700
X-CSE-ConnectionGUID: eK7gSS22TnK6Vh9qIg4NqA==
X-CSE-MsgGUID: JgN7j+SIS1GfIWxz+ho8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="155991637"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:21:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:21:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:21:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvm+g2S3ONm+HSCvbeyFEsPPnlGAujPeJoaSHvt6D70J8D0x9yIoCg+xz0krFrdzXNPS49QQxtAQoopR23z2gFX/ZuvROL5Jn+09YdMK0DXgKibgKnfklZu2taKjHajNSkbH0YQZN2F5bFby3i59bVbW8eoBqcO/8sZ+/ydlvSeDgjveXAkgdvrIez983Y+KT1aYE1QagK+727OjtV5ogYhn0t1cfQYUDhBrXuwG/zsE7raujbIc0wcOGBKgLGnS4fLYmWcLkYl7vUPCjCtuilpOJzXuJIAJ7ea9O+p7cspOXg/hVbTY3mYpC27+MUdK4olmM2pqw7bnL3wM85jd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWNEJmGGJEuLcpamrC9GUEMfFLwPNLttxFh4sLVf7Y0=;
 b=CdtqV1obID2P0hfHR9cjuhEhLcDBYgAhI4odIin/BskbeeM8O65g9wuHMEyPpNUkHJ9l+wRrmebjbGV1LlODX+yj3SBSgsW348HvMTKYASpC11rqJTiOjLxM6mtV9hgVw1T5mLG7hCVHTUGzXcs2hWhILFSYXfqNGMYtsLDU9UoyeF6GY8RJMPz7wMSQnRsCFhycDM6fkHZI6u6Wxv56KwJTQQDBVPENRRJTEW8d0GaamcnWlC90Yxj9GICXrQJW8AcOSLbJ3IrY2DOHSaKizRDPx0Gdy0f/b4aWtnvYGK2yJhae+EzdIb0nxhpJFyY/CgHrT19A+wsODuc+DDs8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 19 Jun
 2025 05:21:20 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:21:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Thread-Topic: [PATCH 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Thread-Index: AQHbrPQipaqRgZSYDUqRrO7e4/kQH7P/aKRw
Date: Thu, 19 Jun 2025 05:21:20 +0000
Message-ID: <IA0PR11MB73078309C23F8E90A1903F7DBA7DA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-5-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ2PR11MB7501:EE_
x-ms-office365-filtering-correlation-id: d9a23a96-ca71-4131-cf04-08ddaef12012
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aJ3UntC1ygIkbUSLWGSX0LvfZArpl/b7xpP2z2CSgy9vD3IeYvE7WdAXxDic?=
 =?us-ascii?Q?rSMMVrKXl06wyRqDolKneVoYO2k7OP4trAPsHtI3mC/4x/FXTXkN6lBjH1V9?=
 =?us-ascii?Q?kzZgJLeZm4MLnzhu7of+hxEHik+M5jek3i3BZjf5tzODicmQMsqobVOQrV5Y?=
 =?us-ascii?Q?69EhgrMlxQ5krYS05jU3mweD+mGUfVvII3HQpAr7wfXYMOO76NOkm0Gf9Egn?=
 =?us-ascii?Q?13IPquFwdnI53V3vaZta6Cy8xveDQPlIud5raBmFSByX/M3G3TxyzCymh7QD?=
 =?us-ascii?Q?X0fdM//mTEd8uXViyK/xfoCPSKFM02vqyY6r3/k8axdmvhGNcBxavOXxigc4?=
 =?us-ascii?Q?u/438Z7lV1oTVnawcmMSlibvcat6CjsPWaTjxhBmI9LaoyxX1dnYj1bPY3B2?=
 =?us-ascii?Q?LLm4BLHb4RK88Z4rz7kTXwO1/ff23Fem51o8b4M2Rw+chlZllR+sI2S/0XE1?=
 =?us-ascii?Q?nJJx7lM8XiKQFsjqbZznQiTuJdTSK+RMfIYIc1zgzZH3q4PmIiW9ntzRuqaU?=
 =?us-ascii?Q?zetqc26V1Q9+gc4QHanEIq2SSg7w7PTBH1PNIIhxfFvVv3GfPcc8GgjHhHia?=
 =?us-ascii?Q?xb7rpmPH10c3YRRwf3ZMyWB9VR/v9syJckgvHRBRPwfEq0gUrgD5iYNpFpRF?=
 =?us-ascii?Q?rK80UCT57PxuJRdaGISJ/6C2t10YvPmBVhLJihE9Rx8YUi3Ik70OqlDZaU5i?=
 =?us-ascii?Q?fpf1Sbkhn68o9sP32NfskhnLf0E4dmHdmgXrD29GHoK61FhiriUs0nKilVF2?=
 =?us-ascii?Q?H0K9E8v/SCqtVvzIpo0zBf2thrmajp3pfSg180hjvWstTg9J7JjEiPxz8vaj?=
 =?us-ascii?Q?q5pw0vlC67pXwHODza8cC1FeN6aCr8xqJDoUsSkMUCSw3H52zoy6z9J3VSY+?=
 =?us-ascii?Q?OktQkcHwuZ6q/OsQ3/CKY/+G3GNsakga4Y9bks+lTkJ1IUsvnjKfuqeHtoOd?=
 =?us-ascii?Q?8o/RN2UFFRdc7Z/h7Qvwhg3VjwxcEAl77QSkfhpbBGPpqCv/iNRwXdOUrrld?=
 =?us-ascii?Q?efevtP5XlTngjch9f9q3a9JxnyfhwLE1F9qKI0OmyccMWWE8fSs5VEVmhpP2?=
 =?us-ascii?Q?EXRiawqC1ryTdhlsuAlgAY7/bbyj5rp9Lhk9761gKNKU/oGk1D3XXDJkrxB6?=
 =?us-ascii?Q?T9NANucopRECiCGxm49h4FTDaz6xZSy9xO08joTYEFQB075BhL5+PQOBXrjN?=
 =?us-ascii?Q?dW1/iQaaXlAsRuVIe6hnl1Mh03btoL+X78WGsDoZ3ab7MA64Ued20oS9n4AC?=
 =?us-ascii?Q?afWbhiLhBNMj+GUYHGon/tqNiQ6zmOTbDhkDpTmiK597GvWmz6eQPjlXsozQ?=
 =?us-ascii?Q?GUUzkGDufDVcg6paVagnwhmgeMu/IVb8VnA2XU1Wg52Kvi6vjXk6VPLRqKyw?=
 =?us-ascii?Q?EugNA00YiXMXmNwUlzpmIJ88vkL/VntDonJPs6COJuAVIXa2v4KFNMQaxOSX?=
 =?us-ascii?Q?l6GpgphbCOVQP4R8N9ygZm90tC3tOfo9FJxgNsGKm05zijRGH+JDHVf4zEs1?=
 =?us-ascii?Q?xV8vMZ6hssZgK5k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e0WlQPoI/QoVbTCU33oXlJaGlXyG8fulSm/kcpL4f4IPDwVLDJVGvdgAnKnZ?=
 =?us-ascii?Q?Eg8p//S05jGBOe239vb37jqlI8Lm/XwLvF5q6jZUoR0+Ydm0kCV3tNi1ymsH?=
 =?us-ascii?Q?NrThsb1tDBNsXONAgfeC+a3Z+5WqOHTwSG1lGUPa8wp0XX04aRWrl4MHss07?=
 =?us-ascii?Q?rBXUh2O9qVrGLfKNiQOdYK2XCo0JlBHNOeo6XIiWI3C/ge/2SBARGTQzfTs9?=
 =?us-ascii?Q?kQVSK/J26xF0UogonAxdMVTPs3/H4yXv0RO1E+1g7220koMWLI5/fFSgwIrw?=
 =?us-ascii?Q?ME2yUmWEAdKHi90FBiZPo7vYMIz4w3nCRtmjYZdAFL4fQ9bIBFeN0VhZTrzD?=
 =?us-ascii?Q?u1c1lEg12VM4f/URALLaVsOG/uw0FD6IW14dfiFtpiWA9WaCgRw60BNZKcW+?=
 =?us-ascii?Q?ys+bIex61NWaDfb2EOI717+fxZ83fsl5m+pxxwrTd9WTtcHSrpYm7AqyFiHl?=
 =?us-ascii?Q?QIS7EhjH/6e47aXXbMyDzxSpM21ouabSt142uhwBnDkVyuKi1A7HPCZ2d7hD?=
 =?us-ascii?Q?fob8dB0hhz/cOAI8ERffwIU5nwrDqKiLd6P2yfERjYRv3euEIIPDTYsjVfW9?=
 =?us-ascii?Q?5/KcYilhpPnj7zswtqtiWqDXngX1RLX6zKZFh4nr7o34dEO+ePv5uBhQAhoh?=
 =?us-ascii?Q?e88K/9A7NVLPedKn2dwjJ4InLflV5RvrVLif1FWTDlZ179or0snmo57SyGMT?=
 =?us-ascii?Q?Ec4cEXbDZHE6aYHHfbNz5KVC1Koa3e745MocZ+Cu/+pbrIYjs9HpNkrppXEC?=
 =?us-ascii?Q?j4mf5MzF7cw09bmkCEDDKEP1aKTzY/23084uOCVW1f6SMSIDBii0nQ7TWjIU?=
 =?us-ascii?Q?mz6H9caOvZcmD42DXOItB/mDnjpgi5JnloM6Eg57auu23AJLRF8Z55MlIa8n?=
 =?us-ascii?Q?RqtY8RICkmy2CGmQ7hU0lj7gednINK1X3t4/fo3Dt0OlYAKy9kI7lMFs1Yce?=
 =?us-ascii?Q?tMFjPsMLW/B3Uqfbo6+RXtqJUiGqfh7sP+6cK00Khu99n9MOYtVY6qlrAKTr?=
 =?us-ascii?Q?ghbg6pssn6D8xbp1uSXICuRGkwBZ7bkJ41iO6a0b+h5kJzpP0tMuj4N29u0R?=
 =?us-ascii?Q?ZjhyQp/DBlGt5S/Pagt70CA0pOst9ATeN9DWHbN+EYJoTlAeT9+ECtkdHzON?=
 =?us-ascii?Q?Da0i+YhA8zoIxxqNWqWs8rD0amMeEn7QGcCC8/KeKhEWznCvw3JX+hkOAFoO?=
 =?us-ascii?Q?XHoZJZiSvwhpzkmwiRRDgvVYOBG0mQ/6NMHDL9zG3ZE2g1IIqxyNxs1kqslA?=
 =?us-ascii?Q?gbiaStosLtqkG2SO/Gn+XrP3epbmQzP76skE9nRgZEhSEAzS8ANO1m/XAiIu?=
 =?us-ascii?Q?wn8cQO96xww9b5CVbJOZ26vGKOHtKeb/diwmdryMDtu+qJCSbyVpD/fXTdJ4?=
 =?us-ascii?Q?ZTNpiBv8FD728CCPdxx4da9tlGcQcshzjUR4IWHAyp+p9bONHxYw2NlqKLte?=
 =?us-ascii?Q?AFg1bbcp31n+07hrbCLU8EbT8NsMyFh0ExzHZNNYZpRPZF3LNUFVcOyGdMI7?=
 =?us-ascii?Q?4r25//QEuiAPPmMMmt2gu7pCoZxLOkGgBi7rSmcXvaRvgFoaQ265stmJ7Vsu?=
 =?us-ascii?Q?et6UaEvVE008vfvROW9Gnyo9EE2XMKT4EuNoZf95?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a23a96-ca71-4131-cf04-08ddaef12012
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:21:20.4348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AY8hFZeCgcYacIpT7rqi08Zc36Nny+2t4vD2MurCPXfi7oSHAglB8Tl96lf+TFVC6bz3f+bz9bsLmw7jvstmpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:46 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 04/13] drm/dp: Move from u16 to u32 for max in
> drm_edp_backlight_info
>=20
> Use u32 instead of u16 for max variable in drm_edp_backlight_info since i=
t can
> now hold max luminance range value which is u32.
> We will set this max with max_luminance value when luminance_set is true.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 10 +++++++---
>  include/drm/display/drm_dp_helper.h     |  2 +-
>  2 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 3b309ac5190b..1322bdfb6c8b 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4270,9 +4270,13 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		return -EINVAL;
>  	}
>=20
> -	ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz,
> edp_dpcd);
> -	if (ret < 0)
> -		return ret;
> +	if (bl->luminance_set) {
> +		bl->max =3D lr->max_luminance;
This change may not be required as in 3rd patch the max luminance will dire=
ctly be copied to the backlight_info.

Other than this change patch looks good.
Thanks and Regards,
Arun R Murthy
--------------------
> +	} else {
> +		ret =3D drm_edp_backlight_probe_max(aux, bl,
> driver_pwm_freq_hz, edp_dpcd);
> +		if (ret < 0)
> +			return ret;
> +	}
>=20
>  	ret =3D drm_edp_backlight_probe_state(aux, bl, current_mode);
>  	if (ret < 0)
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 6f53921f5dce..39d644495f3e 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -839,7 +839,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc,
> enum drm_dp_quirk quirk)  struct drm_edp_backlight_info {
>  	u8 pwmgen_bit_count;
>  	u8 pwm_freq_pre_divider;
> -	u16 max;
> +	u32 max;
>=20
>  	bool lsb_reg_used : 1;
>  	bool aux_enable : 1;
> --
> 2.34.1

