Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB4BB462
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DED6E8C9;
	Mon, 23 Sep 2019 12:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8F6E8C5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:53:17 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.76])
 by regular1.263xmail.com (Postfix) with ESMTP id 3CDB225F;
 Mon, 23 Sep 2019 20:53:15 +0800 (CST)
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
 Mon, 23 Sep 2019 20:53:14 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <af08d0d1a88de418102cc211dc241298>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 28/36] drm/qxl: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:01 +0800
Message-Id: <1569243189-183445-3-git-send-email-hjc@rock-chips.com>
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
Cc: spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2RyYXcuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2RyYXcuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2RyYXcuYwppbmRleCA1YmViZjFlLi43
MWMxOGU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcmF3LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJhdy5jCkBAIC0xNDEsNyArMTQxLDcgQEAgdm9pZCBx
eGxfZHJhd19kaXJ0eV9mYihzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKIAlzdHJ1Y3QgcXhsX3Jl
Y3QgKnJlY3RzOwogCWludCBzdHJpZGUgPSBmYi0+cGl0Y2hlc1swXTsKIAkvKiBkZXB0aCBpcyBu
b3QgYWN0dWFsbHkgaW50ZXJlc3RpbmcsIHdlIGRvbid0IG1hc2sgd2l0aCBpdCAqLwotCWludCBk
ZXB0aCA9IGZiLT5mb3JtYXQtPmNwcFswXSAqIDg7CisJaW50IGRlcHRoID0gZmItPmZvcm1hdC0+
YnBwWzBdOwogCXVpbnQ4X3QgKnN1cmZhY2VfYmFzZTsKIAlzdHJ1Y3QgcXhsX3JlbGVhc2UgKnJl
bGVhc2U7CiAJc3RydWN0IHF4bF9ibyAqY2xpcHNfYm87Ci0tIAoyLjcuNAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
