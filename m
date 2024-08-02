Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E7946266
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 19:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC90010E198;
	Fri,  2 Aug 2024 17:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfKeVUgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1610E193;
 Fri,  2 Aug 2024 17:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722619542; x=1754155542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rLxxH5hnjA4N2P8jgby8mqgHJ2BHJVNFFszXnA1Y4Uo=;
 b=UfKeVUgzg4VndmMzt/k0eArdMpYtinaJaWowXhEWMIwv14eBwGwoea3p
 oQs9Gw02PsxgcQPKZOdLVV80FhriLABMry6xe4DMnBquy7RlaKCSCxEo0
 5zcCd0LNDE3TqdMkcpB1Egck7yCGHJqwKNmLm3cj5IH0Fx/B45T/qwD7F
 fR9LVb2BzCJmvKNDqMubFk+zvf6kLwTLciOXHpw7U4faSsIExLd+JOUeB
 K8O6WGJreYHqwMMj/Tl5r9UNlCDSR3CI6FkKD/yxWtd5W1zXgCD5+9Kgc
 +xYdnld0DiFiA+ueI1++2BhZg9I3dTV4JZNuEJzzYiK5+YfOIO5R78cn1 A==;
X-CSE-ConnectionGUID: viQeq5cjTgWi0lpsi76Ybw==
X-CSE-MsgGUID: YomUlHDuRQyGmQWiaqpAdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31277679"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="31277679"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 10:25:29 -0700
X-CSE-ConnectionGUID: t3pE9py4QfeR0hyvGrw+UA==
X-CSE-MsgGUID: Z3orvMtpTeGhW3ubEwWhsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="55353239"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 10:25:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 10:25:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 10:25:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 10:25:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 10:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk7r7EfOwmCJmP70vpH5FZN4jVxMkIfBrudQcNhtSoGkAhik73t8nBC+xfgtXr+bV11fCMF0O611rCIU+LyPHh7+qwlczlPLJyNCpblg1W3zaBhWQ9Hrs4j3GntnP6AdY4QL6nrV61ZdLbPzs3kXBakj9zNdipTc4iUdCxgCaPoxpjBw3lxk7r24QVzASfwC/i8cqpk+YW2Wg86n69w23HKhb8HAxwpG/Zj1Wk4cMNL40fIRZR5DWN6jfDMIeyHaUxc7oepa3E4bGp5/1DW/YxbbYigZNWKqc+ahr+iNxCnndTTUN1dqEe6FX2CIRthdQrqEo4UufnAdTljuj/lucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqxdk/WmZwygDEVP2UZ6OISB7MP8NwEWMQe8R7j3vnk=;
 b=u9FLRXiLS/0783z0VGr6RsbkX1fCLC6wVr8SM4kGO6gVz2SRE6V9Ny1HUiJSoIzu4S7zvwdsB+B0BMhLgCnTm//AyKg9AIPSDnLfYJtp9GmfpLHesDtEID9kfhEpAXOvRfftr5jrUDVPvAubpmIXkFeJuViAjZV5RywGEz1PLmSsumSRBgL3lyVj5jWi2syHHUfMJeuk2yrTQGPg+GPKfDe8k635FaOSmnm4sdq7/6uFW/gyKaro+6h5VxlQhpeWyjetO3xmq/X7izlRDvxdm7Bl1Th11pW6g/kULZX7ddw78tTQy6b0jI94hO8eoBohGXt70bFXKjPPuRQ0i0/PVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 17:25:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 17:25:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Jann Horn <jannh@chromium.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn
 <jannh@google.com>, Chris Wilson <chris.p.wilson@linux.intel.com>, "Niemiec,
 Krzysztof" <krzysztof.niemiec@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/gem: Fix Virtual Memory mapping boundaries
 calculation
Thread-Topic: [PATCH 2/2] drm/i915/gem: Fix Virtual Memory mapping boundaries
 calculation
Thread-Index: AQHa5LeS/qVq9vr7vEWmy2orem99FbIUNO+A
Date: Fri, 2 Aug 2024 17:25:23 +0000
Message-ID: <CH0PR11MB54442106B9FB0353403DC109E5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240802083850.103694-1-andi.shyti@linux.intel.com>
 <20240802083850.103694-3-andi.shyti@linux.intel.com>
