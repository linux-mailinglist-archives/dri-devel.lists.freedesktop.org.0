Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7491C4E9D
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332916E52F;
	Tue,  5 May 2020 06:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB79589CCE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 09:29:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l18so9325240wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2YxkH/lWbx8jjAhy6XV0nL4qLMq1MOAjY7RA6k/WB4=;
 b=K/Ws8BmyoqGZGLQYHin3HwA+JMkgqMir7wNzB+pLnNTGxSTZUQHt0DLXMzAsIQEzcP
 9QJhcV4cq2WOOptbt+J4xCmszcY31/GvEuCAPr3uqFtzKXNVWE9T/Kza5Y0rT/KzbyaA
 hL9Sre8KAx8xY1lePcT+QeEx4d81BJyyb6c2/KPjBTx0YLLH0EjrYv/y0BcbiMjfluoR
 /coNr6jJ3H+bn0ZuQ+DREJfJeSjZ+oxvg21BqHTIWsOJVyJypNsL7X5HEHOoYc8ma5E/
 0ivUVZdwJXvWcE79pxbu0EAW9Gw1v5obnDV/lGVFG6/5I6LqZCBBtLvoTR3myFpzLxE7
 lKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2YxkH/lWbx8jjAhy6XV0nL4qLMq1MOAjY7RA6k/WB4=;
 b=SrKD2hJX2lQV0Ql16B2XqXw6Aht+BnxvUSqLSn+HcN5lBApWAcI5475mQrg/Jm5JvW
 e2BWnupd1heq9JNKsgSRAGKs0m1QBmb1HzYQIeDdaCumHYHzXK0Moya8ondl2FId865z
 TPJ/ixdsSdl50zrF4vkd6Fz6t9tydznRbHzKZYTWJ7KAa9clLEs3zj2140iw7BtY+AP2
 /YGxc3aQg1MVZ9fK4nJ48DqLkgGUYm60cREO1JXnGCehMEJqyL8/2eIM1FFVxOD1UrQt
 HUiOjXO1cIp0Es/d9lunMiUcqxyR0Da65tf8eFGPNTlubGNgNKAtl8ZNFxmCCR2cd7/6
 rpTQ==
X-Gm-Message-State: AGi0PubV32jkEKwclf3A5bcnC1Gh1YwGyr+59SM5+coIldmM/JtTqR0C
 triG7tLPIH+wUaQOCKc893A=
X-Google-Smtp-Source: APiQypIkkbhC2pp71xWc4qJpvnWgeLLvCX9aOOoVg4impVPijmMMmbwo6MgNbyyZOaF+TmYb8rAXSw==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr314819wrm.399.1588584596171;
 Mon, 04 May 2020 02:29:56 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id s8sm17334965wru.38.2020.05.04.02.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:29:55 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] nand: brcmnand: correctly verify erased pages
Date: Mon,  4 May 2020 11:29:43 +0200
Message-Id: <20200504092943.2739784-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
IGFyZW4ndCAweGZmLgoKU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxu
b2x0YXJpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMKaW5kZXggZTRlM2NlZWFjMzhmLi41NDZmMDgwN2I4ODcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMjAxOCw2ICsyMDE4LDcgQEAgc3Rh
dGljIGludCBicmNtbmFuZF9yZWFkX2J5X3BpbyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgYnJjbXN0Yl9uYW5kX3ZlcmlmeV9lcmFzZWRf
cGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAkJICBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB2
b2lkICpidWYsIHU2NCBhZGRyKQogeworCXN0cnVjdCBtdGRfb29iX3JlZ2lvbiBvb2JlY2M7CiAJ
aW50IGksIHNhczsKIAl2b2lkICpvb2IgPSBjaGlwLT5vb2JfcG9pOwogCWludCBiaXRmbGlwcyA9
IDA7CkBAIC0yMDM1LDExICsyMDM2LDI0IEBAIHN0YXRpYyBpbnQgYnJjbXN0Yl9uYW5kX3Zlcmlm
eV9lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAlpZiAocmV0KQogCQlyZXR1cm4g
cmV0OwogCi0JZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2IgKz0gc2Fz
KSB7CisJZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrKSB7CiAJCWVjY19jaHVu
ayA9IGJ1ZiArIGNoaXAtPmVjYy5zaXplICogaTsKLQkJcmV0ID0gbmFuZF9jaGVja19lcmFzZWRf
ZWNjX2NodW5rKGVjY19jaHVuaywKLQkJCQkJCSAgY2hpcC0+ZWNjLnNpemUsCi0JCQkJCQkgIG9v
Yiwgc2FzLCBOVUxMLCAwLAorCisJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhl
Y2NfY2h1bmssIGNoaXAtPmVjYy5zaXplLAorCQkJCQkJICBOVUxMLCAwLCBOVUxMLCAwLAorCQkJ
CQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOworCQlpZiAocmV0IDwgMCkKKwkJCXJldHVybiByZXQ7
CisKKwkJYml0ZmxpcHMgPSBtYXgoYml0ZmxpcHMsIHJldCk7CisJfQorCisJZm9yIChpID0gMDsg
bXRkLT5vb2JsYXlvdXQtPmVjYyhtdGQsIGksICZvb2JlY2MpICE9IC1FUkFOR0U7IGkrKykKKwl7
CisJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhOVUxMLCAwLAorCQkJCQkJICBv
b2IgKyBvb2JlY2Mub2Zmc2V0LAorCQkJCQkJICBvb2JlY2MubGVuZ3RoLAorCQkJCQkJICBOVUxM
LCAwLAogCQkJCQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOwogCQlpZiAocmV0IDwgMCkKIAkJCXJl
dHVybiByZXQ7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
