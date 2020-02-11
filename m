Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AFC15927A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D4A6EE80;
	Tue, 11 Feb 2020 15:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B2F6EE7C;
 Tue, 11 Feb 2020 15:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeU/uGSvxP0NAsVu7OhlBiKk4Qd/1aA+J1wEsPq035JwlBWpOoMB0uRcvWE/3eHjhM1MuGUcjybOL6ABEhYAymZO9lyj6GZa5SpVTfq63VIOyRvLD3mw96LLP4QLrWhUiD5bcCjPzt2dW7ebaL5cQ17LMxUeKgIX44HV2abxzaDLczzq9Op9bjLp9brA+UpgzFG7syZrrKeXIeso0GMf8cEaxMnf/N0C+1LBDku41sZIiq/PG6mr/SnClcjXaD5S35YJGgLx8OP/pai1gV1EObhI/KXm8v882lT80t6ljk86mnL0Z8rcMZNZy2H22WvbP6M6uwXlCOdImAM6yOU4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf9yMPyQ0IECAnrNOGMLca6nJdDtD5BpL6hu3fWqS+g=;
 b=gFAS8lnYLb6IHHPWzupHW0YFfgePrH4Zlh+9jk8WO41zSTINqdGUl4cax4DDyY8RnMOcV/l6YFfIaOZ/NFpS3/Nluul7SEg81YAQLLt0xh+XhEDqBOFGj/CgjTEJ0GQQJLlm0OdaZqImiY9vWdOI/BeKSxd+GUafvw5hL9ZSrVsq+iVnbZsfh/o66R7g1k0H18VOJlzd/Ise/HbCAUszMgWkhpAvE5LgqkUnT+7xBt3Z8H+uQ/lJXX1tRbdG+m/s/9SgNmc77tu58n5W6aROveU47mCUzmxjeVtEgV8R2gwgRNH2q3cWGn/eoCQhVWTCVFWvHK59TxEfBe2vOVRNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf9yMPyQ0IECAnrNOGMLca6nJdDtD5BpL6hu3fWqS+g=;
 b=JHvQ5C/0kDn1b9OHRhBXcmMv5K5LvQ3vHEWGTZHqQdbSCuQIiF8NdTY3s1w6h6z4AwN+A+yL9MoBw/KoTuq+QAAOXUj/9pzXB+zDWw7oDmoM+XRXMqmep5bd55FIghA9B2ezND8qpfAXb6c7yyr/4mNOCuzGqIPJ2TeGSNtLCh0=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.101.138) by
 SN6PR12MB2750.namprd12.prod.outlook.com (52.135.107.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.29; Tue, 11 Feb 2020 15:02:34 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 15:02:34 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/6] drm/ttm: replace dma_resv object on deleted BOs v2
Thread-Topic: [PATCH 5/6] drm/ttm: replace dma_resv object on deleted BOs v2
Thread-Index: AQHV4CQS1ZsaSNoZEkeVrYU13dVQjagWCrwAgAANKQA=
Date: Tue, 11 Feb 2020 15:02:34 +0000
Message-ID: <11341C05-E5C8-47C6-A77D-F3B3380453AA@amd.com>
References: <20200210150907.20616-1-christian.koenig@amd.com>
 <20200210150907.20616-6-christian.koenig@amd.com>
 <20200211141402.GB2363188@phenom.ffwll.local>
