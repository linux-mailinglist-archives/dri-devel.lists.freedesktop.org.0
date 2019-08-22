Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97E99FC2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 21:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AA36EA45;
	Thu, 22 Aug 2019 19:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18256EA3F;
 Thu, 22 Aug 2019 19:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRDrhNJLbXEGuWimL3P3BC1xeWmwy9pP11SvGOniLoSi9p7m4+PY0UKmDUfYExSgMq22h6zRTDV/cgVUli13YlzT3GcPdaZJ0SbZr81KS46sKZbxH8aM68gvb+diGQglG7n6cOSbEy7YPqH/hRz6f90pPSePnbJM2Nk1iyt0lEgASgtACbbX9RbqZGAByxuPcD1/NtFC/Fq1KSLFOyImDrdcaChCHqxxC6Y6ZjlQSGfIG0f93IaSwsQbrxRR5A+vycOaCppSjrxcspT+q6qaJxxaykIhw4wcyQNPx9mxVUJF6X6IKp3U3tiTmFj3XJ7meXAagRLUlpmiLh3rDZlZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nARQBQ2T5JoGz0Mi0S9gFZwhe3r+nl2zCUHVzBenNDA=;
 b=DikgnpvWo+iqy/0TZw/cutd427Ar5zykoHZV5t+hzSE3CNGW3BJh/ZfyTtwNgDMmX5Bi97ABryu/QkSTFW2KI+XfOcNAZdZNK9Eq4f2Cxv88GEzGEwOXFdBXigkrk3XsTUr8Q2AnS5hvJ2XyNPhuzEIZ4qkrikpYLZNZmrWAm5EBqmi8biqma2FLv9/ji7HhoNdBKh1vARYzgl7kIZJkzWiQ6CKpyXggOubcsqNYez3cIWFVM9MgEAdwYW3RYBFvRFXFD1os6gbO9eqMaB8Kb2+oum9ffJgvFYXBaimhBPDbhuAExKe6Kk/4G+2E3D0MqTeK8M2TWWpBMdJQs39T0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0183.namprd12.prod.outlook.com (10.174.52.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 19:21:13 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 19:21:13 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Colin King <colin.king@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][drm-next] drm/amd/display: fix a potential null pointer
 dereference
Thread-Topic: [PATCH][drm-next] drm/amd/display: fix a potential null pointer
 dereference
