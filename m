Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B24C8C272
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649BA10E67B;
	Wed, 26 Nov 2025 22:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bf45gzFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5A110E67B;
 Wed, 26 Nov 2025 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764194844; x=1795730844;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M+Tfx5qOjdw8CXeBAwILM/M15/Tonh9TKHlW1e3m4Mo=;
 b=Bf45gzFy/FYKq6Uhb5kohdnZoXSdtbtdFSIjIcLGj8ryHbYPb2ZR59xo
 dxXpqUhn+67JZnwFGzWEykaaUqiQLIxmDJTZXaqQUafRXuHNFVkNr7PDJ
 AMk6aeXY0BJSbVVM0sC+uv6u5KPGobScYfXV9XJ7iKggUtq/0QhWEPD0V
 uu6YZnX2LDO1L1kEXQWeWdy8aEl+4CQk37CKz4bBjm4qxW7PCsgkJhQpx
 2neJhwrK+9405y+IWYS5r51yHKN1M9HJfTe+RJTBa77KNzlU9UkCtYo+W
 MkghDPopZ56DzWGFc0K0Ote2MdNss3mwXqA/JJ1MXeO8WhpoSPINZj3Te Q==;
X-CSE-ConnectionGUID: /KzpAbFgQsicvn/s3IGcvA==
X-CSE-MsgGUID: oLfticyVTpiN1SQo08DV3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77347348"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="77347348"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:07:23 -0800
X-CSE-ConnectionGUID: SfRrco1SR0Oq+odNpl37TA==
X-CSE-MsgGUID: k+4tbJWfREWn53nD7knVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193866339"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:07:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:07:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 14:07:22 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2Asoqjlyqtp+L0C1T99/VgRr+sZvPgq4aRBlCOZVzlXV10ZrSFqttudhWLf4lWPsuR4ZZ03GHNR7qk+XjVSQZd/LbhX8zNxGM9DSu09WlKWJNU/xM+M0TBPyeidsTGtOiXeJyLZYhGAuiTEmvljLpLEQSsfWT3qJToB3X5esmhrcrJUH1TD85wDdNupjH4Xad9Wk6Wvomrcms0LsV+jTMUBpvEUvCPfpabblAyS0Zx9h0vO9NORXrCQXnrLLr7GfpecX6Z7i2H95dnqZj04FMFqkw3VXXfqnHiReML3dDPd9EOYX8DGCrJUMIUgCIxv5jaDIl/q/a9QGFolGtJ3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHZjUl+Ht3d/FM5X0qDcrqsrm8w5X8rtkjKZclMOuBc=;
 b=G56JuPEcE02u6Lt+D+Ud4SDpm7PYnbWSkBxmU8dYdyLTJTt/IV/fYImY3f7oN8TXDxiou6IbBKhXjAv06HhSKQhzmCW4/+4UgZf2llcS8rz7B9akR7bBAYPGdxztcGQBeJYZejnRbOR3Olm+a9YO47OufwVfd2lkkod7vlCa388f4IQKifdu0asFPup99x/GCOLX5QK4T0nI1IK/mwcp7a7YQV4G00MtQtNV5Ur/5xTXBTcQyAPohqRoVHEfytgQUMj9Z33dl2rU8xOud7EeWyQeH0fUbR0IKbOmf1QXUjNdnVz8gVxVJhpVuLjC2RICdCKmp1znfbEQlpS6j3Lftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by PH3PPF10FBEE80C.namprd11.prod.outlook.com (2603:10b6:518:1::d09)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 22:07:19 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 22:07:19 +0000
Date: Wed, 26 Nov 2025 23:07:15 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v6 3/4] drm/xe/pf: Export helpers for VFIO
Message-ID: <pgx5k7dew46hejhh54oq7jpqtzktgfkg6ifqbb6m7mtv5ryx53@3rk54rcia54z>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-4-michal.winiarski@intel.com>
 <c4ff85ca-58fc-4f96-ad6a-808ba06c08fa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4ff85ca-58fc-4f96-ad6a-808ba06c08fa@intel.com>
