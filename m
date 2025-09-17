Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19DB7E776
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F1910E04B;
	Wed, 17 Sep 2025 04:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA83hBFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F1910E027;
 Wed, 17 Sep 2025 04:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758082493; x=1789618493;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5iAKdPiS6BXh8lztA5F17nKLACjYPXUQaAb72YcPxiw=;
 b=hA83hBFQoifWpzq56e+4p0HTIRLYAty+ytQxYwa3JAD2Vy5z5Sk8+wP1
 amXu7zmDDJqZ+Nklp6UyuEMhECFFAAlJEX+9pQnLbRrL0I/MVQ4Zg+4cB
 lrrTX7nJ/e3rzi7hUvl/KMEf4IFK4714DTDLOs9KVL5KWIjdYFGK67h2c
 R0AotxX4Bro7FQur49hRF+kT/s4na0R5cQI+zNElQUcl0ASua9S3YLHbN
 ocCvc3yzVtctB1ty5lqpw9AWUCkZY2TLr7gK/uVSIQVm3PBe0Vqfg+MK0
 h1qfciQtnJuvzpb2IFJ6Kw1QgbOFOjWZf/rUCBZ0fgZnCa2GPgrWAmvfr A==;
X-CSE-ConnectionGUID: 1FHyGY0cQjGac3Drl+ySAQ==
X-CSE-MsgGUID: 3gmgPavvSl+5GNi3MZOWxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77816517"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="77816517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 21:14:52 -0700
X-CSE-ConnectionGUID: 3clfgIweQf6oM/whrN3B3A==
X-CSE-MsgGUID: Y40thbSnRAuU9oBoX+0EKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="175046786"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 21:14:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 21:14:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 21:14:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 21:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTHkI6f0PYXMZAOfAQtV+uUuG06JTNZbGGQUJ0EkvRkqcVvMrmdT50Ix6dXub80dawuJqxuGLdtB0lMxoEZYHxnMncOmBk/OvzgUNWOGRoB+cufxZT0UgH8ba6aW1RPtbqOlNLWi6KDNqHdRxFqQFtVkX4COHe0Eg7nuuNCnPGboh7i3Tm4ZYkmgSZcuS3TRRQxNv3ct4LdtUsMbl374ftQbwbf6nQgJ271uVUN78Go9+8hhz1YBwLQO5V/q6SpyF5bptdN7Ab0JaCDX2JM9h9sR5zDC9dITxo6RUFeSUmSSadR5jpd1Me8H9hy1AnRUhbcishXJ6GosZt2qps181A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgS4hWmrdYYZgvhld0rKXEKe4gsJl0c9bktVJog1GiY=;
 b=w/Z3Hggq4eiEBq0SdlM3xW5m5EOVtq6CN+bawM5ZZ3IbC9sODyplXn6Rll3Aw3+VfE79iuvRyvb9MfBNJ41FPvqeEqIKQMn/YsZvYjbmg+tJJU0mzEl3/jRU+ganPKWPNo3N31/ZZpHw3m4wU/jaigmKTzr+1MKBBmV++kLxRY488plssfZjhqiV9QkZnGmsj/XGhGufKj/eADboVsvzUbLRId/iRunwIqBKvlZV4YSzH0xrY1km7VbShJa1lwiGOz2d7hqRbTO1fNjRNXsbjbOIrHlLkYCOkSvYrlTRpWWsqCS5gik3EYueMEK209Jze2u7SJb7EPIPuEcQWqUJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 17 Sep
 2025 04:14:49 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 04:14:49 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: RE: [PATCH v3 3/3] drm/xe: Refactoring the code as per review comment
Thread-Topic: [PATCH v3 3/3] drm/xe: Refactoring the code as per review comment
Thread-Index: AQHcJtyCH7LsOmg7KUiOJy/H6XAkgrSVgfqAgAFCdHA=
Date: Wed, 17 Sep 2025 04:14:48 +0000
Message-ID: <CH0PR11MB542770B0F746BE12B3E8461E9817A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250916072704.2351591-1-s.sebinraj@intel.com>
 <20250916072704.2351591-4-s.sebinraj@intel.com>
 <4f495d7ee43a7ddc7ada573f8ab6f69c6e0011f4@intel.com>
