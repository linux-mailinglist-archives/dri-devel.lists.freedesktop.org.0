Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B1BB45E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0776E8C4;
	Mon, 23 Sep 2019 12:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47806E8C4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:15 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.76])
 by regular1.263xmail.com (Postfix) with ESMTP id DEE623C8;
 Mon, 23 Sep 2019 20:53:13 +0800 (CST)
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
 Mon, 23 Sep 2019 20:53:13 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <234d37c4ee2a0db87e922b97c99f9a5d>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 27/36] drm/pl111: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:00 +0800
Message-Id: <1569243189-183445-2-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569243189-183445-1-git-send-email-hjc@rock-chips.com>
References: <1569243189-183445-1-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGwxMTEvcGwxMTFfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3Bs
YXkuYwppbmRleCAwMjQ3NzFhNC4uOWJjMTY2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BsMTExL3BsMTExX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZGlzcGxheS5jCkBAIC0xMDMsNyArMTAzLDcgQEAgc3RhdGljIGludCBwbDExMV9kaXNwbGF5X2No
ZWNrKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJLyogVGhlcmUncyBu
byBwaXRjaCByZWdpc3RlciAtLSB0aGUgbW9kZSdzIGhkaXNwbGF5CiAJCSAqIGNvbnRyb2xzIGl0
LgogCQkgKi8KLQkJaWYgKGZiLT5waXRjaGVzWzBdICE9IG1vZGUtPmhkaXNwbGF5ICogZmItPmZv
cm1hdC0+Y3BwWzBdKQorCQlpZiAoZmItPnBpdGNoZXNbMF0gIT0gbW9kZS0+aGRpc3BsYXkgKiBm
Yi0+Zm9ybWF0LT5icHBbMF0gLyA4KQogCQkJcmV0dXJuIC1FSU5WQUw7CiAKIAkJLyogV2UgY2Fu
J3QgY2hhbmdlIHRoZSBGQiBmb3JtYXQgaW4gYSBmbGlja2VyLWZyZWUKLS0gCjIuNy40CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
