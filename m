Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D134E126
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567006E838;
	Fri, 21 Jun 2019 07:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2FE6E584
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:47:54 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v7 2/6] net: stmmac: sun8i: force select external PHY when no
 internal one
Date: Thu, 20 Jun 2019 15:47:44 +0200
Message-Id: <20190620134748.17866-3-megous@megous.com>
In-Reply-To: <20190620134748.17866-1-megous@megous.com>
References: <20190620134748.17866-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1561038472; bh=CpeGKpRuKloncF/g65AKCeqM65NRXz6kOmCHJcy8Psg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WXJyBUyteXF4c1tW5xFtBH1gbkU3i6JvDvqxTFs9FS1C+iujVemt9fEOau8A+iHRO
 BngFwCvbyRfpRSsAJAN/a+9aDMmrqn07Sj4jlKlemLpy1Xp/Ba+LefdoLZ6RxzpzQA
 6lOVrj2FXnKhaGsASGSEqcW0NCFHo2O3QHQRyfOY=
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

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKVGhlIFBIWSBzZWxlY3Rpb24g
Yml0IGFsc28gZXhpc3RzIG9uIFNvQ3Mgd2l0aG91dCBhbiBpbnRlcm5hbCBQSFk7IGlmIGl0J3MK
c2V0IHRvIDEgKGludGVybmFsIFBIWSwgZGVmYXVsdCB2YWx1ZSkgdGhlbiB0aGUgTUFDIHdpbGwg
bm90IG1ha2UgdXNlIG9mCmFueSBQSFkgb24gc3VjaCBTb0NzLgoKVGhpcyBwcm9ibGVtIGFwcGVh
cnMgd2hlbiBhZGFwdGluZyBmb3IgSDYsIHdoaWNoIGhhcyBubyByZWFsIGludGVybmFsIFBIWQoo
dGhlICJpbnRlcm5hbCBQSFkiIG9uIEg2IGlzIG5vdCBvbi1kaWUsIGJ1dCBvbiBhIGNvLXBhY2th
Z2VkIEFDMjAwIGNoaXAsCmNvbm5lY3RlZCB2aWEgUk1JSSBpbnRlcmZhY2UgYXQgR1BJTyBiYW5r
IEEpLgoKRm9yY2UgdGhlIFBIWSBzZWxlY3Rpb24gYml0IHRvIDAgd2hlbiB0aGUgU09DIGRvZXNu
J3QgaGF2ZSBhbiBpbnRlcm5hbCBQSFksCnRvIGFkZHJlc3MgdGhlIHByb2JsZW0gb2YgYSB3cm9u
ZyBkZWZhdWx0IHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBh
b3NjLmlvPgpTaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4K
LS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCmluZGV4IGMzZTk0MTA0
NDc0Zi4uNmQ1Y2JhNDA3NWViIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMKQEAgLTg5OCw2ICs4OTgsMTEgQEAgc3RhdGljIGludCBz
dW44aV9kd21hY19zZXRfc3lzY29uKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikKIAkJICogYWRk
cmVzcy4gTm8gbmVlZCB0byBtYXNrIGl0IGFnYWluLgogCQkgKi8KIAkJcmVnIHw9IDEgPDwgSDNf
RVBIWV9BRERSX1NISUZUOworCX0gZWxzZSB7CisJCS8qIEZvciBTb0NzIHdpdGhvdXQgaW50ZXJu
YWwgUEhZIHRoZSBQSFkgc2VsZWN0aW9uIGJpdCBzaG91bGQgYmUKKwkJICogc2V0IHRvIDAgKGV4
dGVybmFsIFBIWSkuCisJCSAqLworCQlyZWcgJj0gfkgzX0VQSFlfU0VMRUNUOwogCX0KIAogCWlm
ICghb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFsbHdpbm5lcix0eC1kZWxheS1wcyIsICZ2
YWwpKSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
