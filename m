Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C74B2B7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77556E2C2;
	Wed, 19 Jun 2019 07:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0886E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:42 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id v11so8971219pgl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/oBLQcGnx/gnzbBsvs2luhfWdsPZ44ykpse07/04ZU=;
 b=YapfUpGfpMGMf/t02af0p5J9F1g+eXxacT7j/VDAW5WU8afAje+fiR4GRnJ1D9DjNh
 wiDYEtq2Q3c8tVEni7QYS6ZoH1NjDZTBGNEABGkSFi0lRtqrtDff+F4NBhG6kNjTnygx
 g7/llCW+RvjVgQIkt+4VeNlvBCSeQT0XEyj3/6ZHuNKvHvRLyUdScNW1RjiGF2s7oCOV
 wof9iJYLiWDfcxyxS0GzVyO8GfU6Lq0wS2KiXfIHvqvrjvzm1/F7R6YunEBZBih4iQ6k
 COp17TO/FTWyQdwzfvq/ZmAc8p1ycRbwoQYb2BCZyu2nstYREtlv0la+Z/Hnxd6LZ2Hp
 iliw==
X-Gm-Message-State: APjAAAV82SVS0aAcQRQ8k9LmCu4EGVSSnlWNyNUryu7uYfYswzFdVHbP
 5YPczMP+5YRftJzCAgSed+RzrUuPl7c=
X-Google-Smtp-Source: APXvYqxub1BG9Akb060K5f4TgwG8lFmIUJcYVAdYfPH1LO8j1fycgh35NS0Osy/SJQdrdXt7Cd1gXg==
X-Received: by 2002:a17:90a:a601:: with SMTP id
 c1mr8874185pjq.24.1560922061561; 
 Tue, 18 Jun 2019 22:27:41 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:40 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 06/15] drm/bridge: tc358767: Simplify AUX data read
Date: Tue, 18 Jun 2019 22:27:07 -0700
Message-Id: <20190619052716.16831-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/oBLQcGnx/gnzbBsvs2luhfWdsPZ44ykpse07/04ZU=;
 b=T+85u3eDWlE84s/NikVtVZ07INyUOjHurTvZKCngf8SQNC+k7kSRNe3RMyHuACMyW0
 Ye5rm36YZ69RFtdGRolDtGvr85jKQdoFYHw1nKcS2eaPiktqLcr3A0Jw+cj72IU85s8s
 43+slUjdX34FMIsgI2zY9EqseYRetvIYz3JV9nIFxLLy59UlfwgvcengPXr6VgN0ZpCu
 EiYzn4QWWZfmols4NOSEXEmzKuLvMGqx7gUmkuh8QXq2zI6TvJECznG0mURQ37sQfWQ0
 lBkPnxzCGM925GxDuiXv/zcTdUuYHIPEEqYK3jYRKD78UJcofNLAeZxAmpJy0U/ma6N4
 HBpw==
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

U2ltcGxpZnkgQVVYIGRhdGEgcmVhZCBieSByZW1vdmluZyBpbmRleCBhcml0aG1ldGljIGFuZCBz
aGlmdGluZyB3aXRoCmEgaGVscGVyIGZ1bmN0aW9uIHRoYXQgZG9lcyB0d28gdGhpbmdzOgoKICAg
IDEuIEZldGNoIGRhdGEgZnJvbSB1cCB0byA0IDMyLWJpdCByZWdpc3RlcnMgZnJvbSB0aGUgY2hp
cAogICAgMi4gQ29weSByZWFkIGRhdGEgaW50byB1c2VyIHByb3ZpZGVkIGFycmF5LgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJl
ZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzog
Q29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5
QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDMxICsrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggNmEz
ZTdjN2UxMTg5Li4wMmY2ZDkwN2Y1YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAg
LTMyMSw2ICszMjEsMjAgQEAgc3RhdGljIGludCB0Y19hdXhfZ2V0X3N0YXR1cyhzdHJ1Y3QgdGNf
ZGF0YSAqdGMsIHU4ICpyZXBseSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCB0Y19hdXhf
cmVhZF9kYXRhKHN0cnVjdCB0Y19kYXRhICp0Yywgdm9pZCAqZGF0YSwgc2l6ZV90IHNpemUpCit7
CisJdTMyIGF1eHJkYXRhW0RQX0FVWF9NQVhfUEFZTE9BRF9CWVRFUyAvIHNpemVvZih1MzIpXTsK
KwlpbnQgcmV0LCBjb3VudCA9IEFMSUdOKHNpemUsIHNpemVvZih1MzIpKTsKKworCXJldCA9IHJl
Z21hcF9yYXdfcmVhZCh0Yy0+cmVnbWFwLCBEUDBfQVVYUkRBVEEoMCksIGF1eHJkYXRhLCBjb3Vu
dCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCW1lbWNweShkYXRhLCBhdXhyZGF0YSwg
c2l6ZSk7CisKKwlyZXR1cm4gc2l6ZTsKK30KKwogc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5z
ZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJCQkgICAgICAgc3RydWN0IGRybV9kcF9hdXhf
bXNnICptc2cpCiB7CkBAIC0zNzksMTkgKzM5MywxMCBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhf
dHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwogCi0JaWYgKHJlcXVlc3QgPT0gRFBfQVVYX0kyQ19SRUFEIHx8IHJlcXVlc3QgPT0gRFBfQVVY
X05BVElWRV9SRUFEKSB7Ci0JCS8qIFJlYWQgZGF0YSAqLwotCQl3aGlsZSAoaSA8IHNpemUpIHsK
LQkJCWlmICgoaSAlIDQpID09IDApIHsKLQkJCQlyZXQgPSByZWdtYXBfcmVhZCh0Yy0+cmVnbWFw
LAotCQkJCQkJICBEUDBfQVVYUkRBVEEoaSA+PiAyKSwgJnRtcCk7Ci0JCQkJaWYgKHJldCkKLQkJ
CQkJcmV0dXJuIHJldDsKLQkJCX0KLQkJCWJ1ZltpXSA9IHRtcCAmIDB4ZmY7Ci0JCQl0bXAgPSB0
bXAgPj4gODsKLQkJCWkrKzsKLQkJfQorCXN3aXRjaCAocmVxdWVzdCkgeworCWNhc2UgRFBfQVVY
X05BVElWRV9SRUFEOgorCWNhc2UgRFBfQVVYX0kyQ19SRUFEOgorCQlyZXR1cm4gdGNfYXV4X3Jl
YWRfZGF0YSh0YywgbXNnLT5idWZmZXIsIHNpemUpOwogCX0KIAogCXJldHVybiBzaXplOwotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
