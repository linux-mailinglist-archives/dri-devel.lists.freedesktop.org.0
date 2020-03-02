Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17117639E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 20:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450A26E7EC;
	Mon,  2 Mar 2020 19:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A836E7EA;
 Mon,  2 Mar 2020 19:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6F42AFB03;
 Mon,  2 Mar 2020 20:13:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fTSlKgT4MT7; Mon,  2 Mar 2020 20:13:39 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A6F7E40490; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/etnaviv: Consider all kwnown idle bits in debugfs
Date: Mon,  2 Mar 2020 20:13:34 +0100
Message-Id: <4af1a3f1df51feac79b25cc86c5554d74cfb657c.1583176306.git.agx@sigxcpu.org>
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

V2Ugd2VyZSBtaXNzaW5nIG91dCBvbiBzb21lIGJpdHMgdGhlIHZlbmRvciBrZXJuZWwgZHJpdmVy
IGtub3dzIGFib3V0LgoKU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMTQgKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKaW5kZXggODczZDkxMDMxNjRkLi4xODdkZTYxMGIzMjUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwpAQCAtOTMwLDYgKzkzMCwyMCBA
QCBpbnQgZXRuYXZpdl9ncHVfZGVidWdmcyhzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwgc3RydWN0
IHNlcV9maWxlICptKQogCQlzZXFfcHV0cyhtLCAiXHQgRlAgaXMgbm90IGlkbGVcbiIpOwogCWlm
ICgoaWRsZSAmIFZJVlNfSElfSURMRV9TVEFURV9UUykgPT0gMCkKIAkJc2VxX3B1dHMobSwgIlx0
IFRTIGlzIG5vdCBpZGxlXG4iKTsKKwlpZiAoKGlkbGUgJiBWSVZTX0hJX0lETEVfU1RBVEVfQkwp
ID09IDApCisJCXNlcV9wdXRzKG0sICJcdCBCTCBpcyBub3QgaWRsZVxuIik7CisJaWYgKChpZGxl
ICYgVklWU19ISV9JRExFX1NUQVRFX0FTWU5DRkUpID09IDApCisJCXNlcV9wdXRzKG0sICJcdCBB
U1lOQ0ZFIGlzIG5vdCBpZGxlXG4iKTsKKwlpZiAoKGlkbGUgJiBWSVZTX0hJX0lETEVfU1RBVEVf
TUMpID09IDApCisJCXNlcV9wdXRzKG0sICJcdCBNQyBpcyBub3QgaWRsZVxuIik7CisJaWYgKChp
ZGxlICYgVklWU19ISV9JRExFX1NUQVRFX1BQQSkgPT0gMCkKKwkJc2VxX3B1dHMobSwgIlx0IFBQ
QSBpcyBub3QgaWRsZVxuIik7CisJaWYgKChpZGxlICYgVklWU19ISV9JRExFX1NUQVRFX1dEKSA9
PSAwKQorCQlzZXFfcHV0cyhtLCAiXHQgV0QgaXMgbm90IGlkbGVcbiIpOworCWlmICgoaWRsZSAm
IFZJVlNfSElfSURMRV9TVEFURV9OTikgPT0gMCkKKwkJc2VxX3B1dHMobSwgIlx0IE5OIGlzIG5v
dCBpZGxlXG4iKTsKKwlpZiAoKGlkbGUgJiBWSVZTX0hJX0lETEVfU1RBVEVfVFApID09IDApCisJ
CXNlcV9wdXRzKG0sICJcdCBUUCBpcyBub3QgaWRsZVxuIik7CiAJaWYgKGlkbGUgJiBWSVZTX0hJ
X0lETEVfU1RBVEVfQVhJX0xQKQogCQlzZXFfcHV0cyhtLCAiXHQgQVhJIGxvdyBwb3dlciBtb2Rl
XG4iKTsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
