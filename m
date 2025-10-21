Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C5BF42BA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBC810E54B;
	Tue, 21 Oct 2025 00:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsxLW3PF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29DF10E54A;
 Tue, 21 Oct 2025 00:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007504; x=1792543504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=07KGIbMA36WJkJVdGqgaUn8zBPSK3fixyifcb+TPAkY=;
 b=YsxLW3PF3IhbdhA6+RaKlBV8fs+V7k72cjMoFDHVs8Xljk22tYmB6inI
 0JNxDZuEcRUoqO2dookQzrRCc+Gc7Lgq6a9Zygm3r0exBwx1ZT1Ihrc3U
 Jk+lgHkWc1v7Km7TyRCj0UwiU3bFGr6LUfoaBZJoCGQfFwe3YDk/IeH7x
 qceV3IjZzDKmcUbXR4pHatJh0Wy8CrnfyI4+3j0O/mi4ocsNcOdVNM07b
 R32nsQHFe47NKg0UHMN+S6EwKJ+7CwJY0PuZhzE7oFlcNoMZp2qR/MxCo
 qrvsMdVkvBTLi6vCEXhOoRWP0r/Ya1Ve/vEhjNyQQhF1ecKQ10zg1mAbr Q==;
X-CSE-ConnectionGUID: AQb9NYE7Sq6bynfaQcu4SQ==
X-CSE-MsgGUID: ufbrKhQDQNut90LDaETUbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62832114"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62832114"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:45:04 -0700
X-CSE-ConnectionGUID: VIeV8iIZSkm8vaaY9LbASg==
X-CSE-MsgGUID: gq/wVIEORc2jeGQ+SyqPMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="207138869"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:45:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:45:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:45:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEuBrIYpSZEQTwqB8Ahuqet70f9bjRi0N47tBWxdrc3iFpymCSFkGBubHqnZ8ZzqoPxk2hf+A+K4guMMHpxzzj9hm5GJGyqSpxKhPOAkfbqTh4GGcwVJgaFm6Tr4kooKYxwh+eu/5KO/QGzDuABA66RMowHNW1JMUOD5xiIw+2urPg2cIO9suOYkZBu5YNOEuyS8JaT88u1lvvmwxLyy9AWApZa/AlVFvvb5PtKS1NWGfE0cE7xxY2UYhRAuZPge7ck9wMN3lVZaDhOKIXmgCBImGXyfzHZ4ww2/rg7Ehtlk8NxXsPoh80/qviZTDTNFXl+MYbAbLLx4B/GT9x0e3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJWlJVAZU5TQ2QLkicLT0739n9p217eM9cmKEeZ6xoQ=;
 b=C9EDPpnvQhxq1kiVYcSNo+lPtzCakxjoHj7sZ44+roBlVB6U0r09/iPM0zXgxBAMmkhGu2FP9KQcE49yLWdl1R0ewbo25gQlVaTm233HeLbAFm+BQPpYfUKdSV5RsWZqPNVAGPaIz/uVgEWcwipgpsDsyHz8ahx5o7j8mo2dOREUBrskAXf8uWB79Gyqk0l2JtyZ+jsCCT1MhriivF0JnA+plfGXm3qaldl4d0NJSjMDB0A5RKE7MDdcoNi/lL6PLghgZ/wAZGNAx3dTJw7rHChGZUw8QOCF6tN2dIjWOIjSTOu2C9OJZn8Y664WK9eViBskgPPpACztQ/3THdaMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:44:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:44:54 +0000
