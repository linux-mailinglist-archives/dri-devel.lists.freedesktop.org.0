Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C663A7DEE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FEE89FC3;
	Tue, 15 Jun 2021 12:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A56C6E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 12:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyETGPJ3nApqlUK/A1l+rTdxkN4Wqo/YYSuG5Gfnpmb8+/DR8IN/OPCDt8RIpeyfzU1npAMKKF1FIDr9qfECys+cT8UKVH2HXitPrrCMBRh+59ndJg3BcgBcVYZbQs/dFh2042WPtKGIYJMVL/OUcxy3YCjE45wr4bh4pCATggjGHY6zhNUO6uiUxFaCLNuVxC8gwgGGAU1+vTyA/JD3DoFiuWvgR3os+3al6Sapsx7lGXWt+tHE2C+cv19kuCoe40MvA4iboim9LSEZoDDun8l+j3TdzrvBeX5qFnjOPRi/jJvmlqEEWOx2Ebs+cnIuS28kq/Fs60VO+D03I812jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+pnzv6C/YCMmpDhl95MEjOPkqOlmDsjIlMpH/vWc3c=;
 b=M2IDPSigCpuqy+J0ZEaOVdYxnE0cT6cS7EvYOTbNbJt46+T3a2cUnQE/cKEiFDXYtx4ohX3SCefWztvAOAp6Sa/DdyNlil2cFHfvf5rSCw0zj0sz9TYf7m46tHlqyytp2EV1NOB0bTrE6UuNmXEelsGSC7QSw2cH953OFBAXzDHUNwPrdswOg/QBK/0MAEP3hZ6hg3TNqCcdztrsdxCnJnC2Ud7lmluZs+nOMM+trKxtE0cgKr8yhU6ByBkTR92iQnpFaNhjqtreIQuy3BT+emYygm9fxAVxaHDnY/JpX/K0+NICfcqMyi3wc1zhwVzKlLi1IcuBt0cZxmdKJSApTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+pnzv6C/YCMmpDhl95MEjOPkqOlmDsjIlMpH/vWc3c=;
 b=ed2WdAxgfUPnLnmDsyTcaHXNlaSnEPANEGWS3vdUcNlGY9y5Z4E6VtrrI/pvuRVPdOyJGgUn41bAOKrRKWjAku24U86MhBv+vfwT/Jjf/qqy0CDS0F+MET9n4JuyfG/DnC0Rhc9MmibxXfxPgwmBdt9XnH6E1+WXrw6Vgr3iDW0=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5360.namprd12.prod.outlook.com (2603:10b6:5:39f::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Tue, 15 Jun 2021 12:11:15 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2091:3f28:3f68:508]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2091:3f28:3f68:508%6]) with mapi id 15.20.4242.016; Tue, 15 Jun 2021
 12:11:14 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC PATCH] drm/ttm: Do page counting after populate callback
 succeed
Thread-Topic: [RFC PATCH] drm/ttm: Do page counting after populate callback
 succeed
Thread-Index: AQHXYd3EIzqj0lg4jk+TVlDTcdup/asU+MGAgAACjgA=
Date: Tue, 15 Jun 2021 12:11:14 +0000
Message-ID: <4719A30A-0B23-4053-B8EB-AC9BD21DBE40@amd.com>
References: <20210615115746.27424-1-xinhui.pan@amd.com>
 <f70e88b3-f0db-fca8-f05e-f685f1a913ad@gmail.com>
