Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CC2A5F0E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740C489359;
	Wed,  4 Nov 2020 08:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC94289359
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 08:03:20 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id s25so14510095ejy.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 00:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=lSHGlcZONhf6qBQExAcS/zcrqWFtE8KDWWdwXpyQQ+o=;
 b=JQRa+YZuAJZjt1g7TC9uAoHYTcFw/40zCiI/3Bz628T8dyzU/yCN5jgd/Etdq+GbEH
 rvQ0wwkqSkrFz6SZ+s29kV53j3Ij6xInhh5wd2YonabzH3OIqagnV3Y/fwYlJGUIsbju
 M6Pgp2sRf+Jk2ZRChyJYcGR/I0zh9K3Rl6el5aeVgdm0J8zJkqP5jgFK3OycNIjnoidP
 GdBR+n1qZJtM6kAiVsUJ4iPzD4JNOEnxhbkijpte9JvvDa/5TM/FLLZ573iv+9j6gIM6
 I7tnIrRTbVArZ2dr8ZpE/5Cpmo4V7ibsFSprrAEKDa5kJlkpzbHvcUOw6a6iEgUHUr/2
 z5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lSHGlcZONhf6qBQExAcS/zcrqWFtE8KDWWdwXpyQQ+o=;
 b=JE5QoUh2aogub6rwV7vsO2nB95aHloeM5HLPLRlCmEB4z5SHAOJ1BAQEZtem4D2R5m
 2RW5gs0Gm5UtzQdV2Rp7yLVenov/aaQsPWzn/f+dDcsxI3KMUepNWFuyKQPa1gFPGA6W
 dEE4T7gSV0f2xJfBrGJw5NroyZ5ebXRcEaxDY9wQ0VawvFd4YGu2JPKG1uAwa1N9xVtD
 0N6UpbUEoSfNL33xdKl62a8QF+x4DlAwVOJxQC68jF1FCcVFlkctetzPo0wxuxrrzBhY
 n6VHbwjyv88BUHuEvwfoK1wfyeNiz50LLQr8frhFot2V4dUX4WHY5Y/1cvaKxaXaerRu
 RJJQ==
X-Gm-Message-State: AOAM531bCyRMtkl7mpzegmqc3Y7QEaIkUmaPBazM2mo95adn26UnxYfC
 Q7JZ1rFk5WbuBcks/WifPxY=
X-Google-Smtp-Source: ABdhPJyYf7wTm7PCR+aDC0KR0zCSeQg/FQpbVuARHDgbDgaGw2ovwStfe5mIvBm9OL1gpSoTMbbB9g==
X-Received: by 2002:a17:906:c1d4:: with SMTP id
 bw20mr23369417ejb.91.1604476999489; 
 Wed, 04 Nov 2020 00:03:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f25sm600558edr.53.2020.11.04.00.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 00:03:18 -0800 (PST)
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
 jgg@ziepe.ca, linmiaohe@huawei.com
References: <20201012085203.56119-1-christian.koenig@amd.com>
Message-ID: <be6d248d-01d4-f2a3-5e33-7f311daef0b7@gmail.com>
Date: Wed, 4 Nov 2020 09:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012085203.56119-1-christian.koenig@amd.com>
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

