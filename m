Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67C1E8E7
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4307D8957D;
	Wed, 15 May 2019 07:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs27.siol.net [185.57.226.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4DA8929B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 1FCCB521E15;
 Tue, 14 May 2019 22:43:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id P6TEBCYv139H; Tue, 14 May 2019 22:43:47 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 7A8BB521E08;
 Tue, 14 May 2019 22:43:47 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id AEE1E521E34;
 Tue, 14 May 2019 22:43:44 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Subject: [PATCH 1/2] drm/sun4i: Fix sun8i HDMI PHY clock initialization
Date: Tue, 14 May 2019 22:43:36 +0200
Message-Id: <20190514204337.11068-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514204337.11068-1-jernej.skrabec@siol.net>
References: <20190514204337.11068-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudCBjb2RlIGluaXRpYWxpemVzIEhETUkgUEhZIGNsb2NrIGRyaXZlciBiZWZvcmUgcmVz
ZXQgbGluZSBpcwpkZWFzc2VydGVkIGFuZCBjbG9ja3MgZW5hYmxlZC4gQmVjYXVzZSBvZiB0aGF0
LCBpbml0aWFsIHJlYWRvdXQgb2YKY2xvY2sgZGl2aWRlciBpcyBpbmNvcnJlY3QgKDAgaW5zdGVh
ZCBvZiAyKS4gVGhpcyBjYXVzZXMgYW55IGNsb2NrCnJhdGUgd2l0aCBkaXZpZGVyIDEgKHJlZ2lz
dGVyIHZhbHVlIDApIHRvIGJlIHNldCBpbmNvcnJlY3RseS4KCkZpeCB0aGlzIGJ5IG1vdmluZyBp
bml0aWFsaXphdGlvbiBvZiBIRE1JIFBIWSBjbG9jayBkcml2ZXIgYWZ0ZXIgcmVzZXQKbGluZSBp
cyBkZWFzc2VydGVkIGFuZCBjbG9ja3MgZW5hYmxlZC4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnICMgNC4xNysKRml4ZXM6IDRmODZlODE3NDhmZSAoImRybS9zdW40aTogQWRkIHN1cHBvcnQg
Zm9yIEgzIEhETUkgUEhZIHZhcmlhbnQiKQpTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8
amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhp
X2hkbWlfcGh5LmMgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX2hkbWlfcGh5LmMKaW5kZXggNjZlYTNhOTAyZTM2Li5hZmM2ZDRhOWMyMGIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeS5jCkBAIC02NzIsMjIgKzY3MiwxMyBAQCBp
bnQgc3VuOGlfaGRtaV9waHlfcHJvYmUoc3RydWN0IHN1bjhpX2R3X2hkbWkgKmhkbWksIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSkKIAkJCQlnb3RvIGVycl9wdXRfY2xrX3BsbDA7CiAJCQl9CiAJ
CX0KLQotCQlyZXQgPSBzdW44aV9waHlfY2xrX2NyZWF0ZShwaHksIGRldiwKLQkJCQkJICAgcGh5
LT52YXJpYW50LT5oYXNfc2Vjb25kX3BsbCk7Ci0JCWlmIChyZXQpIHsKLQkJCWRldl9lcnIoZGV2
LCAiQ291bGRuJ3QgY3JlYXRlIHRoZSBQSFkgY2xvY2tcbiIpOwotCQkJZ290byBlcnJfcHV0X2Ns
a19wbGwxOwotCQl9Ci0KLQkJY2xrX3ByZXBhcmVfZW5hYmxlKHBoeS0+Y2xrX3BoeSk7CiAJfQog
CiAJcGh5LT5yc3RfcGh5ID0gb2ZfcmVzZXRfY29udHJvbF9nZXRfc2hhcmVkKG5vZGUsICJwaHki
KTsKIAlpZiAoSVNfRVJSKHBoeS0+cnN0X3BoeSkpIHsKIAkJZGV2X2VycihkZXYsICJDb3VsZCBu
b3QgZ2V0IHBoeSByZXNldCBjb250cm9sXG4iKTsKIAkJcmV0ID0gUFRSX0VSUihwaHktPnJzdF9w
aHkpOwotCQlnb3RvIGVycl9kaXNhYmxlX2Nsa19waHk7CisJCWdvdG8gZXJyX3B1dF9jbGtfcGxs
MTsKIAl9CiAKIAlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHBoeS0+cnN0X3BoeSk7CkBA
IC03MDgsMTggKzY5OSwyOSBAQCBpbnQgc3VuOGlfaGRtaV9waHlfcHJvYmUoc3RydWN0IHN1bjhp
X2R3X2hkbWkgKmhkbWksIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKIAkJZ290byBlcnJfZGlz
YWJsZV9jbGtfYnVzOwogCX0KIAorCWlmIChwaHktPnZhcmlhbnQtPmhhc19waHlfY2xrKSB7CisJ
CXJldCA9IHN1bjhpX3BoeV9jbGtfY3JlYXRlKHBoeSwgZGV2LAorCQkJCQkgICBwaHktPnZhcmlh
bnQtPmhhc19zZWNvbmRfcGxsKTsKKwkJaWYgKHJldCkgeworCQkJZGV2X2VycihkZXYsICJDb3Vs
ZG4ndCBjcmVhdGUgdGhlIFBIWSBjbG9ja1xuIik7CisJCQlnb3RvIGVycl9kaXNhYmxlX2Nsa19t
b2Q7CisJCX0KKworCQljbGtfcHJlcGFyZV9lbmFibGUocGh5LT5jbGtfcGh5KTsKKwl9CisKIAlo
ZG1pLT5waHkgPSBwaHk7CiAKIAlyZXR1cm4gMDsKIAorZXJyX2Rpc2FibGVfY2xrX21vZDoKKwlj
bGtfZGlzYWJsZV91bnByZXBhcmUocGh5LT5jbGtfbW9kKTsKIGVycl9kaXNhYmxlX2Nsa19idXM6
CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBoeS0+Y2xrX2J1cyk7CiBlcnJfZGVhc3NlcnRfcnN0
X3BoeToKIAlyZXNldF9jb250cm9sX2Fzc2VydChwaHktPnJzdF9waHkpOwogZXJyX3B1dF9yc3Rf
cGh5OgogCXJlc2V0X2NvbnRyb2xfcHV0KHBoeS0+cnN0X3BoeSk7Ci1lcnJfZGlzYWJsZV9jbGtf
cGh5OgotCWNsa19kaXNhYmxlX3VucHJlcGFyZShwaHktPmNsa19waHkpOwogZXJyX3B1dF9jbGtf
cGxsMToKIAljbGtfcHV0KHBoeS0+Y2xrX3BsbDEpOwogZXJyX3B1dF9jbGtfcGxsMDoKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
