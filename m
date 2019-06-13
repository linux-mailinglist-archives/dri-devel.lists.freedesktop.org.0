Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA0455BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCE38957D;
	Fri, 14 Jun 2019 07:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346B489B48
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:04:39 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35450 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFz-0003lL-Ts; Thu, 13 Jun 2019 16:03:16 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFt-00008w-Qe; Thu, 13 Jun 2019 16:03:09 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 17/18] drm/armada: use for_each_endpoint_of_node() to walk
 crtc endpoints
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFt-00008w-Qe@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:03:09 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+zQfoXGEdU88esHi4R2Nu34yF6Qen433V86RQonshc=; b=lsaeHZmsZOJVfBU/UYleDvTYH7
 X17A4x2Z+4DdrY4Fu0ssyiOliUIZV2IqPblHYIyDyz1mp8Mi3JMJ0ElnMqeyGDT9JJ2XEm+rGatU+
 yZLbZuUMk45XAU/S4G2GuG2kC0sY/EBPxSd3HhCWKomYap080BGCTvh9ffjtc0lpkQCLOfEzcptSv
 K/G6i77HN6MZoYReUJzptf+chnOLPWECZGeLTbND1vu1mKHQTw7s8/Dxdq6YhQ9Mnh3lb1H90jBam
 HvGusaEM0qpVNRu2i425665o53o8S+9p/STx9ckEbsW9MsYdan5SEouBDwnlJgXArloiyJW9oZiZ7
 eehYY3pw==;
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

UmF0aGVyIHRoYW4gaGF2aW5nIGEgbmVzdGVkIHNldCBvZiBmb3JfZWFjaF9jaGlsZF9vZl9ub2Rl
KCkgd2Fsa2VycywKdXNlIHRoZSBncmFwaCB3YWxrZXIgdG8gaXRlcmF0ZSB0aHJvdWdoIHRoZSBl
bmRwb2ludHMgZm9yIENSVENzLgoKU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsra2Vy
bmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9k
cnYuYyB8IDExICsrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRh
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZHJ2LmMKaW5kZXggMDVmYWI1
Y2I1YzJkLi4xY2ZhYmNkNmE2MjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEv
YXJtYWRhX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Rydi5jCkBA
IC0yMDQsMTEgKzIwNCwxMSBAQCBzdGF0aWMgaW50IGNvbXBhcmVfZGV2X25hbWUoc3RydWN0IGRl
dmljZSAqZGV2LCB2b2lkICpkYXRhKQogfQogCiBzdGF0aWMgdm9pZCBhcm1hZGFfYWRkX2VuZHBv
aW50cyhzdHJ1Y3QgZGV2aWNlICpkZXYsCi0Jc3RydWN0IGNvbXBvbmVudF9tYXRjaCAqKm1hdGNo
LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBvcnQpCisJc3RydWN0IGNvbXBvbmVudF9tYXRjaCAqKm1h
dGNoLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKmRldl9ub2RlKQogewogCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqZXAsICpyZW1vdGU7CiAKLQlmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKHBvcnQsIGVwKSB7CisJ
Zm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9kZShkZXZfbm9kZSwgZXApIHsKIAkJcmVtb3RlID0gb2Zf
Z3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlcCk7CiAJCWlmICghcmVtb3RlIHx8ICFvZl9k
ZXZpY2VfaXNfYXZhaWxhYmxlKHJlbW90ZSkpIHsKIAkJCW9mX25vZGVfcHV0KHJlbW90ZSk7CkBA
IC0yNDIsNyArMjQyLDYgQEAgc3RhdGljIGludCBhcm1hZGFfZHJtX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlpZiAoZGV2LT5wbGF0Zm9ybV9kYXRhKSB7CiAJCWNoYXIg
KipkZXZpY2VzID0gZGV2LT5wbGF0Zm9ybV9kYXRhOwotCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBv
cnQ7CiAJCXN0cnVjdCBkZXZpY2UgKmQ7CiAJCWludCBpOwogCkBAIC0yNTgsMTAgKzI1Nyw4IEBA
IHN0YXRpYyBpbnQgYXJtYWRhX2RybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQlmb3IgKGkgPSAwOyBkZXZpY2VzW2ldOyBpKyspIHsKIAkJCWQgPSBidXNfZmluZF9kZXZp
Y2VfYnlfbmFtZSgmcGxhdGZvcm1fYnVzX3R5cGUsIE5VTEwsCiAJCQkJCQkgICAgZGV2aWNlc1tp
XSk7Ci0JCQlpZiAoZCAmJiBkLT5vZl9ub2RlKSB7Ci0JCQkJZm9yX2VhY2hfY2hpbGRfb2Zfbm9k
ZShkLT5vZl9ub2RlLCBwb3J0KQotCQkJCQlhcm1hZGFfYWRkX2VuZHBvaW50cyhkZXYsICZtYXRj
aCwgcG9ydCk7Ci0JCQl9CisJCQlpZiAoZCAmJiBkLT5vZl9ub2RlKQorCQkJCWFybWFkYV9hZGRf
ZW5kcG9pbnRzKGRldiwgJm1hdGNoLCBkLT5vZl9ub2RlKTsKIAkJCXB1dF9kZXZpY2UoZCk7CiAJ
CX0KIAl9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
