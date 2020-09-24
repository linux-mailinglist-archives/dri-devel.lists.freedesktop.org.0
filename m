Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628EC276FAA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1226E20F;
	Thu, 24 Sep 2020 11:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CEF6E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:17:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo+nn2g9KOOdNpuPap6vwdj6Ou9pen4TdD8rG5wRS78C0/YNVx02WCvrvzK3H7HBwNwc2k4dgGE3RnIYoPDAXcTjrs8mlO4WUqBqtN1tyo/FoqfXl+uvA+5U4CNxt3T2XUgoHnFvYsk6zoWIaH9N/LYgmeBnOaKdK4gOVOPQBY70RCePOYs1LA05deSWX0PsFUiheVVPOowA9BZPrZEt+rLSOGHVQQ73TEi+fUN6ff+0HnoZ/8oInMrpMbYqGXrMMRHhAag/eAmCWeU6R2EjXlWKe7gOjdCnDiMpGZW+sYsDXAn2V9UNGZd3CaQFaCi+mcdzLvonoKN3vHsHCSwYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlHohvWnkhh/9afP5J2P/0VMgtLsb40rNiXIh1Xy3vc=;
 b=XJvkAzCypf+tBRG4VWiqy5JqHd2e2zYJC6J82+jYFLNJGyKfMCgteH/G+8wYdWr6Wqg/JQp12AvgDFfgzA00AqKb1bd6jUuSEvE7OsIZc0aPROraIztgbxUq7yX/cVCQ1N8oFWhtdkVJ5FL2xvXTp1pl4Jyptts1vNdSVR/YdbXq4kR+WXJU0CuLDdgaNlZroiWvED4rAkFZodfjMyjegX8WRO1ukmF3tYwZN5yV3iyOYhURHwkj09HckT3lxsyBCGEiqtUxAgYb3vSfKfnbhxySDfiQIvuEwAow+qmV35WDIpVdkep65iXR4ErLk6KL6yQ2ofunWG6h8q+EBA6ysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlHohvWnkhh/9afP5J2P/0VMgtLsb40rNiXIh1Xy3vc=;
 b=ZGsTQaHBjj1qI56LVfz4kZFtDk41fio3Etjcfp6HK6UclEadk7mQDNZNVKlfTSC9OKny77aZCjoTvFkggCcxXYwEU2ArvKURnKWY2hPOX3J1c6kM/f3rBVydnj2WGiYMOMFIvov35oHL9tclcG0otmZS2rryYMRwLEYM/858ZH4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:17:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:17:26 +0000
