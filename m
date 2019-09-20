Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E988B9677
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 19:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7256FD6C;
	Fri, 20 Sep 2019 17:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876E6E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 17:23:28 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 83so2425530oii.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 10:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXZnqamIbP/q5lhg5UT8+sIjqF3wgnaX5NRUhGBui3U=;
 b=qDpkoJxXMIwt1vp4qgruU+rNRbekqtpOab4lbGQgxgiLXubY6Cab05mJ54CdaoxaCV
 uDjA6Numk9n/P0rHxDfFQMHSe/Jfn77ZDcWSoI0ObMYXpp7CNzvCotqzzIgtAsMEWR5Z
 9TYbhsBokmk88/kEoL4f6REn//C3wvcLULE8XYXo6K3Cb8BMvZAKrNqEZdUOjeW9LnG/
 rS2qOJMkxEQY1P3RyfZoIL9FRXIdEArkK7AN/URMyQDYqUkvnxYDQDWzIBXl1Wgu9vB/
 VcZrKP5OWHjAXNbA6KObkfBQbfpIASDoAtaZUYCDWDO5uaivB2bg2uuW2yI+Jq6YecoS
 7C2Q==
X-Gm-Message-State: APjAAAU34gB5Ernf8qXuIram807tfqbml1dvwh+oSA9cBDnHXH900m6F
 qwW8TT/ftr4fyI6grvPsowLf14rKryKJ0k/isNktNA==
X-Google-Smtp-Source: APXvYqxXRl9v5AwH+PgAC8t55TlgMBcRjoD9zuT9iwQo96yZyLnzB+MeNFrBMNoUrMyz3hg6KOxcTDYXmLiZ6KZDfII=
X-Received: by 2002:aca:eac5:: with SMTP id i188mr4134117oih.110.1569000207929; 
 Fri, 20 Sep 2019 10:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <1513071228-29551-1-git-send-email-Hongbo.He@amd.com>
In-Reply-To: <1513071228-29551-1-git-send-email-Hongbo.He@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 20 Sep 2019 19:23:17 +0200
Message-ID: <CAKMK7uG6oMbLwQNhkBQxP=A46nx6REdmaDTkm3h=pb1RDJTLBg@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/ttm: add on_alloc_stage and reservation into
 ttm_operation_ctx
To: Roger He <Hongbo.He@amd.com>, Dave Airlie <airlied@linux.ie>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WXZnqamIbP/q5lhg5UT8+sIjqF3wgnaX5NRUhGBui3U=;
 b=BbyHXzhA3GCX59WiZqfFGPa6nGlbX52/xee9pzcsZDPMMcnEkv8g7AqqeEwcFZ3Fk1
 qXgaPBQd71CWxl4wlMS+sF9cv5nzj8gkDrAljh8G2Hm5hkzZ144+7Xq9FnyVbLmHS8Td
 l6YbWCvOCoTF1f/kBTIiGAa8hGIigpel/07QI=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMTIsIDIwMTcgYXQgMTA6MzQgQU0gUm9nZXIgSGUgPEhvbmdiby5IZUBhbWQu
