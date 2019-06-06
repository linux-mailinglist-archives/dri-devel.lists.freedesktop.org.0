Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07E380A0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA5C89A20;
	Thu,  6 Jun 2019 22:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A838E89A08
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:10 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a8so5574747edx.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEwCoKMEU9hYC5cQlPLTZr8d/17Dvv8CqSbJ0oq0mBA=;
 b=AnL3q3yIrJV4CJ6ADFs7zOMR7ZV6/AK4TMhbyVwvINeGVHzTdycMvgZViq8hJvAMrT
 5kGgkqH1DtLGtepjAPzH50s1Y5lTKJ+W0+RxeKjsLwL8pehXdmZE+6sntdzh85WkJ+F5
 MKat4I3/Xy4EQRiBC6g8vcsz5sYjqKzW9O2Ay89zaskiWWNPTPNPLVmsOdKOunG09e8k
 ug4GMY4penLys+dhuwfLexmZEZ7B86TTTO44Q+Qu061iaVPweMwETCytpx4bh7vHW8XE
 EpDuDzBf046mqID1G0/7tekz7MCKNdFFap/UH9k3GjVkHSG0lBkufSQh8y6FcUAZyc1R
 RmvQ==
X-Gm-Message-State: APjAAAVRU6ZnYfoPVCJI6mW+2ozyTKx332YIqVyz5Y3ZHpSVy6Ke6dNB
 zbUf1rIs6vHfre7l/CfhxzIsPyGF8rM=
X-Google-Smtp-Source: APXvYqwLyX/DauxG+tOreWbM7W6K1M96l9h1v4GxpyRXMVqbJ+4bUBe3vdEIYaL2QhJGew3i9IT7/w==
X-Received: by 2002:a17:906:2acf:: with SMTP id
 m15mr43817971eje.31.1559860088802; 
 Thu, 06 Jun 2019 15:28:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/10] drm/vkms: Dont flush crc worker when we change crc
 status
Date: Fri,  7 Jun 2019 00:27:48 +0200
Message-Id: <20190606222751.32567-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEwCoKMEU9hYC5cQlPLTZr8d/17Dvv8CqSbJ0oq0mBA=;
 b=UjjABmM5aKOzkwqOgwquO4ZPHTIxw1O7vdR7RJnRoQm3pRSvFYtRmPAaozfAce23OK
 MgQoaAcpUj6y758+j7ZL/kRM4Whk+nEHAXr7pp55SogKIcyAr9ndkP1XLUWFz0bi1HZZ
 34LpvAlGXv/vFZPSjR9OaofqBapXrNkg04krQ=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNyYyBjb3JlIGNvZGUgY2FuIGNvcGUgd2l0aCBzb21lIGxhdGUgY3JjLCB0aGUgcmFjZSBp
cyBraW5kYQp1bmF2b2lkYWJsZS4gU28gbm8gbmVlZCB0byBmbHVzaCBwZW5kaW5nIHdvcmtlcnMs
IHRoZXknbGwgY29tcGxldGUgaW4KdGltZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3Np
cXVlaXJhbWVsb0BnbWFpbC5jb20+CkNjOiBIYW5lZW4gTW9oYW1tZWQgPGhhbW9oYW1tZWQuc2FA
Z21haWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBi
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKaW5kZXggOTY4MDZjZDM1YWQ0Li45ZDE1
ZTVlODU4MzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYwpAQCAtMjQ5LDkgKzI0OSw2IEBAIGlu
dCB2a21zX3NldF9jcmNfc291cmNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgY29uc3QgY2hhciAq
c3JjX25hbWUpCiAKIAlyZXQgPSB2a21zX2NyY19wYXJzZV9zb3VyY2Uoc3JjX25hbWUsICZlbmFi
bGVkKTsKIAotCS8qIG1ha2Ugc3VyZSBub3RoaW5nIGlzIHNjaGVkdWxlZCBvbiBjcnRjIHdvcmtx
ICovCi0JZmx1c2hfd29ya3F1ZXVlKG91dC0+Y3JjX3dvcmtxKTsKLQogCXNwaW5fbG9ja19pcnEo
Jm91dC0+bG9jayk7CiAJb3V0LT5jcmNfZW5hYmxlZCA9IGVuYWJsZWQ7CiAJc3Bpbl91bmxvY2tf
aXJxKCZvdXQtPmxvY2spOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
