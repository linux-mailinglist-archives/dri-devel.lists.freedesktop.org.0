Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D4DBEA566
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061A210EC6E;
	Fri, 17 Oct 2025 15:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuS4zC1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D682310EC6D;
 Fri, 17 Oct 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760716696; x=1792252696;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJOv2ApnVtk0uiYYxj21lElAoC8cPATcgtoA14Xmw7Y=;
 b=CuS4zC1KGfUqvlJeDFXIP+tB0BCoM37fjZLLIXT1OgC4jUsG1c7Q5EqD
 dnHuaEXqtLBz0BQfa74Ppv31p3p+grEiu8VS4AwwMrot5Xe5C7+z+Wd4P
 +AYKh9z7fpkyhXt6CU+F399iS6N1lVa2wwUX4jvtj6Cytztyb8T5EpIEf
 kj4IFT8gJFor5hhxlXu6V+CrLWehcZ7/zvP7pbtXgyJH3yuoTyuZoCA3N
 mMf1bQpNyNxD3/s6M+so7sSUjeJWDxMvNdu5T8u6Mu0SXwruNhFaeStf9
 J4IfUiT0ZO3gVN0I617SMTOyWGsL0OfEBuM6CvkRtPwmGftC69y05kFop g==;
X-CSE-ConnectionGUID: rZ+BaSp9R4GPhVD3vnyIpw==
X-CSE-MsgGUID: c1/QcflLT4GVIJkvh8eczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73215117"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="73215117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:58:15 -0700
X-CSE-ConnectionGUID: eE3E95fFSzOYXIjMtQW99g==
X-CSE-MsgGUID: TzQsmI5SQ7eA4/ZOfIXpyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182317365"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:58:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:58:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 08:58:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjLHi+oBEAiQL4WVkJINckM2w8Y7SBtOxB8XzNFmPepbWRIPujP7D4crxBsAfNatF+cpakyXMxWBIb8P5dnzAxZTIE+SGXS9FToCF/JwZaenLmnoECXbAtunlvzFbGF+gT5XIJuo63Vbjk6O0aVewOmzZ2BkcjpyiRPvb7mQluyIJXuY1jzXfDdHPtzlRPDQt2LbIK6dumHVuoV7dtZKljlsSj3o70TbZRWmmJfOrAJuEH9ogKfYHtFKRUmLU7NbzRoVNtTPPdgM4jDIxsKjfOD41rrNiXKmeT9aZAdvUbODQMzxH6K360V9msjgnrS7NSQG9lyc/J/3wa9x5/7Zag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJOv2ApnVtk0uiYYxj21lElAoC8cPATcgtoA14Xmw7Y=;
 b=O8WI1MQ2bzuEkh+1Uuq6uJtU1aSsLYVW4EvjGm+Rrqz73flOV3z1FNWiAoN3D2OCQMPOrk0yP05G0cZV6pUe7Lb9dIOalHonobHvapfTlf85MUzdXqMPx3S9rIyUwDCtMk3ykYOThpziAY5JSRLsXlYzLrewPZq+7gnChwUvz5Q73QxeoWtZ+1RuM5DgAkSS7iO/COfkt4MHbsuf+2vR6HlyrsaiWbYbNZg0L1bJpYyvNs1ZOwql222iEAO17sxD3yGspCqbdHK4xLaT3Djk72dv6lhF3CqMvdy2LIm/KVMGbf/dP5p14vYVuxUdusP2IH/yMJLLI4z+Yqf9/j2WnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 15:58:12 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 15:58:11 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christian Koenig
 <christian.koenig@amd.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
Subject: RE: [RFC 2/8] dma-buf: Add a helper to match interconnects between
 exporter/importer
Thread-Topic: [RFC 2/8] dma-buf: Add a helper to match interconnects between
 exporter/importer
Thread-Index: AQHcPNojmJhE/YQnnkmgKBfGa9XYUrTGgzIQ
Date: Fri, 17 Oct 2025 15:58:11 +0000
Message-ID: <IA0PR11MB718549B6509C3DA67D0F0205F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
 <20251014071243.811884-3-vivek.kasireddy@intel.com>
