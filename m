Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B73104FEF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9F96ECAC;
	Thu, 21 Nov 2019 10:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2336ECBE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:03:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z10so3546275wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 02:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ADQfXV/ZdBmAvhUeKoJdtoj4eaZ6jKMToDVt0g/hiZ0=;
 b=BgsXLxoHqM1BSx0fkP7M1ccG7KCBlBpuj4EFzapeS3j3cuuVbZr2/FrfBS0KyXputq
 t3Wwq65PPH9H7eusChiKUW1Trcng2neklCKAQMR/3g7mOBRZh232dlD1FEPYvcXzf2tM
 slP8Wmmk9H7ymZLjlhQ7Br9jHuLXOcdU+NFeMeT2KOBNZAq4WUx5VdTrQ+PegFGhfScd
 DPz16YvOVteEFXDQiFEIX73nXpL3QXBSxR1yYre2bqISoqCyuGQZ2HaeL/ZMOXTleQxt
 tlRL1ZgAQp3CbNbu21Y22hUX/pdjQ9HWZxqeheUivF7Qd6vkpCu+aInUhr6ogul+jC/4
 K0vA==
X-Gm-Message-State: APjAAAXYERwjQvwO2fbzuHuUpDNzgkmu7mN96oilWDgHTgUf6+9g1KgJ
 nftzxF22zKmqxFBBIoLGqf87Bg==
X-Google-Smtp-Source: APXvYqydOY6IPhMnVYG21yFQvXKIex0lWaUrqVM9jbk9TfQQq7jLwWaEUHAa0mqRffVzCihyTKeHLA==
X-Received: by 2002:adf:9381:: with SMTP id 1mr9374508wrp.10.1574330635996;
 Thu, 21 Nov 2019 02:03:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id k4sm2484450wmk.26.2019.11.21.02.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:03:55 -0800 (PST)
