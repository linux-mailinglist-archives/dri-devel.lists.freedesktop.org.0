Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2545977478
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 00:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF9710EC68;
	Thu, 12 Sep 2024 22:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iu9iPkjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111010EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 22:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726180992; x=1757716992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ufBmSx7Jb0+GoskYKChJ+hqeQSBllFAaus5yqy4H4Po=;
 b=Iu9iPkjHnH2XTu01SgJ8A9+kXToNHK8/PQLGDvT5OH9DKZULDUkvCyb7
 Jxc7Oio1G7yxgVAsvI5mh5KYJFNb0clDVphOV1R9UNnKf6LHO1iQnGY5Z
 mVW3D6PL72U0ei1xwGXrYipt5CbW/4swA/Di7cqBay7oWctrpux/crZ1M
 0CjWe/JQ7Ew5PWFYgz4PvV7nQMgE1wQ4oMIlWD8yd8LbJy7+vj0NybnmY
 gmW3AKuHOYDsyofJPX4zVBdUF+t8jy4kUAvNsPH8Xe0HW4C/rLT+Jm18G
 Ylh+JWPqmPVSDSil4mbIUjnkndTmv6rPXPIjAG8yb+sn981btuAidu36N g==;
X-CSE-ConnectionGUID: Z/Mskhb1Q/y9/FUGQetv7w==
X-CSE-MsgGUID: mbc3miYhRnuj1CfyPbwgLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="50482989"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="50482989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 15:43:11 -0700
X-CSE-ConnectionGUID: OgHKtN2IT12j/qoeFOrBww==
X-CSE-MsgGUID: yJdEZB1LR1m++B+72VJLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="72205431"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 15:43:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 15:43:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 15:43:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAxDC2xJ3VWOErgbi5hp0pet8GDXFgfsis9qAv6dpVUQUmLWrG7B7pLDoLIuk4n+q5OyFAc6whvAVWAq027T5q6e20LfCno5Wv1XixcZsfNhfRMrfXiUKhsOLM3LH/upNYdB3us1fkWlFft0GLdC2otxW37emnmb1kRV9cVbfAcFR/jt7+k+JFy7Y2HDhoxiUPUjW+PYZ09s7z8Qqfgoba3jwoiH+2+2Xn+tgmzL2onTmHfqhkLAG3TS9qfqXanafC9xPPWLLUkcLY54Dfg5Df7fXlRhtwK73iKbhBwPlGdJ062zL9zs5Lrz8E1dPUo0iwgXkznL/SP933PfJxLcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=200XK3yFxbbk6YqNYjX3cUzPyWdul9tRHaN93wz9JF8=;
 b=HnEmvhS3Npec1VyT+k/nSAPkGp3oCB7IXmOv2fAdVT5ln1J3695LqFjYPrsQq9ciMTs8OTe/5E0/5QopUnUcIKSYnYZgd7Rb/pGPdl01aSVEdqW/o5jaGdSAtejcgvgq09I9sUVQuSjFDB5Hzpy6YGNhuKJ7kSADfMnO4i0MLVcSnR0edqZxhJLY7XkPSuvqFYgSQbh9Wv33riHOD9EmIgCO9W1b+NcCX334KwId/bASd6rvnUgXuQH+a1BEkE942bD+hYVBb1Ms5+jq5sZxzyCo8NGUrrqTmCsb+qJDVGsOD1lPSMaWG1jlKwyf4Xuvs2gmrbPUsMLVHvaElJjVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 22:43:06 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7962.018; Thu, 12 Sep 2024
 22:43:06 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v6 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
Thread-Topic: [PATCH v6 4/7] udmabuf: udmabuf_create pin folio codestyle
 cleanup
Thread-Index: AQHbAplgwY985GezUUqPxNDJhCJTprJRxsAw
Date: Thu, 12 Sep 2024 22:43:06 +0000
Message-ID: <IA0PR11MB718500FE884B40F8E765E484F8642@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240909091851.1165742-1-link@vivo.com>
 <20240909091851.1165742-5-link@vivo.com>
