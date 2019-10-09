Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C07D1A03
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 22:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2A6E317;
	Wed,  9 Oct 2019 20:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B7C6E317;
 Wed,  9 Oct 2019 20:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkiLw94q3XzoEpMcxgPBsiU11aovbflR28qe1uN+C4qDGE5sOBl4IfZ3D78GZaCCVWNJCS95usqj3YZXV2HSl320Yek654nnSFkQouRlKPR/cytPS+M1U/AWPcrLwOB5m1MDk1ZdXzTq7lNV9iUqndS58eOk4bSQgtD9XtG3PKeKTQ9bkunvGIyFoVacHpbzCLhm7DpyPMzjQQaIV0IxFCdk6tiG8uRJFODn9ypb1V9RiaYaHexuGMGyc8lgW9QfYU08ZxdJHnFtA9t0loOGTq9GaUrrLACFk4RPwa2hra+BqBhL3JvuMYE/b9D+pJI+aeJKKPOieG1V4LeD57W5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9HZxRv2Wa+TARuwYKbXjkxZOMspFuvK1nlT49LNw6E=;
 b=UCudlYdUpMaspKdhO8X+n8Evlp9QYT9h1pW9xpVU2GhBEJ/ywcSEKfN35q9qve0GOEa8gB9PxgjT1yFzp+3dwivqLKyBNxp9xlAIkmeUiSPbWabfvJEANBlekbeGWJXkR9O6r5l7wUyxMOP/6js2xev0NyAlWioFp8n9q8OHof7VrCDrBoP7VmWft03EFe+WIVxt7ImwE/DYvYlbU2XBu8jTDqOQ9ag2UJtAQhn927GKboAjw7TP7DQPulVgTf9atdWED229lyOpo2PAEHEtafA6hvV2TwJGO316E6cSSZRHylHpLOsWHe5iJF7v1nELtOvlKyXstc2/Q+kCrxFcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4236.namprd12.prod.outlook.com (10.141.184.142) by
 DM6PR12MB3068.namprd12.prod.outlook.com (20.178.30.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 20:46:45 +0000
Received: from DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95]) by DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95%2]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 20:46:45 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Topic: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Index: AQHVejcKxYM7N3T1jUOoIu2sebAn9adSieGA///b6ACAAEjNAIAAIkyA
Date: Wed, 9 Oct 2019 20:46:45 +0000
Message-ID: <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
In-Reply-To: <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM6PR12MB4236.namprd12.prod.outlook.com
 (2603:10b6:5:212::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c588ec79-243a-4264-ce57-08d74cf9cc58
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3068:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3068466C76C998B330F287F5F9950@DM6PR12MB3068.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(8936002)(2906002)(81166006)(81156014)(8676002)(54906003)(99286004)(5660300002)(66946007)(66446008)(64756008)(66556008)(66476007)(476003)(486006)(11346002)(316002)(25786009)(26005)(52116002)(186003)(6116002)(2616005)(446003)(6246003)(4326008)(478600001)(6506007)(76176011)(386003)(966005)(14454004)(102836004)(53546011)(3846002)(6486002)(6512007)(7736002)(305945005)(229853002)(31696002)(86362001)(6916009)(6436002)(71190400001)(31686004)(256004)(71200400001)(66066001)(36756003)(14444005)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3068;
 H:DM6PR12MB4236.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8lcn0JzG/Vmk7bWseLuAp3rUJnXLMiZUnfhIDoF4rr6FlPdxby8nwzncZRGW8A+bHA2ljk/cn66HXGTrLRvFexOGJ72RKjmxrhDhLbUk1V16q2fOSmiphka9CsDmwhnunIUMb1vJ3TXmrTLrV7gNtFnAYlPGGgdojWxP2gHjqN+lHZy/UWek4b5a+DvW+a27zXxmNUgr1/f1hlb2Ybqe7xWF2pTcG69c8VxoL6dRkxVfKCnSPdZW5vFNMRhdBt11Tk9lWo2Y2hjv0CsI436fsePACl56qDewngYp3xB09a8kkmtKDQuXjJHIMna7OVVh5R8f0QyXkpO45W+NNpS94NrsYUwVzCyeBOXwv4dSQ7enfRHdIbA97foKpUzderITtwz8pPsWtMaUr8hvtOOhQglKk2gxte/TgCu26zmrBwBxmEluHlPNmLOdZUmZvQuv1TDmH/sGvr7FMqMJzKZLyg==
Content-ID: <999647EB8E80D747AD5E21111924EC57@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c588ec79-243a-4264-ce57-08d74cf9cc58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 20:46:45.6585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlLpOtdmqwEGJS5vz2Jx+bWQ+Ja0eP7cb/gjmejaL7gg3EK9s6R0CCEF1m99yW0p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3068
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9HZxRv2Wa+TARuwYKbXjkxZOMspFuvK1nlT49LNw6E=;
 b=V0t/M0tLWZzLhW07CAorR+NzYNV4PkKcvgIJ3pi6Kj/XL0QkLMfxAB/eWkmQP0WySiOdnBWmqabrzPOzqZCwYcOizBeYqRgSAHhhWgCmCGwOXpv2A7GuShKqS3hoTpE57vdot4G8npHZw5O+zhynUgc1h246OqLcAMSPF96fFa4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBtaXN1bmRlcnN0b29kIGFuZCB3YXMgdGFsa2luZyBhYm91dCB0aGUga3N2IHZhbGlkYXRpb24g
c3BlY2lmaWNhbGx5IA0KKHVzYWdlIG9mIGRybV9oZGNwX2NoZWNrX2tzdnNfcmV2b2tlZCgpKS4N
Cg0KRm9yIHRoZSBkZWZpbmVzIEkgd2lsbCBjcmVhdGUgcGF0Y2hlcyB0byB1c2UgZHJtX2hkY3Ag
d2hlcmUgaXQgaXMgdXNhYmxlLg0KDQoNCkJoYXdhbg0KDQpPbiAyMDE5LTEwLTA5IDI6NDMgcC5t
LiwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCA4OjIzIFBN
IExha2hhLCBCaGF3YW5wcmVldA0KPiA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6
DQo+PiBIaSwNCj4+DQo+PiBUaGUgcmVhc29uIHdlIGRvbid0IHVzZSBkcm1faGRjcCBpcyBiZWNh
dXNlIG91ciBwb2xpY3kgaXMgdG8gZG8gaGRjcA0KPj4gdmVyaWZpY2F0aW9uIHVzaW5nIFBTUC9I
VyAob25ib2FyZCBzZWN1cmUgcHJvY2Vzc29yKS4NCj4gaTkxNSBhbHNvIHVzZXMgaHcgdG8gYXV0
aCwgd2Ugc3RpbGwgdXNlIHRoZSBwYXJ0cyBmcm9tIGRybV9oZGNwIC4uLg0KPiBEaWQgeW91IGFj
dHVhbGx5IGxvb2sgYXQgd2hhdCdzIGluIHRoZXJlPyBJdCdzIGVzc2VudGlhbGx5IGp1c3Qgc2hh
cmVkDQo+IGRlZmluZXMgYW5kIGRhdGEgc3RydWN0dXJlcyBmcm9tIHRoZSBzdGFuZGFyZCwgcGx1
cyBhIGZldyBtaW5pbWFsDQo+IGhlbHBlcnMgdG8gZW4vZGVjb2RlIHNvbWUgYml0cy4gSnVzdCBm
cm9tIGEgcXVpY2sgcmVhZCB0aGUgZW50aXJlDQo+IHBhdGNoIHZlcnkgbXVjaCBsb29rcyBsaWtl
IG1pZGxheWVyIGV2ZXJ5d2hlcmUgZGVzaWduIHRoYXQgd2UNCj4gZGlzY3Vzc2VkIGJhY2sgd2hl
biBEQyBsYW5kZWQgLi4uDQo+IC1EYW5pZWwNCj4NCj4+IEJoYXdhbg0KPj4NCj4+IE9uIDIwMTkt
MTAtMDkgMTI6MzIgcC5tLiwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4+PiBPbiBUaHUsIE9jdCAw
MywgMjAxOSBhdCAxMTowODowM1BNICswMTAwLCBDb2xpbiBJYW4gS2luZyB3cm90ZToNCj4+Pj4g
SGksDQo+Pj4+DQo+Pj4+IFN0YXRpYyBhbmFseXNpcyB3aXRoIENvdmVyaXR5IGhhcyBkZXRlY3Rl
ZCBhIHBvdGVudGlhbCBpc3N1ZSB3aXRoDQo+Pj4+IGZ1bmN0aW9uIHZhbGlkYXRlX2Jrc3YgaW4N
Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV9leGVj
dXRpb24uYyB3aXRoIHJlY2VudA0KPj4+PiBjb21taXQ6DQo+Pj4+DQo+Pj4+IGNvbW1pdCBlZDlk
OGUyYmNiMDAzZWM5NDY1OGNhZmU5YjFiYjM5NjBlMjEzOWVjDQo+Pj4+IEF1dGhvcjogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+DQo+Pj4+IERhdGU6ICAgVHVl
IEF1ZyA2IDE3OjUyOjAxIDIwMTkgLTA0MDANCj4+Pj4NCj4+Pj4gICAgICAgZHJtL2FtZC9kaXNw
bGF5OiBBZGQgSERDUCBtb2R1bGUNCj4+PiBJIHRoaW5rIHRoZSByZWFsIHF1ZXN0aW9uIGhlcmUg
aXMgLi4uIHdoeSBpcyB0aGlzIG5vdCB1c2luZyBkcm1faGRjcD8NCj4+PiAtRGFuaWVsDQo+Pj4N
Cj4+Pj4gVGhlIGFuYWx5c2lzIGlzIGFzIGZvbGxvd3M6DQo+Pj4+DQo+Pj4+ICAgIDI4IHN0YXRp
YyBpbmxpbmUgZW51bSBtb2RfaGRjcF9zdGF0dXMgdmFsaWRhdGVfYmtzdihzdHJ1Y3QgbW9kX2hk
Y3AgKmhkY3ApDQo+Pj4+ICAgIDI5IHsNCj4+Pj4NCj4+Pj4gQ0lEIDg5ODUyICgjMSBvZiAxKTog
T3V0LW9mLWJvdW5kcyByZWFkIChPVkVSUlVOKQ0KPj4+Pg0KPj4+PiAxLiBvdmVycnVuLWxvY2Fs
Og0KPj4+PiBPdmVycnVubmluZyBhcnJheSBvZiA1IGJ5dGVzIGF0IGJ5dGUgb2Zmc2V0IDcgYnkg
ZGVyZWZlcmVuY2luZyBwb2ludGVyDQo+Pj4+ICh1aW50NjRfdCAqKWhkY3AtPmF1dGgubXNnLmhk
Y3AxLmJrc3YuDQo+Pj4+DQo+Pj4+ICAgIDMwICAgICAgICB1aW50NjRfdCBuID0gKih1aW50NjRf
dCAqKWhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3Y7DQo+Pj4+ICAgIDMxICAgICAgICB1aW50OF90
IGNvdW50ID0gMDsNCj4+Pj4gICAgMzINCj4+Pj4gICAgMzMgICAgICAgIHdoaWxlIChuKSB7DQo+
Pj4+ICAgIDM0ICAgICAgICAgICAgICAgIGNvdW50Kys7DQo+Pj4+ICAgIDM1ICAgICAgICAgICAg
ICAgIG4gJj0gKG4gLSAxKTsNCj4+Pj4gICAgMzYgICAgICAgIH0NCj4+Pj4NCj4+Pj4gaGRjcC0+
YXV0aC5tc2cuaGRjcDEuYmtzdiBpcyBhbiBhcnJheSBvZiA1IHVpbnQ4X3QgYXMgZGVmaW5lZCBp
bg0KPj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuaCBh
cyBmb2xsb3dzOg0KPj4+Pg0KPj4+PiBzdHJ1Y3QgbW9kX2hkY3BfbWVzc2FnZV9oZGNwMSB7DQo+
Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYW5bOF07DQo+Pj4+ICAgICAgICAgICB1aW50
OF90ICAgICAgICAgYWtzdls1XTsNCj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBhaW5m
bzsNCj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBia3N2WzVdOw0KPj4+PiAgICAgICAg
ICAgdWludDE2X3QgICAgICAgIHIwcDsNCj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBi
Y2FwczsNCj4+Pj4gICAgICAgICAgIHVpbnQxNl90ICAgICAgICBic3RhdHVzOw0KPj4+PiAgICAg
ICAgICAgdWludDhfdCAgICAgICAgIGtzdmxpc3RbNjM1XTsNCj4+Pj4gICAgICAgICAgIHVpbnQx
Nl90ICAgICAgICBrc3ZsaXN0X3NpemU7DQo+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAg
dnBbMjBdOw0KPj4+Pg0KPj4+PiAgICAgICAgICAgdWludDE2X3QgICAgICAgIGJpbmZvX2RwOw0K
Pj4+PiB9Ow0KPj4+Pg0KPj4+PiB2YXJpYWJsZSBuIGlzIGdvaW5nIHRvIGNvbnRhaW4gdGhlIGNv
bnRhaW5zIG9mIHIwcCBhbmQgYmNhcHMuIEknbSBub3QNCj4+Pj4gc3VyZSBpZiB0aGF0IGlzIGlu
dGVudGlvbmFsLiBJZiBub3QsIHRoZW4gdGhlIGNvdW50IGlzIGdvaW5nIHRvIGJlDQo+Pj4+IGlu
Y29ycmVjdCBpZiB0aGVzZSBhcmUgbm9uLXplcm8uDQo+Pj4+DQo+Pj4+IENvbGluDQo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdA0KPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4N
Cj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
