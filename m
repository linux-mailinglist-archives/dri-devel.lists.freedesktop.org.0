Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5416F21531F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258046E2E4;
	Mon,  6 Jul 2020 07:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F796E40B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f7so32305724wrw.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ekmXxgc2CJLhUtRJfX6RJbgFcgiu4O269w7FRXLrjM=;
 b=XhrFjlEY5PPJ5atPvo98rUZh1ZQWnHm5Ls6NPL6ZTnGWOAxgiXwXfUtKj4vFQXEkZ1
 sYO5UqWCjprLeI5XG5bD0nfsyMeBD8uZLIaFiE7N5XASwC6BW0zIXcnBBZ0v+wDNdt7P
 SIGro8XEPu8P2ii8FVA2HtRZ48opMJz8RZjXPrvdz4ceT5zPYOFuN7jHfBguQ8sOgFaC
 qDcKZJcoS+C/p/epqdy4cSkgQsD7dBnRa1JBYiYsmZQO1sfzS5Hyl45VzImUOvNxnX7l
 s0ysH9XHR4q+oEBTNOacdVKS54TI587vSIHnjltfSLJv7wd6ILU0ZdX+iqSBe1ck5uM2
 eg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ekmXxgc2CJLhUtRJfX6RJbgFcgiu4O269w7FRXLrjM=;
 b=Fh/w/tecORSX/vGjN0u/yCl89wcLaqeEYDiLKcQ4pctkVl9kKJLQCWEl929XCatYrF
 Z4ltgR8BPeZ8kPIb9inLmA3E3Xqv/AoR5HnJqb51rfhqvBJH4v+tWUOrZPh8JxWehgyB
 hGSWByImlcoIRtexqQlGxWYBGfS5wWJ2qjGRpiT6T8pC0eaFqlhSN35hAfm3X4vbLYBR
 100K5+2FhX3FX7HDyk5TMVcuv30J/PJzdz2POiZrRvKrdhN39Xc7OOXuwo9CK4CZ6r1o
 mAjAyxGxbdlcVNm8fdryK4VewTYy/QZRhLrtJqGkVPbK0top3jVM9qRKAguBX8J3uzlg
 cfsA==
X-Gm-Message-State: AOAM532xiSoy5bpzAqz5AlDMYA/sVff+N9mMFn6KG1/asbKuIzmnMqYw
 wcLoHvuFWQjR6mNNMdJ0jv4=
X-Google-Smtp-Source: ABdhPJy38Ca5rvU97m5F4CdQCK7nkRR1FB9ubCnok0fal6lPP07aDjaptGbQHLPIbee5P1rhdOSDWA==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr11520166wro.245.1593858353105; 
 Sat, 04 Jul 2020 03:25:53 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 10/14] drm/panfrost: add regulators to devfreq
