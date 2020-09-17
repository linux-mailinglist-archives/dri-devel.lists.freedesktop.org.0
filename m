Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497BE26D517
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D4B6EB09;
	Thu, 17 Sep 2020 07:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AED56EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep1Ea4El2YGsouvC7R9iZsuQllASeZAEN/J8UYLd3NNBQkdn10ySSnpRDvOpkeNADBNHZGU0MSzbaUoQowT72aoJs+2oJ12HC0pHuxYKfMZ/7s7i63eBosyW+ewZAe6poFF5/fC+2nckFTtbdrBIJtzXo5IDLGnB2btM0Lpfpntly+1rto3C6OQoVHUhicdTgXbb2KaKxPOZ/tLpIFm6wMDJBWiTrPMXnMKiprtB6z+MGZkk7S7gcv/51KTCQSsbuu4Eus8SDO8okPcFOqYRh1ya91/xnZDnBiPYPC6EGEk9986H1Qa5lAUCpqKH6rvNulGXV0t8PITXrTlW8mJrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ER8ujQWZ8pWixvlP8mnpePi3zEb1qgQUFY+S3EQhY=;
 b=aadFLBvB2MfYoke4PDkfvXBeMlSfyYmpIrDicO5c1O2IAZ2hUd27wT2P4nNxyWvdNGR3ck1+jwNGnFSirUAxl3BvXUINEQEcXTGJB0G2pGXpptNQ4Ga3tZfnfxMrureo8fqKFq59771iE8mERfvwTd8LpKY4/EZcR5Gvf66pNXPMey1mHdwB5hIjqrl0eP6wLEPZZxiCVIAqt6E3/8uYt5D0nYaXVzLowufCuWfYw9N8I0WdtMP5wdfAwh5GUDm66YD4nAMa3OHpf1h4iqe6154vz3nzGBKLy9/qBE9PdEHV2BW0/SkjxnFxH+GO8Z34xpmS8S+u27e/l+kOPlPLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ER8ujQWZ8pWixvlP8mnpePi3zEb1qgQUFY+S3EQhY=;
 b=Oik7pmyVhAIY6VwhBTR7HbO3s19vroXBbMbTm8bIJzWp5De/e2fvLUTTVHjQSzQOj5+iFX1B4fxDRReWQkfZKg37Q7gRoPiXxXgGq+HlxxGNUVHMSktslhX85IUErZgAT06O0vCe+tAHmy+9uYyQiV5YU1JP7/1yuINnMWc/JJE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 07:49:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:49:08 +0000
Subject: Re: [PATCH 4/7] drm/ttm/drivers: call the bind function directly.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917043040.146575-1-airlied@gmail.com>
 <20200917043040.146575-5-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <926225ea-149c-1d35-6d30-96bb7a927b8f@amd.com>
