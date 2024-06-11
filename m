Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1E9035F5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 10:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF4F10E148;
	Tue, 11 Jun 2024 08:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MbXQFONf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40FF10E148
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcY3FJG+L0pytkEt9SQoFGu/3Ka6UWhwxo1jEswBgkxURCJn+9XH4lQ7H0Z5NrA6JmyzFvSm8+B2hT3ANY0ZFllcfE6UOxxToUsQO2kSYT9UQ78V+55tNaw/GQbz146dQtUMVo58n/Un09mNWcFKkOPLaZBVw6Kgp/mY38ks3E4aySxzgLr9yuValuvAycM3vy3d7AfGMei2Cy1YVYrSs900FPx/EPV9XTO2B6LsuhGiHmJAY2600q922QeOR1sciq+9eqek+TmttcmCkDiudRmkSe9OqPOBzTObQU4tuQmzrVCWp/W1FcyivwXUCMcYq6W7H/zKfUgETUo8UJOkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpFOHQVkFaItcq8t4N6ZYqT9HWvyzELwzIuQG/i/io8=;
 b=ZqmqIkYcM1S6nbw5N+QYl4GCPbOW6gp42SPhUACg1xvyEZFs2KV646UUzRZHiwX3NLwEBZo5rKoQANkXHBSpamO6wXp0C/MHGc2ZriL5sfvEisJwRxtchOuC/0X5GiXt6Zpn8PGmnPyX76hcUrvh5DX74dFqzzKp1uvYOXpvr87gpTXJnFmucHG0rWUlNPHcVGwvX5pATsw2icYYf+7Evk88MDQqbNX/NcFGSKAbOBgiykROoqJ0c9SBXVx9XNKdmDzaF0nzd+AK94VA6vtnmc0bQelOWQhGnjNdorSp25BVZPr5eENf+kVCv12aLB1AFRs2a/H65Zfbk/6pItDh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpFOHQVkFaItcq8t4N6ZYqT9HWvyzELwzIuQG/i/io8=;
 b=MbXQFONfJYaH/VnqxJdukTRNdrxYYIBKG5WrtX5SIGPicOC9NZ32Wdrp2AFmvnYmaEsPNYofTSUbHAicNcJXnKsRnHeeJyME93gqj9B0tdtFqGm8ph5c4Y6rwm0upfw3i5VeDKbfzjizXvNiVjJAZPDfwYgQYbe3x3NRqzjOyXs=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by DU2PR04MB8568.eurprd04.prod.outlook.com (2603:10a6:10:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 08:23:05 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 08:23:09 +0000
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
Thread-Index: AQHatlRsnflkb+VoOkyefveVeXhwwbHAuO+AgAEPeGCAAHMdgIAACI0g
Date: Tue, 11 Jun 2024 08:23:09 +0000
Message-ID: <AM6PR04MB5941216A69AE325A79689C5888C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <AM6PR04MB59415B3F01D02024A255BFB988C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <766908de-922c-4d71-bb04-29dbe4d1d64d@suse.de>
In-Reply-To: <766908de-922c-4d71-bb04-29dbe4d1d64d@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|DU2PR04MB8568:EE_
x-ms-office365-filtering-correlation-id: 4aae77e8-254f-4132-5d85-08dc89efba1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aUNaeFk3dEgya2lUMGhKMktvMTNFdG16TVVwN0ZjVTVwL2Jwajhrem9zZC9y?=
 =?utf-8?B?RWpzYUh1cXp5akgrUW5wQUhPcFg2dG9qaXRsYTNhRmVqbFVFajB0eVR2ejB1?=
 =?utf-8?B?Z1VIdUxuRjdoSzBXMUhTYWJWdFhWSFh6aWhGeU9MV2MrSkljRU5MOTVWVzh2?=
 =?utf-8?B?dktENzFNcXBZQVhkd0U1TmROT2R3VWJwWlZnZjNJeVRONDJMQ05mWjNnZWVq?=
 =?utf-8?B?S3JxQUx4bUkwNUowbURTYnRmNUUzeko4RFhPZTJNc0IrV1dBRC9HQzVuM0dV?=
 =?utf-8?B?WnphK3NxcldVN0dXektCQWxoWWMxMGNWZUl4aUpweDc4YjlkZWtjWHppdDZS?=
 =?utf-8?B?Kzd1MVlHOXhzdTZBd1RGd3VLSzZHS004NmNvYTFCNkZDT3o4aloybW1wSEoz?=
 =?utf-8?B?Q0NtdmNXOFZRMlhkRFJBUFgzVXJmeEkxNnRNNDM5d0tQM2FiaDFaQzNPSklW?=
 =?utf-8?B?cWVHdWZaWVVUeUxQK3E3NEZsa01HYnlqVElKeWRGNzdSaEVtLzRwRHFHMHh4?=
 =?utf-8?B?akQ1MjJna2FXbmVPdkFOWTJ6T29NWExjMW9rVHBYVjdrZU0zMXdXYm1HNDBl?=
 =?utf-8?B?cnJtT05GNllsSWFZWWdURFF2WXNFNjdrTGFsMmlSc0c0Tm5RNk40OGJFWkhT?=
 =?utf-8?B?MmhwZEtxYk5FRVNLOTdQY3R6enNQQ094cXNISlVUWFM4UmtKVTFaUmlGdHVh?=
 =?utf-8?B?RVNRSC95NWtOcE1ZeWt5alBFQ0cxWi9FMkg5amFlNzVUT3RXcWpaQk5rbjlV?=
 =?utf-8?B?TjlScDRRV3Uwd1BNM2YzdWI4ZkxpUXVMS0lYOXZsWUxJTWQxUGpWSFlVa1p3?=
 =?utf-8?B?b0tiK0RTMWNSY1Z2STVIVjVOVDl3RGJIK1Y3M2h0K3F1T1ZzZEVMUW00NUU4?=
 =?utf-8?B?ODd2cS9MRndCcHI2RVpucm1NS3RwQVJGd0haMFlaTnlJeG1ySnYzd3F4bjN3?=
 =?utf-8?B?QzI2WHhJaWp4MC9QVGpXWHJQbUVOV05EVHRjVUFpM3gwRTlWZlZ5VklsOGl0?=
 =?utf-8?B?SkRJKzNkNHVvOWlzMUwwZHJIZjc0NDk5RDYyUVFOb2NlUzZmaHRZSFQ1S1gw?=
 =?utf-8?B?UkpsYjUwV1ZQZWpyK01lZG0xZmpvSlJyZmJyOG9IM0N3L2VVR0hwczN4Yjl3?=
 =?utf-8?B?bDNBV256V3FKTXJ1VnhHSWpBRGxrdEdDWWZodXFPY3paTm5qMXhUT0pNU0Fy?=
 =?utf-8?B?eXN2ejBZeStpQ1R1ZituZXN2VGQ5OTNZMmNvdDZpUVFTUEhRR21rM3Z4cHR6?=
 =?utf-8?B?T2NUSVNmREswLytTWWJGMGhaSDNRN3paMWs0R1h4OUErbmdXN1ZIb2pYU1ZC?=
 =?utf-8?B?SDRmU1RXNzM0TytyWGFzSXVYZnZMekhPbUFzWkNrVTlhRmZYaGpDM1hYYkZY?=
 =?utf-8?B?bDF3Rm1hbkhmUW5JWmU0MXdsVG5QR3pOS1pUSGljbWdrQy9qa0FjTEdaaGM2?=
 =?utf-8?B?VjNnejNhN3g2MzRBOFJrZGZDY3hqTWJSVVU4YndyWWdGOUhURGFRRFVBV1NN?=
 =?utf-8?B?NG1pV2hwNFlKM2ZoQWh6VDk1QWU2SzdHMzd3OEk0V3doZGt1cmZyb3ROR25j?=
 =?utf-8?B?aFBKWnRrUUxwaHJscTdFcGZycklQSHFUZGVaL3B1L2dwODBNY255ODNHckNP?=
 =?utf-8?B?bHVHemlpK01lSU9WdnlkakFZLy9sQ0ZDK2ptYjBxOWw1QVV6cE45QTl3Yk1z?=
 =?utf-8?B?U0p0T0FCYWtRVWtiQ3IwN1JIL0ZQZUxmZXB1S1VIK1JVUVFyS0c2U1JxcXBG?=
 =?utf-8?B?MHZLM2ZFWE1GNmNUaklGeVJVbWxPWVp6RDByNXNLWEVrNFhlUjZlcDBnQ0ZX?=
 =?utf-8?Q?uaTAKXka4g9/UbbSHz0RQy4Aom9V49nowzzfc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5941.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFpGRm8zMnVxTGR6QXRxaUVJVmZ1cXhhUjUySWtrek5QMnljNGFOcmE1cE5M?=
 =?utf-8?B?NDlHMlB4U1FIRzZwM3FjQ3hyd3FhcE94NWdDbUk0Q2VYa1JuU3AwVWJMVHlK?=
 =?utf-8?B?VXFmV0xNaUtZUUVRcnNjd2tYZU1QazBLNXlkTXR3STJrdUxOR2dlSksvMXNB?=
 =?utf-8?B?VEZxTWhEM2dUQjVYZ2hVYk15L094QmtVMDZHS3JRRm1lck16M0ZKVWt3eG5Q?=
 =?utf-8?B?TmcwZ1kzZjFIeGsxUFVZUjhJYnZLK2doVmZTUDd3c3ZhRDdxZXBvS1NlR2ln?=
 =?utf-8?B?SGY3Mk54dVNmVEt3WXYxWnduNzdzQ1pxYzBoeDh4TytJR0FuN3V3NFhwMmRv?=
 =?utf-8?B?NkNNajF4ZDJ3akxocWdja0ZpUExtY3RQOWJCbmVMVGdVUG05MkpNM1A3bmVD?=
 =?utf-8?B?VjNNMWJ1K1YvRjhaZG03UHhhSGtuYTlWK2lrNlBkK1pBbjdqVDlPelRJSFBN?=
 =?utf-8?B?SjR5RlhwT3VZbVdoVFppcVdnV0ovMWxzUDFGNUQ0a2tZbWE4bnBBVFlUeTdZ?=
 =?utf-8?B?OVg3dUZqWkhXTVlYVkZJVXYwd1d1NjF1WXFmdFlGMWxBT2gxbjJLYXZ4T3NM?=
 =?utf-8?B?OElsTzFOMW1DVHFySVNQUkUyVkpwTDRCVDJMcFpvZzhpNGh3SUNzdTZiMUd5?=
 =?utf-8?B?b1dLc1RraHAvVUZGQ0tRdE9XV24wUDJENEdJZDVIUXkzd1pJVy82cDd0WFRW?=
 =?utf-8?B?T0NhRi9nMGlKQzJIZEhUdmxoSDAzZ25MdnhLYVFmdmxIaWdoNUdkb2RrU0F6?=
 =?utf-8?B?b0oyNE56WnFCNi9TUkRLUm94c0FVZzJXUDBoS3Z4dnJWeGxCMjA5RmRRMXlB?=
 =?utf-8?B?SzFtSzJ5dWZhNVo5a2ptaVluaWM3REVQVmpIZE9LSHZQOWFtamVWNnZYWkhQ?=
 =?utf-8?B?RGI0Ly90MWJLeFpmQlVWbGFobjVKcS9UTGd5Qi9BOTdHNnMyNlJWRTBVVE9X?=
 =?utf-8?B?Qk9FNU8raVk4Q2pSUytzMHowa1QxSUZYQ0lrdVREM1Y3a1VUYTNJNzRNYXJQ?=
 =?utf-8?B?QndOeHZwK1h3SzhYNVZ1a3N3QmtVOGpjaVFSc2JMRGswTVBwaVEyWWU3Y0xW?=
 =?utf-8?B?bmtVdW9iUlZUOVJlejE4UHp4MThxTjZ1OVl2TGpxWWNNb2dyU09tNVFkcENT?=
 =?utf-8?B?dytSeXd0WUcrZkZmS052OUxrTCs2ZXRUUEFJRVRrL1ZyVXZXWTlaSzlZTXR1?=
 =?utf-8?B?cFBteVFla0RpbUF3a01GeU9lbGtScUhaT2pUalpkZjQ4STRla2RrK3dJUWwr?=
 =?utf-8?B?NXZWa0NES1grZ0w2UTMxM2FvMmo3MTdMcUZRb2ZvL3NHeFBtUnp3aUwxODBv?=
 =?utf-8?B?ZFlXMGs0a3BiK0pTbEFZb0Z4V1ZpQXJpY0hNaTE1ZVBXdHpYZTJ2TjJhMU02?=
 =?utf-8?B?T2toeUpOamJCbXFtNHlwREp0dU83Mm5YUTMwd3pPNXFFWVVPRTVOTnhQVWRM?=
 =?utf-8?B?Yjc4R25TZm5jcHZPR1dXeVMwTmcxamFDa2JUTkYwTmFuT1NFeHJkUSsxSTM0?=
 =?utf-8?B?VjlTeUFhZFp4NmlEMGd0RFh6OGtwVG5pbDhwTnp4UHF2YVdsQVZWdjVXL2dF?=
 =?utf-8?B?ZzhJYnJHcm5SSlRWOC9sNmd6U1VOMk5udmVyNHlyVmVMR2JMQ1RYVGNuZ09C?=
 =?utf-8?B?dTlhdit6YWRCTTBaclpXUFpqNmd4MWZvc2x1NHlkRmNPMzdNM0hzRXhNUHl4?=
 =?utf-8?B?cWpETStPei9qbHB5c2pwYkx5SmJDOHJVc2tpTXFPNlNPZHhnalYzWTJkZ002?=
 =?utf-8?B?VU1XUFZmLzZpd0hMYzBUUi9GWHYvTGZ1eHVReHVZekV6SUllUEQ1UGQ5R0hE?=
 =?utf-8?B?elRXMDVJaXJDRy9GbzVoOG1VY095YSt1WEUxOXh1UEtLQm9ZRHRMakV1Ym9D?=
 =?utf-8?B?QXhybTI5YlRxN3VOakxwTnFINmFrdHI2aU4zRURaRnhDc2lITjQwVkhxcHVs?=
 =?utf-8?B?cEYxQlFhemNxcVZqZ29vSlgxQVcrYzVhallLL01XTHJvREN0blNoVGlmWnNE?=
 =?utf-8?B?Nm9BR0xLYlREdVRQb2RDT1Awenc5VkNJZWFQLzVnS3ZCb0RqTmw2dUk3dTRh?=
 =?utf-8?B?am1zUUUxaWVFeGdKSjBzQzJXdUJuRnNiTytDOU9UcXB1UUUyQzc0Q2JoMHA0?=
 =?utf-8?Q?BAYY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aae77e8-254f-4132-5d85-08dc89efba1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 08:23:09.2472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97GJhBLZLtCYJV6/Jq4LMTeLR/G9eGqxcIEbcLzVC7ToIV+fncUxPoD+0sUdGfc4bf2JTWXmm+R4yzJ45wn1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8568
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
YXJ0DQo+IA0KPiBIaQ0KPiANCj4gQW0gMTEuMDYuMjQgdW0gMDM6MDAgc2NocmllYiBQZW5nIEZh
bjoNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2ZiZGV2LWRtYTogZml4IGdldHRpbmcg
c21lbV9zdGFydA0KPiA+Pg0KPiA+PiBIaQ0KPiA+Pg0KPiA+PiBBbSAwNC4wNi4yNCB1bSAxMDow
MyBzY2hyaWViIFBlbmcgRmFuIChPU1MpOg0KPiA+Pj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFu
QG54cC5jb20+DQo+ID4+Pg0KPiA+Pj4gSWYgJ2luZm8tPnNjcmVlbl9idWZmZXInIGxvY2F0ZXMg
aW4gdm1hbGxvYyBhZGRyZXNzIHNwYWNlLA0KPiA+Pj4gdmlydF90b19wYWdlIHdpbGwgbm90IGJl
IGFibGUgdG8gZ2V0IGNvcnJlY3QgcmVzdWx0cy4gV2l0aA0KPiA+Pj4gQ09ORklHX0RFQlVHX1ZN
IGFuZCBDT05GSUdfREVCVUdfVklSVFVBTCBlbmFibGVkIG9uIEFSTTY0LA0KPiA+PiB0aGVyZSBp
cyBkdW1wIGJlbG93Og0KPiA+Pg0KPiA+PiBXaGljaCBncmFwaGljcyBkcml2ZXIgdHJpZ2dlcnMg
dGhpcyBidWc/DQo+ID4gSXQgaXMgTlhQIGkuTVg5NSBEUFUgZHJpdmVyIHdoaWNoIGlzIHN0aWxs
IGluIE5YUCBkb3duc3RyZWFtIHJlcG8uDQo+IA0KPiBXaGljaCBEUk0gbWVtb3J5IG1hbmFnZXIg
ZG9lcyB0aGF0IGRyaXZlciB1c2U/DQoNCkRSTV9HRU1fRE1BX0RSSVZFUl9PUFMNCg0KPiANCj4g
SSdtIGFza2luZyBiZWNhdXNlIGlmIHRoZSBkcml2ZXIgYWxsb2NhdGVzIEJPcyB2aWEgdm1hbGxv
YygpLCBzaG91bGQgaXQgcmVhbGx5DQo+IHVzZSBmYmRldi1kbWE/DQoNCldlIHVzZSBpdCBmb3Ig
ZmJkZXYgZW11bGF0aW9uLiBJZiBkcm1fa21zX2hlbHBlci5mYmRldl9lbXVsYXRpb24gaXMgMCwN
CmZiZGV2IGVtdWxhdGlvbiBjb3VsZCBiZSBkaXNhYmxlZC4NCg0KVGhhbmtzDQpQZW5nDQo+IA0K
PiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFBlbmcu
DQo+IA0KPiAtLQ0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuIEhSQg0KPiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0KDQo=
