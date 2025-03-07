Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F5A56362
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE3A10EB15;
	Fri,  7 Mar 2025 09:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Tw/FaHmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F05A10EB15
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j58rFWXqUPWFwVW3BzW13W/fQeGOgFYYLMPGwSiB9MR+VG2qhYcoQKp3ph4+t0DnzkAxXrzFSPSeGN32pZaOtzpZv141Kzt4GuW/Hk1NYxygkQuaQDq0BpZEJD0CiiJ8X+/l+JJfRAGJ1xqKmU8l8tJa5b2jivrPJ79zTlbnzm3J8U0zssye9srgGw6v5OVDwqYL/dYALObH5xYuQSnRDBkcUZVwuf0RH3wdA6gTMb+2uu9YtVpOZF13zMzJf0ZfNDlusKwAPLTBQmV6Vx7wJoN2Wt+wnW8JbQsi/n88q8eJfolpPchl9mqFpXLBuNVj2aiejX0d+awsa0vYDDm48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhz9amCaKvlXohUiQZKdUw+7EMLGinzIQ4Bm/Hzghxs=;
 b=VvW6N21I0BJSGQ/QGW8WsaORnx2BVm5Soba5uxx1XLQRF+zGPp/MNErVdunUPmBQpOcmGfTCmlInxPVxaBUBrIGBHXxu1vrJwPP3+Nq+ombetZoQC187T6LhefND7CfFHJG+q+/rG2iQpH7eXDuPB0wEV0537ekBrU6wfMkFlIhKsg6c1CL8K7KfzeD2o2i8ekLIyWHwkp1uUvMeLgo4gomUgkCHNCV8WzK8gxSWm6zALeo4yPWtD8ZEpsomOS6IGGhlBrO/EyNRahlFWzBFgA7Z+iu0ZhG5a5Ypomni8y2Fex6yOrWwu6bSrwI64HdgyDB60CBxp/tzksMHaqCx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhz9amCaKvlXohUiQZKdUw+7EMLGinzIQ4Bm/Hzghxs=;
 b=Tw/FaHmcfTrP4zi0URuoKeHeNf4HEnG1lS/qaqufveNsg3UwGwftt5hjd4ayoxEpQjBfC1VR2MDfLkPB7WBNQpmOmqqh5xsh7qthnrWDq+d7DeJBMQ/3VaFKFi/JTIEGrHoolfiwGbZFMsK+bfvuPhficeW25fkocaJcdMdUlomgJKAx4F09FwZtUd5mi7TtET32gh21L45504rjDACKIgrKV8lvWEXtbhMy0007hKwZ9oiB9p5qyj2mJdtV1SUn2kh2bKgp5nCgxloti4aI+iQppIC1luMsHpvwCFmvDF+IJpvJ30kL+wK4ZRgoC0qclKKBf+zEzKhKxpIXQfvVAg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB4169.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 09:16:22 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 09:16:22 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "admin@kodeit.net" <admin@kodeit.net>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/appletbdrm: Fix ref-counting on dmadev
