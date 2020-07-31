Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90D23480C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 16:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BBD6EAD6;
	Fri, 31 Jul 2020 14:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081E6EAD6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 14:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAk0086osjuConFzTcPfsiwb4u8MxTD1zSPnz/C7U42+umxh8ZgVewKmAax34sMmXRWzdxxF6yTs0RCvW9SEAAawxZ4uS3W0UNIh8rQLlfsyIRizvTzRVZT+3TBBZgoOAnxZktsQW7u9xun8N0T6Ab1v/Qkhg5zrtNKfJO8Ntiqun1+5cRPGKH+tXO2fhY1vNMx0smg9Nf9p4u6KVoipTCwLwDpAVlBEXZyoV+04TEZofSDUTJiLqFBuMunSo+qHqPnD3/Z2E7J8il11hXwqBIEc8dfixs02R3MGZfLi4HimJrQj0Hhvul9rGOSU8cwQBrVZESKlw8sTJoqz/11W5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLRzjNoKr2+neDLiF12fn5j2MBdnCInRLcSnxtzuWd0=;
 b=W6Oa9QrZk9vlqNjxNaiCf6B6zl3jxUEkf4TZKptKiRH/VjbxZ+Mcdt2u7LSPutOvTelvg1QqMtz+5uzy7n2q7j6rA+W++Ypt5gu35JGjEMyGJR8qiZcQa7J7Ng/S+runR9/8sUY5m6PjNCWY7L9TIky34BT36HzEgS/sIFnN0PV9uK92nzn+Gs/TvkU0+FwBO+lSrLFdCSYfQPE8Yrff8dMJAx/LPdxU7/J6z3TKCozGxNxMD07tXsdRXsDpW8tsfHc31I9AMyG6rvfadGxP6x9/RYr47eP/bJBQ1dUeB2gv+0uKjQAnqGgmhXxxM6tsaW33Rj/1Gg40Ng7luRQ83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLRzjNoKr2+neDLiF12fn5j2MBdnCInRLcSnxtzuWd0=;
 b=KC54G15AFMiBUl3V5lWLq/K0fcGhBpzBN6prJ2MudFetCEaPFxy0vplmhMwa1qi013cz9Ds4NHWQZ2fW95qGQKOIxB7lwG1AY8pHQsBkY5KMw4rQUuO63IRaIc0hzfyUZCSaKK/wq4Zz4WnDMtCvcBgEBgLaRXzEVhTRXs7pZFQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 14:55:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 14:55:27 +0000
