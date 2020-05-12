Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673771CEDC9
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF436E855;
	Tue, 12 May 2020 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0D06E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:00:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y24so21879431wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqMgmNOYwrxdY+o1DnJ61eJdUyKQzmC6mhNhV0fXE88=;
 b=D9eV/Zf54+ehFvlVaYySHF1yxDS1BGjbh6+228BirDrpdom0MfF2DPTvrOx2PKqeqn
 msk0n3K9GPL+VHGSRvIHtUus4pCZqaqd3gAF8hfWLRyTj7xsOa9HsGZHUj4gpWc9Hkrw
 zHyu8JUu/7+BNPXx37aWLX4tFqwJHBk5qqyTa6IGtdBzKqnMJPAUGFDrHD/UXue2WOVn
 DdCazsjpbK7BT0mG9l+GrVhJfMbdFhEPdf64dxv0ES+GbH5Ft1cOo04SGO0mspp70c0w
 7OpSWbgz92HLJOSQ8ByE+aZrZ4qCkvazVxoLZ1K3Ciy2wq4fjmCpm8qCXF/QuIgwrvRc
 rc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqMgmNOYwrxdY+o1DnJ61eJdUyKQzmC6mhNhV0fXE88=;
 b=Dupy6gjRl5HRkrrQzE7FKqbjlYA3Vw2iporIqXdiBUnVXWa+w/35wPV6i5QmkskXRp
 XiqxUuC8gIz6wjaISP24s4scMXZ7gOeUI68kngzjQT4lZG5o3O770OjHuTrIepiwYEzo
 LqgIcsHje3FzGnSLCFaozye43kRo3R2U041X814oCCFn2LZxe2j+quQfYztIJn+LwhMd
 Nr0xbOiscmYRYBaf1XyBc5QTt9bFeMBq6e1RiVvLFKV3oxeNcgXw6AufROV1/cbFmtiH
 vW2eKgesw1HSF9PNwghcyFsYyUiSL4Bm3feSTWN30NV1+zcXgI6l87AXyddv0Um7hYz8
 Tsyg==
X-Gm-Message-State: AGi0PuZkM8VHtR4ICjuXw3yq3Js9DkiqYuNsOLe/0Lq3rZwWl/HcO9Jv
 opV7/AOLwIGqusSk+Zm+Mgk=
X-Google-Smtp-Source: APiQypJChnU7y6gqwA6+tQ/g42zXUMKmCWgR04qMmUVzGvHla1KX0Ibexk1/9cnyXDApm2t7GubW/A==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr36219836wmj.86.1589263230616; 
 Mon, 11 May 2020 23:00:30 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:00:30 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 1/2] mtd: rawnand: brcmnand: fix hamming oob layout
Date: Tue, 12 May 2020 08:00:22 +0200
Message-Id: <20200512060023.684871-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rmlyc3QgMiBieXRlcyBhcmUgdXNlZCBpbiBsYXJnZS1wYWdlIG5hbmQuCgpGaXhlczogZWY1ZWVl
YTZlOTExICgibXRkOiBuYW5kOiBicmNtOiBzd2l0Y2ggdG8gbXRkX29vYmxheW91dF9vcHMiKQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYzOiBpbnZlcnQgcGF0Y2ggb3JkZXIK
IHYyOiBleHRlbmQgb3JpZ2luYWwgY29tbWVudAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwppbmRleCBlNGUzY2VlYWMzOGYuLjFjMTA3MDExMWViYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0xMTE2LDExICsxMTE2LDE0IEBAIHN0YXRp
YyBpbnQgYnJjbW5hbmRfaGFtbWluZ19vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgaW50IHNlY3Rpb24sCiAJCWlmICghc2VjdGlvbikgewogCQkJLyoKIAkJCSAqIFNtYWxsLXBh
Z2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hpbGUgbGFyZ2UtcGFnZQotCQkJICogTkFORCB1
c2UgYnl0ZSAwLgorCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KIAkJCSAqLwotCQkJaWYg
KGNmZy0+cGFnZV9zaXplID4gNTEyKQotCQkJCW9vYnJlZ2lvbi0+b2Zmc2V0Kys7Ci0JCQlvb2Jy
ZWdpb24tPmxlbmd0aC0tOworCQkJaWYgKGNmZy0+cGFnZV9zaXplID4gNTEyKSB7CisJCQkJb29i
cmVnaW9uLT5vZmZzZXQgKz0gMjsKKwkJCQlvb2JyZWdpb24tPmxlbmd0aCAtPSAyOworCQkJfSBl
bHNlIHsKKwkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOworCQkJfQogCQl9CiAJfQogCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
