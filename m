Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B97902DCD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 03:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBABD10E0D3;
	Tue, 11 Jun 2024 01:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UMQOJgmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61E010E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 01:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igUv++4ebtGQzwdBLJx7t3mZ/GsXJ5Qbt3RRwEFj3Qw6Ovh8A8BoGtwP60Wm0eih1hjhjowZJ1suOcmJjF+n3dM20vxirK4rxwdePd5zpUKenEqC2GOO7GEhi9ED1Xca+ga6LAmKabY4WW/6ffgRsDUE2TTS/WGZGiJovrLFtK/hGrdmCFG3sQBgU1o5eZkDvsotwdrUb4l4d/o1VNX49EsfkGNGT91og+3s222V2Kixjw2avxh6e3Ks3NIX4dGLESU/ThpnUjnr+7+J/t6laj3fbBmiI8sTJHeU9nRjxkENXya+gy3/FZgYaIm35EFuoFmTcTnsrXUgC4+Ej3rwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQ41AQpXKUtXWliN9eAJ/J4JG/ogD/gDh6Q1WBGk0tE=;
 b=Nl6sxspFbfRfebxnlwSFi71ySlO3EtzXxZ97SzVLUcuFkSfQuYf1un31Hn1poi/uoNkCs1nHSLszw7V2lgm4nYTh8nUsAyqXvQCUpB6YnlJO/oyd+fn8EJ9wp1a7QTB6C6b9eScjf92e7rQ6v9MWlnOkqPiF3VTnc37tLPKnfo2pcwxT4MfF6wexnYh4akPJEQT3FoL1ZVuQqUEcg70iP7EdNKcvxlo+qX/4HcAUIGrKmqvH2OrWxkt3fofXy7iJFc1TF/tyZh9iK4CgrCUEL9+2f91J3R7dREjT6n52hx9WbsUkFjEjMX+IJyqlmaE0cB7ssPfbnaFzPyM3Omz1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ41AQpXKUtXWliN9eAJ/J4JG/ogD/gDh6Q1WBGk0tE=;
 b=UMQOJgmCuhrFkkL7IRlHS5LhALyuP+lmYQTv4C48cx/7I14zezTr1oQVOWFmI1nEeK1RPKA3IiytTvbeFL4sQCZgKTOtaCjXUzduXkpZBFjV5ouJVr/9VE8ycYYYv6puRK+zv3rPiEOyVWXMSTRvnYnDurf1wPPxSbU3SwUWTL0=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Tue, 11 Jun
 2024 01:00:28 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 01:00:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Javier
 Martinez Canillas <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/fbdev-dma: fix getting smem_start