In-Reply-To: <20240802083850.103694-3-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4763:EE_
x-ms-office365-filtering-correlation-id: 0ae25c64-e64c-4b8c-ff54-08dcb31817d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?w9/jgVv5YWX0hmkWun9bcVSHzeOyE/0hLN4uHkYVNvr5SWDoMcAiIr/K1jij?=
 =?us-ascii?Q?bfFFCmrKqvLtAovMh/Rn1OYm9q2k/krdn6Nmcjhndfa90wS7Dj0iP/QaQ3UT?=
 =?us-ascii?Q?lH/za6UD73/jEb1cZEosYuYELssnglEgcvjCULjKd4BzZ1Wx2IG2TafRqXAt?=
 =?us-ascii?Q?ICpIYHftrdqch8thdgxy7YdtkJ1A3XkRUjN/Tg6hnW//e9fwaco3VMPNXFBO?=
 =?us-ascii?Q?GOZWEeREJezrkRALSNegpejGTz5i4qe1cUpe85dVnGL39Dp/WJ7DZdc3erGo?=
 =?us-ascii?Q?Nh+1n6iSsQ3Rr88twzp0SuA8r7kC1H9IUJQ4OLU/W0/yBOCizuHWIsUAaWYI?=
 =?us-ascii?Q?HUN4G92am443TOW5o5dqQAWl8IW7ZCkJBDxfoy60FsnCHnCuAeuen6uSR3OS?=
 =?us-ascii?Q?HkEPSvNts0rEUW+QK3xmEzSe52fqdekSbnvs2peuXZKSUgelsGiqe3rhrtZo?=
 =?us-ascii?Q?R32D98qaUOP8H7LKvRo8PFBdHEV2xIXR1SYt2cxGg7Q440H7S7s58bDOaHLT?=
 =?us-ascii?Q?bzkdon+kaCLYng43wip19a8nuvP9+MKF3ITYoyVrdSZR2ThpUhEo3rcRQUpY?=
 =?us-ascii?Q?7EyPG8kBOxPp7nN+8YVNpAXvBAIQcVgt/tdERhew/5jkyVTyluySdr0t8ZA4?=
 =?us-ascii?Q?kld3IIYYVMqbV80dEbfmImXbzEmFb0dXagn4oR79pKk3XCIosVg0CelciB0n?=
 =?us-ascii?Q?pL9x91ce2SjCyy5QGzo3vNSIzZPnoc9WZkmfhb5g5kzseRcMZ0q2p9EF0TF7?=
 =?us-ascii?Q?UKeTKlE6VSn+vT/OuxYWke3NGVnK9IpNAnYBR6bpgUE6UOHlkJE+TfEKS3KY?=
 =?us-ascii?Q?DlajQ81ik4H92TYK6L1A643m7seljv7jKKE1Ihd3vqrR+zsErqreOsVqAEJl?=
 =?us-ascii?Q?VLM3HFQsVkTa1xwW89DEXvm0Bo6Hs0Kpm32jQcCGx60b2MxVWtBTdNp3rR9w?=
 =?us-ascii?Q?XMBXOyOqKHVG1a3ppVE0EnBXqrv4bKBm/mZiUSg+3zeFTGf6CohGMMTtqMty?=
 =?us-ascii?Q?fQpCjvewOnckmEikDRXJRCwjWaLUENSVs8YtzwBm8CLoc3o1Cfeo3o8TpWZC?=
 =?us-ascii?Q?aj8ZefH/0ZDfkBi86bxdLIKz3KYcW8QdaxBbLWrBLuM9Kv3sjCXSfXtuWU9M?=
 =?us-ascii?Q?B7g4vCTuT4I2YwJ5ymJScNyJzCz+SRDb1nXn/ykN1Cq6gUbbTze82JW7+F1k?=
 =?us-ascii?Q?2UpEQML7komOfHMAZvABi124JA4gxgvAjynBfLPm5gYU6LsISRHO3LX4eUNc?=
 =?us-ascii?Q?N991cq16kI7a1zxaqZBJK5G2c8ru2wBOHnijY+6CAX5IKCY+YgRPoaIycv2O?=
 =?us-ascii?Q?XQkApLh2uTHxZfyIDBLmhkvtQXAXaHMmolqipB9R7S6abCeUoBN7KtAfV3kv?=
 =?us-ascii?Q?gyYsb4/gY4XMv5qHxLPB2tA5mdLwhPIXFzToehIeFAfUELGR8w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eJH+I6s8lBohed7w1mAaGplGlMWOcINVP8Q90O7kN85RA9TKXhUzrX7rHdB3?=
 =?us-ascii?Q?0LKWk+LFFxEtCM+/aHIrecnDxSFNLvVV5gZjEzauaJ59kqcc8HejoX1xByng?=
 =?us-ascii?Q?6EQOj6vzT1WxDXxYubMDnqfzRIht4IZ2DZhkY9BLsi0SAs0BdDWxZChDzakk?=
 =?us-ascii?Q?rtJ4dw+ZxaR7RGhJrOCnyFXaIgxwLgaLhr1wagPDB8yU4rEa2zFlrAmJ8lp0?=
 =?us-ascii?Q?3YvMAcpxqa+hNnd/1kFkErf6F7nN51s7cqGpBHOPVAhpwsAXg4E1+2V8QMHb?=
 =?us-ascii?Q?bns/9ps3160yut6t0WpMNzA4TsNUKPeTAChEmQW8l2z9SLN/7kxJB0OLBusQ?=
 =?us-ascii?Q?311KoUvp8JiqxNgU51qjcs6Vl2WTTO13A3lZK0lR4MLDM+cjOBoVTLHEBkrN?=
 =?us-ascii?Q?0VV+3TtFvJxK8LEhkJR2zdm8u3U1UMZddK16HjEkz3TQuKlrvF/DdAftk5oM?=
 =?us-ascii?Q?SYdZrjUfnDo0wOH7GEVDUW6bUcc9XY/ZUNoHmZimnwQZUMZUWe4zhuuXrDEX?=
 =?us-ascii?Q?CCPcr3TNS5QqXpEVQy4fJ5Q1pfjSyft0Zu+Spo2iTqxp0CrYCRWXPh0LPxpW?=
 =?us-ascii?Q?B2H83nniwmCzYNAxdDALiSiofQTzpP18jYl709eLW/TIkvOM/EiqgKr8Rdry?=
 =?us-ascii?Q?dKSkzoJRZm2zMFZJ7lrm/f3OUNHTcYBsA4nQbyBvlPqwtvHqRHFTyCVegbon?=
 =?us-ascii?Q?V5lZep2LAuEmm0Fm4XO2NJFr3GCd8yqP4gm38pTC8m1DYNqWXujFpvYXPeQL?=
 =?us-ascii?Q?dvufQliRO+XncOKxi9y1cK6dm1IgEjegXJ809+lOq9NfTlfbaduiqQcBWChp?=
 =?us-ascii?Q?mCGXbS2tQwBIODpW54QlgKIjNvT10PM4THr59RvVxDqK2CETUrWi6LndDLBa?=
 =?us-ascii?Q?3tmjfCAu3HcMc0AhgwuKyg/A8dPPv16vt6KB/jmBoZ49LUaqZVSDDKsciNNB?=
 =?us-ascii?Q?v6so+vbJNn3oweVnxRsjXLh2+9b7o6u1dvqlpybIhIzE6soBL+wn47XNOu9a?=
 =?us-ascii?Q?PZ/AYyBnNnRVphxVuynxuobE19f6ADUFR0t/GX9Yb3B8U2lG9hYnVp0YUksJ?=
 =?us-ascii?Q?rxqnEEE8IWNUV397guYkCM+bw4D7wvS/ov04HQKs5Lv1BonzSrE0n2VTtkM9?=
 =?us-ascii?Q?mUdTHA3NhLnIppu7x5GKlH2Mv4quXncQj7rBWANvmi3BMxBGRDwHedy0utP4?=
 =?us-ascii?Q?FI+VjTVfr+gfcFG8iBQ8qOtqyiMMb875KRLHC0hWNjAS7ShRAf5MCU6HtvCL?=
 =?us-ascii?Q?T+7hhcBxwTrNXJCs1lfBM+Zpw62UmK7jnM9DBoQda/QxRmxg6NzjHUdylnB9?=
 =?us-ascii?Q?koDY+ohdaLvx4ISnzRjuUg5AenA+CSwjZoKT5bc5sW5RghM7O/qwK1liLJPY?=
 =?us-ascii?Q?a/2lkk116kpxpDwqBNYkrO7t+KzRttZeS6eo/pRZu29J0RDYQb0NqKdW35Hu?=
 =?us-ascii?Q?v4e3E4KGOmWsFtUWT6fbYQ1Ry+5nVHvacl77yK1TllvpKRWMi8uuhYiqhWd5?=
 =?us-ascii?Q?LRY/clOjVKuU8aEJlMxkDS1S/fQUrTutKQ2FElSX6ttnLNvAwzx2Unm/Mbr/?=
 =?us-ascii?Q?7UnIhUcLDxGfZBq3oEWEYTOkI9v7WFMulPrBEyAl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae25c64-e64c-4b8c-ff54-08dcb31817d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 17:25:23.9787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ORW6rra4RFr2GO4BMpBjso3a97YHLLnt+LLrbQW2dH9XFk32tOS4GQ8A2fKtPx0BcjdFm1o2V7BWJJFrQ5OB3W3sGyUazeCKKHF/8ViagmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Andi=
 Shyti
