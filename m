Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97421A2A141
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E68310E441;
	Thu,  6 Feb 2025 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1wbQTR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD310E43F;
 Thu,  6 Feb 2025 06:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738824336; x=1770360336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q8fBkwvufU4n097urmDWBNuCTdkfSqj77W2xCLo43aM=;
 b=h1wbQTR42/7S7uLei6dRSXawyZltTGx0sSsOm7IWkf+Zq3pzaXSr4kV+
 uOfLWXmT7rjnKeZjxxHMS8eigBN5QJzzJyfpU/HqPPnlXKADlaGyAebkF
 Z8EnK0xFKjH7R9uKTl9i3pEgmLLEZ+wG9rigDd5l054mA1YIqiTTm1wjK
 7P5rEm3t60DNYPHtRDOMdYABUYNr0hB7IdURktsOvBgjLN9/l/qQx0dXm
 4Epcl7sFzVBOFeLNWvcvU2ErM6LfxcLgMwgQo4s1xaJi6zCd2xJ9n1GV8
 FYLF6zVPmKnK/4l74v/LYcIP8WW36QXVYVgxFbZ+0KXFZtTvCcAOwEC6a w==;
X-CSE-ConnectionGUID: WoKrpYbFRgO6Gzed+84tMQ==
X-CSE-MsgGUID: tgPeNljjSuie9NVjhrJbzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27015066"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27015066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:45:36 -0800
X-CSE-ConnectionGUID: N8nqQYbYTNm8ZADiI+u3Gw==
X-CSE-MsgGUID: mRREGnaLTf2HYHjASbyGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142005479"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 22:45:36 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 22:45:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 22:45:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 22:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCL+YIog8A/zleYgu1wNtEQPBp1QIOmlm84IN5WkcU0jlfrbbUZT/bAV7CSm+ZlvdHJCtBkFCZuE28AwfVQVwtgQBsOCd1hHzH+OIGBJAHPf/FQqn9RstqmXOD7kl1q3iuy920jOs2uWiMI1rBt5o3IGCsTwaAi9k3BaHQ2bWfh2U3qTC8l+TdsSOfYx/ItZUGXcY8BaU0M8MFVfTzz7CYiWxKn2pCculEcYWrzO5Kp5iNIBsDVGKV6LjGfra7puIP+F6ETWLsVnpDcycADkFZqgXvlLK5VvvorQ96WDlEfVSIGYc8nQAN6U+50YitJ1OEKX/o4B/mM7yQy7QmM/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKqTCNkcxewVHhdln+kqCXC6vzzMxaKdJM5qb5brBQM=;
 b=perY7YQWlVuGB3e4v/NqdDF+BdOyhKG/n4P1TNzgE45UClFWArAjS22tWyuYAkxukjI7gkYnaD+EkjrFpIMpidPBKOgAMYT0AA1PZqIzEnWUsz7tALNZUb2+ml+xsChZ7DbEsI+rLLcKsibTavHefNeGfAYNq6V0ffs8wE+Qp5zGzKmsnN5XSQkSRnJDSgxmJpyZ4F617yEZ0vupJp1sos2lFLTCJhjBO8ZQEeTQCLe78fWoqBWP9GDf3WcU9aiHv2jVNP3zi1Nz3/v/1TqpV0vBOp3ziZObG54yPt53mNfrBDdl9vCa8Ejcn53LF3+9quyZXDpzFYumACwBg65dRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 06:45:31 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 06:45:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 1/8] drm/dp: Add eDP 1.5 bit definition
Thread-Topic: [PATCH 1/8] drm/dp: Add eDP 1.5 bit definition
Thread-Index: AQHbeGEF/GUD8zuJVESInRRrZzPBXrM51Jvg
Date: Thu, 6 Feb 2025 06:45:30 +0000
Message-ID: <SN7PR11MB6750C2F3F7544EAB1F699895E3F62@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
 <20250206063253.2827017-2-suraj.kandpal@intel.com>