In-Reply-To: <20251014071243.811884-3-vivek.kasireddy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY8PR11MB7798:EE_
x-ms-office365-filtering-correlation-id: c731e6ae-c11e-4e04-46be-08de0d95f8ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VlBIUlc3MXZrVmVLRHJiUkxOVDl6cEZFRURxeVlld2wwb2o0ZTRyWlIva2tp?=
 =?utf-8?B?RHhNTlNqZy80cCtxQU5Nak9WY2w5Q1ljWUEyUmlSbXFpMjZtRG5JaVFDaW9s?=
 =?utf-8?B?R1JZMkw0WURKcEJIVXNhWnJ2QXh6Q0NyeVh2YkpIT09jVFpOQjd5OFFZUlkr?=
 =?utf-8?B?cVpMSm1Tb0k5OGxVVG1wVndrNGtqL1IvQXFHbDdrbTJRZi9LK240WkdCTnlZ?=
 =?utf-8?B?c2xDUDV4UExWN0kzRG9wSHhZR1BIOUE3dE1ubHZtcGNGUDdHaHBrVlpIWVFP?=
 =?utf-8?B?N1pNUXdYSU5BZ2dJaTFCbytLY1dzRFozZ2M4MVUzbGZNNDRoNytMOTdqRDZT?=
 =?utf-8?B?RXRPaGl5eXRJWG1ZR2dwcHM2b1p2QktrVHF2Rk1DZVd4SjhxemttbHpLeWhS?=
 =?utf-8?B?UG9ROWJrVDVkeHUrYURrMytTYWZCSjVGanVjRWFVVXZ1UE1EYkFsNEdIOUpP?=
 =?utf-8?B?bXVmd3MxekxzWFg5RnY4QW5lc0J2WFg0OEhkMnRxRjgwNzVzT0VlU3Y3cHF0?=
 =?utf-8?B?Q21CMVdvK25KYlBUM3VGSlpzWmtXa1VpQW5RL1krVDM4Wmo2bHJwZlFwL1lS?=
 =?utf-8?B?c3IwQ09zdks1WHd4dFJ1bzB1T3VOTDlDZjA2djdHMGdEdERNNnI4NVJ4M0Vo?=
 =?utf-8?B?M0V4NEthS1JLbkQ4OUJUY1c3ZkZJOTM5L3IwV01XWHcyMzJXd1NTcDJIZEY0?=
 =?utf-8?B?eG14SmROTi9ZRldPYzNGZWRnN2tZY1FzMnBPRmpCTWdsamlWTEJQNWxHTStB?=
 =?utf-8?B?K3lhZkg3TjF1c3JBSFE4NFY0RGR1UUFqSHFGcEhGUFB0eFZ0T1lEbXJaVy9T?=
 =?utf-8?B?VWlFdThFZ1d5S01BdDZSNW5zdnh5alkyTW41Zm94c1JNKytSaWNwS1g5ZFRH?=
 =?utf-8?B?NXQwaHZzei9GV1llZncxWC83Nm9nTGFvQ2pkZlg3R3dVam1hNUVIZUpFL0Q1?=
 =?utf-8?B?MThPdzFCcUxuV1FuY3p1ZjVWcmlzRWhZSEQxWmJidis3NHBQUEVPZXljUG9k?=
 =?utf-8?B?MFQ3RFVRUXQvN1cyOS9YRUxXS1ZsWTAxWmpLZU91ZnU1Q2FRT1RBNDBZU2dM?=
 =?utf-8?B?Ry9QVXVRT1JPS0JybkZRK251MXM0b2J4N2srVjdEQlNUcklhVkl5VXdTeDYw?=
 =?utf-8?B?K05jMEd1amREc090d3hjU0ppTWxSWlBFT05MbU1JM3FESGpra0RJOTBrakx0?=
 =?utf-8?B?ZWcrNXBmWkVvNzg5bHlLMDB1OFBmTzJacUlCcG5iY1hyaEFJbGxGTTNmMEJz?=
 =?utf-8?B?c01raUNLa2dtRXhrT1Y5K2IyQVpvSXErend2N2FVM1Z1cDFCTjN4cFM5VG1l?=
 =?utf-8?B?S3U2c3I5bU5RYW9rS3dqeElvdGpkRVo3UXdFdzFkWXRWVit2azVxZTJyTFRD?=
 =?utf-8?B?NnpXS0h1UVhpS0RWZ2ozNHptenpaZzNhY3ZoLzdSYnJlcDdaN2NhRjFnOVp3?=
 =?utf-8?B?bGxwRFNXNFhFRzdjOTd3aXA0MWVOajNqMkQ0VU9WNjFhZWkzQnRoRk9sSzlN?=
 =?utf-8?B?R1ZNbk1aS1ZpUjMrdkMwbndjMkZzMmRjNzdkcWZQakp1VFhoZ3htcUtXc3Jq?=
 =?utf-8?B?M1MrVjloSDF2ckNkL0I5bjRjclFlcm1jYWpETnRuUElDdm1OUXZQT28vNkR2?=
 =?utf-8?B?WjI1dy9zMElmV3NJTmpCZk8vbDRyeUZYcVFaMnJxWUplemJBenFyejFWdWRs?=
 =?utf-8?B?a05KUURFV0kyQkZPOEwvTGdlR2JNbHNicXBuVkJuQ0xwSzF0SjFuc0VGYjVT?=
 =?utf-8?B?UG0xcFAwSXJRNUtma2g2Q2pBQU10YVVUU2xzV1RZekw3Ly9ySUNvSEZNcVZJ?=
 =?utf-8?B?amZaUFhZanBtWGpBN3hpbGJjRDhaYXZDQkhsb043NytRbkhDU1Axak1KY1JK?=
 =?utf-8?B?OWJOUGlHY0VWa0RXb0FzN0pheDQ4aUI4MlEzTFZneVExUEFqbnFGVC9SdlU0?=
 =?utf-8?B?OXMvd1ZKL3VMdVYxNURNUEd2akcvS1JTVzVRSjVxUGh3Ym8zMjZ0c2c2NUc5?=
 =?utf-8?B?VXVWbkd1SGJhWE5vNUpaS0hQdVY2UDg3dkVOTXdHeFpuNXgzUVRpaS9OL2Yv?=
 =?utf-8?Q?fz4QCH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk5IL2RtTEJaUU82U0haTkMrZVZlaG81VFpiaUVPZCtBR0l3dGJVUEVnRnF0?=
 =?utf-8?B?UGEyR09scmQvNmNjVEJtMUEvR1J1NHFXbmFEWjRUQVlMQ2pNcVRqTEZzSTdH?=
 =?utf-8?B?YndKSlFxRWY3VWJnQ2wxYjZ2c3NFeGFGbThUK0dYVEl5c0FtRlR0OUtBSlJv?=
 =?utf-8?B?Rzk0b3pYRWlBZkVjRXFpMFJxb1Z2SU16emwwLzhjb3FTVHErLzhJd0pPUFBt?=
 =?utf-8?B?UzhnTVZsOU0rYnpZRWxuVG9pNE53WXAwSFNTRUFRQW5LejhzbnZFaHNUdWJN?=
 =?utf-8?B?eXZHb3N1S2laVGJRMk1GNk9iTjE2dG02Z3lZaWRuZHJVTnBHM2hNZktVazVT?=
 =?utf-8?B?aGxyWms2aXcyQWk2RnRHalNRTUgrTlJ4SXNIV1lBNWkvRWU4TTNpSFRDVmI3?=
 =?utf-8?B?UURGSjJieHQrZFFONXgrN0twUXYwTUxBd0tRZ0xMT1pKNTJ1ZEJhTVA2amR6?=
 =?utf-8?B?d0dKdFAvNnZFNVJUbGo3Z1owWGlLUWtLUlliRUNtcENMMzdiRXB6Ums5clhN?=
 =?utf-8?B?Mjg5Rm5wYm56K1lNSmpaYnpCaWs2WkZuc3ZSenpHcmRqS0R5Z3VoVlpqZEU0?=
 =?utf-8?B?akZmd1kxekhEcWprTWFUbWVRYjVKQ0FCdE91THFtVzNuQXF6ZjdGeWtNL2Q2?=
 =?utf-8?B?S0pMTTc0SEhCM3krTmdKbC9Rd0ZTTGRRSGpkTFdwMnV2RzV3d1BjRmtsakwr?=
 =?utf-8?B?UDZaYUY5OTdLTEkrdTF6OTdGMThLKzBFOTdwNENJWk5kMkVkNmIwcmZQT01T?=
 =?utf-8?B?V0x0WTJ2OEwwS2s0NDNhdldzaGZmek9VS1Z1U1VzZ0dZUGo5RDl6T1RkL3hX?=
 =?utf-8?B?dU9kOE8zdnFkaVI3VHFyKytYL1pmUHA1VEZkSHlJZEMzeDZ2Y1NYTXl5R2R2?=
 =?utf-8?B?NUtlblRKR240QmlmY2hoUnFYMVFvZHhWaCthdXNBM2VGVG1wbmxOaEhJdEdT?=
 =?utf-8?B?VSt5SE5Ya1JlSWJtVnZDT3BrV2N5UUVTZnhTcGUzYjVDcmF4aFlUUzFLZ1p3?=
 =?utf-8?B?OEJob3QxS29TMmFmT3JQUTZwbGswWkRLbFIrODdYbmt5dHhZNVZTalREa3hi?=
 =?utf-8?B?a1FGQzNHczF3K0ttZ3A5VzVPWTFPLzRpM3djYTVEclgzTStWVzJRZGxXaUJN?=
 =?utf-8?B?Rzh1WENnL21EanhESlpUakM0TGZpenFKN0tubmRKSExydVpJNzhKbXFOajBK?=
 =?utf-8?B?TUp4a0FKUS93cTJkZkI1VUdqcHVQeWNlMVhBQ2RzdDRmaUJMclpkL2lGdHA0?=
 =?utf-8?B?aGZpY0ErQzFjYXI0S0MxWjZ0cmRpWTgrYVlqa2JXc3A4dDVCQWMxUlFrWTBn?=
 =?utf-8?B?ajZUL1F0NGIvS2lrYkJ2MmZKQVhxR2p6YlZneUhYSmg2NEdLdXpsK1BQNzFC?=
 =?utf-8?B?ekpKMm9jc0YzRDNGRmM5bjB5TG5jTTJDYWdxYy9xb1VSMW1qQ2R6bWYyYW9y?=
 =?utf-8?B?c1R1YkE2OGdZVitMSGpEYlF2Ny9ud00reFJtUjhjanhwbW1pUWFJazJicW5N?=
 =?utf-8?B?U2RQMjh0THJNdHMwNDJPMGJKNCt1a0g5dXR4V1dMR0xZaEE5RXBGQnphMHd4?=
 =?utf-8?B?a2R2blkvNVVNTkJvcUowQmxnbENHTkZOR2FXM1dwaDJKTlhaS01lRlVTOTJZ?=
 =?utf-8?B?bW1aSTBSK3Q5T3NWYkNLQTVLbW5RVGV4dWc5d2xXU3k5VDkvbXYraFB3NXNw?=
 =?utf-8?B?WlFTZkVqbFcrOHZNK1QxWHY2aDJ0NWdMMWZzN0pBd0hyM0xvQ2Q2R2cyQ1p3?=
 =?utf-8?B?OVVEMS9hVm5sWmsrRkczZVVnSDZzVnUwVzVIR0lURksxUG1QWFUySCtpRmlY?=
 =?utf-8?B?VzJTdmM2V3c5aVRiZGFQM1JOdlJqbUNiZDdDdWlzdlZYQm8rVDRoME13MXNi?=
 =?utf-8?B?TmJYVGVSRTVydGxIYUVKSHRVQzNQMHpIRVAwTHVJd0pwZHNnRDhWUDJoN1Vt?=
 =?utf-8?B?aEpEelhTNURBMHRhZFJpR1NKbXBOYzdqZDk0VlN6RlY3WUgrZ2VGYzBpTFJr?=
 =?utf-8?B?dGYrRERXbjFPNHFsSGE4cUFuYTRnWEVMWE9CYU9Ec01vcWN1VTZLYWFZMEI3?=
 =?utf-8?B?OG42WVFYVkcyT1ltdXJma2s1SDg2THR1d3ZJWG1zTFBOd2NpbVBHRWVvbURt?=
 =?utf-8?Q?z64jF01PUwYOTPdR91d3tA6UB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c731e6ae-c11e-4e04-46be-08de0d95f8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 15:58:11.0638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0K8FPKA7+BBX7X4ALaRVYmpnzoULIc5uLWoQcoqDjWS2NpDRit1ucurjFRNb4VVlLw+XDumHrdNw9cof47grRcJTWh9MNjP5iSAY7kNz7bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

