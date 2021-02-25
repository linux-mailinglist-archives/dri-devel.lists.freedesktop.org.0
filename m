Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A2324B8F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 08:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E886EC57;
	Thu, 25 Feb 2021 07:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1350F6EC56;
 Thu, 25 Feb 2021 07:53:30 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mm21so6923138ejb.12;
 Wed, 24 Feb 2021 23:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Nn1qsWDtcLPpWWIN/4wxeCP66cVLvsefrrxwAdTC2fw=;
 b=fHLhixGV5KWWFN7Ai9VavLTvKbQQ4DTDB/45hGhyLNLxD5530uyp5QByZrkmprxI2h
 2Vcjw6f+8pxhzy0TEqP2CbzJaxHdh9ZWJDeYRn4olfXegDzu3vyjk8P76Ye90Dg402g9
 xsCJo07UZKxr8jJg5mPXwBElb7nDXNelRxdGqYThh17Q3BFvULzoS8OTWg0AAq5VBwKY
 8d3FiQzDqm5Kt7iyPnHvBhUk4zlK8+QJGGmEbEnDX14GDJ3aIK+GHZB9ui0OF2C6EDNq
 ux9sKGFsCcPEbX65ja4PMe3/oiXjR/kBi4ufd+SRdwPAPMzvxMwdRpK1770R8X5gO2cn
 2THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nn1qsWDtcLPpWWIN/4wxeCP66cVLvsefrrxwAdTC2fw=;
 b=q5eSE5I7jO8p2u2N9gLv5e2RrbYsfwfIik+R8aGHkfP4/Ltvcs9DtwtSOLQ/1oskjc
 HVJRIwrN3/bhnMK2mMe2P59DZfPqo0NgRqeUaf/lNnw1BfBIbjb2i04WdwWK0onzF/M1
 1FaY+hJq2oqjZomi1oSrIchMrg+ntfyUlZ+dY2p5DPZVodlGVGIcBQ9tpJfWComFw9Qu
 y26PckMcqMbJlJzQStm9z5sEKxIf4/ctOPI+EBkO6Ws8zwjjrFbhNXzmGcv0TeeBIxWL
 REEEnLM27arR+nUmEUQr2TaVlk1rZXStJwEY5J7QB5q3gcYWQaIQrfHmGTAV9foHZkTp
 7PUg==
X-Gm-Message-State: AOAM530u9h/VZp6jKPfDUcwl4k8/Nv/7igpUfS2xWVk/HpHukgd4eWi4
 yKvsIoJIKDah8Kmi1nuoVhIbH/e0/BCYrg==
X-Google-Smtp-Source: ABdhPJy9BP5dJEZK3JcEaPYs5oCXOGoa8gH65738etuL5htqiuKj9Dz/QWqsNrzpHNLWYcbGv7acjg==
X-Received: by 2002:a17:907:9858:: with SMTP id
 jj24mr1480336ejc.212.1614239608471; 
 Wed, 24 Feb 2021 23:53:28 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fc8:43:f4c0:95af?
 ([2a02:908:1252:fb60:fc8:43:f4c0:95af])
 by smtp.gmail.com with ESMTPSA id bn2sm2504148ejb.35.2021.02.24.23.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 23:53:27 -0800 (PST)
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
 <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
 <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
 <e0e05866-ac73-0534-f0b0-60c3fa211eee@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <85d4cf33-b8b9-23f6-7ca4-abdb98f0cd5e@gmail.com>
Date: Thu, 25 Feb 2021 08:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0e05866-ac73-0534-f0b0-60c3fa211eee@amd.com>
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

