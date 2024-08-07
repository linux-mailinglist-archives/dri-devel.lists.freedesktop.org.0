Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C994A962
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BCC10E530;
	Wed,  7 Aug 2024 14:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2UALeLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186610E530;
 Wed,  7 Aug 2024 14:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723039577; x=1754575577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lHbkSYZU6Z2S/mQCNBiL2Or9cIFMpAS54iDbbn1YH18=;
 b=c2UALeLZX9wSOfOseS7gERptGYqk7GnQAvVnaCZc9Vne91qknTvMeWrl
 Lz8Tn6eMiZWad5UDIiUTrCH6kwur+obLi0tGN/0EhQo+sjo4dzpRl25Mz
 8ONF86VXwNwTngSqHO298Q9jgUw8vzwPX2v5cLtSB9gBrwWvBt9tbonlj
 XKusa/GXe+mQ+MfyjLykRj0oz3h5REcllKSr1BYpxaCWHnIyVy7jg3Fsc
 GUVHSDLL3NmKG4UzHx+X+bXxVMRmUT+d5g1d0dVbofm+l4ilZGw9Nhbqw
 UBgGFZQjY4py9tPQTU4bfbWK2x6V8UZm+1DyLA3qz/FuXX1FYoqHVnnLh Q==;
X-CSE-ConnectionGUID: h8UujOU1TB6bCax/+psBfg==
X-CSE-MsgGUID: R9WHz8gPTg2wJoB2Y1SNSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="12901650"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="12901650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:06:17 -0700
X-CSE-ConnectionGUID: M2U/+ndQS1i6PRc+rIxyBg==
X-CSE-MsgGUID: 7QFpwdKkQviJ9abYBmKSlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61682496"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 07:06:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 07:06:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 07:06:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 07:06:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 07:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFrjLzlXnaDXztdxdZ7XHyOhoNchiwQk4n+ORaQKJ0+SlRSj0W9bRVRhnKIwN48jPI2k2tK7176CU+paDi6C0aK77s8w7i2mqKvOjuHv3jsCcmh7j/mEJwEUuCQcTZVj6UidgvoPbr/qzu2CrBFTnEYlIYTczqSTVp0xrHeS/VieIFh6Cu518RdbaNtHS08aE5oDKmZXOxWSgGxGVXpbft84+Wxmm3jAgToUEyV0pogPdyIWJDZj7/99Nhk6AN8w2HNkz8Uk+A/kckdPyfqmuPVB/GU14MzVhh3fxBjQR8ui0xBnjk4MDATbeVELB5w9gb9X6Kr5KYTnwMtPUXG3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VQhYWeFDjwQ4hOtLhEq1tBUYC/RcbNA1aEJYpSU+vM=;
 b=H+wN7ZS5Cj9w0+DZ6E/OSPEfsX0+Tj9hjIKnxON14DjA811KhS227786ar7Y25XSUF7Ow6qpUZfM2GgJZlRS3TP/I1jDFN0WeEed4dRutrXbOgbeW6I51vOsTwuxA7Ks1epo0jRlkdlt3sLrdpzczgjGBQV5uBNnCZnEeuKUbvtSke0/RTnTd6z1j7My84qn76x00mgxFgVFXvIJLz2U3X7bvXDu32zsLGaqefRPvAQxA41k1zqjYwDZOCkp3V954HcjxQHfy1wbzD2J34557+UJCwYMz4uPBPDQcxJyEmqYc6iSQRRX9Y8s1Wp7UHfKDA4Z799s0s1IOMmxSOLmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 7 Aug
 2024 14:06:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 14:06:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/i915/gt: Mark the GT as dead when mmio is unreliable
