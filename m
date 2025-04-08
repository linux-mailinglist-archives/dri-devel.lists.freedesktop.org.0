Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701FA80A4D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC42310E64A;
	Tue,  8 Apr 2025 13:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clLBgYb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200E10E64A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744117427; x=1775653427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xw4iO7LUaK3MMst8x1XX1F4WTM5qPQiPUiSnXwFlbDs=;
 b=clLBgYb5a88m+eTvr4uu9d2FTdIFODeN35MTOQPajE5qu7QQZGsOvk7p
 G+IXZI6q9naQv4VXMKnVgfJ2ZRNyWABvpQ+2qqCxwL0iL4jTkxKl8vF3D
 RhuPu5hEgzqfcOr5Iwy2mypWZsDpVibUp7FAMnJ10k5Sz+ikueNFXwRjb
 /t+syFMcZdx57zXIPlaBsNx8VZUC3OjJSNzxDVVKuSJgvsTATdRjnlj/g
 /lxdjLUVdCr2ICNVjglUJPzBO4ByaWETAH/XFDToopZQBXxBEJmQ0g6Jf
 UlNHonfkWJrcGF6mfjPmfLEQILxQMjN0MxIYCQ02hSAjQGHemu5DgD6Eh g==;
X-CSE-ConnectionGUID: W8M+IBKNS++NoF9j7MGF3g==
X-CSE-MsgGUID: 9SxL2FbHQXm6rcYa5fZQgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33150753"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="33150753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:03:46 -0700
X-CSE-ConnectionGUID: UtrIYlrSQkuxbceypJOIig==
X-CSE-MsgGUID: 86p2fwR6SbKo10Pf0s+Jxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133135761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 06:03:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 06:03:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 06:03:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 06:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kd7r1kmI3DAZOKOAbcGcFDpQYWx2zlFZYGAFaMkOgHUb937FbwKxVm4TGknAjNU9gmr+tLpod7t+6Mv/13wYuMo52Gt88PPL+LpEQ2Hsy/0kbapLqXzYjbJ3F4P7u656EDOa7iQjc269wgxNlyDMGC5eDn5WKvjxf3n9eVwrUdzYPabNWi4dbGiphO4perdpQIrTt7YPIfysqlebnQ+RIxOoGFDenRdlcb1JYSdlLXeI67rxXXldmwxBZMxn7I5Zew1oLfVHZdCrBjKv1bTlIOjXK5mEemWD0ylZgzkSw83dkjXasIs5M8QitlGb8afyjIkJWPFdu8fd3zKkyAoCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw4iO7LUaK3MMst8x1XX1F4WTM5qPQiPUiSnXwFlbDs=;
 b=F1G9/T3Jeo+SmHjavhyh3BjmLiUUBNphQSedSDDUqjDBUytA162fu++dkedYFmT2zpr69eH2z3grO2ZirunDnpiHFlafxCKE90gGL2AAxQfcxdD2kizwnxA6Wy0WbCYxPEQYEod/lDGymX3Teg3WgsCTd4G7PDATHLJbJfP4FfCCaMiMzxZuy9IC9PEklOE9xXOcY25lAdgPeAhWerlvq1KIrSOh0KyOQQw5xU90An2ipnpdwodJXE3bNe94CcT+F3OwO2VCl9EYrMHdY0udnnh/K5cgWdngLIauPT9o/itewsu62puUfJEoln//7ExwVg0eZxNNg/AhQYVBoF8/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 13:03:27 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 13:03:27 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Anusha Srivatsa
 <asrivats@redhat.com>, "Deak, Imre" <imre.deak@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj
 <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Thread-Topic: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Thread-Index: AQHboyhWVpiK92KDl0qJgKPM4BrFCLOYYvOAgAB+pQCAAA+RgIAAFusAgAAnWICAAC1owIAAZm8AgAADL+A=
