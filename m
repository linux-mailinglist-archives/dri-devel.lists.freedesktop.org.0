Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F4C22456
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B7A10EA71;
	Thu, 30 Oct 2025 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7tLN+ZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921F510EA5E;
 Thu, 30 Oct 2025 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856397; x=1793392397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v6xbXWD0KzEjibPG+13xoyiQBUmIoDH8KXr3RNZV/4w=;
 b=B7tLN+ZYqJ1OF3ZxCyyHtpJFOHEsaz+UstZ3KWEkH7Lqhp3Kq/xHx9eN
 wSWZdC6eTCNFqkjosbo8BXiAx3CgMc3lGifvSPKXnH0QT0L2FyhFG8ULW
 5jFHRy9VJcS2gLq9tpn+9d0VDJcE4K5kttl6VxNpLRNyhPrCZVZjrjv1p
 cogBCU8R+Nt2ORdSf6RtV8AL63B6hutxyMposU5niHtEuCgRQCia6qQHe
 wrRdDoApd1GtqPlRIPhU2ZJgCRQAVZSpBtyk5KiDRQ78405Qgy7kazOW9
 Oq3VsuqFFHG9eb68TxloWVWlDjq5ss2WtOnu8Cu9vMZWFMIpFbqodZrKM g==;
X-CSE-ConnectionGUID: U0VPxnycRFyiE7g9Qgngqw==
X-CSE-MsgGUID: ZvAPP4eqS16vHkUsSxVqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81426810"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="81426810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:16 -0700
X-CSE-ConnectionGUID: 64JvrQqNQriG1k47KE5tpA==
X-CSE-MsgGUID: 3SGmOx58Q7e+MLQNq8b9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186791338"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:14 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5TIm+/JMG9SF6pC6JvkkQL8JgeeQLuWz4g2idKOo3Qg6R3i2ZPFAepPLJ/Ko1TmsA0kvUb8Y32auO4UlsYSKSArStlkrH5CtdNy0JNOLAdTyY7mtur/QAod4bJ2071B1JNBmamE50MgXS2LCohEcf+dtMLFYrMbEe31AU3BTfYDgny+WeT9EUlicCJoemSg+IhVx0VX7RgY4J59XTcllROFGRoRjKW8BQ+TgdkMGX5V3A1mFjhM4UQkFSpJNbtAcLsvnTSxy0O03ed4wQzUw5WPqhU5dv1QK3rVtUvlIHs1NA0+W85foNeTLp41PYavABq1Vxh1Yf1IuKdqTb4JlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA1fY9NdE+F8WVHOawUzkrjr9Q5+YoFpRU2NG8a3z8s=;
 b=tWua4EGHMLhuDvmwFxayysqgYj1nZtezTn5pqHvVHF2iixyHsEMHwvIS8C0vgeBVlqQGSOv8yrhGynLIjjIEvIHsHhPskA1Fy/BtnPT2q2Qn5bk34CVr12Sn9CbV6wd0WwArD6YbMoXY3DowKQGs5FWxQiVIk2t+0Z11O4spAZqyOTXJb4Jt4AVugE90cWCULoRUf4pODj0wba+Rcdy20ATFRaP8dhnz2MajDvAN93uDc++JZxRxvqPploaoNgx4dd0AtBrn8lxVFPFpjUJZjIu7KgvoTcxSXHms9AbCEv6zpLBBi1FcGAtxo9zNcMWR4bxo0APGw0S5xcVCV0FF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:12 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 15/28] drm/xe/pf: Switch VF migration GuC save/restore to
 struct migration data