Sent: Friday, August 2, 2024 1:39 AM
To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>
Cc: Jann Horn <jannh@chromium.org>; Jani Nikula <jani.nikula@linux.intel.co=
m>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodri=
go.vivi@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Jann Horn <jannh=
@google.com>; Chris Wilson <chris.p.wilson@linux.intel.com>; Niemiec, Krzys=
ztof <krzysztof.niemiec@intel.com>; Andi Shyti <andi.shyti@kernel.org>; Aul=
d, Matthew <matthew.auld@intel.com>; Andi Shyti <andi.shyti@linux.intel.com=
>
Subject: [PATCH 2/2] drm/i915/gem: Fix Virtual Memory mapping boundaries ca=
lculation
>=20
> Calculating the size of the mapped area as the lesser value
> between the requested size and the actual size does not consider
> the partial mapping offset. This can cause page fault access.
>=20
> Fix the calculation of the starting and ending addresses, the
> total size is now deduced from the difference between the end and
> start addresses.
>=20
> Additionally, the calculations have been rewritten in a clearer
> and more understandable form.
>=20
> Fixes: c58305af1835 ("drm/i915: Use remap_io_mapping() to prefault all PT=
E in a single pass")
> Reported-by: Jann Horn <jannh@google.com>
> Co-developed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v4.9+
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 53 +++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index ce10dd259812..cac6d4184506 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -290,6 +290,41 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
>  	return i915_error_to_vmf_fault(err);
>  }
> =20
> +static void set_address_limits(struct vm_area_struct *area,
> +			       struct i915_vma *vma,
> +			       unsigned long obj_offset,
> +			       unsigned long *start_vaddr,
> +			       unsigned long *end_vaddr)
> +{
> +	unsigned long vm_start, vm_end, vma_size; /* user's memory parameters *=
/
> +	long start, end; /* memory boundaries */
> +
> +	/*
> +	 * Let's move into the ">> PAGE_SHIFT"
> +	 * domain to be sure not to lose bits
> +	 */
> +	vm_start =3D area->vm_start >> PAGE_SHIFT;
> +	vm_end =3D area->vm_end >> PAGE_SHIFT;
> +	vma_size =3D vma->size >> PAGE_SHIFT;
> +
> +	/*
> +	 * Calculate the memory boundaries by considering the offset
> +	 * provided by the user during memory mapping and the offset
> +	 * provided for the partial mapping.
> +	 */
> +	start =3D vm_start;
> +	start -=3D obj_offset;
> +	start +=3D vma->gtt_view.partial.offset;
> +	end =3D start + vma_size;
> +
> +	start =3D max_t(long, start, vm_start);
> +	end =3D min_t(long, end, vm_end);
> +
> +	/* Let's move back into the "<< PAGE_SHIFT" domain */
> +	*start_vaddr =3D (unsigned long)start << PAGE_SHIFT;
> +	*end_vaddr =3D (unsigned long)end << PAGE_SHIFT;
> +}
> +
>  static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>  {
>  #define MIN_CHUNK_PAGES (SZ_1M >> PAGE_SHIFT)
> @@ -302,14 +337,18 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf=
)
>  	struct i915_ggtt *ggtt =3D to_gt(i915)->ggtt;
>  	bool write =3D area->vm_flags & VM_WRITE;
>  	struct i915_gem_ww_ctx ww;
> +	unsigned long obj_offset;
> +	unsigned long start, end; /* memory boundaries */
>  	intel_wakeref_t wakeref;
>  	struct i915_vma *vma;
>  	pgoff_t page_offset;
> +	unsigned long pfn;
>  	int srcu;
>  	int ret;
> =20
> -	/* We don't use vmf->pgoff since that has the fake offset */
> +	obj_offset =3D area->vm_pgoff - drm_vma_node_start(&mmo->vma_node);
>  	page_offset =3D (vmf->address - area->vm_start) >> PAGE_SHIFT;
> +	page_offset +=3D obj_offset;
> =20
>  	trace_i915_gem_object_fault(obj, page_offset, true, write);
> =20
> @@ -402,12 +441,14 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf=
)
>  	if (ret)
>  		goto err_unpin;
> =20
> +	set_address_limits(area, vma, obj_offset, &start, &end);
> +
> +	pfn =3D (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
> +	pfn +=3D (start - area->vm_start) >> PAGE_SHIFT;
> +	pfn +=3D obj_offset - vma->gtt_view.partial.offset;

I don't know how viable it would be, but maybe we could
calculate pfn as a part of set_address_limits?
Just a suggestion, not blocking
Reviewed-by: Jonathan Cavitt <Jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
>  	/* Finally, remap it using the new GTT offset */
> -	ret =3D remap_io_mapping(area,
> -			       area->vm_start + (vma->gtt_view.partial.offset << PAGE_SHIFT),
> -			       (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT,
> -			       min_t(u64, vma->size, area->vm_end - area->vm_start),
> -			       &ggtt->iomap);
> +	ret =3D remap_io_mapping(area, start, pfn, end - start, &ggtt->iomap);
>  	if (ret)
>  		goto err_fence;
> =20
> --=20
> 2.45.2
>=20
>=20
