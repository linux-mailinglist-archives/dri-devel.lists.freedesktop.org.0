Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FBF130C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28E66EC9B;
	Wed,  6 Nov 2019 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2568F6EC99;
 Wed,  6 Nov 2019 09:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl5Wf0kgVg/4l0d9vYYxBDUqxgT1KC7jy1QdHrg5l8yJyrJh7wd73u7bAwLSkzKdGyppsAYMS8+VoLAGl70d4AN7LScDwU/GbV2Ga5tly1r7PwHUTi+61GLfoornKcOvAXJfDy8l9vLmbs78BBXsK0QiMAybVo8GTmV4oKFMr+tZyvFH3NU2kSuDFPfR3B81KMAVV7dtvRUUOvUaUXpt7aAaT3bd9TpsxfT3FSscafnqv/U+nC5FD9evj/8vCmmKeFboypjOTv4sDA100luAWmXPXwZk/VDJUpnBUcbQMirO8yymxwu5q2iYefJG+LvmWpo03W9rgaLX9Mg79hprTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++0vHScicFMYU3AoK1PWUKBvS9x7WxKbCGrFmfCb1to=;
 b=Q7a9U5L9uOSGOmvUeVhDpgXdS6jKJ0A48dy3zvovTwhEK2duBJ1VxoBXKbnN/ovjZ3/hlZU12/KR5iTpgG79W381haz1tZTYIPmg0KFMqn5lNMYLt/D3IlgBk9iTkYNn91/6q4cl3u6N4QTogl3SnFqmDe4bxx+mH2H8qpChUt2ZimNHPmTqDhoChWn9QY2rAxYgH8BnF0YrkZYP3DT7bLLN8PuGRLqjZbdYftWXVx9mUzPeDXltYUauvegbUc1O6/oNmizu7bTq4XOmCE9a3RTkrynC94a+L+1hMOdXnVqQ0X48z32upGF35gt0cR0vYVeajqKN8Bh6efvE8KUcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2583.namprd12.prod.outlook.com (52.132.140.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 09:59:14 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 09:59:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Pan Bian <bianpan2016@163.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam
 Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/amdgpu: fix double reference dropping
Thread-Topic: [PATCH] drm/amdgpu: fix double reference dropping
Thread-Index: AQHVlIgIUEATmLAki0qOQWOuXuremad96JYA
Date: Wed, 6 Nov 2019 09:59:14 +0000
Message-ID: <b7b3c444-9ece-dd08-cb4c-c7ac4009373b@amd.com>
References: <1573033994-17102-1-git-send-email-bianpan2016@163.com>
In-Reply-To: <1573033994-17102-1-git-send-email-bianpan2016@163.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR08CA0050.eurprd08.prod.outlook.com
 (2603:10a6:205:2::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 361df50a-e2dc-41ad-5f03-08d7629ffa9b
x-ms-traffictypediagnostic: DM5PR12MB2583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2583C71F049E8900954D399983790@DM5PR12MB2583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(189003)(199004)(66946007)(46003)(2616005)(54906003)(102836004)(58126008)(7736002)(316002)(446003)(11346002)(256004)(186003)(305945005)(6116002)(76176011)(36756003)(81166006)(476003)(8676002)(486006)(386003)(6506007)(66556008)(81156014)(64756008)(8936002)(99286004)(66446008)(110136005)(52116002)(66476007)(25786009)(5660300002)(6486002)(65956001)(6436002)(65806001)(31686004)(2906002)(229853002)(6512007)(6246003)(86362001)(4326008)(71190400001)(31696002)(71200400001)(478600001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2583;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pooUUX74HMMRtpKe6Oe74fsXXoY26Q0369JAsyl7iK9R3U/YYOhnxgaVAWm07BRzDKJqxFMLTOFyIiF1SYiOOl5TcWG642Tu+UwVWjJAKRFj+8Rqju0DszGUWJ4b+0RIu36KNn5HKO+Oii2axrsTRzL5Nfw4zyJJ49OLmD0KQAs6ezC4gUsFhvoJS/5bUNTSwbpEzU96sgLk4ocMcitWPjtqE5ogPStIHyGPzEpRI0XuF5kNRAgwGeTmQqVglE5Z1z+WQg8363O8gchxB3dw1R6uOMy95WedWnoaZoZKFQd8Xu+fJfDpgJXrzLx8Rt0CFFZceJVIE2y9zvf/07XC2hFfPJfA9L6INy3UNK6+3sYhEpr8GBwxCkUfXXj1HKsGekJjeFAYpDFym9929F/jofnRMh/jrlmRRLI64nsPMaFN5PFX8haSwEjtPVHSLVoP
Content-ID: <77E364CC8E10554AB20F379E5D40C4B0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361df50a-e2dc-41ad-5f03-08d7629ffa9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:59:14.4061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqoJlOWVPSqrrbqWZ8ZzsoGnHyWjlwiu2woT2wklhio79klsmN3eOvhsb+SEpBao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++0vHScicFMYU3AoK1PWUKBvS9x7WxKbCGrFmfCb1to=;
 b=FPufp6MKw4TyqaoCbMYgOjMu7ao6WHsQGuq1oncx9FGGTHQXJilFUABoBRWfxbsJlr3wfryYe0yEP1RHxGx4dRA7zi3HOsnYWBr/tGSYBJEuBDkqb9bSqhMqrSes0ST+3UlvtARgUn6wbzM2+H1izxu7BWdFa7Edo+6WxGcH3uM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMTEuMTkgdW0gMTA6NTMgc2NocmllYiBQYW4gQmlhbjoNCj4gQWZ0ZXIgZHJvcHBpbmcg
dGhlIHJlZmVyZW5jZSBvZiBvYmplY3QgZmVuY2UgaW4gdGhlIGxvb3AsIGl0IHNob3VsZCBiZQ0K
PiBzZXQgdG8gTlVMTCB0byBwcm90ZWN0aW5nIGRyb3BwaW5nIGl0cyByZWZlcmVuY2UgYWdhaW4g
b3V0c2lkZSB0aGUgbG9vcC4NCg0KTkFLLCB0aGUgYWN0dWFsIGJ1ZyBpcyB0aGF0IHdlIHNob3Vs
ZG4ndCBkcm9wIHRoZSBmZW5jZSBvdXRzaWRlIHRoZSBsb29wIA0KaW4gdGhlIGZpcnN0IHBsYWNl
Lg0KDQpKdXN0IG1vdmUgdGhlIGRtYV9mZW5jZV9wdXQoZmVuY2UpOyB0d28gbGluZXMgdXAgYW5k
IGRyb3AgaW5pdGlhbGl6aW5nIA0KZmVuY2UgdG8gTlVMTC4NCg0KUmVnYXJkcywNCkNocmlzdGlh
bi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBQYW4gQmlhbiA8YmlhbnBhbjIwMTZAMTYzLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JlbmNobWFyay5j
IHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYmVuY2htYXJrLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYmVuY2htYXJrLmMNCj4gaW5kZXggNjQ5ZTY4
YzQ0NzliLi4zMTc0MDkzZjM1ZjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9iZW5jaG1hcmsuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYmVuY2htYXJrLmMNCj4gQEAgLTQ3LDYgKzQ3LDcgQEAgc3RhdGljIGludCBh
bWRncHVfYmVuY2htYXJrX2RvX21vdmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2ln
bmVkIHNpemUsDQo+ICAgCQlpZiAocikNCj4gICAJCQlnb3RvIGV4aXRfZG9fbW92ZTsNCj4gICAJ
CWRtYV9mZW5jZV9wdXQoZmVuY2UpOw0KPiArCQlmZW5jZSA9IE5VTEw7DQo+ICAgCX0NCj4gICAJ
ZW5kX2ppZmZpZXMgPSBqaWZmaWVzOw0KPiAgIAlyID0gamlmZmllc190b19tc2VjcyhlbmRfamlm
ZmllcyAtIHN0YXJ0X2ppZmZpZXMpOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