In-Reply-To: <f70e88b3-f0db-fca8-f05e-f685f1a913ad@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 146a41a6-25df-4015-4ff7-08d92ff6ac5b
x-ms-traffictypediagnostic: DM4PR12MB5360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB53609DC7ED6C5228D6DBEA2787309@DM4PR12MB5360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eso5wtRjFLwtgagzmpBYULFDIwd0qZB1fYsNXrAAEf46sxXztcckEn2gG4jR8VCu3wVllMh7D/DefEZawthwY0agClmlHt9BEeF3sXhMB0rFO0lqCtqz0vhfZ0W8BESVpktZ1u7mEWeAj4Oe3TJ2BaqKYI18Oyolv3/Af5Ks4UOltyi4DOOhQJ9iLvnvVfW4vW8RsP2dBOsps+k3Kg7M2FgfofG44+q9i2z0iAn406QXlFPOO6EVX+FEWblk6JqFeicgr/Y2kPJhg79GoF/hqZKjLRVSxvD7+zLf4S/ceuzoLoBHUkOwOF+WCMvD2OzLl8LscgZpWRKOevmooyTlDp4Wq/jRRE1mJdAGAwT7GlLYtbVapq8UKBKOEB8wkDpAYiEeXmLpwOKrqxcPH7mmd1E/7Qp/zai59wjxA5I6gnsivbmvvCrZtwJKFnb0fhHy+t/gCoFXAB4x7B8mOa7kVdlkOAfKw7Z/lN4124wB1YVRdIqmUir/LW1xv8NnCOw2jC543IJvwjWmVQog+m8OhUGCFiU5ccKVJOMEb/k1n4hJJDbhd0wtkq3S/nQT2/7hAqyVdSyNOHA223qj85tRM67aldQTM9m3dEJJBLjLvIQ+StjfybppzEbCw6F3B7IiF1KrSZYY0QDIwRp/18t+qQiOkiNCLd2r+Xk2L/TBijA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(4326008)(2906002)(6486002)(26005)(6506007)(38100700002)(6512007)(2616005)(71200400001)(186003)(122000001)(5660300002)(76116006)(8936002)(6916009)(86362001)(316002)(36756003)(54906003)(64756008)(66946007)(66556008)(478600001)(66446008)(66476007)(66574015)(8676002)(33656002)(91956017)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjdndzZjQlh0MU5KVWFRYlFKU3JNcXJHM2JGL2JlNjV1RzBWaWwrZ1ZycTU5?=
 =?utf-8?B?ejV2Sis5YUI3djRkUEtDUEQ3Y0h6dzk4STduRHJEdjh1d2djbkorY2NJdS91?=
 =?utf-8?B?MFZaSjVSUHVRd3FtS0dTN1JRRnlLOElIemthSEFJb3F6SzdDTWJvNlUxTmgy?=
 =?utf-8?B?MURnTVZSNktjdUlzMTVyN0QrQjg4cURNV1QzTlc3NkVSaGlBR2wvMkZqalB3?=
 =?utf-8?B?NlRNWVVTOFBUWHFKYzZQWEtIYTFNUEwwdVl4MXR5RW5iT09DMkVGTjdBMG04?=
 =?utf-8?B?bWd1Y2pEa21uVW5zY01XYVlRUzVnMElkemw2YVhnUkUzNU84NS9ESVcxSWVX?=
 =?utf-8?B?Y3E0ZEN2VjFqS0pueTdBN05pTXRlNWpzcDU2amhMM0p1bVR2SjZrMk1YcElk?=
 =?utf-8?B?YVo2WXJTb1RHVmJkVGN1bjZyby9FaUs2N0MyTlk2M0FvVm1GY1gzelR4R0t2?=
 =?utf-8?B?SUJ2N3FOcUM5bFZrUlp4YmRKZ3NEMW1iUDEzYkwvRWtha25jY25WV3BkNUJI?=
 =?utf-8?B?dWNaSTNCQTBXZGdSbktjTmtlSmlOU0Y4R2tqTDBjYjl2elltSWRhVDVqTE91?=
 =?utf-8?B?K2tkTDl4OXZTNGRpdFpLajBkWE1vbC9kV2NWNGVzZGxRbkZYbm1sYURQNnB4?=
 =?utf-8?B?dnliMWJyZ1E2Uk9kZzVkTGM1enJCdEwrMWM2d1hSTU9iNGFzZHNCVHVBMTdE?=
 =?utf-8?B?STB0RTc3Mi9SL3J4R0x5cVdLUXFCTTNaKzNvdFN3VXhoZEZ0NzJMVVhzVE56?=
 =?utf-8?B?TEhLL3M5Y2tHUk1xT2ROSHNubDVMd0Zpc1hselhOK2oxQlBkSVRKcHR6YVNR?=
 =?utf-8?B?SWExeisxNElHUXBham9sOEp0dDc4TDErVmZ6TWJMQ2JEelJZRTVYM1JlNDdX?=
 =?utf-8?B?aVl3VDNXRWFUeTJSeWpzUmhjbDFVbDZ2dlF4Mnl1M1A0UHd3djA5Y2tTQS9o?=
 =?utf-8?B?bnZrWkRyVzdSUDZCaTN2ZFcxczBDRVg5RmRpOEQwVWtMR2t1eTNLMlpWVE9v?=
 =?utf-8?B?QjlIL1NpMGVsRGdtMlNkeWFoTGVocG80SGpRU3VEM1BuemhQMGNNWGZEOFFH?=
 =?utf-8?B?SVNEL1NKTG8rRzZkb08zTDNiMktvc1pyR0p0ajVnNURlQ2JoeVo0Q29odGE3?=
 =?utf-8?B?UFJCbExXVnRFdS92bXdXMTVPTGZMT3U5NExGVThxcmVMYVMzdW0zb2RLUU42?=
 =?utf-8?B?ZzFVZ0pKQm5vYTlVaWJRRWlDZ0VydjUydXZ6UWNYbTZPaHV1SlhtQ3FOUW9N?=
 =?utf-8?B?NWNsajJsMW5GUHhZdTRiVGYvN3ZkbEVuR2p5VWJERlU4Z2ZCSlIxQlJzT1M5?=
 =?utf-8?B?TXZVclJxa0o4aWJVK3dSRGxKTUdGTlVDNXZOMHFHMlp0VE05NFI0bUdnbmYw?=
 =?utf-8?B?TGgxZGtvY1YwbS83c2g0N1hXUE5ZSGxTVXFWYVl2bjJqS2p6eFNJVkxDc2wv?=
 =?utf-8?B?Yk9yMnVuYi95UFg0ZDlmZWJXQUR4LzQ5M24vcWpqbVlqQStiTzEwc0pSdmYy?=
 =?utf-8?B?Y1RHRmcrbXZaUU1UcG5JeGJJSVRYTkNydFZKMHE2VUx0TXRSL2hzTnpUOUk4?=
 =?utf-8?B?NEFIRWIrVXY2eC9zSlA5TDk3b3FITXhjY3NoZklhK2dxOWh4VHFUM0J0RWta?=
 =?utf-8?B?MXQyNTQ1dmVSdFYycnhEMmhPRzRWeEJDcXFPYnB0eEVTVTJBSDNuSWdMMmJY?=
 =?utf-8?B?emdaZ1RNaWNsdEFjdnZKbG1Cb0lEcUlrZXYxZ2ZXSnlhaTduUkc5Z0FhWno0?=
 =?utf-8?Q?z//XSG5oSooyDCWG2HTDf2lwz85xZh/jfcsPeZ8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD5DC1F633C02B4CAC5C80A453E3764A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146a41a6-25df-4015-4ff7-08d92ff6ac5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 12:11:14.8915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vJ0hpJSCEYk3zBoIc6yh034M6GK9D7+2DyaneUhXvv4TMGBgY/UOLPWeBNEuyHW
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gMjAyMeW5tDbmnIgxNeaXpSAyMDowMe+8jENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiDlhpnpgZPvvJoNCj4gDQo+IEFtIDE1LjA2LjIxIHVt
IDEzOjU3IHNjaHJpZWIgeGluaHVpIHBhbjoNCj4+IEFtZGdwdSBzZXQgU0cgZmxhZyBpbiBwb3B1
bGF0ZSBjYWxsYmFjay4gU28gVFRNIHN0aWxsIGNvdW50IHBhZ2VzIGluIFNHDQo+PiBCTy4NCj4g
DQo+IEl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIGZpeCB0aGlzIGluc3RlYWQuIEUuZy4gd2h5IGRv
ZXMgYW1kZ3B1IG1vZGlmeSB0aGUgU0cgZmxhZyBkdXJpbmcgcG9wdWxhdGUgYW5kIG5vdCBkdXJp
bmcgaW5pdGlhbCBjcmVhdGlvbj8gVGhhdCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBzZW5zZS4NCg0K
ZmFpciBlbm91Z2guIExldCBtZSBoYXZlIGEgdHJ5Lg0KTm8gaWRlYSB3aHkgd2Ugc2V0IFNHIGZs
YWcgaW4gcG9wdWxhdGUgeWVhcnMgYWdvLg0KDQo+IA0KPiBDaHJpc3RpYW4uDQo+IA0KPj4gT25l
IGVhc3kgd2F5IHRvIGZpeCB0aGlzIGlzIGxldHMgY291bnQgcGFnZXMgYWZ0ZXIgcG9wdWxhdGUg
Y2FsbGJhY2suDQo+PiANCj4+IFdlIGhpdCBvbmUgaXNzdWUgdGhhdCBhbWRncHUgYWxsb2MgbWFu
eSBTRyBCT3MsIGJ1dCBUVE0gdHJ5IHRvIGRvIHN3YXANCj4+IGFnYWluIGFuZCBhZ2FpbiBldmVu
IGlmIHN3YXBvdXQgZG9lcyBub3Qgc3dhcCBTRyBCT3MgYXQgYWxsLg0KPj4gDQo+PiBTaWduZWQt
b2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+DQo+PiAtLS0NCj4+ICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIHwgMzIgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYw0KPj4gaW5kZXggYTFhMjU0MTBlYzc0Li40ZmEw
YThjZDcxYzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jDQo+PiBAQCAtMzE3LDEzICszMTcs
NiBAQCBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LA0KPj4gIAlp
ZiAodHRtX3R0X2lzX3BvcHVsYXRlZCh0dG0pKQ0KPj4gIAkJcmV0dXJuIDA7DQo+PiAgLQlpZiAo
ISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKSkgew0KPj4gLQkJYXRvbWljX2xv
bmdfYWRkKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7DQo+PiAtCQlpZiAo
YmRldi0+cG9vbC51c2VfZG1hMzIpDQo+PiAtCQkJYXRvbWljX2xvbmdfYWRkKHR0bS0+bnVtX3Bh
Z2VzLA0KPj4gLQkJCQkJJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0ZWQpOw0KPj4gLQl9DQo+PiAt
DQo+PiAgCXdoaWxlIChhdG9taWNfbG9uZ19yZWFkKCZ0dG1fcGFnZXNfYWxsb2NhdGVkKSA+IHR0
bV9wYWdlc19saW1pdCB8fA0KPj4gIAkgICAgICAgYXRvbWljX2xvbmdfcmVhZCgmdHRtX2RtYTMy
X3BhZ2VzX2FsbG9jYXRlZCkgPg0KPj4gIAkgICAgICAgdHRtX2RtYTMyX3BhZ2VzX2xpbWl0KSB7
DQo+PiBAQCAtMzQyLDYgKzMzNSwxMyBAQCBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1f
ZGV2aWNlICpiZGV2LA0KPj4gIAlpZiAocmV0KQ0KPj4gIAkJZ290byBlcnJvcjsNCj4+ICArCWlm
ICghKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpKSB7DQo+PiArCQlhdG9taWNf
bG9uZ19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsNCj4+ICsJCWlm
IChiZGV2LT5wb29sLnVzZV9kbWEzMikNCj4+ICsJCQlhdG9taWNfbG9uZ19hZGQodHRtLT5udW1f
cGFnZXMsDQo+PiArCQkJCQkmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7DQo+PiArCX0NCj4+
ICsNCj4+ICAJdHRtX3R0X2FkZF9tYXBwaW5nKGJkZXYsIHR0bSk7DQo+PiAgCXR0bS0+cGFnZV9m
bGFncyB8PSBUVE1fUEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVEOw0KPj4gIAlpZiAodW5saWtlbHko
dHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TV0FQUEVEKSkgew0KPj4gQEAgLTM1NSwx
MiArMzU1LDYgQEAgaW50IHR0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwN
Cj4+ICAJcmV0dXJuIDA7DQo+PiAgICBlcnJvcjoNCj4+IC0JaWYgKCEodHRtLT5wYWdlX2ZsYWdz
ICYgVFRNX1BBR0VfRkxBR19TRykpIHsNCj4+IC0JCWF0b21pY19sb25nX3N1Yih0dG0tPm51bV9w
YWdlcywgJnR0bV9wYWdlc19hbGxvY2F0ZWQpOw0KPj4gLQkJaWYgKGJkZXYtPnBvb2wudXNlX2Rt
YTMyKQ0KPj4gLQkJCWF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywNCj4+IC0JCQkJCSZ0
dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsNCj4+IC0JfQ0KPj4gIAlyZXR1cm4gcmV0Ow0KPj4g
IH0NCj4+ICBFWFBPUlRfU1lNQk9MKHR0bV90dF9wb3B1bGF0ZSk7DQo+PiBAQCAtMzg0LDEyICsz
NzgsNiBAQCB2b2lkIHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX3R0ICp0dG0pDQo+PiAgCWlmICghdHRtX3R0X2lzX3BvcHVsYXRlZCh0dG0pKQ0K
Pj4gIAkJcmV0dXJuOw0KPj4gIC0JdHRtX3R0X2NsZWFyX21hcHBpbmcodHRtKTsNCj4+IC0JaWYg
KGJkZXYtPmZ1bmNzLT50dG1fdHRfdW5wb3B1bGF0ZSkNCj4+IC0JCWJkZXYtPmZ1bmNzLT50dG1f
dHRfdW5wb3B1bGF0ZShiZGV2LCB0dG0pOw0KPj4gLQllbHNlDQo+PiAtCQl0dG1fcG9vbF9mcmVl
KCZiZGV2LT5wb29sLCB0dG0pOw0KPj4gLQ0KPj4gIAlpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBU
VE1fUEFHRV9GTEFHX1NHKSkgew0KPj4gIAkJYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2Vz
LCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7DQo+PiAgCQlpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIp
DQo+PiBAQCAtMzk3LDYgKzM4NSwxMiBAQCB2b2lkIHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0
dG1fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pDQo+PiAgCQkJCQkmdHRtX2RtYTMy
X3BhZ2VzX2FsbG9jYXRlZCk7DQo+PiAgCX0NCj4+ICArCXR0bV90dF9jbGVhcl9tYXBwaW5nKHR0
bSk7DQo+PiArCWlmIChiZGV2LT5mdW5jcy0+dHRtX3R0X3VucG9wdWxhdGUpDQo+PiArCQliZGV2
LT5mdW5jcy0+dHRtX3R0X3VucG9wdWxhdGUoYmRldiwgdHRtKTsNCj4+ICsJZWxzZQ0KPj4gKwkJ
dHRtX3Bvb2xfZnJlZSgmYmRldi0+cG9vbCwgdHRtKTsNCj4+ICsNCj4+ICAJdHRtLT5wYWdlX2Zs
YWdzICY9IH5UVE1fUEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVEOw0KPj4gIH0NCj4+ICANCj4gDQoN
Cg==
