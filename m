Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD323E162A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 11:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6176EA0D;
	Wed, 23 Oct 2019 09:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EE86E159;
 Wed, 23 Oct 2019 09:32:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g7so2339777wmk.4;
 Wed, 23 Oct 2019 02:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EwzJlitg6ojpTgAu/CD7TkQAOGgugVP58FFyv2RoWtw=;
 b=W/SQe8/VU3vG/ZpDmhsZVRp7g3s/LbJEuLrAXeuDSJtqDASTYkA3mMXaB5InGN/L9o
 AXGnfSA6cJXtVFWPT0I2ZeSEjd+97hyl6R9p7JfM1tybaRsQ0dFJXtCMIWKXOU5L8pWz
 n6RAwpSWvhmcJYMmq1i0A3zv0EtUrLva/epsQ7gW7Wge//TQDWsbSGbkG10p4WynF3vQ
 Oox1nNkhRAeOwZan0oSapX2JezZQuMIK47/mczFd2TnvQrpx69YqdWJswNtakTkiCll2
 BmkwvpCpksJssQ4GEeN16i0fyi27ASvS2PWO0/Ky3Ff9Cmw3faxt3o52VA8gTfqezBZF
 ghTQ==
X-Gm-Message-State: APjAAAWgb5WCOT0BzJ0W97J+qE22FSFlqkUioTSKQSWGmF+FiG31+H4I
 1Ifgj+pD8JbMMUKSnXWbXYk=
X-Google-Smtp-Source: APXvYqy8pbfED4xFpipcpITgTxdfhElPA191PjQR1rjhPeOrBaay791F3suidtz4fnnlrOK6oWHG4g==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr6789042wmf.63.1571823138669; 
 Wed, 23 Oct 2019 02:32:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h17sm22678474wme.6.2019.10.23.02.32.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 02:32:17 -0700 (PDT)
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
To: Jason Gunthorpe <jgg@mellanox.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Andrea Arcangeli <aarcange@redhat.com>, "Yang, Philip"
 <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse
 <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
References: <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
 <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
 <20191018203608.GA5670@mellanox.com>
 <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
 <20191021135744.GA25164@mellanox.com>
 <e07092c3-8ccd-9814-835c-6c462017aff8@amd.com>
 <20191021151221.GC25164@mellanox.com>
 <20191022075735.GV11828@phenom.ffwll.local>
 <20191022150109.GF22766@mellanox.com>
 <20191023090858.GV11828@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <13edf841-421e-3522-fcec-ef919c2013ef@gmail.com>
Date: Wed, 23 Oct 2019 11:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023090858.GV11828@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=EwzJlitg6ojpTgAu/CD7TkQAOGgugVP58FFyv2RoWtw=;
 b=rVZ4tg4I22VQyUArQiihwBc10IhXwEssWDf1EaFeaIXqsGC6JfdVQ3m8a/+eFez/uv
 cBI5tmVKmRe5xwC2hsqoyWkcMnEwVvJMzguUqKhiylze81YYpUjxlJGmahgktbdYGMF3
 7stesmV/VO9FsVwh0xa64s1wOLimS1Yr1zQaK49meIOcg2FOzdWsFrqVWuNkJZMA9ler
 J6m58AAFZyFWE0TN2mMV8z2LWcUCEKPX/BZHda4GtmP9hHo+s6q4FeIosOmGcNkqUI4R
 06UI7jOr184MX3RX6QI8HFxtm2ezvjUTDRQxyx419bdvk6QI/kKmCCrZJGIzpz5QWD0Q
 1T9A==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTAuMTkgdW0gMTE6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgT2N0
