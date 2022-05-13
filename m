Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF203527872
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 17:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE4112411;
	Sun, 15 May 2022 15:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2117.outbound.protection.outlook.com [40.107.215.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B4410E138
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 15:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4Fw/FmwlTPgOfxMGB/nNunz14aeXof3HReeTL59cLHhjai6acTNQlmBTqTsGgLmtTDX27gZXMwMh7hZnw/YyMwRdGp1G2pnoqGv4re4w/c4kERxUW3kW4aA3axRD3ClzypGanCPTqOctPx1oK5WIH63nwBgOoq0VIhBLfvnd+N/tu74sXCUNiuu2NtTtci3Bua5sgU9ohf4WB2yycM5CZCLl7XjZ8uXAw4/ThjzxKYQ3HvTSfN6g0/O5lovdOd2hq2mmo8VHo/ZxdputIzGcUN3/k4QYwViV2TvaGQP+QeApwCh2cKGmOmkcBouFuIXoY56r2/xvLxHU2cwtn6jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bohryH73gNY+jHQdxzFg0VW9LFPaX/h/31foUcTnS24=;
 b=iBgDuuB28QZHxc4s2oOUGkPC/RY77f+rBdFBRfT2VFkVlTOBFf2tgqeHyN1Zyi3eq7DAauNG6b5hNbsbBgBiwunBPc8aJjsbWkEQdCDXcU7ciFdux53wckZ0GKlAAv84brKzT72PEPdn/SceOGaIELlyQ4XF/voeJ60bRpzEkS7Jz4dFIJHl0aDZlA1AzRFPqG6PoYUwLNXtZmdcx9E/VL2r9+dy66azMZlbVeSmRW0dWV1fzNBKLv3FBuY8S1AqPz0kjixUC+XtOrJJr5ilPsuCQFV/O1XOXO060TLsyYfurRWhwg7DPUfk+kUUs4BiQzS1kKs7RZySVmXj4hV0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bohryH73gNY+jHQdxzFg0VW9LFPaX/h/31foUcTnS24=;
 b=gRfNh5WV0VKHZAJqSejrRPZby/iERm0f0pGHRt+CabHy1BLHw0oJVkUwNpXceoj+2gNd9utvETNMPmaoK99vR1L/4lN503DQkGj4oZ7TyYDvJZUGHfSAQCgGPjio61gNxrxHBKVpZaLSCTdWrIkicD4RiM7kw+bbprnH6ZG1PuLj+VsSZXCRF12ajpBuKO9bDcf37l+143jkt9hZx0/WIE6GCf/MHhgEUGE21L2UlRMqfwRFzXj2gD+QAAxH+ILDEi1RFwV7PtMNKKc4W3D4thB3UFosL97zT0D9Ops+S01X81/qTHeCfxP5FFYAqZRwp5jmCjzOQ3nsFnVXoK6ejA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by SG2PR06MB3398.apcprd06.prod.outlook.com (2603:1096:4:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 15:39:15 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5227.025; Fri, 13 May 2022
 15:39:14 +0000
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
Thread-Index: AQHYZpbGEu2wf1faFk6PWys4YB7zt60chHIAgABrQWA=
Date: Fri, 13 May 2022 15:39:14 +0000
Message-ID: <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
 <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
In-Reply-To: <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a3376b9-eb82-4e66-54c7-08da34f6bbed
x-ms-traffictypediagnostic: SG2PR06MB3398:EE_
x-microsoft-antispam-prvs: <SG2PR06MB339830F2B64216E279E0F17C80CA9@SG2PR06MB3398.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UFJRVBPi1DcHb1dvU2303C4IgQMXaJSb4ccPnDDbgCQAdd36wjEEX+wNWRVQWH0WRRpXQA7fnn9vOTVBnBkcV71+NAB2D2xciabF5e9p3WjT74lXsfURhl6qnDinsS4V0H7blOTz/vQB2kDSOUEcPmY6TWM8N/5pGnf6sPLU2J8jd/zUZ2n0qvDmpB3AOTOX2RINQT3/7P5qLxoXpf3lXcFrC4CNOBvT2yXUNW9DMXBBo/lXfewInS2Ej6ezOFF3l9Y2UbZq9YihW7vr+lJLWNDP45KLg53Ivq+fGxxqEgYv4wj8Qw1ZBmM5a4b9B0NQn8PmjGiK4BnHpexsXI8dPMC9eF7bS+TCnTb9vxBbb6GMA6FUUZcbaujkx5gh4SmC0nxMS9CFohbijG4gKspxzXhS/w1SrG5icvOgmb38Hr6kZEJ/uMkBy0kxSLwkZgkNjl05gsMHkjMYo9JUpyFxCtiAMS34/bESdsk5F6S0lwfqw59O2ie6naP6eeXAbN4vX5A1FzPUUFEZpLot6qrS4FqsxJO5DdPbywMLy5Mk8H4oIs16HVMTq8WDWtu9eHohGHsodCcIA2nYlHpCMTPKhHSwYfPH7BbidmVZN4NECrqmAkY7/ZbX4HGVIR6ChphnfVKhJPsaH9Nhdn39IFWxYE2wJMgETQTRspWS86mB5MCHDtaaCBPnLltIohbkuWDYzgFaNu0wNi7QAvh/zoPnIk9EtZ6ntbbkjbngQLak8fvR44G3XRBpg5JS/NidPjBrTvJ27XBr8Ra8AI6SWIMO6EA7CvDeK5kpV22FFG0u0Lotktj93lgoL/NfqRlF/88K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(39850400004)(136003)(396003)(346002)(366004)(110136005)(9686003)(52536014)(54906003)(86362001)(8936002)(55016003)(7696005)(6506007)(966005)(53546011)(316002)(5660300002)(508600001)(66446008)(66476007)(38100700002)(64756008)(7416002)(66946007)(66556008)(76116006)(107886003)(71200400001)(4326008)(33656002)(38070700005)(8676002)(921005)(2906002)(83380400001)(26005)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1NDZEF4eWROR2Nobmpia1JJYlFNTS9ncExoaTJZNTRkMVMwZDBtSGtoYmRi?=
 =?utf-8?B?UGpWdSt3blhhWU9hTURGdVhJbFhpV0RjV2YrMVNKb1Uvci83KzlMTmswend0?=
 =?utf-8?B?eFcrQjZDWElXS0dLS2g3TUE4MmxsSGszTjFwY2dMM1luWVNjQllUQmVmOVFK?=
 =?utf-8?B?dXZrQ0hnYzREVTZvZUNCclkyVFRGU2k4NDRKLy9WZHNQQ1M4RER3Z1pjYU5a?=
 =?utf-8?B?Wk9Sc2grUTc4a29IQzNVWWJ3dUZOY2NpTlJpdjlVcER5SmV5UGRndmJoRnJn?=
 =?utf-8?B?bzhaaUJwNmRIZERqSnJKR2VEd0Uwd1NoR1dlR2lCTUpFMGt3YnJLOGduMmNo?=
 =?utf-8?B?REl3c0JKT1NBRDZzZ0RQb2RvbjFwL25ReExQYi8yWHpHc3FUeW1VOS9rS2E1?=
 =?utf-8?B?akJuUGYzZnpzZ1lnZWlxc0FtTnZsMjJmZC94YWUzUmFzdlRYVmdnTlJZbXdz?=
 =?utf-8?B?WTUvaWNOSGtxS01rZm5tM2lnTGYvS3p3US9NVy9pZFBHemx1QjNSeVNCNUlN?=
 =?utf-8?B?QVREeXh3SXlNc0pzbzFtSTE5NVZGbnFSZUZOb2VMdVhIRE5XbjlTS2N4cjBK?=
 =?utf-8?B?S1MxSG4xYUd0NmhrWTB3TGVOTDN2cVQ0cXFmWVBYajBWSldTM0FzRWtQNWll?=
 =?utf-8?B?ZUVvd0FWNTFZM3E2Q2ZFOFdqQVVIWnNwNHZkWE4yd0tQMXJEWEp6LzVINEVr?=
 =?utf-8?B?RksyV0xEQVRmdFVuQzU2eGlDd2JwSFhVZjFZNnFEb09QenJtV0JtSUZ0WWVr?=
 =?utf-8?B?VGFZcE5NLy9ReGdWNytMdmNvOVJVUWl4d0xSR1NLVUllMFhkUTVSRStWY0dy?=
 =?utf-8?B?OGRxNWhEWWRNbXJlSFNGWC9JM29LaXJhanRvNDFGeXFXVzVJQUU4ZnB3UHN4?=
 =?utf-8?B?NWJpRVJUNjZ2R0FWcEltQ1hSS2NYb1g3VlYxd3B0cFc1N0owdGdRejdUNGFR?=
 =?utf-8?B?UTFzZkJCRGdQLzFsNFhDU1dSb285bDkzeHo0U0k5R1krc1BMUThsVHNVdU14?=
 =?utf-8?B?NzY2MmlrOXB5Wno3UDRndVZ1RS9GaDRzbGlJLzBxTjFaRnZuVEN4QTYrT2xH?=
 =?utf-8?B?NTM2T1NoRUlsWEhYZm5ZVDc5cTcrMHFrVVByakhKVlhDRk1LaXkzcVREcmxP?=
 =?utf-8?B?VzhDTkFmejVDUmVKZ3Y2T29uakprN29PajN3dFczUzFPMVljQXp6SldDY1VZ?=
 =?utf-8?B?UEhmbENMbWlDVDhVeXBLaVdxUjNnOVI2Z3BPT2ZQa2dnK0lNUm44SXlyUW53?=
 =?utf-8?B?L3ZNcmxlcXZjdVROWXNoYVRYNjBFZkhvVTRjSnh2dDZOOWYvTzBsb0wxd0dq?=
 =?utf-8?B?SWtOZk16VTBiQkNzVW5JdmlPOHNLSEwzSjRZcjJ6cFYzN0NXZXJ2bWpIUzZm?=
 =?utf-8?B?YlNLaU5Ec09kVnJlQzVzK1QzNldYaWNPVnlJNVk0WlpnWlUwdFBqQ1JSbWNE?=
 =?utf-8?B?SzE2UDBwaEx0ckpNQXhvd3VZVEVsVU5WZC9rWU80ZzJBK25HY3Q1aWNIS2tj?=
 =?utf-8?B?QTVEbXBKRGpPWGZCUnBGOVJWQi9YK2xubkUwVWQrTFE4Z2t2QnVXdDVIejh3?=
 =?utf-8?B?VGRFTW5CaDFtY2l1ZXc0WXJvbHhyQ05Vb1dWUnlacWZydUY5WWtURUNIdURp?=
 =?utf-8?B?VGdqOHphMlVQR3BoQVRmMDBjbXpReWJVRS92L292SUJIdUszWTEvWllqN25o?=
 =?utf-8?B?bWZ0TkJYQmZMVXVDQWJqU3B5TnRMSTFwWmIzQWs1TUtrMktYdi9YdTRMMGJN?=
 =?utf-8?B?QTk4NG4xUnZhTmsxakZmSDI4bTROMmtEMGRINytYYXYrRkwwdGYwdVhLQnQz?=
 =?utf-8?B?eTFDaXBYclpaWnVPdDZjTjJTb0l6ZFF5K0VOOFF5eHNvOXhnbmkxM2RKM1Qw?=
 =?utf-8?B?MzZVWlFJcUJkdm1JZUVQamlDdHNXcUMxczN3cXhSbjdERThROU9VYkdsSnZx?=
 =?utf-8?B?Njl2MGlJY2R2RzB5TWh0NU5wV0Q0aUtLSERqWmpRNFVNdWtaWHR6ZUttSnFH?=
 =?utf-8?B?UlZSUTF6YkZScGZOUDhGNnBuZHBEdFdFbnh6QmJWS3RQQ2krb3Q3M1owRDg3?=
 =?utf-8?B?K01na0JkOHdOZkgrc25tdzNZYWlhTFM0NlNSVGx2MFZDcktET3hubjhwY0Fz?=
 =?utf-8?B?T2FkWXlPTmZZS1hUVnBaUG1Xd251SnRIYnZESEFEa1EvRVI0Z1dhUUlSVGs4?=
 =?utf-8?B?dVdYUjV0SzRnVDQ3a2dLUzFPYlBkUzdYOFRVMEI2ZWltZERNZ2dpOHc0OFVX?=
 =?utf-8?B?VEkyT1dqYzFqOERKR1pOU0RBK3VaRzJ0aXZ3R1MwRmIrOXlKV0JqcVRlSWZQ?=
 =?utf-8?B?b1hGb21uZXI2YXAzNGRwWEVtVnlqb1JlMjlnaHdBd09PNUIwMUNOUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3376b9-eb82-4e66-54c7-08da34f6bbed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 15:39:14.5370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcxxEjv2QR91J31/0fWd5OJ7C2QZGhii9QsqzYlIYFEb96oxUOFGsYoRGTp+tR5s18Ah1lce5qlNiYv04kzg7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3398
X-Mailman-Approved-At: Sun, 15 May 2022 15:27:26 +0000
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
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDEz
LCAyMDIyIDU6MDcgUE0NCj4gVG86IE5lYWwgTGl1IDxuZWFsX2xpdUBhc3BlZWR0ZWNoLmNvbT47
IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5DQo+IDxqb2VsQGpt
cy5pZC5hdT47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBGZWxpcGUgQmFsYmkN
Cj4gPGJhbGJpQGtlcm5lbC5vcmc+OyBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPjsgQ2hyaXN0aWFuDQo+IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC0NCj4gbTY4ay5vcmc+OyBMaSBZYW5nIDxsZW95
YW5nLmxpQG54cC5jb20+DQo+IENjOiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPiBkZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZzsgQk1D
LVNXIDxCTUMtDQo+IFNXQGFzcGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMv
M10gZHQtYmluZGluZ3M6IHVzYjogYWRkIGRvY3VtZW50YXRpb24gZm9yIGFzcGVlZA0KPiB1ZGMN
Cj4gDQo+IE9uIDEzLzA1LzIwMjIgMDg6NTcsIE5lYWwgTGl1IHdyb3RlOg0KPiA+IEFkZCBkZXZp
Y2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBBc3BlZWQgVVNCMi4wIERldmlj
ZQ0KPiA+IENvbnRyb2xsZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVh
bF9saXVAYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9hc3BlZWQsdWRjLnlhbWwgICB8IDUyDQo+ICsrKysrKysrKysrKysrKysrKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9hc3BlZWQsdWRj
LnlhbWwNCj4gDQo+IFBsZWFzZSBuYW1lIHRoZSBmaWxlIGFzIGZpcnN0IGNvbXBhdGlibGUsIHNv
ICJhc3BlZWQsYXN0MjYwMC11ZGMueWFtbCINCg0KT2theSwgSSBjb3VsZCByZW5hbWUgaXQgZm9y
IG5leHQgcGF0Y2ggaWYgeW91IHByZWZlcnJlZC4NCkJ1dCB0aGVyZSBhcmUgbG90cyBvZiB5YW1s
IGZpbGVzIHdoaWNoIGFyZSBub3QgbmFtZWQgYXMgZmlyc3QgY29tcGF0aWJsZS4NCg0KPiANCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2FzcGVlZCx1ZGMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9hc3BlZWQsdWRjLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZDFkMmY3N2QxYzU0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvYXNwZWVkLHVkYy55YW1sDQo+
ID4gQEAgLTAsMCArMSw1MiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgIyBDb3B5cmlnaHQNCj4gPiArKGMpIDIwMjAgRmFj
ZWJvb2sgSW5jLg0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL2FzcGVlZCx1ZGMueWFtbCMNCj4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+
ICt0aXRsZTogQVNQRUVEIFVTQiAyLjAgRGV2aWNlIENvbnRyb2xsZXINCj4gPiArDQo+ID4gK21h
aW50YWluZXJzOg0KPiA+ICsgIC0gTmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29tPg0K
PiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwrDQo+ID4gKyAgVGhlIEFTUEVFRCBVU0IgMi4wIERl
dmljZSBDb250cm9sbGVyIGltcGxlbWVudHMgMSBjb250cm9sIGVuZHBvaW50DQo+ID4gK2FuZA0K
PiA+ICsgIDQgZ2VuZXJpYyBlbmRwb2ludHMgZm9yIEFTVDI2MHguDQo+ID4gKw0KPiA+ICsgIFN1
cHBvcnRzIGluZGVwZW5kZW50IERNQSBjaGFubmVsIGZvciBlYWNoIGdlbmVyaWMgZW5kcG9pbnQu
DQo+ID4gKyAgU3VwcG9ydHMgMzIvMjU2IHN0YWdlcyBkZXNjcmlwdG9yIG1vZGUgZm9yIGFsbCBn
ZW5lcmljIGVuZHBvaW50cy4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0
aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtdWRjDQo+
ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGNs
b2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+
ID4gKyAgICBtYXhJdGVtczogMQ0KPiANCj4gTm8gY2hpbGQgcHJvcGVydGllcz8gTm8gcG9ydHMg
b3IgYW55IG90aGVyIGRldmljZXM/IE5vIHVzYi1oY2QueWFtbD8NCg0KQXNwZWVkIHVkYyBvbmx5
IGhhcyAxIHBvcnQsIG5vIG5lZWQgZXh0cmEgcHJvcGVydGllcyBmb3Igbm93Lg0KDQo+ID4gKw0K
PiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsg
IC0gY2xvY2tzDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzcGVlZC1jbG9jay5oPg0KPiA+ICsgICAg
dWRjOiB1ZGNAMWU2YTIwMDAgew0KPiANCj4gTm9kZSBuYW1lOiB1c2INCiANCiJ1ZGMiIGlzIG1v
cmUgcmVjb2duaXphYmxlIHRoYW4gInVzYiIgSSB0aGluay4gInVzYiIgaXMgdG9vIGdlbmVyYWws
IGNhbiBiZSB2YXJpb3VzIGxpa2UgaG9zdCBvciBkZXZpY2UuDQoNCj4gDQo+ID4gKyAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtdWRjIjsNCj4gPiArICAgICAgICAgICAg
cmVnID0gPDB4MWU2YTIwMDAgMHgzMDA+Ow0KPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0g
PDk+Ow0KPiA+ICsgICAgICAgICAgICBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0dBVEVf
VVNCUE9SVDJDTEs+Ow0KPiA+ICsgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
Ow0KPiA+ICsgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdXNiMmJkX2RlZmF1bHQ+
Ow0KPiA+ICsgICAgfTsNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
