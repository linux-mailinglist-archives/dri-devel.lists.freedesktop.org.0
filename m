Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A68676416
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 06:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7FA10E10A;
	Sat, 21 Jan 2023 05:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB51B10E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 05:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674280703; x=1705816703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q5Cbrj5T2+m0Ckro7zrD2FkckA7WOoOk4KO+DHhLogA=;
 b=lieorD0Q+cXWOBdMW1BqwIfTilhY/fyFz7qCq9NOLZ3EgpXJrMlD3uZi
 OwKGRYSyiCi8DeByKbo7vxNKaybzsCf7XvIrPEY2CFFlUpqq1kTrWKEaq
 Bp8n7SR32UkBKuUHZcM0LAtKf+7WaM0SKF6n8Rs9CViMW6d/Q4/T4qcPA
 SKKiIzUla7Dw9YyZufaC6SrlnRc/j+z3+zxvn72+W48wUgkz2v6fHMj0T
 ASIHk0gL6AFnpU5wrp7c6+3mBAHsp0nDSjP9R8SYYhA+gbulZ8G8Oh9sY
 z27u+UgtvtCvqRKYGoqevjo8JqwH6bDosKlx1Yn9+UiLwDzJ4bhxOAgS6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324449717"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="324449717"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 21:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662777055"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="662777055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 21:58:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 21:58:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 21:58:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 21:58:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 21:58:21 -0800
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sat, 21 Jan
 2023 05:58:19 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117%9]) with mapi id 15.20.6002.028; Sat, 21 Jan 2023
 05:58:19 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 4/8] drm/i915: Replace _MMIO_PHY3() with
 _PICK_EVEN_2RANGES()
Thread-Topic: [Intel-gfx] [PATCH v2 4/8] drm/i915: Replace _MMIO_PHY3() with
 _PICK_EVEN_2RANGES()
