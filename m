Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72EFA097E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 20:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFCD89DAB;
	Wed, 28 Aug 2019 18:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0287289DAB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:33:25 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id q8so497487oij.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 11:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRw4JAwMK/TegnyayQas2h0SadP2fic7Zv1TUKBel5o=;
 b=HUIzNvAk109DEW4Se8XPVarXU+y8clBatY+LGrMI9PI5v6q4dzEn/m9WR91VMVjB2l
 BTPIEtqpMNLiqM5BbwTUEkiUyVTMlVWUTjg0qJU/Y0kkx8mK78GDQM+qJ9O2zbGbQtaD
 iHWcjbmAwkjVkGG8HklsQWwDIht+iiI/+z5B+EwLQrqpXzkv9rlIBzzyrerkzNqtGfm1
 5szdLaIhgihVhKC9yv9xP9TgqXUuyoyEEO/xhVoNEg67jhY3wobfJFcVIsC8FPdJREQM
 DYK1ht6obyWRoMF+LjX3cgjPhc54AS/cYvKLSo6g6SMI7vTU2j/s1vRN1dRfDM3BhQrd
 TJCw==
X-Gm-Message-State: APjAAAX5azUYMZSNy70w1E3SgYKoyXawBxPYbrRO1UEakKmZny6EVFSe
 L4NgebromLvgDdzCWbdEKNn8v1i12Q14jS8BLmkgEA==
X-Google-Smtp-Source: APXvYqxshs+IbUxVF7bX+CC6odwm6yUPhQaN60op/uAq3yyqpLy+0PZBoNClG3BYkaFZ3dYugoyTBC4HI+Obkt1XEV4=
X-Received: by 2002:aca:6742:: with SMTP id b2mr3778581oiy.14.1567017205105;
 Wed, 28 Aug 2019 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
 <20190826201425.17547-4-daniel.vetter@ffwll.ch>
 <20190827225002.GB30700@ziepe.ca>
