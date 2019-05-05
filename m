Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF514527
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6A89289;
	Mon,  6 May 2019 07:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84A689202
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 13:04:27 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id E6AC33E956;
 Sun,  5 May 2019 13:04:26 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Subject: [PATCH RFC 1/6] drm/msm: fix null pointer dereference in
 msm_atomic_prepare_fb()
Date: Sun,  5 May 2019 09:04:08 -0400
Message-Id: <20190505130413.32253-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557061467;
 bh=IYRglZLmPUAWG3JXhJg/NhCUwxXVo+rWDdjly3A1S/Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cisTXGYJKhqlZDiZ7H58vZ3MF5wT2phT/dMC/JzrjrWxB4vZ9keVlfpNH8QbDKxLu
 0H8OCuZYuSLBVybeIjy4Oj2edU6EY5o0g+6tuOcVtfAUaBd25YBQXVTTnBVPWZ27gP
 yX6QQc899NidHFHpeH2R+dGs7TFpodOVtUNJb6Xw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

X21zbV9nZW1fbmV3KCkgY2FsbHMgbXNtX2dlbV9uZXdfaW1wbCgpIHdpdGggYSBOVUxMIHJlc2Vy
dmF0aW9uX29iamVjdApzdHJ1Y3QuIG1zbV9hdG9taWNfcHJlcGFyZV9mYigpIGFzc3VtZXMgdGhh
dCB0aGUgcmVzZXJ2YXRpb25fb2JqZWN0IGlzCmFsd2F5cyBzZXQsIGFuZCBhdHRlbXB0cyB0byBy
ZWZlcmVuY2UgYSBOVUxMIHBvaW50ZXIuIENvcnJlY3QgdGhpcyBieQpjaGVja2luZyB0byBzZWUg
aWYgdGhpcyB2YWx1ZSBpcyBOVUxMLgoKU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMg
fCA4ICsrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMKaW5kZXggZjViMTI1NmUzMmI2Li4wZGE4MGE5
Mzg3NmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jCkBAIC01NiwxMCArNTYsMTIgQEAgaW50
IG1zbV9hdG9taWNfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJcmV0dXJu
IDA7CiAKIAlvYmogPSBtc21fZnJhbWVidWZmZXJfYm8obmV3X3N0YXRlLT5mYiwgMCk7Ci0JbXNt
X29iaiA9IHRvX21zbV9ibyhvYmopOwotCWZlbmNlID0gcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9l
eGNsX3JjdShtc21fb2JqLT5yZXN2KTsKIAotCWRybV9hdG9taWNfc2V0X2ZlbmNlX2Zvcl9wbGFu
ZShuZXdfc3RhdGUsIGZlbmNlKTsKKwltc21fb2JqID0gdG9fbXNtX2JvKG9iaik7CisJaWYgKG1z
bV9vYmotPnJlc3YpIHsKKwkJZmVuY2UgPSByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2V4Y2xfcmN1
KG1zbV9vYmotPnJlc3YpOworCQlkcm1fYXRvbWljX3NldF9mZW5jZV9mb3JfcGxhbmUobmV3X3N0
YXRlLCBmZW5jZSk7CisJfQogCiAJcmV0dXJuIG1zbV9mcmFtZWJ1ZmZlcl9wcmVwYXJlKG5ld19z
dGF0ZS0+ZmIsIGttcy0+YXNwYWNlKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