In-Reply-To: <20250206063253.2827017-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV8PR11MB8724:EE_
x-ms-office365-filtering-correlation-id: 82188d91-bfc0-44da-ffe0-08dd4679d960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UVeMNlkOBlpSP9t8GQAv3jvFi8CZpNXTqvcoqNLhYV4BpgJwa7ku/GlEvf7h?=
 =?us-ascii?Q?S9Fh/ZyHtUReAWPRBJnRjVFVjg44+hww9pud2A6rmK03DI5MwGTgHrX9LPJQ?=
 =?us-ascii?Q?5U6cCR+q8I6zLC/+AFcIzoBvM89aptcABk/tDiFvTQNU/1HPS/HCDL7WHpON?=
 =?us-ascii?Q?EoMetgy3IAnaYr8AFAtVkVB7yA7CRwXxSz8VT4ZSgj3FEDGmEKQlWwUk8ROn?=
 =?us-ascii?Q?xfvg2xSsMwX7S+lISUKhoFAxCII2AKDGTbDK3QwDNwbrooCN0PWEbV8bJh9Q?=
 =?us-ascii?Q?3wN2SD/T9rZHYugTQoR3uesUUxSxwOtte15FhfXiM9gm17xd61nW+87HaM8T?=
 =?us-ascii?Q?hzRNY8L0Ppzh8jTDtJsQHaRgCUtzxzA2z4jzw8QALWRVGkLAH0REP71fULJy?=
 =?us-ascii?Q?cf/1ZI6Z/UB5vRsB5zHZ1Yyfjd8dH0naEI8FMW4aZ6ctLVh1A+oULV90FZAe?=
 =?us-ascii?Q?9K9DpokN1TSaIIngRg49MNDykxEsiueMJH2rcOVzEDaCnKWxTyK6582DwBAu?=
 =?us-ascii?Q?RtYbdxJDdlOXwwuvKbnfMbw3fVzqTgrs8Yil4nkWKmOa+HPayctbVg+kRC3g?=
 =?us-ascii?Q?eGcWJUtd3caWlCWLZ9XSRayR1K1CFqNPh+AfFEL+krwxmjG2LXVn2sxooU0i?=
 =?us-ascii?Q?Zt5oi4qm/Yq8+hXQoU3E8A6IPf7AWIEEed+o42cHoB41K1Z+MCcqeKap3mw2?=
 =?us-ascii?Q?FlJKx3scihs2axFhMAzJjBgg/iF7dpnxQk6NcQ/UJEZ7F6wVXwPuufOpLVwJ?=
 =?us-ascii?Q?et7awO4nxkAkDoKyD5ZA1faHv8XUXwQ672nFzQfIOIrgFV1ox4DKZH01fwrH?=
 =?us-ascii?Q?Efie7gLoKGkQk8q9nwF3B5Mi3fLF+6j8N1wVJouqj8nvWKKYLFsGVeSh/JGb?=
 =?us-ascii?Q?JWYjZ6oty2LCBOQtRHMGxpbLu6UC0dGo2DPlEpZ10t2XkyF9dYzzxFh3XsuR?=
 =?us-ascii?Q?Y3+IZVClvnx4ain/Y0oeN+QDvvfH/KAM5czYh7Am9hN906gdqf/P968CAljr?=
 =?us-ascii?Q?ykXI5ldXa/JUkKIhdCN80DsNPOEb6LJQmh71SgbqRRXbCD2EvCcNmY9kzJ3F?=
 =?us-ascii?Q?5Ob8c/uRke55Nva154Sif4+bp/uji55jVLwGGtcNK2vT4w1nkWzo7JDNIMl5?=
 =?us-ascii?Q?Z0wzWVRXX3mMszVQcxqEaV1fT/KojjvTpR8OQJgtCXY1ErTWRKuTzHl++sMu?=
 =?us-ascii?Q?WXCWuUKSEtLnxoG+hnnhhYtauTlT43L+Y2mKQD8N4tW9rHhvmYhNTUIfrUDl?=
 =?us-ascii?Q?SPYAvKdumm3RTNWCiNfxps84zsUKanla/PRMA5YkhxFK/V/mlySPgKII0KhL?=
 =?us-ascii?Q?8NVbZkesIkqQ2MP8rGjZd1Q3vCX9WLXsPp44qp81sNOkw14BTFMUa0DKUojD?=
 =?us-ascii?Q?2E07GceGCz3cCKQoXuaIOs6FHMdcWjhPivQDz4Uf4+Vkwa6GJoHwXqaqe86Q?=
 =?us-ascii?Q?K02OMrvk74ck7Nsn/2hn2EC7vKYziVja?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SxiCwgE9bpdA9KZGsYWmXuJCs8L32Sp3D1OxDIyj3CaJWGPcoFe04Bt/06V9?=
 =?us-ascii?Q?OVLFAYamymytpyr3bVjjzhrBUPHri0zqPPW2FzXdadx9pShGY00FOkfF0byw?=
 =?us-ascii?Q?5m0NOVXSwWi216OkEPYcJWaGsBdPgpbuFGIwaJVkCEEpm200YEJumJ6nLP+u?=
 =?us-ascii?Q?o1NS5VvCe962vjeoG/s6wHvoD+CmjMR1zjwWC1cXhpwNxT4v9UN1OUGXLkak?=
 =?us-ascii?Q?hHjo9vWuUymKPtEV4xQGeAIrOqxB7hdJpxtKrJp5O6jowXNXpzKeAv3M6Sif?=
 =?us-ascii?Q?h/H7BTyE91H+46chaijh5sXmF1fUdzf/O4qXXKHQq6jtCsxX5qqueZJXCqJ8?=
 =?us-ascii?Q?mWyZ9KT5MHJCjj3rbN7HUv4FTSnfBl0YLxXmopnSHgFYMJd2ESbFuv5I8ub+?=
 =?us-ascii?Q?KR7LzUT0BTWy/1YAPUrJ0osyQ3OhsoJgewdxfi0/0DsTaRzkB1VT4O3XWofb?=
 =?us-ascii?Q?qwKx4oy80WIl45el7EwzTJk9Y3vLPYshMzTWq6rYaXgdAowuGRczeAd3PXgK?=
 =?us-ascii?Q?3dTUyYN02EPSXgiuzybEV7PmOIdt6ML81X0HGXHX2ueqMk3r2YunqiyQaAIc?=
 =?us-ascii?Q?xEZSMGjmr9fbGhWwD1NfDVDzkv4+BvoO2JrQeRSLokDdDRIvM2oKtMmJquor?=
 =?us-ascii?Q?RVv7QvEDcNecYKHY1RFlSRKWMW+kFXoc0akxTL/jbZ3RcoMbGPElB8gHOAJ9?=
 =?us-ascii?Q?65kJGDEzpnDPr5iqbPh2Xam04a5gD5wCC9dppRasPoNnKJnyneGqzefwZo9K?=
 =?us-ascii?Q?6wHsSnY7XUVX/GYgRCri3AB9bE088+Ef2w72MdmK7ElOUzQmWlh96psIclHc?=
 =?us-ascii?Q?3Frpg0gTMwCK3lyaIBTGtpE/mg6v23jRLLbRd+PzdwjjHtG+XLLo2KMe6SJD?=
 =?us-ascii?Q?9mX6ZdyPUxK6MMpnhO1ERTzEeOo/D/AIzWhfBshpuOI4ngEhtDbfj/3Tbtuy?=
 =?us-ascii?Q?8tJ+Z+GUcVHsAY9B42oKQPTOtfo/3aXBGxzMQoCYbz9sAPP9EW7ZAd805ln4?=
 =?us-ascii?Q?Ct9R1MtzyF4YO9LtXQs20fn1O9iThnrzSBtxwbYmL/Vg7hh2j48SQ17zMjbU?=
 =?us-ascii?Q?OWHiwi96pgZ2DTGMrgBuLxldNRAYoXrPA6h1O1iwMCz6MQu2qmwHtsBZMZJk?=
 =?us-ascii?Q?S0exn7nCx++tW68iXQ3DGh4kfyUqPedXIeGXkWkf1qV/X3hG4VTVCcUPWUaP?=
 =?us-ascii?Q?MnpHWj3q9W772AKIclbW+BhLEqvVHnhPc62EaT/6MAzauV1UdjDHwV/k3qfq?=
 =?us-ascii?Q?s0JDP8kpy+IZU4bPyOScn5KKzj0q0JrHeVf8NgdjT9y78GZAWGrSYG5NJ9Ju?=
 =?us-ascii?Q?doNM1CzpJabT0eCgIhw6F5tiWsnSrh5/hxMDNLO5pa11/Y8JJy26CIDuZhUu?=
 =?us-ascii?Q?8Pj8/bU5KnMqN2izQPKLzX4vn5EU7OSCdb6+CM80QeI2DSfeBL0ndBDPQZx9?=
 =?us-ascii?Q?UzHsPCYSiWZ6Zp1UzOGr9GAmwdfWt3dh3BK3OPtYleWLJPN0j5gjhDjWlHne?=
 =?us-ascii?Q?gJHlaREYLT7Dh3TUdadVMA0bXnfXChfOgW83buuGoMtdfH27YFIJp/ELM6O+?=
 =?us-ascii?Q?zuY0at0pozDxZJwCg+VYMJw7svpNnhONwKgp5rk5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82188d91-bfc0-44da-ffe0-08dd4679d960
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 06:45:30.8424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pKR4KEXJxGEMCgplpNRpGRpA0DEOdSJR5yQiCP/ImZihFm1SSvwKNxHxxK6i1WFOoZdAM2T9bJ05X6hoUVBlRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
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
> Sent: Thursday, February 6, 2025 12:03 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kao, Ben <ben.kao@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 1/8] drm/dp: Add eDP 1.5 bit definition
>=20
> Add the eDP revision bit value for 1.5.
>=20
> Spec: eDPv1.5 Table 16-5
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>

Hi Maarten,

can I get an ack to merge this from drm-intel-next

Regards,
Suraj Kandpal

> ---
>  include/drm/display/drm_dp.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 480370bba1de..05e16f0144ff 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -999,6 +999,7 @@
>  # define DP_EDP_14			    0x03
>  # define DP_EDP_14a                         0x04    /* eDP 1.4a */
>  # define DP_EDP_14b                         0x05    /* eDP 1.4b */
> +# define DP_EDP_15			    0x06    /* eDP 1.5 */
>=20
>  #define DP_EDP_GENERAL_CAP_1		    0x701
>  # define DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP		(1 <<
> 0)
> --
> 2.34.1

