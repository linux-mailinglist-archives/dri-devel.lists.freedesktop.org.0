Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43823A7408
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 21:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E34895E7;
	Tue,  3 Sep 2019 19:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4A3897B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 19:51:33 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id h4so10411833oih.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 12:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KgYlgaCvmPzwNL4vIzZhgHzp4QTn4NW2XoH49Hc+J0E=;
 b=VQi41HWKXtIyMdmSaX1maiC0HmtBoB8ERkDDNjQGtvhiCPmqTHTrQmCOcMUg9DAVCo
 OuKOS16EcqDJGRkN9fv/szvnZZYuwEgvtaYjlZ+Tce1vQJBbE6IIVs/KRfgIMD6zIPLK
 /xAijrKm2izWlRxRctVsJab3dDUe3k4IPiCmldK1KvcawXMPj+2T0g7Wtks5sz22r/al
 x/T8GsHaIi/wwJoYkzKZXrHJbwGip3NF9Cyq9xdX4/6g/vdaS5t8HCWnSEyzN36sMtfl
 JW/BWlSEHEuMMQKoHssWDEgP5ocmldgXDrjaz0loYoN0YCaabUb1oN3Mng/OIX7LsRo0
 eg8w==
X-Gm-Message-State: APjAAAVEXR+hmGF5YD4KKejmiBjm6VEzBdLYJejY+2tiqhC++tu/jqDe
 rI2qd4fEpnTAvv4WaZIz6JPQZgVIgldbfm3DCHr21g==
X-Google-Smtp-Source: APXvYqxh4wg+YHA6xLKtnOFhR49pKMDfhYOGcLE/Dn9QIGHUsJcswnhJvqbrYcK86pW92y+nv/aMJLH7s0EET6/U1GI=
X-Received: by 2002:aca:5697:: with SMTP id k145mr692111oib.101.1567540292740; 
 Tue, 03 Sep 2019 12:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
In-Reply-To: <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Sep 2019 21:51:21 +0200
Message-ID: <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: Dave Hansen <dave.hansen@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KgYlgaCvmPzwNL4vIzZhgHzp4QTn4NW2XoH49Hc+J0E=;
 b=Jj6m40QehoTxStYkDvHkU2/J7qgY4tQcYojx4CsPnqNZejNYzY7O8UszxKYZrn0shO
 MagFaazYjBFbKduFEDCG/yTX7i0SAdQBJa1wUgADO2WoVGdruYa0AsnXhf7dUaQadomX
 QbhvahmtA43UsLmzMLau8jAAYhNxaA9enkJx8=
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA5OjM4IFBNIERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBp
bnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyB3aG9sZSB0aGluZyBsb29rcyBsaWtlIGEgZmFzY2lu
YXRpbmcgY29sbGVjdGlvbiBvZiBoYWNrcy4gOikKPgo+IHR0bSBpcyB0YWtpbmcgYSBzdGFjay1h
bGxsb2NhdGVkICJWTUEiIGFuZCBoYW5kaW5nIGl0IHRvIHZtZl9pbnNlcnRfKigpCj4gd2hpY2gg
b2J2aW91c2x5IGFyZSBleHBlY3RpbmcgInJlYWwiIFZNQXMgdGhhdCBhcmUgbGlua2VkIGludG8g
dGhlIG1tLgo+IEl0J3MgZXh0cmFjdGluZyBzb21lIHBncHJvdF90IGluZm9ybWF0aW9uIGZyb20g
dGhlIHJlYWwgVk1BLCBtYWtpbmcgYQo+IHBzdWVkby10ZW1wb3JhcnkgVk1BLCB0aGVuIHBhc3Np
bmcgdGhlIHRlbXBvcmFyeSBvbmUgYmFjayBpbnRvIHRoZQo+IGluc2VydGlvbiBmdW5jdGlvbnM6
Cj4KPiA+IHN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQg
KnZtZikKPiA+IHsKPiAuLi4KPiA+ICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0IGN2bWE7
Cj4gLi4uCj4gPiAgICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9NSVhFRE1B
UCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHZtZl9pbnNlcnRfbWl4ZWQoJmN2
bWEsIGFkZHJlc3MsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
X19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKSk7Cj4gPiAgICAgICAgICAgICAgICAgZWxzZQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gdm1mX2luc2VydF9wZm4oJmN2bWEsIGFk
ZHJlc3MsIHBmbik7Cj4KPiBJIGNhbiB0b3RhbGx5IHNlZSB3aHkgdGhpcyBuZWVkcyBuZXcgZXhw
b3J0cy4gIEJ1dCwgbWFuLCBpdCBkb2Vzbid0IHNlZW0KPiBsaWtlIHNvbWV0aGluZyB3ZSB3YW50
IHRvIGtlZXAgKmZlZWRpbmcqLgo+Cj4gVGhlIHJlYWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhl
IGVuY3J5cHRpb24gYml0cyBmcm9tIHRoZSBkZXZpY2UgVk1BJ3MKPiAidHJ1ZSIgdm1hLT52bV9w
YWdlX3Byb3QgZG9uJ3QgbWF0Y2ggdGhlIG9uZXMgdGhhdCBhY3R1YWxseSBnZXQKPiBpbnNlcnRl
ZCwgcHJvYmFibHkgYmVjYXVzZSB0aGUgZGV2aWNlIHB0ZXMgbmVlZCB0aGUgZW5jcnlwdGlvbiBi
aXRzCj4gY2xlYXJlZCBidXQgdGhlIHN5c3RlbSBtZW1vcnkgUFRFcyBuZWVkIHRoZW0gc2V0ICph
bmQqIHRoZXkncmUgbWl4ZWQKPiB1bmRlciBvbmUgVk1BLgo+Cj4gVGhlIHRoaW5nIHdlIG5lZWQg
dG8gc3RvcCBpcyBoYXZpbmcgbWl4ZWQgZW5jcnlwdGlvbiBydWxlcyB1bmRlciBvbmUgVk1BLgoK
VGhlIHBvaW50IGhlcmUgaXMgdGhhdCB3ZSB3YW50IHRoaXMuIFdlIG5lZWQgdG8gYmUgYWJsZSB0
byBtb3ZlIHRoZQpidWZmZXIgYmV0d2VlbiBkZXZpY2UgcHRlcyBhbmQgc3lzdGVtIG1lbW9yeSBw
dGVzLCB0cmFuc3BhcmVudGx5LApiZWhpbmQgdXNlcnNwYWNlIGJhY2ssIHdpdGhvdXQgcmFjZXMu
IEFuZCB0aGUgZmFzdCBwYXRoICh3aGljaCBpcyAibm8KcHRlIGV4aXN0cyBmb3IgdGhpcyB2bWEi
KSBtdXN0IGJlIHJlYWwgZmFzdCwgc28gdGFraW5nIG1tYXBfc2VtIGFuZApyZXBsYWNpbmcgdGhl
IHZtYSBpcyBuby1nby4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