In-Reply-To: <20200211141402.GB2363188@phenom.ffwll.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.214.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16f35b4e-afb7-4e6b-e175-08d7af036cea
x-ms-traffictypediagnostic: SN6PR12MB2750:|SN6PR12MB2750:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2750D771783B1B024C30DF4987180@SN6PR12MB2750.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:421;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(189003)(199004)(316002)(2906002)(86362001)(5660300002)(966005)(66476007)(81156014)(8936002)(186003)(66946007)(64756008)(66556008)(66446008)(6486002)(8676002)(33656002)(6506007)(478600001)(6512007)(81166006)(6916009)(66574012)(4326008)(76116006)(54906003)(26005)(71200400001)(36756003)(91956017)(45080400002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2750;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TI4CkIgdFTt+JWEWvg1KjT1klfhsKulEssbLp/LlHe+F6JlKEcIf+q01KKA9txOdE1OL2uTAaJvtCxcc+Rm1f9Qb5t2olO9FYbGyiDaXvSVnM/IWTN8bLKt5Jy+kDdTJRxFZuKHExYaegBPE+NG6MswEAjN1TU0Ti/vNrtvvQt45RuOU1ca+sUHblvgebsWhHWwbSPHA2GOl5iVhRBE/In89mG9cv7dZO51Ze8bf/oRpvt/VqTN6ZPkWa5FBgl7W/RjAddI6noLRxCIF+9WnHnOBUt4ue9MwhLWiDdk2iBbBwas7XhpliOVrc4m3orgUMScNE+pT/uJKIsj/i4iUeV2nexxokO7QwDZtmM9rhi1pjEeyFriOmj2zAZhsAWf3M4L7LNccB/Y6o/cHznSpcuuTtBactWQCPZz/hfSOwE16BOMOh+othcK7KH80fyo5tmqOdQAYKRGIaoKZaLXy4Ap9mnnsLTfhWtWdgavu2Pk02bxXxI7fLCKANzClU5kn6fQ58H5B2aclFx1y+TZEWg==
x-ms-exchange-antispam-messagedata: 0mjU5abuEmc4C9elvApBweQ+DFqSLtX7aeKPBjOxs6XaT2dAzKh6QI5ylyhjYSdAHxD0x9kY1wdNk+fza2I8AKFyGX0f/k8+Ao7MckFzd51xM6LS7WsHu5KYCgYLAc7878Y1bQcWTkZCZY/Y45KNyQ==
Content-ID: <0DA6BDAA50B0B743A4893EC30E2C9FC1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f35b4e-afb7-4e6b-e175-08d7af036cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 15:02:34.2590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgapzomReUruJN0uAsZ2b3UnoZ9b/NgkK+sTNU8T1RJEShUQqm5rfp7j6n/seR4d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2750
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gMjAyMOW5tDLmnIgxMeaXpSAyMjoxNO+8jERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4g5YaZ6YGT77yaDQo+IA0KPiBPbiBNb24sIEZlYiAxMCwgMjAyMCBhdCAwNDowOTowNlBN
ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gV2hlbiBub24taW1wb3J0ZWQgQk9z
IGFyZSByZXN1cnJlY3RlZCBmb3IgZGVsYXllZCBkZWxldGUgd2UgcmVwbGFjZQ0KPj4gdGhlIGRt
YV9yZXN2IG9iamVjdCB0byBhbGxvdyBmb3IgZWFzeSByZWNsYWltaW5nIG9mIHRoZSByZXNvdXJj
ZXMuDQo+PiANCj4+IHYyOiBtb3ZlIHRoYXQgdG8gdHRtX2JvX2luZGl2aWR1YWxpemVfcmVzdg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQo+PiAtLS0NCj4+IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxMCAr
KysrKysrKystDQo+PiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gaW5kZXggZDA2MjQ2ODVmNWQyLi40ZDE2
MTAzOGRlOTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+PiBAQCAtMzkzLDYgKzM5Mywx
NCBAQCBzdGF0aWMgaW50IHR0bV9ib19pbmRpdmlkdWFsaXplX3Jlc3Yoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibykNCj4+IA0KPj4gCXIgPSBkbWFfcmVzdl9jb3B5X2ZlbmNlcygmYm8tPmJh
c2UuX3Jlc3YsIGJvLT5iYXNlLnJlc3YpOw0KPj4gCWRtYV9yZXN2X3VubG9jaygmYm8tPmJhc2Uu
X3Jlc3YpOw0KPj4gKwlpZiAocikNCj4+ICsJCXJldHVybiByOw0KPj4gKw0KPj4gKwlpZiAoYm8t
PnR5cGUgIT0gdHRtX2JvX3R5cGVfc2cpIHsNCj4+ICsJCXNwaW5fbG9jaygmdHRtX2JvX2dsb2Iu
bHJ1X2xvY2spOw0KPj4gKwkJYm8tPmJhc2UucmVzdiA9ICZiby0+YmFzZS5fcmVzdjsNCj4gDQo+
IEhhdmluZyB0aGUgZG1hX3Jlc3YgcG9pbnRlciBiZSBwcm90ZWN0ZWQgYnkgdGhlIGxydV9sb2Nr
IGZvciB0dG0gaW50ZXJuYWwNCj4gc3R1ZmYsIGJ1dCBpbnZhcmlhbnQgZXZlcnl3aGVyZSBlbHNl
IGlzIHJlYWxseSBjb25mdXNpbmcuIE5vdCBzdXJlIHRoYXQncw0KDQpJIHRoaW5rIHRoaXMgaXMg
cmVhZGVyIFZTIHdyaXRlci4NClRvIGF2b2lkIGFueSBpbnRlcm5hbCBmdW5jdGlvbnMgdXNpbmcg
dGhlIG9sZCByZXN2LCAgdXNpbmcgYW4gZXhpc3Rpbmcgc3BpbiBsb2NrIGlzIGFjY2VwdGFibGUu
DQpNYXliZSBSQ1UgaXMgYmV0dGVyPyBUaGF0IHdpbGwgbmVlZCBhIGxvdCBvZiBlZmZvcnQuDQpB
bnl3YXksIHR0bSBzdWNrcy4gV2UgSEFTIGRvbmUgYSBsb3Qgb2Ygd29yayBvbiBpdCB0byBtYWtl
IGl0IGJldHRlciBydW5uaW5nIG9uIG1vZGVybiBzeXN0ZW0uDQoNCg0KPiBhIGdyZWF0IGlkZWEs
IEkndmUganVzdCBjaGFzZWQgc29tZSB0dG0gY29kZSBhcm91bmQgZnJlYWtpbmcgb3V0IGFib3V0
DQo+IHRoYXQuDQo+IC1EYW5pZWwNCj4gDQo+PiArCQlzcGluX3VubG9jaygmdHRtX2JvX2dsb2Iu
bHJ1X2xvY2spOw0KPj4gKwl9DQo+PiANCj4+IAlyZXR1cm4gcjsNCj4+IH0NCj4+IEBAIC03MjAs
NyArNzI4LDcgQEAgc3RhdGljIGJvb2wgdHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+PiANCj4+IAlpZiAoYm8tPmJhc2UucmVzdiA9
PSBjdHgtPnJlc3YpIHsNCj4+IAkJZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7
DQo+PiAtCQlpZiAoY3R4LT5mbGFncyAmIFRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1QgfHwg
Ym8tPmRlbGV0ZWQpDQo+PiArCQlpZiAoY3R4LT5mbGFncyAmIFRUTV9PUFRfRkxBR19BTExPV19S
RVNfRVZJQ1QpDQo+PiAJCQlyZXQgPSB0cnVlOw0KPj4gCQkqbG9ja2VkID0gZmFsc2U7DQo+PiAJ
CWlmIChidXN5KQ0KPj4gLS0gDQo+PiAyLjE3LjENCj4+IA0KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QN
Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbmFtMTEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0w
MiU3QzAxJTdDWGluaHVpLlBhbiU0MGFtZC5jb20lN0NlZTY3MzEwZTI2YjY0Y2E5ZTc5MDA4ZDdh
ZWZjYTdiNCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzcx
NzAyNzI0ODE3NjU5MDQmYW1wO3NkYXRhPVpwblA5TU5CUDFjc1FDS1BSMjc1ZWpJdnNaM2I4eEw4
MHRtU2xwZjdNUEElM0QmYW1wO3Jlc2VydmVkPTANCj4gDQo+IC0tIA0KPiBEYW5pZWwgVmV0dGVy
DQo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmJsb2cu
ZmZ3bGwuY2gmYW1wO2RhdGE9MDIlN0MwMSU3Q1hpbmh1aS5QYW4lNDBhbWQuY29tJTdDZWU2NzMx
MGUyNmI2NGNhOWU3OTAwOGQ3YWVmY2E3YjQlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCU3QzAlN0MwJTdDNjM3MTcwMjcyNDgxNzY1OTA0JmFtcDtzZGF0YT1mazI4anRIaEFuRTMx
MkNGTWdWWGFadGFTMllOcUpqbXlKMzE3RldqQW9NJTNEJmFtcDtyZXNlcnZlZD0wDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
