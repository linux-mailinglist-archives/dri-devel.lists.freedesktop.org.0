Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3FE9F5335
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71E10EA35;
	Tue, 17 Dec 2024 17:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="YWmSHcmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260d::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B54710EA35
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:26:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bApjdWlI7w8rVA3ayP3/uzM9llY7ebbbOwPg+6qJMbb0dumlEJtkP59/VdA62vY0+NneDN0CsA2ulXotE8dfryrq0ztQ255Zppg5WrqnCllanuPGIRfUc9o5rLyliykZzD4DFwooiSYqLm5xtxdOABYgIr/dh/QP+A6ZB7bgxUXgmqzrrTzuC3QnNXe4DL9/HS7sQAbcT9KgxwRCIJ+2+gCjEN04/CN/J8vjqB6rsQTzg2oHiFnZiK9b+xW9fXpmIzbXCjZ+AwSSuDEAoooBimwMGJpTB5Pkjd2d4M/AEasSvZP3Yyiy2w+1bGqMVuxxMqyoEFAg9zoqt2iCPDDHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inKpU/AtW6GnxknGgDd0GZU7aEngXXGnQ7IfQoCKnJY=;
 b=jACEOy4ZSpKDyRw97nAvGygmkb3xrQopCH0/EHJK3lZtUZyzDi5e9goeDU2wmrgd/e8puocOiEGQgbNjXrhTyrgzRiY3pv1yMMzA2/OGDVI9z1oD56nESNeEAZLbHieXLLwP8B+lQjVpFjXAOdAvbYoT36FbUqhEXWrS5qLYx/XbxwLHR/BLK6g3L3rpe5b8DE+IOSROpk2Zr1Wn/PbnN20AN6DqMId7qf+RKFNKy0LW/rGS5G1kPkrZ7Lig+caciM6xvKzmaIiBborbuPxhagxTAztIbELrUFPRujkvDBMmVGdK2gH48siZKLUsiUcA2hD92TZP2xLaivatnykYiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inKpU/AtW6GnxknGgDd0GZU7aEngXXGnQ7IfQoCKnJY=;
 b=YWmSHcmCK/hgrfYQp+ZSQBr60ttx6I1fwdBulZFLGBK+oh9gGt4k3s+TLtJ0EgT3ViGK2sderm9h8q/s5xlEczlavS8uvPAgqbsAcWy81Bvv0GW7KeI9XLXY7FuYDTyc0CK0Z3Bdhq0HhwzQ7nTel2lpRPawZ1jJlRBxQro4Jsi2uuA0oO/s9RDYJFKYt+NRtkq0aO88/iMsjHwc8Ey+QUadqEp8fxGSUaSY0RRMyBhjBaiJDdpdnHqNyQQMGinZf7m2eZZDYgvvBkLdLHRZcQKwmPhVvKV8G7LLA6cl/VjFsq8QFs3kSmzOkx6oE3CuzS2voc211sx6xk3DCHFPWg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA1PR10MB8546.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.11; Tue, 17 Dec
 2024 17:26:24 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 17:26:24 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "afd@ti.com"
 <afd@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "lee@kernel.org"
 <lee@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "danielt@kernel.org" <danielt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] leds: lp8864: New driver
Thread-Topic: [PATCH v4 2/2] leds: lp8864: New driver
Thread-Index: AQHbUIjMUwx+j9IEfUCIwCFyj7ubGbLql36AgAAZBoA=
Date: Tue, 17 Dec 2024 17:26:24 +0000
Message-ID: <05d69345baf79df9741543a0ff64117c6f058cda.camel@siemens.com>
References: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
 <20241217133713.326853-3-alexander.sverdlin@siemens.com>
 <b0e2e061-0a1f-4cba-9f25-b26769e8ff27@ti.com>
