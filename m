Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32EF3255BD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 19:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA006ED1A;
	Thu, 25 Feb 2021 18:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489656ED13;
 Thu, 25 Feb 2021 18:42:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h19so8198483edb.9;
 Thu, 25 Feb 2021 10:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=bgNLQxrgh43387Fd1DKbBmc2jzjsqIYquc7P1KLR+Fc=;
 b=c8AqEflIJRG3ZMX9PpadvBLi5YtFuF195erFcjcbMRQGOudzH9SMqeWS/87ek3Dl0S
 /1TyIdJeif7vANWlZL9FHqzDf973cmogSjdYzK3qssEVUYhomqm2VXjXlvUmEzxkVW+D
 m/feRRtAK45EPbGg/2CAgZ8JOlzeBq4PpQxzTYVw5FhFkRGwCJMOR8Kqo8LR6qnzCTXI
 wVMbKr2VmzafKnDrQNseDJpEW+X+/rmyhRP1LC7LXpYtq1vxmDBr6xU0rTqYKBGL1WWy
 ++v1mRpZW+Lvi62pHlvb6l3EIRVEkrjgH1tuRvMiemTXdOU+lKFxzUqDIEgHICOnhJ7O
 Awhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bgNLQxrgh43387Fd1DKbBmc2jzjsqIYquc7P1KLR+Fc=;
 b=FvZcjyVahHrRtgDdvWpEeBLuAkW337h3agGxINdMBNTRBx5Hq3FLn5AfCAPZMJU0oL
 mUOGH1yUUifgW+1Un3fT1Gy/ITyyRAADVsqnQ4gDqXvSr0NQBOPWEcy9e9Oo4Rd5q73+
 +ftSChDMXPsHPvaxdHrSWLo6MPCGRqpf2VQ1K4oibT/HJcR+jWYuM0OFrHREXh6CpIeB
 owZ7PUOKaZNoTFcr2kcnkrZkcBfzXXQZQYoYiDNVgWcD6Vb/g2q5GD8VFeznm+yqUXbo
 H0l8mhIo56d0Fam5VKS2azr8WKhc7QTuCebMQsoTWQEJFU06GEn+hcwwHwVI8VG/LQz9
 w5XQ==
X-Gm-Message-State: AOAM533ouHHrOvoDh7v31ZmN3+PYcdFcG/j2XPC51g4/LzqSdHwhij8q
 eWxEjAI3npuowNs4hDNjGvau6ORg4f+mXA==
X-Google-Smtp-Source: ABdhPJynpMA2Zvu8Jnsvv9daQUWWkjDMUg83JAXGDOrZ1dSBzQVXwGejaJRXgGTnndDFxZ7pGR4z8g==
X-Received: by 2002:a05:6402:1b1a:: with SMTP id
 by26mr4459048edb.3.1614278563845; 
 Thu, 25 Feb 2021 10:42:43 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:7944:296:6ad0:31ef?
 ([2a02:908:1252:fb60:7944:296:6ad0:31ef])
 by smtp.gmail.com with ESMTPSA id lu26sm1834968ejb.33.2021.02.25.10.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 10:42:43 -0800 (PST)
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
 <85d4cf33-b8b9-23f6-7ca4-abdb98f0cd5e@gmail.com>
 <c6e9ed57-fb7f-8dec-ce2a-187d5bd7b1a9@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aea77d09-57f3-88ce-606a-933eacafca64@gmail.com>
Date: Thu, 25 Feb 2021 19:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c6e9ed57-fb7f-8dec-ce2a-187d5bd7b1a9@amd.com>
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

