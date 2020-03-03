Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7F178BAD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7736EABA;
	Wed,  4 Mar 2020 07:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150110.outbound.protection.outlook.com [40.107.15.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8982A6E44F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGEtTwL4EA6yVbNsWxUnDGD6TD+M6j6c2Pu3lCERgdm+zbNqRyiGt0Ey1LpaAO99lZAQPB3ZVh7RGVKvK+mPko8BK0LfyDMRakIrkcDAXgeIDeB8p8+ZEi0RcBxbPxvxSit4W9LH/MSEvNEQqkwauvYbJ6Bo3sed3UpoGMoBe5p3v9eRC1igNwgXsMXEs0FQwGutodm4yWhomp3lHr95DlYzvN2xy3o+vF/eYHQrB7TnygZGvegKS3ENdnsUTlhgfsDTgE337dOcpLkFLckXwDfvsXKxjy4gsplfFBpvxVrug/TMFUi6nbbzb0RicAeinrtqXnc1IGPBgHyuqrAjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EpR+amPo26+11SXGqaaJsj8DmLzkwcMGha29swZiuo=;
 b=BBYSpBCODwKlwIPCNDkguYYvKtEXPGp3NlTsG1d6kJAiF2dlFeYC8LYKJSrjVo4Xh6Hle/1ST+g3QMzOkiR/fMM2U0TNaQQCxXPGv5ufiUGWhPUBlmli0UGWdUiDoaYCuX060io+QB7fXvjBis1EwFgJrQBgSBaS5iT538HSfLjQl0olWwShUjnYwoaH1AxoCZMJELtlnEClmwL63IlysU87PwJyEQ0I/ycGsZMT1bBb5LrJGarE6rv6JpecHgAY3Cq05RtuY9cYqr4N9yGJ5NDEqn7Dm2hCv1r0tBZ2TPkWAzxkd3tgHQ4AeBuybmO2Zv1SfAZhqWw8gq5YgD85ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EpR+amPo26+11SXGqaaJsj8DmLzkwcMGha29swZiuo=;
 b=AelTcetvrH/hp8JosxAeZQLbb15XZvpb2ov6QAYsJNgM/IVR5prlxY0B94jo8CoRKOZaMCX3m+jKgkUiIMFr50GXtw5QdiyxJI3+L6FzIvZU1pjjXA+tYBq1oR6GLMgCGyIDNezxoHHJT0IQwQFogTgvmQocIY5SWk8Y/0AjyoQ=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3516.eurprd02.prod.outlook.com (52.134.66.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Tue, 3 Mar 2020 15:16:55 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 15:16:55 +0000
Received: from [192.168.13.3] (213.112.137.122) by
 HE1PR0901CA0047.eurprd09.prod.outlook.com (2603:10a6:3:45::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Tue, 3 Mar 2020 15:16:55 +0000
From: Peter Rosin <peda@axentia.se>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp LQ150X1LG11
Thread-Topic: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp
 LQ150X1LG11
Thread-Index: AQHV8NJLbcHjFGK67k+oSkQVyC4qRqg1+gCAgADyJYCAAApigIAAAiEAgAADOQA=
Date: Tue, 3 Mar 2020 15:16:55 +0000
Message-ID: <6ad840eb-853f-52ab-3578-dd6916e1d6e2@axentia.se>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-29-ville.syrjala@linux.intel.com>
 <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
 <20200303142031.GA2856480@ulmo>
 <eacb0bee-730e-edea-3c60-88dcdc67f604@axentia.se>
 <20200303150518.GB2856480@ulmo>
In-Reply-To: <20200303150518.GB2856480@ulmo>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR0901CA0047.eurprd09.prod.outlook.com
 (2603:10a6:3:45::15) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9959b07-17ce-4c99-f6af-08d7bf85e8ee
x-ms-traffictypediagnostic: DB3PR0202MB3516:
x-microsoft-antispam-prvs: <DB3PR0202MB3516329360760427136BB8B6BCE40@DB3PR0202MB3516.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(346002)(376002)(39830400003)(366004)(189003)(199004)(66946007)(53546011)(31686004)(66446008)(2616005)(956004)(66556008)(66476007)(316002)(16576012)(81156014)(81166006)(8676002)(5660300002)(6916009)(26005)(6486002)(64756008)(54906003)(52116002)(86362001)(4326008)(16526019)(186003)(36756003)(71200400001)(2906002)(508600001)(8936002)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3516;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OKD8N23bXU0yhwEg0P4t+ii2u5L86Mgx+cKGS5+WuGkrwdzlIDiJCoqiBwNMALjP8BllSOq0nr0xxSjCN2w239IOFBN+qBf6T/68vHLuRuewj5HgHlOZXcWeZFFWGczPhgl9VT2EvEhiLmXPvnXhE8/Rb0Q30KrIHTYoYB36Y4RO3Fs5zneilFFhSJunPES61xdA2o55nDTVo1uXYOWdTHwzDx95/NUkgJHLX8K76OPS3n1+GPyzvSY/m7bYtm3rFiKDAVfiPOPDgOJBh2M777jOYLkzodoJEHZsb19yFJhMKv8YOIxz8uRe3aKL4Ubj97cMt1fEshv716pfqqHVeHroBjc9k/1iz8oxH+AGjVLt4jXs9nWiQZoGDct5Zil7NQ1VKHuAhTF7SBfg94BmfruLnP6T3iSKHI5mjZkiNbQCGWfvanxBIitrnPMh/BIj
x-ms-exchange-antispam-messagedata: S2/dTU+es6fQL3bHyc8PXn4cz6d+/dJfUWxPVSok8RBRiWzwjLZGMDTbHu8/zCby/ORdMdwMxZo5sqkm+fj8qDVuJTowt1xbSGZcIG9ClTKK2G6FXpamOSCQa/rpLHSCx56GneXh3B+xpSXGl86Upg==
x-ms-exchange-transport-forked: True
Content-ID: <C0B97D44D0725B4CAF30B2549C151DBB@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f9959b07-17ce-4c99-f6af-08d7bf85e8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 15:16:55.7731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cp4AhJuEnGIA27rIeIVWYWXGl1AdXyBHCha34FdgCdIoHqQkDGD0t3DK9l/Qzw4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3516
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Thierry Reding <treding@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0wMyAxNjowNSwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6DQo+IE9uIFR1ZSwgTWFy
IDAzLCAyMDIwIGF0IDAyOjU3OjQ1UE0gKzAwMDAsIFBldGVyIFJvc2luIHdyb3RlOg0KPj4NCj4+
IE9uIDIwMjAtMDMtMDMgMTU6MjAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOg0KPj4+IE9uIE1vbiwg
TWFyIDAyLCAyMDIwIGF0IDEwOjUzOjU2UE0gKzAwMDAsIFBldGVyIFJvc2luIHdyb3RlOg0KPj4+
PiBPbiAyMDIwLTAzLTAyIDIxOjM0LCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0KPj4+Pj4gRnJvbTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4+Pj4+DQo+
Pj4+PiBUaGUgY3VycmVudGx5IGxpc3RlZCBkb3RjbG9jayBkaXNhZ3JlZXMgd2l0aCB0aGUgY3Vy
cmVudGx5DQo+Pj4+PiBsaXN0ZWQgdnJlZnJlc2ggcmF0ZS4gQ2hhbmdlIHRoZSBkb3RjbG9jayB0
byBtYXRjaCB0aGUgdnJlZnJlc2guDQo+Pj4+Pg0KPj4+Pj4gU29tZW9uZSB0ZWxsIG1lIHdoaWNo
IChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9jayBvciB2cmVyZXNoIGlzDQo+Pj4+PiBjb3JyZWN0
Pw0KPj4+Pg0KPj4+PiBUTC9EUjsgSSBkbyBub3QgY2FyZSBpZiB5b3UgY2hhbmdlIHRoZSByZWZy
ZXNoIHJhdGUgb3IgdGhlIGRvdGNsb2NrLg0KPj4+Pg0KPj4+PiBUaGUgd2hvbGUgZW50cnkgZm9y
IHRoYXQgcGFuZWwgaW4gc2ltcGxlLXBhbmVsIGlzIGR1YmlvdXMuIFRoZSBwYW5lbA0KPj4+PiBp
cyByZWFsbHkgYW4gTFZEUyBwYW5lbCAoY2FwYWJsZSBvZiBib3RoIFZFU0EvSmVpZGEgUkdCODg4
LCBzZWxlY3RhYmxlDQo+Pj4+IHdpdGggdGhlIFNFTExWRFMgcGluKS4gIFdpdGggSmVpZGEgeW91
IGNhbiwgYXMgdXN1YWwsIG9taXQgdGhlIDR0aA0KPj4+PiBkYXRhIGNoYW5uZWwgYW5kIHVzZSB0
aGUgcGFuZWwgd2l0aCBSR0I2NjYuIEluIGVpdGhlciBjYXNlLCB5b3UgbmVlZA0KPj4+PiBhbiBM
VkRTIHNpZ25hbCBhbmQgbm90aGluZyBlbHNlLi4uDQo+Pj4+DQo+Pj4+IFRoZSBwYW5lbCBjYW4g
YWxzbyByb3RhdGUgdGhlIHBpY3R1cmUgMTgwIGRlZ3JlZXMgdXNpbmcgdGhlIFJML1VEIHBpbi4N
Cj4+Pj4NCj4+Pj4gVGhlc2Ugb3B0aW9ucyBhcmUgb2YgY291cnNlIG5vdCBleHByZXNzZWQgaW4g
dGhlIHNpbXBsZSBwYW5lbCBkcml2ZXINCj4+Pj4gKGFuZCB3ZSBoYXZlIGFsd2F5cyB1c2VkIGZp
eGVkIHNpZ25hbHMgZm9yIHRob3NlIHBpbnMgaW4gb3VyIGRlc2lnbnMsDQo+Pj4+IElJUkMpLiBB
cyBmYXIgYXMgSSdtIGNvbmNlcm5lZCwgdGhlIHBhbmVsIGNhbiBiZSByZW1vdmVkIGZyb20NCj4+
Pj4gc2ltcGxlLXBhbmVsLiBPdXIgZGV2aWNlIHRyZWVzIGFyZSBub3dhZGF5cyBjb3JyZWN0bHkg
ZXhwcmVzc2luZyB0aGUNCj4+Pj4gaGFyZHdhcmUgd2l0aCBhbiBMVkRTIGVuY29kZXIgYmV0d2Vl
biB0aGUgUkdCIG91dHB1dCBhbmQgdGhlIHBhbmVsDQo+Pj4+IGFuZCBwb2ludHMgdG8gdGhlIHBh
bmVsLWx2ZHMgZHJpdmVyIGZvciB0aGUgcGFuZWwuDQo+Pj4NCj4+PiBIb3cgZG8geW91IG1ha2Ug
c3VyZSB0aGF0IHlvdSBhbHdheXMgYmluZCBhZ2FpbnN0IHRoZSBjb3JyZWN0IGRyaXZlcj8gSWYN
Cj4+PiBpdCBtYXRjaGVzIHNpbXBsZS1wYW5lbCBhbmQgcGFuZWwtbHZkcywgaXQncyBub3QgZGV0
ZXJtaW5pc3RpY2FsbHkgZ29pbmcNCj4+PiB0byBwaWNrIHRoZSByaWdodCBvbmUuIFdlbGwsIGl0
IG1heSBhY3R1YWxseSBiZSBkZXRlcm1pbmlzdGljIG9uIExpbnV4LA0KPj4+IGJ1dCBwZXJoYXBz
IG9ubHkgYnkgYWNjaWRlbnQuDQo+Pg0KPj4gWW91IGFyZSBwcm9iYWJseSByaWdodCB0aGF0IGl0
J3MgZnJhZ2lsZSwgYnV0IG5vIHByb2JsZW1zIHNvIGZhci4gVGhhdA0KPj4gc2FpZCwgSSBkaWQg
d29uZGVyIHdoeSB0aGUgcGFuZWwtbHZkcyBkcml2ZXIgIndpbnMiIG92ZXIgc2ltcGxlLXBhbmVs
IGZvcg0KPj4NCj4+IAljb21wYXRpYmxlID0gInNoYXJwLGxxMTUweDFsZzExIiwgInBhbmVsLWx2
ZHMiOw0KPj4NCj4+IEkgZmlndXJlZCBpdCB3YXMgYnkgZGVzaWduIGFuZCBkaWRuJ3Qgc3BlbmQg
dG9vIG11Y2ggdGltZSB0aGlua2luZyBhYm91dA0KPj4gaXQuIE1heWJlIEkgc2hvdWxkIGhhdmU/
DQo+IA0KPiBJdCdzIG1vc3QgbGlrZWx5IGJlY2F1c2UgcGFuZWwtbHZkcy5vIGlzIGxpbmtlZCBp
bnRvIHRoZSBrZXJuZWwgYmVmb3JlDQo+IHBhbmVsLXNpbXBsZS5vIGFuZCB0aGUgZmlyc3QgbWF0
Y2ggd2lucy4gWW91IG1heSB3YW50IHRvIG1vdmUgdGhlIGVudHJ5DQo+IHRvIHBhbmVsLWx2ZHMg
dG8gbWFrZSB0aGlzIGEgbGl0dGxlIG1vcmUgcm9idXN0Lg0KDQpPaywgb3IgYmVjYXVzZSBJIGRy
b3BwZWQgdGhlIHNpbXBsZS1wYW5lbCBkcml2ZXIgd2hlbiB3ZSBubyBsb25nZXINCmRlcGVuZGVk
IG9uIGl0LiBFaXRoZXIgd2F5LCB3aGF0IGRvIHlvdSBtZWFuICJtb3ZlIHRvIFsuLl0gcGFuZWwt
bHZkcyI/DQpJdCBoYXMgbm8gbGlzdCBvZiBwYW5lbHMsIHlvdSBoYXZlIHRvIGVuZCB3aXRoICJw
YW5lbC1sdmRzIiBpbiB0aGUNCmNvbXBhdGlibGUgZm9yIHRoZSBkcml2ZXIgdG8gYmluZC4NCg0K
Q2hlZXJzLA0KUGV0ZXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
