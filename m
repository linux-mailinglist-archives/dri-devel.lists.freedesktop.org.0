Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9051A64A8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8CF89E11;
	Mon, 13 Apr 2020 09:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2A66E0E3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 20:06:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x25so5711138wmc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 13:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zoldyKJXtADkuzgLMxvc+aHQ8la7JVhSLGXOECKmOcc=;
 b=hrjRuhiQBhcZ1WdJ1Gq9N8RInWD2+8L6tzMXKTt9nRC+YJSlhe8o2apD1lBuGHue63
 Gz72gk10Zomzi4uGEfF3sk1XpJPCLdmSGvztUeSx3G8GrSFxCKwtL4OLh4Nou5ySW1HH
 NbtcXX3XCTFKitlpLdHotw/U0MXkWnNWhIVU3/EH+tzgY6BG/FM9cIY0Ztba2yNOkKew
 1S14PgZe1f14Nigk4Q+Vmhmidu2QglqQ4QBLWgKPeGfdufLgIGe2YLL8yxP41aLV/BNw
 1EcNjmXLluI3nk18jkOu3nxiT0sq/SymW2ZYG0wT+LqRc+fjijZuJ1wXbP/V0I1yzIJy
 bxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zoldyKJXtADkuzgLMxvc+aHQ8la7JVhSLGXOECKmOcc=;
 b=siV/DzQyGgR6NZYaupk2w3IIacZl+mpHKPgtzJS9cMlae2WUEjjQQJ1jEI0OcIj9+j
 F+GIjzstj45wHHU97MOmzbwzKSop3Ko+613GRwvK8oPVt9dboFDnvhcPiPH9JforYA1j
 cfDTqSyWghliPDEHqje7IH3LSoAj47029eH7FW5sJPv2yldPI8WfP37Mwb/3LcoStUJV
 bmvoJa3R1ZIZw9BzLld4lyE14UjtZC8sbLa5jtVAuPdlpFfbTyXhGIOEAkHILR3tLu6O
 Tq1OPalyxQoAVyple2cJzYivlINssVXBr6r+uX9P+VUAhZgoDIoX3xpwrruqI5wVB7Vh
 inxQ==
X-Gm-Message-State: AGi0Pua4AzeDwB7/b+0lhhaplL6iuTLVAoazOYR/fXHnJWIU1ezk1wwv
 ahxmsPRpYgOd7qKEJuguYOc=
X-Google-Smtp-Source: APiQypLbsvsk9zLeeFB8Obt5V3v8jpdg3Qf2EvxxzUQlswj5qD7Vw52StvIIPRQTWSewjjjJ1SYvAg==
X-Received: by 2002:a1c:9aca:: with SMTP id c193mr10824862wme.38.1586635606681; 
 Sat, 11 Apr 2020 13:06:46 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id y5sm8712670wru.15.2020.04.11.13.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 13:06:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/2] drm/panfrost: add devfreq regulator support
Date: Sat, 11 Apr 2020 22:06:32 +0200
Message-Id: <20200411200632.4045-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411200632.4045-1-peron.clem@gmail.com>
References: <20200411200632.4045-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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

