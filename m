Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDD276FCF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634066E28B;
	Thu, 24 Sep 2020 11:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E8F6E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnKNwFh0Ui+u/EFbz624aAp29dAQ8BaFiLVnIJ6e0cgQRf37atdza53hrp851OAl93DdtMntTYSvAXQAry02FC0bqQeHTc7ESY06TqxkC3lc5sU92q7R3HjA0Cii6szxYTsHK0yeE3dmnjVX6T1s07KQLxwYinicaCOjsMD6cXwj4va+Pj6L3JijFQq8MMop0KWiY1pGRIsRg0rggGWDnH2PCtb/cGDeOfqcm1VrV5tuFpboaY2Ob5TN3Bkiy08YRfO5vLbpOsSelb/kZDPiSjhdiWgYXXCEG6LhkFJaEZlynpbpoceZtM9oTO3TU7RzxehSPks3DxRK0jTlHT/JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiXZfE+/SOTGPsdRORLeTiDKegFW1CTHvJbaI4WE9c4=;
 b=VcK5QE5xWsPHoA0E9YAU3I8HtV9THAA2uKJkTlVR6RCF8YzyNV+dKaRDYseP1+t9a84cI5flBcnVZ6ZTjmDfkNHnMtP/QmI3pNcONQFHrmYvbxHSeQZgjTfM6ORa4wIbre1OBrwrNVKfp3JsNzuQYlZY0YEXH5tgRjXlO6umWiD446pPq1H5Gj0W4aUygUeUPcoUaxRWgy7rL0O9Xgpwrvi3hDtl6dUwLyHv8W7B4WJHa4Hv+rvDwM6q5mwAyQ2o94gW7f53Oh1vudFDhhpRrSkTqvxx8ZuyZ3TOjqFiSY9MmOXGsE3ZGx2TEtHs5CU77PrsbYv1WmvTYwgqUxGEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiXZfE+/SOTGPsdRORLeTiDKegFW1CTHvJbaI4WE9c4=;
 b=MFwpsxfolJylszZPK6pTn/Grduaj5glYWQUOUayDrCmTOo5Y37k9xxF+dUDhrsiTl1yE7EmujyYuFPPkhvajabn1V7YUdHR6cXNuqM3tc0qutpQSeyUvQH9211WSG8WIIwWgd5CZSqlCqYwmdBmhP7aZRSuHhxLrFbQ07DaT9jk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 24 Sep
 2020 11:23:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:23:37 +0000
