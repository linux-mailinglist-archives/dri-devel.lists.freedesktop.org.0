Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17626606
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF9489BBD;
	Wed, 22 May 2019 14:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F390E89227
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 23:50:14 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 2/6] net: stmmac: sun8i: force select external PHY when no
 internal one
Date: Tue, 21 May 2019 01:50:05 +0200
Message-Id: <20190520235009.16734-3-megous@megous.com>
In-Reply-To: <20190520235009.16734-1-megous@megous.com>
References: <20190520235009.16734-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1558396212; bh=lmN/vA2/QcSdUuzR1xKNkZ8E+T7fPttQ3k8QpH5igsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=icuRmovmqEiyTkx1kZjdynNoQSk4c78preJIjNGDecNXCTpka+1z9503Aodfx2L88
 6sOPPpp5L2sC2XXN6VuIHqWX1c97ZiYpULA+xILVHEybnqSj3gIIu2jnLkXhLVSlH5
 V6knXlNvxgV1UUKlgvFu1bsGDIuZjLwsN46MtJdw=
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
bm90IG1ha2UgdXNlIG9mCmFueSBQSFkgc3VjaCBTb0NzLgoKVGhpcyBwcm9ibGVtIGFwcGVhcnMg
d2hlbiBhZGFwdGluZyBmb3IgSDYsIHdoaWNoIGhhcyBubyByZWFsIGludGVybmFsIFBIWQoodGhl
ICJpbnRlcm5hbCBQSFkiIG9uIEg2IGlzIG5vdCBvbi1kaWUsIGJ1dCBvbiBhIGNvLXBhY2thZ2Vk
IEFDMjAwIGNoaXAsCmNvbm5lY3RlZCB2aWEgUk1JSSBpbnRlcmZhY2UgYXQgR1BJTyBiYW5rIEEp
LgoKRm9yY2UgdGhlIFBIWSBzZWxlY3Rpb24gYml0IHRvIDAgd2hlbiB0aGUgU09DIGRvZXNuJ3Qg
aGF2ZSBhbiBpbnRlcm5hbCBQSFksCnRvIGFkZHJlc3MgdGhlIHByb2JsZW0gb2YgYSB3cm9uZyBk
ZWZhdWx0IHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3Nj
LmlvPgpTaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KLS0t
CiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCmluZGV4IDMyNThkZWM4NGQ1
NS4uMDQ4NGMyODlmMzI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1zdW44aS5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLXN1bjhpLmMKQEAgLTkwNyw2ICs5MDcsMTEgQEAgc3RhdGljIGludCBzdW44
aV9kd21hY19zZXRfc3lzY29uKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikKIAkJICogYWRkcmVz
cy4gTm8gbmVlZCB0byBtYXNrIGl0IGFnYWluLgogCQkgKi8KIAkJcmVnIHw9IDEgPDwgSDNfRVBI
WV9BRERSX1NISUZUOworCX0gZWxzZSB7CisJCS8qIEZvciBTb0NzIHdpdGhvdXQgaW50ZXJuYWwg
UEhZIHRoZSBQSFkgc2VsZWN0aW9uIGJpdCBzaG91bGQgYmUKKwkJICogc2V0IHRvIDAgKGV4dGVy
bmFsIFBIWSkuCisJCSAqLworCQlyZWcgJj0gfkgzX0VQSFlfU0VMRUNUOwogCX0KIAogCWlmICgh
b2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFsbHdpbm5lcix0eC1kZWxheS1wcyIsICZ2YWwp
KSB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
