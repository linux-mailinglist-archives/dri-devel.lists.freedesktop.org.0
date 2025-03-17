Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE82A64E61
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 13:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7CC10E0FB;
	Mon, 17 Mar 2025 12:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGWr7r0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCB710E0FB;
 Mon, 17 Mar 2025 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742213777; x=1773749777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y+ZmJayH1wL2kUCZ6bD9SDzrRQMuV81Omqte4ntulmA=;
 b=gGWr7r0B71nqVPgNTOS8cA/aDs9+GNaaUtE70WJUg8k7d4It+mDuCN5L
 e8Kmj5q8vAQZYwjG0uf7aHaPT59uoFRyZSSJ1y+0GWqrwDjRcW1trQg4C
 rgcu2uPLmDTHsYU614leio/qrSGCwh7BbwogBeuED+NnP/QVtPj+DVvr7
 uBULXohAEKSz8aO+To05YSS7L1haC0lbfhzgN0UIz4HtKTskuDIxyhll2
 esqPKDFhhlHQ27e7gQEZVF7PpqwWaYSpE01BCc0qeziZ6ZIZsRA1z0+/3
 9R0/SXe/Ks3d85YulaDDvY/sF2TJKJvBfzeQS5SRQkB2iDTl//kDp31w8 Q==;
X-CSE-ConnectionGUID: 7SW7jG3PQce/364zSH7JEg==
X-CSE-MsgGUID: JOnGymWQSBWp4Xut2950YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60694226"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="60694226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 05:16:17 -0700
X-CSE-ConnectionGUID: mCt6NAMeQZKhk9rTi9H2WQ==
X-CSE-MsgGUID: VjisF21gQVCun+2cKmwnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="121728851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 05:16:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 05:16:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 05:16:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 05:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8UTfRELWg0nUjTBMKAAPHjUy4YUMtU33ZbUaUbeizOPRZjq1FGavAH9ZnwfeMljlrH2cExaEWkQUhTmbbLFE7Ucg5F9n5iq8dRG4unK9ta4bdqUJRisFATab3ihcbBWt4X95xV32J0qeer2z6hGie6qTNCPLHPi71GBhiEyHIQF/CJNt7Oh5Zx/i68ivAOwvNFmAd2YxC3PE5/3t/cWw6xD0EEejhMDqJ8tBQ5T5EXRM23jKr+RVozP4w4EfscoqDl2iJvgZA+FODl7B+/Z0SWujY33MKDEnJGchs+lZpivVsVPNVddiZgBFGFdzMbS6pWBYvnYffrb6RwMPEYjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+ZmJayH1wL2kUCZ6bD9SDzrRQMuV81Omqte4ntulmA=;
 b=vTfB82K5KvDJKXhQXQnTQ8j2iEHIBFT+iHefcztLUooqWHQRLtHdkmD70C4HtVkQPe9qGxBeQXtChXRcjZKRLzfwoyZcNsT4kN7AzLVeIkQ2kGoJFTqZcNpq1GvVoJLq5dakFQgwmE5ZW7Ka42H1Rr3L5oNMOsX7nLVJCjrXvpjUsUz41lziTjz5eDX7/Rm1gsEq+1qVbPROESV7kYcyxs81qElcIzQyYaWatjWpqwEUx9fUx+T9Ddy40V23SfiGBc/j0Dm76nFnMr//eFmxkmxgxZ/tZ8kHAbp99QZjdUU9YokE4+Y+rcpWs7WfJdUvzfrMpVJlf1oO8fGvdjh4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 12:16:12 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 12:16:11 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "20250219093211.4059187-1-arun.r.murthy@intel.com"
 <20250219093211.4059187-1-arun.r.murthy@intel.com>,
 "20250311085422.2573860-1-santhosh.reddy.guddati@intel.com"
 <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>
Subject: RE: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbk1In8A+UiOMcokWcLjRErnYkHrN3RWcw
Date: Mon, 17 Mar 2025 12:16:11 +0000
Message-ID: <SJ1PR11MB61290E6675948DAD0634166FB9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250312-asyn-v8-0-0c4cbe5a066d@intel.com>
 <20250312-asyn-v8-1-0c4cbe5a066d@intel.com>
