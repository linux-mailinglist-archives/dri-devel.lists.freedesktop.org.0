Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHabNk7pb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:45:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616324BB19
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD14710E6C6;
	Tue, 20 Jan 2026 20:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHxUtFgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2E410E6C6;
 Tue, 20 Jan 2026 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768941899; x=1800477899;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kc4liheu6Njnr241Fd1UiR4b26GUKb23sUtoQQGl79U=;
 b=oHxUtFgiP2Vr9GioeC44tAWZXN9eQ3KXi4xzldkGv5it7K1j8UFiruzd
 qlmI/aXx5Ff3mkFBZ4il1i7gwMRSvO3Lq74/B6w+hcupOUFooHagrWLsZ
 6FIxllXEy0V21cMWn03c+PB2CHdjfNDCWKAdwN1QYyvc7dts8WRfOCbJQ
 qBXKej0cqNnHYLfzBKMi5b8teSG94bkbMuZx++CUQPVOI3ZebfE1Xeoj6
 1oYe/0QHRduUm0sbeZuHWYJrZJfn5Quu8yKxZO3fP96Q62T8Kw5XfmFBx
 wCVJlkSDdL1B1UIjVGSH3OWOzxqZA3WdMn9hnFOEpM4CEvWKHy8hd9+qA Q==;
X-CSE-ConnectionGUID: ZHQXu7c4TP22Bpb/CDJYTA==
X-CSE-MsgGUID: wIlzNJlbSXOb6xmktPE+aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81538635"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81538635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:44:58 -0800
X-CSE-ConnectionGUID: 0vp2fGysToa5lme9xQsjWA==
X-CSE-MsgGUID: dcHRdWRCQ0qYK1TOGvh8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="211239871"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:44:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:44:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:44:58 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:44:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORt1494PpdUuo/xUv9pWnGhkLBuBDOIFml+Xsoaqbt6OW6gi05fJWjo/6GXBpfCMrL8rncCBq9xGCJZe9mRIuxQvp7BIDuGsPbp8M/lqJN5ZxIhz9g8sEUvNKXiW0KfZLE/3bH41VobL721GXuoTa73WwRdn0ncnzVnrEd4RxyzKYVY38zZSEyc1tOPKukU2ntlMKfzA1sZVDQjt1aREVeVkfr1f/oiGJ+4xZKeYcU4aQIzk36fa0co5c2qP9FVxNbab8nyBrB+N4y3eMNuFbJ9GWKJuizyVtuPBwLWVYqqFHJl4viF5FEkiHpAdGWh0I4kEf34C2995JFmMOUD1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b1hKylSeqVM3xSgKLuexEMCxLkw5B+mxP/e+Y/PZ4E=;
 b=CmQTLENI0TyqdBzptvAjhumqOZjpk+XTeJVvm+DVMAmdKLgv+WxVWlupPF2+LNRoFrHNkEhlU4E8KkKoXZM7jR6/NmiQ7UuvGD7r55tuYBDgaJzvg7fCxJoPwNZWzN44JzFobnny4X6FVlkUS/N82Hxs1tXii/GkNK3KDNqrAtOS6SuDWcBb2nAooA+dR5GRBl9RhpzTz4YXMVOq9JEUuks1Q3F5bZjMGotKkAH2mI5f+WPc7tbQpsPovuzbOX01Kzow2mapgT9PPYk+LB79I+cJHhoULGtuUfcQxoXxh1npnePzPtHVAok2oXeE+UGcdzA/3hBRPEurk+Koy6kfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 20:44:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 20:44:54 +0000
Date: Tue, 20 Jan 2026 12:44:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann
 <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Williamson" <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>, "Vivek
 Kasireddy" <vivek.kasireddy@intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <intel-xe@lists.freedesktop.org>,
 <linux-rdma@vger.kernel.org>, <iommu@lists.linux.dev>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
