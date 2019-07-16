Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0B6A9C1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 15:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F17F6E121;
	Tue, 16 Jul 2019 13:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84C96E121
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX/pMK09spn57Xx9tjhIrB1G9K0d03qBTc4gxDpBWcjQL36LLf/BUHJ++sSFayx9wYlblbov5f0YEljN8qJAiWT5UoVmBJNKVPXGaCcjet/G5LlGQbKqc2fe/NvJEia4B3l/Zvdx405/NDlVHF14f7qc7mEnYdJu9fziK14gLn9Eq4k1hS1sTMyc6VZgYRfvzMi/0iInHury1ZkQsWYEVfEBelev11+DLSULWfFoSwU3SxyfNlwMC4U/3SN1l2HL1pUdd3IUtRyPkXUNpQf1DWVZg5QxF//7PZhvTC/Nt8voLo5JbHXhPxmpuK6SQtbdSsOk/Ed4EV49r4ebR+re/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os01I7GrBPgpQHeh3fbcUnxYXwBshzs/e4qE5gYz8Dg=;
 b=KrOnyZuEkN6WFtLXgrt/wC1WNyxluqQB01Vfuasks5ts4kCwpBrdw15lAsVZ/qVep0h2YD+lP3xP/C75wyiJZAoalg7FT5/yeEiEtWnA+7+JfNy0Hh72/dNNKBM2NrE7MyoFjGliO3vKNkfvBY+uB76h6wpAM6p0jZXCXPcxPzURp8s3qFZqgOZTQeD8dogzzf+HtXGYler9kxbazZPUYVKIcTTJUT92R3EGvImFcA/+tNgAUm2GSd7GyowUiWxGte5/kIbywsisPYVSUIhBsGveg9kJ+hHqds4rWl+9LKhIponildlJAPBu/a37EsFI8jFyC4VzPdcCwNSisofTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2421.namprd12.prod.outlook.com (52.132.141.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 13:38:43 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Tue, 16 Jul
 2019 13:38:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: use the same attributes when freeing
 d_page->vaddr
Thread-Topic: [PATCH 1/2] drm/ttm: use the same attributes when freeing
 d_page->vaddr
Thread-Index: AQHVN5Y0gU5bZ/aSkkGOeZrSFOx//KbNSFwA
Date: Tue, 16 Jul 2019 13:38:43 +0000
Message-ID: <6f28e750-02e4-438a-3680-a4697014689d@amd.com>
References: <20190711031021.23512-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190711031021.23512-1-huangfq.daxian@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR10CA0129.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:40::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61ce216e-a9e2-4047-0f75-08d709f2eb25
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2421; 
x-ms-traffictypediagnostic: DM5PR12MB2421:
x-microsoft-antispam-prvs: <DM5PR12MB242127AB14D1314893BE760883CE0@DM5PR12MB2421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(189003)(199004)(64756008)(66946007)(66476007)(66446008)(478600001)(66556008)(4326008)(8676002)(64126003)(65806001)(65956001)(446003)(36756003)(25786009)(5660300002)(52116002)(7736002)(11346002)(58126008)(316002)(54906003)(2906002)(76176011)(6506007)(71190400001)(6486002)(46003)(102836004)(6116002)(305945005)(66574012)(31686004)(186003)(99286004)(68736007)(6916009)(86362001)(386003)(8936002)(229853002)(81166006)(81156014)(6246003)(256004)(14444005)(53936002)(6436002)(31696002)(486006)(476003)(2616005)(6512007)(71200400001)(65826007)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2421;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pz0iYhh3AUd+2wHqtVcVTvwmIURCCYenI9mbiA9g3MfoYRvuRJM/J81RuQEyxYht2ZxHw0kyRrnLRV+rZcr9DjNpF9lWF6E3Zbyg61b13QX96SQ/Q6jWbMBP26eDMqJouRMc7+RnBlrnuLTObUpPPabhHElB9WXTn5l0OKY3LLFX0hJLvN9/K6fzwkkWH7QWDTOvnxVS+9p2mExIf+aEBukliFMEv+g2V7jgCxAmIGKlPIhBSp3yWIZ4q1ATrx1KKtj42C2iMjKQvmSxCF4oIqeFKo8abvFqKLZP2QsA78LwsJ5eIFOmi85ZfkG2typX5QhxB0VfqTcYGGkr94/OnOJoBFElQIklL7ib6/XJlLNFCBuWxoS1C6HVhdbXrhuPfb5nkZtJTvWwq0KDYhD1Y7M6BLnkT4zweVFy732BTfk=
Content-ID: <67BD2884C4702D428E659884D293A1FA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ce216e-a9e2-4047-0f75-08d709f2eb25
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 13:38:43.2588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os01I7GrBPgpQHeh3fbcUnxYXwBshzs/e4qE5gYz8Dg=;
 b=1RjjVz3dw9PjBPaMp7uJjAcpyWGJl9pZ0Ol93hZ0PVad0xAL8sQnCps0Bi4dY9aQWobPyfjIMzWevnewf/rs7DfE4/9i26U0pP3tkwSn79qwn/yq/GpmyX8ROlK2rFcqYOmHMhbxg10vi7VaO+3W+zfRb+a4Xo6tZZsII6Wr2Z4=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDcuMTkgdW0gMDU6MTAgc2NocmllYiBGdXFpYW4gSHVhbmc6DQo+IEluIGZ1bmN0aW9u
IF9fdHRtX2RtYV9hbGxvY19wYWdlKCksIGRfcGFnZS0+YWRkciBpcyBhbGxvY2F0ZWQNCj4gYnkg
ZG1hX2FsbG9jX2F0dHJzKCkgYnV0IGZyZWVkIHdpdGggdXNlIGRtYV9mcmVlX2NvaGVyZW50KCkg
aW4NCj4gX190dG1fZG1hX2ZyZWVfcGFnZSgpLg0KPiBVc2UgdGhlIGNvcnJlY3QgZG1hX2ZyZWVf
YXR0cnMoKSB0byBmcmVlIGRfcGFnZS0+dmFkZHIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEZ1cWlh
biBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpIb3cgZG8geW91IHdhbnQg
dG8gdXBzdHJlYW0gdGhhdD8gU2hvdWxkIEkgcHVsbCBpdCBpbnRvIG91ciB0cmVlPw0KDQpUaGFu
a3MsDQpDaHJpc3RpYW4uDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFn
ZV9hbGxvY19kbWEuYyB8IDYgKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcGFnZV9hbGxvY19kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxs
b2NfZG1hLmMNCj4gaW5kZXggZDU5NGY3NTIwYjdiLi43ZDc4ZTZkZWFjODkgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYw0KPiBAQCAtMjg1LDkgKzI4NSwx
MyBAQCBzdGF0aWMgaW50IHR0bV9zZXRfcGFnZXNfY2FjaGluZyhzdHJ1Y3QgZG1hX3Bvb2wgKnBv
b2wsDQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgX190dG1fZG1hX2ZyZWVfcGFnZShzdHJ1Y3QgZG1h
X3Bvb2wgKnBvb2wsIHN0cnVjdCBkbWFfcGFnZSAqZF9wYWdlKQ0KPiAgIHsNCj4gKwl1bnNpZ25l
ZCBsb25nIGF0dHJzID0gMDsNCj4gICAJZG1hX2FkZHJfdCBkbWEgPSBkX3BhZ2UtPmRtYTsNCj4g
ICAJZF9wYWdlLT52YWRkciAmPSB+VkFERFJfRkxBR19IVUdFX1BPT0w7DQo+IC0JZG1hX2ZyZWVf
Y29oZXJlbnQocG9vbC0+ZGV2LCBwb29sLT5zaXplLCAodm9pZCAqKWRfcGFnZS0+dmFkZHIsIGRt
YSk7DQo+ICsJaWYgKHBvb2wtPnR5cGUgJiBJU19IVUdFKQ0KPiArCQlhdHRycyA9IERNQV9BVFRS
X05PX1dBUk47DQo+ICsNCj4gKwlkbWFfZnJlZV9hdHRycyhwb29sLT5kZXYsIHBvb2wtPnNpemUs
ICh2b2lkICopZF9wYWdlLT52YWRkciwgZG1hLCBhdHRycyk7DQo+ICAgDQo+ICAgCWtmcmVlKGRf
cGFnZSk7DQo+ICAgCWRfcGFnZSA9IE5VTEw7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
