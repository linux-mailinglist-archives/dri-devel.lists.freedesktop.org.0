Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716EADE1E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 05:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201910E175;
	Wed, 18 Jun 2025 03:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Lgr71V1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8C310E175
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 03:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw/hAhLmDORIHlkG1dorS52CKS1lIgsnNCRv93H0cRREWZiSSaFdUf5emd4zGxlLtILjruv/sfEJiBbAmnZATJLjn6VcrVQ5U7TS6kEDIhXNvrGQUiA/V9+Lwy7DlH6TUy5yh4QEGjThYvFNAZ+9Fau6fRQ5HSsF7kACLANOT+EDaEmg2Cm9At5BxkOIxBLz7DT2Ad3IDuQXL8CaDr4rzCWPOIp8QBa3Gvu4gcsJ2XLb/Pk1wA/e1KrtzJKAc7QHRuQkqwYDkYopVkl8mnJvzHW6g96nj35NIlz9xFbPJaMasTvs5PfvioFXjw8cv+SM7hy8iKYjU2S45VUYGiylwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kHxoqjhX4MNK8DqWdvk0LrKcYOlsqGAVhPrSFIygNk=;
 b=F0q70CSvwbx9PHmtSx8UXrdR/+xKec0LHkMP1+Dzp06WmK+mF38J5PbHfhkVsA5WA8tNWfBN0EN4xM+A221TJP8KrrIAVquduhEvMDpFYI9D0DSgAGtgCNW5LViNPADm6kEK+DLaKZPsHqJ0fY0QyA8cW+n4l5g98iT/uEfhfUi35+SuxQ7jmjOZCEKDuoaXS54jzH0IC5kONU5aFIsl2GXaW+r3PDVifZ1NAmV1IceIdACOULM2ddqZi7Z+y0exub0tIZgRWd6tsk63aed2pwmySoL7FovMf2KcyKy3HrpomP/aVykyhRKje0FCTTw6bAtS2R6HsUVaGuC7GDIo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kHxoqjhX4MNK8DqWdvk0LrKcYOlsqGAVhPrSFIygNk=;
 b=Lgr71V1r6OXVWVHYbSPU6fYQJK4/WqADCWvKM5TR/gIEI8iCiIAV6Sm607Jmn4JsoLAxKtt0WSNtdmSr02UO/kjeTYOKlHvckQC0nFCH8obV87Xr6G+DhVyEpXRmwMQXOpKCgRiAyvWwrO5nCrra+YuUkja/EP7hpTc2+vf3aTTY3RJ1DKa8D3IBFck6fY5fHJQBHy9FjccAeNG7hPZ6f8/jlw41HWYY6jGzjD+3b0xdMBwoylpUEfRHJvutL6LyqDtQMtaPLzbEYCn2byyCBW/sqVpNonXdZR7wu+t+G2ANxZ/syVT/rz1COkOW49KPDxf0QaITKdbvRzfgJMSteA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 03:50:11 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%5]) with mapi id 15.20.8835.025; Wed, 18 Jun 2025
 03:50:11 +0000
From: <Dharma.B@microchip.com>
To: <laurent.pinchart@ideasonboard.com>, <asrivats@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <Manikandan.M@microchip.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
Subject: Re: bridge/microchip_lvds panel usage
Thread-Topic: bridge/microchip_lvds panel usage
Thread-Index: AQHb353QCN/22YFqFESSzU7dvbf6gLQIAgmAgABG6gA=
Date: Wed, 18 Jun 2025 03:50:11 +0000
Message-ID: <f10ee1ce-5362-4dc9-8e61-726db9c27d64@microchip.com>
References: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
 <20250617233623.GB22102@pendragon.ideasonboard.com>
