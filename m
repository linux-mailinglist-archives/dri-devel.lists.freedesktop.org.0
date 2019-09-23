Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462FABB454
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9316E8C3;
	Mon, 23 Sep 2019 12:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDED6E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:52:30 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.128])
 by regular1.263xmail.com (Postfix) with ESMTP id 907B23E4;
 Mon, 23 Sep 2019 20:52:27 +0800 (CST)
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
 P15436T140160991741696S1569243121384240_; 
 Mon, 23 Sep 2019 20:52:26 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e6bfbf9941a2acc204e22cd8bc1ef476>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sandy Huang <hjc@rock-chips.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 24/36] drm/hisilicon: use bpp instead of cpp for
 drm_format_info
Date: Mon, 23 Sep 2019 20:51:47 +0800
Message-Id: <1569243119-183293-4-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
References: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-kernel@vger.kernel.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMgfCA2ICsrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYwppbmRleCBjYzRjNDE3Li42YmZi
MzI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2Ry
bV9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rl
LmMKQEAgLTEyMiwxMSArMTIyLDExIEBAIHN0YXRpYyB2b2lkIGhpYm1jX3BsYW5lX2F0b21pY191
cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAKIAl3cml0ZWwoZ3B1X2FkZHIsIHByaXYt
Pm1taW8gKyBISUJNQ19DUlRfRkJfQUREUkVTUyk7CiAKLQlyZWcgPSBzdGF0ZS0+ZmItPndpZHRo
ICogKHN0YXRlLT5mYi0+Zm9ybWF0LT5jcHBbMF0pOworCXJlZyA9IHN0YXRlLT5mYi0+d2lkdGgg
KiAoc3RhdGUtPmZiLT5mb3JtYXQtPmJwcFswXSAvIDgpOwogCS8qIG5vdyBsaW5lX3BhZCBpcyAx
NiAqLwogCXJlZyA9IFBBRERJTkcoMTYsIHJlZyk7CiAKLQlsaW5lX2wgPSBzdGF0ZS0+ZmItPndp
ZHRoICogc3RhdGUtPmZiLT5mb3JtYXQtPmNwcFswXTsKKwlsaW5lX2wgPSBzdGF0ZS0+ZmItPndp
ZHRoICogc3RhdGUtPmZiLT5mb3JtYXQtPmJwcFswXSAvIDg7CiAJbGluZV9sID0gUEFERElORygx
NiwgbGluZV9sKTsKIAl3cml0ZWwoSElCTUNfRklFTEQoSElCTUNfQ1JUX0ZCX1dJRFRIX1dJRFRI
LCByZWcpIHwKIAkgICAgICAgSElCTUNfRklFTEQoSElCTUNfQ1JUX0ZCX1dJRFRIX09GRlMsIGxp
bmVfbCksCkBAIC0xMzYsNyArMTM2LDcgQEAgc3RhdGljIHZvaWQgaGlibWNfcGxhbmVfYXRvbWlj
X3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlyZWcgPSByZWFkbChwcml2LT5tbWlv
ICsgSElCTUNfQ1JUX0RJU1BfQ1RMKTsKIAlyZWcgJj0gfkhJQk1DX0NSVF9ESVNQX0NUTF9GT1JN
QVRfTUFTSzsKIAlyZWcgfD0gSElCTUNfRklFTEQoSElCTUNfQ1JUX0RJU1BfQ1RMX0ZPUk1BVCwK
LQkJCSAgIHN0YXRlLT5mYi0+Zm9ybWF0LT5jcHBbMF0gKiA4IC8gMTYpOworCQkJICAgc3RhdGUt
PmZiLT5mb3JtYXQtPmJwcFswXSAvIDE2KTsKIAl3cml0ZWwocmVnLCBwcml2LT5tbWlvICsgSElC
TUNfQ1JUX0RJU1BfQ1RMKTsKIH0KIAotLSAKMi43LjQKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
