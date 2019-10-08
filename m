Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E474CCF562
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 10:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF646E26F;
	Tue,  8 Oct 2019 08:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5322389FF7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 08:55:47 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h33so14892948edh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 01:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=BvFOMXU0lVvxVhVAf6iG3XmWFHKQLWq4q3s/t3vUuSI=;
 b=HbpsTcqTaJsS9YWANjPkWijuYqpjcWOjKYiTVjpV6Rwue4i5pHFWVzEgjlO7gCGoc9
 q88YL8liDh5y4+3iBGTIYig2xdrj432ZehV5sKq8lTTv6btMMCM6wYIMRliKVnSbH3nI
 DVBHQtYo2tjAET5TWw9CTTt6xMPe7z/+xHraDpq5WpMMgpXLXPYI5sZlRBAZnlkTYctS
 ZItBQWYr86n7KeK+PBQ7RNOKT0ViyYPaJMmpQf/oIvuWu+22bLWrKEs9/5qaj9row3EX
 ERiyj1jxIPALZNCIlY5QVgply63Z6SdDcGS0gVyNx7T2TeY1rF6u5x/b0sp/AHQKGRXl
 9UPA==
X-Gm-Message-State: APjAAAUHR5jVtO6GpmU8d1y8kvCztDsOAJPcbKZYNej7JcVlGm3c0HLB
 HZPThKjXBkaHsHFFEYZxNzO3Sg==
X-Google-Smtp-Source: APXvYqwKI1WKkHp5Zvpc14J6RxKVTLlCKE8s2+sY4PTGWky4DL7JZVk50J2m4PaVxXeQS4wTPSByGw==
X-Received: by 2002:aa7:d38e:: with SMTP id x14mr33654941edq.102.1570524945826; 
 Tue, 08 Oct 2019 01:55:45 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x4sm3740678eds.87.2019.10.08.01.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 01:55:45 -0700 (PDT)
Date: Tue, 8 Oct 2019 10:55:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Message-ID: <20191008085543.GF16989@phenom.ffwll.local>
References: <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local>
 <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local>
 <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local>
 <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
 <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
 <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=BvFOMXU0lVvxVhVAf6iG3XmWFHKQLWq4q3s/t3vUuSI=;
 b=keDW0c20avawqmoDajbnjLHeXUhsgAf3+UMkzMuZp6YH5Py2boVEfMVrtA+mPWfZSN
 YN1Ip75qjr9r9zTQK7teXRbCcZkkm9mJYCE0+go6pj0JjYqMABnWLR1PCSAYxmoMOWdq
 ws1Sr5ZyNSgtxDuSzFQbVmQzV6ArQzAVBTwzM=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDg6Mzc6NTBBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+IG9uY2UgbW9yZSBhIHBpbmcgb24gdGhpcy4gQW55
