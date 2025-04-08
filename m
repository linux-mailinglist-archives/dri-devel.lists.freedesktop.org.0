Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26AA7F52F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 08:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3604E10E5D4;
	Tue,  8 Apr 2025 06:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AysTYOZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB410E5D4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744094845; x=1775630845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A4XRVviDYTmubEoWL9/jZXQB10sJHBjnjLXdLyklOXA=;
 b=AysTYOZ0FyM9nVFUJxnyTaH2I1kPIzGTrNPH/3e/5kQX17RTdfGxjHD5
 LkfI7oPCBuzFtXd+AuYgHpwKV19LcqW0PakxWjKgTITIA1/+tLZLKypPh
 xWh5o3n5QwHEuZYu0h5FjSyOdI0yUz9NOXQ11EAhxNc1QmJ5yWKWoWLV4
 xOtae9jOBfj1kzrzs7JkVQxFit4H4Jxs+ZObbpL93Znrm2ieOkG1mgfG6
 KreRPBmnjz1RGXHCRqVMzmFdkmHJvhIcwzxrjzYTpsDMdpQPHOI61NCEW
 mTlgOW162Iu66WMKUggCuXedRtuTkQUVloaokXqsWx6LONcMbcyO2Y3eS Q==;
X-CSE-ConnectionGUID: RaUQCpQQRRO8Qz+3n4FHFA==
X-CSE-MsgGUID: jD3Czp/LTn6cQmcHtQ4MCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44653268"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="44653268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 23:47:24 -0700
X-CSE-ConnectionGUID: HOjmvWhsQ+qFuXQwZ2aiDg==
X-CSE-MsgGUID: 7hKi2d5mQW2KlN2gIRRRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="159168769"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 23:47:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 7 Apr 2025 23:47:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 23:47:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 23:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6dYwRDOG6kbNkJGoMMHcjgZAF3qCuuQhr8zoB8zZS12DJQ6+FA8Np/lEKqiG1XEREKyWZH6NLlg7cerKkWX1J0z7PPwJ8SDDO/1dY9pOKds2aaJGf3wJGkABcaafwsdpHAZu8d3nBv3alH0IbnWlePNwqGXOdpZ8XrH90N/dMVU1kS/eCBSWW5Z8usaFx3f9zwsPJKGc3d1vARxhp/M3iT/22MFyaPrQPT766/L3TVKBDrDHOD2ZnpZvZnBpSOyPagFbfKqlYnCB9Cs3btgLcnLFqWAzxg+woEUKWDNxqgq9zW1P/mWC3nk0b4tsxpbMvR55M+iwy37mB0CZ3IvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcctkCKKz65V0Buy1Nf3Kqh5lGGV9Iq39JzUPwxI19E=;
 b=r+LDXigfOuwx4L9VQOn/c/4kY0lugg5l0oA7N4C47bDzXMcEIuIupyPb88sX0byhIMqYSBcxSUto3GcJyQ+CYKwTGJTJeGdLfMnnfJ38pUqyPOaVMnHUeiqF6Q4GLDt1layGnMinbv9dMfrDap2D2YjFiuSYouXfWano2EgqW8EQBAvl0IkLZ8O3WHeJa+pqfEjM+/9rXS/aImQ9KGcOJ0KVydSdi6TfDGSte/2BE50zAniPWpmm2e3NVzWFeqjhPIhGXUJPTFvyeVN9SGaPlvnGW30g+XbC/wAyhRflEZp9jdcY21WpVVyN4bjdpOmliRSTbWRQBlPO9GtNaaA53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 06:47:07 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 06:47:07 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Anusha Srivatsa
 <asrivats@redhat.com>
CC: "Deak, Imre" <imre.deak@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Linus Walleij
 <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson
 <dianders@chromium.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Thread-Topic: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Thread-Index: AQHboyhWVpiK92KDl0qJgKPM4BrFCLOYYvOAgAB+pQCAAA+RgIAAFusAgAAnWICAAC1owA==
