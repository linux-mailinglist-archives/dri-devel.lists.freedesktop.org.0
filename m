Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD59275A37
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B88B6E2C7;
	Wed, 23 Sep 2020 14:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8606E2C7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJa/kRL55zslMQEJ8YDiP9vP3cuCvRHR2/FqMXdJ9srdGNAcxKcCPnFOpj5DroG7h7LsqVykqzYpw+FgPCMVjBHvkO5C8UxBy6NEhg9pECx07Bfb10zDQMdfWd35y1QJcK7qqvMmO1GEKRBbWsoYPaQdAP3DeA9imEtxDyXLUmlseGrGE7gwgF4Ig0oWsoSdwLcFc2KLPJ3B8IuLm89PLXHl6KKiuBXXO1Q6njUGldUcLo21S+sa0EPEdF79CUXeG2UBBNdKImQ4KN/Xq5mSlF1OOT542qj9P1h/hEnFx9uNUmDL5Jw8X8u+Iasd1fMvk2frfeQlFfDi8rh1OTDjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwI9n6br4mV5PuXwtfOQmSL+fPPFTWjkxVG18FX2PWw=;
 b=att25lxCvZIfRmIP+7uL9mkgCL13nVJN77uDmpofC60Nx4TyT4mfZeg84bZInQR19Una0XJBW52wWpSA0Yk/N8lLeekFVl4AH/mKf+V3RyOLdi2ymoZI7t5F+FPGlvSqhl1rKXlnbCzPuN9ucAFBSikvqiuR6pFg4VAZXLE59ZYvm4TKjqDgUea2iJoWdlJZT8lI5TVa8MR5jBoW82f5KMQYkftwkXPdhQB8WtuE40MQzSbOmYuOaJgQI4c14vxqdsHvZH1uisa3wWeRYNbAqYmfoCo/W/n89HT3nOD0OysEQ40j3t/ERjgMFG5fEQbOa/GGlE+e6d8l3Hmwieu+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwI9n6br4mV5PuXwtfOQmSL+fPPFTWjkxVG18FX2PWw=;
 b=k67KyrWF9ZcB41lRRH5vLcbGXLMPCVmOmjDAtLi5m+Vvd+gt2LGn4qJZV/G7P8hc5fNcYqkJpkhIwlaG9U7QpP2+ouCBxjvRGDdOFZXFsHLsguZxS8G9nLhgV8BU6pLVb0YF8g/24aVHQnYEVqDs1psZmLIqVaXALkaWn3qk5C4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:34:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:34:54 +0000
