Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2145276F88
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5A86E1F9;
	Thu, 24 Sep 2020 11:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFDD6E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdpX/oeHhYY1GvzDn1D3xPEaK88lQwHtThTpZQzTXGu/svVGSod6qZyY74zJV6CBhc6HxeYClINTFeEHwilHVtsNHxokxVYwsgmDhibitF8TTpzs0g3Qsy9j8JkW/Vm/b57dEdTL4M0dJc4ULflkpuocbXYMeDb5Ite5wduz8wTLZhs++2zRPGRAHWO6B2Cdd01qzWdxd87P0krYMy1lgvpcxK1V8iUjND9i/FyjmGEUc0oZ4ODJlQvEt6T6SXOnrnQqUav/MYtZkwteOCAQjWhQLiuo5WLnopTGMhl78VSjH/vuVydqzL6Hrav43g4TeRT+KNJYEtZ8cmTKjHZ/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mo/1pJeyadEsF6xR/ygxAeQUQx+/HKWb3NLlg3XCoU=;
 b=LWm/JOsm8KJyGMWb2V36qZQ2eYT9cUb0shPxjvAovKqOvOPrtZ2l+Me342Fi+uVoRWZvLspRmvqb89FtDOFR+g0dDjx2hpPIw55FfoF058lHPHsf7v1vC3HhIXSPvibUlrf/Uuw1EOp28EZGGwHwNlsZm9UHJxTafIl1i5OnKREGGEh4wvobA7aMSTwZL1+OE8vD06oPvd7VU7tc4UC4EQWOJkxprGqA+/Vzw4Gj6BF1ajlPCG8ZGFVO10sw7kQ/czUYqtLdA06hDPsakd5ql2TClKx1VYGelMK3DVjDeTyUytAoTPryzQpiUBdrj43dB8gsilbwFW05cjfGL1WSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mo/1pJeyadEsF6xR/ygxAeQUQx+/HKWb3NLlg3XCoU=;
 b=EYAPNmDWxNg10hjGwkf/Rr0iT/QI8ndM7Lj15FYmTpKTsFPdqg0p7MrhDOFkHobbLz6YmjWfUhq042qrq0zUtVKhGjNIEyASCHtRY+R14kgz197xWFCDURsUWNQoKXSS+BzQQ0C2JRYgyPnpgXBfUVYJwbSaiOhv9qZH8qVa8hc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:11:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:11:00 +0000
