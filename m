Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F91CD262
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC84C6E22E;
	Mon, 11 May 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDDA89FCC
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so2040568wru.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBcArp9z+dOkkmJwdzsA1OSuQPmhGv0QOxoFlPBuJwQ=;
 b=Wwq94eZf1awZPhOOpjkFV8onGcsTP4j6JSoLaP1hv/NsRtIKa3v2QYtSzINIdVMh9F
 9gj5aW/rjEbnu43zvkMt5q0Mi3qX3UYW/KTPlRdVCuAMXoJWervwJp2DQza7Vrl8mGd/
 yGgPBiUtYNpHlRsyfgBLkOBi3yTsXsxDj+rECDUwN1aLqQbY+yiyQsu4FR8tauyMS+O6
 P/AEJuLJSWL8WD+wjnBkYhT1IyqpHwIFnDOReKeuw8XRW2RCLvPp7NF7YZYGniIoBH6q
 KyX4poSnD139MRUGIyGlGwn/AZ3xO+vsghXfTPKnL0tOL/BBksP8ee0sxeW/RNec/rpj
 95bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBcArp9z+dOkkmJwdzsA1OSuQPmhGv0QOxoFlPBuJwQ=;
 b=qUU1Bcr0dNzvg98XNIGb8bvmcDf2snsSoetNjFExX8I+z/Ivap5R0hBtFE2A4ymiVr
 mM7f+1g9y+xk4kkv1kPZ+j5zUgnQlPYtXP5fwmq93rmA33gVgHkKbYu/5jHQu0ly+wf5
 R6OFYt847iEPHroivJhwX1PcJj45IZYvU9swEUPjI5VaLZemiAaRdMk6Fit+JZBneNcK
 8sdcyAuJHn40YyLP99rw9g5ZRWO1VYOu+EUZSQt6a51WPwgB7n7UKcK44yVy7bg8B1wt
 Du7Aiv5vmE7O81SoZ61E+EQtKVDMi2cKeUPfJ0m1HS0j0AyzlY2IEW4zRBJsNOe0TrUM
 ob0g==
X-Gm-Message-State: AGi0PubErSatcgEuvJfHWpm83hqkCTGQvD1aEBT8MYo8gCVjucux0YhZ
 7f2KPDucQsL2W0jI0ItJyEI=
X-Google-Smtp-Source: APiQypKYWnQjWfAFe8Sh1wPAmn7ij3fKLm9ouithCNi1zPtZuofz2+9xQFanf+kmHfZ+CzFF3krFgQ==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr14831054wrq.280.1589129752787; 
 Sun, 10 May 2020 09:55:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 10/15] drm/panfrost: add regulators to devfreq
