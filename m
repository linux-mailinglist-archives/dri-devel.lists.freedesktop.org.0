Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0843C23478
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 06:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC8A10E049;
	Fri, 31 Oct 2025 05:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Abd7Js1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F0710E049
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 05:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761887103; x=1793423103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=epYl88CvOKsuhich0D2cMHeK7SjpliiULYQJxHi5x4E=;
 b=Abd7Js1n9kTuuyImHmVl06srXoiZC5Xhf/tEZA0DT6FKIKLEO2HTpc44
 MbDeF3pJWw+xcByZUOgdSh4H/A9Mb9m2GSGJqRGdkSbMMwFA9wT+dJprK
 OWs5DH5osJ/rC/WRKRaR0rpqolHMYU6tLUJ6Wjl+Gd+VdoGqDcgiMUL9n
 zHwxjXNQO3lwG1wwELefgqF9LsX1sNHNwuIMVOdzxy/QHUt8j/XicwFZ/
 B9wHGbxSJMg4uXMILfAoF6snEL8i6FfLV+srT7TCPmda6KRzcuUzW6VcH
 qf7aKqGsjBoM+P1yAZ/1WLndsvZxXLBcvXBeRJLZxFaQj7xpyEJQU4rRi A==;
X-CSE-ConnectionGUID: 1EW8uKt/R/2+E8HDFnWKyQ==
X-CSE-MsgGUID: lSBeRWSeTXiPDVkDw9puNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63956074"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="63956074"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 22:05:02 -0700
X-CSE-ConnectionGUID: TagunKvfRLeDq3MJ/XceTg==
X-CSE-MsgGUID: Fb2hpigQQ6CQMW0MN4m0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="185828240"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 22:05:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:05:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 22:05:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySi83rhqKZBpBXBQpF9NMFxRvZ+oTt6IrNFWztw8btKiIQ5dZUDnVNc6XnM8GE1PMkTCiURxFxG2xxoIHItmIDzpRoepgmp7pEnzvkJN0IdxHCpeLO6t3OSG28i17Ew+93Jdi4Ooqhi6XRmGp5Eyf2yBbOMbnW48NoEo0TyecH+0F4jTAp32rD+cKG14/QRlLTo6u85O5Mzl/fBuYt16azEMIPw28BkqVEdLU73vJJmUzMeE1RZ7BCt4piDP1HdwS/0eFfioCcWctYdCLhx0dArgnklRqn5cnHCaqnkHXstnTZHXvTrvQdU44HDI7gRoZHSjiGrFXLCzGgeA0Kqtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epYl88CvOKsuhich0D2cMHeK7SjpliiULYQJxHi5x4E=;
 b=nwXin0mkOO3PznVxgyp0lla8iuXKUDE8sehzsMpTFnYTDTjnAVYigPiQo7Odmw6480lIsfZ9JWJk2vp6CGRIXd7orGP13q9wgYdQgMKncTV2fznSVoYaD7f+UmVUFb2zOTVsg7ydtLHu9YLqVLAehisq9K/uyb970wp0uyAxWWiNxDI2EfcGwXmsTDPUw4MC4QHD68+2bJ6Q02xO0rmXEOF8xybsGkA16v6770B2KhxKad5i98X6A0j86v8vI9RB+0v92F8osSXSkIq9PpCtaP60QMC43XUQ8ibzJGXpxDegVuHKK0SBkOdHfFWHB7GBDgl8yp0S/WMDsZyc1pwlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 05:04:53 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 05:04:53 +0000
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
Thread-Index: AQHcRyfvcpYOJVPbTkGCrlhdg7m/dLTXuRYAgADddcCAAiSGAIAAgIJg
Date: Fri, 31 Oct 2025 05:04:53 +0000
Message-ID: <CH3PR11MB7177B04D32239354CD6A609EF8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
 <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b54f8527-5ce3-449a-ac96-6b4686d1b108@collabora.com>
