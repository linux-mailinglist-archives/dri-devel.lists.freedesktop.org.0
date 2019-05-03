Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695501299C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C308989E;
	Fri,  3 May 2019 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D573B8989E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:13:13 +0000 (UTC)
X-Originating-IP: 90.88.149.145
Received: from localhost.localdomain
 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr [90.88.149.145])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F0DE020013;
 Fri,  3 May 2019 08:13:10 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] drm/vc4: Check for the binner bo before handling OOM
 interrupt
Date: Fri,  3 May 2019 10:12:41 +0200
Message-Id: <20190503081242.29039-4-paul.kocialkowski@bootlin.com>
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

U2luY2UgdGhlIE9PTSBpbnRlcnJ1cHQgZGlyZWN0bHkgZGVhbHMgd2l0aCB0aGUgYmlubmVyIGJv
LCBpdCBkb2Vzbid0Cm1ha2Ugc2Vuc2UgdG8gdHJ5IGFuZCBoYW5kbGUgaXQgd2l0aG91dCBhIGJp
bm5lciBidWZmZXIgcmVnaXN0ZXJlZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tp
IDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9pcnEuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9pcnEuYwppbmRleCBmZmQwYTQzODg3NTIuLjcyM2RjODZiNDUxMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfaXJxLmMKQEAgLTY0LDYgKzY0LDkgQEAgdmM0X292ZXJmbG93X21lbV93b3JrKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykKIAlzdHJ1Y3QgdmM0X2V4ZWNfaW5mbyAqZXhlYzsKIAl1bnNp
Z25lZCBsb25nIGlycWZsYWdzOwogCisJaWYgKCFibykKKwkJcmV0dXJuOworCiAJYmluX2JvX3Ns
b3QgPSB2YzRfdjNkX2dldF9iaW5fc2xvdCh2YzQpOwogCWlmIChiaW5fYm9fc2xvdCA8IDApIHsK
IAkJRFJNX0VSUk9SKCJDb3VsZG4ndCBhbGxvY2F0ZSBiaW5uZXIgb3ZlcmZsb3cgbWVtXG4iKTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
