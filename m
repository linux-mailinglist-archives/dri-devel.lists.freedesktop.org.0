Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86778AA9CB7
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 21:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC1810E10B;
	Mon,  5 May 2025 19:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ob+JNcsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356A10E10B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 19:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746473937; x=1778009937;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Oiwk437bemw6IOiHkdt9v86ckF70do1Nm3xvJi/YbpU=;
 b=Ob+JNcsRm0Jxz9YO3qmkUrOrR4BjK2nADs0y4vQMme+8NpQtHPyLhUol
 cWa8QeTOlPlncOuOAM5igya6tsj+DKBNDvv7k1pdaBzwPgFvycTlDrM5N
 sGdwIWVLViuwm3gaZh0lQ4/8Pe2JrZtRDQ4XOkvogH8V37Pg+aoXqpwpG
 stXaVv+9p05UU7+gclIHkdESafJpkJbbvPe1kknJhQMtWxcoxp1K7YUqi
 pr/WzWqnTNq74ofNJgJLSC0IWBvwb8gKdbCwue6FLn6ytIptCzz1yKYnT
 VS3lcX2FRsQkbrhv7jKzrOTshEFLxSjGRTaLOWaSdkz7JIaX7iy3VV36S w==;
X-CSE-ConnectionGUID: PA7AqrfWT0qJ67YlZjneBw==
X-CSE-MsgGUID: OQXofLYgRE6LjhG9o8Uv0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="73494627"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="73494627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 12:38:56 -0700
X-CSE-ConnectionGUID: WYrbxI+5TqqEg3Z0h4W/+g==
X-CSE-MsgGUID: uv5QjrJLQGyrq7+KAB8Apw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="135082174"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 12:38:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 12:38:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 12:38:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 12:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF5BcYj0J0Gu9OiwmD0npK/qH6fQRaS9YjgYzmOve/tiCNMXV8cq9a94q8+uEM1IRVtGTVDL40Ac/b1a7IvB/6ySoP0KpRfnvnXAKoCCGYmCbMSk9HTvQjbqqgrUHJBcuEvFh3puEVfzQaoebozEJShiLX7tuc0qsx17VBZrmXynLPryrORm6F68AUDNuECwQqvpgfKSco26D7mEKm5/xESiSC2/PTqDNjMqFVFPncqXPOmFtboqcoUCBnbh0EH8mVGAeKWh1Mk7mnUcq+10WDc6mrIN/THvtTWSlrenbjIAbtvJnnPunQ99fxly5IHptRS59tVPgUBISsQxpRV2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oiwk437bemw6IOiHkdt9v86ckF70do1Nm3xvJi/YbpU=;
 b=h9X+OE4f+24EYIZzQHr/AcZ/THEAJxVsdAf7ezthOlwVnrnQke8VfI4sWh5xQ5zkbCd7lWrNoUipd5I56nFu/5otpBW4YnemswUBhqUd5qR3LTNzcqwmsHH1VCp7HMxG96UdoOIjUHV0nz6xkBKXV+/Hn/GFpy7SoZ6pI7WkQpDHwYqgnUBYOwY7/DMhtPb+jWQ3dTuxcoZJu9egdDTwzMLvc4xCFmkHueevdp4mewjA3nOCfcmrqol6de1nGoGjFA82Dq9g3AvDqiJobgzEX6hOG/kE/0PrXVp9ZlOxXdRZ3/YlYPpqyjzAcfRFJBSeEVi7P/RnghNm3RIkqKYbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 19:38:52 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%7]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 19:38:52 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: RE: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Topic: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Index: AQHbveDGUI4ch9Wax0+wshHtMZeSmrPEbDcg
Date: Mon, 5 May 2025 19:38:52 +0000
Message-ID: <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
 <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
