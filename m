Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6FCFD58
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6EB6E830;
	Tue,  8 Oct 2019 15:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948876E830
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:16:18 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 67so14332464oto.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 08:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HO4Q8C38xRHTnfUP4xtJegvOeZNRTCLLA15x7kOJMN4=;
 b=eqE7kFgUwK0Fjzz9AANu6YTW6+SAYyidTFS1v8N0QfxtY2DpP11uNl8VrM2Fp4sRVC
 XDegg1Q2+gVxN6YusOgZuIXKMdPF912of/7Qjp/sraOOAPNpFhXuMBnnjLoe9Xqll5Bc
 xuETlYpxiD49bTOvdBRxpAaZs6lYwSdZzWGOFexLl/SuqWrzKZfOdk17QjUEvL0suzbP
 OVKumlXZHO9ueGYsK/9rGXiwYaVG5zAGQNv9oWI75p8uWYAVEGFyJhGegqIr4LPy+MRv
 6wh9dBhmPWsREF+ms9Sb4Zfe6IFCWDOVtO8WiWcTh8j8A84QnScTqXfTdjM+v3toE28L
 vRNQ==
X-Gm-Message-State: APjAAAWwX7FGvSznyM3/6Z0SzZ86u6x1r4orZne7JYG4v18Bo9D/vKK2
 /9UsakRNePkjoqOwOAhQoCDK4ljXEkmPN1aV2U/2vA==
X-Google-Smtp-Source: APXvYqxOsktlklZhlvvJRsIn2tsYn7kmOJx9WVoYQRUKQQ+iWLeYaVF0kYomczcAJhLZszy1UszVxg7dhvRkwTMDTZs=
X-Received: by 2002:a9d:75d9:: with SMTP id c25mr19500232otl.106.1570547777760; 
 Tue, 08 Oct 2019 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
 <20190930100707.178723d1@eldfell.localdomain>
 <20191008095904.GL16989@phenom.ffwll.local>
 <20191008143936.6f49b098@eldfell.localdomain>
 <CAKMK7uG49xQ75MovfKHksq1WLiXj3SHYSjFHAUqg3SDPmrxvvA@mail.gmail.com>
 <v6alE7r1055E0bjQLf4OZU6BUkfL_xfCKvow6LcJEv_PNJnULXbMgN6HdyDw0IzIa9FI9TjgNM2_iBP7xMGD1O30cOZZdzbSwXtuuio3nNw=@emersion.fr>