Date: Tue, 21 Oct 2025 02:44:51 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 10/26] drm/xe: Add sa/guc_buf_cache sync interface
Message-ID: <h2verfdsvi4xd7bnjw6xdwir6dpdjk6urykg2dp6uysu6td2tw@bpjfylz2gl7m>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-11-michal.winiarski@intel.com>
 <e3f602b1-e983-4670-9d44-bec2d8b058d3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3f602b1-e983-4670-9d44-bec2d8b058d3@intel.com>
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f9d01e-295d-4144-b3b0-08de103b0d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SS9kS2dKam5GbEFwNlJIajd6MXdUb1RYMkFWbkhyY0xBcEtQQm1wVkxJMGVk?=
 =?utf-8?B?bHBQWjNBTVlGME93YzhzekFoTzZ2MTFrejc2NEtHUEhhNXcxc2tRVTdrNXBL?=
 =?utf-8?B?NGNaYyt5QUZUa29NWWNUSmtNVlNYTTY0SFlmdEJHclNHVWxUSWtWN05zY1Qr?=
 =?utf-8?B?QlBtT2N4cStxTHNoaWVDUC90RGhYcTcwTnRKNUZxUU1JVUhFNm8rZWNtdGI2?=
 =?utf-8?B?TnU3c1dybWhyV29XczAySFlvV0I3S0RCTlh5d1FRM3RaK2RZM0xBampDalJU?=
 =?utf-8?B?NHdYQTZyMFNZOHZxUHpYQ3lMa2JRQjlxNjAvTGE0ZEw4QlVDcmg1a0dwVmpU?=
 =?utf-8?B?d0I3cDQzckJNRE5ZdHA5dm51ZHRrenJXd2taYnQranpvbDc5UVZxWGZqMFRB?=
 =?utf-8?B?RkV6bVdHa2tyM3pJc04xWFRKbXVvMlV5azNtVmV5cFVLUFdsYzIyV2JqajVF?=
 =?utf-8?B?aDlKbEwyZXVxeTJtbXBnbTRGaHRYaERhUjNTRmIycDZaVlpBRjNBY1JsdDFZ?=
 =?utf-8?B?SFJ3ejEyZVZmY2dTRDM4L1czZVpNYm90SnBQNnhJeGtvSm8xR0w3dmh2ZU9P?=
 =?utf-8?B?RlZqdjlINFZ3UlBUYzZiVUpFYTUrOWEvNkYzcjVrb0NZVzE0UXNxTjlmTXZm?=
 =?utf-8?B?ajBPamZ5aVhvaStwUnd2bGU0MCt4eUZNeXVNR0I1NnJmdkkyUk9hOUhnN1l0?=
 =?utf-8?B?NkNray9ZckM5YjhkV1crYjhrNHlCcFM2L0tqRmg5b09DV1pvR1hnNjl6Yko1?=
 =?utf-8?B?RWR5eVFtUmYxT2hNNzRncEpQa1NYOXEzY29LWXdEc3JuTHhwQVJMcTVLeENo?=
 =?utf-8?B?bTAxUWYzRmhId0JvQTg5TitRZlRwb2dnbERVMXRURWI2UnVBRFE1bzV0bFk2?=
 =?utf-8?B?ZzVNRHNwMmtWSXNXbFBkd0xLWjZySmhPVkFsZmNlbk9VSTNLVHE2b3h3S3lU?=
 =?utf-8?B?MEwzZnJsdWRMa3NpcWlyQXd4OVQ2YzdhQ05maFpEdVc2RGp5cWFWWUVhN1Y1?=
 =?utf-8?B?YTR3WWxxUWZCTTJwbDYvS2VWYzllNkxZUUdHUC9LSXNWRDNXV0tZdS9EMGxs?=
 =?utf-8?B?SWM4VzRCbVZjNVdSR0hBSlhqR241cEIzWFgwTDIwbk8zOGNPK0w3UnpXb3ZM?=
 =?utf-8?B?azhkU0kyanlsc0dJTUZTaFJWdERtVkp3cS84UmFzT0FERUNjRXM0M0FHN3lS?=
 =?utf-8?B?TjJvNkwxWFFsRk1yOXo4N3VKbElSYkJzRUQ4UTNBMTJJd1NzQk9uWGJnUm5k?=
 =?utf-8?B?UEZsYU41cktabVBjdFU2SUtqTnJRV1QrWURnMDdrc0p5ajhWYVMxK09DYXJM?=
 =?utf-8?B?SElPdkFkZkRNc1V1NFF6SU5JTTFTTzhxZTk1T1NUQVlJZjFRN1lXTnNIcFo1?=
 =?utf-8?B?bXJJU3g2SnU1NENWdzRXNnZXYkprcEFYYitFVE9vTzhKOWNMRTQ3ZFFpd3ZO?=
 =?utf-8?B?N3RHZkg3aFhUUm1GU3dpZkd1RlJrMy9Sd1IycnNpdWliU0t4S0h4dEVNQlhK?=
 =?utf-8?B?VGVsWDdMeTdhSC81RDBreFgyY3F4Z0dvMkV2aVJBL1dmSlplb3g3SlpYZ0Fr?=
 =?utf-8?B?dWxvMU9oTEQzeXh3MS94b3lMV0lkZkNKV29YTk1IdGl4Wlpzb2g1cXBBTHBx?=
 =?utf-8?B?OG5BOEFXV2JYei9yNWlCNWJEMDdIc3Q4VEVHdnovT3NnV3lER05kM1NkN2JC?=
 =?utf-8?B?R0lROUczY2M1cCs0b3IzaGlIOW83YmNFME1zYk1nQUVRN0hSRnRDMk9OV1NV?=
 =?utf-8?B?L3dGQjh0MmphN2JyRnl2Z2xqZTZzZTlhSlhXVVVDTWV6UXpmVHBhWGdkendE?=
 =?utf-8?B?RnFJUmI1M3VFWlU1QzExV01wamxweTd0VVYxaWk2ZTJ3OUJjRytwUEhnTFlV?=
 =?utf-8?Q?0VeHh4U+8UPBA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDNhMXUrU21sUDBmRTFZVTBFek1QTGtlM01NOGk3Nnk4MHg1N1F1WUQ5d1dP?=
 =?utf-8?B?TzVXVVIraW5IdnczUlNwZlZSSXQyc1c0UGtNdm42Y0xtYnUwYzhCbS9YMlli?=
 =?utf-8?B?KzY4TGUrWG8vMWdydDdvK0ZQcGNmQ1h2c1RuWmlZWWtZRld4MnlpYTZmRmVZ?=
 =?utf-8?B?dURaV1d0K00yRjhQWDRIOGVycEs5ZmNyUUF3OGp5MGk1K1dqajhTRm9TdVdG?=
 =?utf-8?B?Rk1aODR1RGtCdnEwM2NaLzJrYjRuVjY2T0IySkNqMWJlUTlzSjNZQ0dnKzFB?=
 =?utf-8?B?OXpKRndzd0Q1c0l1b0pTY1B2Tjh0VER2MWpXNnBYV3BHU0ZtdnEvb3A2WFJr?=
 =?utf-8?B?dGZyWkpTYUdHbmxTWGlVRFlPWURVZTZrUm5xdGxISW1ZbTVmenhiL1JsNnd4?=
 =?utf-8?B?VTdyb3hVK3hWVXBnY080c3lOQ0tSMjYrRkgyUXBJZXFNY0I1QllVVFBYSzRH?=
 =?utf-8?B?Yk8xMjlMMm03ZXBLUmtHWURIMng5VThKWXVTN09zNzZ0dEtKb0g4TVpEQjk3?=
 =?utf-8?B?QnVyRFhKR1RrNzUwN1ArQTczSTEyeitvb29icTV0eDRKSGlIckY0dUJIbGp2?=
 =?utf-8?B?eW5aRUZaa1NERkI2Z0g2ZDZ1TWxrVFlCWkcyUFZLdnVvUWt2VENBdE1SbWlr?=
 =?utf-8?B?Sy8xSk5VSFBvbHNOczROZktlbDdpWFJ5eXhPMXFlK1MwcUNYa1grSmllSFFY?=
 =?utf-8?B?bWdFNS9DK2V0UXpyVnFwUUZOSERnS2RxVWtreEhLUERNR2c1SlJsNkdsVnNB?=
 =?utf-8?B?NEZMckZ2TG1hc0hlUHppSVFUSFlWdmZtbkFlMm5hUVozb2J1L0gwQktwNGxU?=
 =?utf-8?B?ek9WRVQwY1FzUUVzUkE3UHJ1ZnJocENMaUJTRmpLR2ZnVVppMERhUkhDN2ZW?=
 =?utf-8?B?UjBHbElMc0U2V2pzeFpTaEhpSWVQVmhrbHpnc2N2UFRqUmQ3eENpNUxGc2NW?=
 =?utf-8?B?VVltT3JDVlU0Q0owcVBaZzlkdjh2WW5wMmRYZmVNN29XcElnQmRTWkx1M3F2?=
 =?utf-8?B?MHQrbHRobEpNSDA5Wmt1emlIU0RSaURKenpoeDJrRTlhbXJEaWxjY3M1YnE3?=
 =?utf-8?B?SVJ3MjFIVVBVcFhIU2dCa1dvMlVtbkZsYVpIcnIzQ1FEWVhvN2RQSHFRaHhH?=
 =?utf-8?B?aTNTMzlMbmNIbnpqK3JkK1BPeFFKNmUzOG4xc0R0SzN6VnRmQWRqbXl1U05P?=
 =?utf-8?B?WmVxc1Q4bXhERVlXVlpHbTFnMFphc05ncWVsSDB1RkxSNzhNY21QSEtjLyt4?=
 =?utf-8?B?V3hiU1FLUjRJQXdCbmFSOUJpR3R5KzFTQkM5em9HZXRvKysvMjJoT2RvT2lF?=
 =?utf-8?B?eHJiUk5ibHVkYk16NGlIREFscGs4UmhROHVRTnZNQ0tXVkVlS2JRbnVjNkhR?=
 =?utf-8?B?QzNIdHdiTWNrR1NOMWhaLzZQM1JnTGVDYkxhWllwMHhtTHRYdDhSeElaMkd0?=
 =?utf-8?B?cG00cHZYak9PZ3BTaklpcElJbW9QbXVGNU05dkZNRmMxQ2RuNUdFVmtpOXVa?=
 =?utf-8?B?aDZ3YnpmTG1sRUowNVkyMU9OVWt5NUg3OHZ1SVFNWkdFRlpjRDVFbEF2eVpa?=
 =?utf-8?B?RU9EVjNSUUFXOUJjM1JOVE5TZ0c2QzR5eWY3dTVseUYxNlNCQTYrdndMdmdy?=
 =?utf-8?B?WjFkQlV5MFUzamM4NG5tV0FVNUlWb3ZPVmlaV0lZclNQZXdXSHJZVmJCSm02?=
 =?utf-8?B?OHU1eGxjSzA0ZzFuS1BoTFU2ek1sNVZRN3pYNnZMT3VFdXE3UWJYU0Z5UUlM?=
 =?utf-8?B?ZVJHMysxaERBdC9RZmd6MHJmUVdtd1FqUFJFTURKYmRpd3Nnay9vaHZZZEI1?=
 =?utf-8?B?UFhFNzA0ZE43QkdDdi9jWHNKdjZsTGxsV2h3SnVlMzh4Y1YrNEJGSGlBa2Np?=
 =?utf-8?B?eVlDSHp0OXdlVUowaWpzNVIwYVFMSHNpVG1WUkNFQzZGZ3lHV09DcG9FQTdR?=
 =?utf-8?B?eGJEQjJxMkc5cGtyU29KTGVaN2VRbkczMHFzMm5JQTdxUDZCY1RiQitKUmNS?=
 =?utf-8?B?N0hRNVRzQlZzakJRUEs3NDVSaTArUGI2STBpdnRYNzk3VWU1eENXTFZvRGtI?=
 =?utf-8?B?d2xWbC9EWnl2YW96VmxoOW81b3JMU2Vld3FjYjlPY3prcENndk0rbTZMWlk0?=
 =?utf-8?B?c0c4MVRGNFZWUG9UT20xYXMvNlU4MVc5UDB3MXY5UUN1RFZvQmFsNmx3cEFo?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f9d01e-295d-4144-b3b0-08de103b0d1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:44:54.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwQV/LudWz5kA9+j7Y80TxwB3nta5VAb8FDl6YJ/yWzu2xhQ8TsKiQCkWZFW91GLGZ7+iUd0q0FCumMXU9AM3F2dB0rZnBEbCvZILQw49B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

