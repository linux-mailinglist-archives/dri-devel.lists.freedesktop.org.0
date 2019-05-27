Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16D2AF55
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B266C898AA;
	Mon, 27 May 2019 07:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072C898BF;
 Mon, 27 May 2019 07:22:18 +0000 (UTC)
Received: from localhost (unknown [84.241.203.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B26B216FD;
 Mon, 27 May 2019 07:22:17 +0000 (UTC)
Date: Mon, 27 May 2019 09:22:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nicolas Pitre <nicolas.pitre@linaro.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 Adam Borowski <kilobyte@angband.pl>, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 04/33] vt: More locking checks
Message-ID: <20190527072214.GB7997@kroah.com>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-5-daniel.vetter@ffwll.ch>
 <20190527070858.GJ21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527070858.GJ21222@phenom.ffwll.local>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558941738;
 bh=CxB+YRQgE6cg6pK9JoVm/avHUmPTbThAgAVMMNqahMQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Q1LE5GpeWeMfjI+hQTRVaCT6KkOhR4yTvtSxlGlomgJOpBdtnKVWXl/IoF5xSw+Xb
 lIYZ5Lhm2x1hJ5Fxz5OXkIluhD211azcL8pdZtwteQd5ZUl3NmbY56G5/UzV3ndz+Q
 D7a3oyLH+7yUgzfhkv2zHrBs0yJZif7v2zhgNbek=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDk6MDg6NThBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAxMDo1MzoyNUFNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gSSBob25lc3RseSBoYXZlIG5vIGlkZWEgd2hhdCB0aGUgc3VidGxl
IGRpZmZlcmVuY2VzIGJldHdlZW4KPiA+IGNvbl9pc192aXNpYmxlLCBjb25faXNfZmcgKGludGVy
bmFsIHRvIHZ0LmMpIGFuZCBjb25faXNfYm91bmQgYXJlLiBCdXQKPiA+IGl0IGxvb2tzIGxpa2Ug
Ym90aCB2Yy0+dmNfZGlzcGxheV9mZyBhbmQgY29uX2RyaXZlcl9tYXAgYXJlIHByb3RlY3RlZAo+
ID4gYnkgdGhlIGNvbnNvbGVfbG9jaywgc28gcHJvYmFibHkgYmV0dGVyIGlmIHdlIGhvbGQgdGhh
dCB3aGVuIGNoZWNraW5nCj4gPiB0aGlzLgo+ID4gCj4gPiBUbyBkbyB0aGF0IEkgaGFkIHRvIGRl
aW5saW5lIHRoZSBjb25faXNfdmlzaWJsZSBmdW5jdGlvbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBOaWNvbGFz
IFBpdHJlIDxuaWNvbGFzLnBpdHJlQGxpbmFyby5vcmc+Cj4gPiBDYzogTWFydGluIEhvc3RldHRs
ZXIgPHRleHRzaGVsbEB1Y2h1dWppbi5kZT4KPiA+IENjOiBBZGFtIEJvcm93c2tpIDxraWxvYnl0
ZUBhbmdiYW5kLnBsPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gPiBDYzogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQuY29tPgo+IAo+IEhp
IEdyZWcsCj4gCj4gRG8geW91IHdhbnQgdG8gbWVyZ2UgdGhpcyB0aHJvdWdoIHlvdXIgY29uc29s
ZSB0cmVlIG9yIGFjayBmb3IgbWVyZ2luZwo+IHRocm91Z2ggZHJtL2ZiZGV2PyBJdCdzIHBhcnQg
b2YgYSBiaWdnZXIgc2VyaWVzLCBhbmQgSSdkIGxpa2UgdG8gaGF2ZSBtb3JlCj4gdGVzdGluZyB3
aXRoIHRoaXMgaW4gb3VyIHRyZWVzLCBidXQgYWxzbyBvayB0byBtZXJnZSBzdGFuZC1hbG9uZSBp
ZiB5b3UKPiBwcmVmZXIgdGhhdC4gSXQncyBqdXN0IGxvY2tpbmcgY2hlY2tzIGFuZCBzb21lIGRv
Y3MuCj4gCj4gU2FtZSBmb3IgdGhlIHByZWNlZWRpbmcgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgaGVy
ZS4KCkZvciBhbGwgb2YgdGhlc2UsIHBsZWFzZSB0YWtlIHRoZW0gdGhyb3VnaCB5b3VyIHRyZWUo
cyk6CgpBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
