Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A23C44B0D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 02:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B710E083;
	Mon, 10 Nov 2025 01:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMbgc2T8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D66F10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762736453; x=1794272453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YtJzDaEwIwOY93Ch4gV8ekkPQ/vFHUYteBaNAdTZ15c=;
 b=NMbgc2T8Pbqv+U19A3xqo+ZSCbHTpMQYMleqgt+Dd4hsFniKARvOxVue
 +ADKnh4s1mEMtENm+QLnebjHkIgXAT7J0c4Kfd+r1vKYuV4/rbRdyqDnn
 QvjSpFaxbhX3KtTJYkLFO1SfwBG4A2lpVq8SdwXSIFmeoBHPcq+8ER5QE
 g5MIBzrh+g/QaUIFofOij5Bj2t2p/W5hmpEBNFgRdKizboM8srKmLOoS3
 gxfqEX+L73n7sPuctkLTUk1N5gRSUMBlppP+rPIvfOKZxSq8+jEmQ9Qe0
 rx6AJaR/HWZrW+7k6QhUWhV7ZXzbhvO6cDg4fe34qaFaEMHT9oXN7JtU6 Q==;
X-CSE-ConnectionGUID: p2booQjBQgWy3JA445qXmw==
X-CSE-MsgGUID: 6Uqi9g0uQIyrtr/HIdX4NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75082066"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="75082066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 17:00:52 -0800
X-CSE-ConnectionGUID: uH3KosINRSOjGEeLoy2+iw==
X-CSE-MsgGUID: SNxRMaBETm+1IHswdOFj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="188287218"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 17:00:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 17:00:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 17:00:51 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 17:00:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZBigmvZ+x6/9gL5Xte3L1JYOjjD/srm7JaFMAy1Y5d5XX56SFeOD+bGqk6nHNwb+L6YHi/2gtBWdTrbvaDkCSoacY65mpYdacs9M6HsiRmUYspsZuqPr3TtpFo/hqZXqJV8w1ATF3ff6UpsNVWoqdtxlhCdUoRyqF/ZIBmsEoOIHueNOUhz+/GohEVIVU+Qd3qHZ2dtfW3LCy2swlOpZCifqZSLppRbyZ6XmpmJ1YPF+ZxGHbhg4saTeLhNVWMeWeYTAi/MuhknQ9ktsgpzgjfx2toxf1efeZTP7FNNckj7GYZeWTZ+JLfPtJXaIRuNhIRwEDxYMgA4YOp5Wi/WRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtJzDaEwIwOY93Ch4gV8ekkPQ/vFHUYteBaNAdTZ15c=;
 b=B8TMXGY1ZfIo9T7fqCe55kmWMLJ4fTq3WEnW5R0DIei9SnHW6XUVpPGsMa5eR5u9+vQ4JWSepSzh68UC5lnvx0uSa7Rbq5CckYEiKdeDb40cjwkc5NsICtONec0UJBieENtDA7VOELXRDCJkgJbTyw7ESWAAxBltpNDRrKxktwsOYiCP7wqZGruPE1U13g1M3yZ2z3kjY/rkr6rL1dEC7c6ztFHyWfnAMxA3UeT9OXbjoNGam+/ImbY+VT7Fyc4X8ZjDSt2hI0Mp78dtWo2I+pNnKt+SEd+Mk2W+6N3nlcY7TRaAXOPNs85XFhUvywXssQ5HRA30xnRMo8sPsHp90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Mon, 10 Nov
 2025 01:00:49 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 01:00:48 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
Thread-Topic: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
Thread-Index: AQHcRyfvcpYOJVPbTkGCrlhdg7m/dLTXuRYAgADddcCAAiSGAIAAgIJggApc9YCAAGsDQA==
Date: Mon, 10 Nov 2025 01:00:48 +0000
Message-ID: <IA0PR11MB71859CA8214A1CED151004C4F8CEA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
 <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b54f8527-5ce3-449a-ac96-6b4686d1b108@collabora.com>
 <CH3PR11MB7177B04D32239354CD6A609EF8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <f99e94e2-2357-4645-8d6e-2d234d7d2e12@collabora.com>
