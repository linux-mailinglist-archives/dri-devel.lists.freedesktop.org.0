Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41A1C69A6
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC3E6E442;
	Wed,  6 May 2020 07:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BC589D39
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:21:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x17so1610811wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tu5nPp2tsr/xXDZw6NiH6JY/janBM8/TqJS/baK6bXk=;
 b=hfCvpOqo590T0shuE1cPR7Tyz4uhd2A/5uh7k+1VU2jedYxG9T1l4vgT1N5LVp7/rU
 tBOap/HTZwM8PxrP/4Ry1VPhX+JjSr7aTQj32sKsZ361l7KSOldxc+/lOT4bb08zXTIY
 bGsadrq+6cxj1FWYpnXSU1qMjEJQcvbHecedCmrt9tDQfKV5bNW1DJCKuqHw6OqylKyK
 0nVefIu/SOI2KBuHsym/FdIb5P6Oza1bDm+mZMzXdIDrCWd106b5mQDChyD92l0ppLwI
 pSAuWHwF8e1cLmCubRyxw+0jZgwwurLfMxVchOT31Zqja55LvsEICbiRb/7Zxlh3MSFy
 TSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tu5nPp2tsr/xXDZw6NiH6JY/janBM8/TqJS/baK6bXk=;
 b=OuDXMPWgb5/ruvM4LVnnRBuf5vfkGz0jw7YSko7AsZGY8xM4X86fWJtsg/vI7HdG/c
 p8PexSdblcm/K7ua0lkporKSPjDMzv/+Zr7hEC4Iu0Y+dlSJfMLtvs5OEcTla/EilXFR
 TemJOXjvX23c9vk293B/uRtTDTFoThW6Dy9lTCwNA+Wrofs+kk5wEHDZUuUBSK1jaw94
 g1hHTA4s8CyKOEwwCeVtTv8j6v62n4HScWwJ2a/hM5MRLBa4vUvxKYrcfkafAxJMGLyh
 9PLsqA37lnX7O2YUfscITAZwV3Fjw910DIgqq/U0QkJhrZFO9AiwzIhIzKxKOV79gsXC
 9jdA==
X-Gm-Message-State: AGi0PuYyZsfMBYYJOVxwCsabjVwp9dH79aaBaF95wWL6OLkYvlxmEXKl
 kA0dUX52tQW5JitR9ha8lmQ=
X-Google-Smtp-Source: APiQypLrjmQKo6d9M8OL1hHuv8HTAuaj9UpwYWqHt0WxaUQvw0OPHJw9ZyiR41AHYzey4MuSaYo7Cw==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr2198454wrr.131.1588666860081; 
 Tue, 05 May 2020 01:21:00 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id k9sm1969160wrd.17.2020.05.05.01.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 01:20:59 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2] nand: brcmnand: correctly verify erased pages
Date: Tue,  5 May 2020 10:20:55 +0200
Message-Id: <20200505082055.2843847-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092943.2739784-1-noltari@gmail.com>
References: <20200504092943.2739784-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
b3QgYmVpbmcgMHhmZi4KQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCB0aGUgRUND
IGFyZW4ndCAweGZmLgoKRml4ZXM6IDAyYjg4ZWVhOWY5YyAoIm10ZDogYnJjbW5hbmQ6IEFkZCBj
aGVjayBmb3IgZXJhc2VkIHBhZ2UgYml0ZmxpcHMiKQoKU2lnbmVkLW9mZi1ieTogw4FsdmFybyBG
ZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KLS0tCiB2MjogQWRkIEZpeGVzIHRh
ZwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAyMiArKysrKysr
KysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwppbmRleCBl
NGUzY2VlYWMzOGYuLjU0NmYwODA3Yjg4NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jCkBAIC0yMDE4LDYgKzIwMTgsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3Jl
YWRfYnlfcGlvKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAog
c3RhdGljIGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5m
byAqbXRkLAogCQkgIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHZvaWQgKmJ1ZiwgdTY0IGFkZHIp
CiB7CisJc3RydWN0IG10ZF9vb2JfcmVnaW9uIG9vYmVjYzsKIAlpbnQgaSwgc2FzOwogCXZvaWQg
Km9vYiA9IGNoaXAtPm9vYl9wb2k7CiAJaW50IGJpdGZsaXBzID0gMDsKQEAgLTIwMzUsMTEgKzIw
MzYsMjQgQEAgc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlmb3IgKGkgPSAw
OyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyssIG9vYiArPSBzYXMpIHsKKwlmb3IgKGkgPSAwOyBp
IDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyspIHsKIAkJZWNjX2NodW5rID0gYnVmICsgY2hpcC0+ZWNj
LnNpemUgKiBpOwotCQlyZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoZWNjX2NodW5r
LAotCQkJCQkJICBjaGlwLT5lY2Muc2l6ZSwKLQkJCQkJCSAgb29iLCBzYXMsIE5VTEwsIDAsCisK
KwkJcmV0ID0gbmFuZF9jaGVja19lcmFzZWRfZWNjX2NodW5rKGVjY19jaHVuaywgY2hpcC0+ZWNj
LnNpemUsCisJCQkJCQkgIE5VTEwsIDAsIE5VTEwsIDAsCisJCQkJCQkgIGNoaXAtPmVjYy5zdHJl
bmd0aCk7CisJCWlmIChyZXQgPCAwKQorCQkJcmV0dXJuIHJldDsKKworCQliaXRmbGlwcyA9IG1h
eChiaXRmbGlwcywgcmV0KTsKKwl9CisKKwlmb3IgKGkgPSAwOyBtdGQtPm9vYmxheW91dC0+ZWNj
KG10ZCwgaSwgJm9vYmVjYykgIT0gLUVSQU5HRTsgaSsrKQorCXsKKwkJcmV0ID0gbmFuZF9jaGVj
a19lcmFzZWRfZWNjX2NodW5rKE5VTEwsIDAsCisJCQkJCQkgIG9vYiArIG9vYmVjYy5vZmZzZXQs
CisJCQkJCQkgIG9vYmVjYy5sZW5ndGgsCisJCQkJCQkgIE5VTEwsIDAsCiAJCQkJCQkgIGNoaXAt
PmVjYy5zdHJlbmd0aCk7CiAJCWlmIChyZXQgPCAwKQogCQkJcmV0dXJuIHJldDsKLS0gCjIuMjYu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
