Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59358812
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 19:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F196E21E;
	Thu, 27 Jun 2019 17:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB126E21E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=eybKII6GO9L6y64lfV/szvTRUrnR4VawRScr3HYwnIgKFZeRKrf9y2Pwf2YeDEM7HJ653fqSlXFkG8+in2MWT81ddeZoMMQ/zY3tig9c/Ey53L3WCXTo743SPRY8cSADG2elMNqTDi6a9LQc7OGa3+4Y7ifeuh+IuZJxIaaEOf0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40UYsCQqd1U+1pXAqwtDbhK3zbNHAq7/O6iBAhRb04Y=;
 b=GKsA8kgsoc06ueo4M7EJfG2FD/7C3U8AHQgqTAe+7kwqEr9pMHFBL4sPpkYaTsrlGtopo/rNInZnvB4BYGOeX9T8e2/8vF2FUjXMx+GaSndy1WPvqMjP26/gVAJ/JGCtOXtYKaftcUBqBu80Gb4ks9MwnK8joGZPc39K0sgQ55w=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1596.namprd12.prod.outlook.com (10.172.38.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 17:12:47 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 17:12:47 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Topic: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Index: AQHVLPGOv8ZFH37+40SwLhEqcDKxyqavrjOAgAAKLQCAAATKgA==
Date: Thu, 27 Jun 2019 17:12:47 +0000
Message-ID: <278388a6-bd2d-2891-19be-97e33bc470a5@amd.com>
References: <20190627140626.GA6027@mwanda>
 <41b33cc3-2f07-681a-5fee-25a328de46bd@amd.com>
 <20190627165532.GD10652@lst.de>
In-Reply-To: <20190627165532.GD10652@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR0502CA0044.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::21) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b36356a2-b2a5-4ff1-6024-08d6fb22ad3a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1596; 
x-ms-traffictypediagnostic: DM5PR12MB1596:
x-microsoft-antispam-prvs: <DM5PR12MB1596CE2CD9B765A4BB2DDE9C83FD0@DM5PR12MB1596.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(66556008)(86362001)(5660300002)(73956011)(6506007)(54906003)(6116002)(6486002)(71190400001)(71200400001)(6916009)(68736007)(6436002)(4744005)(386003)(31686004)(6512007)(99286004)(66476007)(64756008)(66946007)(8936002)(36756003)(66446008)(52116002)(25786009)(65826007)(53936002)(102836004)(31696002)(2906002)(14454004)(316002)(58126008)(4326008)(8676002)(478600001)(186003)(72206003)(81156014)(305945005)(229853002)(256004)(11346002)(65806001)(486006)(446003)(76176011)(476003)(2616005)(64126003)(46003)(7736002)(81166006)(65956001)(6246003)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1596;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g31KcLJpdJbQBakvIA5j7j7FH/YKOwe6jRwORebL03VkyYU5n0DsLvn6aaIdc18xBs47YXbt7rqw+5FzvZz4nqquZGLHE0dB2veXlcpAKokK/zcqQ4iWRBLqmRIERcKW4qGDnBqgw3dkgsF07NY/3O2ECoo6NkgzLNmo5i7yskS/ubbB7dZFefuWcTy05aqqYaTE22OKjXYyDMFvLGXWNLr3+9YhwR54xyQ8LQH7hV62zoI3klEG9NmmjHg73idiN5WC3eeJmUrzN1iWByNQ/+Dwwi0/ByifKzl3NEFGb+Kc0sujXve1xkECSXLawWer4EE7slJVhG6uSl9ph8ldctymCahVy+5AmoIXzH7ToqT59mQ/BYpTaugBRWjIRwR/T+Xd9j2w4TxCbJCjfM30fKzg3sPL7RoxmDSXGXR7gS8=
Content-ID: <310269EF3511B04681F2FD78A73D70F5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36356a2-b2a5-4ff1-6024-08d6fb22ad3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 17:12:47.8382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40UYsCQqd1U+1pXAqwtDbhK3zbNHAq7/O6iBAhRb04Y=;
 b=xsL/ZeyQg4iHeneRufEdXBTDJmZ0VlqABk19vFfmBAUwvbM+4rVtvFVBOvFILy3yqvaEgdKqfl4g7dpkkRXImk62LMSo19gvKePa8awrlm2Atmivalz7I6EzZI5zXL8t5rsK+4HExJm16SSK0Cw2B8qNsvX/Ik4UCiesXcbobtA=
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
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDYuMTkgdW0gMTg6NTUgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gVGh1
LCBKdW4gMjcsIDIwMTkgYXQgMDQ6MTk6MTRQTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6DQo+PiBJZiBub3QgdGhlbiB0aGUgcmVhbCBxdWVzdGlvbiBpcyBob3cgdG8gY29ycmVjdGx5
IGdldCB0aGUgYmFja2luZyBwYWdlDQo+PiBmcm9tIGRtYV9hbGxvY19hdHRycygpLg0KPiBUaGUg
YW5zd2VyIHRvIHRoYXQgaXMgdGhhdCB5b3UgY2FuJ3QuICBkbWFfYWxsb2NfKiBpcyBhbiBvcGFx
dWUNCj4gYWxsb2NhdG9yIHRoYXQgb25seSBnaXZlcyB5b3UgYSBrZXJuZWwgdmlydHVhbCBhZGRy
ZXNzIGFuZCBhIGRtYV9hZGRyX3QsDQo+IGFuZCB5b3UgY2FuJ3QgcG9rZSBpbnRvIHRoZSBpbnRl
cm5hbHMsIGFzIHRoZXJlIGFyZSBhIHZhcmlldHkgb2YNCj4gZGlmZmVyZW50IGltcGxlbWVudGF0
aW9ucy4NCg0KVGhvdWdodCB0aGF0IHlvdSB3b3VsZCBzYXkgdGhhdC4gSXQgYmFzaWNhbGx5IGNv
bmZpcm1zIG15IHN1c3BpY2lvbiB0aGF0IA0KdGhlIHdob2xlIFRUTSBwYWdlIGFsbG9jYXRpb24g
Y29kZSBpcyBub3QgcmVhbGx5IHdvcmtpbmcgdGhhdCB3ZWxsLg0KDQpIb3cgZG8gd2UgdGhlbiBk
byB0aGluZ3MgbGlrZSBtYXBwaW5nIHRoYXQgbWVtb3J5IHRvIHVzZXJzcGFjZT8NCg0KQW5kIGhv
dyB0byB3ZSBjb250cm9sIGNhY2hpbmcsIHdyaXRlIGNvbWJpbmUvYmFjayBvZiB0aGF0IG1lbW9y
eT8NCg0KQ2hyaXN0aWFuLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