Date: Sun, 10 May 2020 18:55:33 +0200
Message-Id: <20200510165538.19720-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBPUFAgdGFibGVzIHNwZWNpZnkgdm9sdGFnZSBmb3IgZWFjaCBmcmVxdWVuY3kuIERldmZy
ZXEgY2FuCmhhbmRsZSB0aGVzZSByZWd1bGF0b3JzIGJ1dCB0aGV5IHNob3VsZCBiZSBnZXQgb25s
eSAxIHRpbWUgdG8gYXZvaWQKaXNzdWUgYW5kIGtub3cgd2hvIGlzIGluIGNoYXJnZS4KCklmIE9Q
UCB0YWJsZSBpcyBwcm9iZSBkb24ndCBpbml0IHJlZ3VsYXRvci4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggfCAgMiArKwogZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jICB8IDExICsrKysrKystLS0tCiAz
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKaW5kZXggZmNlMjFjNjgyNDE0
Li45ZmZlYTBkNGEwODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZmcmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuYwpAQCAtOTMsNiArOTMsNyBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCXVuc2lnbmVkIGxvbmcgY3VyX2ZyZXE7CiAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBmZGV2LT5wZGV2LT5kZXY7CiAJc3RydWN0IGRldmZyZXEgKmRl
dmZyZXE7CisJc3RydWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlOwogCXN0cnVjdCB0aGVybWFsX2Nv
b2xpbmdfZGV2aWNlICpjb29saW5nOwogCXN0cnVjdCBwYW5mcm9zdF9kZXZmcmVxICpwZmRldmZy
ZXEgPSAmcGZkZXYtPnBmZGV2ZnJlcTsKIApAQCAtMTAyLDYgKzEwMywxOSBAQCBpbnQgcGFuZnJv
c3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCiAJc3Bpbl9s
b2NrX2luaXQoJnBmZGV2ZnJlcS0+bG9jayk7CiAKKwlvcHBfdGFibGUgPSBkZXZfcG1fb3BwX3Nl
dF9yZWd1bGF0b3JzKGRldiwgcGZkZXYtPmNvbXAtPnN1cHBseV9uYW1lcywKKwkJCQkJICAgICAg
cGZkZXYtPmNvbXAtPm51bV9zdXBwbGllcyk7CisJaWYgKElTX0VSUihvcHBfdGFibGUpKSB7CisJ
CXJldCA9IFBUUl9FUlIob3BwX3RhYmxlKTsKKwkJLyogQ29udGludWUgaWYgdGhlIG9wdGlvbmFs
IHJlZ3VsYXRvciBpcyBtaXNzaW5nICovCisJCWlmIChyZXQgIT0gLUVOT0RFVikgeworCQkJRFJN
X0RFVl9FUlJPUihkZXYsICJDb3VsZG4ndCBzZXQgT1BQIHJlZ3VsYXRvcnNcbiIpOworCQkJZ290
byBlcnJfZmluaTsKKwkJfQorCX0gZWxzZSB7CisJCXBmZGV2ZnJlcS0+cmVndWxhdG9yc19vcHBf
dGFibGUgPSBvcHBfdGFibGU7CisJfQorCiAJcmV0ID0gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUo
ZGV2KTsKIAlpZiAocmV0KSB7CiAJCURSTV9ERVZfRVJST1IoZGV2LCAiQ291bGRuJ3QgYWRkIE9Q
UCB0YWJsZVxuIik7CkBAIC0xNTcsNiArMTcxLDExIEBAIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9m
aW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlkZXZfcG1fb3BwX29mX3JlbW92
ZV90YWJsZSgmcGZkZXYtPnBkZXYtPmRldik7CiAJCXBmZGV2ZnJlcS0+b3BwX29mX3RhYmxlX2Fk
ZGVkID0gZmFsc2U7CiAJfQorCisJaWYgKHBmZGV2ZnJlcS0+cmVndWxhdG9yc19vcHBfdGFibGUp
IHsKKwkJZGV2X3BtX29wcF9wdXRfcmVndWxhdG9ycyhwZmRldmZyZXEtPnJlZ3VsYXRvcnNfb3Bw
X3RhYmxlKTsKKwkJcGZkZXZmcmVxLT5yZWd1bGF0b3JzX29wcF90YWJsZSA9IE5VTEw7CisJfQog
fQogCiB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVzdW1lKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2Ug
KnBmZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKaW5k
ZXggYWRkMjAzY2IwMGMyLi4zNDdjZGU0Nzg2Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmZyZXEuaApAQCAtOCwxMiArOCwxNCBAQAogI2luY2x1ZGUgPGxpbnV4
L2t0aW1lLmg+CiAKIHN0cnVjdCBkZXZmcmVxOworc3RydWN0IG9wcF90YWJsZTsKIHN0cnVjdCB0
aGVybWFsX2Nvb2xpbmdfZGV2aWNlOwogCiBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlOwogCiBzdHJ1
Y3QgcGFuZnJvc3RfZGV2ZnJlcSB7CiAJc3RydWN0IGRldmZyZXEgKmRldmZyZXE7CisJc3RydWN0
IG9wcF90YWJsZSAqcmVndWxhdG9yc19vcHBfdGFibGU7CiAJc3RydWN0IHRoZXJtYWxfY29vbGlu
Z19kZXZpY2UgKmNvb2xpbmc7CiAJYm9vbCBvcHBfb2ZfdGFibGVfYWRkZWQ7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCA2N2VlZGY2NGU4MmQuLjhi
MTdmYjJlMzM2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2Uu
YwpAQCAtMjIyLDEwICsyMjIsMTMgQEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVjdCBw
YW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlnb3RvIGVycl9vdXQwOwogCX0KIAotCWVyciA9IHBh
bmZyb3N0X3JlZ3VsYXRvcl9pbml0KHBmZGV2KTsKLQlpZiAoZXJyKSB7Ci0JCWRldl9lcnIocGZk
ZXYtPmRldiwgInJlZ3VsYXRvciBpbml0IGZhaWxlZCAlZFxuIiwgZXJyKTsKLQkJZ290byBlcnJf
b3V0MTsKKwkvKiBPUFAgd2lsbCBoYW5kbGUgcmVndWxhdG9ycyAqLworCWlmICghcGZkZXYtPnBm
ZGV2ZnJlcS5vcHBfb2ZfdGFibGVfYWRkZWQpIHsKKwkJZXJyID0gcGFuZnJvc3RfcmVndWxhdG9y
X2luaXQocGZkZXYpOworCQlpZiAoZXJyKSB7CisJCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJyZWd1
bGF0b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7CisJCQlnb3RvIGVycl9vdXQxOworCQl9CiAJ
fQogCiAJZXJyID0gcGFuZnJvc3RfcmVzZXRfaW5pdChwZmRldik7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
