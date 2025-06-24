Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4814AE5B9F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106F10E4C1;
	Tue, 24 Jun 2025 04:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajz+vLdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BFB10E4BD;
 Tue, 24 Jun 2025 04:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750740487; x=1782276487;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uJDm4PTLCv4WV1YBvZkFfG+kyYQ0IrrRuSohhvuJ7HA=;
 b=ajz+vLdXOWPm0EO8F+HB+QEVGzLZ4il5xFML0OjFYxYY+G9UFiFvi1ug
 3m60objRMwSQj29xMlRt8hcxHH1l1axHy1n8E4YxOHElJAB5sDNzeYNcM
 +hcXy0lky9wzkfunL275miQBZN860binuWJPlLHzuLEZt7gWqSw9PfUN4
 9G59YTm+1y/afBQRhnMrqb+UXonvq5OAfBg+LbsW3PRV7AyJjbuWVCaz/
 ZEtKHadZMTuIE+xq7p3NzKDveCENpR5LAoNWR+hpBVAmALPrvnEm9hcjV
 mHdCfAkf/QBPPLxS9wxTo/rQsdZ4E5lNiKldG24ioz9aSNvWWfokqJqQ+ g==;
X-CSE-ConnectionGUID: 40GTrDWJTg+NP5Wgoem2bQ==
X-CSE-MsgGUID: fXNY8npST/iAS/TEHAnCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52682317"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52682317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:48:06 -0700
X-CSE-ConnectionGUID: 8LtbnW+vTLGxsuwq9EPa7g==
X-CSE-MsgGUID: wA/3ty4lR/yIofwtQQaS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="152507805"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:48:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:48:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 21:48:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:48:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lR6ReKtj2UqjFDeYPJUmipFSsPYrZcfXCi7nYzt1zLnWkTU8uOmMH3uEGrXUyeqlzFBM9jHXcvbA9YtesY56UCgx5UXl99cNixh4V4Z41gHlRAjW/ZYa0gcL5rC+MzmGeTrxTmbpzwDIjF81hBbxlrZgJx09n/uMw8oOrTv1l5IYyiQMpxpsKstZcL0ARaHdIM0b41CStwDP9DvBIg7YUi3h34C82dIfVkIquthp8RD5UDGEz6/WQmJtOjld5bB+Mv2e5TPhHxwwH4Y4vSIEQULwr95dqT6/K3ACPawM93T20R9gJWXQ2VW2Xtd2Pp7TINtcO9nf1kp2csOFPtPBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9YX1e7cD2Z4QKEx6QqBW86sqvxxtnNYxu5emRw9lCI=;
 b=bIpFRJL3tIYXVueebxvk7bpZJXqglYZdscl0+mPlbQltfpbyuHzOtRrmWLH9ErPHAFC2kffo6YBQ2ZDO0wDI6bR3hVxcArLZ02vdHSxBEOUsQ4TVukwbpwHgrId6tVggNLYOdHQsbLO95iN1mGY4NfQfEq/jOFUNAaO0K955kjLVCZa85Ni4/GqEOlfJkklpl7F1nMJ535hdzP1UsKEmI0z8iTrBMhEM4yCd7G8vZuhEahApWK9ar0WJc7g01x8mU6HkC3PNhpRhL1Cxw3232eJe9kuhs94XS5jRGW/3pqVPb8S5UIpe7SYucD5DpTj+Hd6WAEjkdB750wENuohZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Tue, 24 Jun
 2025 04:47:33 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 04:47:33 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to
 initialize edp backlight
