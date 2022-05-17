Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8252B320
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5597A113DFE;
	Wed, 18 May 2022 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2090.outbound.protection.outlook.com [40.107.117.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078C4112E7D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cF3rIKDO9PqSdqwgjeJXkSTFa0pcbc13zWByhSZYXORUDtRbySOfGacuaxDYktSAZMjOOaqEa/O9UsTQgtvmT8mrFetbUEurqar9Mnfkvjb//YbWPNx5BREq1HfyKfIIJKQbxJsOa5CYlrBoXE4u89L97ABwR6HRQnXHX0F4HL8mUJvmaKIYWPR5Yu7kZcT/iE1ntb7B+UWhhFqEc17nvive0GLIu46Zu123dExQeBLyEWuBrTsbrJg58w7BoHZv3++4vclrJtzHrWILZCzwT/2sjFSKBGQApSWowbfaHkWwbG08UI/TtvOLe1+PyhSLPIDO9zmyLWCxQyiWHNWx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGyVsWRGUdDHmd0WjXbgCCJwO8YJQ3ijROprJwA66hc=;
 b=DCFoo0UnTIB3MR3YZxXTB8NtExLzsKGz7/v0YNq6bxj2PJZ1nxUNxCKpQsUHRnAoHmaIetRRLILGe5bUMGXB647Ij/NI4fa/V2RJuifNkPkKBzgo0fZYL5onJghVRVHZ+DfKhmYltNwThqRBCwZFQQ4b5MUjrJKVfvMbpCD3VuN5SWtAQTYEKzMVYBffxeBjJR7mmX/Dze/KKIFwsSIGgUnoVO/wwYt7q6tQvvLk4Ph3wV2zno7bBNgeXZiCEWAu1mXf6Pb+U3TD8Dv3mGRY9PEzYLk9L56CcnIqs7hxDc/hX/aBx75w2fDPbBg06aTk1Eq64WW+lkyLa6W/1QHjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGyVsWRGUdDHmd0WjXbgCCJwO8YJQ3ijROprJwA66hc=;
 b=0hTuBE+19gG3W0UGWTUVW4wWQD5hzBueS3QFT/njTID/QP1L4McIWT2VY7QyW+f7Elb5sJ7U2zpWGLW4kpqKExP1U/AXTuRYnCnCimp/lsU85U7WCprXlVmh7UW0vmWWiqggSTRn0+0OrYd0vDS63Uw9HdeRdr1YJlOBTMuN+0jig1FwXtGnEwAIypsmSDFfteAJswnqnBC38OkWqZoeSpAP2xY/mHa7XzIOtTPJEGtjUDGnjZ0/qixspTn5W2Ii3GmpRqtBjnVkFY0eW+B4YVMKYaRaBWzLmP0wcOTN0bQLjtpGTzdfa3SvWHmvRPn41OwbqEVkf7NIVHZzZopSew==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by HK0PR06MB3810.apcprd06.prod.outlook.com (2603:1096:203:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 15:21:15 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:21:15 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Thread-Topic: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
 node
Thread-Index: AQHYacfDGaMXzDQN90y+BFiyb1NEtq0i95eAgAAutxCAAAHkgIAAB2YA
Date: Tue, 17 May 2022 15:21:15 +0000
Message-ID: <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
 <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
In-Reply-To: <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5f7c55b-4293-4bad-b15f-08da3818e285
x-ms-traffictypediagnostic: HK0PR06MB3810:EE_
x-microsoft-antispam-prvs: <HK0PR06MB38106576B11628954E2B234180CE9@HK0PR06MB3810.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T2+nzxzHr30vH4gHEgd/ejnIk+fM2+b8yzCteKM/8yAUVIc+qpgZx5U3n5A5g/nlMNnvOiSwcyo7Ih7FxuipltqC5rH/QEPgFAXn2YpD2QLhgo/ybPmPNRIVyywF2YktVJPBqmTkPMnWKM1QlCY+xA19q4+AS4aS8SYpgXSPgTe0NiJH33gn7sSaw/CgAgi/hTNJcwCJAIORrSY126S+x5dnmpgpMiRsI6B1U7dASTljBpRK05S7/wAI6twtdyAvSffv9qmBj4/W4fVTIHyfSYRG5+6BiJ6REl3ZD+lUquzxnf+bVg3SsNiSflmlumFPoXBULH27/vJLbhwfishfsi2ScLw3dcVXxGDlsBQigMpxzsOE4wsUJOk6GZzq519hHYksgNC8HANlnkXSZIgaLaam/uMj17NYCJ/EA5U58Gcjlh3Z1dQMcxR8ctKAS20ZN/Os5Uax/LH1q870VJnzUc24dkRcOmImnSFgLOEEiF6z59dzMcYc0VpuFzhoDvylBp3KeeTKB49fKcAX8bhlV2lokzxZfl5yNibWaPf4oqZJp6H/SSVWuLuTi5TvrwRQnyEE3p9n45DLtg+RDbLEpXAlRTqFT0TOhcIepRy3a79cl3QdPS2XEXzyMxtsN+fd7F5lKEoje/Kh11FrRClNrEHebFwragf8+8BQKU2y2/MqgfVZ5Lq0yK06ncrZtDm8wjovwInWlayU6MPpIjz0qstTLqerWAot3QP3O3ERRRg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(39850400004)(136003)(366004)(346002)(376002)(5660300002)(52536014)(86362001)(66476007)(66946007)(110136005)(83380400001)(54906003)(33656002)(9686003)(186003)(41300700001)(38100700002)(122000001)(7696005)(7416002)(53546011)(66446008)(66556008)(2906002)(64756008)(8936002)(921005)(38070700005)(71200400001)(508600001)(55016003)(316002)(66574015)(26005)(6506007)(76116006)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blVOUEtMeE0vaGZyM1RIK1pqbzJOWFdFSXR1a1pVaHp3cGdJaS9ac3VFMEVa?=
 =?utf-8?B?cEJiSlJBQjFIb1B5aVZEV3Q5SlFtaHRGVXlTLzBLWjFPZ1VFZVVEUnVCWE5u?=
 =?utf-8?B?ZUtXZ3Rld1VDckdmMWk4UVNkbXUzYTBLeGRDYW80SWJ3bEgyVDBSTWsyd2N0?=
 =?utf-8?B?clVVMlk1UnZPYlpZK2hFTlFES3c3dlpHMXBRWUN4T0tpRzJiaVorMWh0eVQ1?=
 =?utf-8?B?YmI5R2ZhVkM2c2ZNNUtrQnZHVWNJWjB1eFYyaGFsSHd6TTNqOE9VZjBZWDIz?=
 =?utf-8?B?Q1RnaWhicWpaTjBZaUIxYUxPTElQVGY1eHBLRTJuUU5SdEtTNHlIY3ZWMjZS?=
 =?utf-8?B?UTkycDJvUkpSNjMvckpwa2FLa1BnWGNoS0xBVFlDSlprek0zeGhtZWdqVzBu?=
 =?utf-8?B?QjdnRmdhRE5kdHJ6ZVhzM2E5V3Jxb3JPTmNqMDFlOHl0WmYyYkxSQ1pvbE9Q?=
 =?utf-8?B?V3pycHpMUUhScFJBdndndmJ5RVRmVnZOaHR6QnoyY08wdzNVZ3d5aDQwdGZE?=
 =?utf-8?B?NitHUC9pcHdibUpNK2NPc09HSVNoZU9WVnV2OGNZWXV1ZzN0N2RsdXRkdHlT?=
 =?utf-8?B?eGx1VmJCd2lBZlBBWmQyZHRDeUo1UkpOVlhVUGljdFZtNHQydEZqMjU2Qzg0?=
 =?utf-8?B?YkJrcDZJMEh0dmtjWlBSRjI0L3U1RkEvZkpvemsrbUpzQUpRb1hsb1NYbHB0?=
 =?utf-8?B?aDhxa3c3TzJpWmwvdUJydHJUZlQwUkw5Q3oyeU42bDVEU0N4Q1JGYXBQRWZ3?=
 =?utf-8?B?MVFKaGNUaEZpRlVTM0k0QjJjL2FxTnRNNWRWMUlGUU4yQXlEREpiR2tzUkJR?=
 =?utf-8?B?SEhvT285eGhBM3EydGRRSnh1S2NKYVBMbXVtYi94Y29oUy9YQjM4bm5lb0Ir?=
 =?utf-8?B?RFhIbURxczV5aTVFeGZMdDZ5NmN6eWhpK3N6bkIzc2NXUVY3SWQwbDR0THZF?=
 =?utf-8?B?T2tVNm5pM1kweUpabVVDamlWa3NCckg5cW04UGpIcjhPSTBNSEprU1VWR3Z0?=
 =?utf-8?B?MmtyeTN2UTQyeStGN3ovalNNVzRMRGtEd3Z2eDd0YXdzSTZTQzBFbnE0d3A0?=
 =?utf-8?B?Q2YzSGdaMEZKWUkwL1dIeU9PeGFpcjBHcFNoUm9zRDMrMWxkMU14MWZkaWRX?=
 =?utf-8?B?YUNxTitnVStwRGhxSU9tMUcwR3EyZTJmYnZ4L1pwS3VZMGNRbnFVc0lPTnMw?=
 =?utf-8?B?RElQUmRCQUF2TEZHL2lzTTBXUjNGM0d0QmxrL1FPZWNiTm42R2FUT0xvdXBr?=
 =?utf-8?B?dHAxaXlRV3IzckJSM1RHU0NhWXdsM2RNN0I1Nm9PTzVRWThEMW52U3hROS9R?=
 =?utf-8?B?amFFT3JVdlMwd3dDenp2R0p6Q2hoQ01wM25sMzN3OWt6eEZONlpDOTQ0SUdW?=
 =?utf-8?B?L3RzTzFoT0xhRUd6UlpNclNNbHpYVk5sczEybHVzb2tBbjZFUCt4R1hlaFd2?=
 =?utf-8?B?dkJ3a1djUng1ZG1lUTYxcXYrVTgvZTloWDlYQ0tjQVN3eitHbERIOUliRXNz?=
 =?utf-8?B?SVZOMlhYcmp2dTN6UVVFWlREbEc3VkhvOWJud3FiUzNUTVNoQjVlWCswT3RP?=
 =?utf-8?B?U3FjWVJtcWNuSjBGZElNNnprWWtid252bDIrOFFTRUpGektVTWRQcXgwdjZU?=
 =?utf-8?B?SkpmUjJxK3BuNWF1am9nZXdxdU9RdHNPRmltbWlPZGZ2Y2dVQ3JuRkNhZUVj?=
 =?utf-8?B?S0Jua1RWdE1OVmlFd3dhdE5TeGszUUdNYmcrekFuN3UzTGs3SUlsdjFRanBZ?=
 =?utf-8?B?YmpHNWpmNTYyOTd4Zkl5UWxsaUFEQ25MZmRnSmtHV0JsT2ZnSGFCd244c2wx?=
 =?utf-8?B?Ym52aUV5QjJNRGpPaWFlSUdGQkU0SndsVTBFWW5OUFh1dnU0UkkvV3RhOS8x?=
 =?utf-8?B?dzRJbEZKQmEyclpEZzJzcG1iVlZvOGxRVHpZa3NNQ2N2Mk40M2V1RHIzaEZR?=
 =?utf-8?B?N0hhTVQrT0o1U3lLWUFhYkFFVHNPWGtKWjk2Y2tDRFIxU2k3Y0pIZnBCZ2Z6?=
 =?utf-8?B?dlRhZ05xQmlNL0g5OG5rejk2c3FGd2Zkc2FiVW80VFV3SVJSUllzVW5sejlV?=
 =?utf-8?B?Q0RDV2tXdm5yZTR1anQzWE1HVVVLYUIyenFPenBsN0pjRmYvNGFFRDgyZ1ZV?=
 =?utf-8?B?MDRoUXFFMTJYWGorVEo5T2xQT1d3NHRURmgyRkZVMjVvK0k0RGdQSnlvdlVB?=
 =?utf-8?B?VWp1SEdrZXBBdjQwT29xZ3pxVHdhbVRMTEh1elVnckk0eUIzaitBZGNJQURX?=
 =?utf-8?B?ZE5jL3Y0NG0zM2xEa0tXQzh6Ni8zRVpEUHV3UVN0S0QzeHIxdkpwUE91S0hk?=
 =?utf-8?B?MlpodENsaDQzdWdzdHZyYzFDVWk4TllpODBYbHFjbzNzVkFKU2VHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f7c55b-4293-4bad-b15f-08da3818e285
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 15:21:15.6660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2epkSJIC9Ue3fcIHX7ojV3jF6kQ/5LO+Z4Qf9U8rrhYKGZtwg78UwWWGRhkkQEG33dLXPLzZOqfObkavYWOb5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3810
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
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAx
NywgMjAyMiAxMDo1NCBQTQ0KPiBUbzogTmVhbCBMaXUgPG5lYWxfbGl1QGFzcGVlZHRlY2guY29t
PjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PjsNCj4gQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IEZlbGlwZSBCYWxi
aSA8YmFsYmlAa2VybmVsLm9yZz47IFN1bWl0DQo+IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPjsNCj4gTGkgWWFuZyA8bGVv
eWFuZy5saUBueHAuY29tPg0KPiBDYzogbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxp
bnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSBBUk06IGR0czogYXNwZWVkOiBBZGQgVVNCMi4wIGRl
dmljZSBjb250cm9sbGVyDQo+IG5vZGUNCj4gDQo+IE9uIDE3LzA1LzIwMjIgMTY6NTAsIE5lYWwg
TGl1IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+
IFNlbnQ6IFR1ZXNkYXksIE1heSAxNywgMjAyMiA4OjAwIFBNDQo+ID4+IFRvOiBOZWFsIExpdSA8
bmVhbF9saXVAYXNwZWVkdGVjaC5jb20+OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPj4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47
DQo+ID4+IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJv
Lm9yZz47IEpvZWwgU3RhbmxleQ0KPiA+PiA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1PjsgRmVsaXBlIEJhbGJpDQo+ID4+IDxiYWxiaUBrZXJuZWwub3Jn
PjsgU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz47IENocmlzdGlhbg0KPiA+
PiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IEdlZXJ0IFV5dHRlcmhvZXZlbg0K
PiA+PiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+OyBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+
DQo+ID4+IENjOiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZzsNCj4gPj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIEFSTTogZHRzOiBhc3BlZWQ6IEFkZCBVU0IyLjAgZGV2
aWNlDQo+ID4+IGNvbnRyb2xsZXIgbm9kZQ0KPiA+Pg0KPiA+PiBPbiAxNy8wNS8yMDIyIDEwOjI1
LCBOZWFsIExpdSB3cm90ZToNCj4gPj4+IEFkZCBVU0IyLjAgZGV2aWNlIGNvbnRyb2xsZXIodWRj
KSBub2RlIHRvIGRldmljZSB0cmVlIGZvciBBU1QyNjAwLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IE5lYWwgTGl1IDxuZWFsX2xpdUBhc3BlZWR0ZWNoLmNvbT4NCj4gPj4+IC0tLQ0KPiA+
Pj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpIHwgMTAgKysrKysrKysrKw0KPiA+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpDQo+ID4+PiBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpDQo+ID4+PiBpbmRleCAzZDVjZTlkYTQyYzMuLjU1MTcz
MTNlYjJiNSAxMDA2NDQNCj4gPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5k
dHNpDQo+ID4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiA+Pj4g
QEAgLTI5OCw2ICsyOTgsMTYgQEAgdmh1YjogdXNiLXZodWJAMWU2YTAwMDAgew0KPiA+Pj4gIAkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4+PiAgCQl9Ow0KPiA+Pj4NCj4gPj4+ICsJCXVkYzog
dWRjQDFlNmEyMDAwIHsNCj4gPj4NCj4gPj4gVGhlIHNhbWUgYXMgRFRTIGluIGJpbmRpbmdzIC0g
Z2VuZXJpYyBub2RlIG5hbWUsIHBsZWFzZS4NCj4gPj4NCj4gPg0KPiA+IElzIGl0IHBvc3NpYmxl
IHRvIHVzZSAidWRjOiB1c2ItdWRjQDFlNmEyMDAwIiB0byBkaXN0aW5ndWlzaCBpdCBiZXR3ZWVu
ICJ2aHViOg0KPiB1c2Itdmh1YkAxZTZhMDAwMCI/DQo+IA0KPiBQb3NzaWJsZSB5ZXMgOiksIGJ1
dCBub3QgcmVjb21tZW5kZWQgYW5kIG5vdCB3YW50ZWQuIE5vZGVzIHNob3VsZCBiZSBnZW5lcmlj
DQo+IGFuZCBwcmVmaXhlcyBhcmUgYWRkZWQgb25seSBpZiB0aGVyZSBpcyBubyB1bml0IGFkZHJl
c3MuIFlvdSBjYW4gdGhvdWdoIHVzZQ0KPiBzb21lIG1vcmUgZGVzY3JpcHRpdmUgbGFiZWwuDQo+
IA0KInVkYzogdXNiQDFlNmEyMDAwIiBpcyBva2F5IGZvciB5b3U/DQoNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo=
