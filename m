Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97131EB5E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0CB6EA36;
	Thu, 18 Feb 2021 15:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A896EA31;
 Thu, 18 Feb 2021 15:15:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u20so5490587ejb.7;
 Thu, 18 Feb 2021 07:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=eC7DaULBaf5gMpNuy9W2QlmRoRShLO2gbV2pgSsfwXs=;
 b=BCKVE2b85NmLnRqnm71ZN85FeBQcjUDNTeyvnjcCQCswsMQN4ae4AiCQWvXcIG786W
 eZ7hAQH8EoLouhxFEObklkXw8QrTt5N0b9IO5ZDjHkaE6VGxFpkiEEGX4iCuIosjP2fX
 ruv8Ecsuew3HF7kWCf04Q/RtuTCYmDCDMZ5WpHOuX8MGGXRKFOMDsByh7lYOCC7ql0mu
 IqUYU+HuUUWoybvHbUuHznNGxVD28jNEUj7QxShoQ6tVfSRbSmdP9MAGbsCxv4A1UNUi
 4rBxD+WJXKv8QSfjt5ArztMCbyV2vOes00oPHFyAPBxrFe04a+2AmuPuuBa6YQhbXGD4
 tLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eC7DaULBaf5gMpNuy9W2QlmRoRShLO2gbV2pgSsfwXs=;
 b=ryonDM7wesuoa5tq2dXegToyVlFwU9qVYTUmy9CC0jGTmCHEh6SH8XdXXYesWiwmUc
 hK+sFmz3QqZ0/BNeeoqynpNhbgNd+4CGUirZVCIFDxQeN/+9GZY6lxltemwdpIbaB0Ew
 zttzDQOsRMvg6K3PnuZUiF0Aa2UqmwU/aTGr9lAsnW9GQeJ+me/RD0R5LNKDeNuvPzmD
 ETCOlwXfAyx7ZseVnWXmNn6L1a55XflvmslOqEtJ8nG9LmRpbtvVyQWCYO4IyBtkcrap
 KrTTe2DIMcrDfkefHoRTsp8Vn/U+8mdRPvVNdHMm+EkVkK6EvrC3deBTnQSRCl7EB1+G
 p0zQ==
X-Gm-Message-State: AOAM532xSJ25xJ10TgHeauTMR7tmIhXcFGUABLarKTBB/JQNbD6JM0Uu
 ptPbvqMonojPkNPY1rOjGAXdAWHXjwQwOg==
X-Google-Smtp-Source: ABdhPJyn6Fx8rKTgkgLNzHFc8OY6bGK3fSZiCy7e5R6jx2uoQN+I6ZxfGjiTdHOfE6YIhquZlFxn1Q==
X-Received: by 2002:a17:906:1cc2:: with SMTP id
 i2mr4648608ejh.320.1613661355126; 
 Thu, 18 Feb 2021 07:15:55 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:cf49:9fdd:8d2e:b941?
 ([2a02:908:1252:fb60:cf49:9fdd:8d2e:b941])
 by smtp.gmail.com with ESMTPSA id k4sm453575ejv.73.2021.02.18.07.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 07:15:54 -0800 (PST)
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
Date: Thu, 18 Feb 2021 16:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
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

