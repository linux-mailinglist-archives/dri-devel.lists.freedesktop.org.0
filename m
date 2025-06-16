Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C414ADAE83
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBACB10E325;
	Mon, 16 Jun 2025 11:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAe7X67v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AA410E2F0;
 Mon, 16 Jun 2025 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750073430; x=1781609430;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s0c4eQSVu/SyQ786E1/9y9Ksjo4373HGg+gjhzpIhM4=;
 b=iAe7X67vDR46pyealN4lYXD8KyZe5Jyw2JoBdZw6A1p5jIY+qaYm1IU1
 lFa1gL/AC+vrou4G1+mv8ccBBkdnBpiLgS53krJKrZ7RMluf8vReGTMnK
 +2CdDud4Bn5heNMip29zRHv2N+d6ZKkTPj5MdLg4iplLu4RY1dV3D4abM
 LrlfHIVp28UL7q4j823//FmC3dj18AkvH+drasH2+JOEt6uJKfhft/UaN
 RfGHYLVbftf2sFMOxExDegVEnpNpXCYC1Fbv6FznR4L/uqFMaEUoNAZJn
 TBn88cMA4nsv+Ellj4T9e8FVAuv9DRX/FlTXNPuDKVPvgxlN7alhl8cRF w==;
X-CSE-ConnectionGUID: oQtV69UBRBOk1WW2p//LwQ==
X-CSE-MsgGUID: L9ZqcqOcQXagpIlb8Oy/Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52302596"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52302596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:30:29 -0700
X-CSE-ConnectionGUID: 4y4POLInRymdcmZbXBTeFQ==
X-CSE-MsgGUID: 7Hp0nfb2SgqcM3pyUqpmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148281489"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:30:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 04:30:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 04:30:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 04:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq76TR/C9QZaglarb3ncK+vXyz5W/5yo8OAPfl2YbZa5HJSW/utV4WlmqkmU6uiJ2QhRp3QV53Wa2LPKZSqXaJXEHpgv0IL8bB3vgw6xfP4l+0POqz+gmosQgW04zSGHU/DPzDsh44wyyeyM2wrN4MD2l2/VxPGaK5JgYDV87NirrJpFtL7iQv8/8u6sUFQLUW+X7eN1ox8NCT/1ZP2cNZPhh8tJqaP0LB4O9KvrldRgKqGDlKfFwrUNG0RiKa5F3k6OBHQKLBDOVivNTbYCPl8ZAFekP6PVuFGRdxi+e8GlEo6cHQbnI1uUnUzp/fNub1znb5jnB093f3TI91SXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7QeqW35966BMU7XGc6Gz1KGGAg/GukyBBAGPGP9C4Q=;
 b=YwTnEGVuykfXGWNDxkDjnV2uhalxhFvVx1IpG30hfhJ0jTnnfENmMH5M1XBbFB6El1sRW8ogRFJ5dRvZOlhyjwiubCQQtFakZuZz7rzh3OZF7aKV9yiAfIvAo1g1kHYExq+KFdAb5KgFVI0YqfNFKlM6ATRFyrp+fh7wgONK4d0A9ybRzl+cKWERNSZ1u6RWxOBVKLYHzU7avjIlEuFbnd9GDr1HFNpukZu8yNPUA76m/mfWEILN2QqGHzpxPEjAcyh0e+X0SisJE9Ks9xAtdedBquHTw2NhmUc/TFcNm29xA5KJ67DHrvNjwVy1XA9osxuioZMolEbryUqqz4rmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM3PPF2B3CC4BE4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:30:23 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 11:30:23 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "mwen@igalia.com"
 <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "Shankar, Uma" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: RE: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Thread-Topic: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Thread-Index: AQHbuW1y8ppcMGuHuk6AWeupHiSmprQF7Wag
