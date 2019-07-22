Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14271261
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27B88FC1;
	Tue, 23 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403C8895F5;
 Mon, 22 Jul 2019 14:37:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so37807518ljh.6;
 Mon, 22 Jul 2019 07:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SUH6arJbp14IVMjbkeZ0K94NO/z20TDutwCqOxsq4Fw=;
 b=K8yOIakUYaA+0La7SKvUIX8j4MsCgJDr/DrqV0Nf7j3EoimIDrXNeUpkgX2ULkkue0
 lLQpUxLOcRd+EY6Qs4dsJzOhTOgAyoaIgyjonFqIrQD8FQqN79NtR5gX1gmuXcpcae6G
 9pBpty/CdPodJsFkw87mxxF7h5GJ2dkSKwvnCFF/oC1n42UUdf6PxGZgZWgwo8Digbt+
 s6RxEzcV+kuoCT1uM6JBd62uYEyrA+yoil9JYNx9AiyKpuI2qaYRN2wl5H769G1wczwE
 iR8buLNv7skRLr5Rr8Z0WBvKn3b9uIufH8/6y2zcCx69LxoKe42PAnGOUV5cbN19jpPA
 6FZw==
X-Gm-Message-State: APjAAAWzmxTwqresIrrmq2PhCSOE6JJJtvFD99I4o+vZ3vdUE/oIY1TS
 CwXx0BANyuFBe9mXVpgm+h/PL7keT2LUEa8DZEk=
X-Google-Smtp-Source: APXvYqyUuyVhvpPVyaK0EtT6IHNJ3TNJikX6jVZCPNEmd7vcNDjv9sQO2bgfO2wFUz2CiCOMPgV4do0itfHJJ3iI0ko=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr25605680ljk.152.1563806265548; 
 Mon, 22 Jul 2019 07:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-2-hch@lst.de>
In-Reply-To: <20190722094426.18563-2-hch@lst.de>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 22 Jul 2019 20:07:33 +0530
Message-ID: <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
Subject: Re: [PATCH 1/6] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault, snapshot}
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SUH6arJbp14IVMjbkeZ0K94NO/z20TDutwCqOxsq4Fw=;
 b=cNYsnnjVLguyuhcKHqqxp7hSA5M3S1DZvaBoF80d1MZLvyCLSsdsxyzbqp+hAugfqB
 La4mTA+QaSN25eS7kR5jYbs5x37bIW38yuFEe9LoQUhA4BKZbg7G89i02FTdSaoa/LHD
 0/lmUGsZBZhSpFQ3CDG0yu7d0XOEvaaddpieq56zgY56JIdUSioPyWlIQN+Coy+AXBhh
 i8jmWmQqzLzSlVGdTV2hn84KzjVBQl4pbwsL+KCS9KIx6GA7hL+D2ZJUFh8ilWXmzYh/
 dAZFYOljbOddCkc8Zmh16FrOyiTux9Y7iKOyUucQi77FVxvyJCXpJp2vmP1KIUydFgVE
 61bA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Linux-MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMzoxNCBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBXZSBzaG91bGQgbm90IGhhdmUgdHdvIGRpZmZlcmVudCBlcnJvciBj
