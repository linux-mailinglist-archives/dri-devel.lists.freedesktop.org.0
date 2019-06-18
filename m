Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE404B2C1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6AA6E2C4;
	Wed, 19 Jun 2019 07:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x363.google.com (mail-wm1-x363.google.com
 [IPv6:2a00:1450:4864:20::363])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049E6E106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:55 +0000 (UTC)
Received: by mail-wm1-x363.google.com with SMTP id a15so2019152wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uaCCOwT6FdYmvMhllu/QeWwGRVseqHgvjzdBnHOd69M=;
 b=KxVAzzz3yLsR1Mz6hmXG3ig1EKo9itgpJtyzfGMoDFSmWtFwPMcXmjlttMcU5g3zYl
 maCGmTSmy+DjCC4e8hVkleESs2L0RAdfF+GlxIpoAPLawqzrahX+NVPlTtjo2zDP1bjz
 75/d5r1q0lLiKB7+mm97riN6EpOLG53EWSRwkQN7OV0vQGCgEZ0HQ0z11ZGa9jWvoTXP
 Qv9L9q6n5c3FwwwqM7sJ+hC9aN3NYS6q5UVQ5DBjRN52w+JOQ9zH0fXB5tgNP/hLm81g
 uw/+PgIA+dGrT+vVEW4ujiEuCAkNs/fOwfu3km3fZHJ46lLJXjy8w6gpjMXFhTLHC/yk
 YjBQ==
X-Gm-Message-State: APjAAAXMw6e+YlTXN8DOZJORwfEy+lX7CoihZVcDfiP04cPBvKUiaSXc
 ABcNXEBgN7UxH2mScIJedS4opq+pmSjpFv9CCls6HiVJpcx93w==
X-Google-Smtp-Source: APXvYqwVYysIgOjHK+Kva6RmxGWI0gn5iUhuZshGHTaWhSUakRHcy5t1o7CtKGKWq2sYfpNRq6WDuIHsIVt2
X-Received: by 2002:a1c:448b:: with SMTP id r133mr2204309wma.114.1560843713987; 
 Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
 by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From: Marko Kohtala <marko.kohtala@okoko.fi>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] video: ssd1307fb: Handle width and height that are not
 multiple of 8
Date: Tue, 18 Jun 2019 10:41:09 +0300
Message-Id: <20190618074111.9309-5-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=okoko.fi; s=okoko;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uaCCOwT6FdYmvMhllu/QeWwGRVseqHgvjzdBnHOd69M=;
 b=Pfg9Ih+86S3Xtc3Q3MbPoD1yKZf5q9ftjSxkHMFON5uo0EZlqN43AwurFcKUty7P9w
 oKJWvmQbND30gnRuRugdhgCYJVX/nNysALrdP7FDYbwlnWxdlrXHQFhWpS0P1sFwUorl
 LQkN+f3DEabIIVpNYWzasblfkpToaGaIedkas=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Marko Kohtala <marko.kohtala@okoko.fi>,
 Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBkaXNwbGF5cyBoYXZlIGRpbWVuc2lvbnMgdGhhdCBhcmUgbm90IG11bHRpcGxlIG9mIGVp