In-Reply-To: <b54f8527-5ce3-449a-ac96-6b4686d1b108@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|IA0PR11MB7813:EE_
x-ms-office365-filtering-correlation-id: 7fbd4983-935e-40bf-9f70-08de183b073e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?5DiVSo11nnldZJiSlJlI4dVvjZyCrjwS4FIcyAinezydxa/RjTm+PQDYExrN?=
 =?us-ascii?Q?73U43CvfTCpVkyP5LgOjgsKAG1yOImjERzEx6ICijytKpNmGbTWEPE7ABgYa?=
 =?us-ascii?Q?kF+IFK0LJK6iP9qFPUJxu2fx1f8P4wV2Gi+O+z3MXpnFCLGavNCmR0RjXYGk?=
 =?us-ascii?Q?phcW9CR9+60PTDjgg+/Vm4r+kLYM/pyGW7rHiVBSLhYi+ez9PONzrqYYBkpd?=
 =?us-ascii?Q?/H8DXM+m9H2egfA3siXyOPc4Lqm3NYqQI9C1FBcJO2QpjQLEJ2S7UuZQvfGN?=
 =?us-ascii?Q?Ti8mDUg0QAV4UOXQurcPBBnlLJ78tfVLao+czNxMNZ2Fd6i+KzToCLYlXvV0?=
 =?us-ascii?Q?MKWI3xKNbXNiqTVxu8BcfQHgToPzQL/PSoVanbqHi6nr57yApNlrFFO/98td?=
 =?us-ascii?Q?xP9Zn2VpotdhNdL6Su7LAs35RaMTQNYO+8DLiCi36b8ipsgPTMLk2DwTBOqM?=
 =?us-ascii?Q?0SGnBZCtUjuHLW2JKn1IMuiQFlvYVYXalqlI6xQbHKxHCLPCSzcCCA/sgccn?=
 =?us-ascii?Q?QldDeTgy52IdN1/5ei0Sr59jCWWwAPshpzkH1VofpdoX5GLm/OBAYzt/MILO?=
 =?us-ascii?Q?+1nW34t5JxCLrTfyUFQ3c6eel1CbIglLd84BZCYv5I4gBY7oOuxI8ehTJ+Wm?=
 =?us-ascii?Q?Q6cw4gWpTUUuUVKTGiDe7Lhk3Hrpq4GQ1Z8L5dtPc5Ie/5JauHEdKdmAzQKl?=
 =?us-ascii?Q?2yos4/ZVFD/teP8COLWJqoMDM6XU72K+EHpTjLRAWnvOu4a/xkXNgBDUgX0I?=
 =?us-ascii?Q?kcV89hE8GaTz8rTdxqe2OyoYGfjzqMHSicbK9fPffvbRPz56MWW90wayvA1q?=
 =?us-ascii?Q?WUl4wtcxxytlMO20FUgNAunlBA4XtO8lMzpzRFstulJ1gmzYZwRmK+IhwpnC?=
 =?us-ascii?Q?NXxAKi/3uUHiqX4vW42NvgnMyechZe4O+qPHkE3bttA8wJ00r1b++RLxvazs?=
 =?us-ascii?Q?Sk48qaMe327Zzumjg2RlBPoQqKdT9zsvMd1uQsqC9hS9nJKLExc+2IrTBPiK?=
 =?us-ascii?Q?zEwSRpCEQwo331k0LACSrSIJ2kzo4QQVw0URPW3CA2pvaq0znSk3DZgwOSb/?=
 =?us-ascii?Q?utrDA+ExEpDdUTwEQNhKh1hjllFIXHendvA/XfODqvhQnREZGzIPx3DrUieV?=
 =?us-ascii?Q?7sCY+N0CYXzGkc5kBNPNgUI8+Li68vxHtlfwbcpPcuq8iZfAAu+ZijZ4vZnO?=
 =?us-ascii?Q?RVd93vrO6M2IrQAteXI1hSph4QSMQ8T6PRWqSQUdvWbGh+mp8eXUZEdIV8+Z?=
 =?us-ascii?Q?72OAoqR1rUClKE3po3Zz7D+GqR+6w6oOB52gfm3cqoPx+7H+7/KuaoPXiONB?=
 =?us-ascii?Q?XkRX0xT4JxPD6FxIoNhXXK6JaCP3TvpauJkmd+ym+FK3EX3fIzkgM/ZRpS+T?=
 =?us-ascii?Q?3dr4dsZil4I4QgMzyda3lglayK/E8XUCQuZqQW8G3SzlJNPyTjyw1QgdXA2T?=
 =?us-ascii?Q?LvgPPmemyyUs4sTviza8XwM0NhvMecb/q0pq5ZdkTLkHVxpgcf6dJ0dImOGg?=
 =?us-ascii?Q?d4mq6EK0aUlWQor3JXVq86t8kRcrdfkSTpSW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1ICO/QTR4s8lzkATOAelOhT9PuWIm+0llY/C7BOi9/YoOKr6iH+bdBttx/oF?=
 =?us-ascii?Q?IJRpwQdWEK6cPHnsNmr62XOZtBer2864hoAjPsKzoILxbgSyie0OtBLuQBM0?=
 =?us-ascii?Q?s8HBJUZQDTHofm19GWCsPSdIkx4dKwM4PjSsR1bXU/pWcFqEQczinhx36es2?=
 =?us-ascii?Q?0gDA3PuX/3OrodXy6pAxt2rZjUZ6I4WyvoTZdMcIEo/pXjWWvhBXrnyMWADP?=
 =?us-ascii?Q?pjTZYrSop6Hnwch1GqdXn08UDKtIBF0OuvrBOe97Tm6b51Lao7ccSGW5t8GH?=
 =?us-ascii?Q?lPCpj3p9Sqcnc8OwJ5vSV4PMxR/DuR8Wg178aiSDQlhXVgKHM6j+u5RZW+jR?=
 =?us-ascii?Q?rGmhdNo/St5MteosUtkeKD53ivA3f/csWkr/Ljf1PyOoEf3+VyoQK5e4i1u8?=
 =?us-ascii?Q?h9qYg5JuhMu07XC7DRYrK1CbKg2usI0xwcGFbzUXQkkEODpXtURBg4202uMd?=
 =?us-ascii?Q?of/l/NT3U5q+iv2rnbn/g6znW5pt2Vlc8cnmWollCMpFQ+SPREc1dSyhfcFP?=
 =?us-ascii?Q?Pdgs7xg2NysbPCHnDlwNdC1hyXmmOvLceWV3Oejq+5qybzeuq8ZuP+S/ZQnF?=
 =?us-ascii?Q?MAtwl+2gG+MvXP3cSt6EI3KffJHmeTYl01FDd7tarbcYW6mDEkK17xuym9i6?=
 =?us-ascii?Q?yOJgsr+qyVq3pdnmQibUP9JadbCQPaYiGilyeEF4vrNLByPpH/KnMH5/nTKc?=
 =?us-ascii?Q?9DsMsn69BQyHoNWp5FNdJMHk8kxzTj+2n5G9hehZTeHZADn+HLoj/vwe4LrD?=
 =?us-ascii?Q?uq996SjnqsVBTBbO1ufbyg2ojl7WMIgfxE0ufb5n7RFEJCCeDZbHAPbUqIXI?=
 =?us-ascii?Q?+UOmjms7hNpnCmKE/CA+j0ZaprekG3ZwCpIJJud5EsnludqWVBHiE5jcv7Gh?=
 =?us-ascii?Q?4ffhoNI7Iy2oc9E4qNNLipnMOdLlcx5/wtTc4FOlmJ33H/assyPm6sENmW3T?=
 =?us-ascii?Q?KgKU0f99L2jqB+TQi6i/hCEno+dFbCOHRfLEfiZmpMfKoysOwNJfff2HjUbf?=
 =?us-ascii?Q?M0s+csyoWyJJZDg9/iy1UWZJmoYWUlKYphpunCB62inzhCgT6mldqkU4anSi?=
 =?us-ascii?Q?vb12y8BdkP/pBMkuvDguzyepq0NplXmr6xfz6gQSSxKercLPs2IaUL/BCFnG?=
 =?us-ascii?Q?La9t24uV0xtbACylrJjENZ9zY8lDdvJVRjvVfvA80qPGOZPDRPk5+Xie4D3W?=
 =?us-ascii?Q?CDOlgtkqVIEwmhMA41b1otIMZNT43ROvE8RB5TT9Kk+VtO7w55MChsVTGftr?=
 =?us-ascii?Q?uGkDcG03ZIsYpRxIgsqL+LST1vTJq9n9Jp0PiN0ILpi9D+01HNTz6zBqZLui?=
 =?us-ascii?Q?zlrKKvj6bF0uEbGN67rr9co1q39oM5F+OObekmaVXYV3eotzZnvK2+d8gTNl?=
 =?us-ascii?Q?X9G82keemnoV4wWbOCGi/j5cVaPBiLK45gPBWEjPDm0ManE1nBZfGmnU7FiU?=
 =?us-ascii?Q?cS2dSNNAiTFw4M3xPzFtVapFa5KBJS4iK8pIwT0sV+TFwd88N2Wj5XsClIqL?=
 =?us-ascii?Q?FnqsMs6GP1owqF+f37UkSL8qo8ygovpXid+jEzWXOIcuOZOj9dKk6MIZNL3A?=
 =?us-ascii?Q?bxLWwiZNoVrmtACplNu9YFoYDCrdRPI0ttVLAJFt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbd4983-935e-40bf-9f70-08de183b073e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 05:04:53.6455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hVb/I2TKb9BoavBTW3k0G+4CGxPMI+0DenN6/sxAIeyZD+ojvXo0OGGfpF2hfBVCaMoAQYjE1yeaFRgnWts731TrPMcu2nRubb1nJJdsm9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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
