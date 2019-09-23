Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7391CBB47D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569B06E8D9;
	Mon, 23 Sep 2019 12:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 12:56:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4F76E8D4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:56:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.227])
 by lucky1.263xmail.com (Postfix) with ESMTP id DE03566909;
 Mon, 23 Sep 2019 20:48:21 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P14169T140710336407296S1569242883858959_; 
 Mon, 23 Sep 2019 20:48:21 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <029ba5340883946e18a39005adc9a83e>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 15/36] drm/mediatek: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:47:39 +0800
Message-Id: <1569242880-182878-5-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
References: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2ZiLmMgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Zi
LmMKaW5kZXggM2YyMzBhMi4uZmQ4MDU0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9mYi5jCkBAIC02OSw3ICs2OSw3IEBAIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKm10a19kcm1f
bW9kZV9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAoIWdlbSkKIAkJcmV0
dXJuIEVSUl9QVFIoLUVOT0VOVCk7CiAKLQlicHAgPSBpbmZvLT5jcHBbMF07CisJYnBwID0gaW5m
by0+YnBwWzBdIC8gODsKIAlzaXplID0gKGhlaWdodCAtIDEpICogY21kLT5waXRjaGVzWzBdICsg
d2lkdGggKiBicHA7CiAJc2l6ZSArPSBjbWQtPm9mZnNldHNbMF07CiAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCmluZGV4IDU4NGE5ZWMuLjk3ZDM4ZGIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYwpAQCAtMTIxLDcgKzEyMSw3IEBAIHN0
YXRpYyB2b2lkIG10a19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LAogCXBpdGNoID0gZmItPnBpdGNoZXNbMF07CiAJZm9ybWF0ID0gZmItPmZvcm1hdC0+Zm9ybWF0
OwogCi0JYWRkciArPSAocGxhbmUtPnN0YXRlLT5zcmMueDEgPj4gMTYpICogZmItPmZvcm1hdC0+
Y3BwWzBdOworCWFkZHIgKz0gKHBsYW5lLT5zdGF0ZS0+c3JjLngxID4+IDE2KSAqIGZiLT5mb3Jt
YXQtPmJwcFswXSAvIDg7CiAJYWRkciArPSAocGxhbmUtPnN0YXRlLT5zcmMueTEgPj4gMTYpICog
cGl0Y2g7CiAKIAlzdGF0ZS0+cGVuZGluZy5lbmFibGUgPSB0cnVlOwotLSAKMi43LjQKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
