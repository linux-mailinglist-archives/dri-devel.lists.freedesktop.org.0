Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q0qvGa2AqmkMSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4221C5D7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1010E39B;
	Fri,  6 Mar 2026 07:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsz7iOXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3340810E387;
 Fri,  6 Mar 2026 07:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772781733; x=1804317733;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3vk2KdnXFvAJwSikdDrPDZhFedgKu1rtGkUP+Gn/djs=;
 b=lsz7iOXyjrdoJ5Df3E9POasw7PNS788StlMIWF3orEiGCZHltqqIzhH/
 /tII3MuqOxW0bpT0+zs6xJtWangps/DiqXR7cEOhLqW4DTdHe7XBIY84j
 gfDnobOSl8Zzl4N+eFMo1blDv6L2lnmi0EbuEpNVbbOhOOFJqOGI0Rx/R
 lM/MIcfhrbnpn9AJG44R7diulFwSFLa7THcqly2EKwwfJRPzrNQynLIYd
 whdj7/Uzvc84rwABjImkbTNCJ/OXczUjo57ifhD7/QWRyKvRRKoTMnBQ1
 ZDZg0ARAX9GMNmBypriHAj/miWGYRWymtVc0OR0Jlftx7C97Ibt/a9t4J Q==;
X-CSE-ConnectionGUID: UlgHF8X1SeWgO52vhuL04A==
X-CSE-MsgGUID: IHTeGB4VR1asUVB6+2nnHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73932199"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73932199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:22:12 -0800
X-CSE-ConnectionGUID: hZR67rEvST2x98/0C/AJ0w==
X-CSE-MsgGUID: sPrb43HIStShIU/TIx5EOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218075492"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:22:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 23:22:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 23:22:10 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 23:22:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6TqcZezgX0nAxL4Im9kAkXEkM9kPffX7t6bRj1xZopokbyP2hMjUk1XCiTNgZhg9C+zOFc5rWoq9AFv3xrjwEY8nRgoPDIyMEiQfuIQ9n3TtIe0k6kY3j7GdejzUiocTeWUu6fYWiHeBFp+5GrWlDKlTr/EQYd+vPLnPoAIGOsYeVE5xOe0M811KygiltA9UVZyF/w4eog0golYYBMs07b+mWmLl0Fpy6XEchMPJ4/W8mAvF+j4ixA96GTVeVF+srPV7+wPWFCE5jx53BNcYrj+MG8HqPqB1qAZVwqougqVhTHqxuyDK05ERqou5FYiDZh2Ddc0ikK2cUyDvEynrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KIlBIKMxSEOrCM9nqsFLLoUc4b/OecdqDFbjmIEjyA=;
 b=KA/oVnF28nBzgSWj2ZOAGyEGvd9JuhHcGq0+nuFY1UI+uQ0vAkeOHR85tX5GbC/rZItviRUjuEnw2geW9cNmnKVtwxJTILIq6E2QSLnhRCpbjgZhGWgIdxXUPx7rtiNHE0DpQGwls5mOV2iV5mOEy5U/lF40qxRNKxMlXmU3H8893IxtR4mXU65SVf4KwHpadjPb4chCwMAjxIWl4LUpI9hRvRDGer0gJJnYNnx8pATpyK92HRzuHtIXH00JC3FksxRlqiAJQJguxXkgkFhPeXosyJKNbJmwHK+bXr1NHZiYvJfs9GmMe4RCYRHNhZ6Lk+9ymNF0sKNSPeaesN8I5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 07:22:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 07:22:02 +0000
