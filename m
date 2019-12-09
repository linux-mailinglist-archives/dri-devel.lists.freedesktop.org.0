Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42483116EC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8997189F6D;
	Mon,  9 Dec 2019 14:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89BF89F6D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:13:05 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id o187so4421339vka.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aUDVaFVa621kn50DXV3o7Kitv1DMm0G9/c9toX0fmn0=;
 b=SrvNUnD2QvOvLSr4F97zX0/1je4bpKn35VP8w0hnuiP9Y5ece6C3vR6XNWvzm+jCcz
 j3jPr/Qj7LQj1t9yHx5imjaBdbiSWAx/nxJfWP+LRrvvQ/+g2arXRsTqAvMqeSXG0rJg
 XXnJ9ZNBQk9uDokMhJ4bk24PPxV3bvBkuKeaS7dZ/Y6vP3JWTn0x4XXm3LkD+bcgkrc+
 3mdt01YCZN2ZJ6dtTz1fQQFchAwGuO8aNrtUT1aRS47hEfEBk9CpVDgh94zrz2WqBjF7
 S9VrFg9YIwVxtONrNJ6alBKC453paurbIjtPWn/dQ8FdQgNKI+gbg8xIzi7b2e+2EE+M
 73ug==
X-Gm-Message-State: APjAAAULf4n22ZUJqK0VxvmP/Szc1pHikjDkalmABwcJPq18KfS/sYKW
 UgSgt1wDD82xiRXK8q1U+Km1IXoQgyEQOQnruek=
X-Google-Smtp-Source: APXvYqx5qpcOt0tGeCg9imDtY3fiqGmI1jPZBxe9u9ibvS44B4ltWhGr2ELCwNBsd0UxINkTcgIWCNCYBog0pBCyRmk=
X-Received: by 2002:a1f:c982:: with SMTP id z124mr4502715vkf.6.1575900784538; 
 Mon, 09 Dec 2019 06:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20191205160142.3588-1-tzimmermann@suse.de>
 <20191205160142.3588-5-tzimmermann@suse.de>
