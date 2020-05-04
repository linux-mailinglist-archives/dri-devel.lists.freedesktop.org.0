Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F21C4E90
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69976E513;
	Tue,  5 May 2020 06:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51046E486
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 18:59:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h9so421588wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTu28xUDgKPSOfBD93/Q64n/TLopzl8Xcrc16onzdb4=;
 b=TRQM1Y5Y/kjYZMLRbOikbwDibHa3llJJVJ/bc7jGQWQvtEvHnYk+1txiccS6Rgx+6T
 1cpp1S+GVHWE22ZiEMtiCRXQWeW/mtePV1UrimBZe/Rsw6y0mt6J0YlRUdfmkWvPMU72
 D9rdhVW3L/6GTSOCfkvt6gRQDp8I/s7nzXE5vpUzPNKKbuVL913l/pHILh2AmLNoa7X4
 2fSfTjShbGngeSDvAdACnvzOFfyriEE8CQYvSTJpqBC852ad1HA5FjpKz+1lqLRnPcsY
 jNREp73WKhNlU9NPAI3hqdLEuyfcJzOM5PLSxBtKjKSzv7jgQ+9uSFF94uhiC2g/SHpv
 Hn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTu28xUDgKPSOfBD93/Q64n/TLopzl8Xcrc16onzdb4=;
 b=uJAwvWhIQubioYG+MDVUVm3OEhyEdSVXPYw8klWiRM/+U2gRfQ5mRbl/oOKgaopq+y
 R3qyjgpQa9roiRELG1h3ZMGjI5Zblft7Nl7CXK2m3iHeBqUULnhRD4L/0XspkL3UcGQY
 D7VxiOeba6ZJxhDuFS976Far17Lb1xfx+ia0aSYw2IAKL3SAKenDSw+gjwVcvo0UJuVa
 ND0UAa/nBq57EUDdxxIPGt2RVbxN7n5XoJZgdtqrxkBNZFFsvixB4UT7Zr+UX4D9XEuq
 c1A36FofSvDKtWvjbr4b1LhH/htzVaKuoX7tTBAr4DBCrNPoZNBoSDolY3Ts4A1jxCpO
 zh6Q==
X-Gm-Message-State: AGi0Pua0uR5HHTXXiA+axQ/nWrUpr7sjvxyx8HRN92najMMbA/hE4ay1
 r3koBP8w8/UrnH/pdWKFxSM=
X-Google-Smtp-Source: APiQypKIse9qXrWL+g42FDTv87t6NfFQ+bDzxi1DIXWKshuoMbdJwHPaPEgXUDiQ6wAWMVLgt0psUQ==
X-Received: by 2002:adf:9447:: with SMTP id 65mr534819wrq.331.1588618791289;
 Mon, 04 May 2020 11:59:51 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id i25sm452952wml.43.2020.05.04.11.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 11:59:50 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 2/2] nand: brcmnand: fix hamming oob layout
Date: Mon,  4 May 2020 20:59:45 +0200
Message-Id: <20200504185945.2776148-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
 <20200504185945.2776148-1-noltari@gmail.com>
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

Rmlyc3QgMiBieXRlcyBhcmUgdXNlZCBpbiBsYXJnZS1wYWdlIG5hbmQuCgpTaWduZWQtb2ZmLWJ5
OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYyOiBl
eHRlbmQgb3JpZ2luYWwgY29tbWVudAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXgg
NzY3MzQzZTBlNmU3Li4wYTFkNzZmZGUzN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYwpAQCAtMTExNCwxMCArMTExNCwxMCBAQCBzdGF0aWMgaW50IGJyY21uYW5k
X2hhbW1pbmdfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9u
LAogCX0gZWxzZSB7CiAJCS8qCiAJCSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBC
Qkkgd2hpbGUgbGFyZ2UtcGFnZQotCQkgKiBOQU5EIHVzZSBieXRlIDAuCisJCSAqIE5BTkQgdXNl
IGJ5dGVzIDAgYW5kIDEuCiAJCSAqLwogCQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIpIHsKLQkJ
CW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMTsKKwkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMjsKIAkJfSBl
bHNlIHsKIAkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMDsKIAkJCW5leHQtLTsKLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
