Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4F9958D8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 22:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A58610E5C4;
	Tue,  8 Oct 2024 20:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRdaSx31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF4310E5C1;
 Tue,  8 Oct 2024 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728420998; x=1759956998;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RUiguDdP1FCGlKKd3FI/gj36gfK3Dp7+01Mlrj81BRY=;
 b=LRdaSx31xoubRt2ADxpwQOrh2CSBRu94kF0xdWzfvQqGgC4nFZ+eljH0
 a6wKBcXQhUnadfjx/39JYuO7a0bXZexKSv2BE+/ycKkJ8huehQaZDKVUq
 RE4Q+kOhdMgECWWHh1TMjBGoODtCjzVI6rLUh27DyPh2fSa/D4Bucj8UQ
 S3rxl93IVk+cTQLEc4WvZqMycCIyW+EzesP38cBcpZg2dxwZME1woU+xI
 h90euhp4FNVN2gnkXAeWLSZZ3awoulKvxu6AFBUzZJog6h1o1XIhW6xb0
 u40ktrv/4B0BhFSuG5onB3kmeoeHA7Pki22xmF0bHspTSUAYj171fMLw3 Q==;
X-CSE-ConnectionGUID: AFBhslKyTf67C+u8w2KS2Q==
X-CSE-MsgGUID: pf0PsnljTLiTUOtvZQeVlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31366756"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="31366756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:56:37 -0700
X-CSE-ConnectionGUID: Dune7ZP4RDicfoPq66W7fA==
X-CSE-MsgGUID: qVAgK1cHSfW2TV4Mb2SyhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75953407"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 13:56:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:56:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:56:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 13:56:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 13:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7oRXVL8zY13buEYK8Is3NOo/PWbP9WZo633vAgMdJ6htrfrS3d1k3Ebhstpd2uSnQOnPxknaA2vA+Fo/GvAcIN8XxMLly+mc2xC6ndsQAjfJCKz+iSFO2tWrVd2vApLWszkIsjrooDf27SPlxsW7uNUpGXoViz0aso9u93adkaReg5442jhY/Lz2cKdW4seYxr2qEiCw1kAe0vAVavOKHZSgXyi2N6UzISKRi033k+IN7p5I+g1uWCB8HgPEvjx/EJJLgfm20DZf4X6kBYsU6QleR7UdgeWdLOhyGilq1uQA1ZrZh5zmVnb9ulTI2XXOUNmvLlzJZPEuqlw2stY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKoOC8RPsWg4/ihP4o3QzvWsePLIfs8p0MhlIX6/kek=;
 b=VvfPMZdm734gzyPT5DVqnCjtmmxM6Z6SJIwlzzBwTDkStRjzd4D5Upmnm5C+En8YR9g95KbeykOQtU9rwPpFklAH4x0lS1KIEh9TkJwV7/LC4yYALZ27lAMVK/hvm1wGMi+S7NFAA6ba/E5F+cuq0q7M+tN7IR7/CWLJXci4J+c88WkZZ24MjFP10sfveoRje8e7Jrs38RrWrrQJHKgKv4UgE+isE4ShAzDM4aBnPPk6u8dfhHln6IMMp1rWSgzzKK7ujNqaEjo1qMWhWNN8X/307FFvQ7H7gJRPpULdz6J/zbRQvfsumqLNJJ4t7+wL65IxCGrChNoavcQBBdnNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 20:56:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 20:56:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 05/12] drm/fbdev: Store fbdev module parameters in
 separate file
Thread-Topic: [PATCH v3 05/12] drm/fbdev: Store fbdev module parameters in
 separate file