Date: Thu, 30 Oct 2025 21:31:22 +0100
Message-ID: <20251030203135.337696-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0064.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: fd875de4-e27d-40f9-d0cb-08de17f38bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1N5SzdUM1UzYlRvRklWcGFZQkxqdEM1N0NOS2JiemY4enlWeHlRWGdqdFB5?=
 =?utf-8?B?N2VNQzVqVXZ5UFhzRmhHNDkvTGFRaWlWYy9IcENrLzErY21JUDJBZHRDVUhl?=
 =?utf-8?B?VERiQnlJUVppR0xhV3V2alBvRWE3MjhTUFpQT3JSZENoYU05K1dIekdudVVi?=
 =?utf-8?B?cXJBU3V2RGFqVUxpT1AwT0tuYXBvbFJZSW1aV2pKVGJKcGZvR0h6MEVkMW1k?=
 =?utf-8?B?TE1VUHNNUmJwand5UUoxUnUrSXVINTNnUGcwdUhWclB6Y3NDRmhvMWR5NW92?=
 =?utf-8?B?L2hzWFdDa1B4bVhKcUEzNUFJVDAzekJQRmpEWnJTRnZrbGM5R3dpcis5c2ZG?=
 =?utf-8?B?NTBSN09idGs5Zm5jSE50NEdETm0zN0tpVDlzamNEUFNUSFZLWE1BMzRiUWtI?=
 =?utf-8?B?T1IxbU4rZ2wyNTVSOFQ2RkxqbXJYZHRSaWlWU3h3dkNuZmJhRUFsanRuVFhW?=
 =?utf-8?B?OVBaVTVoTXZjZUtFSXd3QndtcXY2dkxsNjNpNUVmMDNMWFBLOWxPV2Y3RzhR?=
 =?utf-8?B?WjU2dk9yVEh3U0JZUEdEais5aW9xM2Y0TGZGYWV4TVlYQm5ydDE2cVFkNUth?=
 =?utf-8?B?TDN3TE5mN3NNVllyNFBlMGhwSUM1ai93dTJzV1FuOWNQK2Zzck1iZmZRU0Nk?=
 =?utf-8?B?S1lKc2VWWkhXRzgzVWg5aG5lWGdEaFhKNW9oZ0t1QzBySWQ2ZFN6TDFpWU1i?=
 =?utf-8?B?Z3BURGhDV2dVR1NiRkpSN2paRzIwSkdsZzh6d3F3b0ZWaW5tSHJaU0pXL0dX?=
 =?utf-8?B?WURYNTlFNkZyTjhIRUVES3doaDdhLytLRGxpWTBLUEY4V3JiZ0NoNWVvUnJv?=
 =?utf-8?B?cUpETVAxcFlVRHg4QklmNXExSEZ2Ylg4L0UzVUs0bEsyTmxaVTlXMkhtMVEw?=
 =?utf-8?B?dys5SFROZkNXaVliY0NydzdqSmU3OHlkT2NPTG16OUlSSlhGZXhveUN5Vzg1?=
 =?utf-8?B?aHRLcGFlZk93V1BZTGY1RStjYzZlUW1tZ1JtSUJlbS9xeGFoczNoaDUvTGRh?=
 =?utf-8?B?V1hkMGxmT095TDF4cmgrajhpZ1h6ZHdzZFVQUlQ5UTNvU2VQWmpXdmJSY0VS?=
 =?utf-8?B?UTBZZUNCbWsyMlJGTGdoeUQrc0tWeEs5eCtDZXUxZlhoV3VNa1RpOVBUNG8y?=
 =?utf-8?B?R212MldBVmpXSDN0Zm1BN1NBTjFHeWpoRjc3cDZ3Rzd1UEpQeWN3SzVKS1NE?=
 =?utf-8?B?QnRwN2V4UUVRd3diUXBxQVNtTzl2NENqRml5NElpYU9IOUxPN09OK2hzMlZk?=
 =?utf-8?B?U3hQRit6SE4yOThCOHdyTTEwNU1yaHhDRkgzR2J1ZDJQdktUZ0tONklucGdo?=
 =?utf-8?B?b2JaSS9zcVBJd2ZZMFJwMFB6YWF2ODQ2VHV4YUIzSVpmYTBybmpZMWNpWW9p?=
 =?utf-8?B?SEdmYkdkNjFiK3R1OHgzbzBsOTFMWm53N3llN09PbmdUeFUyelVTZHUwQS9Y?=
 =?utf-8?B?Yk9OWDhRN1NPbHhWQ25ac25LN3d6Rk5wNldaR2laVkVIdmFyOTRlOUVOeEN4?=
 =?utf-8?B?clkxNU9KSnhTOElnand6cWdCdTZ0YVBOTzN0ZFZOKzc2a25YNWdqUnpHTUgx?=
 =?utf-8?B?MmtqZHMvTjg4UXltZlg2N1hwWWFidzZyVENLS2JmN2tVb1BHTExRTWREcUgy?=
 =?utf-8?B?eWErS2xDaVkrU2w5ZGtMNW5uYVQxSHhVTC9kVklkUnIyWWRtNmQyazk3SEpS?=
 =?utf-8?B?bmZuWStRN3RuM0RBM0gyTEtMd2FKcVpiZzlDYVVGSnZrVkcwS1gyNVRmMHJL?=
 =?utf-8?B?NGpoeGcvdS9wc1ZjMmV5R3RVeUllZkpvY0NIeEdGS3lubllIWlpQdnFrMlhS?=
 =?utf-8?B?RUxXUFpramE3RTFReWorbG11TDd3cytqMWRLbExjWFZEbnBTZU1ITy9FVGlU?=
 =?utf-8?B?ZTJ6TVRVYlQ4WVpRU1E5K1d6dWtwd2NoZytNb0c0Uk9oSmkySlFUWk1aMGti?=
 =?utf-8?B?dUdxdHNzTzZla1pDclVRN1A1MGVqYm1jNUphQitiQ3dqYnVTVGVKVHducXcv?=
 =?utf-8?Q?YiOh9LW4v4pguM5dnh31y5I7N5iZSs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1lxY2Nrc2lwdC9sTW5nUzFrNUErUXRuYi9zR0VjU1Bta1grRkw1TXhxQTBT?=
 =?utf-8?B?ZXdXZ1ZLaWtRQ1BwcFFKMnliSVZ2Z0VHK3psSmh5U1BBand6WDVOUE1idFZ1?=
 =?utf-8?B?dDlxbEdPMElRVzlWdjBNMnRXcVpPMkpxS0tKbUpRRjMxMExGOVRRVDJzeWww?=
 =?utf-8?B?czNTN3JiOUFhUUlQYkYwUWJhOUZKZVJSUVE5dzN5UitWWjZVcXdBYWRmQmI5?=
 =?utf-8?B?Q3V3a0I0bE9XQ2YzT1JQUWg4U1NaczZIYVFHOXR3WWE2N2ROTjZDcUxBYmV5?=
 =?utf-8?B?U3ozQU04d2JIdzMvOUd5QVVTc2VXVjl6eUJiYzIvN0o5c0Z1N2VmRUlGVVhk?=
 =?utf-8?B?ODE1dFBEUnRRandkZXUveUJ3aW5jL1I1TlRIeC9kL2tqK1dqWFR3VUZMc1Nw?=
 =?utf-8?B?SGIyU0VEQktVLytaSGw2cThhL2JYQWdkNFk4RWVWYVoyTHRQd2tZZVBJSjJo?=
 =?utf-8?B?Y284NjlPb3g5TG5lMFhielE1OExDVjdxcUl0ZXhHQmtqV0YyZHoyVDlpVkVm?=
 =?utf-8?B?Y241UVBCcjZKZHkwR3BBbThMQm92bnNZbTIrY2FuRjVxQXZIZVFqUEZqa2x5?=
 =?utf-8?B?YlZSRDN3WDBWZEVLT0REbEM1WGo0S1BSSDZxTnFPcytwT3o0b2ljVkI4R3hr?=
 =?utf-8?B?WFlSb2c3MFhmODVQSTQ0S3ZreWY3T0k1ZTN2S0F4NjY1Vk5GWHZiTGhuNkJL?=
 =?utf-8?B?enU3cnVsZ2h5V0pHR1NpU0ZTWEd1TThnNkI3TGhwdlF2TmN3T2VCZDB2OGtp?=
 =?utf-8?B?QlJYNDJ5czVwNTJJRnpkU3RPSVY4VUxoQXVmNSthQnRpeWZYbkd3Y3FSbXFl?=
 =?utf-8?B?YWdLb2xKY0p1clp1Mng1UVdyRzFnN2szS3V1UWorUWNRTjc0UDd5TE1zWE4x?=
 =?utf-8?B?N2tFcGVyeWY2M1FKeWRRU3doWW9URDltRnM0SVFGaCsrazd0ZmUvY1Z4anRV?=
 =?utf-8?B?Q3p3TE9kOElHNElaVTVVd3FLbGRRdUdIaHJHNFNtRi9yV1dkMVVRUDNQMlda?=
 =?utf-8?B?SHZjWjNWVENLb25Va0tweGVadnhlaDEwOUNaOTNOUDE1R3Rud096cjlObGFZ?=
 =?utf-8?B?VjZ1K1ZYUGxtRklGVXBVbDdscHNxb0FibzRuTldwVGVldmVmRnJzcm9lVC96?=
 =?utf-8?B?bVpxUFk4WWM0bnlBN2pUSDRvUlBtdzI2UGt3WjdiYWRBaHJKb1NrMk5pZ3I1?=
 =?utf-8?B?TnlqSjFpYVhxVDhxL2lvVHNDelJqaGw1K3d4aUNvM0VneDR0WHdKanJIeCs2?=
 =?utf-8?B?R3liL3RPQkVTN3IwWlVzZEE3SWt2KzF1U3Z6YWxvak5QSE1ya0VkRjVTZXdK?=
 =?utf-8?B?dWhjaG1SZHZPdWJXeTNFYlJtd2hZZDZoN2RqaXM4ZE5rVUd1RHdpNmdnb3RR?=
 =?utf-8?B?UTlvYU5pNVZ5WmczOERlb3VrL1N5Mmk2Y1VTa3k3NythTWEyb2Y0VjVsMFFJ?=
 =?utf-8?B?YkNtYmd0dExFVjVkTGtOc0VNeHhrQm5BUzRhL2lUYk1zZE4xaG10VmttK3JQ?=
 =?utf-8?B?RE9BMnRZTjV6ek5MVlJLa0NwQyt3QkMvVjV3OXkvU05SZ0IvSWpLMlBpb0hx?=
 =?utf-8?B?RzVyUGo3VWVvT2Y2NmdWU1Vnb29CWWtJcnJjM2dZcUY1UnNOTU5WWnB4Nlpy?=
 =?utf-8?B?YXRDQkNxRlBFVmhUczRFaDFhS1NFamkrMFA2ZjZLMVMzYWgxVzlRa0dwUXBp?=
 =?utf-8?B?RkE0M2g2a3lleDhPL1ZuV0ZDWVNnY1FUT2xqS2pIYVR5NDBPUFllbDhUM1dG?=
 =?utf-8?B?RFpma0NHdWE2djZ0ZmdIVmxScjd2Y1hXM00wNW5mNFJzTHE1MHJSbGxiTytZ?=
 =?utf-8?B?SXhvdWxPZXcvTng2YXRlZ0JCb255L3prT2p2SEpPU1R4MStsK3FQODdYRHVS?=
 =?utf-8?B?eW9tNFZEcUlWanR2dzl1eTRkdDdCeHRSQnBLeW9WZUM0aHhsY0R4aDdRaUp5?=
 =?utf-8?B?RFlOKzFPUjhDamE4UHh1ZXZGV0c4d3pEUWRjODZDTVJBNFpQQzBaSmhMN3lm?=
 =?utf-8?B?UzNrYkFMTE9relRIMnFNQVdtbUx0S0xNVC9BNUZ1VXJhQ0Yzdml2M2dDNXNj?=
 =?utf-8?B?L0JuK3hBZHJpVit3SEJ3V0VvNGVEVlRSUGdkZlVsTU5uR1BuZWVFVS9Bdnk3?=
 =?utf-8?B?ck13eVhQVFlwck1LZThWZURRQjFUeFNPMEtLOTRSVWFrUE90REZ6Wk9kQ0VD?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd875de4-e27d-40f9-d0cb-08de17f38bb1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:12.4018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q33GqEXiGs4OzzjIMwRihNYXDJyLJqxoQ9T+zmowHBuPF0SIgfRxuTMtl4LM/vik7xnlGlqogcsyoNYhG9+jd0inlPa/4RhfFrrUWBldIaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Now that the data is decoupled from both guc_state debugfs and PAUSE
