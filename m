Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373726D566
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498D989356;
	Thu, 17 Sep 2020 07:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA4B89356
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POWz4HopZOo9gGMv0cSw+aJfEgDrsmqGQ38sbfC/HPfopuL4qczWQ4onHRoxkQipyxIJY4O8m6vEtOr2XBynnwBiW7jkA7klm74x/be0TTagflBI3pNhoAIPRiSsQqAmfhHs7MX7dRxD/Hn3bzxWnGFNBqf7P7MEhj/acH5lerhO1RC5VTIHb52RgKDKR5hqzEWk5DERrhbpJQXSM9TpIj6nDingsuNv+8cUt9h19I7+mxIneZT0/rSJ7XO9vC+wwmeg9MXv79PHl+PSyHMbq7FiHZhkyVwdk9auEvqV/h30bI+qGcFTjpaywdX5zntWsz3xpzDymsjB9NHc44JTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6l8WGLW8igHu2XRg3bhkigKVxVY//VgXOKlVKnNBtk=;
 b=HHXjyhzVusd08qXijWyIDLNvVQJ25liMUtFr4GiF4u6ngeM3X0F4rU7DvnYFysBj8Ax1rFNv0PYOM8wbxpjcGiSpssVyRVpUasd4/19lGMLpcGLlBRBv3h859x9yN6n2MTpdBocjhVbdAFL98P8PB+h45Pt3VEIDPuHEdyZPeO25+Cifvr5zpjz50Ry/00k+cQ+LA4wu1ztv5e5e3J9AocByUm54H6mi0fDCeA1QZrh7CB36gT7OMxdI3J29jZZ+I9OdiUhZFaPaIxuOJ4pWPq5SPNl+vTOXynBhs0HZHo13xNooiMYzKmQGSrZruFDPQsutokLK79OfNKoZrNmbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6l8WGLW8igHu2XRg3bhkigKVxVY//VgXOKlVKnNBtk=;
 b=M0756Ytcuq5BKmoya+6HkM03IwPn5/poPoka2f4B5FLyP2kv9QQkVIjVdyLaUhe0ysuwf2u03w05nAkKsVPO6rg/6/58MajmwC0yTwdcokf7OYsIsALD4jVuSwkY73pBYGLXHX1Dq7BQF7KTZuboajtkoLrUp7DdFdfk11oYIUg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 07:57:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:57:31 +0000
Subject: Re: [PATCH 7/7] drm/ttm: make common function for wait/free node path.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917043040.146575-1-airlied@gmail.com>
 <20200917043040.146575-8-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c327f87a-7d8d-89ca-b7eb-d86c66e4b783@amd.com>
Date: Thu, 17 Sep 2020 09:57:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917043040.146575-8-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:200:9b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Thu, 17 Sep 2020 07:57:30 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb9075fa-9035-4829-2b47-08d85adf5467
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42393DE903F5293CE1D2EDAF833E0@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcsSsVT8i7SQOHp+Bq0qDw5+AdLg+lHzekyxbFFD3/8tn6y2fwTD+269El2sTRW71jodruO8MPCD2gNUu8bV+SPGzTx+KVlCErJ21Q4a1shBar/nWFKgwITKYgItCkfh4EZlRcLbLp1xntyJnexKogl2O8RcyzeIMBZ1mDHZXwPY8dM1ME8HfM+DAeAtSQVC+Z6hn81EI1k6hv7Idl4+7HgWbZvpUhkQnsheeWzVUqWuWScdskWyM7tQYF450SdCy34SGEnSVPeDQJsIWekYBZd7uEZrJIAkleZMpA3uPS3Kju05/mXP5SUDa+ZX8WNIwb/Djump4nwGAlBceA+UCqQwtcnCZtHDkiA1wL162n8iQkoJI8yle0ruPcVrsAiJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(6666004)(2906002)(66946007)(36756003)(31686004)(2616005)(186003)(316002)(66476007)(83380400001)(66556008)(6486002)(5660300002)(16526019)(31696002)(8936002)(8676002)(52116002)(86362001)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: se6gxrHVidHSLFYAnFIPuZwPFralzaTJg8oa/jo+ADjKei5Lylfo3927zVF1NnFwPPgqeA78PQD7qUl3w8dtHuhpDF7aJzS8P+ujosRGzDL0baNvZ6FEoqp91B7d5nYfmK3Bo6jH5DRh6JilCI9kITxUHklF2LUqtlRsXPLh+gzlhnHl9loxoX4pYigVQI1mJAxexpmcwBs76BvXUohcQAnzFRVOFii86GOu+wxIw7tB7UwqDKS/5VC1A9mFR3OZ0x5AnKP3n4FHiactlC3/SrEdiIG/QKWMZdNVwoimk0RD5V3NHm0hYo+NLQowH4zGYZEWNVU4j5BkVOeKcssbC/e2MIi9srYl2qGIGC1jD6r+eiJZumBrocLYc5xhelXF2uhcaPhYOqsiWq7p0dssjd053/hsKbmxGHIBz16f4LJSKI+pkXls09NqKgux9qSM1gMaB/e4jNzsCMYrzAZwzVQwsgyB6n5G062Fk9e7qVHp6D4KEdxptfbwEQKVTaxYatTFgg+AZq0shNdAfCYD0LdUMWOaBLOTBsp7JpcA6n7a32SfM8uOcWAUghHUNLGASponSMEhT8LL2d17qWSgBfyvV0d1lpWmD7+XdbBBbMpfiBezAbMCkNDDMqZhLw056dRsZGtunD/9UwqlXJMPffzbGw0OEgBAednGyumSDyIduGFsqeKtESMRO3TpU1vjWB4z5ygNPwK0FMAyzZEoGA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9075fa-9035-4829-2b47-08d85adf5467
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:57:31.4668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQBv20Mp1ceR6z0y4jZZykYybkIMYhC0NsaGEe2GePILgoY9sXBHBK+C3WT1Wu1p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

