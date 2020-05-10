Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C41CD25E
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17F6E1F9;
	Mon, 11 May 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049EE89FC3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m24so5817590wml.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhYrh9YhlYXknPmBF+ROBsUhxioXF1DIWp34Pf3t1c4=;
 b=uWFCvxF1Ru/RGFcBDvfix2QN6IlvVfJ0XwlpC94V8PK8wf0/7u9FsV9Hx59AqRdgiD
 Zw5rG2gT0hrmXdzL9Wg8t+sIcXdaqmOM32JJEHmBFvhpSNeixDE0AZjR/ftWAwdxBnuc
 aIQzdHgHrQndEauKrELV33RiLhbUzIf5x510r+vtym5PmJpiegUFiSa4oAGXxODnLPzZ
 l2bJ1CVPNeilrCg1fi7i15n3+5YWtXJXjdaJqrRbuiaS52d/M88E6na9EVQbeFODrbtG
 Bno5L3b+KxhcdlT3+RqwJvqxZUJwg94bkW10lihfmyKjNI2I5QFjGZwTi46B08UiNs8I
 Nqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhYrh9YhlYXknPmBF+ROBsUhxioXF1DIWp34Pf3t1c4=;
 b=gaVeVNuclVQA/XIT7ynwozyrjbt+04adMiYO2oB9mx4iTEOxmM8l+zlGpllWzjaPVG
 n2B0TOHM+hjcUVkeprQovGLRU8rUMEZvoDCoNppEWr//Xio28Rk4OrgabPJD76EsVV+6
 eavHSIlzI/HNcSmPIz8KmxC98M6PwxP3kKx5HM2e/jBjS3Q+oYaicfNdwHGzpr1pZdgk
 NqY616D1iZNnkdn5io/j/RnReTnLZBO/Agn02APyyqclOCbkGsfzdajGH6ua5g0jjtEr
 CwpMcQ1/VvHhmLhPLvlQF2V0lKjrFii5YJJJ5MXkj+luB/3k0pTYDtooDTUWFPtQoXWf
 SjPA==
X-Gm-Message-State: AGi0Pub5hX31KZU7YJROIJ9sVeQxnNqVNkMArPINO2asBwBa5RdbZZQw
 hdwaeSLSXCmqn7BsdKEVzos=
X-Google-Smtp-Source: APiQypKjmziT9fWp0qUklBNq8R4p9Hwvegfvv4DkG4skFkpovhpchfUnzNa2oCnZERscnArbLvpCnw==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr26041414wmc.76.1589129748553; 
 Sun, 10 May 2020 09:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 06/15] drm/panfrost: properly handle error in probe
Date: Sun, 10 May 2020 18:55:29 +0200
Message-Id: <20200510165538.19720-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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

