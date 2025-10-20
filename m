Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3509ABEF721
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 08:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7659410E25C;
	Mon, 20 Oct 2025 06:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMJFHuUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9467E10E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760941086; x=1792477086;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lC8PdK3Uq4gW1sZwOBbB91Mf+VdnCXTe3RRgGzxvCpc=;
 b=TMJFHuULaJEdlYH7hYa6iByX27AnFWlAvFZdCf3XHOUrwPTuVQca6t1Q
 ZWnyGkaCoTV+DFpN7E/bmZRKurOk+q2Crya29WcvKRJNI79AL4qY3+qdA
 Ehg1j26v7Dmfre2nD24kXqEINc+WaP4VGznHERyNO8u60DdnvcTTq0VaZ
 muB+xUMTIPLuAbUUj7fWssGTwJ2w18EPpI7sqC0PK++QKva9eZXRGaK7N
 i9mtMxVhRZDVljjHhp9dqUAxWyETVLYrHUPnCdScBTyDTvj/VaVCS7YjG
 W0gKxsShcJsfIIHS9joAfVZWihFEdy9Bx0b1Prvazbu9L88x/cAFliC8E A==;
X-CSE-ConnectionGUID: A3eO7uKlSKu2d5sURGhZGA==
X-CSE-MsgGUID: EuoH4i1+SQWdSg6GL6QHuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="74174502"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74174502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:18:06 -0700
X-CSE-ConnectionGUID: MrXjZnNWR76MOFGcxGFqPA==
X-CSE-MsgGUID: uewI0+4BTg2zQ1xnbRCqDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187516290"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:18:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 23:18:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 19 Oct 2025 23:18:05 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 23:18:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKHCFrK8L1rAiyFFGMcWfI/Nm+2ZVrUrIuPYO9Vx7LBj3U62jRtZoEfu7E6fHuYhUBajChnUx4f0+vT03pPAD/aGr+HTnZWMds+K8vwdtOl6nRubwbNKgxzcYsxA3CdeOeoa65fAaGhzY+hixgdyGTFdt2rptVY63uzeBg4L5Z1y5lWX86/4IqDJZsKRDCwObQzs0wvj+l/bjOr9yH8XGNyVAovfOrW7gg5uvCF354hwqYiqvTweEt/FplDgB5V/yZ1nj8247pUJBeKetkETcc0Bcl7mqe+HyHVZfMGOg6QGkUeNHuNQEF9bL193lB5nDUjUO2cHxpRscmITcIQLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l287kjCs17N7fwmqB4mdcyK4okW7/KIz8zLnI7dUiY=;
 b=tmYJtkGHzOORaEnEODlXsBPBApNJnl5artMWD2RVT/4WorZKbPFGLUIDQjAHigYfYtXHauTkkzE4BajzthZ/7QcyLHTcoSFjQBjaEz4JaoaDkX4ntFcIZ8wbZtHbwyKNjEwcZoo35KAb3gpIrGpC5khImVoZjd1z9ssEkuMA7gnNvDksq3qO0W1oN0sqG1AoQ9WBWVKsSDlXtQpQP5QSaAt2v8oEt3eGeiNCti0e5nEJNwKRQ7/jhTHKqN3oEDAuFpzlTNG+Hby4UEmIfJt/uN9fx86sO/0xpEpDl/pXxuMo7BlgPtVI1ebEpo1KyzFM/mx2ei8mAO5rtTRnfzyytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 06:18:02 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 06:18:02 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
Thread-Topic: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
 host resource