Date: Mon, 16 Jun 2025 11:30:23 +0000
Message-ID: <SJ1PR11MB61298CC231B8739FD48E30E1B970A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-17-alex.hung@amd.com>
In-Reply-To: <20250430011115.223996-17-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM3PPF2B3CC4BE4:EE_
x-ms-office365-filtering-correlation-id: 59f1145a-63d7-4a07-e91a-08ddacc92f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aNVC8Y6XeSvlT8EkI7iqusvRzDcGfYMvQbew86XXM+SFyGQlqx0GAS83XLhg?=
 =?us-ascii?Q?gsx9lJnE9Z9mnJ2KdEET//fNjLpPwf91sQcWfVX9or2eISoLRYXO9UpDqQTv?=
 =?us-ascii?Q?ibhGkfYCMFAmq8QOL4FKAlT0EnCQKm0XYv8BWyc5i1SsixBWtNiYNw8cIhUV?=
 =?us-ascii?Q?U0vjMGUsthBtcbYYfsL+xD5MA7Z3ya2cHw94xfPV1ZiaOUpxNo7Lxlm+bYpI?=
 =?us-ascii?Q?trBQMpdhQqtZG9K0aTlZd0obQT0/JvhMyxGjy1u0w72gWqpS0z0zzaff54Xk?=
 =?us-ascii?Q?fJV+H+borPgKfbb9VrRY75UtYzUxeb8L4AkBNjxuvCzooHYp110suaQd4lpB?=
 =?us-ascii?Q?DpHd5ti4k3GroOudk/P7ag2l1otBD58bVywV41kmqlEwXUdLCjJ1Yp5xTNqu?=
 =?us-ascii?Q?4RKpJT/bhOAVNMApSUmMIiTozuLAGBW90Qif/XEP5IF/D5Ms8fXe7bkhS+Zx?=
 =?us-ascii?Q?eq+5G/9WWp1gyKcfCBhXhEmLY8fT20tpjK9brLUUGXprJ8kLXuTZgypVWFIW?=
 =?us-ascii?Q?Czo9+EHW9aEQ3Re6/HphW+mcX/iaq1me/A1wKKLZHWdkXa2rnWYgVe093bo0?=
 =?us-ascii?Q?0D7s/DXLeWJRDfvaN9Si+XxLGdfCYHbr9OO3OykI2WfDGnYLaYJpt5kkZSBY?=
 =?us-ascii?Q?/Pk9VsPKUt/B6OLerPyEJpxCXdie117xNWRl2ixIybNCeGdNRhlbXW3jdGbp?=
 =?us-ascii?Q?Nvaw3c+dz2uS7KoaOosp+Qmv1PvML94CYlIqbVVPjFr0Mjw1HGJFjgg/3jss?=
 =?us-ascii?Q?mEgI/E3c9c842gxKka5k9WBQGstloP+hQo1HAgDD08SLstsyLL+L56B08r0g?=
 =?us-ascii?Q?6bY3fbRj2TCFln1Aqiv2IelItmFIhlxtvCI+GT8jBhqRsjXiR3JBYSEVhzwW?=
 =?us-ascii?Q?O84xYH3i2V5+eCIN+RXgCJZWjEkBTND6AZQsZ/L1nBmp6dIx4p3Z9e1TlAsd?=
 =?us-ascii?Q?VSpvA8R2TXrjYKlLGZu+K5Xwj7t1t6u5A2J7sEXj80lu3p1UegGldHqUzT+Y?=
 =?us-ascii?Q?QPoHYOYAyQAlUkfLKVfOXRiF248HdK0kb9CDG+FzVBxi5C8AnUhsTyhJbMGt?=
 =?us-ascii?Q?LCr1USoC8R7lDnIVHd8RTh8CQk6zHLYOAFvUDLNq+jw+RDZLVbghBA6p0347?=
 =?us-ascii?Q?AwTP1NX/mKlFgSHViQ1jG1WDnIgfmhF5rgQDyxzfE4v9kKyTOPp9xeeu/+9I?=
 =?us-ascii?Q?sh45ws+Aoe60TFpOaa9b/EbRdmJXOJOty9FF9zyKAFiEwLc0zda5K0uSdS4A?=
 =?us-ascii?Q?hXpDaGh09D1TG9K7c+4Zi0amhvr8Vc0xT9kaur7Kw0vjuEGZpDuwcEwjIC+M?=
 =?us-ascii?Q?wvfCyZluNoEU+Tk2ev4t4XoXEM8tewRJBlztP3yskDdll9mHzRa7giWnTYxP?=
 =?us-ascii?Q?xNyQU8yAL4c4Fdxldijd7yNA104zbb4/a/YkDJ5d8yks71wRzods8XBdIAPF?=
 =?us-ascii?Q?fx44T7NkD7g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pluE/38K8tD0G7VopxNYe/2ZtquDchsJoNIs5VvIaXW5kOPEUdcVgf8jT/Ak?=
 =?us-ascii?Q?0TC35JgOO90VmWHnvKMnB0qXJ/acLmgkuXmigH9bCIJGB/+jLpda+rUof3hF?=
 =?us-ascii?Q?NCWSn8Ywyz2bVTOh47zH2pW2hBOa7CFg8XmppUPrPT/Jj7B1McfRlDQPM9Q3?=
 =?us-ascii?Q?p/7/GobkUJSXOhUHyDY3J9FE21qIxyoWV6/X5VQkQ1luhislgUo+f6Trbiz0?=
 =?us-ascii?Q?Ug9UkHF55+FKyYFkDBqMkjtmfSi79xmGnuKZLEzpfW5KaKnU32CbonTnE20v?=
 =?us-ascii?Q?tgXAaQCTOTkTODIdC0o6UQzet7/9Kei32f12l3PI3nPMAsWAHSRswiyF/v35?=
 =?us-ascii?Q?o/JTDZYXpi32CgYn73m1qahc12lzwztkFxcyf+joGVXsC4Y//8dAAi01s6Wu?=
 =?us-ascii?Q?b8B+AT0aoUSQNNdMstrwo9gH+vfnADydL2oghZPtzswpGzeel8PLcMK4meYh?=
 =?us-ascii?Q?EeFYdSc/0R2Vg4lUYlRAybkhdXPTA3k29CZVL2Ji+xAqZrVoxq3hmeO+6Q3p?=
 =?us-ascii?Q?m6Qb7GNItT8e/5wzWEdKVJ2qFYErHQ6IA4IDLUDxQMUJC86ZyYHS9Kp/Ep82?=
 =?us-ascii?Q?azyDPEi+tmGzJ9OX5hbgqbr6/GxAxe0MxQgKM03Kd6EuQc2KGxdkcAkN+nep?=
 =?us-ascii?Q?xso59m4wKt7nuQKBSscxeM3oyiQv4Ech7BJRyz1r5AwmrFrPOGatIJM786hS?=
 =?us-ascii?Q?RyOrGnZk4Fg2xKtRKRoGjCdMO2c+iXGcOQXGWtp/huNTsbbh6somgigRUmh7?=
 =?us-ascii?Q?dNtLpaDRpm6JZ92jlyvorRUD0cPY9z1CJCOouO1kUFxqi715D74fERbusQHu?=
 =?us-ascii?Q?kIR66fArZY2XSJg3s+obrKgj560M7IQXHiEboGM9+ELmbiExNUjSLt2TDf2N?=
 =?us-ascii?Q?xpx7LjQJFHtd4w4OiOMg7cMCna63aMw8t9IQo3Obkt+7Sd/OXjgzINjYSyLP?=
 =?us-ascii?Q?3GpMp74IoxNURkbdKc6NRyyiUwvqDirn538Va+mGTCBn053ZcEKK/A+EE/SP?=
 =?us-ascii?Q?9+VwGArgUm0pjZWIAKX2Bzzvoytn/m94jv8H81rPSxLd000WUL1GYpWoaajZ?=
 =?us-ascii?Q?b3T7B8cFPy1YW9CwHGS64gCZeIhYDU0fs0a95VtWEfx+8oPVxc8jv32VAWCH?=
 =?us-ascii?Q?4nBW1tmK8wwuvKj9jYQOZtmRYqxByzdcQeujME1BxFQrg4MvUcLnTJHo4PwU?=
 =?us-ascii?Q?FtGRZD28dX98bRPL0rbotsKf6Fj8ElrgKbyykT/5rUlu6wYbN3mHmE0PTYEj?=
 =?us-ascii?Q?DZwmgxU2rVcaJrAN6zisMdk688Rgxg51WmyRB6sqj2pqAfDxmYoaQvHRWdcs?=
 =?us-ascii?Q?hI4eA9HKkyjSdpLoLkyIXO01Js2UFDLVxsiFk69uO5Qs58UOwutqE6oEba/k?=
 =?us-ascii?Q?nsI0WHG1+9wCjoSPSZ0K3wAft9yN9dDgPLVo6vz/IdAD2V2ocoz+tiDxyHUl?=
 =?us-ascii?Q?sjw5ls/NHV1IqnQu1a/zRPx8AgKrUKVHGP40jMwwzxu3w9RIwWxzkZZGj4hP?=
 =?us-ascii?Q?W8lkzkmXcd03kgfkCsO+DF1etv+iE7PuedR0bP7xsqAdi3Lxt3amS6qRFTI2?=
 =?us-ascii?Q?6nz51YESPPTf+HI6pbylVoAn2YJYNZuPJaU76WT2hBBXbjSrs6085Cs/nLWT?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f1145a-63d7-4a07-e91a-08ddacc92f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 11:30:23.5275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JriMII3KLL16mqKYY4t599OVMfhjgGAIMbxjyLzFZpo+jNSy2qZULrlWWrZZTI1QekEThmli6oZphOaVwD+J1BUs72DrWNEaQdRvOLBVWSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2B3CC4BE4
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