In-Reply-To: <4f495d7ee43a7ddc7ada573f8ab6f69c6e0011f4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|SJ2PR11MB7619:EE_
x-ms-office365-filtering-correlation-id: ddc0e87e-8caa-403b-c994-08ddf5a0be2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?3cLKWeU7Kg5Tx5yVJkC7FE7HXY2xefcQ5EZnQ88OXPdIDBRHvg1lsVN5DbPq?=
 =?us-ascii?Q?hG7ZAV6vy4Ja+Ml8ZaHZ2ra2UTkgHwdsJK5vAKl5H4zjzQlgaN1n2sAgjoHh?=
 =?us-ascii?Q?vIbG6t3GpOXoT6H54ldfSwng/+jjwzI89xFiYzTgR6Qau4cOKoDL+TaIUKIk?=
 =?us-ascii?Q?MC0suu5X9/eV69nt/Fr+QSjSY9vHsrrsR0gvRXzmeUCP146P/go55UHg8zap?=
 =?us-ascii?Q?C83i0zbOKiVmUlM7kTCARIS6ys9O4nTq1+v3T7YPHwRYd5W2Dg6PfAXlJbbN?=
 =?us-ascii?Q?7b92vOaokYMB+b/JJprBlB3N5FhysmgNRmQL5uIpCaUFTibhdrtJdVIH+s+j?=
 =?us-ascii?Q?mWXn2MdK9ml3Mzi5uJgn5yTOgASEluLXdOUjpjo7H0WPR6sQIK2t498sQXKh?=
 =?us-ascii?Q?SvIHSG0zRqEWsWXco9YfRNsfFo2dTVuHWekVqVjMJo2X/FzUBjaLUY4Rc+cy?=
 =?us-ascii?Q?YeeyZ9LoiLdFIcq4fRKNLtcOpVkUGwyCM7kgV3HPz6lNvH50fkvvD2875bJ2?=
 =?us-ascii?Q?1rrapfKsN4izWCWNzI/UmW63QO/b0oO5YWkGZGr/tqNKV0pjUO7t8mu/+xCZ?=
 =?us-ascii?Q?2n/behq7Aqh0UkrGMoIahyBDesJms3MOJlnuKCcHGkjW+L6OKp9WffepZiMc?=
 =?us-ascii?Q?jyUVfGx5eylIn8bitmLagIwWLC6SDD6bYEAaZgMDMX4ihEGli3mLfb764zua?=
 =?us-ascii?Q?hQj1w/EAGHaVIgdhuX1ared9gOHMKSMjbli7XjsKLXHDwMYnGNWllxM7PSk9?=
 =?us-ascii?Q?4kGCmbJmh9/YgoShutuLAunIEHCbzaXpTPHgjaExHyuGkNXeDDS7t6BJtJw+?=
 =?us-ascii?Q?k/NlxyaXJtk5iLiocF/chtU6LcfExjtVseTV7mMpj/Nt1+jWIo2oKYMnDJwH?=
 =?us-ascii?Q?SoMY2TfbWKaWFoXdFlKflMaSyp9gYo+0x01deI065FOI1XCjOFzvQz4Djcnv?=
 =?us-ascii?Q?SptLPNp6h3m0jWJXfNmFgnEGCh+NV0wBQ6ttswHjtdMLi2OFyU7tMSRvKu4U?=
 =?us-ascii?Q?qCg/+6Jsmj0J+U3WkBtcwUI8NI3x8Qf9tSmDIdkom0IIb+m1Utw+JGkpl8u9?=
 =?us-ascii?Q?3ScXA2pZrcEAoOkx90XI9jGxIS+LONzdzJcS5+R54oc/MoVPoysaktl/+LDh?=
 =?us-ascii?Q?WOzAO1sSvK14HZ/7lcsvb9BR2QE+JLnXepvspZBFShgMr8O4VKVXGYSxR+t7?=
 =?us-ascii?Q?rBev0rOpejtYokE52vxJct3w81AquzvZTLUcuSRKGP/V0P90S5G/cWHhv9WC?=
 =?us-ascii?Q?rm7ovTu8E/Y/ROaSLmuRJ7JxoDuOG1lijZsUjRfyh0HLr7dm9NxQ3jqyNiDM?=
 =?us-ascii?Q?UCcHdpQdzlBzbwMpGrn5w4sMQgvbc38JwhmvCQV1NFP4mZuoW3Tg6j9Lnqfz?=
 =?us-ascii?Q?Y8zKvenqjZSiZs4iBgTMrNrTOh/K970M+vHaLLI/MDHcnRzXVdiblI2Pkb6Z?=
 =?us-ascii?Q?Xm3GWx9tZa2FFSSV4LwwheK+4/DnGFnnnPpvRfnzigJ8vZJ2Pc1Mkg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RWsVucP59YYh1cIvHYIbpOvGkGnxlm3kKBJ/Ufc52Bxm1w9Gz17fJYc+V+On?=
 =?us-ascii?Q?xtmMl7A2fqLxg0bmWaCc0VFWjfQk1mGvGILQQ/SBLYXyyPgdpIAQTTHe+t9R?=
 =?us-ascii?Q?PERw6zEiLI4Ni0Z7lpWKLZriOCJSqtemoqFzBKrVBr/Aoad9JrX7t9/C3fs5?=
 =?us-ascii?Q?dDd6XR00LrnGTCJHxWA+rmK5vGbAQjE2xluFshbkH1D0OxmT7wpRFjwzpDbp?=
 =?us-ascii?Q?O07ehKYWDJ5txlG9HV2+5Hh8UER/mIVVNwweCsuRO0v525WJEIiLcJUayBFB?=
 =?us-ascii?Q?bvjQy0jShD2xhkufy6xfIaI72O3EsBUz2Deys9GNJiGoLqPxLDPDdt1qW5DQ?=
 =?us-ascii?Q?43kCxIE9mMabZyK7iaghopXbEieixDg3vaGkboO6nkcGQNNZhoxy8xWJ/l7+?=
 =?us-ascii?Q?OA6V29SKmr/8xYEBvKTgz53+w8bRmYW7Fyt0Sfc6yyc2MsGNPUpn3jI4BoLC?=
 =?us-ascii?Q?kHlkvWMIE7YjK0q3BgViT3n/nhxr8WgKbpaYemvwm5PaN2P8me1ejk61fSxB?=
 =?us-ascii?Q?bx2kR0MGJF8/IBxYQYbgT7Vle41CfJZsCmcZBnmbcIqmRNSPRYms1mEVexxk?=
 =?us-ascii?Q?J0o/sX3sh/fOeX3S4TWK2nOzYY7YwkRTjg7cpii9Q0dJ0nY/J0kkiLnqYCuK?=
 =?us-ascii?Q?wtYcqu4B3eaBJD1C5rdodH4dYLoveLqVuUsa+jiF6IGRBKIPODRQpIIm1A7U?=
 =?us-ascii?Q?GtKi7DbMdvQfBlHExTqn/bvjMp0ZakwWZ4V8ylVACD2iIxYDiltXVSkB6jgJ?=
 =?us-ascii?Q?AqyA/AY6qd5ciGX712U/8O7Famw6bJ6bn2QlJGWrzq21vWAdQpfPXZjhucDR?=
 =?us-ascii?Q?inDS07gRzzzlaDSjOcH6oLICf/YwoRwhFQtV9Y70lOLJxtL+yEksG4iKFP4M?=
 =?us-ascii?Q?2+4geBkpoGAOxpCa1bpYch6qoz46YRazNJoWiLNcv8D6gDU6hypJoWFZakY8?=
 =?us-ascii?Q?WjDLTQxwETFSccaJQnuBD3tcV9fx8qecnLD/DyTDB2WgVC2YCaCU16il0wkG?=
 =?us-ascii?Q?NdNhx/3I2j6jnGapwfna2h5FXRALnXCSNUpcjP7Fm3MTsWPhpjf3YaQzwUSB?=
 =?us-ascii?Q?lrxnJss7i8eGGFZ7szjcemZHd59z4b6rZt2hD75r8MrIC9mz0dOYnNT4+DJp?=
 =?us-ascii?Q?MLzjbfAdNXIfBV84Rey9rclroog0iFstsIn3ZxSXWSErG4Cf9xjcpyePl6Ah?=
 =?us-ascii?Q?yKQiraaPHiAsRwGASmhtVlYfBIgAvy6ZpJ8xpPI2YNspvlLl5DjNfQO3Q1F2?=
 =?us-ascii?Q?uC3ZYysdfeENV9xyOIawursn/f3yw+OS2SFvp25xiRzvTGQumXomrXKq6e9o?=
 =?us-ascii?Q?jlpxVpB/NuisVkBE0ZRdfE7Pau93ZXNNjTXzn8UpSyIakfRMLlUabJ4I/TLQ?=
 =?us-ascii?Q?TZ8e/dYvVNndKzux4pWFXDjNzAGYk7xpGuLzYv1mN8s0kgN+DIv7US61z8g+?=
 =?us-ascii?Q?rG65yoQiSAEuAbv1k4yt9mfOeqGQ6o1+gZhE3cKCcP9XWh7N6zJYUqSHtAzS?=
 =?us-ascii?Q?/81oUhtZDqHF3l0M6D/Dx3yEPAzbywNzlABF0zEcHnaO+13Y3O+EHMtG6XiO?=
 =?us-ascii?Q?PAmzLlsD+p5KgUrV+f8bnXdTVd/Ka0QOevY7cNjc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc0e87e-8caa-403b-c994-08ddf5a0be2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 04:14:49.0460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74dp9voDbMHtVUxTkpHcOZfNrLHM3WsSY2bJG1gGftHcPMEO/PBTHjddzK3HqoJLQuOh+etVvITWQnanXZhTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
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


