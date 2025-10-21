Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A1BF429F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2B010E554;
	Tue, 21 Oct 2025 00:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2goLxAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460310E551;
 Tue, 21 Oct 2025 00:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007379; x=1792543379;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YWVKw9ezMm/+vhg12+qA+vr/Wb0Vbtpp9Ov0+pXYuos=;
 b=X2goLxAZYfHW4CB5XB+F3TJx2f8nZX4vikDPRg7S44dRseHkSV1DE11U
 eBgYmXxktu2TKfbg8oWuCtRzty7l5y116bvqRh5YHKNJ/P6DucxEOG1Eb
 Ybw8JrRxw3fZwHG5GH4qc86nXoGMDZtMhC/6JhE8FS6gJH/rmjJvlAFhc
 o3sFHQ4Pp/MCdOHWYwb9diHq95DK1Xmzk1dgrB0NSlM/23MEdUxFUGasF
 ipCyaJa9e1EKov2sts/mTXsV3kXhq/92ekXjs8fIQnCI18kdVfikzgx9B
 6gGk2MIU1qyg18zylxHA3Yv6W5ztSer+RH0imiSHdvBV4MJrMrtZoXH+L g==;
X-CSE-ConnectionGUID: f4H9N6cIR3yfhLmKGExPqA==
X-CSE-MsgGUID: WkfHmI/pS0GDdx7qvro6DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63028250"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63028250"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:42:59 -0700
X-CSE-ConnectionGUID: a6vwb0izS4KrRxlxgQEjfw==
X-CSE-MsgGUID: FzT3NQzSRtWz1ZcGgsx34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="207138577"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:42:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:42:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:42:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk+KEaTKYn0bx3EEVMAadXMa5dRJPnCcHyhnIHDF7tU/5aS+0SMuUKiAA+LtfjBPVPB6x5XN1f33OjDSWhDoLv1Px3lTLYOPhxDdRch7xP6a8ytzWCkSe/9kHVPFeviAvKysycqijeoiWRm9mlhUbjRxAB2+8IbRE+sfAdHinR/ex8DBQof7/GPnZrthJrqWTzpDDKhPXxFtwib5SU56bI3ncwGgTRHgzUiW/fgNkbjeo6DME1eJcHuqthjDT2frYi62Hj7OSnqPQlHxed5C2ZSeTkNjXRYG3hPx1ZmFJbJrgHSPjT+lriqFhuG5D//S3bGFKM3Y8mY1pbkPlv18iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ehrq9Npmvc8YPzca7CK4hqNi/6ZESZU432rQ97uVkE=;
 b=DY9mTTVeEOhw2d4LcROac+WTferRGg1ZgzeAisAdLffG7jZ2TWh23vSR1uJSL0Pfjjakilm5rIEuXVWCd4CVU0DWLZHdKCUod53D0NSXRWMdmU1Rxti8FodIg9lDowMQ4cO1WRLIWYBnOAZ1CUoWk+YVKxT1N2g948FxIHPBw8bq1xIn2U1WSJi72TxUeoGAFPdpVt8a4jul7HmgdsnnqiJ7mkgSmxxsn69uChkXm8Y/xxbT2M4sL8ktOYtJsfghHFCZ5LyOHEOztI69eEZ05uN6LhDH09VzvZW2aopGQl9O9Y0LDs31RpHyE49RzK2jQvpU3GAD6lj0PfQ2oOMQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:42:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:42:50 +0000
Date: Tue, 21 Oct 2025 02:42:46 +0200
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
Subject: Re: [PATCH 09/26] drm/xe/pf: Expose VF migration data size over
 debugfs