In-Reply-To: <20240909091851.1165742-5-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM6PR11MB4577:EE_
x-ms-office365-filtering-correlation-id: 1da79b6d-a5b9-472a-17e9-08dcd37c44d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?OwwIiLoY/bMmG9LY53xt/03LgXVfpZ6J7+w2AWbwKPTEzDNkitIQJ5n7J1?=
 =?iso-8859-1?Q?4T6eG6HP2pxqAoIKPIF/s6DnvStXg9zkvP7ee5ckOIMniL8QpI7iCO6azS?=
 =?iso-8859-1?Q?S85Ld9YmjQhF8lMtewehWTLxKY7KUFjDtGPFffpJCBYngFFz2QinkUpf3l?=
 =?iso-8859-1?Q?cAhBCmve+bZsgCnDQJtzMLjt1u7ejW6ldkgsdv+66BVYTqXdeJ77W08jy0?=
 =?iso-8859-1?Q?bb5Juoj/A1Go6FH2Urxcg0+vpNHbY7yn6+UuDw3+G0R3tpPOpqGaP/SuQy?=
 =?iso-8859-1?Q?K3KC54uqwFxUrAZTMtCewNAGaIB+HRvqqVxeV4W0nwu+5FOvgR6wSwGQ0U?=
 =?iso-8859-1?Q?31tc6Or0FhvojDA3QpBaqZr7Dirh6HlFptswrEKvRl2pmX0f9LoAXxNmm/?=
 =?iso-8859-1?Q?c9nGRfEb6nbbE/lSyD+dIXacU6GXfPgAI8R5JA1Bbjw9iKOXUD8j6kveIK?=
 =?iso-8859-1?Q?KE1qCrrOetw14CYbvFqbP0RXE6L3aOLCRUEiMNKkX2bzfIvyqR3AQSea68?=
 =?iso-8859-1?Q?o1BiGa/i3LmlUT+DzFXhR9mBnZk72I4ORBjwkrupnpMy1XBz92MTlVOuVZ?=
 =?iso-8859-1?Q?LM19e5tqYCLSffq0x68Pq9aKWgLlsjikZn5wT65Fbw++G9xVYjBNmB/LM6?=
 =?iso-8859-1?Q?tU5clXysAkskM60v7hqznO6u9tt1I3yFEBmUOEwzuECxB6DgOZK0k43vD2?=
 =?iso-8859-1?Q?cUeyF+BoqZFZk4mavl3CcpUzQ6CzqaXH7Jb0beTBlnjjHDe4KadkIbLSLe?=
 =?iso-8859-1?Q?f7qd3915XikK5xc+rtW7p+oZQjf1AtRgs7I7yMMxMSgwo/pnpNWDOdYFKH?=
 =?iso-8859-1?Q?T1aMXBlpFXSa5wRJjo0vVfoPmqwQW+S9si+NbiWQNdPa83bc478j0wAZLH?=
 =?iso-8859-1?Q?NZR+VC7xIM9thYPaXF8QxP2TNTCo0cD02rweJjhXqNIdya/8ZGSloHeycv?=
 =?iso-8859-1?Q?ynU3M4SLwkIe6//HJk43Y2/xmK/WJJskM98MGqYjAvIv7HDmLB8q1hnjS1?=
 =?iso-8859-1?Q?0vpgPK1CpmU63KWCP/ctvTG+iBakwRs1Jq3kppbisKFELKl+wbcehWkJ0i?=
 =?iso-8859-1?Q?v9Fzm218OaLO4BsBSLg8ADYl0rNA+Fq0xAzE4mq2PnbabAn8hCO6vUL30V?=
 =?iso-8859-1?Q?dGZhGt5k2VtS7hSVHLak0zm7AHNoAFTXyenXa9hRXYV8xMqysA5+Hfn/zG?=
 =?iso-8859-1?Q?YMyOWE80Yqry9ZtGXlh4z/qE8WkNX5OkYo6jnuwk0L3UbA5R1h6r2Hx6Q9?=
 =?iso-8859-1?Q?BIpaCSSGjAB5nFUIltBbxnO9+JgK2ZjyN6nF6BW0OAfllE7Io8EAbB5LPu?=
 =?iso-8859-1?Q?Xj9KSwLS9IruFfmOPsI0ePV9jrkXiG53V6zOr5AVUg1LsaUQR/chGFWsDX?=
 =?iso-8859-1?Q?zK/CTjECxxI/JqrbtSf0Vk5QnCFSYlwAijGhSoLbDBXLmqu483YSskOFI3?=
 =?iso-8859-1?Q?vUKHz1fNUf2SaLljdiZZCzsHwldOsgLiBa6+Tw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NHXqyh/bFLuE1o7Qwn2Cd2NlW/BXkhh8zFiqXSo0GchzBaAr+0Bf5vs1Vl?=
 =?iso-8859-1?Q?QO3tRx/F3mruO6fHl0+20/8k3MZmtt+sdL3bDe73u+K2ooO6PVcjdbgLSq?=
 =?iso-8859-1?Q?WC/OVeIDC1gj5ebPAEB2kiIwAaHukR2JW2/RrM8p0qvl0zqjDcA2ht4p4A?=
 =?iso-8859-1?Q?0Rs5hHjX3xREYhfKqjgm+bvcdALF3EKCsDwWBsbGLziPl5OPxmt/cmmrE9?=
 =?iso-8859-1?Q?J/UXs651sufMYJaZmvLvXbISHMhsy/an43B0/kIgAUiePEggnOh/qckgRJ?=
 =?iso-8859-1?Q?O5LF72vyls96b3xSCeo69Z/Cud4znAe+rAKM8UiunjoaT4UKKKUhJ2Ri5Z?=
 =?iso-8859-1?Q?M/y6+dm82LaRJ7aExc2H3cY+M9eM7g7oGQPU23fP8tynL0/t4HOeB8I8Cz?=
 =?iso-8859-1?Q?J50gUoteMXbLbYvS6GAQInPw31IqcJe0OuGis+lWA+VsmjULP7xIfE1ZRE?=
 =?iso-8859-1?Q?DsoMfEsjXPJ3SAgkTGZoUVeo3NeJO38hB9Cf7IK3BnfP2RvHJHDvWyS4rw?=
 =?iso-8859-1?Q?TFo8G5em4ThhaWgiIO0Aqtevnf5DmdmROij6wkAiDSi01gwhH71obS9G5L?=
 =?iso-8859-1?Q?FYbb+dwxZsTXxPBkbCb89yYLT3EvuxEUQzShV2lx20IOL9mMZ4ZHNW5Unr?=
 =?iso-8859-1?Q?2kTXvNVdkEh+Deb1aoONgijfUe/yH9zT/PQgA0W5+k7Qqf7O43JPQ3klGV?=
 =?iso-8859-1?Q?QJ3vHloov3hFVyAgzLjKIHvDqMM3rTqfCZUdh+DM1yTJ+NrdpJ6wc/Hkil?=
 =?iso-8859-1?Q?q+X+JI3dSz/RExgVXo0cr6coQcG7wutDm3veeLSxx14bY1gkLYfhqCwLRQ?=
 =?iso-8859-1?Q?SyQw3AWidFMp1p7flvF51eQTCwHK9FyN5aXWdn907vlTxxqe/GMOyrK7ml?=
 =?iso-8859-1?Q?zxzwXB/U+iCPes1bGFHQnMhmqClTy8gT2nP7pRc06Q7PxeizYhY765C3DX?=
 =?iso-8859-1?Q?scrbUihTc7NTt9CjvyiZgZuDyhf7d/nO7FjFXf10Lw+NIfz+M2Oa25FhJK?=
 =?iso-8859-1?Q?aBtHzMCX38v+OWrIh+uF7GnFtU3pHAYKDFvCwLQdCf4kp4ION11ihPFJ52?=
 =?iso-8859-1?Q?M61Q5dD4YGmMb9gHnSzDOAEBUF36D9JdswKXB18OIhwQiHVZbysXung6AR?=
 =?iso-8859-1?Q?++eJLqhHAAhiDSojJ+TMk3X0bl9HTal27Hz2BTfVnPp0Es4QRkYuXvR0Fd?=
 =?iso-8859-1?Q?85ysauijOxBLVFMI7j5qm9rT4v/E9psFjcajK4HnWDDmwSM63sCs9F5fu6?=
 =?iso-8859-1?Q?S0n621sorSwsPj96P/EwwCXsZRWaaZTOz1ekkq/usKli/so7S33WEmRs0g?=
 =?iso-8859-1?Q?GK4rfYONeXPBz2o5G4OqzRiMjm3nezuc/jgai2UNA8996fAhO7koeJp61q?=
 =?iso-8859-1?Q?1X+TSdY/nOMK0SGhyGzEYpPFPpXsFdZJtxxXXBT8Whc5+jB+ZD/ohdoGS+?=
 =?iso-8859-1?Q?IJgs9Ecs5KTe3w2Kc+w9TLZpjgYN+AO+lQQvIQHyNeop0o2u78WTmxYMMh?=
 =?iso-8859-1?Q?WbtTrvJg4E+OfxcttAoayaLoWbHnemZuGf+iPkYCE7nmwm3bRGKQq/KmSU?=
 =?iso-8859-1?Q?3hC1hkjlZqtuH1Zw9BeAXslxj2s5ZfGdPguGG8TC/k/OJuaolslMIbIAl6?=
 =?iso-8859-1?Q?9q+ONIAfP6Qf4MYJs+E3e1FisvSBRVCW8d?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da79b6d-a5b9-472a-17e9-08dcd37c44d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 22:43:06.3568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZDZFe1XOm3uZiHCr5QjYyxmlDOx9sBfs73KlAa8kstuyOrLCk9Jfm1ARch40bY4bEE8rB5vVNDrZRjot4fVWaa+5yPpxN6a6Fn7x7XM/JQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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

