Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F79E77FC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B65210E40B;
	Fri,  6 Dec 2024 18:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="eqKatGUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2051.outbound.protection.outlook.com [40.107.103.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A29410E40B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6kBnQoxBoH0zp87N99p5m2QrXhhZZBq7a2GBSX5trokYvvRFSNKesHjsrwr+N07p4WjCeNPOzQRw14f4NUeiYJeCSVRpyBg2gCvbVxCb6EL5rOhVQFSlktE73JLFL5076wjj5cQfpynmD4Vy2URj4b9uQcsv+DUsD95iPdE1+7RGtzlFje32QglMgUbXmIKpBpbA9sMMJR+2FRwgjpeMDT/zoGQcUgWVhXuvAjwRXBRtwhvpyKsMou4cW9Ex4fI8fWw98cFSpzu3m4W16HynUFPd1qr2tE6eBFjcdAYKG4UZl7m/zdnbskhsMI+bi8l2HZ+dtShEmNA9pFQ4cJv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxlzajlR2isDS4I0otgAzR0kbtpDun4Qvvb8nwCq5eQ=;
 b=G+C3LeuYG1pw9X80ZV/C6EkjBgwEG3Vh0uPB2hvA2mpsTbgBCLY2gCqdSy4L82IXhLiY6EC2Afu0wVQqoh2M5Ur97nXP6N4Kc+bgud89wO9FmK+B2057Y3dWLMlBJm343ks5MQ0oqtyCg2rfcTb3kRPZf9RKpfkWKOybJSe75e+RHqcZm1lDi182p2gTN0JqtkLXgUjImg5HZCpXRltuyKW7kLiB51dFfn9XRnP/A2A19vxina7afsJykvkIS0GNjUHJnKSqc3moc4w6I5ndWSJeqW7hmCSYtmptnlA1+kR3pSQdL8kAWSiUKEbIRY+90mJkOxybYM+KmqDRQ3LzAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxlzajlR2isDS4I0otgAzR0kbtpDun4Qvvb8nwCq5eQ=;
 b=eqKatGUPahsM5f3jugxsTpOjRMvpSEeGK/okQ8Z9UKxM3WxxTzrQ6KWefLjVogO3uhcPP0+FxasEg6b2hG+Bvh7+UVO+dlnNEZPUssHKXCwX6lZJyuCJwGz/7eDknOk8G/4WriD+VmQAFXB0Kd+3/ylcOGYKefuJ6I3vy7gWBo5g/oQNVGhDjL1KJ3Vi7MLTMuDYLCURinDrP9ZkiZeRJ0UjnDHC2y9BbiGSBsU61vCedZZ+bKAPHjwXRY7y4qSyvRbCl8ad7bMxuDrEL/60BRGeC7uMbm+GV/AouMC+39Md9c4Nm/HlvdRhu7ihJPf/CGGppCdtmeBOOONe4sZf8Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS2PR10MB6751.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5e4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.9; Fri, 6 Dec
 2024 18:20:01 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%6]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 18:20:00 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "conor@kernel.org" <conor@kernel.org>, "afd@ti.com" <afd@ti.com>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "dmurphy@ti.com"
 <dmurphy@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "danielt@kernel.org" <danielt@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "pavel@ucw.cz"
 <pavel@ucw.cz>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Thread-Topic: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Thread-Index: AQHbSAGBEMaUwfNdP0eL2sDtSNwXIbLZdIYAgAAIUoCAAACtAIAABG8AgAAE84A=
Date: Fri, 6 Dec 2024 18:20:00 +0000
Message-ID: <42cb7136b20d53cbafaeb12e90ab1647644c0d20.camel@siemens.com>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
 <129a3e14-9c87-47c2-b4ed-49bbcf12ae7e@ti.com>
 <1b8648f10248a949508240785f5a99ed7c2c2037.camel@siemens.com>
 <fa2c0961-771d-4a71-8dea-b7a3cdea6ced@ti.com>
