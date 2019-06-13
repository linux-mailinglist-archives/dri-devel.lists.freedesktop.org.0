Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065B45604
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16A189948;
	Fri, 14 Jun 2019 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56A089AEA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:01:53 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45336 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbREZ-0003j4-NI; Thu, 13 Jun 2019 16:01:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbREY-00006f-FR; Thu, 13 Jun 2019 16:01:46 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/18] drm/armada: fix crtc interlace
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbREY-00006f-FR@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:01:46 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZe73em0KXNvF4FCfbKTyLNP8J30nCWSEC9qrAb+TqI=; b=QHEva45DLznnK1fKvVBMEF8cWU
 yieZlrzOOtJBIXbRR/BJvUFSApwgQZQz+6/2V7aAZ3G7u8neM6KGj8oqXUC8quyJ0xBgxumHJ0W5C
 gJxLzmOSFGdezOIh9joRt9TtCO9Y8U9F/jhfyWNsiwDb0Cg4rCy9nT5oVvJDNCDS8ZNpbqCAsmS4G
 21uKDM9sziUl7E3p1FAc1X9EPxRco7wFRjIJHwlJ/UfOdwbCmTapAIZ79NFJDUzNC880nbmB8cRDo
 TMB1C5LwTY5pc3OHdlsFIlASXknBMs8wHCVv8JNtlbkherkNxuScg7OfgyY2jKHyEcI6qUhYiAIh1
 FsGmoxyg==;
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

V2Ugc3VwcG9ydCBpbnRlcmxhY2UsIGJ1dCB0aGlzIHdhcyBicm9rZW4gd2hlbiB3ZSBjb3VsZCBu
byBsb25nZXIgZ2V0CmEgcmVmIG9uIHRoZSB2YmxhbmsgaW50ZXJydXB0LiAgQXJyYW5nZSB0byBn
ZXQgdGhlIHJlZiBvbiB0aGUgdmJsYW5rCmludGVycnVwdCBhZnRlciB3ZSd2ZSByZS1lbmFibGVk
IHZibGFuaywgYW5kIHB1dCBpdCBiZWZvcmUgd2UgZGlzYWJsZQp0aGUgdmJsYW5rLgoKU2lnbmVk
LW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMgfCAxNSArKysrKysrLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCmluZGV4IGJhNGEzZmFiNzc0NS4uMDliYWRlMTVmNTFj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCkBAIC0yNzgsMTYgKzI3OCw5IEBA
IHN0YXRpYyB2b2lkIGFybWFkYV9kcm1fY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YykKIAogCWFybWFkYV9yZWdfcXVldWVfc2V0KHJlZ3MsIGksIHNjbGssIExDRF9DRkdf
U0NMS19ESVYpOwogCi0JaWYgKGludGVybGFjZWQgXiBkY3J0Yy0+aW50ZXJsYWNlZCkgewotCQlp
ZiAoYWRqLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKQotCQkJZHJtX2NydGNfdmJs
YW5rX2dldCgmZGNydGMtPmNydGMpOwotCQllbHNlCi0JCQlkcm1fY3J0Y192YmxhbmtfcHV0KCZk
Y3J0Yy0+Y3J0Yyk7Ci0JCWRjcnRjLT5pbnRlcmxhY2VkID0gaW50ZXJsYWNlZDsKLQl9Ci0KIAlz
cGluX2xvY2tfaXJxc2F2ZSgmZGNydGMtPmlycV9sb2NrLCBmbGFncyk7CiAKKwlkY3J0Yy0+aW50
ZXJsYWNlZCA9IGludGVybGFjZWQ7CiAJLyogRXZlbiBpbnRlcmxhY2VkL3Byb2dyZXNzaXZlIGZy
YW1lICovCiAJZGNydGMtPnZbMV0uc3B1X3ZfaF90b3RhbCA9IGFkai0+Y3J0Y192dG90YWwgPDwg
MTYgfAogCQkJCSAgICBhZGotPmNydGNfaHRvdGFsOwpAQCAtMzkwLDYgKzM4Myw5IEBAIHN0YXRp
YyB2b2lkIGFybWFkYV9kcm1fY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCiAKIAlEUk1fREVCVUdfS01TKCJbQ1JUQzolZDolc11cbiIsIGNydGMtPmJhc2UuaWQsIGNy
dGMtPm5hbWUpOwogCisJaWYgKG9sZF9zdGF0ZS0+YWRqdXN0ZWRfbW9kZS5mbGFncyAmIERSTV9N
T0RFX0ZMQUdfSU5URVJMQUNFKQorCQlkcm1fY3J0Y192YmxhbmtfcHV0KGNydGMpOworCiAJZHJt
X2NydGNfdmJsYW5rX29mZihjcnRjKTsKIAlhcm1hZGFfZHJtX2NydGNfdXBkYXRlKGRjcnRjLCBm
YWxzZSk7CiAKQEAgLTQzNCw2ICs0MzAsOSBAQCBzdGF0aWMgdm9pZCBhcm1hZGFfZHJtX2NydGNf
YXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJYXJtYWRhX2RybV9jcnRjX3Vw
ZGF0ZShkY3J0YywgdHJ1ZSk7CiAJZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOwogCisJaWYgKGNy
dGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlLmZsYWdzICYgRFJNX01PREVfRkxBR19JTlRFUkxBQ0Up
CisJCVdBUk5fT04oZHJtX2NydGNfdmJsYW5rX2dldChjcnRjKSk7CisKIAlhcm1hZGFfZHJtX2Ny
dGNfcXVldWVfc3RhdGVfZXZlbnQoY3J0Yyk7CiB9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
