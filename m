Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592038562
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346C689AC0;
	Fri,  7 Jun 2019 07:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F24899DC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:36 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f97so330823plb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LVdZCLFy6QEDGvyvStVGqispy/JrU6lkx44tS0r6TYo=;
 b=IiD6J2BKaCa+MdvQXBqUgK9xlmS6UMebdcId9Zs48Kc47+cH1OyU4JhzKSx0V5GChJ
 lnp5gifBPWq/1RysVKXRN4P5Ear6VUM4ZDgo8d/lZ0ifgh2fCwTh1oCjlraot3tIhL6A
 2C6oLRRXk1gFiQ29+QZOyR3tGEDr5ft4c7fjeBsI+0Tq5uctA9RjN4nozL8zzUXGO9FV
 hvCWxFpROiSAiKYrisooFG3qXpkAfAnZ/gYDe097n86P8/wRuBTeBqxTgqZDBtAhSNRc
 lv1R4Dio9qc3290O7V78MT9kJFZbyNFqn7ztmInSLh2isJUjCRVk6Xoa57hnAAPGTOaG
 0oXQ==
X-Gm-Message-State: APjAAAXpSjGwetE4QKH99gmQPUSTCM+MaYhmH+StVP1k+/ZIBe4/psOM
 q/bSKSJSobGDT2jxAxony+xWNYgt/9k=
X-Google-Smtp-Source: APXvYqxy3TPySpG9DViq9xZAMZQx+gYKScsVQArqUSH0RU32FjJINPVr5QL+rXn94MY0SojzSddZoA==
X-Received: by 2002:a17:902:1003:: with SMTP id
 b3mr54556218pla.172.1559882795599; 
 Thu, 06 Jun 2019 21:46:35 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:34 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/15] drm/bridge: tc358767: Simplify AUX data read
Date: Thu,  6 Jun 2019 21:45:41 -0700
Message-Id: <20190607044550.13361-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LVdZCLFy6QEDGvyvStVGqispy/JrU6lkx44tS0r6TYo=;
 b=Ksac89OhxrBR2L37EQXPCoWnkvmzPUwqLErujAiTPxVRT8MtlvKwFEzG1sOKCTpb0C
 3FTX55PAe5Du3XxWT9SSpr/f061wbzFwEwRsz/YshIobK4tdI2X7SVZwTXU6tFXchgSf
 VlleRE/kS9ChdaHbr6uBVxXwihVieZVoDALaqL5CDSjrjeD6d0grWplEck3eTp8b1Emg
 yi2OU1EaNUMw7j+DmEdReM+qvjqboZ8g++y2VrHC8Kwsw5eyzML/CF9NkgQMmwh/R8cW
 r58YRYuxseR4tJLRcdYlMaPSElihI3z1j4LjaWSFmRmcoWNgfxHg2sL5BiwTYPd/h4o2
 w2dg==
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
