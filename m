Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63888579E5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 05:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE706E58A;
	Thu, 27 Jun 2019 03:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0226E58A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 03:16:38 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id l125so623666vsl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 20:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pF1W2+9aLBWFznkjdlnMEnTMlLvpADkd/fsP3XJUQ/k=;
 b=C9Yjxkl14B454RXtEA/miACWYP7A73qEaRs7SJ1X7MqSRwV8rgiKHOYvEjzjPv34qK
 cy6nAe7BKXxyeV2mgb+aRMoto6cH16z57OR7J5FQGfU8xCmFb6rpMGRC/bQGjBL1Dy9e
 v/povSSkClXvuAGq58R2XxdFlBWSoaBzDRsk3smLSACN4BltxleWuao9HU1F9zagy3l3
 hRqIk+0S31ue9iUFgZykfvhYP6GSOrQYEHFyCEkBSOLdB4HDOEW9hcziwtPjrO+qHkTc
 2vAwPavEsx5csQyT3BIfXv9do3bMOidhKpNp4J2cDmiWp9ulvoiAjqHpTlDs9XVCulNK
 Yo1g==
X-Gm-Message-State: APjAAAXJD6eYRqHLYtpil1ow03GmA0XRo0UPTzAWFXt4hgEO/Io+6/lK
 25ZX17UHaLigiHZ8Oa9Z6Bp/zbK/sxyemZWlv7I7xBNid/M=
X-Google-Smtp-Source: APXvYqzQl30iO02EwyvZ2TpUlwJMGuXdmLTxsU65TlODD0s3fujqJ9Tls7kZLIdo2pZxXm+WN7Vrr0owlAIBK/v1skg=
X-Received: by 2002:a67:bb01:: with SMTP id m1mr1100991vsn.88.1561605397809;
 Wed, 26 Jun 2019 20:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190601233627.5092-1-marex@denx.de>