Thread-Index: AQHb4a2Wo2JZGNQcoUe4Zr5QpfO7i7QRwfIQ
Date: Tue, 24 Jun 2025 04:47:33 +0000
Message-ID: <IA0PR11MB7307746E548211C22AEE96A6BA78A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <20250620063445.3603086-12-suraj.kandpal@intel.com>
In-Reply-To: <20250620063445.3603086-12-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: 315de1a7-d1da-4cf7-9593-08ddb2da3bb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GoDq8jXcG5ySDly/jrqOnD072rBJ3nktbLoa+8ygiItA9XKExvKVC6btid3x?=
 =?us-ascii?Q?Bm+nSRNHIJx42ZenYMDsecP0adBWe5u4G8eAw1qsm4hM+q4HCOutXpBWoMHv?=
 =?us-ascii?Q?mMIWmw4Ehppy2YzroWpyUxWTWC/WSElHSF5GygFXQeTVcCag6Ns/zEWIdl4l?=
 =?us-ascii?Q?m8R6E9f1IJVGXWniQvNptKhNdiINySdUTckPeXgo6jNR8L18E1fbMuz8rRG5?=
 =?us-ascii?Q?BHmyIUZjwMpY0K5vMxNo7O1ORrC39pKH/LrRp+dqCCWQA1gqCWsQC/xOGCX+?=
 =?us-ascii?Q?glUj+oJtUGwWPIIFacV9N+64RrNELNUC2SVSQhH116bZaJX+Tbw7Puk+nMFX?=
 =?us-ascii?Q?IMgmyrsLsOjmyreHVHKY6Z5EGR/L2kCjcV6E4WPiskGc4wC+yDiVQFI//IWM?=
 =?us-ascii?Q?o0kVj5euhNcFVRurYDtUKxCnnIVGg0oGJNKSqDsVou8YILQlbA62SWxnRl1h?=
 =?us-ascii?Q?L3ykZKX3VZH+N1yGQFAPeTSukeWvCWSGyPdgPRLV9ZUY+pxUKuqjFapGCILT?=
 =?us-ascii?Q?5DE8IVqkOwKsmt/WdoHnAh5CsGAj3GkBSvACxSoY5+w52z+WEFgco4Ypdj/X?=
 =?us-ascii?Q?T2eiYdIp6XAHxGVzKK6jdVRpKIgDJ1Q4pnrim3PBU/+eKP1miZrLLjfLpCRy?=
 =?us-ascii?Q?jPCSz+pnbSZpJ5S7vJIqfT113MQtc3DAempqNNfdixyjY+Vl6ZxVK/aS/6mv?=
 =?us-ascii?Q?HNHLFoldKUei4kWKKZWkoQZ/42Lm9/MMKvBWGpwoZJq+h+JTEIDSv2oPr3Kr?=
 =?us-ascii?Q?PVgDf6ZkHKq/UTkfoDY/K7AV/E6hRlYnKpYCq7SFu7sgA8Hd4sloSS4WtDDK?=
 =?us-ascii?Q?DuRuUI3wYFx66/67OkjF7vSDeVgQAPAqD4ICXr0fllKhQrdTiCh/E4Y1EDcU?=
 =?us-ascii?Q?q3drGlFm//ZXokweDTyLEnPJtiPISxgfF3vq37dRikE8hlOGiz9KQF/UlzXu?=
 =?us-ascii?Q?0sgIg+IgHulynk/IJIqoKTj48KACLB+h/ENPavZp5DkElwzlIxchf7iK7rOy?=
 =?us-ascii?Q?GBBQUzGANbwd823CEn+SzdoudeOPO6N21QIJ89zOVedDe1K2nX55w26q7hE6?=
 =?us-ascii?Q?KwtDWUNnsFWAzgltxbPMzeWHNEMKt6xozEqhaNrsyZy96ahnCsx3NFIpx9X8?=
 =?us-ascii?Q?TYfzV7yBQZNWxMNwI/mRFSMgjnv4ko/1v4cVqFFRTvODiZNypuIVqmCMbQPM?=
 =?us-ascii?Q?lcmhL3QlaBAqeMW0iQ/v9pABMJ7LrWzS0sObiXaVIdDL0xjb4l/XtJH9WzPZ?=
 =?us-ascii?Q?DC/LnPXBa5rmUkwisv9mCsDfY1mjRjzJYt9ezU/LFtDa67qeCCkTuR1zzhBO?=
 =?us-ascii?Q?XOevmO+bSueFRgxuTja+YBBxV1o9mfv+4E6rb+lr91T8+swjaHRN2za2YAh5?=
 =?us-ascii?Q?bJYqgbNbqIyz1szMyubEIyxWG+ITqtMMDPU9HnUyK9Vw1MTtphoFuawbmaS3?=
 =?us-ascii?Q?MTMpumzA0RiBaPbVwPX1eP7LVVqFMWQmXrqOzWur+DuTydW/J9+W80hxqU9i?=
 =?us-ascii?Q?iVCqC8C9u2ehGVg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lntIUIIIM8YaoKMjNojp8qbRsdeaisr8CNgtqBkCOWGF9HyVtF41AJLE2emc?=
 =?us-ascii?Q?DpKMmDO+cf4ZE9rHgeN+UcXtek/JJwmYYdCvPsKtpq8kfZgXfeWaWOeWo3zw?=
 =?us-ascii?Q?S9KiAt2enNzs4AH5joFgiPr6aeSxorNGsM80ShlxOaht8RofMLvoUkjCd6i6?=
 =?us-ascii?Q?VgBYJyA6RQDYy4RDUz+TsG08vt0pTZvhhnHZUsg5jbGaePDfozagEIYKw7h/?=
 =?us-ascii?Q?pcDOQOVjhco1pVuh6pdrY8OIbMtwyfSuG4uPxj7hgL3R49OvTB0KSVPI+ANV?=
 =?us-ascii?Q?MTQ0VHaRjFcGlA4PbMkHTj6rCcdE86g4dE4mXhWvEMDFG89QZGZX/kTYdqTQ?=
 =?us-ascii?Q?3JWKyfRymOxD+Ie/Z+lrhHApaIWXPeU6hFu3k+rXm1JV7EYYOxzPOWhzaxOd?=
 =?us-ascii?Q?dAxHcirMseYyQsdPN7J5rGpsnGZjggp8CIJJvWHAUmfEYf0zkwie8Tchhm/q?=
 =?us-ascii?Q?pAZsgcE8mx/cz3mIV0jfp414jsDe40UarryyDAiu30HJ/ByVz57DtYSRxpBD?=
 =?us-ascii?Q?r9jEw/eKmaGwYrV8hCD21mAiV3bTLN8vf3uB59bTlyi24g1oNCdX931nlPkp?=
 =?us-ascii?Q?UQ/lCw/AwnIIUtpt7L19ye1Apwjrl9w75rePQpqN6CrmErbMZWq+0uAeWtVB?=
 =?us-ascii?Q?/9r3HskSr2ahsawZF646LJyu7q2L3lO8eNXzO+37f8ZaKsG065fwEDK3Ke64?=
 =?us-ascii?Q?TjsWEXQFUzPiVAbrJk5iS38UGQBRt13RdBOwFJOAuvSR0qX3BqOQnGWkU7Xy?=
 =?us-ascii?Q?co6jdrbVN4OmgRQQn4Y6hVNmh2TN+lxfg7HjuZfU9pRIrbWvdVFMfhwDt9Op?=
 =?us-ascii?Q?Utlcmyk52iK5LLutG6E/zlrrRIAwQz0JI9ukVl6H2rwDTKWN5ti+zsRmqA+/?=
 =?us-ascii?Q?lcFqq+obhLgfPwScHx4+wNYocRGFE46i4NC/efaTkPTC+HC2SItnAGdz1utG?=
 =?us-ascii?Q?tC4Rn4MIQE8MF5jaE9BjlzuerWyUgciRouhM8ImiwBVDbHDbAxKBv9omNfzn?=
 =?us-ascii?Q?1SH/Cr7L+WrhePDkKtSCSxaVI7qZdkpGj5naJOmh7Lws/PyASJ6paHGPj0KF?=
 =?us-ascii?Q?viY6Ac9PWqWZKdLAhojo5+2jXDAss4S/juEji5SBzsBCMzIN+7QKRLt75utl?=
 =?us-ascii?Q?cldFyRjwWn69DQkzPii6PQELkGWAeAx0WuZ+WjLrBdtim9UK3c8841LdHCsx?=
 =?us-ascii?Q?b/9GlpX8xLSzQiFUCDp8wb8lblQqAMCWbpJnNmPGNS3N4yJTKcFTiplOnXOb?=
 =?us-ascii?Q?nb5QWwa0625b2DnscCFE5/6hRO41U8CuctT+YV8XMimg7obeVYBtz+19Jm88?=
 =?us-ascii?Q?86MohdAQ1uXKLJk4qloaPS829uAP8wppillqFF37Xs98Lp74gLuPR3VYOOZC?=
 =?us-ascii?Q?Frw7OLXAGw8EfJuWIdQz/L7xLm4er3SAQbCD6KEHIutd1SIQNv9auYblp3wc?=
 =?us-ascii?Q?CjXRiW+kQQDZZIY/Pkpydtt42lyvboumjCHrFaJx68gO2rrnEvzHsr9sw1UK?=
 =?us-ascii?Q?geJbVPS3T6OD0HDwl/cPBpcghC+sbGGtflyEmAp3FjMiB3Q0QXRZuT2JcaTM?=
 =?us-ascii?Q?OtuD3wieZz2nvo5zr+tBhM9NRaVkabAskE1qYVTv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315de1a7-d1da-4cf7-9593-08ddb2da3bb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 04:47:33.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxiYdk+xzphLBNKdJkCD6X9cA7k67VHonKcslP432ydcAfqAI6z3mmzmnKXixPUE1nEAA9H7ElR1tmrN9C8Yog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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