Thread-Index: AQHVVH9ikXZ9rtwK3kONgLDWrJHQDKcHlIMA
Date: Thu, 22 Aug 2019 19:21:12 +0000
Message-ID: <5981f677-3347-1450-f787-853e97496bd4@amd.com>
References: <20190816221011.10750-1-colin.king@canonical.com>
In-Reply-To: <20190816221011.10750-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::48) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93657eee-cac2-473c-4a77-08d72735e529
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0183; 
x-ms-traffictypediagnostic: CY4PR1201MB0183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0183C4A8C609C688018388BE8CA50@CY4PR1201MB0183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(2201001)(54906003)(52116002)(6512007)(81156014)(7736002)(11346002)(386003)(99286004)(102836004)(6506007)(446003)(14444005)(256004)(53546011)(229853002)(2501003)(53936002)(58126008)(2616005)(31696002)(36756003)(3846002)(6116002)(71190400001)(305945005)(31686004)(14454004)(71200400001)(26005)(186003)(478600001)(6486002)(76176011)(5660300002)(6436002)(8936002)(110136005)(64756008)(486006)(316002)(476003)(66066001)(65806001)(65956001)(25786009)(8676002)(6246003)(4326008)(66446008)(81166006)(66556008)(2906002)(66946007)(66476007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0183;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yhLYdFB2GxxGq+ZYqelk4SFdJudmT8ZFaYNPNmmfeVpWMWmkg68ICCccXziGK+Gj7+BkHV79k+tZolOGdPO8MMBSUdIOJZ95YcC1+yotRSG56ge6hpGxR7YFygXf9oIK8V1h0a4HzQTyJKGKRue43UsjOtJQHt1jIyNUUEeJgK4kwDuptRI2nHJyqj8ikPNbztCs3ZIE3Alv1ro/2EEGPs1Zna8qeEH94n3O+yqOwjEn+zspQ1FTZpDwaGfZU19fWPXwt187iwp6jRQHKhAhtkncLD55XLmYbvXDVp6CV1sknUm6yZ9AqUnFNRByms/f1b7fLXT9SgtAGrcRC+ho51HiEplZ6qkZcOo44srkS1JgswrPAvW69CaGdgiiU6UyJVIpmexLd7cw0wF9Is/3GhNlXA258nb7fE7SwCirVy4=
Content-ID: <BF8966527E0E3940B6309A7EBD82C85D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93657eee-cac2-473c-4a77-08d72735e529
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 19:21:13.0221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LMckXLsfZMNnMEdfDib1EwdkGc2NZYKXkj3FtcJ04ZsxtV7q+gZbe/qKspSAOaocebi1Fz/rCrEloLDNEwCKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nARQBQ2T5JoGz0Mi0S9gFZwhe3r+nl2zCUHVzBenNDA=;
 b=L8dircSFuw0t2xNYP5Mujm6H+EzcFP2/7ArtaqnHmVk5EFzdJkzZN4S9JMrMAeXB4/xlps90PuVjIJIb4AmCb38iJLt4hH1j+SSBSH8fEa85CWbVXaLEHIPMSEz1YVh9ttFvYELi9L8kAtl5jEaZ+ywT9aTJNqQC04jwW4RKMM8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0xNiA2OjEwIHAubS4sIENvbGluIEtpbmcgd3JvdGU6DQo+IEZyb206IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBDdXJyZW50bHkgdGhl
IHBvaW50ZXIgaW5pdF9kYXRhIGlzIGRlcmVmZXJlbmNlZCBvbiB0aGUgYXNzaWdubWVudA0KPiBv
ZiBmd19pbmZvIGJlZm9yZSBpbml0X2RhdGEgaXMgc2FuaXR5IGNoZWNrZWQgdG8gc2VlIGlmIGl0
IGlzIG51bGwuDQo+IEZpeCB0ZSBwb3RlbnRpYWwgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIG9u
IGluaXRfZGF0YSBieSBvbmx5DQo+IHBlcmZvcm1pbmcgZGVyZWZlcmVuY2UgYWZ0ZXIgaXQgaXMg
bnVsbCBjaGVja2VkLg0KPiANCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkRlcmVmZXJlbmNlIGJl
Zm9yZSBudWxsIGNoZWNrIikNCj4gRml4ZXM6IDlhZGM4MDUwYmYzYyAoImRybS9hbWQvZGlzcGxh
eTogbWFrZSBmaXJtd2FyZSBpbmZvIG9ubHkgbG9hZCBvbmNlIGR1cmluZyBkY19iaW9zIGNyZWF0
ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNh
bC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jDQo+IGluZGV4IGJlZTgx
YmYyODhiZS4uOTI2OTU0YzgwNGE2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYw0KPiBAQCAtMTIzNSw3ICsx
MjM1LDcgQEAgc3RhdGljIGJvb2wgY2FsY19wbGxfbWF4X3Zjb19jb25zdHJ1Y3QoDQo+ICAJCQlz
dHJ1Y3QgY2FsY19wbGxfY2xvY2tfc291cmNlX2luaXRfZGF0YSAqaW5pdF9kYXRhKQ0KPiAgew0K
PiAgCXVpbnQzMl90IGk7DQo+IC0Jc3RydWN0IGRjX2Zpcm13YXJlX2luZm8gKmZ3X2luZm8gPSAm
aW5pdF9kYXRhLT5icC0+ZndfaW5mbzsNCj4gKwlzdHJ1Y3QgZGNfZmlybXdhcmVfaW5mbyAqZndf
aW5mbzsNCj4gIAlpZiAoY2FsY19wbGxfY3MgPT0gTlVMTCB8fA0KPiAgCQkJaW5pdF9kYXRhID09
IE5VTEwgfHwNCj4gIAkJCWluaXRfZGF0YS0+YnAgPT0gTlVMTCkNCj4gQEAgLTEyNDQsNiArMTI0
NCw3IEBAIHN0YXRpYyBib29sIGNhbGNfcGxsX21heF92Y29fY29uc3RydWN0KA0KPiAgCWlmIChp
bml0X2RhdGEtPmJwLT5md19pbmZvX3ZhbGlkKQ0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+ICANCj4g
Kwlmd19pbmZvID0gJmluaXRfZGF0YS0+YnAtPmZ3X2luZm87DQo+ICAJY2FsY19wbGxfY3MtPmN0
eCA9IGluaXRfZGF0YS0+Y3R4Ow0KPiAgCWNhbGNfcGxsX2NzLT5yZWZfZnJlcV9raHogPSBmd19p
bmZvLT5wbGxfaW5mby5jcnlzdGFsX2ZyZXF1ZW5jeTsNCj4gIAljYWxjX3BsbF9jcy0+bWluX3Zj
b19raHogPQ0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
