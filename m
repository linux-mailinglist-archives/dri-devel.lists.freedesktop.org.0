Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIXmEU9GfGn8LgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 06:49:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5EB774D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 06:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBA810E8FF;
	Fri, 30 Jan 2026 05:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1RQcqrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9617710E908;
 Fri, 30 Jan 2026 05:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769752138; x=1801288138;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ImzvMpnjonZOdY5yrSQHRMdeiGkBlMj5h52PfDWL8Ns=;
 b=h1RQcqrbYMtOI8p9D/RXq0IJ/yvxigfm+M2izH2jJ2AF4Oe2NQbib2Jo
 NZtH8PEhf5mZ49B1I+VTRZrk8Sp0GCW0Smuc1YEeSgS5dh6avViskrex3
 6wG4VuaVYo/3N6RyZIz1qw0ZDMx354sde1X9TauW2XaNr+JvqWsCpxokP
 S7M0azN0pQMcn1sVsfTv2zUqZMA9GaJw22v2NTmtgNoGZZ5jEWPTd4So1
 9U9Lg9EdER8q9vZY7+QNW13qfH0EFubFbsNThXcmHLW3XMnnhpUZpl5F/
 se1Snx+Vx9V2vWhQ9u1HHclz8re1M9J1LV/TRKorGEfNpvVpLOWOX7oCA w==;
X-CSE-ConnectionGUID: jAe81xY0RSSR6gWctKpDQQ==
X-CSE-MsgGUID: yzuMcxqLTPG4ougoCMninw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74852872"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74852872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 21:48:57 -0800
X-CSE-ConnectionGUID: vHsPPYoxSVKhKrcuQyz2mA==
X-CSE-MsgGUID: g9ZAspXQSBikj62uqDP5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="231691990"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 21:48:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 21:48:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 21:48:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 21:48:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cId++yjYiV5WPzwRZoXRf9PYwK5Xqpu9JGS6zBDhAlk3+/BpwbTL3lRtYH7qTQrYM5iOFeRVWaFc2ojePJATu4QVkXXxoSdzeS8BYq0QnorUF4FYtH0tjCL3cVUBpf37gk2RopRK3BgsC+zKTnxzKQzVrWopPCte5Qa8dknDBv0MxNM3sJDXTVulXwsYf1SLULLwG5NYMlP6pJPPhFSPpdNL2wDgVaqHOHPMaE0DzIHAkaa5ibg5q3XcuEO93er+IV4jvNoMlMPtGNrEzqmYRkEfkjXEaK9/MJuX00+Jt+ispcXZHcG62jut+LpW1Nnn4kXSRE9DBdUBTEvMdHW/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImzvMpnjonZOdY5yrSQHRMdeiGkBlMj5h52PfDWL8Ns=;
 b=j3ZJSl6WQP0BGVKH02/WKdhbD+Ua4d5NEmufpCeDrTG9q0AsLucXjjeLaHdKD7u2VCCFQNKdwD4vllRVLWC4Ig8dF3YSdpPoeth7tVhV3lnH5zm+geZ0k9Ho3Ay3+CHNvDjMfwiAteyGnC0u+TliNJrHcN4/6MxRrlMClNkOWdQY0r8PS15D5VhyDDSuzEzT7qhqKq2aKRcMj33qccVpr1s89YtCPGkohVh/wx59ObDOv120wF/4sFAl4Gf5lN8znPqvX5c4mKmWLwObcVEVQn41TSZ+IY8CMM4o6gIzxk+EyNly15UzOA24R7jYQCJuGCDNItJF7quH8zufRI5M4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 05:48:51 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 05:48:51 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Pranjal
 Shrivastava <praan@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Williamson" <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Thread-Topic: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Thread-Index: AQHcjWW44cZHc/LC3Ey07jDLODM/2bVk8PuAgADKdoCAAH2KAIAChYWggACGQ4CAAMxq4IAAKrKAgAABFBA=
Date: Fri, 30 Jan 2026 05:48:51 +0000
Message-ID: <BN9PR11MB527617D8029B43B093B789D08C9FA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com>	<20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
 <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260129145851.GE2307128@ziepe.ca>
 <BN9PR11MB5276907FC927424043C636E68C9FA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260130064317.3c0fead7@foz.lan>