In-Reply-To: <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|MW3PR11MB4716:EE_
x-ms-office365-filtering-correlation-id: f76220ed-75fa-459f-f7f7-08dd8c0c773a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TDljSUFvWlhTbmtHRDZKTnQzT05LTFdHeis0YWNsNjRkUWFVT0dZS0o1ZHpK?=
 =?utf-8?B?ckdCcHlwc1hDdVE2UWl3cnkrQlkzSm5Tdk84RWZURWIxemJVT2F0ZTNXaVJ2?=
 =?utf-8?B?Tlc3MFRreEx3aGJOelBqb21rcUtvSm85ZWdqSG5SRUEwSkMzWDd1dUVQOEtv?=
 =?utf-8?B?djJ2MjJobFA0aVNnejVCMXFYdkZSWmpnSXJTZGMvYnVJYnVvNzh6OGtJSzNR?=
 =?utf-8?B?YXlXcy9XRU53Mmg3blhXVnFzeEtielhzSE41Zi9uOHhUNXVmVCsrU3l0Y1Fk?=
 =?utf-8?B?bEFQUTBOYVNEYjNIdlgyNjBlSzlUMDhMYnlRcy9pTmpSZVJmYWx0YXcyaUgx?=
 =?utf-8?B?bXEwbG5mN09SR0dpdnF4eGFVc2prcGtITWdka3czMXhKMjRFcDhFcFJXdFpH?=
 =?utf-8?B?T2xwdklhOGg0anRORzU0QWgxMU50bTk3VEhkZWlEa09VOStaUE9VZU50cFZv?=
 =?utf-8?B?TkdYSlJnTTFXUWRZN21ja05hMWRrWkJzWGs5b2kwcjlkVkJiUE9PSzQ1ejZO?=
 =?utf-8?B?clhITUdXc3FqTExRaUhRR2lBV3ZYR2htMzltS1hpK1FybzdsSlFkZnFJVGRo?=
 =?utf-8?B?SVp6WWZlWmlyNkRLRDQxeGxZSEV1aVBEQnZudElTYmpnYWl2MVJDNFZHYUY3?=
 =?utf-8?B?WnFLR21URkdmSFdGRHlVU1J0SE5aRmpieWxaN3hveDc5V2thcVdJYVRiTlZy?=
 =?utf-8?B?YTNXTExBM05nSVR4Y0oyajZRYVhldGtzWlYvV3J2QjM2L3ZsMlA2TXROcU1L?=
 =?utf-8?B?NFFMV3BSUlZxbGx3a2Q5VGN1REt6RUdQdk5DRmZmSUFZaEVOM0IzNHV0cFJU?=
 =?utf-8?B?b1daVldXV3B5dmxzMCt5Mi9PMHhjWmlyamhrQkVFVXY3d2x1dU9PUG45QUc3?=
 =?utf-8?B?RlFNMlFweUVlMC9RSUM0ekxEUDJQODFjQWZzdVhzQ2k4blp1WVdNbVEzYXVC?=
 =?utf-8?B?RFVKYXRIY0EzUmpSSG9JRGZicXB4UHFHTzN2RFdqazJyUkkrd0owWWxXZm45?=
 =?utf-8?B?VnQvSmNMd2dhU29FcktGNG1PMFc4dEZ6Z2Nld0J6RlNOMTdGcURIRXNBUnkz?=
 =?utf-8?B?bUEyU3gvVWlNaGdWWFlNcXJYUjJQR2pSQjFRVEtjdWtuMXFSckF5YnB0Wnp2?=
 =?utf-8?B?bENzamsxaFl4dG9FR2pGWGRZNlBFVGZJSTN5TWZSMEdZL0NYdWdNNi9tUnBu?=
 =?utf-8?B?SWVUSHJPOGNxV3dnS3lyRVdIYW82OHpCaFpWZ0tUTVNlL1ZpVmdBZHVqc0My?=
 =?utf-8?B?eHlVNUwyeW1YQlpDTTY1cUJnamREbmV0Ri9GTGVVWGxoWUlGa3h5NEhEd1hO?=
 =?utf-8?B?Z1NPdWZnZ3R2ZTNPYWJ4cXNQRXBFb01BakpSa2xjVDcxdWpmdHZrV1gxSFEx?=
 =?utf-8?B?V3QySDFCTkgyRCtkYURZSkdCYWZabnhROHUzN2pQeEY1Z2tNL1JmNU1uL1pn?=
 =?utf-8?B?WmdJbVBONGh6S1BIaU1TN3dHL3Urdnp6aVk1MVpJUVNBTHlWV0c4VjVaalRl?=
 =?utf-8?B?MDUxOGNXSWx0NHQxTEJvcDRWNzNIQWFTSkRISWRkUm9iT044aTZscmFwOWhG?=
 =?utf-8?B?WVl6QnFOY2JSbFRFK3JCWExOSUVnZGVmUmQ5WERJMUtIM0R5UFhsWDZ6VHJa?=
 =?utf-8?B?cEpWQzV1TnRuc0hDNUdCOWQxVUh6QjVrdENHV1gzbVdCV2lFWDd1aHh6L1hn?=
 =?utf-8?B?TUcwVFlWakdnRTNidDhiczdOWTdsZWVEMDB1V0JyazBRbkd2eGJ3eDFveWdw?=
 =?utf-8?B?YnZCVzdEdTU5dk1NWGRLZzNvRXF4QzVXRENCZkcwdFdTKzFCWFhGdlZjUW01?=
 =?utf-8?B?KzFEQ3dtVUtWUWRqUFMzZ0tPVUU5ZnpDNlhiOEdxeUVyTVNTWitGSUpCN2dz?=
 =?utf-8?B?cXVwSlhTSFc5SlppUFgycG9NQ2lqTWs5Y3ZxY0gzNEtkQmtVUHYyWWM5T2xV?=
 =?utf-8?Q?/BRJ7akWRTI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHE4UnFXOWhYditXV2p6Y3VoR3pCd2RsQi9pTnRjMUJEWlBOUklVZE1BOEFq?=
 =?utf-8?B?Wll4NG81L0ZjN3NKQnR0YUNkWmMxUXZlak9UdmU1a2lEUFN6aG5pd2t5NXJm?=
 =?utf-8?B?QzZYQXdpUlV0aW9aWjY3QjNZcnArNExJcFhVTUlwVlNSV1NmOGd5dlplTmdH?=
 =?utf-8?B?d1p4WlVjMENTSkd6RElUM0tZbVBNT2JBMExOTU1qdTVsVGU4OTIxdjd0bUQ5?=
 =?utf-8?B?eEpSSTBpb0xKbERqMVRMWEllYldOeEl1K1ZnVlU3cVd4dytUdzBSSTRwbmJK?=
 =?utf-8?B?c2JEQ2pteFR3V1NEUFFUNC9LVGw3MGJyRGpnamVDWGVMWFFsZ2Y3VlFrM2lB?=
 =?utf-8?B?eXNmQUNYUUlIM3JIejdmdXdxTFlmVHMrMytJampQMHZTTFdiZVpEMW50MkZa?=
 =?utf-8?B?WU9Db2g0UE1RM2loRHJVbWVuRHRuc3dHc3pWM3p2TXNYNmcvOUVQa0k0bFI5?=
 =?utf-8?B?TUhoRG9mVERNMnFxV29MMmpBS3JhZzRBbVBaSDJNWlprOUtaN2NBdi9BbkdH?=
 =?utf-8?B?QWE2bE9qK3gyNmdxdUoweU1ubG83ejV5aGJHRmtscGY0NmhwYmkybHNSOElh?=
 =?utf-8?B?cDJKYUpHSi9UbmZlRjVHNGQ3QWZSUm1GYm5hcWUzZHhNOHJLREhjSStVRW5m?=
 =?utf-8?B?T0RaNERJLzNsRWpydDRRR0lkOGNLanp5VWZmQUt4bmNkREJ5MXpTVHhiRnFQ?=
 =?utf-8?B?RkZRK3FXYXBVM1NGeURvcVd0Vkdqb0FOMlA4U3dISW1vdUZHM2p2d2ZYV3Rv?=
 =?utf-8?B?L1lSSzJ5ZVUyclBIai90Z3hUTVFFWW9CaVU2UHN4R3dRZURRWGdrdnFIbFFw?=
 =?utf-8?B?UmdwWmtFZURyOEFhUm5OaFdEUjVrajU5dzBHZjQwVVZManVuOTdycTBlUTVp?=
 =?utf-8?B?YXJJK3FLVTIwcU11Rm9BMU9IZ1ZZNkFhTzZQNHlnNEpTd3R6aFgveE1jNG9H?=
 =?utf-8?B?R3dwb3VqUTgvTDJiTElOaUU1akJGTFN1d0R6cThpK2NEOUNvOXhDSjJYbWpp?=
 =?utf-8?B?enczUmprbERQcVEyU0N5SmhodENsY09FVnpLbFJCaXpGdlNOQ0tnNk1aaW9w?=
 =?utf-8?B?ZUNRa0cwbnI0WVY2cUhhZU9mczNlVEE2Um92Y1ZvVFIvMklRN3N5dkJmZVRJ?=
 =?utf-8?B?bFpCWUxjd2ZDK3gxUmxGN1k1N2Z1ZUlIdVViZ1pIdzY0Y1J1YW1RekhuVHZi?=
 =?utf-8?B?Y2RCU0wweDNDa2t5YkVZY2xnWlhXYXQzNWFEb1lXNGRVQko0MHdhNTI1YnJy?=
 =?utf-8?B?QTlnY2xVN1dRTDB5bnFlWjBRNmc3U1dxOW5pMHdFeGV2UmRXZXlWc1daczJJ?=
 =?utf-8?B?QkVmU1FiOUxjYnFaQ1IrQWZHN0RMb0hEUmc2bGtNOC9FM2JGS096MEQ3ODFH?=
 =?utf-8?B?RExrOGRob1MrUWlUNno4eXFLQ0VOOG9qOGUvcnZRS0FaSEVIYi9tWk5ORnlu?=
 =?utf-8?B?RGlBMmYzN2hHTHFJZnB2WDlIS0ZUT0t1cHJzRWI1OG5UaDcrbkg3YWdBdGp0?=
 =?utf-8?B?TzU5YWI4V3U1dC9sc00ramtjM0N3Tmd1NHZCcFhLbmVqRnNnVFZMSEMxLzhr?=
 =?utf-8?B?MWJFVDgxWVNUZlpIMUNNZmFtalBOZWZsYkNQOGZ0RFg3azBkMG5TanF2cXND?=
 =?utf-8?B?ZU5VLzl3aHpKOCtnc1V1SnFlTUhHeWFLazdoR05OSWRjSExDL1UwRFVmbUR3?=
 =?utf-8?B?Zi8wRFJIQmxDenRhRW56MTJ4UTN6M1Zhb1JISWYxQ0EzVVdFaTZpdkNEb0FE?=
 =?utf-8?B?TWUwY2NLYVYySU1wcmEwMURHV0RaQkgxVEtsOW5oZ3NVWjZQUDFpUzh2NWpN?=
 =?utf-8?B?THJHc1l1UXZQMXBFN3k3ZzFWV081a2pvQmJwd1ZTanNHNE14cjlDMmxFRndF?=
 =?utf-8?B?WEd5UE04bC9hdWt5eEN2Z3lzTTROZUJFWTBEemU2UG5DRmJPcGd4YjRxSngw?=
 =?utf-8?B?ZXVnWWM0REdiVmlXYkxoTWc1cnJuMmN3bnRxZ2h6SmhuTThiVnlpUGtJUVlR?=
 =?utf-8?B?aTZ2c0cxTE5qeGhCRGI5TmVyQVRwRWtQZmpQMCs1a09MWkFzYXhTRjd6dVRj?=
 =?utf-8?B?eHlHOWo0dFpER1R3VUsrNFd2VllLQnZZWDloUHN2ZUhIcG13VXNwUnUrc0wx?=
 =?utf-8?Q?PDeiWa7naFpoQtLLoklVJiwdw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76220ed-75fa-459f-f7f7-08dd8c0c773a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 19:38:52.4098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GrT3D3C8LC75Pc9DWGeXfiG7ZtMpJIXqDfr4f01Wjd7Jf6liKjEdCTjTeHygfF14Gc1pCjGLotIXTf77f2zvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAvMl0gVmlydGlvLUdQVSBz
