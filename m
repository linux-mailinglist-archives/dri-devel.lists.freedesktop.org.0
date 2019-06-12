Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CE43372
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4DD8933C;
	Thu, 13 Jun 2019 07:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A79892D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:14 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a186so9220121pfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LVdZCLFy6QEDGvyvStVGqispy/JrU6lkx44tS0r6TYo=;
 b=SiXhbQyVWUmO3h4IWdXudOpuQuWhcLxEL2YMvIg5uSHSMv8P2fBOa/DzITMvZxjiWK
 JjMObuMdz/enB8G1HpVMA9L1F2k0GjmnoM5GPjdsc2QIscLrVUAxzGhXAV4tAyKGggqs
 Emniutj539GNRnlHj4a4sYwskc1uXCWjvKJ6JoeAzv5/nSKRjhoO9UB9QuNlvrQlJDKz
 2OqY4TtF/lf9k7cowz/SmQepLNPg3tcu9DrHhsA6iUWiWV+Z8probeXxk8/K81qnroXe
 rQkGVbQ6rFYVq+z03GOHsHz94rCYAqpipz/jWvIthWAuo+sHvpjz+0+WSmutdDaJgzL5
 58Aw==
X-Gm-Message-State: APjAAAXeSQa/tVyAi6cL4lPvbSL1i6iG9d5Te6RIGHBzLTo2ULBS4ifE
 7ifirfsqnu4/MrcTGuNJOytmdGSN9Ps=
X-Google-Smtp-Source: APXvYqxwac8t/w9FHxZ8pFvq8zaU82WOfOOMYMbMWsMabAk3eaNlCmW35IaZ5yFdd/dAGwB+P8Kg6g==
X-Received: by 2002:a62:7d13:: with SMTP id y19mr26901449pfc.62.1560328394213; 
 Wed, 12 Jun 2019 01:33:14 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:13 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/15] drm/bridge: tc358767: Simplify AUX data read
Date: Wed, 12 Jun 2019 01:32:43 -0700
Message-Id: <20190612083252.15321-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LVdZCLFy6QEDGvyvStVGqispy/JrU6lkx44tS0r6TYo=;
 b=ebH+e+yRL03RD84DE66s1KelaR+9leWYSMIwRIAWYA5aXrQAAkVvL2oCcizYNskH02
 MIL5/ZHmccqPa/hYl2SfmClEogn4UxqAKKoOdJ/Y+dUjX+xGRD7r9jViQDAMPkCadeUi
 xsx07/ikMU88hRqRIuygDMj3xWF/S7eBmhkptKjJvSnhEoInIc9Reh1QpdM25KXHVfja
 XGaBSoWYfRtxQopXIjLMdqz3es4WwYhkrsBtfCPtyZCLpBoS3/qVaz+JvybH9syeFOzV
 HfZ0vKVBOP/dvWqH8Jd7nm/arv+NBZ8SJLEG53JUu6MiBqXBEjO4Qm/bmR6o/HH0zVvw
 lcoA==
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
L3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggN2Ix
NWNhZWMyY2U1Li43MTUyYjQ0ZGI4YTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
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
