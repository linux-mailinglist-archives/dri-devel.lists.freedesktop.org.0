Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2898B86A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 11:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE6B10E606;
	Tue,  1 Oct 2024 09:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="JlxZr3aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97EE10E065
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 09:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVOC7E0bAXiS3p0YQ+PRwcYWb1A8seA60d4XW4GxkTSCkVL3+mMFEkXy0q76kVOX+xYKOC4rnmjcDKA1Kuw96DihddseaM0BdI4I2wLSOMxWNUWNBcDSj5BNjsOrQX+2MgE/TCsctdEEsOBpk0OY+6CEGA96HOhAoV/i+zyanNZ4cc3bTwn2NbB21aAPF2MoULYT2yYkmNygr4WZQl1csaDV5U+l/0T+F8/VB2gDCVjU+hQq2dq7KdoBTKTGoSIpfOOkEoc2H1hh54KALmRkF6Zul9YpMMoIma42Nvt1mScbOjWqvoKrvQOie3l0i//SfCHV8NIiRayQlh7kwhOdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6VU0OZ/qvj7TMmPNgt2xKR3PGTZwSiz9KzKLNGTH74=;
 b=fVglSnlbb/CCbQkfkWmh0dbAHr/tIuhXTq5HRk9iYOz8XByN4NQklXgi9kaaMlGae30H172AzYXScQsLLKQbl52H/xH24CoUMjFOp5MNpKflSJtEG4nS4I47pCzHZqv5l1XEmskG63xwQLOof5pwi/Julbc6g8OSQ5HCBKzvFIxXz1hSQsu3MrVCiNxwwkknxfZ5lvzWEWJSuKeazant1nQetwkMRrkR1dp/RXp5RpKMRVYTIQISBTxNW3pmtqtRvXsFhPKVbmWnCf2rGw4KiKlJ9fb3rjyf4sQHXAX8ZhYbr6HNxzZxnmPWhmZWBVFPayyELW39gOI+XjJkByENPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6VU0OZ/qvj7TMmPNgt2xKR3PGTZwSiz9KzKLNGTH74=;
 b=JlxZr3aHh9hoJCVchJk/uGCwMATu2PCPrP8PX582MGlfbb1AE9u64T5txeqCnU4NVAFYD/Lp3+P+Fjg0181BDnHxxy7HHkh291q8/MMrfzeLWVjoDtd07ljIU9uJouYM0Z/1S6Ini/xCNu0GXJwanWTBWZxiiJu4XW4OqgDg1B6FF3PcXkBAvaee8AeHijcQOTRheukamBVU9w61lDi64CW1wEquyE/1ChPeTOW1O48mTfZFQZ/1dnKVMa5v/7qgLwJlRmccZzWb8CgeR0lAVM+IclFBe0N8qsAU7iXuxSWM3wcf6/P5n+WktK3paEy3uqE7hmPocCgUItmH9I2VUA==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.28; Tue, 1 Oct
 2024 09:33:31 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 09:33:31 +0000
From: <Manikandan.M@microchip.com>
To: <dmitry.baryshkov@linaro.org>, <mripard@kernel.org>
CC: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Dharma.B@microchip.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Thread-Topic: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Thread-Index: AQHbCnSYAKfSHYvzgEG+hCzJDy3M9bJg0qeAgAQRYgCAAATmAIAE2xwAgABYQICAAAcKgIAAnVeAgAb0XgA=
Date: Tue, 1 Oct 2024 09:33:31 +0000
Message-ID: <9a5e3ed8-b7fd-4c1b-b0da-2c047ace0af7@microchip.com>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
 <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
 <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
 <17b5a11c-b9a8-4172-831e-d52f1a4270e9@microchip.com>
 <quxjqmx5yc27cxmjvnq6irltr36josag4yltxbiweh4femqbqo@j34pxmfxglc5>
 <20240926-foamy-oarfish-of-passion-ec6fa2@houat>
 <aehcvf55b52p6u5ai3uri7jzo2dywdhv6mxo4pxz3lhajjoxqe@izk23gt2yvdn>