On Tue, 16 Sep 2025, S Sebinraj <s.sebinraj@intel.com> wrote:
> Moved the trace file header to appropriate path "include/drm" and=20
> updated the code as per the same.

> You're not supposed to address code review in independent patches but rat=
her modify the original patches. This is kernel development basics.

> BR,
> Jani.

Okay got it, so now do I need to go back and make the changes in original p=
atch and then raise again or this would be fine for now ?
Please let me know.

>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/drm_gpu_frequency_trace.c              | 2 +-
>  drivers/gpu/drm/xe/xe_gpu_freq_trace.h                 | 2 +-
>  {drivers/gpu =3D> include}/drm/drm_gpu_frequency_trace.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)  rename {drivers/gpu=20
> =3D> include}/drm/drm_gpu_frequency_trace.h (96%)
>
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c=20
> b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> index b5fa5134226d..e33df068752d 100644
> --- a/drivers/gpu/drm/drm_gpu_frequency_trace.c
> +++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> @@ -9,7 +9,7 @@
>  #ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> =20
>  #define CREATE_TRACE_POINTS
> -#include "drm_gpu_frequency_trace.h"
> +#include <drm/drm_gpu_frequency_trace.h>
> =20
>  EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h=20
> b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> index f188d529ae60..c15d41761296 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GPU_FREQ_TRACE_H_
>  #define _XE_GPU_FREQ_TRACE_H_
> =20
> -#include "../drm_gpu_frequency_trace.h"
> +#include <drm/drm_gpu_frequency_trace.h>
> =20
>  /* Convert MHz to KHz for tracepoint */
>  #define MHZ_TO_KHZ(freq_mhz)	((freq_mhz) * 1000)
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h=20
> b/include/drm/drm_gpu_frequency_trace.h
> similarity index 96%
> rename from drivers/gpu/drm/drm_gpu_frequency_trace.h
> rename to include/drm/drm_gpu_frequency_trace.h
> index cf6337847b3a..47f32fd295a4 100644
> --- a/drivers/gpu/drm/drm_gpu_frequency_trace.h
> +++ b/include/drm/drm_gpu_frequency_trace.h
> @@ -42,6 +42,6 @@ static inline void trace_gpu_frequency(unsigned int=20
> state, unsigned int gpu_id)
> =20
>  #ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE  #undef TRACE_INCLUDE_PATH=20
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
> +#define TRACE_INCLUDE_PATH ../../include/drm
>  #include <trace/define_trace.h>
>  #endif

--
Jani Nikula, Intel