In-Reply-To: <f99e94e2-2357-4645-8d6e-2d234d7d2e12@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB6499:EE_
x-ms-office365-filtering-correlation-id: 292ed3d2-ebc3-4d9e-cd71-08de1ff49656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?JtrY6KPf6hFvic+MHOaqiw2+Vr2JuTYXCCJGjk52BNstJxV1Dq8tAc38xlmU?=
 =?us-ascii?Q?Bb2VXKmbCjPdKdKByamaaq/bGt3Dzd0HP1+JIGceoVVnjqADUOaxq4ge5tkz?=
 =?us-ascii?Q?fnleEgL2jeKfg8LorkRJKHqmz8zfcq8FlcxmqDBXi24GGghHA0luCJ2Psm/6?=
 =?us-ascii?Q?CBRzvRrrlOQZPtpcFsYfKBBZeY2pt2f4Iq2nbC5uw+9QDl/zI3vEt8e3bRh4?=
 =?us-ascii?Q?RqkMRc5zTmoWhGcEjPnq72kJ6/5sSxKiOHAuwNkER41vgQOt7Isysp58GKoa?=
 =?us-ascii?Q?yYqRB6HAJHc4Es+dMJHM81FIZDcUhIVPlbCLMODJypd9QSwjRrvrBywoVuQY?=
 =?us-ascii?Q?oOfXcob816fb0n2eU4zFN3g2VjyNmy/UZ3eTC71rgEmJpkA5U6Rai3KIyjW+?=
 =?us-ascii?Q?jlTfTfuUX4gmFXtrv/TeLEU7N/A0g0EKPCk/HmpvVEbRJfU371Z2p2Oye38J?=
 =?us-ascii?Q?SdMDgA27AURud+mUa/MTxvXktkOIK6aZRgSJwfqDVuKV/3MuI5ybnh3P8SV1?=
 =?us-ascii?Q?Ll/jNUPUpKBuxS9gqPc3NgaKljO4v/A0VZGNj1FNv3MJJz4aclX/UsR8ht77?=
 =?us-ascii?Q?yu/IymFAqjxwsRQ3X44dgmJz+CmykptMq3fVjANXqdI6iSQ38iP2zR/j6juz?=
 =?us-ascii?Q?DlfBrG/pjN48Kj5oElzjkyWZrr5GL/TatiyWtH86REStxCkcNRGrjA65F7wk?=
 =?us-ascii?Q?EySg6dT5adi49ePSUvhkF/lZmz6QVd66zuOIvG0v/i/pzEXefvJAJX3TRbNX?=
 =?us-ascii?Q?1i1DoS2HLJ0l632YwUkYZROlh9HTO/5uaYIqCiiTx8UA6aHaFDfhdHJxvzla?=
 =?us-ascii?Q?GyBcDEb+LtSYVFbuc4rCzETF829pM/28/+eNZa/v0KJkP6fqcSNyp6FHq8sH?=
 =?us-ascii?Q?cC8aLkGBDq9AjEk4bo6lXOu4T0MimilFCX9r6VItq/JSaSNQHWgsFH8eGSgR?=
 =?us-ascii?Q?JL6vN6fMu3Ch10Z10O4HMH7K2ejdEYHt1rV/bxgiL3jDE597myL7C2ncGowW?=
 =?us-ascii?Q?73shQ7y9jKcGVnbK4xUFbW6Y0qbGSBCszf9mgEO/DI5PHwD0AK2O6b1cse4H?=
 =?us-ascii?Q?0+4DfwO7i1yUnY+syzguqdom081l8TUC+iw/gWsky9wnQNSdfkTuLMyKBY39?=
 =?us-ascii?Q?bUuEXLgGW2oQNUgZrEmbn+FejYBZ8Ud2W0zFsGsS5eCmZ+XewXtDa0aX/pl/?=
 =?us-ascii?Q?iWxT8jvDrsfDIW5izCLet2rGGefjcutZMUcBWsSMtNnXr61qzmjq6kgAKlNv?=
 =?us-ascii?Q?zJVrH9GlHr2jhA3ZHQTq1Y/3UT7kikRszHw0Eu91aB/MJoj5maHqjY3ccurn?=
 =?us-ascii?Q?DSkKsaCBhMDtNF41adI4/1s/0q97/S9LH25SsssupEsfwFyhx7eZsxlGdFwU?=
 =?us-ascii?Q?g7khoBMeAUg07704MiIi2UoHCUu042C8GyqG90ViCyCoifnzIKptG6ZCobWu?=
 =?us-ascii?Q?Sw6bmp0WmrII0pwfJVAaEGCSCXufwaO9tPo9uKy8Kvqe90LvnzsqCuYfBP7c?=
 =?us-ascii?Q?7EiZkD84qkhXA2btGs82vw6RbppVFj0Xu3DF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zCfcy+QJYiBCnpmbr0B9G/YmWLMKy3zLF/Qoww4cmrz5y7v2XTYkXeJD32aF?=
 =?us-ascii?Q?SA4CXInMKzImQbVsbFDPtVfOXUsdkPDPi7Z5qS9r1LiNiT+BFtrHJMd4X4VY?=
 =?us-ascii?Q?hKDnk0ULprXR7bkQ6X3KZAb0jkNTfnitpeqAbFhX6cV0XNRPkwVyA5soJA94?=
 =?us-ascii?Q?HuJ34zixGSelyZNyvejJSvT7DO9ZJChaXQj4sqYUZRObbvHQ3bsYErdhPVfJ?=
 =?us-ascii?Q?KC6ZDL9hpgX+TXCeD2MJ+E6ALEGFx1LMEWzQ40E59kMEH6HRRx4H6d6+KS1P?=
 =?us-ascii?Q?OW4SWrfEJMAYDABegBNGReQmTYVvhpIwaf/KcvdaSZ5cXOjYdpcdnWrxaGhb?=
 =?us-ascii?Q?+kE8f5UCgvYLuATPzDYQ26KqeslvcU59vUj5yd5tK16ljTwnVYwVQ/2l4RCw?=
 =?us-ascii?Q?1heX7teg6zuVQossMZ1G9d1p1cCVGx6aC6xo9/VVWSJQ3TlGihWlWREgPufW?=
 =?us-ascii?Q?GyxwSknheRKqB18h+/MlagiOB5g3qlCbY6pRci2v6LGDe4Vg0eIMuuJllZeq?=
 =?us-ascii?Q?FYivD5jawZqRtSdZ5eENXkhqDA0azSpClZpYSMfZ+qdXMlFkEWzCuDGmh2Qn?=
 =?us-ascii?Q?4xQQkhrGkwCAsTJdfGfrb552AYU7TMCNHEYyJwm4bw+MPDIN3tHQwGmsITj3?=
 =?us-ascii?Q?V+xMZdZLexD0VqFKuziiVHdDPUbgV/lu2iix7Jp0izkGmCMzkMVHSUtnMdRc?=
 =?us-ascii?Q?gjXcoIP0O+uv/FKnhgip+byHfUF5YKF/tt+sNLUUSehaRmYIulHGXPl3YlA7?=
 =?us-ascii?Q?rUIygP6hySOVZ/o1q1rOJBICqwZ9UeOvIon79KBSFQFUZtr7/X1XdPN8Myf7?=
 =?us-ascii?Q?mqaUdw9C43AjkQRGE99UflhykvoTQjdXBPefZHsDkEJ7C5hYQAPQ4ClxWwok?=
 =?us-ascii?Q?B4mN2w/XEsCowGClchDLMNf/6BN3EqR034Iew82D94omXYifCqwJPhFpzRna?=
 =?us-ascii?Q?laZExW8xPuRuxMFEmZuSvB6xZU4Glt+WHo1zQGyl95m4irQvOAuOgJftCoTV?=
 =?us-ascii?Q?CYS6R/KBQ47QOvkWpBR4l3xBvGzpZ985gL8NfnWhacYLmRCUmLPG7E3oG+0l?=
 =?us-ascii?Q?C0/wq9KaadVZPFxE9aJPGJFCUxEDRjJeV5ucaZggzMfoUTzjfFNnGmhAxnRd?=
 =?us-ascii?Q?EXKAwo6y4vledJwqrr9Ijtz8cgvh3Ar5OPeyp/m05CDWEd7LkebN3jph3Qgs?=
 =?us-ascii?Q?5ggljjYTlBrqw8+TcXr08pSJRQprMkfpdb6iPqpDcgIqFgR/tAwKtD/K7B3K?=
 =?us-ascii?Q?4pAZiJJlj03HJ4m5YpfB73lUvWYvTD0AztnG71lBpTW2Q8pW53Ja0n/Afm7T?=
 =?us-ascii?Q?9feVrh5e7Liz/6Yx54vTSzuVyfLaxNXTVSXfdFfmgyYVDD1jLk3u8v0pPlcQ?=
 =?us-ascii?Q?xFXz82ETb2hs+9vNanAa3NPtf/OoOp9HGfZtHocl7K+v7vHMiPIFIH4W2L06?=
 =?us-ascii?Q?cJ+gcha/S4mSpKo24S2q6ZuN/Z9gsivAN0KFgs60BkWJcRVWLcj8ECJGRurl?=
 =?us-ascii?Q?kdaBCXxU/jc7Dy55L0L2AtJr8IcEAr4GO2QTnaDvzuuhHWDli20oTVYvmPL5?=
 =?us-ascii?Q?OS79Fj2FjxEKUt+iojhrZxNAugaEsM66nnRAJNFr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292ed3d2-ebc3-4d9e-cd71-08de1ff49656
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 01:00:48.7500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tN6DkrvCIrxj/2ueZJujbSF4ODE2GQQt2O+xqHvpspFQWJXwY9i9SwRikat8M9g4dvVlaxjOK0Mjd/aCrIBsGDZ170uHDHFVUBeBry0sqac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