Thread-Index: AQHbGXqnMfodoT1rREe+yQhCw3muqbJ9SAEQ
Date: Tue, 8 Oct 2024 20:56:34 +0000
Message-ID: <CH0PR11MB5444D40788A148682C007795E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-6-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-6-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 56d82d5f-4fe7-4314-60f8-08dce7dbb1d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GG1xnnXdPd//QaAG7jYj/t6BCjndP/6Zs73JdQJk5R4RNLZadYQM+DbCh5zo?=
 =?us-ascii?Q?Z7svjYsoIbY9O0r9ImJ3SyYXfF9E49E6s5jX6HOMa5FwZjzWvhR5Gls0K0ak?=
 =?us-ascii?Q?K7y7G8gtvK9J2FAmNAXz17Pg54h2cocty/MIAZ2CkH2EJJUrGY4dF+cAuC1w?=
 =?us-ascii?Q?Tyneel5639FnnJLky99FVu+f3vw6f5dfKGWV+XcDGthCVZS6l+by7Do5Aq2R?=
 =?us-ascii?Q?qmfU1nunTGJiKkblPjnQZWX0L2DC0udCzVl4II6cvDmNBhT3rk5mGReiDvg0?=
 =?us-ascii?Q?QDTRsr4xMB+TeDiJLW0QhmBT6Q4uqStVEpihQ3DRACvJEOI54wXmKHhM3cl1?=
 =?us-ascii?Q?0bbCfptawXp0msqVi+09OMRoG3bh8FVnnXp9YBV6hLJ5eAluw0JctqGcnpai?=
 =?us-ascii?Q?xaNiv6WN1XeNu/whs8OYOOkBYjavmujWSxaedbmj0Qy+R1sl2dQUP6EUUXK8?=
 =?us-ascii?Q?9S78hkyR7pReW2C9/1yN5g/lYVt1AE66IUtMaIUIYBvbfmW9Dk0mCK4bE5ho?=
 =?us-ascii?Q?gH5BcpECRWVsvNTNPipgN6s3cv1zpNDGkrPDPqBcNQcpXwYC7Rgy0Sj5E0B9?=
 =?us-ascii?Q?yqTQ0o59mVDTSNmtMHknhLZ79u2qcH/9TD4X4CBD1IqGNX37z3sOCE52FFri?=
 =?us-ascii?Q?FPpgsGxYiMEvwTsIYrmJOEzWWpsxr6i/W04KN0wi3CFMa3UkYMnX2kewSrkY?=
 =?us-ascii?Q?/p//I8yP8cmWGdclAErv+uj3h+K5bQ4GJ8EUZv0V7mad8wP0ZYVVK8Khpgau?=
 =?us-ascii?Q?pfDzU+hRNCjQ4ITlVUomLS0z1AcG31KWqvHFiy2pMb0mOzx1QFUQYE+avs2H?=
 =?us-ascii?Q?ac3pRgBUdSjWQro5d57lrguMfY/sa+IwFjVM8fun1PcwcFCyO27kDBXJtWGB?=
 =?us-ascii?Q?V3P2kzAGXncTXVfvZt8bmB5zRwGvqUo1Vtuid2qXkpqorX8EjtRC+qIUzViu?=
 =?us-ascii?Q?/byVcApC8sjZ5/MMHZaO/IRWfzbUvkCJkKZClRONmiha8sO20VPuGEz26s5l?=
 =?us-ascii?Q?sDZzVxIvBHkl00YD/nUv2sdZNozHmbjQkYWEi9CtqENmHA5QqNhd9jOGAhIv?=
 =?us-ascii?Q?1NZpHMiM/XaASVy9th0cPf2jNnDJHODILnOd0cFoExZtblZBmdzbQZhLABa2?=
 =?us-ascii?Q?yOfI5WKiSQGQcbz2QZIKyMa+1CjuxiSIseB4+RzKoaG+HPxlwayu4mgqqQnd?=
 =?us-ascii?Q?iiFZQTMfJuAd4CS1JcbvzjZMi8kCqgdbsAx4b4lpnmSRs0a+dr4TdYPZGzov?=
 =?us-ascii?Q?2ZY9jyinp7Z/EBYW0Ngg8oLn/PKEG0qHvPlOdccMzng0xoFNI/2Tix8ryieQ?=
 =?us-ascii?Q?MtsyC2/MPQjN1A5BuLzYW2rcMozLeW1WzqlLFmTiut1Cew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bKxMtWj7cwXNTB6LBEHz6dOU2v2A+nCKyC+4jkExd0LxjeZDf272gx9mb0F2?=
 =?us-ascii?Q?o8FIdEZnV901/1aAyLTHcdEW6p+aZypPw42zTG+iaJn77OfOjwc+bbNBebFa?=
 =?us-ascii?Q?iiv3FnpbRoKyVXAiqYEvmcpUtNif4QaVrQTSxqGRPq7Z+L4rgG7qKxgPN2ge?=
 =?us-ascii?Q?A9zbcF33GI/dxljPAcZNuNHRqSJH7yr7HIBzWbMro9dO5iwc5eeiTWQuC5bc?=
 =?us-ascii?Q?xJ5NauzsUMB9zMfSisCJivFXNh9C4KKfdouIPG+4NMgtxBa3YKHoWyPFy42n?=
 =?us-ascii?Q?fb7l2AtPu2IVj1IA874eDMTwHDGNxEYSccaXoKmjDx/31mpT26XFfavMKVt9?=
 =?us-ascii?Q?b736XJxPsH4OM5f5RH6Ic0HdCB5gj2ZJxJcKWtQrOKaJhk+zXC8gZkDpat1o?=
 =?us-ascii?Q?jGL20LHlLylBqhOzNpMZJ+fXY1dMJryHfHJegKG2UZr7HH765+UHhwYgZSUI?=
 =?us-ascii?Q?LuFH02U9NiP5YGb7AetBjDAddusxM5rBf5qdndYCH8sZXXc6ThgCc3MUJd6A?=
 =?us-ascii?Q?pthipZIXPxIhx8GNF0sFyCNs8gJCAzQT4ju3aSmr+TiUBtoNEoEHbnAEjwK2?=
 =?us-ascii?Q?lPiWsOr8ckqZpaI1iVFZpV+U+ly2sflXto0Ch5FWzDC8MprzF3uB96CNW87w?=
 =?us-ascii?Q?WGHrSrQ3BaLU3p49End02+9ppiBWYt6cGV2QzuVAuvlMwCWBoc1+ppvNgRWG?=
 =?us-ascii?Q?S2ASxB/RmdzBuQnr2hXPAmMdmUZJPKSeiWgzluj0sTu4aYPfYN2AYTRZDAuk?=
 =?us-ascii?Q?+2/LgylgyXZbg/baD+Vi7UAeIgi6UeCupkoVc6TS+mWO95BuFLJSrv3d2PCP?=
 =?us-ascii?Q?vg2C8PbOVsmimVgU8VsrqhPZ0fSJLmYt7l6eoornOFSZTnpCDsfKSpDP9t//?=
 =?us-ascii?Q?XrS3ZUBa1ZtaPPQC4bkQNNoCX8gyp4M7aMIx4a2RVBzEOkL0uj6HFCqWzBZw?=
 =?us-ascii?Q?L/Qrt0HUuQUzbh7kAWL0oCKZNKRgIYPl7DbLOLecPzUxgUKG0OUU9e8+CDNM?=
 =?us-ascii?Q?xPWNyeF/SkCHsk72u/A9bLRHxXzEDvhaPuFC9sq5+1lNNJ12ihapanhTxL1c?=
 =?us-ascii?Q?GccnOeRjqa5HB28iQ6Bz0fl3q5ehshhmZMIhmhllw4xDmOBdBbCM2RDCLLF7?=
 =?us-ascii?Q?HYTFnPaKNYGY9eRdZ/K75z8qxaG9yugPKQLZC2jKFTbQ+jvALr0HwUuaT3v7?=
 =?us-ascii?Q?Ke2py9Ue20RcOljky3rOBSmnEpeCPtMpJJs7NserDA6ZrlLXuIp/AjscYWe5?=
 =?us-ascii?Q?ORu6r705WfS6+LM0nDJwptrnw4076s0lh6U9e+qsFnFuy8ZHDgqrcOi/k9Bj?=
 =?us-ascii?Q?V9toVSlBIUgeIg9e1wsMBfmltHT+arQWSqrarFxDYGSG+5tMIEv2VNuHOo+Y?=
 =?us-ascii?Q?gvpx1JQvFt8anrgLfkilNWphAriJxsiAE8pFkdMIakjJQ3rXfyCucrJV3zw7?=
 =?us-ascii?Q?imvKNL/4kjw3BbPiHUMXPsRDGVVZb5/Nmlqw+VRzod386LNs6QwSGovV2yKR?=
 =?us-ascii?Q?GRleCJIb8RtVxHqI+TkbwZNvkSwSREtdkVK451qR/WJ8bI/blWkoTXqI0v9R?=
 =?us-ascii?Q?X4NsuF4MeVd4YjzRf8zw/aLsvskgCy8V7SRqonGJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d82d5f-4fe7-4314-60f8-08dce7dbb1d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 20:56:34.6760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTgIZmI8EXIXwJ8KtxkYtNJtGqPesBw8MJHL3SC0HhaccOVmUUcrI/9CFdD5/IJhB+keSR0ydWK70fZ0sVgguM/0V85VkhSDCp1A80QJQj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>