Date: Thu, 5 Mar 2026 23:21:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Steven
 Price" <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <aaqAlz801OuZXh2y@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
 <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com>
 <20260305115201.6fb044f0@fedora>
 <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
 <CAPaKu7SXsCv=G+O38unCsdrUNeeOmbopRdBpjqP+Qxp+EP9JtA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPaKu7SXsCv=G+O38unCsdrUNeeOmbopRdBpjqP+Qxp+EP9JtA@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 916f5e7e-73b5-4618-2384-08de7b510fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: +OMRaAlAx98UhOXlpjS9IvqoIfcaT6IIKmKf0/ytemnSkS9kPjrUJhO1v/sFho0HDfzebIaAN6rLsSTX6QfPIKLzA9lWIvHMnrl5ZyKS42oXmarL6QIQtjGmg+CnNOcJO64ocCHzDW/o4F5WubeuLhKNdvk9rvt4qQHuej+ziVUZ1ifdJ8K9EH6ibSo55difxtsK0nK3t3CSXP+ePjdYETmqdqT0eGGnHu4jLPqglhqCCSHmwQZLn2HY6aCfRjvJ9rs3uSAkUmtCTqe3qTY9/m34OHKQLsqpwljXdGR3RLwFVyfDSHaW7aoHgH6OGp0IAY0XzNzkuBwWe222ZWkItiztIqTDP+nbJOA0sGmWOpuAvfc+Jk4Domjw8pvvXKwnRm+cMEAKw1EzVRx41EXBbIxFlm8nS5gx+kNFKyd1/YWQ/VeMd/kkLkNlTdFjfnQf1aDiAmLkXPsBERezJq6zQ1vGhHB6nFuonlpBYz9/j6O2bx6dQ703rzhUUzGBbkvInU8S86fNU9ozUc701U596gq98e/I65jNo8NUNolZUMxOS7du7NqBqEwg9RjuqOuH5gGxwUIPGEv6IHvxWDEhTo4TkL+M3HOGadwfRJTugB18+REp5oAZ8aMxU+Aah3QrT4CX9KgCtE+A4mHSBWMvHHkviHtt0Ocaua5HSzVnuGN5fJj+a5LwwL0u5vDV3QPLt4whrAXYRIYcEaZ/3gduOFdEb1vk9CGGmCgaZKv6bHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NDYXI0Q1g2RkF4V2ZRdmxaYkhHUzdWN3o3TkZiSmFrNnRGNW9HOFJ0K25F?=
 =?utf-8?B?SmNjbDhBZDI5cDRydk00QXloSmQwWHppVGZFTkxoeEJ1eGZSMDQyNDNFVzJB?=
 =?utf-8?B?dk51REJFeFByOVdBU3BhT0hIMm4waklpZzAxVTVMNjVYckhDUjA5RVdoeUFQ?=
 =?utf-8?B?amlwTXBZODhJUEkrcUFhR0FYTHNSYzlrN1FDSkw2WlNRWnhWVU1KQzdXSE5G?=
 =?utf-8?B?L0VyRzhPM1A3b1ZQck55WTI2TmJ4aTE3UndSUndDUHNhbVBiRm5YandqRXhy?=
 =?utf-8?B?K1hxMEQxMjJ0RWdKemhwY3BwU05OZFU2dXZXUmNHU2t6Q2Nrb0ZXZnJVdE8r?=
 =?utf-8?B?c1RvMVk5Q1A2dGhNb2hyc05EQlhpajcrcVlod3ppazZqY1JtZk54dm9lMWlz?=
 =?utf-8?B?RXZ5SlVsRWNnaUhlUGpxTkxZb1dtVEVtUCtCdWxpbXhLaWlrdTdqOEh2S0VN?=
 =?utf-8?B?dFA2NDgyUS9KQ1FOdmVyemQySDltaXZPMEgxL0RTL3F1VHRmWnMvSk1Jd2d3?=
 =?utf-8?B?TWlIU0Q4aS9VZEhxT2RQczVicE5TN0k5WWNCNTJsVHFzSEE5d2VibjZMNDA4?=
 =?utf-8?B?TWg1UmF6OVB2TVNMTnFudnZidXJoSFdjUFdlWGRiaThReEcwNHZuelRqMjNy?=
 =?utf-8?B?Y2orTWU2cENOVW9hVXRUK0JmWXF3aTVXS1NKbzRTZ3p1ZThYRDBrZ1ZTSnhE?=
 =?utf-8?B?blpCRWh4S254Q2dGOGlSeEdhbVIzR0tveVFRY1pLOWk5L2p6dHY4Z3k5SlRn?=
 =?utf-8?B?cmNkUThlK2ZJTUdvRHlYUWRORUxZdEw5VUM0akhvZDd2T3FoQ0lTQlY0ZE54?=
 =?utf-8?B?bWEvN2Z3REVUa2xsV2tjd0o1WDdiUFFHQmxlNzhFbkw1Mml2THptSlc1NERt?=
 =?utf-8?B?QVZFaTZCbCtMWnk0YnNBMStyTG4zOS9udE4vRllhRzJJc25xU24rK3RLNkxv?=
 =?utf-8?B?L2VDZUxONSs3TCtXTDR3b0xBKy9VTXFQUVRPOWkwMWRrcElubWdnckZwVkll?=
 =?utf-8?B?SEN4bmV1c1lFemhVYlVnY3lvTGlzbHBSemNhMDQ3UVhJbjRndkM5bmxZSlM4?=
 =?utf-8?B?RjVuOTVkM2kxcDU3YzNBWjJ1TXNId25RNHQ3Q21KZ1BGNERjL2EvdEw1RHYv?=
 =?utf-8?B?cHpuNUNZZHZiUlVEZEcwTXVFMWlWS294V2xCem9BOUt4TG5ZQTRGdmFnRW4r?=
 =?utf-8?B?clVTUVBCcUhBRHNCWDJTNnN4Vk14OGsxRXFrSmlrS0h2QWNESjg1Z1NaSjZF?=
 =?utf-8?B?SGVwdTVLZ3BtNU03VnpYb3Q3WVJyQkQ3UlZqVGVsaFZyVDZBakpIWCtJQ09O?=
 =?utf-8?B?QmdJSXBlSUIrL0NyNUhrYUtyVHpiS3B3WXFxQ3dOUVhJbmpkZ3ZGL3dRM2M0?=
 =?utf-8?B?TEJMR3NYM1hWeUUyNlNrVVhhYjI1d2VNY2Z2TnJ4UzB0S3RoZENYeER6OGhX?=
 =?utf-8?B?eml3RXBlMjFaVkdocm5UdlNRa1o2V1pBdzA3ZklkVlo0K21kQ0w5cHhvTnhi?=
 =?utf-8?B?Nm1DZmFLaG0ycUNiYnNPdmZpZE1mUTF0cWVQeHJsaUtIbUplWkk4TkVaZklQ?=
 =?utf-8?B?ZnRUSDZrWjlKN1d1Z0V5OXY1YkFhU3NIaC9aL3FMZXZaNjNwQjJtOG9RaHlX?=
 =?utf-8?B?QnkzeHlSU1QwYWlrdGVZT01SMHVBbGp0Zy9KUm1QY05aaVBNb0l1cnBrVDNP?=
 =?utf-8?B?Y0tySkUrN3RXZGlYZ1o1Vnl2dC91M043Zi8wTXlKZjFaTm8rTytXUjYxblcw?=
 =?utf-8?B?OUxDZWliY2JvUWo5M3FNNll4TllwOUN4N2kxVVRPbUh2dWcrS2tyZ2E4UG5N?=
 =?utf-8?B?NmI0WkZFREZzbTFJMC9uaERlRVoxZVJYK3J3aGt5WG5sMU5QMEpYd3ZGRHUz?=
 =?utf-8?B?TkRFcHkvb1V0OG5vdTFsSENaMUFUZlNTM0pMMEtNNFVyZWdKTlhuSUVaMzBs?=
 =?utf-8?B?dTgrdkVIS0ZlTkZKY3RsM3F4V3Z4cGFNMXRBaDNuNVAwREkxTTNUUDNKTzlj?=
 =?utf-8?B?Z0MvWTRTcHROeExCMFJzRXoyZVIvVEJZVWd3UEJpWnUrUU9JaFpjaDFQcTlu?=
 =?utf-8?B?QjJLOUNQRUczQldNNDVXOC84VC9YKzl1Q2FITmU2R2lmNjMxZHU5TFFnWUFR?=
 =?utf-8?B?R1pMd01Bay9TZnkzeW1XZFZqUkdRUFVYMmxTb3psN3JnU3IxbW44M05oK01t?=
 =?utf-8?B?c1hoRGIxenRjbThwV1dIRUd0U0lVdlcvQWpuVDEwNUdIemhiZkN5QmZ3TGdF?=
 =?utf-8?B?c2VCZGRlY1ZkNEcvSWUyZ1J6MjVRY09HeFRIbWxLMmJ4c1doaVVZTjBDelFl?=
 =?utf-8?B?UUhvSFVwS3d0UVJac3djMSsrUlFZbkR3SnZLQkhWWEhkUnlRQlhDdz09?=
