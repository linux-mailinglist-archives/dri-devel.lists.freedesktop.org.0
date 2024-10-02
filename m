Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7798D216
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28F410E19F;
	Wed,  2 Oct 2024 11:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyTfsSNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7244D10E19F;
 Wed,  2 Oct 2024 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727867872; x=1759403872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sg7lc/kl5F9kz2iBgdDBwT+9QngSFHZiOX8vuPrDZzE=;
 b=QyTfsSNoSFvCu0y6jn8qxkipaoJT2oEoPjIIIzC3Uvbl5fWJfQz9dupC
 7dH6U+U/TEy19qZOBwmpZX1Vx8ApvbjQbmw3gR2wO7wVdGS0OYa00udXn
 0jD2/CV3u/d4r2NsOBiIK3MaFbc3Rvvu4Q7jREvuUXtHsHyPsPP5fMwLT
 1SHgKz1EEvBq6hXQ4y4Jo/vu+eqBcjbtrfdVBxDKyAbtFTVOplcOPWfMf
 yKSWSmKgjoX5OsDxCjqhThvBlxKQaeo5zaJUjSEACjYaSdISjFanUGrtH
 cnoXvkC+F9T34xOAoVV3eFf7EPY2zEtgrwpLZuBNFZjbc9ldFGHCB2idL g==;
X-CSE-ConnectionGUID: 8RLHnLcrSqS5AmolhhFQFA==
X-CSE-MsgGUID: quKlAGxATU218G8wWigRRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27120473"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27120473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:17:52 -0700
X-CSE-ConnectionGUID: YwFLZDiPTRqOT9QFBiSIBQ==
X-CSE-MsgGUID: W8QsCCApS1WicnVYn4oKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="73993561"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 04:17:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 04:17:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 04:17:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 04:17:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 04:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTqkCtEIXxCVbdFhtwRH38a6xELOXQYdm6JrosJmz03cCUjxpTkbuJON0pulp8RU2oZuRZgHThUBU5EssH+O279EkyJsxh+5l7LCqI8oal97gAW4jfXOTX+NHngV5xPrFissupVhoA7iwS0O2TUglvoLLtw3GVYtAgMgfmJh4s5+HrCcwboHIvgEUG33NLus1Dj+yvPU4lbJroAo2Rpli1c1t1/DvcuWGi0yUoCm1mJhmol4BqbeNrlyzczxXn22Q52iZxXFWe4LVHm79n3mgP9e/RGjfzwBHw5EPcvYq+OUp/rPsr/F+BYlh1Mu6WgVBx2HYcCPWU6GWc0/fUvJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zghBsLfI5/c2x5DjhLNuRCXwsTbEIYX0bbdOoZCjxNA=;
 b=fphw3N2/f4iInchZh0hBfEjtiyb6hhiHb5SDgLIrfScBKjTAonW+fLU3KLERGefnw9YdOUk944F1FnTD3bYdoKOWC8WaXfObtHAcS1WF1LHQcpUciIcWblQyh8XpG36m+Y6wSQLycuHCrP/PiP/GRuewV+obWGXgR+rcSaOMM80oJa0lref6x5ObXnwSh0P+wi9uErcCUsZvHOGNSW0DonAHq1xyc3/DWUvJh2JcYeWpiPLwToiGOsOvw78gxJx5FJ6/Y28VGWZ7BeE7w+mDLjWuEyYO9+imvNJv5vyUvBh6hPXgPrw6RHMw60C2tmX2Fhj1HpdIy5iCcOdWfPEsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 11:17:48 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%6]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 11:17:48 +0000
Date: Wed, 2 Oct 2024 11:17:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <vegard.nossum@oracle.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/i915: Rename functions in the docs to match code
 changes
