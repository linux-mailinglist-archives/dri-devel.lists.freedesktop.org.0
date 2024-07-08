Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058A929EE5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 11:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240E10E0E9;
	Mon,  8 Jul 2024 09:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SEt8ENWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FF910E0E9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 09:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cggrjV4AgQXMPbsy56aj/AyUQRTx/IFaejkYZL+L9xp5TgZ8c/S9D//cmdxaLXMsG238p0I93wQ0apMf4wfYykWITGCiVe6RqwtB6NS12xkTOGtm+ENnxhQwceQWG9jWZfAxMdpeJO/p0eXjIIjBGA08hfyoRB+qpYaxKYmeisu8tna21FO+tH9KUb6m1Or5G18TT3dUxT15kRcd9bM2njJFoRj6BgmkSK/oM9VoM9OCG1pqoGQvxZHfix/MnLztDap+I1frbCu4ZHo2SSpvyj02r3MVsSwOECDjGL7EYCLquVju9n+a97VzXi3aZ6ctGPvY8lpGhXJox+Pb2VMW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+dm7mcRFst1djOBWUjKY2InTtZKHSpsWnz5IrbGnRI=;
 b=CYE7BZQX/5k7invFWWLJY4LCgKcHq//rtSN3W2ZD3INL9CxYUmiiedKYg/niHbEuJOj/vk9ipmfP6XZ4jmbq3MPxQFlCVspt9VUQ+cdvQKl9FJ/hUMEIjSrwFOAlkK18LgupBBsuckgRfF06upwCsDtJOmUcrTVo2J4id6s9VkXIStov+QYY8obd5YWlHF3ABzv82ZC5x/RnSkTOLSicW9wW1q8xQx16CGPMptwqWBPOPeBMvGoixkWGeikUFUSpvO/qiyLxaYJKU79YrnkpoBOCgLPuAZM0SHaLdzHlruRsOaWn5Nsml/53Gw1oJSx2NI1yJbizlNSkMIYn+DwG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+dm7mcRFst1djOBWUjKY2InTtZKHSpsWnz5IrbGnRI=;
 b=SEt8ENWnbmM5LWqi9JJse/bZquGSOmzT1Y8uXBUHb4r08zKdwioU48WvDxbb1YvtQwhYnx+2Vc6V+jH2Tt++QDUmnA3lJSPxVZ/zcFL6SF6qkJFSNSdXBPTIO02vvMklCKIvCxO2ywPyAlnOl19VCkWgbeXWBR2DPzbZKZ8wLjw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8512.jpnprd01.prod.outlook.com (2603:1096:400:13f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 09:18:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:18:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: rcar-du: rcar_lvds: Fix PM imbalance if
 RPM_ACTIVE
Thread-Topic: [PATCH] drm: renesas: rcar-du: rcar_lvds: Fix PM imbalance if
 RPM_ACTIVE
Thread-Index: AQHa0Q/4bVMsvQyeD06mCbylmFSdW7Hsi2GAgAAB+OA=
Date: Mon, 8 Jul 2024 09:18:49 +0000
Message-ID: <TY3PR01MB113463E7E7665A8E1573C0B8686DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW4jmGDa=Ns-BCptyg0r-SydjUq_DVCCD_ELTHm192Fuw@mail.gmail.com>
In-Reply-To: <CAMuHMdW4jmGDa=Ns-BCptyg0r-SydjUq_DVCCD_ELTHm192Fuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8512:EE_
x-ms-office365-filtering-correlation-id: a1a80e34-2c12-422d-df83-08dc9f2efa6d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dDY4UENaV2RSMnhFK2FPYVRyd2FzZzNCanBWdlZMTmZsRFZYekZ4VWlkRm40?=
 =?utf-8?B?TXRmNUZpUFRzbkEreXZhUCtNSDMrTTVzUUxlQmhLVGRvYnlHckZhMVBpZk5R?=
 =?utf-8?B?SjB1TEx0Yi9PbVlQanZ3a2ZGN1ZlVWJ1LzU5Y1dRdXVwZnF6dHdpTVdkZ3Nu?=
 =?utf-8?B?T3RhKzNJK0lUa0VJVE5JOWlMc1NZTzFNb3Z6cnhZaHlDQTFic3M0blFacDBo?=
 =?utf-8?B?N3Y1ZUYzR3Q5a1htNlpaMjFsam5pNDlPOEJZV3BWd3RjUmlSYXhZL2FGNHpv?=
 =?utf-8?B?a3ZuWFE4clVqUDNXc1JmZ21yVkJScEVha0huRjZxUlRHbW9Yb1M1eGJ1bkJW?=
 =?utf-8?B?em5Ib0FHalFUbi9zTyt3TldMRXFkSkdTcWJSWlhSQjd1eGw3NlpmNWttZnhz?=
 =?utf-8?B?YlhKUlBNdmxkSmgzWGNLRnhwUC83QlF4S29hNE1sL1QyQWx2K3lVMDJOZU9z?=
 =?utf-8?B?L0NyVGc4MDZXeitjOW05Ym1BYXlHOWMyUzZGa0h0VTRUaDhvay9nR3lPMjR3?=
 =?utf-8?B?Zlo2eStxazZNaGF6UzVYS0FaYzBoMm9CZ3M1WDdjTUFxMWkxNWpQY1R3Q21r?=
 =?utf-8?B?MVRMZktsa09NQmRUOXAvK1BLV0FOQmhFTDN3SGRLSWdWT0VVTktlQ0pPZjg3?=
 =?utf-8?B?QmVlelBPK2dRUEwrTTdoS1lSa044MFJkVXZmcU51YkhyK2trdm9kYTNaNmNV?=
 =?utf-8?B?RnRRM1VSbkRBcHRLU1NZUDJucG1vQmtKdW5PZlpvTEJSejJHeE1qdm9xbG5s?=
 =?utf-8?B?OHZkUUVQbzNlYzRCNVJsMkxLNFdEWDZYd2oxQUxPcWl2a0QvSlZ0cGhMcVAw?=
 =?utf-8?B?ZCsrSjV0eTBGUm5URXNVZkZjQitrRE1KV2k1SGRkWWdCUXVadXgrRnZyZWNF?=
 =?utf-8?B?Y0dxUFlQeVMrMkRIOVltekZZbW5udVEzc3d1SUVJM3h0VzR3QUZRL1V2UExj?=
 =?utf-8?B?aDZBWEswZWNYQlhFdzlBQmd3OWc1cDIvUjA2UFA3RjQ4TmhQSVFkQ1JEbGg0?=
 =?utf-8?B?RncyYm8wV1NwNFdLR1ZJaTNwVzM5eUw5N1dxYytENTdHdkxrYkxzWjhyVUdV?=
 =?utf-8?B?Zm0veVdDcC9kc2o3ZGV4Nlh5OUFZUEUyOXlFZkZuclBrRm5iQmZ1WHU1dXdW?=
 =?utf-8?B?UnZyallWbTI3aFZlc08vaXRleG5pOWQzM1crSnFjQnB3Zk94b05objJkOE9R?=
 =?utf-8?B?SXlQRThGOVB6U0xyblk2SDZkZmdEQ1BxTllXS3pocHJqTDlab0lrRVNUQzhl?=
 =?utf-8?B?ZGhhS08rM1ZqT040Z21QVUlkZVg2TFd6aFBPVW1EWk5DT2pYYXByZTd4SkZs?=
 =?utf-8?B?a3NJNURuMkZuTmRDUTk1Nkh4bUlmbzNjNFhDV0JiK0FoRERmbHRQcCtERHhU?=
 =?utf-8?B?VnB3MytmZ2FycDAwTWg0OEJhbmNDMDF5OGgva0hGeFJmWmVkL2ZmazFnTGh1?=
 =?utf-8?B?cE9JWGorUHVKY3A1a3dZak1NbXhObHhkQWdVeDJvcVMzalJPWjNlRDhQdHZa?=
 =?utf-8?B?ZFlqNUx1VlVFNFhQVkdObkJlaWhhRnljT2ZjdGk3MVVEOEVyYWI3UzJXWnF3?=
 =?utf-8?B?dlBZWnA4QlZuRS9TVWhja2RNcXRCMVBwZDhiTE51dzlQbFkxS05UT3dKQ0hM?=
 =?utf-8?B?d0ZMYzZ5d1YvaFIrT0VhVU1WYnJpVnZMczJrZ2dCaWp0aXFFVmpVZk1DUWJq?=
 =?utf-8?B?V2UwY3pLbHVwYk5yMlRFcml1MEc5QXpSeTdNbkdvcEQzdnIzeXVVLy9VQjVy?=
 =?utf-8?B?R2lRdkpQMlNFWWhjYmVDVjdERVJPV1Y5TzlIUm9mZjZwTWp1d25aQ3g5VGpS?=
 =?utf-8?Q?9FFhjyfqhbEFdEP1Psvxz+zHmOMKyOCh/tS4M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDAzeEZBTWR2UTEvcEwrTWh2bFNNUUFkY2tyZVhXZEFLbXdKNCs4ZWx1VVN6?=
 =?utf-8?B?VGc2RFI1TnBZVjJ6bmRMUVRkYnhTL1JpZmJMSi9sUTZUM09OWmJ2aTJpcTVF?=
 =?utf-8?B?ZjB2UDBYK29QOFl6RmZSYXRrVk9lK1Q5ZURrQzRyV0NwbG1pSXBMaGNDMXZw?=
 =?utf-8?B?MmUxTW1FSE56RS94K29aVnVpV2hyZFZUaTEybDJXUWV6Ujg0d2x4STNqYVJD?=
 =?utf-8?B?aEQvN2w2azJENzVyQkIwUTZxUlFjVmg4c3M2UEdzUVFDanJDdzd1MXZDSjNt?=
 =?utf-8?B?dm4vRUxNQTNwOE93SHMvS1BVSG1GbjJHcEpsWEEwTy9kWWRqUmUzY3V6TlVU?=
 =?utf-8?B?d2x3Y2FLb0lFNEJjN0ZtNDJqNGphQkdSdEUxSmkydnE5eGtFQ2pGZEh2Z1hK?=
 =?utf-8?B?VHk2Y0lCS2tMOWw2aGsvK3ZqNXlqWU1nK1NVWXdvM3U5S0M5ajV5TjFrTlU4?=
 =?utf-8?B?TmVRN2gwUkc3WG9GeEkzVUQ1akhNSGRrWmFOMTVlQ3piQUhOMWw3QjVVTVMz?=
 =?utf-8?B?NTd4ZmFCZ2hGU1p1d3FuSjZacVNOcVN0SnRRbVZFRmZUN1dFRndCSnozN0J1?=
 =?utf-8?B?a281dEc3STAwaFlpbEMwRlM0MWQ5ZFdqLzkzci96TjlyczZELzkxMXlTbUd4?=
 =?utf-8?B?Mm9DWjN5cnU0d2x4UUFjSFVVQ2VqSjl5NVdoVHBtRmo1TlZNaXcwVkFhcEtS?=
 =?utf-8?B?SU5PcUNZM1M4SUxzUjlpa1hSTGY0MUNlUjRRYUo0c0lia0NKbVl4MlJDNERF?=
 =?utf-8?B?d25uMFZGRmFpbkIwcExFME9WMkZDdzdRTi9ONDhaRFFRVjE1eGpZU0RLR0dL?=
 =?utf-8?B?UVo1dXc2TDFtK3I5cG5SMU5LalJXajVqcHpPemQvYlFpMjdwN3k4Z0dxbHlY?=
 =?utf-8?B?T0ZRNGUrRmNrb3NUUURLcVJLQVdTaEt4RVJXcGtIWmhnd3RFT3VIRHBWcmdp?=
 =?utf-8?B?TUhTS0Fka0FmdEFDWWVlOHA4N2srR1F0UGRaU0NEV1lYeXVYTThQTDBNYkdE?=
 =?utf-8?B?aTRvb2hOMG1pUzlMckd6d25IbWJKa3BKUTgyalBxRkR5YTREMHZoQkk0OEJu?=
 =?utf-8?B?WEs2QjcwWFJiUzNMQUoxejBzbkRCR0RqWTZJUXFHOW5IdmJid2VOdmhnR2wx?=
 =?utf-8?B?eGZLMUVIdUpHUExuS0RiMXhnYlV2eVI3d1JTZEltcFlMWmlaaFc3cEI0Z2VG?=
 =?utf-8?B?akVwL285cXpkdzNobW84RS9ENy9NcXF2YlFHNE90N1NNbFhhUlBHTG9qd0xa?=
 =?utf-8?B?SDRSSFh3dWZyMUU3T2FwLzdGUWEzbFIyWlJkamNrUnllWHU1bFNLR0NDTE9u?=
 =?utf-8?B?KzdYU0JDcDFjOTFrTFFNOGFtcktETnFmWVpOT2xySFBHV2ZheWFMcEphSUt4?=
 =?utf-8?B?K0RNY0VReHdvczNLZ2IrTFo5ZXZmd2lFUXVXZlNkNmMyb0ZYQXlDdGMxOERw?=
 =?utf-8?B?c1FtZ1pWMFlKZmhCUkMzSTlkWGRpK3ZPM0Q4Smo4OXVRZWN0VVVlUFJXQ1Zz?=
 =?utf-8?B?T3ZjU2tjYmdXQlhiZWEvYU5JekpBb0pDV1JTelphSmk2QmV3ei81LzZOYSt3?=
 =?utf-8?B?UjhPclNXQXQ4VmJtbXlFZ0IwOHJDb2VPdEY1MzBnQktEbjhhSnMzbW5FbWdl?=
 =?utf-8?B?Mk9BTEZ3RkNwV2dEaVRQczBVRGdxZzhJaVBURUZGbHlGUWtkM1RwN1F5M1k3?=
 =?utf-8?B?NWtCUFg1SkdMcE5nVXBkUHdRWm9Xd2RwKytpQjRZK1FvZTBPODRTWTAzQlRE?=
 =?utf-8?B?YUhCcDEzQTVhTWd1Ykc0R25IcExKeU5BN0xWblM0bm5CT1MzN1FIanczdXRP?=
 =?utf-8?B?YkVqNzAwejBYMHJqcmgrb1NnRzB6UkJFcWRFM2xqaEdZc1p5eU1ZRUVFT0RR?=
 =?utf-8?B?SWpkUHFqM0RHa293aU5SSkZjK0tHSkdGYXFFdzJ0K2hzZGRNdTdvc3dWQWU4?=
 =?utf-8?B?alhJWGtETmtjM2Z5aGRtdHI3bnlMTmlNTlRLYUFFMWRKTHdoSFpDZEtMWWxn?=
 =?utf-8?B?Ylp0d0Nvak8waWtVTU12blh5a0JzTGdUd2VEZEhhQ2pJK3YvcXR5Z2lGdy81?=
 =?utf-8?B?VGJvNExKQk44T1V4bUxHL2tLODlvMytUcjhuanREa1QxSXN6cnYzQXQ4d1VC?=
 =?utf-8?B?SXhMaXdMUzhIbnBUOGRpeUkyaGpraXFWa3RVVDl1MjIrcFFnNm9mclZ4bFFQ?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a80e34-2c12-422d-df83-08dc9f2efa6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 09:18:49.8236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rsj/ZlGFShkEa1cXxPaPbti+kjYVTDkcbWA4KmAvNf82beemPVW1zpDhrywwFRQX4LRYaONXe9r3ZUU0YFnFjoF/aBvDEokntKsLECpHTB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8512
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

DQpIaSBHZWVydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiBNb25kYXksIEp1
bHkgOCwgMjAyNCAxMDoxMSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IHJlbmVzYXM6
IHJjYXItZHU6IHJjYXJfbHZkczogRml4IFBNIGltYmFsYW5jZSBpZiBSUE1fQUNUSVZFDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBKdWwgOCwgMjAyNCBhdCAxMDoyMuKAr0FNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIHBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQoKSByZXR1cm5zIDEgaWYgUlBNIGlzIGFjdGl2ZSwgaW4gdGhpcw0K
PiA+IGNhc2UgaXQgd29uJ3QgY2FsbCBhIHB1dC4gVGhpcyB3aWxsIHJlc3VsdCBpbiBQTSBpbWJh
bGFuY2UgYXMgaXQgdHJlYXQNCj4gPiB0aGlzIGFzIGFuIGVycm9yIGFuZCBwcm9wYWdhdGUgdGhp
cyB0byBjYWxsZXIgYW5kIHRoZSBjYWxsZXIgbmV2ZXINCj4gPiBjYWxscyBjb3JyZXNwb25kaW5n
IHB1dCgpLiBGaXggdGhpcyBpc3N1ZSBieSBjaGVja2luZyBlcnJvciBjb25kaXRpb24NCj4gPiBv
bmx5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCBidXQgdGhlIGNvZGUgZm9y
IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSBzZWVtcyB0byBkaXNhZ3JlZT8NCj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3Bt
X3J1bnRpbWUuaCNMNDM2DQoNCk9vcHMuIE1pc3NlZCB0aGF0LiBTb3JyeSBmb3IgdGhlIG5vaXN5
IHBhdGNoLg0KDQpDaGVlcnMsDQpCaWp1DQo=