In-Reply-To: <20250617233623.GB22102@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DM6PR11MB4722:EE_
x-ms-office365-filtering-correlation-id: 1f2256c4-b25c-4b20-eebe-08ddae1b39e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZitaWVZiWVczaXBzcXcxZUpIMWxtM3hqTE5WWnJTYVpLVi9peXBoM1lNbE5n?=
 =?utf-8?B?eHhBdmxRY2g2VnNLdEoxKzFuenNLVWJpWHo2ZEY3MnBRREhzcWQwL0didXU0?=
 =?utf-8?B?VTJzZk90T3R3SFZZaHBFWDl0ZmwxbnlheEJma3BmWGo2dWNkUGo3OWVCdmVx?=
 =?utf-8?B?SlRiU0hsVnVSQjJJVm9jdlZpNkxMWWY4NW5iM3hiQUdWb3U3aFBiOVVXb3Vh?=
 =?utf-8?B?aG9SekpmVENsTW5OTy9xbkg5WFNzUlJ1Tmc1dmloRHk2a3RlY0lwa2NiblJh?=
 =?utf-8?B?UnplWlRtUmxDWGx6dGtnaklwaG13NHZyRmMzdEFDL2dzNy82aXhranNESTdK?=
 =?utf-8?B?dEdZQ0R4RXYxODdpQndHTE5EWVBWc2pxTmUzS2tnbWVuMEFiQUNMQ0l0ZEpr?=
 =?utf-8?B?aVl5RStvcDg2Lzhva0VWNVY5QlVCVWlnRG5mQ1dORm0zcnBYeERBUlRmRE8r?=
 =?utf-8?B?bGNSN3FQR3VuQmlqblluRE9BeGNhQWM0UFhhVjVlaXFHVUZ5V254d1NWVzZQ?=
 =?utf-8?B?OE1tMlJNM09CdW9pRVd6Ym43QVh3eVlFUVRWOHNUU2V5S3VGdVhmYkxUKzl3?=
 =?utf-8?B?bXFmUjlrWC9GcmJWM3drb1k0eDFySGlSdEU2cDNjeGF0MStJTEIraXc0aFlj?=
 =?utf-8?B?Z3JjVHA2ZjNweW1jdUkyVzl3d3ZKUkQ3WjkvZlA2eml0dWl5cDJtMjdIbTBw?=
 =?utf-8?B?TSt1ZjNuSlczV3Z1a1pSWlRBZGNtbXpMc3lGbzNRY2QybFl6eGJBbms0cDBo?=
 =?utf-8?B?TldGS2dqTi9CMXA0TTBFaVhrK3VrRDJjdytkMzR3ekJ6NHJ6TkR3OE5kQWcv?=
 =?utf-8?B?QXNaQVRFaGl4dTdrU2htTUh5RDhCN3BmUjhRNnFyU0dvTkVXbWNrUlhDVzJ5?=
 =?utf-8?B?bndiNWppQ01CUWZjdnRkcXJoZnJaU2RjRVhpeUVaY0MyNU5iUFhwdVhLRVpW?=
 =?utf-8?B?cDNhOU9jOTVRS0ZaU1cwL0hYT3JyQWxQbTQ2SzdLM0oxam1ScnVwV2lsNUw0?=
 =?utf-8?B?R1lXKyt5bzlKNHArZFpDUkJucWV6azhpR1F6NWgwRnUyYXhxTVRCdVgrTDRM?=
 =?utf-8?B?K1lKVmlreThkNjkwWTdrMWZMOXhIekFIeGxwMUVPem9wWlVpSjVRTXVqb3Vm?=
 =?utf-8?B?ZVFGR213TUhBcFdHb3YvenNSa1hZUGwzczY5aWRQOEV6dThUZGtZRGR3d2M5?=
 =?utf-8?B?ek84Z3Q3WWVuZ2M1a1FGVFB6NDlpcmo4RnArYjRjOTZpR21qYlVCQnZ3eWNR?=
 =?utf-8?B?cWpDN1RYLzN3bzBNa3h4VGdEUDN3UGtlS2o2VzQ0NVM3LzMrc1NpOWZXQnBl?=
 =?utf-8?B?eUNvald1cVBRY21RTWhqbFN4N2FPb08xamFVRkNjdGtQdjFDd3ZVUm5zTHJB?=
 =?utf-8?B?NGV1N1AvL3BXcWloWC9xRGdYWlhERnFLMmtQQW5RcS9hbmVFNXppVjk0a2ti?=
 =?utf-8?B?MGR6L0JFbkxQZ3RjWTNHbFk1RWF3cklQdXh4ZE1PZFBJdTJRdmdkN216YStB?=
 =?utf-8?B?b2JFaUhyUERsNWlVd1AyUmRwNCtWVkVZU3RoMklFVG5pWnJqcHVPMkRObzZU?=
 =?utf-8?B?RFBOOGhwbkVhWnRGdnBMTXBEeFZHSWtHWnZ5eTVCYUFxM0VSSEgxbFlhWW9C?=
 =?utf-8?B?dlBjRDJRak5ZaW9NVWU2R1h4ckE4YWRTdzVtMHZlUXFhTG4zckhNZlhoTXVK?=
 =?utf-8?B?N0E5S3dtdUcwVFRWQk5tV2FRaktLTEZCMFZrckhqN1ZYNm5OY09EM1BqakZF?=
 =?utf-8?B?dHVEQlBMbGtwL05mVDlLRWxnaFVTUWNvNjkrZWRWNXEvUHpMdlU4U1cwOEtO?=
 =?utf-8?B?WkdGY214ei96QlB4bFY3Q1hPRGhvNXhONzE4M2FscjE3Q1hpV201eVZ3dUhC?=
 =?utf-8?B?d2JtdWg3TkJYc1ZnOURDRXIyQnJyQjB1S3JjQVNrV0x3WXRsZTdTVHlJZitQ?=
 =?utf-8?Q?xfkhkOuSoPw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjNneDI3YVhiUzVIeEFvcWEzWjlRb2JhU0twdUMwQU04Zmp1ZEVlZWZEMy9T?=
 =?utf-8?B?c0UzSjFBVkhtTWU5UmhKaFM2ZlI5eTRYQy9RS2Uwd0Q5OVlXR1ZwT2dYcmYz?=
 =?utf-8?B?ZHI2a3BnSFJSMEYvL3ZVZU45RFBWamF3Sm0rM0F0WU4xNGtCVTBmUkxDcWVs?=
 =?utf-8?B?dXRkYlRZLzMvYUxTQTFxc0NsdGhJSWdnV09XZlVLbFBGY1N1bUZXTEtLb3Rk?=
 =?utf-8?B?UVlqMERmbm1mRWIvcmtTTy9CTmRmYVNmUHFQL0hnZHlCWjFETkN0UEYydk95?=
 =?utf-8?B?akRBZ0JmREFFbDI5TUlnaGpGa3A0NC9PVDg5M2lUU0xoWmdKVDBuLy9keGJs?=
 =?utf-8?B?bmNUSS9vaU1KTExoTnVIM3U2eWQyaTJlc3Q0KzlCVkFQeEZoSXIxVUx2RlAz?=
 =?utf-8?B?VVBlY1VmSFA5ODcwSzlDR1VKVmgzakFlVXVYbWU1UmtaUENxZi9BV3NCMG9x?=
 =?utf-8?B?ZVZKdldCd1B0bm9wd3hEQmUrUjJlVmF5ZmZPUVhLYWFicVZlME83emozTkw0?=
 =?utf-8?B?UUN4S2RycFdtUkN4NmJ4V0Z4TzJ6ZHBUeGFCWERaQnY2S2tZM1BCNWVnNHAv?=
 =?utf-8?B?WmVwa0M0ZEh3V2JxNUlPZGtYVTFISzI3NzRpSFZmT2phMjBsL2ZieU9sLzVM?=
 =?utf-8?B?L3BJQjdtM2JJSEpnSlZLTW9SMHRwZHJNM01iWUx4L0xjRXgwcXR3V3orL3hw?=
 =?utf-8?B?ZmFWMnF6Nk8yV3RNY2FjOHRVdVpTYmRuOVJhMmg2WXJrZ1dxcDlka1VUL2k4?=
 =?utf-8?B?aTA4cWVUeWttaXRnVEpDQ2g3R1JQZWNQOUJseklrTExuS3dwUGgvYnFBZkht?=
 =?utf-8?B?WmxJYXNKZEtsWllZbXpIWldINXRPWXZIbVJOYjJGeC9TaEM0RGlodm9xdnhU?=
 =?utf-8?B?NnpCNi8vRllGbVlHSTI4TFV2YUdldHF4dEd2T2lPZG16ZTA5TUpPdkNHVVRL?=
 =?utf-8?B?d1FOTm5xTHJ5UDd1ekRNQUhYYStTa2V0eDB4eWZkaWNwMk42M05ZYnRDWXBq?=
 =?utf-8?B?SVMxNzlBYzdGZ3RlcUtIZlZTeVZYOFh1cjNSV1RVc1h3Ylhlb2JUa1YzZkVl?=
 =?utf-8?B?c3E1b01QRXppTi80MHBrMlQzM29wT2YyZ1RnWXNsYS9oRFl6UmcrN1ZMa2hw?=
 =?utf-8?B?MFFBK3pLT3IrRktqaHNOMXc3RGdUYWdFandIc0NlSVBKTE9IbTMybmYrSG15?=
 =?utf-8?B?NTlpYzU0UXpPRFNjbzB3MEFWQjRURjhrbXluaGpGaEI3YWlYM2VQU2VnaVA5?=
 =?utf-8?B?Z0JGb2tudERhMmZ4M3dSWjlaNWRacG1ZK3J5Q2V1V1ZtUWh2OTRGeFlRVVk4?=
 =?utf-8?B?VU41bEl0OTVZNHZFU0tHRFJkWTdQRVc0TWNRZFlKL21WclFmNWNDbVVJanhz?=
 =?utf-8?B?V3A4ZWF1YVFYTTQzL1ZFM0lSZ3RxblpOeXI0MWRKQjBIYmpZSEJHbktEdU5k?=
 =?utf-8?B?VVgzU0hNREtYelo3L2lxMjBVamlJMGpTSWhaVU5Bd2VxWkJ6VDFwZlhabkUw?=
 =?utf-8?B?MEhoN040SXlnVFdWWmJzb2U2NUlKS1kzSVFhdWxNcG1SL05uRkY1MXNPTjVy?=
 =?utf-8?B?Z25LUEZ4RXh2Wk1DM3pHNE9oZW5pZjNaWm4wZ092L2FYVWhtUVdDaWxaZkZl?=
 =?utf-8?B?cEN4Q1hyVWM4MHpyV2M2TUgrcTFTZGJObVg2TDZJM1FLQmgrZmlQbGJCMUxw?=
 =?utf-8?B?Rm4vU2QrNmhtVlpQRS9odXBkZG5FRm5GSjdabzUrdWxieGhld3JqT2dYUytD?=
 =?utf-8?B?Zk9GZHdKSEVHdUgxYmNmdWZhV0RqcFdBTFpubkFHN2k4MDRDRGN4VUYyZGI2?=
 =?utf-8?B?czBULzM4UVZWSG5QNjBCajVJejFZb2hmVFRCaEhPUGRHZHpabjFVY1U4VDVK?=
 =?utf-8?B?bEhQNWhEYVVMMDhzaksycjlPcUhRaktELzM5WGVtNmFzTTY1bTljd1o2eU1i?=
 =?utf-8?B?M2htd01CYWJOSEVNbFJPejE3T1NiRkoyamNmMWFoM3k3dTU4dXVvNTZRckFY?=
 =?utf-8?B?M1g4T0RJRjh5ZXVKM0FMa3BYN0NFL2p3TGsvbzgycTZXK05BQ1AvdWt3cW44?=
 =?utf-8?B?YU9vQnllSVhZdjYveGc4MlZlZEwrS0NubWNVMzNQcHYwOElDNExLN0J2eWo2?=
 =?utf-8?Q?XgEcpSFssHtrTNSOjPO8qYBRM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FA5CD8CCB540842B7DDF8027109DA55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2256c4-b25c-4b20-eebe-08ddae1b39e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 03:50:11.4577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KhxveNCBbn53MLJAj/BLcN5BtGBWFmk5/ptC0PBJxx7YmVXE7mdispavOgnG1/QTn505rrt2dFlezKaqHvnAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
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

