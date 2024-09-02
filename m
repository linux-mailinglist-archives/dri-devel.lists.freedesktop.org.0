Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C061967E7F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 06:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B1D10E1F0;
	Mon,  2 Sep 2024 04:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Ek0aCgqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FDF10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 04:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrA+rI6FxSFS/wohy/4TIo69zC4MOhQ3rxNBGIshjkG2wsEUC8ktbJ3b+a5jjvUNTxpHMXGZBoinpDvtutZEGc8iH8MGuePt7cSJJIPUYbGz+31VPErBvM4LhXPyIzubepo70/Ok+V3/teFKjJduOyZAFd75wdof5072jLP366o5p87zGpDqEd9af08kbrPtJkZpmF6irXZeJzQ0YHpRsVKwSyk/206/x7otD3HpbecRl7e/jGRxekdOTcYlTLGaV3CCSn8cOhOt3dDc6dFSjsVDtRrnoM3n7zAO1WmYHmBufAOf2vCoSMYYmjAxj2uP3Sbg+TDNcSeDQQhey9LZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT75p7tWP+WV3BgnYivl5n/8ZKQ1Jt7G+0p164Wu0Rk=;
 b=MEE3WkDKHVWK+xJZsFrzLojhYEaX84kBQL+VRasJAC5s8wX0l+QESHr9+sRwbSYiTFCJrSUxgwCAGCnk5VwGWy9BuzMwNsNwU/skglX7Uptq5mrrAcbjg8RqPj6ToEKs6WxDJfKzU8Agga2DoKF3ED3tryhkgpqhiW2wzGs2eJnFIwOsDstlNIpt1og6gjKSyWEhv8ySwGhieE5d5uhs2pWC9VL5C/JAknt+ws8XvxFFpOqTFwy35DH5SmBxGDXHFmlP5Tign4Z7Nm4nBylaUmB/5zFEXnyO7R8hhomyzGhHufq2on84NDAUh6eMyPtn2l3Bg/enff8RjSA2zfrMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT75p7tWP+WV3BgnYivl5n/8ZKQ1Jt7G+0p164Wu0Rk=;
 b=Ek0aCgqn5pe6znduX4Yn0wu75OQBghY9hX0kxpaDQcmzRK1ve029CPa9MsoFGZYWIr09V8RUd57nZujhsrO6wuZitMcIL6HfaRJVjuPkJcJw1QNSgNDl1W+CZh+nPK9jbPiZ1+tfA/1mNN2lM9PZS72DPDRO9cxtnQEyKpVBhpje/fdF5rfUT6AKaGt6HVuups76fS8UiU3nliwwOdqvxMkyt1PYW3ErlD25H6kKa1JvxDDdCvcvUeutSMFFFZ819ThVKGLZmePqDWfLWkx/AU5EZllQ+6Alq+PRNYq6nNVq5evdhPi70V0NjPz3rvRkWPhdwr33S+/oUY+Xqa3YOQ==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 04:39:05 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 04:39:04 +0000
From: <Dharma.B@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Hari.PrasathGE@microchip.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Thread-Topic: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Thread-Index: AQHa+Jv3E6nmCX7dPEKp0MFBmfquabJD8tqA
Date: Mon, 2 Sep 2024 04:39:04 +0000
Message-ID: <b9b8494e-8606-4f40-87ad-797617b72d18@microchip.com>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
 <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|CY5PR11MB6437:EE_
