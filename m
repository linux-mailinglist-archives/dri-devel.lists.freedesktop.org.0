Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HinFacWe2kZBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:13:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADE5AD500
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6710E0A1;
	Thu, 29 Jan 2026 08:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRiHJwrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC73510E0A1;
 Thu, 29 Jan 2026 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674404; x=1801210404;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rtcmx2XfWjEKqZmXNkeIuKO6oKNDsNWWpLAXlPd3eEw=;
 b=iRiHJwrnykbLCgYOkHSn8ibhLNCYJchtb+k2NJpJrcqAH+9y7dmt9Jwi
 1d9K9Rh1IucE93OGAAeqWSmw1uiVDBNPugMCcu+rJaIb5xuNTSVJj58hu
 nIfdg4qv20wai0MEla5/jYE7jNWUebLjaIvrJ4OurrqTzkfMFo1FlfjH2
 7cdcMio6p/k7a/yEZFNXaUFJaLCc5MZ2bd1xGjvZx0RV9BjNqes0UcQsc
 Z3Eb0MB5L+OLJ50lxu/Zj/v3uYLTwzT5+s0QVre2QQzf7PXE6SPOyR9N9
 KmMEVHDjh0CuubtO6H6NR1+0XlsFMYK5HYK1OdsJoqG03IZ4fn4w9hhZx w==;
X-CSE-ConnectionGUID: NjywcEkMT/694WOMeioZXQ==
X-CSE-MsgGUID: 3A5/epUGQ9eheEAJs4rbCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70941337"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70941337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:13:23 -0800
X-CSE-ConnectionGUID: xWUcA8cFQfiq1G0fCX1zpA==
X-CSE-MsgGUID: cPF8Bx7hS5mtrrmm3h76QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213055704"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:13:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:13:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:13:21 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDQiS2HD5bZ1u4LS92Epn0n7VGASvrXuUlya+nckovbMLBbVTb0B5Ob9p8ip5vekEFMaHCbVjxjtcoPSIrj4OB3PDAUEREHuQwFTUmVVVFUN/MonLl5jsdgC+uQ6py9WF7RYQDLDJGkI69QN6jZQaiigTJgK8NURC7iSgyRXi/topqNsT1g+TYcuzsjt97kxMceHyfwzmqdXy2BVMWm+Ik7afnM4wnZEUmBYDtgRGrxbl4VWV6qUH5q6ZPILIpXKh0cB7FpJNssWkKO5DjWtL0VBm6eBnS89IYDBlTk3OZy8JpOPSpy5B5VFSp6/sO8RXmzi2oiGSbQ9YHMMbdCMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtcmx2XfWjEKqZmXNkeIuKO6oKNDsNWWpLAXlPd3eEw=;
 b=ttZHSJkdMkhYROYJRW9OfqsPDiJ+YsJNejdd0WwlE6ZdCyFp76etxG2OMH/0kC74laD10vBRTLk+96BgdoM5ArXyGxQdKwaDoAVMDPhdCkMFeCL6fNQn52rVITijtKata1n9yWHyzCKs7oYT7ZJlFPEQjF0DQBgaA/ckKwS5UCSxLN8jY02KggjWy6Yv4HEDmBIK0+bW8KE+cLeQ+qwEEdPRlGJqgjM+kc0GXxDlIwLUjPguIwy6q9Pa9pyZTdUqkNnoAHMY6zMScT1gCtUuKJLmWKJPMuiyfOP/P9Iz/IbklXr3Ljm1SzE15vDfnvcsVipRmExxBC6AwKBPix9D2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 08:13:18 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 08:13:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Pranjal Shrivastava <praan@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann
 <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
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
Thread-Index: AQHcjWW44cZHc/LC3Ey07jDLODM/2bVk8PuAgADKdoCAAH2KAIAChYWggAAJ1oCAAAp60A==
Date: Thu, 29 Jan 2026 08:13:18 +0000
Message-ID: <BN9PR11MB52766EA91FEB08876DA474888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com> <20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
 <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260129073331.GB10992@unreal>