Thread-Topic: [PATCH] drm/i915/gt: Mark the GT as dead when mmio is unreliable
Thread-Index: AQHa6Km3/Su2drvNI0iR2N0hIh6x+rIb1A5A
Date: Wed, 7 Aug 2024 14:06:12 +0000
Message-ID: <CH0PR11MB54441F4EF8129BA2A411EBBDE5B82@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240807091014.469992-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240807091014.469992-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB4959:EE_
x-ms-office365-filtering-correlation-id: 091564fc-af74-42cb-7282-08dcb6ea17ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9iapLDmKylzsBRY3fEACAG+DWhqErf1oxUPJONqeHRTCFtO0Ekn5pQpUA/eX?=
 =?us-ascii?Q?jAoykbVH/akWU71YFMjfcSklg2joPiX2zXxLf2OeG/kvZp6y8+anhsBNUkls?=
 =?us-ascii?Q?wtogommo1eeS8E49bMePTILrIxvbnWz+nIzX7WUeoY65/4ZmL4mC6tOwdMZJ?=
 =?us-ascii?Q?sKX5k+ToF95Lyn3PbEKsT2CmJ3PC6C0RBo7RXtsVq6yNRemOrr/zMN+eMjIf?=
 =?us-ascii?Q?19qi7iwjcDLlB3ly7UShqcUCace+DUfZaYEBeelTVpJGuL68SGe/L3wrOOAL?=
 =?us-ascii?Q?tYx2yky2KRPwftZ+qFYWixmMVemiIbGmp1eeHxWtxze7yN1LbHtDgYcNjeJZ?=
 =?us-ascii?Q?PQxgKXYc4sig+ADR3wvGZbvxh20sKwX8dnIP5j1uSxZTpP9UOEIjnpzUfcjz?=
 =?us-ascii?Q?rBx/CDPmRxS9HMYJTg22Jy3PWbe230nvkw/s36yAArBdOmr21HGX7qLqFcIk?=
 =?us-ascii?Q?bjl4CuhjsRhPSimSwujDxYo926+WYe2di2KJjk5p7v5MAPTqQTLEkie8954n?=
 =?us-ascii?Q?QKQednOLdeUPNYVt0DUj8sdHKvZbmJP6omeW+lS5MpJFON3PkGzkSOCSlzcn?=
 =?us-ascii?Q?E9FlHM9VCXoyVXnrPp3pq4tL0HScpuYzhvy08B4detqaTkcDha0I0nrsZFEP?=
 =?us-ascii?Q?yWITVp8EhPub1/kX2ncHJ/KkucHP63cEY+Oc+svhGqbuf7TyVlLz1nJvMuD6?=
 =?us-ascii?Q?R3zeN9F5i6c5mAhxqurnd1SCUMug9VnIyBTJfus+NPJfcaMx87RrWrC4T02P?=
 =?us-ascii?Q?8Rx/wf0TPyMC2cV+w0Qds1yAlh2z3hA2ZYRAcxTsdncx+RH9Z6BT6osSCCia?=
 =?us-ascii?Q?o/yCtTOL6kqCqwwTAoupebVp8MtVxW304ObYAUNIYHWO2TQsCvl7JlyS9mUe?=
 =?us-ascii?Q?HuLqb7FM0o04QqA7HfJf6gk0qLTww27fW/0YAw2+ZnHUAcyW88u0ISTcglfu?=
 =?us-ascii?Q?CVj+Ypan2XauHPZlq+7GYq6f1caN21zgMyFGydzr4TS42A78H62qcWX7jE7r?=
 =?us-ascii?Q?kSqbaSu9BgzqulOR+pUJkZrmzlbRJojj0JQicEOt6yngnIhP8b007j5/julc?=
 =?us-ascii?Q?/TfqfxXGesYe2dMt+1O9dApBL7nlQc2zUHgZ2PAIcX48Yadc8ySLERjG7Hs6?=
 =?us-ascii?Q?a5JW2FscuXSx8WyzI/qs69qSO/3/ljnNLmGS3yxlLu5YEHdLHK1zFkp5WbTH?=
 =?us-ascii?Q?JXvRRIC0dLX3cCPNDbiFskmfez2q799VG5dd1N2ingkbudaI0fKp+rIFwMYT?=
 =?us-ascii?Q?9i5N7hFmLcCyx5P2crH+uT5qjSvaeGMjPLJvFmW2sRBIsbgk7pntIm0FUcRT?=
 =?us-ascii?Q?GSVi9arJXehOWIAhJm9Qev7uInK90AFr+2wPL6JXqnD8hRkOKiHQVl0h58P2?=
 =?us-ascii?Q?qWnpDwHKTLT5+JpA19Mq5QNmsInLf9dvgYeQDjd8GCJHpmLDjA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oKDwJG+UMZL4mo6PWzmA3fZf05isLwyd2wxZq4jm62cQzBRTPiu59NXrQpTT?=
 =?us-ascii?Q?tfPItnfLOiNRSISzclR1TehooMs4LRMpp7S0WNAY333M0+4oblK7YEV1dWPQ?=
 =?us-ascii?Q?KD/hu5Dvzqyv8SIlsbMZidA1aBpfSRbd2x2z0o4CuXDKOFrzasKOrM8W16w/?=
 =?us-ascii?Q?bxB6HqoQrBvVVM0rpfXghLSE8ZIlZkNgL9FA03SLsv7EtQxEFvNFCAWDwOua?=
 =?us-ascii?Q?FgaE3R8o4j6/iq84I6j8uKhBmVrESrPa32HE4+Z5i31IoyfZC9s+iPpxVPcT?=
 =?us-ascii?Q?hGAoDGC0tLV0szdWlHUZ3j5wZnR7/cmz85tSVyHPJGyG2g1ruSprdIDCmiVu?=
 =?us-ascii?Q?jg1iqMKmd5hstilzrrv1U9CjP3YgVypKFY6wiBTSp5fHS/oVcbUCABLXQwDb?=
 =?us-ascii?Q?ryEt1desAvRv9tIC8HkaoH6pCZXwApCRn391zK8symNCufEINIzHXXtEdluj?=
 =?us-ascii?Q?no1eNsPSnf+tvlnP94UNOH8pHZ1DZd7zUQl8E0To0UorEFK7AcvEvm0qszzm?=
 =?us-ascii?Q?ekpeF2DK1d68lLNAhNOOxlPVDiQQRFmClqrTKxyYTDKOSKokx+ogVwbBz1Vr?=
 =?us-ascii?Q?gTu1jpJZnDC97perZnQD2CE5lLBzjBJlfJoepmtHda7hXaoTSbpXgIU8wPBP?=
 =?us-ascii?Q?vkOQhRdgSaovbNctW/HglB91SYT+aMXHxyftbVODV4HR/iw/c2QxML4ok7IR?=
 =?us-ascii?Q?MBDwfuUui/N5+uksv7qGL8YIjBXpAfc29b9VV9bs5sVPt4GMmmXpZTZzF1EQ?=
 =?us-ascii?Q?j6hWwLtukz2jvC26ZmeHwNkNON31orqPFgYHQjrsboIs+QWLWeOCFvX1uLmM?=
 =?us-ascii?Q?gZW8ksUql1mjIHHm/SplA3umBwFFhqJ4akJneW3OtnxKci6ZNFRhbaNfPvgP?=
 =?us-ascii?Q?9cGCRUfnw8WWBcXij00kHs1GyFAAMaZxp+HN/cRSnDqblIVpTbeHoe2s+qfC?=
 =?us-ascii?Q?sPfD3xosd72GuHySOblwmaBIUVrIeJKRFd7oBDtCrUZKEGnnYiTX6mKYdH3I?=
 =?us-ascii?Q?c0oZ7cM3v2OpvlT3RZkT/5wlvtEhBIcaSGH0veiCSj98dN8vZ+wPMCtQIBqf?=
 =?us-ascii?Q?1T/lkDVIWl9g4dGNoqU/f89k9A5P4r9gNVpawFVnBJ32u2uXKIgqFocXm/ED?=
 =?us-ascii?Q?QXwjTqugp2Rcsv/UjOasK3xhzbsgKvzHPZXW4FuNCsIw2iXKSjx4vvkqkcgK?=
 =?us-ascii?Q?Nj/QNMvKyvcGpaOR4ai1u9m9NQcSW1cjbFrb0vOvrRZRgyLzMN+KcXvl3SYH?=
 =?us-ascii?Q?am+ksz8Mam0/BeCnKNbRtkVFqjFgl+O3ouyGgS8I5rDFtRijtNj1EDxpQks1?=
 =?us-ascii?Q?Lnbq/Wnh+buw1oRFa7BxA4OeQPp+zJ5pEU39shZ9LmvNepKFVDdQuQSHpWbQ?=
 =?us-ascii?Q?9TGm1hl0YGFcrwYLTJ5aPDcS5lEGrwakW8vI/JxivaaM/5Zmb0dn0BsewyNW?=
 =?us-ascii?Q?3dVjCa+9AVYcswBIrmDoc7VD5A9afuT573KRHPZwVfZYGlUnvw6OjjhZOoPN?=
 =?us-ascii?Q?krD+9R9e1LE1kMEcqNhlzHD2/D8lyejM1aFEppF8JgyLsOwmbIlX70CzI9bS?=
 =?us-ascii?Q?1WA5p9SWh/objUOHBML1O8e2NZBItvJQTfWqEPmL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091564fc-af74-42cb-7282-08dcb6ea17ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 14:06:12.0496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0HhP+HFlWd/SQDOhSgFzUW/FuC/0AjYwLBQvGMdMGiqR8DaNHSnHUfanhBir/RFPxyUBQdHsQflCihYy7TOiH/bLbEExziBiEDIAJFEHtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
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
From: Andi Shyti <andi.shyti@linux.intel.com>=20
Sent: Wednesday, August 7, 2024 2:10 AM
To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>; Das, Nirmoy <nirmoy.das@=
intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Andi Shyti <andi.=
shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Mark the GT as dead when mmio is unreliable
>=20
> From: Chris Wilson <chris.p.wilson@intel.com>
>=20
> After we detect that mmio is returning all 0xff, we believe that the GPU
> has dropped off the pci bus and is dead. Mark the device as wedged such
> that we can propagate the failure back to userspace and wait for
> recovery.
>=20
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gt/intel_gt.h       |  6 ++++++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h |  2 ++
>  drivers/gpu/drm/i915/gt/intel_reset.c    | 12 +++++++++++-
>  drivers/gpu/drm/i915/intel_uncore.c      |  7 +++++--
>  4 files changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt=
/intel_gt.h
> index b5e114d284ad..b73555889d50 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -208,4 +208,10 @@ enum i915_map_type intel_gt_coherent_map_type(struct=
 intel_gt *gt,
>  void intel_gt_bind_context_set_ready(struct intel_gt *gt);
>  void intel_gt_bind_context_set_unready(struct intel_gt *gt);
>  bool intel_gt_is_bind_context_ready(struct intel_gt *gt);
> +
> +static inline void intel_gt_set_wedged_async(struct intel_gt *gt)
> +{
> +	queue_work(system_highpri_wq, &gt->wedge);
> +}
> +
>  #endif /* __INTEL_GT_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i=
915/gt/intel_gt_types.h
> index cfdd2ad5e954..bcee084b1f27 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -292,6 +292,8 @@ struct intel_gt {
>  	struct gt_defaults defaults;
>  	struct kobject *sysfs_defaults;
> =20
> +	struct work_struct wedge;
> +
>  	struct i915_perf_gt perf;
> =20
>  	/** link: &ggtt.gt_list */
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915=
/gt/intel_reset.c
> index 735cd23a43c6..8f1ea95471ef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1013,6 +1013,15 @@ static void __intel_gt_set_wedged(struct intel_gt =
*gt)
>  	GT_TRACE(gt, "end\n");
>  }
> =20
> +static void set_wedged_work(struct work_struct *w)
> +{
> +	struct intel_gt *gt =3D container_of(w, struct intel_gt, wedge);
> +	intel_wakeref_t wf;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wf)
> +		__intel_gt_set_wedged(gt);
> +}
> +
>  void intel_gt_set_wedged(struct intel_gt *gt)
>  {
>  	intel_wakeref_t wakeref;
> @@ -1614,6 +1623,7 @@ void intel_gt_init_reset(struct intel_gt *gt)
>  	init_waitqueue_head(&gt->reset.queue);
>  	mutex_init(&gt->reset.mutex);
>  	init_srcu_struct(&gt->reset.backoff_srcu);
> +	INIT_WORK(&gt->wedge, set_wedged_work);
> =20
>  	/*
>  	 * While undesirable to wait inside the shrinker, complain anyway.
> @@ -1640,7 +1650,7 @@ static void intel_wedge_me(struct work_struct *work=
)
>  	struct intel_wedge_me *w =3D container_of(work, typeof(*w), work.work);
> =20
>  	gt_err(w->gt, "%s timed out, cancelling all in-flight rendering.\n", w-=
>name);
> -	intel_gt_set_wedged(w->gt);
> +	set_wedged_work(&w->gt->wedge);
>  }
> =20
>  void __intel_init_wedge(struct intel_wedge_me *w,
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index 2eba289d88ad..6aa179a3e92a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_managed.h>
>  #include <linux/pm_runtime.h>
> =20
> +#include "gt/intel_gt.h"
>  #include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
> =20
> @@ -180,14 +181,16 @@ fw_domain_wait_ack_clear(const struct intel_uncore_=
forcewake_domain *d)
>  	if (!wait_ack_clear(d, FORCEWAKE_KERNEL))
>  		return;
> =20
> -	if (fw_ack(d) =3D=3D ~0)
> +	if (fw_ack(d) =3D=3D ~0) {
>  		drm_err(&d->uncore->i915->drm,
>  			"%s: MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
>  			intel_uncore_forcewake_domain_to_str(d->id));
> -	else
> +		intel_gt_set_wedged_async(d->uncore->gt);
> +	} else {
>  		drm_err(&d->uncore->i915->drm,
>  			"%s: timed out waiting for forcewake ack to clear.\n",
>  			intel_uncore_forcewake_domain_to_str(d->id));
> +	}
> =20
>  	add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>  }
> --=20
> 2.45.2
>=20
>=20