X-ClientProxiedBy: VI1P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::34) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|PH3PPF10FBEE80C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aae74a2-1cb9-4c13-0b26-08de2d382a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmRXejYvS0JTay9HaXhJZmx4OStqYjlRcWgwUURYcmVYUkdpQXRFWXNXbmNq?=
 =?utf-8?B?SXQxRysrZjJ3cEkxaXYwanFZd3EyUUpaemVEc3Q2RDVIU2RYZmxrR1ZaRE1w?=
 =?utf-8?B?ZXV2Qmt4ZWZndytlTFVGd1RMQURJMlFoU21BbVYzTWhtcC94VGtMTHNDaXFs?=
 =?utf-8?B?ZnBWVzJDWGN5YnByRUk3aDk3aFZWOCtMNTR6UlBGTWk0UGN5dzh6RE5mSHFC?=
 =?utf-8?B?ZHdMQjJ1ZVpwaTcya1lGNDJvblVFODZLeWNuTkp3SldPcDUyM2lPTm1xL3k1?=
 =?utf-8?B?eVZzdlNoUDNuaWFLZzZCOEYvbnA1Vk1GUUk1eERiNmRGVi85Y2NKU3RpTTNa?=
 =?utf-8?B?ajJKSi9zcGxPZDZIUVdlYkhSRUNoWmF5RWpYUk9WWEhFY1lIZzlETUJ1M1lQ?=
 =?utf-8?B?RmRBWFJLNFhEUy9zeUJDL2M3bGlDYUQvMHFhTVZKQ1ZBVlBma1kvdGdDK0dl?=
 =?utf-8?B?STdBL00xaHNkaW9PN3ZFMld0cnJvNjVLMHVXenVRQW5hZng3SU5kdUR4Y3Ja?=
 =?utf-8?B?djRzTWdlb1BKVDZGTE9tUVUrNUVsVUpGOHFOcnhrZ2NzSlVoZFZuKzA2dEx6?=
 =?utf-8?B?UFU2NDhSUWkrWDcrL3F5aVRvOTRHOGNxbThGa2s2YVdHcmFva1BQcXhCLzRh?=
 =?utf-8?B?R1A5ajhuaEdtVlNsM25ZKzVLb2JnTFFnVzR6ZXJKTTFPc0VJMzhWR2U3WFZ1?=
 =?utf-8?B?YUZxN3ZhdWhFUDh1aWdMWk1LZ3dXbGtjaHBnaDQ5eTUzcnFXckNoUTBVWkZU?=
 =?utf-8?B?d2FvWEtrRlg3TWRTWiswV2ZEdU42WC9GRFYzenh0bHhCVVg3U0tQRW1XSHpk?=
 =?utf-8?B?c01Vd1FLNW40YXM1Z1ZYaTdTbHVuSkk3YUttYWI3RVhaTFBHN01UanNtVW1F?=
 =?utf-8?B?R2UxN3JBODVtdmRxYmVYbG5WSjVmWC96VWFPUWxQZlMyRFdZN2lublhBOXh0?=
 =?utf-8?B?ZHc1ZFg4NVlsL3M2aDFMeUlRYktYTzJqQmtWaXpoaUl0bjZ2dWlUbTVrUHUy?=
 =?utf-8?B?K1lwek0vM05SeWhGK0RnWUh4a2pzK0puWFdVREVNQmRzMzBoWVJmK1BscnJl?=
 =?utf-8?B?NktDSmQ0TzhRWWNMM0c5NGpNWm1yb3JOeENvZGE5WGhXanl2SmFLTnpYQzdq?=
 =?utf-8?B?WS9IUVA4dndaWHJ6YTMvcjRuTXBJK2t1eGV0NFRWdGFOZXlTTGtqbnJnclpr?=
 =?utf-8?B?aUJHNG55blpQOTgwQ2I5Q01mL2c2YXpEdDFrcGxVb1haY1VESkFFMEZhTWtk?=
 =?utf-8?B?OEFySEo0bEFubWtFakVWaTVja2NheFBXcWgya2dlN1FXUHhoWEp2UEx5c0Uz?=
 =?utf-8?B?Y0hjcjBYbEpxOUs0S25oS09HNEZCS3Y3L3ZUQVpQVnV6MGFlTElBQTRTbW1U?=
 =?utf-8?B?MHJxMTdwcmxSa28vTjVraUZTYnV2T0YwZGpJT3laNW9GaklQWTFCdWk1N2dr?=
 =?utf-8?B?NnRpanVMWjR3VWtaQUc5M0d6a3kxREl2OEM3UXQ1MjlqRjNhK21BUlRzaUZU?=
 =?utf-8?B?bFFNNk5zSFVvMFJ2QVB2Q2o5ZHBnU0k4NGhKdE1HRGw1enF3ckJoUjJZYzRH?=
 =?utf-8?B?UUtSWjhxOWtSaXZ0cUljZDRHb1JsQldic0hSMnQ1dE9EMXVWR2dmRGFVN3Er?=
 =?utf-8?B?YjgyMHhOY3dWbkgwN2JyU3YzYUIyMmVieGxPS1dVWmRHcVZHRmR3RjZFYk1H?=
 =?utf-8?B?L2dublJheVZPeG9hZ2xVM2lqODhRMStMS21hWEZ5M3g1TnlLUmQrMmxXTWV2?=
 =?utf-8?B?VytZMXgwODJiZ3hLZGU2bGx6emVRWGI1bE9mS0NYVmNLWjdOYWR6eUo3N3Jy?=
 =?utf-8?B?SmJNVmF1UWttSjROSCtWdk5NTFdwa1AzaGY1VDN5dCtrVDk5d0FINVF6UkNP?=
 =?utf-8?B?ZDV2MEJBVWRWTHFNWWRJNm45SjhIQnRSaStER011NVY3QVpZMWhCY2RaTm5B?=
 =?utf-8?Q?lXQn0+ZKaaxpbOfmRzWejNf20nx2dxsR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2dXa2MzV1kzelQ1eVI1bEZjSlZ3QWw0T1NhYUttVklONkl3bDBOVTZvNWw1?=
 =?utf-8?B?bTg5bVFQc0tSeEl2eDNqWU45YUc0VjhsMFpRRVdpVjZiZVRzYUlOZnFUZElw?=
 =?utf-8?B?dlBuYWgzcHBQeDZhQU1tNVNLVW4wcmpIWk5XdTJ0R3hianQ1RG13TDhFZXJL?=
 =?utf-8?B?SWFKZWFURzdnWVAxclNZN3pRM3pZL1FLbFBKZXN2OFZuSHZSdGYrR3dZd3Vl?=
 =?utf-8?B?WThTQkc1cTVuNVlLMkw0ZmFBVDNaSERIZFdYQXJmckhhVkVoaFFWVTVDdi9R?=
 =?utf-8?B?OHlnR3FYMThIQ2ZlUUlSdEJQeS80aHdwQzhiV2pWYzNEK2NZblVkVXJ4ZFhq?=
 =?utf-8?B?aGFxcFg0ZEJQSUhrRUlIWjBMSWQ5OFdacjhNOWdKempwZG55bnRlVUxoS2h2?=
 =?utf-8?B?SXlDVGV2ZDRGckp3VW9ZdmNKUVFOc3hkQkRWUlBCZTA4azdhb3k2RUU2c2Q1?=
 =?utf-8?B?Q3F3MGc0R2QrMjh1SkdzOUtxeGZoYW5iVWxaWE5sbnViUGJWTTlnWFJTNTJj?=
 =?utf-8?B?bm9oeDNQMXlZRUh3ZWVhVkJUVXpmRWJld0ZXZnVVb0xtaFA2Nmp3UE5ucTNO?=
 =?utf-8?B?ZklSYTFsVnpvZkNPdnJqaW4zcVd1MUNrQzFoMHY4S3FNNjJOeUJLWjlqU01K?=
 =?utf-8?B?bnZYaUZzTVlOcTdUQVVkSnpDandIOFd5MXNTSmh5RjdEZnBWRU1ZZ1FjY3E5?=
 =?utf-8?B?NXRUYm1kZUQyUnd3TDd2azRxS3RPYTNhZmU1c3RzbGFKeFBpTGZOZVJDcmJq?=
 =?utf-8?B?WVU0TmM2KytxUDVvdFdWcWttcXN3ZDF2SjJxYUZNQXlIdy82REhBRWkvNFpX?=
 =?utf-8?B?dUVrOGlPeXMrQjB5d0pvYWhEd1B1dW83TlhSU2dDTDd0UkFGQ1FDMlFrSS81?=
 =?utf-8?B?blc4blo5dVJDSmQwbFBNTi9lOVgvM2Q3UWxhb3N4ZDZWTGp3Nys5ZjcxK1Rx?=
 =?utf-8?B?UUNmc21MV0NyY2NBSGVnZ2ZQczJmN3psRVdYL210VFQ2d3F6MzNiYXN0NHhI?=
 =?utf-8?B?cjhLMnhFY0JJK1QrTVdNNUtjR3FvZWZBQnhCSWw4RjZkUVR0bVVSZVVqZ2ho?=
 =?utf-8?B?d3lsR2VsWE92dnpmZE82aklkUjBYcTR5TG43ajd3TWZLMUJndmZTUTN2UTFh?=
 =?utf-8?B?bkJ1WDlPREQvaHkvUFA1Wi9xWjhPeElKdG16K1Z3cW94Ti9qOEZjY01rSitM?=
 =?utf-8?B?N1NvMExjSUtBQ2E1WFpTalBLREloNWJ5RUFVbk90eW1VL29iKzRPWTNOMnFE?=
 =?utf-8?B?V0JYUVNqVXRoMU5rdThjUGxYUm5qNnZ1SVRXOHR1M3JTYUxTU0V3ZWFiMTBo?=
 =?utf-8?B?S2RXa0pGdDE2bHNFQlo4dVVoNWpIaXRZa0Zad212RzRzNlQvQ3p6YmdiNCtX?=
 =?utf-8?B?OTFzbWJOUHo3Q2pvcEV3c3hYZVE1Y25zVzFlcFJNMVNLQU1Rc2dPWmI3MGJS?=
 =?utf-8?B?U1dUTGRNbGpsM2RudFVabmo4c2RjNGJ0ck1lM1V2QTMySTVzd01OVVN0QjUy?=
 =?utf-8?B?bHUxM04vREtBMTF6dHM4UkF3OUJ5bjc1U0N2RXpQd09TZ1JtZ1NTZGFwNENh?=
 =?utf-8?B?TXBPN1pOK2dOMDZMY2p1S2NDVHpwTmx4MDBsSW5RZE90WXFxaHI5UG0vTnI4?=
 =?utf-8?B?RDl5eHgwSjNhOCt4SnBua1BFVHBNYWdRaTJxQUpWZW8vZWV3c3d5V0ZoZXV1?=
 =?utf-8?B?QXdvT0g5L3RYWHFnaU9naXZWZGRPWEc0K0c3MEY0K1RDL28xaEdYd0lSd1Nk?=
 =?utf-8?B?cDhpVVZFRzVqRWMvQm9PdXNNK0lyMXhSOEZSVk94S29VNG1zQkwxNmRBNGk4?=
 =?utf-8?B?VkFkNHV5VWVmM0ZpZFpKRGJVczZVR3gxMFAvN2ZQNmxLMXhrbEVSSThNTDVo?=
 =?utf-8?B?S0tCQzgxckVQbm5NNUpEcUFJakR3SXFwWkNGZ2NidTh6Wm1VaTQ2V3MrdTRX?=
 =?utf-8?B?TlZ5dXF1SGRiS1BMb0hKNSthbCtSSll1RFdEMVloaUt2anZTRDdqNnJuTjly?=
 =?utf-8?B?YmFEK2hQODVjUTJsNlN1bms1UXVBY25JTXFJNGUyNUw3bTZYSldlT1hOMnVz?=
 =?utf-8?B?Z1dSaWVyY01kMzBnVDhLSkthY2NmVllLZUxZaTF3RU50dldET0F0cktldmtK?=
 =?utf-8?B?RVhLek8yc2tMVU9UcnV1TUxTWkIrL1BmN1hHc2pKWXpxQUk2VlJQb05hVE1F?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aae74a2-1cb9-4c13-0b26-08de2d382a9c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:07:19.1512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S04X/aMObhAoviNZ4PN7aCjazmDzq/vePNu1sJS+p+dFQ47/XeBhxcbK0TZT9X4yHDGvhTQWWZzUC5cT+Oi1rwOoSwPqoAR877Q8VOqmnOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10FBEE80C
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

