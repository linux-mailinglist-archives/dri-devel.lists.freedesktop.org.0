Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5AC436582
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5D36EC8F;
	Thu, 21 Oct 2021 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 21 Oct 2021 12:23:20 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4F6E452;
 Thu, 21 Oct 2021 12:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1634819000; x=1635423800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jzZ8GV5DL5ey9WrVhv96Bk7dq4m4xkzMBftThhsQNtI=;
 b=KIoT+dSwvxWSpQ8QScRTRADiU9cvnOxl1N5Wv262pWSSokjCAXBfFudc
 +ZbWhU5zUhR+w1BxtBB7jfqyfYC74T+nutMYLRdUN9CHDNXVAZFoNW+/9
 GAGb20dr65ZsXYxL6xYCsu28vVe1txgRhn01pIANLFw00MEGbVlvGMwDY 8=;
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 12:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+QWhu6kb+h94X6H+9wjEKDC28CO6V1ZkzyeZKwrLwH5LV9kk3DmfpSf5RlL7poh+uBGsAlXHnUVwg+jOjs39RydZo7Un0uZqGtQvWGxBGxhCcQdvbzw3aLVb8vmA5/fIBplPcL0q8Mc0v84zYoDQhWEQNTiUYKoZOkZFUwmH+31z+R0A1y0C43vgTmU6VDT3bT1Nn/RYTMBg4uESf64D3ysaX3Q6eEuPkEWYqkDhY43U6RNHsuG2C2c9K3TJyVdAQRJpbfLtPxF+MdAq91ZAP12upTtPT0+m7hsZA5pwh5HXXhHu+NyTT3MSNG3eYdyljAHB1enng5l2BEpYJqk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzZ8GV5DL5ey9WrVhv96Bk7dq4m4xkzMBftThhsQNtI=;
 b=OLlH+qIxZ/r/A3SmRnxw4TbLcngBQfxVSeYhfndFzUJs5Ibi+MyChIPNTTE8IhiLm1lxAml7zBSHND1BoACNbVrZ6Iir9OX0Lypx5MyOz2lDVLrsH0fadPTztaRHAZ2Vz29iw+oFf7ioDiv6fciuDhv/u5bm6EVgKuPlad5Yiim1sgXlwNyPfxq4dEk8O8sa1NyUeGvBQ8EvBQ7BO83TqpLJ6G9KjCgXhQiEsRKq2QcZkGLM90NZaOVV5y+RyqyGAU5TmrpFWzZ+qHqnSvA2W7aYz5soJvyI4Ruz/abP5oI9cxDmdJnQlbdqQykbEDztWZgxhVgNK7ixGncgc0DWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CO6PR02MB7603.namprd02.prod.outlook.com (2603:10b6:303:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 12:16:09 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::ad8b:665b:af52:b2c5]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::ad8b:665b:af52:b2c5%8]) with mapi id 15.20.4608.019; Thu, 21 Oct 2021
 12:16:09 +0000
From: quic_sbillaka <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, quic_sbillaka
 <quic_sbillaka@quicinc.com>
CC: dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, Sankeerth Billakanti
 <sbillaka@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Kalyan Thota
 <kalyan_t@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>, Kuogee
 Hsieh <khsieh@codeaurora.org>, Krishna Manikandan <mkrishn@codeaurora.org>
