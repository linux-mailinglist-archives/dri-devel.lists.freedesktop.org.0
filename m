Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B640775C301
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 11:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE4A10E63E;
	Fri, 21 Jul 2023 09:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9124310E63D;
 Fri, 21 Jul 2023 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689931513; x=1721467513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=1+wFG58O2XLDf+mqdBjs4VGqM3QLt3JdqNtN4nqPm2Y=;
 b=EzloLTmy/cHz5buH+EhSaUiJs58g6cxrTWfTxBOIwWw6RQxtnSMOxMje
 gSo6KDsHKFW7Hv3Hr8GUvOTBKJkulcGIH5DfSShqUNSrz0v9Niz8oFOsq
 DaYlDi/ieNfVPq1KMaaEseYVNYdxGawSdmj9rHOcV8yXrR2nRYs/rdXHY
 Wx1j+0tE9sSxnWsby00HHSbN+GFyPAv4uBMaTVAPNkNAlC21LH+jeVrOd
 wGAgNdRv/y2eErryptJN+uZIMsgrQ4EzPOnERr5Y7nEr6YBj7zvzkINSP
 5HfnTsqwU22uxzE4nSm940ZSRvB57hjDuT+Zi/RlZM73S2piRrj2Xlt5R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453359207"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="453359207"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 02:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="728041220"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="728041220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 02:25:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 02:25:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 02:25:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 02:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSF1b5WV+AN6izDbiVy9ilxME9GvL/A9W819NWrwOknrunvHjaSXnCsAXrGeNbhHjwUqxWOQC1L3sJdvKeq/f234oaXnPVtioSTbedffERXGO4BxOEiQfC77JXQ+xJtUSwY78mhv6ZiKFMllYKPcIQ2MpcYT1CDMj5XTzdtP8spN9ITY5YaaJagEFV85ZPaiBYY7+gDdlVyUCHe/bjdH2kFYPnM3JyDK09RLjI/0VNVs5ZAm5kO7eTviMpl+UBhMg9yLbrvz8ZJcOyx+78lXEQ43+M2ZvipUdcBtjfzZ+LZ6foSybaCCYjc/mStWWIf+vHitLbDBO+8LXqX2bT/Mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAOhGyE6n6rkIK0LnMh9SgtlS42+9OId6Q2xGyqRGEU=;
 b=MENFBmQZlMpCSWcLv9YLzDXBBb4dCgVJdh0hzuhhcd+MoJvF48Vh59w5Bc6TNkcrTznluz/nXpoY610Cu1jjtnY6ixJiU2uYqSRecBO1iYC8ieEfIIgHhDW1oGTCpcLbSsOrOqYkid0XZJSarDElzHnbina8ayFsz+nlOOmk1/xsRjl2ItsOazrWZgfg8xdaLTDPRrwi3IJzAktHGQQh6AaacbZyb4XBO00iRlae0P07ue2ngYkE4tjU8oIgJPVc75RqwKE8Ds8XfkPjbcmi2SldMxe8yk3T2fpBIJ09LXQKNB7o6lgvHlDIv0fUjYTahZEzch+baKzmDWBx58ZHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.26; Fri, 21 Jul
 2023 09:25:03 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301%7]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 09:25:03 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
