Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE821B0A0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C79D6EB83;
	Fri, 10 Jul 2020 07:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B0D6EA77
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so2536337wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRj3Oh7sZBJWwDgWc3ORgJ0pvlwZ3+3t0oGyKYtF1AQ=;
 b=TvqytnKA8EMxKSNy7l2um5FuNdy3SYJ1dCG/7d4j6F6McuYKM8i2ZJD6vKXk0zi0sW
 iLOnpHvZFdRKvuQ4F/qk2i4hnaCpqz3S+KTaObiu/vxoojV/loemRU+qqb69JvOiKPDP
 L9xNxHrXw8FYaQ2Qu+2GrfYO2+fFLb7lmV+omk+L5cNjBloyV2TtY/zbzYyBYQnFimYN
 8AyZi1sj7XAKYvMWS2Bioq/QOag3KODrknXJbFSNxV1V8A4z1fTwFOLHwC1SyhPGv+bZ
 Ml24pU2qObO2sXH93W147qiqJXbCXO17gVDejiU3pLSkOldsS0DL7DUgMX1yuOwiNtJL
 7Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRj3Oh7sZBJWwDgWc3ORgJ0pvlwZ3+3t0oGyKYtF1AQ=;
 b=XUlHswMvUOpENeTINUx1jMLmRAy6bnipb7ERSPV0SoIyVbflDQvMLAhjrlxQJo/c48
 PC0dLiuXMcmhveo9KDiVnSNz1Cp7HVA4IJVeh7NJxaP4p21AIk8AV0vc4fKZa0ioO77E
 8kXvM4l+rn1kilGQ/B4awlfiZA2yD+8YCnisAkAomh5WbEFlyeH4Az39BIqEjgEqAZzM
 dG5D7VpFijxNPZU/CF+suXsw9W5ugEwyb9W52CrC6oOLd2BYmwPYmsEE90XIQofKFEqQ
 FYF+S0idsnWKTKehq0ZVb4dQNlMLUq1Mo2rI617qSkzrBDD+r0xicAOik6PDUsPSThfh
 wftw==
X-Gm-Message-State: AOAM532WMgdKRo1ZccQXmI86EVkxDvoINhwYoZ4Zj4v7kCO7XMyr5aW5
 NswUUrd258pgP9Ohg1jhHBk=
X-Google-Smtp-Source: ABdhPJw84FXJpRMyrNsB+Uk7XKJyvE///uOAMmssgYl7VQxKTPBERcN45fyPtDnuQOC7hHl3ZBZChg==
X-Received: by 2002:a5d:420e:: with SMTP id n14mr67522767wrq.164.1594303413447; 
 Thu, 09 Jul 2020 07:03:33 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 06/14] drm/panfrost: properly handle error in probe
Date: Thu,  9 Jul 2020 16:03:14 +0200
Message-Id: <20200709140322.131320-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
ZiBlcnJvcgphbmQgcmVsZWFzZSB3aGF0IGhhcyBiZWVuIGluaXRpYWxpc2VkLgoKUmV2aWV3ZWQt
Ynk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbHlz
c2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KU2lnbmVkLW9m
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
dC9wYW5mcm9zdF9kZXZmcmVxLmgKaW5kZXggMzM5MmRmMTAyMGJlLi4yMTAyNjk5NDQ2ODcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaApAQCAtMTUsNiAr
MTUsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlOwogc3RydWN0IHBhbmZyb3N0X2RldmZyZXEg
ewogCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwogCXN0cnVjdCB0aGVybWFsX2Nvb2xpbmdfZGV2
aWNlICpjb29saW5nOworCWJvb2wgb3BwX29mX3RhYmxlX2FkZGVkOwogCiAJa3RpbWVfdCBidXN5
X3RpbWU7CiAJa3RpbWVfdCBpZGxlX3RpbWU7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
