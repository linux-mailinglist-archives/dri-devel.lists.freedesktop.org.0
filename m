Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2633FE13C8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4521A6E9B6;
	Wed, 23 Oct 2019 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3368A6E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:47:16 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id j10so8590812qka.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 04:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=T48tWlGrH2z44TnaLtsbXFIJ8HnlGaqO67n3JM09Qog=;
 b=I9FHC9PcC2yMf5uzMEQainSX/CRFoKr3NydyKl4ZcFL1dlzWJAa5OOt/z/oBccwX7v
 +n2B0hJzY9dzi00kEYHmQYlJfsCANQf5fuoE4qUQr41l7JPt6fjgCWaAsFs2CFN7I26c
 osntcPJ11xo/Y6ropP6FBSLM1lp6WDgSQR1kuJRPzfMV8Q4OCTdLxeeJqFu/u547zlgU
 OE1PGlNnPcnUkD1AA0p1O/DsFUbpjnn8LwPMYCq3TokW9rjYfHMXm6gH5cUN5bL78yl7
 F6VM0io2VuzjXHunuATcWuSS+LE5iQkNlKR41pTrcf0Qd7OLSA/KLBtcCL63k8kRUzVg
 n7Lw==
X-Gm-Message-State: APjAAAXD+yybfrZlYh3GrEElm3i7OXDOuY3TJUehffxWIfeDVTf1+cmF
 A4HCTDtwy+gdBdjg2PF7qulwZjO0lKtv
