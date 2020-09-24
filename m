Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D94276FA0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF0A6E20A;
	Thu, 24 Sep 2020 11:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6DC6E20A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFgpB5m60aaqmRFveLZxIIJ6mQoB6YZa264+z9SR/NKnY4jS5UgWRhBfOSrkddxuCrvkxLn0ZwxoM78/fbYHWav9OJiv29tNrVabFawcj8MnZr/SeBrPNnGfFjSJKtEpjDxlbc34C70SKcBMBZLNPrFDIGm5I0aQLWj3ESso9Ufabxs1NNljP74bIwcKrsptjT/kmO4avyyhy8KgzV0QZip3m0eOEfYWluSMwMZatoNSV5+rPEbnHPoG+Wo+UvyTRKOz8AHeXTagYVzZtmT3UO1l+15V+75KQwdfcJFcXftbQvvo23qihdiBLxZpBdn0OzpwJA2QbBOILq31pVqLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu131oCra2xAXnZkk2HZo8TzVpKM5hABdWPMS+ofGkY=;
 b=WsMa0A/qSOQ1hXOBeD5XLZBVNCSmlRQWoavohk+5C1zWwANPrgyfuevg3tpa7Krhvo79udzhdq5mBc5SwAKb4uCnUG17CvoIo7o7jgzYtIlQBv8VPM/AjWw7afC9h6jL7g2xWtG4zRlPG0hsjFPMykoq9+1HERkztEHv00rkSKEP5jh2kjMkhVaWX2PoATX4qgtKRCQcVZylCoLpfDNlLQybnIGDxnvGuMw9WLowyrNp74f98BP0wF6sQvNfN0m1UlkbWihDX7AYJEkV0eYjDFICu8mFfboFaeuoUO9btpIe3VmYOhnMU53tM1L8wMEXGTbovtmELLSjWAnJuHsUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu131oCra2xAXnZkk2HZo8TzVpKM5hABdWPMS+ofGkY=;
 b=fwV+NZYH57t1i02vWc/q367xO0dqK4myuYvB/jSj43ZDaZOg9OUvTujA5ZP20dPwiXeWzCkqjYOxwzqA/ZXNK2e8wtPfkw7hsM7/1zzoLe88Rec1TMJbe2/2J8zGeQEZf1BH3GaI7+IqAuYBnfjC3UZwPn2NA+zEBY+A/AFZoCA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:14:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:14:51 +0000