SW50cm9kdWNlIGEgYm9vbGVhbiB0byBrbm93IGlmIG9wcCB0YWJsZSBoYXMgYmVlbiBhZGRlZC4K
CldpdGggdGhpcywgd2UgY2FuIGNhbGwgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKCkgaW4gY2FzZSBv
ZiBlcnJvcgphbmQgcmVsZWFzZSB3aGF0IGhhcyBiZWVuIGluaXRpYWxpc2VkLgoKU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMjUgKysrKysrKysrKysrKysr
Ky0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oIHwgIDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IDc4NzUzY2Zi
NTlmYi4uZDkwMDdmNDRiNzcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMKQEAgLTEwMSw2ICsxMDEsNyBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlyZXR1cm4gMDsKIAllbHNlIGlmIChy
ZXQpCiAJCXJldHVybiByZXQ7CisJcGZkZXZmcmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQgPSB0cnVl
OwogCiAJc3Bpbl9sb2NrX2luaXQoJnBmZGV2ZnJlcS0+bG9jayk7CiAKQEAgLTEwOSw4ICsxMTAs
MTAgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpw
ZmRldikKIAljdXJfZnJlcSA9IGNsa19nZXRfcmF0ZShwZmRldi0+Y2xvY2spOwogCiAJb3BwID0g
ZGV2ZnJlcV9yZWNvbW1lbmRlZF9vcHAoZGV2LCAmY3VyX2ZyZXEsIDApOwotCWlmIChJU19FUlIo
b3BwKSkKLQkJcmV0dXJuIFBUUl9FUlIob3BwKTsKKwlpZiAoSVNfRVJSKG9wcCkpIHsKKwkJcmV0
ID0gUFRSX0VSUihvcHApOworCQlnb3RvIGVycl9maW5pOworCX0KIAogCXBhbmZyb3N0X2RldmZy
ZXFfcHJvZmlsZS5pbml0aWFsX2ZyZXEgPSBjdXJfZnJlcTsKIAlkZXZfcG1fb3BwX3B1dChvcHAp
OwpAQCAtMTE5LDggKzEyMiw4IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBh
bmZyb3N0X2RldmljZSAqcGZkZXYpCiAJCQkJCSAgREVWRlJFUV9HT1ZfU0lNUExFX09OREVNQU5E
LCBOVUxMKTsKIAlpZiAoSVNfRVJSKGRldmZyZXEpKSB7CiAJCURSTV9ERVZfRVJST1IoZGV2LCAi
Q291bGRuJ3QgaW5pdGlhbGl6ZSBHUFUgZGV2ZnJlcVxuIik7Ci0JCWRldl9wbV9vcHBfb2ZfcmVt
b3ZlX3RhYmxlKGRldik7Ci0JCXJldHVybiBQVFJfRVJSKGRldmZyZXEpOworCQlyZXQgPSBQVFJf
RVJSKGRldmZyZXEpOworCQlnb3RvIGVycl9maW5pOwogCX0KIAlwZmRldmZyZXEtPmRldmZyZXEg
PSBkZXZmcmVxOwogCkBAIC0xMzEsMTUgKzEzNCwyNSBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9p
bml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlwZmRldmZyZXEtPmNvb2xpbmcg
PSBjb29saW5nOwogCiAJcmV0dXJuIDA7CisKK2Vycl9maW5pOgorCXBhbmZyb3N0X2RldmZyZXFf
ZmluaShwZmRldik7CisJcmV0dXJuIHJldDsKIH0KIAogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX2Zp
bmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiB7CiAJc3RydWN0IHBhbmZyb3N0X2Rl
dmZyZXEgKnBmZGV2ZnJlcSA9ICZwZmRldi0+cGZkZXZmcmVxOwogCi0JaWYgKHBmZGV2ZnJlcS0+
Y29vbGluZykKKwlpZiAocGZkZXZmcmVxLT5jb29saW5nKSB7CiAJCWRldmZyZXFfY29vbGluZ191
bnJlZ2lzdGVyKHBmZGV2ZnJlcS0+Y29vbGluZyk7Ci0JZGV2X3BtX29wcF9vZl9yZW1vdmVfdGFi
bGUoJnBmZGV2LT5wZGV2LT5kZXYpOworCQlwZmRldmZyZXEtPmNvb2xpbmcgPSBOVUxMOworCX0K
KworCWlmIChwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCkgeworCQlkZXZfcG1fb3BwX29m
X3JlbW92ZV90YWJsZSgmcGZkZXYtPnBkZXYtPmRldik7CisJCXBmZGV2ZnJlcS0+b3BwX29mX3Rh
YmxlX2FkZGVkID0gZmFsc2U7CisJfQogfQogCiB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVzdW1l
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZmcmVxLmgKaW5kZXggZTY2Mjk5MDBhNjE4Li5hZGQyMDNjYjAwYzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaApAQCAtMTUsNiAr
MTUsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlOwogc3RydWN0IHBhbmZyb3N0X2RldmZyZXEg
ewogCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwogCXN0cnVjdCB0aGVybWFsX2Nvb2xpbmdfZGV2
aWNlICpjb29saW5nOworCWJvb2wgb3BwX29mX3RhYmxlX2FkZGVkOwogCiAJa3RpbWVfdCBidXN5
X3RpbWU7CiAJa3RpbWVfdCBpZGxlX3RpbWU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
