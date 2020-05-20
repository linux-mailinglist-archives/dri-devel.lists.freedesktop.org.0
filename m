Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742A1DBDC3
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 21:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BE46E88B;
	Wed, 20 May 2020 19:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34986E888;
 Wed, 20 May 2020 19:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlOE7LgrqIZvrrCFWAnmVNSav4jFTMZM9O+lcvd3UjhZfJYAGkmHpZveid11gUyXkOrRQqq51sdB7IOm2bADyG7mo3BfQmwnJLadTC8atQV1NPLr0P88vi9N5e0KfBySo8FCCcB5fC340Pm/ejhExNz0TjkgVf49lp+c9dORWINMKPKf5EZ71ibjgFTfhyMLH0pBqyU/XAFlkgWdEskP0R+U8+cz0tZAuM9U/51AanK0coHQG92hr2X4MNVJvZQb3NtQx48qxHLTBcGULrZOhzwo45E1YQ8NlzfqtnjUAgNDVyaqN2le7BWcViQHGv/gtGXNrJypANpUJjr3cUXggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNE/Kw6RC2DuNwPM/QVfHyUwCNoMvrbtVem8Jq5gKps=;
 b=QDoeiqDnRTQ5n9v/Eok30HMC0xeRASlLHEDeY5vmqBigjnad8Rs+vOacaLHURGRl0cuNOcfXbLnXLCfgPHPMrDxx9CU85VGbSC7Fe1Ew1YFqX63YIOm/kXHf8CcdADcuvLyOGiCu9Ke0v/2gk8AYxKd3Vk3V8YATSQK3+NEThCEAMh08Y0mjZsBfV4QJ+8ie/M+xFBrU5IJB7cZd6x3JnN6VeOf/AINd+iSKJ5jBQlLZ8yv7gNETvalsiagLD9Sl807DuHvamXOD9q7N81wGtnWWCYTs2cQiBtFiZGB1s9bbo4Z7EXwerAuW6QHGbL2YTPsGFc6eeSwiPUAtS6Z3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNE/Kw6RC2DuNwPM/QVfHyUwCNoMvrbtVem8Jq5gKps=;
 b=fCRMDAcN9Lejzkog+iGJQ4trah3Y02MK8v+CDDrg5XyPfLoI9klGO0EsCJoNCaS8qgwYwEh9qnUvPKY6A/ArCf1zD3ioQeLIjr9WXKaTT0O9m9kH613POCZMqACwd4xy48SBNJiHWqKqBTznaoMtIHzeHE346QioOVQpLJv6e0M=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 19:19:50 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 19:19:50 +0000