In-Reply-To: <aehcvf55b52p6u5ai3uri7jzo2dywdhv6mxo4pxz3lhajjoxqe@izk23gt2yvdn>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|BN9PR11MB5290:EE_
x-ms-office365-filtering-correlation-id: bc562a82-afc8-4f21-5eac-08dce1fc1d34
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OG8xSXkvNER0VDVJUVc3eEU0anpUZ1JyR1VqK0tFbllacEhJU0FBWm9GK1o4?=
 =?utf-8?B?aWFNUUxKcmoyY1Qzamh3a0hFMFFUNTladGZoMWtQUU1MTFI5WktpNm1haHBP?=
 =?utf-8?B?YldQOVJzWmM0Y3h4MjVMa0l0OG1RTGwyTmttSmVtQUxPR2paQXlwVWxUdTBQ?=
 =?utf-8?B?cTRjMlVSbm05cTBVWHZCMi9VMXNEWXZHOVhRdHNJSG9oR2F1bFZCQ3N6RkR2?=
 =?utf-8?B?RlBCQzBkN1pCVXBJdW0vWlpBcTNRSEtVWm0xeXhUSHN0NE1HMUhieUtBNHgy?=
 =?utf-8?B?QUs5OVJ1ZlJDVk96ZlVUZ202U21NenNaRDlpbEl5dmMyM2dnbHpjc1dUSXNG?=
 =?utf-8?B?T3oyMkMyZnd2T3VTckxTUWJmY1hsZTQrMGNRQTkrNHVGcnhHVTdjRDFlY0E3?=
 =?utf-8?B?Y2tjMC9hSy9FUkRsTDl5dU1kMmF4SDN5ZTNrUENNR1c4VjJDMFkwemh3bFB5?=
 =?utf-8?B?TVNHaDdtd1JtM0xSV1RKUGhhdS81ZnVWeXRoWFRnbTRTcFZYY2hBUU9KQmVx?=
 =?utf-8?B?a1pnSVZhRm5uYWJjYkJENWQxWlRmM3I3MlZVclRwNDZicUlOTDFzdWdTNnFu?=
 =?utf-8?B?U2FZVlE4NVpTVGZrRTZ2eUxiV2h1THhnbWh3SHpFQS9UZ0s4RG5PdG5zZDJX?=
 =?utf-8?B?VVgxVjBrbGJWREdOZVJscFc3YmxGZlZUQ2xQekVjS05Hb3hXSVJ4TmtRL1h4?=
 =?utf-8?B?ZjI0YXErUnpzTDJDMFcrNVJaQ1A1MWkxMFlIUzlJaFp1Z3MxSDVMRUNwamV0?=
 =?utf-8?B?Y09XSWVDRnZGKzFmZmhONm1VTTU5QTJLN2pMWlhiYzNEbjR3NWt1V3laTmt3?=
 =?utf-8?B?YnpDc2NZUG1oN05kKzRXdXlLazluTnRoK2RMZ0hLS0ZQZkxITHBiVDZ0OW51?=
 =?utf-8?B?MFF5SXlBUElPSEh3b2c0dnZWQXpOR2s5Y2Ryd1IvLzBLZWErTVpOZms5WnZP?=
 =?utf-8?B?cGNEYXAwMkNsNEw4c3RYYmxYc2l0SCtheW8rcGhHRkRJS2ZiTVB0Qk5QeUd2?=
 =?utf-8?B?RXF4VkhhMnZkbk5MM3EwTGlscFVWOWJoc2F0WHkrblg1Q3k2eUJUQUxsK3JV?=
 =?utf-8?B?eVZGeCtUTWlPWCtjSSs2QkIwRGQ3ZTQrNXV1VmtTZzFVenh5Tk1vQ3Vxc2hv?=
 =?utf-8?B?TUlLOXBSM29oV3hJKytSc0JmeWEvVUdpRW9SWG9vVjQyeTdEWUh5QVgvUTUv?=
 =?utf-8?B?L2x0SzBvZWNES2M3eCtDYS9qd1MzNktvTFFKV3Q0R05YUVdSZTFIK3ZEQ2pW?=
 =?utf-8?B?TGc0RklFRFNzVjdWZkVzK01VU0h4VDVPYTJpbi8xbkVmNTNsdEU2TFhON0FZ?=
 =?utf-8?B?REhCa2ZZMWwwTkJQMW4zSFNzQkVmQlByeGZ0MHhGUGdkK2d5RVpkUlkrbUVT?=
 =?utf-8?B?ZENVUkt1SGViemtzeUZnRWxLWEd2VzdnRGhKNFBkVE9XaTZ5RFhIYmZkazN5?=
 =?utf-8?B?TzliZHY3NDZld3VuTFlJOEpTWEg3SHRTdGtyelFIZDRLWlprU2tXVkQvMFZw?=
 =?utf-8?B?WUN4NUVOTnVuM01sT01XM0QzRldLOTdDR0lUUDhrQWxQTk5rUFYzT3FtWnpM?=
 =?utf-8?B?UDR2OWFjWm5PTWpTYmVhMGs0Q055R1dEUjlxYnVsU3JYN0lMZjJ3SUVrdE5m?=
 =?utf-8?B?VUZsakxyZmdZazkyRjBMUWErTERibWlsdVZhNE1vQ3JaLzhtMm5aeHZPcWN0?=
 =?utf-8?B?K0tyay8zcEVPVTU3OU9XYUlFRGludzdWUVV3VjBzcUNIa0tpYmJGNFRBK0Yw?=
 =?utf-8?B?cHg3ODI2YWlOcUNsdTJwS0FzSmJyMHVMNEtrTXRUbno2aVJVT25zQ1hxVlgv?=
 =?utf-8?Q?Qy8eTtnrUqgDUqvtTBoPCK+hkZDbbe9zZAC1I=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnE5V1d3bGRmaElwNDI0SEZ0eUF0bXQyNGdSbFFJR25kQU5vaGo4ekZ6bXJk?=
 =?utf-8?B?cmxpb1k4Unl3WmpndkZuM2IwR0QxcUZpYjlsa3VJd3VDZ1FyemxsZlpST0cw?=
 =?utf-8?B?cEVjV0FVU3VkSW5Jd3pVRFkxdGNVNU42Q2dvSFZYUE5zY0l0ZFRFQ2ZQQ256?=
 =?utf-8?B?RTFCVHZnYmpnNWJELzBQU2UrSTh0LzIvT0MrUk1FS1dWVTdoU3RnTHVKd2tE?=
 =?utf-8?B?WFQyczdIcXZSRnhuS0VodmJwaWZ4MWJjZ1lmcDE2TkNQdnpYenh3TnNBMEdU?=
 =?utf-8?B?MXFoeGNDanpoWHpxUCt2REVhbjNSN2N4U1hTK0JFY1kzeHgraTFEWVUzaFdo?=
 =?utf-8?B?OUh6Q1FXcmp3UnR2Sk51Q0d6djZLYU9XZCtreFVMbmZBNmhRYWR6b2JLYVZu?=
 =?utf-8?B?WjhsSUp2M2p1ZU9WRDJCb0JXcnFyOU1KS2pDZTMxL3hpQ1Z1czR0RzQvdGxp?=
 =?utf-8?B?a0tUWUF4L2tUNjhZbUYzUkpJcERqNDRDUDQxTWZPSk1RV1NUckYvSExZZ2xm?=
 =?utf-8?B?eDdnRllQRE8rWmV0c1NEWk80bDhEemlRcmhraEJGbUxjczhBSTVxcjBqM2tV?=
 =?utf-8?B?clZWLzlISGFGS3pwcTAwOVNuRHo4cnpnWVdzem0yVVBIR2NHRmhSckMyY0NP?=
 =?utf-8?B?SjR5OFJCZzdBU2d3OFJibnNLbnQvSnNXaXo5QkRWakZOSy9tdFB0N0JPREta?=
 =?utf-8?B?NWMwZDJFM3FLd3FwWHNsMWwxZC9VMkJtUUxjK1lVWXRlUGN2RkFXa1pjSGVJ?=
 =?utf-8?B?NWxMdVc0NjVGWkc3N01uOCtnS21uNDFUbUJVdVZkTG5xNnpwNXMwK2RiUHlh?=
 =?utf-8?B?RFNuSlFWVVhKc21wZ1BjZThEVE1jM0F3TWFDRWFCTXdDUnNhTWhrN0N2aXFx?=
 =?utf-8?B?dndPZmxnTXF6bTVwci9EQnBvZnFsWEVCcEVlWk1HVEloTlFxMEJVa09jTkxu?=
 =?utf-8?B?ckxMNHVyU29aRUY4aHFsWlNtZVorQkJMaUZuUCtJTTdWVE0yZW5nVVRNd2dS?=
 =?utf-8?B?eXczanVxZUtMd2RnbFlpOEpvMm1CVjFqbUROL0dsN1ZkaWlDMHhrQ1FpTWo0?=
 =?utf-8?B?RkFJcVdxU0xBT28zaCtTUW9ZUlVqZVpyUEF1RU5kRDlRYjdCbHpJZzBJUE0w?=
 =?utf-8?B?aldhcEtyOVRWeUh0VTAyd3dPemtCVk4rT2FTc3RhQTEwck1Wd1lmUWFUeUJt?=
 =?utf-8?B?bmVkVGVML0w4RjVUR1A2Q1N6aHhiN1h5U0RxazN0dEFXTWFlLzlsZWxxSkdh?=
 =?utf-8?B?K0VQTEE4Y0dJczd2empLNEg1bTRJWVFyakxwTGlnWFpZVlhHSGJXNWpOSnl3?=
 =?utf-8?B?T1o0VWptdVM3UnB5TjJNRUZDbFdwQXhHTDlxR3dHMDVvcDNuYjlDSEt3VG80?=
 =?utf-8?B?RllxWUYxcGFTbUNkelFQa1drSmFNZzArQ2Rod3lJOVpHMUt0RkRxaGZTa0ts?=
 =?utf-8?B?bk9JQmJZWlRkaTVnb1drOXZlM2xLdkJjRjFvd1ZHSlZ3alFVYXFxOWVCZk9U?=
 =?utf-8?B?MENFcFBIa2Y2N1IveUxXN0dKMjJNbUk3c0tZWDBKWE9GdnFXQUVoaU5LYVdw?=
 =?utf-8?B?UnVzWERZRVlML3NtYmRIbDFtRzBicUV6WXZVU2c5Z0lJcE5EZkJDMGR5a1Vh?=
 =?utf-8?B?aWxxQjZpb01Td1g0RkY3TjRlamZXWktKUmdvdWxnWlk0Qng3ZDFpM29JcVd5?=
 =?utf-8?B?NzZLWGxjNE90Y0ZHZ1daSm1CdjZEYjVPSXZNZnU3WjdjMytrbVQ3djdycDkx?=
 =?utf-8?B?M2VtZnVwUUViMEFtZnZTVTNRM0hNNkRYSmxjN2d6M3ZvWHozVG5wVzdWb1My?=
 =?utf-8?B?TzNWR2NpeVpCWDdEcEJ0RklUdkp6cXkyVXE0YjFnVUdsS2hBek9MWEtWV1F6?=
 =?utf-8?B?bWN2NDFUM05MVWtyZVdaVTdmYW9IR0g4ZWR3c252TmMwblBTTUtXRlE5Rm1s?=
 =?utf-8?B?aXN5R2N0cngxblY5SVhza2tlb3FwV1JBTzloREV5K2lMWmZNcFNIZXRwK3lQ?=
 =?utf-8?B?Z1JMdGxFbXhFOGc3S0VEWFFBcGVxK3hlRVd5S2tPRFNEV2tDb3o0eTVJaW12?=
 =?utf-8?B?T2o5MkE2dFd2eG4wbUl3bHI0TXdzQXIvbzhUd2d0VEdFNVFwSnB5Z3F3cGVG?=
 =?utf-8?Q?FMorqYLT/C95H6XCcQHYC/SVV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25D16A533205F4419500B79381B8762F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc562a82-afc8-4f21-5eac-08dce1fc1d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 09:33:31.7289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idyVnGVhUj3Vb9suYQuWDrdzm5kMQhwpif/reaUcim2gXFhc7gnpr9eRha8AcvCLKwvWdDaTaxz3r5eyx4eDsVBqTC1LA6p7TaN1F2R5P1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