Subject: Re: [PATCH 04/45] drm/radeon/ttm: handle ttm moves properly
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-5-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1ffba0f9-ed72-2341-cc8a-2b9d84e9ba3d@amd.com>
Date: Thu, 24 Sep 2020 13:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-5-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 11:10:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da6aaca7-4d04-42cf-faa5-08d8607a84a1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB235386962E93EFACC39D3A4583390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gq5i8smFET2ayjScFaTiTnt+OBXWVQY1vA0gFFlmYmhIBrKnzRX2IjqeAr/HwU7D0vs6JoniBmo28wiaVnKgni/zdAt8ZgVAMsjDrxNBrwPoGKUQBr24rXwY0YSnVHHPGvmVVWq1KJW/q3IJ6XTqn+0jJGs1qArttiau887yULZtr2VjHfZd6k4S5A3T5n8GEp1V5QUa8uKU5TIfp6pBIqBKsLYzQMb9nT/sJL0gxzqLIFSKfJ5JDNPycGUv+VvnMVqTmLHkWsqvMLd3C/hf3Tp8zrOd5aX9lL5njg3Dkl43AE3F7Kaf3THVoTy48EoYqqgzz5aoD5ZhqWMELRPiwKeidbTK+ihMNf2NODICGlfDV8pFR+vhPf8M98KiNHqk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(66556008)(66476007)(66946007)(31696002)(186003)(36756003)(16526019)(2906002)(6666004)(83380400001)(86362001)(31686004)(8936002)(478600001)(4326008)(6486002)(5660300002)(316002)(2616005)(52116002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QUdg12i68/4vFsqjqGFkTEl62UnMf16anXhy7iehaDzoqlKELGdkgKiW9Zjn/6aNd45mB4u19q6EZFtlnCDchFEfwKVNxaOhdSuh8KX7Jdze2nuMOMmOcgGn2ikaXDHAF3q8jL7Fa3k2FGAqfjEI64xy4zc32wtbZa8ro3vSqdzBgdEI3/2XDI3lAiI87MJHjhJ5kKKk6merzA5EO6v5WPuLRJLkRnp/xCstq219uVZMoVVFcfAaiz2G/ro2LaaLFPDIzSkebI0zpJ6/jf4WPwXjcOuh+oKhib7XwTtJtzSo4JNxs2COPccS3oE3VZQRTfIuO0XWvXE+eygzRgYfl+8fS8nrlXW83uZFsS/uhc1mgD19POqCwFSlmdCPmNIi4qKsQ85RmdwPMJzCcS4/mhQBubKcuRZImcDmiW6z+wtbBEtWHPnp3TK+e/gphA5H/edjP1I8AkvVazrQm5lQCBVvmMpWuAbEXBMeftETuFoC1W2QH6sdpbFH9/9BKZ9TR0EXNqLbE7WAguBbYUM4uBYUlgN7ZvueHal5qSU15UC7asNX5prWu89p/wlRQdgonS7GrtBitxnJx/+kla/c2B/4BZpZtXSjz2xY+NKHUOc9wWIJRhKb0P3X5DOeAVGqmSEsuapPTsa6VbBHK7e9QHQAL8asYHSG0mGpEw3EUU+hEP5L5U3yZVcpDTbaZWTwBqPeANSoyb3FFYddIn4Z+A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6aaca7-4d04-42cf-faa5-08d8607a84a1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:11:00.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8bKCAdMZbJEEgTDasoscO9GcwHXz7osA4uDSp055//HOXHUJTUwz7w40Wl4O4ch
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGNvcmUgbW92ZSBjb2RlIGN1cnJlbnRs
eSBoYW5kbGVzIHVzZV90dCBtb3ZlcywgZm9yIHJhZGVvbgo+IHRoaXMgd2FzIGJlaW5nIGhhbmRs
ZWQgYWxzbyBpbiB0aGUgZHJpdmVyLCBidXQgbm90IHVzaW5nIHRoZSBzYW1lCj4gcGF0aHMuCj4K
PiBJZiBtb3ZpbmcgYmV0d2VlbiBUVC9TWVNURU0gKGFsbCB0aGUgdXNlX3R0IHBhdGhzIG9uIHJh
ZGVvbikgdXNlCj4gdGhlIGNvcmUgbW92ZSBmdW5jdGlvbi4KPgo+IEV2ZW50dWFsbHkgdGhlIGNv
cmUgd2lsbCBiZSBmbGlwcGVkIG92ZXIgdG8gY2FsbGluZyB0aGUgZHJpdmVyLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgfCAxMiArKysrKysrLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IGVhOWZmYTYxOThkYS4uZGY1Y2VkYjJiNjMy
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtMzE2LDE0ICszMTYs
MTYgQEAgc3RhdGljIGludCByYWRlb25fYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLCBib29sIGV2aWN0LAo+ICAgCQl0dG1fYm9fbW92ZV9udWxsKGJvLCBuZXdfbWVtKTsKPiAg
IAkJcmV0dXJuIDA7Cj4gICAJfQo+IC0JaWYgKChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExf
VFQgJiYKPiAtCSAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkgfHwKPiAt
CSAgICAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJgo+IC0JICAgICBuZXdf
bWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVFQpKSB7Cj4gLQkJLyogYmluZCBpcyBlbm91Z2ggKi8K
PiArCWlmIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmCj4gKwkgICAgbmV3
X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUKSB7Cj4gICAJCXR0bV9ib19tb3ZlX251bGwoYm8s
IG5ld19tZW0pOwo+ICAgCQlyZXR1cm4gMDsKPiAgIAl9Cj4gKwo+ICsJaWYgKG9sZF9tZW0tPm1l
bV90eXBlID09IFRUTV9QTF9UVCAmJgo+ICsJICAgIG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9Q
TF9TWVNURU0pCj4gKwkJcmV0dXJuIHR0bV9ib19tb3ZlX3R0bShibywgY3R4LCBuZXdfbWVtKTsK
PiArCj4gICAJaWYgKCFyZGV2LT5yaW5nW3JhZGVvbl9jb3B5X3JpbmdfaW5kZXgocmRldildLnJl
YWR5IHx8Cj4gICAJICAgIHJkZXYtPmFzaWMtPmNvcHkuY29weSA9PSBOVUxMKSB7Cj4gICAJCS8q
IHVzZSBtZW1jcHkgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