Subject: Re: [PATCH 10/45] drm/ttm: refactor out common code to setup a new tt
 backed resource
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-11-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4282f73e-73fa-64c6-12e3-5a2a0762e27b@amd.com>
Date: Thu, 24 Sep 2020 13:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-11-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0092.eurprd02.prod.outlook.com
 (2603:10a6:208:154::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0092.eurprd02.prod.outlook.com (2603:10a6:208:154::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 11:17:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 801be666-3a8c-42ed-f6ad-08d8607b6ad1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353EACA67A2BF106FB02CE583390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PfPPHnBUgmU9Tc23LeNp7Ra1ztBS+DLZEqaXMINhXVpiKe0z8HVHigIP8NgsmqfqYwubveW4WJbvTaKIySaIAn0eG0gV2ScgwNMamFfdiUdN6VP95Fw4GiOSJdWAMaB19UhW5MJYSnw0D4CAB0O7UEewg49R4aPMrA9ZyM8gl/KoqN5PCoeP7QVdgyQouxnDr7cAFbVC/xTGGwG6txhPebZRHP/jzCgXZR6Hqi9GfLsG1ax8NiN+J+uVlPUB37L4NEiSLJH8nXAIHsD7OnjWY/Fwbl+XhCionUQmSEXS0z2FcZaPORDs5LJF8tQG0ugqoC1vpbPhbFnmxZfnSWS+UkjATpJZgkixuw8q8ldzISRue323ykpTcZwmKgsC5qhv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(66556008)(66476007)(66946007)(31696002)(186003)(36756003)(16526019)(2906002)(6666004)(83380400001)(86362001)(31686004)(8936002)(478600001)(4326008)(6486002)(5660300002)(316002)(2616005)(52116002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +W7lvQMNuX73OD0I1lbzzL24lTNlbQcqlj5+Cyhzgj325WFqJyvpgDmsE2m0e0U4GGXuk5kKmqfBBeJB1ZXj4tlsH6h4JFk9ymuxx+gt2vRxWbuVAGlp9WYKNbdP1Fyg5CNvA3oLdn7+j9Nhlw6XHR0a1MVDGsJBWJ7sShmM5nDW890UXs6HM7Q4YyeZI4PBnmEb3tB1648JLULOzpFoJGAftawCoEcdzoFAz/Xc1AA9wIlZElRooOjIojaTFkGe/dGxuHqMBPxRK05X60TpYZDGX2X8U6xA2/LN/RThVTRYN1ikHoa21VAfxo3zXkOGhiB6HLGwlNsMJv7UB3nFgJegtcFfiVuV9g7Nj4chhxhz6dvULdq8hcOi/ZTZGTUPzw0t+9lwD8RN84chX0SNJok/12Kf6mRiOqt6whJ5DoV6UCRZ+982lNHG+qYXw8DT3T2vYXU/ZlMRgTlNlYLH7Bzk1K0e57eZaULr2HMzaTX1VNNaKwRxZvPpuI834S6feahzsLM8Nyj0cX5aXwc+BEWjXOURkTFheI9OmDuiXGjHLPpa9nfsg+QGORYnnm26/TygzhZf1aKy4HHiVv1XQEF6Dq1o2ClpxohWDcvrZx/PkR8yETW34w++DmvYLJQz2XdSp8KNSW3pXohuMeXjkA0Tyq3GO027LrdznxvpzAWGfF2qIW38pQBJde7tbd1R0pQym+Sz8XpYCLLVwq0NiQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801be666-3a8c-42ed-f6ad-08d8607b6ad1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:17:26.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tt01Q4xpTgZ8gONF31zHhi6y3B3iF1snMjoeT7WVsYI/XP8qMplcixRqIou2r/6e
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBmYWN0b3JzIG91dCB0aGUgY29kZSB0
byBzZXQgdGhlIG5ldyBjYWNoaW5nIGFuZCBmb3Igbm9uLXN5c3RlbQo+IHR0IHBvcHVsYXRlIGFu
ZCBiaW5kIHRoaW5ncy4KPgo+IFRoZSBzYW1lIGNvZGUgd2FzIHVzZWQgdHdpY2UgaW4gdGhlIG1v
dmUgcGF0aHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgfCAxMiAr
LS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCA0MCArKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2Ry
aXZlci5oICAgfCAgMyArKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwg
MjYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCA2YTdmNGMwMjg4MDEu
LmM4ZGZmYzhiNDBmYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC0yNTIsMTkgKzI1Miw5
IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+ICAgCQlpZiAocmV0KQo+ICAgCQkJZ290byBvdXRfZXJyOwo+ICAgCj4gLQkJ
cmV0ID0gdHRtX3R0X3NldF9wbGFjZW1lbnRfY2FjaGluZyhiby0+dHRtLCBtZW0tPnBsYWNlbWVu
dCk7Cj4gKwkJcmV0ID0gdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShibywgY3R4LCBtZW0pOwo+
ICAgCQlpZiAocmV0KQo+ICAgCQkJZ290byBvdXRfZXJyOwo+IC0KPiAtCQlpZiAobWVtLT5tZW1f
dHlwZSAhPSBUVE1fUExfU1lTVEVNKSB7Cj4gLQkJCXJldCA9IHR0bV90dF9wb3B1bGF0ZShiZGV2
LCBiby0+dHRtLCBjdHgpOwo+IC0JCQlpZiAocmV0KQo+IC0JCQkJZ290byBvdXRfZXJyOwo+IC0K
PiAtCQkJcmV0ID0gdHRtX2JvX3R0X2JpbmQoYm8sIG1lbSk7Cj4gLQkJCWlmIChyZXQpCj4gLQkJ
CQlnb3RvIG91dF9lcnI7Cj4gLQkJfQo+ICAgCX0KPiAgIAo+ICAgCWlmIChiZGV2LT5kcml2ZXIt
Pm1vdmVfbm90aWZ5KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCBiZGVlNGRm
MWYzZjIuLmFlY2RiMmQ5MmE1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBA
QCAtNTAsMTEgKzUwLDMzIEBAIHZvaWQgdHRtX2JvX2ZyZWVfb2xkX25vZGUoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibykKPiAgIAl0dG1fcmVzb3VyY2VfZnJlZShibywgJmJvLT5tZW0pOwo+
ICAgfQo+ICAgCj4gK2ludCB0dG1fYm9fbW92ZV90b19uZXdfdHRfbWVtKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gKwkJCSAgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4
LAo+ICsJCQkgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKQo+ICt7Cj4gKwlzdHJ1
Y3QgdHRtX3R0ICp0dG0gPSBiby0+dHRtOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSB0dG1f
dHRfc2V0X3BsYWNlbWVudF9jYWNoaW5nKHR0bSwgbmV3X21lbS0+cGxhY2VtZW50KTsKPiArCWlm
ICh1bmxpa2VseShyZXQgIT0gMCkpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlpZiAobmV3X21l
bS0+bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkgewo+ICsJCXJldCA9IHR0bV90dF9wb3B1bGF0
ZShiby0+YmRldiwgdHRtLCBjdHgpOwo+ICsJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCj4gKwkJ
CXJldHVybiByZXQ7Cj4gKwo+ICsJCXJldCA9IHR0bV9ib190dF9iaW5kKGJvLCBuZXdfbWVtKTsK
PiArCQlpZiAodW5saWtlbHkocmV0ICE9IDApKQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsJ
cmV0dXJuIDA7Cj4gK30KPiArCj4gICBpbnQgdHRtX2JvX21vdmVfdHRtKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gICAJCSAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+
ICAgCQkgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkKPiAgIHsKPiAtCXN0cnVjdCB0
dG1fdHQgKnR0bSA9IGJvLT50dG07Cj4gICAJc3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSA9
ICZiby0+bWVtOwo+ICAgCWludCByZXQ7Cj4gICAKPiBAQCAtNzIsMjEgKzk0LDkgQEAgaW50IHR0
bV9ib19tb3ZlX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQlvbGRfbWVt
LT5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07Cj4gICAJfQo+ICAgCj4gLQlyZXQgPSB0dG1fdHRf
c2V0X3BsYWNlbWVudF9jYWNoaW5nKHR0bSwgbmV3X21lbS0+cGxhY2VtZW50KTsKPiAtCWlmICh1
bmxpa2VseShyZXQgIT0gMCkpCj4gKwlyZXQgPSB0dG1fYm9fbW92ZV90b19uZXdfdHRfbWVtKGJv
LCBjdHgsIG5ld19tZW0pOwo+ICsJaWYgKHJldCkKPiAgIAkJcmV0dXJuIHJldDsKPiAtCj4gLQlp
ZiAobmV3X21lbS0+bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkgewo+IC0KPiAtCQlyZXQgPSB0
dG1fdHRfcG9wdWxhdGUoYm8tPmJkZXYsIHR0bSwgY3R4KTsKPiAtCQlpZiAodW5saWtlbHkocmV0
ICE9IDApKQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0KPiAtCQlyZXQgPSB0dG1fYm9fdHRfYmluZChi
bywgbmV3X21lbSk7Cj4gLQkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPiAtCQkJcmV0dXJuIHJl
dDsKPiAtCX0KPiAtCj4gICAJdHRtX2JvX2Fzc2lnbl9tZW0oYm8sIG5ld19tZW0pOwo+ICAgCXJl
dHVybiAwOwo+ICAgfQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IGluZGV4IDg2NGFmYThmNmYx
OC4uMjBlNjgzOWU5YjczIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gQEAgLTYwNSw2
ICs2MDUsOSBAQCBpbnQgdHRtX2JvX21vdmVfdHRtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCj4gICAJCSAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKPiAgIAkJICAgIHN0
cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pOwo+ICAgCj4gK2ludCB0dG1fYm9fbW92ZV90b19u
ZXdfdHRfbWVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gKwkJCSAgICAgIHN0cnVj
dCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+ICsJCQkgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNl
ICpuZXdfbWVtKTsKPiAgIC8qKgo+ICAgICogdHRtX2JvX21vdmVfbWVtY3B5Cj4gICAgKgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
