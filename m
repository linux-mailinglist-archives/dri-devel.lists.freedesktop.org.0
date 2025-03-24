Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F2A6E5B2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBA210E4D5;
	Mon, 24 Mar 2025 21:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlYhZMlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0737E10E419;
 Mon, 24 Mar 2025 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742851907; x=1774387907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=94ofRMV4W6B7vfdcpZewxQESz/WrBbKQsd8wXNpOPk4=;
 b=UlYhZMlTMkAaVuKUdniVCWK7Q14J4fvmd6A/BvoTkIm3esChUcq/vncX
 kMmzHzyfTstZDe8p+Ep7wVKBigF2J8S9ctB/JszCPlHCdSMWOEsv8up5m
 WnMkLpP97M+O3qP/KlxBJ1JOrqa9jrf3wRdgmaTM+4pqZXbtNT8W2DfJm
 Jr1CZURYZNzZzpRs8BWLm4ot10dL71UTiMmiK3Mly8J01AaSNhmTVWXvX
 S8UXIuG8mp5ZxJF7aguNt9BxVLwrWU1wN7N7SQFTuNaKhKOPm5PVJmpjz
 PIyHwxfJ/hzWA8SLq7mecw3po0i48QFKa8jwnX1IGUQVAQSwFZZAGWHGq A==;
X-CSE-ConnectionGUID: 8Em93qV8RUSDb8OzTPAJ6w==
X-CSE-MsgGUID: wnO/gGuQShaLQnZWNHOABQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47858888"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47858888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:31:46 -0700
X-CSE-ConnectionGUID: +3GN22IkR1y5xxrJfNzIrg==
X-CSE-MsgGUID: F7WPoVHxQu+Ais9pwUGZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="123981044"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:31:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 14:31:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 14:31:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 14:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTkKRDiITfHxtzOvEGbZwl4ygYgPLLxG1dep3Nx0Ty63yGs7Zb4jLxBehZpiFZQaJ23j4axrw3eab2LRq95EjrlxOnAKerU3NTsqC3vu6phhp1xxpoLaPRkCfyBLnrKissDWOkrctDUskqyWZOpc9Ikr4y9Om2gsHU+/KgPMdFZZrDd7TYj5fOpLrrUNWa6e/+CeJMrI2kIpRnd34jAZf0hZWpNRsQMIYZDpDPKIJG4DiVjXouav7BzH2QasnT3RKYM6TIVUYJcgujXkJ9465YZ8zFtRzAQFhu2gFBY8+ss9HX7Aps8JVs1MXTA7INR9R52th0ns/IUPZ4NaNHASpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kknBS0IBtvfHipcuFEikh7HHu8yEBnafyiMHj1E8eXM=;
 b=aaAIfi2vkJ5BHP4gDumFNZ0TlIILxfSyianh0DQZ5bYEUI7o0TCwdHSR7cnoSJkrsLgLPS6PWxpsLK2cho+JoXF3t+PyReEnPV+qpK0YHjZiSf1ywjBp4Rf6XQ41rIq3U+UQDvFu/ZxSNaFGD1VxqBu6K+/P92pNCa9uqO4Gpfi5DHbTNbxRb9Nv7VWC9yo17nzPrW16QPKdCp3RrrKdWVbir8OfloJCprC7Mgorjt3nnnmzc6Y+K7z5eZ5QkzCFELk80XGQsj1ALt6/bQQs94izgRO/JFXIi/oMOrLNn0WDqR6Vl+vsPMV/5FoZGE1Flb4tNWFcwxkW/o+DNJ4Kig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 21:31:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 21:31:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbmaxz60pzmV6QPUmyocFpZL7O4LN+QOmAgAQd96CAAHRngIAAATog
