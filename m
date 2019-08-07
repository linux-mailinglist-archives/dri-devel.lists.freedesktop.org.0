Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B896184754
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 10:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CEA6E697;
	Wed,  7 Aug 2019 08:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38D6E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 08:28:12 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z23so72731470ote.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 01:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VqkYW5Pb9NPAUWAJ1Hm+13eBgHLhXTSOzj6pGDrWaE=;
 b=bQAt58Mp1o0UGxXh5bipo8MVjnxTMcSDp2iaiAxFr7ty3bVdQ4490tFEMDXiMnB2pL
 9mcuckt3CaFP8Ckyxl5HAlbfIWHzxjR2iryhHA+PcXDiy3CaYXP00W26iwpb84uWfnF2
 VWxig3Q1aDdmRD7Ov/GCLZO7dvZ1MP9PPbOT7LrQ6rM/oy8+0j1t0Aq2M0Jw2LJiROc0
 pdwcnnVR/O89X3LgWi8Cmi8hqRfVu+Cxy/vZ7/L8BWuekfQadvH174nJjfQglimdKj3e
 vUaCaA7PUqi5GL6o/0jjn2xhEZnqA3JennvrM5JMVqysHUtzbCRLe7N2X1EJ0gx6EYhL
 s9zw==
X-Gm-Message-State: APjAAAXgP558wcLlrhkSEGSLeyWCV156le1dTP/B9q5BaInhEKVGQiLw
 ntQFG8TJ1NNSx/UUEP+IcJKRgmGdDx01XxXzuEZ8nw==
X-Google-Smtp-Source: APXvYqymZlQCH2slZ+gCrcXV1SxxswvEQuyAECRxiL0EEkmtaR83NXQNrJ+EDazQrKj4+NEKCBEgfpvvPGGKw6+EC7A=
X-Received: by 2002:a05:6808:118:: with SMTP id
 b24mr4623781oie.128.1565166491437; 
 Wed, 07 Aug 2019 01:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190806133454.8254-1-kraxel@redhat.com>
 <20190806133454.8254-2-kraxel@redhat.com>
 <20190806135426.GA7444@phenom.ffwll.local>
 <20190807072654.arqvx37p4yxhegcu@sirius.home.kraxel.org>
In-Reply-To: <20190807072654.arqvx37p4yxhegcu@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 7 Aug 2019 10:28:00 +0200
Message-ID: <CAKMK7uFyKd71w4H8nFk=WPSHL3KMwQ6kLwAMXTd_TAkrkJ++KQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: add gem ttm helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6VqkYW5Pb9NPAUWAJ1Hm+13eBgHLhXTSOzj6pGDrWaE=;
 b=QK21tnj2wA2WAGFXzboom94BfRwn1VGhGTG6G9qemB4Z1SDyDwLhNic25qBROeA+AO
 Otpbp/+1Z5xkFz2u3hnoNZl/7sxTpen5B6V3/zwbN6d3y8xKK5XCIRXb4BBm3yOt9/uk
 dmBZXigpTm+moy+wJpK9MV+2TKlKA3eVZ91iM=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCA5OjI5IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ID4gPiArLyoqCj4gPiA+ICsgKiBkcm1fZ2VtX3R0bV9tbWFwX29m