Thread-Index: AQHZLQZnQ7Fy6XVYk0KldYWNFlZKFq6oYFyQ
Date: Sat, 21 Jan 2023 05:58:18 +0000
Message-ID: <SJ2PR11MB77159E76C52390598F8D08CAF8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-5-lucas.demarchi@intel.com>
In-Reply-To: <20230120193457.3295977-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CH3PR11MB7322:EE_
x-ms-office365-filtering-correlation-id: 5bd86e9e-c8bf-4721-1f7d-08dafb747ed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HwmpL02GmuBpNJnloRyJrNxOhHsX+X7ITFcHUubQewQLqDj5leHsVTDNJDvKgWcwdiO/c/68qzUNDBmiuZ+16PuCdhAWCn0fX4/Qruc4FB2cFgcv3PNGUto9yvAMFBk/HLu0+KRAfQE8YTIYjtbz9ErD4qj23O2LXrM4kou5yxIWre7EJ0RSzOi2ErM+rjGkRIZQH8UV9y1JUTaUBYPTz/rMhVWUdRXiexSaLHsPyxi94ML8RqovJscCXkrX3Vn6TjO/XUjTlB5EZ5gSTpNw0xWBI+bHQ+wJG1t3ULOPkIW5TNdJKU2vSXtK+s4e88tUgZ7wcx57rEiiVrVfPaReRJx3mTQJH+s8IstKBxkMova18zx5KOKltw90xHEU1ce4vPjxf5ujlYnkR1g23c0OyXu/OUDNIdVSPDzXP7jSBZNtSoraoNO8RHLfWLtZXNghmzAJfeQUlkUBgHI0e3RjgjAKdkztdSKU5qJBA62tHK4ab0etvdxo6zR9oJLFoycl7k7E8IO+Pxh/wPQnHSRLzkNT4ikekiTGLviU7BLvK7G268VC2/MmzjFecEARGQIesb2CPGm0Ai+Pj91Hehtd8Ni3DlrcF47wCoVwes2byG2QwnoJqbszFYmrDz0H5iAus9Wit3qKFPgPnMbJ/gnwND0B7bSuIWI8ngDP176j7gAjz7qC7r0UWvU4kLJm/8+GrkIxK05jpMPluBzgWXEgyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(55016003)(86362001)(2906002)(33656002)(450100002)(66946007)(76116006)(9686003)(186003)(66476007)(41300700001)(4326008)(8676002)(64756008)(66446008)(66556008)(478600001)(7696005)(71200400001)(316002)(53546011)(6506007)(110136005)(54906003)(82960400001)(122000001)(38100700002)(8936002)(5660300002)(38070700005)(52536014)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6GJeqENY38N4ISeAg+KcljcLxs6Qd0GVTFdO5BKSOArVqOn780fyZlB0vdyR?=
 =?us-ascii?Q?YxfHrdufAyxDnt0zX3HUxuhtT4/iK+VLnCq3aZ1HQvSTyvqYWNSq1MFGl6JP?=
 =?us-ascii?Q?ebJZzGsBxhAN58Y98UxvmQe2JxUtM7lXxH290sNmGJ5ICSn3Fvf0l8OgemQt?=
 =?us-ascii?Q?/BivSmtHV5G/fot01jTg9A4rE4F2LBsKmd8PLOAYNhh32LZlwYVB7wdEl8mv?=
 =?us-ascii?Q?ze7MvGX3Uj7tCNhQx7Igsqtzd02fyRkaHZasMKI4BW1qEp8ZrwKmdyRDzny/?=
 =?us-ascii?Q?aAaLYn4OFXAVIK+uhnGbWhNB0Z9MD41FHkJI974k7JXVnVZS0FOuYGUHj9Wp?=
 =?us-ascii?Q?1QtdTm9TMRaNi7KMi16Mg4ANppsIDfRcEY20oraBmjllcElFh7SuYaG1GVZ/?=
 =?us-ascii?Q?kZu/cpE7dyxHEFdsR6LHF2Lab+RgAvw7M/4MfAsd2dSuzLt/2J4xvSEM4ccG?=
 =?us-ascii?Q?VBzMOd8zEPUd7ztEWc6/RqF3YCWXPKh0NJWVq491+f2sm+x5RdLKV+Kd0rxC?=
 =?us-ascii?Q?OKqJmno5U1rbiLJjkvkxBHCTNGLNPCBihvJrsRS3YPR8HWx1pFvUTwrDfeYT?=
 =?us-ascii?Q?9Ity2uB/QtXNRb1WmpNK+Z4tfCDNIaYsHQ/STK/aG8Hi5RRIy1BMW9KJFH2Y?=
 =?us-ascii?Q?B33VJgbK1FTvcUaMfhed/c1C6ZW5ZKmmthlCdSFwtHVXQwsNnG0kfxxZMphi?=
 =?us-ascii?Q?2lfjFc/WmKXADAS1E/TnFFdegibW6jlykGQh6AARs6TVYFLGb5bfaEHObc5M?=
 =?us-ascii?Q?1BOboaobl9n5Hcp1Y6cPwAsIPTVKNKFUSIytLOprF5GrZQG7ZdRqZOPRq3p6?=
 =?us-ascii?Q?7dMGseBexH4aoiqHhuiKx1dt9A4DdwR6nW4QWqPhsgCtX2hEfWEK4HG1BeFx?=
 =?us-ascii?Q?5KqMMtc2UjDlX4vHSfCMihwMR03DWc9YTCMpo+LrGHW9+InDxBvYRdZXf//0?=
 =?us-ascii?Q?e9n2nB1JigXoAzqm641cKQv6vk5B8fpxtT/6vYJZ6gOXIIxRf/ahtbh3E4F/?=
 =?us-ascii?Q?LToFxy6lGjbVE6Hwz5+Wi7GyzOHSaLG0kezAlEElqnllgG483pk92ItCKVuX?=
 =?us-ascii?Q?jBARB/YoHOjyTRVSxlikR1t6eTuKaaSN45SwT+5s1V7kDC5Uwkkv8fXzDsIn?=
 =?us-ascii?Q?vzEEwI2co1AZeUeHap4F/qNvhZU8bYDVHKr9vzEQ4Qh0b3tqfbc3DN6mAS3D?=
 =?us-ascii?Q?0R3UFbnaSw0zbPujW+ervqXfabX+a/rpbGKan+HokDRo/mE5eVHugZmO71MQ?=
 =?us-ascii?Q?DDOAEJFJYoy3jZC3OCQGUEhA8TKVVFeDvDxW8GYxK2lzElGW9BkIypU7woVs?=
 =?us-ascii?Q?jCZKf42nQ0qiRSa+B9j1yW1L/TAtHSiKnMjpdY0ARrZY/ImzQSlpU3pZfWKj?=
 =?us-ascii?Q?7BaOnVQPGs2SDb2Kxny2X5MOp5wR7G8bzyorQBJPuJebJDYd1xsOoO5ytmUg?=
 =?us-ascii?Q?XTG5li3erXinmrd8q8ae3AY7N4ZEejU9woiB7xhs4Daawp03KxokbYDqzQGv?=
 =?us-ascii?Q?8d4LjpIFuAIaQ7FPzBl0jxXBBP1iEx412GPVLUVpBf8cCYUfXPg7U5daPqCp?=
 =?us-ascii?Q?CQIOHoKr9l2aY6XChYJE6n24cSatGDR4dduwiCJJRIynAXKrHqvACavpnS18?=
 =?us-ascii?Q?Gdpz1IpDc4GG0NHAI8QLJESCMzJtXxceEVZ4c7pkgi4Uq98fKJZ/s2tdCyHs?=
 =?us-ascii?Q?ml61gw=3D=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ8SxdxZnO2rjWShuJbs0owdtlnc8lb6toyoJoymcFU+E0YEZWCbRNhcudJyMrMVQ4hyqoZwfkMjNlLbLSkUy33jvkhkmyvslkuJjk/Qt/BTkhPo/tcsMU3iIRsXbbID+66TqwUpD7YCXpHmT+2Wbg8ltpuQsfPWP9qpbx8dz9OJykaLkiOk/DguE2+OqaAjEb6hzfA5Tf99zYe7fL3sufjYzRWcXCa6SsoiAErvatkma3ctVnRn5pwY9vfRsxvOgSIUH6ajxEUCuAUg6RisHNGWAlIDHw83CGnuZS5nYSVXK3R40gSbwDDzxv2YwaIblZsFc3LKZGFFf8R0RsXtyQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnHrKiYDrywSDZW/DCuJusM1ciNUvY0rXG7neac2zmc=;
 b=api6WWgOfWRu2arRAS3vsKZEG8kmgzwRFQ+NEa2uf/mByWbrsAPfbqneD7k/YeoOncYviqQicXrAO4qtYSAmHXQqUqnpkriV+asRPMEiCnQ2hY02oBRL78AcX6AEFHXceKZ2riOwgO7cmVhqNwB7sGCG1g58HZdAJwwyGPHFSZWqXvaG85+YAXzBegf0M/eVkujAG3OWRHxuuoEF1CZ0IEfGkW3NhISLaqiJGqA3Aax27gOZX/JxRkWchWoLA35ywPKkN45Eg9G+3PjKsPOA3h9Wv4tc9eD6bQM/6f0X/gU/0ua+sd6ePZQWjHcP0Bv6kfZmhcMzuJBbpwqJy0/8OA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ2PR11MB7715.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 5bd86e9e-c8bf-4721-1f7d-08dafb747ed6
