Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5DAE1341
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343D010EAE4;
	Fri, 20 Jun 2025 05:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBRxbvAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE33510EADE;
 Fri, 20 Jun 2025 05:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750398276; x=1781934276;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0tIREWkSzzKHqv9dhT+5XZZ8EG2WTMJIPOdCe7IP9zk=;
 b=OBRxbvAM0N0gepEs+0LBM1NV4K7OfonR/q0qZ8o1TRulIwmDGwkia+Zr
 4tMK1GW+8avCprNbYd4azXy5qb38/cyxHHRzNrIAZMIHAe+o5ovexhT53
 t52UOjprUsqM91hyMsoInFVpZp253cu9hxTID0eUMKb5mBKBXs74r4Q0K
 0l6wUC3YzayWCqEq4rk4W7+Bq+Ax+qZcdUtk1jyCJ8LoiZtRV69LP0ac/
 zG6Df9yyDKFdr9ZcQeLJB1H0I1JYQVg2qDChaYln7wg9mrsSDDUolulfV
 mk0RO8E+vri684E7yBHNwPhoasBAbZP1zvNyOGYczgBHcg6CxokhSJOrn A==;
X-CSE-ConnectionGUID: IHfKnV3RSIiJBKr4Akt/gg==
X-CSE-MsgGUID: fTO87pXQSj2aK6UtPY7BKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62919005"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="62919005"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:44:36 -0700
X-CSE-ConnectionGUID: euVI0uSySEWO4VAHIQkYoA==
X-CSE-MsgGUID: uQre7gNgSZC7tD1s5OOMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="150625445"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:44:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:44:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:44:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:44:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvPocAq7t++Gw1PdRfC+JE4mugpLpAMAxCE4jnKW5r5Q/VFsyigObh2gJPlR3VbdfXZC3jhtN9Da0DET80ETAr7QWxYavTgI8VlWt2qXZoTX2K8ymUGpJ/EeSnFX/t1xdTPhH2VopZLLMKolecyAnAUJsV6KMI3BPMJgGj3fsmSm75GBY+yWEyjtQeoeB4HyDPl/LEm7ntDI7IIVX6HN8lbEJnsGlYKX6BEz+4qcDQUkPXjNXHCxunpnVfJI2EeoZLOp0Gy7YOWfaR+fJ8yxVzj9miaYCpSZUexXSgqzOSX0ENa4G9veCEbBeQ99r+X08aQ+hWPTqxEXjqSMp2j6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYanyv7LqTAwROQili9Enn7eqKHGIFSZUMdjcEpOCoc=;
 b=zKQEOFg3479DnGSjW58DlzadoATYBsC9m6t1baviP5bk1xvSP/l0glAUoLtr1uy16prDdNGy+x/3/Mnc8QHCmk4BmCLXebzgT6WYz5wdfIuPtbo+zZww3nxksmr9Ox1HkiaZfz6RkZ8ipgmbcU3vjy7XMP3yo2iBBxLwUqXBOYD0hbxdVpGtKb5hm56OnN8tAc7zAu3kwU3fijp2yUeXAF6RxKZg22CrjQl1r8HhRuI5lzgVWd/dP8AmiT8iD8FtxMF0v9KqZjcwq34h2lRXYT0zjqIDKSN9AyaTWS4Q9S6HMRmueSmOLBwP0mvpiW5S7sLlm1DbNKIwMZBhG6VJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Fri, 20 Jun 2025 05:44:19 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 05:44:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 08/13] drm/dp: Modify drm_edp_backlight_set_level
Thread-Topic: [PATCH 08/13] drm/dp: Modify drm_edp_backlight_set_level
Thread-Index: AQHbwKHmzDQxHb7h9Eq39pE8Orlo5LQLyykg
Date: Fri, 20 Jun 2025 05:44:19 +0000
Message-ID: <IA0PR11MB73074CDD0B89754E21242FADBA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250509051816.1244486-1-suraj.kandpal@intel.com>
 <20250509051816.1244486-9-suraj.kandpal@intel.com>