On Tue, Nov 25, 2025 at 03:38:17PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/25/2025 12:08 AM, Michał Winiarski wrote:
> > Device specific VFIO driver variant for Xe will implement VF migration.
> > Export everything that's needed for migration ops.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile        |   2 +
> >  drivers/gpu/drm/xe/xe_sriov_vfio.c | 276 +++++++++++++++++++++++++++++
> >  include/drm/intel/xe_sriov_vfio.h  |  30 ++++
> >  3 files changed, 308 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
> >  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index b848da79a4e18..0938b00a4c7fe 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -184,6 +184,8 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf_sysfs.o \
> >  	xe_tile_sriov_pf_debugfs.o
> >  
> > +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> 
> hmm, shouldn't we also check for CONFIG_PCI_IOV ?
> otherwise, some PF functions might not be available
> or there some other implicit rule in Kconfig?

I did compile-test without CONFIG_PCI_IOV at some point, and it seems to
build fine for me.
But yeah - it should probably be pulled under CONFIG_PCI_IOV just like
other SR-IOV related files.
I'll do that (+ stubs for when CONFIG_PCI_IOV is disabled).

> 
> > +
> >  # include helpers for tests even when XE is built-in
> >  ifdef CONFIG_DRM_XE_KUNIT_TEST
> >  xe-y += tests/xe_kunit_helpers.o
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> > new file mode 100644
> > index 0000000000000..785f9a5027d10
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> > @@ -0,0 +1,276 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <drm/intel/xe_sriov_vfio.h>
> > +#include <linux/cleanup.h>
> > +
> > +#include "xe_pci.h"
> > +#include "xe_pm.h"
> > +#include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> > +
> > +/**
> > + * xe_sriov_vfio_get_pf() - Get PF &xe_device.
> > + * @pdev: the VF &pci_dev device
> > + *
> > + * Return: pointer to PF &xe_device, NULL otherwise.
> > + */
> > +struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
> > +{
> > +	return xe_pci_to_pf_device(pdev);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> > + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> > + *
> > + * Return: true if migration is supported, false otherwise.
> > + */
> > +bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
> > +{
> 
> hmm, I'm wondering if maybe we should also check for NULL xe in all those
> functions, as above helper function might return NULL in some unlikely case
> 
> but maybe this is too defensive

I think it's too defensive.
The xe_sriov_vfio_get_pf() is used in one place, and the return value is
checked. Worst case - not checking the return value will be caught early
as it will explode immediately with NULL-ptr-deref.

> 
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -EPERM;
> > +
> > +	return xe_sriov_pf_migration_supported(xe);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> > +
> 
> everything else lgtm, so:
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