Subject: [PATCH v3 05/12] drm/fbdev: Store fbdev module parameters in separ=
ate file
>=20
> The fbdev code does not really belong into drm_kms_helper.ko. But
> there are module parameters that control the behavior of the fbdev
> emulation. It is not possible to remove them from the module without
> breaking someone's installation.
>=20
> Therefore move the fbdev module parameters to drm_kms_helper_common.c,
> so that the actual fbdev implementaton can later go into a separate
> module.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/drm_fb_helper.c         | 31 ----------------------
>  drivers/gpu/drm/drm_internal.h          |  7 +++++
>  drivers/gpu/drm/drm_kms_helper_common.c | 35 +++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index d5e8994345bb..004f7c437897 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -46,37 +46,6 @@
>  #include "drm_internal.h"
>  #include "drm_crtc_internal.h"
> =20
> -static bool drm_fbdev_emulation =3D true;
> -module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
> -MODULE_PARM_DESC(fbdev_emulation,
> -		 "Enable legacy fbdev emulation [default=3Dtrue]");
> -
> -static int drm_fbdev_overalloc =3D CONFIG_DRM_FBDEV_OVERALLOC;
> -module_param(drm_fbdev_overalloc, int, 0444);
> -MODULE_PARM_DESC(drm_fbdev_overalloc,
> -		 "Overallocation of the fbdev buffer (%) [default=3D"
> -		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
> -
> -/*
> - * In order to keep user-space compatibility, we want in certain use-cas=
es
> - * to keep leaking the fbdev physical address to the user-space program
> - * handling the fbdev buffer.
> - *
> - * This is a bad habit, essentially kept to support closed-source OpenGL
> - * drivers that should really be moved into open-source upstream project=
s
> - * instead of using legacy physical addresses in user space to communica=
te
> - * with other out-of-tree kernel modules.
> - *
> - * This module_param *should* be removed as soon as possible and be
> - * considered as a broken and legacy behaviour from a modern fbdev devic=
e.
> - */
> -static bool drm_leak_fbdev_smem;
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
> -MODULE_PARM_DESC(drm_leak_fbdev_smem,
> -		 "Allow unsafe leaking fbdev physical smem address [default=3Dfalse]")=
;
> -#endif
> -
>  static LIST_HEAD(kernel_fb_helper_list);
>  static DEFINE_MUTEX(kernel_fb_helper_lock);
> =20
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index 1705bfc90b1e..9af72bab86d1 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -54,6 +54,13 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev=
);
>  struct drm_file *drm_file_alloc(struct drm_minor *minor);
>  void drm_file_free(struct drm_file *file);
> =20
> +/* drm_kms_helper_common.c */
> +#if defined(CONFIG_DRM_FBDEV_EMULATION)
> +extern bool drm_fbdev_emulation;
> +extern int drm_fbdev_overalloc;
> +extern bool drm_leak_fbdev_smem;
> +#endif
> +
>  #ifdef CONFIG_PCI
> =20
>  /* drm_pci.c */
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/dr=
m_kms_helper_common.c
> index 0c7550c0462b..cfdbc1ac88dc 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -27,6 +27,41 @@
> =20
>  #include <linux/module.h>
> =20
> +#include "drm_internal.h"
> +
> +#if defined(CONFIG_DRM_FBDEV_EMULATION)
> +bool drm_fbdev_emulation =3D true;
> +module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
> +MODULE_PARM_DESC(fbdev_emulation,
> +		 "Enable legacy fbdev emulation [default=3Dtrue]");
> +
> +int drm_fbdev_overalloc =3D CONFIG_DRM_FBDEV_OVERALLOC;
> +module_param(drm_fbdev_overalloc, int, 0444);
> +MODULE_PARM_DESC(drm_fbdev_overalloc,
> +		 "Overallocation of the fbdev buffer (%) [default=3D"
> +		 __MODULE_STRING(CONFIG_DRM_FBDEV_OVERALLOC) "]");
> +
> +/*
> + * In order to keep user-space compatibility, we want in certain use-cas=
es
> + * to keep leaking the fbdev physical address to the user-space program
> + * handling the fbdev buffer.
> + *
> + * This is a bad habit, essentially kept to support closed-source OpenGL
> + * drivers that should really be moved into open-source upstream project=
s
> + * instead of using legacy physical addresses in user space to communica=
te
> + * with other out-of-tree kernel modules.
> + *
> + * This module_param *should* be removed as soon as possible and be
> + * considered as a broken and legacy behaviour from a modern fbdev devic=
e.
> + */
> +bool drm_leak_fbdev_smem;
> +#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> +module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
> +MODULE_PARM_DESC(drm_leak_fbdev_smem,
> +		 "Allow unsafe leaking fbdev physical smem address [default=3Dfalse]")=
;
> +#endif
> +#endif
> +
>  MODULE_AUTHOR("David Airlie, Jesse Barnes");
>  MODULE_DESCRIPTION("DRM KMS helper");
>  MODULE_LICENSE("GPL and additional rights");
> --=20
> 2.46.0
>=20
>=20
