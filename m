Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74042C86
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 18:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4366896EB;
	Wed, 12 Jun 2019 16:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895BA896EB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:42:29 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56336)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hb6KL-0005lB-U5; Wed, 12 Jun 2019 17:42:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hb6KK-0000TT-2t; Wed, 12 Jun 2019 17:42:20 +0100
Date: Wed, 12 Jun 2019 17:42:19 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 04/13] drm/i2c: tda998x: derive CTS_N value from aclk
 sample rate ratio
Message-ID: <20190612164219.vkzprvfp4mesycct@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXI-0001y0-S5@rmk-PC.armlinux.org.uk>
 <CAGngYiWT5xsVgP4R=LPozpxFwdoCtpGSn76fwWEDiNXtYzBA9g@mail.gmail.com>
 <20190612162812.ovy6wu3fmck5mmp4@shell.armlinux.org.uk>
 <CAGngYiWiKUknxkMxyoKVDHk07EiPGdxVaOiXfTd3ieDow3roAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiWiKUknxkMxyoKVDHk07EiPGdxVaOiXfTd3ieDow3roAA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tKNJC0YeNech4w7705661U81N1/Jh0qczpaEdctdb7I=; b=FiKUiKRQMCJcGGYetcCfCVw06
 xv02tSnjDbb8jPl1xUca1PwPlfNeLbdy+qx4ndp1iC1cSVp9XENN+c171vtjuV9+OVEN/BDaumy/n
 p3QRCGNFvHsL3lMZ/keLcm3CrR+Tb7kpmZq7A7xcvKdx3gis+b9FFN+3eAcy7isn5iviHp3BFvhti
 T77dOjMRzHzcxIuAu94pz2rD8v/YEefhe2bA9vUstdw/ljfhc6L5PXJPoDqPLs2zO/8gXTnDFDyHO
 IuWiWl6HTsibDkNAWS0Q/W2LLTHoohSdieDaT08HyPHNHKbgpErqHYUrsk/Ko3QCgx1MjtC5+0av7
 /U+ln0GtQ==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6Mzc6NTdQTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6MjggUE0gUnVzc2VsbCBLaW5n
IC0gQVJNIExpbnV4IGFkbWluCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPgo+
ID4gVGhlIHBsYXRmb3JtIGRhdGEgcGF0aCBoYXMgbmV2ZXIgc3VwcG9ydGVkIHRoZSBIRE1JIGNv
ZGVjIHdheSBvZiBkb2luZwo+ID4gdGhpbmdzLCBzbyB0aGF0IHJlYWxseSBpc24ndCBhIGNvbmNl
cm4gaGVyZS4gIFRoZSBwbGF0Zm9ybSBkYXRhIHdheQo+ID4gd2FzIHN1ZmZpY2llbnQgdG8gYWxs
b3cgU1BESUYgc3RyZWFtcyB0byB3b3JrIHdpdGggYSBzdGF0aWMgc2V0dXAgb2YKPiA+IHRoZSBU
REE5OTh4LCBhbmQgaGFzIG5ldmVyIGJlZW4gaW50ZW5kZWQgdG8gc3VwcG9ydCBhbnl0aGluZyBi
ZXlvbmQKPiA+IHRoYXQuCj4gCj4gVGhhbmsgeW91LCBJIGFtIG5vdCB1c2luZyB0aGUgcGxhdGZv
cm0gZGF0YSBwYXRoLCBzbyBJIGhhZCBubyBpZGVhLgo+IAo+IFdvdWxkbid0IHRoZSBjdXJyZW50
IGNvZGUgYWx3YXlzIGZhaWwgb24gdGhlIHBsYXRmb3JtIGRhdGEgcGF0aCB0aG91Z2g/Cj4gCj4g
Y3JlYXRlKCkgY2FsbHMgdGRhOTk4eF9zZXRfY29uZmlnKCkgaW4gdGhlIHBsYXRmb3JtIGRhdGEg
Y2FzZS4KPiBJZiB0aGUgYXVkaW9fcGFyYW1zLmZvcm1hdCBpcyB1c2VkIChpLmUuIHRoZSBwbGF0
Zm9ybSBkYXRhIGNvbmZpZ3VyZXMKPiBhdWRpbyksIHRoZSBmdW5jdGlvbiB0aGVuIHJldHVybnMg
dGhlIHJldHVybiB2YWx1ZSBvZiB0ZGE5OTh4X2Rlcml2ZV9jdHNfbigpLAo+IHdoaWNoIGlzIGEg
cG9zaXRpdmUgZGl2aWRlciAoY2FuIGJlIDAgaWYgLzEpLgoKSSB0aGluayB5b3UncmUgY29uZnVz
aW5nIHRkYTk5OHhfZGVyaXZlX2N0c19uKCkgYW5kIHRkYTk5OHhfZ2V0X2FkaXYoKS4KdGRhOTk4
eF9kZXJpdmVfY3RzX24oKSBvbmx5IHJldHVybnMgMCBvciAtRUlOVkFMLgoKPiAKPiBUaGVuIGlu
IGNyZWF0ZSgpOiBpZiAocmV0KSBnb3RvIGZhaWw7Cj4gCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVt
OiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMgYnJv
YWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93
biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUw
MGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
