Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C869E77AC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D097610F14C;
	Fri,  6 Dec 2024 17:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="EbX6ViSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB9410F14C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf3JaCz06kkYVs5tcJ9Zsr6W6SHnumokSHbNeUrhiq0Qm31111ZT7fpWfa2q8o+76Y7Nnfsk+cLzYag8jAgAwh5vtf+l2BtBncK6KoaYwRmL2yU/BNXrApBWbUJntAyyRL1OlMG/hR2PE0y19IO0nG9O5PXz2V2qlmuBOJq3nuUw3z1OII8euXukYLBU591Db2KZh2dInCqU2PMkLO9Y+2e/4Qf33tvnU1VORNl+tsPr9pQFd7EblkzXVVKgphAwbTqEKXXuTas5LPTw8LPJ7J4vqD/NCHGKjB0u8OWh81GNg4iPApv8If7s0wGWL1DXLZ6EH6jQHlB27jgGc+sVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWWLuO0Hb1042dR3z2Gm5Ni4VkY0/m1f438eDt5qA5E=;
 b=M/IBEhgvgEwp/tg/jFVC8NwMMy251Ty9uaxAEhd9JZJ1Dh9uxm16pxq1WP8lE8Hfd6FKMGv2NHhY2xqrOmTvBvQ//ubsgpFQO4izFYFg6F8cwByT1w12kVXMBwd6W8GF5UKrnnhcMqWgmSHTeBbG4um2fqhhS6RQR8zIBu/fu54BO6wMxSsnDdx2yZ6omFjBZ1D6rVG5Af3/yo7KMawtMX7MmTSlNOt8Nm7u8crTNVDC5lYUpekNGhUNY+Z0Q9l2cdYK+Fe6BLyGuu5MoGO4zhXBi6KKQ6/7YM2LOgvJ/n0wDXhlZQirREZnoUWTxJZ7vmN1pd+qGC54+kar3kf9dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWWLuO0Hb1042dR3z2Gm5Ni4VkY0/m1f438eDt5qA5E=;
 b=EbX6ViShKDcP4ByG5lt9RO+Og8Vk47w+dpEHPL25lc8myaSrMJoRV+1d+bCr0q2/ykBPlRVfZ+cEsWaefWuB9YNd3zvXFIv0V7X0dflkzXtL2hz41gGixfMdWRh/NvvMXupxjG9wkb08HWIan6tqrV1SC1gymEMirhGVGpjwucAbEJd9GgLSsd5tUbFKxA7gzNONcc20OloDvT5/e/GrEpPUP46aB+3zeTG1EDv3Z115SoIh39O7QNGsjVWrAHV5EIssB092rfdZtq2SHgZ3WNZ8b/xMy+JTd5Sj1Pu9EEeigdy1fmv3AaoYQ82LWP+KODAc+f6Wi9nZKyKO5dtq5A==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.8; Fri, 6 Dec
 2024 17:46:25 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%6]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 17:46:25 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "conor@kernel.org" <conor@kernel.org>, "afd@ti.com" <afd@ti.com>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "dmurphy@ti.com"
 <dmurphy@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "danielt@kernel.org"
 <danielt@kernel.org>, "linux-leds@vger.kernel.org"
 <linux-leds@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Thread-Topic: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Thread-Index: AQHbSAGBEMaUwfNdP0eL2sDtSNwXIbLZdIYAgAAIUoCAAACtAA==
Date: Fri, 6 Dec 2024 17:46:25 +0000
Message-ID: <1b8648f10248a949508240785f5a99ed7c2c2037.camel@siemens.com>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
 <129a3e14-9c87-47c2-b4ed-49bbcf12ae7e@ti.com>
