Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAAF10572D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 17:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600AB6E1A3;
	Thu, 21 Nov 2019 16:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790050.outbound.protection.outlook.com [40.107.79.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D79A6E17E;
 Thu, 21 Nov 2019 16:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeM3V7W3SYmbQ2514e97M8kHxSQNpe247DBdfp/HlRVsDCYgxtgIg2OpowTVntjhaMTiBPmgVBUBOFlGivCep4MJZrPLRTb/0pWM+W9WhAJdQYTmKmdWcikj7doi9NOEwW19W+hQpE9WMlzdmoKRicFQYnLTpJY7PkLFh1d5ZOfyQn2WHWyH+y82klF6ADzi4uoTKKibauYMH2ad1DMpdDMOS+cOBj/K+4TeA2gPI0uZnGV3If116FRb1jhtARLxQPWBFjSiyiW/6ctWhub1gTp2jPT0S6ED44nK/FTds9tdZtwECw+BkEFleMiWAYSPpGT4fDedkQMdmRc0FCqJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoWBmXpzmdr5byS8YiT2p+LOR8k2XJcjMHyzF1tpDGM=;
 b=CRg81ae9mx9iQPd+Az3QuS+TmSGFY7pYzzOEUAJi14akaFzMwcqUoq74sVoJYqfe35lJpx1eaL4Xi1p9lnPvyhtnITN8NKM4mMZBhMVu31vgwGY1pzcOK7Wx9d1WZa8BsciIqBBIoou9Y7N+TGMW0+7ti587DELIeVSolYL81+b/6nZ5eRh9ZMsqSLUNW0YAZrNezOw1TdY/asm+7OKIdBae8NC2dYrieFJl76rHiczBTP7rUS69cmN0iffcLelp57Dokq47FYs7TDnpua6tbsY2DjnqOzzqFVoowpmDr1AgVrSKTNqLGmAU8wae8BTJdC7KSGoFcVfF5UhiY9MYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1820.namprd12.prod.outlook.com (10.175.88.143) by
 DM5PR12MB1372.namprd12.prod.outlook.com (10.168.238.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Thu, 21 Nov 2019 16:37:42 +0000
Received: from DM5PR12MB1820.namprd12.prod.outlook.com
 ([fe80::a0bb:dcbd:9ae:7807]) by DM5PR12MB1820.namprd12.prod.outlook.com
 ([fe80::a0bb:dcbd:9ae:7807%5]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 16:37:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v2 0/7] PCI: Prefer pcie_capability_read_word()
Thread-Topic: [PATCH v2 0/7] PCI: Prefer pcie_capability_read_word()
Thread-Index: AQHVoHRVGkX/SQKnskm32qbSRJ9NLKeV0u+Q
Date: Thu, 21 Nov 2019 16:37:41 +0000
Message-ID: <DM5PR12MB1820520F8CC4DA28219F2DC3F74E0@DM5PR12MB1820.namprd12.prod.outlook.com>
References: <20191121140220.38030-1-helgaas@kernel.org>
In-Reply-To: <20191121140220.38030-1-helgaas@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c3ea2c3-4ccd-43ce-6840-08d76ea12135
x-ms-traffictypediagnostic: DM5PR12MB1372:|DM5PR12MB1372:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1372537384CD38533BA9FDA0F74E0@DM5PR12MB1372.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(13464003)(229853002)(66946007)(305945005)(64756008)(76116006)(7736002)(66446008)(256004)(7416002)(66556008)(66476007)(6436002)(2501003)(52536014)(86362001)(74316002)(8936002)(55016002)(71200400001)(71190400001)(6306002)(110136005)(54906003)(316002)(9686003)(81166006)(26005)(8676002)(5660300002)(81156014)(7696005)(6246003)(186003)(66066001)(11346002)(25786009)(446003)(76176011)(6116002)(3846002)(53546011)(2906002)(99286004)(508600001)(6506007)(102836004)(4326008)(966005)(14454004)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1372;
 H:DM5PR12MB1820.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xzkdcl/MUko6hyV93PLCKEYcRyhUIvDDQD7RAEea4ShuTSK11wccYlci4ZdUUyFJ5atDnuIsANOOaNq01Jhz8qu3eOUzuJBKTeeM/aEpJ9KPkr4M/wLahfUgwtFrD46fBYMDmdzHqpitqaoXmcqhnSDmK4Yu5Kz3sZGj520XwKshIfYgVHN615H3U9DvI5B36GNw1i0fSxg0ve2kLirw/n5UFIg3kj4ku8SgSLVJdUY7694fvLRPI58aHLaAPQfcvI/+7gS15/zvpy9h81tW/Upv1VtJNzWPnrhW4/dMRoc7ZtXTLyNy43d2ex7XnH9EWj0DBJ6ZhtlfYtr1lwj+JXoCVVfQErnQkRsJZXcVDSFPu7fR5emhofGDQAbbNvwd81tJV4yV2yDU9D0IeawY67fPqxW+PUqzlz7pelrpcxgaP7OqQncr1LFh/HcPqQtNbr/kv6LahM8BYCqZRNXo5vCgxUlvE5+PAWWExVcYuvc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3ea2c3-4ccd-43ce-6840-08d76ea12135
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 16:37:42.0803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXXqRCpHK5gMjY8gSqjqwE4/ozKR/cg06LbFGysME6+p5vE5SUWdCzCG9PLzZ0Fkr7JMc+f00R0By2AzYK60KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1372
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoWBmXpzmdr5byS8YiT2p+LOR8k2XJcjMHyzF1tpDGM=;
 b=HY9TScAW+H5gPYRypSIpH6fp6PDrlheZuhfz2SVHxSUAN1VEUt9iw6dccK5BrVevwAFJew3hOjza+yJ+P2NaksmFW6BTUqsueuOx9kmZ/XTEW2PGVzO2lfuWbXNJXuW7hgy5RZ43c75Y6RT8ZMjs9WnMqNWjAXc7J5kKg+J38jg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: Frederick Lawler <fred@fredlawl.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQmpvcm4gSGVsZ2Fh
cw0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjEsIDIwMTkgOTowMiBBTQ0KPiBUbzogbGlu
dXgtcGNpQHZnZXIua2VybmVsLm9yZw0KPiBDYzogWmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxEYXZp
ZDEuWmhvdUBhbWQuY29tPjsgRnJlZGVyaWNrIExhd2xlcg0KPiA8ZnJlZEBmcmVkbGF3bC5jb20+
OyBEYXZlIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBCam9ybiBIZWxnYWFz
DQo+IDxiaGVsZ2Fhc0Bnb29nbGUuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IERhbmllbCBWZXR0ZXINCj4gPGRhbmllbEBmZndsbC5jaD47IEFsZXggRGV1Y2hlciA8YWxleGRl
dWNoZXJAZ21haWwuY29tPjsgS29lbmlnLA0KPiBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDAvN10gUENJOiBQcmVmZXIgcGNpZV9jYXBh
YmlsaXR5X3JlYWRfd29yZCgpDQo+IA0KPiBGcm9tOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bn
b29nbGUuY29tPg0KPiANCj4gVXNlIHBjaWVfY2FwYWJpbGl0eV9yZWFkX3dvcmQoKSBhbmQgc2lt
aWxhciBpbnN0ZWFkIG9mIHVzaW5nDQo+IHBjaV9yZWFkX2NvbmZpZ193b3JkKCkgZGlyZWN0bHku
ICBBZGQgI2RlZmluZXMgdG8gcmVwbGFjZSBzb21lIG1hZ2ljDQo+IG51bWJlcnMuICBGaXggdHlw
b3MgaW4gdXNlIG9mIFRyYW5zbWl0IE1hcmdpbiBmaWVsZC4NCj4gDQo+IFRoZXNlIGFyZSBjdXJy
ZW50bHkgb24gbXkgcGNpL21pc2MgYnJhbmNoIGZvciB2NS41LiAgTGV0IG1lIGtub3cgaWYgeW91
IHNlZQ0KPiBhbnkgaXNzdWVzLg0KPiANCg0KU2VyaWVzIGlzOg0KUmV2aWV3ZWQtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KPiANCj4gQmpvcm4gSGVsZ2Fh
cyAoNSk6DQo+ICAgUENJOiBBZGQgI2RlZmluZXMgZm9yIEVudGVyIENvbXBsaWFuY2UsIFRyYW5z
bWl0IE1hcmdpbg0KPiAgIGRybS9hbWRncHU6IENvcnJlY3QgVHJhbnNtaXQgTWFyZ2luIG1hc2tz
DQo+ICAgZHJtL2FtZGdwdTogUmVwbGFjZSBudW1iZXJzIHdpdGggUENJX0VYUF9MTktDVEwyIGRl
ZmluaXRpb25zDQo+ICAgZHJtL3JhZGVvbjogQ29ycmVjdCBUcmFuc21pdCBNYXJnaW4gbWFza3MN
Cj4gICBkcm0vcmFkZW9uOiBSZXBsYWNlIG51bWJlcnMgd2l0aCBQQ0lfRVhQX0xOS0NUTDIgZGVm
aW5pdGlvbnMNCj4gDQo+IEZyZWRlcmljayBMYXdsZXIgKDIpOg0KPiAgIGRybS9hbWRncHU6IFBy
ZWZlciBwY2llX2NhcGFiaWxpdHlfcmVhZF93b3JkKCkNCj4gICBkcm0vcmFkZW9uOiBQcmVmZXIg
cGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZCgpDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvY2lrLmMgfCA5NSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMgIHwgOTcgKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgICAgIHwgOTQgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5j
ICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgaW5jbHVkZS91
YXBpL2xpbnV4L3BjaV9yZWdzLmggICAgfCAgMiArDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDI0MyBp
bnNlcnRpb25zKCspLCAxNDIgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjI0LjAuNDMyLmc5
ZDNmNWY1YjYzLWdvb2cNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
