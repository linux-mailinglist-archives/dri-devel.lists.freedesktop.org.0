Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703261299B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E0189890;
	Fri,  3 May 2019 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5EE89890
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:13:11 +0000 (UTC)
X-Originating-IP: 90.88.149.145
Received: from localhost.localdomain
 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr [90.88.149.145])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 60FCF20002;
 Fri,  3 May 2019 08:13:09 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/4] drm/vc4: Check for V3D before binner bo alloc
Date: Fri,  3 May 2019 10:12:40 +0200
Message-Id: <20190503081242.29039-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503081242.29039-1-paul.kocialkowski@bootlin.com>
References: <20190503081242.29039-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Eben Upton <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgdGhhdCB3ZSBoYXZlIGEgVjNEIGRldmljZSByZWdpc3RlcmVkIGJlZm9yZSBhdHRlbXB0
aW5nIHRvCmFsbG9jYXRlIGEgYmlubmVyIGJ1ZmZlciBvYmplY3QuCgpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfdjNkLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3YzZC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdjNkLmMKaW5kZXggN2M0OTAxMDZlMTg1Li5jMTZkYjQ2
NjVhZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3YzZC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X3YzZC5jCkBAIC0yNDEsNiArMjQxLDkgQEAgc3RhdGljIGlu
dCBiaW5fYm9fYWxsb2Moc3RydWN0IHZjNF9kZXYgKnZjNCkKIAlpbnQgcmV0ID0gMDsKIAlzdHJ1
Y3QgbGlzdF9oZWFkIGxpc3Q7CiAKKwlpZiAoIXYzZCkKKwkJcmV0dXJuIC1FTk9ERVY7CisKIAkv
KiBXZSBtYXkgbmVlZCB0byB0cnkgYWxsb2NhdGluZyBtb3JlIHRoYW4gb25jZSB0byBnZXQgYSBC
TwogCSAqIHRoYXQgZG9lc24ndCBjcm9zcyAyNTZNQi4gIFRyYWNrIHRoZSBvbmVzIHdlJ3ZlIGFs
bG9jYXRlZAogCSAqIHRoYXQgZmFpbGVkIHNvIGZhciwgc28gdGhhdCB3ZSBjYW4gZnJlZSB0aGVt
IHdoZW4gd2UndmUgZ290Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
