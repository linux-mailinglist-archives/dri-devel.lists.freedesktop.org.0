Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3286BFEA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 05:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37B610E220;
	Thu, 29 Feb 2024 04:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgN4tgrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3D010E220;
 Thu, 29 Feb 2024 04:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709181489; x=1740717489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6FpxIynYhoBk0hfFj/EAWdQDp31xiWhvObmDQ/0+4e8=;
 b=SgN4tgrdU99Q1I6fWvx/+bdql4WJDzAbDSRloUNYVmjR4HBrRYkr3hcO
 ZypzQBL3AIEyP5XzylpLTFVMzaqCLk6va96jgBxpmPJZ1PFNYqz3ekfhv
 6DKAmn50EaNxiAQOkrtgosGQDFa9aBQMELPGs+AcCz8Wgbq081qbv3d6P
 EQ3MF20Yt1tdt2zDIrrsu8ZCWBCuXba7slZtMyrJU6J3J6VD8wIcdYAua
 9CCD3Wpz7dN1PmDm4S58qRChDRf8VRwFZIoW6+3DDnmSuftyGUELktNQJ
 f5Vmz+vU6OW0xMveXWGHsPBRyf3OzpuG7qhhAiQAATKHvHDk9OMo0r7gm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7409902"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7409902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 20:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7552663"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 20:38:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 20:38:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 20:38:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 20:38:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TccfblWdwynwLiRq2sgipnUEdZYdpVCaxFVe6vu6TPniiFcE4oyvmOiNnInPS8w206U025X18JTcRk/g6uEJWBDuh9xiiXtPYA7oXIAPZO939CF6N1UhvuNbo95K9wNEOLUAemxipY9L3dzeZG+XR8Jj2fNBAn72IT3Elynj+WU6cac0nurv98RAjGoqrkfVaREuEwfirkLR9gg1p0avGQgZF7soGDlKodhjaogdD2Kpc4BljfRdLXWucCODCwqSELgAQUlYrIxz2E/eUOpRlbbCXc7Unc/u2apxWU51NwhLOdxGzGEXt2mYiuJncm9YqStBSOCawGFCMK+rWvsRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FpxIynYhoBk0hfFj/EAWdQDp31xiWhvObmDQ/0+4e8=;
 b=E6xmWqFphXfHHTdIQp5VV03buH10+NZuGO3JXW/HCXBg/2j+oX9b823mC6/Tumxg0MEkAoIwm0ekMhzzJPBnVAsaJVxhZlmcSkO1ZhqLkCIVgWoWlja8ww312QByHT1Yo+YqhCrTPBXA5mF4B2wJJXO5nHK7ZEmIfA3Diu3kweHrXISr/NuoYpthhP513dz6nEp+XJKvewk05qAuzHMqsXy80iuYXoys4bDcCKkgvS6vwqLQFaE+S/1xyUTQrjBb0tRV0dwTNxWDoM98TpOfOoN03SRwcBT02ixbihEDXeZxRbuABfXftp4TbColGIwxaGLlI6nnzX6MSkC6oOqzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 04:38:03 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::27fc:befb:9a38:279]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::27fc:befb:9a38:279%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 04:38:03 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