In-Reply-To: <20260129073331.GB10992@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ5PPF57F27BA08:EE_
x-ms-office365-filtering-correlation-id: 730c1213-e72f-470b-d947-08de5f0e4279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UWFjNkVSeEh4TU53Rmo3d0phZzVibFN2TEdNcE1VNHA2Y1l4VURZZjFwdXdt?=
 =?utf-8?B?QVdOYXhzMEw2amhOTTFLaHN6a2Q3cjBNbXV5cVRxTkdUbER4Ky9nM1ZCUnNu?=
 =?utf-8?B?MTVhVjUyc1ZPdzNrWXhUK2dZblkvclk5N1RqN1FiLzFtNDJudWtWOGJRVW82?=
 =?utf-8?B?SENuY0FiRVFsc1RUUy9LMTc2cG5jaGh6aGY4dFdwUVd1SC96SHk3b0crVVM0?=
 =?utf-8?B?NUFDOTFGNWFkcWE3bnlUMkw5VXd0alNEQUxTbWhzZll5amZOK0NzSy9pRHV0?=
 =?utf-8?B?alA5R2JQMVNZSWNoamcxNXNGc0UyL1ZCNUZzams0MXRkTGMwc0VaNVVqWEhS?=
 =?utf-8?B?aFRHNUlnS0ZZLy94T2h0eVI1WlBqdzlPQW1RR2VRWm1aa0xaRWNlVUxkWlZp?=
 =?utf-8?B?TnBkVWtOWnlOWEFFUDcwZ0ZHYUZENTRUZnhWd1ZvWFQvQnpsNm44emcrRUtC?=
 =?utf-8?B?ZmIyQTk3SU1Nd2FkOWFVd2VISFJ5NkRWVFBad3l2SDVuSGdRT0hOZm9yckpE?=
 =?utf-8?B?QUp5ZFNNWDRVaENVOU5mOWUvbFlXR0s0QnRpVXUvYWk5ZjNLNGZZV0RveXQy?=
 =?utf-8?B?WDk2Zng3dWVWdFh6OXZpL2hyc3IvYWZBc1J0cjN1Ykc3VzZlaWZ0QTFuczVv?=
 =?utf-8?B?Zko5T090Q21lRDVqNHNjMkw0K2FJM2xyWXNPS3g4VWZwdGFRVEtSdVBrV1Bl?=
 =?utf-8?B?b0hSUzI1NWYwOFQ3NC8rZVRUT3BxRTRjQkdaMFZEc2dLNFhPb0RrMS9uV0dL?=
 =?utf-8?B?Q01nSmo4bnhHRm1JOG1Xa2MvYUY5aDVadGp5cDV2aTl3bC9yOUZESHdqK3hK?=
 =?utf-8?B?Q2JPQVZGTmN0dWtFYmlBbkpGSnQ5bjV1WFFtbytJMkpLME9kWS9wdGRmSk5w?=
 =?utf-8?B?WkszQUtNeXZpVHFoN0p1TkJwblNtUHBCbHpRTXpWc0lWR045dEFsakhrV0Jq?=
 =?utf-8?B?Rkt6SEc5NWVyZW4vTEtIMHlUbnJIalFhNXlybVMyQjlDZ2JiajFjbkVZTW9a?=
 =?utf-8?B?L2NBMm1GOHI1RjVIWVVVUCsrK3VkSDdDNXdhQ2wybGUva1VnOW9lWktCWXVt?=
 =?utf-8?B?OHgyT1BHOEtMZjFIQlpmcW5ScmJhRGg0dFUzbFQ4Q3RXdWFaai82MzI3WTZO?=
 =?utf-8?B?eWFja2pqM3Q5c0hzVC9OYlhqQVppbjNLSlRmb0N0QVZIdjVpNTIybi9vZmpr?=
 =?utf-8?B?YlRiSnZ4a1pjeGgzQ0NwM1M2VTMwMHEwYkV6WXBDaEYwZitkWW9IVEJHbGt3?=
 =?utf-8?B?NThYMW9rdzJRZThNZVhwcmVQSEVkRWg3bDV3cXhUWEpZMlh3MmhQeWdvK3ZG?=
 =?utf-8?B?RElVQ0xMcHVlYXJOVUswbjZyZzBwdkxnTVZIV2QyZURIUUxnVjR0ZVNSZ3da?=
 =?utf-8?B?OWRYNkN3WTMrY0VkazBuam1KQ3pLaVB2TnM4eEZRL0JZRHlNUjJBT0w1R3Y1?=
 =?utf-8?B?b09oWXhRdURHZUtNcGFVUk10MFRxV0Q5TWp3ZWY4ajIvekFwaGhya0pOTnNS?=
 =?utf-8?B?bDVlRWVOTHJhaHROcVpQQVl6ZDMzODJvN2Vnc1U1SEZJMXRPRHErNEx1UHNT?=
 =?utf-8?B?VzFTa3JxYkZocytGWUNMUGtiM2ZtVnZLSEJBT1VIeE1CRWZ4NXc3K0trS0Rj?=
 =?utf-8?B?N3BoK1dFOWJ5dUdnRWs0dmswOFNNSUpkV1pkKzZETWJ6cmR2YVladTl1Nnph?=
 =?utf-8?B?WDFEUTRrL3h3Vlk2THB5a09UbVJFNjlXbS9MV0szZmk0UDlzNHZXdFRhNVVS?=
 =?utf-8?B?NzNPMlk1TE15bFk0dnZFVXpxaEF3aGdZN0h4bUdPUDVZMDh2V1FzQjBCMlE3?=
 =?utf-8?B?dkhvck1NbkZxOWM0TXNQSHBZbGRYMWZJbjV2NE1Kd3d4SHhNUEI2NmF3bVRB?=
 =?utf-8?B?NHd6cVAyZ3BVVGZHNHM2cGlhWlVSVTIyM3d3YU1PcUFnVkRrb0oyTEVkdGo4?=
 =?utf-8?B?bG11T0xOd3lQd2VlZTV2RDEreXAzU25QQ0dPQ0diTWVXWUR6QlBtSVN3OWFo?=
 =?utf-8?B?bERIc3R0ZDJTcGNCN1BQOVhLMTZYYTBWWVNxeFdWNHh3YitubWNKbElnVnpJ?=
 =?utf-8?B?TmkrVnIxdVRsVTZYYlN6L0RtLy9zYTJ4U1hRSmRCcFgzMnlGeGN0S0gvR2No?=
 =?utf-8?B?aGQzZld2K1ZqTC8xQWRLSmxxbTA4R0puOGpmTWhja2RVWFZnRmlkeXFNZTdH?=
 =?utf-8?Q?PbRWz1NnSe8/XOlM8psYG6g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjIyRkFUNzhzNEE1ZkUzUUtvL3BTVUpvWHIycXdUQlpLd1V5dWE1MXgweWRw?=
 =?utf-8?B?WHVVNlB6OUJFSklmNVJGSXFJbG9FOFgrSFBybldXYk1zTkV2UzcycW5MUDB4?=
 =?utf-8?B?a1BaSGhFaXUzOGZEdDVWOEdSNlN5TzZybTJRZVkvbXdqK1VpRWh2eE5kYnVV?=
 =?utf-8?B?cm9YSjVtWlZRTkErVzZoazk4NitpaUlWMElLbWRqSFBjRmtnby82WGxLYVpp?=
 =?utf-8?B?YzkvT3ZGQjJUOFFIWUZ0TkdHbyszTytIcnpmR3FVY2R6STl0NUtzOUh2eHlN?=
 =?utf-8?B?ZjN5Q0lPYXBPM0VkTERsTGpxNDZBMmRtdGxTRHZFOG1FTEV3eFNzdDdGODNs?=
 =?utf-8?B?WUU5aTczbVZSb2NmMGRab3BicTNKS3lYTmcxci9xQVBHZm1GektiNHY0WHp6?=
 =?utf-8?B?bUpQRjhPSGFhZUR5UzBPWEdmSTV4cG5tMmNlbEJNUXRrNmp2WEh2aEtvWE12?=
 =?utf-8?B?NGlZTS9jM25rVkZTSndRM0dzV0tBVWRHSVZMbXhINEptUFR5cndBRjFtUWpq?=
 =?utf-8?B?VXpOWFNUSzJsb0JrcVY4NmQrTitSTTB5Wmp1bXB6K1I0L3ZDT0JuNFBISytN?=
 =?utf-8?B?NXlZUmxWT1l1YkllSXZHMzhiUmFqVlRYNk1zVVVzYklJNHIya3FZWVh3MFdi?=
 =?utf-8?B?NGFrRmRNdklNcW5rSUhoclA4bVlmMU8xS1FraHlxdG9wRnlwZStPYzdaUkcz?=
 =?utf-8?B?SGdmd0VQdDF5SmlvWU1iM3IrTUQxOTE2SEJKQ2JOTUE0WVU5OFdLZGVxbHlp?=
 =?utf-8?B?R00yMjB1RXB0d0ZLZ2JYUWFkZGVrYVdlN2ppaWtnd2ttRUJSL1diKzFqdmpB?=
 =?utf-8?B?a2ZqUlFKeUx4NlJLdWJ1NGo0dWpTK2lzRUtjdzhPeU5pTzNuaEdHTTJyL1ZE?=
 =?utf-8?B?ajV1UUNlVkNTREYwM3dKYklPRlBtQWZUSXVNT1dkSUIwVlVIMmhQcnZHbEZm?=
 =?utf-8?B?YWROK2ZIOVNLaUdxTTM1ek8xRzkvOTdIUVU0VTNGOUhqMTZvTnp0R1Bxckdj?=
 =?utf-8?B?ZXNreGxKRUFYcmtFbzNSVjZVNzdoSW1IWkx3eDJNanUzSnVrb1Rad2lxQ3Rl?=
 =?utf-8?B?bDMzSVJmVnFVK0pheG9ScmlUNzBIV0tSK3B6U3lQNHdhTFdkN2dJU2hhTWsv?=
 =?utf-8?B?VGNHUmYyMXBCV2x4YUNVR0dlQU12SVNxWGNQMjNqN2tGSVhxR2hndGp2c0hS?=
 =?utf-8?B?Z1ZjV0RyOFRodkpPNEFjSUtjOElwUnB0ckM3U1AzTmtBcmtUbUkxUklPb1hE?=
 =?utf-8?B?TUJwdHdpcUpnQ0xTbWQxakdPeEVjc1ZxZjA5VVpsVzl5MUVQc2FrVUx4MUh0?=
 =?utf-8?B?QjV0UHRqa2NnTVp0RkZJam4wRUF4aHVVV1Q4aHF4UDJIUmlYVmlEMmVSMkt3?=
 =?utf-8?B?TVc3V2hWQUZpTmxpZkc4bGROVUhWcEp0QlFDRnhKZEgwcm15bGIzdkhmaU9q?=
 =?utf-8?B?TDdqMXJQNmR0TWtqbE5WTGNNazVTODFOMEd4NlVJMUI3L2dBNytTN3lsKzgw?=
 =?utf-8?B?bHBCTk42R0g2c1VsQVFWYTY3TVhjMWxJUkJOckNQcEwvU3hnRkc5bmdhSkxR?=
 =?utf-8?B?QW1SZUhvL0krR1QvM09SUnliTEtaVUtlVEkzS1FnMkNsWU0rSFQ0dHpxeUNL?=
 =?utf-8?B?VWRnMVRzZDJhemd3UllFQW1NYmVNN003K2Q1MnNpWXlOWU1iVWNhSjl4TE56?=
 =?utf-8?B?ckpjY3NnYVExTURYVkZodldSTllWVWxSWS9MVHY4T3d3Y2ZvM0xhZkNuMUJy?=
 =?utf-8?B?OVJZbC9CKzQ5clRsNnhNbHM0bk1yc3lXZm52cXoyUGJIRExRNDdaa2dKV3FF?=
 =?utf-8?B?a3NDM2wxcHFzUlhtRFlwWTVzbm5nRC9zYVZGR3Y4U25nNzdrK2JBRFVtQmVE?=
 =?utf-8?B?R1VJTTJtWUpFYWNUUVlHSHN5QlBIZDQvSEVKdXhuNGtiM2dHM3U0UWZoVlF6?=
 =?utf-8?B?TW1Ra1RiMFRmMHZpQ1FiMk15S0UwdHFVOFdOYkU1bnAxU2krRHp4ZVlQMzJn?=
 =?utf-8?B?UG1CRXBKVEw2MGNRUWRQYk50K1ZJemFyNEtGM1NyS0FYVlJySGtKa0JLaEFT?=
 =?utf-8?B?MXpJOWdDNWx4Sjh2RUxNejdWQjhOYWplZWVnUFFLb1ZLaGY5R3ZnLzBYUzFx?=
 =?utf-8?B?RTdIN1ozWHhiZ2hFTE14cnlnWFA5MDRnckl3emRrU0ZwRVNmK1ArMlppOVlW?=
 =?utf-8?B?NWY4YU5rN3VYZWhjTU9yZmdJMXYrTThxQjFxK2ljVTBkVFJoemNibW85OFlt?=
 =?utf-8?B?Q3ZvM0ZBaDFHTnlCUXJ4S1JYeDFNQmd0YmEyWUdxaHVDUUxBaklINy8yOWlO?=
 =?utf-8?B?WW1mVVVaaDBqL1A1M0Z4ZERKYnU3aFFqajlrQkhlUzhTdjlYL3BxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730c1213-e72f-470b-d947-08de5f0e4279
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 08:13:18.2564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZAG6yCybTpuvYgkhngreJtmJBRBdH/RLnud5I9enOqU/rntWMzZc4qxAhf/Zp0EoL1ZR2ev2iF4wOixBzc/QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ziepe.ca,google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6ADE5AD500
X-Rspamd-Action: no action

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNk
YXksIEphbnVhcnkgMjksIDIwMjYgMzozNCBQTQ0KPiANCj4gT24gVGh1LCBKYW4gMjksIDIwMjYg
YXQgMDc6MDY6MzdBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBKYXNv
biBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFy
eSAyOCwgMjAyNiAxMjoyOCBBTQ0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0
IDEwOjU4OjM1QU0gKzAyMDAsIExlb24gUm9tYW5vdnNreSB3cm90ZToNCj4gPiA+ID4gPiA+IEBA
IC0zMzMsNyArMzU5LDM3IEBAIHZvaWQgdmZpb19wY2lfZG1hX2J1Zl9tb3ZlKHN0cnVjdA0KPiA+
ID4gdmZpb19wY2lfY29yZV9kZXZpY2UgKnZkZXYsIGJvb2wgcmV2b2tlZCkNCj4gPiA+ID4gPiA+
ICAJCQlkbWFfcmVzdl9sb2NrKHByaXYtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7DQo+ID4gPiA+ID4g
PiAgCQkJcHJpdi0+cmV2b2tlZCA9IHJldm9rZWQ7DQo+ID4gPiA+ID4gPiAgCQkJZG1hX2J1Zl9p
bnZhbGlkYXRlX21hcHBpbmdzKHByaXYtDQo+ID5kbWFidWYpOw0KPiA+ID4gPiA+ID4gKwkJCWRt
YV9yZXN2X3dhaXRfdGltZW91dChwcml2LT5kbWFidWYtPnJlc3YsDQo+ID4gPiA+ID4gPiArDQo+
IERNQV9SRVNWX1VTQUdFX0JPT0tLRUVQLA0KPiA+ID4gZmFsc2UsDQo+ID4gPiA+ID4gPiArDQo+
IE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCj4gPiA+ID4gPiA+ICAJCQlkbWFfcmVzdl91bmxvY2so
cHJpdi0+ZG1hYnVmLT5yZXN2KTsNCj4gPiA+ID4gPiA+ICsJCQlpZiAocmV2b2tlZCkgew0KPiA+
ID4gPiA+ID4gKwkJCQlrcmVmX3B1dCgmcHJpdi0+a3JlZiwNCj4gPiA+IHZmaW9fcGNpX2RtYV9i
dWZfZG9uZSk7DQo+ID4gPiA+ID4gPiArCQkJCS8qIExldCdzIHdhaXQgdGlsbCBhbGwgRE1BIHVu
bWFwIGFyZQ0KPiA+ID4gY29tcGxldGVkLiAqLw0KPiA+ID4gPiA+ID4gKwkJCQl3YWl0ID0gd2Fp
dF9mb3JfY29tcGxldGlvbl90aW1lb3V0KA0KPiA+ID4gPiA+ID4gKwkJCQkJJnByaXYtPmNvbXAs
DQo+IHNlY3NfdG9famlmZmllcygxKSk7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJcyB0aGUgMS1z
ZWNvbmQgY29uc3RhbnQgc3VmZmljaWVudCBmb3IgYWxsIGhhcmR3YXJlLCBvciBzaG91bGQgdGhl
DQo+ID4gPiA+ID4gaW52YWxpZGF0ZV9tYXBwaW5ncygpIGNvbnRyYWN0IHJlcXVpcmUgdGhlIGNh
bGxiYWNrIHRvIGJsb2NrIHVudGlsDQo+ID4gPiA+ID4gc3BlY3VsYXRpdmUgcmVhZHMgYXJlIHN0
cmljdGx5IGZlbmNlZD8gSSdtIHdvbmRlcmluZyBhYm91dCBhIGNhc2UNCj4gd2hlcmUNCj4gPiA+
ID4gPiBhIGRldmljZSdzIGZpcm13YXJlIGhhcyBhIGhpZ2ggcmVzcG9uc2UgbGF0ZW5jeSwgcGVy
aGFwcyBkdWUgdG8NCj4gaW50ZXJuYWwNCj4gPiA+ID4gPiBtYW5hZ2VtZW50IHRhc2tzIGxpa2Ug
ZXJyb3IgcmVjb3Zlcnkgb3IgdGhlcm1hbCBhbmQgaXQgZXhjZWVkcyB0aGUNCj4gMXMNCj4gPiA+
ID4gPiB0aW1lb3V0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSWYgdGhlIGRldmljZSBpcyBpbiB0
aGUgbWlkZGxlIG9mIGEgbGFyZ2UgRE1BIGJ1cnN0IGFuZCB0aGUgZmlybXdhcmUgaXMNCj4gPiA+
ID4gPiBzbG93IHRvIGZsdXNoIHRoZSBpbnRlcm5hbCBwaXBlbGluZXMgdG8gYSBmdWxseSAicXVp
ZXNjZWQiDQo+ID4gPiA+ID4gcmVhZC1hbmQtZGlzY2FyZCBzdGF0ZSwgcmVjbGFpbWluZyB0aGUg
bWVtb3J5IGF0IGV4YWN0bHkgMS4wMDENCj4gc2Vjb25kcw0KPiA+ID4gPiA+IHJpc2tzIHRyaWdn
ZXJpbmcgcGxhdGZvcm0tbGV2ZWwgZmF1bHRzLi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpbmNl
IHRoZSB3ZW4gZXhwbGljaXRseSBwZXJtaXQgdGhlc2Ugc3BlY3VsYXRpdmUgcmVhZHMgdW50aWwg
dW5tYXAgaXMNCj4gPiA+ID4gPiBjb21wbGV0ZSwgcmVseWluZyBvbiBhIGhhcmRjb2RlZCB0aW1l
b3V0IGluIHRoZSBleHBvcnRlciBzZWVtcyB0bw0KPiA+ID4gPiA+IGludHJvZHVjZSBhIGhhcmR3
YXJlLWRlcGVuZGVudCByYWNlIGNvbmRpdGlvbiB0aGF0IGNvdWxkDQo+IGNvbXByb21pc2UNCj4g
PiA+ID4gPiBzeXN0ZW0gc3RhYmlsaXR5IHZpYSBJT01NVSBlcnJvcnMgb3IgQUVSIGZhdWx0cy4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNob3VsZCB0aGUgaW1wb3J0ZXIgaW5zdGVhZCBiZSByZXF1
aXJlZCB0byBndWFyYW50ZWUgdGhhdCBhbGwNCj4gPiA+ID4gPiBzcGVjdWxhdGl2ZSBhY2Nlc3Mg
aGFzIGNlYXNlZCBiZWZvcmUgdGhlIGludmFsaWRhdGlvbiBjYWxsIHJldHVybnM/DQo+ID4gPiA+
DQo+ID4gPiA+IEl0IGlzIGd1YXJhbnRlZWQgYnkgdGhlIGRtYV9yZXN2X3dhaXRfdGltZW91dCgp
IGNhbGwgYWJvdmUuIFRoYXQgY2FsbA0KPiA+ID4gZW5zdXJlcw0KPiA+ID4gPiB0aGF0IHRoZSBo
YXJkd2FyZSBoYXMgY29tcGxldGVkIGFsbCBwZW5kaW5nIG9wZXJhdGlvbnMuIFRoZSAx4oCRc2Vj
b25kDQo+ID4gPiBkZWxheSBpcw0KPiA+ID4gPiBtZWFudCB0byBjYXRjaCBjYXNlcyB3aGVyZSBh
biBpbi1rZXJuZWwgRE1BIHVubWFwIGNhbGwgaXMgbWlzc2luZywNCj4gd2hpY2gNCj4gPiA+IHNo
b3VsZA0KPiA+ID4gPiBub3QgdHJpZ2dlciBhbnkgRE1BIGFjdGl2aXR5IGF0IHRoYXQgcG9pbnQu
DQo+ID4gPg0KPiA+ID4gQ2hyaXN0aWFuIG1heSBrbm93IGFjdHVhbCBleGFtcGxlcywgYnV0IG15
IGdlbmVyYWwgZmVlbGluZyBpcyBoZSB3YXMNCj4gPiA+IHdvcnJ5aW5nIGFib3V0IGRyaXZlcnMg
dGhhdCBoYXZlIHB1c2hlZCB0aGUgRE1BQlVGIHRvIHZpc2liaWxpdHkgb24NCj4gPiA+IHRoZSBH
UFUgYW5kIHRoZSBtb3ZlIG5vdGlmeSAmIGZlbmNlcyBvbmx5IHNob290IGRvd24gc29tZSBhY2Nl
c3MuIFNvDQo+ID4gPiBpdCBoYXMgdG8gd2FpdCB1bnRpbCB0aGUgRE1BQlVGIGlzIGZpbmFsbHkg
dW5tYXBwZWQuDQo+ID4gPg0KPiA+ID4gUHJhbmphbCdzIGV4YW1wbGUgc2hvdWxkIGJlIGNvdmVy
ZWQgYnkgdGhlIGRyaXZlciBhZGRpbmcgYSBmZW5jZSBhbmQNCj4gPiA+IHRoZW4gdGhlIHVuYm91
bmRlZCBmZW5jZSB3YWl0IHdpbGwgY29tcGxldGUgaXQuDQo+ID4gPg0KPiA+DQo+ID4gQmVhciBt
ZSBpZiBpdCdzIGFuIGlnbm9yYW50IHF1ZXN0aW9uLg0KPiA+DQo+ID4gVGhlIGNvbW1pdCBtc2cg
b2YgcGF0Y2g2IHNheXMgdGhhdCBWRklPIGRvZXNuJ3QgdG9sZXJhdGUgdW5ib3VuZGVkDQo+ID4g
d2FpdCwgd2hpY2ggaXMgdGhlIHJlYXNvbiBiZWhpbmQgdGhlIDJuZCB0aW1lb3V0IHdhaXQgaGVy
ZS4NCj4gDQo+IEl0IGlzIG5vdCBhY2N1cmF0ZS4gQSBzZWNvbmQgdGltZW91dCBpcyBwcmVzZW50
IGJvdGggaW4gdGhlDQo+IGRlc2NyaXB0aW9uIG9mIHBhdGNoIDYgYW5kIGluIFZGSU8gaW1wbGVt
ZW50YXRpb24uIFRoZSBkaWZmZXJlbmNlIGlzDQo+IHRoYXQgdGhlIHRpbWVvdXQgaXMgZW5mb3Jj
ZWQgd2l0aGluIFZGSU8uDQo+IA0KPiA+DQo+ID4gVGhlbiB3aHkgaXMgInRoZSB1bmJvdW5kZWQg
ZmVuY2Ugd2FpdCIgbm90IGEgcHJvYmxlbSBpbiB0aGUgc2FtZQ0KPiA+IGNvZGUgcGF0aD8gdGhl
IHVzZSBvZiBNQVhfU0NIRURVTEVfVElNRU9VVCBpbXBseSBhIHdvcnN0LWNhc2UNCj4gPiB0aW1l
b3V0IGluIGh1bmRyZWRzIG9mIHllYXJzLi4uDQo+IA0KPiAiQW4gdW5ib3VuZGVkIGZlbmNlIHdh
aXQiIGlzIGEgZGlmZmVyZW50IGNsYXNzIG9mIHdhaXQuIEl0IGluZGljYXRlcyBicm9rZW4NCj4g
aGFyZHdhcmUgdGhhdCBjb250aW51ZXMgdG8gaXNzdWUgRE1BIHRyYW5zYWN0aW9ucyBldmVuIGFm
dGVyIGl0IGhhcyBiZWVuDQo+IHRvbGQgdG8NCj4gc3RvcC4NCj4gDQo+IFRoZSBzZWNvbmQgd2Fp
dCBleGlzdHMgdG8gY2F0Y2ggc29mdHdhcmUgYnVncyBvciBtaXN1c2UsIHdoZXJlIHRoZSBkbWEt
YnVmDQo+IGltcG9ydGVyIGhhcyBtaXNyZXByZXNlbnRlZCBpdHMgY2FwYWJpbGl0aWVzLg0KPiAN
Cg0KT2theSBJIHNlZS4NCg0KPiA+DQo+ID4gYW5kIGl0J2QgYmUgaGVscGZ1bCB0byBwdXQgc29t
ZSB3b3JkcyBpbiB0aGUgY29kZSBiYXNlZCBvbiB3aGF0J3MNCj4gPiBkaXNjdXNzZWQgaGVyZS4N
Cj4gDQo+IFdlJ3ZlIGRvY3VtZW50ZWQgYXMgbXVjaCBhcyB3ZSBjYW4gaW4gZG1hX2J1Zl9hdHRh
Y2hfcmV2b2NhYmxlKCkgYW5kDQo+IGRtYV9idWZfaW52YWxpZGF0ZV9tYXBwaW5ncygpLiBEbyB5
b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gd2hhdCBlbHNlDQo+IHNob3VsZCBiZSBhZGRlZCBo
ZXJlPw0KPiANCg0KdGhlIHNlbGVjdGlvbiBvZiAxcz8NCg0KdGhlbiwNCg0KUmV2aWV3ZWQtYnk6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
