Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D9879567
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E810F17B;
	Tue, 12 Mar 2024 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsLXzVhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE12810F109;
 Tue, 12 Mar 2024 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710251643; x=1741787643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l7fTLAMqO97ikpOOfyGHKqZUfak7JnMjeaL/aASys+8=;
 b=FsLXzVhMA2sqRaBw0iT/byM9j6tk0ZLQrxu/5DZ0+ITEspMVzgvD08+m
 abnn5H/uDxD1LwU7aEHnUjR9CDQhPmDN7mE9rNVVuibx4VL23VCO3HK8Y
 ep145gU9Xp74XVBPbqnDtCkuGgVQOQAdu0EvZdOpGlJZArVsJtWw6vFo4
 RrTv71RKeB5XUlCwNjBOEh9CS+bYrILR6tNLm23BTiQZBMrZIFkb41pLQ
 lQEz/a9ua01J4A6kqVFzl+G2/UBlYI8n6MOGfmb88GqZAe2hYYSQ4gC0Z
 20thy003JotGig7H8M1n14xV4n1316FUeuTkI47Te3clMQuLVSg8iH3ei w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16099930"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16099930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 06:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12009782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 06:54:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 06:54:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 06:54:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 06:54:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z40sf8bBeRtUddAn6dLlUfmTOmWDlnryNaa0roMBHku/zp/rfxX+FkkH2MdxKEiHxMVBP132ohJY5v9/NX3EbnzudoTQMcf9aZGygfrkoUuOszio50FG3FF7ITtNg4gD5FOnhw92eC3M0VbSO+YIJe9/C8zcxiIj6sNzU10rYV77lVC9SCPzx/mh+bC3ar26f6ZoBwPuEf0lrWfhlhLf3+11C5AQSLQ7Z+Ulw9f27od8fRYFrCnddqdQYYGoPJIGiuhJblGN6UU11q3BuKBXkwLuZNiURNoOrjiBlOVXgHiOxsJ9RZQJ6ukA4n0um0qJDOWf91ER2W+NVEY2CgUEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAFDM5UWYr4RzoHO/GDI3tMjE71QNHt01axh7H09ap0=;
 b=FXEdVbTlSbY2tH18L/o0p4+q4ya7ZL9sVczYxxtmtPa34d01BKOdGiJrJ1PS0G0YykXCLiTzM+wusnx4adVxGXxlcWYIygxlaFpJA+XNpSB5NAyUhubHMWbJJZqoxz6U4SciN8I07aD2eXJVB0Rkr0NdED68hA3f+OkY1h3oh6pugrstrT9/GAarxNUmlj/OABJLzkKtDbX7lOkFwR89hO7RP/wKCybbal48KnD+uKsr3iC4oMlCyKqP3gg9DAS2x/xpDa8SsYgb0gK56//C+SS+Yjkk3UPsjv5Hu/om3K+bL0iuiurx5pIJUmlKYsD29o/p/wPSLUbT34zs4WJnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 13:53:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%7]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 13:53:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: RE: [PATCH] drm/i915/selftests: Pick correct caching mode.
