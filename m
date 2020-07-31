Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A933A2346A2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04CF6EA96;
	Fri, 31 Jul 2020 13:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F726EA96
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0zvnYaoyiVQjvhPRIdNJBBeIu7ORaREI2DU+p5QBTsT5Th2gaZLMlCKGkSTw725LQbR2qJKzqa4PuBo4gJg45rWwzkOk7meqqXnFgSq5bkBDDQh/S8pslmagHfErLjGeA5+Xjo+mz98YcItceLYlsrpCczFOJjoSoVwrKyJt82kya1JTx45Wy2gsID1feOmugV5QLpXDKksbWZifPcy3/MCp1pHKFCWnTWfoNkedI8PNvzBoVsXMz92f7MnYv8JLoj5uVOMnIWElnL3qSHLIytJ1mkOlciT2nXr0W4cYU8hqARSwK5mWy0iyowy6c7ePmiKIevvYU919ocu+r9qBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBJ8RxFhU0v5Dg4g7DKqT2UHhDsgyrVcALdQS+j3XRo=;
 b=HbiJnbtDF7g3gobzJK1dikr0yzaQ62f2tzQu6y+VZJ1edvpq72oflusG74Qnobeh9R96NCTUtaj3KYMiyqBWxy5I9y+5hiL6bEPvAXn6TWGJpzzIZmqwjLlafeIBhISwkuq2Ptevt9WRkUrQmgzgQNjcR6cKrTv28PVr15bapo60wBQuWSKdqqhhzO2wALQ2NY8vYNeIZ3uCqOk17Px3MC+5+qgEe1Giu+Jr5r97m6hJFIoF7wxSEbIV17G2w/kXDkrPtmlMXp7JDjV0cpvI8y7wgevuHdpTBWpf3VUfYQMD0ekdczLSfe6tNHmUj5nRLju1GPrhlrdOx2Pe2vSLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBJ8RxFhU0v5Dg4g7DKqT2UHhDsgyrVcALdQS+j3XRo=;
 b=jlWYsrhLNItC63O8XLE705i9YqUnz/HrbgnwooeSYA9CCXTbQgol0hD/gB8zaeB+DPcdOcxV+8JQX5XsJCDAIOhsNGWNhSr6jakL0jhcCOOkgMYpOUsrrD3NZk1itJTkSqVnKpVCY242kDO5vUpoG/i5ASgIDDuf5wSiLqPmXcE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:11:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:11:33 +0000