Hi Huan,

> Subject: [PATCH v6 4/7] udmabuf: udmabuf_create pin folio codestyle
> cleanup
>=20
> This patch aims to simplify the pinning of folio during the udmabuf
> creation. No functional changes.
>=20
> This patch moves the memfd pin folio to udmabuf_pin_folios and modifies
> the original loop condition, using the pinned folio as the external
> loop condition, and sets the offset and folio during the traversal proces=
s.
>=20
> By this, more readable.
>=20
> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 134 +++++++++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index aa182a9dcdfa..fe1466f7d55a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -328,17 +328,68 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  	return dma_buf_fd(buf, flags);
>  }
>=20
> +static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
> +			       loff_t start, loff_t size)
> +{
> +	pgoff_t pgoff, pgcnt, upgcnt =3D ubuf->pagecount;
> +	struct folio **folios =3D NULL;
> +	u32 cur_folio, cur_pgcnt;
> +	long nr_folios;
> +	long ret =3D 0;
> +	loff_t end;
> +
> +	pgcnt =3D size >> PAGE_SHIFT;
> +	folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> +	if (!folios)
> +		return -ENOMEM;
> +
> +	end =3D start + (pgcnt << PAGE_SHIFT) - 1;
> +	nr_folios =3D memfd_pin_folios(memfd, start, end, folios, pgcnt,
> &pgoff);
> +	if (nr_folios <=3D 0) {
> +		ret =3D nr_folios ? nr_folios : -EINVAL;
> +		goto end;
> +	}
> +
> +	cur_pgcnt =3D 0;
> +	for (cur_folio =3D 0; cur_folio < nr_folios; ++cur_folio) {
> +		pgoff_t subpgoff =3D pgoff;
> +		size_t fsize =3D folio_size(folios[cur_folio]);
> +
> +		ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
> +		if (ret < 0)
> +			goto end;
> +
> +		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> +			ubuf->folios[upgcnt] =3D folios[cur_folio];
> +			ubuf->offsets[upgcnt] =3D subpgoff;
> +			++upgcnt;
> +
> +			if (++cur_pgcnt >=3D pgcnt)
> +				goto end;
> +		}
> +
> +		/**
> +		 * In a given range, only the first subpage of the first folio
> +		 * has an offset, that is returned by memfd_pin_folios().
> +		 * The first subpages of other folios (in the range) have an
> +		 * offset of 0.
> +		 */
> +		pgoff =3D 0;
> +	}
> +end:
> +	ubuf->pagecount =3D upgcnt;
> +	kvfree(folios);
> +	return ret;
> +}
> +
>  static long udmabuf_create(struct miscdevice *device,
>  			   struct udmabuf_create_list *head,
>  			   struct udmabuf_create_item *list)
>  {
> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf =3D 0;
> -	long nr_folios, ret =3D -EINVAL;
> -	struct file *memfd =3D NULL;
> -	struct folio **folios;
> +	pgoff_t pgcnt =3D 0, pglimit;
>  	struct udmabuf *ubuf;
> -	u32 i, j, k, flags;
> -	loff_t end;
> +	long ret =3D -EINVAL;
> +	u32 i, flags;
>=20
>  	ubuf =3D kzalloc(sizeof(*ubuf), GFP_KERNEL);
>  	if (!ubuf)
> @@ -347,81 +398,50 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
> +		if (!PAGE_ALIGNED(list[i].offset))
>  			goto err;
> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
> +		if (!PAGE_ALIGNED(list[i].size))
>  			goto err;
> -		ubuf->pagecount +=3D list[i].size >> PAGE_SHIFT;
> -		if (ubuf->pagecount > pglimit)
> +
> +		pgcnt +=3D list[i].size >> PAGE_SHIFT;
> +		if (pgcnt > pglimit)
>  			goto err;
>  	}
>=20
> -	if (!ubuf->pagecount)
> +	if (!pgcnt)
>  		goto err;
>=20
> -	ubuf->folios =3D kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
> >folios),
> -				      GFP_KERNEL);
> +	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
> GFP_KERNEL);
>  	if (!ubuf->folios) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
> -	ubuf->offsets =3D kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> -				 GFP_KERNEL);
> +
> +	ubuf->offsets =3D kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>  	if (!ubuf->offsets) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
>=20
> -	pgbuf =3D 0;
>  	for (i =3D 0; i < head->count; i++) {
> -		memfd =3D fget(list[i].memfd);
> -		ret =3D check_memfd_seals(memfd);
> -		if (ret < 0)
> -			goto err;
> +		struct file *memfd =3D fget(list[i].memfd);
>=20
> -		pgcnt =3D list[i].size >> PAGE_SHIFT;
> -		folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> -		if (!folios) {
> -			ret =3D -ENOMEM;
> +		if (!memfd) {
> +			ret =3D -EBADFD;
Nit: with the above change added, please remove the redundant if (!memfd)
check from check_memfd_seals().

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  			goto err;
>  		}
>=20
> -		end =3D list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
> -		ret =3D memfd_pin_folios(memfd, list[i].offset, end,
> -				       folios, pgcnt, &pgoff);
> -		if (ret <=3D 0) {
> -			kvfree(folios);
> -			if (!ret)
> -				ret =3D -EINVAL;
> +		ret =3D check_memfd_seals(memfd);
> +		if (ret < 0) {
> +			fput(memfd);
>  			goto err;
>  		}
>=20
> -		nr_folios =3D ret;
> -		pgoff >>=3D PAGE_SHIFT;
> -		for (j =3D 0, k =3D 0; j < pgcnt; j++) {
> -			ubuf->folios[pgbuf] =3D folios[k];
> -			ubuf->offsets[pgbuf] =3D pgoff << PAGE_SHIFT;
> -
> -			if (j =3D=3D 0 || ubuf->folios[pgbuf-1] !=3D folios[k]) {
> -				ret =3D add_to_unpin_list(&ubuf->unpin_list,
> -							folios[k]);
> -				if (ret < 0) {
> -					kfree(folios);
> -					goto err;
> -				}
> -			}
> -
> -			pgbuf++;
> -			if (++pgoff =3D=3D folio_nr_pages(folios[k])) {
> -				pgoff =3D 0;
> -				if (++k =3D=3D nr_folios)
> -					break;
> -			}
> -		}
> -
> -		kvfree(folios);
> +		ret =3D udmabuf_pin_folios(ubuf, memfd, list[i].offset,
> +					 list[i].size);
>  		fput(memfd);
> -		memfd =3D NULL;
> +		if (ret)
> +			goto err;
>  	}
>=20
>  	flags =3D head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
> @@ -432,8 +452,6 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	return ret;
>=20
>  err:
> -	if (memfd)
> -		fput(memfd);
>  	unpin_all_folios(&ubuf->unpin_list);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
> --
> 2.45.2

