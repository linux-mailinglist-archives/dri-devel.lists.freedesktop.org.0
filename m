Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659ABBB461
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34786E8C8;
	Mon, 23 Sep 2019 12:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA616E8C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:20 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.76])
 by regular1.263xmail.com (Postfix) with ESMTP id DA46D36B;
 Mon, 23 Sep 2019 20:53:17 +0800 (CST)
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
 Mon, 23 Sep 2019 20:53:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <646fc713930f5b9e95bb9ba616184176>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 30/36] drm/sti: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:03 +0800
Message-Id: <1569243189-183445-5-git-send-email-hjc@rock-chips.com>
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
Z3B1L2RybS9zdGkvc3RpX2dkcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlf
Z2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9nZHAuYwppbmRleCAxMTU5NWM3Li45Mjgw
MjcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9nZHAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RpL3N0aV9nZHAuYwpAQCAtNzc1LDcgKzc3NSw3IEBAIHN0YXRpYyB2b2lk
IHN0aV9nZHBfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpkcm1fcGxhbmUsCiAJCQkg
KHVuc2lnbmVkIGxvbmcpY21hX29iai0+cGFkZHIpOwogCiAJLyogcGl4ZWwgbWVtb3J5IGxvY2F0
aW9uICovCi0JYnBwID0gZmItPmZvcm1hdC0+Y3BwWzBdOworCWJwcCA9IGZiLT5mb3JtYXQtPmJw
cFswXSAvIDg7CiAJdG9wX2ZpZWxkLT5nYW1fZ2RwX3BtbCA9ICh1MzIpY21hX29iai0+cGFkZHIg
KyBmYi0+b2Zmc2V0c1swXTsKIAl0b3BfZmllbGQtPmdhbV9nZHBfcG1sICs9IHNyY194ICogYnBw
OwogCXRvcF9maWVsZC0+Z2FtX2dkcF9wbWwgKz0gc3JjX3kgKiBmYi0+cGl0Y2hlc1swXTsKLS0g
CjIuNy40CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