In-Reply-To: <fa2c0961-771d-4a71-8dea-b7a3cdea6ced@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS2PR10MB6751:EE_
x-ms-office365-filtering-correlation-id: accc2408-bec9-450f-c070-08dd16229903
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?djJXbTR0aVB1eTJjZUdBWlpIZjdRanEzWW1VWkNLTE1RU1psNU15azdSdUdC?=
 =?utf-8?B?aHIrdHpieUUyNzUxNmpOWVdQUVdLU3hCTHZUSFoxenFKZ2FmMXRNWVBYUWJN?=
 =?utf-8?B?bnQxTkM0cVpVbVQ0K2xENXl5ZnVPVnNsbEhKYzhDbjlCN3drVzQ1Z1NVU3lT?=
 =?utf-8?B?QU5tRCt4eG9TR3pXM1c2Y0FaN0F2Q3ZjMjhhVGNySDFCVm13Y0RiT2owRGRB?=
 =?utf-8?B?ZURGSWlLd29QN2JXVzg2eDZrTWQzUEJrZGswLzNRUWt1b1FkSzZqL0ZzaHhw?=
 =?utf-8?B?RWdOc3Z1ZFEvRjdCTXNVRm9rM3AvYnBEd2lUNDF6NTlhVnRlTXJYa3lDQU1R?=
 =?utf-8?B?cEw2djNHRUpKVENhak5nc0YrRU91UUFSZ01tNndwMTlBUzBtTGRZeUhnZmtV?=
 =?utf-8?B?MXZlREJJTmpkbFppWUhYNGdYWXhpSnpkcmd5ZWJCR29hWWdqYzlaeC9mNTcv?=
 =?utf-8?B?eEZKZ043VjFLS2JHTEpTLzNEWmI1Q29wbU1rTlo3T0M0a0F3K0NYay9GZkNT?=
 =?utf-8?B?MVpVYkI4Y0g5S29aOXA0am1adk1qSGtSblJqZENVMlIrZVRoQVhzUjZ0Q2lu?=
 =?utf-8?B?ckVGY3BLZi9VK0hISHFpTUtUbGxzZEZtaEw5WHB5UjVFZWxPSndlbWw2OGNW?=
 =?utf-8?B?dXY4L3lFL3dmeGRsMUtERzFhYUJVNFNuVkhyWG8vaVh3S0s1VnprQVJNQzUr?=
 =?utf-8?B?cVkrU1R4d2hVb3JvUklyZHBOU0ZMbEVwRkE1UnZkRkdrMlBIRHkvNFkrc1Vq?=
 =?utf-8?B?ZFpzOSt1ZU43bzFCWlpHVzFETjdkVFVUM0ZHek1UQ1BCSkhKdUVSZDhad1dy?=
 =?utf-8?B?OXdRbXc4b05GeDZ2NkovRkdtZmVscUdmYVVWMTRQZjRGWExQcnBFKzg2YTVN?=
 =?utf-8?B?aGZsWlROTlJSbUp4YWNrZ2JyZWxEY2xhZjczRStnK3Z2VkJ0elgzbXN3WFNw?=
 =?utf-8?B?ejlIeDZ6N2Mzdks5U0s3S0krdzZ0ZXEyQ3ZSb2hMUUZkSXpITFRSd2lra21m?=
 =?utf-8?B?b3ZQNllkdVlqYXRwZVJQWVFVSW8wTU1WK2tYUVQzaEpnU3VYM1ZkQUlwRWJG?=
 =?utf-8?B?YnFYeEh1ZStOOFFVek9LMlptOWtQZGYrbmJuTE1tY1FyazBxdHByVFlFRzNy?=
 =?utf-8?B?SFdNU1B3TGpYNHZOMEcrSFlHVzFhY3VMYmN0K2tjRVIwS0FoWW11Z3Y2bnZ4?=
 =?utf-8?B?Y3ZpdlB5dWJDendmQVlQdjJ4bDVBQllnb3JGdk5reHljYUxXNEVMY2RxeTlh?=
 =?utf-8?B?VklYVHlhUnUrMGVnK1FpakgrR3ZnaXg2MThjN2RNcERiL0xFLzdqeVE1RXp4?=
 =?utf-8?B?UE8vSFRVSWMwMkY5cTc4ck9RMzIwendxemdtZittTSsrcU1tWFVibHloUndD?=
 =?utf-8?B?OWxRWFpwYitxeEM2TnZxc1o5eVdKN2NCdEFiWTkvV0g2cGQ5U3p0amthQWFF?=
 =?utf-8?B?MjBScyttT0t4NTdVQjgxZDJvQkpUamp0d3dnRjhmY0pmcEk2dHpGRmdHcWZY?=
 =?utf-8?B?TUVvQzRIMWZvQUdLRTVLU0l0dW5hMkZ0ZnNsNkRJZzlCRlR1QnZNeE5pUlp3?=
 =?utf-8?B?RmZIVFBOTXI1RlQ0VllJeXd6VkQ4VEhZZmpxK3ZVSGJwUnlMOVhCbmIyNEU2?=
 =?utf-8?B?dWlIUmo3d25JWmhNdlltSE00OTVWcUtVaVdaSnhjZnJiTzgwSk1JODgyK2ZW?=
 =?utf-8?B?Nk1rQ01jNXpSMHEwQkVJUnVwRnpIOEdEQzFiZnA4cUZReHROVHFPU0NrZDh3?=
 =?utf-8?B?WUxRK1lmY1lsTnJaTGdYanowNUMzZmt3VjdBVURvd1JoY3o4WUhJdGJOVHJI?=
 =?utf-8?Q?OKh09gla0Uh/9Aewg9aghvcgYpVa9R53XpV9M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTY0dS9XejdSUFV6b2VZYW93L2oxbmtFaVRLTVc5NkVVMVNIQlJIS205L2FU?=
 =?utf-8?B?TWg0akl5Y2FWaW5PYmtsYVBQbmJFVktqZTlra2dWN21LcU1BV05QQXpVbmlM?=
 =?utf-8?B?OThCQ2pOR3ZXQWtuSTVxUjRVdzJLb1hCcFN3L0RpVnlmUE1ueTd6WkZGT1BJ?=
 =?utf-8?B?SVUyNzI0d1dRVHVOS2ZkRUlwOFlJcUZQTm1MYi95aTRsQTl5UHFNSzlZdFQ1?=
 =?utf-8?B?Sk0rVEp1aU92Wmo1TVFscTA0V1FFN2hyUTVJTE5jQ3NHU21qbjNyOTRRQm5Q?=
 =?utf-8?B?K3hpa0tPcEJqcHJEckxXRlZzOEx4RlVnOExPNXkzVHozaUduUlpiYVIzQXJt?=
 =?utf-8?B?S0NvNGY2ZnR0L2o4WU5LcURHYVZjZjRkaUJPb3I0TDBlMU9jVTUzK3BjZ1FY?=
 =?utf-8?B?d05sbXp6U0dCODg2Tmk4MllHaXA5SFRqRzc5UDF0Z3g5RkRVTnhrZk5QeU9u?=
 =?utf-8?B?Wm1QYVhybzlDeiszTEhIMWx2azkwTEllTit6TmtManQyd05FeG1kUGVBNU9X?=
 =?utf-8?B?Z1V4UFQ0Y3dxbkIyb3RhUjNmSXRPSVJCbWJxSjBjWWhwaXpzMkxqWjRQeVJZ?=
 =?utf-8?B?MXJIaDlieUdINzRDeUJIMERIdHFOaTU3R1g1cjNsakxDdTRhUno5QjAzSnFS?=
 =?utf-8?B?R0xHbW9CdUZ5bzYwcGRZS1lJK1Byb2pUblltYVdMTHJEb0JWalFTbE82cW9y?=
 =?utf-8?B?TUJEZGQ0a0tQazNnTGZFREFyUWJNbzFuTnRORXgxeXZMUDF6VitsRHYvSHNR?=
 =?utf-8?B?Y0J0VHdNMFZOYUlveHFZdEh0TmpzeVM0bnEzTzllUlJwWE1jVi9MM0lKdmUr?=
 =?utf-8?B?dVZCZVFlK0hqZm13SVdlTmxFU21JZUlRS1FQWXBHNTl3SUFnbUN3U0YzekpH?=
 =?utf-8?B?R0pvcjRYcG45ZHU2WVVIT1hoWHkvSUx4YzNQcVNTUjZObXN1NUxjTzhlN0p4?=
 =?utf-8?B?YVBZZlhmOEJyeDRNb1lXakdNU3BVMFRXTFNObldpUklPQXZrSUFGdWpLVzli?=
 =?utf-8?B?VjA0MlVSU2Y1RFMzaHZqMm9EVkdEVE43cEZZRTdweUs1NTl4MXVnYmJkd3VZ?=
 =?utf-8?B?NjVFUmFuc2ZBQ0hhMjdXbFNxVHN2MzMvdkZkMHpYY3BOd00xNW1xdVh1YVgv?=
 =?utf-8?B?WHdNOEpqU3dpUVllNmNtdjZGRmZqMWJZendCZWhCV3ZRQWNIcml6M1RhM0FF?=
 =?utf-8?B?SG9YRlZRcU9KMHRzd0hmM04wV0F1M3JoS3NhbW1RRVlMeUlJMTY2ZGJacXVF?=
 =?utf-8?B?eU9RMFZkd2JVeWhpQ3pieElWM29GbURYZUNoVkowYURiWDFKaHdoVkNtVTdt?=
 =?utf-8?B?VzBBM21KM0F1ODAzOHprSzVFMndPT0lvZjlDRGZVZGcxWlVVVXVKbzliUzN1?=
 =?utf-8?B?S1Jha2xnMTR3RkpGNml3cWIvQ1RHMmtzUWkyS2ZPcVRySHhMZ0pyR0ZKUE9i?=
 =?utf-8?B?eXlVWWlsK2lyYjQ4WEEwUWxuQmp0LzVkaFpybFY2THN5eFFWcm9HdHpxZTFU?=
 =?utf-8?B?OW41L3FIV2pJcUx2MklNamlVS0JZZGNWOHJDbElYZ0MrVk5LK1R4Rk1UdUc3?=
 =?utf-8?B?OXpvbTFjQ215ZFJEc1dudkxZcWFsdlRDTnNkQmZNeEsyaW5hSkxrQUZiZEU3?=
 =?utf-8?B?WUk2bGlHaFV3NnB2MHlDYkFNYndBNXhMMXh0ZnlUSUNqL0dhWWVETTFBUzB6?=
 =?utf-8?B?L1dDVnhISzByNUZyQ1NJYnZIbnRuTVQyQUJPa2VCeWlVZVB6dnRRV09STFNO?=
 =?utf-8?B?dnd6MDdiZVV1c2RZTklZQVBxR2UyY2FEL0NRK1R1aXlkemRKVzJSRDVMYnJ3?=
 =?utf-8?B?bnFmdGhhNVlXUnVKc1hSZ0lkZzJHUFVMNnFLWkJxS1hUUlNwQ2ZEVC84S09z?=
 =?utf-8?B?SXJOY09QMnRvalZBQmVpUlpXc3VzRkxvS253MkNnMFY2bS9zcVdJakd5d0RD?=
 =?utf-8?B?QnY0dTVVNnBJZWk4dURKN24wVUkwQW4vdXUvRDQ5QlFoaS9XYnVwTXVFK3dK?=
 =?utf-8?B?L3ZNOG1aNHJ1cjVxaEQ5aVU0bW8vWk9ObmNoNlU1cWhZNFRHdkEyeG5tcW5V?=
 =?utf-8?B?YjlnN1ZlOUVNa0plbGFDMGpmaW0yVGk1WFR5WENjSzBKRER2eWxMM3dUSmhj?=
 =?utf-8?B?RSt6UEZld1hIV0EzMVJ2T1VydVB6N3dkVFNsQlZqRzVKczZjamtrQ1RWbVk4?=
 =?utf-8?Q?H7gV2iu7swC2mwkX34MdGCM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34C7BCAE08D84F44B19441F13D16E506@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: accc2408-bec9-450f-c070-08dd16229903
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 18:20:00.8063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyp/HV/RUnW372DpqvHRYExG9d51We1SVQKTyKmy8k8NFg1fz7Y/8mUxpFGF7TXIwiu6JwpbA4JuNJMgzdeaUZQG2YWFqQyqH1x7LfSvxdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6751
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

