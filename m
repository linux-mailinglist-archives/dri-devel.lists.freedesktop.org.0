Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DA10477C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 01:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3C16EA56;
	Thu, 21 Nov 2019 00:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C246EA56;
 Thu, 21 Nov 2019 00:25:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a67so1151307edf.11;
 Wed, 20 Nov 2019 16:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxN8i90HnOWWko5dcue+Kq/+nC0j3ATjHIHy52kF8SQ=;
 b=tLIdrTGhjOSlULxJXGf9vfYNAo1VyPswvisdqlAY0qo3DujIRt6mVtFthubDwMyPQK
 Nd5hsJ/o3nbQ2bHhvlzq+DjWO1POr1xRs2ki6Ix7Ae9zox/z3iAg9Ngvxu/rRof/rNPd
 bcwaaweU2tUVGkhqhz6kQ+zRPox/5YmtudqSNAF9vamqyFRMTVsWccrW0t4rCf+627hP
 ZOaq/jeHRGYHn7On0Ks0Qb7fp4/VrU0ml4Z0rtrKbQrPF9wkVQ/YvJrnBxupvYdsEaZf
 v6EHCXWWiex0MMQe8QGW9VsUCp4vd/Qp7/+ZL88sX08s4M89x4ncoaNI9Kr1M+Z6DzZZ
 iyYQ==
X-Gm-Message-State: APjAAAVKLRia5NWFCHKy4iTcHB8beyRNRZQ8NJOJOfhSKrFk6u85O/9j
 tH+YF5Gnml/dMeifMB0WjW5FcK2P5/JPR1HDPF8qbbyb
X-Google-Smtp-Source: APXvYqwlwDO6EaPRqE5cvCovwt2XV0M+rtxk478VSQdRf3+xJl7A6zmhhzNGPjevdUt7lHzBidY5qIj1Fd99jKQwrzo=
X-Received: by 2002:a17:906:d143:: with SMTP id
 br3mr9210265ejb.215.1574295900268; 
 Wed, 20 Nov 2019 16:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
 <20191120105607.3023-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191120105607.3023-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2019 16:24:48 -0800