QW0gMTcuMDkuMjAgdW0gMDY6MzAgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIHBpcGVsaW5lIGFuZCBhY2NlbCBjbGVh
bnN1cHMgaGFzIHNpbWlsaWFyIHBhdGhzIGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMgfCAzOCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gaW5kZXggM2MxNmUzMDNkMmUyLi41MDJkMzM0Nzg2ZDIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gQEAgLTUyNiw2ICs1MjYsMjAgQEAg
dm9pZCB0dG1fYm9fa3VubWFwKHN0cnVjdCB0dG1fYm9fa21hcF9vYmogKm1hcCkKPiAgIH0KPiAg
IEVYUE9SVF9TWU1CT0wodHRtX2JvX2t1bm1hcCk7Cj4gICAKPiArc3RhdGljIGludCB0dG1fYm9f
d2FpdF9mcmVlX25vZGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiArCQkJCSBib29s
IGRzdF91c2VfdHQpCj4gK3sKPiArCWludCByZXQ7Cj4gKwlyZXQgPSB0dG1fYm9fd2FpdChibywg
ZmFsc2UsIGZhbHNlKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlpZiAo
IWRzdF91c2VfdHQpCj4gKwkJdHRtX2JvX3R0X2Rlc3Ryb3koYm8pOwo+ICsJdHRtX2JvX2ZyZWVf
b2xkX25vZGUoYm8pOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gICBzdGF0aWMgaW50IHR0bV9i
b19tb3ZlX3RvX2dob3N0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQkJc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2UsCj4gICAJCQkJYm9vbCBkc3RfdXNlX3R0KQo+IEBAIC01Nzcs
MTkgKzU5MSwxMiBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAo+ICAgCWludCByZXQ7Cj4gICAKPiAgIAlkbWFfcmVzdl9hZGRfZXhj
bF9mZW5jZShiby0+YmFzZS5yZXN2LCBmZW5jZSk7Cj4gLQlpZiAoZXZpY3QpIHsKPiAtCQlyZXQg
PSB0dG1fYm9fd2FpdChibywgZmFsc2UsIGZhbHNlKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1
cm4gcmV0Owo+IC0KPiAtCQlpZiAoIW1hbi0+dXNlX3R0KQo+IC0JCQl0dG1fYm9fdHRfZGVzdHJv
eShibyk7Cj4gLQkJdHRtX2JvX2ZyZWVfb2xkX25vZGUoYm8pOwo+IC0JfSBlbHNlIHsKPiArCWlm
IChldmljdCkKPiArCQlyZXQgPSB0dG1fYm9fd2FpdF9mcmVlX25vZGUoYm8sIG1hbi0+dXNlX3R0
KTsKPiArCWVsc2UKPiAgIAkJcmV0ID0gdHRtX2JvX21vdmVfdG9fZ2hvc3QoYm8sIGZlbmNlLCBt
YW4tPnVzZV90dCk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiAtCX0KPiArCWlm
IChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAgIAo+ICAgCXR0bV9ib19hc3NpZ25fbWVtKGJvLCBu
ZXdfbWVtKTsKPiAgIAo+IEBAIC02MzksMTQgKzY0Niw5IEBAIGludCB0dG1fYm9fcGlwZWxpbmVf
bW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkgKgo+ICAgCQkgKiBTaG91
bGQgbmV2ZXIgaGFwcGVuIGluIHByYXRpY2UuCj4gICAJCSAqLwo+IC0KPiAtCQlyZXQgPSB0dG1f
Ym9fd2FpdChibywgZmFsc2UsIGZhbHNlKTsKPiArCQlyZXQgPSB0dG1fYm9fd2FpdF9mcmVlX25v
ZGUoYm8sIHRvLT51c2VfdHQpOwo+ICAgCQlpZiAocmV0KQo+ICAgCQkJcmV0dXJuIHJldDsKPiAt
Cj4gLQkJaWYgKCF0by0+dXNlX3R0KQo+IC0JCQl0dG1fYm9fdHRfZGVzdHJveShibyk7Cj4gLQkJ
dHRtX2JvX2ZyZWVfb2xkX25vZGUoYm8pOwo+ICAgCX0KPiAgIAo+ICAgCXR0bV9ib19hc3NpZ25f
bWVtKGJvLCBuZXdfbWVtKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
