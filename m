Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD37455D8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079D8976D;
	Fri, 14 Jun 2019 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A33789AF3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:03:25 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45364 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFY-0003ke-JM; Thu, 13 Jun 2019 16:02:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFT-00008B-VM; Thu, 13 Jun 2019 16:02:44 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/18] drm/armada: add CRTC mode validation
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFT-00008B-VM@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:43 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=USYGNPsyrLU5XuS+AbM7Xr/tVaBwT7eEBKkr0hsvhdA=; b=Wo5y7ZNeYlDKeXvA8cS/AkCWqT
 EfKNFzsdkyxzrAEbmBPUT8PDBhAWzETqjG3PPsfk9KbKNG4hZQl+qnaQQiHHx0H014lDNGqIfGFeJ
 zEBmEbPUujkZ2hI+ZAMSySd2y06MArX2gmtGiId+l+wTxmeuDGO1i77OMGMwFY/eV6rgaxGj5crI0
 OfMyomR7EQIscUqox3YJwwCZiS169uyZ+MCv3CvQe+H0svQO6W5FAyE3muiEw/dd7ZCvi8s03ZZur
 U/CLLT08ORo1PMFqfJZDzex849w+M1mRYtG33m6uervqRuMK1Gt7PhFPQE8yNMnpm/eicW17TBq+0
 8iSg34Wg==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENSVEMgbW9kZSB2YWxpZGF0aW9uIHRvIHJlamVjdCBtb2RlcyB0aGF0IHRoZSBDUlRDIGRv
ZXMgbm90IHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMu
YyB8IDIwICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYwppbmRleCBkODAyYTZiYzJkOWYu
LmVkY2U3NGY2MDE5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFf
Y3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYwpAQCAtMTY4
LDYgKzE2OCwyNSBAQCBzdGF0aWMgdm9pZCBhcm1hZGFfZHJtX3VwZGF0ZV9nYW1tYShzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpCiAJfQogfQogCitzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgYXJt
YWRhX2RybV9jcnRjX21vZGVfdmFsaWQoc3RydWN0IGRybV9jcnRjICpjcnRjLAorCWNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQoreworCWlmIChtb2RlLT52c2NhbiA+IDEpCisJ
CXJldHVybiBNT0RFX05PX1ZTQ0FOOworCisJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxB
R19EQkxTQ0FOKQorCQlyZXR1cm4gTU9ERV9OT19EQkxFU0NBTjsKKworCWlmIChtb2RlLT5mbGFn
cyAmIERSTV9NT0RFX0ZMQUdfSFNLRVcpCisJCXJldHVybiBNT0RFX0hfSUxMRUdBTDsKKworCWlm
IChtb2RlLT5mbGFncyAmIChEUk1fTU9ERV9GTEFHX0JDQVNUIHwgRFJNX01PREVfRkxBR19QSVhN
VVggfAorCQkJICAgRFJNX01PREVfRkxBR19DTEtESVYyKSkKKwkJcmV0dXJuIE1PREVfQkFEOwor
CisJcmV0dXJuIE1PREVfT0s7Cit9CisKIC8qIFRoZSBtb2RlX2NvbmZpZy5tdXRleCB3aWxsIGJl
IGhlbGQgZm9yIHRoaXMgY2FsbCAqLwogc3RhdGljIGJvb2wgYXJtYWRhX2RybV9jcnRjX21vZGVf
Zml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICptb2RlLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqKQpAQCAtNDk5LDYgKzUxOCw3
IEBAIHN0YXRpYyB2b2lkIGFybWFkYV9kcm1fY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVu
Y3MgYXJtYWRhX2NydGNfaGVscGVyX2Z1bmNzID0geworCS5tb2RlX3ZhbGlkCT0gYXJtYWRhX2Ry
bV9jcnRjX21vZGVfdmFsaWQsCiAJLm1vZGVfZml4dXAJPSBhcm1hZGFfZHJtX2NydGNfbW9kZV9m
aXh1cCwKIAkubW9kZV9zZXRfbm9mYgk9IGFybWFkYV9kcm1fY3J0Y19tb2RlX3NldF9ub2ZiLAog
CS5hdG9taWNfY2hlY2sJPSBhcm1hZGFfZHJtX2NydGNfYXRvbWljX2NoZWNrLAotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