b2RlcyBmb3IgdGhlIHNhbWUgY29uZGl0aW9uLiAgSW4KPiBhZGRpdGlvbiB0aGlzIHJlYWxseSBj
b21wbGljYXRlcyB0aGUgY29kZSBkdWUgdG8gdGhlIHNwZWNpYWwgaGFuZGxpbmcgb2YKPiBFQUdB
SU4gdGhhdCBkcm9wcyB0aGUgbW1hcF9zZW0gZHVlIHRvIHRoZSBGQVVMVF9GTEFHX0FMTE9XX1JF
VFJZIGxvZ2ljCj4gaW4gdGhlIGNvcmUgdm0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgo+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IHwgIDIgKy0K
PiAgbW0vaG1tLmMgICAgICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL3ZtL2htbS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QKPiBpbmRl
eCA3ZDkwOTY0YWJiYjAuLjcxMGNlMWM3MDFiZiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3ZtL2htbS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QKPiBAQCAtMjM3LDcg
KzIzNyw3IEBAIFRoZSB1c2FnZSBwYXR0ZXJuIGlzOjoKPiAgICAgICAgcmV0ID0gaG1tX3Jhbmdl
X3NuYXBzaG90KCZyYW5nZSk7Cj4gICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgIHVwX3Jl
YWQoJm1tLT5tbWFwX3NlbSk7Cj4gLSAgICAgICAgICBpZiAocmV0ID09IC1FQUdBSU4pIHsKPiAr
ICAgICAgICAgIGlmIChyZXQgPT0gLUVCVVNZKSB7Cj4gICAgICAgICAgICAgIC8qCj4gICAgICAg
ICAgICAgICAqIE5vIG5lZWQgdG8gY2hlY2sgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoKSBy
ZXR1cm4gdmFsdWUKPiAgICAgICAgICAgICAgICogb24gcmV0cnkgd2Ugd2lsbCBnZXQgcHJvcGVy
IGVycm9yIHdpdGggaG1tX3JhbmdlX3NuYXBzaG90KCkKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMg
Yi9tbS9obW0uYwo+IGluZGV4IGUxZWVkZWYxMjljZi4uMTZiNjczMWEzNGRiIDEwMDY0NAo+IC0t
LSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtOTQ2LDcgKzk0Niw3IEBAIEVYUE9S
VF9TWU1CT0woaG1tX3JhbmdlX3VucmVnaXN0ZXIpOwo+ICAgKiBAcmFuZ2U6IHJhbmdlCj4gICAq
IFJldHVybjogLUVJTlZBTCBpZiBpbnZhbGlkIGFyZ3VtZW50LCAtRU5PTUVNIG91dCBvZiBtZW1v
cnksIC1FUEVSTSBpbnZhbGlkCj4gICAqICAgICAgICAgIHBlcm1pc3Npb24gKGZvciBpbnN0YW5j
ZSBhc2tpbmcgZm9yIHdyaXRlIGFuZCByYW5nZSBpcyByZWFkIG9ubHkpLAo+IC0gKiAgICAgICAg
ICAtRUFHQUlOIGlmIHlvdSBuZWVkIHRvIHJldHJ5LCAtRUZBVUxUIGludmFsaWQgKGllIGVpdGhl
ciBubyB2YWxpZAo+ICsgKiAgICAgICAgICAtRUJVU1kgaWYgeW91IG5lZWQgdG8gcmV0cnksIC1F
RkFVTFQgaW52YWxpZCAoaWUgZWl0aGVyIG5vIHZhbGlkCj4gICAqICAgICAgICAgIHZtYSBvciBp
dCBpcyBpbGxlZ2FsIHRvIGFjY2VzcyB0aGF0IHJhbmdlKSwgbnVtYmVyIG9mIHZhbGlkIHBhZ2Vz
Cj4gICAqICAgICAgICAgIGluIHJhbmdlLT5wZm5zW10gKGZyb20gcmFuZ2Ugc3RhcnQgYWRkcmVz
cykuCj4gICAqCj4gQEAgLTk2Nyw3ICs5NjcsNyBAQCBsb25nIGhtbV9yYW5nZV9zbmFwc2hvdChz
dHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgICAgICAgIGRvIHsKPiAgICAgICAgICAgICAgICAg
LyogSWYgcmFuZ2UgaXMgbm8gbG9uZ2VyIHZhbGlkIGZvcmNlIHJldHJ5LiAqLwo+ICAgICAgICAg
ICAgICAgICBpZiAoIXJhbmdlLT52YWxpZCkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVBR0FJTjsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+Cj4g
ICAgICAgICAgICAgICAgIHZtYSA9IGZpbmRfdm1hKGhtbS0+bW0sIHN0YXJ0KTsKPiAgICAgICAg
ICAgICAgICAgaWYgKHZtYSA9PSBOVUxMIHx8ICh2bWEtPnZtX2ZsYWdzICYgZGV2aWNlX3ZtYSkp
Cj4gQEAgLTEwNjIsMTAgKzEwNjIsOCBAQCBsb25nIGhtbV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1t
X3JhbmdlICpyYW5nZSwgYm9vbCBibG9jaykKPgo+ICAgICAgICAgZG8gewo+ICAgICAgICAgICAg
ICAgICAvKiBJZiByYW5nZSBpcyBubyBsb25nZXIgdmFsaWQgZm9yY2UgcmV0cnkuICovCj4gLSAg
ICAgICAgICAgICAgIGlmICghcmFuZ2UtPnZhbGlkKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgdXBfcmVhZCgmaG1tLT5tbS0+bW1hcF9zZW0pOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUFHQUlOOwo+IC0gICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIGlm
ICghcmFuZ2UtPnZhbGlkKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7
CgpJcyBpdCBmaW5lIHRvIHJlbW92ZSAgdXBfcmVhZCgmaG1tLT5tbS0+bW1hcF9zZW0pID8KCj4K
PiAgICAgICAgICAgICAgICAgdm1hID0gZmluZF92bWEoaG1tLT5tbSwgc3RhcnQpOwo+ICAgICAg
ICAgICAgICAgICBpZiAodm1hID09IE5VTEwgfHwgKHZtYS0+dm1fZmxhZ3MgJiBkZXZpY2Vfdm1h
KSkKPiAtLQo+IDIuMjAuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
