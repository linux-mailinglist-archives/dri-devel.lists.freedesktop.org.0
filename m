Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645ADE32F3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDE06E3EB;
	Thu, 24 Oct 2019 12:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5736E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:49:48 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e11so20516107otl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PyaL5FR9d/jZB2FfWAIqD9mvnFhdj/C8GIiTAS5nB5E=;
 b=mzrj5KkY8AEDavPqzXhOPPA80YW4+JJMWx7t63WIdPbUil87Sj5xHzFYD4jhfUkMnT
 dyUE8FBMVNOmGmVUm2Nf5njMm8w5WCzis4uVOioQfI4B+L5Yts3w0D6gvNOol0dP5KTo
 DDLtGUL5l4zfiopF79YLtXiWZTtXfVTkZmQ/BjwJluQtZpQL8V5YMfqlbNkFFENUx7nO
 A+iMnnUTnHyBct65uG85NPenu2blWvX6IGFZkpBze24Ys6rBJTSY6n7SqFNeMt06peJa
 ZIXMyPY/PHVQvwIEKZpUWhTgjcakud67QVgshFOWIz5TrPg2f7+TG6CBPhsOnzsth/mY
 87lQ==
X-Gm-Message-State: APjAAAVkT2adsemAHtX6xTqSPIFKheqNESIhyLRQ5Q9pYAZldxd0ZwFM
 EJVXreBtJoBZpji3+kQeS/eoHuM/mF03fJc4Vk9Siw==
X-Google-Smtp-Source: APXvYqyBIm/+WjVbGnSqvCqrpKyxMyAB4TFsKoUFfjuFU1JyyjPDGC0E5vf2MNMJj7EyC3WH+PQTxnzIDxkDciHoSKo=
X-Received: by 2002:a9d:b92:: with SMTP id 18mr12068647oth.188.1571921387385; 
 Thu, 24 Oct 2019 05:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local>
 <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
In-Reply-To: <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Oct 2019 14:49:36 +0200
Message-ID: <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
To: Colin Ian King <colin.king@canonical.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PyaL5FR9d/jZB2FfWAIqD9mvnFhdj/C8GIiTAS5nB5E=;
 b=Ce2z1v+kSoWNglTt3WTllLp6U0xvVrQ58wmZZsFzSkJD2t3+lWNZy085pZDtxpY+zJ
 rUcaX977WLwXD5060KJzO2dq3EKxq+VND5w7OMOxURBBF+OASxA/W2pSivJdHp+2QiQp
 +cFIcuPS1SLujURbUtaSktkgsNnlh5lM3TVFM=
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMjo0MyBQTSBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE9uIDI0LzEwLzIwMTkgMTM6MzgsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAxMTo0ODowMUFNICswMTAw
LCBDb2xpbiBLaW5nIHdyb3RlOgo+ID4+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+Cj4gPj4KPiA+PiBUd28gZGlmZmVyZW50IGZpeGVzIGhhdmUgYWRkcmVz
c2VkIHRoZSBzYW1lIG1lbW9yeSBsZWFrIG9mIGJpbiBhbmQKPiA+PiB0aGlzIG5vdyBjYXVzZXMg
YSBkb3VibGUgZnJlZSBvZiBiaW4uICBXaGlsZSB0aGUgaW5kaXZpZHVhbCBtZW1vcnkKPiA+PiBs
ZWFrIGZpeGVzIGFyZSBmaW5lLCBib3RoIGZpeGVzIHRvZ2V0aGVyIGFyZSBwcm9ibGVtYXRpYy4K
PiA+Pgo+ID4+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEb3VibGUgZnJlZSIpCj4gPj4gRml4ZXM6
IDI5Y2QxM2NmZDc2MiAoImRybS92M2Q6IEZpeCBtZW1vcnkgbGVhayBpbiB2M2Rfc3VibWl0X2Ns
X2lvY3RsIikKPiA+PiBGaXhlczogMGQzNTJhM2E4YTFmICgiIHJtL3YzZDogZG9uJ3QgbGVhayBi
aW4gam9iIGlmIHYzZF9qb2JfaW5pdCBmYWlscy4iKQo+ID4+IFNpZ25lZC1vZmYtYnk6IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPgo+ID4gVGhhdCBzb3VuZHMg
bGlrZSB3cm9uZyBtZXJnZSByZXNvbHV0aW9uIHNvbWV3aGVyZSwgYW5kIHdlIGRvbid0IGhhdmUg
dGhvc2UKPiA+IHBhdGNoZXMgbWVyZ2VkIHRvZ2V0aGVyIGluIGFueSBmaW5hbCB0cmVlIHlldCBh
bnl3aGVyZS4gV2hhdCdzIHRoaXMgYmFzZWQKPiA+IG9uPwo+ID4gLURhbmllbAo+Cj4gbGludXgt
bmV4dAoKT2sgYWRkaW5nIFN0ZXBoZW4uIFRoZXJlJ3MgYSBtZXJnZSBjb25mbGljdCBiZXR3ZWVu
IGRybS1taXNjLWZpeGVzIGFuZApkcm0tbmV4dCAoSSB0aGluaykgYW5kIHRoZSBtZXJnZSBkb3Vi
bGUtYWRkZWQgdGhlIGtmcmVlKGJpbikuIFNlZQphYm92ZSBmb3IgdGhlIHJlbGV2YW50IHNoYTEu
IERhdmUgaXMgYWxyZWFkeSBvbiBoZXJlIGFzIGEgaGVhZHMtdXAsCmJ1dCBhbHNvIGFkZGluZyBk
cm0tbWlzYyBtYWludGFpbmVycy4KCkNoZWVycywgRGFuaWVsCgo+Cj4gQ29saW4KPiA+Cj4gPj4g
LS0tCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIHwgMSAtCj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3YzZC92M2RfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+ID4+
IGluZGV4IDU0OWRkZTgzNDA4Yi4uMzc1MTVlNDdiNDdlIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92
M2RfZ2VtLmMKPiA+PiBAQCAtNTY4LDcgKzU2OCw2IEBAIHYzZF9zdWJtaXRfY2xfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+PiAgICAgICAgICAgICAgcmV0ID0g
djNkX2pvYl9pbml0KHYzZCwgZmlsZV9wcml2LCAmYmluLT5iYXNlLAo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdjNkX2pvYl9mcmVlLCBhcmdzLT5pbl9zeW5jX2JjbCk7Cj4g
Pj4gICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+PiAtICAgICAgICAgICAgICAgICAgICBrZnJl
ZShiaW4pOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgIHYzZF9qb2JfcHV0KCZyZW5kZXItPmJh
c2UpOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKGJpbik7Cj4gPj4gICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+PiAtLQo+ID4+IDIuMjAuMQo+ID4+Cj4gPgo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEg
KDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