IDIyLCAyMDE5IGF0IDAzOjAxOjEzUE0gKzAwMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4g
T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDk6NTc6MzVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPj4KPj4+PiBUaGUgdW51c3VhbCBiaXQgaW4gYWxsIG9mIHRoaXMgaXMgdXNpbmcgYSBs
b2NrJ3MgY3JpdGljYWwgcmVnaW9uIHRvCj4+Pj4gJ3Byb3RlY3QnIGRhdGEgZm9yIHJlYWQsIGJ1
dCB1cGRhdGluZyB0aGF0IHNhbWUgZGF0YSBiZWZvcmUgdGhlIGxvY2sncwo+Pj4+IGNyaXRpY2Fs
IHNlY2lvbi4gaWUgcmVseWluZyBvbiB0aGUgdW5sb2NrIGJhcnJpZXIgdG8gJ3JlbGVhc2UnIHBy
b2dyYW0KPj4+PiBvcmRlcmVkIHN0b3JlcyBkb25lIGJlZm9yZSB0aGUgbG9jaydzIG93biBjcml0
aWNhbCByZWdpb24sIGFuZCB0aGUKPj4+PiBsb2NrIHNpZGUgYmFycmllciB0byAnYWNxdWlyZScg
dGhvc2Ugc3RvcmVzLgo+Pj4gSSB0aGluayB0aGlzIHVudXN1YWwgdXNlIG9mIGxvY2tzIGFzIGJh
cnJpZXJzIGZvciBvdGhlciB1bmxvY2tlZCBhY2Nlc3Nlcwo+Pj4gZGVzZXJ2ZXMgY29tbWVudHMg
ZXZlbiBtb3JlIHRoYW4ganVzdCBub3JtYWwgYmFycmllcnMuIENhbiB5b3UgcGxzIGFkZAo+Pj4g
dGhlbT8gSSB0aGluayB0aGUgZGVzaWduIHNlZWVtcyBzb3VuZCAuLi4KPj4+Cj4+PiBBbHNvIHRo
ZSBjb21tZW50IG9uIHRoZSBkcml2ZXIncyBsb2NrIGhvcGVmdWxseSBwcmV2ZW50cyBkcml2ZXIK
Pj4+IG1haW50YWluZXJzIGZyb20gbW92aW5nIHRoZSBkcml2ZXJfbG9jayBhcm91bmQgaW4gYSB3
YXkgdGhhdCB3b3VsZCB2ZXJ5Cj4+PiBzdWJ0bGUgYnJlYWsgdGhlIHNjaGVtZSwgc28gSSB0aGlu
ayBoYXZpbmcgdGhlIGFjcXVpcmUgYmFycmllciBjb21tZW50ZWQKPj4+IGluIGVhY2ggcGxhY2Ug
d291bGQgYmUgcmVhbGx5IGdvb2QuCj4+IFRoZXJlIGlzIGFscmVhZHkgYSBsb3Qgb2YgZG9jdW1l
bnRhdGlvbiwgSSB0aGluayBpdCB3b3VsZCBiZSBoZWxwZnVsCj4+IGlmIHlvdSBjb3VsZCBzdWdn
ZXN0IHNvbWUgc3BlY2lmaWMgcGxhY2VzIHdoZXJlIHlvdSB0aGluayBhbiBhZGRpdGlvbgo+PiB3
b3VsZCBoZWxwPyBJIHRoaW5rIHRoZSBwZXJzcGVjdGl2ZSBvZiBzb21lb25lIGxlc3MgZmFtaWxp
YXIgd2l0aCB0aGlzCj4+IGRlc2lnbiB3b3VsZCByZWFsbHkgaW1wcm92ZSB0aGUgZG9jdW1lbnRh
dGlvbgo+IEhtIEkganVzdCBtZWFudCB0aGUgdXN1YWwgcmVjb21tZW5kYXRpb24gdGhhdCAiYmFy
cmllcnMgbXVzdCBoYXZlIGNvbW1lbnRzCj4gZXhwbGFpbmluZyB3aGF0IHRoZXkgb3JkZXIsIGFu
ZCB3aGVyZSB0aGUgb3RoZXIgc2lkZSBvZiB0aGUgYmFycmllciBpcyIuCj4gVXNpbmcgdW5sb2Nr
L2xvY2sgYXMgYSBiYXJyaWVyIGltbyBqdXN0IG1ha2VzIHRoYXQgYW4gZXZlbiBiZXR0ZXIgaWRl
YS4KPiBVc3VhbGx5IHdoYXQgSSBkbyBpcyBzb21ldGhpbmcgbGlrZSAid2UgbmVlZCB0byBvcmRl
ciAkdGhpcyBhZ2FpbnN0ICR0aGF0Cj4gYmVsb3csIGFuZCB0aGUgb3RoZXIgc2lkZSBvZiB0aGlz
IGJhcnJpZXIgaXMgaW4gZnVuY3Rpb24oKS4iIFdpdGggbWF5YmUgYQo+IGJpdCBtb3JlIGlmIGl0
J3Mgbm90IG9idmlvdXMgaG93IHRoaW5ncyBnbyB3cm9uZyBpZiB0aGUgb3JkZXJpbiBpcyBicm9r
ZW4uCj4KPiBPZmMgc2VxbG9jay5oIGl0c2VsZiBza2ltcHMgb24gdGhhdCBydWxlIGFuZCBkb2Vz
bid0IGJvdGhlciBleHBsYWluaW5nIGl0cwo+IGJhcnJpZXJzIDotLwo+Cj4+IEkndmUgYmVlbiB0
ZW1wdGVkIHRvIGZvcmNlIHRoZSBkcml2ZXIgdG8gc3RvcmUgdGhlIHNlcSBudW1iZXIgZGlyZWN0
bHkKPj4gdW5kZXIgdGhlIGRyaXZlciBsb2NrIC0gdGhpcyBtYWtlcyB0aGUgc2NoZW1lIG11Y2gg
Y2xlYXJlciwgaWUKPj4gc29tZXRoaW5nIGxpa2UgdGhpczoKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3N2bS5jCj4+IGluZGV4IDcxMmM5OTkxODU1MWJjLi43MzhmYTY3MGRjZmIx
OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4+IEBAIC00ODgs
NyArNDg4LDggQEAgc3RydWN0IHN2bV9ub3RpZmllciB7Cj4+ICAgfTsKPj4gICAKPj4gICBzdGF0
aWMgYm9vbCBub3V2ZWF1X3N2bV9yYW5nZV9pbnZhbGlkYXRlKHN0cnVjdCBtbXVfcmFuZ2Vfbm90
aWZpZXIgKm1ybiwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3Jhbmdl
ICpyYW5nZSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHNlcSkKPj4gICB7Cj4+ICAgICAgICAgIHN0cnVjdCBzdm1fbm90aWZpZXIgKnNu
ID0KPj4gICAgICAgICAgICAgICAgICBjb250YWluZXJfb2YobXJuLCBzdHJ1Y3Qgc3ZtX25vdGlm
aWVyLCBub3RpZmllcik7Cj4+IEBAIC01MDQsNiArNTA1LDcgQEAgc3RhdGljIGJvb2wgbm91dmVh
dV9zdm1fcmFuZ2VfaW52YWxpZGF0ZShzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4sCj4+
ICAgICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygmc24tPnN2bW0tPm11dGV4KTsKPj4gICAgICAg
ICAgZWxzZSBpZiAoIW11dGV4X3RyeWxvY2soJnNuLT5zdm1tLT5tdXRleCkpCj4+ICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+PiArICAgICAgIG1tdV9yYW5nZV9ub3RpZmllcl91cGRh
dGVfc2VxKG1ybiwgc2VxKTsKPj4gICAgICAgICAgbXV0ZXhfdW5sb2NrKCZzbi0+c3ZtbS0+bXV0
ZXgpOwo+PiAgICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gICB9Cj4+Cj4+Cj4+IEF0IHRoZSBjb3N0
IG9mIG1ha2luZyB0aGUgZHJpdmVyIGEgYml0IG1vcmUgY29tcGxleCwgd2hhdCBkbyB5b3UKPj4g
dGhpbms/Cj4gSG0sIHNwaW5uaW5nIHRoaXMgZnVydGhlciAuLi4gY291bGQgd2UgaW5pdGlhbGl6
ZSB0aGUgbW11IHJhbmdlIG5vdGlmaWVyCj4gd2l0aCBhIHBvaW50ZXIgdG8gdGhlIGRyaXZlciBs
b2NrLCBzbyB0aGF0IHdlIGNvdWxkIHB1dCBhCj4gbG9ja2RlcF9hc3NlcnRfaGVsZCBpbnRvIG1t
dV9yYW5nZV9ub3RpZmllcl91cGRhdGVfc2VxPyBJIHRoaW5rIHRoYXQgd291bGQKPiBtYWtlIHRo
aXMgc2NoZW1lIHN1YnN0YW50aWFsbHkgbW9yZSBkcml2ZXItaGFja2VyIHByb29mIDotKQoKR29p
bmcgYW5vdGhlciBzdGVwIGZ1cnRoZXIuLi4uIHdoYXQgaGluZGVycyB1cyB0byBwdXQgdGhlIGxv
Y2sgaW50byB0aGUgCm1tdSByYW5nZSBub3RpZmllciBpdHNlbGYgYW5kIGhhdmUgX2xvY2soKS9f
dW5sb2NrKCkgaGVscGVycz8KCkkgbWVhbiBoYXZpbmcgdGhlIGxvY2sgaW4gdGhlIGRyaXZlciBv
bmx5IG1ha2VzIHNlbnNlIHdoZW4gdGhlIGRyaXZlciAKd291bGQgYmUgdXNpbmcgdGhlIHNhbWUg
bG9jayBmb3IgbXVsdGlwbGUgdGhpbmdzLCBlLmcuIG11bHRpcGxlIE1NVSAKcmFuZ2Ugbm90aWZp
ZXJzIHVuZGVyIHRoZSBzYW1lIGxvY2suIEJ1dCBJIHJlYWxseSBkb24ndCBzZWUgdGhhdCB1c2Ug
CmNhc2UgaGVyZS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBDaGVlcnMsIERhbmllbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
