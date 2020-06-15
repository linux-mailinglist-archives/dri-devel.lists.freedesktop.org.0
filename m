Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6A1F9DDE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 18:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4146E49F;
	Mon, 15 Jun 2020 16:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0A76E49F;
 Mon, 15 Jun 2020 16:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXXOA5dWrki2EnWrIS1qOxaAYVwaX19MA4882K/75h+bKZvlQrcxjZOEC5FbIVdLeEZBXtcdgbOrWD1NIdG+XWKxM6JzLz18eMnzSa/JAvgmpRP9Tk4WUGGE37ft+KZBwpTQuFfB8Bz3CL8MfYLqetEN4JBkQIL3UsnsBsj3Vd4R1uZH4cSUamYJVVgTFG2XjovUlgTJcrxvPkzImn4HWHw6RlaDufCZDAPEziZUpL86a3WkqyZQg6cxv7jUVHWyetciivqU19HEbDQObhmNKq0laXHR2oNjIeS28bD3EcHuLShSJjwU6ke7O9DJ6tlWCRSsEtdxL7XNL2QzuMwtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLJWhoxhz92nEJ5Y+SlrEesi3+ml/9ubWnBq6F5ZHCI=;
 b=SE5LSdtQQjjy/ncP5GhrW4FZ/cgx8bag0wD4S2bekvPV7j6lRIUJ4El0cCjNkXGzCQCHbLyQdOdaaql7gXGjDduQW2mAcqEvj5pT0zfahD85cZBVTkGhYZ0FTY4FfKfNaC/YIKmPJYm9Iu9wXkFhkeNlp3lP6ogCJbO7SV+tNpE+Mb4vMB/GHezOtDvwMrFEceWOWr87ICJXR9MVGIvUW9NFZ1O2yVjSCkK0dvKSjbtdEFvpES3hLPgU4Hde5ROy4+cFDSSC3wX8reKDLtOHr58Q7/qc6/EZfDE80yMpZhUglikh1ZCrSiFmsGHzm7uTzWW0XkpBGeu3G+MCdyROBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLJWhoxhz92nEJ5Y+SlrEesi3+ml/9ubWnBq6F5ZHCI=;
 b=kMRtQhDhdrO6L8hgeDB+ID4KLiph8oQnhqvKU7z/pUA2syk59UVOjBRqYyx/k30a/BwwDnwGLNo3lLpBSeOgC2yjv8D2KhtiuWtvQGYw7BeEojnwJlzFhXTjtRIi14oef7hpGy5mbKIdY86VldK2F5et0O8HK07c4XZH3OoyXtM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Mon, 15 Jun
 2020 16:53:38 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a%7]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 16:53:38 +0000
Subject: Re: [PATCH 2/3] drm/mm: optimize find_hole() as well
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org
References: <20200615145415.1775-1-christian.koenig@amd.com>
 <20200615145415.1775-2-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <060aa4b7-54ca-1621-4bf2-b018f7da0121@amd.com>
