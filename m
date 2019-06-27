Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1CD5885A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 19:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6A26E27B;
	Thu, 27 Jun 2019 17:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730089.outbound.protection.outlook.com [40.107.73.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C906E27B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=q62jBsiq8rS5hczvgTzdetk9P2umiPPLm9/8dJ4o11CAF/lVdb80i+x3Fl9UWUf5waV58tAAOeyAwflTCbApE21Tn7RyIzVAUe66327EK69OIRdtE2Cwqx8x/JJ++dokXO72HWV8ncZ05Rw3whP75ZFqB9G5dyY6sHauZIDDAmc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VellD7SaBDg16WdxRqyVC2EBdDL2kVNrI/YyuFEeWGA=;
 b=s+jjOGO70fx5ZCMzYhBPjx4prHXSA9LmPcCMbUytNoeaDYjI5AaIxJt5Kj35py7v2sK91sZT7riTD8DuYxWSxQ0Zrrl/ekB1/er/NlpKoE6aB77Knrwu72ZhxSp8EHoqaghGbsNDP8xYP/ToU18tiIpc4x0OKUredxBJPLf8lKM=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1196.namprd12.prod.outlook.com (10.168.237.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 17:30:00 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 17:30:00 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Topic: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Index: AQHVLPGOv8ZFH37+40SwLhEqcDKxyqavrjOAgAAKLQCAAATKgIAAANEAgAAEAIA=
Date: Thu, 27 Jun 2019 17:30:00 +0000
Message-ID: <f851fb21-fdf6-f5d7-0f53-7d6ed060b191@amd.com>
References: <20190627140626.GA6027@mwanda>
 <41b33cc3-2f07-681a-5fee-25a328de46bd@amd.com>
 <20190627165532.GD10652@lst.de>
 <278388a6-bd2d-2891-19be-97e33bc470a5@amd.com>
 <20190627171536.GA11117@lst.de>
In-Reply-To: <20190627171536.GA11117@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae66d68e-bd32-4cce-ce8d-08d6fb251473
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1196; 
x-ms-traffictypediagnostic: DM5PR12MB1196:
x-microsoft-antispam-prvs: <DM5PR12MB1196C7C8E5C2FBBA67A7642F83FD0@DM5PR12MB1196.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(39860400002)(396003)(199004)(189003)(6116002)(31696002)(316002)(4326008)(102836004)(76176011)(36756003)(72206003)(53936002)(8676002)(52116002)(81166006)(81156014)(99286004)(229853002)(64126003)(386003)(14454004)(58126008)(54906003)(6506007)(8936002)(86362001)(256004)(25786009)(5660300002)(2906002)(478600001)(6916009)(305945005)(66446008)(64756008)(66476007)(66556008)(66946007)(6512007)(6486002)(6436002)(486006)(71200400001)(6246003)(71190400001)(186003)(446003)(476003)(2616005)(11346002)(46003)(65956001)(65806001)(31686004)(65826007)(7736002)(68736007)(73956011)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1196;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: egZu5HIn6vbPgagKtl+HBBIuTEc6ZPQ2PWfDgaScajj2y7InZ0DHc854J5pQQ8H0RNWva5zMuPWyf7rtbOLTAm5L7iXJVX34Sah0YhFS47pZP0HRui5xIuuk7q9AvJ2YQcJYHxUe/GyqSibVcQPkXAiR4lb2bdK/1imlyquliSznXoua48tDCLCH7VMFfo3hhNFYF9FUZXV/k4JTAdWeI40aAdNQ3BNP1nshnXEm2fF8TJm/tLnDpipBA1CUuc96LWIeFfTTtppiZ2/BlD9XK/2Oqldz+nvMBQwsuJZ4ev/SXFAI6dT2ikVtNEFcYMPj5rDgpViYq+VQEXX5+NKxEeWYiFUwKZ7fBsFewO1yPTliWc+anQcc3HwejK8EX75s74SrmES70+O/FQqPT60n2hU55XsxRViE+hFkBM1vLZs=
Content-ID: <62E0FD04B31DA344888DC24907FE09F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae66d68e-bd32-4cce-ce8d-08d6fb251473
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 17:30:00.0333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VellD7SaBDg16WdxRqyVC2EBdDL2kVNrI/YyuFEeWGA=;
 b=ZNpJkusYJr6pDBSZllQlwhHAh/f/3/32puEb6Y0BWzgYmYgXypXQ+ueu3+QLrAlZdD7dVKuhhJpjLqx96RcL/QXTjXx85mVs4bYKMvmZQzwsWSnguSzHuOwSTScbTnoaBYULHJKInhG7E1JOLYQ5cc3X+JEvwAkww6m4vhFB/UI=
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

QW0gMjcuMDYuMTkgdW0gMTk6MTUgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gVGh1
LCBKdW4gMjcsIDIwMTkgYXQgMDU6MTI6NDdQTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6DQo+PiB0aGUgd2hvbGUgVFRNIHBhZ2UgYWxsb2NhdGlvbiBjb2RlIGlzIG5vdCByZWFsbHkg
d29ya2luZyB0aGF0IHdlbGwuDQo+Pg0KPj4gSG93IGRvIHdlIHRoZW4gZG8gdGhpbmdzIGxpa2Ug
bWFwcGluZyB0aGF0IG1lbW9yeSB0byB1c2Vyc3BhY2U/DQo+IGRtYV9tbWFwX2F0dHJzIHdpdGgg
dGhlIHNhbWUgZmxhZ3MgYXMgcGFzc2VkIHRvIGRtYV9hbGxvY19hdHRycw0KDQpXZSBuZWVkIGEg
d2F5IHRvIG1hcCBvbmx5IGEgZnJhY3Rpb24gb2YgYSBWTUEgb24gYSBwYWdlIGZhdWx0LsKgIE9m
IGhhbmQgDQpJIGRvbid0IHNlZSB0aGF0IHBvc3NpYmxlIHdpdGggZG1hX21tYXBfYXR0cnMoKS4N
Cg0KPj4gQW5kIGhvdyB0byB3ZSBjb250cm9sIGNhY2hpbmcsIHdyaXRlIGNvbWJpbmUvYmFjayBv
ZiB0aGF0IG1lbW9yeT8NCj4gQnkgdXNpbmcgdGhlIGZsYWdzIHBhc3NlZCB0byB0aGUgZnVuY3Rp
b25zLCB3aXRoIHRoZSBzbGlnaHQgY2F2ZWF0DQo+IHRoYXQgYSBsb3Qgb2YgdGhlIG9wdGlvbnMg
YXJlIG9ubHkgaW1wbGVtZW50ZWQgb24gc29tZSBhcmNoaXRlY3R1cmVzLg0KPg0KPiBEb2N1bWVu
dGF0aW9uL0RNQS1hdHRyaWJ1dGVzLnR4dCBkb2N1bWVudHMgdGhlIGF2YWlsYWJsZSBmbGFncy4N
Cg0KVGhlIHByb2JsZW0gaXMgdGhhdCBJIHNlZSBxdWl0ZSBhIGJ1bmNoIG9mIGZ1bmN0aW9ucyB3
aGljaCBhcmUgbmVlZGVkIGJ5IA0KR1BVIGRyaXZlcnMgYW5kIGFyZSBub3QgaW1wbGVtZW50ZWQg
aW4gdGhlIERNQSBBUEkuDQoNCkZvciBleGFtcGxlIHdlIG5lZWQgdG8gYmUgYWJsZSB0byBzZXR1
cCB1bmNhY2hlZCBtYXBwaW5ncywgdGhhdCBpcyBub3QgDQpyZWFsbHkgc3VwcG9ydGVyIGJ5IHRo
ZSBETUEgQVBJIGF0IHRoZSBtb21lbnQuDQoNCkFkZGl0aW9uYWwgdG8gdGhhdCB3ZSBuZWVkIGEg
d2F5IHRvIGZvcmNlIGEgY29oZXJlbnQgbWFwcGluZ3Mgd2l0aCANCmRtYV9tYXBfcGFnZSgpIHdo
aWNoIGZhaWxzIHdoZW4gdGhpcyBpc24ndCBndWFyYW50ZWVkLg0KDQpSZWdhcmRzLA0KQ2hyaXN0
aWFuLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