IG1vcmUgY29tbWVudHMgb3IgY2FuIHdlIGdldCBpdCBjb21pdHRlZD8KClNvcnJ5IGdvdCBhIGJp
dCBzbWFzaGVkIHBhc3Qgd2Vla3MsIGJ1dCBzaG91bGQgYmUgcmVzdXJyZWN0ZWQgbm93IGJhY2sK
ZnJvbSB4ZGMuCi1EYW5pZWwKPiAKPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+IAo+IEFtIDI0LjA5
LjE5IHVtIDExOjUwIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiA+IEFtIDE3LjA5LjE5IHVt
IDE2OjU2IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+PiBbU05JUF0KPiA+Pj4+Pj4+Pj4+Pj4g
wqDCoMKgwqDCoCArwqDCoMKgIC8qIFdoZW4gZWl0aGVyIHRoZSBpbXBvcnRlciBvciB0aGUgZXhw
b3J0ZXIgCj4gPj4+Pj4+Pj4+Pj4+IGNhbid0IGhhbmRsZSBkeW5hbWljCj4gPj4+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoCAqIG1hcHBpbmdzIHdlIGNhY2hlIHRoZSBtYXBwaW5nIGhlcmUgdG8gYXZvaWQg
aXNzdWVzIAo+ID4+Pj4+Pj4+Pj4+PiB3aXRoIHRoZQo+ID4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqAg
KiByZXNlcnZhdGlvbiBvYmplY3QgbG9jay4KPiA+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICovCj4g
Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKGRtYV9idWZfYXR0YWNobWVudF9pc19keW5hbWljKGF0
dGFjaCkgIT0KPiA+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9idWZfaXNfZHluYW1p
YyhkbWFidWYpKSB7Cj4gPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc2dfdGFi
bGUgKnNndDsKPiA+Pj4+Pj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpCj4gPj4+Pj4+Pj4+Pj4+ICsg
ZG1hX3Jlc3ZfbG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gPj4+Pj4+Pj4+Pj4+
ICsKPiA+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNndCA9IGRtYWJ1Zi0+b3BzLT5tYXBf
ZG1hX2J1ZihhdHRhY2gsIAo+ID4+Pj4+Pj4+Pj4+PiBETUFfQklESVJFQ1RJT05BTCk7Cj4gPj4+
Pj4+Pj4+Pj4gTm93IHdlJ3JlIGJhY2sgdG8gZW5mb3JjaW5nIERNQV9CSURJLCB3aGljaCB3b3Jr
cyBuaWNlbHkgCj4gPj4+Pj4+Pj4+Pj4gYXJvdW5kIHRoZQo+ID4+Pj4+Pj4+Pj4+IGxvY2tpbmcg
cGFpbiwgYnV0IGFwcGFyZW50bHkgdXBzZXRzIHRoZSBhcm0tc29jIGZvbGtzIHdobyAKPiA+Pj4+
Pj4+Pj4+PiB3YW50IHRvCj4gPj4+Pj4+Pj4+Pj4gY29udHJvbAo+ID4+Pj4+Pj4+Pj4+IHRoaXMg
YmV0dGVyLgo+ID4+Pj4+Pj4+Pj4gVGFrZSBhbm90aGVyIGxvb2sgYXQgZG1hX2J1Zl9tYXBfYXR0
YWNobWVudCgpLCB3ZSBzdGlsbCB0cnkgCj4gPj4+Pj4+Pj4+PiB0byBnZXQgdGhlCj4gPj4+Pj4+
Pj4+PiBjYWNoaW5nIHRoZXJlIGZvciBBUk0uCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gV2hh
dCB3ZSBkbyBoZXJlIGlzIHRvIGJpZGlyZWN0aW9uYWxseSBtYXAgdGhlIGJ1ZmZlciB0byBhdm9p
ZCAKPiA+Pj4+Pj4+Pj4+IHRoZQo+ID4+Pj4+Pj4+Pj4gbG9ja2luZyBoeWRyYSB3aGVuIGltcG9y
dGVyIGFuZCBleHBvcnRlciBkaXNhZ3JlZSBvbiBsb2NraW5nLgo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+
Pj4+Pj4+IFNvIHRoZSBBUk0gZm9sa3MgY2FuIGVhc2lseSBhdm9pZCB0aGF0IGJ5IHN3aXRjaGlu
ZyB0byAKPiA+Pj4+Pj4+Pj4+IGR5bmFtaWMgbG9ja2luZwo+ID4+Pj4+Pj4+Pj4gZm9yIGJvdGgu
Cj4gPj4+Pj4+Pj4gU28geW91IHN0aWxsIGJyZWFrIHRoZSBjb250cmFjdCBiZXR3ZWVuIGltcG9y
dGVyIGFuZCBleHBvcnRlciwgCj4gPj4+Pj4+Pj4gZXhjZXB0IG5vdAo+ID4+Pj4+Pj4+IGZvciBh
bnl0aGluZyB0aGF0J3MgcnVuIGluIGludGVsLWdmeC1jaSBzbyBhbGwgaXMgZ29vZD8KPiA+Pj4+
Pj4+IE5vLCB0aGUgY29udHJhY3QgYmV0d2VlbiBpbXBvcnRlciBhbmQgZXhwb3J0ZXIgc3RheXMg
ZXhhY3RseSB0aGUgCj4gPj4+Pj4+PiBzYW1lIGl0Cj4gPj4+Pj4+PiBpcyBjdXJyZW50bHkgYXMg
bG9uZyBhcyB5b3UgZG9uJ3Qgc3dpdGNoIHRvIGR5bmFtaWMgZG1hLWJ1ZiAKPiA+Pj4+Pj4+IGhh
bmRsaW5nLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgY2hhbmdl
IGZvciB0aGUgQVJNIGZvbGtzIGhlcmUuIFRoZSBvbmx5IAo+ID4+Pj4+Pj4gY2hhbmdlCj4gPj4+
Pj4+PiB3aGljaCB0YWtlcyBlZmZlY3QgaXMgYmV0d2VlbiBpOTE1IGFuZCBhbWRncHUgYW5kIHRo
YXQgaXMgcGVyZmVjdGx5Cj4gPj4+Pj4+PiBjb3ZlcmVkIGJ5IGludGVsLWdmeC1jaS4KPiA+Pj4+
Pj4gVGhlcmUncyBwZW9wbGUgd2hvIHdhbnQgdG8gcnVuIGFtZGdwdSBvbiBBUk0/Cj4gPj4+Pj4g
U3VyZSB0aGVyZSBhcmUsIHdlIGV2ZW4gcmVjZW50bHkgZml4ZWQgc29tZSBidWdzIGZvciB0aGlz
Lgo+ID4+Pj4+Cj4gPj4+Pj4gQnV0IGFzIGZhciBhcyBJIGtub3cgdGhlcmUgaXMgbm8gb25lIGN1
cnJlbnRseSB3aGljaCBpcyBhZmZlY3QgYnkgCj4gPj4+Pj4gdGhpcwo+ID4+Pj4+IGNoYW5nZSBv
biBBUk0gd2l0aCBhbWRncHUuCj4gPj4+PiBCdXQgZG9uJ3QgeW91IGJyZWFrIHRoZW0gd2l0aCB0
aGlzIG5vdz8KPiA+Pj4gTm8sIHdlIHNlZSB0aGUgYmlkaXJlY3Rpb25hbCBhdHRhY2htZW50IGFz
IGNvbXBhdGlibGUgd2l0aCB0aGUgb3RoZXIgCj4gPj4+IG9uZXMuCj4gPj4+Cj4gPj4+PiBhbWRn
cHUgd2lsbCBzb29uIHNldCB0aGUgZHluYW1pYyBmbGFnIG9uIGV4cG9ydHMsIHdoaWNoIGZvcmNl
cyB0aGUgCj4gPj4+PiBjYWNoaW5nCj4gPj4+PiBhdCBjcmVhdGUgdGltZSAodG8gYXZvaWQgdGhl
IGxvY2tpbmcgZnVuKSwgd2hpY2ggd2lsbCB0aGVuIHJlc3VsdCBpbiBhCj4gPj4+PiBFQlVTWSBh
dCBtYXBfYXR0YWNobWVudCB0aW1lIGJlY2F1c2Ugd2UgaGF2ZSBhIGNhY2hlZCBtYXBwaW5nLCBi
dXQgCj4gPj4+PiBpdCdzCj4gPj4+PiB0aGUgd3JvbmcgdHlwZS4KPiA+Pj4gU2VlIHRoZSBjaGVj
ayBpbiBkbWFfYnVmX21hcF9hdHRhY2htZW50KCk6Cj4gPj4+Cj4gPj4+IMKgwqDCoMKgwqAgaWYg
KGF0dGFjaC0+ZGlyICE9IGRpcmVjdGlvbiAmJiBhdHRhY2gtPmRpciAhPSBETUFfQklESVJFQ1RJ
T05BTCkKPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FQlVTWSk7Cj4g
Pj4gSG0sIEkgbWlzcmVhZCB0aGlzLiBTbyB5ZWFoIHNob3VsZCB3b3JrLCArLy0gdGhlIGlzc3Vl
IHRoYXQgd2UgbWlnaHQKPiA+PiBub3QgZmx1c2ggZW5vdWdoLiBCdXQgSSBndWVzcyB0aGF0IGNh
biBiZSBmaXhlZCB3aGVuZXZlciwgaXQncyBub3QKPiA+PiBsaWtlIGRtYS1hcGkgc2VtYW50aWNz
IGFyZSBhIGdyZWF0IGZpdCBmb3IgdXMuIE1heWJlIGEgZml4bWUgY29tbWVudAo+ID4+IHdvdWxk
IGJlIHVzZWZ1bCBoZXJlIC4uLiBJJ2xsIGxvb2sgYXQgdGhpcyB0b21vcnJvdyBvciBzbyBiZWNh
dXNlIGF0bQo+ID4+IGJyYWluIGlzIHNsb3csIEknbSBkb3duIHdpdGggdGhlIHVzdWFsIHBvc3Qt
Y29uZmVyZW5jZSBjb2xkIGl0IHNlZW1zCj4gPj4gOi0vCj4gPgo+ID4gSG9wZSB5b3VyIGFyZSBm
ZWVsaW5nIGJldHRlciBub3csIGFkZGluZyBhIGNvbW1lbnQgaXMgb2YgY291cnNlIG5vdCBhIAo+
ID4gcHJvYmxlbS4KPiA+Cj4gPiBXaXRoIHRoYXQgZml4ZWQgY2FuIEkgZ2V0IGFuIHJldmlld2Vk
LWJ5IG9yIGF0IGxlYXN0IGFuZCBhY2tlZC1ieT8KPiA+Cj4gPiBJIHdhbnQgdG8gbGFuZCBhdCBs
ZWFzdCBzb21lIHBhcnRzIG9mIHRob3NlIGNoYW5nZXMgbm93Lgo+ID4KPiA+IFJlZ2FyZHMsCj4g
PiBDaHJpc3RpYW4uCj4gPgo+ID4+IC1EYW5pZWwKPiA+Pgo+ID4KPiAKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
