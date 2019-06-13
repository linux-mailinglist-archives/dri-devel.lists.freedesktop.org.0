Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C5455B8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8953989467;
	Fri, 14 Jun 2019 07:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68A389AEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:03:18 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45362 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFT-0003kV-1A; Thu, 13 Jun 2019 16:02:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFO-000084-Ry; Thu, 13 Jun 2019 16:02:38 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/18] drm/armada: add drm_atomic_helper_shutdown() call in
 tear-down
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFO-000084-Ry@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:38 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lF+gnhKsU2lh2tVvGjfDNXWZdZUkgpiY1GHVUhZ5kmo=; b=YyRNU/HkdGMzLmb5s+HpHYqLLo
 AViyJGP5Hfx2okMa4tuhHtFKoqkjKgOQidFuq/hTRMYWyXh8vJ7xBp/gfIh3Mt1JpQ5YSvJxoRr4Y
 Qg3jcCetuu2RWlhnZgN7ckYwOanqF6lTHxY2LaPp+ig0X6JxR2cyqbp4+glchKdYM7p8u8+asYPR6
 J8vC2DDCkCzvzyPGheLHJiixLR4h/KEwAoqCLR1g4/W7B0KmJFPHffNoLVXZNShknteI4dlnDOsWS
 w80UMA0QE3QOUYUjrZTQK2oJR7Cz8L17m59mS0wzdRitRbOy3PjKeNjPOpvfdEa/H9Seoe2nHC512
 UDIblghg==;
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

RW5zdXJlIHRoYXQgdGhlIGhhcmR3YXJlIGlzIGRpc2FibGVkIHByaW9yIHRvIHRlYXJpbmcgZG93
biB0aGUgbW9kZXNldApzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsr
a2VybmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFk
YV9kcnYuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm1hZGEvYXJtYWRhX2Rydi5jCmluZGV4IGU2NjBjNWNhNTJhZS4uZTUyNGJmZmYxYzQ5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYwpAQCAtMTcxLDYgKzE3MSw4IEBAIHN0YXRp
YyB2b2lkIGFybWFkYV9kcm1fdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAogCWRybV9kZXZf
dW5yZWdpc3RlcigmcHJpdi0+ZHJtKTsKIAorCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKCZw
cml2LT5kcm0pOworCiAJY29tcG9uZW50X3VuYmluZF9hbGwoZGV2LCAmcHJpdi0+ZHJtKTsKIAog
CWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCZwcml2LT5kcm0pOwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
