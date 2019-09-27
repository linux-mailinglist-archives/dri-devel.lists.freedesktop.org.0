Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C05C0AA7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 19:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36406E1B1;
	Fri, 27 Sep 2019 17:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D7C6E1A8;
 Fri, 27 Sep 2019 17:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJtjOKxhhHnoQ38PyMJoBc3+NssEe3E+n1WvS3/Mj4DaPG1POD1XsGwyiltcXWZB5bjTj7ZRD46fh5Yt5suPlbgXS2+7fNkcZdPl5v1klqddUBmhEtpnxqopBYUmzXX83IAVXnDuqY8njSr7M7zE4bWDv6wte2xWRCAs5oPA4V6N4KVbqY2qPNMfZd/zvEV4ezT+k6NJO0/XMKW9oY2CmjKvK6QwYmoQwOlwkPn1iRKAD6rrXWEzl9n6QmPBbSEiXcFiBZH2Ps+IVLEg7LQa6V6Vd2NWBBTy8qW+Wwp8XPkIVtJ/KwlueMOgLhoVj37ZjQFXtBRTZEsUxCJa1Wyx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLK3fU9R3QqMYsmbtnfy5E1MjCmBw3cMeaUakLjq418=;
 b=ERNTx4zUq5FcKmwkPM6/GGOPsAWD8aqg/YLB89TBgA4OijfxyKSCZZUS4maTiDStu8HjRk6x923bphwpP6m52p6Twi8TI3E69sg3adqEBHdb5dCKaEaEeug6FWu0A0L2Q5hW01XjbOLWmkiFcr6Gv6mAf6pilE+MKJ0EmoYFsjNZt+hT028VhPulbZZFvgZq0CzPF+7AVdWTh+jSgQE86gtXOlKaPFWK0qm7Yl5sYpy7Aq7BnoNSnnl1IHLzUIXYxpccDk9s+eBQa6NgNM6rIX6dVsupv+0tOC3MCo7MhwOlFQgzyJ278S/iZ5CBdvxU89tfDZVN/Gr5XhGnJLx2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0181.namprd12.prod.outlook.com (10.172.79.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 17:56:30 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2284.023; Fri, 27 Sep
 2019 17:56:30 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/amdgpu/dm/mst: Use ->atomic_best_encoder
Thread-Topic: [PATCH 3/6] drm/amdgpu/dm/mst: Use ->atomic_best_encoder
Thread-Index: AQHVdL0FUxqHHzKn0EmCiHXueawBm6c/0EsA
Date: Fri, 27 Sep 2019 17:56:30 +0000
Message-ID: <6129c0a5-9a8a-8a05-4dd9-db3204dcbfd8@amd.com>
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-4-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-4-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
x-clientproxiedby: YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::36) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9e2c36d-9bf0-43e8-6454-08d7437406b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0181; 
x-ms-traffictypediagnostic: CY4PR1201MB0181:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01818DFCDF12965DC9DDCCE58C810@CY4PR1201MB0181.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:144;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(199004)(189003)(2501003)(65956001)(31686004)(52116002)(486006)(2906002)(110136005)(4326008)(54906003)(58126008)(65806001)(8676002)(446003)(316002)(5660300002)(3846002)(186003)(99286004)(71190400001)(71200400001)(36756003)(11346002)(8936002)(76176011)(476003)(26005)(2616005)(6116002)(386003)(53546011)(6506007)(102836004)(7736002)(256004)(66476007)(25786009)(31696002)(6436002)(6486002)(229853002)(66556008)(66446008)(64756008)(14454004)(81156014)(66066001)(81166006)(6246003)(66946007)(6512007)(305945005)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0181;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HpJToeaH0+njwtJW7ZkNTNfsgmpPjmTBV7nURk3ZaLu9PBWDS4+y5e2ug014F6abZwgHrxRoDrWr/w2CaQZYpxkZovhyVvLAwLg1+I7F3p6i3oNzcZ5tl0LvOrTxCyneYqJtGCfLw7snb6bmQa1UFhWswD/wpeRceXTRV1tI+BaO4XxdjxUrvo2dXL9JUHh8cuBhhRAQea21YclnsC+k4O47L1A6KIf8i9Jt/sm2G160vcVtKCp+ve5b5Wp2bGrnWiDewkfroDSh7D86V28xv/Kkiome4Po98bp+Wd9U2hBrokac+0ShNQBHkoFwmyipuWYG256r/XMGA5MBcpwLiqHkB2kenGXUHCPf4Cu3VWmnwDAiTh6UqtuYylLjC5BWtDvwIRZFXZLMHTbmzRR44QNDTDwzpGJNOBJm32T8fec=
Content-ID: <934D761988E133448EB5E1019A400C28@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e2c36d-9bf0-43e8-6454-08d7437406b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 17:56:30.6740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUXFvAIMvELfCASJeQ2ok+TCvP6hiyaE44x/VTPajJzpmTN/qmMrHSOQUx7XDwFFbvm96ISUnM9V56DBhJCxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLK3fU9R3QqMYsmbtnfy5E1MjCmBw3cMeaUakLjq418=;
 b=BOCZwWk6Sw/i0xgItgHGdcKQKY0l4O3kkEhNlu8hwkWBZbXIyu8refM6b9PE+PNuEWFl7CNkfqVIhJzATDIvkWCGg9hXGfoI+17IPKP/eVWvTs45CSqKXmrcAjrDtWkEOctcKG3/zhnNdW6VHrdnZFq607bCHhm14Txu4R0QycM=
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0yNiA2OjUxIHAubS4sIEx5dWRlIFBhdWwgd3JvdGU6DQo+IFdlIGFyZSBzdXBw
b3NlZCB0byBiZSBhdG9taWMgYWZ0ZXIgYWxsLiBXZSdsbCBuZWVkIHRoaXMgaW4gYSBtb21lbnQg
Zm9yDQo+IHRoZSBuZXh0IGNvbW1pdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnku
d2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIC4uLi9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgICB8IDEwICsrKysrLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9tc3RfdHlwZXMuYw0KPiBpbmRleCBhMzk4ZGRkMWYzMDYuLmQ5MTEzY2UwYmUwOSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fbXN0X3R5cGVzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMNCj4gQEAgLTI0MywxNyArMjQzLDE3IEBAIHN0
YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmRtX21zdF9iZXN0X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKg0KPiArZG1fbXN0X2F0b21pY19iZXN0
X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gKwkJCSAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uZWN0b3Jfc3RhdGUpDQo+ICB7DQo+IC0Jc3RydWN0
IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFtZGdwdV9kbV9jb25uZWN0b3IgPSB0b19hbWRncHVfZG1f
Y29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+IC0NCj4gLQlyZXR1cm4gJmFtZGdwdV9kbV9jb25uZWN0
b3ItPm1zdF9lbmNvZGVyLT5iYXNlOw0KPiArCXJldHVybiAmdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rv
cihjb25uZWN0b3IpLT5tc3RfZW5jb2Rlci0+YmFzZTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyBkbV9kcF9tc3RfY29ubmVjdG9y
X2hlbHBlcl9mdW5jcyA9IHsNCj4gIAkuZ2V0X21vZGVzID0gZG1fZHBfbXN0X2dldF9tb2RlcywN
Cj4gIAkubW9kZV92YWxpZCA9IGFtZGdwdV9kbV9jb25uZWN0b3JfbW9kZV92YWxpZCwNCj4gLQku
YmVzdF9lbmNvZGVyID0gZG1fbXN0X2Jlc3RfZW5jb2RlciwNCj4gKwkuYXRvbWljX2Jlc3RfZW5j
b2RlciA9IGRtX21zdF9hdG9taWNfYmVzdF9lbmNvZGVyLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGlj
IHZvaWQgYW1kZ3B1X2RtX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIpDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