state, we can safely remove the struct xe_gt_sriov_state_snapshot and
modify the GuC save/restore functions to operate on struct
xe_sriov_migration_data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 265 +++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  13 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  27 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   4 -
 4 files changed, 79 insertions(+), 230 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index a2db127982638..4a716e0a29fe4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -28,6 +28,17 @@ static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt,
 	return &gt->sriov.pf.vfs[vfid].migration;
 }
 
+static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
+			     struct xe_sriov_migration_data *data)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		print_hex_dump_bytes("mig_hdr:  ", DUMP_PREFIX_OFFSET,
+				     &data->hdr, sizeof(data->hdr));
+		print_hex_dump_bytes("mig_data: ", DUMP_PREFIX_OFFSET,
+				     data->vaddr, min(SZ_64, data->size));
+	}
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -47,7 +58,7 @@ static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 }
 
 /* Return: size of the state in dwords or a negative error code on failure */
-static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
+static int pf_send_guc_query_vf_mig_data_size(struct xe_gt *gt, unsigned int vfid)
 {
 	int ret;
 
@@ -56,8 +67,8 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 }
 
 /* Return: number of state dwords saved or a negative error code on failure */
-static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *dst, size_t size)
+static int pf_send_guc_save_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -85,8 +96,8 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
-static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *src, size_t size)
+static int pf_send_guc_restore_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					   const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -114,120 +125,67 @@ static bool pf_migration_supported(struct xe_gt *gt)
 	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