> Sent: Friday, June 20, 2025 12:05 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; nouveau@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v3 11/13] drm/i915/backlight: Use drm helper to initializ=
e edp
> backlight
>=20
> Now that drm_edp_backlight init has been modified to take into account th=
e
> setup of lumininace based brightness manipulation we can just use that.
>=20
> --v2
> -Fix commit message [Arun]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 98 +++++++++----------
>  1 file changed, 48 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 800d07c7f041..117c762fa2fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -584,9 +584,37 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  	u8 current_mode;
>  	int ret;
>=20
> -	if (panel->backlight.edp.vesa.luminance_control_support) {
> +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> +				     luminance_range->max_luminance,
> +				     panel->vbt.backlight.pwm_freq_hz,
> +				     intel_dp->edp_dpcd, &current_level,
> &current_mode,
> +				     false);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> controlled through %s\n",
> +		    connector->base.base.id, connector->base.name,
> +		    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_enable));
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled
> through %s\n",
> +		    connector->base.base.id, connector->base.name,
> +		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
> +
Can these both debug prints be combined?

With the above change
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------
> +	if (!panel->backlight.edp.vesa.info.aux_set ||
> +	    !panel->backlight.edp.vesa.info.aux_enable) {
> +		ret =3D panel->backlight.pwm_funcs->setup(connector, pipe);
> +		if (ret < 0) {
> +			drm_err(display->drm,
> +				"[CONNECTOR:%d:%s] Failed to setup PWM
> backlight controls for eDP backlight: %d\n",
> +				connector->base.base.id, connector-
> >base.name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (panel->backlight.edp.vesa.info.luminance_set) {
>  		if (luminance_range->max_luminance) {
> -			panel->backlight.max =3D luminance_range-
> >max_luminance;
> +			panel->backlight.max =3D panel-
> >backlight.edp.vesa.info.max;
>  			panel->backlight.min =3D luminance_range-
> >min_luminance;
>  		} else {
>  			panel->backlight.max =3D 512;
> @@ -597,56 +625,26 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  		drm_dbg_kms(display->drm,
>  			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level
> is controlled through DPCD\n",
>  			    connector->base.base.id, connector->base.name);
> -	} else {
> -		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> -					     luminance_range->max_luminance,
> -					     panel->vbt.backlight.pwm_freq_hz,
> -					     intel_dp->edp_dpcd,
> &current_level, &current_mode,
> -					     false);
> -		if (ret < 0)
> -			return ret;
> -
> -		drm_dbg_kms(display->drm,
> -			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> controlled through %s\n",
> -			    connector->base.base.id, connector->base.name,
> -			    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_enable));
> -		drm_dbg_kms(display->drm,
> -			    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> controlled through %s\n",
> -			    connector->base.base.id, connector->base.name,
> -			    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_set));
> -
> -		if (!panel->backlight.edp.vesa.info.aux_set ||
> -		    !panel->backlight.edp.vesa.info.aux_enable) {
> -			ret =3D panel->backlight.pwm_funcs->setup(connector,
> pipe);
> -			if (ret < 0) {
> -				drm_err(display->drm,
> -					"[CONNECTOR:%d:%s] Failed to setup
> PWM backlight controls for eDP backlight: %d\n",
> -					connector->base.base.id, connector-
> >base.name, ret);
> -				return ret;
> -			}
> +	} else if (panel->backlight.edp.vesa.info.aux_set) {
> +		panel->backlight.max =3D panel->backlight.edp.vesa.info.max;
> +		panel->backlight.min =3D 0;
> +		if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +			panel->backlight.level =3D current_level;
> +			panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> +		} else {
> +			panel->backlight.level =3D panel->backlight.max;
> +			panel->backlight.enabled =3D false;
>  		}
> -
> -		if (panel->backlight.edp.vesa.info.aux_set) {
> -			panel->backlight.max =3D panel-
> >backlight.edp.vesa.info.max;
> -			panel->backlight.min =3D 0;
> -			if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> -				panel->backlight.level =3D current_level;
> -				panel->backlight.enabled =3D panel-
> >backlight.level !=3D 0;
> -			} else {
> -				panel->backlight.level =3D panel->backlight.max;
> -				panel->backlight.enabled =3D false;
> -			}
> +	} else {
> +		panel->backlight.max =3D panel->backlight.pwm_level_max;
> +		panel->backlight.min =3D panel->backlight.pwm_level_min;
> +		if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> +			panel->backlight.level =3D
> +				panel->backlight.pwm_funcs->get(connector,
> pipe);
> +			panel->backlight.enabled =3D panel-
> >backlight.pwm_enabled;
>  		} else {
> -			panel->backlight.max =3D panel-
> >backlight.pwm_level_max;
> -			panel->backlight.min =3D panel-
> >backlight.pwm_level_min;
> -			if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> -				panel->backlight.level =3D
> -					panel->backlight.pwm_funcs-
> >get(connector, pipe);
> -				panel->backlight.enabled =3D panel-
> >backlight.pwm_enabled;
> -			} else {
> -				panel->backlight.level =3D panel->backlight.max;
> -				panel->backlight.enabled =3D false;
> -			}
> +			panel->backlight.level =3D panel->backlight.max;
> +			panel->backlight.enabled =3D false;
>  		}
>  	}
>=20
> --
> 2.34.1

