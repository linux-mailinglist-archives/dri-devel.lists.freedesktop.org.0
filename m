Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77A4A55F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2513589BD5;
	Tue, 18 Jun 2019 15:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116D89BD5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:29:25 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C09120B1F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:29:25 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id i34so10524711qta.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:29:25 -0700 (PDT)
X-Gm-Message-State: APjAAAUSqhpUiyQShj3R9Ap9fheDT5JYHKu7QoZl5rt/A8FDkcYKU7V6
 XPC00NtvsWNDKzVaDmcjrJVHlCShUqi1EXzUKA==
X-Google-Smtp-Source: APXvYqwQLV9yhD27wiqU2ayDlYb+Dinv3QZgpL+V65HzTmR3zsCztH+j9vOvZmsViAmKkzezUA60MKSnOaZupaqcrwQ=
X-Received: by 2002:a05:6214:248:: with SMTP id
 k8mr27958718qvt.200.1560871764397; 
 Tue, 18 Jun 2019 08:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190618081343.16927-1-boris.brezillon@collabora.com>
In-Reply-To: <20190618081343.16927-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 18 Jun 2019 09:29:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJhUxtAjbwUDppA3opAK4h9ws0wVuFT66yYZ7NU1=GzPg@mail.gmail.com>
Message-ID: <CAL_JsqJhUxtAjbwUDppA3opAK4h9ws0wVuFT66yYZ7NU1=GzPg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Make sure a BO is only unmapped when
 appropriate
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560871765;
 bh=ZUn5t8oppJ5dPnyga+v1j8kW2zl2IawTdiWuxnDXTUY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XFu4TbQFnR1p7juiJj01PV1oYs25i5DKIQNQcwHgmIr5GH2zipDKke9gjaVOsz20Y
 AEy/p1ZoVTp5CCfnzQ6+VHPHEWwYMi61+U3kzOTKQVz4XPjBgNQYSDrThPuQrYRUrn
 WSZ9V+5WzywyQKyIc9TQ8YJL7eSKfNzI1+7HQJDg=
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
Cc: stable <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMjoxMyBBTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IG1tdV9vcHMtPnVubWFwKCkgd2lsbCBm
YWlsIHdoZW4gY2FsbGVkIG9uIGEgQk8gdGhhdCBoYXMgbm90IGJlZW4KPiBwcmV2aW91c2x5IG1h
cHBlZCwgYW5kIHRoZSBlcnJvciBwYXRoIGluIHBhbmZyb3N0X2lvY3RsX2NyZWF0ZV9ibygpCj4g
Y2FuIGNhbGwgZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKCkgKHdoaWNoIGluIHR1cm4gY2Fs
bHMKPiBwYW5mcm9zdF9tbXVfdW5tYXAoKSkgb24gYSBCTyB0aGF0IGhhcyBub3QgYmVlbiBtYXBw
ZWQgeWV0Lgo+Cj4gS2VlcCB0cmFjayBvZiB0aGUgbWFwcGVkL3VubWFwcGVkIHN0YXRlIHRvIGF2
b2lkIHN1Y2ggaXNzdWVzLgo+Cj4gRml4ZXM6IGYzYmE5MTIyOGU4ZSAoImRybS9wYW5mcm9zdDog
QWRkIGluaXRpYWwgcGFuZnJvc3QgZHJpdmVyIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogQ2hlY2sgaXNfbWFwcGVkIHZh
bCBpbiB0aGUgY2FsbGVyIGFuZCBhZGQgV0FSTl9PTigpIGluIHRoZSBtbXUgY29kZQo+ICAgKHN1
Z2dlc3RlZCBieSBUb21ldSkKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2dlbS5jIHwgMyArKy0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bS5oIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDgg
KysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpBcHBsaWVkLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