> On 10/29/25 08:47, Kasireddy, Vivek wrote:
> > I applied this patch and tested 3 different scenarios:
> > 1) blob=3Dtrue + imported buffers
> > root@localhost:weston_upstream/weston# ./build/clients/weston-simple-
> egl -o &
> > Using config: r8g8b8a0
> > has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> > has EGL_EXT_surface_compression
> > 245 frames in 5 seconds: 49.000000 fps
> > 236 frames in 5 seconds: 47.200001 fps
> > 279 frames in 5 seconds: 55.799999 fps
> > 240 frames in 5 seconds: 48.000000 fps
> > 244 frames in 5 seconds: 48.799999 fps
> > 283 frames in 5 seconds: 56.599998 fps
> > 274 frames in 5 seconds: 54.799999 fps
> >
> > 2) blob=3Dtrue
> > root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-
> egl -o &
> > Using config: r8g8b8a0
> > has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> > has EGL_EXT_surface_compression
> > 167 frames in 5 seconds: 33.400002 fps
> > 208 frames in 5 seconds: 41.599998 fps
> > 203 frames in 5 seconds: 40.599998 fps
> > 252 frames in 5 seconds: 50.400002 fps
> > 180 frames in 5 seconds: 36.000000 fps
> > 219 frames in 5 seconds: 43.799999 fps
> > 176 frames in 5 seconds: 35.200001 fps
> > 220 frames in 5 seconds: 44.000000 fps
>=20
> Thanks for the testing.
>=20
> For the second scenario I'm getting better result, it's 55-60fps for me.
> Given that this is a SW rendering, curious whether that's because you're
> testing on a lower end machine(?)
I am testing with a dGPU (B60) on the Host where I am running Gnome Xorg
but I am running Gnome Wayland in the Guest. What compositors are you
running on the Host and Guest? Kwin? Also, could you please share your
Qemu launch parameters as well so that we can try to figure out the reason
for the performance discrepancy?

Thanks,
Vivek
=20

>=20
> --
> Best regards,
> Dmitry