Date: Tue, 8 Apr 2025 13:03:27 +0000
Message-ID: <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250408-industrious-impetuous-wombat-f6d7dc@houat>
In-Reply-To: <20250408-industrious-impetuous-wombat-f6d7dc@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH8PR11MB8064:EE_
x-ms-office365-filtering-correlation-id: f421d6f8-e427-4278-1ce7-08dd769dc0ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VnYvZjBuakZPcVI4cmNKN3kxdW5LdFJUWC9waU5jTFJGMk5BODBrN1l4VFJl?=
 =?utf-8?B?eDhVTEZUczB6UW5Cdk05cHBRR1BpNHBmZ2hwOTd6K0hPWUVSeTBYOWx3L2d5?=
 =?utf-8?B?Q3IrckZlT1hBSENzL2UrR0UyNFJpckFNaCs4NG1kYUFYbVF5RkZxQ3RPaEJh?=
 =?utf-8?B?Sit2QjZnVEJzN1FFYTRJNDA3NkxlWUdIWVpKZkZqcnloZ21kT3Q5Q3puQmEv?=
 =?utf-8?B?eDRFQUtWdEU2MkswRDFWL3hybVJzaCs5Vm5EdjJOVDBERkRTODArQUJWUVpD?=
 =?utf-8?B?bGFOUFZxOGFHajJNYVhmUG9OMy9yQ2hlcnJINmdoZm9FK3VvbERTSUxlVTc1?=
 =?utf-8?B?bHBQaXF3R3dteXFPUTNXbnh4Rm1YQXp0YVFLcmNINFFsTEM4d09yWFNTV21E?=
 =?utf-8?B?K3BPSlNZcm1JdW5ZM3l3cGtRK1owRVdvUG4rZGp2U2ZHSjA2a3FBYVB5Uk04?=
 =?utf-8?B?cW03TnRJV3R3Ym11YkZWKy9rOGlrdTFKbzUwV0p0VXZ6Q1FUQ1N1T3BHM2dv?=
 =?utf-8?B?eisyUi9KK2ZlZVMzbTFqOVQxRGhQUjljWjRKSkJDdzBESmRKTUhBY3VyTzJC?=
 =?utf-8?B?S2gzMVNUNVRMa1dPZ284ckFoZG9EcTBxQk55ZnI5U2V4RmpaK0p4bXFpLzJB?=
 =?utf-8?B?RFJia2ExZzlzN2N5SlZsOUh4cnR1TXE4bnlTNGRoUFREeTlxamZ6c2JaVG4v?=
 =?utf-8?B?U0tWTlRjck12UEhrR21CbUFDb2ptZ0tCMXpKTlF3dXc3a2w2eGRLcHpOZjhk?=
 =?utf-8?B?YzBNRS9MUXhTYno3WHloa04wTStpM0JjTzNhZFRzM2t1cnl1QUVqVmF3bGIw?=
 =?utf-8?B?VWw5aE9jV3pZRlhlWFhoVjFKSEEyeTlzanZPMjhwSy9Qem1RdWVoR1RUNmxo?=
 =?utf-8?B?cTFReWk0cXdZME4xamZlNytSZnc4ZTJ0dkt6NWlPY0V5SFM5WGkrdW1HWm5F?=
 =?utf-8?B?V1dSR0NjdUl2dDVzcFhKR2NSdCs1YUo3RXRVUmdTVVFZVm44M3ZxeGNnOGpq?=
 =?utf-8?B?dUpGSTF6MHlscDJSdkUxZGZVcGZJZkE1bWgzZm5FRU5sRDUvSDlLTElDTmpS?=
 =?utf-8?B?am5hZnhIbXpiZSs5eVcwbnNLRFg2RnFsbkNVcW1ualZ4Z3hGM2VOcTl4Z01q?=
 =?utf-8?B?NENmTXRGblJDNjM4OXN0NkE0aXBSTzA2b0tUbUJ4TnExSjhlLzFPRjJxU2lZ?=
 =?utf-8?B?VXY5Y3JwbVRmalVPVVh1d0FmenNIVUNqeCt6aFJOOGpRL2dnS2cwZDdybkRv?=
 =?utf-8?B?bWpNVWxTV2c1ZUk5ZmVpdTlnTWJxbFBWbHBJVG1nR09FanpNSHRwdmJoL2py?=
 =?utf-8?B?STBLWDFRVEowNHYyeEFkd3RtZlNTbnUrbkowL2wxak41eWFqeDNNNStYME1w?=
 =?utf-8?B?VENEZFYrVHVBamhKRnlNTnBFWjFEalhVa2ZBZStGMHdpdFBsTzFxR0V6V01k?=
 =?utf-8?B?azU2YkI0NlFxZVFobkFpckZ0UlVERkVodlhJZkF4b0laMnVpVlpFY1lraGUv?=
 =?utf-8?B?MFBaaTFFNU52VHBEd3pFaXZpUlVsU1NaaUZJNGRHbkVML3dPRUdmVDZCSUlm?=
 =?utf-8?B?d0VvVzdCc29HZ0lBeStKQ3IxWjBmc0lUNnlPVjBiV2E3WGtIN0pOdGRWNGRa?=
 =?utf-8?B?SWtSUDFQRWVjRHEyY3cxYUozTnBsQXBCdE5hYUlpS3B2QzF3YWZNY3BQMjV4?=
 =?utf-8?B?emk4VEtzTnV1L2pud0pmWmZVQUZxd1BXOEhUSFlCMG5qNkJjNXBhVmlGWmF2?=
 =?utf-8?B?YmFhL1hWaEpoemNUMmJUWHo1SGs2eU91bDJ4M3pkWERBWWNIZnVrc3RBb0Jm?=
 =?utf-8?B?N3N4RVpOd2NHNndXOXJtQ0NRb1FqQzM3WEMyQ1pYUC9vaExwYmxJQ2VLRG1y?=
 =?utf-8?B?UjJ1NTJzcndHdXNmeWRJalVFT3Rpd29SY1o2ZHZVejdKcHVtL3ZmRGMrZ01y?=
 =?utf-8?Q?82Cms1Sm21Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHlId3VNWkt2TC94T0hUNmd4TFhQVWZ6ODNvd2dEd01EUVdqVlZOSER0UWxW?=
 =?utf-8?B?dE1tMVRMU3FvY3RKa2pVbHAyem03Nkg1b05YM05WV0kwN3N5Z1k1aUlOMExx?=
 =?utf-8?B?WHV3bkdDaUdPeHpSL1M2VVJsY1MxcEdIb2FsRWRoL00yOTMrdEJ0RVpsNENu?=
 =?utf-8?B?VmN5RzQySUkzSVM4dkJLTTNjN3ozWkpjejBNakdxNlVuNEljWHg3THVIak5J?=
 =?utf-8?B?WUphRExrRmhFaXBodE9EMVlxN2Y2bDFoWnVJU0Z2ME9lY3B2cnB0YTBaNjdy?=
 =?utf-8?B?MXBHVndhalozaDI2WElYTzZIbkNCQWxUaitGZ0lTSkh5MHZ3ZVNLbGFaMWhs?=
 =?utf-8?B?MVFQcHpKRmdta2tUNGVHaEJQUVFjUFNYanVRU001ZWlaVnFyMFJ1MWo4Yit0?=
 =?utf-8?B?dmJPdmhSSm4yT2FZak0vWWJwc2x3Q2NrOEw0NGx6elgvQS85S3hHeE9LaGYw?=
 =?utf-8?B?N280WFBhVzBJRjlxZUVDWDdaaTNPR3k0cUR5THM4cjQ0SS92UVZJVzV4Vkcz?=
 =?utf-8?B?UFJPazE4UWgxR0l2MkJjUEZ6VE1TWVRMVW1vR1NQMlVEYWdPcnB0VlFsR1RR?=
 =?utf-8?B?aC9uMG1wa3RuMWxyQnVQMjVMYW9CSi9rTVp1dzUydEZ0Tm1HL0RDbFhDM3dp?=
 =?utf-8?B?dnZ5d1VaN0ZSTTNrWHhYeWtSN20wMXFIR1cvZitzM0plZ3dCcEpqK3ZaeEx2?=
 =?utf-8?B?M3lTTVhQVGp6MkFoNkYrMVBaaG80WXpGSFlUcmRWQTM0NlBsV3FJV29oazNu?=
 =?utf-8?B?b2c0YnVHS0M4cVMrejhIYy9Rcm1ZcGF3NHBPeXV0STNSemw3aDl2cGc4cEZ5?=
 =?utf-8?B?N1JSZ29yRHRmM25UUWNxUnIyWVZMSTBKUDlEd0JpSDBJdjYvUEZXYU1BbnRs?=
 =?utf-8?B?dEZ2L01jYmp6eW1rSVEzZXJnY3JaVHVneFREM1Uzei9CTzlIc2NGdjZweEtq?=
 =?utf-8?B?dGkxMEZpOCtoSWJET1RNQmpqMWJvVEZCeUJJOERLdGNMSFliRHZwYVlMNTI1?=
 =?utf-8?B?MDRHYVY5TktIa3hxOTJjeDFzTkVyVUx5akZkM0xXSmJIZ0VycTY4WHFQdVdQ?=
 =?utf-8?B?czRFK3Vwby9YM0lqNTRSaURQR2d4aExUNVo2djhyNlBpNHJqaG81KzY4MzE0?=
 =?utf-8?B?U1lLNlhtbFAzU2oyTUZTUXFaaFpIL0Q4dmtWeFRNUXlNcG9DLzcrcEhkMzhP?=
 =?utf-8?B?UFptZk9nQ3BxT0RzMXdZNHhiYU9XeWx1MjBYMkdiLzVHakVJRklRTURWU0pN?=
 =?utf-8?B?MHhFbEtwcHZmKzhaUytES1ZmQThBV2NrODNnZlFubUQ2ZGZ5S2NSeExHaW5E?=
 =?utf-8?B?NlN0Q3gxbTF2QjJNd25jQWxTR3dXaWcwVDdCV2Y0WW9YaDJYNEQ1bnF2Q2pU?=
 =?utf-8?B?ekVYWmF3THQ1aExobm1PZ0RZNXNrZDd0QlBYUkdrMDlYK1RveVhGZXg1RnhR?=
 =?utf-8?B?b1JKckZYcHZyWkl0V3JDUE0xYzg1eWVGV2xOTEpHOGtLcU9pbnBCQTdZZTNp?=
 =?utf-8?B?N3JhNU4xdzBiY1VNc3NKMFhIN2lxVXZOMGVyN0pMdmNPOXFtV1k3Uk1sMmV1?=
 =?utf-8?B?UlpieUlUa1dySEh0Z3N2My8ySFFKb0NhakRKUTBybFA1WVhhS0drSnZ1Q2tN?=
 =?utf-8?B?SnMySUREMzJFMVAxcE9INjl0MXdlTlh6cnNBaU5rbFhDSm1rNHZJbFZCQ3lz?=
 =?utf-8?B?MFJJeHZwdDRLZnlnYTNkc2thOGg0b0VVYkl2RVl0azBiMiszVHNlTVRXOURz?=
 =?utf-8?B?YTI1ZmpUa0tMWUVWUDJuVFpLT2hweThFUDJXV1l2RktpeU9EeGFpRHdERm5u?=
 =?utf-8?B?OWF2NzNrNjhucXNPMzRITWczaFJQUVU5K3ByUGNHbjVuRG5XREZsY1Iwc0dO?=
 =?utf-8?B?eDhUU2Y1NGJsMFBmL0tzWjlCZHJtWjZsNmljUDBIdWhwK2tXVEt5ZFJ5YWVu?=
 =?utf-8?B?djlQQW41ZWFBalVjbkpTeXQ3Wk0waFFONFQvaTExa1hHN0NEVkpKNHh3M1Bv?=
 =?utf-8?B?SzlETVo3eUJYbUsrU0ZJeWhwSzFmTjJTdDBkRVNrWEIvMVBtSFAzQTdlZzh2?=
 =?utf-8?B?Y3FVZVROVm8yY1RmTTJFZ2NSNXVVMFM3YUszWm9melNuckxNNktzUTVxdVA3?=
 =?utf-8?B?ak9Bc0QwQ05UMUdCcUJuUTh1by9kQk1aZDQ4c05XaEZhMU9SSVF3U3ZROU9v?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f421d6f8-e427-4278-1ce7-08dd769dc0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 13:03:27.4912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGs6oaK7SWMlNrW5QOnTCNVD+WJePKzihglK0VzmTXg5ar1qArGcwu70IZT120mlAGBQj10tAp9fky69fXBQC5TLN7/MnIPhe70DWLk+7pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDgsIDIwMjUgNjoyMCBQTQ0K
PiBUbzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVs
LmNvbT4NCj4gQ2M6IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPjsg
QW51c2hhIFNyaXZhdHNhDQo+IDxhc3JpdmF0c0ByZWRoYXQuY29tPjsgRGVhaywgSW1yZSA8aW1y
ZS5kZWFrQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nDQo+IDxuZWlsLmFybXN0cm9uZ0BsaW5h
cm8ub3JnPjsgSmVzc2ljYSBaaGFuZyA8cXVpY19qZXNzemhhbkBxdWljaW5jLmNvbT47DQo+IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBUaG9t
YXMNCj4gWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFpcmxpZSA8YWly
bGllZEBnbWFpbC5jb20+Ow0KPiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ow0KPiBKb2VsIFNlbHZhcmFqIDxq
b0Bqc2ZhbWlseS5pbj47IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz47
DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNC8xMF0gcGFuZWwvYXVvLWEwMzBqdG4w
MTogVXNlIHJlZmNvdW50ZWQgYWxsb2NhdGlvbiBpbg0KPiBwbGFjZSBvZiBkZXZtX2t6YWxsb2Mo
KQ0KPiANCj4gT24gVHVlLCBBcHIgMDgsIDIwMjUgYXQgMDY6NDc6MDZBTSArMDAwMCwgQm9yYWgs
IENoYWl0YW55YSBLdW1hciB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4gT2YgRGl4aXQsIEFzaHV0b3NoDQo+
ID4gPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA4LCAyMDI1IDk6MzEgQU0NCj4gPiA+IFRvOiBBbnVz
aGEgU3JpdmF0c2EgPGFzcml2YXRzQHJlZGhhdC5jb20+DQo+ID4gPiBDYzogRGVhaywgSW1yZSA8
aW1yZS5kZWFrQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nDQo+ID4gPiA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz47IEplc3NpY2EgWmhhbmcNCj4gPiA+IDxxdWljX2plc3N6aGFuQHF1aWNp
bmMuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPiA+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+ID4gPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsg
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZA0KPiA+ID4g
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5j
aD47IExpbnVzDQo+ID4gPiBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBKb2Vs
IFNlbHZhcmFqIDxqb0Bqc2ZhbWlseS5pbj47DQo+ID4gPiBEb3VnbGFzIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+Ow0KPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgtIGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMDQvMTBdIHBhbmVsL2F1by1hMDMwanRuMDE6IFVzZSByZWZjb3VudGVkDQo+ID4gPiBhbGxv
Y2F0aW9uIGluIHBsYWNlIG9mIGRldm1fa3phbGxvYygpDQo+ID4gPg0KPiA+ID4gT24gTW9uLCAw
NyBBcHIgMjAyNSAxODo0MDoyNCAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+ID4g
Pg0KPiA+ID4gPiBPbiBNb24sIDA3IEFwciAyMDI1IDE3OjE4OjIzIC0wNzAwLCBEaXhpdCwgQXNo
dXRvc2ggd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBNb24sIDA3IEFwciAyMDI1IDE2
OjIyOjQwIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gT24gTW9uLCAwNyBBcHIgMjAyNSAwODo0OToyMyAtMDcwMCwgSW1yZSBEZWFrIHdyb3Rl
Og0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gT24gVHVlLCBBcHIgMDEsIDIwMjUgYXQgMTI6MDM6NDdQTSAtMDQwMCwgQW51c2hh
IFNyaXZhdHNhIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IE1vdmUgdG8gdXNpbmcgdGhlIG5ldyBB
UEkgZGV2bV9kcm1fcGFuZWxfYWxsb2MoKSB0bw0KPiA+ID4gPiA+ID4gPiA+IGFsbG9jYXRlIHRo
ZSBwYW5lbC4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFudXNoYSBTcml2YXRzYSA8YXNyaXZhdHNAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWF1by1hMDMw
anRuMDEuYyB8IDEwDQo+ID4gPiA+ID4gPiA+ID4gKysrKy0tLS0tLQ0KPiA+ID4gPiA+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1hdW8tYTAzMGp0bjAxLmMNCj4gPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1hdW8tYTAzMGp0bjAxLmMNCj4gPiA+ID4gPiA+ID4gPiBpbmRleA0K
PiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA3NzYwNGQ2YTRlNzJjOTE1YzQwNTc1YmUwZTQ3ODEwYzkw
YjRlZDcxLi44MzUyOWIxYzJiYWMyZTI5ZjQxZQ0KPiA+ID4gPiA+ID4gPiA+IGZhZjQwMjg5NTAy
MTRiMDU2YTk1IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1hdW8tYTAzMGp0bjAxLmMNCj4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtYXVvLWEwMzBqdG4wMS5jDQo+ID4gPiA+ID4gPiA+ID4gQEAg
LTIwMCw5ICsyMDAsMTAgQEAgc3RhdGljIGludCBhMDMwanRuMDFfcHJvYmUoc3RydWN0DQo+ID4g
PiA+ID4gPiA+ID4gc3BpX2RldmljZSAqc3BpKQ0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+ID4Jc3BpLT5tb2RlIHw9IFNQSV9NT0RFXzMgfCBTUElfM1dJUkU7DQo+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiAtCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBy
aXYpLCBHRlBfS0VSTkVMKTsNCj4gPiA+ID4gPiA+ID4gPiAtCWlmICghcHJpdikNCj4gPiA+ID4g
PiA+ID4gPiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gPiA+ID4gPiA+ID4gPiArCXBhbmVsID0gZGV2
bV9kcm1fcGFuZWxfYWxsb2MoZGV2LCBzdHJ1Y3QgYTAzMGp0bjAxLCBwYW5lbCwNCj4gPiA+ID4g
PiA+ID4gPiArCQkJCSAgICAgJmEwMzBqdG4wMV9mdW5jcywNCj4gPiA+IERSTV9NT0RFX0NPTk5F
Q1RPUl9EUEkpOw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGlzIGRvZXNuJ3QgY29t
cGlsZSBhbmQgKHlldCkgaXQncyBwdXNoZWQgYWxyZWFkeSB0byBkcm0tdGlwLg0KPiA+ID4gPiA+
ID4gPkFGQUlVICBpdCdzIHN1cHBvc2VkIHRvIGJlDQo+ID4gPiA+ID4gPiA+CXByaXYgPSBkZXZt
X2RybV9wYW5lbF9hbGxvYyguLi4pOw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFllczoNCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYXVvLWEw
MzBqdG4wMS5jOiBJbiBmdW5jdGlvbg0KPiA+ID4g4oCYYTAzMGp0bjAxX3Byb2Jl4oCZOg0KPiA+
ID4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWF1by1hMDMwanRuMDEuYzoyMDM6
OTogZXJyb3I6IOKAmHBhbmVs4oCZDQo+ID4gPiB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikNCj4gPiA+ID4gPiA+ICAgMjAzIHwgICAgICAgICBwYW5lbCA9IGRldm1fZHJt
X3BhbmVsX2FsbG9jKGRldiwgc3RydWN0IGEwMzBqdG4wMSwNCj4gcGFuZWwsDQo+ID4gPiA+ID4g
PiAgICAgICB8ICAgICAgICAgXn5+fn4NCj4gPiA+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1hdW8tYTAzMGp0bjAxLmM6MjAzOjk6IG5vdGU6IGVhY2gNCj4gPiA+ID4gPiA+IHVu
ZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rp
b24NCj4gPiA+ID4gPiA+IGl0IGFwcGVhcnMgaW4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBQ
bGVhc2UgdHVybiBvbiB0aGUgY29uZmlnIG9wdGlvbnMgZm9yIHBhcnRpY3VsYXIgbW9kdWxlIGlm
IHlvdQ0KPiA+ID4gPiA+ID4gYXJlIG1ha2luZyBjaGFuZ2VzIHRvIHRoYXQgbW9kdWxlLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gVGhvdWdoIHByb2JhYmx5LCB5b3UgY2FuIGFyZ3VlLCB0aGF0IHRo
ZSBwcmUtbWVyZ2UgQ0kgYnVpbGQNCj4gPiA+ID4gPiBzaG91bGQgYWxyZWFkeSBiZSBkb2luZyB0
aGlzLiBBIHNvcnQgb2YgYWxsbW9kY29uZmlnIGZvciB0aGUgRFJNDQo+ID4gPiA+ID4gc3Vic3lz
dGVtLCBzbyB0aGF0IHRoZXNlIGtpbmRzIG9mIGlzc3VlcyBkb24ndCBnZXQgbWlzc2VkLg0KPiA+
ID4gPg0KPiA+ID4gPiBNb3JlIGNvbXBpbGUgZXJyb3JzOg0KPiA+ID4gPg0KPiA+ID4gPiBJJ20g
c3RpbGwgZ2V0dGluZyBzb21lIGFsbG1vZGNvbmZpZyBlcnJvcnM6DQo+ID4gPiA+DQo+ID4gPiA+
IC4uL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdGgxMDFtYjMxaWcwMDItMjhhLmM6
IEluDQo+ID4gPiA+IGZ1bmN0aW9uDQo+ID4gPiAnYm9lX3RoMTAxbWIzMWlnMDAyX2RzaV9wcm9i
ZSc6DQo+ID4gPiA+IC4uL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdGgxMDFtYjMx
aWcwMDItMjhhLmM6MzUyOjk6DQo+IGVycm9yOg0KPiA+ID4gJ3BhbmVsJyB1bmRlY2xhcmVkIChm
aXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikNCj4gPiA+ID4gICAzNTIgfCAgICAgICAgIHBhbmVs
ID0gZGV2bV9kcm1fcGFuZWxfYWxsb2MoZGV2LCBzdHJ1Y3QgcGFuZWxfZGVzYywNCj4gcGFuZWws
DQo+ID4gPiA+ICAgICAgIHwgICAgICAgICBefn5+fg0KPiA+ID4gPiAuLi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtYm9lLXRoMTAxbWIzMWlnMDAyLTI4YS5jOjM1Mjo5Og0KPiBub3RlOg0K
PiA+ID4gPiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2Ug
Zm9yIGVhY2ggZnVuY3Rpb24NCj4gPiA+ID4gaXQgYXBwZWFycw0KPiA+ID4gaW4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC4uL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtDQo+ID4gPiB0
aDEwMW1iMzFpZzAwMi0yOGEuYzoxODoNCj4gPiA+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWJvZS10aDEwMW1iMzFpZzAwMi0yOGEuYzozNTI6Mzg6DQo+IGVycm9yOg0KPiA+ID4g
J2RldicgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4gJ2NkZXYnPw0KPiA+ID4gPiAgIDM1MiB8ICAgICAgICAgcGFuZWwgPSBkZXZtX2RybV9wYW5l
bF9hbGxvYyhkZXYsIHN0cnVjdCBwYW5lbF9kZXNjLA0KPiBwYW5lbCwNCj4gPiA+ID4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+DQo+ID4gPiA+IC4uL2lu
Y2x1ZGUvZHJtL2RybV9wYW5lbC5oOjMwNTo0MTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNy
bw0KPiA+ID4gJ2Rldm1fZHJtX3BhbmVsX2FsbG9jJw0KPiA+ID4gPiAgIDMwNSB8ICAgICAgICAg
KCh0eXBlICopX19kZXZtX2RybV9wYW5lbF9hbGxvYyhkZXYsIHNpemVvZih0eXBlKSwgXA0KPiA+
ID4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4N
Cj4gPiA+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2luY2x1ZGUvdWFwaS9saW51eC9wb3Np
eF90eXBlcy5oOjUsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL3Vh
cGkvbGludXgvdHlwZXMuaDoxNCwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2lu
Y2x1ZGUvbGludXgvdHlwZXMuaDo2LA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgIGZyb20gLi4v
aW5jbHVkZS9saW51eC9tYXRoLmg6NSwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4u
L2luY2x1ZGUvbGludXgvZGVsYXkuaDoxMiwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9t
DQo+ID4gPiA+IC4uL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdGgxMDFtYjMxaWcw
MDItDQo+ID4gPiAyOGEuYzo4Og0KPiA+ID4gPiAuLi9pbmNsdWRlL2xpbnV4L3N0ZGRlZi5oOjE2
OjMzOiBlcnJvcjogJ3N0cnVjdCBwYW5lbF9kZXNjJyBoYXMgbm8NCj4gPiA+ID4gbWVtYmVyDQo+
ID4gPiBuYW1lZCAncGFuZWwnDQo+ID4gPiA+ICAgIDE2IHwgI2RlZmluZSBvZmZzZXRvZihUWVBF
LCBNRU1CRVIpICBfX2J1aWx0aW5fb2Zmc2V0b2YoVFlQRSwNCj4gTUVNQkVSKQ0KPiA+ID4gPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
DQo+ID4gPiA+IC4uL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOjMwNjo0MTogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvDQo+ICdvZmZzZXRvZicNCj4gPiA+ID4gICAzMDYgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2YodHlwZSwgbWVtYmVyKSwgZnVu
Y3MsIFwNCj4gPiA+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn4NCj4gPiA+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJv
ZS10aDEwMW1iMzFpZzAwMi0yOGEuYzozNTI6MTc6DQo+IG5vdGU6DQo+ID4gPiBpbiBleHBhbnNp
b24gb2YgbWFjcm8gJ2Rldm1fZHJtX3BhbmVsX2FsbG9jJw0KPiA+ID4gPiAgIDM1MiB8ICAgICAg
ICAgcGFuZWwgPSBkZXZtX2RybV9wYW5lbF9hbGxvYyhkZXYsIHN0cnVjdCBwYW5lbF9kZXNjLA0K
PiBwYW5lbCwNCj4gPiA+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBJbiBjYXNlIGl0IGlzIG5vdCBjbGVhciwgdG8g
cmVwcm9kdWNlIGFuZCBmaXggdGhlc2UsIGRvOg0KPiA+ID4NCj4gPiA+IAltYWtlIC1qJChucHJv
YykgYWxsbW9kY29uZmlnDQo+ID4gPg0KPiA+ID4NCj4gPg0KPiA+IFdlIHdpbGwgbmVlZCBtb3Jl
IGNoYW5nZXMgdGhhbiBmaXhpbmcgdGhlIHZhcmlhYmxlIG5hbWVzLg0KPiA+DQo+ID4gSSBnZXQg
dGhpcyBlcnJvcg0KPiA+DQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJfX2Rldm1fZHJtX3BhbmVsX2Fs
bG9jIg0KPiBbZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWF1by1hMDMwanRuMDEua29dIHVu
ZGVmaW5lZCENCj4gPiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxNDc6
IE1vZHVsZS5zeW12ZXJzXSBFcnJvciAxDQo+ID4gbWFrZVsxXTogKioqDQo+ID4gWy9ob21lL2No
YWl0YW55YS9leG9kdXMvcmVwb3MvZHJtLXRpcC1zYW5kYm94L01ha2VmaWxlOjE5NTY6DQo+IG1v
ZHBvc3RdDQo+ID4gRXJyb3IgMg0KPiA+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MjQ4OiBfX3N1Yi1t
YWtlXSBFcnJvciAyDQo+ID4NCj4gPiBhZnRlciBtYWtpbmcgdGhlIGZvbGxvd2luZyBjaGFuZ2Uu
DQo+IA0KPiBJIGNvdWxkbid0IHJlcHJvZHVjZSB0aGlzIG9uZSBvbiBjdXJyZW50IGRybS1taXNj
LW5leHQgd2l0aCBhcm02NCBhbmQNCj4geDg2IGFsbG1vZGNvbmZpZy4gQ291bGQgeW91IHNoYXJl
IHlvdXIgY29uZmlndXJhdGlvbj8NCj4gDQoNCkhlcmUgaXMgdGhlIGNvbmZpZyB0aGF0IG91ciBD
SSB1c2VzDQoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUvY2kvLS9yYXcv
bWFpbi9rZXJuZWwva2NvbmZpZw0KDQpSZWdhcmRzDQoNCkNoYWl0YW55YQ0KDQo+IE1heGltZQ0K
