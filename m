Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D716263E9F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9166E26C;
	Thu, 10 Sep 2020 07:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE806ECA2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 18:58:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BmrrQ1Khcz1rsMj;
 Wed,  9 Sep 2020 20:58:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BmrrQ0BX8z1qtYL;
 Wed,  9 Sep 2020 20:58:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2F7AGEfP-Mrw; Wed,  9 Sep 2020 20:58:12 +0200 (CEST)
X-Auth-Info: ZLqCzL4pY/kwc/bMcrfLGQI2HYQx6LTyAfMIIaz251Y=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  9 Sep 2020 20:58:12 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] [RFC] drm/stm: Prefer faster display pixel clock over slower
 ones
Date: Wed,  9 Sep 2020 20:58:02 +0200
Message-Id: <20200909185802.106844-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: Marek Vasut <marex@denx.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIGRlbHRhIGJldHdlZW4gcmVxdWVzdGVkIHBpeGVsY2xvY2sgYW5kIHJlc3VsdGluZyBw
aXhlbGNsb2NrCmlzIGxhcmdlciB0aGFuIHRoZSBkZWx0YSBiZXR3ZWVuIHJlcXVlc3RlZCBwaXhl
bGNsb2NrIGFuZCB0aGUgbmV4dApzdGVwIGluIGF2YWlsYWJsZSBwaXhlbGNsb2NrIChsaW1pdGVk
IHRvIDEwJSBvZiBwaXhlbGNsb2NrIHRvIGF2b2lkCnRvbyBtdWNoIG91dC1vZi1zcGVjaWZpY2F0
aW9uIG9wZXJhdGlvbiksIHVzZSB0aGUgZmFzdGVyIHBpeGVsY2xvY2suCgpUaGlzIGZpeGVzIHRo
ZSBjb25kaXRpb24gd2hlcmUgdGhlIHJlc3VsdGluZyBwaXhlbGNsb2NrIGlzIG11Y2gKc2xvd2Vy
IHRoYW4gdGhlIGxvd2VzdCBjbG9jayByYXRlIHN1cHBvcnRlZCBieSB0aGUgZGlzcGxheSwgd2hp
bGUKdGhlIG5leHQgYXZhaWxhYmxlIHBpeGVsY2xvY2sgYXJlIGp1c3Qgc2xpZ2h0bHkgZmFzdGVy
IHRoYW4gdGhlCmhpZ2hlc3QgY2xvY2sgcmF0ZSBzdXBwb3J0ZWQgYnkgdGhlIGRpc3BsYXkuIFVz
aW5nIHRoZSBsb3dlciBjbG9jawpyYXRlIGxlYWRzIGUuZy4gdG8gc3VidGxlIGFydGlmYWN0cyBi
YXJlbHkgdmlzaWJsZSBvbiB0aGUgZGlzcGxheSwKbGlrZSBmbGlja2VyaW5nIHBpeGVscy4gVXNp
bmcgc2xpZ2h0bHkgZmFzdGVyIGNsb2NrIGxlYWRzIHRvIG5vCnN1Y2ggZWZmZWN0LgoKU2lnbmVk
LW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CkNjOiBBbGV4YW5kcmUgVG9yZ3Vl
IDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20+CkNjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgpDYzog
VmluY2VudCBBYnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQ2M6IFlhbm5pY2sgRmVydHLD
qSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCi0tLQogZHJpdmVycy9ncHUvZHJtL3N0
bS9sdGRjLmMgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKaW5kZXggNmUyOGY3MDcwOTJmLi4wN2M3MzA3OTI5M2Mg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5jCkBAIC01MDcsNiArNTA3LDI1IEBAIHN0YXRpYyBib29sIGx0ZGNfY3J0
Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIHsKIAlzdHJ1Y3QgbHRkY19kZXZp
Y2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7CiAJaW50IHJhdGUgPSBtb2RlLT5jbG9jayAq
IDEwMDA7CisJaW50IHJhdGVfbWluID0gY2xrX3JvdW5kX3JhdGUobGRldi0+cGl4ZWxfY2xrLCBy
YXRlKTsKKwlpbnQgcmF0ZV9tYXggPSBjbGtfcm91bmRfcmF0ZShsZGV2LT5waXhlbF9jbGssIHJh
dGUgKyAocmF0ZSAvIDEwKSk7CisKKwkvKgorCSAqIElmIHRoZSBkZWx0YSBiZXR3ZWVuIHJlcXVl
c3RlZCBwaXhlbGNsb2NrIGFuZCByZXN1bHRpbmcgcGl4ZWxjbG9jaworCSAqIGlzIGxhcmdlciB0
aGFuIHRoZSBkZWx0YSBiZXR3ZWVuIHJlcXVlc3RlZCBwaXhlbGNsb2NrIGFuZCB0aGUgbmV4dAor
CSAqIHN0ZXAgaW4gYXZhaWxhYmxlIHBpeGVsY2xvY2sgKGxpbWl0ZWQgdG8gMTAlIG9mIHBpeGVs
Y2xvY2sgdG8gYXZvaWQKKwkgKiB0b28gbXVjaCBvdXQtb2Ytc3BlY2lmaWNhdGlvbiBvcGVyYXRp
b24pLCB1c2UgdGhlIGZhc3RlciBwaXhlbGNsb2NrLgorCSAqCisJICogVGhpcyBmaXhlcyB0aGUg
Y29uZGl0aW9uIHdoZXJlIHRoZSByZXN1bHRpbmcgcGl4ZWxjbG9jayBpcyBtdWNoCisJICogc2xv
d2VyIHRoYW4gdGhlIGxvd2VzdCBjbG9jayByYXRlIHN1cHBvcnRlZCBieSB0aGUgZGlzcGxheSwg
d2hpbGUKKwkgKiB0aGUgbmV4dCBhdmFpbGFibGUgcGl4ZWxjbG9jayBhcmUganVzdCBzbGlnaHRs
eSBmYXN0ZXIgdGhhbiB0aGUKKwkgKiBoaWdoZXN0IGNsb2NrIHJhdGUgc3VwcG9ydGVkIGJ5IHRo
ZSBkaXNwbGF5LiBVc2luZyB0aGUgbG93ZXIgY2xvY2sKKwkgKiByYXRlIGxlYWRzIGUuZy4gdG8g
c3VidGxlIGFydGlmYWN0cyBiYXJlbHkgdmlzaWJsZSBvbiB0aGUgZGlzcGxheSwKKwkgKiBsaWtl
IGZsaWNrZXJpbmcgcGl4ZWxzLiBVc2luZyBzbGlnaHRseSBmYXN0ZXIgY2xvY2sgbGVhZHMgdG8g
bm8KKwkgKiBzdWNoIGVmZmVjdC4KKwkgKi8KKwlpZiAocmF0ZSAtIHJhdGVfbWluID4gcmF0ZV9t
YXggLSByYXRlKQorCQlyYXRlID0gcmF0ZV9tYXg7CiAKIAlpZiAoY2xrX3NldF9yYXRlKGxkZXYt
PnBpeGVsX2NsaywgcmF0ZSkgPCAwKSB7CiAJCURSTV9FUlJPUigiQ2Fubm90IHNldCByYXRlICgl
ZEh6KSBmb3IgcGl4ZWwgY2xrXG4iLCByYXRlKTsKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