Hi Dmitry,

> Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
> external sync
>=20
> On 10/31/25 08:04, Kasireddy, Vivek wrote:
> > Hi Dmitry,
> >
> >> Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on
> the
> >> external sync
> >>
> >> On 10/29/25 08:47, Kasireddy, Vivek wrote:
> >>> I applied this patch and tested 3 different scenarios:
> >>> 1) blob=3Dtrue + imported buffers
> >>> root@localhost:weston_upstream/weston# ./build/clients/weston-
> simple-
> >> egl -o &
> >>> Using config: r8g8b8a0
> >>> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> >>> has EGL_EXT_surface_compression
> >>> 245 frames in 5 seconds: 49.000000 fps
> >>> 236 frames in 5 seconds: 47.200001 fps
> >>> 279 frames in 5 seconds: 55.799999 fps
> >>> 240 frames in 5 seconds: 48.000000 fps
> >>> 244 frames in 5 seconds: 48.799999 fps
> >>> 283 frames in 5 seconds: 56.599998 fps
> >>> 274 frames in 5 seconds: 54.799999 fps
> >>>
> >>> 2) blob=3Dtrue
> >>> root@localhost:/weston_upstream/weston# ./build/clients/weston-
> simple-
> >> egl -o &
> >>> Using config: r8g8b8a0
> >>> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> >>> has EGL_EXT_surface_compression
> >>> 167 frames in 5 seconds: 33.400002 fps
> >>> 208 frames in 5 seconds: 41.599998 fps
> >>> 203 frames in 5 seconds: 40.599998 fps
> >>> 252 frames in 5 seconds: 50.400002 fps
> >>> 180 frames in 5 seconds: 36.000000 fps
> >>> 219 frames in 5 seconds: 43.799999 fps
> >>> 176 frames in 5 seconds: 35.200001 fps
> >>> 220 frames in 5 seconds: 44.000000 fps
> >>
> >> Thanks for the testing.
> >>
> >> For the second scenario I'm getting better result, it's 55-60fps for m=
e.
> >> Given that this is a SW rendering, curious whether that's because you'=
re
> >> testing on a lower end machine(?)
> > I am testing with a dGPU (B60) on the Host where I am running Gnome
> Xorg
> > but I am running Gnome Wayland in the Guest. What compositors are you
> > running on the Host and Guest? Kwin? Also, could you please share your
> > Qemu launch parameters as well so that we can try to figure out the
> reason
> > for the performance discrepancy?
>=20
> Did further testing on older IvyBridge machine and getting comparable
> result to yours on it.
Thank you for running these tests.