Thread-Topic: [PATCH] drm/appletbdrm: Fix ref-counting on dmadev
Thread-Index: AQHbjzycBjhi2DDmUkSWQmlMoWMhfLNnZKMA
Date: Fri, 7 Mar 2025 09:16:21 +0000
Message-ID: <7BE9C1E3-5580-4267-8EF9-2A66D6D85641@live.com>
References: <20250307083702.142675-1-tzimmermann@suse.de>
In-Reply-To: <20250307083702.142675-1-tzimmermann@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB4169:EE_
x-ms-office365-filtering-correlation-id: 328feda0-146f-485f-d348-08dd5d58ba43
x-microsoft-antispam: BCL:0;
 ARA:14566002|7092599003|15080799006|8022599003|461199028|8060799006|19110799003|8062599003|1602099012|102099032|440099028|10035399004|4302099013|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?Skt3bEhKZzhvQmRYU1dFODF3cS9RbHJVelUxaVBjVi9jRlBySzhkVEZuR1VW?=
 =?utf-8?B?SUp2Nk9NSEZUcTBtMWxsNXFnNCtZOWgxVFJBQkl6UHNPY2Z4SDV2ZlAwaFFx?=
 =?utf-8?B?WEVjaEMvSXhKcEpGdnFnN3N5SUNHVU9KNy92dVR0dUdVeFFGTmF0ZnVlSzEy?=
 =?utf-8?B?WHo5Rk4wc0JXQ2wzcEFhQ1pWZ3dwSjBwamorcUt4RUhJdVRzQ2c1MEtDeHFx?=
 =?utf-8?B?V3ZEeHg3MHppMmFZSHhsd3VkY3djVDhLOCt6T3VtT1pBUnFmZ25tZ0tuTFhQ?=
 =?utf-8?B?WEluWC9lenJYSmFQZ0JqQzFhZGhZUTMrcjRtVkEzdTRRM1pwRW0wV3hZd0sz?=
 =?utf-8?B?MnJKTUxDU3hhZkFjY2tOT3JtTFFXU3lURnhsbTdqOGE3SkdYaTJjdUlGcFBi?=
 =?utf-8?B?WDNydUVEckwvT2RmMkorTTNmUk1SNWVlVm9ISWhYZENaU2JjSlE3TEF2a1hS?=
 =?utf-8?B?K3RuMTdLdHZSclRBSG5Qb2c5WVMyY0pUeU5DVEJWSEEvZ2NtMDJYQmJJelpi?=
 =?utf-8?B?UjZhNGRmUWxuRUxIYmM0TGtXMFJ1M0lnckF1cnpEcnZMUTVYbC91dk8wenJZ?=
 =?utf-8?B?OWRWMFdqWlQ5bTFoYnFQa2M3WUpoWXFCS1NZbTBzNWI0N3NWdTQ3MnRVYXVq?=
 =?utf-8?B?czFzaUFORlNNRXpzbDVPbTJFemhpbU9DMXVjR0RqZndtLzh5QkNQa3RwY2t4?=
 =?utf-8?B?dWtoRGNkc1cvN2gzdDlzL2RZcWxSblJwZi9ja0k4djlZMzZwRHkvZHJVYzFT?=
 =?utf-8?B?OXVnSCsxNGZXcTRaSnovTkI2c2I0aWlnYldjYmtZQzFSdVdWdUN1ZDNSMG1l?=
 =?utf-8?B?UVFhVHA5czBuRXJlMGIyak9LMnptSkVacnpDSTN5SUlmVE5uaEQ0dlZ1ZEdr?=
 =?utf-8?B?ZUtIQWFPZFp6bmJaUHRhem9WMzkzT1lvMVpkS05RZm5RSXdnYUt4Yld4cXVk?=
 =?utf-8?B?VGtCaEVJMGltYk1rTXMvanBOSmgwbkpTRWxQTDVlK0xhS2cxOUZzNzNmT3NU?=
 =?utf-8?B?S2ZPVHZJa242TjZ5d0ZaTWp6cU1YZ2ZyRW10Q0dibFd5QzhWamFScC81K0NP?=
 =?utf-8?B?MjdxVlFPT1haSVFlVklMdklLOTQ3aVpsV3B2aDFPeFRxSXo2aW9UdCtndFly?=
 =?utf-8?B?Vy9hK20zZGxvbUUxa1FTWnMxNDRYZlNLYWxiUkZXUHVZMitOYTJ0cStycy8y?=
 =?utf-8?B?U2tyYnIxQ1AyOWtNYmRUZ1YybmpJL05DTUl5Q0VKZFlJWHUzSzBueEg1L1hv?=
 =?utf-8?B?Z3crOTM5S2tDZHp5S0xYcm1lS0ltT3hDd3dMYVFVRGZwYUVQUTEzNk8rNTRy?=
 =?utf-8?B?UTFudUx1M1MyUkFWeFVINE5wYnhwQVVzNzNpeFNyakFVVWl5MEVhRzhCZlAy?=
 =?utf-8?B?bVR1NWhvWEpKOXpJVnF0WWI3KzEreGtlUjdpTElHeHFGakZhaEE2VUlxeFJ5?=
 =?utf-8?B?allXUHR0cmZKb1l1ZlNjd1dyRUZ4MVUyUk1Na3F0QWppei9TeTc3Z3NScGlP?=
 =?utf-8?B?ZWVmZ0NxQ2hOUVpybHRjejBCdGF4T2ZDZVFqdGszSnpnaTJlaDh2S0hSbmNv?=
 =?utf-8?B?b3VpN0pVSWtpOUVMRVBSSFVsMmFSaG1maUFLdW5RTXp5Zkt3NTRxcWtHNVhp?=
 =?utf-8?B?U0Z6Ky9WWTdnYWRjb3QraFpQQU9aZUE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekN4ZERncUp3VXBzWDZWTXlteVM5bkM1N1h0VlNQY28vV3YyVWZVT0xxcm5i?=
 =?utf-8?B?QUpXTjFlck5qbU9NQndoaHlDZ1UrWFFGdVpocDRwR0xWYUtMcC9pSjVGeVpM?=
 =?utf-8?B?MzhLVHZMQklLbGt1Z3F4M2RBSmpRb0pLNGJ0SUV1RlUzeGl0b2MxR0owVzF2?=
 =?utf-8?B?Q2Z3Kzh0ZGFUbW1aaklTOGRUOXVIT3pMVmlMNjZoQUVwOGQzM0FYR1BJMkNZ?=
 =?utf-8?B?d1JLQi93cUdURWF5bDNLYzdpMnJuNHRpZ1FKc09tejBzbEJlUnh1emRLdU5r?=
 =?utf-8?B?c2lQKzhlMXJXN0dNeWdPdU1BWWZOaDhEZ3E0TGM3dlA2QVVyQ0g5WmxVWHYy?=
 =?utf-8?B?dGMwbzBObnk0dkMxU2hOVEtKOFY0c016WVRvektsUmdBNjA5UldRb3RXZS9o?=
 =?utf-8?B?SjljK1lMRWJJSVpaOTZOTTBGYjkvVVB1WkRXU3hVUUM0Q3J4ajZmb2FXWjR2?=
 =?utf-8?B?ZENISldRZmxwVzBzbFlLTTlUOEU5NHo4eHVya1VQMGtXdG1yOXl4MFRDR3c3?=
 =?utf-8?B?clczQ3JKTzJNaXBtcXdMdW55UTZubFU0cktWM2VTVWZ1dlJ0cjNONUg1OWlY?=
 =?utf-8?B?UU5sZHNXa0t6UWNUVHVyT1ZlNllBRmhIZUlyTVFSZzlTZTE5MWtKV2UvcWdw?=
 =?utf-8?B?aVpjajVyaDNVanhmTXczbVVGMjhXN2tFcEV1WFAwYlJialJFK2RJc2NoSUhF?=
 =?utf-8?B?QmwreUhWdmRIU1NPRVRjaUg2WlY1K0RCNDFPZlhteFFFMzJTOHNKb2swWlFB?=
 =?utf-8?B?MDRKZ3BiNmhuWUlqLzZtV0lpV2FqeVZoeURSMzBHc1VVSlNPby82Mnh2Wm1N?=
 =?utf-8?B?OUZwckt6c0cxYTNWSldZeDFMcmlmam44MXlxNjZXZXRxVHRnWHFGdG90OVNU?=
 =?utf-8?B?dmMvL1BUR1EzQS83K3lrTU1XS1JmSXI3cGM3RUo2VGprc1MyTDVGVTFiSUs1?=
 =?utf-8?B?YWZsc083Rk1MdGhvTWNkc2xVQndIblVjZ0h2TUM0djhYQlMrcDBIMU1RNnV4?=
 =?utf-8?B?dWd4QS82SmhxeWJvazZzMTBrRS9LNW1aU2pTRHUxd3ByQ2E3OGsxSmRGSUlu?=
 =?utf-8?B?RnRuY1VhSGFEWHZzNkVabUJRdGFTMFc2TGN4QUU2RzNmWGdWRnROR0JTeDhG?=
 =?utf-8?B?SEhUa3I5RUZVLzJGVi9PelFMcTJIYituOHBwVS9xRVJBYnRnZm9JL0U2K2tZ?=
 =?utf-8?B?aXZQY3doelBERVpob1R5TkRPeDE4T1JBS3ZGNGVDWDFqSE44dnNuN0x3MVdV?=
 =?utf-8?B?d3hCOWwxSUN3OUFnVHVmV3lGQlhiMkdYZEpkZXQyS3lKdW8wK3dNdkNKWlJ0?=
 =?utf-8?B?cmdlRHhaVXRMaE9idUs2bHg3MUR2OEczZnFxdjlWQS9JQ3FTUzV1V0VjUzRz?=
 =?utf-8?B?Qm1CWElrbVNqdDdxTnYzeGw0OWUwZGhDSis1TWgzZGNGZ2M4NlVBdDBzblpj?=
 =?utf-8?B?M0k1SDUwM2tTNFBoV1llb2lkdmxCdWs5alB2Qkc0RTYwYWpreXdIOWdQTzdR?=
 =?utf-8?B?NDRveENUQTUrekJzZXd0TVgvc0hkU05jRXB2SW5tNmhocHlKaUVqbEoxWGRa?=
 =?utf-8?B?MS9nRVhUV2RTV21uVEdHY3JieTZKeUFiSU9nR0xtMHNUc3hoRFJSTCt6aWRl?=
 =?utf-8?B?eUNuS0t6dkZ3ZkhXOWVCenVUdnhTcE9WU2pnOXVTbTNSVVh3WFlxNlI2YUVX?=
 =?utf-8?B?N0FjaThNSmY2bWx2QVVzMlNaRm5wMmdUR2E1M0tEMmpDRXIvQVlzYjBUeitU?=
 =?utf-8?Q?56+WFnFH7TKe9IC2DHggu5UAua+Y+0p4Bntar3F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB87EF00084E5B4AB89F62CCBA1E064E@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 328feda0-146f-485f-d348-08dd5d58ba43
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 09:16:21.9872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4169
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