In-Reply-To: <20190601233627.5092-1-marex@denx.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 27 Jun 2019 05:17:16 +0200
Message-ID: <CAH9NwWc17P9ihFeM_CRXJF7X-d0WO7-p3p9rD9x1FbJ1aL9VWw@mail.gmail.com>
Subject: Re: [PATCH libdrm] etnaviv: Fix double-free in etna_bo_cache_free()
To: Marek Vasut <marex@denx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pF1W2+9aLBWFznkjdlnMEnTMlLvpADkd/fsP3XJUQ/k=;
 b=JLmtpSZW6j2nbd+T1tCVbqP1gpKFZMze26ze/lVdSZxVjH8klyVEwJKO5Gxc9s5c8o
 D/Z/r8Vs+E8tldxWm1UvuWDvKVjHsNnnLk0wqErBzw/QDWdKDGOXg7+LoV/t/xGUqEOe
 7Ni0aI4AP6H5sNM2kBxJryhOz72l03SikWHW8unx6jdBa6MPDRM2Dtx73ycoekh+HylO
 TwfXrudfipRHl0PcF+2NXH0ATtmTK4Dwev7jM8YEwktcydlyBq+FUEJdpb0Xa7pxgVbr
 7GwGCOc0Bj2mllRSYCO6snJpDkDt49VTRnVAIzeQptm8QJEV1CIV9b25oIXLdzv+Zb4A
 8Evg==
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gU28uLCAyLiBKdW5pIDIwMTkgdW0gMDE6MzcgVWhyIHNjaHJpZWIgTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+Ogo+Cj4gVGhlIGZvbGxvd2luZyBzaXR1YXRpb24gY2FuIGhhcHBlbiBpbiBh
IG11bHRpdGhyZWFkZWQgT3BlbkdMIGFwcGxpY2F0aW9uLgo+IEEgQk8gaXMgc3VibWl0dGVkIGZy
b20gZXRuYV9jbWRfc3RyZWFtICMxIHdpdGggZmxhZ3Mgc2V0IGZvciByZWFkLgo+IEEgQk8gaXMg
c3VibWl0dGVkIGZyb20gZXRuYV9jbWRfc3RyZWFtICMyIHdpdGggZmxhZ3Mgc2V0IGZvciB3cml0
ZS4KPiBUaGlzIHRyaWdnZXJzIGEgZmx1c2ggb24gc3RyZWFtICMxIGFuZCBjbGVhcnMgdGhlIEJP
J3MgY3VycmVudF9zdHJlYW0KPiBwb2ludGVyLiBJZiBhdCB0aGlzIHBvaW50LCBzdHJlYW0gIzIg
YXR0ZW1wdHMgdG8gcXVldWUgQk8gYWdhaW4sIHdoaWNoCj4gZG9lcyBoYXBwZW4sIHRoZSBCTyB3
aWxsIGJlIGFkZGVkIHRvIHRoZSBzdWJtaXQgbGlzdCB0d2ljZS4gVGhlIExpbnV4Cj4ga2VybmVs
IGRyaXZlciBjb3JyZWN0bHkgZGV0ZWN0cyB0aGlzIGFuZCB3YXJucyBhYm91dCBpdCB3aXRoICJC
TyBhdAo+IGluZGV4ICV1IGFscmVhZHkgb24gc3VibWl0IGxpc3QiIGtlcm5lbCBtZXNzYWdlLgo+
Cj4gSG93ZXZlciwgd2hlbiBjbGVhbmluZyB0aGUgQk8gY2FjaGUgaW4gZXRuYV9ib19jYWNoZV9m
cmVlKCksIHRoZSBCTwo+IHdoaWNoIHdhcyBzdWJtaXR0ZWQgdHdpY2Ugd2lsbCBhbHNvIGJlIGZy
ZWUoKWQgdHdpY2UsIHRoaXMgdHJpZ2dlcmluZwo+IGEgZ2xpYmMgZG91YmxlIGZyZWUgZGV0ZWN0
b3IuCj4KPiBUaGUgZml4IGlzIGVhc3ksIGV2ZW4gaWYgdGhlIEJPIGRvZXMgbm90IGhhdmUgY3Vy
cmVudF9zdHJlYW0gc2V0LAo+IGl0ZXJhdGUgb3ZlciBjdXJyZW50IHN0cmVhbXMnIGxpc3Qgb2Yg
Qk9zIGJlZm9yZSBhZGRpbmcgdGhlIEJPIHRvIGl0Cj4gYW5kIHZlcmlmeSB0aGF0IHRoZSBCTyBp
cyBub3QgeWV0IHRoZXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+Cj4gQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5j
b20+Cj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQt
Ynk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CgpXaWxs
IGxhbmQgdGhpcyBwYXRjaCBldmVuIGxpYmRybSBwYXJ0cyBnb3QgbW92ZWQgdG8gbWVzYSBhcyBp
dCBmaXhlcwphIHNlcmlvdXMgaXNzdWUgYW5kIHNvbWVib2R5IG1pZ2h0IHVzZSBuZXdlc3QgbGli
ZHJtIHdpdGggbWVzYSA8IDE5LjEuCgo+IC0tLQo+ICBldG5hdml2L2V0bmF2aXZfY21kX3N0cmVh
bS5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2V0bmF2aXYvZXRuYXZpdl9jbWRfc3RyZWFtLmMg
Yi9ldG5hdml2L2V0bmF2aXZfY21kX3N0cmVhbS5jCj4gaW5kZXggNzEzOWMzMjQuLjI2MTc3N2Iw
IDEwMDY0NAo+IC0tLSBhL2V0bmF2aXYvZXRuYXZpdl9jbWRfc3RyZWFtLmMKPiArKysgYi9ldG5h
dml2L2V0bmF2aXZfY21kX3N0cmVhbS5jCj4gQEAgLTE1MCwxMSArMTUwLDcgQEAgc3RhdGljIHVp
bnQzMl90IGJvMmlkeChzdHJ1Y3QgZXRuYV9jbWRfc3RyZWFtICpzdHJlYW0sIHN0cnVjdCBldG5h
X2JvICpibywKPgo+ICAgICAgICAgcHRocmVhZF9tdXRleF9sb2NrKCZpZHhfbG9jayk7Cj4KPiAt
ICAgICAgIGlmICghYm8tPmN1cnJlbnRfc3RyZWFtKSB7Cj4gLSAgICAgICAgICAgICAgIGlkeCA9
IGFwcGVuZF9ibyhzdHJlYW0sIGJvKTsKPiAtICAgICAgICAgICAgICAgYm8tPmN1cnJlbnRfc3Ry
ZWFtID0gc3RyZWFtOwo+IC0gICAgICAgICAgICAgICBiby0+aWR4ID0gaWR4Owo+IC0gICAgICAg
fSBlbHNlIGlmIChiby0+Y3VycmVudF9zdHJlYW0gPT0gc3RyZWFtKSB7Cj4gKyAgICAgICBpZiAo
Ym8tPmN1cnJlbnRfc3RyZWFtID09IHN0cmVhbSkgewo+ICAgICAgICAgICAgICAgICBpZHggPSBi
by0+aWR4Owo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgLyogc2xvdy1wYXRo
OiAqLwo+IEBAIC0xNjUsNiArMTYxLDggQEAgc3RhdGljIHVpbnQzMl90IGJvMmlkeChzdHJ1Y3Qg
ZXRuYV9jbWRfc3RyZWFtICpzdHJlYW0sIHN0cnVjdCBldG5hX2JvICpibywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBub3QgZm91bmQgKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICBp
ZHggPSBhcHBlbmRfYm8oc3RyZWFtLCBibyk7Cj4gICAgICAgICAgICAgICAgIH0KPiArICAgICAg
ICAgICAgICAgYm8tPmN1cnJlbnRfc3RyZWFtID0gc3RyZWFtOwo+ICsgICAgICAgICAgICAgICBi
by0+aWR4ID0gaWR4Owo+ICAgICAgICAgfQo+ICAgICAgICAgcHRocmVhZF9tdXRleF91bmxvY2so
JmlkeF9sb2NrKTsKPgo+IC0tCj4gMi4yMC4xCj4KCgotLSAKZ3JlZXRzCi0tCkNocmlzdGlhbiBH
bWVpbmVyLCBNU2MKCmh0dHBzOi8vY2hyaXN0aWFuLWdtZWluZXIuaW5mby9wcml2YWN5cG9saWN5
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
