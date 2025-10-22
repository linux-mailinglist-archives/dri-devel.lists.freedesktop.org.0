Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC24BFA045
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 07:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA8510E137;
	Wed, 22 Oct 2025 05:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCBCHGz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3165310E137
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761109342; x=1792645342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hj58PdovBn8ZfcBPSIxblqgq98UWW1PWxOy1xEfkrLs=;
 b=JCBCHGz51vzUnTbqn4TdQRD6uqaqQEITeTP0NjAr8E9lilTMzxMPfF9N
 WkP8qzJC1d5Mm/p452gJSUkbzrMrM0UEGfcP8wt0cB1DXwNDFa+HSGZg3
 idJ1x2WhF106pQCBJD1WPhnlGym0LsU+BXN1IaQjBdxOocuUL6VeKfJbQ
 yZOJu0e7Ksmiw4iyd9gxruVpoc45ozZ9GAXwHqWViZOpAM3O67KsV72YT
 nLrIPisnHHbulkCI1eaXB6+RE38OaLbb33FJ3JacLvIk01rYYuZyrEAdt
 8xcMCQwpjpABgf7zUYhty8g5rG4U8mRPNSOgSF/PRJprxSQhOgV2/QZT8 A==;
X-CSE-ConnectionGUID: EUUILiYSRXOg0NwkA01EcA==
X-CSE-MsgGUID: nDaIdUOYSMOEFbDMSELVaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62949716"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62949716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:02:21 -0700
X-CSE-ConnectionGUID: d7aql4OqSYy2Nmy1loLXbA==
X-CSE-MsgGUID: kCCK+vJcR+ySlsTGudPaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220956770"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:02:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 22:02:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 22:02:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 22:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDVp1bz3eQk85mtiOiIrrh7K7u1ZwCkY++f7EeSBPJRmJaws3uq5yL9KYENBINJ0eWywLEwSZy7Pe+Ja7EqtsfgbOufJ48oTaNXPmmbSEk70DIKkL5jvcMrlaikCtQcFJxwyFAgIsR36ETzp2ot7X2DcOWKCt0qQ9gZ6uq820ucdHOytg+AGpK0YDktDWgLfoiZYj/t9vQQ3OfMGEHwZUTBFiPRg3sAYAhCjn1D8Cc0lH4jU1FZPcWjpripw6tLkda6lWgwyV6fLDFvnE/MDMqf70GEdWIBuf3snNj1pQ4OZbrHwdIncQhSaRxDx1NL6d5oK/7vM14yjGG44C98Zig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROjGBo1/VXsYdkNx0Qm9FB+Z/GH5cB2RDwKqLapf/nM=;
 b=kIMAY/gH6JI7DVsptOiCDwomEGnwcHVvOfkufZFtpyk3ZHBkfNsJiz7TiB8bPlVfHsQFxzsv3e/qgLKFJTNzZtQuTMcTUKXSG+qg1M7/5qGH9COSKUEdzdziXAa3zEbgx5+H5iTW8ApfDhfuSeHa7mjE8ajIwxnoSolPoPHypJ3yJ31w9I0UDmJQ6pggcBCesnN7tCmhVyw8UxQm+wOtS3sn+LVxSZUhU0+c2fQ7UlLWuEwAAUB5TqXLGJ3o/4zlhyjG9bepzeZuTz8D1uaDq/0fctLMGatDgiJmEYBQlf2cGwcWh4DHl4rRwfI9OnKo2FbSIBWzhILPruYQ6pIjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB8465.namprd11.prod.outlook.com (2603:10b6:610:1bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 05:02:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 05:02:19 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
Thread-Topic: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
 host resource
Thread-Index: AQHcPqyOICgcQp9euUCaQTY4FsET/rTFt30wgAA9H4CAAGplgIADWiaAgAJ0egCAAPDVkA==
Date: Wed, 22 Oct 2025 05:02:18 +0000
Message-ID: <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
In-Reply-To: <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB8465:EE_
x-ms-office365-filtering-correlation-id: 154e3306-204d-4295-d88c-08de11282d4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?86CkhSTRl0emYQ3mKILqjYioz8UFs44f8qUdCVABasBqAC2IseO5YrVoY8?=
 =?iso-8859-1?Q?u4BBEJc07e42MlVPKdQBb0XqpqplI1fU+DRAeEAMjWdCG4xBwy1LJ2OCfK?=
 =?iso-8859-1?Q?dBkme/zQjqe8teewWT7wLJEfvoJLAkDlw4kbbkrfuabOTLvYKWyfnaXQI/?=
 =?iso-8859-1?Q?//ZEEgNfNPGL/g8BoWKEiVW2AzeSBrBHEz3PV39tUrpYnoMpa8UJ1mq5E9?=
 =?iso-8859-1?Q?bzB6/Hm4IiSiJbA3W0EwOyVKTCrG50N9o/3vVZ4rXiCnMI9XfIbgXD2YRb?=
 =?iso-8859-1?Q?GfHPEK4dAERCacDCtoxIZdV/zSS9PjHf+Q7PSiT4E2u8julJasY5W7IPZ3?=
 =?iso-8859-1?Q?Vn0qZu0HQkml0CZEOXzDFMUcoZRMjK73hqHvl/7vRzrGF6a4DgVOKaixAF?=
 =?iso-8859-1?Q?O/pwHmgIwjATveqGQ7EFKz9bqlyLH3J2UCGxqBy5MXEo7WVqJXZhfFq1+q?=
 =?iso-8859-1?Q?KzVhppsl8hhzuDOEJAoxVKnueO5bPV80wm0JYd1BhFw13QOcpJF/LBEfp/?=
 =?iso-8859-1?Q?xJxGJFmCRjrDOUzoknIJzS4yWGL0siK2K8D3jGq2/LjdC2ZLbLUCSeWcLj?=
 =?iso-8859-1?Q?7Y940lpyCaF3snjpvsSxzL5MGAWQWbsY43AjnEnfQmSFkgU8sqQyeWoPBL?=
 =?iso-8859-1?Q?fII9Q/JA2ryKF3A3cBbWfffjygq0QJ+dkPr27mJu9bzsccSyc5090s77wj?=
 =?iso-8859-1?Q?hI3OiFCk0qDtyAiPBwpbZHWAtvIqAmiXzyrE1YEJd2gzIbNuCg4SRayx/Y?=
 =?iso-8859-1?Q?7qSDbNsNA8VoqFqljnSCCe3SothdMcfSTVgOOr85S7GQZgKXKj6VwHDPTQ?=
 =?iso-8859-1?Q?TZPWKyqCBv+bUOHQvfmJOgMxIe4G847lwcp7sK4BOmeR3/ohopEe7/PXru?=
 =?iso-8859-1?Q?EsVBL6wbMdcIjiRXOIC07Rihhuc+e8k83sRbugDQmG7DcggFktkgZW/ISS?=
 =?iso-8859-1?Q?zQUed2JEIfqPRwERESVnDdVl49e0+mgLmM/7RRLaQ+PzL1vbOZCeA83rp2?=
 =?iso-8859-1?Q?fs7lAKj27PlY1mBfxlYq0W/+rEFMRN1Ygcy+WSFwsexU168EOSU/CDzmbB?=
 =?iso-8859-1?Q?LS5ZwKZU3nUyj7qv/TZsG7KtJ36rJifpLopqlbJTJEJb6uS5Jy2jM8E7Yk?=
 =?iso-8859-1?Q?w3NgmwczXZ6tBXbWwdudsKHW7JchHB+24kw+9qcwGpF5rgISuYBDp+uey4?=
 =?iso-8859-1?Q?JuJwmeANo/tB0zu6dcDpodyNdGG47aBig++VJv7xHI5e0aXDyv4zz6ZP5T?=
 =?iso-8859-1?Q?FvNpFqV3TlBe+R2woDn2a7W6jC1pnDqvU5GR0uaCs4/JUcwX3qSGh9t1wL?=
 =?iso-8859-1?Q?eems9IOYttPCXP3v5DxinGFTJ+rFQFUT4JGb6655dxWkXMq0FYGUYBMOTe?=
 =?iso-8859-1?Q?opNsmrveB21MvnvstBYCl+g1XYcOKGqN2WrtEGn0xpy8ZNwUnTzzKEPOQM?=
 =?iso-8859-1?Q?TwY523RRwfVcuLn00aH91p1+R9Sj5nlEWBGCSWNScKq/YiKFCoIz0UsDED?=
 =?iso-8859-1?Q?jO08WDvscHDtE8MOQxDr0c7QdtEccr571tMLQDO7kYY5boi2+q4bgvLBmw?=
 =?iso-8859-1?Q?vD0g+1rmoSfqFAAo+wI2wGEbB584?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P1rO3NDzlT2esC+wN3JbhPJQnELWsklK96spERWJax2LMfQvqD+1bz2RjJ?=
 =?iso-8859-1?Q?g7GzFsAbvEZF6nMEj1e9zA83xm5IYkVDnjeFcOiDmhYryDXF7NN3+zjj5F?=
 =?iso-8859-1?Q?x+aXEG2bn92qbGVsxYtzTtaqfpWRf5/hDYmdmLZQ4D7pveYC/kPFF4vlwx?=
 =?iso-8859-1?Q?n6mj4wWdfiWo5h55PwrH1wwLWVYk1aEPrww9iidPOqgmjHI4srhZ/bZcI/?=
 =?iso-8859-1?Q?y5iSt+b1hAt2QV4goeimwBzcXMdcYv1vvxLH0f1+On+VKezr0lP+jCsgnw?=
 =?iso-8859-1?Q?lIXTjc5+N7XDst1nlHI4QAopPpJaJlug8KpUGmlqIsjz7RSYPWKSrfUVui?=
 =?iso-8859-1?Q?xPb0d7P+T82cGLsIneGny5+SNd2y06B6Ia6xLaKaK54q0aipeXLGG8bHsX?=
 =?iso-8859-1?Q?gKbf1JIXEyvioqOeepU9dFpPejxL1hHHJWDvTQcUn5KzAMIhsEmSn0zi9n?=
 =?iso-8859-1?Q?7WTtNk++a9M4fYuFWWmw7/nk4E8owb+EaS+StCuHcf29lYgwO3hVOdRAtX?=
 =?iso-8859-1?Q?dqkAGAuX/2WJkG/YGGmxPCuK75IHvAC96BhDsvP5IJWna5xuuXDlEYaDm9?=
 =?iso-8859-1?Q?ElC3RiUe2b5Hb8OkbEuNzuO5qShbIQ499e5BH8PLfrsxYAXXtxA7sy0hVL?=
 =?iso-8859-1?Q?3UqXdd3ivBzYV24Hh/hlj1MbYbr96vEI2c5bZ9pkRUGm0ZLvgRy8MS8TQ8?=
 =?iso-8859-1?Q?NU+yIDQT8qjfIlL/mv114gWRkx5PAlG+3pA5/T7Z/28y1h75m5tArQ1y6Z?=
 =?iso-8859-1?Q?2k5WMuU/S5GD9rKXrdfx8bHyFdOYUuJdIxNO++z2gu4/91BLpWXpTOBmSP?=
 =?iso-8859-1?Q?ufSO3fQLXsRohGLjQEDVIMOQxV3eWVB/ts4lfeMBcc5YsjkEG8IBuaCnDq?=
 =?iso-8859-1?Q?mCc0KQ8QR5aLtv1E0fuaM4ZErrvjUuMKw9WUZDUXTMSxiNa5+8Yka7Hyzz?=
 =?iso-8859-1?Q?sYLfL0yxKQJ9FETIErvNwuYiNwvxKaSsKdk1PbEOVU1xP0VfCRptew/QWv?=
 =?iso-8859-1?Q?39zx5Wdi86NKH5CqY9DE6C30cNNdFslRtSw/x8eZZ1dcK/p/a8gEwd3aIr?=
 =?iso-8859-1?Q?Jp9svXvaL5ul2W+z2lqo1LwTKF3P14Wc/V1lO5aieTfEkBd+IRRPTQGWsC?=
 =?iso-8859-1?Q?E5vrXDeVzdqiXFyCO+E18J26JElzWTY+dmF4SEublwVCutxCPS6Xq8AvnB?=
 =?iso-8859-1?Q?YnsatSEwpJjPBWQYXuJifNR+NIttxanf2yfE6d9ZtmMXGXBJKoIUVUn8Gj?=
 =?iso-8859-1?Q?AQe1IwNlBN/YF+9G/iJ795CCI9hDRkbGbqM1rwNi0G3qG1m69aIJEMlpaN?=
 =?iso-8859-1?Q?ZKGeOWjwTYmRrMzdMWBoG9nGfa2esPQpKJ0zmGDX3Wp2GIv7id4wrmrZ0w?=
 =?iso-8859-1?Q?kWm/J4k2xnLZDnqSZyLQpqKdcdMrq0wYBJ4DV1F9ArKVUQ0JsPqWqTLgcC?=
 =?iso-8859-1?Q?i3387QlnzICJ8vucfO7mhbrv+H5/TN3gbEiI2pead+Mp6Dus9phb9fWA+L?=
 =?iso-8859-1?Q?PPqmZJWEhHkRxVswj7k5lRwoMArbKZrHPmsiqEfeGEv4MD8FfxhNS5Z1i3?=
 =?iso-8859-1?Q?+5mva80UKjPl6CkoY6V+hTtuhVm9prEUi1eTCZ0dycuO/fT/zipuemUnbw?=
 =?iso-8859-1?Q?3Z9IxtNyHBcAynJ8I0c/jC/+p9C2o5plRB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154e3306-204d-4295-d88c-08de11282d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 05:02:18.9373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTPF3ni2l+JVa7CHUOw5KRMBsQdB7CT8/rIOzHOHy53ve0AuOkcJHkPjYtF+eTAcH28GdzDXjuy4zCkr7EpYZUsUPbdV0V/r0BXSFVoAzuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8465
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

> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on
> the host resource
>=20
> >>
> >> On 10/17/25 10:38, Thomas Zimmermann wrote:
> >> ...
> >>> There's little difference between the current event handling and the
> one
> >>> where no vblanks have been set up. I suspect that the vblank timer
> >>> callback interferes with the locking in atomic_flush. That would also
> >>> explain why the fps drop at no clear pattern.
> >>>
> >>> Could you please test the attached patch? It enables/disables the
> vblank
> >>> timer depending on the buffer resources; as you suggested
> before.=A0 Does
> >>> this make a difference?
> >> The attached patch doesn't work, please see the trace below.
> >>
> >> @Vivek Please clarify whether you only see frames drop with your
> >> multi-gpu guest-blob setup or with a usual virgl too. I haven't notice=
d
> >> problem with frames pacing for virgl and nctx modes yesterday, will
> >> check again.
> > On a second look, I now see that this RFC (not the attached) patch
> > doesn't work properly with host blobs.
> >
> > I'm getting 100-150fps with this patch applied instead of expected
> > 60fps. Without this RFC patch I'm getting constant 60fps with native
> > context displaying host blobs.
> >
> > Not sure why guest blob would behave differently from the host blob.
> > Suspect something if off with the prime sharing that Vivek uses in the
> > vfio testing setup. I'd suggest to disable vblank timer only for guest
> > blobs if no quick solution will be found.
>=20
> After reading your reply and Vivek's new results, I'm confused now. Does
> it work or is there another patch needed?
Considering my use-case and Dmitry's virgl/venus/native context use-cases
and the benefits offered by vblank timer in these different scenarios, I th=
ink
the following patch should be sufficient for now:

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/vir=
tio/virtgpu_display.c
index e972d9b015a9..c1a8f88f0a20 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -102,7 +102,11 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_c=
rtc *crtc)
 static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
                                          struct drm_atomic_state *state)
 {
-       drm_crtc_vblank_on(crtc);
+       struct drm_device *dev =3D crtc->dev;
+       struct virtio_gpu_device *vgdev =3D dev->dev_private;
+
+       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
+               drm_crtc_vblank_on(crtc);
 }
=20
 static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -112,7 +116,8 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_c=
rtc *crtc,
        struct virtio_gpu_device *vgdev =3D dev->dev_private;
        struct virtio_gpu_output *output =3D drm_crtc_to_virtio_gpu_output(=
crtc);
=20
-       drm_crtc_vblank_off(crtc);
+       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
+               drm_crtc_vblank_off(crtc);

Thanks,
Vivek

>=20
> Best regards
> Thomas
>=20
> >
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>=20