> -----Original Message-----
> From: Alex Hung <alex.hung@amd.com>
> Sent: Wednesday, April 30, 2025 6:41 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
> alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya
> Kumar <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com;
> Daniel Stone <daniels@collabora.com>
> Subject: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
>=20
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> This type is used to support a 3x4 matrix in colorops. A 3x4 matrix uses =
the
> last column as a "bias" column. Some HW exposes support for 3x4. The
> calculation looks like:
>=20
>  out   matrix    in
>  |R|   |0  1  2  3 |   | R |
>  |G| =3D |4  5  6  7 | x | G |
>  |B|   |8  9  10 11|   | B |
>                        |1.0|
>=20
> This is also the first colorop where we need a blob property to program t=
he
> property. For that we'll introduce a new DATA property that can be used b=
y all
> colorop TYPEs requiring a blob. The way a DATA blob is read depends on th=
e
> TYPE of the colorop.
>=20
> We only create the DATA property for property types that need it.

Is there any value to adding pre-offsets [1] in the uapi?=20

 |R/Cr|    | c0 c1 c2 |   ( |R/Cr|   |preoff0| )   |postoff0|
 |G/Y | =3D | c3 c4 c5 | x ( |G/Y | + |preoff1| ) + |postoff1|
 |B/Cb|   | c6 c7 c8 |   ( |B/Cb|   |preoff2| )   |postoff2|

