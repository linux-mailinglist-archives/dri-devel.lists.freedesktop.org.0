Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A88ADD01
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 18:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368E389D66;
	Mon,  9 Sep 2019 16:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B3689D42;
 Mon,  9 Sep 2019 16:23:07 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n7so13034241otk.6;
 Mon, 09 Sep 2019 09:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y5V4m4p94PsJz1eXNShESbNBiKSy11fpLV6SBZU7GQs=;
 b=Y8LuGEn0vj7asa+tFy6ja7/8CU6bTkEWcDwtcNuDSAunRbIZxAsvllb8l02rv+sMgb
 GIVOeMXWFCCfaWg16U4OuvWwpLBMt7dKj4pvIB3D6dSvtGd9Z9+UIDU1inSpZ1vT5qMg
 JAvn8RmnP6rjwqGRC4lwMbTWhm19kcRZyyIfUNZoAMzi1dFO0rAS02wtg7OPGroI+pSN
 lyrKraIi+3ZY3nxeIU3kwcvOkmwyPMh6yX7Du0caArFusWAvp6tQhDhT1Z9DuYSoJ14Z
 IJ7dqYS/I0USCPQBG3vo3BoZtRcDJMIKFKuwUuNPBuMkpTjHYHIYNqahSxUYlovIC+kQ
 EM7Q==
X-Gm-Message-State: APjAAAU/nTY79k7CMvOQTTq30fMA3ST8shavCevSObYUwKpCVfjyK2kR
 EMag0JAUMPjMPteiN2sq5yH6tlNyJCOJBExJ26Y=
X-Google-Smtp-Source: APXvYqy41BXc7ROWAqVe0r8Uh2i/7Qy5WAvA5KsUhiT1aXKk0iuMw41XOuqIJr8Um2egX5sWQhh3nRa2Mtjv9tXlgOY=
X-Received: by 2002:a9d:6d83:: with SMTP id x3mr19771774otp.263.1568046187131; 
 Mon, 09 Sep 2019 09:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190908024800.23229-1-anarsoul@gmail.com>
 <CAKGbVbt056DyZHer1bKnAv8uBCX6zbsWeMjE6AQy8HYQf7L1wg@mail.gmail.com>
 <3263343.nbYvo8rMJO@diego>
In-Reply-To: <3263343.nbYvo8rMJO@diego>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 9 Sep 2019 09:23:08 -0700
Message-ID: <CA+E=qVfWYd8QdEi=h7JL=AVV+ehpP=GZ3cUsZ1Cbhh0O5xn1ng@mail.gmail.com>
Subject: Re: [Lima] [PATCH] drm/lima: fix lima_gem_wait() return value
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y5V4m4p94PsJz1eXNShESbNBiKSy11fpLV6SBZU7GQs=;
 b=McgtOk7zvnFYeyjzHNeTY0P7u3Oi9/K1EOXjYte2tEL8yqdDF7CpHOxGecKT+YAaK2
 ZIhrImDdGOQp1uP+dX68ZhHGygjrgvfw3xE++/qldATe9BLERiUY4/zFjq45BwJVmxMC
 WBanC9WZb3ugErmgIlVNwj+qOrYzit+nAsipPFL6J1tYpgy/iDWcR1MSFmgvE6XW+xBi
 3FO3E1vCZUzRnpDxdErV/FCDSuIcmp2vqAWcNtFmtHELnpuNYepus/eiMuzeONHQcPvU
 WZHgVA286yiWp6mRrPQWARq4LbTbCKhcvfKuBQfAP/IpDrMr/wGmvaHe0CN7kOWiTuDN
 M6ng==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgOSwgMjAxOSBhdCA1OjE4IEFNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gSGkgUWlhbmcsCj4KPiBBbSBNb250YWcsIDkuIFNlcHRlbWJlciAy