SGkgTGF1cmVudCAmIEFudXNoYSwNCg0KT24gMTgvMDYvMjUgNTowNiBhbSwgTGF1cmVudCBQaW5j
aGFydCB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBP
biBUdWUsIEp1biAxNywgMjAyNSBhdCAxMDozNjozNEFNIC0wNTAwLCBBbnVzaGEgU3JpdmF0c2Eg
d3JvdGU6DQo+PiBIZXkgZm9sa3MsDQo+Pg0KPj4gQ2FuIHNvbWVvbmUgcGxlYXNlIGV4cGxhaW4g
d2h5IHRoZSBkcml2ZXIgbG9va3MgZm9yIGEgcGFuZWwgaGVyZToNCj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE0LjExL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
Lw0KPj4gbWljcm9jaGlwLWx2ZHMuYyNMMTgyIGFuZCBkb2VzbnQgdXNlIGl0IG9yIHNldCBpdCB1
cCBhbnl3aGVyZT8NCj4+DQo+PiBJIGJ1bXBlZCBpbnRvIHRoaXMgd2hpbGUgd29ya2luZyBvbiBj
b252ZXJ0aW5nIG9mX2RybV9maW5kX3BhbmVsKCkgY2FsbGVycyBhbmQNCj4+IHRoZSBsdmRzLT5w
YW5lbCB1c2FnZSBpbiB0aGlzIGRyaXZlciBmZWx0IG9mZi4gQW0gSSBtaXNzaW5nIHNvbWV0aGlu
Zz8NCj4gDQo+IFRoYXQgZG9lc24ndCBzZWVtIG5lZWRlZC4NCg0KQ3VycmVudGx5IHRoZSBMVkRT
IGNvbnRyb2xsZXIgZHJpdmVyIGlzIGhhcmRjb2RlZCB0byBtYXAgTFZEUyBsYW5lcyB0byANCnRo
ZSBKRUlEQSBmb3JtYXQuDQoNCkluIG9yZGVyIHRvIHN1cHBvcnQgdGhlIG90aGVyIGZvcm1hdCAi
VkVTQSIsIHdlIG5lZWQgdGhpcyB0byBxdWVyeSB0aGUgDQpwYW5lbCBkcml2ZXIgYW5kIHNldCB0
aGUgYXBwcm9wcmlhdGUgZm9ybWF0IGFjY29yZGluZ2x5Lg0KDQoiZHJtX3BhbmVsX2dldF9tb2Rl
cyhsdmRzLT5wYW5lbCwgY29ubmVjdG9yKSINCg0KV2UnbGwgYmUgc3VibWl0dGluZyB0aGUgcGF0
Y2ggdXBzdHJlYW0gc2hvcnRseS4NCg0KPiANCj4gQnkgdGhlIHdheSwgcGxlYXNlIHVzZSBwbGFp
biB0ZXh0IHdoZW4gcG9zdGluZyB0byBrZXJuZWwgbWFpbGluZyBsaXN0cy4NCj4gDQo+IC0tDQo+
IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNCg0KLS0gDQpXaXRoIEJlc3QgUmVn
YXJkcywNCkRoYXJtYSBCLg0K
