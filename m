Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9B1C4E96
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636C96E519;
	Tue,  5 May 2020 06:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531BA89CF4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 09:30:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u127so8222285wmg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=phBt/DyXxj2WCUjN/7VIPZs2iVaLf/hvf4aH3FE3pS4=;
 b=j7Ub+flln3YNhwj9yYp6wBol+TBlw1w6FXrudNdmpadgvX2kmnT6doDre9rBrwnxRx
 oaR8uKfqIgUoJ1VMOeGOw9Y+KYStlDgM6IiLAKmgstsij9t5UPXO0wv4pHvWvKNrlpX/
 AaZmZgCZlsUZskeawsKgB2KObhO/28CDfx9Qb5s+KzIryPocpNZo5H/EKg2JSVKugOqY
 uuy1l5PU75/at575nM/4WqvZxxL4xDuF8W25MnA3vlJJRCq9dVDgFrBO2oawAqwJCGfX
 UJ2SiWhC/YNvSBSSHxymASU+DtV7DjhFuoQ7fPH8iqnxd/8kj/sVOzja9jbEcxc7XLQ5
 Dmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=phBt/DyXxj2WCUjN/7VIPZs2iVaLf/hvf4aH3FE3pS4=;
 b=ulizo27QkGRlyVYI7B2xlAmrelUvN/I99qAzGXjgZHFJ5dd7OvOVu+w1ytsb1/cQ53
 njz9JYMIkngwjfR6iqe1+dtNHkhrlSwm2u4Z3E3htVW6OBnccdSIrt4hRUlGQpRtt66Y
 XzMDhMzYnal1AJeJrojlmMa0q7/MA0Lt2qzHzdPs0yUgNesq4JRfwlyieiL27XpzHCjf
 E4lSOmEWi5/aHXoPpEhyPkWpHa5DEA5oUZko5tEtPYbKcwomu4/uwUavf/vnUI7xW+NE
 S+gUZ+U7R7AYpmUl//f1e3RdoiFljO095felrG2B+FbNhoqu98dnG8PO1YX0+1PwiR7L
 ZI6A==
X-Gm-Message-State: AGi0PuY4Ve6GVJ1tKaxHrD/B2IG1chOmtBx+XuAriDC7Zg354YZREVJG
 nEGjv98NKEGKOgbkm4+A/G4=
X-Google-Smtp-Source: APiQypJS5Hd4YKWO6K+er1KaH05rOKwDvb8orjhGW/13qMHgW2kYeb5kLUuph8xfEkdVy+4SLf6EJA==
X-Received: by 2002:a1c:c345:: with SMTP id t66mr14567380wmf.189.1588584645850; 
 Mon, 04 May 2020 02:30:45 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id u12sm13075570wmu.25.2020.05.04.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:30:45 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] nand: brcmnand: fix BBI in hamming oob layout
Date: Mon,  4 May 2020 11:30:34 +0200
Message-Id: <20200504093034.2739968-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504093034.2739968-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
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

U21hbGwgUGFnZSBOQU5EIHVzZXMgYnl0ZSA2IGZvciBCQkkgYW5kIExhcmdlIFBhZ2UgTkFORCB1
c2VzIGZpcnN0IDIgYnl0ZXMuCgpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKaW5kZXggMWJiYTMwOWM3Njg0Li41OWMzMjQxZjRlYTUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMTEwOSwxMCArMTEwOSwxOCBAQCBzdGF0
aWMgaW50IGJyY21uYW5kX2hhbW1pbmdfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICpt
dGQsIGludCBzZWN0aW9uLAogCWlmIChzZWN0aW9uIDwgc2VjdG9ycykKIAkJbmV4dCArPSA2Owog
Ci0JaWYgKHNlY3Rpb24pCisJaWYgKHNlY3Rpb24pIHsKIAkJb29icmVnaW9uLT5vZmZzZXQgPSAo
KHNlY3Rpb24gLSAxKSAqIHNhcykgKyA5OwotCWVsc2UKLQkJb29icmVnaW9uLT5vZmZzZXQgPSAx
OyAvKiBCQkkgKi8KKwl9IGVsc2UgeworCQlpZiAoY2ZnLT5wYWdlX3NpemUgPT0gNTEyKSB7CisJ
CQkvKiBzbWFsbCBwYWdlIHVzZXMgYnl0ZSA2IGZvciBCQkkgKi8KKwkJCW9vYnJlZ2lvbi0+b2Zm
c2V0ID0gMDsKKwkJCW5leHQtLTsKKwkJfSBlbHNlIHsKKwkJCS8qIGxhcmdlIHBhZ2UgdXNlcyBm
aXJzdCAyIGJ5dGVzIGZvciBCQkkgKi8KKwkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMjsKKwkJfQor
CX0KIAogCW9vYnJlZ2lvbi0+bGVuZ3RoID0gbmV4dCAtIG9vYnJlZ2lvbi0+b2Zmc2V0OwogCi0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
