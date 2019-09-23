Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57010BB46C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C871D6E8CD;
	Mon, 23 Sep 2019 12:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288E96E8CD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:59 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.236])
 by regular1.263xmail.com (Postfix) with ESMTP id 4D66C20C;
 Mon, 23 Sep 2019 20:53:54 +0800 (CST)
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
 P17988T139868132738816S1569243231409431_; 
 Mon, 23 Sep 2019 20:53:52 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8c988a9a6ff4e25a7008f5c32b7d9ab8>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 31/36] drm/stm: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:45 +0800
Message-Id: <1569243230-183568-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRleCA1YjUxMjk4OS4uNTI3YzczNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMKQEAgLTgxNyw3ICs4MTcsNyBAQCBzdGF0aWMgdm9pZCBsdGRjX3BsYW5lX2F0
b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAKIAkvKiBDb25maWd1cmVzIHRo
ZSBjb2xvciBmcmFtZSBidWZmZXIgcGl0Y2ggaW4gYnl0ZXMgJiBsaW5lIGxlbmd0aCAqLwogCXBp
dGNoX2luX2J5dGVzID0gZmItPnBpdGNoZXNbMF07Ci0JbGluZV9sZW5ndGggPSBmYi0+Zm9ybWF0
LT5jcHBbMF0gKgorCWxpbmVfbGVuZ3RoID0gZmItPmZvcm1hdC0+YnBwWzBdIC8gOCAqCiAJCSAg
ICAgICh4MSAtIHgwICsgMSkgKyAobGRldi0+Y2Fwcy5idXNfd2lkdGggPj4gMykgLSAxOwogCXZh
bCA9ICgocGl0Y2hfaW5fYnl0ZXMgPDwgMTYpIHwgbGluZV9sZW5ndGgpOwogCXJlZ191cGRhdGVf
Yml0cyhsZGV2LT5yZWdzLCBMVERDX0wxQ0ZCTFIgKyBsb2ZzLAotLSAKMi43LjQKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