Date: Mon, 15 Jun 2020 18:54:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200615145415.1775-2-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.76] (217.86.97.86) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Mon, 15 Jun 2020 16:53:37 +0000
X-Originating-IP: [217.86.97.86]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1368dd85-f827-41a1-1818-08d8114ca643
X-MS-TrafficTypeDiagnostic: MN2PR12MB4486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4486E86A8A4D20A57878E8E18B9C0@MN2PR12MB4486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DixPLnP5ydM+m7e55nVi18Q4r8jQd4lej3wdsp326v/7vPxtb2o8Wub6DlhsglvoQA6HZjnPTNDDq7ax4iLLs33O/xdCV5G4IQLff4wOhAmVgOY8+46H5Ov8NDyRp5g2BpVVmNeWHpA2BXRwSy5iJeikryuKUKvxZUEAdgMdszcFhPBRKtrmAiOE8nzL2XzOBKgGHx7c6vvsTkDvCEV4l/zd3k/GEMkusuqhU1ihGZKAD7Op05rZ+i5le+lUbB52xZI1R0Ae5ay9qkPpz3lSoZTUCPEVXYYB5p3hQYBqDSgpB6FNDSa7Rs9/DcQSCf9rTkuds/zsv8b1cUQSCM5LW+6mohgbxH8MJS+y6sPoxhOsll+pIUMpoVSMiebR6AyZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(31696002)(66946007)(66476007)(66556008)(16576012)(316002)(31686004)(83380400001)(2616005)(956004)(2906002)(6666004)(26005)(6486002)(8936002)(53546011)(36756003)(478600001)(52116002)(5660300002)(186003)(16526019)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: K4Wjsn0KMsxocgEFbzfKLG+OSkSYAzuN0Ow7uRtfb7aNDsgXdjuwYIX8O5TmMTfFh7PAv8uczQ4mWKNhhSZirjjfrGqpnX9WQ1EFirvkXzqkmIhKG+aKOwuc1b9QcRHUqCYmybC6U+RELk+grHqiNROqARs9jVfrt6oIyw+mLCgg7Zhocu6tM5SvNBLMUu5ERDiHjkKyu5370fl7UNxEuAk2kCc20kh1RzJVtb9SHlljtCpXCVEQmRA9+Eg6Icpeknm91K6OWJVUOoWo2Lx5VUU0feDr3S6b08tamZFoaZmhI6xN58rrYNOHZ+mi5fbHcb7SR4KSzypWMWdcDXkOqonA3cXI/R/Q/2wvDAa6mtFADMDmptVL4Ei1WWEwVblnqVJVXe0QTtuN2itW9qbNirtpspAZP6BZpuvBDAN1uexbnb2cc5DOf8IIZFDYpAOyFcBsKEdmMeDGCFC4OaZXIMwE4LHgL2mRfzM1qS4tZP4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1368dd85-f827-41a1-1818-08d8114ca643
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 16:53:37.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUdwO0CszQZg/0Rc5MBJDHONNkc1HcH4t5KIBFzod8jFWAy2S7Z9u6dwM2F8FvWp44M1zpG36qHqA1zPptrtSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KCk9uIDYvMTUvMjAgNDo1
NCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBYm9ydCBlYXJseSBpZiB0aGVyZSBpc24n
dCBlbm91Z2ggc3BhY2UgdG8gYWxsb2NhdGUgZnJvbSBhIHN1YnRyZWUuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMgICAgICAgICAgICAgICAgfCAxMSArKysrKysrLS0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jIHwgMTEgLS0tLS0t
LS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX21tLmMKPiBpbmRleCA0MjVmY2QzNTkwZTguLjE3N2E1ZGYwZmU5NSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21tLmMKPiBAQCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX21tX25vZGUg
KmJlc3RfaG9sZShzdHJ1Y3QgZHJtX21tICptbSwgdTY0IHNpemUpCj4gICAJcmV0dXJuIGJlc3Q7
Cj4gICB9Cj4gICAKPiAtc3RhdGljIHN0cnVjdCBkcm1fbW1fbm9kZSAqZmluZF9ob2xlKHN0cnVj
dCBkcm1fbW0gKm1tLCB1NjQgYWRkcikKPiArc3RhdGljIHN0cnVjdCBkcm1fbW1fbm9kZSAqZmlu
ZF9ob2xlX2FkZHIoc3RydWN0IGRybV9tbSAqbW0sIHU2NCBhZGRyLCB1NjQgc2l6ZSkKPiAgIHsK
PiAgIAlzdHJ1Y3QgcmJfbm9kZSAqcmIgPSBtbS0+aG9sZXNfYWRkci5yYl9ub2RlOwo+ICAgCXN0
cnVjdCBkcm1fbW1fbm9kZSAqbm9kZSA9IE5VTEw7Cj4gQEAgLTMzMyw2ICszMzMsOSBAQCBzdGF0
aWMgc3RydWN0IGRybV9tbV9ub2RlICpmaW5kX2hvbGUoc3RydWN0IGRybV9tbSAqbW0sIHU2NCBh
ZGRyKQo+ICAgCXdoaWxlIChyYikgewo+ICAgCQl1NjQgaG9sZV9zdGFydDsKPiAgIAo+ICsJCWlm
IChyYl9ob2xlX2FkZHJfdG9fbm9kZShyYiktPnN1YnRyZWVfbWF4X2hvbGUgPCBzaXplKQo+ICsJ
CQlicmVhazsKPiArCj4gICAJCW5vZGUgPSByYl9ob2xlX2FkZHJfdG9fbm9kZShyYik7Cj4gICAJ
CWhvbGVfc3RhcnQgPSBfX2RybV9tbV9ob2xlX25vZGVfc3RhcnQobm9kZSk7Cj4gICAKPiBAQCAt
MzU4LDEwICszNjEsMTAgQEAgZmlyc3RfaG9sZShzdHJ1Y3QgZHJtX21tICptbSwKPiAgIAkJcmV0
dXJuIGJlc3RfaG9sZShtbSwgc2l6ZSk7Cj4gICAKPiAgIAljYXNlIERSTV9NTV9JTlNFUlRfTE9X
Ogo+IC0JCXJldHVybiBmaW5kX2hvbGUobW0sIHN0YXJ0KTsKPiArCQlyZXR1cm4gZmluZF9ob2xl
X2FkZHIobW0sIHN0YXJ0LCBzaXplKTsKPiAgIAo+ICAgCWNhc2UgRFJNX01NX0lOU0VSVF9ISUdI
Ogo+IC0JCXJldHVybiBmaW5kX2hvbGUobW0sIGVuZCk7Cj4gKwkJcmV0dXJuIGZpbmRfaG9sZV9h
ZGRyKG1tLCBlbmQsIHNpemUpOwo+ICAgCj4gICAJY2FzZSBEUk1fTU1fSU5TRVJUX0VWSUNUOgo+
ICAgCQlyZXR1cm4gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZtbS0+aG9sZV9zdGFjaywKPiBA
QCAtNDk3LDcgKzUwMCw3IEBAIGludCBkcm1fbW1fcmVzZXJ2ZV9ub2RlKHN0cnVjdCBkcm1fbW0g
Km1tLCBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUpCj4gICAJCXJldHVybiAtRU5PU1BDOwo+ICAg
Cj4gICAJLyogRmluZCB0aGUgcmVsZXZhbnQgaG9sZSB0byBhZGQgb3VyIG5vZGUgdG8gKi8KPiAt
CWhvbGUgPSBmaW5kX2hvbGUobW0sIG5vZGUtPnN0YXJ0KTsKPiArCWhvbGUgPSBmaW5kX2hvbGVf
YWRkcihtbSwgbm9kZS0+c3RhcnQsIDApOwo+ICAgCWlmICghaG9sZSkKPiAgIAkJcmV0dXJuIC1F
Tk9TUEM7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0
LWRybV9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCj4gaW5k
ZXggY2E1ZjM1ZGVmOTA1Li5iODc5YWVkZmMwMGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0
ZXN0cy90ZXN0LWRybV9tbS5jCj4gQEAgLTE5ODEsMTYgKzE5ODEsNiBAQCBzdGF0aWMgaW50IF9f
aWd0X29uY2UodW5zaWduZWQgaW50IG1vZGUpCj4gICAJfQo+ICAgCj4gICAJbWVtc2V0KCZub2Rl
LCAwLCBzaXplb2Yobm9kZSkpOwo+IC0JZXJyID0gZHJtX21tX2luc2VydF9ub2RlX2dlbmVyaWMo
Jm1tLCAmbm9kZSwKPiAtCQkJCQkgMiwgMCwgMCwKPiAtCQkJCQkgbW9kZSB8IERSTV9NTV9JTlNF
UlRfT05DRSk7Cj4gLQlpZiAoIWVycikgewo+IC0JCXByX2VycigiVW5leHBlY3RlZGx5IGluc2Vy
dGVkIHRoZSBub2RlIGludG8gdGhlIHdyb25nIGhvbGU6IG5vZGUuc3RhcnQ9JWxseFxuIiwKPiAt
CQkgICAgICAgbm9kZS5zdGFydCk7Cj4gLQkJZXJyID0gLUVJTlZBTDsKPiAtCQlnb3RvIGVycl9u
b2RlOwo+IC0JfQo+IC0KPiAgIAllcnIgPSBkcm1fbW1faW5zZXJ0X25vZGVfZ2VuZXJpYygmbW0s
ICZub2RlLCAyLCAwLCAwLCBtb2RlKTsKPiAgIAlpZiAoZXJyKSB7Cj4gICAJCXByX2VycigiQ291
bGQgbm90IGluc2VydCB0aGUgbm9kZSBpbnRvIHRoZSBhdmFpbGFibGUgaG9sZSFcbiIpOwo+IEBA
IC0xOTk4LDcgKzE5ODgsNiBAQCBzdGF0aWMgaW50IF9faWd0X29uY2UodW5zaWduZWQgaW50IG1v
ZGUpCj4gICAJCWdvdG8gZXJyX2hpOwo+ICAgCX0KPiAgIAo+IC1lcnJfbm9kZToKPiAgIAlkcm1f
bW1fcmVtb3ZlX25vZGUoJm5vZGUpOwo+ICAgZXJyX2hpOgo+ICAgCWRybV9tbV9yZW1vdmVfbm9k
ZSgmcnN2ZF9oaSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
