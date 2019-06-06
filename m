Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A093D38568
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A3F89A91;
	Fri,  7 Jun 2019 07:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03F8898AA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 19:18:56 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n5so1099812ioc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 12:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1YXtpNCDOosbHBL0TL+M3WAkRwQkUQShRW6iv3pI/E=;
 b=H4MNkoUS9AfwHs4r/iSy3uhu5C4RSR4IyYyeH6q86c+As2/Sz+Lo50+TyxNDl1dqLk
 to5K7UwkaM3GtmiWXpWfKMfERrxABUMPGxaQ9IUMU005S1g6mLlfHkZbEY2R5ZsTitAe
 H/wlq5N7i5rtFPcYSHFhVrUFZPxzLE2C6rMaXi7KHGwjmW6cyZjgdpNRg2g+sgB3c5Ve
 Pi1pUPQtCa8XnIifVLCQKZF6Rho+KZgXBgAqQbhFxS8nPrk6JN7RhYu3QFUQ4Db5E4xy
 WtDvAEsQY2oDRU1wT90TlgTdpMAozkUKzuIvjURIh8C1viBnDKUXtZHLmOlEuQ7m5fuJ
 CK4g==
X-Gm-Message-State: APjAAAUlbMQpHlwASL7hCqGw7bLOAk56h2Tt5NlNtOYEu8Wbb0f/Wgd4
 1EWYYAqSZB05ltPI5eV4XYwClVbFBJygYzx6ZsU=
X-Google-Smtp-Source: APXvYqylaDDGA4PraZOekHKWe7NpeljwK6OKqIM9Pmn2Ow5JNBpDQZ0QcDvmd4FBcWWrCHgBFNyVCSfHaSkhO8aIlms=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr7233987ioh.263.1559848735945; 
 Thu, 06 Jun 2019 12:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070528epcas1p1d9b1d1b09ffaafa511936ed3ded29097@epcas1p1.samsung.com>
 <20190605070507.11417-4-andrew.smirnov@gmail.com>
 <3c50e3e2-9fb8-6962-9988-32d14aa429b0@samsung.com>
In-Reply-To: <3c50e3e2-9fb8-6962-9988-32d14aa429b0@samsung.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 6 Jun 2019 12:18:44 -0700
Message-ID: <CAHQ1cqExJuKHcXBPszkMymzZg4r4nRKAoySPXLrCurOCoco9-g@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=k1YXtpNCDOosbHBL0TL+M3WAkRwQkUQShRW6iv3pI/E=;
 b=elYAqTKjzYWFPW2KclIE/7D7+zcK6oEV+i0XXHhZSP+U/FvV2qo6zHq3e8SpKTkBiW
 pIhAHacyghUD4KEMdqoLklkIrGkgpAj5uBTVBQWI3nthQV0FAt/Wy380lL7ZvZubJvDi
 nskJjdPKBrSBrS7G2PXp/+dxi2HhqiOISv7sGMxfmWWc3f3zic/cQOWUc1FmMkG2Va+g
 bsfB7JpSfvq8BIiF03CQddwQhGD551SvzJj8MZ499QH1qbBv/ZD4PRr4wkvcc8nkqwc1
 8CxZP880ZxXM3Bm/h4Vm7ykkkBw/5WnCzk3i65N+KGqcyOwODonNdFFP13QpnHb9+pHJ
 sWPw==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCAxOjA4IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+IHdyb3RlOgo+Cj4gT24gMDUuMDYuMjAxOSAwOTowNCwgQW5kcmV5IFNtaXJub3Yg
d3JvdGU6Cj4gPiBSZXBsYWNlIGV4cGxpY2l0IHBvbGxpbmcgaW4gdGNfbGlua190cmFpbmluZygp
IHdpdGggZXF1aXZhbGVudCBjYWxsIHRvCj4gPiB0Y19wb2xsX3RpbWVvdXQoKSBmb3Igc2ltcGxp
Y2l0eS4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQgKG5vdAo+ID4gaW5jbHVkaW5nIHNs
aWdodGx5IGFsdGVyZWQgZGVidWcgb3V0cHV0KS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJub3ZAZ21haWwuY29tPgo+ID4gQ2M6IEFyY2hpdCBUYW5l
amEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+Cj4gPiBDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KPiA+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QHRpLmNvbT4KPiA+IENjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1i
ZWRkZWQuY29tPgo+ID4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
Cj4gPiBDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KPiA+IENjOiBDaHJpcyBI
ZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+Cj4gPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDE1ICsrKysrKy0tLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwo+ID4gaW5kZXggNWUxZTczYTkxNjk2Li4xMTVjZmZjNTVhOTYgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ID4gQEAgLTc0OCwyMiArNzQ4LDE5
IEBAIHN0YXRpYyBpbnQgdGNfc2V0X3ZpZGVvX21vZGUoc3RydWN0IHRjX2RhdGEgKnRjLAo+ID4K
PiA+ICBzdGF0aWMgaW50IHRjX3dhaXRfbGlua190cmFpbmluZyhzdHJ1Y3QgdGNfZGF0YSAqdGMp
Cj4gPiAgewo+ID4gLSAgICAgdTMyIHRpbWVvdXQgPSAxMDAwOwo+ID4gICAgICAgdTMyIHZhbHVl
Owo+ID4gICAgICAgaW50IHJldDsKPiA+Cj4gPiAtICAgICBkbyB7Cj4gPiAtICAgICAgICAgICAg
IHVkZWxheSgxKTsKPiA+IC0gICAgICAgICAgICAgdGNfcmVhZChEUDBfTFRTVEFULCAmdmFsdWUp
Owo+ID4gLSAgICAgfSB3aGlsZSAoKCEodmFsdWUgJiBMVF9MT09QRE9ORSkpICYmICgtLXRpbWVv
dXQpKTsKPiA+IC0KPiA+IC0gICAgIGlmICh0aW1lb3V0ID09IDApIHsKPiA+ICsgICAgIHJldCA9
IHRjX3BvbGxfdGltZW91dCh0YywgRFAwX0xUU1RBVCwgTFRfTE9PUERPTkUsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTFRfTE9PUERPTkUsIDEsIDEwMDApOwo+ID4gKyAgICAgaWYg
KHJldCkgewo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKHRjLT5kZXYsICJMaW5rIHRyYWluaW5n
IHRpbWVvdXQgd2FpdGluZyBmb3IgTFRfTE9PUERPTkUhXG4iKTsKPiA+IC0gICAgICAgICAgICAg
cmV0dXJuIC1FVElNRURPVVQ7Cj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAg
ICB9Cj4KPgo+IEluY29uc2lzdGVudCBjb2RpbmcsIGluIHByZXZpb3VzIHBhdGNoIHlvdSBjaGVj
ayAocmV0ID09IC1FVElNRURPVVQpIGJ1dAo+IG5vdCBoZXJlLiBUbyBzaW1wbGlmeSB0aGUgY29k
ZSB5b3UgY2FuIGFzc3VtZSB0aGF0IHRjX3BvbGxfdGltZW91dCA8IDAsCj4gbWVhbnMgdGltZW91
dCwgaW4gc3VjaCBjYXNlIHBsZWFzZSBhZGp1c3QgcHJldmlvdXMgcGF0Y2guCj4KClN1cmUsIHdp
bGwgZG8uCgpUaGFua3MsCkFuZHJleSBTbWlybm92Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
