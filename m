Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1285BE6854
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 08:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BAB10EB10;
	Fri, 17 Oct 2025 06:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djcvk0ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCC510EB10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760681011; x=1792217011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2cWGYylb0Z71ZHfBpVHcWQCXRaHTd0DXfk683ExQJcQ=;
 b=djcvk0zem9uOTp+qw+w51LW1YEJpUIFH0FublrKoxkCDAZGXZRNptqyB
 jw+zEX6QAwhq8k9UXIy8M05iEF5RlLDTLAMkhQZsrFeeONVSWau18f6ge
 15GuW5CsJRvplpSV7lc50nFXCqGtvjJUOhyoBF1XOoQtb1f6Av8PXE8pg
 ITP98mGuwG/Nzf5REpBne2RpxWvbNWt1qRqiAG7nUDx37+cQdvG/68qzi
 gWfJ00MxjYE+HttRX5ue8D6ZfHDuWw3nFZGkhxg/osE6phWNv4LJcqD73
 vvz4cTuOchKbxM92c4Yy1NDJu7hZdj6A3NHgXpRM0EFh0676/Pxy3coLp g==;
X-CSE-ConnectionGUID: 60M5suGQRyW+6LgzY8rtww==
X-CSE-MsgGUID: xY7Oztk3TQuk9eUJMDLTNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62096513"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62096513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 23:03:31 -0700
X-CSE-ConnectionGUID: LZG5wxfmTN6eERn4gvmM3w==
X-CSE-MsgGUID: SV2EQFV3QJS1tzdraMM/XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183129527"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 23:03:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 23:03:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 23:03:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 23:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eV/QNwXGrBLFV0ljH2UMcukhFdKZmsMfps6Re8kRwMDKpdOgpuGt97Q50ZBB2GCX5eiKoTnp08RfSnqAaH5dJucFv5bhxsFF8EnWly88+zf61W+2ww2tDZAGVOs5RYMWDs4gGV9cQeQXxssnnlE4OXSlGiIumjN/EkZMT5tSLv87eW8riMZqOmczSCjhcly6LxcuwmXVW6zgWgjrCdVR8ustOgp2XBq6tSif8u95tqTHHVWARPG+FAhIScMGyf41m1ll6IU/x+xWTK64ckvXY5lIPQkykDJ0SzxAfRYDTBWrovOp87AY1ca5aWx4W67dlxeMqOHHzYMxy33fZKdxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UA7FFOepRbdSle/FnI6s2FirWqIuw4LhFxHOM8cgR4=;
 b=CKOOiUIQEHvpBsXHSElztgZkz0IJeIKvBEObfbTgf9O1dJGo8dh9ISNtnXa9D/AbjjkzGkkjFH2hHC/PNmHIXWsyvjKDFKc4qLlTRQv8rcEcMr0trMTvaeOzFlaN0r22o9PHMqaJlTD6AtzkpuDLBYdR3l5JntemEJlXgs+RN8UEnxB6MrVlqCrPRdt0RvFakRF11fZAOb35hNgRf3vl9XobhPsglHw7F4I7WlbTQIbBFRE/weFR5un83IRLgiwgwOH9JNVm6DY+F5533Yr72Bc0sT45+LFHtkSlASmZcYcWuRALcyg6b6aa9YvD8ojoXPStIPqCApg+BKzoAKkNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 06:03:26 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 06:03:26 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dmitry.osipenko@collabora.com"
 <dmitry.osipenko@collabora.com>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
Thread-Topic: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
 host resource
