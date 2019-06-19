Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B84B2D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5FD6E2D6;
	Wed, 19 Jun 2019 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDE56E299
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:55 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x15so9034921pfq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLH0lqvZF2YW47kF82c+4eI137sw7vALgNnez8nJtAo=;
 b=OyTeqNBkAdKXqlTef6xHrS8/gDUjAR+TPjCqoEmv8BS7i2UfqQAXRx1froLkFN+e8M
 YSVR9fiU4u24L9FtOdKou4BBJ4De7jAdLC8dAiU5dV4KKP0M81x8WIkIHnZ/rROOQysG
 W0zcncGR4o/yCdzt7ZO6oje+GjI4FweYivHMcq3GJl9HOTUfnpglTTJ5ywrSh6B8jdhs
 RDfUh4508527IpdLazKAptzY7D8hYlhk4FUPW74RflyFgcLINTPhs1Ihdq3eej1jigpE
 WWSriicRVqHzejGCbWnbDCg+gSXpTTAkgBQ3pUaxnDQQfH25P/4Kig72G+/xQSUv7T03
 4C8Q==
X-Gm-Message-State: APjAAAX35qSJ7JQK1O44xcUfE8nHH8R2urGE/9S6YQNs7LqkRyYfQDtH
 pWSnBHkyeJfH8Way0EkCZ+m3K6f8hss=
X-Google-Smtp-Source: APXvYqwEo/5VnxgZr65e8cL5i0qkfqYPmZ0/fI74F+U4KjS3UH+04Mf40Dg1QxYprFHJRxYt5LoSrg==
X-Received: by 2002:a63:145f:: with SMTP id 31mr6055673pgu.320.1560922074652; 
 Tue, 18 Jun 2019 22:27:54 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:53 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 15/15] drm/bridge: tc358767: Add support for address-only
 I2C transfers
Date: Tue, 18 Jun 2019 22:27:16 -0700
Message-Id: <20190619052716.16831-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLH0lqvZF2YW47kF82c+4eI137sw7vALgNnez8nJtAo=;
 b=qEmVluxmK/18OQ+++SpHWnGDCghiUyUaW14rwQjiPOLI5J4BeYe4D1gCQuG5NyvqXN
 qwCRgux/LCIMpoAp+VNhY01o8kStEkjtw0OW1JelbTj++ZKv8Lwuo4Q1LkcJYyp2WoWt
 gODUNatTlmb/Kqe9OYCrQN6s3EGk4DpGHx//kS5fXN8kIOiSZr316AUv+c0NC+1s8enS
 Ud7+1sYqow2wwTvUKaNbSE1AJzsBv33ET0g3lmPh7oiLEDy0kmb6hEsyvRf4pxvgsisO
 26a/8KSibKbxMimvGU7lNlS1/p4uaGZnk47necXS2AU+9c286QVCZHtHT25yIOjTROPR
 j1pA==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJhbnNmZXIgc2l6ZSBvZiB6ZXJvIG1lYW5zIGEgcmVxdWVzdCB0byBkbyBhbiBhZGRyZXNzLW9u
