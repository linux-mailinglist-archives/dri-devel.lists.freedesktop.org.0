Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5598320A44
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F6A896DD;
	Thu, 16 May 2019 14:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55FD8916B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:55:58 +0000 (UTC)
Received: from localhost.localdomain
 (aaubervilliers-681-1-43-46.w90-88.abo.wanadoo.fr [90.88.161.46])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0BEE320001D;
 Thu, 16 May 2019 14:55:55 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] drm/vc4: Check for the binner bo before handling OOM
 interrupt
Date: Thu, 16 May 2019 16:55:43 +0200
Message-Id: <20190516145544.29051-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
References: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
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
IDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgQW5ob2x0
IDxlcmljQGFuaG9sdC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaXJxLmMgfCAz
ICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaXJxLmMK
aW5kZXggZmZkMGE0Mzg4NzUyLi43MjNkYzg2YjQ1MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2lycS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2lycS5jCkBA
IC02NCw2ICs2NCw5IEBAIHZjNF9vdmVyZmxvd19tZW1fd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmspCiAJc3RydWN0IHZjNF9leGVjX2luZm8gKmV4ZWM7CiAJdW5zaWduZWQgbG9uZyBpcnFm
bGFnczsKIAorCWlmICghYm8pCisJCXJldHVybjsKKwogCWJpbl9ib19zbG90ID0gdmM0X3YzZF9n
ZXRfYmluX3Nsb3QodmM0KTsKIAlpZiAoYmluX2JvX3Nsb3QgPCAwKSB7CiAJCURSTV9FUlJPUigi
Q291bGRuJ3QgYWxsb2NhdGUgYmlubmVyIG92ZXJmbG93IG1lbVxuIik7Ci0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