ZnNldCgpIC0gUmV0dXJucyBhIEdFTSB0dG0gb2JqZWN0J3MgbW1hcCBvZmZzZXQKPiA+ID4gKyAq
IEBnYm86ICAgdGhlIEdFTSB0dG0gb2JqZWN0Cj4gPiA+ICsgKgo+ID4gPiArICogU2VlIGRybV92
bWFfbm9kZV9vZmZzZXRfYWRkcigpIGZvciBtb3JlIGluZm9ybWF0aW9uLgo+ID4gPiArICoKPiA+
ID4gKyAqIFJldHVybnM6Cj4gPiA+ICsgKiBUaGUgYnVmZmVyIG9iamVjdCdzIG9mZnNldCBmb3Ig
dXNlcnNwYWNlIG1hcHBpbmdzIG9uIHN1Y2Nlc3MsIG9yCj4gPiA+ICsgKiAwIGlmIG5vIG9mZnNl
dCBpcyBhbGxvY2F0ZWQuCj4gPiA+ICsgKi8KPiA+ID4gK3U2NCBkcm1fZ2VtX3R0bV9tbWFwX29m
ZnNldChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ID4gPiArewo+ID4gPiArICAgcmV0
dXJuIGRybV92bWFfbm9kZV9vZmZzZXRfYWRkcigmYm8tPmJhc2Uudm1hX25vZGUpOwo+ID4KPiA+
IFdoeSBkbyB3ZSBuZWVkIGEgbmV3IG9uZSBoZXJlLCBjYW4ndCB3ZSB1c2UgdGhlIGV4aXN0aW5n
IGdlbQo+ID4gaW1wbGVtZW50YXRpb24gZm9yIHRoaXMgKHRoZXJlIHJlYWxseSBzaG91bGQgb25s
eSBiZSBvbmUgSSBob3BlLCBidXQgSQo+ID4gZGlkbid0IGNoZWNrKS4KPgo+IEhhdm4ndCBmb3Vu
ZCBvbmUuCgpJdCBnb3QgcmV2ZXJ0ZWQgb3V0IGFnYWluOgoKY29tbWl0IDQxNWQyZTllMDc1NzRk
M2RlNjNiOGRmNzdkYzY4NmUwZWJmNjQ4NjUKQXV0aG9yOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgpEYXRlOiAgIFdlZCBKdWwgMyAxNjozODo1MCAyMDE5IC0wNjAwCgogICAgUmV2ZXJ0
ICJkcm0vZ2VtOiBSZW5hbWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKSB0byBkcm1fZ2VtX21h
cF9vZmZzZXQoKSIKCgo+IEJ1dCBtYXliZSB3ZSBkb24ndCBuZWVkIHRoaXMgYXMgc2VwYXJhdGUg
ZnVuY3Rpb24gYW5kIGNhbiBzaW1wbHkgbW92ZQo+IHRoZSBkcm1fdm1hX25vZGVfb2Zmc2V0X2Fk
ZHIoKSBjYWxsIGludG8KPiBkcm1fZ2VtX3R0bV9kcml2ZXJfZHVtYl9tbWFwX29mZnNldCgpLgo+
Cj4gPiA+ICtpbnQgZHJtX2dlbV90dG1fZHJpdmVyX2R1bWJfbW1hcF9vZmZzZXQoc3RydWN0IGRy
bV9maWxlICpmaWxlLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IGhhbmRsZSwgdWludDY0X3QgKm9mZnNldCkKPiA+ID4gK3sKPiA+
ID4gKyAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtOwo+ID4gPiArICAgc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibzsKPiA+ID4gKwo+ID4gPiArICAgZ2VtID0gZHJtX2dlbV9vYmplY3Rf
bG9va3VwKGZpbGUsIGhhbmRsZSk7Cj4gPiA+ICsgICBpZiAoIWdlbSkKPiA+ID4gKyAgICAgICAg
ICAgcmV0dXJuIC1FTk9FTlQ7Cj4gPiA+ICsKPiA+ID4gKyAgIGJvID0gZHJtX2dlbV90dG1fb2Zf
Z2VtKGdlbSk7Cj4gPiA+ICsgICAqb2Zmc2V0ID0gZHJtX2dlbV90dG1fbW1hcF9vZmZzZXQoYm8p
Owo+ID4gPiArCj4gPiA+ICsgICBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoZ2VtKTsKPiA+
ID4gKwo+ID4gPiArICAgcmV0dXJuIDA7Cj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRfU1lNQk9MKGRy
bV9nZW1fdHRtX2RyaXZlcl9kdW1iX21tYXBfb2Zmc2V0KTsKPiA+Cj4gPiBTYW1lIGZvciB0aGlz
LCB5b3UncmUganVzdCB1cGNhc3RpbmcgdG8gdHRtX2JvIGFuZCB0aGVuIGRvd25jYXN0aW5nIHRv
Cj4gPiBnZW1fYm8gYWdhaW4gLi4uIEkgdGhpbmsganVzdCBhIHNlcmllcyB0byByb2xsIG91dCB0
aGUgZXhpc3RpbmcgZ2VtCj4gPiBoZWxwZXJzIGV2ZXJ5d2hlcmUgc2hvdWxkIHdvcms/Cj4KPiBJ
IGRvbid0IHRoaW5rIHNvLiAgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKSBjYWxscwo+IGRybV9n
ZW1fY3JlYXRlX21tYXBfb2Zmc2V0KCksIHdoaWNoIEkgdGhpbmsgaXMgbm90IGNvcnJlY3QgZm9y
IHR0bQo+IG9iamVjdHMgYmVjYXVzZSB0dG1fYm9faW5pdCgpIGhhbmRsZXMgdm1hX25vZGUgaW5p
dGlhbGl6YXRpb24uCgpNb3JlIGNvZGUgdG8gdW5pZnkgZmlyc3Q/IFRoaXMgc2hvdWxkIHdvcmsg
ZXhhY3RseSB0aGUgc2FtZSB3YXkgZm9yCmFsbCBnZW0gYmFzZWQgZHJpdmVycyBJIHRoaW5rIC4u
LiBPbmx5IHRyaWNreSBiaXQgaXMgbWFraW5nIHN1cmUKdm13Z2Z4IGtlZXBzIHdvcmtpbmcgY29y
cmVjdGx5LgotRGFuaWVsCgo+Cj4gY2hlZXJzLAo+ICAgR2VyZAo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