T1BQIHRhYmxlIGNhbiBkZWZpbmVkIGJvdGggZnJlcXVlbmN5IGFuZCB2b2x0YWdlLgoKUmVnaXN0
ZXIgdGhlIG1hbGkgcmVndWxhdG9yIGlmIGl0IGV4aXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMzQgKysrKysrKysrKysrKysrKysrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IDYyNTQxZjRlZGQ4MS4uMmRjOGUy
MzU1MzU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMK
QEAgLTc4LDEyICs3OCwyNiBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2KQogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZmRldi0+cGRldi0+
ZGV2OwogCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwogCXN0cnVjdCB0aGVybWFsX2Nvb2xpbmdf
ZGV2aWNlICpjb29saW5nOworCWNvbnN0IGNoYXIgKm1hbGkgPSAibWFsaSI7CisJc3RydWN0IG9w
cF90YWJsZSAqb3BwX3RhYmxlID0gTlVMTDsKKworCS8qIFJlZ3VsYXRvciBpcyBvcHRpb25hbCAq
LworCW9wcF90YWJsZSA9IGRldl9wbV9vcHBfc2V0X3JlZ3VsYXRvcnMoZGV2LCAmbWFsaSwgMSk7
CisJaWYgKElTX0VSUihvcHBfdGFibGUpKSB7CisJCXJldCA9IFBUUl9FUlIob3BwX3RhYmxlKTsK
KwkJaWYgKHJldCAhPSAtRU5PREVWKSB7CisJCQlEUk1fREVWX0VSUk9SKGRldiwgIkZhaWxlZCB0
byBzZXQgcmVndWxhdG9yOiAlZFxuIiwgcmV0KTsKKwkJCXJldHVybiByZXQ7CisJCX0KKwl9CisJ
cGZkZXYtPmRldmZyZXEub3BwX3RhYmxlID0gb3BwX3RhYmxlOwogCiAJcmV0ID0gZGV2X3BtX29w
cF9vZl9hZGRfdGFibGUoZGV2KTsKLQlpZiAocmV0ID09IC1FTk9ERVYpIC8qIE9wdGlvbmFsLCBj
b250aW51ZSB3aXRob3V0IGRldmZyZXEgKi8KLQkJcmV0dXJuIDA7Ci0JZWxzZSBpZiAocmV0KQot
CQlyZXR1cm4gcmV0OworCWlmIChyZXQpIHsKKwkJaWYgKHJldCA9PSAtRU5PREVWKSAvKiBPcHRp
b25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVxICovCisJCQlyZXQgPSAwOworCQlnb3RvIGVy
cl9vcHBfcmVnOworCX0KIAogCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZkZXYpOwogCkBAIC0x
MTksNiArMTMzLDEyIEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0
X2RldmljZSAqcGZkZXYpCiBlcnJfb3BwOgogCWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKGRl
dik7CiAKK2Vycl9vcHBfcmVnOgorCWlmIChwZmRldi0+ZGV2ZnJlcS5vcHBfdGFibGUpIHsKKwkJ
ZGV2X3BtX29wcF9wdXRfcmVndWxhdG9ycyhwZmRldi0+ZGV2ZnJlcS5vcHBfdGFibGUpOworCQlw
ZmRldi0+ZGV2ZnJlcS5vcHBfdGFibGUgPSBOVUxMOworCX0KKwogCXJldHVybiByZXQ7CiB9CiAK
QEAgLTEyNiw3ICsxNDYsMTMgQEAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX2Zpbmkoc3RydWN0IHBh
bmZyb3N0X2RldmljZSAqcGZkZXYpCiB7CiAJaWYgKHBmZGV2LT5kZXZmcmVxLmNvb2xpbmcpCiAJ
CWRldmZyZXFfY29vbGluZ191bnJlZ2lzdGVyKHBmZGV2LT5kZXZmcmVxLmNvb2xpbmcpOworCiAJ
ZGV2X3BtX29wcF9vZl9yZW1vdmVfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYpOworCisJaWYgKHBm
ZGV2LT5kZXZmcmVxLm9wcF90YWJsZSkgeworCQlkZXZfcG1fb3BwX3B1dF9yZWd1bGF0b3JzKHBm
ZGV2LT5kZXZmcmVxLm9wcF90YWJsZSk7CisJCXBmZGV2LT5kZXZmcmVxLm9wcF90YWJsZSA9IE5V
TEw7CisJfQogfQogCiB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVzdW1lKHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmljZS5oIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5oCmluZGV4IDA2NzEzODExYjkyYy4uZjZiMGM3NzlkZmU1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCkBAIC04Niw2ICs4Niw3IEBAIHN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgewogCXN0cnVjdCB7CiAJCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwogCQlz
dHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqY29vbGluZzsKKwkJc3RydWN0IG9wcF90YWJs
ZSAqb3BwX3RhYmxlOwogCQlrdGltZV90IGJ1c3lfdGltZTsKIAkJa3RpbWVfdCBpZGxlX3RpbWU7
CiAJCWt0aW1lX3QgdGltZV9sYXN0X3VwZGF0ZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
