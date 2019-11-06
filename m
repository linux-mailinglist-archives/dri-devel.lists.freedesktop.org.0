Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9083F1BF1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F826E277;
	Wed,  6 Nov 2019 17:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B42D6E277
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:01:09 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXs8PvtBNfIQ=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id e07688vA6H14hLu
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 6 Nov 2019 18:01:04 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/7] drm/mcde: dsi: Delay start of video stream generator
Date: Wed,  6 Nov 2019 17:58:32 +0100
Message-Id: <20191106165835.2863-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106165835.2863-1-stephan@gerhold.net>
References: <20191106165835.2863-1-stephan@gerhold.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573059668; 
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=TU8xWeq3Fq2kfoIu2yX7EJClpaSQfLxdKJkoXF7JaIQ=;
 b=pyMOfJPYoU+oB9gSN57jQK09wpZ632KRh1qsA7YFz6u2j4xYIbCNuiptAlkxpBSILU
 gdW5RoooG0i18Vx0rFSIpIHZci9KUwninov2fFrRH3yP21kSjQDzCcIc8aUcTqwkW45X
 qWUL0wnKCkAfqfKin15pwi+fcHyvTbM71rflpnXDbKP4BF0+zc5gEO1lUZXksi9mL1Jh
 F4LsR5szBZgTlWRngbE2kyOqNaxWkzHPDeHV9UKKT0Sv8DVM4QxicMr4w2qqcOVczm5g
 rn5kWZBPIY3Au2o/qoKRjwKqmWcvweLMH32SZIgbHXN8mul0WqJl5NwB6U+UNAIdg9Wz
 nSZQ==
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGluaXRpYWxpemF0aW9uIG9yZGVyIGZvciBEU0kgdmlkZW8gbW9kZSBpcyBpbXBvcnRhbnQg
LSBpZiB3ZQplbmFibGUgdGhlIHZpZGVvIHN0cmVhbSBnZW5lcmF0b3IgKFZTRykgYmVmb3JlIHRo
ZSBNQ0RFIERTSSBmb3JtYXR0ZXIKc3RhcnRzIHNlbmRpbmcgcGl4ZWwgZGF0YSwgaXQgd2lsbCBp
bW1lZGlhdGVseSBydW4gaW50byBhbiBlcnJvciBhbmQKZGlzYWJsZSBpdHNlbGYgYWdhaW4uCgpB
dm9pZCB0aGlzIHByb2JsZW0gYnkgZGVsYXlpbmcgdGhlIGFjdGl2YXRpb24gb2YgdGhlIFZTRwp1
bnRpbCB0aGUgTUNERSBEU0kgZm9ybWF0dGVyIGlzIHByb3Blcmx5IHNldCB1cCBhbmQgcnVubmlu
ZwooaS5lLiB3aGVuIG1jZGVfZHNpX2JyaWRnZV9lbmFibGUoKSBpcyBjYWxsZWQpLgoKU2lnbmVk
LW9mZi1ieTogU3RlcGhhbiBHZXJob2xkIDxzdGVwaGFuQGdlcmhvbGQubmV0PgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMgfCAxMyArKysrKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rz
aS5jCmluZGV4IGM3OTU2YzkyYjUxYi4uNDcxMGYyM2IyOTY2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVf
ZHNpLmMKQEAgLTU4MywxMSArNTgzLDYgQEAgc3RhdGljIHZvaWQgbWNkZV9kc2lfc2V0dXBfdmlk
ZW9fbW9kZShzdHJ1Y3QgbWNkZV9kc2kgKmQsCiAJdmFsIHw9IERTSV9WSURfTU9ERV9TVFNfQ1RM
X0VSUl9NSVNTSU5HX1ZTWU5DOwogCXZhbCB8PSBEU0lfVklEX01PREVfU1RTX0NUTF9FUlJfTUlT
U0lOR19EQVRBOwogCXdyaXRlbCh2YWwsIGQtPnJlZ3MgKyBEU0lfVklEX01PREVfU1RTX0NUTCk7
Ci0KLQkvKiBFbmFibGUgdmlkZW8gbW9kZSAqLwotCXZhbCA9IHJlYWRsKGQtPnJlZ3MgKyBEU0lf
TUNUTF9NQUlOX0RBVEFfQ1RMKTsKLQl2YWwgfD0gRFNJX01DVExfTUFJTl9EQVRBX0NUTF9WSURf
RU47Ci0Jd3JpdGVsKHZhbCwgZC0+cmVncyArIERTSV9NQ1RMX01BSU5fREFUQV9DVEwpOwogfQog
CiBzdGF0aWMgdm9pZCBtY2RlX2RzaV9zdGFydChzdHJ1Y3QgbWNkZV9kc2kgKmQpCkBAIC02OTks
NiArNjk0LDE0IEBAIHN0YXRpYyB2b2lkIG1jZGVfZHNpX3N0YXJ0KHN0cnVjdCBtY2RlX2RzaSAq
ZCkKIHN0YXRpYyB2b2lkIG1jZGVfZHNpX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSkKIHsKIAlzdHJ1Y3QgbWNkZV9kc2kgKmQgPSBicmlkZ2VfdG9fbWNkZV9kc2koYnJp
ZGdlKTsKKwl1MzIgdmFsOworCisJaWYgKGQtPm1kc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9N
T0RFX1ZJREVPKSB7CisJCS8qIEVuYWJsZSB2aWRlbyBtb2RlICovCisJCXZhbCA9IHJlYWRsKGQt
PnJlZ3MgKyBEU0lfTUNUTF9NQUlOX0RBVEFfQ1RMKTsKKwkJdmFsIHw9IERTSV9NQ1RMX01BSU5f
REFUQV9DVExfVklEX0VOOworCQl3cml0ZWwodmFsLCBkLT5yZWdzICsgRFNJX01DVExfTUFJTl9E
QVRBX0NUTCk7CisJfQogCiAJZGV2X2luZm8oZC0+ZGV2LCAiZW5hYmxlIERTSSBtYXN0ZXJcbiIp
OwogfTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