Subject: RE: [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
Thread-Topic: [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
Thread-Index: AQHXxawXqmYMEEPgfkuL3gmgM0vxsqvcJ+eAgAE1V2A=
Date: Thu, 21 Oct 2021 12:16:09 +0000
Message-ID: <MW4PR02MB7186ED00AAF0C3FD8BB6F657E1BF9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
 <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
In-Reply-To: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a86cf7e4-623c-4cdc-5192-08d9948c90d8
x-ms-traffictypediagnostic: CO6PR02MB7603:
x-microsoft-antispam-prvs: <CO6PR02MB76035582D593D0B4437AE8449DBF9@CO6PR02MB7603.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q5FTT1msaQZEWlLl5jTOADbZsmETqJ2byaDrpQ4/ZodN3YodUZchn215kCeyA3O1n1p/XbHpF/80wPT9MmuGfG0f8xJn7wRno8AzmcitapSMSohPBeiZEA+15qCqJBU29GkRAP/JXi+GIHUFEOX59NWu58XHNhR+xIe+cIHla1M8f32davQXdUFp3CmCnWvnYbkhz0ce/k61EzvkPHEPvDo8FVqq3QCTuRCUw+my2t9uc2j14qnBwhV5eF0vsgkm8ACD5AViZvIAzRXdYYuSJzHzDK3Lg/sTugSrjbAfbf9sTsThcIA7cl8G3G3bqcgfBFmgWaQ6KfPcHUis94DkCv/b6+al9f0ef4NIBGMXd1+8AV85znDkjQhzT7HNLWOfUwClm9L442IT08EKki+aKnQKiRYl2oa5KLXOhy6qHpqxbGf7kja1LgBh7rMAB4vuPlsgVhJWun17heI6lgFiRAjlmHSTnMfdjsY4BIEEDdHK0/ei1Q0YJW08cSxWbw1chMEJ96hbZp3NC2KF2LsFgX6PY8EsKH36qUsqVPGDlo0fjWNciNcZzEqTHzQaasZCk5d7ya/bJgJzoumg61jCxJFcdQy3Qh0xoiz/H6E1mXc7lciRqTLtmR6RAsTWNxlj/cMG9KywnSX3av5rrja3teNoHe/JNQM77wnBaaq1T6oPjExEnWk78/9aMMauLb2aaM5vjpYHFazLYi3stgd2T/ACl9LoP9U+pEU0zSq82dyP2Eqq0prAZY+wsmH7wJzqZrc6FsD6K+Vcq0x1pm6883RfndJDolsRP46RqF1yAKQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(66946007)(64756008)(186003)(66476007)(966005)(5660300002)(71200400001)(4326008)(52536014)(33656002)(26005)(2906002)(66556008)(66446008)(76116006)(7416002)(53546011)(6506007)(8676002)(38070700005)(83380400001)(316002)(7696005)(110136005)(38100700002)(9686003)(55016002)(122000001)(54906003)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0IzTSsxcVNmK0ltUFkyaDU3TkJJUks0TU82SHVsMlA3QWZsZ0h0ZzZPVGND?=
 =?utf-8?B?dmZKT1Q0bUZuSjBmbGMwNDJLK2xnVGQxMUJ5M28wMVQwYnJlTmJQYjZITmc3?=
 =?utf-8?B?c2s4RzV2MVNmeGFrVzZxTmMrL1hRYy9lWEFpRXRFRkR6YWZZMlNBVm1ZWWRj?=
 =?utf-8?B?Y3BIaVdNUHh6N085UkZucmV0RFUxdkZBV01pc1hGMzNUa2lySUhrSnF2U0lh?=
 =?utf-8?B?SC96akJJa3FLZ2RIZzUvZ0xYWnlBZ1dtZDh3UkxhWUw4bnM4UHA5elY1Nmlh?=
 =?utf-8?B?Q3NHMG92MHlDUjZTaitoVkJPRGtDclFYb1pJNUhWSURacVdXWkdHOWMxdzNH?=
 =?utf-8?B?a1hpQ0N5TForTU03dFdMNVFKeXlVWFRsczRXUFhKWmsxQjNhNG1xRnZ4ZzBr?=
 =?utf-8?B?RzhJRUpMWCtOUzkvODdldFoxbUYvUVpuMVA5Rks3Z3Y4MTc5YVAreUE1bjQ0?=
 =?utf-8?B?WnVrcUhGd1E4NEc5c1VmUys0Z0lveFFseE54MFcyOFlRSVJxbEMwMHc3QkZN?=
 =?utf-8?B?U2ZxOE1QeFVCdW9JWkFMMXUvYmpjeW1yZlZoTk9WSTZWTnVORHBMYWZRdkhl?=
 =?utf-8?B?NmhjRnFWZHlXWTFWcGFxYXBWODgwVjJaOW45U09LanRib1dEbWJBdVA1TnV3?=
 =?utf-8?B?VStVS1ZQWFdiV0N2Wms5QnRveUdlYVI1L3psUGpIKzRSY04zdlc4aEVqSWFW?=
 =?utf-8?B?WUIrVVExaUQxMGE0d3hFbXVVUmNFRlJIcE5Xci9YSVFOTFJuQUtSSzJzd1pP?=
 =?utf-8?B?dnQvMHp2dHNCY1JsOXhVcEJzU2k2cTNINnNzdFBoZ1RVY3NOdC9vVS9kVWNj?=
 =?utf-8?B?TWZZTW4rNWNGdFY4NUR4MDZLWkpabTJaTXREYUs1bzBxVWFoOWhia2F5UVEw?=
 =?utf-8?B?Y1g2SDNiK1FRMUJ2OEQzNmJjZTVXMW1aSUVBSk9vMG53S0gxMUxCT1p1SkUy?=
 =?utf-8?B?Y08zVmtDaXZOUVVvSGQ4Q2hNZXkxTkZ1RjFnOXpqZ3VaUUZ1VVJpZVBlTmw0?=
 =?utf-8?B?NmhsUmlnVzhLMFpGbzN6TzdUUFgraTVXeHNRd083MmJ3bFZEeXJUMENsTkEr?=
 =?utf-8?B?aFZIbXQ3VTVrSDlOUUxjMVBWbmFFQkgyZ1p1UVpydDJJWXdvWEgxazU3aG9m?=
 =?utf-8?B?MFNxMFFtNmxlZTI3ckswNEczVnBuaFJnT1VKcnBKY2ZBaUFMWThlR2E3NGs3?=
 =?utf-8?B?dTJxdEltYzJCdnc3a1NPZ24yVE1PZFVVd0xYSDVNclFlQ29iL0ptVUg4bEx4?=
 =?utf-8?B?d2RTSDZrL3hiN2tpUGZycVZod1I1VVJFRTQ4M2tiRWRvS3R3QkMzWlU4VlNV?=
 =?utf-8?B?djlmNGRWYnhsSUxKS3lqQ1JDMlE2UUV2TTVPQXN2ZE4wRWcvVWk3TUw5ZThD?=
 =?utf-8?B?TndCL04xYWkxTUdpTDlXcWlvVElpbXRKVHdkV2VGL2ppRUZndGZmWGZuTWlj?=
 =?utf-8?B?anoyM1QrSG5jbDdEVGE0djhZRkNGUnAvSUxMeTZVbnh2ek1VUFBKNUV4b0tL?=
 =?utf-8?B?Z1RxK3pKZ0wvTERrQjdUOExkMHlsWGl0Mm1WQy9xdkNnWVhUcjBRemJqYXBG?=
 =?utf-8?B?SFltVTBvWVE0QVRlU3NzMlJUcithOHdBMzZJZVloTndocjFwVHF0ZGZSMWYz?=
 =?utf-8?B?aWp6b3Z0a3pDV3k4MGFHWWw3ZTlNVHNSUVZQcHhsbkhMQUpuZDRJa2ZFRWNq?=
 =?utf-8?B?c3BkZjU2TzlObWdwb1ZVbnJIbEg0eEozdG5yTXJSc2w0Vkk2RVNwYUNzcGhz?=
 =?utf-8?Q?XVGFI8CMXKqVImDDA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86cf7e4-623c-4cdc-5192-08d9948c90d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 12:16:09.4341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbillaka@qti.qualcomm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7603
X-Mailman-Approved-At: Thu, 21 Oct 2021 15:13:16 +0000
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

SGkgRG91ZywNCg0KU29ycnkgYWJvdXQgdGhhdCwgdGhpcyBpcyB0aGUgZmlyc3QgdGltZSBJIGFt
IHBvc3RpbmcgY2hhbmdlcyB1cHN0cmVhbSBhbmQgc3RpbGwgZ2V0dGluZyBob2xkIG9mIGNvbnZl
bnRpb25zLg0KDQpJIHRoaW5rIEkgbWlzaW50ZXJwcmV0ZWQgeW91ciBzdWJqZWN0IGxpbmUgY29t
bWVudCBhbmQgY2hhbmdlZCB0aGUganVzdCB0aXRsZSB0byBpbmNsdWRlIGRwLWNvbnRyb2xsZXIu
IEkgd2lsbCBjb3JyZWN0IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCnNjNzI4MC1kcCB3aWxs
IGJlIGFkZGVkIGxhdGVyIHdoZW4gZHAgc3VwcG9ydCBmb3Igc2M3MjgwIHdpbGwgYmUgcG9zdGVk
LiBJIHdpbGwgcmVwbHkgb24gdGhlIGZlZWRiYWNrIGVtYWlsIGZyb20gU3RlcGhlbi4NCg0KVGhh
bmsgeW91LA0KU2Fua2VlcnRoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBE
b3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IA0KU2VudDogV2VkbmVzZGF5LCBP
Y3RvYmVyIDIwLCAyMDIxIDExOjExIFBNDQpUbzogcXVpY19zYmlsbGFrYSA8cXVpY19zYmlsbGFr
YUBxdWljaW5jLmNvbT4NCkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+OyBsaW51eC1hcm0tbXNtIDxsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZz47IGZy
ZWVkcmVubyA8ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IExLTUwgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBTYW5rZWVydGggQmlsbGFrYW50aSA8c2JpbGxha2FAY29k
ZWF1cm9yYS5vcmc+OyBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+OyBTZWFuIFBhdWwg
PHNlYW5wYXVsQGNocm9taXVtLm9yZz47IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9y
Zz47IEthbHlhbiBUaG90YSA8a2FseWFuX3RAY29kZWF1cm9yYS5vcmc+OyBBYmhpbmF2IEt1bWFy
IDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz47IEt1b2dlZSBIc2llaCA8a2hzaWVoQGNvZGVhdXJv
cmEub3JnPjsgS3Jpc2huYSBNYW5pa2FuZGFuIDxta3Jpc2huQGNvZGVhdXJvcmEub3JnPg0KU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGR0LWJpbmRpbmdzOiBBZGQgU0M3MjgwIGNvbXBhdGli
bGUgc3RyaW5nDQoNCldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUg
b2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywg
YW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KDQpIaSwNCg0KT24gV2VkLCBPY3QgMjAsIDIwMjEg
YXQgNToxNCBBTSBTYW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNv
bT4gd3JvdGU6DQo+DQo+IEZyb206IFNhbmtlZXJ0aCBCaWxsYWthbnRpIDxzYmlsbGFrYUBjb2Rl
YXVyb3JhLm9yZz4NCj4NCj4gVGhlIFF1YWxjb21tIFNDNzI4MCBwbGF0Zm9ybSBzdXBwb3J0cyBh
biBlRFAgY29udHJvbGxlciwgYWRkIA0KPiBjb21wYXRpYmxlIHN0cmluZyBmb3IgaXQgdG8gZHAt
Y29udHJvbGxlci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1
aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwLWNvbnRyb2xsZXIueWFtbCB8IDEgDQo+ICsNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpJIHRoaW5rIHlvdSBpZ25vcmVkIHNv
bWUgb2YgdGhlIGZlZWRiYWNrIHRoYXQgd2FzIGdpdmVuIG9uIHYxLiBQZXJoYXBzIHlvdSBjb3Vs
ZCBnbyBiYWNrIGFuZCByZS1yZWFkIHRoYXQgZmVlZGJhY2s/IFNlZSB0aGUgcmVwbGllcyB0bzoN
Cg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjI4NzI2ODgyLTI3ODQxLTMtZ2l0LXNlbmQt
ZW1haWwtc2JpbGxha2FAY29kZWF1cm9yYS5vcmcvDQoNCkZvciBvbmUsICR7U1VCSkVDVH0gbmVl
ZHMgdXBkYXRpbmcuIEl0J3MgcHJvYmFibHkgYXMgc2ltcGxlIGFzIGFkZGluZyB0aGUgIm1zbS9k
cCIgdGFnLCBsaWtlOg0KDQpkdC1iaW5kaW5nczogbXNtL2RwOiBBZGQgU0M3MjgwIGNvbXBhdGli
bGUgc3RyaW5nDQoNCkZvciBhbm90aGVyLCBTdGVwaGVuIHJlcXVlc3RlZCB0aGF0IHlvdSBhZGQg
InNjNzI4MC1kcCIgdG9vLg0K