DQpIaSBUaG9tYXMNCg0KPiBPbiA3IE1hciAyMDI1LCBhdCAyOjA24oCvUE0sIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+IFJlbW92ZSB0aGUgcHV0
X2RldmljZSgpIGNhbGwgb24gZG1hZGV2LiBUaGUgZHJpdmVyIHNldHMgdGhlIGZpZWxkDQo+IHdp
dGhvdXQgZ2V0dGluZyBhIHJlZmVyZW5jZSwgc28gaXQgc2hvdWxkbid0IHB1dCBhIHJlZmVyZW5j
ZSBlaXRoZXIuDQo+IFRoZSBkbWFkZXYgZmllbGQgcG9pbnRzIHRvIHRoZSByZWd1bGFyIFVTQiBk
ZXZpY2UgZm9yIHdoaWNoIERSTQ0KPiBtYWludGFpbnMgYSByZWZlcmVuY2UgaW50ZXJuYWxseS4g
SGVuY2UgZG1hZGV2IHdpbGwgbm90IGJlY29tZSBkYW5nbGluZw0KPiBkdXJpbmcgdGhlIERSTSBk
ZXZpY2UncyBsaWZldGltZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBGaXhlczogMDY3MGMyZjU2ZTQ1ICgiZHJtL3Rpbnk6
IGFkZCBkcml2ZXIgZm9yIEFwcGxlIFRvdWNoIEJhcnMgaW4geDg2IE1hY3MiKQ0KPiBDYzogQWRp
dHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4gQ2M6IEF1bi1BbGkgWmFpZGkgPGFk
bWluQGtvZGVpdC5uZXQ+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IC0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdGlueS9hcHBsZXRiZHJtLmMgfCAxIC0NCj4gMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQoNCkFyZW7igJl0IHdlIGRvaW5nIHRoZSBzYW1l
IG92ZXIgaGVyZToNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjUwMzA3
MDgwODM2LjQyODQ4LTMtdHppbW1lcm1hbm5Ac3VzZS5kZS9ULyN1DQoNCg==