SGkgSmFzb24sIFRob21hcywgQ2hyaXN0aWFuLA0KIA0KPiBJZiB0aGUgaW1wb3J0ZXIgcHJvdmlk
ZXMgYW4gb3AgZm9yIHN1cHBvcnRzX2ludGVyY29ubmVjdHMoKSwgdGhlDQo+IGV4cG9ydGVyIHN0
YXJ0cyB0aGUgbWF0Y2hpbmcgKG9yIG5lZ290aWF0aW9uKSBwcm9jZXNzIChkdXJpbmcNCj4gYXR0
YWNoKSBieSBpbnZva2luZyB0aGUgc3VwcG9ydHNfaW50ZXJjb25uZWN0cygpIHdoaWNoIHdvdWxk
IHRoZW4NCj4gY2FsbCB0aGlzIGhlbHBlciB0byBpZGVudGlmeSB0aGUgZmlyc3QgY29tbW9uIGlu
dGVyY29ubmVjdA0KPiBzdXBwb3J0ZWQgYnkgYm90aCBleHBvcnRlciBhbmQgaW1wb3J0ZXIuDQo+
IA0KPiBOb3RlIHRoYXQgd2hldGhlciBhbiBpbnRlcmNvbm5lY3QgaXMgc3VwcG9ydGVkIGJldHdl
ZW4gYW4NCj4gZXhwb3J0ZXIvaW1wb3J0ZXIgaXMgdWx0aW1hdGVseSBkZXRlcm1pbmVkIGJ5IHRo
ZSBleHBvcnRlciB2aWENCj4gdGhlIG1hdGNoIG9wIGl0IGlzIGV4cGVjdGVkIHRvIHByb3ZpZGUu
DQpEb2VzIHRoaXMgZGVzaWduIGxvb2sgT0sgdG8geW91Pw0KDQpUaGFua3MsDQpWaXZlaw0KDQo+
IA0KPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4NCj4gQ2M6IENocmlzdGlh
biBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IFN1bWl0IFNlbXdhbCA8
c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmEu
dmV0dGVyQGZmd2xsLmNoPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaXZlayBLYXNpcmVkZHkgPHZpdmVr
Lmthc2lyZWRkeUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
YyAgICAgICAgICAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgaW5jbHVk
ZS9saW51eC9kbWEtYnVmLWludGVyY29ubmVjdC5oIHwgIDYgKysrKw0KPiAgaW5jbHVkZS9saW51
eC9kbWEtYnVmLmggICAgICAgICAgICAgIHwgIDkgKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDU5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPiBpbmRl
eCAxNjI2NDJiZDUzZTguLmVkNDg1NDBkMWMxZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+IEBAIC05
NjUsOCArOTY1LDExIEBAIGRtYV9idWZfZHluYW1pY19hdHRhY2goc3RydWN0IGRtYV9idWYgKmRt
YWJ1ZiwNCj4gc3RydWN0IGRldmljZSAqZGV2LA0KPiANCj4gIAlhdHRhY2gtPmRldiA9IGRldjsN
Cj4gIAlhdHRhY2gtPmRtYWJ1ZiA9IGRtYWJ1ZjsNCj4gLQlpZiAoaW1wb3J0ZXJfb3BzKQ0KPiAr
CWlmIChpbXBvcnRlcl9vcHMpIHsNCj4gIAkJYXR0YWNoLT5wZWVyMnBlZXIgPSBpbXBvcnRlcl9v
cHMtPmFsbG93X3BlZXIycGVlcjsNCj4gKwkJaWYgKGltcG9ydGVyX29wcy0+c3VwcG9ydHNfaW50
ZXJjb25uZWN0cykNCj4gKwkJCWF0dGFjaC0+YWxsb3dfaWMgPSB0cnVlOw0KPiArCX0NCj4gIAlh
dHRhY2gtPmltcG9ydGVyX29wcyA9IGltcG9ydGVyX29wczsNCj4gIAlhdHRhY2gtPmltcG9ydGVy
X3ByaXYgPSBpbXBvcnRlcl9wcml2Ow0KPiANCj4gQEAgLTE2ODAsNiArMTY4Myw0NiBAQCB2b2lk
IGRtYV9idWZfdW5tYXBfaW50ZXJjb25uZWN0KHN0cnVjdA0KPiBkbWFfYnVmX2F0dGFjaG1lbnQg
KmF0dGFjaCwNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfTlNfR1BMKGRtYV9idWZfdW5tYXBfaW50
ZXJjb25uZWN0LCAiRE1BX0JVRiIpOw0KPiANCj4gK2Jvb2wgZG1hX2J1Zl9tYXRjaF9pbnRlcmNv
bm5lY3RzKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4gKwkJCQkgY29uc3Qg
c3RydWN0IGRtYV9idWZfaW50ZXJjb25uZWN0X21hdGNoDQo+ICpleHAsDQo+ICsJCQkJIHVuc2ln
bmVkIGludCBleHBfaWNzLA0KPiArCQkJCSBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9pbnRlcmNvbm5l
Y3RfbWF0Y2gNCj4gKmltcCwNCj4gKwkJCQkgdW5zaWduZWQgaW50IGltcF9pY3MpDQo+ICt7DQo+
ICsJY29uc3Qgc3RydWN0IGRtYV9idWZfaW50ZXJjb25uZWN0ICpleHBfaWMsICppbXBfaWM7DQo+
ICsJY29uc3Qgc3RydWN0IGRtYV9idWZfaW50ZXJjb25uZWN0X29wcyAqaWNfb3BzOw0KPiArCXN0
cnVjdCBkbWFfYnVmICpkbWFidWYgPSBhdHRhY2gtPmRtYWJ1ZjsNCj4gKwl1bnNpZ25lZCBpbnQg
aSwgajsNCj4gKw0KPiArCWlmICghZXhwIHx8ICFpbXApDQo+ICsJCXJldHVybiBmYWxzZTsNCj4g
Kw0KPiArCWlmICghYXR0YWNoLT5hbGxvd19pYykNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+
ICsJaWNfb3BzID0gZG1hYnVmLT5vcHMtPmludGVyY29ubmVjdF9vcHM7DQo+ICsJaWYgKCFpY19v
cHMgfHwgIWljX29wcy0+bWF0Y2hfaW50ZXJjb25uZWN0KQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+
ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgZXhwX2ljczsgaSsrKSB7DQo+ICsJCWZvciAoaiA9IDA7
IGogPCBpbXBfaWNzOyBqKyspIHsNCj4gKwkJCWV4cF9pYyA9IGV4cFtpXS5pbnRlcmNvbm5lY3Q7
DQo+ICsJCQlpbXBfaWMgPSBpbXBbal0uaW50ZXJjb25uZWN0Ow0KPiArDQo+ICsJCQlpZiAoZXhw
X2ljLT50eXBlID09IGltcF9pYy0+dHlwZSkgew0KPiArCQkJCWlmIChpY19vcHMtPm1hdGNoX2lu
dGVyY29ubmVjdChleHBfaWMsIGltcF9pYykpIHsNCj4gKwkJCQkJYXR0YWNoLT5pbnRlcmNvbm5l
Y3QudHlwZSA9IGV4cF9pYy0NCj4gPnR5cGU7DQo+ICsJCQkJCXJldHVybiB0cnVlOw0KPiArCQkJ
CX0NCj4gKwkJCX0NCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWF0dGFjaC0+YWxsb3dfaWMgPSBm
YWxzZTsNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MX05TX0dQTChk
bWFfYnVmX21hdGNoX2ludGVyY29ubmVjdHMsICJETUFfQlVGIik7DQo+ICsNCj4gICNpZmRlZiBD
T05GSUdfREVCVUdfRlMNCj4gIHN0YXRpYyBpbnQgZG1hX2J1Zl9kZWJ1Z19zaG93KHN0cnVjdCBz
ZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQ0KPiAgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9kbWEtYnVmLWludGVyY29ubmVjdC5oIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLQ0KPiBp
bnRlcmNvbm5lY3QuaA0KPiBpbmRleCAxNzUwNGRlYTk2OTEuLmE3MmY2NWVkNDgwNiAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLWludGVyY29ubmVjdC5oDQo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvZG1hLWJ1Zi1pbnRlcmNvbm5lY3QuaA0KPiBAQCAtMjAsMTAgKzIwLDE2IEBA
IHN0cnVjdCBkbWFfYnVmX2ludGVyY29ubmVjdCB7DQo+ICAJZW51bSBkbWFfYnVmX2ludGVyY29u
bmVjdF90eXBlIHR5cGU7DQo+ICB9Ow0KPiANCj4gK3N0cnVjdCBkbWFfYnVmX2ludGVyY29ubmVj
dF9tYXRjaCB7DQo+ICsJY29uc3Qgc3RydWN0IGRtYV9idWZfaW50ZXJjb25uZWN0ICppbnRlcmNv
bm5lY3Q7DQo+ICt9Ow0KPiArDQo+ICBzdHJ1Y3QgZG1hX2J1Zl9pbnRlcmNvbm5lY3Rfb3BzIHsN
Cj4gIAlpbnQgKCptYXBfaW50ZXJjb25uZWN0KShzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICph
dHRhY2gsDQo+ICAJCQkJc3RydWN0IGRtYV9idWZfcmFuZ2VzICpyYW5nZXMpOw0KPiAgCXZvaWQg
KCp1bm1hcF9pbnRlcmNvbm5lY3QpKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwN
Cj4gIAkJCQkgICBzdHJ1Y3QgZG1hX2J1Zl9yYW5nZXMgKnJhbmdlcyk7DQo+ICsJYm9vbCAoKm1h
dGNoX2ludGVyY29ubmVjdCkoY29uc3Qgc3RydWN0IGRtYV9idWZfaW50ZXJjb25uZWN0DQo+ICpl
eHBfaWMsDQo+ICsJCQkJICAgY29uc3Qgc3RydWN0IGRtYV9idWZfaW50ZXJjb25uZWN0ICppbXBf
aWMpOw0KPiAgfTsNCj4gICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEt
YnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaA0KPiBpbmRleCBkYjkxYzY3YzAwZDYuLjNl
NjEyNDM4N2YzYyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgNCj4gKysr
IGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgNCj4gQEAgLTQ3OSw2ICs0NzksMTAgQEAgc3RydWN0
IGRtYV9idWZfYXR0YWNoX29wcyB7DQo+ICAJICogcG9pbnQgdG8gdGhlIG5ldyBsb2NhdGlvbiBv
ZiB0aGUgRE1BLWJ1Zi4NCj4gIAkgKi8NCj4gIAl2b2lkICgqbW92ZV9ub3RpZnkpKHN0cnVjdCBk
bWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCk7DQo+ICsNCj4gKwlib29sICgqc3VwcG9ydHNfaW50
ZXJjb25uZWN0cykoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPiArCQkJCSAg
ICAgICBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9pbnRlcmNvbm5lY3RfbWF0Y2ggKiwNCj4gKwkJCQkg
ICAgICAgdW5zaWduZWQgaW50IG51bV9pY3MpOw0KPiAgfTsNCj4gDQo+ICAvKioNCj4gQEAgLTU5
OSw2ICs2MDMsMTEgQEAgdm9pZCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoc3RydWN0DQo+IGRt
YV9idWZfYXR0YWNobWVudCAqLCBzdHJ1Y3Qgc2dfdGFibGUgKiwNCj4gIHN0cnVjdCBkbWFfYnVm
X3JhbmdlcyAqZG1hX2J1Zl9tYXBfaW50ZXJjb25uZWN0KHN0cnVjdA0KPiBkbWFfYnVmX2F0dGFj
aG1lbnQgKik7DQo+ICB2b2lkIGRtYV9idWZfdW5tYXBfaW50ZXJjb25uZWN0KHN0cnVjdCBkbWFf
YnVmX2F0dGFjaG1lbnQgKiwNCj4gIAkJCQlzdHJ1Y3QgZG1hX2J1Zl9yYW5nZXMgKik7DQo+ICti
b29sIGRtYV9idWZfbWF0Y2hfaW50ZXJjb25uZWN0cyhzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50
ICphdHRhY2gsDQo+ICsJCQkJIGNvbnN0IHN0cnVjdCBkbWFfYnVmX2ludGVyY29ubmVjdF9tYXRj
aCAqLA0KPiArCQkJCSB1bnNpZ25lZCBpbnQgZXhwX2ljcywNCj4gKwkJCQkgY29uc3Qgc3RydWN0
IGRtYV9idWZfaW50ZXJjb25uZWN0X21hdGNoICosDQo+ICsJCQkJIHVuc2lnbmVkIGludCBpbXBf
aWNzKTsNCj4gDQo+ICB2b2lkIGRtYV9idWZfbW92ZV9ub3RpZnkoc3RydWN0IGRtYV9idWYgKmRt
YV9idWYpOw0KPiAgaW50IGRtYV9idWZfYmVnaW5fY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAq
ZG1hX2J1ZiwNCj4gLS0NCj4gMi41MC4xDQoNCg==