Message-ID: <fnpyzryicbutn6plm3ozh24ugzwsoiig4fs4vjrlkyztqeqre2@2hucqxpv7re3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20241001062555.1908090-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241001062555.1908090-1-harshit.m.mogalapalli@oracle.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 945c93fb-9473-49c5-0351-08dce2d3d903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFE2UFpzTUVrWVRteGNVTitEQStVekV1NllKclNrSCtzUHRINElVUG1ack5h?=
 =?utf-8?B?clBHYTNGc2o2L0VLZE9WYkpjaklJOFJRSVRYaC9UdXhGOHBqZGF4NFAvZW5R?=
 =?utf-8?B?OTZBeVQyb2tOSC8wL2oyUEtRSGRJdk5ySmtScUtCZCtJMk9ndW9BL0U1cURJ?=
 =?utf-8?B?R0JwVFZwZGpwUkZCamFYNDQrTmFiRVE5RTBiTGhZSDRJaFhRQUYzdW9XNHBD?=
 =?utf-8?B?aklkWmVCQXRpZWNscTgwcnhhdER5a3M0TXF3aHJMQk51MHIwbCt2dVVYeWtX?=
 =?utf-8?B?SkdJZnR6WmUvbUd6b2V0bk01OGRtTFlMUE05MStRMm13K0ZXMWg5VE1BQWhm?=
 =?utf-8?B?Y1ZuSXRTbG8zWnFVTE43TTRMRm1OQjlYODhPNU5hRUJONk9GbUUxN1ZadVpM?=
 =?utf-8?B?aGJHUkNtdkozWmFmVWx4OTJmL21QTlNRME0vK0MydHZONmx6bUMvZmd5dDE5?=
 =?utf-8?B?UWYrQ0JRcEVzY21sdFBlSlliRlJ5ejVGYWwxQkZSSTJTNHZXYSsxKzA0QkF1?=
 =?utf-8?B?ZGJGelRKQkYrVFlOcjluZDRuVjdmRkdLVkhqWFJseG5kQTVsT1pLTFJ2dzNp?=
 =?utf-8?B?d045dEFTS2tWSHJJaUZEc3RUWmxDTHFlc0lHMm5jVDB6RlhuU29vQ0U4Sldn?=
 =?utf-8?B?Z0h4ZFliWTBGUmp3TTlhNW5INW5YYUVUR1R4SmpZMVo0Tkc2L3RmNGtaTlpi?=
 =?utf-8?B?YWtRdFk0TXJBRU03U2p6SW5SRUZRbmg5R1c4MStjMHc2M3Q5aFh2aEFsS1Jj?=
 =?utf-8?B?YnlOSzRkQ1I2WXhTbGVOQlpHV3pVeXhUc2d4blYzSFJPS1ppV0VmbzhqYkE1?=
 =?utf-8?B?TnlhbmdFQ3lMMEFONHM1TUw0WHNCTVlFQmM1R1Bqem9say9JOTdaYlN6R0s1?=
 =?utf-8?B?MldLbzhpVGNXSmU0VWdrZ0ZhQ3ozdjA0VzFIQjNqdFBMUjJiWVFxSGZJeERr?=
 =?utf-8?B?VDdQZmYxdGVCR0xvSjZXRzdTei9tVTQrMFFTOEsyMUc1aFR5QkMxdnh4c0Qv?=
 =?utf-8?B?aVVjOGNFRTZtZnFvK2xDV1FNNElFNGtnTll4VFEyTGRxM2hmTkZpRjFzUkJl?=
 =?utf-8?B?NXVQRi85M2xqY0dOazNVRlhWNU9FZjQzbmJkREhuQWRsMXJFM25mM2dEdDQr?=
 =?utf-8?B?VUZKV0Iyd1JNTisyNEJxSTRkaW5LY1FMYlkwclFZazJzQVRBMm5YU3ZHRk5z?=
 =?utf-8?B?cU5QQksra3lHYUdyS0NMZ2w2ZGN4ZGUwUjlzUmhuQ3BoSXpwcEZ1SWQ0R3Nu?=
 =?utf-8?B?cS8vS0svc1E3MjJJYXA5L2RQaWhVUWNYSEV1Wlg5YytCdVdiQWk1dU9zYmQ0?=
 =?utf-8?B?cTUyMGhsS1BialE5NWlaVm01TGFpbTVNaWhRa2RxZk96eUVCRGp2MDVnVm1o?=
 =?utf-8?B?azdydzJ3WkJ4TForMFEvQmZ5V1lIMmFwSWUydG1pVTJKYmpRYUdUS0tNU2dk?=
 =?utf-8?B?NjdDbzljeHB2b2RnN2RIeTRKUEpWdksvdlFnaVFBWnJxUU5EVXAwaTNZM1dk?=
 =?utf-8?B?TG9Bemk3eGVwSmQ1WXdFSEl6VW9jbE8wK21sZmp3MVhXL1Z6ZVArWEFTdkRv?=
 =?utf-8?B?QUlyU3B4NERoZXRoSG9qTm5zNTFDVmpzTnFJbGc0RWMzVTBBQWVkNzU5Rldz?=
 =?utf-8?B?OGNuVllvQUt4eUZTRHc5S3hOMktlQ1ZLRVpCd3hOS1lLdUlEQlJ2WWhqdk5l?=
 =?utf-8?B?d3V0bm1ndmJTbUZ1N1RUakY4cmczRjFrbHdud3RqbStGd21XVTd6c1pRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEtTdmpFRW1qVFdQVFBWN1AvQ29USzA3SHpCTVcvVHg0cEdkT0pDY0QwVHVS?=
 =?utf-8?B?VjZqRkY1R0krUG16U1Z2aDNCei9aS21yWWJWNmxJYkQ3VWY1TlN5NzdKbEV5?=
 =?utf-8?B?R3BoR2pFbGRRVXNSSEpnQ1pVU2pVTmk0bWw5MTJ4ZEtQZDRxMWNFQnEycWNi?=
 =?utf-8?B?NmlkZlZaY0dlVWFVQnROWTR2Vk1NbWQzRFBYZ0FxWXhzMHhSS2dWQ2xqMGp5?=
 =?utf-8?B?TzRGbGluTGpydUltSXBnOEtSSFN1RXI3OEdtTnlVUWE0bXNzc0syRmw3R0Rp?=
 =?utf-8?B?L3loZkUrMlJwQlM1Uk1DVFplNlk2NmlUb2cyWGsrTmZ5bm9EYTQxeDFDLzFB?=
 =?utf-8?B?eVVPdjR4K3dXUDhhaDBkekFOQkQxb3g3ZWV6WXNvZUEweTRzM3cweXlsRHFX?=
 =?utf-8?B?cmVvOE4vUTZkY0lUMnZqT1RkU2svZ1VPYUJveXcvdTR6TTI1OGd3a1dheGVT?=
 =?utf-8?B?ZHRXL3dpUWRDRVhyZlFKeC9XeVpKVVlpOUplaEFGTmx1elA0ai8xbkZMRnJ1?=
 =?utf-8?B?WTNhcG1TVnUrVlorRjlIYzIzYnV6NTRhR2pZTDQzOE5Hb0pQdTdHSFNwajJo?=
 =?utf-8?B?TmRvOGc5dFBqc0hhd2phK2pmQWtRMUNqOEJXQXRHR2llRlRvR2ZvZVI2d1du?=
 =?utf-8?B?WFhuOVRRRHBFem5rQ1g1Y1orM0VVM2d4dXpISkdrSy80TXJvR1dFbmZMamhj?=
 =?utf-8?B?ZDNmNVZVMFJCMS9vcEhTZFJ1eHhmNUczcXdHZEFLamlDMi9FTmhOb21DOHpH?=
 =?utf-8?B?aHdTeGN1NnFUTUFYZk9RTlFFdGx4NGQ2VUUvSFRTMXBaUElSVDZ6dzRFM2ZJ?=
 =?utf-8?B?VHlMZ2NEN29jNXNWaHhsWnE4YjNDaCtvKzRZZGgwSHRvd21vMUhNcmRQZW9r?=
 =?utf-8?B?ZUVtU21zNDBDUWU4U0QwaU1OSW5xNFNQUENwU0ZNSFpBODdPVWJ3T2hleXpp?=
 =?utf-8?B?WUJLYzY5cTlINVNyeDJ1RysrelY5RU1mZmlUTnJWUG9ZcTd1QWN4RG8wZ1JN?=
 =?utf-8?B?L2xIeExLZ2hzWWpYbTlheEJDNjMyZXE5NlNPV1RFZHNubS8zRSsvQW9OVm92?=
 =?utf-8?B?MXByWFVFaUlQNmZjV25aOXEwM09WQUxpUm5OQWxQaWJuT2pDd1pBYTZ6c2NX?=
 =?utf-8?B?MlJhTTV3M2NMMldjN0xqcjFkQktJVW5iaHBkWHFna25zb2diMy9pbFJoTWFM?=
 =?utf-8?B?NXI1RzVFR2Eva3RXWWRneEZvTjdoMEh6U0tKc3hFYVdvK0VMZGVsVWNsQU1q?=
 =?utf-8?B?SXZaeGIvdXpQY3hUbkhXckZvQWQ3MEpoUGs4TWl1ZEg5VFVkVHZnT2NOekV3?=
 =?utf-8?B?eUIrTlgzVlRzUE1UOGY0T1lyTFZvUnFsdmpHUzA4YkpRaWhkRDkvZWdYc3VR?=
 =?utf-8?B?OGNSTnRHVDVzWENOSytUUGJDMWliM3ZRdmVHMk1WMHdaclBoakVJbU1iWXRs?=
 =?utf-8?B?bm5MRzgyZHJDY2xpaVBJYncxMGRteUZlR1ppSHJWZnM4dDlrRyt3VkdQRktI?=
 =?utf-8?B?K1Q4LzZIMWpYb3A2cTRtTDJHN2pKamJTdzRyMFBxbkJlK1hacm5jekphQTJo?=
 =?utf-8?B?bit2M2p1L0FvM05aNEQvSDh1VmIrL2N2Y1RDM3NWZDN4dTJvRWpzeTFCZE1Q?=
 =?utf-8?B?ZndnS0RkSzVKb1BmREg0ZTNMR2Q5SFl6bVU3TkVaMGFXRW81WW9CQXIwa3lH?=
 =?utf-8?B?a0hiem95QkQ3NzlSMS9GU2dBQ3BFZVprZzZDbG5XZ2xPSE12N21lWDM2c1Ax?=
 =?utf-8?B?bmxkRUdiYzBtaWhNRlF5Q2F0cEZkbnV5eHIzUXEyK0dLanJWaHkrRXdBcFVi?=
 =?utf-8?B?RHVrejA2Y1FrUWhpLzJlbWpSczZkNXdPVHM2QUsxd3luSm5qejlaaTNQd3NH?=
 =?utf-8?B?WkRocVZRejJ0ejI4WW1NMDVQeE1RVDNqTkpJbzJISGlZNlU4OXRSNTg4eFdN?=
 =?utf-8?B?YStGaWpNRmFVZ3RHeUIzeEpGV09seEp1b3FyNmM1NUc5dlJTanVUVDltR21p?=
 =?utf-8?B?SXkzc2l1dXh5dTZxZmtXK3pQQVFyV2VoTUt5cFNzNTRIakRFd3dHOExmbmZx?=
 =?utf-8?B?YnlrTUFpSmZocUtaU0UxdHBmYklYYjhIaEkrdU1pMUxyR0JSUW9mWW1TMzBl?=
 =?utf-8?B?QWs2ZGIzRlVhbDRhaEhYUkdDbFNnRy9tQ0l0U3E1RUt0Tk5jOStkV1MvaWtZ?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c93fb-9473-49c5-0351-08dce2d3d903
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 11:17:48.8173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqsLA4CnIfXKZyoqQ1xbpSkCXUT9T15AJjMEjfW2jKi0CryD+SEU93N47rZQFWN5PMOavvF4FeiK3uog/EAltXR1VVoaroDWyjhVvQF1vPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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

On 2024-09-30 at 23:25:54 -0700, Harshit Mogalapalli wrote:
> make htmldocs is reporting:
> 
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_interrupts' not found
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interrupts' not found
>

Hi Harshit Mogalapalli,

I confirmed that the patch fixes these warnings.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof Karas

> intel_runtime_pm_disable_interrupts() is renamed to intel_irq_suspend(),
> make documentation changes accordingly.
> 
> Fixes: 3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20241001134331.7b4d4ca5@canb.auug.org.au/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Noticed that Stephen also reported this so added a Closes URL.
> ---
>  Documentation/gpu/i915.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index ad59ae579237..7a469df675d8 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -35,10 +35,10 @@ Interrupt Handling
>     :functions: intel_irq_init intel_irq_init_hw intel_hpd_init
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
> -   :functions: intel_runtime_pm_disable_interrupts
> +   :functions: intel_irq_suspend
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
> -   :functions: intel_runtime_pm_enable_interrupts
> +   :functions: intel_irq_resume
>  
>  Intel GVT-g Guest Support(vGPU)
>  -------------------------------
> -- 
> 2.46.0
> 