Subject: Re: [v7,2/9] drm/i915: Add the has_aux_ccs device property
Thread-Topic: [v7,2/9] drm/i915: Add the has_aux_ccs device property
Thread-Index: AQHZu7U6nuP7hyb9+UmqmCypaysJzQ==
Date: Fri, 21 Jul 2023 09:25:03 +0000
Message-ID: <2423957.jE0xQCEvom@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230720210737.761400-3-andi.shyti@linux.intel.com>
In-Reply-To: <20230720210737.761400-3-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|SA2PR11MB4922:EE_
x-ms-office365-filtering-correlation-id: cf6c28d5-07e1-4dc9-9eef-08db89cc5d31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e0Gjunu5emBXQ3lyAd+CW6hLT711pfTOuWxiO7q9/Z+/4Xd6twWWTswY6a9I26Lwxbd4iEDF03OEzLfl99oU9dNLYMY6ypW2/bCi/k5hJQSGRWeCCEJZ3QtP2DLeFRhOizOz4a5snMwSzgBkcQoMi9LkvT+rhL+ppWl8z8u/o29aCQ9NmVBS4zauBosH4X0nhQAzFrMcO3/fhZs/fU7e9dYZHGkA8jFmj5WZn5bKe1UBOfk0L762G+zB01MTZJunAFKacSrnjQXPjCERea45sD9we1gMyuaSboqEeocoCZrbBnUI3z50N6tV7Y626OGHw4mXPAOM0gpAlso2NHqXgilSxFf01EYwUaRYsSCL3pf+b95S39Zx+W2xAxZh63DtqftKCKBc6Et+koxeTCuOqSDnfprgVC/ZgTFF1DRbUATQf5wGplxLCkHVt9QLpW56MsRO0UkX18nWTntbCXPdwvgYNgBJ69liS4nCOpsBwK76ZadvdtfMfqJeOBksdE+Tnxzmg5MwEESkwx4KqfaeZHdVcf876g1kFEU7roxXXALIMQSxFgl2qknMv5CnzwTYW2nW6aIbEWxN6WaEGWYtg6zAS9fNzfL528m+Kh3+g2P73MwXCbxOCl5AEwuXh1Qo4YAI9rjUtbAmoF8C9CmYwGWiUbSR8VbiwpRJyuj4oN4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(478600001)(6486002)(6512007)(110136005)(91956017)(71200400001)(54906003)(83380400001)(38070700005)(86362001)(2906002)(6506007)(186003)(26005)(122000001)(38100700002)(316002)(921005)(82960400001)(66446008)(66476007)(76116006)(41300700001)(5660300002)(64756008)(8936002)(66556008)(66946007)(4326008)(8676002)(39026012);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sacj7NkaPv3OdaLa82XGZxeZXMJHnqmyFyoAczQeZm+mDE998OqW97TwKLPw?=
 =?us-ascii?Q?qNVLISEaGX3lKOlDet2veUWhnKwwYD6MsuEPsKyvUi120lylHE04/zXUPKub?=
 =?us-ascii?Q?LToIH2GYz7/CmqiTSCfpw9H4ZDEjhaCbtHIX8NQ+TGbYb9xLwrA6JOtzQfIU?=
 =?us-ascii?Q?m2Ieucq/jSoHMhlO4sOmgzeCBkg1JostDKe+avE3McuFFtFeEFL6/+Ki5i/A?=
 =?us-ascii?Q?2dA4RaqQ2ZTNjhcIO40uw0nGMBbzTbaewcoN1J1GGQ/WOJTheL7jN7/9LjTs?=
 =?us-ascii?Q?MzPZBh4/YMXg3kWTxH8vbohlOaqEAJ/PHp1lA8MF7pnINefIPzGuW9nGuZWd?=
 =?us-ascii?Q?890B6/Rij+e/qIKdka5RUIpkEJCXuTkjxGbPH6n51+oX13tcVAImdp50wKn9?=
 =?us-ascii?Q?6LhuTqx0H5gHRWsOZWC7nR6vk6TUt86spYeeArBguqXHKnLbznJeWyECkZZf?=
 =?us-ascii?Q?JfxWlLOBQC7eb+i4X2iAOrMh428RLxXKAwgmuveVWwMR/vU+Xd/g89kwogmd?=
 =?us-ascii?Q?HSLZoTcbs7OWBLEHKADr2LJPz3ObCxUI0KZsSs0S0z2P8QThpZSQhppAaVt5?=
 =?us-ascii?Q?RdbYc1nSpnL06qJMxpSvgT1lc3McpnzdJI1v2kBvIFdPAT0UG7p6O0/MtJcE?=
 =?us-ascii?Q?+/DdOTBIJsMyJ1ES5YSIFNE0dDpYoP6w375GZzbVN4AisvxjS2KEFgApFR04?=
 =?us-ascii?Q?PEquClL/e2WpCIsdI0FZrwIPithAUGbxuvs8QgiyFsDd7do45URrOE3Tbj7g?=
 =?us-ascii?Q?BnqVWr1Y6rAJgEQxwpdXTjqwolt3Y1Szb4ft7gYyBErF7l3PWGL9xNVrUDCA?=
 =?us-ascii?Q?S//X/dVX7OY7yMNSd5AVDdQeVyAzyWxM2VsStGmXbZIwNLHDEjTspbWvfuNg?=
 =?us-ascii?Q?feHOWLTPSpPnvVn7NsO7H50D9fUcc30U5RbNiSOvYMjRAfo3vVjKYX3izHky?=
 =?us-ascii?Q?EZjT0IIP1FaPJS6l5nPIVrt6cLnhWHMiX5CYNvNayf2eUJcABREA//aIW3dM?=
 =?us-ascii?Q?SozomQBruTi38IU90vv6Ijq4+T6VzBubcNKw2PdOPsxUwHrf/Y0I5jvF1j/P?=
 =?us-ascii?Q?YYshLOBpUyCLIG3tI94sGZ4zT81cGwbNzpl8YnpoorRhZ4R8fjrYJgJpK6qI?=
 =?us-ascii?Q?TGzFLjKUhS/W6LCttJ5m+ZytsfkAQt/PDfmP3znU3Lig6x46YQBHQMqWjaTi?=
 =?us-ascii?Q?cqc1jAYQSOKkPy6CJBXZIkz5ktRZXE65onj4bVVTCGKF7qKPvFIRNG0ZPCcc?=
 =?us-ascii?Q?QCFgj/hr0YMyHaM9jWPlPFtW4pbsiHYSxYGABwQlfyAFnW1Ic+grRZMfIG0h?=
 =?us-ascii?Q?YtjpPNl5YmXjNHzIcLGN1cz2XDov9+5UiGZzKbIcFB1sWG2+xn1RloctoWc4?=
 =?us-ascii?Q?CK+s1ozx2qrKIOWVb7RmSehWfxyxce2n1YrNEJq8H3Te3tFLV2LALehfP6s4?=
 =?us-ascii?Q?9/fJCMkCq1BxyeV8CqoVALFv1DZzPIucnKlyPfa7gN7bHD9K2EPZQvYkZe/x?=
 =?us-ascii?Q?nqfebnpJoF81KV9AmChAbZlNF0WLHNb/Lysp12j2To7qrQy7Pq1EUi2TKm0U?=
 =?us-ascii?Q?PkSNKuozZ7P0l9sjeqD3gvAR2u/+Vvd3ldgvGtIUFKfFePi3qZ592ykZ3oO5?=
 =?us-ascii?Q?BoAOT3bjKzH9sMkoDMBvQho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44D7CBF7FD4E264DA966A1B1B5C412BA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6c28d5-07e1-4dc9-9eef-08db89cc5d31
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 09:25:03.2585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YkSB3sfhzZ2t7RVIJHgeFCbXgvo5m3TxYTKw6OtO6V453uCwJJtj4twA0zkvR9IOopayVh3bH644yR5GsVt5lqbcu9I7CA88LCzzJ8LO5Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Thursday, 20 July 2023 23:07:30 CEST Andi Shyti wrote:
> We always assumed that a device might either have AUX or FLAT
> CCS, but this is an approximation that is not always true =


