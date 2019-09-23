Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6BBB45F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE46E8C5;
	Mon, 23 Sep 2019 12:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896116E8C7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:17 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.76])
 by regular1.263xmail.com (Postfix) with ESMTP id DC3C4296;
 Mon, 23 Sep 2019 20:53:12 +0800 (CST)
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
 P32757T140634167924480S1569243191006336_; 
 Mon, 23 Sep 2019 20:53:11 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3b4d57d97bb16552c5207f6324929d88>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 26/36] drm/vboxvideo: use bpp instead of cpp for
 drm_format_info
Date: Mon, 23 Sep 2019 20:52:59 +0800
Message-Id: <1569243189-183445-1-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmJveHZpZGVvL3Zib3hfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21v
ZGUuYwppbmRleCBlMWU0OGJhLi44MzgxMjBiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dmJveHZpZGVvL3Zib3hfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJv
eF9tb2RlLmMKQEAgLTM4LDcgKzM4LDcgQEAgc3RhdGljIHZvaWQgdmJveF9kb19tb2Rlc2V0KHN0
cnVjdCBkcm1fY3J0YyAqY3J0YykKIAl2Ym94ID0gY3J0Yy0+ZGV2LT5kZXZfcHJpdmF0ZTsKIAl3
aWR0aCA9IHZib3hfY3J0Yy0+d2lkdGggPyB2Ym94X2NydGMtPndpZHRoIDogNjQwOwogCWhlaWdo
dCA9IHZib3hfY3J0Yy0+aGVpZ2h0ID8gdmJveF9jcnRjLT5oZWlnaHQgOiA0ODA7Ci0JYnBwID0g
ZmIgPyBmYi0+Zm9ybWF0LT5jcHBbMF0gKiA4IDogMzI7CisJYnBwID0gZmIgPyBmYi0+Zm9ybWF0
LT5icHBbMF0gOiAzMjsKIAlwaXRjaCA9IGZiID8gZmItPnBpdGNoZXNbMF0gOiB3aWR0aCAqIGJw
cCAvIDg7CiAJeF9vZmZzZXQgPSB2Ym94LT5zaW5nbGVfZnJhbWVidWZmZXIgPyB2Ym94X2NydGMt
PnggOiB2Ym94X2NydGMtPnhfaGludDsKIAl5X29mZnNldCA9IHZib3gtPnNpbmdsZV9mcmFtZWJ1
ZmZlciA/IHZib3hfY3J0Yy0+eSA6IHZib3hfY3J0Yy0+eV9oaW50OwotLSAKMi43LjQKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
