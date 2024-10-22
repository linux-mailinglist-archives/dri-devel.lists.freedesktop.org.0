Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B939A9801
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 06:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0450010E2F5;
	Tue, 22 Oct 2024 04:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErWJ2eD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AE110E2F5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 04:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729572119; x=1761108119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d8DuDsMsWmmPt3DoOBIO5ThRrv1E6ifLcv3h2os8mm0=;
 b=ErWJ2eD01WDiTheBrINUj441GVX++8jc2erVnAHFy3sVKLCxBhX+p7S7
 YStr0GqRnffo5OhYQMfJT5+gP9ZWP86ofBp0EJux0wt53vOVh73kRbo6l
 yIE3ivF0RE5H5FWJrnBMnPaJWFIP3774Iw7evAfay7gTGD4p4neP3QD2j
 gTqHD0bQHQD1RtBm3hXYkZrGHx5viCPg4roO7Nyy/kR3TguhKQg6Ml6c6
 Iw9Akf7AS7U09JpCQwzlZLzqjmq9sHLKD9fK2CpA7e80Qa63Wu8V89tuz
 xbz86WPfdR71CTzQ67WBzcolu3nFE3WQDkukp4qS4ShL6x43DiC1WmFrA w==;
X-CSE-ConnectionGUID: nlXchOxKRGOK06npGJ2dGw==
X-CSE-MsgGUID: 4tAIoB/jQ1e/sLetjsNNWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28517949"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="28517949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 21:41:58 -0700
X-CSE-ConnectionGUID: OA2cVeqESyq0LUgEV1WsIg==
X-CSE-MsgGUID: pA+HrJrtQfi5eeV4Qm+BFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79658666"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 21:41:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 21:41:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 21:41:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 21:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9YhLaragTPcB4evarVVhH08YY1Sdkp4aZCm4oME94aX1GjhX7RtGtqDofkHUT1YGq/FvUiRz2ndGh9iwvQGAY78VhTviMob6McbCthqlgXKSKtze933g+yfONGB2RHzmtTTvb5lwFcE7lXjMMcumg/tQ304EYCMXZfK+j8b6gKPJyPviH6LnWv4MIJlySvg88aeDxuLVkzmlxAltr/PBk/JC+oZb+IYw2BW/zcuFoSpxCzBN9oJ6Lyzh5MPum+Z0Cz3ikALT24y9oU3MQCleRRhqe4Oe5u3imbTelFGNtKBxI3SWj3elhdbFJjHJVYd5dHnFg7dciVkh4i+05Bj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z/LcCYs1ELG6wCVZblDypcFcmpV4xUV/oP5UK33O5k=;
 b=mCMejYkU+ufTwErYxrmANTbRYF3Knh5ihLW1q4HdUYJbMHwtE1X1WfDXo+20oK6+FMDRgm4O0e+TzKX+iRyYNoik/abAJ3Badm+ED+s9KompS1FSFw3+7f+Psu+2zSwXDISLBwuy/ImrO9DDF6cSKC9UOvK3DM0xVIF1yecfb7Zwp6obd0nmzXHrZDGJLavT5kmaQavD7ZXa9yDCIxbAEscxi06UZioZ4dq4LzV+JQvveZr+G/wCuyx+6XoxYKlObB7svWYwHIgAFUqbAOkScOfvXE2VGRz9zCInAsfK8QurtLgnqT1icjAzRVfJnhwMb7gHlj9dbAsq7t2k4iPuEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 04:41:49 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 04:41:49 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, "Kim, Dongwon" <dongwon.kim@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v3 1/2] drm/virtio: Use drm_gem_plane_helper_prepare_fb()