-static struct mutex *pf_migration_mutex(struct xe_gt *gt)
+static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return &gt->sriov.pf.migration.snapshot_lock;
-}
-
-static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
-							      unsigned int vfid)
-{
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-	lockdep_assert_held(pf_migration_mutex(gt));
-
-	return &gt->sriov.pf.vfs[vfid].snapshot;
-}
-
-static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
-}
-
-static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drmm_kfree(&xe->drm, snapshot->guc.buff);
-	snapshot->guc.buff = NULL;
-	snapshot->guc.size = 0;
-}
-
-static int pf_alloc_guc_state(struct xe_gt *gt,
-			      struct xe_gt_sriov_state_snapshot *snapshot,
-			      size_t size)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	void *p;
-
-	pf_free_guc_state(gt, snapshot);
-
-	if (!size)
-		return -ENODATA;
-
-	if (size % sizeof(u32))
-		return -EINVAL;
-
-	if (size > SZ_2M)
-		return -EFBIG;
-
-	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-
-	snapshot->guc.buff = p;
-	snapshot->guc.size = size;
-	return 0;
-}
-
-static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		unsigned int vfid __maybe_unused = pf_snapshot_index(gt, snapshot);
-
-		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
-					vfid, snapshot->guc.size / sizeof(u32));
-		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
-				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
-	}
-}
-
-static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	struct xe_sriov_migration_data *data;
 	size_t size;
 	int ret;
 
