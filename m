Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED0D116C65
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 12:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DC66E40B;
	Mon,  9 Dec 2019 11:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D720F6E408;
 Mon,  9 Dec 2019 11:39:05 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id x195so6024191oix.4;
 Mon, 09 Dec 2019 03:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPM/hwSdd2dpR68KRDIRUCSfL+ZarPQKfGdIq8K3ckk=;
 b=W2DrXuMs1Wja/NsetbjmOTd96jyQgNXUoPlm9LvSjCuFTllYQJFVz+nYGKchiEmYZ1
 GgCgDGtmZnJXRxtWVaqgkLngC8YGqGIOzS9CBJSXLQQyXyJP6nUrMnJ5++TllItDaEsv
 BocnHiEwWrI3TO7LQTuJ8D+bCAZqmywz7U1kF1R4ASyEB12hFNwjjJUi70ybnEDUNzui
 IYINyEkRO2bd8s++wxBaXXb/Dho5m614raWyygM0i815q8/G9jtqm77OZGFvKRfSfb4O
 VGT2En+Rfstd+JTFjYJVSQ9FplLUDYX2O2yMflVRwYQokUP2BJqCcgG91FKQdD3+YCkT
 j7sw==
X-Gm-Message-State: APjAAAV89HU6yOHHWz98G3sUtjbiXWW3EiPX50Dgp0QvyGHkRaIghtpA
 Mqg3agKwS2Ka1z9FBD40niibCfjSpf3Q4g+D2pw=
X-Google-Smtp-Source: APXvYqzG8vwOM20aU3KzuzbhZ5+B1Tkp8z1UETWtoGf+LzRaBUX4n5P3Sb4ZJ2d9h2hcY0SF6eTRe0bkPN0OirKV+LE=
X-Received: by 2002:a05:6808:1c5:: with SMTP id
 x5mr17465882oic.57.1575891545016; 
 Mon, 09 Dec 2019 03:39:05 -0800 (PST)
MIME-Version: 1.0
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com>
 <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
 <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
