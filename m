Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860667641D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 07:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B87410E147;
	Sat, 21 Jan 2023 06:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBC910E147
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 06:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674281086; x=1705817086;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0IyoAAPU572PDKAEEY+tala/8qoZajVTHFIEVOHBJrI=;
 b=kobhDS/Tkl5qzSszR0quyqWOujHLOZQUScZyzwLilbNInzjWoQtzmB+n
 2JEkiOC6iKfllXyjddijiaHTrufg2yjo19jH428cBhu36iE+xNg3n7JDO
 EvdRnXB8UiEUsJJvFfva0AsSHzliBpUDN7fQwHJk7CyUgD73Ef7YahXF2
 /fybbedj4woLGL2Jiul+ZuzY+udBB4ds/j95ai0nscWnY49gahiZhewhh
 AYJsOBtNnEgSjq94WHMPoxi8KOYcotTda6tBP8Be4p1pmMgDzeObCTgvz
 Ep9GMWRfcJfd6/8FfBAyvpFlhZkvLQoRgtfaL0iSrauM8bSq7IQ+6+rlB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309337252"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="309337252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 22:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834662520"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="834662520"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 22:04:45 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 22:04:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 22:04:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 22:04:45 -0800
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sat, 21 Jan
 2023 06:04:43 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117%9]) with mapi id 15.20.6002.028; Sat, 21 Jan 2023
 06:04:43 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 7/8] drm/i915: Convert MBUS_ABOX_CTL() to
 _PICK_EVEN_2RANGES()
Thread-Topic: [Intel-gfx] [PATCH v2 7/8] drm/i915: Convert MBUS_ABOX_CTL() to
 _PICK_EVEN_2RANGES()