In-Reply-To: <129a3e14-9c87-47c2-b4ed-49bbcf12ae7e@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8696:EE_
x-ms-office365-filtering-correlation-id: 20f15e42-c7b7-4766-f063-08dd161de7c2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NTZqOXdxTlhWYklGMGJJbjU1WVRWWEFmZ3VIZHd6bjJmTm1YazV0R1NCOTZK?=
 =?utf-8?B?NVRiTTVIV1Y4c1V0elI1bVB2TU5za0VZenFXOTdFbmtxVkFEbGZOZjFUWDFu?=
 =?utf-8?B?SGtDdVZuQkFHdmRGRXZQTCtMNEM3MVBLc2FhbVk5aVY1bUVLYUhMemRFcmIz?=
 =?utf-8?B?cGFPUXZwSVdxWmgrSS9rR0Z1OFVQSzVmWXFkQVkrLzZCQ0ZEb21odFF4RFBP?=
 =?utf-8?B?eWcwVGpwVjRLY05kVkFSKzdqdXFBakhBS2wxc2EzMTNYRTNvVHZWUmJNNzFt?=
 =?utf-8?B?TkIyRkozMitHU2wxYjg3K3JicitQZFRnRldmeWljR3pxU3d1L2l4OGtCalY5?=
 =?utf-8?B?ajVYMXBPbGdHY1Rzd1JTN2VaVjhyeTQvWU42WVVod3YwMXVRZXU2UXhrd1Bz?=
 =?utf-8?B?eHQ5bTYxWGs5NURjQmhEc09LbC9lZEFzYUZrbTNxWGdScW1LS0tiS0lSQWpr?=
 =?utf-8?B?K0VDQVh5RWJrYVh2czhWY2FWVzdMOW95VVdBci9nT1lURFhFZzI5SVVMZ2kr?=
 =?utf-8?B?MVZwYjNLWFN2Nzd0ZHBVczRFait0K3RlM2w1T2lHSHRub0dJNytuWTNOd0No?=
 =?utf-8?B?S081N2RUenM4QjBtcUgwSHJqSEMrQWhITXBFQXhoTzh0UGU5RWRTZlJOdE1M?=
 =?utf-8?B?WTRmbkY0Zzh3Y3Qvc1FEbUZadERyMWloRDhRNDQvTWV2MmF1MkRmd09BVktH?=
 =?utf-8?B?QjRoT2xycHlYbnJaOVRrMGtjZ2V6NlVSNk5KZXJmdUhFT3NFVkx3dlZZTTVD?=
 =?utf-8?B?QjQyaUlzYjVtV1dmVDNqK0s3MHl6ZTYyS2ZwdmlVQ2s2VzdMMy85YVB3cEJ3?=
 =?utf-8?B?elJMTDZiSjU3M0pta1pMTmtUclMrbGk4SkxOdDduWWJYek1KdEJueWFmNTVG?=
 =?utf-8?B?WEE5WExiazVaeGw1S01EZzU2cmhiaDloOElvZ3F1U1pLblFzRDFlMkJ1Ylgz?=
 =?utf-8?B?S24yZmpQNG9QRkxhMmJMbFdQNG5DSUduREgvWVUxQlVEYlBMUG1CR1ZuNHdZ?=
 =?utf-8?B?WlYwc1Avcm02d1ZjYlY5TjhPWTQxaVNEV1Qyb01WY0lPMGo4SGFYRmhwQlFP?=
 =?utf-8?B?Q1ZhTTExd0JsckVPZThMN0Zack16VEZEMmxOdDRrUWsxQXNVaW84cWFoeFhP?=
 =?utf-8?B?aG05RGdSd3d3T21IQ0dqbDd6MkZTcE9XV2NMTGFXSjRPeW9EYWZpU0hsSHhD?=
 =?utf-8?B?b040L2xmdWVhbGlPMUwrL2xLY3pSTjBnaDBmWVdSckVUOC9yQ3haMFNaMmo2?=
 =?utf-8?B?a1VNYzdnRDFmQkJ6dC83RlhidU9KekVqazAwZFlxWkFTdTFpR1BaREVpb0tT?=
 =?utf-8?B?K1UvWDVFc2xYcWk1RjlHcVdYVElGR1l1SFB6YXZYOUs4aW9aWVBlTTFIZGNr?=
 =?utf-8?B?VW1oWGlla0JZQnBLeGpjTGo5VHc1RGsyczM4MlJ2SmpHMkF0V0xZVC9YZWQw?=
 =?utf-8?B?WmRadElGNWp1UUg3YVZhSDFRK0tiYWF0R3BiL3V0SXhKOG9QaHBKM3AxZlRq?=
 =?utf-8?B?dTBTTU1WNTcydlRTVlNTZEtocTczQmF6ekFMMTJodmVvMEpFNXA5UVUrU1FU?=
 =?utf-8?B?V3hidUFBM2JtMCtWamgvS3ZidHZRMG1ldGFpVVBTUEdsSG5ndzY3Nk9VRXpY?=
 =?utf-8?B?eE1NVS9ZanBmSlR0RmROZXZwa0d0dGVEYUs5MzlxRlErOWNUYzU3QUJqT21Z?=
 =?utf-8?B?SnNCS1lNdXc2VDBJVnhnMEVOQ2RWKzg5TFBjUXZuK25VblU0ckVYVWk5YnU5?=
 =?utf-8?B?MUJiMHVmMkhUb1c4N0ZJSEFXWWJsN0xDa2kvaHY5VzNlOGlQN1h4WHJ5L09P?=
 =?utf-8?Q?1dSKOcGucZoZ2vMgYuBEO6CEFeEvaXaQnOi4I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXNXc3lhV3FzNDFVbWkwQlNSemZTbkpIVHg3NUxpYlczZjZOMk1lcmkwZFdm?=
 =?utf-8?B?QXowNUx5YVN0SUpKUEZlL3VHZm9aZ1JOTlFyMXJBc2M4OVN2WkpGNWk4K3lE?=
 =?utf-8?B?eFFvM3pCUEhYdC82UjFWSm9QWGRncHJIVlRNN0pHRG1JL2lDQU04MFI5WU9B?=
 =?utf-8?B?WjQxQnNnV0VHZGg3SWhhcHZwUmVqaUEvTzJoQXNFYTBab0F4QTZINlVISnd0?=
 =?utf-8?B?RnIybHYySUk4N3pMSi83M2tML0FWUERhRHg3V3M5aC90cGUyVFF5UUtwMi9G?=
 =?utf-8?B?TUpWV293clVKR2o5ZW9wM2xIUTRXUlpnWTl0ZVF5WTdRdnRPblQzUHduWGFo?=
 =?utf-8?B?ZW5hNEE5WHpZQWtTdFdubGl6RzdwR0h0YzZEckVHeHFOTUtQNnBrNlNkejFT?=
 =?utf-8?B?bklkcllnYXc5cjFmY2phc1VJYlExNEg4YjN0elh4cUZqdUlvM2xnMDV0TlNR?=
 =?utf-8?B?SEtsM1VBVmV5dU1ObExna2NBNENQVFI5T1hLYWJmaFE1NDZhOCs2Z0puM3pv?=
 =?utf-8?B?WXJyaVNPN241ZCtqMDVYb3VRS2pGMzdPTkpqOUVicklzMXlkRVVuRDRyV1dl?=
 =?utf-8?B?VVlFSDNMVEtRUm5aY25yamk2Ky8xMFdMSGtGNjBDdk1nSTdvdStIc01TSVpU?=
 =?utf-8?B?NGsyand6eC9ya2Q5bnZCRWRzR0ZKYytYYWJUUGp5bjQxQUlVdmREcmdiRkRz?=
 =?utf-8?B?Y0dXUEZJU2R0RGFNU3dCTzVxQWJqd1hWZnRObHlhSmRqVVFKMUxJVEN6SUZs?=
 =?utf-8?B?Kzc1aTRGTVpaSFkxTkM1TGttVjhhc1hvTVloVlMzQ0QvMlFlY0s1ZTJFQzU1?=
 =?utf-8?B?K2xUTE5OSmRyT2plais3N1ZjOWpTL0c4VkJSTDlIeS9oK0pPeXFkZEFVcjVG?=
 =?utf-8?B?Skt1a0ZNUENSTnZqQW42eEpMYmFpOUpJTCs5U0s3VC80dlVyTm80NlYrQUhj?=
 =?utf-8?B?MEhtWDhTMS9iMVJXeHBBT3VZZXhOMVBqRWxaVEhEdXVlWXRWQ0pUWVN1cFZn?=
 =?utf-8?B?Qkl5T2VKZ0cxWEJvcVFyRlpOOEpweGFZTWdIRHNOeDNUbjV1YmwrdmFKbjVP?=
 =?utf-8?B?eWRrZzFqdGJsaFUvcEhINmtJZjdqK09YRWJYVEYrUmFPRnpvM3pRZ3RWOEhz?=
 =?utf-8?B?S09NN3E5c1RuTmZEMzNmckdzZDRFN2M1Q0FjN1loay9Scm1QMjBZS0Rsd1Rs?=
 =?utf-8?B?eXAxOWkzWlc4ZzJHOG83OTFoU29HQlNqZjNSbnZ3V3NJdUJ4ZzZnckQ0b1pW?=
 =?utf-8?B?dmpmSlVXeFhqak1mdGJxUG1OWUVoZVFYNmtsSDEyaTR1aVVRaVFkcUlXR0gy?=
 =?utf-8?B?L2ExcXhQOHR1VGxrazgxRFRHUUZwOVFrdEx6em5lNzNXZnV3RmxrbmwwY2J3?=
 =?utf-8?B?YlFXVGQyajVVaklRdVY5ZmFzUUZZcGRNUC9CeXBEMFExZ3RyVUQ2MHNxb01B?=
 =?utf-8?B?MmNoZHRRY2pvd2dTaFcrTUZpZGNIcHdYWlVRWlJoSTYySVZBcVRFSDZUSUlP?=
 =?utf-8?B?QUR6Qi9hdkhpSUpDY2QvUXI2MU5QbnM4Z1VkanFOaW9DRU5zdlloV21EMVdo?=
 =?utf-8?B?Y01kelF5TXdBSG9JWklwUzBkdldCT0xjdm1SS3lCWXY0ZDNWZWowMXVYVFp3?=
 =?utf-8?B?R2xWSXJXWHpMbGZQU1NQNzUwajZpQTZpa2QvaENTZWxpS21Sd2NSRVhmbC8v?=
 =?utf-8?B?cnFlN2ZLc3N3WGdOR2ZNbmV2Q2ZlL1NiSGhSWFhCSmJyWWVnblI4NlNoOXBB?=
 =?utf-8?B?Mnd6WmZYbWhCeHgyc0FMOXJYcCt2RjRaSTJoSGRlZXR5bUo2ejNsWUlGa0Vj?=
 =?utf-8?B?REorWFIzOVprZzVGWkV6M09LN0VzdHNhWVR3U0I4OG5pMDlHMm80SEhaVy90?=
 =?utf-8?B?RVd3QjBJTVBCeGtFSDNydzRMMHFmRGRmWllxZkFhdnB4UkNlY1d1eGoyeWll?=
 =?utf-8?B?ZHNKUzI0eWdXS1JOblRmSUVUdjFydE9mR0JTYis1ZUFHbnFtL1Nxb25GcGM4?=
 =?utf-8?B?L1VhbW94ZkhzNlBuUzNJZHpsMDZDZklRQjNwRlZnUW5OMFFzdm1UVWRoZVR3?=
 =?utf-8?B?dDJjU2J2TksvdkVRZXFpQ3dyc3dUWUN1dE0xaEhjQldQajF3MzZqWTNvQmR1?=
 =?utf-8?B?OHNMdVVPQThnUUFRNmZmUjFnN0NMdWo2UDh0M0doMHkyS29sL1R5NFJzc2Mv?=
 =?utf-8?Q?tprtlinUWlV/LARRdHLIRK0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44C373109B35004B839161458A3A1B96@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f15e42-c7b7-4766-f063-08dd161de7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 17:46:25.4395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeg4UBLeGtRj1iBi9WmGghCUyqHWIt0jjrzonHA4e3RqztZoMrZtA1+Xjs6WbMSpc2r/2MbH26EwYZx+WauttB0kR3vnlB8um/R3p1FrfTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8696
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