Thread-Topic: [PATCH] drm/i915/selftests: Pick correct caching mode.
Thread-Index: AQHadHDpkf3UKmkEIUy2uesWhy6owLE0IFpQ
Date: Tue, 12 Mar 2024 13:53:57 +0000
Message-ID: <CH0PR11MB544475991384F86EB10A4B1CE52B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240312111815.18083-1-nirmoy.das@intel.com>
In-Reply-To: <20240312111815.18083-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6813:EE_
x-ms-office365-filtering-correlation-id: 61c93a6c-53a9-4660-b84e-08dc429bdd46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IBSYtXXC4pIy0yiTnNcVqerMuBU8MIq4NVL+tJAp1sDgsZ2VktKYugnElj2sHWZqMb3FfQ7oEocDjkwuZCS4HpPDDodyJDCmtV2uZjLQk1T+p6tJOQYeR+Qv2eK8lIWAqPI4nxBkJZUwfTb4kuS8SfNO54UKpQ7e7fFSHeEMuiPJZ5elCeiAlBheNSVC2i1y90YYJmJNqUZ7LTcsiZ3KvznUFMup5ckizMsuSAMXgJRruMsipkuftiYsEcZkYNVer9nLaptlTtcqpk3SiD78edDFl4XFe9jN6QPuDLf2QukxYQqlSoRB8K6AdpfP7+8hXH9OrTrZsM3Ycszt1a5u5zeakNpTdkS50CiMnJYYQRBSqBzsiZsih7abliEcohpSa+k9gDMjMBvNt7kCACqHQV2IohZzRBCd9cBYcLXkqt4NmS/6NfuCWdK7TrOHdPpryBogNVYNBCb5SoEwjr5w0DdQek0JaVWUVXYiVZ3cT+KHOqCLtKTn3f88ZzPnnttt9kbLopd3InvI8bmDhg2FjXt3Z4VC97AjPStFL+qbsrUFdcRNwKZUW20rgkgCM7J7g++cUoOYLWGYnx3Yh9oivIVY6HGf06K2zjuW92p2Y75VzH2xZxRVp8Igb1539p06/JVK4gWTgLp7D6a4FcMYsAG608GppLXInKT3v37afgM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R+s/Ubtm9fMz+YcOOlMJKDEL7orhkCVHsSl5QbeBYdlafMbha7Lo+whlrnYb?=
 =?us-ascii?Q?O/mp+4Wu/rfRgE150WL1A+M5Y2aWROhiIepqOe2iPK4GrUgPKX8Npv+IexiW?=
 =?us-ascii?Q?zx689sYOcHACSJBhYtGfo76346+dCPezX3keiGNW9Kx7e/MWozuWZyZngSCh?=
 =?us-ascii?Q?+TL9bAWNNg0DqLu5BLDFytoGbHZinadlClOFRz6s7bu4hFgYL4ICfriR2nfp?=
 =?us-ascii?Q?tGwK/608SU2hV11cPsaV5HM8r41EUVkZf7+l5zyE9marS9b3aSJGoAoJElQF?=
 =?us-ascii?Q?2t0IEiRR+SH+tEVqBXRBxOlTMUqhMN/zeGck03eUFgHpxkLliDp5CmV8qVU+?=
 =?us-ascii?Q?W69iin4tm4bYLYIFwHF6v29indZM5lP5XAcCacgGn+DQyteNaRzKdvE9arOZ?=
 =?us-ascii?Q?NNTQfW+aL2Ns/8/y2bQu1GKrIsq6vrFK6g9PyvEFJdnmUWmjLa65GlGkea8t?=
 =?us-ascii?Q?5+L+jcGuJ8vBBjvQ2DYh0SIDvQFVeWp/uOeOifGrSrFh033X7Wj7pBySQHwh?=
 =?us-ascii?Q?JDe5ictubih/T1FBSoGc/WDMoL0rb+TAyWNuD/HdntOrZIDrMkI6222XRQXI?=
 =?us-ascii?Q?42mwuF9EhT/uJc3TzL4nqE2FhX6uxsHuZos6/jCrYJS9w/iy0L0rGLtopOPk?=
 =?us-ascii?Q?Bj7AhSLaXfrlZYx5tVPTpPjpBWt8U0nQZ0jicIDBUs5rCoElpDzGrssL4Ey7?=
 =?us-ascii?Q?Zb9H6GvXK+qQ8o5VAPHgeG5tFxVBKyQNdrHdhyl6paOS0gIoHtps2sURC/S3?=
 =?us-ascii?Q?ZmHk0i4m0aMtkmVbr92lG1O/K+IwCQeFLH/qpb22GgZFidj4xRz0G3cUWQTX?=
 =?us-ascii?Q?x/e4WoA2KbODhP8uFqyRVo0ucsiI/eu0rh7dzuJWCI1EnK9SejLCXhxZBCfq?=
 =?us-ascii?Q?2eSnww6JjofY9xjUVxwhQhFxOypdx99wwCEjdnCmxE7B0RsLZLp6fj+Spnqg?=
 =?us-ascii?Q?ha7gEEmSYOKEQXu4kwdZgQXH/F9oecmDvWnsG3MhTa9GMzJt03AracaSxChz?=
 =?us-ascii?Q?RD11+m86yXU3U+bfQIkQ/d5L2AZoPhctiEFUGVurdfS9hSNipLLzFrV2oDSZ?=
 =?us-ascii?Q?knF5hh4SXlBvses20vPpA3Axx69/BEFDyfmztmCQ2PrgPE5O5gGQqVgZ3PaC?=
 =?us-ascii?Q?uDJa1b9R06zNRZcEMwq5gQLiYk/TxEDNK+L8Ff7eUgCspdQdgN437kIY6MsR?=
 =?us-ascii?Q?+5el39ZpXXlsJV7guWJC/zBdLTC3kzFyiucovspZRJFmHm2W0snIxH7+582F?=
 =?us-ascii?Q?HpHMlqiM/b5PgKDG0hGEhNOtS2wx29BPtlugI8A6W5d8nXTwq3f9jpn/Yw9I?=
 =?us-ascii?Q?hkoF0lToEBGMl8sXjY/yp2LaHKWn2nesSR6AGmmZIB6TMziROiQI6FSrqLyi?=
 =?us-ascii?Q?ESvmZHloJEyck5ZrrmamR9aZeSavYxrARHwdvoT2NYt35tLHMvzPs0s11SP0?=
 =?us-ascii?Q?arL52h8ewCSnl5iF0qPYAnMpJFMwc+9ccQApWIKnG7xuWHUnyG1Z0jZzBNMR?=
 =?us-ascii?Q?xTo/uZeXhlNsKMRaWgSSNzR45iiCeLfutghJRwNnkaQt0rSo2a+lhCMGgW7g?=
 =?us-ascii?Q?11NKRJAb+jsIGqvdK0JrcgKuyLEOn1K7leAfam9g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c93a6c-53a9-4660-b84e-08dc429bdd46
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 13:53:57.9152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rZWLbfDASj7Sfw10kSPDtM8RM1vnSIZTdncze0BrsCCZghg4/KzuhyQwGfTofskjpCwx3f5DAGhuzN3Yhm10K06/RxdJtuVx473G0oqfaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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
From: Das, Nirmoy <nirmoy.das@intel.com>=20
Sent: Tuesday, March 12, 2024 4:18 AM
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org; Das, Nirmoy <nirmoy.das@intel.com>; An=
di Shyti <andi.shyti@linux.intel.com>; Janusz Krzysztofik <janusz.krzysztof=
ik@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/i915/selftests: Pick correct caching mode.
>=20
> Caching mode is HW dependent so pick a correct one using
> intel_gt_coherent_map_type().
>=20
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10249
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

LGTM
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drive=
rs/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index d684a70f2c04..65a931ea80e9 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -7,6 +7,7 @@
>  #include "i915_drv.h"
>  #include "i915_selftest.h"
>  #include "gem/i915_gem_context.h"
> +#include "gt/intel_gt.h"
> =20
>  #include "mock_context.h"
>  #include "mock_dmabuf.h"
> @@ -155,6 +156,7 @@ static int verify_access(struct drm_i915_private *i91=
5,
>  	struct file *file;
>  	u32 *vaddr;
>  	int err =3D 0, i;
> +	unsigned int mode;
> =20
>  	file =3D mock_file(i915);
>  	if (IS_ERR(file))
> @@ -194,7 +196,8 @@ static int verify_access(struct drm_i915_private *i91=
5,
>  	if (err)
>  		goto out_file;
> =20
> -	vaddr =3D i915_gem_object_pin_map_unlocked(native_obj, I915_MAP_WB);
> +	mode =3D intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
> +	vaddr =3D i915_gem_object_pin_map_unlocked(native_obj, mode);
>  	if (IS_ERR(vaddr)) {
>  		err =3D PTR_ERR(vaddr);
>  		goto out_file;
> --=20
> 2.42.0
>=20
>=20