Thread-Index: AQHcPqyOICgcQp9euUCaQTY4FsET/rTFt30wgAA9H4CAAGplgIAASUMQ
Date: Mon, 20 Oct 2025 06:18:02 +0000
Message-ID: <IA0PR11MB71858448A4E804AFCC9EB6E4F8F5A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
In-Reply-To: <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8566:EE_
x-ms-office365-filtering-correlation-id: ba7b4908-7b07-48a9-b5c3-08de0fa06c6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ikbv1fMVONQruKMLqGHslf11i3bN5M26H2Gx6+IMvOWJKo1UYFFu7ZRWNg?=
 =?iso-8859-1?Q?6BvRP8kn6nMv1dWDDzEUXw9ZCPYlFPI1Yau2d+0keaA8spwoRovd1n1OhZ?=
 =?iso-8859-1?Q?hPA4I6dP0iLFuuAUxOm6iJGkFLLJxxLgmDA3TxA4rnbmgrEIly/kTAZ/vP?=
 =?iso-8859-1?Q?LNRh9740+g6RxKKKYMbuilEPGXB8A2qpfM2NHSnKbZr92NdcJDz9JuCyB+?=
 =?iso-8859-1?Q?5CI2PItOFLr49mtfpGGz/d1zSraTcnua14DDcBaT96lmME7T0ZhB0owlxL?=
 =?iso-8859-1?Q?hJtrP4iIqvCssMnQUc9fb1l7zDJTDb15ipPcnXagYmcmqr0I8EZAp+DFbj?=
 =?iso-8859-1?Q?plngQGeCQBQpn4ThX2jFknAbAx6sjYoS6v95zAhLM72eT4jISAo5g3PsYJ?=
 =?iso-8859-1?Q?xbUVrBes6ImErP1Y1JZx3eCgCHDvCJhJtJ6PkGsZPT7Ot0SHV+l/vL+L0u?=
 =?iso-8859-1?Q?dhFgJNgC/3CdaM0BErm7LZpAfHT0I0poSEzAifW2sgy1y625Ay8vxVsT5n?=
 =?iso-8859-1?Q?dEGBlNuy7jh9Pou+3jGasxWirKiz0VSBV87RPSiPvFSKGQeSStxGW0In9X?=
 =?iso-8859-1?Q?NXv/bRjiJ2DtRRrODEF93MJI3LIv8f2Eo/7r/dQQ04Tc+TOWThvQ1ESolj?=
 =?iso-8859-1?Q?OlTFDKZDjaBzszzfYdNBbtM+lSI7r74E4BRD4AdZHsdK98mJ5cg6CkFtGT?=
 =?iso-8859-1?Q?azpEJmKwxzsmNuChFnPepfyaiWmBNEl0gce3BIOZcuD8f5qLdfzB+Vpoep?=
 =?iso-8859-1?Q?BbztJBszwy73xy9chAw3Qdyk+JEg84psIoT4/JziSCcgKkSsG0vo0NaEB3?=
 =?iso-8859-1?Q?oE8/oMHy+IqKmco6W/WdeohPJINN7We7tnzvypvgN+c4JOrtXkCJvnNlv3?=
 =?iso-8859-1?Q?DRMnNQwXmVWyE7ux5WWakR695g3tbcJUNyQEX34LXL1lXvMsX8biwSN+9T?=
 =?iso-8859-1?Q?8VCFyZeaSkfPic29XACRTp8LF0uqUzn4nm7UqU78OkYdGd6ceh/rQ9slxN?=
 =?iso-8859-1?Q?kGEthsAXrn1LU17zpH0KJlnfdr59c2GcIzll7HRxgkW6JD8ptjDQyzuvwA?=
 =?iso-8859-1?Q?jwfpWO2prqhAkeaznjOXYGfIZINiSLcA1Es8ftoMAIanoI7vhtY76Fg1ef?=
 =?iso-8859-1?Q?SSDlFSYNgDEQ+tvlWWJlWcuxvJFKfbRqClpbVqqDPWU+NJS6T06ScubTyv?=
 =?iso-8859-1?Q?qioG7uGOjmr++A5jBTM/iQzhPYmtcRFU6acrrALk4q3JOvilBmLCaD+GTM?=
 =?iso-8859-1?Q?NhQENmxsMiZUZEO4StbZvfRhLZ36lFSCKJ+L6m+wW8975wfAeZj9RH7faQ?=
 =?iso-8859-1?Q?oohS9tuoHgtDHRZ9ZTW1YMc6bgrndUeMJ3INTnx0Vx7zgQhMetfj1WlZ0Z?=
 =?iso-8859-1?Q?UOm2dL/CmNAyhp9+2GPLqHIdfGPscxTQm23Ov3f+EYImFiZPpH4fz+doJa?=
 =?iso-8859-1?Q?FsOlLmTVJD0yutPGDPPNs53jOxwzsuerVQAlvbkNzV3AUZ5qZENlvYwt3h?=
 =?iso-8859-1?Q?ZYE6IIGABfxIyRVmvXv/3k6VQ7IdpbCSsLJ/5OhPYy02YFQdhiJz7hlm8V?=
 =?iso-8859-1?Q?lY4JY9yUTe8Wdr5RDPxulgS/XzWt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dLzSw2HKYb1qdhF8SCtd6EElEjwJ7l1VYDSaGE9FMQ5S6h380KQhWl6iG1?=
 =?iso-8859-1?Q?/Uk6bv05GN8fK2qthsIpFyCVAEBieTd0PzTh8blGythhoWu/HRTtjmyAHo?=
 =?iso-8859-1?Q?PQ0yvTcz5n4mSHjWzQAs4dHkpeoSNLLuz+H0s4crFTI4Msn5E0WsdyVbLH?=
 =?iso-8859-1?Q?o2yNzAvncoD6U1czs/kTZ6TVlv8Ru/ivVoRM6gmgUyF/9FEulz2IWSgG0R?=
 =?iso-8859-1?Q?znnqW8A5lrqFCfe4d+XpGyTTU/Nlmfy/4/Vju+/cc3jhFyjbUbL+TorzkJ?=
 =?iso-8859-1?Q?9wXj5wQKTt5QP31jY9q8Ezdtaszf2lfxTyxhDYB1xr1M8VPYA+VuQp+Est?=
 =?iso-8859-1?Q?UXUGHsqneW5SrCWOF7w1/yiuiyhyS+SuhAYfgL4b1vKnHGPRfhFo7m6hCS?=
 =?iso-8859-1?Q?G10/XoEtGq/KcmRBKfgyNC1k7i8OS5qr8xr73Uxj+SZJJm01JQoqGA2IM+?=
 =?iso-8859-1?Q?EM7RiSNyHWc90bY9zPBRks9I0fUT9N4ys95VwGIYKgSP9mzO80FNiGr5ID?=
 =?iso-8859-1?Q?e1PzXKXj7fytt0CmjKZwW2Q21sm1fdbQ9e2XjAqTCcIuol2W26nsXdfHVF?=
 =?iso-8859-1?Q?gdFVOOUbiMKGt9+iffX32hM8/Uh8yy2boGKprin0cOo4YjmvnY2GVNN0TI?=
 =?iso-8859-1?Q?gDlCjka4nNVtZZn6VKVL8HYfCuMHtcr80jj+tTLWvX3JP10wFx5qdDOIsV?=
 =?iso-8859-1?Q?nzFGEh0qRG6LMjk+s/mf8qWf5Vb1ER2Cjnylfz3IQohx1ZZiPQKKjDwOWt?=
 =?iso-8859-1?Q?Zc28cMRIIaZPs0WKieRsw9wk0jWdG8HSFtlEBNedIRNAJOuU6tF3lO8hgm?=
 =?iso-8859-1?Q?1zXCgEnc4lDbsDQ/1tkIr0f8nxa+qfNwVflSdiN3BsZBZvNxM2k56ppVUk?=
 =?iso-8859-1?Q?7/6BBrjDg5Kt+SCnwj8P6hNlIwgzDNRtsuGK/iftIf1BIT6Cq7dGD4hNHr?=
 =?iso-8859-1?Q?ngO3ykiDjJvvqeoXC2loJkye0siCqEZ9ivQk/yL3LwibQDQVdyg3p8jUM8?=
 =?iso-8859-1?Q?sQZ7/gpUM82SIJjBFlohYd55LMfwRp4oxvAY10zcCXVj+5cpnvVtHlWeGy?=
 =?iso-8859-1?Q?HoyE3KtFViqBfP9qXlp7siNvCDwErZcnoltRJy8428CA1ZGAMUy3aCbme+?=
 =?iso-8859-1?Q?h5HdvWbUYRcwKcJlX4JeCWw/IjcUybeOOYMuzQri/tnHAWlxv9FbwpYT/o?=
 =?iso-8859-1?Q?YTgiOmiZbBAwCmrjEyybHQc73DsB8+taClWgw7wNlX44UAwZYud5cuEs5O?=
 =?iso-8859-1?Q?no63sC78PWQUJuOEqCaWiuuwgdfhlQuQGKeI1lKZLhMPuYuj+rLIY2sf1Z?=
 =?iso-8859-1?Q?o5yk5RWZkJRo99bW5pNf82sKDCW/cOBlx/W202u1KIMIFVLDyDtClN3zm/?=
 =?iso-8859-1?Q?E+/vtF1LEagGMJQ9F/QX0YSxjrjYqZkJJTs0XpKuligtRxBnDvtME0/85i?=
 =?iso-8859-1?Q?LTLIqtihBHeMqy4jxOUimwDkts7zM90j4z3UiC+YBz+FkKpRtRR83uNqKe?=
 =?iso-8859-1?Q?0uiryGkw6TtcDP4+S6DH6rFnx2KMyZt3cyjEThXdeG5GMvWaoAX9jW9UMZ?=
 =?iso-8859-1?Q?Rxbqi4JI1VISyof3pQIVVYxEHmdfuJH6x7GAc1yBdPGeb0O+5JspYVpLzb?=
 =?iso-8859-1?Q?67LLRHVKPaMSJEAbOIPNLBzKdkvPfFMgWj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7b4908-7b07-48a9-b5c3-08de0fa06c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 06:18:02.1329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPdDhkPePMpFiaU5s4wAc4JSXcCEm4LbcIRAk9Yt0n5zn9PDM59Mm6ulJAS1pNvCXbx4DmJlqwf1mhtsI0MgQ1udQTlR1xW7l5QPOlQci1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
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