x-ms-office365-filtering-correlation-id: e849f6dd-4298-419c-1879-08dccb092cc4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?ZHFtSkpHb2owbnExY003QThMT0pSb2xDbE5UeGJZWjRkMTdYazdIRUVESzZ6?=
 =?utf-8?B?U1I5Zi96M21sb2dxL2ZzdUpDWWdRU2IzMlUxVHJiT2ZQajdVWmp2ZDQ1V1gx?=
 =?utf-8?B?Q1M3MnhhYXRNOGlqa0R6ckZ4SytpRXRMeWt1aUdPTkNUQ3Zoc25xTTV4RTdC?=
 =?utf-8?B?cmlUcGxnd0VVQmlaQjVYNVFEbi9tdy9vV2x2QzJQcGxNNnV5ZUhmS1M5Uitn?=
 =?utf-8?B?dFdVVjRJRUJSRitLUUJwUGpNRVc4OWc5SjRCdW9CZmtjaDMrbGh4dVl4cG5K?=
 =?utf-8?B?cFFoYTlzamVsVnFjb3ZORkJRdmdSNjBCZDVqOWhMRDVEMFZSeHhEYjBveG9X?=
 =?utf-8?B?SWoyL0kvanpyVlZEemxBKzVRN1RyMFhTWEZ6R25kbERYa2p4UHBIdC9YWnF6?=
 =?utf-8?B?MlYvRkF0RklSU1gxanJlbitkbEFtaUJQV0FoWFltSlQrVFljcEFwRE1kU1dY?=
 =?utf-8?B?cTNSZGdSNEdqM21HT1IycXkyM3d4aFJEOHpJQ2JkVjh4L3lPRjRiOHh2WTJO?=
 =?utf-8?B?ak5SOGUzRFV1dzhYU0ZqZUs3S0dxTW1wZFFhd3Y4VmpsMjRaZ3lDNDZDQ3RU?=
 =?utf-8?B?cFh5Z0NEQkdyK1ZCMWhZMmNzekJWdGhjdWRPdkI4UXRPWTNBVk5pcHZVU0Zr?=
 =?utf-8?B?Z1VmUXR4UUR6MU1uSHN1cHlpR0dvRWYvYjNMditGZ3FlNGs4Nk5GdVVFZGZh?=
 =?utf-8?B?N0tKdXozSUd6UzN3NzdWRlpndlovUTVCd2FxVVR0TERlWG1vQjA3TC8waDBo?=
 =?utf-8?B?dlAzcklPbVVKNVRvN0dxWkM4dE81N3VUZ0dXVEJRd0N5b09aTVp3TGpmbmtn?=
 =?utf-8?B?YTl0WkZzZTNZWWl2RGVZZVRLSnlUMytzS25tYVFPTEJucnBpY0laMyttNENT?=
 =?utf-8?B?bC9OUGM2ZWR5R0ZWTUk1b0hhZndLRVFpTzJNYmJiVmRBeVhwUjd4ZmZIS3M1?=
 =?utf-8?B?MElsR3VON3JNT01sTWs3WXVSOFpPY3VOc2liT1ZUVjhqRTluR0FXWW14ejhP?=
 =?utf-8?B?SUVjQ3RFMG1RRDlmV1JBWFprTXB1R3FJUUtlYTNQNTdwWXpodGFCY05FcENJ?=
 =?utf-8?B?UWNTakVZUngyb1N3WWM1dnhmRDZWQk5KSmhIUnZBV05IdTRDL0FnVDFuOFdN?=
 =?utf-8?B?V3pldVZ1ZGc1UlNtQWZRZjZMbnVUcGFXYm9BSDJZV0ttMlZXdms2aFBBbEVw?=
 =?utf-8?B?cGJEMU9YaDBnN3hDSllTTitKbllHNDRES25LT3FaeUQyeHRzQTFyU1o3TEFr?=
 =?utf-8?B?dGVaenVKVHUyaUVUTTl0bE9VRHJPaVBrcVQ5MmNwT0xranpib0FwUkhTSWg4?=
 =?utf-8?B?UEc2Vit0R3pVaVBxVHd4bWFvY0FZWlVFRS9iMENqSWY4WlhVbnpwNzhVV0FW?=
 =?utf-8?B?UXpNOEdJamZqbGI2bFoxUkt4SVR2NlllcTVsRmhZZlRGenBxZGNVMFpOVkZW?=
 =?utf-8?B?eWE4ZVJoUUtrQUVtQUpVRk9TR1VjMTBERm8yTjBkOHk1QUc3a2hnYUpUeTY4?=
 =?utf-8?B?VkJwdlVqd2ZHeS9uUTltK3ZhYkNkaFlKR2p3VE5xb1IrOHpZUkpyejVsRlNP?=
 =?utf-8?B?ckl2Z2JIUVJYWjNlUXEwUTlNSFJheGEzTnA1UEtCVTg0cEJWanNwNzhHenFB?=
 =?utf-8?B?d2Y0aDdHL2I2YnhaQzF2RGpxTTdFN0RzM0tKWmtGbXlRNm9wczlBd25nOE5I?=
 =?utf-8?B?dXNLeHppK1huSHpFL01QbVRCL3dYN3ZnZWZBTFg3ZXB6TUZjczBVRHlMK2Ra?=
 =?utf-8?B?ellLRUVtMXpUcU5hRHh4djRnSHd4NitYeldDTk9kbzcyS21kS2o2a2R1NTdl?=
 =?utf-8?B?N2pDczJuWmZJcjNUUFJzUkx6LzV3S3ZHS3FTK0o4M3pUbWxRZzFVVkg0a2ZJ?=
 =?utf-8?B?VE9aeGtidkU0ZHlGR2d0ZTZEMDlHU1lXT0REK2dzYVF2YlRHTzk5RHVONVNu?=
 =?utf-8?Q?WnRtqyJPYZ0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3hQNTlBNHVyY21XSm5YY1gzRGJOdThwa2c1UjZpdkc5Zmtyd3ZKRTlrVnJr?=
 =?utf-8?B?TVlUd1IvSmhlalg1RVhOMy9XTEQ5d1BqRHJrZ2Nyd254TUtBR0VINk9yM3F5?=
 =?utf-8?B?cy9xNzhWLyt6dU44Qk1aRDg1MHgya1J0QXJqc041R2lNZk1NZ3JUQlYwRmFU?=
 =?utf-8?B?OHhuQythT0cvSG1VOFZqbi8wSDZuZiszUUVXUmlEV1FGbHdvNndYV2ZyRnVL?=
 =?utf-8?B?cHkwWDgzc0U1MFNzRzRnem9wZU91TTFITStjRE05NVEreEpQUTY2L05tNEFi?=
 =?utf-8?B?U3U0cXg0a3FPd2tlSTZNOENlY1psVVZ2UU5BYzJWVnI4ZnhjQ3JuVjgyU2VC?=
 =?utf-8?B?QTNnbjNsdmZMWmJuWE5QU0ZDRGRDN3dGaDZiN2ZmVEdWYm5GK2F6aWdtOFR4?=
 =?utf-8?B?ZkdTMHhuOHl6OGdWekxFR0lQb2NScThCc0s4OG1IQzZkREF2bmNXbWR2ZWhN?=
 =?utf-8?B?WXFSUWp6d3hzUkd5VTIwS1M1dEEzaC9DVmxRZWVIWkQxQjNpVlJ3Kzd0WHMz?=
 =?utf-8?B?L3N2SGE0SDNDTlF5ZnRzMy9nelVjNjVnSTdCUSt5c3Z1eWQ2OVZ0VEFaTjhR?=
 =?utf-8?B?aUlBMHNQUG5BUVFFc1h1SUZOcGZ3aTE0ajRnazhxME9YaFY4aTRoQ3pScEFK?=
 =?utf-8?B?QitNUjd4MXppK3RhdldPWkZTL2RxSDFYWFBxT05Va2xLbStjVVFmVG9ZT2U4?=
 =?utf-8?B?UmhFeDV1R2JVamN0V2Q3Wk9zMk10Qzg1S0xWZ2hQSFBzU2Z0eGdKZE02M1VS?=
 =?utf-8?B?TE8vbnVwdTFLRVpWSWcxZTYyTWg5cjhCQjhHUnk2RWdNdmFQNUx2Vitwc1Fl?=
 =?utf-8?B?eFVUV1VOSFRRdlBjcnlxNnFrdjlkaDNiSjZGS3hXblp2NFo1WkFhY0JGWi9P?=
 =?utf-8?B?NWkyWisvSkh6aG55WFVMTEJVcU5SUHgrT25mWTRUbzlGc0FlWmUzVkZMT3Na?=
 =?utf-8?B?NFk1UVRpdUhOc25HOXVSK3AyOXppSHZ0ZkJnVUpSMUFRZFYrYUlha2oxS3Jx?=
 =?utf-8?B?M0UrQlcyMU4zcGZoTW5kMXRhNVlKREVoWmRKUHRpMVI4Y1FISXQ5U2JkSWpJ?=
 =?utf-8?B?SlcxRjUybXdVZG8vNnBPaHU5aGFJbWJJNUtDVkNmeGIraDhMUE4wR3l5ZkJ3?=
 =?utf-8?B?bno3REVpa012Q2RIOVEyRlFHQm9KajdUdjBlUjFpdFZoZ0V6dTBYQTc5ZUlI?=
 =?utf-8?B?VkRnMkM5VHpxWWk3VVU5Q3UrcmdLQ2F3QURRU1ZaOWt6STlxT2FUa2xiTXdC?=
 =?utf-8?B?ZUJwRnRVaEl1VmkrQzlwdXRwTzJ2Y0dVRW9lYXQvRWNZeWVWdDdWVk5Hc2tl?=
 =?utf-8?B?ajloOTE5TDU5VGgybGJ3dUVqQ3dIaWlmZHI0aXNndWwybGxVL2Q5eFdpSU1Z?=
 =?utf-8?B?a1cySXJtVHU2b1dXeDdFNmExeDlnNXcvbDZIeWtBSVJWV1hyT2tKZXJHanRX?=
 =?utf-8?B?bS9obTZJcHpkZmFlbHoyRTMrdGYwQmNEbTVOYTZHVU1jZXlFeGV2cTZsdURn?=
 =?utf-8?B?akU5V3IxWmlSdUZsZ2JvUVk2ZXpCaFN5dGNkWHFYa2VQakNKYS96TmNPczNk?=
 =?utf-8?B?N0xBNWgzejVzVkxneGI1d3dES1VOL1J0eG5XaXVSSFZOMGJsc0JtMVJoVVlw?=
 =?utf-8?B?NkZuS3hhSlFqbk05SUljQnJXZTRBN1cyRnEveGpBaFd4VFNxQjQ3Z1NlQ0Fo?=
 =?utf-8?B?RU90dGVCYnB3TWd3TEJIdHpoa3JjSkkycGFXS2dWWTR5R1hoZnVZNmRvYVBh?=
 =?utf-8?B?WU5XcUNFdzJoeG1TaERDQkJJR0w0eEUwNUVUb1pUU3NqREhiSlJCaTYvc2ZJ?=
 =?utf-8?B?cThuNjJCZ1UyM2ZtM2lJWnFaTEhDNnFwV2l6a05FU3Vkak9KR2hXQ3ROV3BF?=
 =?utf-8?B?SzF1d0o4N2w3NXRwelVxSzhaeEQ3Vzdaa0tWdzNBWkhpVGxwTnJjcm9hM0du?=
 =?utf-8?B?SjdKSDN5NmZpb1R6cG1uZjZHbjA0Q3JnYlh3MFlrN1FQOVU2M3BUbTJnMWds?=
 =?utf-8?B?K1NOOTRkZ0NTSzllVTRweXJGVWtNTmhhQTNReDZ0K0l6SWFnaFFRaStsRy91?=
 =?utf-8?B?VE1JbTJYM1FuM3Y0VmNLZzJyWmozZVpvekxycldUVERjamovY3dpdFZqQ20w?=
 =?utf-8?Q?NidvwxvC6GF03eVChbvK1kLUt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <783AB76CFF63B642808D10131EFE2DE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e849f6dd-4298-419c-1879-08dccb092cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 04:39:04.5540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPt+3+PW/nW7JMrnwEQu3maAYy1j8y0xRuk/2Az257xFKE1EyroNhu/KR55+PibNtMfxz/OVWWEwEBtRzop16g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

