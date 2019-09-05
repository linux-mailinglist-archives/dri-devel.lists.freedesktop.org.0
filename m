Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5872AB2E0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADA56E17B;
	Fri,  6 Sep 2019 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C72E6E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i18so1664565pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MSiwBcSQD+D+YdS5Q0qHybng0VxB5Rm8vXeXQFjLMZc=;
 b=tTX9sEOIW7vajy3M5ReRW6JNpiMJwiPQooWzyJn4acqi0Z6Dnm2Diny6/YH73iVO1A
 z8QrKCPtSSFV6naKAcWEFlqGS93DONl1o9pG7MphChXI3ZqYkk1sadCu28iwQPsKebAs
 QdkpQUG237K8jFlWJlCY5k+YO8iUwbRtrZQ+MH6jgLfH7Wr+8o/DQXwvkaFXvnAswpp/
 4tT4RrgGrQLN8aEtFXR887tOVsDjd8+p5La8xinW7j86ppEbSuPu5VCPIBkDevHQoiFN
 UdGlEli7Z73Cd1XjnHnq6rSgf5MZ2ihpnNUZ51+ZdWn3YS4ZVVq/j4264PM24OwHlGEn
 PJgA==
X-Gm-Message-State: APjAAAWUU20TQvj63YWhZIcfUkGjoNHN23/ifoy+j64WVDr8h6iALfYl
 TIE8xHJBvg/PvKtMw6kxHt34wQ==
X-Google-Smtp-Source: APXvYqwx6+407C9x94FJoPzSVHCP0t2Zdj+mPwGij0zS69UFxmlYHwYXWRRcMX8TRc0mw6jEYgImGw==
X-Received: by 2002:a65:684c:: with SMTP id q12mr3654124pgt.405.1567700283561; 
 Thu, 05 Sep 2019 09:18:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:03 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 02/18] PCI: dra7xx: Fix legacy INTD IRQ handling
Date: Thu,  5 Sep 2019 10:17:43 -0600
Message-Id: <20190905161759.28036-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MSiwBcSQD+D+YdS5Q0qHybng0VxB5Rm8vXeXQFjLMZc=;
 b=O3tNCt/W9wLVtkbdnd5ZHoteegcojqCr7hKVqHkZxaUlxVn/YzfA6HZZ40nBdnkoAO
 ZhrB0iw1Uc7D91gKUNEFUts4aaIwRfLc9HFFMibqH7dcc8fRUXz52KMfGwZDlccDJJiE
 RKX9AyFqS2JsIHjGGXMBX/BZ1YMB9oSdcvYb1l/YwNtkOv1/bY7a0taZGatIUTZLB8B5
 qoHjnHc9HvsJyTbTAEzBV36syWkgm7Xqp77PJV2mZ8WayBu5mJr3U5qaAjISS8G7GYPD
 EdmiI92amAdqbvyv4IrbpfYnerC9XFLioXTmFRbJMwAJ7YCYhVi9YGHLHFzUt0cn8dd8
 c2lQ==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlnbmVzaCBSIDx2aWduZXNockB0aS5jb20+Cgpjb21taXQgNTI0ZDU5ZjZlMzBhYWI1
YjYxOGRhNTVlNjA0YzgwMmNjZDgzZTcwOCB1cHN0cmVhbQoKTGVnYWN5IElOVEQgSVJRIGhhbmRs
aW5nIGlzIGJyb2tlbiBvbiBkcmE3eHggZHVlIHRvIGZhY3QgdGhhdCBkcml2ZXIKdXNlcyBod2ly
cSBpbiByYW5nZSBvZiAxLTQgZm9yIElOVEEsIElOVEQgd2hlcmVhcyBJUlEgZG9tYWluIGlzIG9m
IHNpemUKNCB3aGljaCBpcyBudW1iZXJlZCAwLTMuIFRoZXJlZm9yZSB3aGVuIElOVEQgSVJRIGxp
bmUgaXMgdXNlZCB3aXRoCnBjaS1kcmE3eHggZHJpdmVyIGZvbGxvd2luZyB3YXJuaW5nIGlzIHNl
ZW46CgogICAgICAgV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCBrZXJuZWwvaXJxL2lycWRvbWFp
bi5jOjM0MiBpcnFfZG9tYWluX2Fzc29jaWF0ZSsweDEyYy8weDFjNAogICAgICAgZXJyb3I6IGh3
aXJxIDB4NCBpcyB0b28gbGFyZ2UgZm9yIGR1bW15CgpGaXggdGhpcyBieSB1c2luZyBwY2lfaXJx
ZF9pbnR4X3hsYXRlKCkgaGVscGVyIHRvIHRyYW5zbGF0ZSB0aGUgSU5UeCAxLTQKcmFuZ2UgaW50
byB0aGUgMC0zIGFzIGRvbmUgaW4gb3RoZXIgUENJZSBkcml2ZXJzLgoKU3VnZ2VzdGVkLWJ5OiBC
am9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpSZXBvcnRlZC1ieTogQ2hyaXMgV2Vs
Y2ggPENocmlzLldlbGNoQHZpYXZpc29sdXRpb25zLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlnbmVz
aCBSIDx2aWduZXNockB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IExvcmVuem8gUGllcmFsaXNpIDxs
b3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tPgpBY2tlZC1ieTogS2lzaG9uIFZpamF5IEFicmFoYW0g
SSA8a2lzaG9uQHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1
LnBvaXJpZXJAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3BjaS9kd2MvcGNpLWRyYTd4eC5jIHwg
MyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9kd2MvcGNpLWRyYTd4eC5jIGIvZHJpdmVycy9wY2kvZHdj
L3BjaS1kcmE3eHguYwppbmRleCA2MzA1MmM1ZTVmODIuLjdmNWRmYTE2OWQwZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wY2kvZHdjL3BjaS1kcmE3eHguYworKysgYi9kcml2ZXJzL3BjaS9kd2MvcGNp
LWRyYTd4eC5jCkBAIC0yMjcsNiArMjI3LDcgQEAgc3RhdGljIGludCBkcmE3eHhfcGNpZV9pbnR4
X21hcChzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLCB1bnNpZ25lZCBpbnQgaXJxLAogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGlycV9kb21haW5fb3BzIGludHhfZG9tYWluX29wcyA9IHsKIAkubWFw
ID0gZHJhN3h4X3BjaWVfaW50eF9tYXAsCisJLnhsYXRlID0gcGNpX2lycWRfaW50eF94bGF0ZSwK
IH07CiAKIHN0YXRpYyBpbnQgZHJhN3h4X3BjaWVfaW5pdF9pcnFfZG9tYWluKHN0cnVjdCBwY2ll
X3BvcnQgKnBwKQpAQCAtMjcwLDcgKzI3MSw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkcmE3eHhf
cGNpZV9tc2lfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqYXJnKQogCWNhc2UgSU5UQzoKIAlj
YXNlIElOVEQ6CiAJCWdlbmVyaWNfaGFuZGxlX2lycShpcnFfZmluZF9tYXBwaW5nKGRyYTd4eC0+
aXJxX2RvbWFpbiwKLQkJCQkJCSAgICBmZnMocmVnKSkpOworCQkJCQkJICAgIGZmcyhyZWcpIC0g
MSkpOwogCQlicmVhazsKIAl9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
