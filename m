Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9CDBB436
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E0C6E8B0;
	Mon, 23 Sep 2019 12:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E15B6E8B0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:49:36 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.175])
 by regular1.263xmail.com (Postfix) with ESMTP id 846603AF;
 Mon, 23 Sep 2019 20:49:34 +0800 (CST)
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
 P28975T139999806740224S1569242970112868_; 
 Mon, 23 Sep 2019 20:49:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e80715322c1dd25cac595a7e76606990>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 18/36] drm/xen: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:49:10 +0800
Message-Id: <1569242968-183093-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
References: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udF9rbXMuYwppbmRleCAyMWFkMWMzLi4zMWRlMTQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250X2ttcy5jCkBAIC0xMjMsNyArMTIzLDcgQEAgc3RhdGljIHZvaWQgZGlzcGxh
eV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCiAJcmV0ID0g
eGVuX2RybV9mcm9udF9tb2RlX3NldChwaXBlbGluZSwgY3J0Yy0+eCwgY3J0Yy0+eSwKIAkJCQkg
ICAgIGZiLT53aWR0aCwgZmItPmhlaWdodCwKLQkJCQkgICAgIGZiLT5mb3JtYXQtPmNwcFswXSAq
IDgsCisJCQkJICAgICBmYi0+Zm9ybWF0LT5icHBbMF0sCiAJCQkJICAgICB4ZW5fZHJtX2Zyb250
X2ZiX3RvX2Nvb2tpZShmYikpOwogCiAJaWYgKHJldCkgewotLSAKMi43LjQKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
