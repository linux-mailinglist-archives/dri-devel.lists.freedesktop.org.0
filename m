Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D022D29EA7F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 12:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98A06E5BF;
	Thu, 29 Oct 2020 11:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD476E5BF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 11:29:50 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A086B2076E;
 Thu, 29 Oct 2020 11:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603970990;
 bh=MTjIkXr3NnrpMfTDAn9/ha1Br4t8KXcW4JAFcRvu3Ig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DV7fA6WBexJy/iN1X1aDDm4cJFQlw7gxjsVOgkmKUipGPBoxOA/PiYBRxhsz2exXQ
 fbQ7kPsunyU62GNInG9pNWRcQABqdZ+fBYdIJW9Ab/jaXVo172X7t60G3OKqyLufjt
 LUF7nw+B1uAXci128tghenvna7XpAobxM90UBxHY=
Date: Thu, 29 Oct 2020 12:30:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Message-ID: <20201029113040.GA3850079@kroah.com>
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
 <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
 <20201027062217.GE206502@kroah.com>
 <2DA9AE6D-93D6-4142-9FC4-EEACB92B7203@oracle.com>
 <20201029110326.GC3840801@kroah.com> <874kmdi8ua.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kmdi8ua.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDE6MTM6MDFQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVGh1LCAyOSBPY3QgMjAyMCwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MTI6NDlBTSAtMDcw
MCwgU2FlZWQgTWlyemFtb2hhbW1hZGkgd3JvdGU6Cj4gPj4gSGkgR3JlZywKPiA+PiAKPiA+PiBT
b3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gSeKAmW0gcmVxdWVzdGluZyBzdGFibGUgbWFpbnRhaW5l
cnMgdG8gY2hlcnJ5LXBpY2sgdGhpcyBwYXRjaCBpbnRvIHN0YWJsZSA1LjQgYW5kIDUuOC4KPiA+
PiBjb21taXQgY2MwNzA1N2M3Yzg4ZmI4ZWZmM2IxOTkxMTMxZGVkMGYwYmNmYTdlMwo+ID4+IEF1
dGhvcjogU2FlZWQgTWlyemFtb2hhbW1hZGkgPHNhZWVkLm1pcnphbW9oYW1tYWRpQG9yYWNsZS5j
b20+Cj4gPj4gRGF0ZTogICBXZWQgT2N0IDIxIDE2OjU3OjU4IDIwMjAgLTA3MDAKPiA+PiAKPiA+
PiAgICAgdmlkZW86IGZiZGV2OiBmaXggZGl2aWRlIGVycm9yIGluIGZiY29uX3N3aXRjaAo+ID4K
PiA+IEkgZG8gbm90IHNlZSB0aGF0IGNvbW1pdCBpbiBMaW51cydzIHRyZWUsIGRvIHlvdT8KPiAK
PiBJdCdzIGluIGRybS1taXNjLW5leHQsIElJVUMgaGVhZGluZyBmb3IgTGludXMnIHRyZWUgaW4g
dGhlIG5leHQgbWVyZ2UKPiB3aW5kb3cgaW4gNi04IHdlZWtzLiBXaGljaCBpcyB0byBzYXkgdGhp
cyBzaG91bGQgcHJvYmFibHkgaGF2ZSBiZWVuCj4gYXBwbGllZCB0byBkcm0tbWlzYy1maXhlcyBi
cmFuY2ggaGVhZGluZyBmb3IgdjUuMTAtcmNYLCB3aXRoIGEgQ2M6Cj4gc3RhYmxlIHRhZywgdG8g
YmVnaW4gd2l0aC4KCk9rLCBub3RoaW5nIEkgY2FuIGRvIHdpdGggdGhpcyBub3csIHBsZWFzZSBl
bWFpbCBzdGFibGVAdmdlci5rZXJuZWwub3JnCndoZW4gaXQgaGl0cyBMaW51cydzIHRyZWUgYW5k
IHdlIGNhbiB0YWtlIGl0IHRoZW4uCgpTYWVlZCwgcGxlYXNlIHJlYWQ6CiAgICBodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMu
aHRtbApmb3IgaG93IHRvIGRvIHRoaXMgcHJvcGVybHkuCgp0aGFua3MsCgpncmVnIGstaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
