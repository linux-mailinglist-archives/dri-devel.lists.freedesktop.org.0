Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFE1CEDAC
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5C76E83C;
	Tue, 12 May 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D906E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:51:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w19so7195118wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PzqUJAgwkfPwZqY9huLuJ57Jz2DxDsPXmmqSEmn6iEQ=;
 b=jYYn2rm9tXXBGEfdfNQxs0IaQPLDPbZSznuhX3K3+inFDcNXl0KqQtlWqLM9/BjpNP
 kVv7wd8np8uF/tWqF7LnPYZiT9kKEfwIdiBsKmde+aZznx/vHd5yLgXEiJ8u98GMTMm/
 Gsv4kEFmvrb1jC/i9LQB3C+LyUCfjfqEwgt12dDtMEOnNbO0QMLxQwIa2COQGzigJXAe
 4CaHT90CiQBrTZ2ua2AHa+d8Mi+GHAtvKm9bHHumm3st3Gi8TwvFOWQJTogShROTWwN9
 OmVGoAxdexdjEQoAoQEigGrj3xKbHKGvBoDQU53JtJj2qNesFI9pkKokCm7CWUhcF4NW
 GQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PzqUJAgwkfPwZqY9huLuJ57Jz2DxDsPXmmqSEmn6iEQ=;
 b=p/Lp6SNuFwsp6cQy3uXwtOsYeZBnZWE3LGX7G99XOLB9Xxx6xMULFOi3JUUccyp1fz
 2YkNI4z2yc2xbsbRwF9rZXHGdg3hMzPDI0O4eVU9MYfK8Vt/28eqrNKu7EpSI0m9tcm+
 eUKA6b1bCL90YDOdAaCsfg+hCgHLK8PF2+4Y4Y25xfHPOMswHj9TC3Td3Rn3jxE/rHVC
 6AOBkYRtocSwY1xDdTTuszD8hvVgiy9DarAR9IZB+gSN9Vz7qz8I8QILFxo0D+AA+CdU
 bhfFd0PBUKJCt1AB/m3wkwzYz7RIxSpiXtG+o86yVz8/6EqP2VW5VAbivJ5q/khbynaD
 15+g==
X-Gm-Message-State: AGi0PuY9MXucma7CZD7Nhftpc0aYdH1kdVKTUoCLrkiJavzyF762eYLH
 AOPmTH/LqhnzKz1lF3vK2e4=
X-Google-Smtp-Source: APiQypJvYf4NALaAkFyguhqo82x6QEXVkcwJJetASyREMrQ2k+rzJEeg2imq5+2NaLIPszqT4KSHyA==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr34648915wmg.36.1589266274574; 
 Mon, 11 May 2020 23:51:14 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id n25sm30740119wmk.9.2020.05.11.23.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:51:14 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
Date: Tue, 12 May 2020 08:51:11 +0200
Message-Id: <20200512065111.716801-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505082055.2843847-1-noltari@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
LgpUaGlzIGlzIGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8g
dGhlIE9PQiwgc2luY2UgaXQgd2lsbApmYWlsIGR1ZSB0byB0aGUgdXNhYmxlIE9PQiBieXRlcyBu
b3QgYmVpbmcgMHhmZi4KQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFu
ZCBFQ0MgYnl0ZXMgYXJlbid0IDB4ZmYuCgpGaXhlczogMDJiODhlZWE5ZjljICgibXRkOiBicmNt
bmFuZDogQWRkIGNoZWNrIGZvciBlcmFzZWQgcGFnZSBiaXRmbGlwcyIpClNpZ25lZC1vZmYtYnk6
IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjM6IEZp
eCBjb21taXQgbG9nIGFuZCBtZXJnZSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsgY2FsbHMu
CiB2MjogQWRkIEZpeGVzIHRhZwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwppbmRleCBlNGUzY2VlYWMzOGYuLjgwZmUwMWYwMzUxNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0yMDE4LDggKzIwMTgsOSBAQCBzdGF0aWMg
aW50IGJyY21uYW5kX3JlYWRfYnlfcGlvKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLAogc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCQkgIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHZvaWQg
KmJ1ZiwgdTY0IGFkZHIpCiB7CisJc3RydWN0IG10ZF9vb2JfcmVnaW9uIG9vYmVjYzsKIAlpbnQg
aSwgc2FzOwotCXZvaWQgKm9vYiA9IGNoaXAtPm9vYl9wb2k7CisJdm9pZCAqb29iOwogCWludCBi
aXRmbGlwcyA9IDA7CiAJaW50IHBhZ2UgPSBhZGRyID4+IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAJaW50
IHJldDsKQEAgLTIwMzUsMTEgKzIwMzYsMTkgQEAgc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVy
aWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCWlmIChyZXQpCiAJCXJldHVy
biByZXQ7CiAKLQlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyssIG9vYiArPSBz
YXMpIHsKKwlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyspIHsKIAkJZWNjX2No
dW5rID0gYnVmICsgY2hpcC0+ZWNjLnNpemUgKiBpOwotCQlyZXQgPSBuYW5kX2NoZWNrX2VyYXNl
ZF9lY2NfY2h1bmsoZWNjX2NodW5rLAotCQkJCQkJICBjaGlwLT5lY2Muc2l6ZSwKLQkJCQkJCSAg
b29iLCBzYXMsIE5VTEwsIDAsCisKKwkJaWYgKG10ZC0+b29ibGF5b3V0LT5lY2MobXRkLCBpLCAm
b29iZWNjKSkgeworCQkJb29iID0gTlVMTDsKKwkJCW9vYmVjYy5sZW5ndGggPSAwOworCQl9IGVs
c2UgeworCQkJb29iID0gY2hpcC0+b29iX3BvaSArIG9vYmVjYy5vZmZzZXQ7CisJCX0KKworCQly
ZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoZWNjX2NodW5rLCBjaGlwLT5lY2Muc2l6
ZSwKKwkJCQkJCSAgb29iLCBvb2JlY2MubGVuZ3RoLAorCQkJCQkJICBOVUxMLCAwLAogCQkJCQkJ
ICBjaGlwLT5lY2Muc3RyZW5ndGgpOwogCQlpZiAocmV0IDwgMCkKIAkJCXJldHVybiByZXQ7Ci0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
