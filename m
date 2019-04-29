Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6E5DD26
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E33989216;
	Mon, 29 Apr 2019 07:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40C889216
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:52:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s15so14469886wra.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 00:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/mDQvnk0IIQmAZwrlmB/+Qs1VqQjgXmR4mQ6Zr5vLM=;
 b=Fi2ggQkzH0a6QBjykEMpavOWQ7g1+SeX8phRxle3qDeHEyepgxG3wNQLdKWP3YirnM
 tZb1cr1NAofO3hJP4RtZHxboHIEgoQ5Odr8iCxTrZS9V8ZgMe7ZQcJ5Wy+HGnL+WyfTN
 E4Rc3vwGMsa7SNzQ1qnCq95B+KH9vKZLW6sm01X1527Si1Yu3fYmlHIRdaYNNWy9B7NC
 VRaw0DE5bEhhXW71dP4IgsIU2g+9C7a9TWUGtN7zk4eMHHAOLYcq221owwUJzUoPFog6
 ZWP56ALNrYUeARph7j3f9X2McTW1PEO7zs4EvOLowibvH9FlG4LXCD9Hg4/gIJqRmM72
 /Wow==
X-Gm-Message-State: APjAAAVj5C2ecrOjdbExMXx7SCJQR/bjBRaiScUAjPKhEPRB+z2exi+W
 0+LGNt1kcOrEJhtfuA29G6Y3k5qHzNRkbw==
X-Google-Smtp-Source: APXvYqxK8h9fP1diY34GCvdYZ01wJZXC1DSL1FPL3mMAddWYdgRZE3NVRKvJYj+rs35MKDeUPkEHfA==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr7015881wrs.52.1556524369379;
 Mon, 29 Apr 2019 00:52:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x84sm40099073wmg.13.2019.04.29.00.52.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 29 Apr 2019 00:52:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: Add zpos immutable property to planes
Date: Mon, 29 Apr 2019 09:52:47 +0200
Message-Id: <20190429075247.7946-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/mDQvnk0IIQmAZwrlmB/+Qs1VqQjgXmR4mQ6Zr5vLM=;
 b=yQrh7BIMJoH3/0jqWWCbu4c5tIODo9kRVw4r/nYa/1whLzbcUc1wNYNh1Tp2htcv15
 N1OCNf+l5RfcKPlwwPFnMuFCNCFZEnBOZ/f49lmWKh+Q+SL4alibk2iIwd9mf1qnG8DH
 /FdnrIWiZMalpBQA95V51+ih2cs2YrnTuEQwcMQZjDQjTfqTfmrZ7iNPdu5s0l672Nlz
 r62AxhqskACBze3lX6TT5TsGeaO93NfHqDpLR7XSZvy6nyXr2TaWJROc5Y7+9Im6M4gU
 kE7azJ1NPScSgDQqUiv2w2KNaq3DAOS4hl4chBYZY5rtytIKxkP7I/YbJL4mV2Yi2l6z
 Nqhw==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGltbXV0YWJsZSB6cG9zIHByb3BlcnR5IHRvIHByaW1hcnkgYW5kIG92ZXJsYXkgcGxhbmVz
IHRvIHNwZWNpZnkKdGhlIGN1cnJlbnQgZml4ZWQgenBvcyBwb3NpdGlvbi4KCkZpeGVzOiBmOWEy
MzQ4MTk2ZDEgKCJkcm0vbWVzb246IFN1cHBvcnQgT3ZlcmxheSBwbGFuZSBmb3IgdmlkZW8gcmVu
ZGVyaW5nIikKU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGli
cmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9vdmVybGF5LmMgfCAzICsr
KwogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMgICB8IDMgKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9vdmVybGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fb3Zlcmxh
eS5jCmluZGV4IGJkYmY5MjVmZjNlOC4uZGNlYjNkZjVlNjUyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fb3ZlcmxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9vdmVybGF5LmMKQEAgLTU3OCw2ICs1NzgsOSBAQCBpbnQgbWVzb25fb3ZlcmxheV9j
cmVhdGUoc3RydWN0IG1lc29uX2RybSAqcHJpdikKIAogCWRybV9wbGFuZV9oZWxwZXJfYWRkKHBs
YW5lLCAmbWVzb25fb3ZlcmxheV9oZWxwZXJfZnVuY3MpOwogCisJLyogRm9yIG5vdywgVkQgT3Zl
cmxheSBwbGFuZSBpcyBhbHdheXMgb24gdGhlIGJhY2sgKi8KKwlkcm1fcGxhbmVfY3JlYXRlX3pw
b3NfaW1tdXRhYmxlX3Byb3BlcnR5KHBsYW5lLCAwKTsKKwogCXByaXYtPm92ZXJsYXlfcGxhbmUg
PSBwbGFuZTsKIAogCURSTV9ERUJVR19EUklWRVIoIlxuIik7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9wbGFuZS5jCmluZGV4IGI4ZjZiMDhhODlhNi4uMmY3ZjRkZmNlNDViIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fcGxhbmUuYwpAQCAtMzk5LDYgKzM5OSw5IEBAIGludCBtZXNvbl9wbGFuZV9j
cmVhdGUoc3RydWN0IG1lc29uX2RybSAqcHJpdikKIAogCWRybV9wbGFuZV9oZWxwZXJfYWRkKHBs
YW5lLCAmbWVzb25fcGxhbmVfaGVscGVyX2Z1bmNzKTsKIAorCS8qIEZvciBub3csIE9TRCBQcmlt
YXJ5IHBsYW5lIGlzIGFsd2F5cyBvbiB0aGUgZnJvbnQgKi8KKwlkcm1fcGxhbmVfY3JlYXRlX3pw
b3NfaW1tdXRhYmxlX3Byb3BlcnR5KHBsYW5lLCAxKTsKKwogCXByaXYtPnByaW1hcnlfcGxhbmUg
PSBwbGFuZTsKIAogCXJldHVybiAwOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