In-Reply-To: <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 9 Dec 2019 12:38:53 +0100
Message-ID: <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Karol Herbst <kherbst@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMjoxNyBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBhbnlib2R5IGFueSBvdGhlciBpZGVhcz8KCk5vdCB5ZXQsIGJ1
dCBJJ20gdHJ5aW5nIHRvIGNvbGxlY3Qgc29tZSBtb3JlIGluZm9ybWF0aW9uLgoKPiBJdCBzZWVt
cyB0aGF0IGJvdGggcGF0Y2hlcyBkb24ndCByZWFsbHkgZml4Cj4gdGhlIGlzc3VlIGFuZCBJIGhh
dmUgbm8gaWRlYSBsZWZ0IG9uIG15IHNpZGUgdG8gdHJ5IG91dC4gVGhlIG9ubHkKPiB0aGluZyBs
ZWZ0IEkgY291bGQgZG8gdG8gZnVydGhlciBpbnZlc3RpZ2F0ZSB3b3VsZCBiZSB0byByZXZlcnNl
Cj4gZW5naW5lZXIgdGhlIE52aWRpYSBkcml2ZXIgYXMgdGhleSBzdXBwb3J0IHJ1bnBtIG9uIFR1
cmluZysgR1BVcyBub3csCj4gYnV0IEkndmUgaGVhcmQgdXNlcnMgaGF2aW5nIHNpbWlsYXIgaXNz
dWVzIHRvIHRoZSBvbmUgTHl1ZGUgdG9sZCB1cwo+IGFib3V0Li4uIGFuZCBJIGNvdWxkbid0IHZl
cmlmeSB0aGF0IHRoZSBwYXRjaGVzIGhlbHAgdGhlcmUgZWl0aGVyIGluIGEKPiByZWxpYWJsZSB3
YXkuCgpJdCBsb29rcyBsaWtlIHRoZSBuZXdlciAoOCspIHZlcnNpb25zIG9mIFdpbmRvd3MgZXhw
ZWN0IHRoZSBHUFUgZHJpdmVyCnRvIHByZXBhcmUgdGhlIEdQVSBmb3IgcG93ZXIgcmVtb3ZhbCBp
biBzb21lIHNwZWNpZmljIHdheSBhbmQgdGhlCmxhdHRlciBmYWlscyBpZiB0aGUgR1BVIGhhcyBu
b3QgYmVlbiBwcmVwYXJlZCBhcyBleHBlY3RlZC4KCkJlY2F1c2UgdGVzdGluZyBpbmRpY2F0ZXMg
dGhhdCB0aGUgV2luZG93cyA3IHBhdGggaW4gdGhlIHBsYXRmb3JtCmZpcm13YXJlIHdvcmtzLCBp
dCBtYXkgYmUgd29ydGggdHJ5aW5nIHRvIGRvIHdoYXQgaXQgZG9lcyB0byB0aGUgUENJZQpsaW5r
IGJlZm9yZSBpbnZva2luZyB0aGUgX09GRiBtZXRob2QgZm9yIHRoZSBwb3dlciByZXNvdXJjZQpj
b250cm9sbGluZyB0aGUgR1BVIHBvd2VyLgoKSWYgdGhlIE1pa2EncyB0aGVvcnkgdGhhdCB0aGUg
V2luNyBwYXRoIHNpbXBseSB0dXJucyB0aGUgUENJZSBsaW5rIG9mZgppcyBjb3JyZWN0LCB0aGVu
IHdoYXRldmVyIHRoZSBfT0ZGIG1ldGhvZCB0cmllcyB0byBkbyB0byB0aGUgbGluawphZnRlciB0
aGF0IHNob3VsZCBub3QgbWF0dGVyLgoKPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCA4OjU1IFBN
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgMjAx
OS0xMS0yNyBhdCAxMjo1MSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiBPbiBXZWQs
IE5vdiAyNywgMjAxOSBhdCAxMjo0OSBQTSBNaWthIFdlc3RlcmJlcmcKPiA+ID4gPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0
IDA2OjEwOjM2UE0gLTA1MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiA+ID4gPiBIZXktdGhpcyBp
cyBhbG1vc3QgY2VydGFpbmx5IG5vdCB0aGUgcmlnaHQgcGxhY2UgaW4gdGhpcyB0aHJlYWQgdG8K
PiA+ID4gPiA+IHJlc3BvbmQsCj4gPiA+ID4gPiBidXQgdGhpcyB0aHJlYWQgaGFzIGdvdHRlbiBz
byBkZWVwIGV2b2x1dGlvbiBjYW4ndCBwdXNoIHRoZSBzdWJqZWN0Cj4gPiA+ID4gPiBmdXJ0aGVy
IHRvCj4gPiA+ID4gPiB0aGUgcmlnaHQsIGhlaC4gU28gSSdsbCBqdXN0IHJlc3BvbmQgaGVyZS4K
PiA+ID4gPgo+ID4gPiA+IDopCj4gPiA+ID4KPiA+ID4gPiA+IEkndmUgYmVlbiBmb2xsb3dpbmcg
dGhpcyBhbmQgaGVscGluZyBvdXQgS2Fyb2wgd2l0aCB0ZXN0aW5nIGhlcmUgYW5kCj4gPiA+ID4g
PiB0aGVyZS4KPiA+ID4gPiA+IFRoZXkgaGFkIG1lIHRlc3QgQmpvcm4ncyBQQ0kgYnJhbmNoIG9u
IHRoZSBYMSBFeHRyZW1lIDJuZCBnZW5lcmF0aW9uLAo+ID4gPiA+ID4gd2hpY2gKPiA+ID4gPiA+
IGhhcyBhIHR1cmluZyBHUFUgYW5kIDgwODY6MTkwMSBQQ0kgYnJpZGdlLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEkgd2FzIGFib3V0IHRvIHNheSAidGhlIHBhdGNoIGZpeGVkIHRoaW5ncywgaG9vcmF5
ISIgYnV0IGl0IHNlZW1zIHRoYXQKPiA+ID4gPiA+IGFmdGVyCj4gPiA+ID4gPiB0cnlpbmcgcnVu
dGltZSBzdXNwZW5kL3Jlc3VtZSBhIGNvdXBsZSB0aW1lcyB0aGluZ3MgZmFsbCBhcGFydCBhZ2Fp
bjoKPiA+ID4gPgo+ID4gPiA+IFlvdSBtZWFuICRzdWJqZWN0IHBhdGNoLCBubz8KPiA+ID4gPgo+
ID4gPgo+ID4gPiBubywgSSB0b2xkIEx5dWRlIHRvIHRlc3QgdGhlIHBjaS9wbSBicmFuY2ggYXMg
dGhlIHJ1bnBtIGVycm9ycyB3ZSBzYXcKPiA+ID4gb24gdGhhdCBtYWNoaW5lIGxvb2tlZCBkaWZm
ZXJlbnQuIFNvbWUgQkFSIGVycm9yIHRoZSBHUFUgcmVwb3J0ZWQKPiA+ID4gYWZ0ZXIgaXQgZ290
IHJlc3VtZWQsIHNvIEkgd2FzIHdvbmRlcmluZyBpZiB0aGUgZGVsYXlzIHdlcmUgaGVscGluZwo+
ID4gPiB3aXRoIHRoYXQuIEJ1dCBhZnRlciBzb21lIGN5Y2xlcyBpdCBzdGlsbCBjYXVzZWQgdGhl
IHNhbWUgaXNzdWUsIHRoYXQKPiA+ID4gdGhlIEdQVSBkaXNhcHBlYXJlZC4gTGF0ZXIgdGVzdGlu
ZyBhbHNvIHNob3dlZCB0aGF0IG15IHBhdGNoIGFsc28KPiA+ID4gZGlkbid0IHNlZW0gdG8gaGVs
cCB3aXRoIHRoaXMgZXJyb3Igc2FkbHkgOi8KPiA+ID4KPiA+ID4gPiA+IFsgIDY4Ni44ODMyNDdd
IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IHN1c3BlbmRpbmcgb2JqZWN0IHRyZWUuLi4KPiA+
ID4gPiA+IFsgIDc1Mi44NjY0ODRdIEFDUEkgRXJyb3I6IEFib3J0aW5nIG1ldGhvZCBcX1NCLlBD
STAuUEVHMC5QRUdQLk5WUE8gZHVlCj4gPiA+ID4gPiB0byBwcmV2aW91cyBlcnJvciAoQUVfQU1M
X0xPT1BfVElNRU9VVCkgKDIwMTkwODE2L3BzcGFyc2UtNTI5KQo+ID4gPiA+ID4gWyAgNzUyLjg2
NjUwOF0gQUNQSSBFcnJvcjogQWJvcnRpbmcgbWV0aG9kIFxfU0IuUENJMC5QR09OIGR1ZSB0bwo+
ID4gPiA+ID4gcHJldmlvdXMgZXJyb3IgKEFFX0FNTF9MT09QX1RJTUVPVVQpICgyMDE5MDgxNi9w
c3BhcnNlLTUyOSkKPiA+ID4gPiA+IFsgIDc1Mi44NjY1MjFdIEFDUEkgRXJyb3I6IEFib3J0aW5n
IG1ldGhvZCBcX1NCLlBDSTAuUEVHMC5QRzAwLl9PTiBkdWUKPiA+ID4gPiA+IHRvIHByZXZpb3Vz
IGVycm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAoMjAxOTA4MTYvcHNwYXJzZS01MjkpCj4gPiA+
ID4KPiA+ID4gPiBUaGlzIGlzIHByb2JhYmx5IHRoZSBjdWxwcml0LiBUaGUgc2FtZSBBTUwgY29k
ZSBmYWlscyB0byBwcm9wZXJseSB0dXJuCj4gPiA+ID4gb24gdGhlIGRldmljZS4KPiA+ID4gPgo+
ID4gPiA+IElzIGFjcGlkdW1wIGZyb20gdGhpcyBzeXN0ZW0gYXZhaWxhYmxlIHNvbWV3aGVyZT8K
PiA+Cj4gPiBBdHRhY2hlZCBpdCB0byB0aGlzIGVtYWlsCj4gPgo+ID4gPiA+Cj4gPiAtLQo+ID4g
Q2hlZXJzLAo+ID4gICAgICAgICBMeXVkZSBQYXVsCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