-	ret = pf_send_guc_query_vf_state_size(gt, vfid);
+	ret = pf_send_guc_query_vf_mig_data_size(gt, vfid);
 	if (ret < 0)
 		goto fail;
+
 	size = ret * sizeof(u32);
-	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
 
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (ret < 0)
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data) {
+		ret = -ENOMEM;
 		goto fail;
+	}
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_GUC, 0, size);
+	if (ret)
+		goto fail_free;
 
-	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
+	ret = pf_send_guc_save_vf_mig_data(gt, vfid, data->vaddr, size);
 	if (ret < 0)
-		goto fail;
+		goto fail_free;
 	size = ret * sizeof(u32);
 	xe_gt_assert(gt, size);
-	xe_gt_assert(gt, size <= snapshot->guc.size);
-	snapshot->guc.size = size;
+	xe_gt_assert(gt, size <= data->size);
+	data->size = size;
+	data->remaining = size;
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u GuC data save (%zu bytes)\n", vfid, size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail_free;
 
-	pf_dump_guc_state(gt, snapshot);
 	return 0;
 
+fail_free:
+	xe_sriov_migration_data_free(data);
 fail:
-	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
-	pf_free_guc_state(gt, snapshot);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
+ * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
  * This function is for PF only.
  *
- * Return: 0 on success or a negative error code on failure.
+ * Return: size in bytes or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
-	int err;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
@@ -236,37 +194,15 @@ int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	err = pf_save_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return err;
-}
-
-static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
-	int ret;
-
-	if (!snapshot->guc.size)
-		return -ENODATA;
-
-	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
-				snapshot->guc.size / sizeof(u32), vfid);
-	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
-	if (ret < 0)
-		goto fail;
-
-	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
-	return 0;
+	size = pf_send_guc_query_vf_mig_data_size(gt, vfid);
+	if (size >= 0)
+		size *= sizeof(u32);
 