In-Reply-To: <20250509051816.1244486-9-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6431:EE_
x-ms-office365-filtering-correlation-id: 79b5949f-1837-4f71-201e-08ddafbd804d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qhUI8MA2F5owplyopYCilM21CzjgXZ8ZGju46Po5eaVD1aT00vgxoWF6XokH?=
 =?us-ascii?Q?yMjzMZBAtdiw4zNUgf+Q9Be4WExEoSy93DVTD5tRzf5dI62MQT+W7lr6RxvJ?=
 =?us-ascii?Q?pwOSqZi/acdW96WhFXHNe6z+irBKQ/U/MGb5TbXvAFP73g1FcFKIKCypJGu0?=
 =?us-ascii?Q?NE8a/7OTHDxDWVvwuedlJ4IhgGzyqtoAkM9Z1r3iWbV4Qlofdy/1UCo3jR0D?=
 =?us-ascii?Q?mRDOLoX+k6oMRjAFBjezJJiGgG1JX8NIoMOgkY//yYNkSQ9DFU53HpyHZps/?=
 =?us-ascii?Q?o+Tz7vW6Qu8OhpJF0Y3O037PPX862mQmyeHTc+8Q5FLFBwxjVLCENEMls3AL?=
 =?us-ascii?Q?4ZBV+JNPE6UovM3LCcedIXefqIoz4BEkbYoKrPBtQKsOxyx/gN0MbjXl2707?=
 =?us-ascii?Q?qlSZNNVHf7Wm/nbQ6OOnVnR0Ff6Ph0zXSRc7F7RnghQRJhOIs7naM6D83xO5?=
 =?us-ascii?Q?Z8KfUoK7RRpWmar8Ddh3cKCgyCmXsK8232DUEHMiIYNR1L6iLT/RUdIorF/l?=
 =?us-ascii?Q?u5+VvPpFISzF1miCwPSPiFCJztRPTRKeX+g8BQgYe37D7aGThIr/YsvTxeUF?=
 =?us-ascii?Q?KmDbTsFJZ9vDoHJEF0oOfoOfYBGL3obpwmIJvFybzFi7xPRFoXT/2u02tNBa?=
 =?us-ascii?Q?QRObFavUdo7USbbolClTemnglQxFxQudlx9yX207oaWgAtXClmD/ZUFdn7vx?=
 =?us-ascii?Q?TQ3KQr4aMOYqyuIKog7aOwMkdCLvOo6DL8m9kgPYwC8URfOWwLNquDBKHjWY?=
 =?us-ascii?Q?hYEIoVLBgx0aJcqX9c34t/LtW6FeyK5GL6RqbKq2wUcDyjJxbhdqbkmXMD7g?=
 =?us-ascii?Q?x/Npelz8GLU3XT3zOH3ECWCwuKLQRA3Z7Ll2YhQjhioG/b77THO0MniwNB98?=
 =?us-ascii?Q?w9LIYJ13hemVEZxPffdN2pJiHNzTwApQ8y3YNOGWg5E5PQCp3OgUX4Nh+uXl?=
 =?us-ascii?Q?d4v1ShilcREn7xxR55/l7BzK1ao2zmU/I2vi9RrVB9h7HeEiXjA+eGnCHQ7y?=
 =?us-ascii?Q?ZyR/9MWlZ2pHihYb4+wHiQrLPqTuZV9A73DxDv6ftbJv3uaHYhCIVhRXg0+J?=
 =?us-ascii?Q?O3tEpclUVIBioJ7bgysIb9F/6tDiONM/TX8Q/VufzkElkJnKh4i46G0KdeTE?=
 =?us-ascii?Q?lvPTsrrUvzwBGdyHBrIEy4zyDsNvw32GlXUPBeszF/tuog3x5cr1yfk2oucy?=
 =?us-ascii?Q?5SVJTHboTNupAskimX3evhLYcHAAZuy51yVAbiA96sZQBPwK1h7YGiMSkgMA?=
 =?us-ascii?Q?gJ9/Gpa7koitVEvVg9J6Ac/YyEwcymj91ROn16SoZjJ0CtzYZjZobzBLyzYl?=
 =?us-ascii?Q?TOSV2VHPDMuqPqz6tE8wDSqxE6HuFfgkVdcuaU9cGELXTTrQf7M8pWmweBe6?=
 =?us-ascii?Q?NNvijlmc/OS0VxeLHyMLgQCiQrTWTVnx327Y/SUIJq5XVZv6kjSlKcWK2vow?=
 =?us-ascii?Q?jUkDjF/23YOHCLcL5S/modPgaUmuqmtmrMb/rDz3/BJVW1v2x/Joyg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?luv7R8sa8TtXcTS9boLKDvxwPqJ39HJHsKOMe5jLHl43SH3aeF7BNpMHwPGT?=
 =?us-ascii?Q?0tjOvIv/Fde2bodrjikq6EfZkC3D6+baYr00zo2DmQ02iJBCZSSkYdKYIO9/?=
 =?us-ascii?Q?G05zavu/pLsXy6Hj6/7w1bm8M77QUFxzQ5OkIDJwlQbgO/WdhXJp+oK79n5X?=
 =?us-ascii?Q?9qRTRHWpnh9B0GJS2Bldhod1V3fZqFKH+2LoBOi51adDT9RV+qOY4ymPQvne?=
 =?us-ascii?Q?d853Uiuc289UlLbpYRiqQiMWXIZdj6D7ACnippca5UvOD6W/lQDziymz124p?=
 =?us-ascii?Q?gI1pkDkImbITfvkVP8PkTlo1Z8iEuPL91OANxpCTXsYl/4ObmBfTfDNKJPPP?=
 =?us-ascii?Q?5agwm8seNqhv8Rf7O9kUo9PqzCe1L/e/qDzLE162wsfc1hnJtz2v9tieBIjL?=
 =?us-ascii?Q?pKlGLtU/LYxpsPTHGZ9DAx9pGaohMJaZU1OhIfJTfssYczUCJmjoDetxLZOx?=
 =?us-ascii?Q?JcPvis2jCBgIIVI4Xwbn6QCTFA4dCuPf2cA6sDtcnCXQUk9/xTW0r/2n4Rjj?=
 =?us-ascii?Q?7NM80eO0BLXzhhaKq+GlrU3D2k0WMavgkeGVRafttu9xh1vSgsDgUTfPNWn4?=
 =?us-ascii?Q?BEC/ms/p4yn9yhty3Zp+GHgCaJD8WtBPS2eqojJS/3CfhYL6bCRPRolctFKj?=
 =?us-ascii?Q?DDbWg5Qtqj+IxjJinoHwfegLkkrEcjcbjDX8jczWj9ArNJipx58c2NY8WoHs?=
 =?us-ascii?Q?CkVeoJF27bk/Qb9GDYJVRnQ/e9hlcJ2gPRQJuaqw6MKofCs3Xf8cnutCE6sa?=
 =?us-ascii?Q?XNJJ6io7g/1AWfxZ7pCPeMBubUOZkRlUcBuph/5dRbboy2My+zSNApbFmkNL?=
 =?us-ascii?Q?SGvCQNyJE23Lk9wugAaTg2E2HT5L30Eo5ALzwb0hchPXVqrGQibd9sfmxoiH?=
 =?us-ascii?Q?MeTOLzZMtct2efpTC6VMxRkirRSTxGBmxrInift96wfG9J66HqOkripp+PwK?=
 =?us-ascii?Q?w4sp+sVaox7px/UMTnq3pApw5ZKt410ZvdnSecZn5ECphBjx+7yPW+4/1gxw?=
 =?us-ascii?Q?PG7cWWjmS5mUGNnPAugBaqcJZl9f4wRUm0Y5Ifl/B5Ns9q1UYTpdaE0icD16?=
 =?us-ascii?Q?NntLE5r2KzvuMZROPXQZ+1PKqyV/pHGBAZp9ztam845xoBHKm8aR7CBEwbaT?=
 =?us-ascii?Q?iYqJwDeKz8R3EnKA7HAIbmErAkt1sf6DMBrRIZVL77gRZKn2E803CUgwor3M?=
 =?us-ascii?Q?nU33e7LKfE0l4iq/CcsYpU1tpcw1vGhHbDw5kcmIL2USRGR3Gm4tvKJceRzk?=
 =?us-ascii?Q?1BcCejT/jzlVVg/t7+cGh1HWetQ62/5LMOgomzNzWFDSP1kKCmBX9Wxcvr9G?=
 =?us-ascii?Q?Za8nw648duLLcEo3tbklcchmNsTLESE4AFo+d7+ynmbqtpNuDc28MqgCcVgO?=
 =?us-ascii?Q?LWL6NedSmdJSaSda8PZ/c/1EkgQqDl4j8BJ/VBtHxGiGsskqY1IC9T81y8X2?=
 =?us-ascii?Q?ThS1IHgAEKFhVcwQbe42awLdGpl5+FtxfJydy/InZyz0YH5EX81pI9ttlLsj?=
 =?us-ascii?Q?K/Vm595YgbkhEksnXmfxsfUqZiQotMK6UbzRPULVoP0QN6hGq+sKrTpNTHkm?=
 =?us-ascii?Q?FT5OMnu5E7KhoZpm2gTd7ZcZQXpdeoX/1vE/+/STdcP+c6s6jpiiWGOc+pjH?=
 =?us-ascii?Q?DwVnJI9NNeW53hkz0y57NewFLvGV/VRcJZmCFMXfmwWx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b5949f-1837-4f71-201e-08ddafbd804d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:44:19.2268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6z+NLXxTLosss+7AmsjS5rNszt44OspTTZGlXCJSFCASpcJnt32P5S3lOZw63p+BsbdD677w5KVTqgKiTUpmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
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
> Sent: Friday, May 9, 2025 10:48 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 08/13] drm/dp: Modify drm_edp_backlight_set_level
>=20
> Modify drm_edp_backlight_set_level to be able to set the value for regist=
er in
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We multiply the level with 1000
> since we get the value in Nits and the register accepts it in milliNits.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index b17f9e75d93f..b0688945649b 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3936,20 +3936,28 @@ int drm_edp_backlight_set_level(struct
> drm_dp_aux *aux, const struct drm_edp_bac
>  				u32 level)
>  {
>  	int ret;
> -	u8 buf[2] =3D { 0 };
> +	unsigned int offset =3D DP_EDP_BACKLIGHT_BRIGHTNESS_MSB;
> +	u8 buf[3] =3D { 0 };
>=20
>  	/* The panel uses the PWM for controlling brightness levels */
> -	if (!bl->aux_set)
> +	if (!(bl->aux_set || bl->luminance_set))
>  		return 0;
>=20
> -	if (bl->lsb_reg_used) {
Can a comment be added to specify the units?

Thanks and Regards,
Arun R Murthy
--------------------

> +	if (bl->luminance_set) {
> +		level =3D level * 1000;
> +		level &=3D 0xffffff;
> +		buf[0] =3D (level & 0x0000ff);
> +		buf[1] =3D (level & 0x00ff00) >> 8;
> +		buf[2] =3D (level & 0xff0000) >> 16;
> +		offset =3D DP_EDP_PANEL_TARGET_LUMINANCE_VALUE;
> +	} else if (bl->lsb_reg_used) {
>  		buf[0] =3D (level & 0xff00) >> 8;
>  		buf[1] =3D (level & 0x00ff);
>  	} else {
>  		buf[0] =3D level;
>  	}
>=20
> -	ret =3D drm_dp_dpcd_write_data(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
> +	ret =3D drm_dp_dpcd_write_data(aux, offset, buf, sizeof(buf));
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev,
>  			"%s: Failed to write aux backlight level: %d\n",
> --
> 2.34.1