Date: Mon, 24 Mar 2025 21:31:27 +0000
Message-ID: <CH0PR11MB544414B6A0B6FBD0B790CFD4E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250320152616.74587-1-jonathan.cavitt@intel.com>
 <20250320152616.74587-6-jonathan.cavitt@intel.com>
 <Z934F9fz_-d1oGiC@black.fi.intel.com>
 <CH0PR11MB5444C9D9B706616AFC314810E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z-HN3Yvci8x7JwWc@black.fi.intel.com>
In-Reply-To: <Z-HN3Yvci8x7JwWc@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5917:EE_
x-ms-office365-filtering-correlation-id: 56cb0db0-9b4a-430f-1103-08dd6b1b3bf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?c3HHY7Ly77raq6EpOFpHRvNZEGamuiILN/U8ppom2krss7/Bf+JZoJkZtUz8?=
 =?us-ascii?Q?feUEfdC6QuVdsUyNDmncaRpGe5R631yKsYAu5vkyb/GAkSdccphbtLx738r8?=
 =?us-ascii?Q?jFk7yyjNGm6QkMi0Lpfo78NMw54CTMPFWc95J68QzV5nYuojd3/Gtete7wIz?=
 =?us-ascii?Q?iLXaOWabxbENFSdCm8lJWA40f5foMGsqFgiNhz0N+yjIOufxEcZieJEo/Tjf?=
 =?us-ascii?Q?JvFoxSFcTzEX5wBlrWXxRVIXzrocBiYY0nECKz8e+yt8Zll/Y6uVq7innEK9?=
 =?us-ascii?Q?OSDDNmQxt4BP5Ojz7sA8y+xHrLdXpi14gIb+Ly3NSvZaeEDXf5uRZqNwdia9?=
 =?us-ascii?Q?AD2PH7EePfj8wvO0LHdpQrkx/WBPHZUnm8cPBd1IheIg6L20m17pXPv70q8v?=
 =?us-ascii?Q?Zpu4dyJWl7o5OgeZsvTe+uwrS5rKVAshAjg4Lfv2fpps8FlGqyKrG/3QZZYA?=
 =?us-ascii?Q?wpFhNb1JObla/pMz8qg5bphbJ9KywCmxqBlrbNi6KygWQc/klj3RfBuylSlF?=
 =?us-ascii?Q?PA+dBy/sZJFbmUyfnL5ho7gE2uFs9f6GqpN9PQEJfMLI9vdxk18ngXkLuioM?=
 =?us-ascii?Q?GS9wKNaJUzhSP3npmX1dVM1sxo2NecHkXqz4oHvA0DX8MSM3Gg7PCYQEBXDf?=
 =?us-ascii?Q?d6H/jowdo62oeR1mafBWnVuSgdFRoeqHTQPGhXpcZ0Zz+84ITDRbMP9xHb3f?=
 =?us-ascii?Q?+1vzWwTFetMMqYdfl77UZckuqIMJeiJys1185O0aF2gQxwGVEvmj18kI70zR?=
 =?us-ascii?Q?4t3WJJZy6/l6KkM6Mqt/2PGZfEUXFXevGOv13aOqCthIlVqBC6Xx1eMMkGeF?=
 =?us-ascii?Q?sWVPShEeQfc58wohRgriGweRwR+InoLs08baKDBkxMmz9Yd/OfE9UNq1q0ZO?=
 =?us-ascii?Q?FpharqLB1Y47RPHTbY3XgReljIGYGnKL6hwzmSOcHE/1JLZowd+06LPYPhIq?=
 =?us-ascii?Q?9hHjzj5IjMGZdFLlaUyxHip2D/B5L5MGKa61PzIcWBU4qJH3DBa8s2eZGd/Z?=
 =?us-ascii?Q?0rbRlNn/qqekOyaRFEE5Elu8h0OwgT2qfFxj+31VCXcnQQeQ86GeuvbNwZry?=
 =?us-ascii?Q?03KuxurQnsDAwshlu9txGLbyTD4NB3kkDWyPQho5HDS1Jrxzl+kIQSgnzDOL?=
 =?us-ascii?Q?VA55GEIb1y1yFZ58s1Re8SnO7NYxS0t+1X+oCawHx3dgFgiFEiVnqv1Uiy0Y?=
 =?us-ascii?Q?31LHKHx8us1pKYS+ZawsOCm9hCpCbLEp4AGgjbHq2r7JEyhwqs4IUTesYZLM?=
 =?us-ascii?Q?EIqtkhfTJVCmv8BP3CX+Oy9RZMG/H+ZA2XZjZe8GSWM3zXXCoSxXpUWZdmxA?=
 =?us-ascii?Q?jsU1uRhF+oaOA/AxOGUAKW6GYyuuuLfGSdvts/VOxT5XOHaoThuGQVdB06M+?=
 =?us-ascii?Q?/CQmlInUj0EcPX8XjgVfLCU1NJlcd4+vT3wc2pdeHfHo/8HHETWzoKvoZgv5?=
 =?us-ascii?Q?rFz57D8CjQJvHrANC51gBmHFsNuzYxme?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T38LC/HY+8q9DaEoCmg7dCmmMPqSP48uTqK1oaqKWPa67tTCOt1jYMnFkPDI?=
 =?us-ascii?Q?SznR6IAjXhjVsGc4sbIsBqPTbqQwzycvusnaH+hnIp6CHssCIiFq6AnQ4w+i?=
 =?us-ascii?Q?mc4jKZVSATkN/PNJ3V7On9zXoraK4zqVgSX/+5Ot5P4ZvofgR9duTSnkZjx1?=
 =?us-ascii?Q?bgWRjFfuxcyzUEAdEZCMB5HcmqjXlFkuh/UjxMHDt1IrFkmGu36/g5kTOf0Q?=
 =?us-ascii?Q?Hi7kXYDlmV3YWExcKZXcAVblKFt1+DkrVf0rIas2lZB/7Dh2Zh4Ri9me8ZDM?=
 =?us-ascii?Q?03AzyvjWIN+XZ6Qm5ScNQrAAEcSu5BHwr18VxX1lthI1wQYuLD8utSBcrDDF?=
 =?us-ascii?Q?vNU9AFkSo9DyP93XJVwZTSTW3OpsCBXHFKM0kxq1XOStctnyr7LNcOjXwFMN?=
 =?us-ascii?Q?mVl+UUgrSH4eqp8WFBC7BQEfZwHtDL62EBABLnFLUaG53tQB/YQX3mjq1Odn?=
 =?us-ascii?Q?HaNOO/nX8+PlKlvEizRtRcm0jTWgVX+o0/aC0aeWYF7uV5PMvicq+sFzjjaC?=
 =?us-ascii?Q?xaZleGa5ta+bPzx0hsM8otDAmeBk+mHIxBnf5YKO+GbY0QKDSAMdldNjFChV?=
 =?us-ascii?Q?TdAFZnuGel1tlFZN114QAiCMQmlmcUguQoNi7CVOc9GSK5z65zjZFev0JITr?=
 =?us-ascii?Q?evFc7VTLFRwBDkOD3K9rUSHoZy7RmgMkHU2VbKZcGle/eIiTxn07JY1VRmRr?=
 =?us-ascii?Q?IZnzONeQPY4B0c5ssL7PSyaQROslMBkiW8/IsxBfn14RWV8XVzvvb9vjWQv9?=
 =?us-ascii?Q?swp9Pd1b7q9XWQwdRQT2MxWHGjX04bE4CcbESPXsCAeTm6TgfKJmmZA0aMda?=
 =?us-ascii?Q?oy4SrOJq2enn/v5sbffytrmQZRureJdNvB7UZzg9NpHba7pUffjAmfuD6M0E?=
 =?us-ascii?Q?TzL3osRAy3B8AqvJRMowgspz9hSKje8He7Z6EO4c2u222cg6jnHFhQSernds?=
 =?us-ascii?Q?nAN1rVXY1S1NSeUzRWpD6IADnbvjeigdnmTs29ofOcOxXiUgZUvVKtanVFty?=
 =?us-ascii?Q?joA2cGc04v+SUTg7idY8lXU7NQlrX1lyxFVYdfmtQI9ac3oc82iFHyeqT0+m?=
 =?us-ascii?Q?vKYFE3g0gI4jqnGjis1ai3gZ/rmla+Li675F13awv1QV3pQr19os3XEiTQvR?=
 =?us-ascii?Q?K7/Cg666lSbojVr3I1Nf2Y7CB6ALcYmYWDhrgf261AnFgoRtiXgq1ljsFBnY?=
 =?us-ascii?Q?OICOFQThDP5XidLWuZbrDNu/aa3IlGUrdZUx+60uXad+wCoXECfdw+0V59Xw?=
 =?us-ascii?Q?wF9s3fXlPTMRl1G4K0yBtWEMdB16tRklCBNP0YvHPisA4wq5MBzgUXE0rEAY?=
 =?us-ascii?Q?LVfJxsFVKy0B83gFYXRaYiu1l2vsuLexad0oPp+tWneqwamTXDwuveICF8UD?=
 =?us-ascii?Q?iD/Q+pm3TZDSLccDJEJuBRLMcFyItUqHc3TONnJyg+lhvS7h8AtIPblnaNlg?=
 =?us-ascii?Q?EHC64JTfGnE8eMZUTOBztG1AvsyN9ia+mY4/aQkyPBG87nZIDdGPemG6tsqN?=
 =?us-ascii?Q?C6hGzLGGXRmfq9xrwPmSeQZa08+nO+LsaF0cblaT4OgaLhuBLGscmTB3/6ku?=
 =?us-ascii?Q?I3jr9KteSBz/5LSNLdKSBd6FzeUxjDlKhs0HVud2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cb0db0-9b4a-430f-1103-08dd6b1b3bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 21:31:27.0284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re4ksEcekkHDVqXAmnma5EO/Tk57g/7ukXXrFXrrOsmGyY3CnoO1d62SOqKHd9DQw0jlsqjMiQiLdhQCN8MgRuBPr8dHVVbahJldAQO5KUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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