QW0gMTguMDIuMjEgdW0gMTY6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDIv
MTgvMjEgMzowNyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4KPj4KPj4gQW0gMTcuMDIu
MjEgdW0gMjI6NTkgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+IFByb2JsZW06IElmIHNj
aGVkdWxlciBpcyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50aXR5Cj4+PiBp
cyByZWxlYXNlZCBhbmQgZW50aXR5J3Mgam9iX3F1ZXVlIG5vdCBlbXB0eSBJIGVuY291bnRyZWQK
Pj4+IGEgaGFuZyBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoLiBUaGlzIGlzIGJlY2F1c2UgCj4+
PiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+IG5ldmVyIGJlY29tZXMgZmFsc2UuCj4+Pgo+
Pj4gRml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20g
dGhlCj4+PiBzY2hlZHVsZXIncyBydW4gcXVldWVzLiBUaGlzIHdpbGwgc2F0aXNmeSBkcm1fc2No
ZWRfZW50aXR5X2lzX2lkbGUuCj4+PiBBbHNvIHdha2V1cCBhbGwgdGhvc2UgcHJvY2Vzc2VzIHN0
dWNrIGluIHNjaGVkX2VudGl0eSBmbHVzaGluZwo+Pj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRo
cmVhZCB3aGljaCB3YWtlcyB0aGVtIHVwIGlzIHN0b3BwZWQgYnkgbm93Lgo+Pj4KPj4+IHYyOgo+
Pj4gUmV2ZXJzZSBvcmRlciBvZiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSBhbmQgbWFya2lu
Zwo+Pj4gc19lbnRpdHkgYXMgc3RvcHBlZCB0byBwcmV2ZW50IHJlaW5zZXJpb24gYmFjayB0byBy
cSBkdWUKPj4+IHRvIHJhY2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMzEgCj4+PiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAK
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+IGluZGV4IDkw
OGIwYjUuLmM2Yjc5NDcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMKPj4+IEBAIC04OTcsOSArODk3LDQwIEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2lu
aXQpOwo+Pj4gwqDCoCAqLwo+Pj4gwqAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dw
dV9zY2hlZHVsZXIgKnNjaGVkKQo+Pj4gwqAgewo+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+ICvCoMKg
wqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKnNfZW50aXR5Owo+Pgo+PiBCVFc6IFBsZWFzZSBv
cmRlciB0aGF0IHNvIHRoYXQgaSBpcyBkZWNsYXJlZCBsYXN0Lgo+Pgo+Pj4gwqDCoMKgwqDCoCBp
ZiAoc2NoZWQtPnRocmVhZCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2No
ZWQtPnRocmVhZCk7Cj4+PiDCoCArwqDCoMKgIC8qIERldGFjaCBhbGwgc2NoZWRfZW50aXRlcyBm
cm9tIHRoaXMgc2NoZWR1bGVyIG9uY2UgaXQncyAKPj4+IHN0b3BwZWQgKi8KPj4+ICvCoMKgwqAg
Zm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSAKPj4+IERSTV9TQ0hF
RF9QUklPUklUWV9NSU47IGktLSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2No
ZWRfcnEgKnJxID0gJnNjaGVkLT5zY2hlZF9ycVtpXTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoIXJxKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiArCj4+
PiArwqDCoMKgwqDCoMKgwqAgLyogTG9vcCB0aGlzIHdheSBiZWNhdXNlIHJxLT5sb2NrIGlzIHRh
a2VuIGluIAo+Pj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkgKi8KPj4+ICvCoMKgwqDCoMKg
wqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB3aGlsZSAoKHNf
ZW50aXR5ID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZycS0+ZW50aXRpZXMsCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4gKwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogUHJldmVudCByZWluc2VydGlvbiBhbmQgcmVtb3ZlICov
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnNfZW50aXR5LT5ycV9sb2Nr
KTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJx
LCBzX2VudGl0eSk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmc19l
bnRpdHktPnJxX2xvY2spOwo+Pgo+PiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBo
ZXJlIGRvZXNuJ3QgbG9vayBjb3JyZWN0IGF0IGFsbCBub3cuCj4+Cj4+IENocmlzdGlhbi4KPgo+
Cj4gSW4gd2hhdCB3YXkgPyBJdCdzIGluIHRoZSBzYW1lIHNhbWUgb3JkZXIgYXMgaW4gb3RoZXIg
Y2FsbCBzaXRlcyAoc2VlIAo+IGRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2IgYW5kIGRybV9zY2hl
ZF9lbnRpdHlfZmx1c2gpLgo+IElmIGkganVzdCBsb2NrZWQgcnEtPmxvY2sgYW5kIGRpZCBsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUgd2hpbGUgCj4gbWFudWFsbHkgZGVsZXRpbmcgZW50aXR5LT5s
aXN0IGluc3RlYWQgb2YgY2FsbGluZwo+IGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IHRoaXMg
c3RpbGwgd291bGQgbm90IGJlIHBvc3NpYmxlIGFzIHRoZSAKPiBvcmRlciBvZiBsb2NrIGFjcXVp
c2l0aW9uIGJldHdlZW7CoCBzX2VudGl0eS0+cnFfbG9jawo+IGFuZCBycS0+bG9jayB3b3VsZCBi
ZSByZXZlcnNlIGNvbXBhcmVkIHRvIHRoZSBjYWxsIHNpdGVzIG1lbnRpb25lZCBhYm92ZS4KCkFo
LCBub3cgSSB1bmRlcnN0YW5kLiBZb3UgbmVlZCB0aGlzIGJlY2F1c2UgZHJtX3NjaGVkX3JxX3Jl
bW92ZV9lbnRpdHkoKSAKd2lsbCBncmFiIHRoZSBycSBsb2NrIGFnYWluIQoKUHJvYmxlbSBpcyBu
b3cgd2hhdCBwcmV2ZW50cyB0aGUgZW50aXR5IGZyb20gYmVpbmcgZGVzdHJveWVkIHdoaWxlIHlv
dSAKcmVtb3ZlIGl0PwoKQ2hyaXN0aWFuLgoKPgo+IEFuZHJleQo+Cj4KPgo+Pgo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+
PiArCj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0
dWNrIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggZm9yIHRoaXMgCj4+PiBzY2hlZHVsZXIgKi8K
Pj4+ICvCoMKgwqAgd2FrZV91cF9hbGwoJnNjaGVkLT5qb2Jfc2NoZWR1bGVkKTsKPj4+ICsKPj4+
IMKgwqDCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZp
Y2Ugc3RydWN0dXJlcyAqLwo+Pj4gwqDCoMKgwqDCoCBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMo
JnNjaGVkLT53b3JrX3Rkcik7Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
