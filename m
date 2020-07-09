Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C09C21B098
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87A6EB81;
	Fri, 10 Jul 2020 07:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAFB6EA7B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f18so1935100wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOFwyA/KeHpSrdpEHkJSq/OdhfI9WWMw9P1g3AHQGKw=;
 b=T4Czs3C6f6XNS5I7SnWmY+8UswejwqxgdF8WGbwSzdU9C3od4s11THuBNl6q7ToVBt
 qKIUWBOc1tZgJIGcWAzD+CPggtiFlXrSg/hTeC4q7NUixjIVyLvRaRH92yMSxhIeU0mU
 en/A+FAHqulAQoOyqdCJSrwrYWxb1X6gNVDWfljZDBVZe34iMixa4B8FHS7UszV81fJI
 Pf78p/EQTKyyssjgtVuAZZg5Xyf2YKJVvblYO+PwxQEpC9qC892uYSPs4VaStTf1yRcj
 lybHYCpSXL36dKMcKiV01EKsq6NqfpKfunp865yFxsRACkJSkZ0z3QyoGClwLadzSoAN
 3I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOFwyA/KeHpSrdpEHkJSq/OdhfI9WWMw9P1g3AHQGKw=;
 b=Yjv/HQ9m72sbehIYKAa8Zdo82hmeZ4IzDGDKM0vhhUEwK0spDVyZmMHF9qS1id+xeN
 ea/xKlcSAs1spX0BndMZFo/G2e6PFF4iOkC+na1iAnMqUUdxr77m6UO9AXiZa79D/MkA
 9NjXP1R3ZBmLjewFyDBQDSoMdVyyDXW0mVYoPtyu+Drtf7rmimoFy1wmNrrhFkrVmnl1
 yrE0Hd5nGNqc1Jg3IY6lFrw0+XOJb4UUNWYtrYpkHfWetbS1PAsDAJZoaZk64I3ISy2K
 gCA83eXMOI9zIKKrbGHr1xCuJYkaIiKku1W+jt0lJQAuCqa2NGCSk/AUrnDQjyvimrwv
 5rGQ==
X-Gm-Message-State: AOAM530m9gu/Qe4FpOqfEuDHbZEPv73evMdgitT7P5RgPVQd7tAXfZ8H
 0wj5F54gJSmFeNYCfDOeLZM=
X-Google-Smtp-Source: ABdhPJyvaIRwfYI3tdberZprFXUuYfO1fIWqAYdaMWC4jYWrQqCTVnhzxV1LgDMR1AE+B8tzK3c64g==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr140330wmj.71.1594303417600; 
 Thu, 09 Jul 2020 07:03:37 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 09/14] drm/panfrost: dynamically alloc regulators
Date: Thu,  9 Jul 2020 16:03:17 +0200
Message-Id: <20200709140322.131320-10-peron.clem@gmail.com>
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

