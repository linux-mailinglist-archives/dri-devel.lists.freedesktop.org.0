Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D68325E8F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 09:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F516EDA7;
	Fri, 26 Feb 2021 08:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31FE6EDA7;
 Fri, 26 Feb 2021 08:04:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b21so2233449eja.4;
 Fri, 26 Feb 2021 00:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dsQshbzk7N/0KpgRndohVTTpDyq5z/BpMdhbYy2zSUg=;
 b=WUnO+rhNpsetuIVZ9Z0aSYbPX+hO8bX3QtOOG0OEK+2EOxIdcX/a/smtVHKBJzCu7O
 OfoAqI0bMQq6FhNmNB5p890Zz4/5zlEzE25InURxgb0Rcy5RY3A7ice3cgUYxwIquJY6
 Lcl+ohZyQUauUnuLKcqXnnyW8oak+zDKy8PpZkUxgY16Wkp2NGOzW5c3ye/fQrbWu4eu
 EyI+BLT4yAVq7Hhh0nxrnbS/iq++9cAyZh4HDfk1DKANsEjdv3gOp1XQjJiDfqa+QHj9
 TvkvCPC9qyqREzePSD3v/PMHjawsnVSWAEZJj5uY8m3l2Pi0gQubcJsgT+W1j5eAPLRq
 LS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dsQshbzk7N/0KpgRndohVTTpDyq5z/BpMdhbYy2zSUg=;
 b=YqzOj5f07PcRRu1aoA43eeVsYhqvPFQp6q+Oe9PJB1JAQB2iogjnEbx2BV+K2Sx0td
 +jJ6xdgmKt7mHHeOZzHfNFWPTCGZsO5quCVBci+ovPzaUbA+PsCk6OF5CcHSFIg00i4R
 blqZSZYJwemFcEcwqZ9a5ZA4B0ZHxR8LpD1N75D/9zAWCY7sVEmwll9dGJnExZ3CD9PQ
 TFEqeMB52SirKyr6b/K5Ec3V8CNaP7Ak4vWp1MXxftV814Rzp4485MAUKgQDhkByw8V6
 KiWutLaA+QSNTR3VKSL94OkzOnVS3TodJb0/11Oz+Bp+BVYqjPE4ImjT4JH3Q6TrjAqx
 LGsA==
X-Gm-Message-State: AOAM532EksQD7w5GJ8t/VAMKihk5JVo4C2GMNKnYbWeRuM7yB+8hQMrD
 x30sU4VOv//DA2sOvHIU4G97DAul91UskQ==
X-Google-Smtp-Source: ABdhPJzBlG6IZYDfWuh6Mqni6xcA3yn6SXbgIJtHr6cmmyfwELNyCg5ZBprxwW8+Iu/Wb54AqepBnA==
X-Received: by 2002:a17:906:ca58:: with SMTP id
 jx24mr2017019ejb.482.1614326656545; 
 Fri, 26 Feb 2021 00:04:16 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:bcf6:4057:c09:be71?
 ([2a02:908:1252:fb60:bcf6:4057:c09:be71])
 by smtp.gmail.com with ESMTPSA id l7sm5059979edv.50.2021.02.26.00.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 00:04:15 -0800 (PST)
