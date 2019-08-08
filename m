Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9285FB6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 12:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3156E48D;
	Thu,  8 Aug 2019 10:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A921D6E48D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 10:33:03 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DB142173E;
 Thu,  8 Aug 2019 10:33:00 +0000 (UTC)
Date: Thu, 8 Aug 2019 11:32:57 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190808103257.4tqpip7ty4gf7eqf@willie-the-truck>
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
 <20190807123807.GD54191@lakrids.cambridge.arm.com>
 <CAJs_Fx5xU2-dn3iOVqWTzAjpTaQ8BBNP_Gn_iMc-eJpOX+iXoQ@mail.gmail.com>
 <20190807164958.GA44765@lakrids.cambridge.arm.com>
 <20190808075827.GD30308@lst.de>
 <20190808102053.GA46901@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808102053.GA46901@lakrids.cambridge.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565260383;
 bh=FQ6+FsASdUdEGiZDnohQHtyEdIqjQg4sf53ogeYronU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i0cpkV6yxp9rMymSHvxjKf0jsHk3h+WHG95kn4WWQPwZZAhvUGd7+TO3nZ23eheGH
 A1Bc1VB+y4plVRkxLuTagWC3CwLI59ZuuyCt8w7z6tlpdftzRnlxyD9l5Azt8tFrEI
 fWGfWW3kB9p8pDXuOdw6q+Z0Q4YvrTZy9VrwpRPc=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6MjA6NTNBTSArMDEwMCwgTWFyayBSdXRsYW5kIHdy
b3RlOgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA5OjU4OjI3QU0gKzAyMDAsIENocmlzdG9w
aCBIZWxsd2lnIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6NDk6NTlQTSAr
MDEwMCwgTWFyayBSdXRsYW5kIHdyb3RlOgo+ID4gPiBGb3IgYXJtNjQsIHdlIGNhbiB0ZWFyIGRv
d24gcG9ydGlvbnMgb2YgdGhlIGxpbmVhciBtYXAsIGJ1dCB0aGF0IGhhcyB0bwo+ID4gPiBiZSBk
b25lIGV4cGxpY2l0bHksIGFuZCB0aGlzIGlzIG9ubHkgcG9zc2libGUgd2hlbiB1c2luZyByb2Rh
dGFfZnVsbC4gSWYKPiA+ID4gbm90IHVzaW5nIHJvZGF0YV9mdWxsLCBpdCBpcyBub3QgcG9zc2li
bGUgdG8gZHluYW1pY2FsbHkgdGVhciBkb3duIHRoZQo+ID4gPiBjYWNoZWFibGUgYWxpYXMuCj4g
PiAKPiA+IEludGVyZXN0aW5nLiAgRm9yIHRoaXMgb3IgbmV4dCBtZXJnZSB3aW5kb3cgSSBwbGFu
IHRvIGFkZCBzdXBwb3J0IHRvIHRoZQo+ID4gZ2VuZXJpYyBETUEgY29kZSB0byByZW1hcCBwYWdl
cyBhcyB1bmNhY2hhYmxlIGluIHBsYWNlIGJhc2VkIG9uIHRoZQo+ID4gb3BlbnJpc2MgY29kZS4g
IEHRlSBmYXIgYXMgSSBjYW4gdGVsbCB0aGUgcmVxdWlyZW1lbnQgZm9yIHRoYXQgaXMKPiA+IGJh
c2ljYWxseSBqdXN0IHRoYXQgdGhlIGtlcm5lbCBkaXJlY3QgbWFwcGluZyBkb2Vzbid0IHVzZSBQ
TUQgb3IgYmlnZ2VyCj4gPiBtYXBwaW5nIHNvIHRoYXQgaXQgc3VwcG9ydHMgY2hhbmdpbmcgcHJv
dGVjdGlvbiBiaXRzIG9uIGEgcGVyLVBURSBiYXNpcy4KPiA+IElzIHRoYXQgdGhlIGNhc2Ugd2l0
aCBhcm02NCArIHJvZGF0YV9mdWxsPwo+IAo+IFllcywgd2l0aCB0aGUgYWRkZWQgY2FzZSB0aGF0
IG9uIGFybTY0IHdlIGNhbiBhbHNvIGhhdmUgY29udGlndW91cwo+IGVudHJpZXMgYXQgdGhlIFBU
RSBsZXZlbCwgd2hpY2ggd2UgYWxzbyBoYXZlIHRvIGRpc2FibGUuCj4gCj4gT3VyIGtlcm5lbCBw
YWdlIHRhYmxlIGNyZWF0aW9uIGNvZGUgZG9lcyB0aGF0IGZvciByb2RhdGFfZnVsbCBvcgo+IERF
QlVHX1BBR0VBTExPQy4gU2VlIGFyY2gvYXJtNjQvbW11LmMsIGluIG1hcF9tZW0oKSwgd2hlcmUg
d2UgcGFzcwo+IE5PX3tCTE9DSyxDT05UfV9NQVBQSU5HUyBkb3duIHRvIG91ciBwYWdldGFibGUg
Y3JlYXRpb24gY29kZS4KCkZXSVcsIHdlIG1hZGUgcm9kYXRhX2Z1bGwgdGhlIGRlZmF1bHQgYSBj
b3VwbGUgb2YgcmVsZWFzZXMgYWdvLCBzbyBpZgpzb2x2aW5nIHRoZSBjYWNoZWFibGUgYWxpYXMg
Zm9yIG5vbi1jYWNoZWFibGUgRE1BIGJ1ZmZlcnMgcmVxdWlyZXMgdGhpcwp0byBiZSBwcmVzZW50
LCB0aGVuIHdlIGNvdWxkIHByb2JhYmx5IGp1c3QgcmVmdXNlIHRvIHByb2JlIG5vbi1jb2hlcmVu
dApETUEtY2FwYWJsZSBkZXZpY2VzIG9uIHN5c3RlbXMgd2hlcmUgcm9kYXRhX2Z1bGwgaGFzIGJl
ZW4gZGlzYWJsZWQuCgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
