Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E886E325C36
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 04:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948A6E0C4;
	Fri, 26 Feb 2021 03:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BCC6E0C4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 03:58:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 2so4519820ljr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 19:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IKcGR9mazlUUFUCJHZLpv+HgMJWAswex7iAdBxFMsas=;
 b=QXGOxOrc30RkjTFMoXYgNZN9aKZah9TJL8+FeIDzUqdOhlFB16EzADtDKwN24Pr6Me
 lVy8jOde4a3EHpWNph3fPIYrxmQGALemW9oLwX7ALKnc7/1R9sx5C3CbjvfKhg5HsGjO
 YR+W53mExuY+D9stcgZWxSVvxj8AVeezKm8eiKoZ0AF/RnoeJdAp/SD2NTlR+gpFy7M7
 9PVmZeYqeZlfLeqzvmGX67mXnbDKEwhFLVcTEIUIJZ7WDlQqM3rWwbwDPJnr/WvEZrQy
 +Ps5SPvaFb14e6C/aqVvY37js4Xu9rzne1UItA0EumXeC0VlTbQhgt4vkiWON27I8K9W
 3EBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IKcGR9mazlUUFUCJHZLpv+HgMJWAswex7iAdBxFMsas=;
 b=gN7T875kLE90RBRCSA1lCYqSeekOI78CUddazMUBE+lGfYOqCLYg0VeZA4A9l8L0+f
 0HBHsdaHfSArJ46Dx78peucX52iKI4lNA42o6IoZ3PFCtdKjZY/UCws75/2I1AibDMLY
 OQHIlOo+XuObVmhg1ySzOPW1smRXMyOKR5OqQOpX5gNV9IvLYNc56u4+pYJatPyw3CHL
 HOeTmaswkdo+CgUaRP+/C1uA9H7p5eF2H218zTTIltXkMyrxQjhsrW2P0EVEKZOym4Ud
 GAeDM/4EHOc3TrbSWPa7I2WpSeAT5sCaBwGmejO6jjXq9N2/v0hztObrkYxUC1j9fh+o
 MDnw==
X-Gm-Message-State: AOAM5301zML+Bqtzho4vA9yIJV4V8fyQOtnMc72qju5TqZmpZyVD95vL
 QWNBOvOz0yvt0mQt5kQnUJRsIdpBWMFu/8ISmE5D2Q==
X-Google-Smtp-Source: ABdhPJx/pbxqQ4tVmMGKowXmBZLmvQbMe0LIG0j9zdeku6gTbxeiU4ZEHNZuRd9UmA3p7DxDyFxh2XaIyMxq6HHuOIU=
X-Received: by 2002:a2e:8ec6:: with SMTP id e6mr505307ljl.257.1614311882892;
 Thu, 25 Feb 2021 19:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 25 Feb 2021 19:57:48 -0800