X-Exchange-RoutingPolicyChecked: rT6d6QQivib6I6TAi6qFRCnwnNPTntS7PpCwMxXC0mnINXYQV9MVH5AxedqjcqjwhgTB9MZTLfmXHLCqqHs6pw5W7pn0gTpIiM2G7RNKJZkmpYHlU8enJ7Qxp5CQrjm7znoutQE7xtCTDnXuZNA2d9cH80ba//lNYpZlkDsQ4cmJN88BuZYxMGR+Dii7MPDirde8MTySjPAfU0Ha6xd4RRHp/2R2swWhbKHk0gcAf/klYFywVJckI6kazO6qsFN/sTwGhrxLKV/KuMfDP2iOlJUiZ53H1WGlhRkUVWR6iDhPsyJ0roCh5OFIMzD/e9r9FKClJY2IRKN63jwSflL9wA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 916f5e7e-73b5-4618-2384-08de7b510fbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:02.2771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0Q87IHfbWyJD61EHnrzd9zZPolP+K4NSRR+/nnGj3cK3wmZbfP85Kix8F3XRnJjMEGuDtWOtmAth8TQQJbdsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
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
X-Rspamd-Queue-Id: C7F4221C5D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:13:44PM -0800, Chia-I Wu wrote:
> On Thu, Mar 5, 2026 at 12:52 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > On Thu, Mar 05, 2026 at 11:52:01AM +0100, Boris Brezillon wrote:
> > > On Thu, 5 Mar 2026 02:09:16 -0800
> > > Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > > On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:
> > > >
> > > > I addressed most of your comments in a chained reply to Phillip, but I
> > > > guess he dropped some of your email and thus missed those. Responding
> > > > below.
> > > >
> > > > > Hi Matthew,
> > > > >
> > > > > On Wed, 4 Mar 2026 18:04:25 -0800
> > > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > > >
> > > > > > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > > > > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > > > > > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > > > > > > to run_job can sometimes cause frame misses. We are seeing this on
> > > > > > > panthor and xe, but the issue should be common to all drm_sched users.
> > > > > > >
> > > > > >
> > > > > > I'm going to assume that since this is a compositor, you do not pass
> > > > > > input dependencies to the page-flip job. Is that correct?
> > > > > >
> > > > > > If so, I believe we could fairly easily build an opt-in DRM sched path
> > > > > > that directly calls run_job in the exec IOCTL context (I assume this is
> > > > > > SCHED_FIFO) if the job has no dependencies.
> > > > >
> > > > > I guess by ::run_job() you mean something slightly more involved that
> > > > > checks if:
> > > > >
> > > > > - other jobs are pending
> > > > > - enough credits (AKA ringbuf space) is available
> > > > > - and probably other stuff I forgot about
> > > > >
> > > > > >
> > > > > > This would likely break some of Xe’s submission-backend assumptions
> > > > > > around mutual exclusion and ordering based on the workqueue, but that
> > > > > > seems workable. I don’t know how the Panthor code is structured or
> > > > > > whether they have similar issues.
> > > > >
> > > > > Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> > > > > you're describing. There's just so many things we can forget that would
> > > > > lead to races/ordering issues that will end up being hard to trigger and
> > > > > debug. Besides, it doesn't solve the problem where your gfx pipeline is
> > > > > fully stuffed and the kernel has to dequeue things asynchronously. I do
> > > > > believe we want RT-prio support in that case too.
> > > > >
> > > >
> > > > My understanding of SurfaceFlinger is that it never waits on input
> > > > dependencies from rendering applications, since those may not signal in
> > > > time for a page flip. Because of that, you can’t have the job(s) that
> > > > draw to the screen accept input dependencies. Maybe I have that
> > > > wrong—but I've spoken to the Google team several times about issues with
> > > > SurfaceFlinger, and that was my takeaway.
> > > >
> > > > So I don't think the kernel should ever have to dequeue things
> > > > asynchronously, at least for SurfaceFlinger.
> > >
> > > There's still the contention coming from the ring buffer size, which can
> > > prevent jobs from being queued directly to the HW, though, admittedly,
> > > if the HW is not capable of compositing the frame faster than the
> > > refresh rate, and guarantee an almost always empty ringbuffer, fixing
> > > the scheduling prio is probably pointless.
> > >
> > > > If there is another RT use
> > > > case that requires input dependencies plus the kernel dequeuing things
> > > > asynchronously, I agree this wouldn’t help—but my suggestion also isn’t
> > > > mutually exclusive with other RT rework either.
> > >
> > > Yeah, dunno. It just feels like another hack on top of the already quite
> > > convoluted design that drm_sched has become.
> > >
> >
> > I agree we wouldn't want this to become some wild hack.
> >
> > I could actually see this helping in other very timing-sensitive
> > paths—for example, page-fault paths where a copy job needs to be issued
> > as part of the fault resolution to a dedicated kernel queue. I’ve seen
> > noise in fault profiling caused by delays in the scheduler workqueue,
> > which needs to program the job to the device. In paths like this, every
> > microsecond matters, as even minor improvements have real-world impacts
> > on performance numbers. This will become even more noticeable as
> > CPU<->GPU bus speeds increase. In this case, typically copy jobs have
> > no input dependencies, thus the desire is to program the ring as quickly
> > as possible.
> >
> > > >
> > > > > >
> > > > > > I can try to hack together a quick PoC to see what this would look like
> > > > > > and give you something to test.
> > > > > >
> > > > > > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > > > > > > meet future android requirements). It seems either workqueue needs to
> > > > > > > gain RT support, or drm_sched needs to support kthread_worker.
> > > > > >
> > > > > > +Tejun to see if RT workqueue is in the plans.
> > > > >
> > > > > Dunno how feasible that is, but that would be my preferred option.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > I know drm_sched switched from kthread_worker to workqueue for better
> > > > > > > scaling when xe was introduced. But if drm_sched can support either
> > > > > > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > > > > > selectively use kthread_worker only for RT gpu queues. And because
> > > > > > > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > > > > > > scaling issues.
> > > > > > >
> > > > > >
> > > > > > I don’t think having two paths will ever be acceptable, nor do I think
> > > > > > supporting a kthread would be all that easy. For example, in Xe we queue
> > > > > > additional work items outside of the scheduler on the queue for ordering
> > > > > > reasons — we’d have to move all of that code down into DRM sched or
> > > > > > completely redesign our submission model to avoid this. I’m not sure if
> > > > > > other drivers also do this, but it is allowed.
> > > > >
> > > > > Panthor doesn't rely on the serialization provided by the single-thread
> > > > > workqueue, Panfrost might rely on it though (I don't remember). I agree
> > > > > that maintaining a thread and workqueue based scheduling is not ideal
> > > > > though.
> > > > >
> > > > > >
> > > > > > > Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> > > > > > > users have concrete plans for userspace submissions..
> > > > > >
> > > > > > Maybe some day....
> > > > >
> > > > > I've yet to see a solution where no dma_fence-based signalization is
> > > > > involved in graphics workloads though (IIRC, Arm's solution still
> > > > > needs the kernel for that). Until that happens, we'll still need the
> > > > > kernel to signal fences asynchronously when the job is done, which I
> > > > > suspect will cause the same kind of latency issue...
> > > > >
> > > >
> > > > I don't think that is the problem here. Doesn’t the job that draws the
> > > > frame actually draw it, or does the display wait on the draw job’s fence
> > > > to signal and then do something else?
> > >
> > > I know close to nothing about SurfaceFlinger and very little about
> > > compositors in general, so I'll let Chia answer that one. What's sure
> >
> > I think Chia input would good, as if SurfaceFlinger jobs have input
> > dependencies this entire suggestion doesn't make any sense.
> >
> > > is that, on regular page-flips (don't remember what async page-flips
> > > do), the display drivers wait on the fences attached to the buffer to
> > > signal before doing the flip.
> >
> > I think SurfaceFlinger is different compared to Wayland/X11 use cases,
> > as maintaining a steady framerate is the priority above everything else
> > (think phone screens, which never freeze, whereas desktops do all the
> > time). So I believe SurfaceFlinger decides when it will submit the job
> > to draw a frame, without directly passing in application dependencies
> > into the buffer/job being drawn. Again, my understanding here may be
> > incorrect...
> That is correct. SurfaceFlinger only ever latches buffers whose
> associated fences have signaled, and sends down the buffers to gpu for
> composition or to the display for direct scanout. That might also be
> how modern wayland compositors work nowadays? It sounds bad to let a

Don't know wayland but let me follow up on that.

> low fps app slow down system composition.
> 
> In theory, the gpu driver should not see input dependencies ever. I
> will need to check if there are corner cases.
> 

Thanks — this matches my understanding from my conversations with Google
about SurfaceFlinger and the lack of dependencies. If you can also check
any corner cases, that would be good to understand as well. The kernel
can technically introduce dependencies if it moves memory around, but
something like that shouldn’t happen in practice.

I'd strongly suggest a bypass path as a solution. I mentioned this to
Boris — this approach is not mutually exclusive with other RT rework
either, and in any case it is likely the most performant and stable
path (i.e. no jitter).

> 
> >
> > >
> > > > (Sorry—I know next to nothing
> > > > about display.) Either way, fences should be signaled in IRQ handlers,
> > >
> > > In Panthor they are not, but that's probably something for us to
> > > address.
> Yeah, I am also looking into signaling fences from the (threaded) irq handler.
> 

I would suggest that you do. The Xe implementation is in xe_hw_fence.c
if you want a design reference.

Matt

> > >
> > > > which presumably don’t have the same latency issues as workqueues, but I
> > > > could be mistaken.
> > >
> > > Might have to do with the mental model I had of this "reconcile
> > > Usermode queues with dma_fence signaling" model, where I was imagining
> > > a SW job queue (based on drm_sched too) that would wait on HW fences to
> > > be signal and would as a result signal the dma_fence attached to the
> > > job. So the queueing/dequeuing of these jobs would still happen through
> > > drm_sched, with the same scheduling prio issue. This being said, those
> >
> > Yes, if jobs have unmet dependencies, the bypass path doesn’t help with
> > the DRM scheduler workqueue context switches being slow as that path
> > needs to be taken in taken in this cases.
> >
> > Also, to bring up something insane we certainly wouldn’t want to do:
> > calling run_job when dependencies are resolved in the fence callback,
> > since we could be in an IRQ handler.
> >
> > Matt
> >
> > > jobs would likely be dependency less, so more likely to hit your
> > > fast-path-run-job.