QW0gMjQuMDIuMjEgdW0gMTY6MTMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBQaW5nCgpT
b3JyeSwgSSd2ZSBiZWVuIG9uIHZhY2F0aW9uIHRoaXMgd2Vlay4KCj4KPiBBbmRyZXkKPgo+IE9u
IDIwMjEtMDItMjAgNzoxMiBhLm0uLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4KPj4gT24g
Mi8yMC8yMSAzOjM4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4KPj4+Cj4+PiBBbSAx
OC4wMi4yMSB1bSAxNzo0MSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Cj4+Pj4gT24g
Mi8xOC8yMSAxMDoxNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMTguMDIu
MjEgdW0gMTY6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Cj4+Pj4+PiBPbiAy
LzE4LzIxIDM6MDcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+Pgo+
Pj4+Pj4+IEFtIDE3LjAyLjIxIHVtIDIyOjU5IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+
Pj4+Pj4+IFByb2JsZW06IElmIHNjaGVkdWxlciBpcyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRp
bWUgc2NoZWRfZW50aXR5Cj4+Pj4+Pj4+IGlzIHJlbGVhc2VkIGFuZCBlbnRpdHkncyBqb2JfcXVl
dWUgbm90IGVtcHR5IEkgZW5jb3VudHJlZAo+Pj4+Pj4+PiBhIGhhbmcgaW4gZHJtX3NjaGVkX2Vu
dGl0eV9mbHVzaC4gVGhpcyBpcyBiZWNhdXNlIAo+Pj4+Pj4+PiBkcm1fc2NoZWRfZW50aXR5X2lz
X2lkbGUKPj4+Pj4+Pj4gbmV2ZXIgYmVjb21lcyBmYWxzZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gRml4
OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20gdGhlCj4+
Pj4+Pj4+IHNjaGVkdWxlcidzIHJ1biBxdWV1ZXMuIFRoaXMgd2lsbCBzYXRpc2Z5IAo+Pj4+Pj4+
PiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUuCj4+Pj4+Pj4+IEFsc28gd2FrZXVwIGFsbCB0aG9z
ZSBwcm9jZXNzZXMgc3R1Y2sgaW4gc2NoZWRfZW50aXR5IGZsdXNoaW5nCj4+Pj4+Pj4+IGFzIHRo
ZSBzY2hlZHVsZXIgbWFpbiB0aHJlYWQgd2hpY2ggd2FrZXMgdGhlbSB1cCBpcyBzdG9wcGVkIGJ5
IAo+Pj4+Pj4+PiBub3cuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IHYyOgo+Pj4+Pj4+PiBSZXZlcnNlIG9y
ZGVyIG9mIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IGFuZCBtYXJraW5nCj4+Pj4+Pj4+IHNf
ZW50aXR5IGFzIHN0b3BwZWQgdG8gcHJldmVudCByZWluc2VyaW9uIGJhY2sgdG8gcnEgZHVlCj4+
Pj4+Pj4+IHRvIHJhY2UuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBH
cm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAzMSAKPj4+Pj4+
Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgCj4+Pj4+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+Pj4+Pj4gaW5kZXggOTA4YjBiNS4uYzZi
Nzk0NyAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMKPj4+Pj4+Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2No
ZWRfaW5pdCk7Cj4+Pj4+Pj4+IMKgwqAgKi8KPj4+Pj4+Pj4gwqAgdm9pZCBkcm1fc2NoZWRfZmlu
aShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+Pj4+Pj4+PiDCoCB7Cj4+Pj4+Pj4+
ICvCoMKgwqAgaW50IGk7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkg
KnNfZW50aXR5Owo+Pj4+Pj4+Cj4+Pj4+Pj4gQlRXOiBQbGVhc2Ugb3JkZXIgdGhhdCBzbyB0aGF0
IGkgaXMgZGVjbGFyZWQgbGFzdC4KPj4+Pj4+Pgo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChzY2hl
ZC0+dGhyZWFkKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAga3RocmVhZF9zdG9wKHNjaGVk
LT50aHJlYWQpOwo+Pj4+Pj4+PiDCoCArwqDCoMKgIC8qIERldGFjaCBhbGwgc2NoZWRfZW50aXRl
cyBmcm9tIHRoaXMgc2NoZWR1bGVyIG9uY2UgCj4+Pj4+Pj4+IGl0J3Mgc3RvcHBlZCAqLwo+Pj4+
Pj4+PiArwqDCoMKgIGZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0g
Cj4+Pj4+Pj4+IERSTV9TQ0hFRF9QUklPUklUWV9NSU47IGktLSkgewo+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnEgPSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+
Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXJxKQo+Pj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgLyogTG9vcCB0aGlzIHdheSBiZWNhdXNlIHJxLT5sb2NrIGlzIHRha2VuIGluIAo+
Pj4+Pj4+PiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSAqLwo+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3aGls
ZSAoKHNfZW50aXR5ID0gCj4+Pj4+Pj4+IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnEtPmVu
dGl0aWVzLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHksCj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBsaXN0KSkpIHsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91
bmxvY2soJnJxLT5sb2NrKTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiBQcmV2ZW50IHJlaW5zZXJ0aW9uIGFuZCByZW1vdmUgKi8KPj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsKPj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkocnEs
IHNfZW50aXR5KTsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2so
JnNfZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+Pgo+Pj4+Pj4+IFdlbGwgdGhpcyBzcGluX3VubG9j
ay9sb2NrIGRhbmNlIGhlcmUgZG9lc24ndCBsb29rIGNvcnJlY3QgYXQgCj4+Pj4+Pj4gYWxsIG5v
dy4KPj4+Pj4+Pgo+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSW4gd2hh
dCB3YXkgPyBJdCdzIGluIHRoZSBzYW1lIHNhbWUgb3JkZXIgYXMgaW4gb3RoZXIgY2FsbCBzaXRl
cyAKPj4+Pj4+IChzZWUgZHJtX3NjaGVkX2VudGl0eV9wdXNoX2pvYiBhbmQgZHJtX3NjaGVkX2Vu
dGl0eV9mbHVzaCkuCj4+Pj4+PiBJZiBpIGp1c3QgbG9ja2VkIHJxLT5sb2NrIGFuZCBkaWQgbGlz
dF9mb3JfZWFjaF9lbnRyeV9zYWZlIHdoaWxlIAo+Pj4+Pj4gbWFudWFsbHkgZGVsZXRpbmcgZW50
aXR5LT5saXN0IGluc3RlYWQgb2YgY2FsbGluZwo+Pj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9l
bnRpdHkgdGhpcyBzdGlsbCB3b3VsZCBub3QgYmUgcG9zc2libGUgYXMgCj4+Pj4+PiB0aGUgb3Jk
ZXIgb2YgbG9jayBhY3F1aXNpdGlvbiBiZXR3ZWVuIHNfZW50aXR5LT5ycV9sb2NrCj4+Pj4+PiBh
bmQgcnEtPmxvY2sgd291bGQgYmUgcmV2ZXJzZSBjb21wYXJlZCB0byB0aGUgY2FsbCBzaXRlcyAK
Pj4+Pj4+IG1lbnRpb25lZCBhYm92ZS4KPj4+Pj4KPj4+Pj4gQWgsIG5vdyBJIHVuZGVyc3RhbmQu
IFlvdSBuZWVkIHRoaXMgYmVjYXVzZSAKPj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHko
KSB3aWxsIGdyYWIgdGhlIHJxIGxvY2sgYWdhaW4hCj4+Pj4+Cj4+Pj4+IFByb2JsZW0gaXMgbm93
IHdoYXQgcHJldmVudHMgdGhlIGVudGl0eSBmcm9tIGJlaW5nIGRlc3Ryb3llZCB3aGlsZSAKPj4+
Pj4geW91IHJlbW92ZSBpdD8KPj4+Pj4KPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4gUmlnaHQs
IHdlbGwsIHNpbmNlICh1bmZvcnR1bmF0ZWx5KSBzY2hlZF9lbnRpdHkgaXMgcGFydCBvZiAKPj4+
PiBhbWRncHVfY3R4X2VudGl0eSBhbmQgYW1kZ3B1X2N0eF9lbnRpdHkgaXMgcmVmY291bnRlZAo+
Pj4+IHRoZXJlIGlzIGEgcHJvYmxlbSBoZXJlIHRoYXQgd2UgZG9uJ3QgaW5jcmVtZW50IGFtZGdw
dV9jdHgucmVmY291bnQgCj4+Pj4gd2hlbiBhc3NpZ25pbmfCoCBzY2hlZF9lbnRpdHkKPj4+PiB0
byBuZXcgcnEgKGUuZy4gYmVmb3JlIGRybV9zY2hlZF9ycV9hZGRfZW50aXR5KSBhbmQgbm90IGRl
Y3JlbWVudCAKPj4+PiBiZWZvcmUgcmVtb3ZpbmcuIFdlIGRvIGl0IGZvcgo+Pj4+IGFtZGdwdV9j
c19wYXJzZXIuZW50aXR5IGZvciBleGFtcGxlIChpbiBhbWRncHVfY3NfcGFyc2VyX2luaXQgYW5k
IAo+Pj4+IGFtZGdwdV9jc19wYXJzZXJfZmluaSBieQo+Pj4+IGNhbGxpbmcgYW1kZ3B1X2N0eF9n
ZXQgYW5kIGFtZGdwdV9jdHhfcHV0KS4gQnV0IHRoaXMgc2VlbXMgYSBiaXQgCj4+Pj4gdHJpY2t5
IGR1ZSB0byBhbGwgdGhlIGRybV9zY2hlZF9lbnRpdHlfc2VsZWN0X3JxCj4+Pj4gbG9naWMuCj4+
Pj4KPj4+PiBBbm90aGVyLCBraW5kIG9mIGEgYmFuZCBhaWQgZml4LCB3b3VsZCBwcm9iYWJseSBi
ZSBqdXN0IGxvY2tpbmcgCj4+Pj4gYW1kZ3B1X2N0eF9tZ3IubG9jayBhcm91bmQgZHJtX3NjaGVk
X2ZpbmkKPj4+PiB3aGVuIGZpbmFsaXppbmcgdGhlIGZlbmNlIGRyaXZlciBhbmQgYXJvdW5kIGlk
ciBpdGVyYXRpb24gaW4gCj4+Pj4gYW1kZ3B1X2N0eF9tZ3JfZmluaSAod2hpY2ggc2hvdWxkIGJl
IGxvY2sgcHJvdGVjdGVkCj4+Pj4gYW55d2F5IGFzIEkgc2VlIGZyb20gb3RoZXIgaWRyIHVzYWdl
cyBpbiB0aGUgY29kZSkgLi4uIFRoaXMgc2hvdWxkIAo+Pj4+IHByZXZlbnQgdGhpcyB1c2UgYWZ0
ZXIgZnJlZS4KPj4+Cj4+PiBQdWgsIHRoYXQncyByYXRoZXIgY29tcGxpY2F0ZWQgYXMgd2VsbC4g
T2sgbGV0J3MgbG9vayBhdCBpdCBmcm9tIHRoZSAKPj4+IG90aGVyIHNpZGUgZm9yIGEgbW9tZW50
Lgo+Pj4KPj4+IFdoeSBkbyB3ZSBoYXZlIHRvIHJlbW92ZSB0aGUgZW50aXRpZXMgZnJvbSB0aGUg
cnEgaW4gdGhlIGZpcnN0IHBsYWNlPwo+Pj4KPj4+IFdvdWxkbid0IGl0IGJlIHN1ZmZpY2llbnQg
dG8ganVzdCBzZXQgYWxsIG9mIHRoZW0gdG8gc3RvcHBlZD8KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+
Cj4+Cj4+IEFuZCBhZGRpbmcgaXQgYXMgYW5vdGhlcsKgIGNvbmRpdGlvbiBpbiBkcm1fc2NoZWRf
ZW50aXR5X2lzX2lkbGUgPwoKWWVzLCBJIHRoaW5rIHRoYXQgc2hvdWxkIHdvcmsuCgpDaHJpc3Rp
YW4uCgoKPj4KPj4gQW5kcmV5Cj4+Cj4+Cj4+Pgo+Pj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pgo+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEFuZHJleQo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+
Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+
bG9jayk7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgfQo+
Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0dWNrIGluIGRy
bV9zY2hlZF9lbnRpdHlfZmx1c2ggZm9yIAo+Pj4+Pj4+PiB0aGlzIHNjaGVkdWxlciAqLwo+Pj4+
Pj4+PiArwqDCoMKgIHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4+Pj4+Pj4+
ICsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCAvKiBDb25maXJtIG5vIHdvcmsgbGVmdCBiZWhpbmQgYWNj
ZXNzaW5nIGRldmljZSAKPj4+Pj4+Pj4gc3RydWN0dXJlcyAqLwo+Pj4+Pj4+PiBjYW5jZWxfZGVs
YXllZF93b3JrX3N5bmMoJnNjaGVkLT53b3JrX3Rkcik7Cj4+Pj4+Pj4KPj4+Pj4KPj4+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
