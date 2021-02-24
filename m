Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865C323978
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 10:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77C46EA6D;
	Wed, 24 Feb 2021 09:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E986EA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 09:31:23 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id y21so350117oou.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yO64SmF65dLY5inu45BzDUbRVbnNPzs6fQ+9WkgdAR8=;
 b=TIsLL882GLiZNhcHf5unEMZEEnFIa54ZLe5U8QQXYUbIS6B83GgN3p5lTRVgVBteTN
 ux2DpZTQ3C82WU0Aakm66BUOZZtmhfWzbUltanmo61Xfc+9Lv4z45CwhhJ/u849ho1Tt
 8T7j/EuCTQeq3/akwjtS/+t0ObWgku+D7wFc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yO64SmF65dLY5inu45BzDUbRVbnNPzs6fQ+9WkgdAR8=;
 b=Hg+8fFfy+g+O1smXYdMtXGaoMRWdiwfjv5KmdqJBw8Ees+kaQ9d6tdHPfc2iG3cEKy
 wbBPKW928PnU3izyg0uF9mHikY+MmCybdccZg05zRVMqtpZ7hSfNL2ckZNH9cDbPIU4q
 YRbN4ryh29ECMb5gaoWQ68s3QE6NMTzPLPLjtQxmpfpsMM3ua8cYENam30w+qox9EsTt
 Jc7vQiOX/M1ONZntts6l1DIkQm9DSiRUXnrLDlD8GRVIjMxJBamnZ8j8CKqQIBZ7yYbm
 uAruTX8hgqMQxDqDE/NfPf2JDw+vzTFFQZa9j8ja1wSk7hy2di/dBKwGSdvFPU+68aL5
 bBzg==
X-Gm-Message-State: AOAM532GWwuDWkZTxsnu0lr6aj9I/2v8sqbjj58Ned5tr/m0eWkfeKOk
 32gMhlRIcveS+8PABvy9yr/7U8Wn5U6Hqa/Bm7dV5A==
X-Google-Smtp-Source: ABdhPJxlGpWmTxsLgmVmbNO5tD2KdzisUXxYIdnLolzjBnYjQ/PpY6Z8HGSVScSYuQZ6smpaISRIESBzC9ltbmHvb3k=
X-Received: by 2002:a4a:be01:: with SMTP id l1mr18496246oop.89.1614159082849; 
 Wed, 24 Feb 2021 01:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