-fail:
-	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
-	return ret;
+	return size;
 }
 
 /**
- * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_save() - Save VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
@@ -274,10 +210,8 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid)
 {
-	int ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -285,75 +219,43 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	ret = pf_restore_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_save_vf_guc_mig_data(gt, vfid);
 }
 
-#ifdef CONFIG_DEBUG_FS
-/**
- * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- * @buf: the user space buffer to read to
- * @count: the maximum number of bytes to read
- * @pos: the current position in the buffer
- *
- * This function is for PF only.
- *
- * This function reads up to @count bytes from the saved VF GuC state buffer
- * at offset @pos into the user space address starting at @buf.
- *
- * Return: the number of bytes read or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos)
+static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
+				   struct xe_sriov_migration_data *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	ssize_t ret;
+	int ret;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, data->size);
 
-	if (!pf_migration_supported(gt))
-		return -ENOPKG;
+	xe_gt_sriov_dbg_verbose(gt, "VF%u GuC data restore (%llu bytes)\n", vfid, data->size);
+	pf_dump_mig_data(gt, vfid, data);
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	if (snapshot->guc.size)
-		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
-					      snapshot->guc.size);
-	else
-		ret = -ENODATA;
-	mutex_unlock(pf_migration_mutex(gt));
+	ret = pf_send_guc_restore_vf_mig_data(gt, vfid, data->vaddr, data->size);
+	if (ret < 0)
+		goto fail;
+
+	return 0;
 
+fail:
+	xe_gt_sriov_err(gt, "Failed to restore VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_restore() - Restore VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
- * @buf: the user space buffer with GuC VF state
- * @size: the size of GuC VF state (in bytes)
  *
  * This function is for PF only.
  *
- * This function reads @size bytes of the VF GuC state stored at user space
- * address @buf and writes it into a internal VF state buffer.
- *
- * Return: the number of bytes used or a negative error code on failure.
+ * Return: 0 on success or a negative error code on failure.
  */
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t size)
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_migration_data *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	loff_t pos = 0;
-	ssize_t ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -361,21 +263,8 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (!ret) {
-		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
-		if (ret < 0)
-			pf_free_guc_state(gt, snapshot);
-		else
-			pf_dump_guc_state(gt, snapshot);
-	}
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_restore_vf_guc_state(gt, vfid, data);
 }
-#endif /* CONFIG_DEBUG_FS */
 
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
@@ -599,10 +488,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (!pf_migration_supported(gt))
 		return 0;
 
-	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
-	if (err)
-		return err;
-
 	totalvfs = xe_sriov_pf_get_totalvfs(xe);
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 4f2f2783339c3..b3c18e369df79 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,8 +15,10 @@ struct xe_sriov_migration_data;
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
@@ -34,11 +36,4 @@ int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid
 struct xe_sriov_migration_data *
 xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
 
-#ifdef CONFIG_DEBUG_FS
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos);
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t count);
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 84be6fac16c8b..75d8b94cbbefb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -6,24 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
-#include <linux/mutex.h>
 #include <linux/ptr_ring.h>
-#include <linux/types.h>
-
-/**
- * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
- *
- * Used by the PF driver to maintain per-VF migration data.
- */
-struct xe_gt_sriov_state_snapshot {
-	/** @guc: GuC VF state snapshot */
-	struct {
-		/** @guc.buff: buffer with the VF state */
-		u32 *buff;
-		/** @guc.size: size of the buffer (must be dwords aligned) */
-		u32 size;
-	} guc;
-};
 
 /**
  * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
@@ -35,14 +18,4 @@ struct xe_gt_sriov_migration_data {
 	struct ptr_ring ring;
 };
 
-/**
- * struct xe_gt_sriov_pf_migration - GT-level data.
- *
- * Used by the PF driver to maintain non-VF specific per-GT data.
- */
-struct xe_gt_sriov_pf_migration {
-	/** @snapshot_lock: protects all VFs snapshots */
-	struct mutex snapshot_lock;
-};
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 812e74d3f8f80..667b8310478d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -31,9 +31,6 @@ struct xe_gt_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
 
-	/** @snapshot: snapshot of the VF state data */
-	struct xe_gt_sriov_state_snapshot snapshot;
-
 	/** @migration: per-VF migration data. */
 	struct xe_gt_sriov_migration_data migration;
 };
@@ -61,7 +58,6 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-	struct xe_gt_sriov_pf_migration migration;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
 };
-- 
2.50.1