In-Reply-To: <v6alE7r1055E0bjQLf4OZU6BUkfL_xfCKvow6LcJEv_PNJnULXbMgN6HdyDw0IzIa9FI9TjgNM2_iBP7xMGD1O30cOZZdzbSwXtuuio3nNw=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 8 Oct 2019 17:16:06 +0200
Message-ID: <CAKMK7uGRuk7gtOm0f2cWfQYAXgdxHnoCAV3Wt4SWqX7dq-D_xQ@mail.gmail.com>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
To: Simon Ser <contact@emersion.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HO4Q8C38xRHTnfUP4xtJegvOeZNRTCLLA15x7kOJMN4=;
 b=M1fkruOnM4gYykc5ycVQ0nMFPpa7tc3sL52o5nfI7udlIuk7vGmuP97BhN/TsCobGt
 OK1c6ZITSWlOFqqN2yGJvYse0hEhiZXHmJQfs/pOcCqHKFY7Fwd3ILCGUjW6QCRuT3s9
 tyQFUqAO2I/R+bc9MwMD459KmA/EIcn6qdFpk=
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
Cc: nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA1OjExIFBNIFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4gd3JvdGU6Cj4KPiBPbiBUdWVzZGF5LCBPY3RvYmVyIDgsIDIwMTkgNjowMyBQTSwgRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPgo+ID4gPiA+ID4gPiBJbiBhbnkg
Y2FzZSwgdGhpcyBkb2Vzbid0IGNoYW5nZSB0aGUgcGF0Y2ggaXRzZWxmLiBQcm9iYWJseSBzb21l
dGhpbmcgd29ydGgKPiA+ID4gPiA+ID4gbWVudGlvbm5pbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFllcywgcmVjb3JkaW5nIHRoZXNlIHVzZSBjYXNlcyB3b3Vs
ZCBiZSB2ZXJ5IG5pY2UuCj4gPiA+ID4KPiA+ID4gPiBUaGVyZSdzIGEgbG90IG1vcmUgaHcgdGhh
dCBkb2VzIHRoZSBzYW1lIHRyaWNrcyAocXVhbGNvbSBpcyBvbmUgZm9yIHN1cmUpLgo+ID4gPiA+
IEltbyBiZWZvcmUgd2UgZW5jb2RlIHRoaXMgd2Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0Ogo+ID4g
PiA+IGEpIGV2ZXJ5b25lIGlzIGhhcHB5IHdpdGggdGhpcyBuZXcgdWFwaQo+ID4gPgo+ID4gPiBT
b3JyeSwgd2hhdCBuZXcgVUFQST8KPiA+ID4gV2UncmUganVzdCB0cnlpbmcgdG8gbWFrZSB0aGUg
ZG9jdW1lbnRhdGlvbiBtYXRjaCB3aGF0IGN1cnJlbnRseQo+ID4gPiBoYXBwZW5zLCByaWdodD8K
PiA+Cj4gPiBJdCdzIHNvIG11Y2ggbmV3IHVhcGkgdGhhdCBJJ3ZlIHNlbnQgb3V0IGEgZmV3IHJl
dmVydHMgZm9yIDUuNCAoaXQKPiA+IGxhbmRlZCBpbiB0aGF0IG1lcmdlIHdpbmRvdykgdG8gdW5k
byB0aGUgc3R1ZmYgdGhlIGFybSBkcml2ZXIgdGVhbSBoYXMKPiA+IGRvbmUgKGl0IGRpZG4ndCBj
b21lIHdpdGggdXNlcnNwYWNlLCBwcm9wZXIgZGlzY3Vzc2lvbiBvbiBkcmktZGV2ZWwsCj4gPiBk
b2NzIG9yIHRlc3RjYXNlcyBpbiBpZ3QpLiBJIGFsc28ganVzdCBzcG90dGVkIHRoYXQgYSBsZWZ0
b3ZlciBpcyB0aGF0Cj4gPiBhcm0va29tZWRhIHN0aWxsIGNvbXB1dGVzIGl0cyBvd24gdmVyc2lv
biBvZiBub3JtYWxpemVkX3pwb3MsIHdoaWNoCj4gPiBwcm9iYWJseSBzaG91bGQgYmUgZGl0Y2hl
ZCB0b28gKGl0J3Mgbm90IGFjdHVhbGx5IGRpZmZlcmVudCBmcm9tIHRoZQo+ID4gb25lIGluIGhl
bHBlcnMgd2l0aG91dCB0aGUgcmV2ZXJ0ZWQgdWFwaSkuCj4gPgo+ID4gU28geWVhaCwgc2VwYXJh
dGUgcGF0Y2ggOi0pCj4KPiBJIGRvbid0IGdldCBpdC4gRG8geW91IHdhbnQgdG8gc3BsaXQgdGhl
IGRvY3MgY2hhbmdlcyBmb3IgdXNlci1zcGFjZSwKPiBvbmx5IGtlZXBpbmcgdGhlIGRvYyBjaGFu
Z2VzIGZvciBkcml2ZXJzIGluIHRoaXMgcGF0Y2g/Cj4KPiBVc2VyLXNwYWNlIGNvdWxkIGFscmVh
ZHkgc2VlIGR1cGxpY2F0ZSB6cG9zIGJlY2F1c2Ugb2YgdGhlIG5vbi1hdG9taWMKPiBBUEkuIEkg
ZG9uJ3QgdGhpbmsgdGhpcyBpbnRyb2R1Y2VzIGEgbmV3IHVBUEkuCgpJJ20gdGFsa2luZyBzcGVj
aWZpY2FsbHkgYWJvdXQgdGhlICJkdXBsaWNhdGVkIHpwb3MgdmFsdWVzIGluZGljYXRlCnNwZWNp
YWwgY2xvbmVkIHBsYW5lcyBsaWtlIGluIHRoZSBhcm0gZXhhbXBsZSIgY2xhcmlmaWNhdGlvbi4g
Tm90CmFib3V0IHNwbGl0dGluZyB0aGUgenBvcyBkb2N1bWVudGF0aW9uIGFueSBtb3JlLCB0aGF0
J3MgaW5kZWVkIGp1c3QKZG9jdW1lbnRpbmcgZXhpc3RpbmcgdWFwaS4gQnV0IGFzc2lnbmluZyB0
aGUgc3BlY2lhbCBtZWFuaW5nIHRvCmR1cGxpY2F0ZWQgenBvcyB2YWx1ZXMgKGluc3RlYWQgb2Yg
anVzdCAiY2FuIGhhcHBlbiBiZWNhdXNlIG5vbi1hdG9taWMKbGVnYWN5IHVzZXJzcGFjZSIpLCB0
aGF0IGlzIG5ldyB1YXBpLiBFc3BlY2lhbGx5IGlmIHdlIGFsbG93CmR1cGxpY2F0ZWQgenBvcyBm
b3IgaW1tdXRhYmxlIHByb3BlcnRpZXMgKGFmYWlrIHRoYXQgZG9lc24ndCBleGlzdAp5ZXQpLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
