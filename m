Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB24C4021D8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 03:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8359489A4F;
	Tue,  7 Sep 2021 01:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C9789A4F;
 Tue,  7 Sep 2021 01:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGJ4U6T0M3loD9Wg3nzMzgKvaEI77nLMD+WclOFJaCkGM7UROvaC6X2DPIZE2YUFegMS4zfhkXqLOxdubNHpob8CofIHmmulCeGQ6z35hytEN8vnOMdWFEDGq0T6iKRBr3zZ8M314+MT5YsvNHqJykpvm2ETVZjuCkAoMBo4YjrJWOG7Dz08tSmfgJsM/eZu/RFnEWxp7PyWoxYN2YT4+Xe9CWB46EVPGAy1hXAQMD9X9ZJeE/yrOAdDuExkGfdu0VgwWrL6A9y//mx/F9i0oTaepL4Q0AYjj4zEG7XlivtR61ZXV+Ui2xtOVWgQ5MnY3ZeLh0Di0FXYqkUyW1J+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHm0EjMxncNA5XVt262vPr7jBjkLO53f6pMVlDdEZ4Q=;
 b=nZScVC5DNsYXyQo9wJ75gz5at9Xy/zPuelsNgEOMwygWeLYeUQa2oUsDFoUmRyvmt9fFp7m8RUl+EXT6VIEafhwNd7dAts2xNrPVXcYHswU9PT7CFWwCFJ0wm2YbYm3nP54UYnW3ZZeDUe4GSmQqDwo5s6qmizsaJLQxa4Zv2N6trSFqBVfIOGdRJ0cGIuy/NMSRhi3sNbNDljd36sQzQDoLwqgYUH0ii8DEEDTkC+aQqclN5DCK7ronqYQCx0dXWS9ndEoYdeLOarxkaObjij7CdVYdSR1Hh99e5FLLgJQKMKjmRIt7BX/OHviJZYmEt9GD3EVFOvh6/3XcMCtkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHm0EjMxncNA5XVt262vPr7jBjkLO53f6pMVlDdEZ4Q=;
 b=TtxCwUilGeMCJfY35Ij229pH2gmAvWnnngaNmhpJoBGwWT2n+MevfMpdLHdu9xOYVB8Y/VC8ZddGQFzVMA4yUbK2o8d4m/gc9bi+QZVFBeSzZ+9PsjfEnVIISYuGq7aEx630jvdzMa2ZrQ/Bpd38XWn6rlVtlNPsrpdel6JzJZE=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5360.namprd12.prod.outlook.com (2603:10b6:5:39f::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18; Tue, 7 Sep 2021 01:52:31 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 01:52:31 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "chenli@uniontech.com"
 <chenli@uniontech.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
Thread-Topic: [PATCH v2 1/2] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
Thread-Index: AQHXorxC2qNpSn+T60iNxy9r/D8nFauW3oUAgADx1oA=
Date: Tue, 7 Sep 2021 01:52:31 +0000
Message-ID: <DM4PR12MB51652CE7B02894D9D09748D587D39@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210906011210.80327-1-xinhui.pan@amd.com>
 <20210906011210.80327-2-xinhui.pan@amd.com>
 <72212116-c95b-710c-85e4-673e68e6cf63@amd.com>
In-Reply-To: <72212116-c95b-710c-85e4-673e68e6cf63@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=3ffbd881-c2a5-4343-b659-f6fe29b7a685;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-07T01:51:45Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7c6f1b8-e0fe-4001-9e97-08d971a227c8
x-ms-traffictypediagnostic: DM4PR12MB5360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5360CF1AD66F19E0AE181EE187D39@DM4PR12MB5360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fvUbuj28kU9WcyW+mG5IWJZRSKcySo4rR0xWigpKsrNu4a/VTRIYYUzZ7inbLX2EYBTqPsjKku2+gZTo/Cnl5IFP+L8TZapSW+vAgwStXalBodIJEc+4kgHMkvLRNpv2PZH/Icz7mHu7Jst0N9uoENNYLmNHzgh8IBqeGG8IL3VRBg4GglNRZyb+3UunkplVqbgoPCjLbOVD4h0+8fCCvaz3uxdxRWYwfMaYaLjrTswdpVJ3/yVv8/l+ILVK/LscAmR8khTmNRNP5DNboLC84qKBJXgg3h8jkXU+v1lZo0kNPsj/oq4cUbUHVPS1IGTzxrgSAxqgQiLJ3uGK+Jl+l9Q5SCRACsZccEVgzflOxFFdisXbtDULJ2MCGCdeDvLL2OL905GSyIcX3TZAk4v6s4QZCpCo589Xb8ls9e8hcHZtvh67SxEtH2YqDmPogNPMbaehm0SJnVA/MHrxBnf7lBQqC64aquS7jO9QxGCejrkIryl+a6fLrJfefxeMHSz/GyxmHhITQwIwzdq2oWeH71EOuVXH5b1GfbUroDIw1/GzVg93bay7jMR9tz0ax793ajgq5fWjOseZz/rqTia1QSGME+lNorFxFFEAzq8587WE3v+t4A0zEXRN7pPr5xUnSHHffuFEoHnKyAiy49gRK/8A+64Xd1rDCzGpTlVuzXQehmS+JsM5k8DszNPJiGggX3pwC0Mcm2DNKg4sLzbNmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(8936002)(66556008)(478600001)(66446008)(64756008)(55016002)(38100700002)(110136005)(54906003)(83380400001)(66476007)(71200400001)(316002)(52536014)(2906002)(4326008)(186003)(7696005)(26005)(33656002)(38070700005)(9686003)(53546011)(6506007)(66574015)(66946007)(76116006)(8676002)(86362001)(5660300002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ni9RekVCeU56aVpuQklab1JVaTkwcWVWYktwczkvOHBQRWIrazNtcmhsU2FZ?=
 =?utf-8?B?MWh2VVdqY0dMZkZlNWR6WHBMOHR5WGtlcXpubSttazRmbWlzQ2c4ZytIU25F?=
 =?utf-8?B?YXRiRWhaWXBaU0Q3c1J4SnA4NmpYeDZoT1JlN01MdTA5bjh0bE9vMmRJeS93?=
 =?utf-8?B?WW5oWlU5OVhNY1pzNVVxUzVaYTZDaW1BUmY3eEVjN2VVQlZwb3U4R3l3NTcw?=
 =?utf-8?B?cWp4dTMrcVRRMS9ld09GTkYyaWJiVXRxSDBjNC9Xb2o2cS9mSEVEWkJVbUFk?=
 =?utf-8?B?ZCtFckRiRE1Yd1VuMDJJR0VRWGQrVG1DTDlzZ2Uxcy9iaEI3VG51UjcvYWUz?=
 =?utf-8?B?ZzFGVDBPRHJFWTRUM0UvV0ZUMnhUSWtEU2dhblRRRWJoT0IvQ21TSkpHU1d2?=
 =?utf-8?B?T3MyRFk3SVhjSlJtODBaQVZOa2Q5NHd6aU52NGdaRGdYNkliK3JDOGtxMk55?=
 =?utf-8?B?cnpoWWF3K21aN0FYVmdkMEQ3OTdiV0JQYk9NNXhVR2xvS1JyT3Vza2JDNHZ4?=
 =?utf-8?B?L2dwcWRVRm1VSWdhdHZrbnlmZUxHYm5kU05LYldYRWQ3T244RHloZjRuY1R5?=
 =?utf-8?B?SXR0enYrWnRMVFY2eHpCUTdRZU5RRDJpVHA4RFJkNmZicU90TTl6QjJ4WVlt?=
 =?utf-8?B?UzBZRFNOSEthOU5adUVxeEZQcFlIcjJOR3g1VU96RFFSbHU5bDA3TTNudEhB?=
 =?utf-8?B?OEhZREZqUlNqTHZvcGpQT3pWclN4eFZFdGtNS1hGR1phRWpjdkRhSmNnR1BB?=
 =?utf-8?B?aXg3aklvUVBGMUdXV2hnZ1J6b1BISVE3cGdRYi9mN2Jxby9nKzlqOWdHNGh2?=
 =?utf-8?B?bWxJd3E1MHlaUHNlRVZtMFV1b1BocUJVU0x2OU9iVlFodExGODVyZVdCYnpj?=
 =?utf-8?B?ZzRRTC80WC9rbkYvT3krSXU3QVFnTytjaE9UYWdjZ21qOTdxK0hkUEl2TXBr?=
 =?utf-8?B?Y3BsVHVLY00remlkNEVIeWR1STM3ZEtyYndmVHR2NkhJcG1nMndjRWJTaFc4?=
 =?utf-8?B?d3pFWlUvdjgxbmV0aVBoTnJENzN1V1RrNjdibE5MVG5nVVJaYys0NDhWV0FY?=
 =?utf-8?B?aThJT2sxUitsS2wxSVJvQXJjb2FzaVhVV093bDdYNE14d3FhRmtXUGQ0VjZs?=
 =?utf-8?B?cVNlSTRvc2NqaUExN0krZXY5LzBnZndjM2FWSjRZQ1BaUVN0Ynp0TVFBQlVy?=
 =?utf-8?B?Q2JwQjNYeEo0NVpQOFUxS1dyZmhxNXloWDdPQlVrRG0ySGIveTNvb2FXT3p6?=
 =?utf-8?B?TmNkaUhZVEJHY21KQjBGM3Ftamk4WjZ1a25xdThHSkZDZ3M4Q2JLeWo4U0JE?=
 =?utf-8?B?OUJIcHhrRUtISUkzb2Rqa09kdGIxSis3azFQQU4rcVlCZW1ML1dxNHIvZVhi?=
 =?utf-8?B?Q28xcHY1N0VVQThGU1VLWVQ4bHNqSmZ4eUJ3OHllM0ZteFhvRFNydnRQay94?=
 =?utf-8?B?WTZFd2FxMlYxcVlQWTdNcWZ1dy9EcStQSmdwdEtaTkRydGZEL3g2RXgwMy9Y?=
 =?utf-8?B?Q0xWYnU5Vy9IZXQ0dzZnY2p4Z2NBbkpSS1pEa3plcXhuVFczOXplSUg2eEdx?=
 =?utf-8?B?SVJCMXpuZ3NkNG1LdzNDaFV2OGJHcUFUVFFiT0ZWS0lSL0czOVRQMXVuZjhn?=
 =?utf-8?B?WUprVXphdHhvcmxHTjBLTi9HaXJPMmExUWVnMC9GWFVkNUxwTU9ZbTR2RG9Q?=
 =?utf-8?B?QzNEMTZyZUU5ZkFUaElQcTZXQUhPWjFLUmhPUUdYR1ptTFlyRjNzN2N5ajJz?=
 =?utf-8?Q?kXnl4l7Xasi5PS9OFbBDSP7XwgrDii8YSokpCYE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c6f1b8-e0fe-4001-9e97-08d971a227c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 01:52:31.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jV4v9QRPqaUSAr5M30nJQUA/SlnOhZA82uNXHj6XfZwEf4nteMORoGkp3B2RCPsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5360
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KSXQgaXMgdGhlIGludGVybmFsIHN0YWdpbmcgZHJt
LW5leHQuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KU2VudDogMjAyMeW5tDnmnIg25pelIDE5
OjI2DQpUbzogUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPjsgY2hlbmxpQHVuaW9udGVjaC5jb207IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBkcm0vdHRtOiBGaXggYSBkZWFk
bG9jayBpZiB0aGUgdGFyZ2V0IEJPIGlzIG5vdCBpZGxlIGR1cmluZyBzd2FwDQoNCldoaWNoIGJy
YW5jaCBpcyB0aGlzIHBhdGNoIGJhc2VkIG9uPyBQbGVhc2UgcmViYXNlIG9uIHRvcCBkcm0tbWlz
Yy1maXhlcyBhbmQgcmVzZW5kLg0KDQpUaGFua3MsDQpDaHJpc3RpYW4uDQoNCkFtIDA2LjA5LjIx
IHVtIDAzOjEyIHNjaHJpZWIgeGluaHVpIHBhbjoNCj4gVGhlIHJldCB2YWx1ZSBtaWdodCBiZSAt
RUJVU1ksIGNhbGxlciB3aWxsIHRoaW5rIGxydSBsb2NrIGlzIHN0aWxsDQo+IGxvY2tlZCBidXQg
YWN0dWFsbHkgTk9ULiBTbyByZXR1cm4gLUVOT1NQQyBpbnN0ZWFkLiBPdGhlcndpc2Ugd2UgaGl0
DQo+IGxpc3QgY29ycnVwdGlvbi4NCj4NCj4gdHRtX2JvX2NsZWFudXBfcmVmcyBtaWdodCBmYWls
IHRvbyBpZiBCTyBpcyBub3QgaWRsZS4gSWYgd2UgcmV0dXJuIDAsDQo+IGNhbGxlcih0dG1fdHRf
cG9wdWxhdGUgLT4gdHRtX2dsb2JhbF9zd2Fwb3V0IC0+dHRtX2RldmljZV9zd2Fwb3V0KQ0KPiB3
aWxsIGJlIHN0dWNrIGFzIHdlIGFjdHVhbGx5IGRpZCBub3QgZnJlZSBhbnkgQk8gbWVtb3J5LiBU
aGlzIHVzdWFsbHkNCj4gaGFwcGVucyB3aGVuIHRoZSBmZW5jZSBpcyBub3Qgc2lnbmFsZWQgZm9y
IGEgbG9uZyB0aW1lLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFu
QGFtZC5jb20+DQo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA2
ICsrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBpbmRleCAxZmVkZDBlYjY3YmEuLmYxMzY3MTA3
OTI1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+IEBAIC0xMTU5LDkgKzExNTksOSBAQCBp
bnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4ICpjdHgsDQo+ICAgICAgIH0NCj4NCj4gICAgICAgaWYgKGJvLT5kZWxl
dGVkKSB7DQo+IC0gICAgICAgICAgICAgdHRtX2JvX2NsZWFudXBfcmVmcyhibywgZmFsc2UsIGZh
bHNlLCBsb2NrZWQpOw0KPiArICAgICAgICAgICAgIHJldCA9IHR0bV9ib19jbGVhbnVwX3JlZnMo
Ym8sIGZhbHNlLCBmYWxzZSwgbG9ja2VkKTsNCj4gICAgICAgICAgICAgICB0dG1fYm9fcHV0KGJv
KTsNCj4gLSAgICAgICAgICAgICByZXR1cm4gMDsNCj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0
ID09IC1FQlVTWSA/IC1FTk9TUEMgOiByZXQ7DQo+ICAgICAgIH0NCj4NCj4gICAgICAgdHRtX2Jv
X21vdmVfdG9fcGlubmVkKGJvKTsNCj4gQEAgLTEyMTUsNyArMTIxNSw3IEBAIGludCB0dG1fYm9f
c3dhcG91dChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3QgdHRtX29wZXJhdGlv
bl9jdHggKmN0eCwNCj4gICAgICAgaWYgKGxvY2tlZCkNCj4gICAgICAgICAgICAgICBkbWFfcmVz
dl91bmxvY2soYm8tPmJhc2UucmVzdik7DQo+ICAgICAgIHR0bV9ib19wdXQoYm8pOw0KPiAtICAg
ICByZXR1cm4gcmV0Ow0KPiArICAgICByZXR1cm4gcmV0ID09IC1FQlVTWSA/IC1FTk9TUEMgOiBy
ZXQ7DQo+ICAgfQ0KPg0KPiAgIHZvaWQgdHRtX2JvX3R0X2Rlc3Ryb3koc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibykNCg0K