Date: Thu, 17 Sep 2020 09:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917043040.146575-5-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0001.eurprd07.prod.outlook.com
 (2603:10a6:200:42::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0001.eurprd07.prod.outlook.com (2603:10a6:200:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4 via Frontend
 Transport; Thu, 17 Sep 2020 07:49:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9e6742f-1abc-41ef-2b5e-08d85ade28a9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45181E1F0D5257F3BF39EF64833E0@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSyCLeiXsNVqI+ksXixquqSZ9f+2QU40BYYC4LesKz66DH54AoemVY4dyyRZsQKll+VDXX8Wa4c5UKyG1blao5SUj0DJLUQ+/yPunVu0H9TuIt+l3TYdikBapTlE7rPYH6LfGqXzBZ6UXwpxxtJviHvH6jVKCFXG7PYE3pfRCnMI2DIkZUIIdD9wYW0W7f+c6UcpsWz0fQJct23Ou/8haICqfTRFwWymLpPvuqvqnajOAFuSffRd3Bb7kwyduuChdo2Xx9JCYPFOm0DH7IUamVS3A8yd47RFrdfHRSLeIZyLO8wauBp065c8vD8j9jtGOCDPbKUqVd7yvC/Lt78Z9liBq+zHEE6hB5si/FJwjMf1ZgD27/dotE6q4JEPOEAS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(6666004)(8936002)(86362001)(16526019)(316002)(8676002)(31696002)(186003)(52116002)(83380400001)(2906002)(36756003)(5660300002)(66946007)(6486002)(66556008)(31686004)(478600001)(2616005)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: itF3+wOK2YQ7lVgwgBzGqfbB6DMlq+zFvTpPYiJeCew8QB6HpjUpIv8p+QdFhLCjvco+VGbkAagXazDKkfWQ/FgB7dybzgtv9C4ChIeYneYdGm8tsVIezMeaE80lZvrsmV+3vFn0PttleazS/ibWWC/qiFaBtRWk5txy1+8tVXD4PMSS09Sb4egldy2UMOQ+/OhtBC/vr4rFqaQqiC/ARjjJ2ZgF4uq0GQ7ThNFDc3dAwTX+G8wlIk19z/iM5Zv3orKNNmghmjUTkO28vNuZ0GgCIyHB1kYdbD7zbnQpZOvhoHFyAiw3DxoAX/EvR/14taUjUjzsDj5a7IJwlEFgwYJFy+j67k020sneAOLMAClZ/XrUjS0c4zslJlFpUEM7cKB6igcCq/DX2kKQmMdhwtQEvI2lWs0DrC++PO0aq9Dy/wPvtAbK83agp7cWzGaSlG9o6FAozWpqFCvNFsX9S/iUu70rhNDvhMdgzyQgfMhxG6Hp5OPiseIDH2s+XNtMYrxsCuCgs3ZJ6t3mT01nH64H5LLU7kZ5NuisN8D31iqx6OBy6/CJFKBoKssxgS8KrH7v5QQhNIG11/i4XX98Zh8ZjpVAFq6bLl3atMIvWMVH95qC1+yewGsdO5eVPMG2A4HqqurPyqHLYSZS8BodtQojF78+PhuW5Z2o1i7sMrvnllxaTC5Ir9hXv71Q1644/WczNAJIMNkJtTiRIcnlnA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e6742f-1abc-41ef-2b5e-08d85ade28a9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:49:08.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/0E+TIl/byXmxrsyjx3GXvzrhOTxk3p3hKpQd9OX9YxSy2xJkPzs2/2BG93fjki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gTm93IHRoZSBiaW5kIGZ1bmN0aW9ucyBoYXZl
IGFsbCB0aGUgcHJvdGVjdGlvbiBleHBsaWNpdGx5IHRoZQo+IGRyaXZlcnMgY2FuIGp1c3QgY2Fs
bCB0aGVtIGRpcmVjdGx5LCBhbmQgdGhlIGFwaSBjYW4gYmUgdW5leHBvcnRlZAo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNiArKysrKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgICB8IDUgKysrKy0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jICAgICB8IDYgKysrKystCj4gICBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgICAgfCAxIC0KPiAgIDQgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKPiBpbmRleCAyMDI4YjllNGMyNWMuLmE1N2FhZjY2NjM0MCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBAQCAtNjMsNiArNjMs
MTAgQEAKPiAgIAo+ICAgI2RlZmluZSBBTURHUFVfVFRNX1ZSQU1fTUFYX0RXX1JFQUQJKHNpemVf
dCkxMjgKPiAgIAo+ICtzdGF0aWMgaW50IGFtZGdwdV90dG1fYmFja2VuZF9iaW5kKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LAo+ICsJCQkJICAgc3RydWN0IHR0bV90dCAqdHRtLAo+ICsJCQkJ
ICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqYm9fbWVtKTsKPiArCj4gICBzdGF0aWMgaW50IGFtZGdw
dV90dG1faW5pdF9vbl9jaGlwKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCQkJCSAg
ICB1bnNpZ25lZCBpbnQgdHlwZSwKPiAgIAkJCQkgICAgdWludDY0X3Qgc2l6ZSkKPiBAQCAtNTUy
LDcgKzU1Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X21vdmVfdnJhbV9yYW0oc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKPiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAg
IAo+ICAgCS8qIEJpbmQgdGhlIG1lbW9yeSB0byB0aGUgR1RUIHNwYWNlICovCj4gLQlyID0gdHRt
X2JvX3R0X2JpbmQoYm8sICZ0bXBfbWVtKTsKPiArCXIgPSBhbWRncHVfdHRtX2JhY2tlbmRfYmlu
ZChiby0+YmRldiwgYm8tPnR0bSwgJnRtcF9tZW0pOwo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+
ICAgCQlnb3RvIG91dF9jbGVhbnVwOwo+ICAgCX0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iby5jCj4gaW5kZXggNGEwMjBhM2RhM2RkLi41NmY5NzRjMjhlYjUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gQEAgLTQ0LDYgKzQ0LDkgQEAKPiAgICNpbmNsdWRl
IDxudmlmL2lmNTAwYi5oPgo+ICAgI2luY2x1ZGUgPG52aWYvaWY5MDBiLmg+Cj4gICAKPiArc3Rh
dGljIGludCBub3V2ZWF1X3R0bV90dF9iaW5kKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX3R0ICp0dG0sCj4gKwkJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpyZWcp
Owo+ICsKPiAgIC8qCj4gICAgKiBOVjEwLU5WNDAgdGlsaW5nIGhlbHBlcnMKPiAgICAqLwo+IEBA
IC05MjcsNyArOTMwLDcgQEAgbm91dmVhdV9ib19tb3ZlX2ZsaXBkKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sIGJvb2wgZXZpY3QsIGJvb2wgaW50ciwKPiAgIAlpZiAocmV0KQo+ICAgCQln
b3RvIG91dDsKPiAgIAo+IC0JcmV0ID0gdHRtX2JvX3R0X2JpbmQoYm8sICZ0bXBfcmVnKTsKPiAr
CXJldCA9IG5vdXZlYXVfdHRtX3R0X2JpbmQoYm8tPmJkZXYsIGJvLT50dG0sICZ0bXBfcmVnKTsK
PiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIG91dDsKPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jCj4gaW5kZXggMDNlNWFlNGUzYmY2Li45OWQ5Y2ExMDg3YjcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IEBAIC01Niw2ICs1NiwxMCBAQAo+ICAgc3RhdGlj
IGludCByYWRlb25fdHRtX2RlYnVnZnNfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
Cj4gICBzdGF0aWMgdm9pZCByYWRlb25fdHRtX2RlYnVnZnNfZmluaShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldik7Cj4gICAKPiArc3RhdGljIGludCByYWRlb25fdHRtX3R0X2JpbmQoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gKwkJCSAgICAgIHN0cnVjdCB0dG1fdHQgKnR0bSwKPiAr
CQkJICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqYm9fbWVtKTsKPiArCj4gICBzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmFkZW9uX2dldF9yZGV2KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQo+
ICAgewo+ICAgCXN0cnVjdCByYWRlb25fbW1hbiAqbW1hbjsKPiBAQCAtMjM4LDcgKzI0Miw3IEBA
IHN0YXRpYyBpbnQgcmFkZW9uX21vdmVfdnJhbV9yYW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywKPiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAgIAl9Cj4gICAKPiAtCXIgPSB0dG1fYm9f
dHRfYmluZChibywgJnRtcF9tZW0pOwo+ICsJciA9IHJhZGVvbl90dG1fdHRfYmluZChiby0+YmRl
diwgYm8tPnR0bSwgJnRtcF9tZW0pOwo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAgCQlnb3Rv
IG91dF9jbGVhbnVwOwo+ICAgCX0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCAyYzUyN2NkMjBk
ZmEuLjI3OWEwZTQ0YTVlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC0xNjI4LDcgKzE2
MjgsNiBAQCBpbnQgdHRtX2JvX3R0X2JpbmQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywg
c3RydWN0IHR0bV9yZXNvdXJjZSAqbWVtKQo+ICAgewo+ICAgCXJldHVybiBiby0+YmRldi0+ZHJp
dmVyLT50dG1fdHRfYmluZChiby0+YmRldiwgYm8tPnR0bSwgbWVtKTsKPiAgIH0KPiAtRVhQT1JU
X1NZTUJPTCh0dG1fYm9fdHRfYmluZCk7Cj4gICAKPiAgIHZvaWQgdHRtX2JvX3R0X3VuYmluZChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ICAgewoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