Message-ID: <aW/pQmOO8komCgOK@lstrano-desk.jf.intel.com>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:303:8e::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: f359e98e-6b2f-4798-3a57-08de5864c3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTV3d3FUMzNyOUJtNWUvYUdyUlNlRzVNTDk2a1o2S1FzeXg1VTJOR0FOYXNR?=
 =?utf-8?B?aUp3MFBvcEo5UWc1SGRwK0RrbG1rMVA4M3dtd3JtbVZEVTkzSk5DL2JYSm5U?=
 =?utf-8?B?dVUrY0dHdkhObXRaRXRaS2ZOSHpPL2twMkl1SzBZaGlBYnQwMmdMd1ZBMEc3?=
 =?utf-8?B?NWkrMWFlQ2hwaVpZenc0QU9zRkVZMXNMWml5dlhJcGRCM0ZOSnBDd0dMYTlo?=
 =?utf-8?B?THlNZDJaUmVQTktYWG42Q2g1OFIvSWZwWk8rc2VJWDFZRXFzK2FydDBaWXNx?=
 =?utf-8?B?M3A3Y0pIZGs2MUJuODdITVFyZ2dKSFJGd0J1S3IvZi9OL0prQnBUY0FLYWYw?=
 =?utf-8?B?V1owVlM4eHZSZzQycTFKWmlaaVBDemtkS2lQN2wxdEptSEZBRythcFNTSCt4?=
 =?utf-8?B?NzVDVTZRTUZWNEZMN1p4d3h6MWsxTU8zNzZmYzcxQjZrV05JMEdYczhrRDRJ?=
 =?utf-8?B?ZWptVGNUTWxBZndaZ2FQOFNiVkJPY2RjY0k5T21mWm4wQ2RmMnhKbnRpN0dC?=
 =?utf-8?B?R1pLYXFGOXh0dy9oRE80QnZzTG5vZXlreUZUbFlyQWhRZ1phUFdOclhsR2dr?=
 =?utf-8?B?VEhsTnU0R2NsSzZZNUpsVGs1SWdLZ3ZQaUZya1FablZONUVWaS9KandRU3Vm?=
 =?utf-8?B?VkQxS1ZXMCtwaGloZmoyaDVmRnVnS2YwTzFkYUFWZGNrMklrOWltcExLRlZI?=
 =?utf-8?B?TVB0RURzVk1HZUZUTFc0NTFmTUhydVpKN0V3NC9mYW9uVTFXRTdTQ1VWY1Na?=
 =?utf-8?B?ZDBab0wxWHJzVFd4aFNaME15ZFV2Vll4MHIrU2xkSk95cFovWjIyUnlGeGda?=
 =?utf-8?B?OEhOd3RwaW5HeTdhOEpVNUs0VGlhNkd3cWxoQ0lUUEptYTF5TGRlWGhBV3kx?=
 =?utf-8?B?REc1L0pHOFBmZjAxZUxFeUgyRHJiQWNXb0ZMRVloZmR5RGF5NG8xNURPWC91?=
 =?utf-8?B?aUlIK0wzbkNCVC9mcGp6eElYRlVITmhocUVpelJNNnV1d3lTMnJ3RVlvMTYz?=
 =?utf-8?B?Q2pJSlpZaEZhWVdieGllUHNkSjA1R3Jiak96bFZmYnNrdklrTVEyMTFlMmhX?=
 =?utf-8?B?dWppVVRkclBrYjQ3VTE0eVNFN252dlA4QjA5WCt1Z1JiaENjR2JhZUQzNDZF?=
 =?utf-8?B?ZFhhbTZpS1hwY211OGltazErMnhhbEdIMlR3em5vNDlaRW9QWnZLZnRidk5Y?=
 =?utf-8?B?cXZmbUNRTC9vWXRUczFuUk1TTW1Tb3BNbUdTQzdFNW1aWW9FaW9raDRxeVNz?=
 =?utf-8?B?a3I4cDE0bU5NcGVaOG94cXlwYUdnZ0V0ejlSNXJyNjYvRkRYVDQzcGZoR3Fr?=
 =?utf-8?B?bzYvYUhncEd0a241MTJud252RWpIRnMra2JiYWtUM3o0N3FzeUhlejVuNUlz?=
 =?utf-8?B?UUF1aTZXd05wS1BTWnR4WEphL3IyUk1sM2F6akRvcmhmSUcrd2YySE5jZU9a?=
 =?utf-8?B?V0V6Tlg2T0N3S01XNkdLNUpvQm9TblFReHppREpDN1ZvSWR4Tkp6cGt4U01V?=
 =?utf-8?B?TVdVYnlLdVlVUE55VU81ejJzaWVNY0dMeTZYL25jUFBiNnZoYUo4cmIrVHNY?=
 =?utf-8?B?OG81NjE0SG1iTll2ekRvSEZXOGZ0VmVVdGlEczdUdzdrbFlZaU1iTG9IY1BU?=
 =?utf-8?B?ZDE2N2YyYXR5SEI4V01qSWRZV1dRQnZkZnlpK0Vrc1FlaWZjZU0vcFpiSGtl?=
 =?utf-8?B?dVI0Y2wycE1ldWYza042SzdOMFZQa2l5S1IvNXFIV0Nob0RIWDlYTWNNRXBR?=
 =?utf-8?B?MkNQVW4wcW9pOENtaVNjcnhXWTZrY2ZJZmoxK3o4U29hY3RJUHFmMUpNU1cz?=
 =?utf-8?B?ZUVVYTRhRngxTHMzSVoxU1pjKzZHSWYxTkZTK2hVNEJLVjRYYVphcFUzbSsw?=
 =?utf-8?B?TmVWREhuM0ZwTzBrMFg4WWRUZU9hTjFyYWxsTWNUd1JFSzYvbk5GYVkwZ3Nw?=
 =?utf-8?B?YmdIK09hanZFYnlVNXpPOUtCVjRuWXVoa256TEQzSUxxcjFKR2Z4dTdyWFFx?=
 =?utf-8?B?SDUwKzhyS2tHT1pqY0hJNFRPZ3VHUFRkUVloaTZnbnB1VndUZjRNMWFGd1ZY?=
 =?utf-8?B?SHhxRG1xZWIyMmdYczFRWjdVTzA5V3NsL0dBMVN0bTZOVitnN1d2WGFmdGUw?=
 =?utf-8?Q?/wmg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZORjZHbnZ4ODZub1pmZ3lUWk1aQUo2VmhxZGdaMGlKRXlyZnR5MHZMN3gx?=
 =?utf-8?B?QW9FZk9TNUM5am9PM3dnRUI0ZUg2YkFBcjNNTXBYeUd3WUFPV1F2c0U4QzlE?=
 =?utf-8?B?U2VKV1dLUEh4UlZJeHhHOGlyRXlINDlrMzUzLytEaGc5SlRQN000b1hjR2l6?=
 =?utf-8?B?RktQNEEvc29EUC96QVdrVWx0Q3hLYVFHSzhSM3Y1OEN4M3FyRDdKWlovb0hJ?=
 =?utf-8?B?MjhyU1FTL0tCZHdYL21ZRUZ4bk4rNXZEMGwwMUh0eE9KV1ZEbkVsRnNuNEdu?=
 =?utf-8?B?RUlKTUN2M3AxUng3c0dtME4rbmIrREkyUjVKV21WYWJTbjh4YSsxMkM2UDBQ?=
 =?utf-8?B?WmV0dzNGWnlVOThVREhPbTFOMlBNMWt0VGN0bHMyd1doWTdoS2FNbmYvalhi?=
 =?utf-8?B?UTRzek1GTHpMa20vK3NRSzhCaExUNkZiSjZ2SG1NaldwaGdIT2ZMWWhpNk1F?=
 =?utf-8?B?akVRUmFxOWZNeW90Q2x4V2lHV2I1aGdKcHJKT3F0ajZWdE5CYU0zU2VXcTdH?=
 =?utf-8?B?WmQwNEt2YWtmK0MrZjJNUVBRMWM0LzRSQVFQZWkwbmVKaUhlTmxzMnUzTXZE?=
 =?utf-8?B?dVhsdHk3MnlycmpkWXYzSHVmdmJhRER1SzBFRjB6aDJSMHFmRFo0bmNKUWRm?=
 =?utf-8?B?NWV0YjBtQ3FhUjUyYXlvMVZqVGMwc216OHk1bDhwUEx3Q1RzQkp4SXR4azBQ?=
 =?utf-8?B?bXd5TnBwNzlZYkRpYURJUXlKY2ZENzVwN1BXYkp5RjBNWXZPSWJ4Nm42ays5?=
 =?utf-8?B?a1BlcEQ3R2x4eWM2SDViZlpBMDNDZXFWWkRjZ0RZb1pKOFJaMEVRaGFpNDgr?=
 =?utf-8?B?aWQyeVNVQzBLMmRJb2xOZ0I1VEREWUhGVjA5VWZtVGZuRkd3Szh1bnBLV05N?=
 =?utf-8?B?YUx4ODVRSVBNOW9iZEtQSHFiUVFBOGVlYW9pRisyWjllMkhUUllOU0szaGNO?=
 =?utf-8?B?NUFqYm1TY0t2ZGpna01Ea0x5SGdIaWx4Rlk2UmRXb1RrQW1WZVg5alh1RGw3?=
 =?utf-8?B?b291bEt5cnIycFZZcGdPOFJseVQvcDh4WWtwd1RrLzcyeGE1MGpGcWZzZDc0?=
 =?utf-8?B?ekN1OFQ5ZmF6S2E0RE5EN00vdEJRTVdHNW5RVzhtMUpac0FRWERiWWtGTGJF?=
 =?utf-8?B?K1lYNVR4cVNtdkh2NVN0NFhMNGtkV2JYQmxKU1VtRmlLTGVSYkQwUTBvUDh3?=
 =?utf-8?B?VDNPUEZrcWFocUloVERlMnlUeC96MXpJa1lNRDBSLzlSNE5xaGZEVlVUd3o1?=
 =?utf-8?B?bThDKzhPdWI1WlBNZm5TSW8wWkp6SXBldEFtbldqUGlZTVhJTUQxb3JLSE5Q?=
 =?utf-8?B?NDh2cGp5Z3ZIb3YrSmVmSDZpM3BVbUJyMTRubmRUNDRTMVBlZGpyM2RuTXFP?=
 =?utf-8?B?eEl3L3p5YmhIdnNrM3ZpeEdmdUgyUCtGc3Y4QUFVdE5CQzF5ZTRoL1VEUHhJ?=
 =?utf-8?B?WGUyenU3M2pZUlRkT3g3czJQRmp4TDFPY3JMOGFqRElKWVVTWW1Lb1ZKa2kw?=
 =?utf-8?B?eVdFcFRFbUV4Y24yM1l6WFQ5a2V2TDBSaU1QcmFIWS9TVTArcmRLdTJmcFBm?=
 =?utf-8?B?dmZQVzQ5ZzlNZGpBd0dMNCs1aUdKRXVBNWczZW13aEdMYTdFdm1BMDhKUU9p?=
 =?utf-8?B?UzJFSU9DRTdXbXZZTEx5amltRWp1YlpKZktleW1USW1ZbXY0VkYwREJLbmdm?=
 =?utf-8?B?amRyeEVpd0hJS0k5NWxuYXVPTmtYamhybytYZ05RSHVGeXo4U01JUzhlLzFW?=
 =?utf-8?B?TFNsRk5TYktGN1lBUU82bGVmazVGVjBaS0xqUFVndkwrdnJZSGZ2aXZiYWcy?=
 =?utf-8?B?cFBDSC9NTEZvMmE0Wk1wSGRpOFYrbnBSWm9CQy9vRW8xSmZ6TFBqRWp6WEFO?=
 =?utf-8?B?dW5tRi93UDExNU9hY0xkRVJQZmZjcTBCbUYveTdSMmJxRVJzWlhJbVNZTGpX?=
 =?utf-8?B?SWlNdUZFaEYyVkpOOWdnVTN6d1BDeWVSV3NzcnlOZFpOd2JIbGpvSG9jRFRv?=
 =?utf-8?B?U09ZY3FPUGVZQkFqdE5TK0gyZlVOTzJ3dHRmSUxPY09rdFdZTndsa3E4dHpX?=
 =?utf-8?B?YitSeEpsaGcyR0h3ck82ditVVTRIdUpib1pJWm4yNkVULzh6STVNZHZWRFB2?=
 =?utf-8?B?MGJOWk5zUndJKzVBb2ZoUWhScVZKbUVKVzlqOW80aVFoY1lrK21hMjUzdVVw?=
 =?utf-8?B?dnYwSG1pVUpYUThhcHl2SWd5VUlqRlNoQjBhQlRXY3FxdTB3U2RadTZxNW5U?=
 =?utf-8?B?dTlYVzBndSt4OWtiTFdwL3JYOHpHUW9tV1JvTVhnRWUrUnJSYjQ0c24xK1VC?=
 =?utf-8?B?NWNUOFdWMkpOcnd1azR0QVJaYlVWeWFxWVBKZW96SDh3R1IrNHJmY245TGI4?=
 =?utf-8?Q?5BaeixfDs8DZ99rI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f359e98e-6b2f-4798-3a57-08de5864c3fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:54.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+BexZPCozMroN+pvZSbETMG0njgTfqm5BNxDds78vRf92t+PrG9Fzy1FgeGvFkR5xI03ptIx9Clc4K0n5YGtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[35];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lstrano-desk.jf.intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 616324BB19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 04:07:06PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is performed asynchronously by hardware, so VFIO must
> wait until all affected objects have been fully invalidated.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d4d0f7d08c53..33bc6a1909dd 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -321,6 +321,9 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
>  			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_KERNEL, false,
> +					      MAX_SCHEDULE_TIMEOUT);

Should we explicitly call out in the dma_buf_move_notify() /
invalidate_mappings kernel-doc that KERNEL slots are the mechanism
for communicating asynchronous dma_buf_move_notify /
invalidate_mappings events via fences?

Yes, this is probably implied, but it wouldn’t hurt to state this
explicitly as part of the cross-driver contract.

Here is what we have now:

 	 * - Dynamic importers should set fences for any access that they can't
	 *   disable immediately from their &dma_buf_attach_ops.invalidate_mappings
 	 *   callback.

Matt

>  			dma_resv_unlock(priv->dmabuf->resv);
>  		}
>  		fput(priv->dmabuf->file);
> @@ -342,6 +345,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv, DMA_RESV_USAGE_KERNEL,
> +				      false, MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
> 
> -- 
> 2.52.0
> 