In-Reply-To: <20191205160142.3588-5-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 9 Dec 2019 14:11:51 +0000
Message-ID: <CACvgo51tpt-sXMnHd0tAQqNCSkuVn5wgv4qNMPBa3a2RYnM8xg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/fb-helper: Synchronize dirty worker with vblank
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aUDVaFVa621kn50DXV3o7Kitv1DMm0G9/c9toX0fmn0=;
 b=UQtpfwiTvN9O18zzWwFa+wFRgAcK/vi7ohvHXeeXc3g6NBEPsiRnSpIEvq19vUncmK
 E6YXt8VQzD5ve46YSKl6ecaxjbW35BLxBgSZoUIm85pdz9M9IjUwl6ouwN2fQhasiHxv
 I/r+bYsSeBlBrDZV9OObOp95VC8fqNxa+7CAh06Zqaiz/nSdruMFvF4U7xI/g9m7iFH5
 MyMuW+glykhoJfM/vesLQzpskjK9ocKqKRMINul77s7Pgl/IqkQgDl5+JYzCgW7B3rcn
 X3RDfVhGoHsnXXNQTG/RIZWY6hi2cwV9KmYdLDVeB25wEpfxjx1u1L0HFz4tlQyZzfXm
 7QTA==
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
Cc: rong.a.chen@intel.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 ying.huang@intel.com, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gVGh1LCA1IERlYyAyMDE5IGF0IDE2OjAxLCBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBCZWZvcmUgdXBkYXRpbmcgdGhlIGRp
c3BsYXkgZnJvbSB0aGUgY29uc29sZSdzIHNoYWRvdyBidWZmZXIsIHRoZSBkaXJ0eQo+IHdvcmtl
ciBub3cgd2FpdHMgZm9yIGEgdmJsYW5rLiBUaGlzIGFsbG93cyBzZXZlcmFsIHNjcmVlbiB1cGRh
dGVzIHRvIHBpbGUKPiB1cCBhbmQgYWN0cyBhcyBhIHJhdGUgbGltaXRlci4gSWYgYSBEUk0gbWFz
dGVyIGlzIHByZXNlbnQsIGl0IGNvdWxkCj4gaW50ZXJmZXJlIHdpdGggdGhlIHZibGFuay4gRG9u
J3Qgd2FpdCBpbiB0aGlzIGNhc2UuCj4KPiB2MzoKPiAgICAgICAgICogYWRkIGJhY2sgaGVscGVy
LT5sb2NrCj4gICAgICAgICAqIGFjcXVpcmUgRFJNIG1hc3RlciBzdGF0dXMgd2hpbGUgd2FpdGlu
ZyBmb3IgdmJsYW5rCj4gdjI6Cj4gICAgICAgICAqIGRvbid0IGhvbGQgaGVscGVyLT5sb2NrIHdo
aWxlIHdhaXRpbmcgZm9yIHZibGFuawo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+IGluZGV4IGZiOWJmZjBm
NDU4MS4uYmEyMGFkOTJmYjkwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gQEAgLTQw
NCw4ICs0MDQsMjkgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGlydHlfd29yayk7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2NsaXBf
cmVjdCAqY2xpcCA9ICZoZWxwZXItPmRpcnR5X2NsaXA7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2Ns
aXBfcmVjdCBjbGlwX2NvcHk7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7Cj4gICAg
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgICAgICAgdm9pZCAqdmFkZHI7Cj4gKyAgICAg
ICBpbnQgcmV0Owo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBSYXRlLWxpbWl0IHVwZGF0
ZSBmcmVxdWVuY3kgdG8gdmJsYW5rLiBJZiB0aGVyZSdzIGEgRFJNIG1hc3Rlcgo+ICsgICAgICAg
ICogcHJlc2VudCwgaXQgY291bGQgaW50ZXJmZXJlIHdoaWxlIHdlJ3JlIHdhaXRpbmcgZm9yIHRo
ZSB2YmxhbmsKPiArICAgICAgICAqIGV2ZW50LiBEb24ndCB3YWl0IGluIHRoaXMgY2FzZS4KPiAr
ICAgICAgICAqLwo+ICsgICAgICAgbXV0ZXhfbG9jaygmaGVscGVyLT5sb2NrKTsKPiArICAgICAg
IGlmICghZHJtX21hc3Rlcl9pbnRlcm5hbF9hY3F1aXJlKGhlbHBlci0+ZGV2KSkgewo+ICsgICAg
ICAgICAgICAgICBnb3RvIHVubG9jazsKPiArICAgICAgIH0KPiArICAgICAgIGNydGMgPSBoZWxw
ZXItPmNsaWVudC5tb2Rlc2V0c1swXS5jcnRjOwo+ICsgICAgICAgcmV0ID0gZHJtX2NydGNfdmJs
YW5rX2dldChjcnRjKTsKPiArICAgICAgIGlmICghcmV0KSB7Cj4gKyAgICAgICAgICAgICAgIGRy
bV9jcnRjX3dhaXRfb25lX3ZibGFuayhjcnRjKTsKPiArICAgICAgICAgICAgICAgZHJtX2NydGNf
dmJsYW5rX3B1dChjcnRjKTsKPiArICAgICAgIH0KPiArICAgICAgIGRybV9tYXN0ZXJfaW50ZXJu
YWxfcmVsZWFzZShoZWxwZXItPmRldik7Cj4gK3VubG9jazoKPiArICAgICAgIG11dGV4X3VubG9j
aygmaGVscGVyLT5sb2NrKTsKPgoKVGhpcyBodW5rIHNlZW1zIHN1cnByaXNpbmdseSBzaW1pbGFy
IHRvIHRoZSBGQklPX1dBSVRGT1JWU1lOQyBjb2RlIGluCmRybV9mYl9oZWxwZXJfaW9jdGwoKS4K
TW9kdWxvIHRoZSByZWFsbHkgbmVhdCBjb21tZW50LCB3aGljaCBhbnN3ZXJzIHRoZSAid2h5IGRv
IHdlIHVzZQptb2Rlc2V0WzBdIiBpbnN0ZWFkIG9mIGFueSBvdGhlciAob3IgYWxsKS4KCkNhbiBJ
IHN1Z2dlc3QgZmxlc2hpbmcgdGhhdCBmdW5jdGlvbiBvdXQgKGFsb25nc2lkZSBhbGwgdGhlIGxv
Y2tpbmcpCmludG8gYSBoZWxwZXIgYW5kIHJldXNpbmcgaXQgaGVyZS4KUHJldHR5IHN1cmUgd2Ug
Y2FuIGxpdmUgd2l0aCB0aGUgKHZlcnkgdW5saWtlbHkpIEVCVVNZIC0+IEVOT1RUWQpjaGFuZ2Us
IGluIGRybV9mYl9oZWxwZXJfaW9jdGwoKQoKSFRICkVtaWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