Subject: Re: [PATCH 24/49] drm/ttm: remove range manager legacy takedown path
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-25-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7671993-a78f-4b2f-9754-d80b5e986f83@amd.com>
Date: Fri, 31 Jul 2020 15:11:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-25-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0082.eurprd02.prod.outlook.com
 (2603:10a6:208:154::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0082.eurprd02.prod.outlook.com (2603:10a6:208:154::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 13:11:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d8956d3-7af8-40a6-0eea-08d835533f2d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40963630A062FC210E53D92A834E0@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67I+VRwT6l/astG9I/nxSeG//mDZj2dx21XU/Y9GKYkV1JYRGNHLfb+AtVmKDBRHFo9Wy06Eh8R6WkhPLxQydMNXxEqc54QtGZfxCd57XYJY3P3ia09eVUZWLPweBN2eapTSjq8CC7DWkd7ykt+Q7lwXJbVd8+4hxkHw8g6RQddmcO5FF6YahqmHjh3KMJjd6Y5cgcZiWvkLFkQAzOdB6mqHFf5EfTDHO0Hg8UkXsTtTfL7YPBLw1jWoIOHYW6/ZNF+HAK+YLoFteYvH5uAOKBjCrxQkrZAEgO6qg9C+tQ4bdojd6j7+ZDc3syxOJkX0H3eoqH4nD/VdX9eZCOJ37Sos59JD6m8GsDJ53KYUu6gmRpsASFBKhnc8nRM5eZwp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(66556008)(6666004)(66946007)(4326008)(2616005)(5660300002)(478600001)(31696002)(316002)(86362001)(66476007)(66574015)(8676002)(2906002)(6486002)(186003)(16526019)(36756003)(8936002)(52116002)(83380400001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 2SaR15N1NYKFj5pybvegLphw82eCP5FE/woyLWqFaDyTmAEog60Y1oqY2Oyc4hRe3hKY17pb7nfEbLfFHnzPdLfib/8+8yYJ360pQYLABQvSDhafHEA7Lv71SktTOpUqo1xqYqDZbXGkOVeT821ctDxGYnYUL9IwzJSs00biScDTPbyHVl2jCWwAFMjHQ6cAOoNtZzJho6DekJut1WEE9KnSXAUzCOk6M2f0hnaQVOMxkt9WyiWWJykMnPSOI8penmF/2gcj89xT/TrkjrarJ5J2IKnss3eYZMs5BXOPK0H/tVprR4flrLN3V+qfRjPrQDRc3mBQYUL72v6E+xjO4sjaFUVzNxuheHEJvvKpv/Dy7HW1lXnWJtFoYaFUv3FEmQse1a2FXq1CqZL+5r3WqpF7s/AStferJ639Fp4aW7HRZCuQm22LI7Ks2mki6gBOi7dEOdMHdyZEa0O88NlVs56C7IjDabKS3eJfIaMDvdj8xfdn+RhKVBWljo92WvHmuXyX2dhuyhfeFBtEj7A41AUjVYqgcmebTqHkvioMoNp4jU+WDFbaaA+HfyJ0quOOo+3/ZIN6HbR3aSB4r8skPJJT03Ir8KSH42FsJxcT+0EChB3S/xeRffJA+L/UJsDPZ3O08KxTekYLborcjC4K2f2dhvspUsBYk4o/IYRPbVR3aXgxAM3H4nxOVvh9F5hQo+VEUPf56J5pIu3ETOEZew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8956d3-7af8-40a6-0eea-08d835533f2d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:11:33.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tP5a5Id85Uj68r7x/ZhSYErUKefFBl9MTkghfwYUK6c2nBFuIEZzXTzO68nqJYWR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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

QW0gMzEuMDcuMjAgdW0gMDY6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gTm93IG5vIGRyaXZlcnMgaGF2ZSBiZWVuIGNv
bnZlcnRlZCwgZHJvcCB0aGUgbm9uLWRyaXZlciBwYXRoLgoKSSdtIG5vdCBhIG5hdGl2ZSBzcGVh
aywgYnV0IHRoYXQgc291bmRzIG9kZC4KCkFwYXJ0IGZyb20gdGhhdCBwYXRjaCBpcyBSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4KPiBT
aWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jIHwgMjggKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTkgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCj4gaW5kZXggMTEy
Nzg2ODI3NGIzLi5mNjBhOWE1ZDQyOWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fbWFuYWdlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFu
YWdlci5jCj4gQEAgLTEyOSwyNiArMTI5LDExIEBAIGludCB0dG1fYm9fbWFuX2luaXQoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19tYW5f
aW5pdCk7Cj4gICAKPiAtc3RhdGljIGludCB0dG1fYm9fbWFuX3Rha2Vkb3duX3ByaXZhdGUoc3Ry
dWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pCj4gLXsKPiAtCXN0cnVjdCB0dG1fcmFuZ2Vf
bWFuYWdlciAqcm1hbiA9IChzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikgbWFuLT5wcml2Owo+
IC0Jc3RydWN0IGRybV9tbSAqbW0gPSAmcm1hbi0+bW07Cj4gLQo+IC0Jc3Bpbl9sb2NrKCZybWFu
LT5sb2NrKTsKPiAtCWlmIChkcm1fbW1fY2xlYW4obW0pKSB7Cj4gLQkJZHJtX21tX3Rha2Vkb3du
KG1tKTsKPiAtCQlzcGluX3VubG9jaygmcm1hbi0+bG9jayk7Cj4gLQkJa2ZyZWUocm1hbik7Cj4g
LQkJbWFuLT5wcml2ID0gTlVMTDsKPiAtCQlyZXR1cm4gMDsKPiAtCX0KPiAtCXNwaW5fdW5sb2Nr
KCZybWFuLT5sb2NrKTsKPiAtCXJldHVybiAtRUJVU1k7Cj4gLX0KPiAtCj4gICBpbnQgdHRtX2Jv
X21hbl90YWtlZG93bihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIAkJCXN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQo+ICAgewo+ICsJc3RydWN0IHR0bV9yYW5nZV9tYW5h
Z2VyICpybWFuID0gKHN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqKSBtYW4tPnByaXY7Cj4gKwlz
dHJ1Y3QgZHJtX21tICptbSA9ICZybWFuLT5tbTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJdHRt
X2JvX2Rpc2FibGVfbW0obWFuKTsKPiBAQCAtMTU3LDcgKzE0MiwxMyBAQCBpbnQgdHRtX2JvX21h
bl90YWtlZG93bihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIAlpZiAocmV0KQo+ICAg
CQlyZXR1cm4gcmV0Owo+ICAgCj4gLQl0dG1fYm9fbWFuX3Rha2Vkb3duX3ByaXZhdGUobWFuKTsK
PiArCXNwaW5fbG9jaygmcm1hbi0+bG9jayk7Cj4gKwlkcm1fbW1fY2xlYW4obW0pOwo+ICsJZHJt
X21tX3Rha2Vkb3duKG1tKTsKPiArCXNwaW5fdW5sb2NrKCZybWFuLT5sb2NrKTsKPiArCWtmcmVl
KHJtYW4pOwo+ICsJbWFuLT5wcml2ID0gTlVMTDsKPiArCj4gICAJdHRtX2JvX21hbl9jbGVhbnVw
KG1hbik7Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gQEAgLTE3NCw3ICsxNjUsNiBAQCBzdGF0aWMg
dm9pZCB0dG1fYm9fbWFuX2RlYnVnKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+
ICAgfQo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1
bmMgdHRtX2JvX21hbmFnZXJfZnVuYyA9IHsKPiAtCS50YWtlZG93biA9IHR0bV9ib19tYW5fdGFr
ZWRvd25fcHJpdmF0ZSwKPiAgIAkuZ2V0X25vZGUgPSB0dG1fYm9fbWFuX2dldF9ub2RlLAo+ICAg
CS5wdXRfbm9kZSA9IHR0bV9ib19tYW5fcHV0X25vZGUsCj4gICAJLmRlYnVnID0gdHRtX2JvX21h
bl9kZWJ1ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