Message-ID: <uk7jah7ew2lq4kkkrmafuvx5cjhiqn4veo7fg6mhafl6eujvol@gtyro2fc4rpf>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-10-michal.winiarski@intel.com>
 <d3e0f5df-4c9c-4b8b-8441-71561282c4dd@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3e0f5df-4c9c-4b8b-8441-71561282c4dd@intel.com>
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: efe937fe-129f-4936-19ab-08de103ac327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Szc4Z2pOeVBYeDNVS1N3QVoyZ3dtY0kvTWY1d1RxNWRBZ1hTYkEyUGtsb05u?=
 =?utf-8?B?cFJmTEZpRUJzSHdlWC82aUxKT3dZWHo5K2tJYk85VjNneUhPdkNHQkIwd3VU?=
 =?utf-8?B?c2ZsRXFEUkIzSnlTVnk1RUN0MlBOMVBFSi9rWW9EOGlXdHlaZUFoWlNQdm5C?=
 =?utf-8?B?NVJtZ0MybXZ5a2RIT05UdVVoVUFKNmE1VnBNSGR0OGNaay9mZTB2aExobXdh?=
 =?utf-8?B?ZFlZcHFBRi9Ed0k0R0NrOGpzRnh6RnNyVDhDTzBtQU9vSEk5YzFhbDVHazhL?=
 =?utf-8?B?TnJXNEtUbWVCNStqNDVnbkdSTWxjNVJlVlcrT29DM3RrTEhHMVNBcDhieUE3?=
 =?utf-8?B?NWNHdThKZUxYL3M3VTRHSzhWSDZGWENFM0dlRzBJZHlJUWZ5ZFI2ckpBUU5k?=
 =?utf-8?B?WFVVNC8yR0hPMU1GeTdiVERNOWNpWHRFRlV2VDhmcVdBY05uYWRrVGJIYXRn?=
 =?utf-8?B?eExwR0c0T1A1TlpvL0dJMks0MFJZRllnR1ZyQy9DN3JBelpjSXpJQ1hJTTRy?=
 =?utf-8?B?VmQwaEJjaDFsejNQTXdiOUtYRzJia3pjdkI5OWh4TWs2YmZqZWlXTU1wSnFC?=
 =?utf-8?B?VlZOZS9hNjBmZ1IzZ3didFpsNFhhTWJtQ1dQdjhsRkMvSHZzaktJdHNMNXVG?=
 =?utf-8?B?S1JSVEorVE0vYkJvT0dCK2xpdGRLMTNoNlZWS2I4eDc4WjYxTDNsSC81UHda?=
 =?utf-8?B?RG9KekwwdDViSEF4WVZyQWhEV1A0ZHNpK0tkTXdoOFY0WkNxVGo0cEM2RHJs?=
 =?utf-8?B?ZVAyaGhMek1GZytOcTdhSm1Da2FzaFlkM2RpSk1KRjBVc2VWTmRvQ09RNGFG?=
 =?utf-8?B?bGpxQ2Z0emR2OWgwZG8xRDhJTGY2MWtXUHRyT0plYXdRVm5jQ01YN3gvMitW?=
 =?utf-8?B?cEZyVHZVTFoxMjJveHJjTXNyYXRrTFFIQ2pHWi9YQnFzeFE0WHQ5dnlia3gy?=
 =?utf-8?B?alU3eXFYbWF2U1BGZS9rQVRkT0hIL29mbWRKZEYxaEdTWDgvYWFpWlhVRXFB?=
 =?utf-8?B?eXpCSnpSbUo2V05VU1g5bHlZOEE3V1JubVNuakptWkl4TXBwRGREeGNSeGRx?=
 =?utf-8?B?dXc2SGU3MXp4b1Z4MXRFelRsSXNyYkFoa2pINzAxUGR2VlZQbW9talB0YjVs?=
 =?utf-8?B?U2lmczdyazVyYldKVVB0V0x2dW1nU2x6N09XRVpLaDJqbE9qRFJtVENCbWhM?=
 =?utf-8?B?QkFPeXNOUnBjQmthVFNMdGVnazhVY3lFd0d4VU9JcTVMVG9HclM5VzBCaTlj?=
 =?utf-8?B?MGVlS1F0M0V4SG1JTkRoc29abWVQMGZvWjZTU0grbENycXkvWDRxYTdHZXBE?=
 =?utf-8?B?TlNoU0E3RTlRNjB2MTR5SkhvVFBEd3g4UWRGUU5YUjY1TmxiU2NvTysvVEQ1?=
 =?utf-8?B?c0hrZjR2YmhUTUR0TXhHdGdoSmlORU5ZelpkT0FRbXBuVUVXUngrNzdPTEk5?=
 =?utf-8?B?N0F0a1BqWndLbWJHTWY1RXNpZm1QYTY5NFh0UGhzODI0VnM0KzVGMzVoclNk?=
 =?utf-8?B?dUxZQmRxSlp5bzhCZEhJT292czl2VXcyaWVSZU5sVDVxcUpWV3duQU9OdG43?=
 =?utf-8?B?Sjg0WHlHN2x5VStsRzR5NWs1bTZDMVkwNjN3ditXZ01hdFdYYkF1LzR4YjRj?=
 =?utf-8?B?VEJOdUcvN0dCMGpSbkNXRFZNekJCa0hjVzVObVZiNXB6NWNZY0NNTVpqcmIv?=
 =?utf-8?B?Kzc3YklXOUdhY3FxLyt6em5xYkV3OU5aMWFwZFB5VlIyZkE0NEl2TmpDRGph?=
 =?utf-8?B?T21aYnF0K1BMSjRRS3ZqbEJ5anZVUVJ0dmQwYm9Ob1M5OFViNFMvRGVkYlZU?=
 =?utf-8?B?Q09UbzEyaDBJdjBQWWpXa0lHVDRUdW56dlVENGJkM2lWUXYyakI5ZWZFNkRr?=
 =?utf-8?B?OUxwMXV3QnFDWHRvUldUM2lISk94VkdhOWJIcTJlRmpyVVJLOW5ic2pJSzlw?=
 =?utf-8?Q?UbSfFgLIdoBaU3Tz4m5UVgpTBChXvcxF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFRtVVd1Y3dSa1ZXZzZnRExVWVZRUWRQQVdWRWtJSkk0YThUOCs1SFpVWEVn?=
 =?utf-8?B?OFdMVGxhc1g4WTFNbEFlN2NqN0JJT1BUMlVnUFdRSm9yRU80T2dyRDZ3ZTRn?=
 =?utf-8?B?Z2hHOFkrc3N3QStjNjFVZEFZVGlWL1A0VEkrbWVNRFV1TU92SDlWZmhLREI4?=
 =?utf-8?B?dGdta0lkb01tNldnYkNaL2lteU9VaFNRMlkyT2xOUzFuL2VYcTVqeHhYV2dR?=
 =?utf-8?B?MEhWWXRJUkczQzltaXZyL0FLODJOenJMTWJ0c1JCZ29FdWxjWTJZN2xmdHJ4?=
 =?utf-8?B?aENxb3Qzd1pWZ01wNnhrWHJQK3hQK2pHTEU2V2thQlF5bEpDQjIwY3c1RlBI?=
 =?utf-8?B?WThqWUpTZ0VYOW5oM3hIT28zN0Y2cW1vV1ppQkNDc1ZDcWsxYWFicDRZZVd0?=
 =?utf-8?B?dHVmaDJwakx0QXJFdk95cnpuUndCcHdIaU02MnJyZmUzOEJvL01pY01rdFdD?=
 =?utf-8?B?MXR6aW5WOURhaEx1NXVkU2J3VW1vUkY5bDI5czg3emNjUVZmRjU3ZlQ5S25a?=
 =?utf-8?B?Y2lMbUhURXdpekl6MDJ5VUY5M012T0tzRXlwaE93U2ZEaW4yelE1UHc3WlJV?=
 =?utf-8?B?UlVzUjRVaVY2YWJPQWJwTTRpYkIzbWVXYUtrSFIreVExaFBMNnUvMDBiaGVq?=
 =?utf-8?B?aTg0QVl0ZmgwNjRDbUtPalordldDUGdYclZuMkR0RURJUHhJODFVQ1RUL0lZ?=
 =?utf-8?B?elZYOTVRb04yU1lWWDlhSlkybDRiUkN3ZlZxVVVrSVhEczhRRXdiU2JQa0tZ?=
 =?utf-8?B?MkxQek5hRVFoZ3VadkZZUk05aDRqbmhOYnZ1N3FMV1hIdHp5dnlldTB0dWRj?=
 =?utf-8?B?d3ZSWkw1c3p0UW1Xa09ZZWpPcHVHNlcybFM1MXZYS09WSittL3ZyRVFOL0Jy?=
 =?utf-8?B?RUZCQzI5WGZmUnA1Q0NlRCtPY3VHZDVPUjBHeGIvWmRkeHowQ2RaUldDNHZ1?=
 =?utf-8?B?amxqS3BmTngzcmhtOHB1cFBjbjlmbUcwMXpHdTE5cEFMMVR4NGFndFpIbHg1?=
 =?utf-8?B?Nysyalp3d3FZTXpmSWx3eWRjQ20vMURaQnU4TUttWkVXUm1kUG5BZUZCZHc4?=
 =?utf-8?B?aHJIaFNUUEpaVDF0MGFtdEZvRHpIb3JsVzdVdEpNN0xiRmFNMnhDdHB1L1FM?=
 =?utf-8?B?NW5SbFNVN2hCRCtTNUkvNTNTaWlSeWtWckxqMHl6Y2VvVmRFRWozMnd0aHpl?=
 =?utf-8?B?QWhMa3hnUThtOFFDTjR4YzJjWXhlNVpaM3NXU2tqdExBUUNtZWxiQkp0NmtB?=
 =?utf-8?B?TXExTVF1Y0tKQ25RM2lsZi9IdThQb0JoVTRweERJSXRPQjQrd0xwQ0I4WEdD?=
 =?utf-8?B?K2dsU0NReWVtcVg2aHk3ZzRVcFR6U1NHUTM3ZWx5SXhnaThxUE5La0tXeGxu?=
 =?utf-8?B?UU8zVWxENWlaQThEalovOXlxanFPcEJRcEl6WnNwWDBOQWk0aklMLzZ6aDNi?=
 =?utf-8?B?c2swbzJSMTBHNFJYaGVzaTFhRWJ5dDBZUUZseHBkRzdLOHZGRVczZjZFNmVS?=
 =?utf-8?B?UVhqSFF5Q3JLRm5HZEkydWRKQUtMeWJSQUg4cEJjSU1Wc3QrQ05menZraUhK?=
 =?utf-8?B?UElDbTVhekJPeDh4R3FId2RQcVVYZEYxSlBwRUFDV3pXSlc2VVJSRGNxMDZk?=
 =?utf-8?B?ZWFwVy81aC85SCs0NTM3QmF1SXFaZ3l3cXhVWnd6aGpqa3FFUVdLY0lYVnpp?=
 =?utf-8?B?WTZzZFNQZ2JMRHpjb0t6aVYxQWhJWVJRekNLMTJ1bmxFUjJ0QWIrVWtaQjd5?=
 =?utf-8?B?Zk8reDRqcnVIY0xXMXlRMFBWZytTZmxwT1BpcUFOQzNpMHVxZ2xGVFlwNFRl?=
 =?utf-8?B?VWN3ajZpbjJuMWp3UW0xakF1VkpIZHhBTlhzb3RJalpvZURkNlQ3TFRGalEv?=
 =?utf-8?B?Z1lwWS9MNzh1bUJWbFZXVjE4NUdLelMrOERnaTRDTkN6dEZ3bXJ4UVF1bC84?=
 =?utf-8?B?U3RkNEViR0FWaDJZb3Y0emhtdkVGK2xET1l0MGl3REx0NVVjSGdPY1lvWFkr?=
 =?utf-8?B?d2Z5RVpTbjNyNDUrd0t3UHBjeEd5ZjQrc1MxbGNoemxEK2lNZDdRM2Q0S2oy?=
 =?utf-8?B?dWJzWXRjU0NPdE9Ed25Sa1B3d2FoV2hiWW9XQ2FwOXJZQ05ySTlWRVRuUHN4?=
 =?utf-8?B?cDlJNHlZTFp0dlh2NDFNWmtsWFFvbGhYNUpoN3dRV3hJQUFRTnVpUGFEam5J?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efe937fe-129f-4936-19ab-08de103ac327
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:42:50.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OJkB5gNeDHO0GYdcqM21t9Cjq4Sm9ymWng0IEyLLnJb756IO9Yz9SLaeQ6iWv91Qm00uh5tDPcbRQOZmtqGn8txbgNzgC9GNfBv59WhfD4=
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