>=20
> I'm using exactly same QEMU setup as you do with nothing special in the
> cmdline. Tested with both KDE and Gnome on host.
>=20
> On IvyBridge getting:
>=20
> - 46-55fps jittery with GTK display + blob + vblank_timer
> - 46-55fps jittery with GTK display + blob + vblank_timer +
> vblank_mode=3D1 to disable vsync on host
> - constant 60fps with GTK display without blob + vblank_timer
> - constant 60fps with GTK display + blob without vblank_timer
> - constant 60fps with SDL display + blob + vblank_timer
What happens in the case of:
- SDL display + blob without vblank_timer
- SDL display + vblank_timer without blob

>=20
> So, discrepancy of the results is directly tied to CPU performance + GTK
> oddity when SW+blob rendering is used on guest.
>=20
> Why SDL performs much better than GTK I don't know.
AFAICS, there are some key differences between SDL and GTK UIs that might
be playing a role:
- SDL UI does not implement dmabuf ops such as dpy_gl_scanout_dmabuf()
but it does implement dpy_gl_scanout_texture() which I see is only called
from virtio-gpu-virgl.c. I am wondering how does the display get updated
in non-virgl usecases, especially when blob=3Dtrue and given that this opti=
on
is specifically meant for UI's dmabuf ops?

- GTK asynchronously waits (using an EGL fence) until the GPU Blit is
completed (before releasing Guest FB) which other UIs do not do when
blob=3Dtrue. So, this might incur some extra delay which is not the case
with SDL.

- SDL's display updates (sent to the Host compositor) seem to be UI timer
driven while GTK's updates are repaint callback driven.

Thanks,
Vivek

>=20
> --
> Best regards,
> Dmitry