T24gMjcvMDgvMjQgOTo0MiBwbSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSW4gY2FzZSBwbV9ydW50aW1lX2dldF9zeW5j
KCkgZmFpbHMgdGhlIGNsb2NrIHJlbWFpbnMgZW5hYmxlZC4gRGlzYWJsZQ0KPiBpdCB0byBzYXZl
IHBvd2VyIG9uIHRoaXMgZmFpbHVyZSBzY2VuYXJpby4NCj4gDQo+IEZpeGVzOiAxNzliMDc2OWZj
NWYgKCJkcm0vYnJpZGdlOiBhZGQgbHZkcyBjb250cm9sbGVyIHN1cHBvcnQgZm9yIHNhbTl4NyIp
DQo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5k
ZXY+DQpSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJt
YS5iQG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWlj
cm9jaGlwLWx2ZHMuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYw0KPiBpbmRleCBiODMx
M2RhZDYwNzIuLjAyNzI5MmFiMDE5NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9taWNyb2NoaXAtbHZkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWlj
cm9jaGlwLWx2ZHMuYw0KPiBAQCAtMTI1LDYgKzEyNSw3IEBAIHN0YXRpYyB2b2lkIG1jaHBfbHZk
c19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gDQo+ICAgICAgICAgIHJldCA9
IHBtX3J1bnRpbWVfZ2V0X3N5bmMobHZkcy0+ZGV2KTsNCj4gICAgICAgICAgaWYgKHJldCA8IDAp
IHsNCj4gKyAgICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShsdmRzLT5wY2xrKTsN
Cj4gICAgICAgICAgICAgICAgICBkZXZfZXJyKGx2ZHMtPmRldiwgImZhaWxlZCB0byBnZXQgcG0g
cnVudGltZTogJWRcbiIsIHJldCk7DQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiAgICAg
ICAgICB9DQo+IC0tDQo+IDIuMzkuMg0KPiANCg0KDQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0K
RGhhcm1hIEIuDQo=
