Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5091BB480
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A87F6E8D4;
	Mon, 23 Sep 2019 12:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9036E8D8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:56:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.227])
 by lucky1.263xmail.com (Postfix) with ESMTP id 1CBF866344;
 Mon, 23 Sep 2019 20:48:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P14169T140710336407296S1569242883858959_; 
 Mon, 23 Sep 2019 20:48:04 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <dcbf38747a55e5c1495e51f206d0b1dd>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 11/36] drm/armada: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:47:35 +0800
Message-Id: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hcm1hZGEvYXJtYWRhX2ZiZGV2LmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYXJt
YWRhL2FybWFkYV9wbGFuZS5jIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm1h
ZGEvYXJtYWRhX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9mYmRldi5j
CmluZGV4IDA5MGNjMGQuLmEyZTQzNDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1h
ZGEvYXJtYWRhX2ZiZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZmJk
ZXYuYwpAQCAtODgsNyArODgsNyBAQCBzdGF0aWMgaW50IGFybWFkYV9mYmRldl9jcmVhdGUoc3Ry
dWN0IGRybV9mYl9oZWxwZXIgKmZiaCwKIAlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhpbmZvLCBm
YmgsIHNpemVzKTsKIAogCURSTV9ERUJVR19LTVMoImFsbG9jYXRlZCAlZHglZCAlZGJwcCBmYjog
MHglMDhsbHhcbiIsCi0JCWRmYi0+ZmIud2lkdGgsIGRmYi0+ZmIuaGVpZ2h0LCBkZmItPmZiLmZv
cm1hdC0+Y3BwWzBdICogOCwKKwkJZGZiLT5mYi53aWR0aCwgZGZiLT5mYi5oZWlnaHQsIGRmYi0+
ZmIuZm9ybWF0LT5icHBbMF0sCiAJCSh1bnNpZ25lZCBsb25nIGxvbmcpb2JqLT5waHlzX2FkZHIp
OwogCiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFk
YV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfcGxhbmUuYwppbmRleCBl
N2NjMmIzLi5mYTQwMGFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFk
YV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX3BsYW5lLmMKQEAg
LTQ2LDEzICs0NiwxMyBAQCB2b2lkIGFybWFkYV9kcm1fcGxhbmVfY2FsYyhzdHJ1Y3QgZHJtX3Bs
YW5lX3N0YXRlICpzdGF0ZSwgdTMyIGFkZHJzWzJdWzNdLAogCWludCBpOwogCiAJRFJNX0RFQlVH
X0tNUygicGl0Y2ggJXUgeCAlZCB5ICVkIGJwcCAlZFxuIiwKLQkJICAgICAgZmItPnBpdGNoZXNb
MF0sIHgsIHksIGZvcm1hdC0+Y3BwWzBdICogOCk7CisJCSAgICAgIGZiLT5waXRjaGVzWzBdLCB4
LCB5LCBmb3JtYXQtPmJwcFswXSk7CiAKIAlpZiAobnVtX3BsYW5lcyA+IDMpCiAJCW51bV9wbGFu
ZXMgPSAzOwogCiAJYWRkcnNbMF1bMF0gPSBhZGRyICsgZmItPm9mZnNldHNbMF0gKyB5ICogZmIt
PnBpdGNoZXNbMF0gKwotCQkgICAgICB4ICogZm9ybWF0LT5jcHBbMF07CisJCSAgICAgIHggKiBm
b3JtYXQtPmJwcFswXSAvIDg7CiAJcGl0Y2hlc1swXSA9IGZiLT5waXRjaGVzWzBdOwogCiAJeSAv
PSBmb3JtYXQtPnZzdWI7CkBAIC02MCw3ICs2MCw3IEBAIHZvaWQgYXJtYWRhX2RybV9wbGFuZV9j
YWxjKHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlLCB1MzIgYWRkcnNbMl1bM10sCiAKIAlm
b3IgKGkgPSAxOyBpIDwgbnVtX3BsYW5lczsgaSsrKSB7CiAJCWFkZHJzWzBdW2ldID0gYWRkciAr
IGZiLT5vZmZzZXRzW2ldICsgeSAqIGZiLT5waXRjaGVzW2ldICsKLQkJCSAgICAgIHggKiBmb3Jt
YXQtPmNwcFtpXTsKKwkJCSAgICAgIHggKiBmb3JtYXQtPmJwcFtpXSAvIDg7CiAJCXBpdGNoZXNb
aV0gPSBmYi0+cGl0Y2hlc1tpXTsKIAl9CiAJZm9yICg7IGkgPCAzOyBpKyspIHsKLS0gCjIuNy40
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