In-Reply-To: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 24 Feb 2021 10:31:11 +0100
Message-ID: <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgMTA6MTYgQU0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVs
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPgo+IE9uIDIvMjQvMjEgOTo0NSBB
TSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDI0LCAyMDIxIGF0IDg6NDYg
QU0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+ID4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+
IHdyb3RlOgo+ID4+Cj4gPj4gT24gMi8yMy8yMSAxMTo1OSBBTSwgRGFuaWVsIFZldHRlciB3cm90
ZToKPiA+Pj4gdGxkcjsgRE1BIGJ1ZmZlcnMgYXJlbid0IG5vcm1hbCBtZW1vcnksIGV4cGVjdGlu
ZyB0aGF0IHlvdSBjYW4gdXNlCj4gPj4+IHRoZW0gbGlrZSB0aGF0IChsaWtlIGNhbGxpbmcgZ2V0
X3VzZXJfcGFnZXMgd29ya3MsIG9yIHRoYXQgdGhleSdyZQo+ID4+PiBhY2NvdW50aW5nIGxpa2Ug
YW55IG90aGVyIG5vcm1hbCBtZW1vcnkpIGNhbm5vdCBiZSBndWFyYW50ZWVkLgo+ID4+Pgo+ID4+
PiBTaW5jZSBzb21lIHVzZXJzcGFjZSBvbmx5IHJ1bnMgb24gaW50ZWdyYXRlZCBkZXZpY2VzLCB3
aGVyZSBhbGwKPiA+Pj4gYnVmZmVycyBhcmUgYWN0dWFsbHkgYWxsIHJlc2lkZW50IHN5c3RlbSBt
ZW1vcnksIHRoZXJlJ3MgYSBodWdlCj4gPj4+IHRlbXB0YXRpb24gdG8gYXNzdW1lIHRoYXQgYSBz
dHJ1Y3QgcGFnZSBpcyBhbHdheXMgcHJlc2VudCBhbmQgdXNlYWJsZQo+ID4+PiBsaWtlIGZvciBh
bnkgbW9yZSBwYWdlY2FjaGUgYmFja2VkIG1tYXAuIFRoaXMgaGFzIHRoZSBwb3RlbnRpYWwgdG8K
PiA+Pj4gcmVzdWx0IGluIGEgdWFwaSBuaWdodG1hcmUuCj4gPj4+Cj4gPj4+IFRvIHN0b3AgdGhp
cyBnYXAgcmVxdWlyZSB0aGF0IERNQSBidWZmZXIgbW1hcHMgYXJlIFZNX1BGTk1BUCwgd2hpY2gK
PiA+Pj4gYmxvY2tzIGdldF91c2VyX3BhZ2VzIGFuZCBhbGwgdGhlIG90aGVyIHN0cnVjdCBwYWdl
IGJhc2VkCj4gPj4+IGluZnJhc3RydWN0dXJlIGZvciBldmVyeW9uZS4gSW4gc3Bpcml0IHRoaXMg
aXMgdGhlIHVhcGkgY291bnRlcnBhcnQgdG8KPiA+Pj4gdGhlIGtlcm5lbC1pbnRlcm5hbCBDT05G
SUdfRE1BQlVGX0RFQlVHLgo+ID4+Pgo+ID4+PiBNb3RpdmF0ZWQgYnkgYSByZWNlbnQgcGF0Y2gg
d2hpY2ggd2FudGVkIHRvIHN3aWNoIHRoZSBzeXN0ZW0gZG1hLWJ1Zgo+ID4+PiBoZWFwIHRvIHZt
X2luc2VydF9wYWdlIGluc3RlYWQgb2Ygdm1faW5zZXJ0X3Bmbi4KPiA+Pj4KPiA+Pj4gdjI6Cj4g
Pj4+Cj4gPj4+IEphc29uIGJyb3VnaHQgdXAgdGhhdCB3ZSBhbHNvIHdhbnQgdG8gZ3VhcmFudGVl
IHRoYXQgYWxsIHB0ZXMgaGF2ZSB0aGUKPiA+Pj4gcHRlX3NwZWNpYWwgZmxhZyBzZXQsIHRvIGNh
dGNoIGZhc3QgZ2V0X3VzZXJfcGFnZXMgKG9uIGFyY2hpdGVjdHVyZXMKPiA+Pj4gdGhhdCBzdXBw
b3J0IHRoaXMpLiBBbGxvd2luZyBWTV9NSVhFRE1BUCAobGlrZSBWTV9TUEVDSUFMIGRvZXMpIHdv
dWxkCj4gPj4+IHN0aWxsIGFsbG93IHZtX2luc2VydF9wYWdlLCBidXQgbGltaXRpbmcgdG8gVk1f
UEZOTUFQIHdpbGwgY2F0Y2ggdGhhdC4KPiA+Pj4KPiA+Pj4gICBGcm9tIGF1ZGl0aW5nIHRoZSB2
YXJpb3VzIGZ1bmN0aW9ucyB0byBpbnNlcnQgcGZuIHB0ZSBlbnRpcmVzCj4gPj4+ICh2bV9pbnNl
cnRfcGZuX3Byb3QsIHJlbWFwX3Bmbl9yYW5nZSBhbmQgYWxsIGl0J3MgY2FsbGVycyBsaWtlCj4g
Pj4+IGRtYV9tbWFwX3djKSBpdCBsb29rcyBsaWtlIFZNX1BGTk1BUCBpcyBhbHJlYWR5IHJlcXVp
cmVkIGFueXdheSwgc28KPiA+Pj4gdGhpcyBzaG91bGQgYmUgdGhlIGNvcnJlY3QgZmxhZyB0byBj
aGVjayBmb3IuCj4gPj4+Cj4gPj4gSWYgd2UgcmVxdWlyZSBWTV9QRk5NQVAsIGZvciBvcmRpbmFy
eSBwYWdlIG1hcHBpbmdzLCB3ZSBhbHNvIG5lZWQgdG8KPiA+PiBkaXNhbGxvdyBDT1cgbWFwcGlu
Z3MsIHNpbmNlIGl0IHdpbGwgbm90IHdvcmsgb24gYXJjaGl0ZWN0dXJlcyB0aGF0Cj4gPj4gZG9u
J3QgaGF2ZSBDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUwsIChzZWUgdGhlIGRvY3MgZm9yIHZt
X25vcm1hbF9wYWdlKCkpLgo+ID4gSG0gSSBmaWd1cmVkIGV2ZXJ5b25lIGp1c3QgdXNlcyBNQVBf
U0hBUkVEIGZvciBidWZmZXIgb2JqZWN0cyBzaW5jZQo+ID4gQ09XIHJlYWxseSBtYWtlcyBhYnNv
bHV0ZWx5IG5vIHNlbnNlLiBIb3cgd291bGQgd2UgZW5mb3JjZSB0aGlzPwo+Cj4gUGVyaGFwcyBy
ZXR1cm5pbmcgLUVJTlZBTCBvbiBpc19jb3dfbWFwcGluZygpIGF0IG1tYXAgdGltZS4gRWl0aGVy
IHRoYXQKPiBvciBhbGxvd2luZyBNSVhFRE1BUC4KPgo+ID4+IEFsc28gd29ydGggbm90aW5nIGlz
IHRoZSBjb21tZW50IGluICB0dG1fYm9fbW1hcF92bWFfc2V0dXAoKSB3aXRoCj4gPj4gcG9zc2li
bGUgcGVyZm9ybWFuY2UgaW1wbGljYXRpb25zIHdpdGggeDg2ICsgUEFUICsgVk1fUEZOTUFQICsg
bm9ybWFsCj4gPj4gcGFnZXMuIFRoYXQncyBhIHZlcnkgb2xkIGNvbW1lbnQsIHRob3VnaCwgYW5k
IG1pZ2h0IG5vdCBiZSB2YWxpZCBhbnltb3JlLgo+ID4gSSB0aGluayB0aGF0J3Mgd2h5IHR0bSBo
YXMgYSBwYWdlIGNhY2hlIGZvciB0aGVzZSwgYmVjYXVzZSBpdCBpbmRlZWQKPiA+IHN1Y2tzLiBU
aGUgUEFUIGNoYW5nZXMgb24gcGFnZXMgYXJlIHJhdGhlciBleHBlbnNpdmUuCj4KPiBJSVJDIHRo
ZSBwYWdlIGNhY2hlIHdhcyBpbXBsZW1lbnRlZCBiZWNhdXNlIG9mIHRoZSBzbG93bmVzcyBvZiB0
aGUKPiBjYWNoaW5nIG1vZGUgdHJhbnNpdGlvbiBpdHNlbGYsIG1vcmUgc3BlY2lmaWNhbGx5IHRo
ZSB3YmludmQoKSBjYWxsICsKPiBnbG9iYWwgVExCIGZsdXNoLgo+Cj4gPgo+ID4gVGhlcmUgaXMg
c3RpbGwgYW4gaXNzdWUgZm9yIGlvbWVtIG1hcHBpbmdzLCBiZWNhdXNlIHRoZSBQQVQgdmFsaWRh
dGlvbgo+ID4gZG9lcyBhIGxpbmVhciB3YWxrIG9mIHRoZSByZXNvdXJjZSB0cmVlIChsb2wpIGZv
ciBldmVyeSB2bV9pbnNlcnRfcGZuLgo+ID4gQnV0IGZvciBpOTE1IGF0IGxlYXN0IHRoaXMgaXMg
Zml4ZWQgYnkgdXNpbmcgdGhlIGlvX21hcHBpbmcKPiA+IGluZnJhc3RydWN0dXJlLCB3aGljaCBk
b2VzIHRoZSBQQVQgcmVzZXJ2YXRpb24gb25seSBvbmNlIHdoZW4geW91IHNldAo+ID4gdXAgdGhl
IG1hcHBpbmcgYXJlYSBhdCBkcml2ZXIgbG9hZC4KPgo+IFllcywgSSBndWVzcyB0aGF0IHdhcyB0
aGUgaXNzdWUgdGhhdCB0aGUgY29tbWVudCBkZXNjcmliZXMsIGJ1dCB0aGUKPiBpc3N1ZSB3YXNu
J3QgdGhlcmUgd2l0aCB2bV9pbnNlcnRfbWl4ZWQoKSArIFZNX01JWEVETUFQLgo+Cj4gPgo+ID4g
QWxzbyBUVE0gdXNlcyBWTV9QRk5NQVAgcmlnaHQgbm93IGZvciBldmVyeXRoaW5nLCBzbyBpdCBj
YW4ndCBiZSBhCj4gPiBwcm9ibGVtIHRoYXQgaHVydHMgbXVjaCA6LSkKPgo+IEhtbSwgYm90aCA1
LjExIGFuZCBkcm0tdGlwIGFwcGVhcnMgdG8gc3RpbGwgdXNlIE1JWEVETUFQPwo+Cj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib192bS5jI0w1NTQKClVoIHRoYXQncyBiYWQsIGJlY2F1c2UgbWl4ZWQgbWFwcyBw
b2ludGluZyBhdCBzdHJ1Y3QgcGFnZSB3b250IHN0b3AKZ3VwLiBBdCBsZWFzdCBhZmFpay4KCkNo
cmlzdGlhbiwgZG8gd2UgbmVlZCB0byBwYXRjaCB0aGlzIHVwLCBhbmQgbWF5YmUgZml4IHVwIHR0
bSBmYXVsdApoYW5kbGVyIHRvIHVzZSBpb19tYXBwaW5nIHNvIHRoZSB2bV9pbnNlcnRfcGZuIHN0
dWZmIGlzIGZhc3Q/Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