Subject: Re: [PATCH 08/45] drm/vram_helper: implement a ttm move callback.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-9-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f9c9db69-7de2-86f8-beff-07b91c32534f@amd.com>
Date: Thu, 24 Sep 2020 13:14:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-9-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:208:122::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:208:122::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 11:14:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b1dd1b8-7494-46b7-5efd-08d8607b0e68
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353C6219439FCA772EFF9B883390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:71;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuHYg5FE5tJksJytk4oz0yc6cUXz7PTeV7+CTdVuT31gyth/p5s+NTx5x6Rt/Rqe54YsIkudEE+KOkHonHpYa156SC6sXc0hVT48mWkVsNXWuPdxEYdDxvC6TWlyWR0iGSpjFpCZgUTk5W12y/AyShKcvXBYOHsNordFFCLNRFa27eBeSHHgzlkFZCbnurTAAo9QSWG7mwvc6Ky572RjEHqZMwuUyPSVdp/BBP+ZW2R7qzMJ17GysbQrEveffeVgjFOfvJxaalO72b1a7WG3TcYMi5Z7zJVuC6/kURUiXnT2DR4/ofUW7l7Nphh4GeegupWe5siAF/w7ywDSk1bp2cyy/fd/h5tZD4BvNM0oHgKg9mCNoYIQp922W/2F0kGw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(66556008)(66476007)(66946007)(31696002)(186003)(36756003)(16526019)(2906002)(6666004)(86362001)(31686004)(8936002)(478600001)(4326008)(6486002)(5660300002)(316002)(2616005)(52116002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QUpL0vo0T7/y6FB8EfOssbTmo/3Y/ctILGDMjx+pDQVdZ8FK1x838Yv+l9T/LNNYDml1udl5Vp9IDhDU5fqYGsWB9G0T8odLdo8DDhxruaQm5P5LHorj7DaHklxh5UIPMYO+rO37jFsttuvOcZqMRx01jvUfEA1XVXImmcZxdxL0fYsajmBYTisdDz9tDAvuKm6bJdyTi6dxoCURrq6hMjCYyl33aN+yjMF5rjwhAEQ3N1/CPiqJwsvPaU62WqO9Y+ddf1BH+ZbKYajaCdvO0+BlPTYg1q1VLGz5E0ZwG8ddAVISUwzJOomD+sGC3k3lHYIg5MIL6LIzDuWTQlN0RL95t4vtAYW/Z/bIpGhPlVQaEKFSfza79YrJXLCtp3IwPFwUQV8G504v33kzSe95cRmUM5Fwoob4nlyhT7g5JsUdzmQGgyjBccQcNo4RXnaC3tcF2nX51EcMYmYj039OiEWN3LFLyUgM4yc9t3pGGmuM1LncKN9ElsH4ki5YLiOZlhK4jQx/IgRYg5z6oMYRUf0mR8mKdZPUiv964BNKTYkiHMGEF9WtNdSwEFLETuXOiR06RhsFfILnzyTHxuaf0bqRkrBfck6mX7yi1B4sWJ5F7nIz5pvUYowF4WNLww/3g4k689hjFy0LvCF3VeroIFKMyZ1s2lH3wBzDJ5BCEZ6d1xkcX2MT3lgsU1cWJ+bUioAX6XBQDeotUmbnSqj2VQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1dd1b8-7494-46b7-5efd-08d8607b0e68
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:14:51.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bgu3s65CbENgt+z1UMvuCw2RWRsmyTyLvIfFYdpbRoJi2RCVmyscdccaGWS/bDEc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3aWxsIGFsd2F5cyBkbyBtZW1jcHkg
bW92ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29t
PgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMjEgKysr
KysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCj4gaW5kZXggMTcxZWE1N2IwMzEx
Li45ZmQ4MGEzNjQzZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMK
PiBAQCAtNjAwLDYgKzYwMCwxNCBAQCBzdGF0aWMgdm9pZCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVy
X21vdmVfbm90aWZ5KHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8sCj4gICAJa21hcC0+
dmlydHVhbCA9IE5VTEw7Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1fYm9f
ZHJpdmVyX21vdmUoc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywKPiArCQkJCSAgICAg
ICBib29sIGV2aWN0LAo+ICsJCQkJICAgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4
LAo+ICsJCQkJICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4gK3sKPiArCXJl
dHVybiB0dG1fYm9fbW92ZV9tZW1jcHkoJmdiby0+Ym8sIGN0eCwgbmV3X21lbSk7Cj4gK30KPiAr
Cj4gICAvKgo+ICAgICogSGVscGVycyBmb3Igc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzCj4g
ICAgKi8KPiBAQCAtOTYyLDYgKzk3MCwxOCBAQCBzdGF0aWMgdm9pZCBib19kcml2ZXJfbW92ZV9u
b3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAlkcm1fZ2VtX3ZyYW1fYm9f
ZHJpdmVyX21vdmVfbm90aWZ5KGdibywgZXZpY3QsIG5ld19tZW0pOwo+ICAgfQo+ICAgCj4gK3N0
YXRpYyBpbnQgYm9fZHJpdmVyX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAr
CQkJICBib29sIGV2aWN0LAo+ICsJCQkgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+
ICsJCQkgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4gK3sKPiArCXN0cnVjdCBkcm1f
Z2VtX3ZyYW1fb2JqZWN0ICpnYm87Cj4gKwo+ICsJZ2JvID0gZHJtX2dlbV92cmFtX29mX2JvKGJv
KTsKPiArCj4gKwlyZXR1cm4gZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlKGdibywgZXZpY3Qs
IGN0eCwgbmV3X21lbSk7Cj4gK30KPiArCj4gICBzdGF0aWMgaW50IGJvX2RyaXZlcl9pb19tZW1f
cmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIAkJCQkgICAgc3RydWN0IHR0
bV9yZXNvdXJjZSAqbWVtKQo+ICAgewo+IEBAIC05ODYsNiArMTAwNiw3IEBAIHN0YXRpYyBzdHJ1
Y3QgdHRtX2JvX2RyaXZlciBib19kcml2ZXIgPSB7Cj4gICAJLnR0bV90dF9kZXN0cm95ID0gYm9f
ZHJpdmVyX3R0bV90dF9kZXN0cm95LAo+ICAgCS5ldmljdGlvbl92YWx1YWJsZSA9IHR0bV9ib19l
dmljdGlvbl92YWx1YWJsZSwKPiAgIAkuZXZpY3RfZmxhZ3MgPSBib19kcml2ZXJfZXZpY3RfZmxh
Z3MsCj4gKwkubW92ZSA9IGJvX2RyaXZlcl9tb3ZlLAo+ICAgCS5tb3ZlX25vdGlmeSA9IGJvX2Ry
aXZlcl9tb3ZlX25vdGlmeSwKPiAgIAkuaW9fbWVtX3Jlc2VydmUgPSBib19kcml2ZXJfaW9fbWVt
X3Jlc2VydmUsCj4gICB9OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