Message-ID: <CAF6AEGt9N7EYHFOofU-9pBTs8X+w2h30a_KvTg3BVARbChAWZA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't init ww_mutec acquire ctx before needed
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xxN8i90HnOWWko5dcue+Kq/+nC0j3ATjHIHy52kF8SQ=;
 b=ey36+6j2JBABRW7nZ54IRAKoVx/bMZFSMOLrvctVXU2WDZSbW2HCiLu0rXE73cgGW5
 UGBkG+bNb/5b0vFH30g1zWYtFLpmxwAekNfDojhFcFhkQXE/CP6cRdoPvW42HMeBiZpT
 T2yaWjPpHtxRe7ZhE7jj3hyxL4HDGSI9C+HF8RQTRTsfLoxrFW3DHF2xSrwlb0sG0YEE
 FP1VuMSK84dX6uV3RkmDMXOxo9ucCR/JLlrbUtzi3sWsX45et4AWz5PK3mMmQi0BOvta
 3osIJCboO2p8mNwqTtvP834yWHV1O1ul5zzv5qO+Oi+mkHIR+g/nUPz/594ZaofiA7XI
 OB2g==
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMjo1NiBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IEZvciBsb2NraW5nIHNlbWFudGljcyBpdCByZWFsbHkg
ZG9lc24ndCBtYXR0ZXIgd2hlbiB3ZSBncmFiIHRoZQo+IHRpY2tldC4gQnV0IGZvciBsb2NrZGVw
IHZhbGlkYXRpb24gaXQgZG9lczogdGhlIGFjcXVpcmUgY3R4IGlzIGEgZmFrZQo+IGxvY2tkZXAu
IFNpbmNlIG90aGVyIGRyaXZlcnMgbWlnaHQgd2FudCB0byBkbyBhIGZ1bGwgbXVsdGktbG9jayBk
YW5jZQo+IGluIHRoZWlyIGZhdWx0LWhhbmRsZXIsIG5vdCBqdXN0IGxvY2sgYSBzaW5nbGUgZG1h
X3Jlc3YuIFRoZXJlZm9yZSB3ZQo+IG11c3QgaW5pdCB0aGUgYWNxdWlyZV9jdHggb25seSBhZnRl
ciB3ZSd2ZSBkb25lIGFsbCB0aGUgY29weV8qX3VzZXIgb3IKPiBhbnl0aGluZyBlbHNlIHRoYXQg
bWlnaHQgdHJpZ2dlciBhIHBhZ2VmYXVsdC4gRm9yIG1zbSB0aGlzIG1lYW5zIHdlCj4gbmVlZCB0
byBtb3ZlIGl0IHBhc3Qgc3VibWl0X2xvb2t1cF9vYmplY3RzLgo+Cj4gQXNpZGU6IFdoeSBpcyBt
c20gc3RpbGwgdXNpbmcgc3RydWN0X211dGV4LCBpdCBzZWVtcyB0byBiZSB1c2luZwo+IGRtYV9y
ZXN2X2xvY2sgZm9yIGdlbmVyYWwgYnVmZmVyIHN0YXRlIHByb3RlY3Rpb24/Cj4KPiB2MjoKPiAt
IEFkZCBjb21tZW50IHRvIGV4cGxhaW4gd2h5IHRoZSB3dyB0aWNrZXQgc2V0dXAgaXMgc2VwYXJh
dGUgKFJvYikKPiAtIEZpeCB1cCBlcnJvciBoYW5kbGluZywgd2UgbmVlZCB0byBtYWtlIHN1cmUg
d2UgZG9uJ3QgY2FsbAo+ICAgd3dfYWNxdWlyZV9maW5pIHdpdGhvdXQgX2luaXQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzog
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwoKZm91bmQgYSBmZXcgbWludXRlcyB0byB0YWtlIHRo
aXMgZm9yIGEgc3BpbiBhbmQgc2VlbXMgZmluZS4uIHQtYiAmJiByLWIKCkJSLAotUgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jIHwgOSArKysrKystLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKPiBpbmRleCBmYjFmZGQ3ZmEzZWYuLjM4NWQ0OTY1
YThkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKPiBAQCAtNTQsNyAr
NTQsNiBAQCBzdGF0aWMgc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJtaXRfY3JlYXRlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4KPiAgICAgICAgIElOSVRfTElTVF9IRUFEKCZzdWJtaXQtPm5v
ZGUpOwo+ICAgICAgICAgSU5JVF9MSVNUX0hFQUQoJnN1Ym1pdC0+Ym9fbGlzdCk7Cj4gLSAgICAg
ICB3d19hY3F1aXJlX2luaXQoJnN1Ym1pdC0+dGlja2V0LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3Mp
Owo+Cj4gICAgICAgICByZXR1cm4gc3VibWl0Owo+ICB9Cj4gQEAgLTM5MCw4ICszODksNiBAQCBz
dGF0aWMgdm9pZCBzdWJtaXRfY2xlYW51cChzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCkK
PiAgICAgICAgICAgICAgICAgbGlzdF9kZWxfaW5pdCgmbXNtX29iai0+c3VibWl0X2VudHJ5KTsK
PiAgICAgICAgICAgICAgICAgZHJtX2dlbV9vYmplY3RfcHV0KCZtc21fb2JqLT5iYXNlKTsKPiAg
ICAgICAgIH0KPiAtCj4gLSAgICAgICB3d19hY3F1aXJlX2ZpbmkoJnN1Ym1pdC0+dGlja2V0KTsK
PiAgfQo+Cj4gIGludCBtc21faW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAo+IEBAIC00MDgsNiArNDA1LDcgQEAgaW50IG1zbV9pb2N0bF9nZW1fc3Vi
bWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gICAgICAgICBzdHJ1Y3Qg
bXNtX3JpbmdidWZmZXIgKnJpbmc7Cj4gICAgICAgICBpbnQgb3V0X2ZlbmNlX2ZkID0gLTE7Cj4g
ICAgICAgICBzdHJ1Y3QgcGlkICpwaWQgPSBnZXRfcGlkKHRhc2tfcGlkKGN1cnJlbnQpKTsKPiAr
ICAgICAgIGJvb2wgaGFzX3d3X3RpY2tldCA9IGZhbHNlOwo+ICAgICAgICAgdW5zaWduZWQgaTsK
PiAgICAgICAgIGludCByZXQsIHN1Ym1pdGlkOwo+ICAgICAgICAgaWYgKCFncHUpCj4gQEAgLTQ4
OSw2ICs0ODcsOSBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+Cj4gKyAgICAgICAvKiBjb3B5XypfdXNlciB3aGlsZSBob2xkaW5nIGEgd3cgdGlj
a2V0IHVwc2V0cyBsb2NrZGVwICovCj4gKyAgICAgICB3d19hY3F1aXJlX2luaXQoJnN1Ym1pdC0+
dGlja2V0LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwo+ICsgICAgICAgaGFzX3d3X3RpY2tldCA9
IHRydWU7Cj4gICAgICAgICByZXQgPSBzdWJtaXRfbG9ja19vYmplY3RzKHN1Ym1pdCk7Cj4gICAg
ICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiBAQCAtNTg4LDYgKzU4
OSw4IEBAIGludCBtc21faW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAo+Cj4gIG91dDoKPiAgICAgICAgIHN1Ym1pdF9jbGVhbnVwKHN1Ym1pdCk7Cj4g
KyAgICAgICBpZiAoaGFzX3d3X3RpY2tldCkKPiArICAgICAgICAgICAgICAgd3dfYWNxdWlyZV9m
aW5pKCZzdWJtaXQtPnRpY2tldCk7Cj4gICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAg
ICBtc21fZ2VtX3N1Ym1pdF9mcmVlKHN1Ym1pdCk7Cj4gIG91dF91bmxvY2s6Cj4gLS0KPiAyLjI0
LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
