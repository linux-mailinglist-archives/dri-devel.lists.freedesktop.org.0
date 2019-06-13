Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F0A435A3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EDB8992E;
	Thu, 13 Jun 2019 11:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98D8992E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:45:25 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FE9C21743;
 Thu, 13 Jun 2019 11:45:24 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:45:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] host1x: debugfs_create_dir() can never return NULL
Message-ID: <20190613114522.GB13119@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560426325;
 bh=uwavyTL+MUL4XML+n5pNFVCFkXznzpr7RDurYmJRj6Y=;
 h=Date:From:To:Cc:Subject:From;
 b=lFZ5sZsSCddNtSznPyDu/AIADfVGwapHZHo9abdVrZ2aO7MZcnE3Vx2haW26yRaKd
 xzXR0FxKExKw3bBRS3z6hCULp8aeChJ3TmtPAktG/Q2VFbQHrKeA2WkoEHXAs6vleR
 jHNCMIaiu6HCatII2pfVDzgQZSlBcsyUbmX21VnQ=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayBmb3IgYSB2YWx1ZSB0aGF0IGNhbiBuZXZlciBo
YXBwZW4uICBObyBuZWVkCnRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgYWxsIGFueXdheSwgYXMg
YW55IGRlYnVnZnMgY2FsbCBjYW4gdGFrZSB0aGUKcmVzdWx0IG9mIHRoaXMgZnVuY3Rpb24gYXMg
YW4gb3B0aW9uIGp1c3QgZmluZS4KCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgt
dGVncmFAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVn
LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYwpp
bmRleCAzMjllNGEzZDhhZTcuLjZjNWVlM2UzOWRjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
aG9zdDF4L2RlYnVnLmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMKQEAgLTE3MSw5
ICsxNzEsNiBAQCBzdGF0aWMgdm9pZCBob3N0MXhfZGVidWdmc19pbml0KHN0cnVjdCBob3N0MXgg
Kmhvc3QxeCkKIHsKIAlzdHJ1Y3QgZGVudHJ5ICpkZSA9IGRlYnVnZnNfY3JlYXRlX2RpcigidGVn
cmEtaG9zdDF4IiwgTlVMTCk7CiAKLQlpZiAoIWRlKQotCQlyZXR1cm47Ci0KIAkvKiBTdG9yZSB0
aGUgY3JlYXRlZCBlbnRyeSAqLwogCWhvc3QxeC0+ZGVidWdmcyA9IGRlOwogCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