Z2h0LCBmb3IgZXhhbXBsZQpoZWlnaHQgb2YgMzYsIGJ1dCB0aGUgZHJpdmVyIGRpdmlkZWQgdGhl
IGRpbWVuc2lvbnMgYnkgOC4gRGVmaW5pbmcgZGlzcGxheQp0byB0aGUgbmV4dCBtdWx0aXBsZSBv
ZiA4IGlzIG5vdCBnb29kIGFzIHRoZW4gdGhlIGRpc3BsYXkgcmVnaXN0ZXJzIGdldApjb25maWd1
cmVkIHRvIGRpbWVuc2lvbnMgdGhhdCBkbyBub3QgbWF0Y2guIFRoaXMgY29udHJhZGljdHMgaW50
cnVjdGlvbnMKYnkgc29tZSBkaXNwbGF5IG1hbnVmYWN0dXJlcnMuCgpVc2UgRElWX1JPVU5EX1VQ
IHRvIG11bHRpcGxlIG9mIDggd2hlbiBuZWVkZWQgc28gY29ycmVjdCB2YWx1ZXMgY2FuIGJlCnVz
ZWQuCgpUaGUgc3NkMTMwN2ZiX3VwZGF0ZV9kaXNwbGF5IGJpdCByZW9yZGVyaW5nIHJlY2VpdmVz
IGEgc2ltcGxpZmljYXRpb24gaW4KdGhlIHByb2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBNYXJrbyBL
b2h0YWxhIDxtYXJrby5rb2h0YWxhQG9rb2tvLmZpPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYv
c3NkMTMwN2ZiLmMgfCAzMCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zc2Qx
MzA3ZmIuYwppbmRleCA4NmYyYjc5ZjNlZDUuLjRmNGExYjk5ZDE3ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Nz
ZDEzMDdmYi5jCkBAIC0xNTEsMTAgKzE1MSwxMSBAQCBzdGF0aWMgdm9pZCBzc2QxMzA3ZmJfdXBk
YXRlX2Rpc3BsYXkoc3RydWN0IHNzZDEzMDdmYl9wYXIgKnBhcikKIHsKIAlzdHJ1Y3Qgc3NkMTMw
N2ZiX2FycmF5ICphcnJheTsKIAl1OCAqdm1lbSA9IHBhci0+aW5mby0+c2NyZWVuX2J1ZmZlcjsK
Kwl1bnNpZ25lZCBpbnQgbGluZV9sZW5ndGggPSBwYXItPmluZm8tPmZpeC5saW5lX2xlbmd0aDsK
Kwl1bnNpZ25lZCBpbnQgcGFnZXMgPSBESVZfUk9VTkRfVVAocGFyLT5oZWlnaHQsIDgpOwogCWlu
dCBpLCBqLCBrOwogCi0JYXJyYXkgPSBzc2QxMzA3ZmJfYWxsb2NfYXJyYXkocGFyLT53aWR0aCAq
IHBhci0+aGVpZ2h0IC8gOCwKLQkJCQkgICAgICBTU0QxMzA3RkJfREFUQSk7CisJYXJyYXkgPSBz
c2QxMzA3ZmJfYWxsb2NfYXJyYXkocGFyLT53aWR0aCAqIHBhZ2VzLCBTU0QxMzA3RkJfREFUQSk7
CiAJaWYgKCFhcnJheSkKIAkJcmV0dXJuOwogCkBAIC0xODcsMjIgKzE4OCwyNCBAQCBzdGF0aWMg
dm9pZCBzc2QxMzA3ZmJfdXBkYXRlX2Rpc3BsYXkoc3RydWN0IHNzZDEzMDdmYl9wYXIgKnBhcikK
IAkgKiAgKDUpIEE0IEI0IEM0IEQ0IEU0IEY0IEc0IEg0CiAJICovCiAKLQlmb3IgKGkgPSAwOyBp
IDwgKHBhci0+aGVpZ2h0IC8gOCk7IGkrKykgeworCWZvciAoaSA9IDA7IGkgPCBwYWdlczsgaSsr
KSB7CiAJCWZvciAoaiA9IDA7IGogPCBwYXItPndpZHRoOyBqKyspIHsKKwkJCWludCBtID0gODsK
IAkJCXUzMiBhcnJheV9pZHggPSBpICogcGFyLT53aWR0aCArIGo7CiAJCQlhcnJheS0+ZGF0YVth
cnJheV9pZHhdID0gMDsKLQkJCWZvciAoayA9IDA7IGsgPCA4OyBrKyspIHsKLQkJCQl1MzIgcGFn
ZV9sZW5ndGggPSBwYXItPndpZHRoICogaTsKLQkJCQl1MzIgaW5kZXggPSBwYWdlX2xlbmd0aCAr
IChwYXItPndpZHRoICogayArIGopIC8gODsKLQkJCQl1OCBieXRlID0gKih2bWVtICsgaW5kZXgp
OwotCQkJCXU4IGJpdCA9IGJ5dGUgJiAoMSA8PCAoaiAlIDgpKTsKLQkJCQliaXQgPSBiaXQgPj4g
KGogJSA4KTsKKwkJCS8qIExhc3QgcGFnZSBtYXkgYmUgcGFydGlhbCAqLworCQkJaWYgKGkgKyAx
ID09IHBhZ2VzICYmIHBhci0+aGVpZ2h0ICUgOCkKKwkJCQltID0gcGFyLT5oZWlnaHQgJSA4Owor
CQkJZm9yIChrID0gMDsgayA8IG07IGsrKykgeworCQkJCXU4IGJ5dGUgPSB2bWVtWyg4ICogaSAr
IGspICogbGluZV9sZW5ndGggKworCQkJCQkgICAgICAgaiAvIDhdOworCQkJCXU4IGJpdCA9IChi
eXRlID4+IChqICUgOCkpICYgMTsKIAkJCQlhcnJheS0+ZGF0YVthcnJheV9pZHhdIHw9IGJpdCA8
PCBrOwogCQkJfQogCQl9CiAJfQogCi0Jc3NkMTMwN2ZiX3dyaXRlX2FycmF5KHBhci0+Y2xpZW50
LCBhcnJheSwgcGFyLT53aWR0aCAqIHBhci0+aGVpZ2h0IC8gOCk7CisJc3NkMTMwN2ZiX3dyaXRl
X2FycmF5KHBhci0+Y2xpZW50LCBhcnJheSwgcGFyLT53aWR0aCAqIHBhZ2VzKTsKIAlrZnJlZShh
cnJheSk7CiB9CiAKQEAgLTQzOCw3ICs0NDEsOCBAQCBzdGF0aWMgaW50IHNzZDEzMDdmYl9pbml0
KHN0cnVjdCBzc2QxMzA3ZmJfcGFyICpwYXIpCiAJCXJldHVybiByZXQ7CiAKIAlyZXQgPSBzc2Qx
MzA3ZmJfd3JpdGVfY21kKHBhci0+Y2xpZW50LAotCQkJCSAgcGFyLT5wYWdlX29mZnNldCArIChw
YXItPmhlaWdodCAvIDgpIC0gMSk7CisJCQkJICBwYXItPnBhZ2Vfb2Zmc2V0ICsKKwkJCQkgIERJ
Vl9ST1VORF9VUChwYXItPmhlaWdodCwgOCkgLSAxKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJu
IHJldDsKIApAQCAtNjE4LDcgKzYyMiw3IEBAIHN0YXRpYyBpbnQgc3NkMTMwN2ZiX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJcGFyLT5kY2xrX2RpdiA9IHBhci0+ZGV2aWNlX2lu
Zm8tPmRlZmF1bHRfZGNsa19kaXY7CiAJcGFyLT5kY2xrX2ZycSA9IHBhci0+ZGV2aWNlX2luZm8t
PmRlZmF1bHRfZGNsa19mcnE7CiAKLQl2bWVtX3NpemUgPSBwYXItPndpZHRoICogcGFyLT5oZWln
aHQgLyA4OworCXZtZW1fc2l6ZSA9IERJVl9ST1VORF9VUChwYXItPndpZHRoLCA4KSAqIHBhci0+
aGVpZ2h0OwogCiAJdm1lbSA9ICh2b2lkICopX19nZXRfZnJlZV9wYWdlcyhHRlBfS0VSTkVMIHwg
X19HRlBfWkVSTywKIAkJCQkJZ2V0X29yZGVyKHZtZW1fc2l6ZSkpOwpAQCAtNjQxLDcgKzY0NSw3
IEBAIHN0YXRpYyBpbnQgc3NkMTMwN2ZiX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQs
CiAKIAlpbmZvLT5mYm9wcyA9ICZzc2QxMzA3ZmJfb3BzOwogCWluZm8tPmZpeCA9IHNzZDEzMDdm
Yl9maXg7Ci0JaW5mby0+Zml4LmxpbmVfbGVuZ3RoID0gcGFyLT53aWR0aCAvIDg7CisJaW5mby0+
Zml4LmxpbmVfbGVuZ3RoID0gRElWX1JPVU5EX1VQKHBhci0+d2lkdGgsIDgpOwogCWluZm8tPmZi
ZGVmaW8gPSBzc2QxMzA3ZmJfZGVmaW87CiAKIAlpbmZvLT52YXIgPSBzc2QxMzA3ZmJfdmFyOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
