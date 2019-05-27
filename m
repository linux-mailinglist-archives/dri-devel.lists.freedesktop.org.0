Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AC22CD61
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E47E6E276;
	Tue, 28 May 2019 17:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC089898BC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 16:22:41 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 1/6] net: stmmac: sun8i: add support for Allwinner H6 EMAC
Date: Mon, 27 May 2019 18:22:32 +0200
Message-Id: <20190527162237.18495-2-megous@megous.com>
In-Reply-To: <20190527162237.18495-1-megous@megous.com>
References: <20190527162237.18495-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1558974159; bh=W1eysqnIHUZkksJlW6Nnyz1rUD5/k0fxV0/y2AwBQ70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jtRJyTN0mda0dMEzqcL/RsuQH3ecGfIJExMPybYmhP/91ewbQ8PMdd0t02M7thPNb
 GLx+i1A+NAnqwhvXQb8kcP73pcszhszejUdUlmzP1pa+CTgXFB7L4O3QLKLmKczsFa
 br6uJjWMkUjgR9ciFeZpdqhKN/3ii65yVduiLv/Y=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ondrej Jirman <megous@megous.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKVGhlIEVNQUMgb24gQWxsd2lu
bmVyIEg2IGlzIGp1c3QgbGlrZSB0aGUgb25lIG9uIEE2NC4gVGhlICJpbnRlcm5hbCBQSFkiIG9u
Ckg2IGlzIG9uIGEgY28tcGFja2FnZWQgQUMyMDAgY2hpcCwgYW5kIGl0J3Mgbm90IHJlYWxseSBp
bnRlcm5hbCAoaXQncwpjb25uZWN0ZWQgdmlhIFJNSUkgYXQgUEEgR1BJTyBiYW5rKS4KCkFkZCBz
dXBwb3J0IGZvciB0aGUgQWxsd2lubmVyIEg2IEVNQUMgaW4gdGhlIGR3bWFjLXN1bjhpIGRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KU2lnbmVk
LW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Ci0tLQogLi4uL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jICAgIHwgMTYgKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3VuOGkuYwppbmRleCBiYTEyNGE0ZGE3
OTMuLjMyNThkZWM4NGQ1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtc3VuOGkuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1zdW44aS5jCkBAIC0xNDcsNiArMTQ3LDIwIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZW1hY192YXJpYW50IGVtYWNfdmFyaWFudF9hNjQgPSB7CiAJLnR4X2RlbGF5X21heCA9
IDcsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGVtYWNfdmFyaWFudCBlbWFjX3ZhcmlhbnRf
aDYgPSB7CisJLmRlZmF1bHRfc3lzY29uX3ZhbHVlID0gMHg1MDAwMCwKKwkuc3lzY29uX2ZpZWxk
ID0gJnN1bjhpX3N5c2Nvbl9yZWdfZmllbGQsCisJLyogVGhlICJJbnRlcm5hbCBQSFkiIG9mIEg2
IGlzIG5vdCBvbiB0aGUgZGllLiBJdCdzIG9uIHRoZQorCSAqIGNvLXBhY2thZ2VkIEFDMjAwIGNo
aXAgaW5zdGVhZC4KKwkgKi8KKwkuc29jX2hhc19pbnRlcm5hbF9waHkgPSBmYWxzZSwKKwkuc3Vw
cG9ydF9taWkgPSB0cnVlLAorCS5zdXBwb3J0X3JtaWkgPSB0cnVlLAorCS5zdXBwb3J0X3JnbWlp
ID0gdHJ1ZSwKKwkucnhfZGVsYXlfbWF4ID0gMzEsCisJLnR4X2RlbGF5X21heCA9IDcsCit9Owor
CiAjZGVmaW5lIEVNQUNfQkFTSUNfQ1RMMCAweDAwCiAjZGVmaW5lIEVNQUNfQkFTSUNfQ1RMMSAw
eDA0CiAjZGVmaW5lIEVNQUNfSU5UX1NUQSAgICAweDA4CkBAIC0xMjEyLDYgKzEyMjYsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW44aV9kd21hY19tYXRjaFtdID0gewog
CQkuZGF0YSA9ICZlbWFjX3ZhcmlhbnRfcjQwIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5u
ZXIsc3VuNTBpLWE2NC1lbWFjIiwKIAkJLmRhdGEgPSAmZW1hY192YXJpYW50X2E2NCB9LAorCXsg
LmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1oNi1lbWFjIiwKKwkJLmRhdGEgPSAmZW1h
Y192YXJpYW50X2g2IH0sCiAJeyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3VuOGlf
ZHdtYWNfbWF0Y2gpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
