Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0D52B316
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533BB10E2ED;
	Wed, 18 May 2022 07:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEA1112A25
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 01:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h98eHniYqwri8KBP9isrDV/4Cdwpugo33XKRomTVEa9DSezwXfIISPE0sDkuC7IvFCnfecTHM3bCVOnJUp85pmKVxGdwKzHYqWJaOBLU1P8rcsNRbLFmp/3M4kVkzUMFaD/Al4GnK7McXMjEjHejuCq6mwVjM0EgI/A3Gazv7w1zKEork0Va3I+F+XaGY+1ZIlL5WtkMflXfUWPHiSiDIT6C9HCebEOrUl98sf8jAeien4PBIz4m+xLgK1pZtqS8O0KZvWMDI5RTt0ZRq9KeE6SHYJtZzSvgiK1VeGDfmVgdt4gjrAuTMba55jHTIVo6SDbs0sPXAZiaMT/cMSNWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd6N4p9m0zXSISuysmRk5gY+4qH0pNmz+YqM0OF/Kc8=;
 b=LKiElAMNlUjeHqa6DnTqSiGvAAuUNsK1itcjezPSpPXW9wJeXVaoP89qQhFjtXqYPDLcZi/iwxJkayepmYyzEoKLySPDAwqO33t2nZWzmZVBmR7xfbHx+6ZrdZmrF48em2T/73For4f45JpCzzOydguxjSdk8byzCKW7AtU5ZQXpk6M+MDoSgak7g1b5QTYVFdd/pWPwUWjNXAL9A5GiQcSTN1nzQFFm7OqP8vq45nqFA1JvNWeq6+PUMKQeToSK9hrEU3jKGjxCbmlb9nBZTrTgu61LIxxBgs9VcYwYKmfxkr6tDjfZiEcrvOmbaxC8ubEq0Z4ITEBlVK4M1ojKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd6N4p9m0zXSISuysmRk5gY+4qH0pNmz+YqM0OF/Kc8=;
 b=pzzYQvJRJZ/8XETQ2VCuf2KvnFr+UGyvFi9MtDHciCEcCCmBPA+0VDWz0S/+o8s4DAJPbf3cA+TJYIKgaI2DDchfn1kaR0PKPFDzY5Y1dioPU7UGWIT4kWIS1lIaHvXgD17IDGkWvVGPpC/9hqgIZwoAofpIC7lcsBZMxlXAwZi0JRMIjmst5d2KfoVA2W+Q+WcRzSOsDCdgWbaL5PauWxjEluTMFTkbPVZIB89YHepQtCGFccT2WVO5zOvHYsD5IdCH8LDnewnZyTqjSzgDuP3GyBqe2vu83GejE9+RGnu9G98lYmeb9k+hNe9NvdY7Bex9TUm1rjtZxU2rNJJxWA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SG2PR06MB3562.apcprd06.prod.outlook.com (2603:1096:4:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 01:59:29 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 01:59:28 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Thread-Topic: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Thread-Index: AQHYZpbGEu2wf1faFk6PWys4YB7zt60chHIAgABrQWCAAeOiAIAB7Q9g
Date: Mon, 16 May 2022 01:59:28 +0000
Message-ID: <HK0PR06MB32020539063F8A7C5D56E0B980CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
 <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
 <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <567d135b-3d40-9958-e000-1357020b5650@linaro.org>
In-Reply-To: <567d135b-3d40-9958-e000-1357020b5650@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1c8d201-3baf-4009-cae3-08da36dfb62b
x-ms-traffictypediagnostic: SG2PR06MB3562:EE_
x-microsoft-antispam-prvs: <SG2PR06MB3562AEE2A49FCB03D5DCA34280CF9@SG2PR06MB3562.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dlDJ8hzKOpUiRMlSpV7o5arkxbrsjD1zj/YAN27O/DdQLwGE9Q8wVCBVIUEiE0DYGpXvuFNOJjj1Zk27BO6ILOrgj2VHd6keOyilsPE1mepiwn5zdCuVgwavvz5CprMB49C12FEGXREZYtYMI0lu4i/CP4fGtt90qULHrYmh1SNSRrYXBdNRMAHw7HxO4K5mt16Ly5KXBWq2v0LhbfawRnCVLCmHIbAVaQlCh25eIZ4ygTybm6S4KHxIxMIR7fM2eHPKO51XYxoPzWjNw9fMqYjT1Z9LKqs2StjFYDElJuOgRyhT7pMbRxXA3pE4rpIhZU1Xj9fC4eU9T7P7V7qsDRjGMRkNchguK2/0MTrhCEtcfiogIH4poL9pVFvWNbSsY0qqWhsz+2M69smpSOkVxyK1lSPCE+wzbcRzqtbCnoslrDYr2/6QRTuJggQKPdi3F2y3Tlg1/38dAt9+Iphv6kij4/pOr38OfleyNT/8cWNC/kmmj5HoEMLa++fLt4IJh7PFo70vBwPnSa1/ex51Iu1/iqrjSUrPJ1+tRuZAJOoYIV68emSONesZPBlPDyCVCXY11qD2GscomdIO2pSmgOtWFVJEHDNtW0UvMPZed4mVsymz7Evzrr19hrkTsEv5H3jUio3zx4uuSFAtPfcRN00m08TXUzu1BENXitzpt2u4c6VJb3lrUqln8bRx1uTZoXPRsSf3fOwIzBM9rfakowXepycGzrDagOyB4lmuVF0PnxIyRIcc74+7/wCoowwWaUqiwonwcqa5KbeHR+GnZCqlkqa4L1Osj1fqgo5a4ODm6L+YqjxuXvKHdQhE173x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(346002)(366004)(396003)(136003)(376002)(316002)(83380400001)(186003)(53546011)(52536014)(66556008)(110136005)(9686003)(26005)(7696005)(55016003)(6506007)(54906003)(33656002)(5660300002)(86362001)(66946007)(76116006)(66446008)(7416002)(8676002)(38070700005)(921005)(66476007)(122000001)(64756008)(4326008)(38100700002)(508600001)(966005)(71200400001)(2906002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?encwd1BMY2djb3BjNUZoZE0vSDhKaGpkUG90SXUvYkl1OVR6RkVjZWgybXlW?=
 =?utf-8?B?QzRxZEx2c1Z3SEFVbW4vR2wvRUZIRWErK0xHTEN4TGR0a1BUZ0VoWVdzOW9l?=
 =?utf-8?B?V3VoWFBzTkpvZmNIM0lMcUZSM1JSc0JpNnk0ZDkycXE4bjNUOEIvWTIxRlhn?=
 =?utf-8?B?eXgxL2lYbk1UNmc4VjdUa0VPczhZQTI4Vjk1UVdFb1ZqdkZkZUhpbE5RV1hM?=
 =?utf-8?B?L3EvUEhqUVg3MWNjelhFM2JHNThyeDk3dzRmOS8xNHdsZzBiS2dOQXlGaERj?=
 =?utf-8?B?eC9Zc3BRS01DN0NDQ3VYa3JSM0NmRzlNSFltYzZwV2RkMUNWRG5jZ3N3TGJE?=
 =?utf-8?B?dzZkOGVRK0N0QjhWaitCaCtVckJUR0RCQXRhc01TL1NLT1p0U0pqZkVFMjFH?=
 =?utf-8?B?dGNYNnVHWGhkamtjMEJERDVCSGtjV0haTXF2TFpWeTRSMnZiOW5PaGNzaEN6?=
 =?utf-8?B?WHJVcVVNWDl5UDRXalBvQzVSTlZGL2d2eHAyQWtIaUNacFR0eUFweFB5SWo4?=
 =?utf-8?B?ZVlTbW9XTUlWWnZTVUZaRDNQYWt5NmIrU3JWbngwMHcvaDAzQW1KUFNwYmhO?=
 =?utf-8?B?L0Iycm94L25RY2RNdVl3aEFCbzlsVENoMTE3b1RVbVlBUGxrMGdaZERDK2FR?=
 =?utf-8?B?QTVrdldxMVRUWTdLQ0R1WjRDcFJ0TVpSK0NSdVNsZkVGb1d6c0wwbTU5ejBm?=
 =?utf-8?B?WUtVVTd1cnhuSFFhQXJ3MmZYV3JFd1FtYnhuNHBNNS9tQWpqanRUOUZMTkla?=
 =?utf-8?B?UVlVL2x6VnRJT0VsdVkxZGdiSlhhM0VkWk1xUXNRWS9tdm1BWlFET2pJWjJz?=
 =?utf-8?B?d3pKLzJOUGNFbjhlRGlYb1dTdFlOWWcxVU5TQ29XOU9WZHVHM0FNMGVrZzRj?=
 =?utf-8?B?QlNUSEtwNnJlSjlEUjdsZjc4T0Era2tqbFl1bldpeU54VVlsWHZmdHJoM0pJ?=
 =?utf-8?B?aUV3SkNrOXJzM2Vna2gzRzBFZmRiYW1WcENDZVhXNXZ6UytNbmhURDI1K1FT?=
 =?utf-8?B?QXl2c3ZTRkNVL29Weis0dmJDR08xQXBxODVycG11K3djaXNhbVlvWDJOT2FU?=
 =?utf-8?B?dFE1cUFEUkE1djg4QmhRTlJTajNvUmlCaFcva1d5NzFxMmtia2dMTXdiR3RZ?=
 =?utf-8?B?QmY4VncvdE92QUlxRUxhbE1PWkhGcm5lejlubTBKK3NTQ2p6TFNtL3A1NHlC?=
 =?utf-8?B?Y28zMGIrWWg1U2JUYmpEdDV2NlFVT0FXZTdZVmVGSkt4T0JFUXlaVkVQTW4z?=
 =?utf-8?B?aWtEbkVraTNmVnVHaXE0ek40a1lsemR0dDJleit6TElIeE9tYnhXZVZoaTdQ?=
 =?utf-8?B?SVZhVUJaNDNFOVo0T3pmSlI4eEhwK3YrVlp1YUFKYTNIS3NZcEl0bWtIV0kr?=
 =?utf-8?B?U0t2cUhZNlIvY2NuV2Q0SlA3S2lKVmx4aG5qMkdnLy8yNEhtdytCTlNOR2dl?=
 =?utf-8?B?Y2pWWHg1alRjQXR3WTZDS1YxSGQ5QmdTTWZ1TE14MHQxTTRWdjcvbFA0a3Js?=
 =?utf-8?B?YlpkV002S3NnSWNiVWtvZWQ1R0hKT0NPckpNbXZyVEtJRXI5L0tXaDlGZGty?=
 =?utf-8?B?MTJQc2tqRnlGbUhhRURVamNIZFRwV2FzdjA1Vm9IS1ZWNEloNGY2Q3RrSXdY?=
 =?utf-8?B?c01idmpkZXpQeUhvbnpDMnA3bXJkd0lJMjUydEduUTFFN0ZEUU1FSy9GY1Ir?=
 =?utf-8?B?VVZ4UWtKb2hEZUtzNlhPc2NNd0lnbzV3MlB3aHkrcDRKVTdpb2QxVWhBd25R?=
 =?utf-8?B?dTl0UG53eWk3cE5nZm1kalovb09xWG9sRVVEYVp0VElLMmtRdDVoS2hxa2tz?=
 =?utf-8?B?WS9WblkrRFF2WHIvYk85RkdlcVNCM0lpSGI1NU9oQ3FRMThVcXpKWUNNNHZp?=
 =?utf-8?B?M0FHRUJmRkVCQXZ6ckFId1hGSGV5aW82OVY4a3V6cVZZOGphZFk3Y1ArMXNF?=
 =?utf-8?B?c3NRTExnaHJKdURuUm5YcUZVaVd6UjU2cjFzOC9oWG52OS9DUTBJWnBSM0tI?=
 =?utf-8?B?ZVZtb0phekNrTUpDQTdpSVMrQ0pDSU55dEpmMHozSVB1VFMwajVvcVFwV3dk?=
 =?utf-8?B?cjZ3SlZOLzVvM3kxQzZRUE5ndGcvSUROelFqeElpWWlBUVg2bUFzVHVMbXN1?=
 =?utf-8?B?cC84UTBzejlaK1FtY0tnVnpqRmQvN1BmYlQ4bXppQnFWaUdBR0tSK2tzK0c0?=
 =?utf-8?B?QTBjVEhySG5FUlhvdjBDTWQrdTJvZjJHUFZENkprMjZSUEptZThFY1g0Szcv?=
 =?utf-8?B?SjZaWU5vNHhUaTFLKytPMXdnU3NVdGFMU21JTm8yWDNvQmZubWZqQkdjQXMx?=
 =?utf-8?B?UE55OE5ncGI1Zk5oQXB6a2YzMHBwUUZVR3pTYktHNUU0cXViRURKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c8d201-3baf-4009-cae3-08da36dfb62b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 01:59:28.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCTyyQ75JIWkvNrenEhIC/7MByrZxB5ylJDkOFFdpF6K7KrC7164FbrXrqRsGPc/lX9zWBf4uiR3RvvvqsQCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3562
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgTWF5IDE1
LCAyMDIyIDQ6MjIgQU0NCj4gVG86IE5lYWwgTGl1IDxuZWFsX2xpdUBhc3BlZWR0ZWNoLmNvbT47
IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT47DQo+IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBGZWxpcGUgQmFsYmkg
PGJhbGJpQGtlcm5lbC5vcmc+OyBTdW1pdA0KPiBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPjsgQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz47DQo+IExpIFlhbmcgPGxlb3lh
bmcubGlAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZzsgQk1DLVNX
DQo+IDxCTUMtU1dAYXNwZWVkdGVjaC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBk
dC1iaW5kaW5nczogdXNiOiBhZGQgZG9jdW1lbnRhdGlvbiBmb3IgYXNwZWVkIHVkYw0KPiANCj4g
T24gMTMvMDUvMjAyMiAxNzozOSwgTmVhbCBMaXUgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4NCj4gPj4gU2VudDogRnJpZGF5LCBNYXkgMTMsIDIwMjIgNTow
NyBQTQ0KPiA+PiBUbzogTmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29tPjsgR3JlZyBL
cm9haC1IYXJ0bWFuDQo+ID4+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFJvYiBIZXJy
aW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiA+PiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkNCj4gPj4gPGpvZWxA
am1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IEZlbGlwZSBCYWxi
aQ0KPiA+PiA8YmFsYmlAa2VybmVsLm9yZz47IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+OyBDaHJpc3RpYW4NCj4gPj4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LQ0KPiA+PiBtNjhrLm9yZz47IExp
IFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gPj4gQ2M6IGxpbnV4LWFzcGVlZEBsaXN0cy5v
emxhYnMub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+
PiBsaW51eC0ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnOyBkcmktDQo+ID4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNp
Z0BsaXN0cy5saW5hcm8ub3JnOyBCTUMtU1cNCj4gPj4gPEJNQy0gU1dAYXNwZWVkdGVjaC5jb20+
DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBkdC1iaW5kaW5nczogdXNiOiBhZGQgZG9j
dW1lbnRhdGlvbiBmb3INCj4gPj4gYXNwZWVkIHVkYw0KPiA+Pg0KPiA+PiBPbiAxMy8wNS8yMDIy
IDA4OjU3LCBOZWFsIExpdSB3cm90ZToNCj4gPj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gZm9yIHRoZSBBc3BlZWQgVVNCMi4wIERldmljZQ0KPiA+Pj4gQ29udHJvbGxl
ci4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbF9saXVAYXNwZWVk
dGVjaC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
YXNwZWVkLHVkYy55YW1sICAgfCA1Mg0KPiA+PiArKysrKysrKysrKysrKysrKysrDQo+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvYXNwZWVkLHVk
Yy55YW1sDQo+ID4+DQo+ID4+IFBsZWFzZSBuYW1lIHRoZSBmaWxlIGFzIGZpcnN0IGNvbXBhdGli
bGUsIHNvICJhc3BlZWQsYXN0MjYwMC11ZGMueWFtbCINCj4gPg0KPiA+IE9rYXksIEkgY291bGQg
cmVuYW1lIGl0IGZvciBuZXh0IHBhdGNoIGlmIHlvdSBwcmVmZXJyZWQuDQo+ID4gQnV0IHRoZXJl
IGFyZSBsb3RzIG9mIHlhbWwgZmlsZXMgd2hpY2ggYXJlIG5vdCBuYW1lZCBhcyBmaXJzdCBjb21w
YXRpYmxlLg0KPiANCj4gWWVzLCBJIGtub3csIEkgcXVpdGUgbGlrZWx5IEkgYWxzbyBwcm9kdWNl
ZCBzdWNoIGJpbmRpbmdzLCBidXQgYSBzcGVjaWZpYyBuYW1lIGlzDQo+IHJhdGhlciBwcmVmZXJy
ZWQuIE90aGVyd2lzZSB5b3Ugd2lsbCBoYXZlIGEgZGlmZmljdWx0IG5hbWluZyBjaG9pY2Ugd2hl
biB5b3VyDQo+IG5leHQgQXNwZWVkIFVEQyByZXF1aXJlcyBuZXcgYmluZGluZ3MgZmlsZSBiZWNh
dXNlIG9mIHNvbWUgZGlmZmVyZW5jZXMgKG5vdA0KPiB5ZXQga25vd24gbm93KS4NCj4gDQpXZSBj
YW4gcmVuYW1lIHRoZSBiaW5kaW5ncyBpZiBuZXh0IEFzcGVlZCBVREMgbmVlZHMsIGRvbid0IHlv
dSB0aGluaz8NCkN1cnJlbnRseSwgQXNwZWVkIGhhcyBubyByZXF1aXJlbWVudC4NCj4gPg0KPiA+
Pg0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2FzcGVlZCx1ZGMueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2FzcGVlZCx1ZGMueWFtbA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDFkMmY3N2QxYzU0DQo+ID4+PiAtLS0gL2Rl
di9udWxsDQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2FzcGVlZCx1ZGMueWFtbA0KPiA+Pj4gQEAgLTAsMCArMSw1MiBAQA0KPiA+Pj4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAjDQo+ID4+
PiArQ29weXJpZ2h0DQo+ID4+PiArKGMpIDIwMjAgRmFjZWJvb2sgSW5jLg0KPiA+Pj4gKyVZQU1M
IDEuMg0KPiA+Pj4gKy0tLQ0KPiA+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvdXNiL2FzcGVlZCx1ZGMueWFtbCMNCj4gPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPj4+ICsNCj4gPj4+ICt0aXRsZTogQVNQ
RUVEIFVTQiAyLjAgRGV2aWNlIENvbnRyb2xsZXINCj4gPj4+ICsNCj4gPj4+ICttYWludGFpbmVy
czoNCj4gPj4+ICsgIC0gTmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29tPg0KPiA+Pj4g
Kw0KPiA+Pj4gK2Rlc2NyaXB0aW9uOiB8Kw0KPiA+Pj4gKyAgVGhlIEFTUEVFRCBVU0IgMi4wIERl
dmljZSBDb250cm9sbGVyIGltcGxlbWVudHMgMSBjb250cm9sDQo+ID4+PiArZW5kcG9pbnQgYW5k
DQo+ID4+PiArICA0IGdlbmVyaWMgZW5kcG9pbnRzIGZvciBBU1QyNjB4Lg0KPiA+Pj4gKw0KPiA+
Pj4gKyAgU3VwcG9ydHMgaW5kZXBlbmRlbnQgRE1BIGNoYW5uZWwgZm9yIGVhY2ggZ2VuZXJpYyBl
bmRwb2ludC4NCj4gPj4+ICsgIFN1cHBvcnRzIDMyLzI1NiBzdGFnZXMgZGVzY3JpcHRvciBtb2Rl
IGZvciBhbGwgZ2VuZXJpYyBlbmRwb2ludHMuDQo+ID4+PiArDQo+ID4+PiArcHJvcGVydGllczoN
Cj4gPj4+ICsgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgIGVudW06DQo+ID4+PiArICAgICAgLSBh
c3BlZWQsYXN0MjYwMC11ZGMNCj4gPj4+ICsNCj4gPj4+ICsgIHJlZzoNCj4gPj4+ICsgICAgbWF4
SXRlbXM6IDENCj4gPj4+ICsNCj4gPj4+ICsgIGNsb2NrczoNCj4gPj4+ICsgICAgbWF4SXRlbXM6
IDENCj4gPj4+ICsNCj4gPj4+ICsgIGludGVycnVwdHM6DQo+ID4+PiArICAgIG1heEl0ZW1zOiAx
DQo+ID4+DQo+ID4+IE5vIGNoaWxkIHByb3BlcnRpZXM/IE5vIHBvcnRzIG9yIGFueSBvdGhlciBk
ZXZpY2VzPyBObyB1c2ItaGNkLnlhbWw/DQo+ID4NCj4gPiBBc3BlZWQgdWRjIG9ubHkgaGFzIDEg
cG9ydCwgbm8gbmVlZCBleHRyYSBwcm9wZXJ0aWVzIGZvciBub3cuDQo+IA0KPiBPSw0KPiANCj4g
Pg0KPiA+Pj4gKw0KPiA+Pj4gK3JlcXVpcmVkOg0KPiA+Pj4gKyAgLSBjb21wYXRpYmxlDQo+ID4+
PiArICAtIHJlZw0KPiA+Pj4gKyAgLSBjbG9ja3MNCj4gPj4+ICsgIC0gaW50ZXJydXB0cw0KPiA+
Pj4gKw0KPiA+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+Pj4gKw0KPiA+Pj4g
K2V4YW1wbGVzOg0KPiA+Pj4gKyAgLSB8DQo+ID4+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9jbG9jay9hc3BlZWQtY2xvY2suaD4NCj4gPj4+ICsgICAgdWRjOiB1ZGNAMWU2YTIwMDAgew0K
PiA+Pg0KPiA+PiBOb2RlIG5hbWU6IHVzYg0KPiA+DQo+ID4gInVkYyIgaXMgbW9yZSByZWNvZ25p
emFibGUgdGhhbiAidXNiIiBJIHRoaW5rLiAidXNiIiBpcyB0b28gZ2VuZXJhbCwgY2FuIGJlDQo+
IHZhcmlvdXMgbGlrZSBob3N0IG9yIGRldmljZS4NCj4gDQo+IEl0J3Mgc3RpbGwgcmVxdWlyZWQg
Ynkgc2NoZW1hIGZvciBtb3N0IG9mIFVTQiBob3N0IGNvbnRyb2xsZXJzLiBFeGlzdGluZyBVU0IN
Cj4gZGV2aWNlIGNvbnRyb2xsZXJzIHVzZSB1c2IgYXMgd2VsbCAoZXhjZXB0IEF0bWVsIG1lbnRp
b25pbmcgZ2FkZ2V0KSBHZW5lcmljDQo+IG5hbWUgaXMgYWxzbyBleHBlY3RlZCBieSBEZXZpY2V0
cmVlIHNwZWMgYW5kICJ1ZGMiIGlzIG5vdCBvbiBhIGxpc3Qgb2YNCj4gZXhhbXBsZXMgb2YgZ2Vu
ZXJpYyBuYW1lcyAodXNiIGlzKS4NCg0KT2theSwgSSdsbCByZXZpc2UgaXQgZm9yIG5leHQgcGF0
Y2guDQpUaGFua3MNCg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