V2Ugd2lsbCBsYXRlciBpbnRyb2R1Y2UgcmVndWxhdG9ycyBtYW5hZ2VkIGJ5IE9QUC4KCk9ubHkg
YWxsb2MgcmVndWxhdG9ycyB3aGVuIGl0J3MgbmVlZGVkLiBUaGlzIGFsc28gaGVscCB1c2UKdG8g
cmVsZWFzZSB0aGUgcmVndWxhdG9ycyBvbmx5IHdoZW4gdGhleSBhcmUgYWxsb2NhdGVkLgoKUmV2
aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+ClJldmlld2VkLWJ5
OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAxNCArKysrKysrKyst
LS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgIDMgKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCmluZGV4IDQ2NGRhMTY0NjM5
OC4uMGIwZmI0NWFlZTgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCkBAIC05MCw5ICs5MCwxMSBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3JlZ3VsYXRvcl9p
bml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCWludCByZXQsIGk7CiAKLQlp
ZiAoV0FSTihwZmRldi0+Y29tcC0+bnVtX3N1cHBsaWVzID4gQVJSQVlfU0laRShwZmRldi0+cmVn
dWxhdG9ycyksCi0JCQkiVG9vIG1hbnkgc3VwcGxpZXMgaW4gY29tcGF0aWJsZSBzdHJ1Y3R1cmUu
XG4iKSkKLQkJcmV0dXJuIC1FSU5WQUw7CisJcGZkZXYtPnJlZ3VsYXRvcnMgPSBkZXZtX2tjYWxs
b2MocGZkZXYtPmRldiwgcGZkZXYtPmNvbXAtPm51bV9zdXBwbGllcywKKwkJCQkJIHNpemVvZigq
cGZkZXYtPnJlZ3VsYXRvcnMpLAorCQkJCQkgR0ZQX0tFUk5FTCk7CisJaWYgKCFwZmRldi0+cmVn
dWxhdG9ycykKKwkJcmV0dXJuIC1FTk9NRU07CiAKIAlmb3IgKGkgPSAwOyBpIDwgcGZkZXYtPmNv
bXAtPm51bV9zdXBwbGllczsgaSsrKQogCQlwZmRldi0+cmVndWxhdG9yc1tpXS5zdXBwbHkgPSBw
ZmRldi0+Y29tcC0+c3VwcGx5X25hbWVzW2ldOwpAQCAtMTE3LDggKzExOSwxMCBAQCBzdGF0aWMg
aW50IHBhbmZyb3N0X3JlZ3VsYXRvcl9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2
KQogCiBzdGF0aWMgdm9pZCBwYW5mcm9zdF9yZWd1bGF0b3JfZmluaShzdHJ1Y3QgcGFuZnJvc3Rf
ZGV2aWNlICpwZmRldikKIHsKLQlyZWd1bGF0b3JfYnVsa19kaXNhYmxlKHBmZGV2LT5jb21wLT5u
dW1fc3VwcGxpZXMsCi0JCQlwZmRldi0+cmVndWxhdG9ycyk7CisJaWYgKCFwZmRldi0+cmVndWxh
dG9ycykKKwkJcmV0dXJuOworCisJcmVndWxhdG9yX2J1bGtfZGlzYWJsZShwZmRldi0+Y29tcC0+
bnVtX3N1cHBsaWVzLCBwZmRldi0+cmVndWxhdG9ycyk7CiB9CiAKIHN0YXRpYyB2b2lkIHBhbmZy
b3N0X3BtX2RvbWFpbl9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCmluZGV4IDJlZmE1OWM5ZDFjNS4u
OTUzZjc1MzZhNzczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2aWNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5oCkBAIC0yMiw3ICsyMiw2IEBAIHN0cnVjdCBwYW5mcm9zdF9qb2I7CiBzdHJ1Y3QgcGFuZnJv
c3RfcGVyZmNudDsKIAogI2RlZmluZSBOVU1fSk9CX1NMT1RTIDMKLSNkZWZpbmUgTUFYX1JFR1VM
QVRPUlMgMgogI2RlZmluZSBNQVhfUE1fRE9NQUlOUyAzCiAKIHN0cnVjdCBwYW5mcm9zdF9mZWF0
dXJlcyB7CkBAIC04MSw3ICs4MCw3IEBAIHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgewogCXZvaWQg
X19pb21lbSAqaW9tZW07CiAJc3RydWN0IGNsayAqY2xvY2s7CiAJc3RydWN0IGNsayAqYnVzX2Ns
b2NrOwotCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhIHJlZ3VsYXRvcnNbTUFYX1JFR1VMQVRP
UlNdOworCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhICpyZWd1bGF0b3JzOwogCXN0cnVjdCBy
ZXNldF9jb250cm9sICpyc3RjOwogCS8qIHBtX2RvbWFpbnMgZm9yIGRldmljZXMgd2l0aCBtb3Jl
IHRoYW4gb25lLiAqLwogCXN0cnVjdCBkZXZpY2UgKnBtX2RvbWFpbl9kZXZzW01BWF9QTV9ET01B
SU5TXTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
