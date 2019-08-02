Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803927F703
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 14:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2583B6E029;
	Fri,  2 Aug 2019 12:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9B96E029;
 Fri,  2 Aug 2019 12:40:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w24so33610203plp.2;
 Fri, 02 Aug 2019 05:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNi/nnM9HHWKbRYhA5SJtV0WOL7aCQ6fgci+sI44rYk=;
 b=NbM7UofzAJf8g+Gv5VweX9bJR+gZW86V20vWH5LS7Gwxtyh3io9udj39lgXt1ZZKI8
 HI6124j1QE37bnRDWbdYlI9OQ/pcPHrvliWdEATcqZA+YVFp1etX5QBUWtOiJX4rY4mg
 0F6y7YVrSolWYe/NCQij6FE4Z6MOuv1OSWmqoM09oJ3OwL7IgOpzgCe1uPlX8gbzjjoA
 FTK9YcFwq8YNciIOq60TayRXyYZ+l4sBT45DxFUb0SXt0P35mEfAs1DRcARIQCPaR9ue
 +hrATZ/op/th/G6nSYHUTAUVAH8AtknU3eUAO5C2eDuk8SIK8vEhD9qoO0kwQ6Ii12l3
 6VLg==
X-Gm-Message-State: APjAAAUeYPZEirvkGwhhPTTwrNVIIw6jbyARhDMtOhiJkZbgk+4vdYP9
 Rrhb3Gns9DRfyzZ7aQbIrcoyCzhI
X-Google-Smtp-Source: APXvYqwLpuv8Zki5rxd/68GLoAJDtswRFf3FJLONOZgTh1nMnm+lQT6IbCFFFW/QgYstRBcGrM/HVg==
X-Received: by 2002:a17:902:2ac7:: with SMTP id
 j65mr132309416plb.242.1564749614370; 
 Fri, 02 Aug 2019 05:40:14 -0700 (PDT)
Received: from localhost.localdomain ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id o3sm3978851pje.1.2019.08.02.05.40.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 05:40:12 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH 1/2] i915: convert to new mount API
Date: Fri,  2 Aug 2019 21:39:55 +0900
Message-Id: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNi/nnM9HHWKbRYhA5SJtV0WOL7aCQ6fgci+sI44rYk=;
 b=VuFcTKxPiFikoaOaeaN3wnXTgdC/BrSU7WHN/INuG6RZYN5YDsvvKzcXg8IiYRKKyA
 F2+x1riP9LCT2SOrRYETDLkypkQAa2yYEMMTRRvBgJtpRf3L9YiLnwJpuzGXvgJOl4t/
 3ln3++H3r9Q6kn25Eju2mIvCELCFHrk2Ix6IfZzeDm7oe7YWiAcc+l5ZpHeUTVBtcXUh
 Q/V2DKB7GUmAzrleqpuvFnFik1pBAemExEdZwx3V7nD/9jS6Ah0t0CCA3gAjItR+IqXq
 yUia08u4zRiHbUCqBqxY79YKl4bl/Yzs0febAaa3LmTHBfROyJz9SqxmQsR8hSDn5iNQ
 ULOg==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dG1wZnMgZG9lcyBub3Qgc2V0IC0+cmVtb3VudF9mcygpIGFueW1vcmUgYW5kIGl0cyB1c2VycyBu