SGkgQW5kcmV3LA0KDQpPbiBGcmksIDIwMjQtMTItMDYgYXQgMTE6NDMgLTA2MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gPiBBcmUgeW91IHN1cmUgdGhpcyBpcyBhIGNvcnJlY3QgdGhpbmcgdG8g
ZG8/IFRoZSBscDg4NjAtcTEgcHJvZHVjdCBsaW5rDQo+ID4gY2l0ZXMgaXQgYXMgYmVpbmcgYSA0
LWNoYW5uZWwgZGV2aWNlLiBFdmVuIGlmIHRoZSBrZXJuZWwgb25seSBldmVyDQo+ID4gc3VwcG9y
dHMgaXQgYXMgYSBzaW5nbGUtY2hhbm5lbCBkZXZpY2UsIHRoZSBiaW5kaW5nIHNob3VsZCByZWZs
ZWN0IHdoYXQNCj4gPiBpdCBpcyBjYXBhYmxlIG9mIGRvaW5nLg0KPiA+IA0KPiANCj4gQWdyZWUs
IHRoZSBkcml2ZXIgdG9kYXkganVzdCBjaGVja3MgdGhlIGZpcnN0IGNoaWxkIG5vZGUsIGJ1dCBp
dCBjb3VsZA0KPiBiZSBleHRlbmRlZCBmb3IgYWxsIDQgc3VwcG9ydGVkIExFRCBjaGFubmVscywg
YW5kIHdlIHNob3VsZG4ndCBoYXZlDQo+IHRvIGNoYW5nZSB0aGUgYmluZGluZyBmb3IgdGhhdCBu
ZXcgc3VwcG9ydC4NCg0KYnV0IHRoZSBjaGFubmVscyBhcmUgKGluIG15IHVuZGVyc3RhbmRpbmcp
IGZvciBwb3dlci1iYWxhbmNpbmcgb25seSwgdGhlcmUNCmFyZSBubyBzZXBhcmF0ZSBjb250cm9s
cyBmb3IgdGhlbS4gV2hhdCBkbyBJIG1pc3M/DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpT
aWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
