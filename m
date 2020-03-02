Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332491763A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 20:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0006E804;
	Mon,  2 Mar 2020 19:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0766E7EA;
 Mon,  2 Mar 2020 19:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id ED0D5FB04;
 Mon,  2 Mar 2020 20:13:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoMrX3WfUypl; Mon,  2 Mar 2020 20:13:41 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B2AE54048F; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/etnaviv: Warn when GPU doesn't idle fast enough
Date: Mon,  2 Mar 2020 20:13:36 +0100
Message-Id: <d30bd6f4e063bc0df1fc6d608ea93c6e08f58104.1583176306.git.agx@sigxcpu.org>
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

SWYgdGhlIEdQVSBpc24ndCBpZGxlIGFmdGVyIHNpZ25hbGxpbmcgcG1fcnVudGltZV9tYXJrX2xh
c3RfYnVzeSgpIHBsdXMKd2FpdGluZyBmb3IgdGhlIGF1dG9zdXNwZW5kIGRlbGF5IHRoZXJlJ3Mg
bGlrZWx5IHNvbWV0aGluZyB3cm9uZyB3aXRoCnRoZSB3YXkgd2UgY2hlY2sgaWRsZW5lc3Mgc28g
d2FybiBhYm91dCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4
Y3B1Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgNSAr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCmluZGV4IGRhMjRlNDMzZjgyYS4uNGZkMTZi
OGY4YTdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKQEAgLTE4MjQsOCAr
MTgyNCwxMSBAQCBzdGF0aWMgaW50IGV0bmF2aXZfZ3B1X3JwbV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKIAltYXNrID0gZ3B1LT5pZGxlX21hc2sgJiB+KFZJVlNfSElfSURMRV9TVEFURV9G
RSB8CiAJCQkJICBWSVZTX0hJX0lETEVfU1RBVEVfTUMpOwogCWlkbGUgPSBncHVfcmVhZChncHUs
IFZJVlNfSElfSURMRV9TVEFURSkgJiBtYXNrOwotCWlmIChpZGxlICE9IG1hc2spCisJaWYgKGlk
bGUgIT0gbWFzaykgeworCQlkZXZfd2Fybl9yYXRlbGltaXRlZChkZXYsICJHUFUgbm90IHlldCBp
ZGxlLCBtYXNrOiAweCUwOHhcbiIsCisJCQkJICAgICBpZGxlKTsKIAkJcmV0dXJuIC1FQlVTWTsK
Kwl9CiAKIAlyZXR1cm4gZXRuYXZpdl9ncHVfaHdfc3VzcGVuZChncHUpOwogfQotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
