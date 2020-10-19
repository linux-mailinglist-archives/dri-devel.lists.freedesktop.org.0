Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20529251B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 12:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B802A6E904;
	Mon, 19 Oct 2020 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D4D6E904
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 10:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmfxG4rQD8zXLVrw5clZxbzTOBIt/0CvST5G49pDoQERYLbZD630bwweGtAzmxS4+BsuRUZPhmkoZEWLYclMAdUk99ztJio2Q0w9ekRITweHePlOLoSSMGuHlT/H8YHJodQLuJD6pT/7BYP1J1BIjNv8EgGLps0xZEEP2UF92sjxCau6nnhUqQWDJVc2hbQUHBPT9dQq/LXPCKvFdQECxFbGXZbp8fBjUI3FDM9ItHxJlZnQ4ynv3VWtKtbnG5k5pEtUuJo2dSsW3X2tOA2M72GBinZ5vD4RmzOJfGY2jJ01mWrpVIZ6XdJ8fpCRD5D5JHnruiKg0Hps+dgeSs4UGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wSalgZ+8On7UOaKorm0crmlLx1//u4MIrqmqp8gGtc=;
 b=H4pDE3UfOGGiwPRIO9V6LP1z5XToiJ36qzdsoJ1/V2diuoxnW44o2naJR/cN+cqO4AxpRetw+lg7Ksle52OZjKVsrYK5WgnSZK5QI+MBYSpCTpJD8eW5iBwKXOr6gDSOKqq3DErRuoB0XSx6SJ0Qmvt38C9nEC2SAJOIGfIYtExp9naByrBhLShCu5lXdbQgRDZQh8MOlhXBYm+4C/wpWR1FMhE1FktZ4BDnp2GYnr8sJCPyqPxVDGCCRpj6MW1bvmApZa+CORbYK63GoP9Wjs2sWuQsi15rvPIF5engz/ZIHUvoHTE3biRxx+JZOhlN9pbqCvQpVcHIiAWcbBShog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wSalgZ+8On7UOaKorm0crmlLx1//u4MIrqmqp8gGtc=;
 b=0jrAVOy5aZa8AE+A8EiTGovhS5ilWAacW1aNqQ4Lvpfd0qtqItZ1+pJCvzHudAFOOtIoeN5bBbs0FC0EwxNbDXLnqXrICOqzbmP2PZmRSmxKxvVvW+zUPXyJXqk8H4QAiyz+33fTD+7pUISqoXRLKCIf3IMRuAWALcgF1iF+Dc8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 10:00:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 10:00:59 +0000
Subject: Re: [PATCH 5/5] drm/ttm: drop ttm_bo_move_ttm wrapper
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201019071314.1671485-1-airlied@gmail.com>
 <20201019071314.1671485-6-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <36d2f359-acde-2543-2278-bdb150e05b69@amd.com>
