Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E19115B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553EE6EAD1;
	Sat, 17 Aug 2019 15:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id C87FD6E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:05:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; d="scan'208";a="24088316"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:19 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id BB4DA41773C3;
 Thu, 15 Aug 2019 20:05:15 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 6/9] drm: rcar-du: lvds: Fix companion's mode
Date: Thu, 15 Aug 2019 12:04:30 +0100
Message-Id: <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbXBhbmlvbiBlbmNvZGVyIG5lZWRzIHRvIGJlIHRvbGQgdG8gdXNlIHRoZSBzYW1lCm1v
ZGUgYXMgdGhlIHByaW1hcnkgZW5jb2Rlci4KCkZpeGVzOiBlOWU4Nzk4YWI3YjggKCJkcm06IHJj
YXItZHU6IGx2ZHM6IEFkZCBzdXBwb3J0IGZvciBkdWFsLWxpbmsgbW9kZSIpClNpZ25lZC1vZmYt
Ynk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgoKLS0t
CnYxLT52MjoKKiByZXdvcmtlZCBhY2NvcmRpbmcgdG8gTGF1cmVudCdzIGZlZWRiYWNrCgogZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwppbmRleCAz
ZmUwYjg2Li40MWQyOGY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2x2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwpAQCAtNjAz
LDYgKzYwMywxMSBAQCBzdGF0aWMgdm9pZCByY2FyX2x2ZHNfbW9kZV9zZXQoc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwKIAlsdmRzLT5kaXNwbGF5X21vZGUgPSAqYWRqdXN0ZWRfbW9kZTsKIAog
CXJjYXJfbHZkc19nZXRfbHZkc19tb2RlKGx2ZHMpOworCWlmIChsdmRzLT5jb21wYW5pb24pIHsK
KwkJc3RydWN0IHJjYXJfbHZkcyAqY29tcGFuaW9uX2x2ZHMgPSBicmlkZ2VfdG9fcmNhcl9sdmRz
KAorCQkJCQkJCWx2ZHMtPmNvbXBhbmlvbik7CisJCWNvbXBhbmlvbl9sdmRzLT5tb2RlID0gbHZk
cy0+bW9kZTsKKwl9CiB9CiAKIHN0YXRpYyBpbnQgcmNhcl9sdmRzX2F0dGFjaChzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