Date: Sat,  4 Jul 2020 12:25:31 +0200
Message-Id: <20200704102535.189647-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
w6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBTdGV2ZW4g
UHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxOSArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyAgfCAxMSArKysrKysrLS0tLQogMyBmaWxlcyBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IGQ5MDA3ZjQ0Yjc3Mi4uZDFlM2U5
ZDAwYTQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMK
QEAgLTkzLDYgKzkzLDcgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJv
c3RfZGV2aWNlICpwZmRldikKIAl1bnNpZ25lZCBsb25nIGN1cl9mcmVxOwogCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZwZmRldi0+cGRldi0+ZGV2OwogCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwor
CXN0cnVjdCBvcHBfdGFibGUgKm9wcF90YWJsZTsKIAlzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2Rl
dmljZSAqY29vbGluZzsKIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSAqcGZkZXZmcmVxID0gJnBm
ZGV2LT5wZmRldmZyZXE7CiAKQEAgLTEwNSw2ICsxMDYsMTkgQEAgaW50IHBhbmZyb3N0X2RldmZy
ZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAogCXNwaW5fbG9ja19pbml0
KCZwZmRldmZyZXEtPmxvY2spOwogCisJb3BwX3RhYmxlID0gZGV2X3BtX29wcF9zZXRfcmVndWxh
dG9ycyhkZXYsIHBmZGV2LT5jb21wLT5zdXBwbHlfbmFtZXMsCisJCQkJCSAgICAgIHBmZGV2LT5j
b21wLT5udW1fc3VwcGxpZXMpOworCWlmIChJU19FUlIob3BwX3RhYmxlKSkgeworCQlyZXQgPSBQ
VFJfRVJSKG9wcF90YWJsZSk7CisJCS8qIENvbnRpbnVlIGlmIHRoZSBvcHRpb25hbCByZWd1bGF0
b3IgaXMgbWlzc2luZyAqLworCQlpZiAocmV0ICE9IC1FTk9ERVYpIHsKKwkJCURSTV9ERVZfRVJS
T1IoZGV2LCAiQ291bGRuJ3Qgc2V0IE9QUCByZWd1bGF0b3JzXG4iKTsKKwkJCWdvdG8gZXJyX2Zp
bmk7CisJCX0KKwl9IGVsc2UgeworCQlwZmRldmZyZXEtPnJlZ3VsYXRvcnNfb3BwX3RhYmxlID0g
b3BwX3RhYmxlOworCX0KKwogCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZkZXZmcmVxKTsKIAog
CWN1cl9mcmVxID0gY2xrX2dldF9yYXRlKHBmZGV2LT5jbG9jayk7CkBAIC0xNTMsNiArMTY3LDEx
IEBAIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2KQogCQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJsZSgmcGZkZXYtPnBkZXYtPmRldik7CiAJ
CXBmZGV2ZnJlcS0+b3BwX29mX3RhYmxlX2FkZGVkID0gZmFsc2U7CiAJfQorCisJaWYgKHBmZGV2
ZnJlcS0+cmVndWxhdG9yc19vcHBfdGFibGUpIHsKKwkJZGV2X3BtX29wcF9wdXRfcmVndWxhdG9y
cyhwZmRldmZyZXEtPnJlZ3VsYXRvcnNfb3BwX3RhYmxlKTsKKwkJcGZkZXZmcmVxLT5yZWd1bGF0
b3JzX29wcF90YWJsZSA9IE5VTEw7CisJfQogfQogCiB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVz
dW1lKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKaW5kZXggMjEwMjY5OTQ0Njg3Li5kYjZlYTQ4ZTIxZjkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaApAQCAtOCwx
MiArOCwxNCBAQAogI2luY2x1ZGUgPGxpbnV4L2t0aW1lLmg+CiAKIHN0cnVjdCBkZXZmcmVxOwor
c3RydWN0IG9wcF90YWJsZTsKIHN0cnVjdCB0aGVybWFsX2Nvb2xpbmdfZGV2aWNlOwogCiBzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlOwogCiBzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSB7CiAJc3RydWN0
IGRldmZyZXEgKmRldmZyZXE7CisJc3RydWN0IG9wcF90YWJsZSAqcmVndWxhdG9yc19vcHBfdGFi
bGU7CiAJc3RydWN0IHRoZXJtYWxfY29vbGluZ19kZXZpY2UgKmNvb2xpbmc7CiAJYm9vbCBvcHBf
b2ZfdGFibGVfYWRkZWQ7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYwppbmRleCAwYjBmYjQ1YWVlODIuLjFiNWZjOTIyMTgyOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwpAQCAtMjIzLDEwICsyMjMsMTMgQEAgaW50IHBh
bmZyb3N0X2RldmljZV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlnb3Rv
IG91dF9jbGs7CiAJfQogCi0JZXJyID0gcGFuZnJvc3RfcmVndWxhdG9yX2luaXQocGZkZXYpOwot
CWlmIChlcnIpIHsKLQkJZGV2X2VycihwZmRldi0+ZGV2LCAicmVndWxhdG9yIGluaXQgZmFpbGVk
ICVkXG4iLCBlcnIpOwotCQlnb3RvIG91dF9kZXZmcmVxOworCS8qIE9QUCB3aWxsIGhhbmRsZSBy
ZWd1bGF0b3JzICovCisJaWYgKCFwZmRldi0+cGZkZXZmcmVxLm9wcF9vZl90YWJsZV9hZGRlZCkg
eworCQllcnIgPSBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7CisJCWlmIChlcnIpIHsK
KwkJCWRldl9lcnIocGZkZXYtPmRldiwgInJlZ3VsYXRvciBpbml0IGZhaWxlZCAlZFxuIiwgZXJy
KTsKKwkJCWdvdG8gb3V0X2RldmZyZXE7CisJCX0KIAl9CiAKIAllcnIgPSBwYW5mcm9zdF9yZXNl
dF9pbml0KHBmZGV2KTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