In-Reply-To: <20260130064317.3c0fead7@foz.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW3PR11MB4745:EE_
x-ms-office365-filtering-correlation-id: 11d800e9-8e3e-4221-99bb-08de5fc33f48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cmxuNW8zZGM4dGg0RG5rWGRkMWNsYXlJZEFrbGQvd2JEZ0lzem9pTXUwQlo2?=
 =?utf-8?B?TVV4UlphMWZXWi9aMEQ3Q2FzU285SGM2VTZldWlwS2JjbHAxcDdHYWszMXdI?=
 =?utf-8?B?RHZOL1hMS2JBVlQ1aW9ac3pwWVMzaGNSSmRNVTdjS29tRERVNmUzelJQYmxN?=
 =?utf-8?B?WW5McVJkVkFJdlFWVmhGd2U3MjZEeUxzTVp0UWNmSXRrQkxoT0FNZmFzd1Zw?=
 =?utf-8?B?N2tSY2VObTUrRnNiTTB1SXVJa0cyTDd6Ti9yTUJEL0hLemJJT1lneUdGZmJQ?=
 =?utf-8?B?Z0htbkVmUzY2K3VOL1lzYUxWR2cwTTdhYmlSQVkveUhXVnU2WjNTWXNpVzZJ?=
 =?utf-8?B?enBDQUlRZE9qRzdGQWFvQVNLNG5OSTQxampZYlFNbkFoYXVFRmMvY0FGaGRx?=
 =?utf-8?B?Y0lFWi9iTkRIaEdQck9MZHQ4UWtvR0JPMlBoQVgxbm92RjBuekE5TWNQVXJX?=
 =?utf-8?B?OWRNcHBua1ZSMFVQTUErc3pBb1daM1Zsc2NTbkNTTjFGU3NhSTFQVkxLYXZj?=
 =?utf-8?B?UTFMYnRVMVEvVzVKZzd0YlhyS0ZuN1M5M0VZR0k5VjhxZG1IRHJML1VXKzdh?=
 =?utf-8?B?ZElYV0RRdkpoTk9tYkhDUkxDTkNUMG01SlRiTVozOGlRUFF4bE1LVWNaNUt6?=
 =?utf-8?B?V1hNMnlzWDZnMjhxRW0zUjkrbjJxVU9uRUNJcmpWZVp6NUVnU2FHbzdDbUZR?=
 =?utf-8?B?OGZLdXBPVGUvVUVxSGQ3ZEpNazE2ZW1PeExBVThRWElNUVNldThrMHZha25j?=
 =?utf-8?B?T2tweU9zQUpLME4xelpRL3FCZ0pHcW5vSUJHc0cwM0FiOWFHVUtyeDE5OTVp?=
 =?utf-8?B?a1QrMlA1WS9UdVlPTVVZaXQ0eDJjYkgyVzd0M1IzRzhoT0ljM281NGJoMGNP?=
 =?utf-8?B?UHd3U2h5NjRFaHNNSndxUHQ2dnpER2o0U2w5aWdiYzNQQmNHNTlQRlVTdWRm?=
 =?utf-8?B?ZFVhaWVKbzdvWVkrRXRVMUovaFR1b25JMU1VSEppWlJOb1BkUDZZalVnVWFR?=
 =?utf-8?B?SGZleFBwYmhsZGtTL2MzR08rUVUyWFRlZjhoRm1OMUpQVXcxc2lNU3ROanBj?=
 =?utf-8?B?ODdYeWtXTzVtNFpZcm15M1ZialRRallKaHNEOCtrekliTVF3MnBYZXQ0TjF6?=
 =?utf-8?B?VWd6OXpLTHZWK1hOa09WK3lWWmNaVW1GSUtkVVNkRkdRd05DbkxkenErV1do?=
 =?utf-8?B?MFdIcWcxZ0NvSE9VakdRdnFqYnRjNVc2Y2czaDYwU2M0c3FIblMvcHdlUXRh?=
 =?utf-8?B?QzUwOFgxRDlHNGF4elpCczV2UlFZazBMZmpEUEl5aXB5aU16WkNwTVJ4QzIx?=
 =?utf-8?B?WHFsNDBYMEFjN2lZdW1jTmNaVWgxQTRQQkR2MnN3eVVlbkxXTExOR2hiazhs?=
 =?utf-8?B?b1phZ0VQRjFwSzZkNXNud0o5Q1ZQNFptdjh4STZ4cWJmV2FWVWtWMVpiaGNu?=
 =?utf-8?B?NEc3SENvakJLcWRaN2NzcDRTS2QvdTRKeVFPV29NbURIN3dFRDQrSThsTU44?=
 =?utf-8?B?VnY5Uk1ZOXUybFJ0cS80VUlmRitHLzlBWlJHTHhDZENmL2ZRRDdQSm15aEU3?=
 =?utf-8?B?MWZnemNsSVpCY0dwR0VWdGw1c2VENVRLTzdaMzlWOGlidUNZRlVVc08rMTRP?=
 =?utf-8?B?bmZha1dQUmdBQ3Nkdy9FcTlRQ2E5TlhWekRwSCtsUUxMeGhIb3JwRlVJb3M4?=
 =?utf-8?B?MGQ4WUt5R1A1L2lIbEFLVzRLWEZ3bjRiVDdDM2wvaE52VHlCZGdHUCtjcnhr?=
 =?utf-8?B?SHd6Z2gwVzByZmMvYkQ0a3J3SjBMNE9iYU5MQkNWTG9UcEc5YUxzUW50MFJo?=
 =?utf-8?B?SFdlYmxSajhVd0dLcmZHWEJwQi92MGY0WmVSNm92TGpEYktTZVVNQmQ4dWZj?=
 =?utf-8?B?MjV0UDdWdkNtRUhSQWs5ZkFJdHNqeUFESHFmaXJiMDdpOXgxdFIrR2pUL2Uw?=
 =?utf-8?B?ZGRacEVrTVFrdFd1RFdnbCtGMk5YODYwQm04bFM2dGpGZzlwdXV1WURDd045?=
 =?utf-8?B?c3p4ZFN4dk43RDVNR3ZvRVIyR1JXdXFaQ1J3ZGUzYzBqWHo5cHp2dmF6QzYz?=
 =?utf-8?B?ekl5cksxd0JKSlBPTmdlc21TeGp0dUhQVk4yRHZqbTlyQzlYOTh2bGZEbSt3?=
 =?utf-8?B?RDdZNnZpQlZpK2tBUWRDMTVzMCtIaFpTc094QVhkVDV2WmsvY0tLNDB1dmx3?=
 =?utf-8?Q?0qF5c3ee+3vGNHw/oA/v6Gw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDNqTjIvcm45eDRNQ2k5K1VkQ21WVXVTNWVHc2pwTTJxODFWaHdCN1JsSkJP?=
 =?utf-8?B?UW5EMzZNcmgvYkRrUEZBR211TUh2djc2bExrL0s2bUdNbFU0Q3VVeUU1c2l5?=
 =?utf-8?B?WlhIVDVJUWhZc1NiU1hySkZYWWVuYnREaFRkZmRYUzZGSlJYK05ZNnlIMVlS?=
 =?utf-8?B?RFdoVG1mMFlaRWVDc2lsNzlPM1BkVEpuV2FOOGtPQVhHVm9Ed2tFSER4Wm01?=
 =?utf-8?B?TUVyM1FVelBOWjBQTUswN2RYaUw4U3YzZnJ4cFFkQlhka3A5MlBKWVA3bWZq?=
 =?utf-8?B?T054OENoVkVOZ0hZek40TnB3Y1c2M2tkUGxpWEt5Y2Z1Wkd6WCtRd1plZjEv?=
 =?utf-8?B?dFk2QjQ0b05EN21DcFVpbzNBcDNHL1RUenU5VzlBYnF0MFFLVjRuOUxXYmxz?=
 =?utf-8?B?Wk5ZQ2k2WUM1dWVlTW1McFBtQzJEMFNOYmtJOTJ2REdhR3JBS2lHcldVTUVN?=
 =?utf-8?B?dklOT0w1MmkzQWI0S0NrK1dhdkVjWFQrTVY5NzN2NWxBRGxIbm1xWGptbEJ0?=
 =?utf-8?B?M3RldE1HSVFHOC8waHRHWWQxaWNxY29sajFvNE1lSDBnWGI1cHp5cEpzdzZL?=
 =?utf-8?B?b3hXWkdUVFlrVnMzZXhNMHVOd1ZndDhZcDIrN3FoRnBlOGsxYzd5bTcyZ0s1?=
 =?utf-8?B?Rjl6WU1sNDhZSTJBWWo4Y0FMVVZkV2JnWDJGeW1qY2srL01qckdHZlJENitC?=
 =?utf-8?B?bEVIVndjTTQ0VUNxNDRYQUdGV1pLVU4zOU5jWUdYblhJY3E3dXRIaGxKUzk1?=
 =?utf-8?B?Z21LM1d5cFd3TE9lNlp0TGs1d2NwcllxTnpuREpLSm9iKzJZNUhidlFwQk5v?=
 =?utf-8?B?SkF3V0tBS05PdXl4dUN0aEJ5RUJoRkpIcFJEQzVrL2lYQmFOUENZWjV2R2J5?=
 =?utf-8?B?dllXYnZrMDhkMFFDc0w0amtoaFdHNzhhNW1sWUZHVXNpcGZ1RVhzdlluRmZG?=
 =?utf-8?B?cXd5UUtKdUY2RE9BZzM1MXEwZFV3TVhrYnErbmZqeGRBNGllVGEzUDF0QnNG?=
 =?utf-8?B?Q0d4MyttOE91ZjVBNG5hM0EyMWYzYkpJbFJqbGZpN0NNRFpVY0owT2hPUEpv?=
 =?utf-8?B?elRIQ05FemwrTHNZeS9jdW50K0pYcWJYMmN4QTZScjdaOGVKRC9OWWM2Z3V3?=
 =?utf-8?B?ZTFSblE2YUZiL0hxUDN4WGdJeWs3Y3J0L2ZJVVVKMkFTVlZ3QUJiaHd6bEkx?=
 =?utf-8?B?WjVXSldrU2d1SDB5K052dWE3TXBCN3ZsZXhvQ1p5QkVlTC9NUEp2V2FQN3do?=
 =?utf-8?B?aXBwS1JQdGU3MjVLSDlNeXJVNDEybUF3WkJuK3FZOEFHakxIQU5pQWprUk5u?=
 =?utf-8?B?M1h6aFNoZFo4bG92Z2JWb2hhQWVFaGpVWmJENUkyekd2S200YUhnT2dnUU9G?=
 =?utf-8?B?Z00weVlPaS9zZ3JWbkNLNk9pOS9xTzY5ZzdpZU81djFtMDkyV1ZscEY1SEs3?=
 =?utf-8?B?a2hqRys3Vjh5eHFBRzQ2cXlTQkdEUDQ0NW9sOWUxNW9tc1p1bkpHTTZKeDd2?=
 =?utf-8?B?dnh3NGt3eFluaXJ5VnFvSEZYUVd0aSt3Qk5BNVhac0VzbmJLVmtEUVlvenF2?=
 =?utf-8?B?Q1RvMElZV0JsY0dOYTZSQk9Ca212KzhWT3cvTDVGMm9YUHkyQ3ZOcDB4M0g0?=
 =?utf-8?B?U0twMWxmS0xxNDVJTmxhd0IyaWg2Z2xscE9rUi9ZUnlMRmx5L1RWRnJjZU1u?=
 =?utf-8?B?YVA2bS8rL2taSHM3c2w2V2htcWVISHNtSTBMZlZmeFkyUHZJdXFwTXQ3Z1po?=
 =?utf-8?B?QnBUMDh4NnB5MnF5K0ZKdENEREorT0gzY2hoZEVQcWRPZWw1azBmWElzMGRp?=
 =?utf-8?B?TkhOMjRLREVmMEVxTXdVZlQ0SzJGWElYbU9NUUllWDgrZ2RrSjViOVFvS0lx?=
 =?utf-8?B?NzNLTEFGRnROOVREbkRRUEd5ZFZKL0pGcWlId0lrMUZQU2gxdnpoN0hxSzVH?=
 =?utf-8?B?TUxFbmRmZ3g5bjZ6YTByNlN1R0VEeUhkaHZJQjF6Ujc1K0tIRFpBcmxyTGZV?=
 =?utf-8?B?NTlsOXhnUHhoc2RRYjNPODZvM2NrUGM1cThwOVVTU0JwYVJTbTRmWWpqQVl2?=
 =?utf-8?B?RzdIbHlNb2ZnQTVvbjNsSHhKdDQ0Y3FZc09XZk9FcUQ0b1g1YXg3VGk3ei9J?=
 =?utf-8?B?eHYyNUlHcFBtMXU0WlUvYlJ5SGJ1dTIwdDBmeTJBazAxQWZmVkZQaktrbllP?=
 =?utf-8?B?RGlzbGF4YkpvdVI2dXlDMmpNTFZCa0pEMThVOW5TVXBwRk5EVUFQMldUWWlQ?=
 =?utf-8?B?SkljZGpoS1cxSnlwME1iQk5MTUNJOTd6aTZPN3BLdG5RcVpaeXhrRDF5TUlC?=
 =?utf-8?B?eUxvck51S2lLTS9EemwzWEJkMGF6MWhnamY2TFpRcWdadjRQQmFOUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d800e9-8e3e-4221-99bb-08de5fc33f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 05:48:51.7463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 746PJsIJo11Rxm/7oIysH0C62j93ruJbKdwgOV3mbbrN1eYqjzd/vY0zFaAfl3WOpLuead6rmdROqPqtcLholA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ziepe.ca,kernel.org,google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,huawei];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1ED5EB774D