Thread-Topic: [PATCH v3 1/2] drm/virtio: Use drm_gem_plane_helper_prepare_fb()
Thread-Index: AQHbI0T/oHBvH7FUo0avEvknZScKJLKSCkXw
Date: Tue, 22 Oct 2024 04:41:49 +0000
Message-ID: <IA0PR11MB7185BF5A10E79A81B1A79796F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA1PR11MB6685:EE_
x-ms-office365-filtering-correlation-id: ff93d7d8-5897-4934-38ea-08dcf253d7b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GwkSScyaIBc+jBE7Fzi3KxFN6JlL+91IgrnWdSCgj1kZ6RUKjzLP/3I88GlS?=
 =?us-ascii?Q?6r4U6VMA8CErFeah4L+E5gTilqEqZklS3eoaf+JSeGCY0Op403biNXmAz2k8?=
 =?us-ascii?Q?6wE6mDQIqDm7InFdjtIkNWydBySAPxpdueMFdQ66yHK9/D9R+pGwivQCNTrr?=
 =?us-ascii?Q?drnSBh168WzVZFy+iQhg8K5JOi/ZESN3/yoGTtl0c1jl5rmskl5A4nVdkiOi?=
 =?us-ascii?Q?79RJHOKnAlEs1EOJu6u5hUR6ncx6aS8B1gC8evE+mQsQtgRV9BCbz8U5470J?=
 =?us-ascii?Q?P14mAn1nllnXpgAHhqNpXSycrcaBd59OQMy1NjkqFPf65huoFTcsehoboPWZ?=
 =?us-ascii?Q?n+weBgJawgjKdOafxoSIRCVRO5DoFpRulA070mJRqjZhXn3XQJiH3xsYCkGN?=
 =?us-ascii?Q?Es9iK/+anBm12GRRc2GKBS3lmWiJiLAeKYXlnCIH5d8bkb59+WvDLe6K4soj?=
 =?us-ascii?Q?+bdc76LeFj07EpEJPuOLZ4Z6JchX/bcfNrKowaWuAnFBQwNYazZ1WxcbylLa?=
 =?us-ascii?Q?7eOx8VJOIvpbnisU3gKW6gPtSFGpquXsuMrVpFC5hQ1wB5gCrRS5TZCP9x4K?=
 =?us-ascii?Q?jg+5HKKSLus4kWYHbnUapjlVRtSfk2thSbUGByuJx/72NVz9GhbkXxoUAWq5?=
 =?us-ascii?Q?ZSU/EUxXDfRB6mo/S7qEbPf7/c0AzJHs0yzvhGAapyWkeFQcGzk0Vff3FHCc?=
 =?us-ascii?Q?juKSakcoGyTaJgdg3o3XS/E0v4FY9Jufnps8CaaXUxdB949cHyLrQtnxVgqu?=
 =?us-ascii?Q?xg33Vae8EOW2ZswXyFGtkrNLCAsizf2qhCER8YmS/74PkBlQmHnBA7cCVgAT?=
 =?us-ascii?Q?fLLp25U1+6xzC4j0vST+8MyEy6K1217m3Qn6eCVes9jW1agm2H/wlItZcDFi?=
 =?us-ascii?Q?z5EiN1OxVv1wdhtDYdc8VaZvUxZt05+dadg70KehdsKa4Vne2vS29T1gJBpX?=
 =?us-ascii?Q?UaAtDKOHrdL6TbjQdpPSFP6mtGMo9IC6w4mCc3F8RNj5Jt2vmPbDfU7j4Wud?=
 =?us-ascii?Q?RjVzP2tpjzcP+3S07fE+IYjBuvfq2iKUsgOqCdY4whjZfGXiXBaApwwmHuoT?=
 =?us-ascii?Q?h2jDBU89kWRFAb1BPr/mu30kLUPn2YsK8/3cfUd9kho8nB0brcFZ7R2ePjOL?=
 =?us-ascii?Q?e/eI9hXHjAyONWIplLbzndDtrNsLhywgx83BRullSlr/jGHIvAZvyzDFXV9T?=
 =?us-ascii?Q?qCgbh+Ll7GRQcn1EDpBbTPeKBhAPoMKQr6upWj5P50AySkiGC4kFXsgITjCY?=
 =?us-ascii?Q?m2FCnKRTvfeIsOv9COZPTBViRU+c8fLzuHSwZLeesBE4N+EFU+BI0clWZ+LI?=
 =?us-ascii?Q?Y20pC+1KQ40z02zzUpInZjVWdvM7IeuR6nQtExT68ucYiMx4cNMTZ/XEnWXC?=
 =?us-ascii?Q?2JMzmgk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xmmf73LHFPS1+D456nn6R5vanzAUN56HhPowWlDiABVcmyANXbocpXQW7KiC?=
 =?us-ascii?Q?4KveyDdh/dB3aBmq8ONJnaqbu0zANX+MhWDeon/0a3yOOCfjjvRt3db1X99q?=
 =?us-ascii?Q?rCQ1fA/q7xUUBsuxwKh/Hab862JFYByUwrexWpn6kaOZdH7WOe2xL5EJjXYS?=
 =?us-ascii?Q?zUJWM6r0WPyM3ntlC6I/feKpVlrjOMUrRCbKxfXXBhD9uN+U1hpQOfY2lO7u?=
 =?us-ascii?Q?f7K2eXmdZef0Wk67ZfUvySRwCdXqUUcchY72h17/reNbwu1R9UDyfaeDonPt?=
 =?us-ascii?Q?R4MJESjQrxO8tVYQvymDA8//rEPoqINTCYgL9ByxhI5vI+LSmPOqib+W2o4b?=
 =?us-ascii?Q?wIQ1Pshhb7bBBxZjDRuf3MbyJubY80fd7/+MTv4zzzQHoWzxJlCuyE2BXMb2?=
 =?us-ascii?Q?iaJTTp/tFl9Aw5OcFJ+au0QErR2AmuG2p2wJalfZJMY6Fb29v+0V09OijDm4?=
 =?us-ascii?Q?EOPj8F2J0COtwfiJ3GBVyBOybsCLWqNUA5zpARbMzamlulEW6quDqfx/hz2h?=
 =?us-ascii?Q?aNCCd9GVCDSZy45ksehfBdgG77SUNmdj5x7bmyACylOQSWH1k5MqtcZ9s4Nq?=
 =?us-ascii?Q?6sl2ttOsciRLlqg/WfTVj2u80fVBrPEAkWI/Z9b1T1vO5Q8ycPk43dNDQMfD?=
 =?us-ascii?Q?zNmxWILYnN77+LvLZJQfMf1B/poX/GwRmcd3mB/YQc6z0UaqxQdHlfXWsVa/?=
 =?us-ascii?Q?IG8t2dV0mYmXDLnxoPK3IVXnFyBAvMsJGPrMHvq001Wtqh5WcG//fHmp5wXt?=
 =?us-ascii?Q?Lyr/M1kNiUSTXzuPQ+FZsGOVlAQJNLKkiwAR4xauNyHV3dM3qvrYiMiUAJum?=
 =?us-ascii?Q?LPS0X1/co3P2YLQqEF1mEZ/F0yZ6WbkTnQMEaHNv7mUDmUq2Lz59ZQ3xjpGy?=
 =?us-ascii?Q?j+sjAf2CPuNf0+4LcXJ8awXOsGmx5VzCGhG11D320VdJMweSKUThTgJzzld/?=
 =?us-ascii?Q?zqxbx6eTIj471lRlCY78TaZUBO2rHZaJOKtXfisOz8BA7GCFjBpBVbfvHH3X?=
 =?us-ascii?Q?llaHeRzNDwz6IUu44Y3CX8T2f2UR/i1P6Sq32FqQg5E0HYYyNuSwcr6mBzqZ?=
 =?us-ascii?Q?T/oaVYZKQ//WKoVmWcJNG3DH5cg+Zw4BrKZiMvayBAp3hF7GyWkPeGIvSKwf?=
 =?us-ascii?Q?yhMYxFSY5y2nECjQd4OUyKQWl02/MW2P/JsVSIpKykLpM308ch9g/pvRG4MT?=
 =?us-ascii?Q?k7knaOOEtF9/ddlL8JVIjGgp3qKbKzykeZq8u72S4T/tjK+ITwGULkX3GUK/?=
 =?us-ascii?Q?2fKBUhwnNGl9PBvdzMXXcPC38QhQJqfOC5SS4mrh+Wm4Tf0/l9mFFaUdqTjA?=
 =?us-ascii?Q?wX7a8ulMjPX0MLNa3cw5hVI8vuJNMAJM+deZi7CSkBEEB2nMcipV1zJPM2Kl?=
 =?us-ascii?Q?UjYppuZx9uiJMhHJ9jgBd9m1QTD/x7Gn/YqHlVapQvgyLVksoMR+bWDeP/ZT?=
 =?us-ascii?Q?eKA68e6LItiKLrfrG7aLpCwfesZaOLHwLP5dESNSKCyt2b/loBN8NSKHC5az?=
 =?us-ascii?Q?c57Q993cUfpHz+S01k6m8U5DNLcfkq3OdyY8nEDgyBk0But3xkWQb1ISZ4Tr?=
 =?us-ascii?Q?QJW0JkjAbp6O7mMlnDf/VRvCaVphwHiQ19jnLGqK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff93d7d8-5897-4934-38ea-08dcf253d7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 04:41:49.4894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9thZ1Q62wG3MkQiKD3VH+ooYxvaO50VVI/zNW2KerZlYtdodiIt00Sp/N5Bb1Y/BDcqmSqOR+4yrOmPuntCteVW4H1TPY9fOE5WAoyZcBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
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

> Subject: [PATCH v3 1/2] drm/virtio: Use
> drm_gem_plane_helper_prepare_fb()
>=20
> From: Dongwon Kim <dongwon.kim@intel.com>
>=20
> Use drm_gem_plane_helper_prepare_fb() helper for explicit framebuffer
> synchronization. We need to wait for explicit fences in a case of
> Venus and native contexts when guest user space uses explicit fencing.
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> [dmitry.osipenko@collabora.com>: Edit commit message]
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
> b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a72a2dbda031..ab7232921cb7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>=20
>  #include "virtgpu_drv.h"
>=20
> @@ -254,6 +255,9 @@ static int virtio_gpu_plane_prepare_fb(struct
> drm_plane *plane,
>=20
>  	vgfb =3D to_virtio_gpu_framebuffer(new_state->fb);
>  	bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +
> +	drm_gem_plane_helper_prepare_fb(plane, new_state);
> +
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  	if (!bo || (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY && !bo-
> >guest_blob))
>  		return 0;
>=20
> --
> 2.47.0