ZWVkCnRvIGJlIGNvbnZlcnRlZCB0byBuZXcgbW91bnQgQVBJLgoKIEJVRzoga2VybmVsIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMAogUEY6IHN1cGVy
dmlzb3IgaW5zdHJ1Y3Rpb24gZmV0Y2ggaW4ga2VybmVsIG1vZGUKIFBGOiBlcnJvcl9jb2RlKDB4
MDAxMCkgLSBub3QtcHJlc2VudCBwYWdlCiBSSVA6IDAwMTA6MHgwCiBDb2RlOiBCYWQgUklQIHZh
bHVlLgogQ2FsbCBUcmFjZToKICBpOTE1X2dlbWZzX2luaXQrMHg2ZS8weGEwIFtpOTE1XQogIGk5
MTVfZ2VtX2luaXRfZWFybHkrMHg3Ni8weDkwIFtpOTE1XQogIGk5MTVfZHJpdmVyX3Byb2JlKzB4
MzBhLzB4MTY0MCBbaTkxNV0KICA/IGtlcm5mc19hY3RpdmF0ZSsweDVhLzB4ODAKICA/IGtlcm5m
c19hZGRfb25lKzB4ZGQvMHgxMzAKICBwY2lfZGV2aWNlX3Byb2JlKzB4OWUvMHgxMTAKICByZWFs
bHlfcHJvYmUrMHhjZS8weDIzMAogIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0Yi8weGMwCiAgZGV2
aWNlX2RyaXZlcl9hdHRhY2grMHg0ZS8weDYwCiAgX19kcml2ZXJfYXR0YWNoKzB4NDcvMHhiMAog
ID8gZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg2MC8weDYwCiAgYnVzX2Zvcl9lYWNoX2RldisweDYx
LzB4OTAKICBidXNfYWRkX2RyaXZlcisweDE2Ny8weDFiMAogIGRyaXZlcl9yZWdpc3RlcisweDY3
LzB4YWEKClNpZ25lZC1vZmYtYnk6IFNlcmdleSBTZW5vemhhdHNreSA8c2VyZ2V5LnNlbm96aGF0
c2t5QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5j
IHwgMjggKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1mcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
ZnMuYwppbmRleCAwOTlmMzM5N2FhZGEuLmNmMDViYTcyZGY5ZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1mcy5jCkBAIC03LDE0ICs3LDE3IEBACiAjaW5jbHVkZSA8bGludXgvZnMu
aD4KICNpbmNsdWRlIDxsaW51eC9tb3VudC5oPgogI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4K
KyNpbmNsdWRlIDxsaW51eC9mc19jb250ZXh0Lmg+CiAKICNpbmNsdWRlICJpOTE1X2Rydi5oIgog
I2luY2x1ZGUgImk5MTVfZ2VtZnMuaCIKIAogaW50IGk5MTVfZ2VtZnNfaW5pdChzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqaTkxNSkKIHsKKwlzdHJ1Y3QgZnNfY29udGV4dCAqZmMgPSBOVUxMOwog
CXN0cnVjdCBmaWxlX3N5c3RlbV90eXBlICp0eXBlOwogCXN0cnVjdCB2ZnNtb3VudCAqZ2VtZnM7
CisJYm9vbCBvayA9IHRydWU7CiAKIAl0eXBlID0gZ2V0X2ZzX3R5cGUoInRtcGZzIik7CiAJaWYg
KCF0eXBlKQpAQCAtMzYsMTggKzM5LDI5IEBAIGludCBpOTE1X2dlbWZzX2luaXQoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUpCiAJCXN0cnVjdCBzdXBlcl9ibG9jayAqc2IgPSBnZW1mcy0+
bW50X3NiOwogCQkvKiBGSVhNRTogRGlzYWJsZWQgdW50aWwgd2UgZ2V0IFcvQSBmb3IgcmVhZCBC
VyBpc3N1ZS4gKi8KIAkJY2hhciBvcHRpb25zW10gPSAiaHVnZT1uZXZlciI7Ci0JCWludCBmbGFn
cyA9IDA7Ci0JCWludCBlcnI7CiAKLQkJZXJyID0gc2ItPnNfb3AtPnJlbW91bnRfZnMoc2IsICZm
bGFncywgb3B0aW9ucyk7Ci0JCWlmIChlcnIpIHsKLQkJCWtlcm5fdW5tb3VudChnZW1mcyk7Ci0J
CQlyZXR1cm4gZXJyOworCQlmYyA9IGZzX2NvbnRleHRfZm9yX3JlY29uZmlndXJlKHNiLT5zX3Jv
b3QsIDAsIDApOworCQlpZiAoSVNfRVJSKGZjKSkgeworCQkJb2sgPSBmYWxzZTsKKwkJCWdvdG8g
b3V0OwogCQl9CisKKwkJaWYgKCFmYy0+b3BzLT5wYXJzZV9tb25vbGl0aGljIHx8CisJCQkJZmMt
Pm9wcy0+cGFyc2VfbW9ub2xpdGhpYyhmYywgb3B0aW9ucykpIHsKKwkJCW9rID0gZmFsc2U7CisJ
CQlnb3RvIG91dDsKKwkJfQorCisJCWlmICghZmMtPm9wcy0+cmVjb25maWd1cmUgfHwgZmMtPm9w
cy0+cmVjb25maWd1cmUoZmMpKQorCQkJb2sgPSBmYWxzZTsKIAl9CiAKK291dDoKKwlpZiAoIW9r
KQorCQlwcl9lcnIoImk5MTUgZ2VtZnMgcmVjb25maWd1cmF0aW9uIGZhaWxlZFxuIik7CisJaWYg
KCFJU19FUlJfT1JfTlVMTChmYykpCisJCXB1dF9mc19jb250ZXh0KGZjKTsKIAlpOTE1LT5tbS5n
ZW1mcyA9IGdlbWZzOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
