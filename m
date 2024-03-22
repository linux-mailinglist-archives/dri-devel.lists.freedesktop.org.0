Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2E8873A1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 20:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4610E05A;
	Fri, 22 Mar 2024 19:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YmwPiMol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A587110E408
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 19:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yw2JCVVbLnHrTvufjwtvoYr+FvoJKBCtq1gr45N42dttwpJrppJpc6B3gxGkSo4W0WcU4KA5Uui5ec0sp/Bft+Kd/Yil5Y4dW6lWehBYcOMni3zRHQaWnIk+ItuckBnDpn3DOjia6FX0vFIXi+MPwAWu1GG0kFzGCXm+6NO8c9KQ3nqQSLxxU+Uzn21r+na+vhHXrkdYn7rHvvZG28sToiksKwCseCqdtMxDDVEuB4vxajNh+mjrf5j2obEgx2oJ/WXSDFOVlFBrwx7eL2nKXHMGRMmMpVPXyX9iFho42tmxIjqtEtZuJbKifJAoqAB3L+jKCoFOcRXvk6KaZCc/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI/lNEWSejkn/fZc3lbWcX5oiT0IGTQyzFGpP1W/5l0=;
 b=UTQQxodqTDENZa/Sa3saynaH8VIPuHUd4UiA7qaebrE0RxyEUnbgpQEJ6kuPKaInNQ7x4QFeKv/ducsmiH0tDqfyyufLzeTHd+iN2nrsyFxPiVSdt9Xp3NgRt0mC7fCb+zujFdsspwCzGQjB/q03Osmj/hqOuUMIYZTxtZUuoI0SVbuJ1j8Kpfy+USMkB3YMgRL6NsbndSKEudSFQ6xO1n/bMdRnkTNb5YQsCPwwA+MdkWH3ZHrQ2lMnCUn5OgBKvN8iA6q52V2HJ65xXwWHi87kIAUHOPnim/xa/IhKdRdvs6sDZowAN0XwYyCfiyBU+Qxzrz5huYN1wJuPXpBrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fI/lNEWSejkn/fZc3lbWcX5oiT0IGTQyzFGpP1W/5l0=;
 b=YmwPiMolGsIdf6yL6d6o2HKG8RKM62Qhx4fK+nZ0YPO/3ndzin59tesvyJdyU3Gu/RIfQN3kvkRtPfigtH3bSnhcAc0sbvi9UuSVOjXS8+DEsJTP1qzTAutc3ieQLyCzOoyQqJnrwfBVUnZSzwCREJ8rUmTaSvnwdhB/I/xrR/w=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 19:12:19 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7386.031; Fri, 22 Mar 2024
 19:12:19 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Thread-Topic: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Thread-Index: AQHae9CWOJYT8G1vaUajPKAdUatgu7FDRIUAgADPWeA=