Date: Tue, 8 Apr 2025 06:47:06 +0000
Message-ID: <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
In-Reply-To: <854iyzs3na.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8701:EE_
x-ms-office365-filtering-correlation-id: e7a71c8a-120f-4f38-44ec-08dd76692dea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-7?Q?uBfygLkdjiJ8rq3XWvkoDbW0GmKoUy+9+Rr9sDB3pDVzCd9C3u11zN1cDo?=
 =?iso-8859-7?Q?JNIcmreR10MD85uLixbntgnVDpRc6C9T9RnKjPoX2pVgF84jFDXA7FUxOd?=
 =?iso-8859-7?Q?r/88yuhA1O3pUIrKb1VK0SdgozctDABHiFdTwCxVeNiH09l23uzgcZUOwq?=
 =?iso-8859-7?Q?lZTeadsDbYu7QJRFNFP3jXQ7ZN0DCKqcbJ3C10zZoB/jWb3eQfP66Sxdrm?=
 =?iso-8859-7?Q?ayIefGSHzMfXGT5WSmQkj8Z05ovYG+JpyEhwMzX8UOQCMymeLHU7CSkFrO?=
 =?iso-8859-7?Q?Fstjz6e1D4+k9ine4JB2iMwsCTSsa8YZP0Iheh73GibhbWzZNx9n4tKZUX?=
 =?iso-8859-7?Q?c4uxe3yY2GjbFlMfDuOPkRukMJ/JQSUBiGfNaEbSb6KD5JYdB49SphvE66?=
 =?iso-8859-7?Q?o4R0XGLeqEo/0TRxqqiLdIizDHUcdXRql61tHMDeqkAr7M8eC+S5XhX2+d?=
 =?iso-8859-7?Q?N3/xJprXRmVv7cDYtvlDuBUbMEbbGTO794Oew/ID9VgxokyfQhZ7ZGm54b?=
 =?iso-8859-7?Q?YN5cOf6fICJPwEg0KKMOzKcI+R4bgknZJZ8jyoD68SmxeHQfRRfZHK4QMi?=
 =?iso-8859-7?Q?v+ghzowQG5RrzDWBNQqCybFCJLwNw63ZrCwQkF4LMwdBf/QkpUZqFynNt/?=
 =?iso-8859-7?Q?+TZyyVsV+GEOdo6SBYU2nYkh9QU5JXAqEj+vD8mWVQ5irq3EkAJpC7y6/1?=
 =?iso-8859-7?Q?nUPJjokbPUv3RIZqrS8w+YvWpEXUZd9LMlQ/tqngLwp768K8oNNXSr8JcA?=
 =?iso-8859-7?Q?OZyKrGxY2iKVF+dBkDY/3qtGkQIaob+SOx5ArlayZaMHcUHuPMgXPynalt?=
 =?iso-8859-7?Q?j4/kniiHtkYhtgBWF17m04ItGJ3bbnJHtzkssojAhP+ePZ+AgrJ/sXN9Ps?=
 =?iso-8859-7?Q?XjvmgsmX9yfWKzDPcRB8op3wnsinagrVhEKWQa/rw1YF0EyfEYMKrqRVSC?=
 =?iso-8859-7?Q?06SXMMIA+5nTxgbpJc+058NLYC79kAth53XBACj5KRTMSg7/3XTHK8XGyn?=
 =?iso-8859-7?Q?6Wj3no8nxBcV8DGa8lOp6v/c2kVfyRUVXxJMYNWHxGKGZYaM6f3RbcRcQf?=
 =?iso-8859-7?Q?SdEmQf1J+wNnU5yLvAo+T0Ek0exVwF1s3FL7G1AmfvBPQhdIURzWDkqp2U?=
 =?iso-8859-7?Q?tF5heI1B+7W/cANur7MU4qaVabNPZCKLOwRo3TBSthjLDNgeXlYH9O5GVu?=
 =?iso-8859-7?Q?dEzFoNLtHKKTLKkVdbCXI5G5sbngaCeC0f9TLCW6tl9nu8uv5LgPmZw2m7?=
 =?iso-8859-7?Q?ojtbMrLLX6zDt1comu15BiM2/GCUxpJhdaAMYiDsYpv9mZVxZ7heOVm+5a?=
 =?iso-8859-7?Q?fKGBA3aprEH0Cup0MuRkpiXrekt0XkAkbWZxzb8XjEZF3zbePGGY30LkrH?=
 =?iso-8859-7?Q?8gMgcimEiPSfFNZAw5trbf/zS3BPz1efBLdlrw4ghxT6S6/F/1QInt2H7M?=
 =?iso-8859-7?Q?gUQ4CruR7TAOmLy7ovUFiyzNK/3WJOoLEVLVyVRyeKo7T08Z+LtLgk6HOs?=
 =?iso-8859-7?Q?F+6WoP84EpnXidarzy8tBk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-7?Q?+yHOgpYbUS3cXVIEuHXfG5m2e6w7W3djld6YT2T7LeUO+qvnvp99PdYqrC?=
 =?iso-8859-7?Q?eoLamZXRWkCSb98Yfk76DoKNiPNHCwcyh4lc+vDEgyD164nT3cZ9mpcqw/?=
 =?iso-8859-7?Q?s9uUTHM/LU6BN46HvZ8gM0NV1z+cdx0S9TWgLC++mrfvz7VLsL71Zf9ZN0?=
 =?iso-8859-7?Q?FsLbfnPAtVfmqIdFGPQIFoI/Skmkh7dFKh70mLxrwVpb+CflQjt1KLS937?=
 =?iso-8859-7?Q?j0Zn4HyMb/JLL59uU+mf4oCAMt14iWoI/FyzGo73frmsg/RU/Ixq1sZSkS?=
 =?iso-8859-7?Q?x7m3RCu5NlAw9VtYcl5YHZwuilY5Kwum9iaVEd3q7pUCKdkr7+oM2tKa4f?=
 =?iso-8859-7?Q?vF2TP9KqzHAWODk5WVH7ct6qJCsXPGnCA+pGBN9tEwt1ge2X/iLJgqCEnS?=
 =?iso-8859-7?Q?at4SyOoWeQWpBAYafDWFAO7FMurgCFFF4SV1uwPNlcUNSxVahYsWzMA8Dq?=
 =?iso-8859-7?Q?+SAyrCSMr2ggWuDAR1gXEQd8x4eFS36Z5EJVG7+FioWEXyMUKDkKb6Wy4u?=
 =?iso-8859-7?Q?N9eS9NIuOIDI6RP8MzySduABpbSX4olYO+sQ3J+3wre6VXQCXO36YnF7Y2?=
 =?iso-8859-7?Q?FO5vcuDu3qOG/kK3MYHgcjj48oM+7JhORyDpDueHlSQVgsNIoGIfFTMgd7?=
 =?iso-8859-7?Q?HqdyEMBOw26vTJuz19CasypCYrRIKMu3BhCQ/Y7XdZe9M1i3onjRWL2MLu?=
 =?iso-8859-7?Q?+bTUVGgvqjbsPqwPu6SwPGSxRRXGoH/j7/TqvgE52A5JLqAK1ZdMj5VDyf?=
 =?iso-8859-7?Q?ClMRkSXK1BvaOZvRCY1Lb/oYWuoL5l5olTucmAW0XTdgsKKlf/Jih/StjN?=
 =?iso-8859-7?Q?JmBv/3O/cDuniywC7/UC+LrKAI4DvlAxtSEFLTwAc3+ihmqHNMDM//BRLy?=
 =?iso-8859-7?Q?nkH4AB6cvzrICoGpTtxIFyU3xZDLt5AK7EljUztAf3Ps5Kv7y7rGQC6b2I?=
 =?iso-8859-7?Q?vyrNArBuGv1br5SwnK79FfgL3bFlJwZYsbOtlCI1A1ZY659YT6EtkRrtUD?=
 =?iso-8859-7?Q?ttidIz8vYO3kO0MlappPPpF+xdHj/91ug+P2DrV86Z4tytqkGI8jpljCWo?=
 =?iso-8859-7?Q?g0ZSYNNwoyp28pnNkdnSJiMXEQf2z0G3yD89URrJ/I6D2+8vnsjHJrIhcb?=
 =?iso-8859-7?Q?jP9xTY43sy/CUxpCI69ZuRAEyyOFQ+GVL/Y5tvD2wZG9RthMc7sZS/y9Yg?=
 =?iso-8859-7?Q?BvBcCVTZ+SSAkfhSh+noeuJwUFZAf4OuWcduxIJ6NEUVdMVGDSGWZ9TUeZ?=
 =?iso-8859-7?Q?CZWIyAODWGbeXAkmioWMRQOPJQlW5XyzgPxZrQktsxYwyviRTn5eNfpiHs?=
 =?iso-8859-7?Q?vCmDYYDHNMBzYWxwCfK9Vgwhu7pTBjhrZC1XrLNRwW7ovm16pf23e9Xzhn?=
 =?iso-8859-7?Q?a85NlWBC+E2GMhJ8dZ97MWPTFQAywT5rZQEV80JNwUQDseXz1sBXrdEhJ8?=
 =?iso-8859-7?Q?orjm407DMzxNuJqC7uk42gImxFMgHNljkJ+RWq+wDdv/eg0vunkFuAycYg?=
 =?iso-8859-7?Q?3lBSRyCcKTHLSVGjbzg1BkpLZz/SIbCnXMa+/h0Z1HZdRnCLHn7isP1Jz7?=
 =?iso-8859-7?Q?qvD4pR5XyYtxRDl7f4SEzbYCYE4TC6pUs1+EEkjo2HiAmtyaCHkirev8gl?=
 =?iso-8859-7?Q?pEBT/Prsstv0+iF8rlG8XoeIXKks7SREe3koGAbiaHiYdu+Zc8QXqW4Q?=
 =?iso-8859-7?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a71c8a-120f-4f38-44ec-08dd76692dea
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 06:47:07.0080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lycEPp4JaFfaRPe9i0OIdRiaKmRc9PrDc55s/QR2Bb8f7n4ozHlpk6zcoBWBKoGkcKzwd1VjnMQwUP8pAgJAzvycCSel0lXrp4O2NO5e310=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8701
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Di=
xit,
> Ashutosh
> Sent: Tuesday, April 8, 2025 9:31 AM
> To: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Deak, Imre <imre.deak@intel.com>; Neil Armstrong
> <neil.armstrong@linaro.org>; Jessica Zhang <quic_jesszhan@quicinc.com>;
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Linus
> Walleij <linus.walleij@linaro.org>; Joel Selvaraj <jo@jsfamily.in>; Dougl=
as
> Anderson <dianders@chromium.org>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation
> in place of devm_kzalloc()
>=20
> On Mon, 07 Apr 2025 18:40:24 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 07 Apr 2025 17:18:23 -0700, Dixit, Ashutosh wrote:
> > >
> > > On Mon, 07 Apr 2025 16:22:40 -0700, Dixit, Ashutosh wrote:
> > > >
> > > > On Mon, 07 Apr 2025 08:49:23 -0700, Imre Deak wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Apr 01, 2025 at 12:03:47PM -0400, Anusha Srivatsa wrote:
> > > > > > Move to using the new API devm_drm_panel_alloc() to allocate
> > > > > > the panel.
> > > > > >
> > > > > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 10 ++++------
> > > > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > index
> > > > > >
> 77604d6a4e72c915c40575be0e47810c90b4ed71..83529b1c2bac2e29f41e
> > > > > > faf4028950214b056a95 100644
> > > > > > --- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> > > > > > @@ -200,9 +200,10 @@ static int a030jtn01_probe(struct
> > > > > > spi_device *spi)
> > > > > >
> > > > > >	spi->mode |=3D SPI_MODE_3 | SPI_3WIRE;
> > > > > >
> > > > > > -	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > > > -	if (!priv)
> > > > > > -		return -ENOMEM;
> > > > > > +	panel =3D devm_drm_panel_alloc(dev, struct a030jtn01, panel,
> > > > > > +				     &a030jtn01_funcs,
> DRM_MODE_CONNECTOR_DPI);
> > > > >
> > > > > This doesn't compile and (yet) it's pushed already to drm-tip.
> > > > >AFAIU  it's supposed to be
> > > > >	priv =3D devm_drm_panel_alloc(...);
> > > >
> > > > Yes:
> > > >
> > > > drivers/gpu/drm/panel/panel-auo-a030jtn01.c: In function
> =A1a030jtn01_probe=A2:
> > > > drivers/gpu/drm/panel/panel-auo-a030jtn01.c:203:9: error: =A1panel=
=A2
> undeclared (first use in this function)
> > > >   203 |         panel =3D devm_drm_panel_alloc(dev, struct a030jtn0=
1, panel,
> > > >       |         ^~~~~
> > > > drivers/gpu/drm/panel/panel-auo-a030jtn01.c:203:9: note: each
> > > > undeclared identifier is reported only once for each function it
> > > > appears in
> > > >
> > > > Please turn on the config options for particular module if you are
> > > > making changes to that module.
> > >
> > > Though probably, you can argue, that the pre-merge CI build should
> > > already be doing this. A sort of allmodconfig for the DRM subsystem,
> > > so that these kinds of issues don't get missed.
> >
> > More compile errors:
> >
> > I'm still getting some allmodconfig errors:
> >
> > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c: In function
> 'boe_th101mb31ig002_dsi_probe':
> > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:9: error:
> 'panel' undeclared (first use in this function)
> >   352 |         panel =3D devm_drm_panel_alloc(dev, struct panel_desc, =
panel,
> >       |         ^~~~~
> > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:9: note:
> > each undeclared identifier is reported only once for each function it a=
ppears
> in In file included from ../drivers/gpu/drm/panel/panel-boe-
> th101mb31ig002-28a.c:18:
> > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:38: error:
> 'dev' undeclared (first use in this function); did you mean 'cdev'?
> >   352 |         panel =3D devm_drm_panel_alloc(dev, struct panel_desc, =
panel,
> >       |                                      ^~~
> > ../include/drm/drm_panel.h:305:41: note: in definition of macro
> 'devm_drm_panel_alloc'
> >   305 |         ((type *)__devm_drm_panel_alloc(dev, sizeof(type), \
> >       |                                         ^~~
> > In file included from ../include/uapi/linux/posix_types.h:5,
> >                  from ../include/uapi/linux/types.h:14,
> >                  from ../include/linux/types.h:6,
> >                  from ../include/linux/math.h:5,
> >                  from ../include/linux/delay.h:12,
> >                  from ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002=
-
> 28a.c:8:
> > ../include/linux/stddef.h:16:33: error: 'struct panel_desc' has no memb=
er
> named 'panel'
> >    16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER=
)
> >       |                                 ^~~~~~~~~~~~~~~~~~
> > ../include/drm/drm_panel.h:306:41: note: in expansion of macro 'offseto=
f'
> >   306 |                                         offsetof(type, member),=
 funcs, \
> >       |                                         ^~~~~~~~
> > ../drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:17: note:
> in expansion of macro 'devm_drm_panel_alloc'
> >   352 |         panel =3D devm_drm_panel_alloc(dev, struct panel_desc, =
panel,
> >       |                 ^~~~~~~~~~~~~~~~~~~~
> >
>=20
> In case it is not clear, to reproduce and fix these, do:
>=20
> 	make -j$(nproc) allmodconfig
>=20
>=20

We will need more changes than fixing the variable names.

I get this error

ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-auo-a=
030jtn01.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956: m=
odpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2

after making the following change.

@@ -200,10 +200,10 @@ static int a030jtn01_probe(struct spi_device *spi)

        spi->mode |=3D SPI_MODE_3 | SPI_3WIRE;

-       panel =3D devm_drm_panel_alloc(dev, struct a030jtn01, panel,
+       priv =3D devm_drm_panel_alloc(dev, struct a030jtn01, panel,
                                     &a030jtn01_funcs, DRM_MODE_CONNECTOR_D=
PI);
-       if (IS_ERR(panel))
-               return PTR_ERR(panel);
+       if (IS_ERR(priv))
+               return PTR_ERR(priv);

Regards

Chaitanya

> >
> >
> >
> > >
> > >
> > > >
> > > > >
> > > > > > +	if (IS_ERR(panel))
> > > > > > +		return PTR_ERR(panel);
> > > > > >
> > > > > >	priv->spi =3D spi;
> > > > > >	spi_set_drvdata(spi, priv);
> > > > > > @@ -223,9 +224,6 @@ static int a030jtn01_probe(struct spi_devic=
e
> *spi)
> > > > > >	if (IS_ERR(priv->reset_gpio))
> > > > > >		return dev_err_probe(dev, PTR_ERR(priv-
> >reset_gpio), "Failed
> > > > > >to get reset GPIO");
> > > > > >
> > > > > > -	drm_panel_init(&priv->panel, dev, &a030jtn01_funcs,
> > > > > > -		       DRM_MODE_CONNECTOR_DPI);
> > > > > > -
> > > > > >	err =3D drm_panel_of_backlight(&priv->panel);
> > > > > >	if (err)
> > > > > >		return err;
> > > > > >
> > > > > > --
> > > > > > 2.48.1
> > > > > >
