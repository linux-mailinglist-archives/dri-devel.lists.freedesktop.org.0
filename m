Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61965BB437
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2040C89F31;
	Mon, 23 Sep 2019 12:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFFE6E8B1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:49:38 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.175])
 by regular1.263xmail.com (Postfix) with ESMTP id 3A18C2B9;
 Mon, 23 Sep 2019 20:49:36 +0800 (CST)
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
 Mon, 23 Sep 2019 20:49:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a0ed95c586960bb2fd8a5ff27235d1d6>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 19/36] drm/vkms: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:49:11 +0800
Message-Id: <1569242968-183093-4-git-send-email-hjc@rock-chips.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfcGxhbmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfcGxhbmUuYwppbmRleCA1
ZmM4Zjg1Li5jMmIwMDU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3Bs
YW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jCkBAIC0xMDcsNyAr
MTA3LDcgQEAgc3RhdGljIHZvaWQgdmttc19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLAogCWRybV9mcmFtZWJ1ZmZlcl9nZXQoJmNvbXBvc2VyLT5mYik7CiAJY29t
cG9zZXItPm9mZnNldCA9IGZiLT5vZmZzZXRzWzBdOwogCWNvbXBvc2VyLT5waXRjaCA9IGZiLT5w
aXRjaGVzWzBdOwotCWNvbXBvc2VyLT5jcHAgPSBmYi0+Zm9ybWF0LT5jcHBbMF07CisJY29tcG9z
ZXItPmNwcCA9IGZiLT5mb3JtYXQtPmJwcFswXSAvIDg7CiB9CiAKIHN0YXRpYyBpbnQgdmttc19w
bGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCi0tIAoyLjcuNAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