On Mon, Oct 13, 2025 at 01:20:53PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > In upcoming changes the cached buffers are going to be used to read data
> > produced by the GuC. Add a counterpart to flush, which synchronizes the
> > CPU-side of suballocation with the GPU data and propagate the interface
> > to GuC Buffer Cache.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_buf.c |  9 +++++++++
> >  drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
> >  drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sa.h      |  1 +
> >  4 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> > index 502ca3a4ee606..1be26145f0b98 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> > @@ -127,6 +127,15 @@ u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> >  	return xe_sa_bo_gpu_addr(buf.sa);
> >  }
> >  
> > +/**
> > + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> > + * @buf: the &xe_guc_buf to sync
> 
> for convenience, can we return the buf CPU pointer here?
> 
> something that I already had in my initial impl [1]
> 
> [1] https://patchwork.freedesktop.org/patch/619024/?series=139801&rev=1

Will do.

Thanks,
-Michał

> 
> 
> > + */
> > +void xe_guc_buf_sync(const struct xe_guc_buf buf)
> > +{
> > +	xe_sa_bo_sync(buf.sa);
> > +}
> > +
> >  /**
> >   * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> >   * @buf: the &xe_guc_buf to query
> > diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> > index 0d67604d96bdd..fe6b5ffe0d6eb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> > @@ -31,6 +31,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> >  
> >  void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> >  u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> > +void xe_guc_buf_sync(const struct xe_guc_buf buf);
> >  u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> >  u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> > index fedd017d6dd36..2115789c2bfb7 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
> >  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
> >  }
> >  
> > +/**
> > + * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
> > + * @sa_bo: the &drm_suballoc to flush
> > + */
> >  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
> >  {
> >  	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> > @@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
> >  			 drm_suballoc_size(sa_bo));
> >  }
> >  
> > +/**
> > + * xe_sa_bo_sync() - Copy the data from GPU memory to the sub-allocation.
> > + * @sa_bo: the &drm_suballoc to sync
> > + */
> > +void xe_sa_bo_sync(struct drm_suballoc *sa_bo)
> > +{
> > +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> > +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> > +
> > +	if (!sa_manager->bo->vmap.is_iomem)
> > +		return;
> > +
> > +	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
> > +			   drm_suballoc_soffset(sa_bo),
> > +			   drm_suballoc_size(sa_bo));
> > +}
> > +
> >  void xe_sa_bo_free(struct drm_suballoc *sa_bo,
> >  		   struct dma_fence *fence)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> > index 99dbf0eea5402..28fd8bb6450c2 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.h
> > +++ b/drivers/gpu/drm/xe/xe_sa.h
> > @@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> >  }
> >  
> >  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> > +void xe_sa_bo_sync(struct drm_suballoc *sa_bo);
> >  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
> >  
> >  static inline struct xe_sa_manager *
> 
