Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172833C600
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 19:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE1889E5A;
	Mon, 15 Mar 2021 18:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ADA89E5A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 18:47:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w18so18585927edc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Txj7gHjTYycxVux2EogxgTEto/urtqkWjs/pW1ZL0k4=;
 b=q1Eg/poa4h+1+BcSzmGauFm+2K9dUU4+k5YRoyV+kTmQnRSgf5gUmNopJa50C/LUJ1
 7WSrFG600UmmLw/zaCJfTANgI33faMgg0YnLKcH0oJg6VqURVAMRMZJu4/HQ7EV/E6pR
 CQ0MPrmBzn525I2QjPMjEXCS46zb84zU6ZvqhVg7rq+shCeQesua+SiT+AaT8AaQHXSa
 uqmE+DgeB2UE4RS9C1zYndizLRBk3ahXkjd/ExYl8BcZa8PATADpcfcCqaC32Vbx5on0
 H2eYnCmAphWgueR1ekbvz4FIrM116Et4K95sy3ccpekCn1UBHNKPMWLflr2KPCIhWfBV
 fJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Txj7gHjTYycxVux2EogxgTEto/urtqkWjs/pW1ZL0k4=;
 b=XfWmPrXSGH0eAftcv5TsHhIk3oTv1eVerhYoggpAIK8msZNj6ZnNbihRTsniZvSJCP
 PMziR/K/EOtlc8O2ME9QvJ+8WMQ2NAEB54aUKMfRYq1d623FzLg0/pYw7qd/cbXlO6Rn
 1T9+RKseAidHjHVLfAfra9/pAAjpWKrkppJc61Cl2YVLO9X+luo8axCOrUd0lL61a8Ki
 DGBvvb32HuM7WKizxepv5ZUuUSLNuHexaQsuVbVOZfDSG+OKoTXLe/0hm4l8QOtKI6k8
 9LftfLWVIz0pCs1GAKNE5hHT8EO3Pum6XyNI7OmrTLOgKrk0EOqBTMHYX3KmnSv+t4H/
 gBxA==
X-Gm-Message-State: AOAM533tqhITL8xji5tvslTAGlj/XANTyejRf2kZ0V6fbbPdhHfnCEzJ
 Gr1CRX+43KoZ/vl3HuEjZb78c00pG7g=
X-Google-Smtp-Source: ABdhPJzSr6xaSWNkhw9+psHc1IG+M6R8pPATT9tmn/r60o+J/oH3aGtzG8CKx7qjVw/Vwt9h3lvXvw==
X-Received: by 2002:aa7:c346:: with SMTP id j6mr31624774edr.386.1615834022312; 
 Mon, 15 Mar 2021 11:47:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:dd5e:327:8807:376f?
 ([2a02:908:1252:fb60:dd5e:327:8807:376f])
 by smtp.gmail.com with ESMTPSA id p24sm8705563edt.5.2021.03.15.11.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:47:01 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
 <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
 <cbe846bc-4b1f-fc6c-52a5-b84505a5b748@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <daafc050-33ca-90b9-0caa-c59397707291@gmail.com>
Date: Mon, 15 Mar 2021 19:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cbe846bc-4b1f-fc6c-52a5-b84505a5b748@shipmail.org>
Content-Language: en-US
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