dXNwZW5kIGFuZCByZXN1bWUNCj4gDQo+IE9uIDQvMTkvMjUgMDI6MjksIGRvbmd3b24ua2ltQGlu
dGVsLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBEb25nd29uIEtpbSA8ZG9uZ3dvbi5raW1AaW50ZWwu
Y29tPg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhIGZyZWV6ZSBhbmQg
cmVzdG9yZSBtZWNoYW5pc20gZm9yIHRoZQ0KPiA+IHZpcnRpby1ncHUgZHJpdmVyOg0KPiA+DQo+
ID4gRmlyc3QgcGF0Y2ggYWRkcyBgdmlydGdwdV9mcmVlemVgIGFuZCBgdmlydGdwdV9yZXN0b3Jl
YCBmdW5jdGlvbnMuDQo+ID4gVGhlc2UgZnVuY3Rpb25zIGhhbmRsZSB0aGUgZGVsZXRpb24gb2Yg
dmlydGlvIHF1ZXVlcyBiZWZvcmUgc3VzcGVuc2lvbg0KPiA+IGFuZCB0aGVpciByZWNyZWF0aW9u
IGR1cmluZyB0aGUgcmVzdG9yYXRpb24gcHJvY2Vzcy4NCj4gPg0KPiA+IFNlY29uZCBwYXRjaCBp
bXBsZW1lbnRzIGEgbWVjaGFuaXNtIGZvciByZXN0b3JpbmcgYHZpcnRpb19ncHVfb2JqZWN0YA0K
PiBpbnN0YW5jZXMuDQo+ID4gVGhpcyBpcyBuZWNlc3NhcnkgYmVjYXVzZSB0aGUgaG9zdCAoUUVN
VSkgZGVsZXRlcyBhbGwgYXNzb2NpYXRlZA0KPiA+IHJlc291cmNlcyBkdXJpbmcgdGhlIHZpcnRp
by1ncHUgcmVzZXQsIHdoaWNoIG9jY3VycyBhcyBwYXJ0IG9mIHRoZSByZXN0b3JhdGlvbg0KPiBw
cm9jZXNzLg0KPiA+DQo+ID4gVGhlc2UgY2hhbmdlcyBlbnN1cmUgdGhhdCB0aGUgdmlydGlvLWdw
dSBkcml2ZXIgY2FuIHByb3Blcmx5IGhhbmRsZQ0KPiA+IHN1c3BlbmQgYW5kIHJlc3VtZSBzY2Vu
YXJpb3Mgd2l0aG91dCByZXNvdXJjZSBsb3NzLg0KPiANCj4gUmVzZXR0aW5nIEdQVSBieSBRRU1V
IG9uIHN1c3BlbmQgc291bmRzIGxpa2UgYSB3cm9uZyBiZWhhdmlvdXIuIEFyZSB5b3UNCj4gdGFs
a2luZyBhYm91dCB1cHN0cmVhbSBRRU1VPw0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBwb2ludCBh
dCB0aGUgUUVNVSBjb2RlIHdoZXJlIGl0IGhhbmRsZXMgdmlydGlvLWdwdQ0KPiBzdXNwZW5kL3Jl
c3VtZT8gRG9uJ3Qgc2VlIHdoZXJlIGl0IGhhcHBlbnMuDQoNCltLaW0sIERvbmd3b25dIFNvIEkg
YW0gdXNpbmcgVWJ1bnR1IGd1ZXN0IGFuZCB3aGVuZXZlciBJIHN1c3BlbmQgdGhlbiByZXN1bWUs
IEkgc2VlIA0Kc3RhdGljIHZvaWQgdmlydGlvX2dwdV9yZXNldF9iaCh2b2lkICpvcGFxdWUpIGlz
IGJlaW5nIGNhbGxlZC4gSXQgaXMgcHJvYmFibHkgdHJpZ2dlcmVkDQpieSB2aXJ0aW8gbGF5ZXIg
YnV0IEkgZGlkbid0IGxvb2sgaW50byBpdC4gQ2hlY2sgdGhlIHZpZGVvIHBsZWFzZToNCihodHRw
czovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFEX0pGOUN6Z0NqelFaM1JjTEFhTm5VT1JxR2oy
NF9JOS92aWV3P3VzcD1zaGFyaW5nKQ0KDQo+IA0KPiBJIHRyaWVkIHRvIGFwcGx5IHlvdXIga2Vy
bmVsIHBhdGNoZXMgYW5kIHRoZW4gc3VzcGVuZC9yZXN1bWUgZ3Vlc3Qga2VybmVsLCBpdA0KPiBk
b2Vzbid0IHdvcms6DQo+IA0KPiB2aXJ0aW9fZ3B1X3RyYW5zZmVyX3RvX2hvc3RfMmQ6IG5vIGJh
Y2tpbmcgc3RvcmFnZSAyDQo+IFsgICAyMi45MDk0NTRdIFtkcm06dmlydGlvX2dwdV9kZXF1ZXVl
X2N0cmxfZnVuY10gKkVSUk9SKiByZXNwb25zZQ0KPiAweDEyMDAgKGNvbW1hbmQgMHgxMDUpDQo+
IHZpcnRpb19ncHVfdHJhbnNmZXJfdG9faG9zdF8yZDogbm8gYmFja2luZyBzdG9yYWdlIDINCj4g
WyAgIDIzLjE2OTEzOF0gW2RybTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jXSAqRVJST1Iq
IHJlc3BvbnNlDQo+IDB4MTIwMCAoY29tbWFuZCAweDEwNSkNCg0KW0tpbSwgRG9uZ3dvbl0gSSB3
aWxsIGNoZWNrIHlvdXIgZmFpbGluZyBjYXNlIG1vcmUgY2xvc2VseS4gQXMgeW91IGtub3csIHdl
IHVzZSB2aXJ0aW8tZ3B1IGRldmljZQ0Kb25seSBmb3IgZGlzcGxheSBkZXZpY2UsIHdoaWNoIG1l
YW5zIEkgdGVzdGVkIHRoaXMgaW4gdGhhdCBzcGVjaWZpYyBlbnZpcm9ubWVudA0KYWx0aG91Z2gg
SSB0aG91Z2h0IGl0IGlzIGdlbmVyaWMgZW5vdWdoLi4uDQoNCj4gDQo+IENjOiArQWxleCBCZW5u
w6llICtBa2loaWtvIE9kYWtpDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IERtaXRyeQ0K
DQpbS2ltLCBEb25nd29uXSBUaGFua3MhDQo=
