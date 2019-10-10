Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F129D2110
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F3B6EA96;
	Thu, 10 Oct 2019 06:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690074.outbound.protection.outlook.com [40.107.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52986EA99;
 Thu, 10 Oct 2019 06:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYgeili2deco7P8o5sT04M6uGI2Lx6UXOS7BY1kbBfl+CbRljqHrcQ1L55Ai2r/GX/LkbrudX7nk/yOa+guK0VzIBhvxy2Eb35E5Q/5EcqOpmBO9/Jf4AmFqQ4P9Qz08uiGTLOHUCLBFVsiPcX6A90QQg6uEZXT54OMoZG4U3rapuB4MzquHnKMrAVZWcmbyXBpNBkH9MSlocnc6mprWOJQfwNRAJrUx/2x+hS3uNz2sDHIpxmk9nlsU8ep+8Xmd5BwoOnzDRwmCZmJwQPLaQgIQjMNsBtbj/rhb2HWAp0wgncVzY7Kx4PnGhky3oYyttuoxFTLmjiE9tqbgfW17qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvn+m2azCp3JiTzN5FGomgW8n0KMVe4SAaewljqa+1s=;
 b=ZmFLwtktAqmK+ZLJfXCMkOzzFWpTwxr9t8di2UxpTkP7I6DIaPz2FtYzdZWEOh+Fy0hBsoItCMC20qh3HN/30ac8lUgpg0BNTyCLotmydPUea8WRN+atHJHt1W9JypKDu/f621b3GPLSRfJJkCC8oZSLi7Qw8y5ITQLqD0rwdThvMSEN/K8lA8PIVOhvoHukZaKUFzAros6FaqRhyKz/silOcjxB2f3q4qCkSAHrSvkMDkfew/lNN9Qlhnb281cY5c8V4CDzIo6xErOaDde/Qti/Uf/6QwV3fFYTODYySFmB+GdDPGeNKAs7Du9lJ/8S1S916HLddrK8oRXOwbQTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1196.namprd12.prod.outlook.com (10.168.237.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 06:52:29 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.026; Thu, 10 Oct
 2019 06:52:29 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam
 Ravnborg <sam@ravnborg.org>, "Quan, Evan" <Evan.Quan@amd.com>, "Xiao, Jack"
 <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Zhiyun Qian <zhiyunq@cs.ucr.edu>, Chengyu
 Song <csong@cs.ucr.edu>
Subject: Re: Potential NULL pointer deference in drm/amdgpu
Thread-Topic: Potential NULL pointer deference in drm/amdgpu
Thread-Index: AQHVfyj5mFwZtWFjokmOVDCHmYFtSKdTcDWA
Date: Thu, 10 Oct 2019 06:52:29 +0000
Message-ID: <4b4166e6-738a-5c64-4ca7-e183a6c94aac@amd.com>
References: <CABvMjLQuxeZnRMV0T5VDeEj7zV7mD4wzp5QPFCJ_oVhH0vRihQ@mail.gmail.com>
In-Reply-To: <CABvMjLQuxeZnRMV0T5VDeEj7zV7mD4wzp5QPFCJ_oVhH0vRihQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR05CA0028.eurprd05.prod.outlook.com
 (2603:10a6:208:55::41) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11c514c8-789c-4aad-73d5-08d74d4e6ad1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1196:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB119650979F59EE4F7E738C1C83940@DM5PR12MB1196.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(53754006)(199004)(189003)(316002)(36756003)(478600001)(186003)(14454004)(25786009)(110136005)(58126008)(2201001)(81166006)(8676002)(81156014)(305945005)(86362001)(256004)(7736002)(6486002)(6512007)(229853002)(8936002)(6116002)(31686004)(52116002)(76176011)(6436002)(99286004)(6506007)(446003)(11346002)(2616005)(46003)(2501003)(6246003)(65956001)(65806001)(5660300002)(71190400001)(71200400001)(2171002)(66446008)(64756008)(66556008)(66476007)(4744005)(102836004)(31696002)(476003)(386003)(66946007)(486006)(2906002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1196;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RmMRyzcOw86/yhwZQT3rrGz/COBJocvrk6js+60Q6p8VIPfh8mFBhM3LXnILyDgwzmgw9k8N9V3vtBrVz1zXC3Jl8bwJP5bYZCMXd9X4AGYd0LlbS/CX1hmrap8ZNLLauLNpkpyNiX2jOUtFz6+g4YJt3JM761zlrTsuv9WI4F+O4AZ7zSWkcLEFAc8579ulvdw78b2vMwMdFppTom5Ee+MCYYuLqf9elOypc3BGIFBykUrjG3pVEP9Uyckw1eQM1CtByVSCypcBjA8TaW3Elhz8y0WIKbksPGl+3blpuTNvKqR7kDh0PmWUwXh5WXTXGCHBEE4ygwsods0mTVd4jVAo49Iuf4SY2W5Y3+von7Bl5jvEKwNdIVKMp+UL3GcBkdo+AAUSHWhNtccTN3528nCF6hFdAZRE8zcQMqZHlp8=
Content-ID: <783354EA019E6B4A9C3BC22797F81E4B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c514c8-789c-4aad-73d5-08d74d4e6ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 06:52:29.3342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Y2Hv0UxUc/fGUDrlysWCCZhV8FaAPvQvwv1DjEHRZ8fKFS1qRadjxOKtwq5xR9N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvn+m2azCp3JiTzN5FGomgW8n0KMVe4SAaewljqa+1s=;
 b=YiuXchV85CEg8J4hsVENCeBh2JRGYEiMQthSCXWum267a+gZoLwbApm3t3itiD30ay0xUM+vq7R/i9IpjWegzsQ1OXI+Rf1/r0lvdi8CPDS7Hf8gYGX2zmPHfWHHE6sI/kuV3C78rluBNe9+Vea5Kk+PrSZBqZRq9QflnwliiA4=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWl6aHVvLA0KDQpBbSAxMC4xMC4xOSB1bSAwNzowOSBzY2hyaWViIFlpemh1byBaaGFpOg0K
PiBIaSBBbGw6DQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jOg0K
PiBUaGUgZnVuY3Rpb24gdG9fYW1kZ3B1X2ZlbmNlKCkgY291bGQgcmV0dXJuIE5VTEwsIGJ1dCBj
YWxsZXJzDQo+IGluIHRoaXMgZmlsZSBkb2VzIG5vdCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIGJ1
dCBkaXJlY3RseSBkZXJlZmVyZW5jZSBpdCwNCj4gd2hpY2ggc2VlbXMgcG90ZW50aWFsbHkgdW5z
YWZlLg0KPiBTdWNoIGNhbGxlcnMgaW5jbHVkZSBhbWRncHVfZmVuY2VfZ2V0X3RpbWVsaW5lX25h
bWUoKSwNCj4gYW1kZ3B1X2ZlbmNlX2VuYWJsZV9zaWduYWxpbmcoKSBhbmQgYW1kZ3B1X2ZlbmNl
X2ZyZWUoKS4NCg0KVGhhdCBpcyBleHBlY3RlZCBiZWhhdmlvciBhbmQgbm8gbmVlZCB0byB3b3Jy
eS4NCg0KVGhlIGZ1bmN0aW9ucyBpbiBhbWRncHVfZmVuY2UuYyBhcmUgdGhlIGNhbGxiYWNrcyB0
byBpbXBsZW1lbnQgDQphbWRncHVfZmVuY2Vfb3BzLiBUaGUgZnVuY3Rpb24gdG9fYW1kZ3B1X2Zl
bmNlKCkgY2hlY2tzIGlmIHRoZSBvcHMgb2YgDQp0aGUgZmVuY2UgYXJlIGFtZGdwdV9mZW5jZV9v
cHMsIHNvIGl0IGlzIGd1YXJhbnRlZWQgdGhhdCB0aGUgZnVuY3Rpb25zIA0KYXJlIGNhbGxlZCB3
aXRoIGFuIGFtZGdwdV9mZW5jZSBzdHJ1Y3R1cmUuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