Thread-Index: AQHZLQZxpgqPG+mb50GuJQfaRkD8o66oYldw
Date: Sat, 21 Jan 2023 06:04:42 +0000
Message-ID: <SJ2PR11MB7715091733C75888EA0036EDF8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-8-lucas.demarchi@intel.com>
In-Reply-To: <20230120193457.3295977-8-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CH3PR11MB7322:EE_
x-ms-office365-filtering-correlation-id: f7911ea0-96f3-4b74-3f6b-08dafb7563af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UpSx569Waw8WM89nt9JWWmwWTh9VTjE73Y3uXCln7lsqdG/OPp12wL5GlOvIKX0ansng1JHdQFIuw1ka9F+9eXRlAqfRz1ixYBhueIa6VzPKa1VNqeKL1bVX/7qd4IHp0sb9KH2ypLmR35aPZsrP/zzgKQ6xKje5ynqQ2wy69U9gYdTK+RbnE1iXT4n+gN3XnpDRZ4E73nH/TiKtQ/pCiFIN5RaEk2ZAjEuvrz7l0SSjB0YG2UBzZkPJQpM86VIq0uSzqr3zZ/B2Xb67+HTuTlmCODaj6Mm3+mlXQ9JmiGIVPMnQTzp5nGn1DKQ0yuQMmY0VsPjmWtOr0Z0wp8a+fwdcRncSlElEAWo2rS2gd1hD8xHedHQRFmFm7aTneeZETuRI9mIO8SPYO97p3exStgnzK5Yo2hp4kjqXiuuT/u2vE55zEA5u+txGlU5LAlzFaVWlQdDstUOX3QMigPKNLzLZlmr7TdyyYCY1O/LQkhVp0qU/6/KNnHIE1gLe1K7JuwUrxBWCT8T+VQcvLfRVwRyLadHdiC/zaxpnDbqoYU2b7NT/714HTmlIviuAtNYqP61brnc55OV4OHqMb0B/6Qbk+SDfHDO5vlf5ePq6uKU9/u9bw+6Cn38ACYs1KeAosYisv6kCJ5fFqfBdZMXWQd9wERyrqvURgaO2PM+ohuVWFX8dwPhe5Lan8NT8CfOQn2gTmwp+iXjTx+wGAjBA+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(55016003)(86362001)(2906002)(33656002)(450100002)(66946007)(76116006)(9686003)(186003)(66476007)(41300700001)(4326008)(8676002)(64756008)(66446008)(66556008)(478600001)(7696005)(71200400001)(316002)(53546011)(6506007)(110136005)(54906003)(82960400001)(122000001)(38100700002)(8936002)(5660300002)(38070700005)(52536014)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XJCCd94Gw5BHGEfu0lOSIg8SoyZbQiPtj6G3tXcD3MbNyhOnPfYaEDXDUd7u?=
 =?us-ascii?Q?5l1j+KCEL1kQRWvIcCVWxpPs5kFw8aiq22atF1HCoQQliog1RlwzNED+WMqa?=
 =?us-ascii?Q?KHQJAC95rLp7zoilfp5WA7A2maiZPfEC3DcgBQurfzpA/noiQqB5JstqxTl6?=
 =?us-ascii?Q?fy+CnalLON1eGUaxMU6MdfXBtSGiaoh2kvcvR0jEdxS33G3fRaEIp8fIcL1H?=
 =?us-ascii?Q?aYHtd+hcG6FMR/0PbCTX0OR4YcFDtu+iqxZhG6dg5X94oS4yOPdoRAfpcaSa?=
 =?us-ascii?Q?I4m5yfSiOlzWnmyuLFET2Kcbm//aW1js3rceOOk03ZVE2HRLZl+JhBm+PKMo?=
 =?us-ascii?Q?vtnV4pbfU+fxhMAhZJKsf95UaEs7JexEG8+NH+dA0nCnZJSEPtwVB8ovwf5z?=
 =?us-ascii?Q?RL/WS+srcCj6ZHTstWSDFnN9i4EoQEG04jaOXoSUrbAhQWZN9C62VKSTD3o8?=
 =?us-ascii?Q?VS2i3wCfl6R7y7Pee7gyUtO6380Y9/hiCAqeLnHCYQ0dfQeAhKkoE0JcifkI?=
 =?us-ascii?Q?XBQtw8ejCx2YVsprcRQG9Rv5cYqoXkjgcXiEGXKHHYvN3ZKBz+VLBbXv7Te/?=
 =?us-ascii?Q?WQf+XGA5i9zz0UEo+r3i9gYf1XSgnkMVotCzvxlFvqdWKcQir1gtaLRoMRhr?=
 =?us-ascii?Q?tyETJkSxWy7J9jQrCXmas54A5Nzql6togaExWnq4ZpvRfHLZZMIQ9ZMMrHlv?=
 =?us-ascii?Q?JxsM4DQhTsphSoKAo5Mg4njnXurWQZfJwebbPfXjF1huVAzzWFdcvlTkZQv3?=
 =?us-ascii?Q?9hu5Drc3NmFbddO+IAKE5aFogFqWMVGHWMgtcteullUj4dcRkBguPB6zd/BH?=
 =?us-ascii?Q?41cul6m0xbUutkS2XZnsKYLhfE5reE0dPopItkNTuYqNxi2JX6Ubtk7UNoYY?=
 =?us-ascii?Q?xNj4sSwECxE9ucs8RBtOuaYAog9iY0wXaUC+No+ZoRcewYzUF/scVKr4C/84?=
 =?us-ascii?Q?a5/SqV89zSM7areOcdZGh5cX3YUmNUMFFD/+/ngPpnxAib/ySV6L5OFYqXiW?=
 =?us-ascii?Q?qyNkVjIccIs5LYtRll4ApbdH/cLSLKdAyNZtaKuSOac9uEDY9ZrmHgFD3J8f?=
 =?us-ascii?Q?4UKnPdWjLXxVPxcQoTopY5RJav/DG5AW47uQieIzr001NiqXFE5z7f2tq0+h?=
 =?us-ascii?Q?c1mLCMkoclB+P5qRzH35K1daYTZ6YNCYK0wdM1qw0gO+Ai6lM7ssFfKH0/q2?=
 =?us-ascii?Q?cZstciicc2sk3PKmBmcOtZ9Ia0Z3AM+AU7tEMjfBt5rnHvo+NLSf3q/nhhLQ?=
 =?us-ascii?Q?84RQ/UGxuauj/iHxu7b2kD1ekj5EeKK+qyw50W9+pZAFt3nsKBBu+60B3meU?=
 =?us-ascii?Q?JnRgHBMcDGojnsmHT0VAs+h8uhPogFBvw8TAXZM6qT+r0DxsxKhitZ+VPzQK?=
 =?us-ascii?Q?gHTcQQrcyJ8HIKeLnr3qBTGxPjQtEru3DlA/AV0JmN47xwrldiJnSXkKTqA4?=
 =?us-ascii?Q?RNc5mpFf664s0lSjc5P+SOa8jhevKFIhV+a9/QrEWlH6vrKjEugeesfzsS1v?=
 =?us-ascii?Q?es0An+Ohd5LmbYNTypM4iEObJmXPQFYaasIPf9LwnXp57teG0X+IRSmvgMU2?=
 =?us-ascii?Q?0tJNYZawIBqdt64bH02OrezK5PChX6OtpYGE65zRxr1rOCMveBWz53Catz7R?=
 =?us-ascii?Q?kcHebJH4lJLXHGgp5wehQbZfRnDbdwLnPP1FA5F1Yt0b/KKDCjHcQ2CKu7IL?=
 =?us-ascii?Q?eGcJUw=3D=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/XvUyiGPoDap+V1MMz+J49K9EaZOWs2lfuVF4kaTAbbAq1JQQOwhjxz1Ma5QGcm+qz8b1TVGwQO935To0b8B9vHnIUvSLE1YNlpjNwL9On/LsgFm2+jU6GG8urNehxtd+fz69nnpnqJrHD+7xlBl0rvP7GfGCrsBSP3UAvK15uAD7ldcnliMTbnm1fL6uUSxTIVYJhzvZ77zIT2J+JV3cUgVAFnVPDqTQjRkZOg4DOxRfHiuzEy+29z/7BfGjlwbNoZMYIgDWlFxA+hcSJ4PGSipqBOisqC9LiCMYL6e3yslmkz0cpnSlud6o/TA0ZKb4P9IRfCPzd1D+wXHRAjjw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VEo7fBTZcofFNXW+pgydCw+DIPrCLFcKNbjOVG3ubI=;
 b=VPmhuICb5GW/XUN1SMs8/Ic8H0k1MwkO4UKZAjwRuG1TtgXfFrx1JGJcODHeJik9e/xjCG0ysO8rGJpfVzpCzqh4RaUNJvUS7ltr99DzrP5xKH26QjapBEPEMYTPzkG4IuLb/PBPyuxhMIBrfzP532OziGxOwztlvU303NIyH1cb+Vrfu2QRfst+agHhraVnLvFobd6wXJghJdtkM1vr+wJRm8XPQ6kgHUITJLc1E5XUUJc9uRnXIAbXFnq18JwkCOUi5VrUyLj7TlGcljWBDYtIPTU8ABfsRVUruEw3J1umfYbo0qaYw9mA/wNhXUqNIDC+H6kb8C/8lhFpPo/kbQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ2PR11MB7715.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: f7911ea0-96f3-4b74-3f6b-08dafb7563af