Date: Fri, 22 Mar 2024 19:12:19 +0000
Message-ID: <MW4PR12MB7165889CE7F27A3F0B29DC7EE6312@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
In-Reply-To: <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|SA3PR12MB8763:EE_
x-ms-office365-filtering-correlation-id: fb9f4ca0-7ce0-4e2e-75d4-08dc4aa3feda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kKF98bOiHsQA3dSiouXtCAOT05qkCF2T99XI1GiIXI/uaAEhKNlAQoTYazWrMkvAxXZjKAYsGw1uP4UoMEbMcu2wh2CpYiOG8RBeSiArqyyyvsaePm8UFO9Bcv6LgksdRlIUWqaWiv22rBBqC8uLapFpeC4cfZkoO2bM2N9pxq/Q+K+ykf/Yms8bq2FNJJe2ltGX/7eRzIkOcZZkWJLRKYvE31flBN8F/CiHXCC5+q+IGd3LYYvNd4wK8y1YRQAWfNXO9Mf2I4CBAbywPPBFNRjE06sO59I23+eSj0wQ0te+ZoqPtl31RoTzkgUrcvSCstaK8gGrfL+snPygC/xtDebuNC+At58xdLJel4MKVfUf4kdaZaTRfF9UidR6ntTn/qKqhVgUX8/2jJIgncocy6gcZvhxVgr7ay1DPPmDnd1ZFDSe0XMnQjRCdZmU6b3FAn0P+4H8GZ2zq6uQlQp2ZUJ4TGPHx6EljWcNMAjTCOXoxg7f7H/hAgWwhh16KN1QddT7vQ7iFJRQJL8W6dZ3CNofHWbp8Up9scUg6EboFXZMNiOc7W+Pe+KxDZ0iJxIDur39JwbT5LmpTtDfEXTVqyFxycQHmz9y1Ma2+6ZL5rruymCbw274XmaRoXGXAUPfuohzfxv8Nglzz6vwiCvQFW2n8m1eoku2VCg0IDdq1uvsLOWUkBYCyD8uuwl/y1kQ4dOPWgIiqWOfccQEWvB52p/uGdvCcK+KIQiq4ZoLwh0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2ZDbnovVDdLWUdYSVpjMkNkQnVqMk5Ydm5QNk5RM3RpODFBUUpxR3h0NlF1?=
 =?utf-8?B?Mm1RRXdJSzJ5SmJnNWxxRXVQNUVZS09yeWpiZ214L3RBTnRHdmZMRk9JR2FH?=
 =?utf-8?B?SEViOWR3c29YZjkxSW9uZjRKTGduZlB3M0FSNkM3ODhqYzkybmxydG1XbVN0?=
 =?utf-8?B?VEF0SDd0MzBTdWJBMXhlZ3hNU2EzdENCajdNWGE1UDZPeGViSHpaSlorOUFK?=
 =?utf-8?B?RGF1MmUzeXdEZFJIYm9kN3RkN0lTM2VZdHc1Y1doWmN6RWlvQWFhSCtPcU96?=
 =?utf-8?B?VC9BQlhWaUdZeUVZWENETER2K01aTmFza1JOVzd5OGZoaDFDaHZXalVnZkFy?=
 =?utf-8?B?L0orQjNpbitySGZoZmZVbEoyMUoxdzgwb2NHLy91SVdENGpaNGRSZ2NJTTBI?=
 =?utf-8?B?YXdMVjRzTk52SnVvczVHWUwvbkZRNTB3WURtQkdoMnNuRXFPckNFSHcyQTNl?=
 =?utf-8?B?RGFGK2lFT1MzSnBBUE8zVkl1alpCVHNPVG9ldmtFbUFBWlQwQ0x5TVRTTXRY?=
 =?utf-8?B?U1E4VkIzY01GTFZmcGwxbG1VVGY0Z2xDMDl5L2xBeGxieWVITGVKMWNEcWdy?=
 =?utf-8?B?eHhWVkJPTHozdVBleXZKNXlTZ2VnaFJ5TnFyb2kwcnI4a3pjWjIyVk9Ddmpv?=
 =?utf-8?B?T1ppWStWQTM2MkZUZFlUUnh1Q2xkYTNwQzRUUjZZNnpvZXpUWGhzTzBqbnpp?=
 =?utf-8?B?WlNFUFg3cFRZQWx0aHZmM0YwR2hZTnpOTmhpWlg4MXdPWE9nOVVnSkJVTFpC?=
 =?utf-8?B?Yk44dGpwemd1K3pDWmJVYmRTcnVBYldVNlZYbjROWHh3WHVUemZzRWdUSUEw?=
 =?utf-8?B?c3lML1FrRXBqeGhML0wwdkorRUx6SlB6MkVOUTdOc25hTm5nZlZCVnFocU1V?=
 =?utf-8?B?enhYd2NlMWdYYVN3Uytod0pFUmMwUzlRLzdRWXVaeW9NWlR2ZERlaElqOHk2?=
 =?utf-8?B?aStJWDhla29NT2lyK2NvT0p3K0VLYy9hS3NoNVE3L3pLTkRIcmV2MWwzcmQ5?=
 =?utf-8?B?SG55LzZWVllwOEVCRjBFeUNyTEZicldGZmpPMms2S1RrdFUwdmtBNXBDcHZq?=
 =?utf-8?B?N01WL2ZycEpTMWorcjBXQmloVGRtRGdnb0NOMmZ1NmkzVjJtQzNmWUxybFRp?=
 =?utf-8?B?bVdLLzRiMERVUkZ2TFRiU2NQZzR5VjJRdWR4aFQ4cmtIM0lJLzNaQTFyTE82?=
 =?utf-8?B?MU1NNVIyV09XcmdhU1hYRXNaaGdYTzl2bEsyalRlclM1OHY1bXNVU3pWWGFU?=
 =?utf-8?B?TGRJZDQ4eWhHczVRNThrYUN3bDNZSTFueU93YnU1NXZVSjJjYzNVTHRVT0Jn?=
 =?utf-8?B?ZDNHUWpqbkdJVkVEVXJMcno5V0FFd2dHNk9KelJaSHpvQVg1MnNOcGxucHpl?=
 =?utf-8?B?VjdESWZJK0dVZnlqS1YxSXVWa2g1cFdiVndEUWxwQ0V2YXJkRmhtOS9QVjlN?=
 =?utf-8?B?RFlRdmxxQTZ5aUFFSGpkajI2MlRMUkRtbVpNMlFQc2dXZWRoQ1J1dERhZmli?=
 =?utf-8?B?YnY4Tzk4UjV1RjJNOUdRTHNhSERhNEM0M1haRGMxWUxpY3VEejJBQitIVk40?=
 =?utf-8?B?RkVHWThSQTBPZVFVNXErbzhNNUtQczVyYm9SNndQaFRLYnBxL21RSlZna0lF?=
 =?utf-8?B?NUZRMjFrY2h3N0g2VmIxZEQvWDE3MUR6UFVnTEkxVDRKK2F6eVZRYmRFOGpC?=
 =?utf-8?B?cDNnTmc4djZaYkVVbFQ5K0tIQTBTbnlYZUQxSlRCTUNZMHA1Vklmbm8ydDds?=
 =?utf-8?B?cHRZUnJBUVozY3h0UUc5bjRaVExqMTR1Vm9rUGJ3ci84WG1zeHljeEpBSjFw?=
 =?utf-8?B?b2xvVEFMTm5QUVdGQm5IeUhwQnV5V1JQZXNvL09YL3h6VWFwT1NOU1YzTHhz?=
 =?utf-8?B?b0ZSSXJCRWlLSmRRTUtWeUR3cEdoR3FQOGRnZGU1VWRBVkVVNDVxNkNld0I2?=
 =?utf-8?B?U3MzMUxuTDJXTldVamYrdFBMUytlbjQ0MEFENXEzbC9CV21rbXh0bGw2Kytz?=
 =?utf-8?B?eWlHYWI2SkkwWWU0b0laTmhXSmlsVGVlZmRmV1VxbEVmVnY4ak9GWW5PWmV3?=
 =?utf-8?B?cWVUOTdxSzFJdlgyN01hZ1RMTGd5eitDRHdaNENWeUlKL0lCM1dFcXI1NGNt?=
 =?utf-8?Q?4sxo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f4ca0-7ce0-4e2e-75d4-08dc4aa3feda
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 19:12:19.5430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Dd2Kzs4G3OOVIM+IgrRJx+WgqpCvdRwu0zygXrmllOZ5/uVgJmmqh1LAHOJmdqGWIiAWL0flG9iFbjv1NqCkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763
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

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjEsIDIw
MjQgMTA6NTkgUE0NCj4gVG86IEtseW1lbmtvLCBBbmF0b2xpeSA8QW5hdG9saXkuS2x5bWVua29A
YW1kLmNvbT47IExhdXJlbnQgUGluY2hhcnQNCj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Ow0KPiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFpcmxpZQ0KPiA8YWlybGll
ZEBnbWFpbC5jb20+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBTaW1laywgTWlj
aGFsDQo+IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFq
ZGFAaW50ZWwuY29tPjsgTmVpbA0KPiBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5v
cmc+OyBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz47IEpvbmFzDQo+IEthcmxtYW4gPGpv
bmFzQGt3aWJvby5zZT47IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+
OyBSb2INCj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3Nr
aQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5IDxj
b25vcitkdEBrZXJuZWwub3JnPjsNCj4gTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtl
cm5lbC5vcmc+DQo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJv
YXJkLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IG1lZGlhQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDgvOV0gZHQtYmluZGluZ3M6IHhsbng6
IEFkZCBWVEMgYW5kIFRQRyBiaW5kaW5ncw0KPiANCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9y
aWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3
aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0K
PiANCj4gDQo+IE9uIDIxLzAzLzIwMjQgMjE6NDMsIEFuYXRvbGl5IEtseW1lbmtvIHdyb3RlOg0K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL21lZGlhL21lZGlhLWJ1cy1mb3Jt
YXQuaCBiL2luY2x1ZGUvZHQtDQo+IGJpbmRpbmdzL21lZGlhL21lZGlhLWJ1cy1mb3JtYXQuaA0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42MGZjNmUx
MWRhYmMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9t
ZWRpYS9tZWRpYS1idXMtZm9ybWF0LmgNCj4gPiBAQCAtMCwwICsxLDE3NyBAQA0KPiA+ICsvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBNSVQpICovDQo+ID4gKy8q
DQo+ID4gKyAqIE1lZGlhIEJ1cyBBUEkgaGVhZGVyDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdo
dCAoQykgMjAwOSwgR3Vlbm5hZGkgTGlha2hvdmV0c2tpIDxnLmxpYWtob3ZldHNraUBnbXguZGU+
DQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5DQo+ID4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAyIGFzDQo+ID4gKyAq
IHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPiANCj4gVGhhdCdz
IG5vdCB0cnVlLiBZb3VyIFNQRFggdGVsbHMgc29tZXRoaW5nIGVudGlyZWx5IGRpZmZlcmVudC4N
Cj4gDQoNClRoYW5rIHlvdSAtIEknbGwgc2VlIGhvdyB0byBmaXggaXQuDQoNCj4gQW55d2F5LCB5
b3UgZGlkIG5vdCBleHBsYWluIHdoeSB5b3UgbmVlZCB0byBjb3B5IGFueXRoaW5nIGFueXdoZXJl
Lg0KPiANCj4gU3BlY2lmaWNhbGx5LCByYW5kb20gaGV4IHZhbHVlcyAqYXJlIG5vdCBiaW5kaW5n
cyouDQo+IA0KDQpUaGUgc2FtZSBtZWRpYSBidXMgZm9ybWF0IHZhbHVlcyBhcmUgYmVpbmcgdXNl
ZCBieSB0aGUgcmVmZXJlbmNlIGRyaXZlciBpbiBwYXRjaCAjOS4gQW5kLCBhcyBmYXIgYXMgSSBr
bm93LCB3ZSBjYW5ub3QgdXNlIGhlYWRlcnMgZnJvbSBMaW51eCBBUEkgaGVhZGVycyBkaXJlY3Rs
eSAoYXQgbGVhc3QgSSBub3RpY2VkIHRoZSBzYW1lIHBhdHRlcm4gaW4gLi4vZHQtYmluZGluZ3Mv
c2R0di1zdGFuZGFydHMuaCBmb3IgaW5zdGFuY2UpLiBXaGF0IHdvdWxkIGJlIHRoZSBiZXN0IGFw
cHJvYWNoIHRvIHJldXNpbmcgdGhlIHNhbWUgZGVmaW5lcyBvbiBEVCBhbmQgZHJpdmVyIHNpZGVz
IGZyb20geW91ciBwb2ludCBvZiB2aWV3PyBTeW1saW5rIG1heWJlPw0KDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQoNClRoYW5rIHlvdSwNCkFuYXRvbGl5DQo=