Thread-Topic: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
Thread-Index: AQHaalTN16QkVt22rUS1pZjD810VDrEf3R4AgADfu2A=
Date: Thu, 29 Feb 2024 04:38:03 +0000
Message-ID: <IA1PR11MB63486AE9EC5E30EC94FE39F0B25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <87wmqo8vt9.fsf@intel.com>
In-Reply-To: <87wmqo8vt9.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|CY5PR11MB6092:EE_
x-ms-office365-filtering-correlation-id: 5b567df7-57de-4090-39d0-08dc38e03791
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wclPFX0iQdNhYz8U2aLH0gdsDrzX8Waor15/o5B0JhjXCR4VPKex54rVPEiqhLAolgW8Vcm3AoniAvUTEEWxB/dbR2kM5gus+aV3IUOoUTkBjgbqdKuIQSUGsXxn32V9ThO999YyTMN4RI16BlRAWtYgFBWTMdKYXawtdYg8s+t72a3lOBqxH+X4u1wm5SOrxEMhGs5xjm7emg1cmuA5Si2fhBAKihpwwUUKgqPu3eSIG77v7totpxMk4hiBqaLuB7rY5+fNNzoyUdr3gt+nB23GHEVBYy/FQ8xu4grYEEdiegTT6RH62FOONMLA5cs/GPF/0zSzqKTPWPFgp0+e9RMssDy7v0advAOFR4PBqgIpU5O55KfNNya5h28cqiRAnh04BIGMlMODSIiiqbjZZh7wpx7Nyrayh6o5aYxL98xNLM5iVXtK0ZyKxQeyTQraKzEwlSk1OQN631sjz+CFbk9sqDDEIx9qGUQUgBDeTFueYh1DsFKViB2tzNAL8fUImxnNl/dUN/QXayXum938nV/OVzmhZRabeDHnJ93H9V8/zHu9zvAfMi8sQ83Hbi+QEetvq4gpKtilAPZNE9aelTBKMoZZfLqOY1Q0/MCzWn/XrB1qAUE3kPG3PpR1kk0TmBgDwYbXOFKRtrSLz4yyu49gPoMFdZwyy95ePxUSzBgiki422bUI8lYFcv9axx9tIlzIGJEcvIaR3wOHKH/UvjQvM9MLV4A6XMhJvLw5Jwg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FfC691Op+fvqBgC5LsQdbMznvuqkshufXxrJd6D72a5XYvjAf7ChC+0hL7GE?=
 =?us-ascii?Q?GRWdO2F1zTqnY9M4x8yvVzKtWYZMNxem/TtlRvZEeY44PcU8GSXzRiLkic0p?=
 =?us-ascii?Q?b18R4M+mtKWPX6fXL938SAACFF+LAZFuok6VS6k+Yob0BxFGdeZIdN2BQyuS?=
 =?us-ascii?Q?QxM+tjlO8wTJzKGZdq/hsNeIT4MZraCBMwamSSNZxnXKAXZQM4bo7bfc+Yn7?=
 =?us-ascii?Q?PiWegwsTMQXKk/8BuHZBfeCA1PzNSpFNiDy1lBtYNLvhM3e+KIcLT8MJygHi?=
 =?us-ascii?Q?DvBvSDm6b3kZ8fQf00xBeyxeUgcOHfhIUH9tHxT+ElqAS8/D9m41z/S7pUr8?=
 =?us-ascii?Q?AyYpaG2I3xDePKjePdGqzmSv7Aw+ji76b/3NhEFCOHBQQakNkODUKuuh9BQH?=
 =?us-ascii?Q?4WOK9A2dRl8/loivldg2o3UL/2Dz80nID0/Viv0KH3FGzVvJCyWI45brc1pX?=
 =?us-ascii?Q?KcT0JkrKc+dTscGncwZblGO6IrL066XI1Q/e2IiCkF5SXK+PeJfqmjZq3UXL?=
 =?us-ascii?Q?gcAAstt1NQRvcqYnMaDEd9wN0KFLhc+tyy6LsIGuJ6kzz/+IQZVQYFrHnFN9?=
 =?us-ascii?Q?fCo3eq5/S3uyGD0w9UQHr90jIxPy9ezRt4OCSSfFjPIqsh4kSb3xAv2ALevC?=
 =?us-ascii?Q?kc3iuNbhXV3caErWnQq0I0hlGUFyJ+Sm9lBIw07vEWLf9qVdcvQmVJ030boe?=
 =?us-ascii?Q?42pwgENPXIfw8VfAVAHB/i9Bu6R9g53ifukz5z1hpcims0VbzVzHm9OxTB3R?=
 =?us-ascii?Q?GREC0isAis6FLizAu5Pg2plK4Aas4zmCpOsxLM4VbBWtIbr/VKTNemfJ1ztA?=
 =?us-ascii?Q?y7JSVcpd+CTd6j75/lwBbxT+kGyv7d0VhPi+2JMlNwcac1zs9u9iwrbFyFm3?=
 =?us-ascii?Q?kSAHtC30gp3cEOGGebPugVWYtSkHkc+OJeNbDyEZYfCboVS2LI6/6fGw9n69?=
 =?us-ascii?Q?ra7OtPYPOUn6QvHLeDZO7Bc39zM7So4SZ5OGGohNcayxn34ZnBPar5UqxeUI?=
 =?us-ascii?Q?A04mAJXnbr6wyU5kcR9RgNfmXbNaDc1xm0RGh0F6WEhxqyeiD0xbNRYFL9VX?=
 =?us-ascii?Q?AV6UJGMaHA9k0GLWVfoU5iQC5A+bK+hpmywqVCJTpVCGJI76IvozDwoTdKN4?=
 =?us-ascii?Q?cMxbOATGkmsYMiJRrona6g/OMcyFiyxMM9s/Tw8R3y3euUzP7xb1urXSakzE?=
 =?us-ascii?Q?weuj1+1dplxG26fN5C/+irEUyi2as21UK7SixVMEN8+vihmJV3M9677PFFaZ?=
 =?us-ascii?Q?Anb0CLu0qDcPSxRiL4e4g9aNjv2u8d+S+6KMC0BjiWZqj9EmC255YLFRGPpb?=
 =?us-ascii?Q?jCBVowTzfC/u9NQDXxj29+LcFBhskho2pbfehryCjX7VgXXQUmXosznWk7oz?=
 =?us-ascii?Q?lcXEFD7yhn1bMD431Vmtqa0rbhZv1PO4YNXhEFP7F7B6DFylETUlPrj2kDmW?=
 =?us-ascii?Q?ynnSjbMr//qs+dbgXdI7A9YQBrWRTXG5wVJ9Ph1gNN5MD12+k4BVP8898fek?=
 =?us-ascii?Q?tjGGzWjv4FRaSPCr90CDfWofOZ9l2AGpC/J/MhEml0TqEg0n9VJYyhEcvETo?=
 =?us-ascii?Q?KbLxzWHIkV9uzDe9EbjpYL9RGxcrHRLvxeqrwwPN4PcJXYpY7RINxAuqImoM?=
 =?us-ascii?Q?oCnJguXqInEtj0PoAMT16GDoKVvU6TqK0h1Q22w/Z3tHSIi1tf5APJRlaJWF?=
 =?us-ascii?Q?47E9+vJbD25WzozGdqFLzqiNE5s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b567df7-57de-4090-39d0-08dc38e03791
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 04:38:03.5485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BbLax5THfj06ep8153c2Fpc56IhRCAeFhXXJhdlWZUwDlDJpSIzCA+lnwwtj6M5eL+Rcvf8SbzJCoFiroqGAz9CjqzhUW8Bi/Kzn+S7VtJZPab1d+93MTsuhOG/yG0fX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

> Subject: Re: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
>=20
> On Wed, 28 Feb 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> wrote:
> > -v12:
> > - Update cover letter
>=20
> Did you just send the entire series again within 30 minutes just to updat=
e the
> cover letter? You could've just replied to the cover letter...

Sorry, I should have used git send-email --in-reply-to, will take care from=
 next time onwards.

Regards,
Mitul