Subject: Re: [PATCH] drm/amd/amdkfd: Fix large framesize for kfd_smi_ev_read()
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
References: <20200520135306.11221-1-aurabindo.pillai@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <1c09eb78-f2a4-3f20-1bee-2590c35b982e@amd.com>
Date: Wed, 20 May 2020 15:19:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200520135306.11221-1-aurabindo.pillai@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 19:19:44 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5ab3269-ba1b-4a7d-2491-08d7fcf2c41f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2495884A4F136ECCD398E00292B60@SN1PR12MB2495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sodXrRH0rm+3IUmxBmGMjdbHecxwkhT/CsrZN1hAAxI3xS2fQviRn9iqHvpwfJ0Uipe7fUbP5owK4fhRJBVqY2mMYy5w8M5C1jSBUnx1r1JmrX4we6Kkx+j6lUyt6JL7aqJ8PAe4oXvEQ05PC+U3ijB0mIDF8ZcbDEluik9pe3784gjobp9AyChCe0yq5p78XkO1AJEg14Rx4+plOed7q6Adu8lU811EAZYtSHSfiTSIN9OsWKJ2niWqQoTkMB6tdZ9FbjhdPukqtQoAOLXTKUNtFwAfK2D4P9reIDSn4Wd/8eUQswirxmQmXXsINs96QmdHc5JhBx4jRrE4aNg09aDLQHzH4GJl/Fo3lnQaJ2Re+lDF9C93HCzrEcX6lRt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(2616005)(6636002)(956004)(31696002)(4326008)(52116002)(66556008)(66946007)(5660300002)(26005)(16526019)(186003)(66476007)(2906002)(31686004)(86362001)(316002)(16576012)(6666004)(8676002)(6486002)(8936002)(36756003)(478600001)(44832011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ovtHEqY1/6mysqe6bbR4FbCYi1wmavccl9jtiMZPCR0eaDp2jYNb/DJejYPbo2KrDzATWyMVme22lsP8vIeTxSqehBYoK57gYlsuptS8hK1XwjAg9Pw+Iz0DuVUxdkntS8oXwpUrJcrztIGDB0rBlPTtsJcWCA/iv+auPBeblVp5ITvKYLy/RGgOd/M/xRuI9r5IPtswHgx6aEOxSlhS9DLnu3X6j2vu5sRfqDVTjqDvTXbZF5Sh8CBSt3sfckz21wPCOTq72Li7C2G0UW3OMqhDsFgQ+DsM/h6OKN3EV/y1OZyb5jmeQDMedsHgVdqCZ4W4xinnbNBk5ORNCmN8U7rGQOxiwFO/rI+UJMm5jTY/ntsxdJNAN6a/neQb3P3/df5Ftem1NozUcc26lNLda17dgKTRmT4zJaFNApOSDsqkaqVFsQGHuPB5X4+GRf/RGYSf0MmHMsnm/h7xuyOGGC5UB8HHCbHOz766KujKfnA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ab3269-ba1b-4a7d-2491-08d7fcf2c41f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 19:19:50.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rXaw2f4HsCtbFsgD/g8GxdQKghIaNE8Ibt6DP4wEjsP8A2++0DPSrc81T5w+zmRIM+4fXaXv/Rk2RczFD2wMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2495
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amber Lin <Amber.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNS0yMCB1bSA5OjUzIGEubS4gc2NocmllYiBBdXJhYmluZG8gUGlsbGFpOgo+IFRo
ZSBidWZmZXIgYWxsb2NhdGVkIGlzIG9mIDEwMjQgYnl0ZXMuIEFsbG9jYXRlIHRoaXMgZnJvbQo+
IGhlYXAgaW5zdGVhZCBvZiBzdGFjay4KPgo+IEFsc28gcmVtb3ZlIGNoZWNrIGZvciBzdGFjayBz
aXplIHNpbmNlIHdlJ3JlIGFsbG9jYXRpbmcgZnJvbSBoZWFwCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
dXJhYmluZG8gUGlsbGFpIDxhdXJhYmluZG8ucGlsbGFpQGFtZC5jb20+Cj4gVGVzdGVkLWJ5OiBB
bWJlciBMaW4gPEFtYmVyLkxpbkBhbWQuY29tPgoKU2VlIG9uZSBjb21tZW50IGlubGluZS4gV2l0
aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXMKClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfc21pX2V2ZW50cy5jIHwgMjYgKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zbWlfZXZlbnRzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc21pX2V2ZW50cy5jCj4gaW5kZXggZjVmZDE4ZWFjZjBk
Li41YWViZTE2OWY4YzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3NtaV9ldmVudHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9z
bWlfZXZlbnRzLmMKPiBAQCAtNzcsOSArNzcsMTEgQEAgc3RhdGljIHNzaXplX3Qga2ZkX3NtaV9l
dl9yZWFkKHN0cnVjdCBmaWxlICpmaWxlcCwgY2hhciBfX3VzZXIgKnVzZXIsCj4gIAlpbnQgcmV0
Owo+ICAJc2l6ZV90IHRvX2NvcHk7Cj4gIAlzdHJ1Y3Qga2ZkX3NtaV9jbGllbnQgKmNsaWVudCA9
IGZpbGVwLT5wcml2YXRlX2RhdGE7Cj4gLQl1bnNpZ25lZCBjaGFyIGJ1ZltNQVhfS0ZJRk9fU0la
RV07Cj4gKwl1bnNpZ25lZCBjaGFyICpidWY7Cj4gIAo+IC0JQlVJTERfQlVHX09OKE1BWF9LRklG
T19TSVpFID4gMTAyNCk7Cj4gKwlidWYgPSBremFsbG9jKE1BWF9LRklGT19TSVpFICogc2l6ZW9m
KCpidWYpLCBHRlBfS0VSTkVMKTsKCmt6YWxsb2MgaXMgbm90IG5lY2Vzc2FyeSBoZXJlLCB5b3Ug
Y291bGQgdXNlIGttYWxsb2MuIFRoZSBwYXJ0IG9mIHRoYXQKYWxsb2NhdGlvbiB0aGF0IG1hdHRl
cnMgd2lsbCBiZSBvdmVyd3JpdHRlbiBieSBrZmlmb19vdXQuCgpSZWdhcmRzLArCoCBGZWxpeAoK
Cj4gKwlpZiAoIWJ1ZikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAkvKiBrZmlmb190b191
c2VyIGNhbiBzbGVlcCBzbyB3ZSBjYW4ndCB1c2Ugc3BpbmxvY2sgcHJvdGVjdGlvbiBhcm91bmQK
PiAgCSAqIGl0LiBJbnN0ZWFkLCB3ZSBrZmlmbyBvdXQgYXMgc3BpbmxvY2tlZCB0aGVuIGNvcHkg
dGhlbSB0byB0aGUgdXNlci4KPiBAQCAtODgsMTkgKzkwLDI5IEBAIHN0YXRpYyBzc2l6ZV90IGtm
ZF9zbWlfZXZfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZXAsIGNoYXIgX191c2VyICp1c2VyLAo+ICAJ
dG9fY29weSA9IGtmaWZvX2xlbigmY2xpZW50LT5maWZvKTsKPiAgCWlmICghdG9fY29weSkgewo+
ICAJCXNwaW5fdW5sb2NrKCZjbGllbnQtPmxvY2spOwo+IC0JCXJldHVybiAtRUFHQUlOOwo+ICsJ
CXJldCA9IC1FQUdBSU47Cj4gKwkJZ290byByZXRfZXJyOwo+ICAJfQo+ICAJdG9fY29weSA9IG1p
bjMoc2l6ZSwgc2l6ZW9mKGJ1ZiksIHRvX2NvcHkpOwo+ICAJcmV0ID0ga2ZpZm9fb3V0KCZjbGll
bnQtPmZpZm8sIGJ1ZiwgdG9fY29weSk7Cj4gIAlzcGluX3VubG9jaygmY2xpZW50LT5sb2NrKTsK
PiAtCWlmIChyZXQgPD0gMCkKPiAtCQlyZXR1cm4gLUVBR0FJTjsKPiArCWlmIChyZXQgPD0gMCkg
ewo+ICsJCXJldCA9IC1FQUdBSU47Cj4gKwkJZ290byByZXRfZXJyOwo+ICsJfQo+ICAKPiAgCXJl
dCA9IGNvcHlfdG9fdXNlcih1c2VyLCBidWYsIHRvX2NvcHkpOwo+IC0JaWYgKHJldCkKPiAtCQly
ZXR1cm4gLUVGQVVMVDsKPiArCWlmIChyZXQpIHsKPiArCQlyZXQgPSAtRUZBVUxUOwo+ICsJCWdv
dG8gcmV0X2VycjsKPiArCX0KPiAgCj4gKwlrZnJlZShidWYpOwo+ICAJcmV0dXJuIHRvX2NvcHk7
Cj4gKwo+ICtyZXRfZXJyOgo+ICsJa2ZyZWUoYnVmKTsKPiArCXJldHVybiByZXQ7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyBzc2l6ZV90IGtmZF9zbWlfZXZfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGVwLCBj
b25zdCBjaGFyIF9fdXNlciAqdXNlciwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