Thread-Index: AQHcPqyOICgcQp9euUCaQTY4FsET/rTFt30w
Date: Fri, 17 Oct 2025 06:03:26 +0000
Message-ID: <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251016145230.79270-1-tzimmermann@suse.de>
In-Reply-To: <20251016145230.79270-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB7102:EE_
x-ms-office365-filtering-correlation-id: ca4f8b02-4058-473b-26f9-08de0d42e358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?pV0o8e28m4YzR6RZO9rd7qOEp5E91pzhwZLusOktJbVDvECa+nMx1IBxrYIC?=
 =?us-ascii?Q?oU/ydl2hJBdK6xxs4bxFAfokmxnz0KdG2qsbgCn/g5AD6t5PXeAnh/DHV7yq?=
 =?us-ascii?Q?fzvL5afzjgSkYbnp1+fbH28JHicg2nyR6fQSf8FE8i+Tp99SFsEDn8JuuBY0?=
 =?us-ascii?Q?o3YVF/C36UcFYBjFmF4GO31x3gFkcKnI1S1nKIAkuFYA5e8mvrlhuutDWKha?=
 =?us-ascii?Q?nhx49+Spy4cnIxAtH2JYq5PwQs7VH4undSMVPEwZx8fawrx8YFJ6q0rjaR5D?=
 =?us-ascii?Q?rGWp43nSN0cx2G3XC8RiW6c+R1RG87Q8BVOmbGcqaszPACOTDrZKwwTGhKLX?=
 =?us-ascii?Q?sweRUG3HRGDwemV66oYtrZkQZaXHf/fLceWHZiRKhBJfiE0Q8CDmOSTCfEBQ?=
 =?us-ascii?Q?+rFqbFTdwDH1HNCvl1DAdLRSOozhseL2u1PRwSDjfGIt/13eCxn37RcdQv71?=
 =?us-ascii?Q?KvTdh+C1pRV5nBa9lBQixX/uwfL9HfENwX9Q9+Nt7+96Cz+N/QWryljRofHr?=
 =?us-ascii?Q?sX75VTxEGnowTAqc76w4d+4Jr3HI0lBVHOurdpzMhGv3iis7O9RS5Fx8GpNJ?=
 =?us-ascii?Q?A+wZ7k8pEmmmS57MVUugvyxXDc9WG+8QWNLVmwCfm3X+mSPez2lHhcNHY79c?=
 =?us-ascii?Q?vce0dyuFxxqhyeXQ6ppnj5VRY3p708u6t/l13pVzqNhLE4i38jn8wWp9xZsZ?=
 =?us-ascii?Q?MxNTTf2iURDLIo9A6CbsYWUnAkdebhouGILns9xKtGXW+aEGmu47XJcjT8iq?=
 =?us-ascii?Q?QDv3F16az/MV1rz8sWJkr1tDxelK9Ie9IEzQwEugPiiGUEwDFupcXgmyvWr9?=
 =?us-ascii?Q?d6V/8hZUl86GBaUHlGn7U829JwIZKbbANnkqjfczoD5y5JyicA2qhS0X4I8Z?=
 =?us-ascii?Q?gIsQtc6rxjHbGPqxf7qrJXtOZCiCxbalH41kamQc2W0TH7N+Ebm5ljO8V982?=
 =?us-ascii?Q?OO2o/9GsPfXfs0Rf3I7+SANXLd+LNCXiiGc/Z6aq7EIZS2I4Q2g6IXPxY8I/?=
 =?us-ascii?Q?ddK3h4QMMG0CDBmCJNuZCptYdIo++cqvYl5bt19qiteGJfzfz51sUgEdJa/W?=
 =?us-ascii?Q?iOU6Fxu2TOCqG7BeJNpn7iGyfanHKRCvUa8Irz90SQlz/gmnJsC4cocv+djk?=
 =?us-ascii?Q?5QPg/BpoAetRugOhR2BUiHUWz5o1kc2QsE00e/+ifrd5HhZbyopCZXLYgcZl?=
 =?us-ascii?Q?rYu7S45i380ZX27UpWU/CnTOEGNKZGRK7/V+v6/34XgYaFpitpiU9IZAbzbd?=
 =?us-ascii?Q?TLoa2A+u8UnmbBLlBlDj7zMlqT5abNKYSvFEtwCabsoLFeOgzuZ6CfX9/5wU?=
 =?us-ascii?Q?1614QLoY+Thl167TPnzgG81sbp8OthXed68ZUsGXT1QzTbh1vpwCRZN5F3s4?=
 =?us-ascii?Q?UT+0Eeqd7KJAyPGVew3ig8xIloycg4MC1e7W7dIT5s1pCtH/4VIFABtL20wr?=
 =?us-ascii?Q?g6ev2irT5Lh9LUXHL1+MQCH1l4At8kou48wwlrIDf/NoPeHMWnaITOSJ5WDE?=
 =?us-ascii?Q?rYtf3CZVTS9S7u0HMSnufuFia2qt0O9uw/RD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oDTquqcFBhPyKl1H7xV9fo8gkplZ0r/RiUV+/1Avf4qXTPnydeGXP6M9SC/o?=
 =?us-ascii?Q?HApELyYkhV+B9qe/W5LJPcEeqJF4M5o9Qs/fujBU5gIuDXNUVGWyFMDvukEY?=
 =?us-ascii?Q?nNB6q+cnNf51qQvgfqzl9bEgHkk5mQ6bUcQbigQNtNyu8lCUjzVPnU9iq/Wp?=
 =?us-ascii?Q?x9T+oFXmTiELY6yuUSpLjVspDimxDVktOPcnv4aJOI099wLzMlRTK/ZmsBaP?=
 =?us-ascii?Q?d5sSdqstV1giqp8oByIE3o5rQ0qnGNpR5vKkFPvn4PNyIaZfPNc42Te1gFSN?=
 =?us-ascii?Q?mKTIfb6fq4asQTjFZJOWVrm73ajS6lOZ0/kSojDSr9aSYge8oPe01LLfp7zj?=
 =?us-ascii?Q?oGKFfi4YaJOeQHuIhEGHZJEB5mkebBqFju+Kg9azuclUeyvysvf8kGZXSPMq?=
 =?us-ascii?Q?l/yaxNfwaVswBgbPpXjWWBEl7y9UQ83PvbxYMuQenwajZFMMx7sZfTK8KwCx?=
 =?us-ascii?Q?oh6N3TYtCmhxElf+oB/aI7UCGHJ8fyLvxrfh838BfSmwMMoQUOlBLueimWxX?=
 =?us-ascii?Q?WOHafLcK/Y2OHSLyBuu3xH6AS9PLZ9ISl0ZLqyCmiDRz6S/SA4jrWKERCf2S?=
 =?us-ascii?Q?LtxLhOsxapjNN5LYqM3qIH6q2pfjMEYg8xdFm4aIPPO0+laxjl5xZbSXwRm2?=
 =?us-ascii?Q?8mHqNIbdArRxJEVTYJA9bSMOMA5t5jWfxyq0lheHBydw3RvXJONHisq9mkjl?=
 =?us-ascii?Q?W227WqI5PSmdtYm7v3EoQUQZOEvjq0DJ2JS7L+j9GOqfi74b/jSb8VOfYSxS?=
 =?us-ascii?Q?tBesHoZmKAeuSPByfYAdd66NtrNYaRiu7NjmsOsPIY2avj/TQ6UQ5R5FmdZn?=
 =?us-ascii?Q?qr9kC85JxqsFCiFF8i16LDtu5H5sQdLXRIgDrJOabCRVOfM2Yjko2wuj3K2V?=
 =?us-ascii?Q?Vk4VcVE7wW2IZ7XMJ6pabpswMGi+82+A6sUD92HZxM8YaUGwKTJxth9ohvpU?=
 =?us-ascii?Q?J34jqsUo7JMtQaT8JJi5657eZYz4AicCL9nL19Th5MvuIK8aTGWpoVD/jUbD?=
 =?us-ascii?Q?z3ODesIMsUNIqBzoXkGoydFpFgFqRZ0HHaGVD5sSyQCldKhIxZcF7AE/Mkkn?=
 =?us-ascii?Q?V9APCGXRKEgOzpuSzLKSygB2Ma3uJbAUmBmce1W6b1p5N9lJawMCX8oYgCc0?=
 =?us-ascii?Q?crl72UOiG71jByqi9t1kdGZlNTZ8TQYNWky4BdupR7w+3g9zLrwM+wvyBNZs?=
 =?us-ascii?Q?lufraM9AqQd2MwexBa6BQ5+8zWPpmpaRwui1l3wFlmMN6//vv0NhtqOw1IQe?=
 =?us-ascii?Q?fKJmUyEl/vjT2uegJArsq8KOipYkcUen/gjgsy6d8JJKFmnVy9EcbS9gYVXc?=
 =?us-ascii?Q?br9IrJopwFpdPoV9hKxJsA2rVRnqfH+bRVL9760tDP0vPnmAhYTTBxxCrBjh?=
 =?us-ascii?Q?kg/0xfzFHkA7Chn/uZPwzCSfNRb/nzugmfFAhWGiddmowj89gEXQvsgIr7np?=
 =?us-ascii?Q?gHbrr85De56sXZB/wpKUDgNmEQ377aEskCdSPzeT3+kH4y1RJIU8XqxSJNjA?=
 =?us-ascii?Q?iEKwF05V7sXvhuBlTrbe7daVThVTmP/1yP53EGFntpEBIATrmi+qGktRyT0p?=
 =?us-ascii?Q?6LzGiwKl9Qu01evsAHwlPKBIjERe6A3w9DFxp6RA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4f8b02-4058-473b-26f9-08de0d42e358
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 06:03:26.5914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdW7hnIZk9/SHjF8XQxe7wkMKeaireluzqjAbeX1c0hOAKvcdAtIdjrniCj0XW0Yua88Uz5xF4cpAJfSQoauZe6UuYXYuCCFV7cO/b1a7c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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