Message-ID: <CALAqxLURCOA9vfw3VqhUTtf_n6nsTHaA+F1Gu32U3pW8zW-YTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Hridya Valsaraju <hridya@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjMsIDIwMjEgYXQgMzowMCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IHRsZHI7IERNQSBidWZmZXJzIGFyZW4ndCBub3JtYWwg
bWVtb3J5LCBleHBlY3RpbmcgdGhhdCB5b3UgY2FuIHVzZQo+IHRoZW0gbGlrZSB0aGF0IChsaWtl
IGNhbGxpbmcgZ2V0X3VzZXJfcGFnZXMgd29ya3MsIG9yIHRoYXQgdGhleSdyZQo+IGFjY291bnRp
bmcgbGlrZSBhbnkgb3RoZXIgbm9ybWFsIG1lbW9yeSkgY2Fubm90IGJlIGd1YXJhbnRlZWQuCj4K
PiBTaW5jZSBzb21lIHVzZXJzcGFjZSBvbmx5IHJ1bnMgb24gaW50ZWdyYXRlZCBkZXZpY2VzLCB3
aGVyZSBhbGwKPiBidWZmZXJzIGFyZSBhY3R1YWxseSBhbGwgcmVzaWRlbnQgc3lzdGVtIG1lbW9y
eSwgdGhlcmUncyBhIGh1Z2UKPiB0ZW1wdGF0aW9uIHRvIGFzc3VtZSB0aGF0IGEgc3RydWN0IHBh
Z2UgaXMgYWx3YXlzIHByZXNlbnQgYW5kIHVzZWFibGUKPiBsaWtlIGZvciBhbnkgbW9yZSBwYWdl
Y2FjaGUgYmFja2VkIG1tYXAuIFRoaXMgaGFzIHRoZSBwb3RlbnRpYWwgdG8KPiByZXN1bHQgaW4g
YSB1YXBpIG5pZ2h0bWFyZS4KPgo+IFRvIHN0b3AgdGhpcyBnYXAgcmVxdWlyZSB0aGF0IERNQSBi
dWZmZXIgbW1hcHMgYXJlIFZNX1BGTk1BUCwgd2hpY2gKPiBibG9ja3MgZ2V0X3VzZXJfcGFnZXMg
YW5kIGFsbCB0aGUgb3RoZXIgc3RydWN0IHBhZ2UgYmFzZWQKPiBpbmZyYXN0cnVjdHVyZSBmb3Ig
ZXZlcnlvbmUuIEluIHNwaXJpdCB0aGlzIGlzIHRoZSB1YXBpIGNvdW50ZXJwYXJ0IHRvCj4gdGhl
IGtlcm5lbC1pbnRlcm5hbCBDT05GSUdfRE1BQlVGX0RFQlVHLgo+Cj4gTW90aXZhdGVkIGJ5IGEg
cmVjZW50IHBhdGNoIHdoaWNoIHdhbnRlZCB0byBzd2ljaCB0aGUgc3lzdGVtIGRtYS1idWYKPiBo
ZWFwIHRvIHZtX2luc2VydF9wYWdlIGluc3RlYWQgb2Ygdm1faW5zZXJ0X3Bmbi4KPgo+IHYyOgo+
Cj4gSmFzb24gYnJvdWdodCB1cCB0aGF0IHdlIGFsc28gd2FudCB0byBndWFyYW50ZWUgdGhhdCBh
bGwgcHRlcyBoYXZlIHRoZQo+IHB0ZV9zcGVjaWFsIGZsYWcgc2V0LCB0byBjYXRjaCBmYXN0IGdl
dF91c2VyX3BhZ2VzIChvbiBhcmNoaXRlY3R1cmVzCj4gdGhhdCBzdXBwb3J0IHRoaXMpLiBBbGxv
d2luZyBWTV9NSVhFRE1BUCAobGlrZSBWTV9TUEVDSUFMIGRvZXMpIHdvdWxkCj4gc3RpbGwgYWxs
b3cgdm1faW5zZXJ0X3BhZ2UsIGJ1dCBsaW1pdGluZyB0byBWTV9QRk5NQVAgd2lsbCBjYXRjaCB0
aGF0Lgo+Cj4gRnJvbSBhdWRpdGluZyB0aGUgdmFyaW91cyBmdW5jdGlvbnMgdG8gaW5zZXJ0IHBm
biBwdGUgZW50aXJlcwo+ICh2bV9pbnNlcnRfcGZuX3Byb3QsIHJlbWFwX3Bmbl9yYW5nZSBhbmQg
YWxsIGl0J3MgY2FsbGVycyBsaWtlCj4gZG1hX21tYXBfd2MpIGl0IGxvb2tzIGxpa2UgVk1fUEZO
TUFQIGlzIGFscmVhZHkgcmVxdWlyZWQgYW55d2F5LCBzbwo+IHRoaXMgc2hvdWxkIGJlIHRoZSBj
b3JyZWN0IGZsYWcgdG8gY2hlY2sgZm9yLgo+Cj4gUmVmZXJlbmNlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC9DQUtNSzd1SGkrbUcwejBIVW1OdDEzUUNDdnV0dVJWanBjUjBOalJMMTJr
LVdiV3prUmdAbWFpbC5nbWFpbC5jb20vCj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUu
Y2E+Cj4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4gQ2M6IE1h
dHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IENjOiBKb2huIFN0dWx0eiA8am9o
bi5zdHVsdHpAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2ln
QGxpc3RzLmxpbmFyby5vcmcKPiAtLS0KPiAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8IDE1
ICsrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCgpTbyBJIGdhdmUgdGhpcyBhIHNwaW4gaW4gYSBmZXcgb2YgbXkgZW52aXJv
bm1lbnRzLCBhbmQgd2l0aCB0aGUKY3VycmVudCBkbWFidWYgaGVhcHMgaXQgc3Bld3MgYSBsb3Qg
b2Ygd2FybmluZ3MuCgpJJ20gdGVzdGluZyBzb21lIHNpbXBsZSBmaXhlcyB0byBhZGQ6CiAgICB2
bWEtPnZtX2ZsYWdzIHw9IFZNX1BGTk1BUDsKCnRvIHRoZSBkbWFidWYgaGVhcCBtbWFwIG9wcywg
d2hpY2ggd2UgbWlnaHQgd2FudCB0byBxdWV1ZSBhbG9uZyBzaWRlIG9mIHRoaXMuCgpTbyBhc3N1
bWluZyB0aG9zZSBjYW4gbGFuZCB0b2dldGhlci4KQWNrZWQtYnk6IEpvaG4gU3R1bHR6IDxqb2hu
LnN0dWx0ekBsaW5hcm8ub3JnPgoKdGhhbmtzCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