In-Reply-To: <20190827225002.GB30700@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 28 Aug 2019 20:33:13 +0200
Message-ID: <CAKMK7uHKiLwXLHd1xThZVM1dH-oKrtpDZ=FxLBBwtY7XmJKgtA@mail.gmail.com>
Subject: Re: [PATCH 3/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MRw4JAwMK/TegnyayQas2h0SadP2fic7Zv1TUKBel5o=;
 b=VeBtF93wmFWp16gPmYOQv/sDqBZbOhNKDsEFS/r+1ujwicLkHIplTAeOkU/YhRf81U
 iE//NvDEi7pyMMEhylzy9D5t+BM6uaUww6q7vfD2pt45cZ772YL9Q5ChveoiwVauphCz
 tHCP8nw7jJgZIkjkReMrHLn/1r1pfE6A0fRcQ=
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTI6NTAgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rZXJuZWwuaCBi
L2luY2x1ZGUvbGludXgva2VybmVsLmgKPiA+IGluZGV4IDRmYTM2MGExM2MxZS4uODJmODRjZmUz
NzJmIDEwMDY0NAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9rZXJuZWwuaAo+ID4gQEAgLTIxNyw3
ICsyMTcsOSBAQCBleHRlcm4gdm9pZCBfX2NhbnRfc2xlZXAoY29uc3QgY2hhciAqZmlsZSwgaW50
IGxpbmUsIGludCBwcmVlbXB0X29mZnNldCk7Cj4gPiAgICogbWlnaHRfc2xlZXAgLSBhbm5vdGF0
aW9uIGZvciBmdW5jdGlvbnMgdGhhdCBjYW4gc2xlZXAKPiA+ICAgKgo+ID4gICAqIHRoaXMgbWFj
cm8gd2lsbCBwcmludCBhIHN0YWNrIHRyYWNlIGlmIGl0IGlzIGV4ZWN1dGVkIGluIGFuIGF0b21p
Ywo+ID4gLSAqIGNvbnRleHQgKHNwaW5sb2NrLCBpcnEtaGFuZGxlciwgLi4uKS4KPiA+ICsgKiBj
b250ZXh0IChzcGlubG9jaywgaXJxLWhhbmRsZXIsIC4uLikuIEFkZGl0aW9uYWwgc2VjdGlvbnMg
d2hlcmUgYmxvY2tpbmcgaXMKPiA+ICsgKiBub3QgYWxsb3dlZCBjYW4gYmUgYW5ub3RhdGVkIHdp
dGggbm9uX2Jsb2NrX3N0YXJ0KCkgYW5kIG5vbl9ibG9ja19lbmQoKQo+ID4gKyAqIHBhaXJzLgo+
ID4gICAqCj4gPiAgICogVGhpcyBpcyBhIHVzZWZ1bCBkZWJ1Z2dpbmcgaGVscCB0byBiZSBhYmxl
IHRvIGNhdGNoIHByb2JsZW1zIGVhcmx5IGFuZCBub3QKPiA+ICAgKiBiZSBiaXR0ZW4gbGF0ZXIg
d2hlbiB0aGUgY2FsbGluZyBmdW5jdGlvbiBoYXBwZW5zIHRvIHNsZWVwIHdoZW4gaXQgaXMgbm90
Cj4gPiBAQCAtMjMzLDYgKzIzNSwyNSBAQCBleHRlcm4gdm9pZCBfX2NhbnRfc2xlZXAoY29uc3Qg
Y2hhciAqZmlsZSwgaW50IGxpbmUsIGludCBwcmVlbXB0X29mZnNldCk7Cj4gPiAgIyBkZWZpbmUg
Y2FudF9zbGVlcCgpIFwKPiA+ICAgICAgIGRvIHsgX19jYW50X3NsZWVwKF9fRklMRV9fLCBfX0xJ
TkVfXywgMCk7IH0gd2hpbGUgKDApCj4gPiAgIyBkZWZpbmUgc2NoZWRfYW5ub3RhdGVfc2xlZXAo
KSAgICAgIChjdXJyZW50LT50YXNrX3N0YXRlX2NoYW5nZSA9IDApCj4gPiArLyoqCj4gPiArICog
bm9uX2Jsb2NrX3N0YXJ0IC0gYW5ub3RhdGUgdGhlIHN0YXJ0IG9mIHNlY3Rpb24gd2hlcmUgc2xl
ZXBpbmcgaXMgcHJvaGliaXRlZAo+ID4gKyAqCj4gPiArICogVGhpcyBpcyBvbiBiZWhhbGYgb2Yg
dGhlIG9vbSByZWFwZXIsIHNwZWNpZmljYWxseSB3aGVuIGl0IGlzIGNhbGxpbmcgdGhlIG1tdQo+
ID4gKyAqIG5vdGlmaWVycy4gVGhlIHByb2JsZW0gaXMgdGhhdCBpZiB0aGUgbm90aWZpZXIgd2Vy
ZSB0byBibG9jayBvbiwgZm9yIGV4YW1wbGUsCj4gPiArICogbXV0ZXhfbG9jaygpIGFuZCBpZiB0
aGUgcHJvY2VzcyB3aGljaCBob2xkcyB0aGF0IG11dGV4IHdlcmUgdG8gcGVyZm9ybSBhCj4gPiAr
ICogc2xlZXBpbmcgbWVtb3J5IGFsbG9jYXRpb24sIHRoZSBvb20gcmVhcGVyIGlzIG5vdyBibG9j
a2VkIG9uIGNvbXBsZXRpb24gb2YKPiA+ICsgKiB0aGF0IG1lbW9yeSBhbGxvY2F0aW9uLiBPdGhl
ciBibG9ja2luZyBjYWxscyBsaWtlIHdhaXRfZXZlbnQoKSBwb3NlIHNpbWlsYXIKPiA+ICsgKiBp
c3N1ZXMuCj4gPiArICovCj4gPiArIyBkZWZpbmUgbm9uX2Jsb2NrX3N0YXJ0KCkgXAo+ID4gKyAg
ICAgZG8geyBjdXJyZW50LT5ub25fYmxvY2tfY291bnQrKzsgfSB3aGlsZSAoMCkKPiA+ICsvKioK
PiA+ICsgKiBub25fYmxvY2tfZW5kIC0gYW5ub3RhdGUgdGhlIGVuZCBvZiBzZWN0aW9uIHdoZXJl
IHNsZWVwaW5nIGlzIHByb2hpYml0ZWQKPiA+ICsgKgo+ID4gKyAqIENsb3NlcyBhIHNlY3Rpb24g
b3BlbmVkIGJ5IG5vbl9ibG9ja19zdGFydCgpLgo+ID4gKyAqLwo+ID4gKyMgZGVmaW5lIG5vbl9i
bG9ja19lbmQoKSBcCj4gPiArICAgICBkbyB7IFdBUk5fT04oY3VycmVudC0+bm9uX2Jsb2NrX2Nv
dW50LS0gPT0gMCk7IH0gd2hpbGUgKDApCj4KPiBjaGVjay1wYXRjaCBkb2VzIG5vdCBsaWtlIHRo
ZXNlLCBhbmQgSSBhZ3JlZQo+Cj4gIzEwMTogRklMRTogaW5jbHVkZS9saW51eC9rZXJuZWwuaDoy
NDg6Cj4gKyMgZGVmaW5lIG5vbl9ibG9ja19zdGFydCgpIFwKPiArICAgICAgIGRvIHsgY3VycmVu
dC0+bm9uX2Jsb2NrX2NvdW50Kys7IH0gd2hpbGUgKDApCj4KPiAvdG1wL3RtcDFzcGZ4dWZ5LzAw
MDYta2VybmVsLWgtQWRkLW5vbl9ibG9ja19zdGFydC1lbmQtLnBhdGNoOjEwODogV0FSTklORzog
U2luZ2xlIHN0YXRlbWVudCBtYWNyb3Mgc2hvdWxkIG5vdCB1c2UgYSBkbyB7fSB3aGlsZSAoMCkg
bG9vcAo+ICMxMDg6IEZJTEU6IGluY2x1ZGUvbGludXgva2VybmVsLmg6MjU1Ogo+ICsjIGRlZmlu
ZSBub25fYmxvY2tfZW5kKCkgXAo+ICsgICAgICAgZG8geyBXQVJOX09OKGN1cnJlbnQtPm5vbl9i
bG9ja19jb3VudC0tID09IDApOyB9IHdoaWxlICgwKQo+Cj4gUGxlYXNlIHVzZSBhIHN0YXRpYyBp
bmxpbmU/CgpXZSBuZWVkIGdldF9jdXJyZW50KCkgcGx1cyB0aGUgdGFza19zdHJ1Y3QsIHNvIHRo
aXMgZ2V0cyByZWFsIG1lc3N5CnJlYWwgZmFzdC4gTm90IGV2ZW4gc3VyZSB3aGljaCBoZWFkZXIg
dGhpcyB3b3VsZCBmaXQgaW4sIG9yIHdoZXRoZXIKSSdkIG5lZWQgdG8gY3JlYXRlIGEgbmV3IG9u
ZS4gWW91J3JlIGluc2lzdGluZyBvbiB0aGlzIG9yIHJlc3Bpbm5pbmcKd2l0aCB0aGUgZG8geyB9
IHdoaWxlICgwKSBkcm9wcGVkIG9rLgoKVGhhbmtzLCBEYW5pZWwKCj4gQWxzbywgY2FuIHdlIGdl
dCBvbmUgbW9yZSBhY2sgb24gdGhpcyBwYXRjaD8KPgo+IEphc29uCgoKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