CgpBbSAxNS4wMy4yMSB1bSAxODowOCBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6
Cj4KPiBPbiAzLzE1LzIxIDExOjI2IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pgo+Pgo+
PiBBbSAxMy4wMy4yMSB1bSAxOToyOSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6
Cj4+PiBIaSwgQ2hyaXN0aWFuCj4+Pgo+Pj4gT24gMy8xMi8yMSAxMDozOCBBTSwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4+PiBXZSBzZWVtIHRvIGhhdmUgc29tZSBtb3JlIGRyaXZlciBidWdz
IHRoYW4gdGhvdWdodC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBpbmNsdWRlL2RybS90
dG0vdHRtX2JvX2FwaS5oIHwgNiArKysrLS0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fYXBpLmggCj4+Pj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5o
Cj4+Pj4gaW5kZXggNGZiNTIzZGZhYjMyLi5kZjlmZTU5NmU3YzUgMTAwNjQ0Cj4+Pj4gLS0tIGEv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90
dG1fYm9fYXBpLmgKPj4+PiBAQCAtNjAzLDkgKzYwMywxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
dHRtX2JvX3BpbihzdHJ1Y3QgCj4+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4+IMKgIHN0
YXRpYyBpbmxpbmUgdm9pZCB0dG1fYm9fdW5waW4oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bykKPj4+PiDCoCB7Cj4+Pj4gwqDCoMKgwqDCoCBkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFz
ZS5yZXN2KTsKPj4+PiAtwqDCoMKgIFdBUk5fT05fT05DRSghYm8tPnBpbl9jb3VudCk7Cj4+Pj4g
wqDCoMKgwqDCoCBXQVJOX09OX09OQ0UoIWtyZWZfcmVhZCgmYm8tPmtyZWYpKTsKPj4+PiAtwqDC
oMKgIC0tYm8tPnBpbl9jb3VudDsKPj4+PiArwqDCoMKgIGlmIChiby0+cGluX2NvdW50KQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAtLWJvLT5waW5fY291bnQ7Cj4+Pj4gK8KgwqDCoCBlbHNlCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIFdBUk5fT05fT05DRSh0cnVlKTsKPj4+PiDCoCB9Cj4+Pj4gwqAgwqAg
aW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCj4+Pgo+Pj4g
U2luY2UgSSBub3cgaGF2ZSBiZWVuIHN0YXJpbmcgZm9yIGhhbGYgYSB5ZWFyIGF0IHRoZSBjb2Rl
IG9mIHRoZSAKPj4+IGRyaXZlciB0aGF0IG1hZGUgcGlubmluZyBhbiBhcnQsIEkgaGF2ZSBhIGNv
dXBsZSBvZiBzdWdnZXN0aW9ucyAKPj4+IGhlcmUsIENvdWxkIHdlIHVzZSBhbiBhdG9taWMgZm9y
IHBpbl9jb3VudCwgYWxsb3dpbmcgdW5sb2NrZWQgCj4+PiB1bnBpbm5pbmcgYnV0IHJlcXVpcmUg
dGhlIGxvY2sgb25seSBmb3IgcGluX2NvdW50IHRyYW5zaXRpb24gMC0+MSwgCj4+PiAoYnV0IHVu
bG9ja2VkIGZvciBwaW5faWZfYWxyZWFkeV9waW5uZWQpLiBJbiBwYXJ0aWN1bGFyIEkgdGhpbmsg
Cj4+PiB2bXdnZnggd291bGQgYmVuZWZpdCBmcm9tIHVubG9ja2VkIHVucGlucy4gQWxzbyBpZiB0
aGUgYXRvbWljIHdlcmUgYSAKPj4+IHJlZmNvdW50X3QsIHRoYXQgd291bGQgcHJvYmFibHkgZ2l2
ZSB5b3UgdGhlIGFib3ZlIGJlaGF2aW91cj8KPj4KPj4gTm9wZSwgSSd2ZSBjb25zaWRlcmVkIHRo
aXMgYXMgd2VsbCB3aGlsZSBtb3ZpbmcgdGhlIHBpbiBjb3VudCBpbnRvIFRUTS4KPj4KPj4gVGhl
IHByb2JsZW0gaXMgdGhhdCB5b3Ugbm90IG9ubHkgbmVlZCB0aGUgQk8gcmVzZXJ2ZWQgZm9yIDAt
PjEgCj4+IHRyYW5zaXRpb25zLCBidXQgYWxzbyBmb3IgMS0+MCB0cmFuc2l0aW9ucyB0byBtb3Zl
IHRoZSBCTyBvbiB0aGUgTFJVIAo+PiBjb3JyZWN0bHkuCj4KPiBBaCwgYW5kIHRoZXJlIGlzIG5v
IHdheSB0byBoYXZlIHVzIGtub3cgdGhlIGNvcnJlY3QgTFJVIGxpc3Qgd2l0aG91dCAKPiByZXNl
cnZhdGlvbj8KCk5vdCByZWFsbHksIHRoZXJlIGlzIGFsd2F5cyB0aGUgY2hhbmNlIHRoYXQgQ1BV
IEEgaXMgcmVkdWNpbmcgdGhlIGNvdW50IApmcm9tIDEtPjAgd2hpbGUgQ1BVIEIgaXMgZG9pbmcg
MC0+MSBhbmQgeW91IGVuZCB1cCB3aXRoIGEgTFJVIHN0YXR1cyAKd2hpY2ggZG9lc24ndCBtYXRj
aCB0aGUgcGluIGNvdW50LgoKV2UgY291bGQgdHJ5IHRvIGRvIHNvbWV0aGluZyBsaWtlIGEgbG9v
cCB1cGRhdGluZyB0aGUgTFJVIHN0YXR1cyB1bnRpbCAKaXQgbWF0Y2hlcyB0aGUgcGluIGNvdW50
LCBidXQgdGhlIGltcGxpY2F0aW9ucyBvZiB0aGF0IGFyZSB1c3VhbGx5IApyZWFsbHkgbmFzdHku
CgpDaHJpc3RpYW4uCgo+Cj4gL1Rob21hcwo+Cj4KPj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4KPj4+
IC9UaG9tYXMKPj4+Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
