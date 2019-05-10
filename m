Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40619935
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 09:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702CB89BC2;
	Fri, 10 May 2019 07:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEE289BB3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 07:52:00 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id 9so489914itf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 00:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bb+vyJ2l2JyKWoFlPq1nHRAbP2mdN5kXUD5ewhMbnn8=;
 b=Mg9W63untaV6lR/blH6DbnxSR5Hqquk4w6+f55kQUwLcwhZ3okK9nly0+Mm38ZskJZ
 vmU3dlOYYbdr6WvC6y8x2idnD3Kfn7LDNkTOX5+Gf4bej6VkaFmT9mNtPi04utkkZihn
 NQRqAJHiAIinyIAX1vT9FUJz/9u7vC5y5ZgT4dsG+XQVoA08GMTsiKsv1EIcw7UHICny
 5NFybwicQaULh4MxrqmUwHreb+tZ0hyhoaWI/YIUUiVzoYzpPUqKm82A9S8H0F8sfMdj
 Mi+TfZBmur/wHtVZRDWJW5/yFdi3pF4h7yvYAgPMhdrplbd+WlNRF1JYmdKzfQo3LYde
 6MCQ==
X-Gm-Message-State: APjAAAWeRj4b+45sjX8ObM1TI0XcYygzLnuF+j6rm4xBceG7CUZRyRUM
 +iDIvbJMEqwJBo8qDqsWQ9ewmzDq2KluSpwyQ3PrRg==
X-Google-Smtp-Source: APXvYqzQcVYeTWjHA1GWGzWT8t1uQvHdWafbFrs+4Z6lMpSEOoB6AeGNhvySvnNsjv4Ja2SRnIzC+n5UdJycZzPB+WQ=
X-Received: by 2002:a24:7897:: with SMTP id p145mr6524450itc.117.1557474719408; 
 Fri, 10 May 2019 00:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
 <20190509200633.19678-1-daniel.vetter@ffwll.ch>
 <20190510055053.GA9864@jagdpanzerIV>