Subject: Re: [PATCH 01/10] drm/radeon: kill radeon_bo_wait
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7cbf4534-a372-7d91-d129-7d7bff6c9e2e@amd.com>
Date: Wed, 23 Sep 2020 16:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923030454.362731-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0102.eurprd02.prod.outlook.com
 (2603:10a6:208:154::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0102.eurprd02.prod.outlook.com (2603:10a6:208:154::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Wed, 23 Sep 2020 14:34:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 803330a0-f4b8-4c59-7532-08d85fcdd692
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45493E127FA4A140E03D2D6F83380@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKTvWawR8TZb146Gu1EXJyvXg29V7OaHNCdrj8299L5dMxTZNzgfr+7N1MhetQ0ukBo1jTDXGwybTyyi8od+ScsB38Cn6KPTLNUH0d69QR/dJZKaoK/0xl7qIHQtaW/ClpLrIjFwmkXmW6AGD7bFPysJf/O1Q1IHfJL/bPIl2gHOx9fSQ9MfiWo0KW7HkP6vHOp4Mw077YKjgpjotjS8xVvGlqIbbanAs7SeG8Q+29spXcoGzNK8Yh7uw7BkHtase3CyynQ8tWGQ83PSAzEr9g/cLw1LCaQwQD0SpJpXsk0NFvt+5ly7EUUhXA44+B+9QVYv6PSNteKaOHWGMC2a3qTqhFOVHDZjUlUso/KjCTxxqSgb9BfzZP7ZZopDHSzpfGs/iYOAT6XaP3SUumHW5HwHQGQUT0HEnwxRPiMs7mzupLKHBcAIhagYgYr5L96W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(66574015)(8936002)(52116002)(66476007)(316002)(66556008)(66946007)(4326008)(8676002)(478600001)(6666004)(6486002)(16526019)(2616005)(186003)(36756003)(2906002)(31686004)(5660300002)(86362001)(83380400001)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TD3qo7IMpqH7r2JL21jTSq05gQEGlb8TyZ3LiNbEZpxYO54JG74i3bPC02z2isLsdXM5MqFQBOObQC5TAXLP701IY6goWO/rZxkrH2pC1I2R2eqnW5gqC1QbGYAjfU95LgC5C7u2cBj3QLZQRWVrnROSrdSGXaJjl/jYCglArBlrA04K9TaD1Dzlhszxb3vYpz64zzp+jWerbx0VlaINpeGkD1m9xXnExGuRNv8du+tmVzEBmNg4s0nkS/+4cVELN3MCDPCL/9fVdIcUmOvZInY9goN//GrCTMvpWWBs8EzLrRaW75m/b1mq8U0jlQQILN0VkXScC3Yyf50WqG9kA1dD1nx66UK5uSQ6SvH5iIZAX0Sl05AQEW7gBYfCpKzsbIWY2ONbeZzrkSExokjPcdR+kpl5xDl8Bf75NK0ckcB0aJNhfoHIxeMcT/hXkG6R7P++LqgAan4ODWdYALLCrYbyac20nPPnAXLebJgbmgZf60n6L7oY+xH0LRcV4qSB2sThZ/34MoO7sGZzVhfYPivsZ7QplDvZUd+aFBrHrf0OcqoDBFFdClnNETGGGmVVwms7YtbYszm12XeP+Eh8HTLgf/RKT3oZ2DPZtDIkbaELPY9/xN7vvAy7JCcG0ilgy0GZH03PuEXEJjk9xdNrEhNNgBWMALQIA9aqhShh3hWcgh1aKk6nfI3Q7yWvVxSEDUeXO0o0Oj6Dacl7hUHy/g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803330a0-f4b8-4c59-7532-08d85fcdd692
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:34:54.7531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSzlgOBUri7U3eBgkLvS6lq1POgy1O6Btek1QLBOvA5+WXEPfmcPhD+9xAVxYw3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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

QW0gMjMuMDkuMjAgdW0gMDU6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gdGhpcyBpcyB1bnVzZWQKPgo+IFNpZ25lZC1v
ZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jIHwgMTUgLS0tLS0tLS0tLS0tLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaCB8ICAzIC0tLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAxOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX29iamVjdC5jCj4gaW5kZXggMGRlMjY3YWIzOTEzLi42ODk0MjZkZDg0ODAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwo+IEBAIC04MjUsMjEgKzgyNSw2IEBA
IGludCByYWRlb25fYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibykKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1pbnQgcmFkZW9uX2JvX3dhaXQo
c3RydWN0IHJhZGVvbl9ibyAqYm8sIHUzMiAqbWVtX3R5cGUsIGJvb2wgbm9fd2FpdCkKPiAtewo+
IC0JaW50IHI7Cj4gLQo+IC0JciA9IHR0bV9ib19yZXNlcnZlKCZiby0+dGJvLCB0cnVlLCBub193
YWl0LCBOVUxMKTsKPiAtCWlmICh1bmxpa2VseShyICE9IDApKQo+IC0JCXJldHVybiByOwo+IC0J
aWYgKG1lbV90eXBlKQo+IC0JCSptZW1fdHlwZSA9IGJvLT50Ym8ubWVtLm1lbV90eXBlOwo+IC0K
PiAtCXIgPSB0dG1fYm9fd2FpdCgmYm8tPnRibywgdHJ1ZSwgbm9fd2FpdCk7Cj4gLQl0dG1fYm9f
dW5yZXNlcnZlKCZiby0+dGJvKTsKPiAtCXJldHVybiByOwo+IC19Cj4gLQo+ICAgLyoqCj4gICAg
KiByYWRlb25fYm9fZmVuY2UgLSBhZGQgZmVuY2UgdG8gYnVmZmVyIG9iamVjdAo+ICAgICoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmggYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaAo+IGluZGV4IGUwOTdhOTE1Mjc3ZC4u
MjdjZmI2NDA1N2ZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X29iamVjdC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmgK
PiBAQCAtMTMzLDkgKzEzMyw2IEBAIHN0YXRpYyBpbmxpbmUgdTY0IHJhZGVvbl9ib19tbWFwX29m
ZnNldChzdHJ1Y3QgcmFkZW9uX2JvICpibykKPiAgIAlyZXR1cm4gZHJtX3ZtYV9ub2RlX29mZnNl
dF9hZGRyKCZiby0+dGJvLmJhc2Uudm1hX25vZGUpOwo+ICAgfQo+ICAgCj4gLWV4dGVybiBpbnQg
cmFkZW9uX2JvX3dhaXQoc3RydWN0IHJhZGVvbl9ibyAqYm8sIHUzMiAqbWVtX3R5cGUsCj4gLQkJ
CSAgYm9vbCBub193YWl0KTsKPiAtCj4gICBleHRlcm4gaW50IHJhZGVvbl9ib19jcmVhdGUoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAJCQkgICAgdW5zaWduZWQgbG9uZyBzaXplLCBp
bnQgYnl0ZV9hbGlnbiwKPiAgIAkJCSAgICBib29sIGtlcm5lbCwgdTMyIGRvbWFpbiwgdTMyIGZs
YWdzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