X-Rspamd-Action: no action

PiBGcm9tOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmc+
DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAzMCwgMjAyNiAxOjQzIFBNDQo+IA0KPiBPbiBGcmks
IDMwIEphbiAyMDI2IDAzOjEyOjAyICswMDAwDQo+ICJUaWFuLCBLZXZpbiIgPGtldmluLnRpYW5A
aW50ZWwuY29tPiB3cm90ZToNCj4gDQo+ID4gPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDI5LCAyMDI2IDEwOjU5IFBN
DQo+ID4gPg0KPiA+ID4gT24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMDc6MDY6MzdBTSArMDAwMCwg
VGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiA+IEJlYXIgbWUgaWYgaXQncyBhbiBpZ25vcmFudCBx
dWVzdGlvbi4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIGNvbW1pdCBtc2cgb2YgcGF0Y2g2IHNheXMg
dGhhdCBWRklPIGRvZXNuJ3QgdG9sZXJhdGUgdW5ib3VuZGVkDQo+ID4gPiA+IHdhaXQsIHdoaWNo
IGlzIHRoZSByZWFzb24gYmVoaW5kIHRoZSAybmQgdGltZW91dCB3YWl0IGhlcmUuDQo+ID4gPg0K
PiA+ID4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBkbWFidWYgZGVzaWduIGEgZmVuY2Ugd2FpdCBz
aG91bGQgY29tcGxldGUNCj4gPiA+IGV2ZW50dWFsbHkgdW5kZXIga2VybmVsIGNvbnRyb2wsIGJl
Y2F1c2UgdGhlc2Ugc2xlZXBzIGFyZQ0KPiA+ID4gc3ByaW5rbGVkIGFsbCBhcm91bmQgdGhlIGtl
cm5lbCB0b2RheS4NCj4gPiA+DQo+ID4gPiBJIHN1c3BlY3QgdGhhdCBpcyBub3QgYWN0dWFsbHkg
dHJ1ZSBmb3IgZXZlcnkgSFcsIHByb2JhYmx5IHNvbWV0aGluZw0KPiA+ID4gbGlrZSAic2hhZGVy
IHByb2dyYW1zIGNhbiBydW4gZm9yZXZlciB0ZWNobmljYWxseSIuDQo+ID4gPg0KPiA+ID4gV2Ug
Y2FuIGFyZ3VlIGlmIHRob3NlIGNhc2VzIHNob3VsZCBub3QgcmVwb3J0IHJldm9jYWJsZSBlaXRo
ZXIsIGJ1dCBhdA0KPiA+ID4gbGVhc3QgdGhpcyB3aWxsIHdvcmsgImNvcnJlY3RseSIgZXZlbiBp
ZiBpdCB0YWtlcyBhIGh1Z2UgYW1vdW50IG9mDQo+ID4gPiB0aW1lLg0KPiA+DQo+ID4gZ29vZCB0
byBrbm93IHRob3NlIGJhY2tncm91bmQuDQo+ID4NCj4gPiA+DQo+ID4gPiBJIHdvdWxkbid0IG1p
bmQgc2VlaW5nIGEgc2hvcnRlciB0aW1lb3V0IGFuZCBwcmludCBvbiB0aGUgZmVuY2UgdG9vDQo+
ID4gPiBqdXN0IGluIGNhc2UuDQo+ID4gPg0KPiA+DQo+ID4gZWl0aGVyIHdheSBpcyBPSy4gSXQn
cyBub3QgZGlmZmljdWx0IHRvIGZpZ3VyZSBvdXQgYSBsb25nIHdhaXQgYW55d2F5LiDwn5iKDQo+
IA0KPiBQbGVhc2UgZG9uJ3QgdXNlIE91dGxvb2sgd2hlbiBhbnN3ZXJpbmcgdG8gcGF0Y2hlcyAt
IG9yIGVuc3VyZSB0aGF0DQo+IGl0IGlzIHByb3Blcmx5IHBhdGNoZWQgdG8gb25seSBzZW5kIHBs
YWluIHRleHQgLSB3aGljaCBJIGRvbid0DQo+IHRoaW5rIGl0IGlzIHBvc3NpYmxlLg0KPiANCj4g
SWYgeW91IGxvb2sgb24gdGhpcyBtZXNzYWdlIHNvdXJjZSBjb2RlLCBpdCBpcyBub3QgaW4gcGxh
aW4gdGV4dDoNCj4gDQo+IAlDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9InV0Zi04
Ig0KPiAJQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogYmFzZTY0DQoNCml0J3MgbGlrZWx5IGNh
dXNlZCBieSB0aGUgdHJhaWxpbmcgc21pbGUgaWNvbi4gSSdsbCBwYXkgYXR0ZW50aW9uIHRvIGl0
Lg0KDQo+IA0KPiBZb3VyIG1lc3NhZ2UgY29udGVudCBpczoNCj4gDQo+IAlQaUJHY205dE9pQktZ
WE52YmlCSGRXNTBhRzl5Y0dVZ1BHcG5aMEI2YVdWd1pTNWpZVDROQ2oNCj4gNGdVMlZ1ZERvZ1ZH
aDFjbk5rWVhrcw0KPiAJSUVwaGJuVmhjbmtnTWprc0lESXdNallnTVRBNk5Ua2dVRTBOQ2o0Z0RR
bytJRTl1SUZSb2RTdw0KPiBnU21GdUlESTVMQ0F5TURJMklHRjANCj4gCUlEQTNPakEyT2pNM1FV
MGdLekF3TURBc0lGUnBZVzRzSUV0bGRtbHVJSGR5YjNSbE9nMEtQaUErDQo+IElFSmxZWElnYldV
Z2FXWWdhWFFuDQo+IAljeUJoYmlCcFoyNXZjbUZ1ZENCeGRXVnpkR2x2Ymk0TkNqNGdQZzBLUGlB
K0lGUm9aU0JqYjIxdGFYDQo+IFFnYlhObklHOW1JSEJoZEdObw0KPiAJTmlCellYbHpJSFJvWVhR
Z1ZrWkpUeUJrYjJWemJpZDBJSFJ2YkdWeVlYUmxJSFZ1WW05MWJtUmxaDQo+IEEwS1BpQStJSGRo
YVhRc0lIZG8NCj4gCWFXTm9JR2x6SUhSb1pTQnlaV0Z6YjI0Z1ltVm9hVzVrSUhSb1pTQXlibVFn
ZEdsdFpXOTFkQw0KPiBCM1lXbDBJR2hsY21VdURRbytJQTBLDQo+IAlQaUJCY3lCbVlYSWdZWE1n
U1NCMWJtUmxjbk4wWVc1a0lHUnRZV0oxWmlCa1pYTnBaMjRnWVNCDQo+IG1aVzVqWlNCM1lXbDBJ
SE5vYjNWcw0KPiAJWkNCamIyMXdiR1YwWlEwS1BpQmxkbVZ1ZEhWaGJHeDVJSFZ1WkdWeUlHdGxj
bTVsYkNCamIyNTANCj4gY205c0xDQmlaV05oZFhObElIUm8NCj4gCVpYTmxJSE5zWldWd2N5Qmhj
bVVOQ2o0Z2MzQnlhVzVyYkdWa0lHRnNiQ0JoY205MWJtUWdkDQo+IEdobElHdGxjbTVsYkNCMGIy
UmhlUzRODQo+IAlDajRnRFFvK0lFa2djM1Z6Y0dWamRDQjBhR0YwSUdseklHNXZkQ0JoWTNSMVlX
eHNlU0IwY25WbElHDQo+IFp2Y2lCbGRtVnllU0JJVnl3Zw0KPiAJY0hKdlltRmliSGtnYzI5dFpY
Um9hVzVuRFFvK0lHeHBhMlVnSW5Ob1lXUmxjaUJ3Y205bmNtRg0KPiB0Y3lCallXNGdjblZ1SUda
dmNtVjINCj4gCVpYSWdkR1ZqYUc1cFkyRnNiSGtpTGcwS1BpQU5DajRnVjJVZ1kyRnVJR0Z5WjNW
bElHbG1JSFJvYjMNCj4gTmxJR05oYzJWeklITm9iM1ZzDQo+IAlaQ0J1YjNRZ2NtVndiM0owSUhK
bGRtOWpZV0pzWlNCbGFYUm9aWElzSUdKMWRDQmhkQTBLUGlCc1oNCj4gV0Z6ZENCMGFHbHpJSGRw
Ykd3Zw0KPiAJZDI5eWF5QWlZMjl5Y21WamRHeDVJaUJsZG1WdUlHbG1JR2wwSUhSaGEyVnpJR0Vn
YUhWblpTQmhiVw0KPiA5MWJuUWdiMllOQ2o0Z2RHbHQNCj4gCVpTNE5DZzBLWjI5dlpDQjBieUJy
Ym05M0lIUm9iM05sSUdKaFkydG5jbTkxYm1RdURRb05DajQNCj4gZ0RRbytJRWtnZDI5MWJHUnVK
M1FnDQo+IAliV2x1WkNCelpXVnBibWNnWVNCemFHOXlkR1Z5SUhScGJXVnZkWFFnWVc1a0lIQnlh
VzUwSQ0KPiBHOXVJSFJvWlNCbVpXNWpaU0IwYjI4Tg0KPiAJQ2o0Z2FuVnpkQ0JwYmlCallYTmxM
ZzBLUGlBTkNnMEtaV2wwYUdWeUlIZGhlU0JwY3lCUFN5NGdTWA0KPiBRbmN5QnViM1FnWkdsbVpt
bGoNCj4gCWRXeDBJSFJ2SUdacFozVnlaU0J2ZFhRZ1lTQnNiMjVuSUhkaGFYUWdZVzU1ZDJGNUxp
RHduNWkNCj4gS0RRbz0NCj4gDQo+IHdoaWNoIGlzIHNvbWV0aGluZyB0aGF0IHBhdGNoIHRvb2xz
IC0gaW4gc3BlY2lhbCBwYXRjaHdvcmsgLSB3b24ndCBoYW5kbGUuDQo+IA0KPiBUaGFua3MsDQo+
IE1hdXJvDQo=