Thread-Topic: [PATCH] drm/fbdev-dma: fix getting smem_start
Thread-Index: AQHatlRsnflkb+VoOkyefveVeXhwwbHAuO+AgAEPeGA=
Date: Tue, 11 Jun 2024 01:00:27 +0000
Message-ID: <AM6PR04MB59415B3F01D02024A255BFB988C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
In-Reply-To: <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|VI1PR04MB6816:EE_
x-ms-office365-filtering-correlation-id: 48bc13d1-c491-4680-eddc-08dc89b1e257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?R05YUlEvNDIvM2VZS1Q1RDg5UFIySHc3cURmYjl5aDBPL0dTS2JLQmxMWEps?=
 =?utf-8?B?R0xhZ2tuWXoyNXJuQzVOZ1puWDlXejdIOU5oRy9jK3F4dG0rZGp6R3ErVmNi?=
 =?utf-8?B?eXNJK3FZMHZmbmJQVGxiMlJ4cDBLb2hYeEhCZkN2Q1JMdHVWSEVjVHlJVTht?=
 =?utf-8?B?L0tqZWM5cDI2bUF5dy95WlB0d3cvelZ5NDY0bEplbSs4WVJ5bTRuYldtdElK?=
 =?utf-8?B?NFQ4d3FnMGhzbFl4aGFZelNjME1UVEJNenhIdDhDb0hPMGFYa1dMTnZkdDNj?=
 =?utf-8?B?MmJWQnowSWJRRFdLREhmYXpQSCswcldGNlBVZ2J0b0hDMXgxTG1sS0M3Rmlw?=
 =?utf-8?B?STN1d0NKbkd1NGdTaHJpcWdlVHZBamx6b0dnY0krZFdRRE54OUVjOHdsV1Zy?=
 =?utf-8?B?RmpnV05XVCtwbEh6cjhwZzdlcHVZWWpsV01pdlFIUmUxYkdSbkRyaGtMWlFk?=
 =?utf-8?B?MlpLVTVsOHM1TTdFd2tGMlRDb0J1aExxWTdZU1cram0zVGdPcG5YUkkwamV3?=
 =?utf-8?B?OWZSMVlGYzZ5WnMyV0hsQkEwRHg3Qlh0cUNpc2xMYmhFNHJSeTErQmUxdUlx?=
 =?utf-8?B?V1k3R2k4S1NUTDM4MitEenRkR1FHYTVIbTZDd1drZFlqajdxS3VPZ1N0aWgy?=
 =?utf-8?B?UFVwZEpJNjlJeklqZURTV2NPY2NtOTFnclJLMGt4eWZPVUJBYm9KMjFmT0ZI?=
 =?utf-8?B?bkRLQ2krODN4NXcvK2w5cW9ncmY0cGhjazAwSVkzTUtjZ0NOWVBUMUFwMHhn?=
 =?utf-8?B?SFlHMVJldEFqa3VGNXZrSFEwdDM5c21Vd2k5N0xqK0pIdEtyYS8yZ0IyWTBO?=
 =?utf-8?B?YkxLdVRhV0VQMjdlSkR4RnhPOSsyM1JHdGdxQVFXMFFralhaRklzL2dHMjVI?=
 =?utf-8?B?RVNuYUpRLzJTNURtYkhVcWE0cVZwb2RjOHc3MUJneUI4b1U2a2tlRGhQUjQ0?=
 =?utf-8?B?d3hrbmdndExqcFZRanl2ZHg0a0RxUC9IN1lOVmZIWEJRRGFzaFJNdE5pU2RH?=
 =?utf-8?B?YjNiWEFVaW9DdmEvTkFyeDczaDJiUGx1OW1jb25EY1F0RHo4bjdXcEJCT0gy?=
 =?utf-8?B?bFZWT2VtMWd0TzJKMkQ5aC9aQ2pPczlCNyttbDhFcWUyNGs2OFhqSXg3K0Jr?=
 =?utf-8?B?SVpYQzZvbXJrK09wSFlRT0crR1RLVlMzQkRHeklCdlNOVElsYTRHY0R2ODA3?=
 =?utf-8?B?cCtUQWVwcW00WDdvRWljTlZPM3hEWm5EUFJLZHNmUCtJNnVRY1pYdzUya1Fj?=
 =?utf-8?B?bitiaWRBTCt5czlybWQ0U1ZSOXIvdlo2aFJqSjRkY2xmeFlyWEo0Y09FTXRU?=
 =?utf-8?B?U25CMS9CRFBvTTBxVE9CMnVuY28rOGVReGROeXROSVZRNTdmRlJVMnEraW5Z?=
 =?utf-8?B?N25taGJhK0R2aUNLN2g1OEhkVzlvME8vdWJXRWRHTE50VnRtUEExWXcwRktF?=
 =?utf-8?B?LzlCcUhlanFIWFJpaXdJUGt3cUFBWithdU0razNGZmNZcTFQS3JkWlpCMVlL?=
 =?utf-8?B?WXFWVEQ0M2lJN0pma3RjZFdKZ1BCQk0wVE5lVVkvelo3WnBJKzNmaWZtZzd1?=
 =?utf-8?B?ZUhleGh2QkhRSUVHT0x6RWJiYzFGcE9hcXpSK05KcDZhUVBrN29NSTlVdkM0?=
 =?utf-8?B?NStyamcyWTRYdlF4d0tnV1FZRHlndU5qU0IxNk00L3lzSU42SlFRVTFiZS9H?=
 =?utf-8?B?WGl6aThGNUd0ZGI3aC9NLzkwc2N2OTJlODlhN29EeWFHaW04MGk0RzZ4b21V?=
 =?utf-8?B?R2dBRWIyczdjWXVYS2tzVGJEd3lqWHJ6MnZsSkQvc1ZaWFpsYzJQRWFzK08y?=
 =?utf-8?Q?s4BYcE0Wm4azULTvszsjm5NfQDB5MLSxjMWok=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5941.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGRXbk5pMXFuSTY5UVFsdm9IajEydlhnOERqZnhsdWM4SksxVThjRDd6ZTRT?=
 =?utf-8?B?NldWRHN3M040eTlyZXN4aWlYRWdKRW9uSjVtdGN4WHhvRjNrNHNmWUZRNlhs?=
 =?utf-8?B?cEdGUWN4RjhPbE9nVmN5UXpmanFYWnhONGs1WFFieWVUSklYdUh3dm5DUjlq?=
 =?utf-8?B?cm41eEl5L3JnSTJlYWFUSzk3V08wVFpWclhSS1RVWXdmRWxMQjlqMXh5ZkJs?=
 =?utf-8?B?eS9lMk0yREgxZkJrRWRzSkZtV3VLRHI0QWg1SUpBUUJtSHZib041Nk45cC9E?=
 =?utf-8?B?clV4Y2xwbkp4TDdHSklNQVlneDIvbjM1QWgvNmFmdHVTNExONkhLekxVSTFp?=
 =?utf-8?B?eVhyYXM4UXJlOGwvazhranY5enRTWmFPK2NFUU9IRitQREx5MEZ1RnRqRS9J?=
 =?utf-8?B?Rjh0VVhuN05rZGp4cEVvUzU2K3gzWElvbU1mckpBUXgwZEJIVmJXeU0zenBI?=
 =?utf-8?B?TWNOUjJQdXVFa3oxUFJqYkQ0WEt3SXY5N2NMbHBzS3BMS2QreXQzZE5wN2NE?=
 =?utf-8?B?QUd4dTNNRm5JeDE1VjliUzVQRkZYVHg3QkNVcmt0YzBpaVlWN3JrY3pyZU1x?=
 =?utf-8?B?WXUvbk5Ib1ZXNTczYnpteVdTcmw3T3FNKzI3elRHZ05UNWVIeS81VExwNkZu?=
 =?utf-8?B?UmwxUFYvYnJUd2RxSmRMZ0NNU1N2V3BGc2UrZlkrZ09jekVSVzhVVGtYcVVh?=
 =?utf-8?B?ZCtSd1g3bEdYaGdhZkJsbC9aYU5ZcjFDK2lRVUVDNGRMZlgvMG1JNyt3V2xO?=
 =?utf-8?B?TWYxemFnbitTT0RmcytJL2lLM3BQUVArdDR4eWVTYjJMUmNXdlZpT0MvYW1l?=
 =?utf-8?B?TXBVdEtBVERTSVRhKzB3bWhsLzRQTTlSMFpkTWJCZktRREVKZUZGL0YzU0pY?=
 =?utf-8?B?VEVOTk5za3VybTF3WGtKWXJxRm1iV2tmVWduNFhKNUwxNkVMYVhVZ0Z2MFF6?=
 =?utf-8?B?OVFaNmhtN2o0Znk0blZQUSt0dkRaaUlKTXNYWnBLc2FvbXZzcXl3c3YxSWJS?=
 =?utf-8?B?elJLb2hYcVltZnpQKzF6V1lGalpsQ2FYQnB0dTVEQnRsdmRFNjFycCtGcXdQ?=
 =?utf-8?B?aUVxcmUvOGlVTGE3SkkyNGRJejFYZ1V5NUVseU5KSFF3TTgySGtUSkZTVHNT?=
 =?utf-8?B?YUlEcW8vQk9QVU4zQkZLQUVacVRJVlpweFNRQTRXMHA4REVicHhVVWRVKy9F?=
 =?utf-8?B?N2MyN0hwMmwrbTJCOFk2Z200TmJGQ3ZCYWllejkrNDBjY3k3VGN2U05VNjZx?=
 =?utf-8?B?RUdqMmNhQkw1WVFEanpxNWhPTExUVGRzVSs3cjFsUU1SY1hNenRUVDlxa3ZC?=
 =?utf-8?B?QW5JdEp3ZUJKbldDeEwrMEdNUGNqc3dsc0xTUjFsem5kR1RPNzNSSmxGNFEw?=
 =?utf-8?B?dTh6aXFtZFRMNzVRZUZtTjlFeDYzSkpoaTFEWjBRRG1DZkFmK0p2ZkxYUlZY?=
 =?utf-8?B?UGdJMTZVRlJIV3lMR2NaWWMvWW5BeEtXYWt1Q0JCNmZHY1krR3RhRXF1UWVR?=
 =?utf-8?B?Y0t0SGE4VEVhZ1B3aU9EVngzUi9SOEc3dlAvZCtpeVhLZzdCdjJNLzh3cTZp?=
 =?utf-8?B?RW45UThVZFlmRkh1S3RpeVNaUjcwZFZrOXJNUHB3RkJuaWVDd2dHMVpLc1ly?=
 =?utf-8?B?VDVWZ0JiSURYMHhyenMwNzVkWDd4VmhRTG45Yk9yblVwM254alZqZllBVlVh?=
 =?utf-8?B?ZnZ5ZmZ4ekZwWXNuTVdhZTEyb21mVnp5VzdOeEVjZWx6bW9MUHl3T0Q0bzgv?=
 =?utf-8?B?Nkx1b3I2TmJCSzhTNHNrQjdKODRvMHozRXpsei9yeUV4WUF3bE5oSTd1dVVF?=
 =?utf-8?B?T2c1STJ1dzZGbDNaMEtzUEVRQkRHWUpOZithZnAzbnYvK1hoWGMrS3lwWkhN?=
 =?utf-8?B?NzJTWm9HRzlVZmVheldJT08vckhuRHRRQ2hsQkk2TzB5Qk5TbGExMDRNbUpq?=
 =?utf-8?B?TGdwYXI0TktNUHJEUW1SS2VOYmtYRmZoQUVLK25YdENkSWxDSmQxWXQ4ekZ1?=
 =?utf-8?B?ZHVmOG5HelVmMEdzUlZuSmJiZ2JjV0RhM2VwbGxDZjRFd291bUdRSy85VzhT?=
 =?utf-8?B?TUIxTElLaWY1RGVCZWplUXhNdXpjR0cxUW51eUkrZDMxTWdDdW1PWXIyYWxr?=
 =?utf-8?Q?BJEw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bc13d1-c491-4680-eddc-08dc89b1e257
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 01:00:27.9248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HU++gMQu1vSO65jdQwN+NLmBkD336bEjJyQTp2vRdzt2q+XpU0Qd8MA3jACBFMh9Dw3ge7OQFByZjVcExk2P3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
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

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vZmJkZXYtZG1hOiBmaXggZ2V0dGluZyBzbWVtX3N0
YXJ0DQo+IA0KPiBIaQ0KPiANCj4gQW0gMDQuMDYuMjQgdW0gMTA6MDMgc2NocmllYiBQZW5nIEZh
biAoT1NTKToNCj4gPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gPg0KPiA+
IElmICdpbmZvLT5zY3JlZW5fYnVmZmVyJyBsb2NhdGVzIGluIHZtYWxsb2MgYWRkcmVzcyBzcGFj
ZSwNCj4gPiB2aXJ0X3RvX3BhZ2Ugd2lsbCBub3QgYmUgYWJsZSB0byBnZXQgY29ycmVjdCByZXN1
bHRzLiBXaXRoDQo+ID4gQ09ORklHX0RFQlVHX1ZNIGFuZCBDT05GSUdfREVCVUdfVklSVFVBTCBl
bmFibGVkIG9uIEFSTTY0LA0KPiB0aGVyZSBpcyBkdW1wIGJlbG93Og0KPiANCj4gV2hpY2ggZ3Jh
cGhpY3MgZHJpdmVyIHRyaWdnZXJzIHRoaXMgYnVnPw0KDQpJdCBpcyBOWFAgaS5NWDk1IERQVSBk
cml2ZXIgd2hpY2ggaXMgc3RpbGwgaW4gTlhQIGRvd25zdHJlYW0gcmVwby4NCg0KVGhhbmtzLA0K
UGVuZy4NCg==