Date: Thu, 21 Nov 2019 11:03:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: Don't init ww_mutec acquire ctx before needed
Message-ID: <20191121100353.GD6236@phenom.ffwll.local>
References: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
 <20191120105607.3023-1-daniel.vetter@ffwll.ch>
 <CAF6AEGt9N7EYHFOofU-9pBTs8X+w2h30a_KvTg3BVARbChAWZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGt9N7EYHFOofU-9pBTs8X+w2h30a_KvTg3BVARbChAWZA@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ADQfXV/ZdBmAvhUeKoJdtoj4eaZ6jKMToDVt0g/hiZ0=;
 b=JXZNcIquE1Prcq4dZt2gKgvVllYpusvOv9mcAefjEfxB9FZdGVZu60zbJYUBXvgd4n
 twaU7fSUDfg+h0mMDLx75OhOVfprutSjvQ0CC7yxjFZoC9aw7aASMaInlW6CfHD+NeqK
 H3FJtjQfwV07ZWgONmDDKX65cHZtgbQbkWN40=
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDQ6MjQ6NDhQTSAtMDgwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDI6NTYgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gRm9yIGxvY2tpbmcgc2VtYW50aWNzIGl0
IHJlYWxseSBkb2Vzbid0IG1hdHRlciB3aGVuIHdlIGdyYWIgdGhlCj4gPiB0aWNrZXQuIEJ1dCBm
b3IgbG9ja2RlcCB2YWxpZGF0aW9uIGl0IGRvZXM6IHRoZSBhY3F1aXJlIGN0eCBpcyBhIGZha2UK
PiA+IGxvY2tkZXAuIFNpbmNlIG90aGVyIGRyaXZlcnMgbWlnaHQgd2FudCB0byBkbyBhIGZ1bGwg
bXVsdGktbG9jayBkYW5jZQo+ID4gaW4gdGhlaXIgZmF1bHQtaGFuZGxlciwgbm90IGp1c3QgbG9j
ayBhIHNpbmdsZSBkbWFfcmVzdi4gVGhlcmVmb3JlIHdlCj4gPiBtdXN0IGluaXQgdGhlIGFjcXVp
cmVfY3R4IG9ubHkgYWZ0ZXIgd2UndmUgZG9uZSBhbGwgdGhlIGNvcHlfKl91c2VyIG9yCj4gPiBh
bnl0aGluZyBlbHNlIHRoYXQgbWlnaHQgdHJpZ2dlciBhIHBhZ2VmYXVsdC4gRm9yIG1zbSB0aGlz
IG1lYW5zIHdlCj4gPiBuZWVkIHRvIG1vdmUgaXQgcGFzdCBzdWJtaXRfbG9va3VwX29iamVjdHMu
Cj4gPgo+ID4gQXNpZGU6IFdoeSBpcyBtc20gc3RpbGwgdXNpbmcgc3RydWN0X211dGV4LCBpdCBz
ZWVtcyB0byBiZSB1c2luZwo+ID4gZG1hX3Jlc3ZfbG9jayBmb3IgZ2VuZXJhbCBidWZmZXIgc3Rh
dGUgcHJvdGVjdGlvbj8KPiA+Cj4gPiB2MjoKPiA+IC0gQWRkIGNvbW1lbnQgdG8gZXhwbGFpbiB3
aHkgdGhlIHd3IHRpY2tldCBzZXR1cCBpcyBzZXBhcmF0ZSAoUm9iKQo+ID4gLSBGaXggdXAgZXJy
b3IgaGFuZGxpbmcsIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHdlIGRvbid0IGNhbGwKPiA+ICAgd3df
YWNxdWlyZV9maW5pIHdpdGhvdXQgX2luaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAZ21haWwuY29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4g
Q2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gPiBDYzogZnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IAo+IGZvdW5kIGEgZmV3IG1pbnV0ZXMgdG8gdGFrZSB0aGlzIGZv
ciBhIHNwaW4gYW5kIHNlZW1zIGZpbmUuLiB0LWIgJiYgci1iCgpUaGFua3MgZm9yIHRha2luZyB0
aGlzIGZvciBhIHNwaW4sIGVudGlyZSBzZXJpZXMgYXBwbGllZC4KLURhbmllbAoKPiAKPiBCUiwK
PiAtUgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5j
IHwgOSArKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9n
ZW1fc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKPiA+IGlu
ZGV4IGZiMWZkZDdmYTNlZi4uMzg1ZDQ5NjVhOGQwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9nZW1fc3VibWl0LmMKPiA+IEBAIC01NCw3ICs1NCw2IEBAIHN0YXRpYyBzdHJ1Y3QgbXNt
X2dlbV9zdWJtaXQgKnN1Ym1pdF9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+Cj4g
PiAgICAgICAgIElOSVRfTElTVF9IRUFEKCZzdWJtaXQtPm5vZGUpOwo+ID4gICAgICAgICBJTklU
X0xJU1RfSEVBRCgmc3VibWl0LT5ib19saXN0KTsKPiA+IC0gICAgICAgd3dfYWNxdWlyZV9pbml0
KCZzdWJtaXQtPnRpY2tldCwgJnJlc2VydmF0aW9uX3d3X2NsYXNzKTsKPiA+Cj4gPiAgICAgICAg
IHJldHVybiBzdWJtaXQ7Cj4gPiAgfQo+ID4gQEAgLTM5MCw4ICszODksNiBAQCBzdGF0aWMgdm9p
ZCBzdWJtaXRfY2xlYW51cChzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCkKPiA+ICAgICAg
ICAgICAgICAgICBsaXN0X2RlbF9pbml0KCZtc21fb2JqLT5zdWJtaXRfZW50cnkpOwo+ID4gICAg
ICAgICAgICAgICAgIGRybV9nZW1fb2JqZWN0X3B1dCgmbXNtX29iai0+YmFzZSk7Cj4gPiAgICAg
ICAgIH0KPiA+IC0KPiA+IC0gICAgICAgd3dfYWNxdWlyZV9maW5pKCZzdWJtaXQtPnRpY2tldCk7
Cj4gPiAgfQo+ID4KPiA+ICBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+IEBAIC00MDgsNiArNDA1LDcgQEAgaW50IG1zbV9pb2N0
bF9nZW1fc3VibWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgICAg
ICAgIHN0cnVjdCBtc21fcmluZ2J1ZmZlciAqcmluZzsKPiA+ICAgICAgICAgaW50IG91dF9mZW5j
ZV9mZCA9IC0xOwo+ID4gICAgICAgICBzdHJ1Y3QgcGlkICpwaWQgPSBnZXRfcGlkKHRhc2tfcGlk
KGN1cnJlbnQpKTsKPiA+ICsgICAgICAgYm9vbCBoYXNfd3dfdGlja2V0ID0gZmFsc2U7Cj4gPiAg
ICAgICAgIHVuc2lnbmVkIGk7Cj4gPiAgICAgICAgIGludCByZXQsIHN1Ym1pdGlkOwo+ID4gICAg
ICAgICBpZiAoIWdwdSkKPiA+IEBAIC00ODksNiArNDg3LDkgQEAgaW50IG1zbV9pb2N0bF9nZW1f
c3VibWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgICAgICAgIGlm
IChyZXQpCj4gPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPgo+ID4gKyAgICAgICAvKiBj
b3B5XypfdXNlciB3aGlsZSBob2xkaW5nIGEgd3cgdGlja2V0IHVwc2V0cyBsb2NrZGVwICovCj4g
PiArICAgICAgIHd3X2FjcXVpcmVfaW5pdCgmc3VibWl0LT50aWNrZXQsICZyZXNlcnZhdGlvbl93
d19jbGFzcyk7Cj4gPiArICAgICAgIGhhc193d190aWNrZXQgPSB0cnVlOwo+ID4gICAgICAgICBy
ZXQgPSBzdWJtaXRfbG9ja19vYmplY3RzKHN1Ym1pdCk7Cj4gPiAgICAgICAgIGlmIChyZXQpCj4g
PiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiBAQCAtNTg4LDYgKzU4OSw4IEBAIGludCBt
c21faW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+
ID4KPiA+ICBvdXQ6Cj4gPiAgICAgICAgIHN1Ym1pdF9jbGVhbnVwKHN1Ym1pdCk7Cj4gPiArICAg
ICAgIGlmIChoYXNfd3dfdGlja2V0KQo+ID4gKyAgICAgICAgICAgICAgIHd3X2FjcXVpcmVfZmlu
aSgmc3VibWl0LT50aWNrZXQpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAg
ICAgIG1zbV9nZW1fc3VibWl0X2ZyZWUoc3VibWl0KTsKPiA+ICBvdXRfdW5sb2NrOgo+ID4gLS0K
PiA+IDIuMjQuMAo+ID4KCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