In-Reply-To: <20250312-asyn-v8-1-0c4cbe5a066d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB8205:EE_
x-ms-office365-filtering-correlation-id: 7115861d-3593-40ee-36ac-08dd654d819d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Z091Y3ZLb1BMNlk5N0VINURCS3huZEdsWHBBZmVqOUFoU0k1czBXcUlycVJR?=
 =?utf-8?B?NjNQYmFxbGs4Z200bXFaWkVvWUdpTFNCVjNqdzZZaEIyV1krekVTeHNWK2Yy?=
 =?utf-8?B?bXdqd0xyb3V6RVhUR05PWmYxYXg3elVYbjRsL3RDWDBwS3QxQ3VvOGx3S25X?=
 =?utf-8?B?M2FvMCtneGRmS1hpa2tlcG9oNFl5OFRRTC9ZYTlKaFlROGtuMXppNjNDRDV2?=
 =?utf-8?B?cXkzWVBkNmVXRFVGTmMyMTM5Nm5SYzFjNUQ5cnA3V1o2UW1UNmh2Qk45by9H?=
 =?utf-8?B?bE1lcGl6N2drOGlyQUJmUlk2ZU1MOHFTWGMzZjFoMmRWYm1rbXc5SXRKaW9y?=
 =?utf-8?B?WXdjQXY0R1BTeC9mM3YrUlBtMkJ6OGUwazFPMHRSaWNIcHBpTzFmd1FnMGtP?=
 =?utf-8?B?U0xtYUFOZkMwdG9QRWF0V3NDRUZVeWhITEh2bjdiUnZMcnBjaUpMVGhheVFu?=
 =?utf-8?B?cFQ4ZUtBYWh2MDBrdlBvMWt1di9sSXM4TGVUYXF2MGYwYzFtUDhlSDhHZll0?=
 =?utf-8?B?RFJQc3lnMERKOW5UbzBjdkQ0THE0ZE5xamNXa3Bua2hjVWswVnZiMk93VVRO?=
 =?utf-8?B?RXNDRW5ycWNhQXMzN29OdWlES09hcTNEK0N6Mm5uWVN3cU1tTTYyTUUzdk9U?=
 =?utf-8?B?enJ1UGNNZVI5czRhV1gzM0lJNHNtK0Zsak9MenhyOCtPMWs2Unl3dTI5UjMv?=
 =?utf-8?B?OEI4WENKZjl3WGI0c3hvaWlBUmdTdWorN2hyMzRVeWVIZC9mOVRPUnlYUENV?=
 =?utf-8?B?TEZVa2tzWm9RWkYxMU5xbHBoZmFENG9BN1FWZ1pGbjdMMTNvTFFoUm83RFdx?=
 =?utf-8?B?UFlqMmpTUnhPcEZFaEdpOE5jWm4ydkNRMGpNUjZneE4xdTYwbHowdnYyNHR4?=
 =?utf-8?B?MHVwckI2aU5oa2M0dGhNTFV4K1ZENnVldkUvUU55dnRFbVhJLzVONkkzZWNt?=
 =?utf-8?B?VTJLNE5VTHNHN1B4SHRUKzFKK3dINzRBOFNaSThPRkhiWUp1NTVKQzZ5ZURz?=
 =?utf-8?B?bWNGUWJweHlBUUd3eWN0WU5iM1U2VGdKZ0V2SzFkbENmWXRsL2FGanlZQVZK?=
 =?utf-8?B?L05tSERleGpHSUovVXo5M2l3eHFWYmJndzJOaGVYbDZCazBDclROWHFpS0x3?=
 =?utf-8?B?WC8waTFNWENhcHRXckRwRmNKYmVMQ1lKWnJHZS8xVmI5M1FZQjV2eXVhelNs?=
 =?utf-8?B?ekw1QXY4OCtJbVhwTVJDcUlqU0FoRC8veXZESHJlZ1RCcC9tZW03UEhPeUdR?=
 =?utf-8?B?ekpSMGFqUWxiYnpReUUyM3hmOC9pMFdOZVozMjJDdnhjS0d5c01YUlBVQUUy?=
 =?utf-8?B?SVhOY0tjY0g3QW9CMmFNV01SUHZPRk93Z29rZ3hSc0hiOExyd1BKNVNHOU5M?=
 =?utf-8?B?djYvYU01RnNZdlVsSnpZa3JpcGd6cGVEYVlpbk90QjhJNjU5cGFnc3V4UG8z?=
 =?utf-8?B?b3d3OFdDVFYyQy9xdE0vL2hYTGtXTnJ3aS9mWXkyZ1BXMHBKeDM2WUVCT2ZN?=
 =?utf-8?B?ZUtUSG55YjNwU2RMVTlkNm5TTk02ZGx2a2pBRzhEc2xwNFNBTTZ1WEx6MWc0?=
 =?utf-8?B?dGRyUExIUTkzMUYzRHZ0cTNUeC9zQlZuRmtweVF0S2pVeTYwRUZHNEFrM2Ny?=
 =?utf-8?B?K3JyN0pEd3M1QmlOWThZNUVnZDdOL3greURsUE8vRkVUYW1mY28wLzlpaUJP?=
 =?utf-8?B?NHhoWFZNVE1vN3ZlUHJyREVKNWdkcnIvOHNnRCs0UDg3Z2RFZGswbzFYWEMy?=
 =?utf-8?B?dTVDR1hUNHl4K2VYYUR3YVo0V1BoeisremFvbGxlTDlkdGJDSyt6YVF5VEFP?=
 =?utf-8?B?dG1kSG1oTUhBSUhhNEM2UzVBUlRSQnM3WEkxZTA2WkYvbjdxY1A3WUk2V01I?=
 =?utf-8?Q?w8o21n1gO25NE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzlvL3lIcDBnQmt4TU14N0d6SExYZHd3WjBzak1ZNTFCV2RDSTdMTmpaS3hw?=
 =?utf-8?B?Z3hsOXRPRm9TUHRJNXBXcEhmMDFMbnk1bGg1dDhzU3d5L0kxU3UxVy8yTmpm?=
 =?utf-8?B?UXlVZnVTb3ZEeDNuQnQ2SjdsMTJ1eGNBemZuSkw5SGtNYTAxV2g3UUY5cXVJ?=
 =?utf-8?B?cS9QdnEwT2pxa3J0RFdaTE1SZ2M4S0FYbDFYOStWY0dNQlpDT0xjanlKT0Rz?=
 =?utf-8?B?Um5JTFBDZUF5dG0vM1FqTUFMZnFRWnhHK0RVVnBkUlBHOUtGVVlXejlwZkpT?=
 =?utf-8?B?OHRJQ045T1dna0Q3ZFR6WThhOGI2WUtaMEt2YkV1Y1c1TVE0OVVRSmpqZm9Z?=
 =?utf-8?B?MmpWMmxuZG1EeEwvYWxwTnRsL0ZENDRPRDc4Z1NXN2xVbzFmbXViMXF0L0Q4?=
 =?utf-8?B?YUc2dDdkU3dmZ09hdXVXdnpTOEhWSkoxdGNadVVYbUpRR1h1NnFtdkg1TmFD?=
 =?utf-8?B?eXBDdVdZUW9YeVRzMnI4a0RyY0FqK05pcUs0Rkt6MG05YzMwL0RJR2UrMHFq?=
 =?utf-8?B?UTBMRll5UjR4MWxtMzVOVENHVndFd2FXdjdXTTlIQWN6eVl1aysrQmx2VlNY?=
 =?utf-8?B?VkQyQ24zcFNYdmpmVUZ5SkhNazh3QmY0Mkl3YnF6U0hCekd2Q0JEY3ZGRlBU?=
 =?utf-8?B?NlBSczNSUEhhSTBDY3B2My9nMit5QkhQN0JoS2d5cDBTWWw3NUllQ2hHT0h6?=
 =?utf-8?B?bFdGY1EvRm9NVThKMjlsMmpiRldSbHR2U1NvMG5KbDhQM1BaVWk3cVlhbWVi?=
 =?utf-8?B?S2ZMbUJFTUhaZnMwWnBpZlhXTEp5RG9CQlE2dGhGRDhBR2RzUFZSTm5lWG9E?=
 =?utf-8?B?b3VVVVV0d0V3cmRxbEp0S1V0cUE0cVpjZGFaSkVkRVU0SzNlOG82RFQ2UkRm?=
 =?utf-8?B?dHJCdXAyWkNHbVlsRWNjN1V5K2ZwUHVicjhncjVmOUV0Y242Y2QwVitWa096?=
 =?utf-8?B?QUVtd1FpbFpyS05uUURzR1U0QjF5aDNCWEI2cmx4YWg0eHc2a0hDdDFMdExB?=
 =?utf-8?B?dUpjYmdXbWpEN2d0cFVob2NzT2x2YU1tdkhDSmViQjFLUnMvN1N3ZlJLblgy?=
 =?utf-8?B?MEd3bFd5RS9TV09DUUtqUlk5VEw3RnIxTVYwOFMwa2MzMEREeStuWkM3Vkk3?=
 =?utf-8?B?WFVVYWpkTWJaQXE1amFxRUloRXAzRXhMQUVWVGxmbnBFdjQ0Q2F6S2xBWmQ4?=
 =?utf-8?B?Mmo5RFJzNG14MVEyUVlUMXFpWnI3RytyY3hNZEd2L1N5bnVuSHkyd3FZd2Nq?=
 =?utf-8?B?ZnVzVDJFckpIV1NGRFVGUGlpVFpRUzZ3eE5ZcUtZdGc3T3VOZ2NjbmlPbXZV?=
 =?utf-8?B?QXFrYzVFeTBhQ3AvRXJpK0s2bHU1Y2c2czR1VDdJaEIzOTljMlU4WDVaNENs?=
 =?utf-8?B?aCt6bE9JVVgxU2ltd2xiTE5sbUFva1djY2lSdGVLbWJzbDRGcVVJMVh2bmVK?=
 =?utf-8?B?cjlRRTIvV1prMUZXa1VHWDlzaUpHMTB6SmxxYTN6TEdEdnBLTGN0SExocVpJ?=
 =?utf-8?B?dUlVRWxCcXFNSzZDVnJBSytCcFo1OHRlRkZDU2M3VGVLZEo3ZXZPQ2lkRHg4?=
 =?utf-8?B?cFZta3BQWHRYS09VSUVhMGQvc2JEbjVVQ2xNdUxMWWdNN2lhUEplNHFEREpk?=
 =?utf-8?B?RGdMZkhDQUpYQVBmWUxKa0RLVUFKY20zRzQyNFFHRWlkRzBoZmVSQ1RhQm1x?=
 =?utf-8?B?UXYxN1czOTdDUFFDbi9WSTl1RGZzbmcxZ0R4ZlhIanh0YVVleXhKSzB4ZlEx?=
 =?utf-8?B?c0Y1aGQ2Yk1SUVptQ2djTjN6WVJGYWtVdVp3WllQTUtDcGZGNnV4dXd3SU5n?=
 =?utf-8?B?VWlBRmtWdWJkQkJLd3pLZmJWK0N3dE1USWxyWVY1cHJFUVJycmpjZHpBWlRK?=
 =?utf-8?B?UmFYYTlGSjRkbk1QUFpiTTZRdXJWSitvTzBBUnlHc3BienBWUkNTR0d3Z2Vw?=
 =?utf-8?B?Y2dDQzR1ZHZaMGFta3MzblR2ZUp0RmxWWERqMXNtUVE4L1VCa29Ubk1mMVdx?=
 =?utf-8?B?Y1JGUjN4WWQxT3ZZd0hjTVZlZFhlM1lrWm53dUU3MDgrdUlHbVlFVHN2YTJN?=
 =?utf-8?B?YmNvMVYrTDg0RDZYS2U2QmZLYk9wL2NFaXVDelAvK2NrOGIxendLM1pQNVJy?=
 =?utf-8?B?NWh2OTlNZ1NudHpQUkFHQ0xzWlZhcmlCR0JRajF6VFJEZ3gxTnhKeWg2dHVn?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7115861d-3593-40ee-36ac-08dd654d819d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 12:16:11.7528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /u2+qJq0PweycGpxcvCZA1Rrhh1U1ontKle6+ODognnfM9gi90Ht7hs3OPoBkR4d6RMCbk2+jnAArDnw8E8LHygCn5fKJ1DyNPDdl24qON8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDEyLCAy
