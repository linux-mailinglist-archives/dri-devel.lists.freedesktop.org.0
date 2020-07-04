Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA9215319
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957FE6E301;
	Mon,  6 Jul 2020 07:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9EB89E8C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s10so35270877wrw.12
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLa/udBRiowVJ35/Uw/nPH/NJx9A1pXdMfcVlQ9GEAU=;
 b=VVl0MBp7pBir+NBNWsZUpHtqsOKb3OiYuCBScYawkUgbIas/8oGM1B+TfZ0PeoVTgg
 3DbA4QlV6xV0+pav9N2+A+rgTrMxGSX3Zqk6WwqFWlAkmllNsI+OCNhmWZtCK0yl5Y+G
 q6r45D+mJVbM+Y0T3aKhGpVEPFwNbz/IUP93462kW+2pAJVhbiM4MAoIim34p3zAbDdP
 OCceF0g7rhBkKYnIAO7CQRkc6KuHG6KePJfWeNDYbUaKzr5y5ap9T7Pn9mL/5l1DZ+zM
 beJwPvMKoPGmXYzAXXg2umCgf9U3vbu81G1kYaGLkAAeFMBCaPX/qe/6tiUbucFVF8wd
 5wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLa/udBRiowVJ35/Uw/nPH/NJx9A1pXdMfcVlQ9GEAU=;
 b=J0p54z8WjPcmtcYXbo1eR90LeSZgIUm8QCt29zI6fAQkYNDV6F6klGu0iMqvDYyAsZ
 MR9BvdKzhxIZ3Aw2TwVr29EH0+MBLllJw8ey7LoOeSlqB+gey7uFf4fq2bQjGkezPYFg
 CzL/iSQN0S+EroJxNGMFuoCU5Y7fHtkuAQTV5e+UOmms2nGV8cgOCi0DNvcorgyqZH7A
 vTLMNmpC2Spov+TYl3kzwszS0BRNAp1A9kTPDAqrJ2VgBclr+k6kb2+MmGT0hyaHluGb
 gpHYSw3gwk4gdxQdYM3FcnoVIFbdLid4TUcFMdGY5l7uxdi+pU/hvivp/1QqUq3h1Cgo
 UP/Q==
X-Gm-Message-State: AOAM533Nba1FW4TMQ91ZwZCHB6DfYs9WdO1qlwff9GcfPd4C18gWPqse
 VpnNhh73cqXFSlgOqxVKUwY=
X-Google-Smtp-Source: ABdhPJzDuEfCwuvlJkpmWNd1MaGX1GIjG8W6x5PL/vM3PbaH17/Rs5W3IFG15toS4gEpArJKEqxkUQ==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr5446186wrv.328.1593858345457; 
 Sat, 04 Jul 2020 03:25:45 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 03/14] drm/panfrost: don't use pfdevfreq.busy_count to know
 if hw is idle
Date: Sat,  4 Jul 2020 12:25:24 +0200
Message-Id: <20200704102535.189647-4-peron.clem@gmail.com>
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

VGhpcyB1c2UgZGV2ZnJlcSB2YXJpYWJsZSB0aGF0IHdpbGwgYmUgbG9jayB3aXRoIHNwaW5sb2Nr
IGluIGZ1dHVyZQpwYXRjaGVzLiBXZSBzaG91bGQgZWl0aGVyIGludHJvZHVjZSBhIGZ1bmN0aW9u
IHRvIGFjY2VzcyB0aGlzIG9uZQpidXQgYXMgZGV2ZnJlcSBpcyBvcHRpb25hbCBsZXQncyBqdXN0
IHJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBn
bWFpbC5jb20+ClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyB8IDQgLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2pvYi5jCmluZGV4IDc5MTRiMTU3MDg0MS4uNjNlMzJhOWYyNzQ5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCkBAIC01ODEsMTAgKzU4MSw2IEBAIGludCBw
YW5mcm9zdF9qb2JfaXNfaWRsZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlzdHJ1
Y3QgcGFuZnJvc3Rfam9iX3Nsb3QgKmpzID0gcGZkZXYtPmpzOwogCWludCBpOwogCi0JLyogQ2hl
Y2sgd2hldGhlciB0aGUgaGFyZHdhcmUgaXMgaWRsZSAqLwotCWlmIChhdG9taWNfcmVhZCgmcGZk
ZXYtPmRldmZyZXEuYnVzeV9jb3VudCkpCi0JCXJldHVybiBmYWxzZTsKLQogCWZvciAoaSA9IDA7
IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspIHsKIAkJLyogSWYgdGhlcmUgYXJlIGFueSBqb2JzIGlu
IHRoZSBIVyBxdWV1ZSwgd2UncmUgbm90IGlkbGUgKi8KIAkJaWYgKGF0b21pY19yZWFkKCZqcy0+
cXVldWVbaV0uc2NoZWQuaHdfcnFfY291bnQpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