> ...
> > There's little difference between the current event handling and the on=
e
> > where no vblanks have been set up. I suspect that the vblank timer
> > callback interferes with the locking in atomic_flush. That would also
> > explain why the fps drop at no clear pattern.
> >
> > Could you please test the attached patch? It enables/disables the vblan=
k
> > timer depending on the buffer resources; as you suggested before.=A0 Do=
es
> > this make a difference?
>=20
> The attached patch doesn't work, please see the trace below.
>=20
> @Vivek Please clarify whether you only see frames drop with your
> multi-gpu guest-blob setup or with a usual virgl too. I haven't noticed
Sorry, I should have mentioned this detail about setup. I only (tested and)
see this frame drop in multi-gpu guest-blob scenarios.

Thanks,
Vivek

> problem with frames pacing for virgl and nctx modes yesterday, will
> check again.
>=20
> [   11.456513] ------------[ cut here ]------------
> [   11.460050] driver forgot to call drm_crtc_vblank_off()
> [   11.461253] WARNING: CPU: 12 PID: 445 at
> drivers/gpu/drm/drm_atomic_helper.c:1279
> drm_atomic_helper_commit_modeset_disables+0x6c6/0x6d0
> [   11.461824] Modules linked in:
> [   11.461989] CPU: 12 UID: 0 PID: 445 Comm: Xorg Not tainted
> 6.17.0-rc6-01184-ga95b3b198869 #174 PREEMPT(voluntary)
> [   11.462638] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
> [   11.463214] RIP:
> 0010:drm_atomic_helper_commit_modeset_disables+0x6c6/0x6d0
> [   11.463574] Code: 32 53 02 01 e8 4b d1 33 ff 0f 0b 48 8b 43 08 e9 ae
> fb ff ff 48 c7 c7 30 9f c7 83 89 45 c8 c6 05 e8 31 53 02 01 e8 2a d1 33
> ff <0f> 0b 8b 45 c8 eb 9c 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90
> [   11.464613] RSP: 0018:ffffc90001007960 EFLAGS: 00010286
> [   11.464906] RAX: 0000000000000000 RBX: ffff88810b24ff80 RCX:
> 0000000000000000
> [   11.465301] RDX: 0000000000000002 RSI: 0000000000000001 RDI:
> 00000000ffffffff
> [   11.465706] RBP: ffffc900010079a8 R08: 0000000000000000 R09:
> ffffc90001007790
> [   11.466104] R10: 0000000000000001 R11: 6620726576697264 R12:
> 0000000000000000
> [   11.466495] R13: ffff888103920040 R14: 0000000000000000 R15:
> 0000000000000000
> [   11.467043] FS:  00007f8d2868dec0(0000) GS:ffff8888d66f7000(0000)
> knlGS:0000000000000000
> [   11.467415] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   11.467688] CR2: 00007f8d285b1000 CR3: 000000010109a000 CR4:
> 0000000000750ef0
> [   11.468023] PKRU: 55555554
> [   11.468165] Call Trace:
> [   11.468286]  <TASK>
> [   11.468405]  drm_atomic_helper_commit_tail+0x1e/0x70
> [   11.468635]  commit_tail+0x112/0x180
> [   11.468798]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.469027]  drm_atomic_helper_commit+0x126/0x150
> [   11.469244]  drm_atomic_commit+0xaa/0xe0
> [   11.469432]  ? __pfx___drm_printfn_info+0x10/0x10
> [   11.469651]  drm_atomic_helper_dirtyfb+0x1eb/0x2f0
> [   11.469873]  drm_mode_dirtyfb_ioctl+0xfd/0x1c0
> [   11.470078]  ? __pfx_drm_mode_dirtyfb_ioctl+0x10/0x10
> [   11.470318]  drm_ioctl_kernel+0xa3/0x100
> [   11.470497]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.470719]  drm_ioctl+0x2be/0x570
> [   11.470877]  ? __pfx_drm_mode_dirtyfb_ioctl+0x10/0x10
> [   11.471105]  ? do_syscall_64+0x1e7/0x1f0
> [   11.471302]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.471529]  ? __mark_inode_dirty+0xc5/0x340
> [   11.471735]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.471968]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.472199]  __x64_sys_ioctl+0x9a/0xf0
> [   11.472377]  x64_sys_call+0x1009/0x1d80
> [   11.472565]  do_syscall_64+0x6e/0x1f0
> [   11.472731]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.472946]  ? __handle_mm_fault+0x92d/0xfa0
> [   11.473157]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.473381]  ? debug_smp_processor_id+0x17/0x20
> [   11.473596]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.473813]  ? count_memcg_events+0x93/0x230
> [   11.474014]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.474242]  ? debug_smp_processor_id+0x17/0x20
> [   11.474446]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.474669]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.474885]  ? irqentry_exit_to_user_mode+0x18c/0x190
> [   11.475111]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.475338]  ? irqentry_exit+0x3b/0x50
> [   11.475515]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   11.475730]  ? exc_page_fault+0x86/0x180
> [   11.475918]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   11.476130] RIP: 0033:0x7f8d2891674d
>=20
>=20
> --
> Best regards,
> Dmitry