Handling limited range values is one use case that I can think of. =20

[1] https://cgit.freedesktop.org/drm-tip/tree/drivers/gpu/drm/i915/display/=
intel_color.c#n112

Regards

Chaitanya

>=20
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> v9:
>  - Merge cleanup code for colorop->state->data in drm_colorop_cleanup
> (Simon Ser)
>  - Update function names by _plane_ (Chaitanya Kumar Borah)
>=20
> v6:
>  - take ref for DATA blob in duplicate_state func (Xaver Hugl)
>=20
> v5:
>  - Add function signature for init (Sebastian)
>  - Fix kernel-doc
>=20
> v4:
>  - Create helper function for creating 3x4 CTM colorop
>  - Fix CTM indexes in comment (Pekka)
>=20
>  drivers/gpu/drm/drm_atomic.c      |  3 ++
>  drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++++
>  drivers/gpu/drm/drm_colorop.c     | 47 +++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         | 24 ++++++++++++++++
>  include/uapi/drm/amdgpu_drm.h     |  9 ------
>  include/uapi/drm/drm_mode.h       | 32 ++++++++++++++++++++-
>  6 files changed, 135 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 7b042c38d50d..809bd856d378 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -793,6 +793,9 @@ static void drm_atomic_colorop_print_state(struct
> drm_printer *p,
>  		drm_printf(p, "\tcurve_1d_type=3D%s\n",
>  			   drm_get_colorop_curve_1d_type_name(state-
> >curve_1d_type));
>  		break;
> +	case DRM_COLOROP_CTM_3X4:
> +		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state-
> >data->base.id : 0);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index c0bcaec249de..be73cb9f502e 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -702,6 +702,31 @@ drm_atomic_plane_get_property(struct drm_plane
> *plane,
>  	return 0;
>  }
>=20
> +static int drm_atomic_color_set_data_property(struct drm_colorop
> *colorop,
> +					      struct drm_colorop_state *state,
> +					      struct drm_property *property,
> +					      uint64_t val)
> +{
> +	ssize_t elem_size =3D -1;
> +	ssize_t size =3D -1;
> +	bool replaced =3D false;
> +
> +	switch (colorop->type) {
> +	case DRM_COLOROP_CTM_3X4:
> +		size =3D sizeof(struct drm_color_ctm_3x4);
> +		break;
> +	default:
> +		/* should never get here */
> +		return -EINVAL;
> +	}
> +
> +	return drm_property_replace_blob_from_id(colorop->dev,
> +						 &state->data,
> +						 val,
> +						 size,
> +						 elem_size,
> +						 &replaced);
> +}
>=20
>  static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>  		struct drm_colorop_state *state, struct drm_file *file_priv,
> @@ -711,6 +736,9 @@ static int drm_atomic_colorop_set_property(struct
> drm_colorop *colorop,
>  		state->bypass =3D val;
>  	} else if (property =3D=3D colorop->curve_1d_type_property) {
>  		state->curve_1d_type =3D val;
> +	} else if (property =3D=3D colorop->data_property) {
> +		return drm_atomic_color_set_data_property(colorop, state,
> +							  property, val);
>  	} else {
>  		drm_dbg_atomic(colorop->dev,
>  			       "[COLOROP:%d:%d] unknown property
> [PROP:%d:%s]]\n", @@ -733,6 +761,8 @@
> drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>  		*val =3D state->bypass;
>  	} else if (property =3D=3D colorop->curve_1d_type_property) {
>  		*val =3D state->curve_1d_type;
> +	} else if (property =3D=3D colorop->data_property) {
> +		*val =3D (state->data) ? state->data->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 57a8c1063fdd..65351aaa7771 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -64,6 +64,7 @@
>=20
>  static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D =
{
>  	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>  };
>=20
>  static const char * const colorop_curve_1d_type_names[] =3D { @@ -148,6
> +149,11 @@ static void drm_colorop_cleanup(struct drm_colorop *colorop)
>  	list_del(&colorop->head);
>  	config->num_colorop--;
>=20
> +	if (colorop->state && colorop->state->data) {
> +		drm_property_blob_put(colorop->state->data);
> +		colorop->state->data =3D NULL;
> +	}
> +
>  	kfree(colorop->state);
>  }
>=20
> @@ -238,11 +244,51 @@ int drm_plane_colorop_curve_1d_init(struct
> drm_device *dev, struct drm_colorop *  }
> EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
>=20
> +static int drm_colorop_create_data_prop(struct drm_device *dev, struct
> +drm_colorop *colorop) {
> +	struct drm_property *prop;
> +
> +	/* data */
> +	prop =3D drm_property_create(dev, DRM_MODE_PROP_ATOMIC |
> DRM_MODE_PROP_BLOB,
> +				   "DATA", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->data_property =3D prop;
> +	drm_object_attach_property(&colorop->base,
> +				   colorop->data_property,
> +				   0);
> +
> +	return 0;
> +}
> +
> +int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> +				   struct drm_plane *plane)
> +{
> +	int ret;
> +
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_CTM_3X4);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
> +
>  static void __drm_atomic_helper_colorop_duplicate_state(struct
> drm_colorop *colorop,
>  							struct
> drm_colorop_state *state)  {
>  	memcpy(state, colorop->state, sizeof(*state));
>=20
> +	if (state->data)
> +		drm_property_blob_get(state->data);
> +
>  	state->bypass =3D true;
>  }
>=20
> @@ -324,6 +370,7 @@ void drm_colorop_reset(struct drm_colorop
> *colorop)
>=20
>  static const char * const colorop_type_name[] =3D {
>  	[DRM_COLOROP_1D_CURVE] =3D "1D Curve",
> +	[DRM_COLOROP_CTM_3X4] =3D "3x4 Matrix",
>  };
>=20
>  const char *drm_get_colorop_type_name(enum drm_colorop_type type)
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> 8e4d79ba1eff..5f0cddc3922f 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -99,6 +99,17 @@ struct drm_colorop_state {
>  	 */
>  	enum drm_colorop_curve_1d_type curve_1d_type;
>=20
> +	/**
> +	 * @data:
> +	 *
> +	 * Data blob for any TYPE that requires such a blob. The
> +	 * interpretation of the blob is TYPE-specific.
> +	 *
> +	 * See the &drm_colorop_type documentation for how blob is laid
> +	 * out.
> +	 */
> +	struct drm_property_blob *data;
> +
>  	/** @state: backpointer to global drm_atomic_state */
>  	struct drm_atomic_state *state;
>  };
> @@ -208,6 +219,17 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *curve_1d_type_property;
>=20
> +	/**
> +	 * @data_property:
> +	 *
> +	 * blob property for any TYPE that requires a blob of data,
> +	 * such as 1DLUT, CTM, 3DLUT, etc.
> +	 *
> +	 * The way this blob is interpreted depends on the TYPE of
> +	 * this
> +	 */
> +	struct drm_property *data_property;
> +
>  	/**
>  	 * @next_property:
>  	 *
> @@ -243,6 +265,8 @@ void drm_colorop_pipeline_destroy(struct drm_plane
> *plane);
>=20
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
> drm_colorop *colorop,
>  				    struct drm_plane *plane, u64
> supported_tfs);
> +int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> +				   struct drm_plane *plane);
>=20
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> diff --git a/include/uapi/drm/amdgpu_drm.h
> b/include/uapi/drm/amdgpu_drm.h index 25d5c6e90a99..96fabf9c9827
> 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -1300,15 +1300,6 @@ struct drm_amdgpu_info_gpuvm_fault {
>  #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
>  #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
>=20
> -/* FIXME wrong namespace! */
> -struct drm_color_ctm_3x4 {
> -	/*
> -	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> -	 * (not two's complement!) format.
> -	 */
> -	__u64 matrix[12];
> -};
> -
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index ea6d88f683cd..651bdf48b766 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -847,6 +847,20 @@ struct drm_color_ctm {
>  	__u64 matrix[9];
>  };
>=20
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 *
> +	 * out   matrix          in
> +	 * |R|   |0  1  2  3 |   | R |
> +	 * |G| =3D |4  5  6  7 | x | G |
> +	 * |B|   |8  9  10 11|   | B |
> +	 *                       |1.0|
> +	 */
> +	__u64 matrix[12];
> +};
> +
>  struct drm_color_lut {
>  	/*
>  	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 =3D=3D 0.0 a=
nd
> @@ -874,7 +888,23 @@ enum drm_colorop_type {
>  	 * A 1D curve that is being applied to all color channels. The
>  	 * curve is specified via the CURVE_1D_TYPE colorop property.
>  	 */
> -	DRM_COLOROP_1D_CURVE
> +	DRM_COLOROP_1D_CURVE,
> +
> +	/**
> +	 * @DRM_COLOROP_CTM_3X4:
> +	 *
> +	 * enum string "3x4 Matrix"
> +	 *
> +	 * A 3x4 matrix. Its values are specified via the
> +	 * &drm_color_ctm_3x4 struct provided via the DATA property.
> +	 *
> +	 * The DATA blob is a float[12]:
> +	 * out   matrix          in
> +	 * | R |   | 0  1  2  3  |   | R |
> +	 * | G | =3D | 4  5  6  7  | x | G |
> +	 * | B |   | 8  9  10 12 |   | B |
> +	 */
> +	DRM_COLOROP_CTM_3X4,
>  };
>=20
>  /**
> --
> 2.43.0