x-ms-exchange-crosstenant-originalarrivaltime: 21 Jan 2023 05:58:18.8463 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: gEoqlwV6geISqCmLKINrych0y0rsG+p7tcQIMr6qDDKBi+9T3vxxmkwYgxp95KoV0/r4GGBGAZvHgOHi7y4JwBiSbPG/wkOhYIM1wPxuo3k=
x-ms-exchange-transport-crosstenantheadersstamped: CH3PR11MB7322
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Verified that the new macro evaluates to the right register offsets.

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Lu=
cas
> De Marchi
> Sent: Friday, January 20, 2023 11:35 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
> devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v2 4/8] drm/i915: Replace _MMIO_PHY3() with
> _PICK_EVEN_2RANGES()
>
> As done previously for pll, also convert users of _PHY3() to
> _PICK_EVEN_2RANGES(). Size comparison of i915.o:
>
>       $ size build64/drivers/gpu/drm/i915/i915.o{.old,.new}
>          text    data     bss     dec     hex filename
>       4026997  185703    6984 4219684  406324
> build64/drivers/gpu/drm/i915/i915.o.old
>       4026288  185703    6984 4218975  40605f
> build64/drivers/gpu/drm/i915/i915.o.new
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  .../drm/i915/display/intel_display_reg_defs.h    |  3 ---
>  drivers/gpu/drm/i915/i915_reg.h                  | 16 +++++++++-------
>  2 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> index a4ed1c530799..f1681e1396b5 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
> @@ -29,11 +29,8 @@
>  #define _MMIO_PLL(pll, a, b)         _MMIO(_PLL(pll, a, b))
>  #define _MMIO_PHY(phy, a, b)         _MMIO(_PHY(phy, a, b))
>
> -#define _PHY3(phy, ...)                      _PICK(phy, __VA_ARGS__)
> -
>  #define _MMIO_PIPE3(pipe, a, b, c)   _MMIO(_PICK(pipe, a, b, c))
>  #define _MMIO_PORT3(pipe, a, b, c)   _MMIO(_PICK(pipe, a, b, c))
> -#define _MMIO_PHY3(phy, a, b, c)     _MMIO(_PHY3(phy, a, b, c))
>
>  /*
>   * Device info offset array based helpers for groups of registers with u=
nevenly
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index dd1eb8b10e0e..fe6385443c4a 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -541,9 +541,10 @@
>  #define _BXT_PHY0_BASE                       0x6C000
>  #define _BXT_PHY1_BASE                       0x162000
>  #define _BXT_PHY2_BASE                       0x163000
> -#define BXT_PHY_BASE(phy)            _PHY3((phy), _BXT_PHY0_BASE, \
> -                                                  _BXT_PHY1_BASE, \
> -                                                  _BXT_PHY2_BASE)
> +#define BXT_PHY_BASE(phy)
>       \
> +      _PICK_EVEN_2RANGES(phy, 1,
>       \
> +                         _BXT_PHY0_BASE, _BXT_PHY0_BASE,
>       \
> +                         _BXT_PHY1_BASE, _BXT_PHY2_BASE)
>
>  #define _BXT_PHY(phy, reg)                                           \
>       _MMIO(BXT_PHY_BASE(phy) - _BXT_PHY0_BASE + (reg)) @@ -566,13
> +567,14 @@
>  #define BXT_PHY_CTL(port)            _MMIO_PORT(port,
> _BXT_PHY_CTL_DDI_A, \
>
> _BXT_PHY_CTL_DDI_B)
>
> -#define _PHY_CTL_FAMILY_EDP          0x64C80
>  #define _PHY_CTL_FAMILY_DDI          0x64C90
> +#define _PHY_CTL_FAMILY_EDP          0x64C80
>  #define _PHY_CTL_FAMILY_DDI_C                0x64CA0
>  #define   COMMON_RESET_DIS           (1 << 31)
> -#define BXT_PHY_CTL_FAMILY(phy)              _MMIO_PHY3((phy),
> _PHY_CTL_FAMILY_DDI, \
> -
> _PHY_CTL_FAMILY_EDP, \
> -
> _PHY_CTL_FAMILY_DDI_C)
> +#define BXT_PHY_CTL_FAMILY(phy)
>               \
> +      _MMIO(_PICK_EVEN_2RANGES(phy, 1,
>       \
> +                               _PHY_CTL_FAMILY_DDI,
> _PHY_CTL_FAMILY_DDI,  \
> +                               _PHY_CTL_FAMILY_EDP,
> _PHY_CTL_FAMILY_DDI_C))
>
>  /* BXT PHY PLL registers */
>  #define _PORT_PLL_A                  0x46074
> --
> 2.39.0

