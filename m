Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA41763A4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 20:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449B26E7FE;
	Mon,  2 Mar 2020 19:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C806E81C;
 Mon,  2 Mar 2020 19:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 70F14FB05;
 Mon,  2 Mar 2020 20:13:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 993ETPkw1lj8; Mon,  2 Mar 2020 20:13:44 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9E2B84048C; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/etnaviv: Ignore MC when checking runtime suspend
 idleness
Date: Mon,  2 Mar 2020 20:13:35 +0100
Message-Id: <54839dc5a523a63344c9b53cc4314ee96ef9d5b8.1583176306.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583176306.git.agx@sigxcpu.org>
References: <cover.1583176306.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGF0IHJ1bnRpbWUgc3VzcGVuZCBpcyBvZnRlbiBibG9ja2VkIGR1ZSB0bwpldG5h
dml2X2dwdV9ycG1fc3VzcGVuZCgpIHJldHVybmluZyAtRUJVU1kgc2luY2UgdGhlIEZFIHNlZW1z
IHRvIHRyaWdnZXIKdGhlIE1DIGluIGl0cyBpZGxlIGxvb3AuCgpJZ25vcmluZyB0aGUgTUMgYml0
IG1ha2VzIHRoZSBHUFUgc3VzcGVuZCBhcyBleHBlY3RlZC4gVGhpcyB3YXMgdGVzdGVkCm9uIEdD
NzAwMC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDUgKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZ3B1LmMKaW5kZXggMTg3ZGU2MTBiMzI1Li5kYTI0ZTQzM2Y4MmEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwpAQCAtMTgyMCw4ICsxODIwLDkgQEAg
c3RhdGljIGludCBldG5hdml2X2dwdV9ycG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJ
aWYgKGF0b21pY19yZWFkKCZncHUtPnNjaGVkLmh3X3JxX2NvdW50KSkKIAkJcmV0dXJuIC1FQlVT
WTsKIAotCS8qIENoZWNrIHdoZXRoZXIgdGhlIGhhcmR3YXJlIChleGNlcHQgRkUpIGlzIGlkbGUg
Ki8KLQltYXNrID0gZ3B1LT5pZGxlX21hc2sgJiB+VklWU19ISV9JRExFX1NUQVRFX0ZFOworCS8q
IENoZWNrIHdoZXRoZXIgdGhlIGhhcmR3YXJlIChleGNlcHQgRkUgYW5kIE1DKSBpcyBpZGxlICov
CisJbWFzayA9IGdwdS0+aWRsZV9tYXNrICYgfihWSVZTX0hJX0lETEVfU1RBVEVfRkUgfAorCQkJ
CSAgVklWU19ISV9JRExFX1NUQVRFX01DKTsKIAlpZGxlID0gZ3B1X3JlYWQoZ3B1LCBWSVZTX0hJ
X0lETEVfU1RBVEUpICYgbWFzazsKIAlpZiAoaWRsZSAhPSBtYXNrKQogCQlyZXR1cm4gLUVCVVNZ
OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