X-Google-Smtp-Source: APXvYqzLdQNX1Nkvs2wlFXNLo0RhFNgzd7th7BWIbuHvGPweK4oFS5GnrmsAHjH7EiF1oJZrrO6Xb3PQN00l
X-Received: by 2002:a0c:b59b:: with SMTP id g27mr2657124qve.184.1571744835079; 
 Tue, 22 Oct 2019 04:47:15 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:05 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.6.I2e59e084bcd3aa34a651a7279bc63400e818cf0f@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 6/6] ASoC: mediatek: mt8183: support HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=T48tWlGrH2z44TnaLtsbXFIJ8HnlGaqO67n3JM09Qog=;
 b=DIDqCZeA05PLNKgdNR65FcBeK7ZuNM7RI1WYpop1VdWJpSktWHN7BLQmxoJ95oSoOj
 ocZM3wTXiXYuUAVS3FEX93PO9ufyw6CP5i+YYDPIty/fxPlMSKCcXkNPvmNBh84O7ji3
 RblCbKUAZNaBzTtr/pR/axxmyCdv692dB/bTcDeCPKl3MVNMNqRZbJ6Z/adaA3BTYQrS
 w5zSQ7dCbF1AqeSzyQTOSzMWPMjCvxo9vc1bzvGXkIvJQhoNDrBnxJUZLg5JCENpRl9s
 Zpbj++fZL3ZTMl0SHwrvyNXSlunWa1bW5Nlgh/uS0SUoUVN8gBsUbUseQXGQ57MR3Sxq
 8QlA==
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3VwcG9ydCBIRE1JIGphY2sgcmVwb3J0aW5nLgoKU2lnbmVkLW9mZi1ieTogVHp1bmctQmkgU2hp
aCA8dHp1bmdiaUBnb29nbGUuY29tPgotLS0KIHNvdW5kL3NvYy9tZWRpYXRlay9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICB8ICAzICsrLQogLi4uL210ODE4My9tdDgxODMtbXQ2MzU4LXRzM2Ey
MjctbWF4OTgzNTcuYyAgIHwgMjAgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9tZWRpYXRlay9LY29uZmlnIGIvc291bmQvc29jL21lZGlhdGVrL0tjb25maWcKaW5kZXggOGIy
OWYzOTc5ODk5Li4wZDhkNzVjNWY5ODQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9tZWRpYXRlay9L
Y29uZmlnCisrKyBiL3NvdW5kL3NvYy9tZWRpYXRlay9LY29uZmlnCkBAIC0xMjYsOSArMTI2LDEw
IEBAIGNvbmZpZyBTTkRfU09DX01UODE4M19NVDYzNThfVFMzQTIyN0VfTUFYOTgzNTdBCiAJc2Vs
ZWN0IFNORF9TT0NfQlRfU0NPCiAJc2VsZWN0IFNORF9TT0NfVFMzQTIyN0UKIAlzZWxlY3QgU05E
X1NPQ19DUk9TX0VDX0NPREVDCisJc2VsZWN0IFNORF9TT0NfSERNSV9DT0RFQwogCWhlbHAKIAkg
IFRoaXMgYWRkcyBBU29DIGRyaXZlciBmb3IgTWVkaWF0ZWsgTVQ4MTgzIGJvYXJkcwotCSAgd2l0
aCB0aGUgTVQ2MzU4IFRTM0EyMjdFIE1BWDk4MzU3QSBhdWRpbyBjb2RlYy4KKwkgIHdpdGggdGhl
IE1UNjM1OCBUUzNBMjI3RSBNQVg5ODM1N0EgYXVkaW8gY29kZWMgYW5kIEhETUkgY29kZWMuCiAJ
ICBTZWxlY3QgWSBpZiB5b3UgaGF2ZSBzdWNoIGRldmljZS4KIAkgIElmIHVuc3VyZSBzZWxlY3Qg
Ik4iLgogCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTgzL210ODE4My1tdDYz
NTgtdHMzYTIyNy1tYXg5ODM1Ny5jIGIvc291bmQvc29jL21lZGlhdGVrL210ODE4My9tdDgxODMt
bXQ2MzU4LXRzM2EyMjctbWF4OTgzNTcuYwppbmRleCAyNThmMTQxNmZhZTEuLjIzMzA1ZGQyZjk1
OCAxMDA2NDQKLS0tIGEvc291bmQvc29jL21lZGlhdGVrL210ODE4My9tdDgxODMtbXQ2MzU4LXRz
M2EyMjctbWF4OTgzNTcuYworKysgYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTgzL210ODE4My1t
dDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny5jCkBAIC0xMSw2ICsxMSw3IEBACiAjaW5jbHVkZSA8c291
bmQvc29jLmg+CiAjaW5jbHVkZSA8c291bmQvamFjay5oPgogI2luY2x1ZGUgPGxpbnV4L3BpbmN0
cmwvY29uc3VtZXIuaD4KKyNpbmNsdWRlIDxzb3VuZC9oZG1pLWNvZGVjLmg+CiAKICNpbmNsdWRl
ICJtdDgxODMtYWZlLWNvbW1vbi5oIgogI2luY2x1ZGUgIi4uLy4uL2NvZGVjcy90czNhMjI3ZS5o
IgpAQCAtMzAsNyArMzEsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10ODE4M19waW5f
c3RyW1BJTl9TVEFURV9NQVhdID0gewogc3RydWN0IG10ODE4M19tdDYzNThfdHMzYTIyN19tYXg5
ODM1N19wcml2IHsKIAlzdHJ1Y3QgcGluY3RybCAqcGluY3RybDsKIAlzdHJ1Y3QgcGluY3RybF9z
dGF0ZSAqcGluX3N0YXRlc1tQSU5fU1RBVEVfTUFYXTsKLQlzdHJ1Y3Qgc25kX3NvY19qYWNrIGhl
YWRzZXRfamFjazsKKwlzdHJ1Y3Qgc25kX3NvY19qYWNrIGhlYWRzZXRfamFjaywgaGRtaV9qYWNr
OwogfTsKIAogc3RhdGljIGludCBtdDgxODNfbXQ2MzU4X2kyc19od19wYXJhbXMoc3RydWN0IHNu
ZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCkBAIC0yNzAsNiArMjcxLDIyIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc25kX3NvY19vcHMgbXQ4MTgzX210NjM1OF90czNhMjI3X21heDk4MzU3X3dv
dl9vcHMgPSB7CiAJLnNodXRkb3duID0gbXQ4MTgzX210NjM1OF90czNhMjI3X21heDk4MzU3X3dv
dl9zaHV0ZG93biwKIH07CiAKK3N0YXRpYyBpbnQKK210ODE4M19tdDYzNThfdHMzYTIyN19tYXg5
ODM1N19oZG1pX2luaXQoc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCkKK3sKKwlzdHJ1
Y3QgbXQ4MTgzX210NjM1OF90czNhMjI3X21heDk4MzU3X3ByaXYgKnByaXYgPQorCQlzbmRfc29j
X2NhcmRfZ2V0X2RydmRhdGEocnRkLT5jYXJkKTsKKwlpbnQgcmV0OworCisJcmV0ID0gc25kX3Nv
Y19jYXJkX2phY2tfbmV3KHJ0ZC0+Y2FyZCwgIkhETUkgSmFjayIsIFNORF9KQUNLX0xJTkVPVVQs
CisJCQkJICAgICZwcml2LT5oZG1pX2phY2ssIE5VTEwsIDApOworCWlmIChyZXQpCisJCXJldHVy
biByZXQ7CisKKwlyZXR1cm4gaGRtaV9jb2RlY19zZXRfamFja19kZXRlY3QocnRkLT5jb2RlY19k
YWktPmNvbXBvbmVudCwKKwkJCQkJICAmcHJpdi0+aGRtaV9qYWNrKTsKK30KKwogc3RhdGljIHN0
cnVjdCBzbmRfc29jX2RhaV9saW5rCiBtdDgxODNfbXQ2MzU4X3RzM2EyMjdfbWF4OTgzNTdfZGFp
X2xpbmtzW10gPSB7CiAJLyogRkUgKi8KQEAgLTQzNiw2ICs0NTMsNyBAQCBtdDgxODNfbXQ2MzU4
X3RzM2EyMjdfbWF4OTgzNTdfZGFpX2xpbmtzW10gPSB7CiAJCS5pZ25vcmVfc3VzcGVuZCA9IDEs
CiAJCS5iZV9od19wYXJhbXNfZml4dXAgPSBtdDgxODNfaTJzX2h3X3BhcmFtc19maXh1cCwKIAkJ
Lm9wcyA9ICZtdDgxODNfbXQ2MzU4X3RkbV9vcHMsCisJCS5pbml0ID0gbXQ4MTgzX210NjM1OF90
czNhMjI3X21heDk4MzU3X2hkbWlfaW5pdCwKIAkJU05EX1NPQ19EQUlMSU5LX1JFRyh0ZG0pLAog
CX0sCiB9OwotLSAKMi4yMy4wLjg2Ni5nYjg2OWI5OGQ0Yy1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
