Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A010E8AB96
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0636E60A;
	Mon, 12 Aug 2019 23:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBB76E60A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:57:01 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 533E82063F;
 Mon, 12 Aug 2019 23:57:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-6-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-6-brendanhiggins@google.com>
Subject: Re: [PATCH v12 05/18] kunit: test: add the concept of expectations
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 16:57:00 -0700
Message-Id: <20190812235701.533E82063F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565654221;
 bh=Bqdkmnp6mwn7+uGtiuDRkW/S4L7BPoXk0yV/X+vBL54=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=xH5Jr1y+zA4g2T4Lqz5yO5pV+3YI+m+g1R3ck6bSJoBiMnDkJSdrB5821koEnOM1x
 ozemBUqGL2ni/PA36r1U7ZN9xHwvK3C4GSABt23yhMwa/Dx7vomqnds0asZ6RIkXYl
 YOqHX4j25oAAbX9XJcyROx5ez17nbuRYexkCgIEQ=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDgpCj4gQWRkIHN1cHBv
cnQgZm9yIGV4cGVjdGF0aW9ucywgd2hpY2ggYWxsb3cgcHJvcGVydGllcyB0byBiZSBzcGVjaWZp
ZWQgYW5kCj4gdGhlbiB2ZXJpZmllZCBpbiB0ZXN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVu
ZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQt
Ynk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KClJldmlld2VkLWJ5OiBT
dGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpKdXN0IHNvbWUgbWlub3Igbml0cyBhZ2Fp
bi4KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90
ZXN0LmgKPiBpbmRleCBkMGJmMTEyOTEwY2FmLi4yNjI1YmNmZWIxOWFjIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUva3VuaXQvdGVzdC5oCj4gKysrIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgKPiBAQCAt
OSw4ICs5LDEwIEBACj4gICNpZm5kZWYgX0tVTklUX1RFU1RfSAo+ICAjZGVmaW5lIF9LVU5JVF9U
RVNUX0gKPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxrdW5pdC9h
c3NlcnQuaD4KCkNhbiB5b3UgYWxwaGFiZXQgc29ydCB0aGVzZT8KCj4gIAo+ICBzdHJ1Y3Qga3Vu
aXRfcmVzb3VyY2U7Cj4gIAo+IEBAIC0zMTksNCArMzIxLDg0NSBAQCB2b2lkIF9fcHJpbnRmKDMs
IDQpIGt1bml0X3ByaW50ayhjb25zdCBjaGFyICpsZXZlbCwKPiAgI2RlZmluZSBrdW5pdF9lcnIo
dGVzdCwgZm10LCAuLi4pIFwKPiAgICAgICAgICAgICAgICAga3VuaXRfcHJpbnRrKEtFUk5fRVJS
LCB0ZXN0LCBmbXQsICMjX19WQV9BUkdTX18pCj4gIAo+ICsvKgo+ICsgKiBHZW5lcmF0ZXMgYSBj
b21waWxlLXRpbWUgd2FybmluZyBpbiBjYXNlIG9mIGNvbXBhcmluZyBpbmNvbXBhdGlibGUgdHlw
ZXMuCj4gKyAqLwo+ICsjZGVmaW5lIF9fa3VuaXRfdHlwZWNoZWNrKGxocywgcmhzKSBcCj4gKyAg
ICAgICAoKHZvaWQpIF9fdHlwZWNoZWNrKGxocywgcmhzKSkKCklzIHRoZXJlIGEgcmVhc29uIHdo
eSB0aGlzIGNhbid0IGJlIGlubGluZWQgYW5kIHRoZSBfX2t1bml0X3R5cGVjaGVjaygpCm1hY3Jv
IGNhbid0IGJlIHJlbW92ZWQ/Cgo+ICsKPiArLyoqCj4gKyAqIEtVTklUX1NVQ0NFRUQoKSAtIEEg
bm8tb3AgZXhwZWN0YXRpb24uIE9ubHkgZXhpc3RzIGZvciBjb2RlIGNsYXJpdHkuCj4gKyAqIEB0
ZXN0OiBUaGUgdGVzdCBjb250ZXh0IG9iamVjdC4KWy4uLl0KPiArICogQGNvbmRpdGlvbjogYW4g
YXJiaXRyYXJ5IGJvb2xlYW4gZXhwcmVzc2lvbi4gVGhlIHRlc3QgZmFpbHMgd2hlbiB0aGlzIGRv
ZXMKPiArICogbm90IGV2YWx1YXRlIHRvIHRydWUuCj4gKyAqCj4gKyAqIFRoaXMgYW5kIGV4cGVj
dGF0aW9ucyBvZiB0aGUgZm9ybSBgS1VOSVRfRVhQRUNUXypgIHdpbGwgY2F1c2UgdGhlIHRlc3Qg
Y2FzZQo+ICsgKiB0byBmYWlsIHdoZW4gdGhlIHNwZWNpZmllZCBjb25kaXRpb24gaXMgbm90IG1l
dDsgaG93ZXZlciwgaXQgd2lsbCBub3QgcHJldmVudAo+ICsgKiB0aGUgdGVzdCBjYXNlIGZyb20g
Y29udGludWluZyB0byBydW47IHRoaXMgaXMgb3RoZXJ3aXNlIGtub3duIGFzIGFuCj4gKyAqICpl
eHBlY3RhdGlvbiBmYWlsdXJlKi4KPiArICovCj4gKyNkZWZpbmUgS1VOSVRfRVhQRUNUX1RSVUUo
dGVzdCwgY29uZGl0aW9uKSBcCj4gKyAgICAgICAgICAgICAgIEtVTklUX1RSVUVfQVNTRVJUSU9O
KHRlc3QsIEtVTklUX0VYUEVDVEFUSU9OLCBjb25kaXRpb24pCgpBIGxvdCBvZiB0aGVzZSBtYWNy
b3Mgc2VlbSBkb3VibGUgaW5kZW50ZWQuCgo+ICsKPiArI2RlZmluZSBLVU5JVF9FWFBFQ1RfVFJV
RV9NU0codGVzdCwgY29uZGl0aW9uLCBmbXQsIC4uLikgICAgICAgICAgICAgICAgICAgICAgXAo+
ICsgICAgICAgICAgICAgICBLVU5JVF9UUlVFX01TR19BU1NFUlRJT04odGVzdCwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBLVU5JVF9FWFBFQ1RBVElPTiwgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmRpdGlvbiwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZm10LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjI19fVkFfQVJHU19fKQo+ICsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