MDI1IDY6MzkgUE0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gQ2M6IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3Jh
aEBpbnRlbC5jb20+Ow0KPiAyMDI1MDIxOTA5MzIxMS40MDU5MTg3LTEtYXJ1bi5yLm11cnRoeUBp
bnRlbC5jb207DQo+IDIwMjUwMzExMDg1NDIyLjI1NzM4NjAtMS1zYW50aG9zaC5yZWRkeS5ndWRk
YXRpQGludGVsLmNvbTsgTXVydGh5LA0KPiBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29t
PjsgS3VtYXIsIE5hdmVlbjENCj4gPG5hdmVlbjEua3VtYXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggdjggMS8zXSBkcm0vcGxhbmU6IEFkZCBuZXcgcGxhbmUgcHJvcGVydHkNCj4gSU5f
Rk9STUFUU19BU1lOQw0KPiANCj4gVGhlcmUgZXhpc3RzIGEgcHJvcGVydHkgSU5fRk9STUFUUyB3
aGljaCBleHBvc2VzIHRoZSBwbGFuZSBzdXBwb3J0ZWQNCj4gbW9kaWZpZXJzL2Zvcm1hdHMgdG8g
dGhlIHVzZXIuIEluIHNvbWUgcGxhdGZvcm1zIHdoZW4gYXN5bmNocm9ub3VzIGZsaXAgYXJlDQo+
IHVzZWQgYWxsIG9mIG1vZGlmaWVycy9mb3JtYXRzIG1lbnRpb25lZCBpbiBJTl9GT1JNQVRTIGFy
ZSBub3Qgc3VwcG9ydGVkLg0KPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgcGxhbmUgcHJvcGVydHkg
SU5fRk9STUFUU19BU1lOQyB0byBleHBvc2UgdGhlDQo+IGFzeW5jIGZsaXAgc3VwcG9ydGVkIG1v
ZGlmaWVycy9mb3JtYXRzIHNvIHRoYXQgdXNlciBjYW4gdXNlIHRoaXMgaW5mb3JtYXRpb24NCj4g
YWhlYWQgYW5kIGRvIGZsaXAgd2l0aCB1bnN1cHBvcnRlZCBmb3JtYXRzL21vZGlmaWVycy4gVGhp
cyB3aWxsIHNhdmUgZmxpcA0KPiBmYWlsdXJlcy4NCj4gQWRkIGEgbmV3IGZ1bmN0aW9uIHBvaW50
ZXIgc2ltaWxhciB0byBmb3JtYXRfbW9kX3N1cHBvcnRlZCBzcGVjaWZpY2FsbHkgZm9yDQo+IGFz
eW5jaHJvbm91cyBmbGlwLg0KPiANCj4gdjI6IFJlbW92ZSBhc3luYyB2YXJpYWJsZSBmcm9tIGRy
bV9wbGFuZSAoVmlsbGUpDQo+IHYzOiBBZGQgbmV3IGZ1bmN0aW9uIHBvaW50ZXIgZm9yIGFzeW5j
IChWaWxsZSkNCj4gdjU6IFR5cG8gY29ycmVjdGVkIGluIGNvbW1pdCBtZXNzYWdlICYgc29tZSBj
b3JyZWN0aW9uIGluIHRoZSBrZXJuZWwNCj4gZG9jdW1lbnRhdGlvbi4gKENoYWl0YW55YSkNCj4g
djc6IFBsYWNlIElOX0ZPUk1BVFNfQVNZTkMgbmV4dCB0byBJTl9GT1JNQVRTIChWaWxsZSkNCj4g
djg6IHJlcGxhY2UgdWludDMyX3Qgd2l0aCB1MzIgYW5kIHVpbnQ2NF90IHdpdGggdTY0IChDaGFp
dGFueWEpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5
QGludGVsLmNvbT4NCj4gVGVzdGVkLWJ5OiBOYXZlZW4gS3VtYXIgPG5hdmVlbjEua3VtYXJAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8ICA3
ICsrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyAgICAgICB8IDEyICsrKysr
KysrKystLQ0KPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgIHwgIDYgKysrKysr
DQo+ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAgICAgICAgICAgfCAxNyArKysrKysrKysrKysr
KysrKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYw0KPiBpbmRleA0KPiA4NjQyYTJm
YjI1YTkwMTE2ZGFiOTc1YWEwYWI2YjUxZGVhZmI0Yjk2Li5iNDIzOWZkMDRlOWRhNGQ0YjVjZmMN
Cj4gY2RlZjFkM2RkZTk1NTZmMzIyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2RlX2NvbmZpZy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcu
Yw0KPiBAQCAtMzgxLDYgKzM4MSwxMyBAQCBzdGF0aWMgaW50DQo+IGRybV9tb2RlX2NyZWF0ZV9z
dGFuZGFyZF9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAJCXJldHVybiAt
RU5PTUVNOw0KPiAgCWRldi0+bW9kZV9jb25maWcubW9kaWZpZXJzX3Byb3BlcnR5ID0gcHJvcDsN
Cj4gDQo+ICsJcHJvcCA9IGRybV9wcm9wZXJ0eV9jcmVhdGUoZGV2LA0KPiArCQkJCSAgIERSTV9N
T0RFX1BST1BfSU1NVVRBQkxFIHwNCj4gRFJNX01PREVfUFJPUF9CTE9CLA0KPiArCQkJCSAgICJJ
Tl9GT1JNQVRTX0FTWU5DIiwgMCk7DQo+ICsJaWYgKCFwcm9wKQ0KPiArCQlyZXR1cm4gLUVOT01F
TTsNCj4gKwlkZXYtPm1vZGVfY29uZmlnLmFzeW5jX21vZGlmaWVyc19wcm9wZXJ0eSA9IHByb3A7
DQo+ICsNCj4gIAlwcm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZShkZXYsDQo+ICAJCQkJICAgRFJN
X01PREVfUFJPUF9JTU1VVEFCTEUgfA0KPiBEUk1fTU9ERV9QUk9QX0JMT0IsDQo+ICAJCQkJICAg
IlNJWkVfSElOVFMiLCAwKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxh
bmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiBpbmRleA0KPiBhMjhiMjJmZGQ3
YTQxYWNhODJkMDk3ZDQyMjM3ODUxZGE5YTBhNzliLi4xMTA4MzhjM2U1OTIwODM1ZTA4DQo+IDc1
ZTU3ZTZlNDc5YmNhYjdjODczMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9w
bGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiBAQCAtMTQxLDYg
KzE0MSwxNCBAQA0KPiAgICogICAgIHZhcmlvdXMgYnVncyBpbiB0aGlzIGFyZWEgd2l0aCBpbmNv
bnNpc3RlbmNpZXMgYmV0d2VlbiB0aGUgY2FwYWJpbGl0eQ0KPiAgICogICAgIGZsYWcgYW5kIHBl
ci1wbGFuZSBwcm9wZXJ0aWVzLg0KPiAgICoNCj4gKyAqIElOX0ZPUk1BVFNfQVNZTkM6DQo+ICsg
KiAgICAgQmxvYiBwcm9wZXJ0eSB3aGljaCBjb250YWlucyB0aGUgc2V0IG9mIGJ1ZmZlciBmb3Jt
YXQgYW5kIG1vZGlmaWVyDQo+ICsgKiAgICAgcGFpcnMgc3VwcG9ydGVkIGJ5IHRoaXMgcGxhbmUg
Zm9yIGFzeW5jaHJvbm91cyBmbGlwcy4gVGhlIGJsb2IgaXMgYSBzdHJ1Y3QNCj4gKyAqICAgICBk
cm1fZm9ybWF0X21vZGlmaWVyX2Jsb2IuIFVzZXJzcGFjZSBjYW5ub3QgY2hhbmdlIHRoaXMgcHJv
cGVydHkuIFRoaXMNCj4gaXMgYW4NCj4gKyAqICAgICBvcHRpb25hbCBwcm9wZXJ0eSBhbmQgaWYg
bm90IHByZXNlbnQgdGhlbiB1c2VyIHNob3VsZCBleHBlY3QgYSBmYWlsdXJlIGluDQo+ICsgKiAg
ICAgYXRvbWljIGlvY3RsIHdoZW4gdGhlIG1vZGlmaWVyL2Zvcm1hdCBpcyBub3Qgc3VwcG9ydGVk
IGJ5IHRoYXQgcGxhbmUNCj4gdW5kZXINCj4gKyAqICAgICBhc3luY2hyb25vdXMgZmxpcC4NCj4g
KyAqDQo+ICAgKiBTSVpFX0hJTlRTOg0KPiAgICogICAgIEJsb2IgcHJvcGVydHkgd2hpY2ggY29u
dGFpbnMgdGhlIHNldCBvZiByZWNvbW1lbmRlZCBwbGFuZSBzaXplDQo+ICAgKiAgICAgd2hpY2gg
Y2FuIHVzZWQgZm9yIHNpbXBsZSAiY3Vyc29yIGxpa2UiIHVzZSBjYXNlcyAoZWcuIG5vIHNjYWxp
bmcpLg0KPiBAQCAtMTk3LDcgKzIwNSw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9i
bG9iKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lDQo+
ICAJZm9ybWF0c19zaXplID0gc2l6ZW9mKF9fdTMyKSAqIHBsYW5lLT5mb3JtYXRfY291bnQ7DQo+
ICAJaWYgKFdBUk5fT04oIWZvcm1hdHNfc2l6ZSkpIHsNCj4gIAkJLyogMCBmb3JtYXRzIGFyZSBu
ZXZlciBleHBlY3RlZCAqLw0KPiAtCQlyZXR1cm4gMDsNCj4gKwkJcmV0dXJuIEVSUl9QVFIoMCk7
DQoNCi4uLg0KDQo+ICAJfQ0KPiANCj4gIAltb2RpZmllcnNfc2l6ZSA9DQo+IEBAIC0yMTMsNyAr
MjIxLDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZp
Y2UNCj4gKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUNCj4gDQo+ICAJYmxvYiA9IGRybV9w
cm9wZXJ0eV9jcmVhdGVfYmxvYihkZXYsIGJsb2Jfc2l6ZSwgTlVMTCk7DQo+ICAJaWYgKElTX0VS
UihibG9iKSkNCj4gLQkJcmV0dXJuIC0xOw0KPiArCQlyZXR1cm4gRVJSX1BUUigtMSk7DQoNCldl
cmUgd2Ugc2VlaW5nIGFueSB3YXJuaW5ncyBiZWNhdXNlIG9mIHRoaXM/DQpJZiBhdCBhbGwgbmVl
ZGVkLCBpdCBzaG91bGQgYmUgcGFydCBvZiB0aGUgc2Vjb25kIHBhdGNoIFsxXQ0KDQpSZWdhcmRz
DQoNCkNoYWl0YW55YQ0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzY0MjcxMy8/c2VyaWVzPTE0MDkzNSZyZXY9OA0KDQoNCj4gDQo+ICAJYmxvYl9kYXRhID0g
YmxvYi0+ZGF0YTsNCj4gIAlibG9iX2RhdGEtPnZlcnNpb24gPSBGT1JNQVRfQkxPQl9DVVJSRU5U
OyBkaWZmIC0tZ2l0DQo+IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNsdWRl
L2RybS9kcm1fbW9kZV9jb25maWcuaA0KPiBpbmRleA0KPiAyNzE3NjVlMmU5ZjJkYTYyYWFmMGQy
NTg4MjhlZjQxOTZlMTQ4MjJlLi4wYzExNmQ2ZGZkMjc3MjYyYjFhNGMNCj4gMGYwOTdmY2UyZDcx
OWY0Mzg0NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4gQEAgLTkzNiw2ICs5MzYsMTIg
QEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7DQo+ICAJICovDQo+ICAJc3RydWN0IGRybV9wcm9w
ZXJ0eSAqbW9kaWZpZXJzX3Byb3BlcnR5Ow0KPiANCj4gKwkvKioNCj4gKwkgKiBAYXN5bmNfbW9k
aWZpZXJzX3Byb3BlcnR5OiBQbGFuZSBwcm9wZXJ0eSB0byBsaXN0IHN1cHBvcnQNCj4gbW9kaWZp
ZXIvZm9ybWF0DQo+ICsJICogY29tYmluYXRpb24gZm9yIGFzeW5jaHJvbm91cyBmbGlwcy4NCj4g
KwkgKi8NCj4gKwlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICphc3luY19tb2RpZmllcnNfcHJvcGVydHk7
DQo+ICsNCj4gIAkvKioNCj4gIAkgKiBAc2l6ZV9oaW50c19wcm9wZXJ0eTogUGxhbmUgU0laRV9I
SU5UUyBwcm9wZXJ0eS4NCj4gIAkgKi8NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9w
bGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggaW5kZXgNCj4gZGQ3MThjNjJhYzMxYmYx
NjYwNmYzZWU5ZjAyNWE1YjE3MWNkMWU2Ny4uMDE0NzlkZDk0ZTc2YTgzODlhMGMNCj4gOWU5ZDY3
NDQ0MDBhYTIyOTEwNjQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oDQo+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oDQo+IEBAIC01NDksNiArNTQ5LDIzIEBAIHN0
cnVjdCBkcm1fcGxhbmVfZnVuY3Mgew0KPiAgCSAqLw0KPiAgCWJvb2wgKCpmb3JtYXRfbW9kX3N1
cHBvcnRlZCkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHVpbnQzMl90DQo+IGZvcm1hdCwNCj4g
IAkJCQkgICAgIHVpbnQ2NF90IG1vZGlmaWVyKTsNCj4gKwkvKioNCj4gKwkgKiBAZm9ybWF0X21v
ZF9zdXBwb3J0ZWRfYXN5bmM6DQo+ICsJICoNCj4gKwkgKiBUaGlzIG9wdGlvbmFsIGhvb2sgaXMg
dXNlZCBmb3IgdGhlIERSTSB0byBkZXRlcm1pbmUgaWYgZm9yDQo+ICsJICogYXN5bmNocm9ub3Vz
IGZsaXAgdGhlIGdpdmVuIGZvcm1hdC9tb2RpZmllciBjb21iaW5hdGlvbiBpcyB2YWxpZCBmb3IN
Cj4gKwkgKiB0aGUgcGxhbmUuIFRoaXMgYWxsb3dzIHRoZSBEUk0gdG8gZ2VuZXJhdGUgdGhlIGNv
cnJlY3QgZm9ybWF0DQo+ICsJICogYml0bWFzayAod2hpY2ggZm9ybWF0cyBhcHBseSB0byB3aGlj
aCBtb2RpZmllciksIGFuZCB0byB2YWxpZGF0ZQ0KPiArCSAqIG1vZGlmaWVycyBhdCBhdG9taWNf
Y2hlY2sgdGltZS4NCj4gKwkgKg0KPiArCSAqIFJldHVybnM6DQo+ICsJICoNCj4gKwkgKiBUcnVl
IGlmIHRoZSBnaXZlbiBtb2RpZmllciBpcyB2YWxpZCBmb3IgdGhhdCBmb3JtYXQgb24gdGhlIHBs
YW5lLg0KPiArCSAqIEZhbHNlIG90aGVyd2lzZS4NCj4gKwkgKi8NCj4gKwlib29sICgqZm9ybWF0
X21vZF9zdXBwb3J0ZWRfYXN5bmMpKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiArCQkJCQkg
ICB1MzIgZm9ybWF0LCB1NjQgbW9kaWZpZXIpOw0KPiArDQo+ICB9Ow0KPiANCj4gIC8qKg0KPiAN
Cj4gLS0NCj4gMi4yNS4xDQoNCg==