In-Reply-To: <b0e2e061-0a1f-4cba-9f25-b26769e8ff27@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA1PR10MB8546:EE_
x-ms-office365-filtering-correlation-id: 2686fbda-b3d6-4fb3-1296-08dd1ebfee9a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QW1KUXhnUlZIc3FNMkZ4cVozenVaZFczQzhrSlhnd3pndW9Fblpha05UY25Y?=
 =?utf-8?B?VlpSMng3MURUQkxSREx1eFZHMXl2T0d4U2gyMTIwdG5Sa0tDa2tSMDQwL1kw?=
 =?utf-8?B?VWFBSGZaV2ZydUg0VGhkOE1aOTNTMFAwNXlVUGFydHAyamtHT0pDZjJFS0hR?=
 =?utf-8?B?VGI1Y05YQjFCaXc4K1M2c2daM0RZdWk0K21QeVVGNXFkMmw5dzIreElQbkIr?=
 =?utf-8?B?aUlMYVk1ZS9MNjlZLzhIeWxiVmI1WFlGTTVqN0F1U3hFOUoybE9BRjVjZW1X?=
 =?utf-8?B?a3dIcmdjRjR1S0RoZmV5L0ozKzRaeUZnS3VTbjZsZlpHS1NWbGd3cjVPN05I?=
 =?utf-8?B?eHhORWF0c3pwQktOMWN3S0hJNGVzY3VMNWRQS2p5TGp4ZmZhcXptQkdPdVRE?=
 =?utf-8?B?TFhqMVhTK2tpTzV4QWVrMEsvWXlQNWR2RDI1Sk1JQXl5VWJSQzVyS3B6Mko2?=
 =?utf-8?B?Ym9DcEhRK3JMeEtnT1lHMDhRK1BlZ0kxUW5DMzZRaEQyVjlUd2xPNlZ4cmd1?=
 =?utf-8?B?aHRKMytJK1hYWjFFeHZ0am9Gbnpqb2lHKzM0RU83dTlmVmZoaWg4dVprN0Zy?=
 =?utf-8?B?b0hkQmZFNEo0MnRkVGNvbHEydDFvaGVXY1RaMGtYaWpRMm4rTm1UWlo3eTJp?=
 =?utf-8?B?d2QyRTFQbFhZcHRWM1BSbUdERzJSTW5qZXp2d0VVT3ZUMnptZmZmek1Wekps?=
 =?utf-8?B?Q3pGU1lVQ0ZRV2VJSmlNUkR0Y2szM04yYWdLYXNJdTVoVkVJMmhYdms5aFU5?=
 =?utf-8?B?Y2Q4Z3RkN0lUOTF3MGlPaHMxY3lnMlBzb290QWtNR1JJUVJEYjc5ZGJid0FN?=
 =?utf-8?B?VG81THU2d0RFS2dMaUI4NTdmQThybUltUUl1bGJRYzRacTdNQ3pmdTZ3SXFZ?=
 =?utf-8?B?L3RqbG12NXhiVlpINW9RK2FCVkU2L3U3SG04Yk54djhpWlkwU0RQZXh5MUxD?=
 =?utf-8?B?YnBvWHJ5eHowL2xCa2FDZ2RrVXBZUnpkM0QwMUUwYUdJYmt1U2Z3N3hNKzBl?=
 =?utf-8?B?NWFveVd6NXI2Rk1QZXVxT1I4djBWNDNjWG4vWDdRN29mTUVMMmh5K1FyTzBi?=
 =?utf-8?B?NVNLWXMxMjRuQWRqek1SeHFOdGloSG5ZY3RnWW94K1BENVN2VUZLdWhrWGVH?=
 =?utf-8?B?MGtHM3h0elM3Um9MbXk1d1d4S2l3WS9ac1dtNG14VkVjeHJ2bFlRTHBJazly?=
 =?utf-8?B?VkNCc2I4dzFTT3dUSjJlUHNlK3YyYUtkYzMwSlpiYmhtdzFPUXhSTk9kNndQ?=
 =?utf-8?B?NXFNNXd6eTd3TzJlQlNqelVpSlpNU284czNRR1gzZmFyWkVKN3RuTk9qaCt0?=
 =?utf-8?B?Q2l1Ykg5MlEzN0YxK2MrTnBOSDhVT3BJcWlzQWNQdy9WckhWQWJDUklTaU4v?=
 =?utf-8?B?UGdwdDJHbzFJSXVTRzEweGpnWXFSbVNJQXBmclZDdzg5aGRXZVUyQmRBbjhF?=
 =?utf-8?B?cnVDT215VjJxWkdWd3N3S2lYY081Q2xMUWZBMllRbXdVWUhoTFdlRFdyTWwr?=
 =?utf-8?B?eXIycklReGIvaDYwTmYrMzJweUFLaEJqQVoyU1hQMGJMNjJhcnM4U3ZVVWJ4?=
 =?utf-8?B?U0VMMnJ2MzN5aml1bTRENG5GY3dHOWlrc0NNby9LVXRiLzlVVGM0K0xIeTZU?=
 =?utf-8?B?YmtxVFRpNXUyM3pieWJwalIrN3NlNGV3dStiTURDVksrL1pPRDJjeTE4cWg0?=
 =?utf-8?B?Q0FlZ0d4L0RMMHFIZ2VTc053YmhTQ3VJdUFmWnUrTjVLbzlocUJPenRBanJT?=
 =?utf-8?B?Y3FTZE1qcVFwNFF3bXBkcXpUcXFyaDBYdTVnRUZYWjZER0ppbVpYYTc1eEl1?=
 =?utf-8?B?aWNIUXpPS1JHM1c0ay95T2pZR0NRdDFoU29Qay9KeTlmNHlJbUZTYU9WOTZX?=
 =?utf-8?B?angydjJTaVpFQU1aV0R3NnBNY3IyZ1doKy9BNU51UFpKeHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBNVG1idE5pVmdTY1ZyM3pmOVJGQ0hXTC9iYm1rdUZaM0M5dmdhQjdFNGRr?=
 =?utf-8?B?UHBIVkNWaXpXUkRqS0UwY1BVRnA2THVkYzlUdTB0Wm5KdU5ueXRVYnEyZkZr?=
 =?utf-8?B?NkN6Yk5IVWNUY2ZOL3VCQjJaaUt2LytUNXFiVm1ZaGxtdTRYY0VuUk12QkpU?=
 =?utf-8?B?Uy9pNlNuU0E2OWUxbFBwd2dRTkVldTJPYVQ0QjdsY1BJc1l6YUZHNzdPRVRa?=
 =?utf-8?B?MW9ibmszMFMxOXV5VmRBYkZEeEhabmdOcUZjQlMvYmxLcDZTM2RvaVZTQ29p?=
 =?utf-8?B?SWpHdmg0dkl4VzRXTmhJR1pEQUVLUkhMTDkvUktSems3S09PbTNpUnlWNTBM?=
 =?utf-8?B?SEJMZCthbjBad0Q1MkZrMUIvbi96YVM3ZDBnUUMrRjh3M01XcFlOcnRUdzhR?=
 =?utf-8?B?MmI0QWU4enI4ZEU2YWR1Wk1CaWoyZkRGSWEvQVc2d3hrVnd0ZjhtMzdtTVRk?=
 =?utf-8?B?SXVNZWpSUTNBZE53ekdnRTJiNGVOY2R2RHRVTGYrZUo1a0xTczMwTkM1bTJj?=
 =?utf-8?B?bVMwZktFek5pZUN2em5KWXJ4UlZkODNLRmdvTGQwWEtFS3dRcmpISTRlR1Q0?=
 =?utf-8?B?WDJ2NmRxZUFRazBuS3BkeU1PYTdoZzdxR3FVdmQ1cTZmR1JBY1dRWEJqRlQx?=
 =?utf-8?B?RjRqN2g2enNtY05KWnVFaVRLNmhnWS9oWVBQQllVaG9qV3BvRFJGM0tzY0FM?=
 =?utf-8?B?YWZvSFp5cGlPSWFTSXNGVnRRSWxmUHBxRHZGUFp3RDBtK2l6SW5sVG0vYytC?=
 =?utf-8?B?WFMvaFNCUTlvM3Z5dk9lU2w0WVNMdnpVc0h2RW5XaDJwbTh3SGhJMzhQSzdt?=
 =?utf-8?B?OXhIaDJta0dtak5XS0RzVHZIdzRxaVJ5OWlnbWFldWMraUVXY1RjMW5xeWY3?=
 =?utf-8?B?Y0x2Znc3QnZFbURLb2V3eEI5bWpKOWlPR05MMXBrdiswZkhEd1M3YllUczEy?=
 =?utf-8?B?N1FpTDJIUDlDQjNNMDVzcDE1YlNXZENrb1dBWGZvQWVNdjU3MjE4WnBiYjIw?=
 =?utf-8?B?dHpSeW1TQm1zRkpBZSsvQndZbGxPSDRraFdvTEgzM0JoTzJNR2Q3L3p5Wjhn?=
 =?utf-8?B?NEhFM2dhVEo5OTBtaVBnZnppWlUramRUUXFWT1BURC9hUEZQdEVjUG96OTBy?=
 =?utf-8?B?am5mWmZvYktIVU1IKzJJRjRMN2gyUXdsQnprZmxCRkEwRXh5YnZtUDk2eXVO?=
 =?utf-8?B?SVZEYWpKZXRGZEtaZlpNNlRUVWx3MDJ5NHhtRVNISms0a1pNZ1VQZENMOHdi?=
 =?utf-8?B?VEx2M0pESFgyVzlUTVlyQXhPanhkcXNzWmJmUXdMQldYNUovV3ZQNUw1OGo5?=
 =?utf-8?B?aGplOC8zZ0xwK3RrVTVmMlgxMXBxNkZQVjlJbWt6bnFPNzBpcjVZV1VEeWlp?=
 =?utf-8?B?bW5zNC9yNWwzZlJnbkJ6Q0hLcWZhdTdUL21JSzdGRms2cVNnYTBnVVJrRVNF?=
 =?utf-8?B?UGhSQzRKOERNREFmd0pBZk9WVHpRMWd4UWFtNUZpQlZqZXArN1dzMFgrdGtN?=
 =?utf-8?B?eEJEYUkwMXBLQzEyUS84RHZBM3B5Mld5R1FqK01aaWpKVUFHS2tmQnArUGta?=
 =?utf-8?B?MGhEcjdUNFlMbHpISFFPNkVsa0VJN2hGaXRFR1A2Uk9HNzZ1SGN1MVJ4WW9x?=
 =?utf-8?B?a3JFTEJ6YXFxV3FMaE0vdkdFeFp2MzNIUDYxWHlzdzlkNHExcGJReSt4b2Nj?=
 =?utf-8?B?WGkwb1JWU29mVFJLWXlwakJQM2plZ0xMWlp5c3JFMC9XVERBTDlTblJ3cUdU?=
 =?utf-8?B?RThJOGdOcVdTZ2ZHRGNOME5jN1ZyVmNocVRGY3I0ckNwclhIYTBLMUxUOUtl?=
 =?utf-8?B?NlJ6UnN1bkc4Yjlhem4xYVdIQnJLSEVlNTQzbFdFVmgxb0hnVUYwR2M5VjN0?=
 =?utf-8?B?OWR4Tkx2TDZhK1Q5amVSK0p5UDd5SzN0RmVwemFCZ2gvenZrNFhpWS8yRTZV?=
 =?utf-8?B?Rm1aYjZEZ2FBdUErYW1SM0ovM0N1dUxHc3hCZEJ0QVRaMEFESFZjZzl2Q2xP?=
 =?utf-8?B?U3VIZ0IyMW5SM3pMdHNNY1hsQm1XZnl3cytOa3ZHN2kvZUNTR0IzQU1JL0Zl?=
 =?utf-8?B?WUd6Z1VmMmpOMVJoTTJIaXNGTkhZYmlVSkFVOVZnc05vUWxFZWx5UHVxOTNx?=
 =?utf-8?B?SzVFcEJ3UjV1UldaUWoybURKWlkyWVloRENrL1pMKzQ3NnNKS0VyT3luV2Ux?=
 =?utf-8?Q?Rm6fOlLWGqgir49nNK82ouA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F11B25EEF05624D8336999729B050EF@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2686fbda-b3d6-4fb3-1296-08dd1ebfee9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 17:26:24.6677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULetumqi0NODWKBEYnp6pPKqSK+CvS19x9eHTJIb0wynGsgTpFswhQdxQBUQ0svrEZySBqZfpqBveHS8oP6h3Y0lgYbpfcdob8pPemqxSOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8546
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

