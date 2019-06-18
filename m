Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17949BDD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A575D6E11C;
	Tue, 18 Jun 2019 08:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2CA6E113
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:16:54 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AFCF12852D5;
 Tue, 18 Jun 2019 09:16:52 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 3/4] drm/panfrost: Add an helper to check the GPU generation
Date: Tue, 18 Jun 2019 10:16:47 +0200
Message-Id: <20190618081648.17297-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618081648.17297-1-boris.brezillon@collabora.com>
References: <20190618081648.17297-1-boris.brezillon@collabora.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsIG1vZGVscyB3aXRoIGFuIElEID49IDB4MTAwMCBhcmUgQmlmcm9zdCBHUFVzIGZvciBub3cg
KG1pZ2h0IGNoYW5nZQp3aXRoIG5ldyBnZW5zKS4KClN1Z2dlc3RlZC1ieTogQWx5c3NhIFJvc2Vu
endlaWcgPGFseXNzYUByb3Nlbnp3ZWlnLmlvPgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQWx5c3NhIFJv
c2VuendlaWcgPGFseXNzYUByb3Nlbnp3ZWlnLmlvPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBBZGQg
QWx5c3NhJ3MgUi1iCgpDaGFuZ2VzIGluIHYzOgoqIE5ldyBwYXRjaAotLS0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2aWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
aWNlLmgKaW5kZXggMDMxMTY4ZjgzYmQyLi5lODY1ODFjNGFmN2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgKQEAgLTExMCw2ICsxMTAsMTEgQEAgc3RhdGlj
IGlubGluZSBpbnQgcGFuZnJvc3RfbW9kZWxfY21wKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2LCBzMzIgaWQpCiAJcmV0dXJuIG1hdGNoX2lkIC0gaWQ7CiB9CiAKK3N0YXRpYyBpbmxpbmUg
Ym9vbCBwYW5mcm9zdF9tb2RlbF9pc19iaWZyb3N0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2KQoreworCXJldHVybiBwYW5mcm9zdF9tb2RlbF9jbXAocGZkZXYsIDB4MTAwMCkgPj0gMDsK
K30KKwogc3RhdGljIGlubGluZSBib29sIHBhbmZyb3N0X21vZGVsX2VxKHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2LCBzMzIgaWQpCiB7CiAJcmV0dXJuICFwYW5mcm9zdF9tb2RlbF9jbXAo
cGZkZXYsIGlkKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