On Mon, Oct 13, 2025 at 01:04:22PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > The size is normally used to make a decision on when to stop the device
> > (mainly when it's in a pre_copy state).
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 18 ++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 34 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
> >  5 files changed, 85 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 582aaf062cbd4..50f09994e2854 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -395,6 +395,24 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: total migration data size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	ssize_t total = 0;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +
> 
> as this is so trivial now, maybe add some note why it is like that for now

Ok.

> 
> > +	return total;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
> >   * @gt: the &struct xe_gt
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 1e4dc46413823..e5298d35d7d7e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  
> > +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> > +
> >  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_pf_migration_data *data);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > index ce780719760a6..b06e893fe54cf 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > @@ -13,6 +13,7 @@
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_debugfs.h"
> >  #include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_sriov_printk.h"
> > @@ -203,6 +204,38 @@ static const struct file_operations data_vf_fops = {
> >  	.llseek		= default_llseek,
> >  };
> >  
> > +static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
> > +{
> > +	struct dentry *dent = file_dentry(file);
> > +	struct dentry *vfdentry = dent->d_parent;
> > +	struct dentry *migration_dentry = vfdentry->d_parent;
> > +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> > +	struct xe_device *xe = migration_dentry->d_inode->i_private;
> 
> use helpers

Ok.

> 
> > +	char buf[21];
> > +	ssize_t ret;
> > +	int len;
> > +
> > +	xe_assert(xe, vfid);
> > +	xe_sriov_pf_assert_vfid(xe, vfid);
> 
> it doesn't matter for this function, so why assert here?

I'll drop it.

> 
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_migration_size(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
> > +
> > +	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
> > +}
> > +
> > +static const struct file_operations size_vf_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= simple_open,
> > +	.read		= size_read,
> > +	.llseek		= default_llseek,
> > +};
> > +
> >  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  {
> >  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> > @@ -212,6 +245,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> >  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> >  	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> > +	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
> >  }
> >  
> >  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index a0cfac456ba0b..6b247581dec65 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -249,3 +249,33 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> >  
> >  	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
> >  }
> > +
> > +/**
> > + * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
> > + * @xe: the &struct xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: total migration data size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	size_t size = 0;
> > +	struct xe_gt *gt;
> > +	ssize_t ret;
> > +	u8 gt_id;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
> > +		if (ret < 0) {
> > +			size = ret;
> > +			break;
> 
> just:
> 			return ret;

Ok.

Thanks,
-Michał

> > +		}
> > +		size += ret;
> > +	}
> > +
> > +	return size;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index f2020ba19c2da..887ea3e9632bd 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -14,6 +14,7 @@ struct xe_device;
> >  #ifdef CONFIG_PCI_IOV
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
> >  struct xe_sriov_pf_migration_data *
> >  xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
> >  int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> 