CgpBbSAyNS4wMi4yMSB1bSAxNzowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Cj4gT24g
MjAyMS0wMi0yNSAyOjUzIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDI0LjAy
LjIxIHVtIDE2OjEzIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+PiBQaW5nCj4+Cj4+IFNv
cnJ5LCBJJ3ZlIGJlZW4gb24gdmFjYXRpb24gdGhpcyB3ZWVrLgo+Pgo+Pj4KPj4+IEFuZHJleQo+
Pj4KPj4+IE9uIDIwMjEtMDItMjAgNzoxMiBhLm0uLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToK
Pj4+Pgo+Pj4+IE9uIDIvMjAvMjEgMzozOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+
Pj4KPj4+Pj4KPj4+Pj4gQW0gMTguMDIuMjEgdW0gMTc6NDEgc2NocmllYiBBbmRyZXkgR3JvZHpv
dnNreToKPj4+Pj4+Cj4+Pj4+PiBPbiAyLzE4LzIxIDEwOjE1IEFNLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+Pj4+Pj4+IEFtIDE4LjAyLjIxIHVtIDE2OjA1IHNjaHJpZWIgQW5kcmV5IEdyb2R6
b3Zza3k6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIvMTgvMjEgMzowNyBBTSwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQW0gMTcuMDIuMjEgdW0g
MjI6NTkgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+PiBQcm9ibGVtOiBJZiBz
Y2hlZHVsZXIgaXMgYWxyZWFkeSBzdG9wcGVkIGJ5IHRoZSB0aW1lIAo+Pj4+Pj4+Pj4+IHNjaGVk
X2VudGl0eQo+Pj4+Pj4+Pj4+IGlzIHJlbGVhc2VkIGFuZCBlbnRpdHkncyBqb2JfcXVldWUgbm90
IGVtcHR5IEkgZW5jb3VudHJlZAo+Pj4+Pj4+Pj4+IGEgaGFuZyBpbiBkcm1fc2NoZWRfZW50aXR5
X2ZsdXNoLiBUaGlzIGlzIGJlY2F1c2UgCj4+Pj4+Pj4+Pj4gZHJtX3NjaGVkX2VudGl0eV9pc19p
ZGxlCj4+Pj4+Pj4+Pj4gbmV2ZXIgYmVjb21lcyBmYWxzZS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
IEZpeDogSW4gZHJtX3NjaGVkX2ZpbmkgZGV0YWNoIGFsbCBzY2hlZF9lbnRpdGllcyBmcm9tIHRo
ZQo+Pj4+Pj4+Pj4+IHNjaGVkdWxlcidzIHJ1biBxdWV1ZXMuIFRoaXMgd2lsbCBzYXRpc2Z5IAo+
Pj4+Pj4+Pj4+IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPj4+Pj4+Pj4+PiBBbHNvIHdha2V1
cCBhbGwgdGhvc2UgcHJvY2Vzc2VzIHN0dWNrIGluIHNjaGVkX2VudGl0eSBmbHVzaGluZwo+Pj4+
Pj4+Pj4+IGFzIHRoZSBzY2hlZHVsZXIgbWFpbiB0aHJlYWQgd2hpY2ggd2FrZXMgdGhlbSB1cCBp
cyBzdG9wcGVkIAo+Pj4+Pj4+Pj4+IGJ5IG5vdy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IHYyOgo+
Pj4+Pj4+Pj4+IFJldmVyc2Ugb3JkZXIgb2YgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkgYW5k
IG1hcmtpbmcKPj4+Pj4+Pj4+PiBzX2VudGl0eSBhcyBzdG9wcGVkIHRvIHByZXZlbnQgcmVpbnNl
cmlvbiBiYWNrIHRvIHJxIGR1ZQo+Pj4+Pj4+Pj4+IHRvIHJhY2UuCj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KPj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyB8IDMxIAo+Pj4+Pj4+Pj4+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+Pj4+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jIAo+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9tYWluLmMKPj4+Pj4+Pj4+PiBpbmRleCA5MDhiMGI1Li5jNmI3OTQ3IDEwMDY0NAo+
Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+
Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+
Pj4+Pj4+PiBAQCAtODk3LDkgKzg5Nyw0MCBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9pbml0
KTsKPj4+Pj4+Pj4+PiDCoMKgICovCj4+Pj4+Pj4+Pj4gwqAgdm9pZCBkcm1fc2NoZWRfZmluaShz
dHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+Pj4+Pj4+Pj4+IMKgIHsKPj4+Pj4+Pj4+
PiArwqDCoMKgIGludCBpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKnNfZW50aXR5Owo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEJUVzogUGxlYXNlIG9yZGVyIHRoYXQg
c28gdGhhdCBpIGlzIGRlY2xhcmVkIGxhc3QuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqAgaWYgKHNjaGVkLT50aHJlYWQpCj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGt0aHJl
YWRfc3RvcChzY2hlZC0+dGhyZWFkKTsKPj4+Pj4+Pj4+PiDCoCArwqDCoMKgIC8qIERldGFjaCBh
bGwgc2NoZWRfZW50aXRlcyBmcm9tIHRoaXMgc2NoZWR1bGVyIG9uY2UgCj4+Pj4+Pj4+Pj4gaXQn
cyBzdG9wcGVkICovCj4+Pj4+Pj4+Pj4gK8KgwqDCoCBmb3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJ
VFlfQ09VTlQgLSAxOyBpID49IAo+Pj4+Pj4+Pj4+IERSTV9TQ0hFRF9QUklPUklUWV9NSU47IGkt
LSkgewo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSA9
ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoIXJxKQo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVl
Owo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogTG9vcCB0aGlzIHdh
eSBiZWNhdXNlIHJxLT5sb2NrIGlzIHRha2VuIGluIAo+Pj4+Pj4+Pj4+IGRybV9zY2hlZF9ycV9y
ZW1vdmVfZW50aXR5ICovCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmcnEt
PmxvY2spOwo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3aGlsZSAoKHNfZW50aXR5ID0gCj4+
Pj4+Pj4+Pj4gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZycS0+ZW50aXRpZXMsCj4+Pj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5LAo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0
KSkpIHsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEt
PmxvY2spOwo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
KiBQcmV2ZW50IHJlaW5zZXJ0aW9uIGFuZCByZW1vdmUgKi8KPj4+Pj4+Pj4+PiArIHNwaW5fbG9j
aygmc19lbnRpdHktPnJxX2xvY2spOwo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNfZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eShycSwgc19lbnRpdHkpOwo+Pj4+Pj4+Pj4+
ICsgc3Bpbl91bmxvY2soJnNfZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBX
ZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBoZXJlIGRvZXNuJ3QgbG9vayBjb3JyZWN0
IGF0IAo+Pj4+Pj4+Pj4gYWxsIG5vdy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEluIHdoYXQgd2F5ID8gSXQncyBpbiB0aGUgc2FtZSBz
YW1lIG9yZGVyIGFzIGluIG90aGVyIGNhbGwgCj4+Pj4+Pj4+IHNpdGVzIChzZWUgZHJtX3NjaGVk
X2VudGl0eV9wdXNoX2pvYiBhbmQgZHJtX3NjaGVkX2VudGl0eV9mbHVzaCkuCj4+Pj4+Pj4+IElm
IGkganVzdCBsb2NrZWQgcnEtPmxvY2sgYW5kIGRpZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUg
Cj4+Pj4+Pj4+IHdoaWxlIG1hbnVhbGx5IGRlbGV0aW5nIGVudGl0eS0+bGlzdCBpbnN0ZWFkIG9m
IGNhbGxpbmcKPj4+Pj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkgdGhpcyBzdGlsbCB3
b3VsZCBub3QgYmUgcG9zc2libGUgYXMgCj4+Pj4+Pj4+IHRoZSBvcmRlciBvZiBsb2NrIGFjcXVp
c2l0aW9uIGJldHdlZW4gc19lbnRpdHktPnJxX2xvY2sKPj4+Pj4+Pj4gYW5kIHJxLT5sb2NrIHdv
dWxkIGJlIHJldmVyc2UgY29tcGFyZWQgdG8gdGhlIGNhbGwgc2l0ZXMgCj4+Pj4+Pj4+IG1lbnRp
b25lZCBhYm92ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEFoLCBub3cgSSB1bmRlcnN0YW5kLiBZb3UgbmVl
ZCB0aGlzIGJlY2F1c2UgCj4+Pj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkoKSB3aWxs
IGdyYWIgdGhlIHJxIGxvY2sgYWdhaW4hCj4+Pj4+Pj4KPj4+Pj4+PiBQcm9ibGVtIGlzIG5vdyB3
aGF0IHByZXZlbnRzIHRoZSBlbnRpdHkgZnJvbSBiZWluZyBkZXN0cm95ZWQgCj4+Pj4+Pj4gd2hp
bGUgeW91IHJlbW92ZSBpdD8KPj4+Pj4+Pgo+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Cj4+Pj4+
PiBSaWdodCwgd2VsbCwgc2luY2UgKHVuZm9ydHVuYXRlbHkpIHNjaGVkX2VudGl0eSBpcyBwYXJ0
IG9mIAo+Pj4+Pj4gYW1kZ3B1X2N0eF9lbnRpdHkgYW5kIGFtZGdwdV9jdHhfZW50aXR5IGlzIHJl
ZmNvdW50ZWQKPj4+Pj4+IHRoZXJlIGlzIGEgcHJvYmxlbSBoZXJlIHRoYXQgd2UgZG9uJ3QgaW5j
cmVtZW50IAo+Pj4+Pj4gYW1kZ3B1X2N0eC5yZWZjb3VudCB3aGVuIGFzc2lnbmluZ8KgIHNjaGVk
X2VudGl0eQo+Pj4+Pj4gdG8gbmV3IHJxIChlLmcuIGJlZm9yZSBkcm1fc2NoZWRfcnFfYWRkX2Vu
dGl0eSkgYW5kIG5vdCBkZWNyZW1lbnQgCj4+Pj4+PiBiZWZvcmUgcmVtb3ZpbmcuIFdlIGRvIGl0
IGZvcgo+Pj4+Pj4gYW1kZ3B1X2NzX3BhcnNlci5lbnRpdHkgZm9yIGV4YW1wbGUgKGluIGFtZGdw
dV9jc19wYXJzZXJfaW5pdCBhbmQgCj4+Pj4+PiBhbWRncHVfY3NfcGFyc2VyX2ZpbmkgYnkKPj4+
Pj4+IGNhbGxpbmcgYW1kZ3B1X2N0eF9nZXQgYW5kIGFtZGdwdV9jdHhfcHV0KS4gQnV0IHRoaXMg
c2VlbXMgYSBiaXQgCj4+Pj4+PiB0cmlja3kgZHVlIHRvIGFsbCB0aGUgZHJtX3NjaGVkX2VudGl0
eV9zZWxlY3RfcnEKPj4+Pj4+IGxvZ2ljLgo+Pj4+Pj4KPj4+Pj4+IEFub3RoZXIsIGtpbmQgb2Yg
YSBiYW5kIGFpZCBmaXgsIHdvdWxkIHByb2JhYmx5IGJlIGp1c3QgbG9ja2luZyAKPj4+Pj4+IGFt
ZGdwdV9jdHhfbWdyLmxvY2sgYXJvdW5kIGRybV9zY2hlZF9maW5pCj4+Pj4+PiB3aGVuIGZpbmFs
aXppbmcgdGhlIGZlbmNlIGRyaXZlciBhbmQgYXJvdW5kIGlkciBpdGVyYXRpb24gaW4gCj4+Pj4+
PiBhbWRncHVfY3R4X21ncl9maW5pICh3aGljaCBzaG91bGQgYmUgbG9jayBwcm90ZWN0ZWQKPj4+
Pj4+IGFueXdheSBhcyBJIHNlZSBmcm9tIG90aGVyIGlkciB1c2FnZXMgaW4gdGhlIGNvZGUpIC4u
LiBUaGlzIAo+Pj4+Pj4gc2hvdWxkIHByZXZlbnQgdGhpcyB1c2UgYWZ0ZXIgZnJlZS4KPj4+Pj4K
Pj4+Pj4gUHVoLCB0aGF0J3MgcmF0aGVyIGNvbXBsaWNhdGVkIGFzIHdlbGwuIE9rIGxldCdzIGxv
b2sgYXQgaXQgZnJvbSAKPj4+Pj4gdGhlIG90aGVyIHNpZGUgZm9yIGEgbW9tZW50Lgo+Pj4+Pgo+
Pj4+PiBXaHkgZG8gd2UgaGF2ZSB0byByZW1vdmUgdGhlIGVudGl0aWVzIGZyb20gdGhlIHJxIGlu
IHRoZSBmaXJzdCBwbGFjZT8KPj4+Pj4KPj4+Pj4gV291bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0
byBqdXN0IHNldCBhbGwgb2YgdGhlbSB0byBzdG9wcGVkPwo+Pj4+Pgo+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4KPj4+Pgo+Pj4+IEFuZCBhZGRpbmcgaXQgYXMgYW5vdGhlcsKgIGNvbmRpdGlvbiBpbiBk
cm1fc2NoZWRfZW50aXR5X2lzX2lkbGUgPwo+Pgo+PiBZZXMsIEkgdGhpbmsgdGhhdCBzaG91bGQg
d29yay4KPgo+Cj4gSW4gdGhpcyBjYXNlIHJldmVyc2UgbG9ja2luZyBvcmRlciBpcyBjcmVhdGVk
LCBJbiAKPiBkcm1fc2NoZWRfZW50aXR5X3B1c2hfam9iIGFuZCBkcm1fc2NoZWRfZW50aXR5X2Zs
dXNoIGxvY2sgCj4gZW50aXR5LT5ycV9sb2NrIGxvY2tlZCBmaXJzdCBhbmQgcnEtPmxvY2sgbG9j
a2VkIHNlY29uZC4gSW4gCj4gZHJtX3NjaGVkX2Zpbmkgb24gdGhlIG90aGVyIGhhbmQsIEkgbmVl
ZCB0byBsb2NrIHJxLT5sb2NrIGZpcnN0IHRvIAo+IGl0ZXJhdGUgcnEtPmVudGl0aWVzIGFuZCB0
aGVuIGxvY2sgc19lbnRpdHktPnJxX2xvY2sgZm9yIGVhY2ggZW50aXR5IAo+IHRvIG1vZGlmeSBz
X2VudGl0eS0+c3RvcHBlZC4gSSBndWVzcyB3ZSBjb3VsZCBjaGFuZ2Ugc19lbnRpdHktPnN0b3Bw
ZWQgCj4gdG8gYXRvbWljID8KCkdvb2QgcG9pbnQuIEJ1dCBJIHRoaW5rIHRoZSBtZW1vcnkgYmFy
cmllciBpbnNlcnRlZCBieSAKd2FrZV91cF9hbGwoJnNjaGVkLT5qb2Jfc2NoZWR1bGVkKTsgc2hv
dWxkIGJlIHN1ZmZpY2llbnQuCgpJZiBJIHNlZSB0aGlzIGNvcnJlY3RseSB3ZSBoYXZlIHRoZSBl
bnRpdHktPnJxX2xvY2sgbWFpbmx5IHRvIHByb3RlY3QgCmNvbmN1cnJlbnQgY2hhbmdlcyBvZiBl
bnRpdHktPnJxLgoKQnV0IHdoZW4gdHdvIENQVXMgYm90aCBzZXQgZW50aXR5LT5zdG9wcGVkIHRv
IHRydWUgYXQgdGhlIHNhbWUgdGltZSB3ZSAKZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgaXQgYXMg
bG9uZyBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUoKSBzZWVzIGl0LgoKUmVnYXJkcywKQ2hyaXN0
aWFuLgoKPgo+IEFuZHJleQo+Cj4KPj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pgo+Pj4+Cj4+Pj4gQW5k
cmV5Cj4+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEFuZHJleQo+Pj4+Pj4KPj4+Pj4+Cj4+
Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4+Pj4+
ICsKPj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4gK8KgwqDCoCAv
KiBXYWtldXAgZXZlcnlvbmUgc3R1Y2sgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3IgCj4+
Pj4+Pj4+Pj4gdGhpcyBzY2hlZHVsZXIgKi8KPj4+Pj4+Pj4+PiArwqDCoMKgIHdha2VfdXBfYWxs
KCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2UgCj4+Pj4+
Pj4+Pj4gc3RydWN0dXJlcyAqLwo+Pj4+Pj4+Pj4+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygm
c2NoZWQtPndvcmtfdGRyKTsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4KPj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