T24gMjcvMDkvMjQgNDo1MSBhbSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUaHUsIFNlcCAyNiwgMjAyNCBhdCAw
Mzo1ODoxMVBNIEdNVCwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4+IE9uIFRodSwgU2VwIDI2LCAy
MDI0IGF0IDA0OjMyOjU5UE0gR01ULCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOg0KPj4+IE9uIFRo
dSwgU2VwIDI2LCAyMDI0IGF0IDA4OjE3OjA5QU0gR01ULCBNYW5pa2FuZGFuLk1AbWljcm9jaGlw
LmNvbSB3cm90ZToNCj4+Pj4gT24gMjMvMDkvMjQgMTE6MzcgYW0sIERtaXRyeSBCYXJ5c2hrb3Yg
d3JvdGU6DQo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+DQo+
Pj4+PiBPbiBNb24sIFNlcCAyMywgMjAyNCBhdCAwNTo1MDoyMkFNIEdNVCwgTWFuaWthbmRhbi5N
QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4+Pj4gT24gMjAvMDkvMjQgOToxMyBwbSwgRG1pdHJ5
IEJhcnlzaGtvdiB3cm90ZToNCj4+Pj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIFRodSwgU2VwIDE5LCAyMDI0IGF0IDAyOjQ1OjQ4UE0g
R01ULCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+Pj4+Pj4+IEFkZCBzdXBwb3J0
IGZvciBNaWNyb2NoaXAgQUM2OVQ4OEEgNSBpbmNoIFRGVCBMQ0QgODAweDQ4MA0KPj4+Pj4+Pj4g
RGlzcGxheSBtb2R1bGUgd2l0aCBMVkRTIGludGVyZmFjZS5UaGUgcGFuZWwgdXNlcyB0aGUgU2l0
cm9uaXgNCj4+Pj4+Pj4+IFNUNzI2MiA4MDB4NDgwIERpc3BsYXkgZHJpdmVyDQo+Pj4+Pj4+DQo+
Pj4+Pj4+IEFDNjlUODhBIHNlZW1zIHRvIGJlIGEgbW9kdWxlIG5hbWUsIHJhdGhlciB0aGFuIGEg
cGFuZWwgbmFtZS4gV2hhdCBpcw0KPj4+Pj4+PiB0aGUgYWN0dWFsIHBhbmVsIG5hbWUgcHJlc2Vu
dCBvbiB0aGlzIG1vZHVsZT8NCj4+Pj4+PiBCb3RoIG5hbWVzLCAiTWljcm9jaGlwIEFDNjlUODhB
IiBhbmQgIk1QVTMyLUxWRFMtRElTUExBWS1XVkdBIiBhcmUNCj4+Pj4+PiBwcmVzZW50IG9uIHRo
ZSBkaXNwbGF5IG1vZHVsZQ0KPj4+Pj4NCj4+Pj4+IFdoaWNoIHBhbmVsIHdhcyB1c2VkIGZvciB0
aGUgbW9kdWxlPyBJIGRvbid0IHRoaW5rIHRoYXQgTWljcm9jaGlwDQo+Pj4+PiBwcm9kdWNlcyBM
VkRTIHBhbmVscy4NCj4+Pj4gSXRzIGEgbmV3IExWRFMgZGlzcGxheSBmcm9tIE1pY3JvY2hpcCB0
aGF0IHVzZXMgU2l0cm9uaXggU1Q3MjYyIFRGVCBMQ0QNCj4+Pj4gZHJpdmVyDQo+Pj4+DQo+Pj4+
IGh0dHBzOi8vd3d3LmNyeXN0YWxmb250ei5jb20vY29udHJvbGxlcnMvZGF0YXNoZWV0LXZpZXdl
ci5waHA/aWQ9NDg2DQo+Pj4NCj4+PiBPay4gQW55d2F5IGlmIHNvbWVib2R5IGVuZHMgdXAgbG9v
a2luZyBmb3IgdGhlIHBhbmVsLCB0aGV5J2xsIHByb2JhYmx5DQo+Pj4gZmluZCB0aGUgbW9kdWxl
IGFuZCB2aWNlIHZlcnNhLg0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4+DQo+PiBHaXZlbiB0aGF0IGFzaWRlIGZy
b20gdGhhdCBtYWlsLCB0aGUgbW9kdWxlIG5hbWUgaXNuJ3QgbWVudGlvbm5lZA0KPj4gYW55d2hl
cmUsIEknbSBub3Qgc3VyZSB0aGV5IHdvdWxkLg0KPj4NCj4+IFRoZSB3YXkgd2UgdXN1YWxseSBk
ZWFsIHdpdGggY29udHJvbGxlcnMgaXMgdG8gaGF2ZSBhIHNlcGFyYXRlIGRyaXZlcg0KPj4gZm9y
IHBhbmVscyBiYXNlZCBvbiB0aGF0IGNvbnRyb2xsZXIsIGV2ZW4gbW9yZSBzbyBzaW5jZSB0aGF0
IGNvbnRyb2xsZXINCj4+IHNlZW1zIHRvIGJlIGFibGUgdG8gYWZmZWN0IHRoZSBkaXNwbGF5Lg0K
PiANCj4gQnV0IGluIHRoaXMgY2FzZSBpdCdzIHBhbmVsLXNpbXBsZSwgbm8gc3BlY2lhbCBkcml2
ZXIgZm9yIHRoZQ0KPiBjb250cm9sbGVyLiBGcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhlIEFDNjlU
ODhBIGlzIHRoZSBtb2R1bGUgbmFtZSAoYXQNCj4gbGVhc3QgdGhlIGRhdGFzaGVldCB1c2VzIHRo
YXQgbmFtZSkuIFRoZSBvbi1ib2FyZCBFRVBST00gYWxzbyBjYXJyaWVzDQo+IHRoYXQgbmFtZSBh
bmQgdGhlIG5hbWUgb2YgdGhlIGNvbnRyb2xsZXIuDQpZZXMsIGFzIHBlciB0aGUgcHJvcG9zZWQg
b24tYm9hcmQgRUVQUk9NIHNwZWMsIGl0IGhvbGRzIHRoZSBtb2R1bGUgbmFtZSANCmFuZCB0aGUg
TENEIGRyaXZlciB1c2VkLg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkN
Cg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