MDE5LCAwNDozMDo0MyBDRVNUIHNjaHJpZWIgUWlhbmcgWXU6Cj4gPiBPaCwgSSB3YXMgbWlzcyBs
ZWFkaW5nIGJ5IHRoZSBkcm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0Cj4gPiBjb21tZW50
cy4gUGF0Y2ggaXM6Cj4gPiBSZXZpZXdlZC1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+
Cj4gPgo+ID4gSSdsbCBhcHBseSB0aGlzIHBhdGNoIHRvIGRybS1taXNjLW5leHQuCj4gPgo+ID4g
Q3VycmVudCBrZXJuZWwgcmVsZWFzZSBpcyA1LjMtcmM4LCBpcyBpdCB0b28gbGF0ZSBmb3IgdGhp
cyBmaXggdG8gZ28KPiA+IGludG8gdGhlIG1haW5saW5lIDUuMyByZWxlYXNlPwo+ID4gSSdkIGxp
a2UgdG8ga25vdyBob3cgdG8gYXBwbHkgdGhpcyBmaXggZm9yIGN1cnJlbnQgcmMga2VybmVscywg
YnkKPiA+IGRybS1taXNjLWZpeGVzPyBDYW4gSSBwdXNoCj4gPiB0byBkcm0tbWlzYy1maXhlcyBi
eSBkaW0gb3IgSSBjYW4gb25seSBwdXNoIHRvIGRybS1taXNjLW5leHQgYW5kCj4gPiBkcm0tbWlz
YyBtYWludGFpbmVyIHdpbGwKPiA+IHBpY2sgZml4ZXMgZnJvbSBpdCB0byBkcm0tbWlzYy1maXhl
cz8KPgo+IGRybS1taXNjLWZpeGVzIGdldHMgbWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dCBieSBt
YWludGFpbmVycyByZWd1bGFybHksCj4gc28gSSBfdGhpbmtfIHlvdSBzaG91bGQgYXBwbHkgdGhl
IGZpeC1wYXRjaCB0byBkcm0tbWlzYy1maXhlcyBmaXJzdC4KPiBbSSBhbHNvIGFsd2F5cyBoYXZl
IHRvIHJlYWQgdGhlIGRvY3VtZW50YXRpb24gOy0pIF0KPgo+IEluIGFueSBjYXNlIHlvdSBtaWdo
dCB3YW50IHRvIGFkZCBhICJGaXhlczogLi4uLi4iIHRhZyBhcyB3ZWxsIGFzIGEKPiAiQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmciIHRhZywgc28gaXQgY2FuIGJlIGJhY2twb3J0ZWQgdG8gc3Rh
YmxlCj4ga2VybmVscyBpZiBhcHBsaWNhYmxlLgoKQ2M6IHN0YWJsZSBpcyBhbHJlYWR5IGhlcmUs
IGJ1dCBJIHRoaW5rIGl0IHN0aWxsIG5lZWRzICJGaXhlczogIiB0YWcuCgpRaWFuZywgY2FuIHlv
dSBhZGQgaXQgYXQgeW91ciBzaWRlIG9yIHlvdSB3YW50IG1lIHRvIHJlc2VuZCB0aGUgcGF0Y2g/
Cgo+Cj4gSGVpa28KPgo+ID4gT24gU3VuLCBTZXAgOCwgMjAxOSBhdCAxMDo0OCBBTSBWYXNpbHkg
S2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gZHJtX2dl
bV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCgpIHJldHVybnMgMCBpZiBpdCBzdWNjZWVkcyBhbmQg
LUVUSU1FCj4gPiA+IGlmIGl0IHRpbWVvdXRzLCBidXQgbGltYSBkcml2ZXIgYXNzdW1lZCB0aGF0
IDAgaXMgZXJyb3IuCj4gPiA+Cj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyB8IDIgKy0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKPiA+ID4gaW5kZXggNDc3YzBmNzY2NjYzLi5iNjA5
ZGMwMzBkNmMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2Vt
LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwo+ID4gPiBAQCAt
MzQyLDcgKzM0Miw3IEBAIGludCBsaW1hX2dlbV93YWl0KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwg
dTMyIGhhbmRsZSwgdTMyIG9wLCBzNjQgdGltZW91dF9ucykKPiA+ID4gICAgICAgICB0aW1lb3V0
ID0gZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXModGltZW91dF9ucyk7Cj4gPiA+Cj4gPiA+ICAg
ICAgICAgcmV0ID0gZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdChmaWxlLCBoYW5kbGUs
IHdyaXRlLCB0aW1lb3V0KTsKPiA+ID4gLSAgICAgICBpZiAocmV0ID09IDApCj4gPiA+ICsgICAg
ICAgaWYgKHJldCA9PSAtRVRJTUUpCj4gPiA+ICAgICAgICAgICAgICAgICByZXQgPSB0aW1lb3V0
ID8gLUVUSU1FRE9VVCA6IC1FQlVTWTsKPiA+ID4KPiA+ID4gICAgICAgICByZXR1cm4gcmV0Owo+
ID4gPiAtLQo+ID4gPiAyLjIzLjAKPiA+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW1hIG1haWxpbmcgbGlzdAo+ID4gbGltYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbGltYQo+Cj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