SWYgbm9ib2R5IGNvbWVzIHVwIHdpdGggYW4gb2JqZWN0aW9ucyBJJ20gZ29pbmcgdG8gbWVyZ2Ug
dGhhdCB0aHJvdWdoIApkcm0tbWlzYy1uZXh0LgoKVGhhbmtzLApDaHJpc3RpYW4uCgpBbSAxMi4x
MC4yMCB1bSAxMDo1MiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gUGF0Y2ggIjQ5NWMxMGNj
MWMwYyBDSFJPTUlVTTogZG1hLWJ1ZjogcmVzdG9yZSBhcmdzLi4uIgo+IGFkZHMgYSB3b3JrYXJv
dW5kIGZvciBhIGJ1ZyBpbiBtbWFwX3JlZ2lvbi4KPgo+IEFzIHRoZSBjb21tZW50IHN0YXRlcyAt
Pm1tYXAoKSBjYWxsYmFjayBjYW4gY2hhbmdlCj4gdm1hLT52bV9maWxlIGFuZCBzbyB3ZSBtaWdo
dCBjYWxsIGZwdXQoKSBvbiB0aGUgd3JvbmcgZmlsZS4KPgo+IFJldmVydCB0aGUgd29ya2Fyb3Vu
ZCBhbmQgcHJvcGVyIGZpeCB0aGlzIGluIG1tYXBfcmVnaW9uLgo+Cj4gdjI6IGRyb3AgdGhlIGV4
dHJhIGlmIGluIGRtYV9idWZfbW1hcCBhcyB3ZWxsCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphc29u
IEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jIHwgMjAgKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgIG1tL21tYXAuYyAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gaW5kZXggYTZiYTRkNTk4ZjBlLi4wODYzMGQwNTdj
ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiBAQCAtMTE0Myw5ICsxMTQzLDYgQEAgRVhQT1JUX1NZTUJP
TF9HUEwoZG1hX2J1Zl9lbmRfY3B1X2FjY2Vzcyk7Cj4gICBpbnQgZG1hX2J1Zl9tbWFwKHN0cnVj
dCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICAgCQkgdW5z
aWduZWQgbG9uZyBwZ29mZikKPiAgIHsKPiAtCXN0cnVjdCBmaWxlICpvbGRmaWxlOwo+IC0JaW50
IHJldDsKPiAtCj4gICAJaWYgKFdBUk5fT04oIWRtYWJ1ZiB8fCAhdm1hKSkKPiAgIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gICAKPiBAQCAtMTE2MywyMiArMTE2MCwxMSBAQCBpbnQgZG1hX2J1Zl9tbWFw
KHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICAg
CQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+ICAgCS8qIHJlYWRqdXN0IHRoZSB2bWEgKi8KPiAtCWdl
dF9maWxlKGRtYWJ1Zi0+ZmlsZSk7Cj4gLQlvbGRmaWxlID0gdm1hLT52bV9maWxlOwo+IC0Jdm1h
LT52bV9maWxlID0gZG1hYnVmLT5maWxlOwo+ICsJZnB1dCh2bWEtPnZtX2ZpbGUpOwo+ICsJdm1h
LT52bV9maWxlID0gZ2V0X2ZpbGUoZG1hYnVmLT5maWxlKTsKPiAgIAl2bWEtPnZtX3Bnb2ZmID0g
cGdvZmY7Cj4gICAKPiAtCXJldCA9IGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKPiAt
CWlmIChyZXQpIHsKPiAtCQkvKiByZXN0b3JlIG9sZCBwYXJhbWV0ZXJzIG9uIGZhaWx1cmUgKi8K
PiAtCQl2bWEtPnZtX2ZpbGUgPSBvbGRmaWxlOwo+IC0JCWZwdXQoZG1hYnVmLT5maWxlKTsKPiAt
CX0gZWxzZSB7Cj4gLQkJaWYgKG9sZGZpbGUpCj4gLQkJCWZwdXQob2xkZmlsZSk7Cj4gLQl9Cj4g
LQlyZXR1cm4gcmV0Owo+IC0KPiArCXJldHVybiBkbWFidWYtPm9wcy0+bW1hcChkbWFidWYsIHZt
YSk7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX21tYXApOwo+ICAgCj4gZGlm
ZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwo+IGluZGV4IDQwMjQ4ZDg0YWQ1Zi4uM2Ey
NjcwZDczMzU1IDEwMDY0NAo+IC0tLSBhL21tL21tYXAuYwo+ICsrKyBiL21tL21tYXAuYwo+IEBA
IC0xODUyLDggKzE4NTIsOCBAQCB1bnNpZ25lZCBsb25nIG1tYXBfcmVnaW9uKHN0cnVjdCBmaWxl
ICpmaWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAJcmV0dXJuIGFkZHI7Cj4gICAKPiAgIHVu
bWFwX2FuZF9mcmVlX3ZtYToKPiArCWZwdXQodm1hLT52bV9maWxlKTsKPiAgIAl2bWEtPnZtX2Zp
bGUgPSBOVUxMOwo+IC0JZnB1dChmaWxlKTsKPiAgIAo+ICAgCS8qIFVuZG8gYW55IHBhcnRpYWwg
bWFwcGluZyBkb25lIGJ5IGEgZGV2aWNlIGRyaXZlci4gKi8KPiAgIAl1bm1hcF9yZWdpb24obW0s
IHZtYSwgcHJldiwgdm1hLT52bV9zdGFydCwgdm1hLT52bV9lbmQpOwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