Date: Mon, 19 Oct 2020 12:00:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019071314.1671485-6-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:207::14)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:207::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.22 via Frontend Transport; Mon, 19 Oct 2020 10:00:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0950ab77-53de-4bb2-2df6-08d87415e101
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4061DD8776F079D9CB8B20C4831E0@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TGeXg0GdTKfSLes/9rv7JGigseITS+RskezyLptb2+LD9RqJvx9BzablYquNtnJ4HcI4HSqThGTs7UlCOOdparDEaJkZHPlCkzlCRL8APA8I0an+EF+4jE2cwTORXh9tVSSrZNw3zxjkiKIs65EBnb09OWH4dInmy5GWVjvu2RaR6O1fSG29e8YTqRceXRbfcYGyIvOxOJMcEyxMZLPcY9EsFfT5SH36kPmXyG9yrOpRujjXjSEUChviOetogsm3JLX40PWXNoyVmW54i6Tla4spUYq40VebCPx36kdEb2QF5ugA/KvJkTWcbAhgkROR3gkLM/h5oNG5aDHLnBLzoorxfpkzf5EKPxPYy0FrgKTTFhDrMwnk2C/9XNK0kPs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(36756003)(66946007)(31696002)(4326008)(66476007)(66556008)(6486002)(16526019)(2616005)(186003)(478600001)(86362001)(5660300002)(66574015)(8676002)(83380400001)(2906002)(8936002)(52116002)(6666004)(31686004)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZgvgAzuc3GttdHVNRJHeCNKYR/gqnthLSNmktcIIfutnkWIyRGs1DeI6z78fHpYuDeC8VpWTGxqfPCkJy9YYAHlLnFnT2a5b29HKsIEje0Dl+vr0Cj5CBmhABsQgQtdwfXZm1gUR6PzIYKjc/pSZ/qmoPMgircA2DTC+flmyrLNt//tiR4mekMySqbkLXWj9CT0pUzkDM0hiBiXBrin2lDpYbsHuPan5eg6TtHQGZMAKMu0wuKSbNDEIlH820Zlmc1AE5SUovemOvyy6zNRAK9qdkpwOt0HMPMRI6oQdSjHfAR014gDD+HsAkmsXBj/U2D7co9TQ0GZT3htg1u8j4zqvXgm32cdBj4ZbJyhC1WGDaqwdFl4yRlEYU5/yb+ozQy84CXUohpiLajZPoz4jyRF4/lbNvYqmf9Ol/OBhnnaUImVEeIn/n2OLLmf4uGSDcCRenL6k/6ANRZ+CQmCgv04hXJ6oylg1l0+suv9tdz7gT1Nof13CDw1F5Suauedmz4YKyXdV26U2FJivro71IUkhlMzeMC95F0KbaF8tdqRv5tiGuIRsRjYphCi4F8He4lXDpQCcVFVdm+UZu90LaP0BoFhDi8YH7hxokzxj5qMAbFQx35FnNH6ZnYludRWSHmg5yRGaBybJiDvsUVQhJBUpw/veI0ctJH1lWR8Do9uy3JQOJ0bhSTgfOPn33EpyZvyIQnzc6fJQwqw1+ZuKYA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0950ab77-53de-4bb2-2df6-08d87415e101
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 10:00:59.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq0eCynmuR/GfWN0prKnudDg5xx+k+5nhdqEdzLxqtk4thJgGWir1GTHz9+G/S8K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: rscheidegger.oss@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMTAuMjAgdW0gMDk6MTMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGFwaXMgdG8gbW92ZSBvbGQvbmV3IGFy
ZSBpbiBwbGFjZSBldmVyeXdoZXJlIHNvIHRoaXMgaXMgbm8KPiBsb25nZXIgbmVlZGVkLgoKUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4g
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAyMCAtLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAgIHwgMjIgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCAxYzEwNTVhNTAwY2QuLmEzMTMy
ZThhNDEwMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBAQCAtODksMjYgKzg5
LDYgQEAgaW50IHR0bV9ib19tb3ZlX29sZF90b19zeXN0ZW0oc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX21vdmVfb2xkX3RvX3N5c3Rl
bSk7Cj4gICAKPiAtaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAo+IC0JCSAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+IC0JCSAgICBzdHJ1
Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKQo+IC17Cj4gLQlzdHJ1Y3QgdHRtX3Jlc291cmNlICpv
bGRfbWVtID0gJmJvLT5tZW07Cj4gLQlpbnQgcmV0Owo+IC0KPiAtCXJldCA9IHR0bV9ib19tb3Zl
X29sZF90b19zeXN0ZW0oYm8sIGN0eCk7Cj4gLQlpZiAodW5saWtlbHkocmV0ICE9IDApKQo+IC0J
CXJldHVybiByZXQ7Cj4gLQo+IC0JcmV0ID0gdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShibywg
Y3R4LCBuZXdfbWVtKTsKPiAtCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCj4gLQkJcmV0dXJuIHJl
dDsKPiAtCj4gLQl0dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4gLQlyZXR1cm4gMDsK
PiAtfQo+IC1FWFBPUlRfU1lNQk9MKHR0bV9ib19tb3ZlX3R0bSk7Cj4gLQo+ICAgaW50IHR0bV9t
ZW1faW9fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIAkJICAgICAgIHN0
cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPiAgIHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBp
bmRleCA0YjM0MTkxNDg1OGIuLjJmYmQ5YWRjMTY0NSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2RyaXZlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2
ZXIuaAo+IEBAIC01NjYsMzIgKzU2NiwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2JvX3Vu
cmVzZXJ2ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ICAgLyoKPiAgICAqIHR0bV9i
b191dGlsLmMKPiAgICAqLwo+IC0KPiAgIGludCB0dG1fbWVtX2lvX3Jlc2VydmUoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsCj4gICAJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICptZW0p
Owo+ICAgdm9pZCB0dG1fbWVtX2lvX2ZyZWUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4g
ICAJCSAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbWVtKTsKPiAtLyoqCj4gLSAqIHR0bV9ib19t
b3ZlX3R0bQo+IC0gKgo+IC0gKiBAYm86IEEgcG9pbnRlciB0byBhIHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdC4KPiAtICogQGludGVycnVwdGlibGU6IFNsZWVwIGludGVycnVwdGlibGUgaWYgd2Fp
dGluZy4KPiAtICogQG5vX3dhaXRfZ3B1OiBSZXR1cm4gaW1tZWRpYXRlbHkgaWYgdGhlIEdQVSBp
cyBidXN5Lgo+IC0gKiBAbmV3X21lbTogc3RydWN0IHR0bV9yZXNvdXJjZSBpbmRpY2F0aW5nIHdo
ZXJlIHRvIG1vdmUuCj4gLSAqCj4gLSAqIE9wdGltaXplZCBtb3ZlIGZ1bmN0aW9uIGZvciBhIGJ1
ZmZlciBvYmplY3Qgd2l0aCBib3RoIG9sZCBhbmQKPiAtICogbmV3IHBsYWNlbWVudCBiYWNrZWQg
YnkgYSBUVE0uIFRoZSBmdW5jdGlvbiB3aWxsLCBpZiBzdWNjZXNzZnVsLAo+IC0gKiBmcmVlIGFu
eSBvbGQgYXBlcnR1cmUgc3BhY2UsIGFuZCBzZXQgKEBuZXdfbWVtKS0+bW1fbm9kZSB0byBOVUxM
LAo+IC0gKiBhbmQgdXBkYXRlIHRoZSAoQGJvKS0+bWVtIHBsYWNlbWVudCBmbGFncy4gSWYgdW5z
dWNjZXNzZnVsLCB0aGUgb2xkCj4gLSAqIGRhdGEgcmVtYWlucyB1bnRvdWNoZWQsIGFuZCBpdCdz
IHVwIHRvIHRoZSBjYWxsZXIgdG8gZnJlZSB0aGUKPiAtICogbWVtb3J5IHNwYWNlIGluZGljYXRl
ZCBieSBAbmV3X21lbS4KPiAtICogUmV0dXJuczoKPiAtICogITA6IEZhaWx1cmUuCj4gLSAqLwo+
IC0KPiAtaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
IC0JCSAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKPiAtCQkgICAgc3RydWN0IHR0
bV9yZXNvdXJjZSAqbmV3X21lbSk7Cj4gICAKPiAgIGludCB0dG1fYm9fbW92ZV90b19uZXdfdHRf
bWVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQkgICAgICBzdHJ1Y3QgdHRt
X29wZXJhdGlvbl9jdHggKmN0eCwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