Hi Thomas,

> Subject: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the hos=
t
> resource
>=20
> For each plane, store the buffer object's host backing in the state
> of the plane's respective CRTC. The host synchronizes output of buffer
> objects with a host resource to its own refresh cycle; thus avoiding
> tearing. During the CRTC's atomic flush, ignore the vblank timer if
> any of the CRTC's plane's buffer object has a host resource. Instead
> send the vblank event immdiatelly. Avoids corner cases where a vblank
> event happens too late for the next frame to be page flipped in time.
>=20
> The host synchronizes a plane's output to the host repaint cycle if
> the plane's buffer object has an associated host resource. An atomic
> commit blocks until the host cycle completes and then arms the vblank
> event. The guest compositor is thereby synchronized to the host's
> output rate.
>=20
> To avoid delays, send out the vblank event immediately instead of
> just arming it. Otherwise the event might be too late to page flip
> the compositor's next frame.
>=20
> The vblank timer is still active and fires in regular intervals
> according to the guest display refresh. This rate limits clients
> that only wait for the next vblank to occur, such as fbcon. These
> clients would otherwise produce a very high number of frames per
> second.
>=20
> For commits without host resource, the vblank timer rate-limits the
> guest output by generating vblank events at the guest display refresh
> rate as before.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> There was a discussion about interference between vblank timers and
> the host repaint cycle at [1]. This patch address a possible corner
> case were the timing gets bad.
>=20
> [1] https://lore.kernel.org/dri-
> devel/IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.na
> mprd11.prod.outlook.com/
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 72 ++++++++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 +++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c   | 16 +++++-
>  3 files changed, 98 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
> b/drivers/gpu/drm/virtio/virtgpu_display.c
> index e972d9b015a9..43df1fa7d629 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -49,14 +49,76 @@
>  #define drm_connector_to_virtio_gpu_output(x) \
>  	container_of(x, struct virtio_gpu_output, conn)
>=20
> +static void virtio_gpu_crtc_state_destroy(struct virtio_gpu_crtc_state
> *vgcrtc_state)
> +{
> +	__drm_atomic_helper_crtc_destroy_state(&vgcrtc_state->base);
> +
> +	kfree(vgcrtc_state);
> +}
> +
> +static bool virtio_gpu_crtc_state_send_event_on_flush(struct
> virtio_gpu_crtc_state *vgcrtc_state)
> +{
> +	struct drm_crtc_state *crtc_state =3D &vgcrtc_state->base;
> +
> +	/*
> +	 * The CRTC's output is vsync'ed if at least one plane's output is
> +	 * sync'ed to the host refresh.
> +	 */
> +	return vgcrtc_state->send_event_on_flush & crtc_state->plane_mask;
> +}
> +
> +static void virtio_gpu_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct virtio_gpu_crtc_state *vgcrtc_state;
> +
> +	if (crtc->state)
> +		virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc-
> >state));
> +
> +	vgcrtc_state =3D kzalloc(sizeof(*vgcrtc_state), GFP_KERNEL);
> +	if (vgcrtc_state) {
> +		vgcrtc_state->send_event_on_flush =3D 0ul;
> +		__drm_atomic_helper_crtc_reset(crtc, &vgcrtc_state->base);
> +	} else {
> +		__drm_atomic_helper_crtc_reset(crtc, NULL);
> +	}
> +}
> +
> +static struct drm_crtc_state *virtio_gpu_crtc_atomic_duplicate_state(str=
uct
> drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_crtc_state *crtc_state =3D crtc->state;
> +	struct virtio_gpu_crtc_state *new_vgcrtc_state;
> +	struct virtio_gpu_crtc_state *vgcrtc_state;
> +
> +	if (drm_WARN_ON(dev, !crtc_state))
> +		return NULL;
> +
> +	new_vgcrtc_state =3D kzalloc(sizeof(*new_vgcrtc_state), GFP_KERNEL);
> +	if (!new_vgcrtc_state)
> +		return NULL;
> +
> +	vgcrtc_state =3D to_virtio_gpu_crtc_state(crtc_state);
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_vgcrtc_state-
> >base);
> +	vgcrtc_state->send_event_on_flush =3D vgcrtc_state-
> >send_event_on_flush;
> +
> +	return &new_vgcrtc_state->base;
> +}
> +
> +static void virtio_gpu_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> +						 struct drm_crtc_state *crtc_state)
> +{
> +	virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc_state));
> +}
> +
>  static const struct drm_crtc_funcs virtio_gpu_crtc_funcs =3D {
>  	.set_config             =3D drm_atomic_helper_set_config,
>  	.destroy                =3D drm_crtc_cleanup,
>=20
>  	.page_flip              =3D drm_atomic_helper_page_flip,
> -	.reset                  =3D drm_atomic_helper_crtc_reset,
> -	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> -	.atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> +	.reset                  =3D virtio_gpu_crtc_reset,
> +	.atomic_duplicate_state =3D virtio_gpu_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state   =3D virtio_gpu_crtc_atomic_destroy_state,
>  	DRM_CRTC_VBLANK_TIMER_FUNCS,
>  };
>=20
> @@ -129,7 +191,9 @@ static void virtio_gpu_crtc_atomic_flush(struct
> drm_crtc *crtc,
>  {
>  	struct drm_device *dev =3D crtc->dev;
>  	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state, crtc);
> +	struct virtio_gpu_crtc_state *vgcrtc_state =3D
> to_virtio_gpu_crtc_state(crtc_state);
>  	struct virtio_gpu_output *output =3D
> drm_crtc_to_virtio_gpu_output(crtc);
> +	bool send_event_on_flush =3D
> virtio_gpu_crtc_state_send_event_on_flush(vgcrtc_state);
>  	struct drm_pending_vblank_event *event;
>=20
>  	/*
> @@ -147,7 +211,7 @@ static void virtio_gpu_crtc_atomic_flush(struct
> drm_crtc *crtc,
>  	crtc_state->event =3D NULL;
>=20
>  	if (event) {
> -		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> +		if (!send_event_on_flush && drm_crtc_vblank_get(crtc) =3D=3D 0)
>  			drm_crtc_arm_vblank_event(crtc, event);
>  		else
>  			drm_crtc_send_vblank_event(crtc, event);
As suspected, before applying this patch, the frame rate was halved:
root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -=
o &
Using config: r8g8b8a0
has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
has EGL_EXT_surface_compression
150 frames in 5 seconds: 30.000000 fps
149 frames in 5 seconds: 29.799999 fps
152 frames in 5 seconds: 30.400000 fps

And, after applying this patch:
root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -=
o &
Using config: r8g8b8a0
has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
has EGL_EXT_surface_compression
277 frames in 5 seconds: 55.400002 fps
273 frames in 5 seconds: 54.599998 fps
298 frames in 5 seconds: 59.599998 fps
284 frames in 5 seconds: 56.799999 fps
287 frames in 5 seconds: 57.400002 fps
272 frames in 5 seconds: 54.400002 fps
289 frames in 5 seconds: 57.799999 fps
287 frames in 5 seconds: 57.400002 fps
289 frames in 5 seconds: 57.799999 fps
272 frames in 5 seconds: 54.400002 fps
266 frames in 5 seconds: 53.200001 fps
261 frames in 5 seconds: 52.200001 fps
277 frames in 5 seconds: 55.400002 fps
256 frames in 5 seconds: 51.200001 fps
179 frames in 5 seconds: 35.799999 fps
169 frames in 5 seconds: 33.799999 fps
178 frames in 5 seconds: 35.599998 fps
211 frames in 5 seconds: 42.200001 fps
255 frames in 5 seconds: 51.000000 fps

As you can see, the frame rate/performance improves but it occasionally
drops into the 30s and 40s, which is a bit concerning because if I revert
this patch and a036f5fceedb ("drm/virtgpu: Use vblank timer") and test
again, I do not see this drop.

This suggests that the vblank event is still delayed in some other corner
cases, which might be challenging to figure out.

Tested by running Gnome Wayland after launching Qemu with following
(relevant) parameters:
qemu-system-x86_64 -m 4096m -enable-kvm .........
-device vfio-pci,host=3D0000:03:00.1
-device virtio-gpu,max_outputs=3D1,xres=3D1920,yres=3D1080,blob=3Dtrue
-display gtk,gl=3Don
-object memory-backend-memfd,id=3Dmem1,size=3D4096M
-machine q35,accel=3Dkvm,memory-backend=3Dmem1

Thanks,
Vivek

> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index f17660a71a3e..671fc3b61bc6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -195,6 +195,21 @@ struct virtio_gpu_framebuffer {
>  #define to_virtio_gpu_framebuffer(x) \
>  	container_of(x, struct virtio_gpu_framebuffer, base)
>=20
> +struct virtio_gpu_crtc_state {
> +	struct drm_crtc_state base;
> +
> +	/*
> +	 * Send vblank event immediately from atomic_flush. Set from each
> +	 * plane's atomic check and depends on the buffer object. Buffers
> +	 * with host backing are vsync'd already and should send immediately;
> +	 * others should wait for the VBLANK timer.
> +	 */
> +	u32 send_event_on_flush;
> +};
> +
> +#define to_virtio_gpu_crtc_state(x) \
> +	container_of(x, struct virtio_gpu_crtc_state, base)
> +
>  struct virtio_gpu_plane_state {
>  	struct drm_plane_state base;
>  	struct virtio_gpu_fence *fence;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
> b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 29e4b458ae57..d04721c5d505 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -104,7 +104,8 @@ static int virtio_gpu_plane_atomic_check(struct
> drm_plane *plane,
>=20
> plane);
>  	bool is_cursor =3D plane->type =3D=3D DRM_PLANE_TYPE_CURSOR;
>  	struct drm_crtc_state *crtc_state;
> -	int ret;
> +	struct virtio_gpu_crtc_state *vgcrtc_state;
> +	int ret, i;
>=20
>  	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
>  		return 0;
> @@ -126,6 +127,19 @@ static int virtio_gpu_plane_atomic_check(struct
> drm_plane *plane,
>  						  DRM_PLANE_NO_SCALING,
>  						  DRM_PLANE_NO_SCALING,
>  						  is_cursor, true);
> +
> +	vgcrtc_state =3D to_virtio_gpu_crtc_state(crtc_state);
> +	vgcrtc_state->send_event_on_flush &=3D ~drm_plane_mask(plane);
> +
> +	for (i =3D 0; i < new_plane_state->fb->format->num_planes; ++i) {
> +		struct virtio_gpu_object *bo =3D
> gem_to_virtio_gpu_obj(new_plane_state->fb->obj[i]);
> +
> +		if (bo->host3d_blob || bo->guest_blob) {
> +			vgcrtc_state->send_event_on_flush |=3D
> drm_plane_mask(plane);
> +			break; /* only need to find one */
> +		}
> +	}
> +
>  	return ret;
>  }
>=20
> --
> 2.51.0