Subject: Re: [PATCH 12/45] drm/ttm: drop free old node wrapper.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-13-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4760c47-8658-7b24-e65c-7cea8cfa813d@amd.com>
Date: Thu, 24 Sep 2020 13:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-13-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0008.eurprd07.prod.outlook.com
 (2603:10a6:205:1::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0008.eurprd07.prod.outlook.com (2603:10a6:205:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.13 via Frontend Transport; Thu, 24 Sep 2020 11:23:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc80a219-3a0b-48d4-99e8-08d8607c482e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44083931615911F673F23E9383390@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LyWOkNKuhSOfY/loeojlVdzzncZFXTk38JxI9h7BxSiokZoUD61lmq1Wksbe3LZCq3z722r7MIo5lf0tyg1fLRj6TfSMnuKYdoHQiU0YWGvjpCmz3zpQ1g9zSqNPCFXVmv47Ooqiiap4hnanlpvy3/kZZaoNnGAZDf+U9dcAozlFiE0spTAJTnvlNCy4wGxIa0SMfMMO28gztgXfPU/cM3N8iMLv4hbSBdXk0gQLDSv9hATLDo7jzBDbGss7CvPF7FvvBdsRdXaiOm+VEMobnwHqys6E24u1TMDyNZYFztK4tdzGv6nq2hUORdcYgJ3H/YL24x+UrX5Ci2lmABy4dO3Kd04QSHDdTrxFs7RE2I/IfY5uZYYmtG0qHiTwGgqE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(31696002)(66946007)(16526019)(66574015)(8676002)(186003)(66476007)(6666004)(5660300002)(2616005)(52116002)(83380400001)(66556008)(86362001)(2906002)(36756003)(316002)(6486002)(8936002)(31686004)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lW+AlDZOkn3IuGCzC7E7Cpd6Q5dKS8p5FckvS/Dr6MY/40tH+e1PCPYAYhuhGdExEsQ34WrpTx5p3DXjojbHMDQ21iWLnN+S7Y+/LMTgikHnhHqP7MY5qs45GmHwRzIiXyJA1ZufMYesNVYCGht36FzHTRhxLNBXKp84pwGDyMMeHE1yQCx/kz2jSbn4iqyQGpXlrXe9CgFx6OPZpbyjwTen7Ww37AczYP6tKfCCN0JXdCqNNQUV59UKPsYS/lNDTWZcbZAQlf7lJz2VJP4Di/DaTwAtY4iEz0WtcfqQrZCcqF2D+GV8Sy0Udj0yxmv952NqpdFb2s2JtaVnvll8Ym/5yXaM6E0qjBMQNYX3WifmgUh6VgN5vFjFA2yU7NGz1YPJ3EHyFKlOhU36OdHl3N8UCReoU2CVXusRU/SunR+9YF8D/RypzjCPvJKwqOrEuUfWtE6abk7kToS9Jg8gytvOcbzuLc0ZSmsNK5wq0NMhiTXaWTuL7483+6UEJHZwU8VKQYoIF63XNUX7QDVtoIcYeR2bqXlSiFQc+3z5o4Vnl6F2sgLBC9rzAMyza7D1fMJMCqCNQcNJOD56Wqn2JugXNy0XSjKjwkmLFaIc3CUl8A/jCyLrNYd8fmZMuccAxHZG70IhuZxOXOXcKRwLME9ZpAKvzrO92p7CvuzOc/kp1QWLHX6gR/jG1ziWweu6g/MuXbTMXxVR7PzNAZGCrg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc80a219-3a0b-48d4-99e8-08d8607c482e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:23:37.7919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77Hkal7PpB6G4nNMq84GZ+I6D3ck96u4uhlUMdzWwJ2GXEbwsjIOh45d777l3hLV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBpc24ndCByZWFsbHkgdXNlZCBhbnlt
b3JlLCBpZiBkcml2ZXJzIG5lZWRzIGl0IGxhdGVyLAo+IGp1c3QgYWRkIGJhY2sgYW4gaW5saW5l
IHdyYXBwZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAxMSAr
KystLS0tLS0tLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAgIHwgIDkgLS0t
LS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gaW5kZXggMGFkMDJlMjc4NjVkLi5k
YWY5YTkxODU3ZjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRp
bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gQEAgLTQ1LDEx
ICs0NSw2IEBAIHN0cnVjdCB0dG1fdHJhbnNmZXJfb2JqIHsKPiAgIAlzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvOwo+ICAgfTsKPiAgIAo+IC12b2lkIHR0bV9ib19mcmVlX29sZF9ub2RlKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gLXsKPiAtCXR0bV9yZXNvdXJjZV9mcmVlKGJv
LCAmYm8tPm1lbSk7Cj4gLX0KPiAtCj4gICBpbnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJICAgICAgc3RydWN0IHR0bV9vcGVy
YXRpb25fY3R4ICpjdHgsCj4gICAJCQkgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVt
KQo+IEBAIC05MCw3ICs4NSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX21vdmVfb2xkX3RvX3N5c3Rl
bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCX0KPiAgIAo+ICAgCXR0bV9ib190
dF91bmJpbmQoYm8pOwo+IC0JdHRtX2JvX2ZyZWVfb2xkX25vZGUoYm8pOwo+ICsJdHRtX3Jlc291
cmNlX2ZyZWUoYm8sICZiby0+bWVtKTsKPiAgIAlvbGRfbWVtLT5tZW1fdHlwZSA9IFRUTV9QTF9T
WVNURU07Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gQEAgLTU1Nyw3ICs1NTIsNyBAQCBzdGF0aWMg
aW50IHR0bV9ib193YWl0X2ZyZWVfbm9kZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ICAgCj4gICAJaWYgKCFkc3RfdXNlX3R0KQo+ICAgCQl0dG1fYm9fdHRfZGVzdHJveShibyk7Cj4g
LQl0dG1fYm9fZnJlZV9vbGRfbm9kZShibyk7Cj4gKwl0dG1fcmVzb3VyY2VfZnJlZShibywgJmJv
LT5tZW0pOwo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gQEAgLTYxOCw3ICs2MTMsNyBAQCBz
dGF0aWMgdm9pZCB0dG1fYm9fbW92ZV9waXBlbGluZV9ldmljdChzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+ICAgCX0KPiAgIAlzcGluX3VubG9jaygmZnJvbS0+bW92ZV9sb2NrKTsKPiAg
IAo+IC0JdHRtX2JvX2ZyZWVfb2xkX25vZGUoYm8pOwo+ICsJdHRtX3Jlc291cmNlX2ZyZWUoYm8s
ICZiby0+bWVtKTsKPiAgIAo+ICAgCWRtYV9mZW5jZV9wdXQoYm8tPm1vdmluZyk7Cj4gICAJYm8t
Pm1vdmluZyA9IGRtYV9mZW5jZV9nZXQoZmVuY2UpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+
IGluZGV4IDIwZTY4MzllOWI3My4uNjY5MGVjNWQ5MGVjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Ry
aXZlci5oCj4gQEAgLTYzMCwxNSArNjMwLDYgQEAgaW50IHR0bV9ib19tb3ZlX21lbWNweShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkgICAgICAgc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4ICpjdHgsCj4gICAJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKTsK
PiAgIAo+IC0vKioKPiAtICogdHRtX2JvX2ZyZWVfb2xkX25vZGUKPiAtICoKPiAtICogQGJvOiBB
IHBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QuCj4gLSAqCj4gLSAqIFV0aWxp
dHkgZnVuY3Rpb24gdG8gZnJlZSBhbiBvbGQgcGxhY2VtZW50IGFmdGVyIGEgc3VjY2Vzc2Z1bCBt
b3ZlLgo+IC0gKi8KPiAtdm9pZCB0dG1fYm9fZnJlZV9vbGRfbm9kZShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvKTsKPiAtCj4gICAvKioKPiAgICAqIHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFu
dXAuCj4gICAgKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