Subject: Re: [PATCH v3] drm/scheduler: Fix hang when sched_entity released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20210225213736.12352-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <44555a52-022b-07ab-989f-cb81fdff8440@gmail.com>
Date: Fri, 26 Feb 2021 09:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225213736.12352-1-andrey.grodzovsky@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyNS4wMi4yMSB1bSAyMjozNyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+IFByb2Js
ZW06IElmIHNjaGVkdWxlciBpcyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50
aXR5Cj4gaXMgcmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBlbmNv
dW50cmVkCj4gYSBoYW5nIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2guIFRoaXMgaXMgYmVjYXVz
ZSBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPiBuZXZlciBiZWNvbWVzIGZhbHNlLgo+Cj4gRml4
OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20gdGhlCj4g
c2NoZWR1bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlzZnkgZHJtX3NjaGVkX2VudGl0
eV9pc19pZGxlLgo+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1Y2sgaW4gc2No
ZWRfZW50aXR5IGZsdXNoaW5nCj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRocmVhZCB3aGljaCB3
YWtlcyB0aGVtIHVwIGlzIHN0b3BwZWQgYnkgbm93Lgo+Cj4gdjI6Cj4gUmV2ZXJzZSBvcmRlciBv
ZiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSBhbmQgbWFya2luZwo+IHNfZW50aXR5IGFzIHN0
b3BwZWQgdG8gcHJldmVudCByZWluc2VyaW9uIGJhY2sgdG8gcnEgZHVlCj4gdG8gcmFjZS4KPgo+
IHYzOgo+IERyb3AgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHksIG9ubHkgbW9kaWZ5IGVudGl0
eS0+c3RvcHBlZAo+IGFuZCBjaGVjayBmb3IgaXQgaW4gZHJtX3NjaGVkX2VudGl0eV9pc19pZGxl
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5
LmMgfCAgMyArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jICAg
fCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZW50aXR5LmMKPiBpbmRleCA5MmQ5NjViNjI5YzYuLjY4YjEwODEzMTI5YSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+IEBAIC0xMTYsNyArMTE2LDgg
QEAgc3RhdGljIGJvb2wgZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlKHN0cnVjdCBkcm1fc2NoZWRf
ZW50aXR5ICplbnRpdHkpCj4gICAJcm1iKCk7IC8qIGZvciBsaXN0X2VtcHR5IHRvIHdvcmsgd2l0
aG91dCBsb2NrICovCj4gICAKPiAgIAlpZiAobGlzdF9lbXB0eSgmZW50aXR5LT5saXN0KSB8fAo+
IC0JICAgIHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSA9PSAwKQo+ICsJICAg
IHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSA9PSAwIHx8Cj4gKwkgICAgZW50
aXR5LT5zdG9wcGVkKQo+ICAgCQlyZXR1cm4gdHJ1ZTsKPiAgIAo+ICAgCXJldHVybiBmYWxzZTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IDkwOGIwYjU2MDMy
ZC4uYjUwZmFiNDcyNzM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKPiBAQCAtODk3LDkgKzg5NywzMiBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9pbml0KTsK
PiAgICAqLwo+ICAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIg
KnNjaGVkKQo+ICAgewo+ICsJaW50IGk7Cj4gKwlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqc19l
bnRpdHk7CgpQbGVhc2UgZGVjbGFyZSBpIGxhc3QgYW5kIGhhdmUgYW4gZW1wdHkgbGluZSBiZXR3
ZWVuIGRlY2xhcmF0aW9uIGFuZCBjb2RlLgoKV2l0aCB0aGF0IG5pdCBwaWNrIGZpeGVkIHRoZSBw
YXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4uIEdvaW5nIHRvIHB1c2ggaXQgdG8gZHJtLW1pc2MtbmV4dC4KCkNocmlzdGlhbi4K
Cj4gICAJaWYgKHNjaGVkLT50aHJlYWQpCj4gICAJCWt0aHJlYWRfc3RvcChzY2hlZC0+dGhyZWFk
KTsKPiAgIAo+ICsJZm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSBE
Uk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsKPiArCQlzdHJ1Y3QgZHJtX3NjaGVkX3JxICpy
cSA9ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4gKwo+ICsJCWlmICghcnEpCj4gKwkJCWNvbnRpbnVl
Owo+ICsKPiArCQlzcGluX2xvY2soJnJxLT5sb2NrKTsKPiArCQlsaXN0X2Zvcl9lYWNoX2VudHJ5
KHNfZW50aXR5LCAmcnEtPmVudGl0aWVzLCBsaXN0KQo+ICsJCQkvKgo+ICsJCQkgKiBQcmV2ZW50
cyByZWluc2VydGlvbiBhbmQgbWFya3Mgam9iX3F1ZXVlIGFzIGlkbGUsCj4gKwkJCSAqIGl0IHdp
bGwgcmVtb3ZlZCBmcm9tIHJxIGluIGRybV9zY2hlZF9lbnRpdHlfZmluaQo+ICsJCQkgKiBldmVu
dHVhbGx5Cj4gKwkJCSAqLwo+ICsJCQlzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7Cj4gKwkJc3Bp
bl91bmxvY2soJnJxLT5sb2NrKTsKPiArCj4gKwl9Cj4gKwo+ICsJLyogV2FrZXVwIGV2ZXJ5b25l
IHN0dWNrIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggZm9yIHRoaXMgc2NoZWR1bGVyICovCj4g
Kwl3YWtlX3VwX2FsbCgmc2NoZWQtPmpvYl9zY2hlZHVsZWQpOwo+ICsKPiAgIAkvKiBDb25maXJt
IG5vIHdvcmsgbGVmdCBiZWhpbmQgYWNjZXNzaW5nIGRldmljZSBzdHJ1Y3R1cmVzICovCj4gICAJ
Y2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZzY2hlZC0+d29ya190ZHIpOwo+ICAgCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