If there exists a device that can have CCSs that fall into either none or b=
oth =

of those categories then I think we should have that device or two listed h=
ere =

as an example, regardless of deducible from the change or not.  Or if there =

are no such devices so far, but we are going to introduce some, then I thin=
k =

we should provide that information here.

> as it
> requires some further per device checks.
> =

> Add the "has_aux_ccs" flag in the intel_device_info structure in
> order to have a per device flag indicating of the AUX CCS.
> =

> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 4 ++--
>  drivers/gpu/drm/i915/i915_drv.h          | 1 +
>  drivers/gpu/drm/i915/i915_pci.c          | 5 ++++-
>  drivers/gpu/drm/i915/intel_device_info.h | 1 +
>  4 files changed, 8 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/
i915/gt/gen8_engine_cs.c
> index 563efee055602..0d4d5e0407a2d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -267,7 +267,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 =

mode)
>  		else if (engine->class =3D=3D COMPUTE_CLASS)
>  			flags &=3D ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  =

> -		if (!HAS_FLAT_CCS(rq->engine->i915))
> +		if (HAS_AUX_CCS(rq->engine->i915))
>  			count =3D 8 + 4;
>  		else
>  			count =3D 8;
> @@ -307,7 +307,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 =

mode)
>  	if (mode & EMIT_INVALIDATE) {
>  		cmd +=3D 2;
>  =

> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> +		if (HAS_AUX_CCS(rq->engine->i915) &&
>  		    (rq->engine->class =3D=3D VIDEO_DECODE_CLASS ||
>  		     rq->engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS)) {
>  			aux_inv =3D rq->engine->mask &
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/
i915_drv.h
> index 682ef2b5c7d59..e9cc048b5727a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -848,6 +848,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   * stored in lmem to support the 3D and media compression formats.
>   */
>  #define HAS_FLAT_CCS(i915)   (INTEL_INFO(i915)->has_flat_ccs)
> +#define HAS_AUX_CCS(i915)    (INTEL_INFO(i915)->has_aux_ccs)
>  =

>  #define HAS_GT_UC(i915)	(INTEL_INFO(i915)->has_gt_uc)
>  =

> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/
i915_pci.c
> index fcacdc21643cf..c9ff1d11a9fce 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -643,7 +643,8 @@ static const struct intel_device_info jsl_info =3D {
>  	TGL_CACHELEVEL, \
>  	.has_global_mocs =3D 1, \
>  	.has_pxp =3D 1, \
> -	.max_pat_index =3D 3
> +	.max_pat_index =3D 3, \
> +	.has_aux_ccs =3D 1

NIT: Can we please have the last element also followed by comma, like in ot=
her =

     places (e.g. see below)?  That will simplify future patches.

Other than that, LGTM.

Thanks,
Janusz

>  =

>  static const struct intel_device_info tgl_info =3D {
>  	GEN12_FEATURES,
> @@ -775,6 +776,7 @@ static const struct intel_device_info dg2_info =3D {
>  =

>  static const struct intel_device_info ats_m_info =3D {
>  	DG2_FEATURES,
> +	.has_aux_ccs =3D 1,
>  	.require_force_probe =3D 1,
>  	.tuning_thread_rr_after_dep =3D 1,
>  };
> @@ -827,6 +829,7 @@ static const struct intel_device_info mtl_info =3D {
>  	.__runtime.media.ip.ver =3D 13,
>  	PLATFORM(INTEL_METEORLAKE),
>  	.extra_gt_list =3D xelpmp_extra_gt,
> +	.has_aux_ccs =3D 1,
>  	.has_flat_ccs =3D 0,
>  	.has_gmd_id =3D 1,
>  	.has_guc_deprivilege =3D 1,
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/
i915/intel_device_info.h
> index dbfe6443457b5..93485507506cc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -151,6 +151,7 @@ enum intel_ppgtt_type {
>  	func(has_reset_engine); \
>  	func(has_3d_pipeline); \
>  	func(has_4tile); \
> +	func(has_aux_ccs); \
>  	func(has_flat_ccs); \
>  	func(has_global_mocs); \
>  	func(has_gmd_id); \
> =


---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