In-Reply-To: <20190510055053.GA9864@jagdpanzerIV>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 10 May 2019 09:51:48 +0200
Message-ID: <CAKMK7uG2mLg=FDb_4oiXLY7y85WOrCoe4+VrXScuLD0bRuvBNA@mail.gmail.com>
Subject: Re: [PATCH] kernel/locking/semaphore: use wake_q in up()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bb+vyJ2l2JyKWoFlPq1nHRAbP2mdN5kXUD5ewhMbnn8=;
 b=ZbMxX3MKqmdfjEtLjPb6AIYZUKmckX5fhBu1Np3jWVfzdBwLml/8MtAA98LAuk5eVa
 CO+jAczip8dABiK05qRCe/BFFNNLq4gqQmZOelR55RYGn2zHNl/v2THzyk/G585xF1E5
 uGHwq5WIOtP7mmksLzUClSUXAAFQ9FYNn7dCI=
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgNzo1MCBBTSBTZXJnZXkgU2Vub3poYXRza3kKPHNlcmdl
eS5zZW5vemhhdHNreS53b3JrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAoMDUvMDkvMTkgMjI6
MDYpLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFsuLl0KPiA+ICsvKiBGdW5jdGlvbnMgZm9yIHRo
ZSBjb250ZW5kZWQgY2FzZSAqLwo+ID4gKwo+ID4gK3N0cnVjdCBzZW1hcGhvcmVfd2FpdGVyIHsK
PiA+ICsgICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKPiA+ICsgICAgIHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzazsKPiA+ICsgICAgIGJvb2wgdXA7Cj4gPiArfTsKPiA+ICsKPiA+ICAvKioKPiA+
ICAgKiB1cCAtIHJlbGVhc2UgdGhlIHNlbWFwaG9yZQo+ID4gICAqIEBzZW06IHRoZSBzZW1hcGhv
cmUgdG8gcmVsZWFzZQo+ID4gQEAgLTE3OSwyNCArMTg3LDI1IEBAIEVYUE9SVF9TWU1CT0woZG93
bl90aW1lb3V0KTsKPiA+ICB2b2lkIHVwKHN0cnVjdCBzZW1hcGhvcmUgKnNlbSkKPiA+ICB7Cj4g
PiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gKyAgICAgc3RydWN0IHNlbWFwaG9yZV93
YWl0ZXIgKndhaXRlcjsKPiA+ICsgICAgIERFRklORV9XQUtFX1Eod2FrZV9xKTsKPiA+Cj4gPiAg
ICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJnNlbS0+bG9jaywgZmxhZ3MpOwo+ID4gLSAgICAg
aWYgKGxpa2VseShsaXN0X2VtcHR5KCZzZW0tPndhaXRfbGlzdCkpKQo+ID4gKyAgICAgaWYgKGxp
a2VseShsaXN0X2VtcHR5KCZzZW0tPndhaXRfbGlzdCkpKSB7Cj4gPiAgICAgICAgICAgICAgIHNl
bS0+Y291bnQrKzsKPiA+IC0gICAgIGVsc2UKPiA+IC0gICAgICAgICAgICAgX191cChzZW0pOwo+
ID4gKyAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgd2FpdGVyID0gIGxpc3RfZmlyc3Rf
ZW50cnkoJnNlbS0+d2FpdF9saXN0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qgc2VtYXBob3JlX3dhaXRlciwgbGlzdCk7Cj4gPiArICAgICAgICAg
ICAgIGxpc3RfZGVsKCZ3YWl0ZXItPmxpc3QpOwo+ID4gKyAgICAgICAgICAgICB3YWl0ZXItPnVw
ID0gdHJ1ZTsKPiA+ICsgICAgICAgICAgICAgd2FrZV9xX2FkZCgmd2FrZV9xLCB3YWl0ZXItPnRh
c2spOwo+ID4gKyAgICAgfQo+ID4gICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNl
bS0+bG9jaywgZmxhZ3MpOwo+Cj4gU28gdGhlIG5ldyBjb2RlIHN0aWxsIGNhbiBwcmludGsvV0FS
TiB1bmRlciBzZW0tPmxvY2sgaW4gc29tZSBidWdneQo+IGNhc2VzLgo+Cj4gRS5nLgo+ICAgICAg
ICAgd2FrZV9xX2FkZCgpCj4gICAgICAgICAgZ2V0X3Rhc2tfc3RydWN0KCkKPiAgICAgICAgICAg
cmVmY291bnRfaW5jX2NoZWNrZWQoKQo+ICAgICAgICAgICAgV0FSTl9PTkNFKCkKPgo+IEFyZSB3
ZSBmaW5lIHdpdGggdGhhdD8KCkhtIG5vdCBncmVhdC4gSXQncyBub3QgYXMgYmFkIGFzIHRoZSBv
bmUgSSdtIHRyeWluZyB0byBmaXggKG9yIG5vdCB0aGUKc2FtZSBhdCBsZWFzdCksIGJlY2F1c2Ug
d2l0aCB0aGUgd2FrZSB1cCBjaGFpbiB3ZSBoYXZlIGEgZmV3IGxvY2tzIGluCnRoZXJlLiBXaGlj
aCBhbGxvd3MgbG9ja2RlcCB0byBjb25uZWN0IHRoZSBsb29wIGFuZCBjb21wbGFpbiwgZXZlbgp3
aGVuIHdlIG5ldmVyIGFjdHVhbGx5IGhpdCB0aGF0IHNwZWNpZmljIHJlY3Vyc2lvbi4gSS5lLiBv
bmNlIGhpdHRpbmcKYSBXQVJOX09OIGZyb20gdHJ5X3RvX3dha2VfdXAgaXMgZW5vdWdoLCBwbHVz
IGEgdG90YWxseSBzZXBhcmF0ZQpjYWxsY2hhaW4gY2FuIHRoZW4gY2xvc2UgdGhlIHNlbWFwaG9y
ZS5sb2NrLT5zY2hlZHVsZXIgbG9ja3MgcGFydC4KWW91ciBjaGFpbiBvbmx5IGdvZXMgYm9vbSBp
ZiBpdCBoYXBwZW5zIGZyb20gdGhlIGNvbnNvbGVfbG9jaydzIHVwLgoKd2FrZV9xX2FkZF9zYWZl
IHdvdWxkIGJlIGFuIG9wdGlvbiwgYnV0IHRoZW4gd2Ugc29tZWhvdyBuZWVkIHRvCmFycmFuZ2Ug
Zm9yIGRvd24gdG8gY2FsbCBnZXRfdGFza19zdHJ1Y3QoY3VycmVudCkgYW5kIHJlbGVhc2luZyB0
aGF0LApidXQgb25seSBpZiB0aGVyZSdzIG5vIHdha2VyIHdobyBuZWVkcyB0aGF0IHRhc2sgcmVm
LiBTb3VuZHMgdHJpY2t5Ci4uLiBBbHNvIG5vdCBzdXJlIHdlIHdhbnQgdG8gc3R1ZmYgdGhhdCB0
cmlja2VyeSBpbnRvIHRoZSBnZW5lcmljCnNlbWFwaG9yZSBjb2RlLgotRGFuaWVsCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
