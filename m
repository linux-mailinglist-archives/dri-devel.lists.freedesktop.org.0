Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D13A5CA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F1388F93;
	Sun,  9 Jun 2019 12:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Sat, 08 Jun 2019 11:02:00 UTC
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBD8589218
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 11:02:00 +0000 (UTC)
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
 by pokefinder.org (Postfix) with ESMTPSA id EA0153E43B9;
 Sat,  8 Jun 2019 12:56:41 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 02/34] gpu: drm: bridge: sii9234: simplify getting the adapter
 of a client
Date: Sat,  8 Jun 2019 12:55:41 +0200
Message-Id: <20190608105619.593-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSBhIGRlZGljYXRlZCBwb2ludGVyIGZvciB0aGF0LCBzbyB1c2UgaXQuIE11Y2ggZWFz
aWVyIHRvIHJlYWQgYW5kCmxlc3MgY29tcHV0YXRpb24gaW52b2x2ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgotLS0KClBs
ZWFzZSBhcHBseSB0byB5b3VyIHN1YnN5c3RlbSB0cmVlLgoKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTIzNC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIz
NC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKaW5kZXggYjM2YmJhZmIwZTQz
Li4yNWQ0YWQ4YzdhZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIz
NC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCkBAIC04MTUsNyArODE1
LDcgQEAgc3RhdGljIGlycXJldHVybl90IHNpaTkyMzRfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lk
ICpkYXRhKQogc3RhdGljIGludCBzaWk5MjM0X2luaXRfcmVzb3VyY2VzKHN0cnVjdCBzaWk5MjM0
ICpjdHgsCiAJCQkJICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogewotCXN0cnVjdCBpMmNf
YWRhcHRlciAqYWRhcHRlciA9IHRvX2kyY19hZGFwdGVyKGNsaWVudC0+ZGV2LnBhcmVudCk7CisJ
c3RydWN0IGkyY19hZGFwdGVyICphZGFwdGVyID0gY2xpZW50LT5hZGFwdGVyOwogCWludCByZXQ7
CiAKIAlpZiAoIWN0eC0+ZGV2LT5vZl9ub2RlKSB7CkBAIC04OTcsNyArODk3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHNpaTkyMzRfYnJpZGdlX2Z1bmNzID0gewog
c3RhdGljIGludCBzaWk5MjM0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJCQkg
Y29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQogewotCXN0cnVjdCBpMmNfYWRhcHRlciAq
YWRhcHRlciA9IHRvX2kyY19hZGFwdGVyKGNsaWVudC0+ZGV2LnBhcmVudCk7CisJc3RydWN0IGky
Y19hZGFwdGVyICphZGFwdGVyID0gY2xpZW50LT5hZGFwdGVyOwogCXN0cnVjdCBzaWk5MjM0ICpj
dHg7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2OwogCWludCByZXQ7Ci0tIAoy
LjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
