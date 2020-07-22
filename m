Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315E229895
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 14:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BA2893C0;
	Wed, 22 Jul 2020 12:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14770893C0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 12:51:43 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c25so1642722otf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+/pF3SCY8xJs7DmzgS+n3eKJ4TjeFNT447j5SaOKcWo=;
 b=OTm90I5OSe/cJMhk3v86ivkKxFA5udVMzmIA59k++vwjdC2qHDKb440cfJnG0/CEcT
 WEUVP91nhnqgZmtN/ZCXgPPivWUAmO/VO523pcjiHwWeZ4wUan3X8y8DECkhatadVZCv
 xq5mYaNP5T+UweyLDXr5C5CM6KPUW4Bi+o5wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+/pF3SCY8xJs7DmzgS+n3eKJ4TjeFNT447j5SaOKcWo=;
 b=pXEOEoe5yk3UPZ2kXKlkAr3tz+cTpI7QGiuvHZsGHiBNAsk7DIrqsWdWOqqUt/BoL+
 cJywg6wsW2ciDda8yFxf3CSf9p9PnfhzPYOXp0p8Tdiv7scK9cLmD8pCScDfedke2pA+
 Iobwu98yHuu78Y8OqYGcbJouHBTN3aw2H5+5Dc4rCRv96HXbkFAoQaVBuy3AYCcDXkCu
 DYY4dbXIwcQ5uyvGCySMvab8RV5AGUz5XLQnMgtlNC2CtJKmR7qH7bBFxJJnvy+TdFTs
 YHqhPLFikiFLslZENP4hLgqX01OS6OOncQmXAn/aCQIsGJ1K9K0yZe8LxQ9OFHGM4913
 cR/w==
X-Gm-Message-State: AOAM531QVDUHGOIppm36zMDzG4RU5Dsv/yXziQgHJ08GMjJOSXrfWh71
 tOGEQwvhHU+dr805sW5bOCMU9fR8yOhAVLxNMKv3Hw==
X-Google-Smtp-Source: ABdhPJxR4pIVgabqvMb4RRA8e6sxQFDzuTMs8bk5zOofaPvfh1eG0ImuhElWy2TQBAnNPnOFV2cl0esAJFhYA6UDLwI=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr29749847oti.281.1595422302230; 
 Wed, 22 Jul 2020 05:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200722123813.721041-1-michel@daenzer.net>
In-Reply-To: <20200722123813.721041-1-michel@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 14:51:31 +0200
Message-ID: <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgMjozOCBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRo
YXQuY29tPgo+Cj4gZHJtX2F0b21pY19jcnRjX2NoZWNrIGVuZm9yY2VzIHRoYXQgOjphY3RpdmUg
Y2FuIG9ubHkgYmUgdHJ1ZSBpZgo+IDo6ZW5hYmxlIGlzIGFzIHdlbGwuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KCm1vZGVzZXQgdnMgbW9k
ZXJlc2V0IGlzIGEgYml0IGFuIGluZ2xvcmlvdXMgbmFtZSBjaG9pY2UgLi4uIHNpbmNlIHRoaXMK
c2VlbXMgdG8gYmUgZ2x1ZSBjb2RlIGFuZCBub3QgcGFydCBvZiBjb3JlIGRjLCBtYXliZSByZW5h
bWUgdG8KZW5hYmxlX3JlcXVpcmVkL2Rpc2FibGVfcmVxdWlyZWQgdG8ga2VlcCBpdCBjb25zaXN0
ZW50IHdpdGggdGhlCndvcmRpbmcgYXRvbWljIGhlbHBlcnMgdXNlPyBEQyBhbHNvIHNlZW1zIHRv
IHVzZSByZXNldCBmb3IgYSBsb3Qgb2YKb3RoZXIgdGhpbmdzIGFscmVhZHkgKHN0YXRlIHJlc2V0
LCBsaWtlIGF0b21pYywgb3IgZ3B1IHJlc2V0IGxpa2UKZHJtL3NjaGVkdWxlcidzIHRkX3JfKSwg
c28gSSB0aGluayB0aGlzIHdvdWxkIGFsc28gaGVscCBjbGFyaXR5IGZyb20gYQpEQyBwZXJzcGVj
dGl2ZS4KClBhdGNoIGl0c2VsZiBpcyBnb29kLCBhYm92ZSBqdXN0IGFuIGlkZWEgZm9yIGFub3Ro
ZXIgcGF0Y2ggb24gdG9wLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyAgICB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBpbmRleCAzMTJjNTQzYjI1OGYu
LmRhYmVmMzA3YTc0ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IEBAIC0zNDE1LDIxICszNDE1LDEyIEBAIHN0YXRpYyBi
b29sIG1vZGVzZXRfcmVxdWlyZWQoc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqbmV3
X3N0cmVhbSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkY19zdHJlYW1f
c3RhdGUgKm9sZF9zdHJlYW0pCj4gIHsKPiAtICAgICAgIGlmICghZHJtX2F0b21pY19jcnRjX25l
ZWRzX21vZGVzZXQoY3J0Y19zdGF0ZSkpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
PiAtCj4gLSAgICAgICBpZiAoIWNydGNfc3RhdGUtPmVuYWJsZSkKPiAtICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+IC0KPiAtICAgICAgIHJldHVybiBjcnRjX3N0YXRlLT5hY3RpdmU7Cj4g
KyAgICAgICByZXR1cm4gY3J0Y19zdGF0ZS0+YWN0aXZlICYmIGRybV9hdG9taWNfY3J0Y19uZWVk
c19tb2Rlc2V0KGNydGNfc3RhdGUpOwo+ICB9Cj4KPiAgc3RhdGljIGJvb2wgbW9kZXJlc2V0X3Jl
cXVpcmVkKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKPiAgewo+IC0gICAgICAg
aWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0YXRlKSkKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IC0KPiAtICAgICAgIHJldHVybiAhY3J0Y19zdGF0ZS0+
ZW5hYmxlIHx8ICFjcnRjX3N0YXRlLT5hY3RpdmU7Cj4gKyAgICAgICByZXR1cm4gIWNydGNfc3Rh
dGUtPmFjdGl2ZSAmJiBkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0YXRlKTsK
PiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyKQo+IEBAIC04MTA4LDggKzgwOTksNyBAQCBzdGF0aWMgaW50IGRt
X3VwZGF0ZV9jcnRjX3N0YXRlKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKPiAg
ICAgICAgICAqIFdlIHdhbnQgdG8gZG8gZGMgc3RyZWFtIHVwZGF0ZXMgdGhhdCBkbyBub3QgcmVx
dWlyZSBhCj4gICAgICAgICAgKiBmdWxsIG1vZGVzZXQgYmVsb3cuCj4gICAgICAgICAgKi8KPiAt
ICAgICAgIGlmICghKGVuYWJsZSAmJiBhY29ubmVjdG9yICYmIG5ld19jcnRjX3N0YXRlLT5lbmFi
bGUgJiYKPiAtICAgICAgICAgICAgIG5ld19jcnRjX3N0YXRlLT5hY3RpdmUpKQo+ICsgICAgICAg
aWYgKCEoZW5hYmxlICYmIGFjb25uZWN0b3IgJiYgbmV3X2NydGNfc3RhdGUtPmFjdGl2ZSkpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEdpdmVu
IGFib3ZlIGNvbmRpdGlvbnMsIHRoZSBkYyBzdGF0ZSBjYW5ub3QgYmUgTlVMTCBiZWNhdXNlOgo+
IC0tCj4gMi4yOC4wLnJjMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
