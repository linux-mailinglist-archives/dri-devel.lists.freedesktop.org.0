Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B49E92D989
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46B589E8C;
	Wed, 29 May 2019 09:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3684989807
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8A991284A2E;
 Wed, 29 May 2019 10:52:55 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 3/4] drm/panfrost: Add an helper to check the GPU generation
Date: Wed, 29 May 2019 11:52:32 +0200
Message-Id: <20190529095233.26277-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529095233.26277-1-boris.brezillon@collabora.com>
References: <20190529095233.26277-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsIG1vZGVscyB3aXRoIGFuIElEID49IDB4MTAwMCBhcmUgQmlmcm9zdCBHUFVzIGZvciBub3cg
KG1pZ2h0IGNoYW5nZQp3aXRoIG5ldyBnZW5zKS4KClN1Z2dlc3RlZC1ieTogQWx5c3NhIFJvc2Vu
endlaWcgPGFseXNzYUByb3Nlbnp3ZWlnLmlvPgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKKiBO
ZXcgcGF0Y2gKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgg
fCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCmluZGV4IDAzMTE2OGY4M2JkMi4uZTg2NTgx
YzRhZjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
aWNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCkBA
IC0xMTAsNiArMTEwLDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IHBhbmZyb3N0X21vZGVsX2NtcChz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgczMyIGlkKQogCXJldHVybiBtYXRjaF9pZCAt
IGlkOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgcGFuZnJvc3RfbW9kZWxfaXNfYmlmcm9zdChz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKK3sKKwlyZXR1cm4gcGFuZnJvc3RfbW9kZWxf
Y21wKHBmZGV2LCAweDEwMDApID49IDA7Cit9CisKIHN0YXRpYyBpbmxpbmUgYm9vbCBwYW5mcm9z
dF9tb2RlbF9lcShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgczMyIGlkKQogewogCXJl
dHVybiAhcGFuZnJvc3RfbW9kZWxfY21wKHBmZGV2LCBpZCk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