SGkgQW5kcmV3IQ0KDQpPbiBUdWUsIDIwMjQtMTItMTcgYXQgMDk6NTYgLTA2MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gT24gMTIvMTcvMjQgNzozNyBBTSwgQS4gU3ZlcmRsaW4gd3JvdGU6DQo+
ID4gRnJvbTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5j
b20+DQo+ID4gDQo+ID4gQWRkIGRyaXZlciBmb3IgVEkgTFA4ODY0LCBMUDg4NjRTLCBMUDg4NjYg
NC82IGNoYW5uZWwgTEVELWJhY2tsaWdodCBkcml2ZXJzDQo+ID4gd2l0aCBJMkMgaW50ZXJmYWNl
Lg0KPiA+IA0KPiA+IExpbms6IGh0dHBzOi8vd3d3LnRpLmNvbS9saXQvZ3BuL2xwODg2NC1xMQ0K
PiA+IExpbms6IGh0dHBzOi8vd3d3LnRpLmNvbS9saXQvZ3BuL2xwODg2NHMtcTENCj4gPiBMaW5r
OiBodHRwczovL3d3dy50aS5jb20vbGl0L2dwbi9scDg4NjYtcTENCj4gPiBMaW5rOiBodHRwczov
L3d3dy50aS5jb20vbGl0L2dwbi9scDg4NjZzLXExDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+
ID4gQ2hhbmdlbG9nOg0KPiA+IHY0Og0KPiA+IC0gYmV0dGVyIHNlcGFyYXRlZCBjb21tZW50cyBm
cm9tIHJlZ2lzdGVyIGRlZmluZXMNCj4gPiAtIHJlbW92ZWQgTlVMTCBmcm9tIGZhdWx0IHRleHQg
YXJyYXlzIGZvciB0d28gcmVncyB3aXRoIG9kZC1ldmVuIHN0cnVjdHVyZQ0KPiA+IC0gY2hhbmdl
ZCBIVyBmYXVsdCBwcmludGYgZnJvbSBlcnJvcnMgdG8gd2FybmluZ3MNCj4gPiAtIHJlbmFtZWQg
ImJ1ZiIgLT4gInZhbCINCj4gPiAtIHJlZmxvd2VkIHRoZSBjb2RlIHdpdGggdXAgdG8gMTAwIHN5
bWJvbHMgcGVyIGxpbmUNCj4gPiAtIGFkZGVkIGNvbW1lbnRzIGZvciA4PC0+MTYtYml0IGxpbmVh
ciBzY2FsaW5nIGluIHNldC9nZXQgY2FsbGJhY2tzDQo+ID4gLSByZW1vdmVkIHJlZ2lzdGVyIG5h
bWVzIGZyb20gZXJyb3IgbWVzc2FnZXMNCj4gPiB2MzoNCj4gPiAtIGRyb3BwZWQgbHA4ODY0X2lu
aXQoKSwgUkVHQ0FDSEVfTk9ORSwgJXBlIGluIGRldl9lcnJfcHJvYmUoKSwNCj4gPiDCoMKgwqAg
aTJjX3NldF9jbGllbnRkYXRhKCkNCj4gPiAtIGFkZGVkIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNl
dCgpIHJldHVybiB2YWx1ZSBjaGVjaywgZGV2X2Vycl9wcm9iZSgpIGFmdGVyDQo+ID4gwqDCoMKg
IGRldm1fcmVnbWFwX2luaXRfaTJjKCkNCj4gPiB2Mjogbm8gY2hhbmdlcw0KPiA+IA0KPiA+IMKg
wqAgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArDQo+
ID4gwqDCoCBkcml2ZXJzL2xlZHMvS2NvbmZpZ8KgwqDCoMKgwqDCoCB8wqAgMTIgKysNCj4gPiDC
oMKgIGRyaXZlcnMvbGVkcy9NYWtlZmlsZcKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gwqDCoCBk
cml2ZXJzL2xlZHMvbGVkcy1scDg4NjQuYyB8IDI5NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gwqDCoCA0IGZpbGVzIGNoYW5nZWQsIDMxNiBpbnNlcnRpb25zKCsp
DQo+ID4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9sZWRzL2xlZHMtbHA4ODY0LmMN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiA+IGlu
ZGV4IGIzMzI5OTViMzM1MC4uZDQyNjhhM2JiYzVhIDEwMDY0NA0KPiA+IC0tLSBhL01BSU5UQUlO
RVJTDQo+ID4gKysrIGIvTUFJTlRBSU5FUlMNCj4gPiBAQCAtMjMzMjIsNiArMjMzMjIsMTMgQEAg
UzoJU3VwcG9ydGVkDQo+ID4gwqDCoCBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaWlvL2RhYy90aSxkYWM3NjEyLnlhbWwNCj4gPiDCoMKgIEY6CWRyaXZlcnMvaWlvL2RhYy90
aS1kYWM3NjEyLmMNCj4gPiDCoMKgIA0KPiA+ICtURVhBUyBJTlNUUlVNRU5UUycgTEI4ODY0IExF
RCBCQUNLTElHSFQgRFJJVkVSDQo+ID4gK006CUFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVy
LnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KPiA+ICtMOglsaW51eC1sZWRzQHZnZXIua2VybmVsLm9y
Zw0KPiA+ICtTOglNYWludGFpbmVkDQo+ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC90aSxscDg4NjQueWFtbA0KPiA+ICtGOglkcml2ZXJzL2xl
ZHMvbGVkcy1scDg4NjQuYw0KPiA+ICsNCj4gPiDCoMKgIFRFWEFTIElOU1RSVU1FTlRTJyBTWVNU
RU0gQ09OVFJPTCBJTlRFUkZBQ0UgKFRJU0NJKSBQUk9UT0NPTCBEUklWRVINCj4gPiDCoMKgIE06
CU5pc2hhbnRoIE1lbm9uIDxubUB0aS5jb20+DQo+ID4gwqDCoCBNOglUZXJvIEtyaXN0byA8a3Jp
c3RvQGtlcm5lbC5vcmc+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9LY29uZmlnIGIv
ZHJpdmVycy9sZWRzL0tjb25maWcNCj4gPiBpbmRleCAzYmY1MWE0ZTAxZDcuLjVkZGU4ZjQ2MTAw
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2xlZHMvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZl
cnMvbGVkcy9LY29uZmlnDQo+ID4gQEAgLTUxMyw2ICs1MTMsMTggQEAgY29uZmlnIExFRFNfTFA4
ODYwDQo+ID4gwqDCoMKgCcKgIG9uIHRoZSBMUDg4NjAgNCBjaGFubmVsIExFRCBkcml2ZXIgdXNp
bmcgdGhlIEkyQyBjb21tdW5pY2F0aW9uDQo+ID4gwqDCoMKgCcKgIGJ1cy4NCj4gPiDCoMKgIA0K
PiA+ICtjb25maWcgTEVEU19MUDg4NjQNCj4gPiArCXRyaXN0YXRlICJMRUQgc3VwcG9ydCBmb3Ig
dGhlIFRJIExQODg2NC9MUDg4NjYgNC82IGNoYW5uZWwgTEVEIGRyaXZlcnMiDQo+ID4gKwlkZXBl
bmRzIG9uIExFRFNfQ0xBU1MgJiYgSTJDICYmIE9GDQo+ID4gKwlzZWxlY3QgUkVHTUFQX0kyQw0K
PiA+ICsJaGVscA0KPiA+ICsJwqAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IHN1cHBvcnQg
Zm9yIHRoZSBUSSBMUDg4NjQtUTEsDQo+ID4gKwnCoCBMUDg4NjRTLVExLCBMUDg4NjYtUTEsIExQ
ODg2NlMtUTEgNC82IGNoYW5uZWwgTEVEIGJhY2tsaWdodA0KPiA+ICsJwqAgZHJpdmVycyB3aXRo
IEkyQyBpbnRlcmZhY2UuDQo+ID4gKw0KPiA+ICsJwqAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBh
cyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlDQo+ID4gKwnCoCBtb2R1bGUgd2lsbCBiZSBj
YWxsZWQgbGVkcy1scDg4NjQuDQo+ID4gKw0KPiA+IMKgwqAgY29uZmlnIExFRFNfQ0xFVk9fTUFJ
TA0KPiA+IMKgwqDCoAl0cmlzdGF0ZSAiTWFpbCBMRUQgb24gQ2xldm8gbm90ZWJvb2siDQo+ID4g
wqDCoMKgCWRlcGVuZHMgb24gTEVEU19DTEFTUyAmJiBCUk9LRU4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9sZWRzL01ha2VmaWxlIGIvZHJpdmVycy9sZWRzL01ha2VmaWxlDQo+ID4gaW5kZXgg
ZTc5ODI5MzhkZGMxLi44YTJjYWE0ODM0M2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9sZWRz
L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9sZWRzL01ha2VmaWxlDQo+ID4gQEAgLTU3LDYg
KzU3LDcgQEAgb2JqLSQoQ09ORklHX0xFRFNfTFA1NVhYX0NPTU1PTikJKz0gbGVkcy1scDU1eHgt
Y29tbW9uLm8NCj4gPiDCoMKgIG9iai0kKENPTkZJR19MRURTX0xQODUwMSkJCSs9IGxlZHMtbHA4
NTAxLm8NCj4gPiDCoMKgIG9iai0kKENPTkZJR19MRURTX0xQODc4OCkJCSs9IGxlZHMtbHA4Nzg4
Lm8NCj4gPiDCoMKgIG9iai0kKENPTkZJR19MRURTX0xQODg2MCkJCSs9IGxlZHMtbHA4ODYwLm8N
Cj4gPiArb2JqLSQoQ09ORklHX0xFRFNfTFA4ODY0KQkJKz0gbGVkcy1scDg4NjQubw0KPiA+IMKg
wqAgb2JqLSQoQ09ORklHX0xFRFNfTFQzNTkzKQkJKz0gbGVkcy1sdDM1OTMubw0KPiA+IMKgwqAg
b2JqLSQoQ09ORklHX0xFRFNfTUFYNTk3MCkJCSs9IGxlZHMtbWF4NTk3MC5vDQo+ID4gwqDCoCBv
YmotJChDT05GSUdfTEVEU19NQVg3NzY1MCkJCSs9IGxlZHMtbWF4Nzc2NTAubw0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkcy1scDg4NjQuYyBiL2RyaXZlcnMvbGVkcy9sZWRzLWxw
ODg2NC5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjllZTllNWUwZGYzYw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2xlZHMv
bGVkcy1scDg4NjQuYw0KPiA+IEBAIC0wLDAgKzEsMjk2IEBADQo+ID4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiArLyoNCj4gPiArICogVEkgTFA4ODY0L0xQ
ODg2NiA0LzYgQ2hhbm5lbCBMRUQgRHJpdmVyDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAyNCBTaWVtZW5zIEFHDQo+ID4gKyAqDQo+ID4gKyAqIEJhc2VkIG9uIExQODg2MCBkcml2
ZXIgYnkgRGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2ky
Yy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
bGVkcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxs
aW51eC9tdXRleC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L3JlZ21hcC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVy
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gKw0KPiA+ICsjZGVmaW5lIExQ
ODg2NF9CUlRfQ09OVFJPTAkJMHgwMA0KPiA+ICsjZGVmaW5lIExQODg2NF9VU0VSX0NPTkZJRzEJ
CTB4MDQNCj4gPiArI2RlZmluZcKgwqAgTFA4ODY0X0JSVF9NT0RFX01BU0sJCUdFTk1BU0soOSwg
OCkNCj4gPiArI2RlZmluZcKgwqAgTFA4ODY0X0JSVF9NT0RFX1JFRwkJQklUKDkpCQkvKiBCcmln
aHRuZXNzIGNvbnRyb2wgYnkgRElTUExBWV9CUlQgcmVnICovDQo+ID4gKyNkZWZpbmUgTFA4ODY0
X1NVUFBMWV9TVEFUVVMJCTB4MGUNCj4gPiArI2RlZmluZSBMUDg4NjRfQk9PU1RfU1RBVFVTCQkw
eDEwDQo+ID4gKyNkZWZpbmUgTFA4ODY0X0xFRF9TVEFUVVMJCTB4MTINCj4gPiArI2RlZmluZcKg
wqAgTFA4ODY0X0xFRF9TVEFUVVNfV1JfTUFTSwlHRU5NQVNLKDE0LCA5CS8qIFdyaXRlYWJsZSBi
aXRzIGluIHRoZSBMRURfU1RBVFVTIHJlZyAqLw0KPiANCj4gTWlzc2luZyB0aGUgY2xvc2luZyAp
ID8NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KU2VlbXMgdGhhdCBteSB0ZXN0aW5nIHdlbnQg
c2VyaW91c2x5IHdyb25nIDpbIF0NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMg
QUcNCnd3dy5zaWVtZW5zLmNvbQ0K
