Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37527E5105
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 18:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084276EAE0;
	Fri, 25 Oct 2019 16:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC8E6EAE0;
 Fri, 25 Oct 2019 16:18:10 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD2C52070B;
 Fri, 25 Oct 2019 16:18:08 +0000 (UTC)
Date: Fri, 25 Oct 2019 17:18:05 +0100
From: Will Deacon <will@kernel.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/radeon: Handle workqueue allocation failure
Message-ID: <20191025161804.GA12335@willie-the-truck>
References: <20191025110450.10474-1-will@kernel.org>
 <5d6a88a2-2719-a859-04df-10b0d893ff39@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d6a88a2-2719-a859-04df-10b0d893ff39@daenzer.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572020290;
 bh=zsbdQvfJ8+q2pzusFNOjjDgO2fdiHgeruyB2BpqAhfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xZzvdjENaVD+2lcGJUR9ncW0e/IAWYPqJbGh8SjuU974cfTjPci7a1yS7CbMd1/wW
 OxngfQ0N1MCIciK9J5iEWHkLlUnuii6I/QMRQ73fJf4JWT0jxhWvyPNN+nna6rVeuQ
 S2hUAUno8hbubl5rLAD8IF9rI4t2+Ney4qYUA7Io=
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Waisman <nico@semmle.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDY6MDY6MjZQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0xMC0yNSAxOjA0IHAubS4sIFdpbGwgRGVhY29uIHdyb3RlOgo+ID4g
SW4gdGhlIGhpZ2hseSB1bmxpa2VseSBldmVudCB0aGF0IHdlIGZhaWwgdG8gYWxsb2NhdGUgdGhl
ICJyYWRlb24tY3J0YyIKPiA+IHdvcmtxdWV1ZSwgd2Ugc2hvdWxkIGJhaWwgY2xlYW5seSByYXRo
ZXIgdGhhbiBibGluZGx5IG1hcmNoIG9uIHdpdGggYQo+ID4gTlVMTCBwb2ludGVyIGluc3RhbGxl
ZCBmb3IgdGhlICdmbGlwX3F1ZXVlJyBmaWVsZCBvZiB0aGUgJ3JhZGVvbl9jcnRjJwo+ID4gc3Ry
dWN0dXJlLgo+ID4gCj4gPiBUaGlzIHdhcyByZXBvcnRlZCBwcmV2aW91c2x5IGJ5IE5pY29sYXMs
IGJ1dCBJIGRvbid0IHRoaW5rIGhpcyBmaXggd2FzCj4gPiBjb3JyZWN0Ogo+IAo+IE5laXRoZXIg
aXMgdGhpcyBvbmUgSSdtIGFmcmFpZC4gU2VlIG15IGZlZWRiYWNrIG9uCj4gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMzMTUzNC8gLgoKVGhhbmtzLiBBbHRob3VnaCBJ
IGFncmVlIHdpdGggeW91IHdydCB0aGUgb3JpZ2luYWwgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsKdGhl
IHdvcmtxdWV1ZSBhbGxvY2F0aW9uIGZhaWx1cmUgaXMgZGlzdGluZ3Vpc2hhYmxlIGZyb20gdGhl
IENSVEMgYWxsb2NhdGlvbgpmYWlsdXJlIHdpdGggbXkgcGF0Y2guIEFyZSB5b3Ugc2F5aW5nIHRo
YXQgdGhlIGVycm9yIHBhdGggdGhlcmUgaXMgYnJva2VuCnRvbz8KCldpbGwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