SGkgQW5kcmV3LA0KDQpPbiBGcmksIDIwMjQtMTItMDYgYXQgMTI6MDIgLTA2MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gT24gMTIvNi8yNCAxMTo0NiBBTSwgU3ZlcmRsaW4sIEFsZXhhbmRlciB3
cm90ZToNCj4gPiBIaSBBbmRyZXcsDQo+ID4gDQo+ID4gT24gRnJpLCAyMDI0LTEyLTA2IGF0IDEx
OjQzIC0wNjAwLCBBbmRyZXcgRGF2aXMgd3JvdGU6DQo+ID4gPiA+IEFyZSB5b3Ugc3VyZSB0aGlz
IGlzIGEgY29ycmVjdCB0aGluZyB0byBkbz8gVGhlIGxwODg2MC1xMSBwcm9kdWN0IGxpbmsNCj4g
PiA+ID4gY2l0ZXMgaXQgYXMgYmVpbmcgYSA0LWNoYW5uZWwgZGV2aWNlLiBFdmVuIGlmIHRoZSBr
ZXJuZWwgb25seSBldmVyDQo+ID4gPiA+IHN1cHBvcnRzIGl0IGFzIGEgc2luZ2xlLWNoYW5uZWwg
ZGV2aWNlLCB0aGUgYmluZGluZyBzaG91bGQgcmVmbGVjdCB3aGF0DQo+ID4gPiA+IGl0IGlzIGNh
cGFibGUgb2YgZG9pbmcuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBBZ3JlZSwgdGhlIGRyaXZl
ciB0b2RheSBqdXN0IGNoZWNrcyB0aGUgZmlyc3QgY2hpbGQgbm9kZSwgYnV0IGl0IGNvdWxkDQo+
ID4gPiBiZSBleHRlbmRlZCBmb3IgYWxsIDQgc3VwcG9ydGVkIExFRCBjaGFubmVscywgYW5kIHdl
IHNob3VsZG4ndCBoYXZlDQo+ID4gPiB0byBjaGFuZ2UgdGhlIGJpbmRpbmcgZm9yIHRoYXQgbmV3
IHN1cHBvcnQuDQo+ID4gDQo+ID4gYnV0IHRoZSBjaGFubmVscyBhcmUgKGluIG15IHVuZGVyc3Rh
bmRpbmcpIGZvciBwb3dlci1iYWxhbmNpbmcgb25seSwgdGhlcmUNCj4gPiBhcmUgbm8gc2VwYXJh
dGUgY29udHJvbHMgZm9yIHRoZW0uIFdoYXQgZG8gSSBtaXNzPw0KPiA+IA0KPiANCj4gSSdtIG5v
dCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhpcyBwYXJ0IGVpdGhlciwgYnV0IGxvb2tpbmcgYXQgdGhl
IGRhdGFzaGVldA0KPiBJIHNlZToNCj4gDQo+ID4gU3VwcG9ydHMgRGlzcGxheSBNb2RlIChHbG9i
YWwgRGltbWluZykgYW5kDQo+ID4gQ2x1c3RlciBNb2RlIChJbmRlcGVuZGVudCBEaW1taW5nKQ0K
PiANCj4gPiBJbiBDbHVzdGVyIG1vZGUgTEVEIHN0cmluZ3MgaGF2ZSBpbmRlcGVuZGVudCBjb250
cm9sIGJ1dCBmZXdlciBmZWF0dXJlcyBlbmFibGVkIHRoYW4gaW4gRGlzcGxheSBNb2RlLg0KDQp0
aGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzIQ0KDQo+IEFuZCBvbmUgY2hhbm5lbCBjb250cm9s
bGluZyB0aGUgb3RoZXJzIGlzIG9ubHkgaW4gdGhpcyAiRGlzcGxheSBNb2RlIiwNCj4gYnV0IHRo
ZSBjdXJyZW50cyB0byB0aGUgb3RoZXJzIGNhbiBiZSBpbmRlcGVuZGVudGx5IGNvbnRyb2xsZWQg
aW4gYQ0KPiBkaWZmZXJlbnQgbW9kZSAoc2VlbXMgdGhlc2UgbW9kZXMgaGF2ZSBsZXNzIGZlYXR1
cmVzIHdoaWNoIGlzIHByb2JhYmx5DQo+IHdoeSB0aGUgZHJpdmVyIGRvZXNuJ3QgbWFrZSB1c2Ug
b2YgdGhhdCB0b2RheSkuDQoNCllvdSBhcmUgcmlnaHQhIFRoaXMgc2VlbXMgdG8gYmUgdGhlIGZl
YXR1cmUgb2YgdGhlIGxlZ2FjeSBscDg4NjAuDQpTaGFsbCBJIHRoZW4gbGVhdmUgaXRzIGJpbmRp
bmcgYWxvbmUgYW5kIHJlLXN1Ym1pdCBuZXcgWUFNTCBiaW5kaW5nIGFzLWlzDQpmb3IgdGhlIG5l
d2VyIExQODg2NC9MUDg4NjYgZmFtaWx5PyBTZWVtcyB0aGF0IHRoZXkgZG9uJ3QgaGF2ZSB0aGUg
Y2x1c3RlciBtb2RlDQphbnkgbW9yZS4NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1l
bnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