bHkKdHJhbnNmZXIuIFNpbmNlIHRoZSBIVyBzdXBwb3J0IHRoaXMsIHdlIHByb2JhYmx5IHNob3Vs
ZG4ndCBiZSBqdXN0Cmlnbm9yaW5nIHN1Y2ggcmVxdWVzdHMuIFdoaWxlIGF0IGl0IGFsbG93IERQ
X0FVWF9JMkNfTU9UIGZsYWcgdG8gcGFzcwp0aHJvdWdoLCBzaW5jZSBpdCBpcyBzdXBwb3J0ZWQg
YnkgdGhlIEhXIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3
LnNtaXJub3ZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBM
YXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcmV5IEd1c2Frb3Yg
PGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJv
PgpDYzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzogTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90YzM1ODc2Ny5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwppbmRleCAzZjhhMTUzOTA4MTMuLjdiOGUxOWQ2Y2YyOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTQ1LDYgKzE0NSw4IEBACiAKIC8qIEFVWCBjaGFu
bmVsICovCiAjZGVmaW5lIERQMF9BVVhDRkcwCQkweDA2NjAKKyNkZWZpbmUgRFAwX0FVWENGRzBf
QlNJWkUJR0VOTUFTSygxMSwgOCkKKyNkZWZpbmUgRFAwX0FVWENGRzBfQUREUl9PTkxZCUJJVCg0
KQogI2RlZmluZSBEUDBfQVVYQ0ZHMQkJMHgwNjY0CiAjZGVmaW5lIEFVWF9SWF9GSUxURVJfRU4J
CUJJVCgxNikKIApAQCAtMzI2LDYgKzMyOCwxOCBAQCBzdGF0aWMgaW50IHRjX2F1eF9yZWFkX2Rh
dGEoc3RydWN0IHRjX2RhdGEgKnRjLCB2b2lkICpkYXRhLCBzaXplX3Qgc2l6ZSkKIAlyZXR1cm4g
c2l6ZTsKIH0KIAorc3RhdGljIHUzMiB0Y19hdXhjZmcwKHN0cnVjdCBkcm1fZHBfYXV4X21zZyAq
bXNnLCBzaXplX3Qgc2l6ZSkKK3sKKwl1MzIgYXV4Y2ZnMCA9IG1zZy0+cmVxdWVzdDsKKworCWlm
IChzaXplKQorCQlhdXhjZmcwIHw9IEZJRUxEX1BSRVAoRFAwX0FVWENGRzBfQlNJWkUsIHNpemUg
LSAxKTsKKwllbHNlCisJCWF1eGNmZzAgfD0gRFAwX0FVWENGRzBfQUREUl9PTkxZOworCisJcmV0
dXJuIGF1eGNmZzA7Cit9CisKIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LAogCQkJICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKQog
ewpAQCAtMzM1LDkgKzM0OSw2IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1
Y3QgZHJtX2RwX2F1eCAqYXV4LAogCXUzMiBhdXhzdGF0dXM7CiAJaW50IHJldDsKIAotCWlmIChz
aXplID09IDApCi0JCXJldHVybiAwOwotCiAJcmV0ID0gdGNfYXV4X3dhaXRfYnVzeSh0Yyk7CiAJ
aWYgKHJldCkKIAkJcmV0dXJuIHJldDsKQEAgLTM0OCw5ICszNTksMTEgQEAgc3RhdGljIHNzaXpl
X3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJCWJyZWFrOwogCWNh
c2UgRFBfQVVYX05BVElWRV9XUklURToKIAljYXNlIERQX0FVWF9JMkNfV1JJVEU6Ci0JCXJldCA9
IHRjX2F1eF93cml0ZV9kYXRhKHRjLCBtc2ctPmJ1ZmZlciwgc2l6ZSk7Ci0JCWlmIChyZXQgPCAw
KQotCQkJcmV0dXJuIHJldDsKKwkJaWYgKHNpemUpIHsKKwkJCXJldCA9IHRjX2F1eF93cml0ZV9k
YXRhKHRjLCBtc2ctPmJ1ZmZlciwgc2l6ZSk7CisJCQlpZiAocmV0IDwgMCkKKwkJCQlyZXR1cm4g
cmV0OworCQl9CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMzYx
LDggKzM3NCw3IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2Rw
X2F1eCAqYXV4LAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAJLyogU3RhcnQgdHJhbnNmZXIg
Ki8KLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX0FVWENGRzAsCi0JCQkgICAo
KHNpemUgLSAxKSA8PCA4KSB8IHJlcXVlc3QpOworCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVn
bWFwLCBEUDBfQVVYQ0ZHMCwgdGNfYXV4Y2ZnMChtc2csIHNpemUpKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCkBAIC0zNzYsMTQgKzM4OCwyMiBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhf
dHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAogCWlmIChhdXhzdGF0dXMgJiBBVVhf
VElNRU9VVCkKIAkJcmV0dXJuIC1FVElNRURPVVQ7Ci0KLQlzaXplID0gRklFTERfR0VUKEFVWF9C
WVRFUywgYXV4c3RhdHVzKTsKKwkvKgorCSAqIEZvciBzb21lIHJlYXNvbiBhZGRyZXNzLW9ubHkg
RFBfQVVYX0kyQ19XUklURSAoTU9UKSwgc3RpbGwKKwkgKiByZXBvcnRzIDEgYnl0ZSB0cmFuc2Zl
cnJlZCBpbiBpdHMgc3RhdHVzLiBUbyBkZWFsIHdlIHRoYXQKKwkgKiB3ZSBpZ25vcmUgYXV4X2J5
dGVzIGZpZWxkIGlmIHdlIGtub3cgdGhhdCB0aGlzIHdhcyBhbgorCSAqIGFkZHJlc3Mtb25seSB0
cmFuc2ZlcgorCSAqLworCWlmIChzaXplKQorCQlzaXplID0gRklFTERfR0VUKEFVWF9CWVRFUywg
YXV4c3RhdHVzKTsKIAltc2ctPnJlcGx5ID0gRklFTERfR0VUKEFVWF9TVEFUVVMsIGF1eHN0YXR1
cyk7CiAKIAlzd2l0Y2ggKHJlcXVlc3QpIHsKIAljYXNlIERQX0FVWF9OQVRJVkVfUkVBRDoKIAlj
YXNlIERQX0FVWF9JMkNfUkVBRDoKLQkJcmV0dXJuIHRjX2F1eF9yZWFkX2RhdGEodGMsIG1zZy0+
YnVmZmVyLCBzaXplKTsKKwkJaWYgKHNpemUpCisJCQlyZXR1cm4gdGNfYXV4X3JlYWRfZGF0YSh0
YywgbXNnLT5idWZmZXIsIHNpemUpOworCQlicmVhazsKIAl9CiAKIAlyZXR1cm4gc2l6ZTsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
