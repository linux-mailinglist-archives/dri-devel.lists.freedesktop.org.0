Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB7B18DD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824126EE9F;
	Fri, 13 Sep 2019 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DB46EE36
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 21:33:52 +0000 (UTC)
Received: from p200300ccff1554001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff15:5400:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i8Wim-0006Rr-Ih; Thu, 12 Sep 2019 23:33:46 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i8Wim-0006Jr-AP; Thu, 12 Sep 2019 23:33:44 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v4 2/2] backlight: lm3630a: add an enable gpio for the HWEN pin
Date: Thu, 12 Sep 2019 23:32:57 +0200
Message-Id: <20190912213257.24147-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912213257.24147-1-andreas@kemnade.info>
References: <20190912213257.24147-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ry3rTAwYOrmDl9OdvOy1DjyuQCzbDXcHgFV8Rl+fzx8=; b=a7dW65RnDXHgHqP7ooBZKmtatL
 SPVOUgeWPI+a6fgPKsCokUeMkuUtKjr3jl1CYciPwQfdyIsvHvRzmGfS7USJlEk0H3LmraufxTCYX
 qKt6Dzcgl+jdTBoTViG2P2pytxqaY6+PxsdfK9Zk1c5g2NENvBBmyC5F6LYsVDzl1N7U=;
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
Cc: Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIG5vdyBqdXN0IGVuYWJsZSBpdCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24gdG8gYWxsb3cgaTJj
CmFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSByZWdpc3RlciB2YWx1
ZXMKdG8gZGVmYXVsdCBhbmQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgZG9lcyBub3QgZ2l2
ZQpwb3dlciBzYXZpbmdzLgoKVGVzdGVkIG9uIEtvYm8gQ2xhcmEgSEQuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgpSZXZpZXdlZC1ieTogRGFu
IE11cnBoeSA8ZG11cnBoeUB0aS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRh
bmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgotLS0KY2hhbmdlcyBpbiB2MjoKLSBzaW1wbGlmaWNh
dGlvbgotIGNvcnJlY3QgZ3BpbyBkaXJlY3Rpb24gaW5pdGlhbGlzYXRpb24KCmNoYW5nZXMgaW4g
djM6Ci0gcmVtb3ZlZCBsZWdhY3kgaW5jbHVkZQoKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xt
MzYzMGFfYmwuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIGIvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCmluZGV4IDhmODRmMzY4NGYwNC4uZDll
NjdiOWIyNTcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2Js
LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCkBAIC0xMiw2ICsx
Miw3IEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVy
cnVwdC5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgorI2luY2x1ZGUgPGxpbnV4L2dwaW8v
Y29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9wd20uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kYXRhL2xtMzYzMGFfYmwuaD4KIApAQCAtNDgsNiArNDksNyBAQCBzdHJ1Y3QgbG0zNjMw
YV9jaGlwIHsKIAlzdHJ1Y3QgbG0zNjMwYV9wbGF0Zm9ybV9kYXRhICpwZGF0YTsKIAlzdHJ1Y3Qg
YmFja2xpZ2h0X2RldmljZSAqYmxlZGE7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsZWRi
OworCXN0cnVjdCBncGlvX2Rlc2MgKmVuYWJsZV9ncGlvOwogCXN0cnVjdCByZWdtYXAgKnJlZ21h
cDsKIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtZDsKIH07CkBAIC01MzUsNiArNTM3LDEzIEBAIHN0
YXRpYyBpbnQgbG0zNjMwYV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCX0KIAlw
Y2hpcC0+cGRhdGEgPSBwZGF0YTsKIAorCXBjaGlwLT5lbmFibGVfZ3BpbyA9IGRldm1fZ3Bpb2Rf
Z2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgImVuYWJsZSIsCisJCQkJCQlHUElPRF9PVVRfSElH
SCk7CisJaWYgKElTX0VSUihwY2hpcC0+ZW5hYmxlX2dwaW8pKSB7CisJCXJ2YWwgPSBQVFJfRVJS
KHBjaGlwLT5lbmFibGVfZ3Bpbyk7CisJCXJldHVybiBydmFsOworCX0KKwogCS8qIGNoaXAgaW5p
dGlhbGl6ZSAqLwogCXJ2YWwgPSBsbTM2MzBhX2NoaXBfaW5pdChwY2hpcCk7CiAJaWYgKHJ2YWwg
PCAwKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