Y29tPiB3cm90ZToKPgo+IG9uX2FsbG9jX3N0YWdlOiBpcyB0aGlzIG9wZXJhdGlvbiBvbiBhbGxv
Y2F0aW9uIHN0YWdlCj4gcmVzdjogcmVzZXJ2YXRpb24gYm8gdXNlZCBvZiB0aGlzIG9wZXJhdGlv
bgo+Cj4gQ2hhbmdlLUlkOiBJMDFlYTQ4MmU4Yzc0NzAwMTQxOTZlYjIxOGUyZmY4OTEzMzA2ZWVm
MAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIEhlIDxIb25nYm8uSGVAYW1kLmNvbT4KClJlYWwgY29t
bWl0IG1lc3NhZ2UgKHRoZSBsYXRlciBwYXRjaGVzIHVzaW5nIHRoaXMgYXJlIGV2ZW4gc3BhcnNl
cikKYW5kL29yIHByb3BlciBrZXJuZWxkb2Mgd291bGQgYmUgbWFzc2l2ZWx5IGFwcHJlY2lhdGVk
IGluIGNvbW1vbiBjb2RlLgpZb3UgZ3V5cyBoYXZlIGRvbmUgYSB0b24gb2Ygc3R1ZmYgYW5kIHNw
ZWNpYWwgY2FzZXMganVzdCBmb3IgYW1kZ3B1LAphbmQgaWYgc29tZW9uZSBkb2Vzbid0IGF0IGxl
YXN0IGtub3cgd2hhdCB5b3UgYWltZWQgdG8gZG8gaXQncyBwcmV0dHkKbXVjaCBpbXBvc3NpYmxl
IHRvIHVuZGVyc3RhbmQuIEkgZG9uJ3QgY2FyZSBtdWNoIGlmIHRoaXMgaXMgdGhlCnN0YW5kYXJk
IGluIGRyaXZlcnMsIGJ1dCBjb21tb24gY29kZSByZWFsbHkgc2hvdWxkIGJvdGhlciB0byBleHBs
YWluCndoYXQgcHJvYmxlbSBpdCdzIHRyeWluZyB0byBzb2x2ZS4KCih5ZXMgSSB0aGluayBJIGZp
Z3VyZWQgb3V0IHdoYXQgaXQncyBkb2luZywgYnV0IEknbSBwcmV0dHkgc3VyZSBtb3N0CmRyaS1k
ZXZlbCBmb2xrcyBoYWNraW5nIG9uIGdlbS9jcy9yZW5kZXIgc3R1ZmYgd29uJ3QgYmUgc28gbHVj
a3kpCi1EYW5pZWwKCj4gLS0tCj4gIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggfCA0ICsr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5o
Cj4gaW5kZXggMzY4ZWIwMi4uMjVkZTU5NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2FwaS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+IEBAIC0y
NjMsNiArMjYzLDggQEAgc3RydWN0IHR0bV9ib19rbWFwX29iaiB7Cj4gICAqCj4gICAqIEBpbnRl
cnJ1cHRpYmxlOiBTbGVlcCBpbnRlcnJ1cHRpYmxlIGlmIHNsZWVwaW5nLgo+ICAgKiBAbm9fd2Fp
dF9ncHU6IFJldHVybiBpbW1lZGlhdGVseSBpZiB0aGUgR1BVIGlzIGJ1c3kuCj4gKyAqIEBvbl9h
bGxvY19zdGFnZTogaXMgdGhpcyBvcGVyYXRpb24gb24gYWxsb2NhdGlvbiBzdGFnZQo+ICsgKiBA
cmVzdjogcmVzdmF0aW9uIGJvIHVzZWQKPiAgICoKPiAgICogQ29udGV4dCBmb3IgVFRNIG9wZXJh
dGlvbnMgbGlrZSBjaGFuZ2luZyBidWZmZXIgcGxhY2VtZW50IG9yIGdlbmVyYWwgbWVtb3J5Cj4g
ICAqIGFsbG9jYXRpb24uCj4gQEAgLTI3MCw2ICsyNzIsOCBAQCBzdHJ1Y3QgdHRtX2JvX2ttYXBf
b2JqIHsKPiAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IHsKPiAgICAgICAgIGJvb2wgaW50ZXJy
dXB0aWJsZTsKPiAgICAgICAgIGJvb2wgbm9fd2FpdF9ncHU7Cj4gKyAgICAgICBib29sIG9uX2Fs
bG9jX3N0YWdlOwo+ICsgICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdjsKPiAg
ICAgICAgIHVpbnQ2NF90IGJ5dGVzX21vdmVkOwo+ICB9Owo+Cj4gLS0KPiAyLjcuNAo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