Subject: Re: [PATCH 45/49] drm/amdgpu/ttm: remove man->bdev references.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-46-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e3813ea6-7ec9-0198-4f90-9b6f637f121b@amd.com>
Date: Fri, 31 Jul 2020 16:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-46-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:205:1::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:205:1::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.10 via Frontend Transport; Fri, 31 Jul 2020 14:55:26 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: de77e4ab-a895-4825-d534-08d83561c33e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4237:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42373910B0AF319850F5EBBF834E0@MN2PR12MB4237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12lZDUIXnm0ZbgzMRnDmEZnOKrKXMKCQ2dw2B/9BERbSSLkOiKGo3RpqIY0tys4kSS7v3OtcssSb3LxzGC1VjzcgOyaokxlldcJQH8k2abQ8PWXoEmudlCQp03e8xEOJ7eSDBDl4ujWelJ3ZoDqHLSAIDAd7aeTiu6FAD9AP7tdY2yNEzC9/GSj9LuAQwq9DxFjCQo8Qu0BfepK4ga5iD0okxGs3pQcpgFTZ8Rn7r4QpTlHptgVblpFbckF02MMh8ZpxVaC6is6QjrsLS+bgIasIM2lRDsjYWSKnJ3rpMcm5g97QGmTDmIl9oxzShTc4SybFOjnIdUueylvVeIB6cT8KfhCVOBf0iDa/ilfnW92g0VLnhtTmMZhhzIWtq4Se
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(6486002)(52116002)(2616005)(66476007)(316002)(36756003)(4326008)(478600001)(66556008)(66946007)(86362001)(66574015)(31696002)(16526019)(186003)(5660300002)(83380400001)(8936002)(2906002)(8676002)(6666004)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: HzxFY+cVnCfn67KmUw4yN6ThKEKAr/a7PWekzGa3BGFiDbPfE6TToe+SXPGLyVcoquQs6vthi+MLOCrpW/svop2h/mEJ6DB8i3t/0Zus0PW9jdZyAAsb49A4g5iWregJtt/NQYuvFxA6bhYNDrif+aSo3+kHJZT+dTT2XQv8j92BH8HxKVLEjhPFgvDrvrg6zi3JN/84HFc7HDQ4MqYB7BX2uxD9Zy7XraDU6oylnIV1lHjJCCwfEMuSOAHx6byBs6Gak6HZlPn+W48mQHSiBuhkunnvOah9UFpPE8nZlDQRwB4VEsfuqjOYFGQg5oJMpcvsJV0FBwWuy8fUsi7OyC1KJnF9hu4XVWKfbsrOTZ8jtOQ0L0x0eknymU/GCpPBsVjjpAyB/u4c6wt9BVU08zDxKjYQ9AM/eAEuY6MN67gTiwzKWrhWonNNbgNlX5R5DAbKG7uJ39urexIY3hYo2Vokumg0BM8h2w8OfMobNpgeXYa9LMvBIY3xH3EM9KT6pqDe5v2AuPG54c3IJx35Aac68mtsTwnlCNWXj4Lt8syuXqN+KTJDuqBQdU72SEUCsStTLLEDoBVOJePm0F3I29epKdMeSfMFb6STEcntcGywzP+UB8E9rWVSoZXVMEvY2827Mtp8zQOGtnn2xlwxMilNIBATxEV8gXXWerHTs9gXvYzY76v/uMSWfRDqYUVKDjet948+08Jp0UpjsSCnBg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de77e4ab-a895-4825-d534-08d83561c33e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 14:55:27.7879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izPiYl9WGnrniJGTJXUK7Hy6ph8K1iP7R8hAO/lT7hlZBKuwvGn8Ohe7JFLX7Pf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSnVzdCBzdG9yZSB0aGUgZGV2aWNlIGluIHRo
ZSBwcml2YXRlIHNvIHRoZSBsaW5rCj4gY2FuIGJlIHJlbW92ZWQgZnJvbSB0aGUgbWFuYWdlcgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCA3ICsr
KysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1f
bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+IGlu
ZGV4IDlkNGExMzkyNmI4Yy4uZDQ1MTg1MWM4Njg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiBAQCAtMzQsNiArMzQsNyBAQCBzdHJ1Y3Qg
YW1kZ3B1X3ZyYW1fbWdyIHsKPiAgIAlzcGlubG9ja190IGxvY2s7Cj4gICAJYXRvbWljNjRfdCB1
c2FnZTsKPiAgIAlhdG9taWM2NF90IHZpc191c2FnZTsKPiArCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2Owo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3QgYW1kZ3B1X3ZyYW1f
bWdyICp0b192cmFtX21ncihzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikKPiBAQCAt
MTk2LDYgKzE5Nyw4IEBAIGludCBhbWRncHVfdnJhbV9tZ3JfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKPiAgIAlkcm1fbW1faW5pdCgmbWdyLT5tbSwgMCwgbWFuLT5zaXplKTsKPiAg
IAlzcGluX2xvY2tfaW5pdCgmbWdyLT5sb2NrKTsKPiAgIAo+ICsJbWdyLT5hZGV2ID0gYWRldjsK
PiArCj4gICAJLyogQWRkIHRoZSB0d28gVlJBTS1yZWxhdGVkIHN5c2ZzIGZpbGVzICovCj4gICAJ
cmV0ID0gc3lzZnNfY3JlYXRlX2ZpbGVzKCZhZGV2LT5kZXYtPmtvYmosIGFtZGdwdV92cmFtX21n
cl9hdHRyaWJ1dGVzKTsKPiAgIAlpZiAocmV0KQo+IEBAIC0zMjMsOCArMzI2LDggQEAgc3RhdGlj
IGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFu
LAo+ICAgCQkJICAgICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+ICAgCQkJICAg
ICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQo+ICAgewo+IC0Jc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYobWFuLT5iZGV2KTsKPiAgIAlzdHJ1Y3QgYW1kZ3B1
X3ZyYW1fbWdyICptZ3IgPSB0b192cmFtX21ncihtYW4pOwo+ICsJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBtZ3ItPmFkZXY7Cj4gICAJc3RydWN0IGRybV9tbSAqbW0gPSAmbWdyLT5tbTsK
PiAgIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOwo+ICAgCWVudW0gZHJtX21tX2luc2VydF9t
b2RlIG1vZGU7Cj4gQEAgLTQzOSw4ICs0NDIsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21n
cl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gICBzdGF0aWMgdm9pZCBh
bWRncHVfdnJhbV9tZ3JfZGVsKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAg
CQkJCXN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQo+ICAgewo+IC0Jc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYobWFuLT5iZGV2KTsKPiAgIAlzdHJ1Y3QgYW1kZ3B1
X3ZyYW1fbWdyICptZ3IgPSB0b192cmFtX21ncihtYW4pOwo+ICsJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBtZ3ItPmFkZXY7Cj4gICAJc3RydWN0IGRybV9tbV9ub2RlICpub2RlcyA9IG1l
bS0+bW1fbm9kZTsKPiAgIAl1aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7Cj4gICAJ
dW5zaWduZWQgcGFnZXMgPSBtZW0tPm51bV9wYWdlczsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