From: Jadav, Raag <raag.jadav@intel.com>=20
Sent: Monday, March 24, 2025 2:26 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>
Subject: Re: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> On Mon, Mar 24, 2025 at 10:27:08PM +0530, Cavitt, Jonathan wrote:
> > From: Jadav, Raag <raag.jadav@intel.com>=20
> > > On Thu, Mar 20, 2025 at 03:26:15PM +0000, Jonathan Cavitt wrote:
> > > > Add support for userspace to request a list of observed faults
> > > > from a specified VM.
> > >=20
> > > ...
> > >=20
> > > > +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> > > > +{
> > > > +	int size =3D -EINVAL;
> > >=20
> > > Mixing size and error codes is usually received with mixed feelings.
> > >=20
> > > > +
> > > > +	switch (property) {
> > > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > > +		spin_lock(&vm->faults.lock);
> > > > +		size =3D vm->faults.len * sizeof(struct xe_vm_fault);
> > >=20
> > > size_mul() and,
> > > [1] perhaps fill it up into the pointer passed by the caller here?
> >=20
> > "The pointer passed by the caller".  You mean the args pointer?
> >=20
> > We'd still need to check that the args->size value is empty here before=
 overwriting
> > it, and we'd also still need to return the size to the ioctl so we can =
verify it's
> > acceptable later in xe_vm_get_property_verify_size.
> >=20
> > Unless you want to merge those two processes together into here?
>=20
> The semantics are a bit fuzzy to me. Why do we have a single ioctl for
> two different processes? Shouldn't they be handled separately?

No.  Sorry.  Let me clarify.
"two different processes" =3D getting the size + verifying the size.
-Jonathan Cavitt

>=20
> Raag
>=20
