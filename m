Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF40BB415
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B856E8A3;
	Mon, 23 Sep 2019 12:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 12:46:15 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A091C6E8A3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:46:15 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.152])
 by regular1.263xmail.com (Postfix) with ESMTP id 20C333F2;
 Mon, 23 Sep 2019 20:46:13 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32406T140255445382912S1569242769949542_; 
 Mon, 23 Sep 2019 20:46:11 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <954fbc5d0a41ef46db41fdad09735c21>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 05/36] drm/sun4i: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:46:09 +0800
Message-Id: <1569242769-182724-1-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV91aV9sYXllci5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX3ZpX2xheWVyLmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfdWlfbGF5ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV91aV9sYXllci5j
CmluZGV4IGM4N2ZkODQuLjE0N2UyNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV91aV9sYXllci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV91aV9s
YXllci5jCkBAIC0yMTEsNyArMjExLDcgQEAgc3RhdGljIGludCBzdW44aV91aV9sYXllcl91cGRh
dGVfYnVmZmVyKHN0cnVjdCBzdW44aV9taXhlciAqbWl4ZXIsIGludCBjaGFubmVsLAogCURSTV9E
RUJVR19EUklWRVIoIlVzaW5nIEdFTSBAICVwYWRcbiIsICZnZW0tPnBhZGRyKTsKIAogCS8qIENv
bXB1dGUgdGhlIHN0YXJ0IG9mIHRoZSBkaXNwbGF5ZWQgbWVtb3J5ICovCi0JYnBwID0gZmItPmZv
cm1hdC0+Y3BwWzBdOworCWJwcCA9IGZiLT5mb3JtYXQtPmJwcFswXSAvIDg7CiAJcGFkZHIgPSBn
ZW0tPnBhZGRyICsgZmItPm9mZnNldHNbMF07CiAKIAkvKiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRy
ZXNzIGZvciBzcmMgY29vcmRpbmF0ZXMgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW44aV92aV9sYXllci5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xh
eWVyLmMKaW5kZXggNDJkNDQ1ZC4uZGQ3NzdhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhp
X3ZpX2xheWVyLmMKQEAgLTI5NSw3ICsyOTUsNyBAQCBzdGF0aWMgaW50IHN1bjhpX3ZpX2xheWVy
X3VwZGF0ZV9idWZmZXIoc3RydWN0IHN1bjhpX21peGVyICptaXhlciwgaW50IGNoYW5uZWwsCiAJ
CX0KIAogCQkvKiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRyZXNzIGZvciBzcmMgY29vcmRpbmF0ZXMg
Ki8KLQkJcGFkZHIgKz0gZHggKiBmb3JtYXQtPmNwcFtpXTsKKwkJcGFkZHIgKz0gZHggKiBmb3Jt
YXQtPmJwcFtpXSAvIDg7CiAJCXBhZGRyICs9IGR5ICogZmItPnBpdGNoZXNbaV07CiAKIAkJLyog
U2V0IHRoZSBsaW5lIHdpZHRoICovCi0tIAoyLjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