x-ms-exchange-crosstenant-originalarrivaltime: 21 Jan 2023 06:04:42.8208 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: GO5ghq5wdUGLP+w+3YWGI8e0klpVNlF6s1hvyzaWupShddUjpcQXEQp1lMMt11eAqsA+jDgvHT6+X5FQ885Cs9y4H9otHSqV8b3JgfAJq6Y=
x-ms-exchange-transport-crosstenantheadersstamped: CH3PR11MB7322
x-originatororg: intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Lu=
cas
> De Marchi
> Sent: Friday, January 20, 2023 11:35 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
> devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v2 7/8] drm/i915: Convert MBUS_ABOX_CTL() to
> _PICK_EVEN_2RANGES()
>
> MBUS_ABOX_CTL() can use _PICK_EVEN_2RANGES instead of _PICK, which
> reduces the size and is safer.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Looks good!

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_reg.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index fe6385443c4a..3d6ad4424265 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1040,9 +1040,11 @@
>  #define _MBUS_ABOX0_CTL                      0x45038
>  #define _MBUS_ABOX1_CTL                      0x45048
>  #define _MBUS_ABOX2_CTL                      0x4504C
> -#define MBUS_ABOX_CTL(x)             _MMIO(_PICK(x, _MBUS_ABOX0_CTL,
> \
> -                                                 _MBUS_ABOX1_CTL, \
> -                                                 _MBUS_ABOX2_CTL))
> +#define MBUS_ABOX_CTL(x)
>       \
> +     _MMIO(_PICK_EVEN_2RANGES(x, 2,
>               \
> +                              _MBUS_ABOX0_CTL, _MBUS_ABOX1_CTL,
>               \
> +                              _MBUS_ABOX2_CTL, _MBUS_ABOX2_CTL))
> +
>  #define MBUS_ABOX_BW_CREDIT_MASK     (3 << 20)
>  #define MBUS_ABOX_BW_CREDIT(x)               ((x) << 20)
>  #define MBUS_ABOX_B_CREDIT_MASK              (0xF << 16)
> --
> 2.39.0

