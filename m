Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C862B23A0DC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852AD6E218;
	Mon,  3 Aug 2020 08:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65B06E0F2;
 Sun,  2 Aug 2020 11:15:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0U4TqfqO_1596366935; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U4TqfqO_1596366935) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 02 Aug 2020 19:15:35 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, jose.souza@intel.com,
 maarten.lankhorst@linux.intel.com, chris@chris-wilson.co.uk,
 manasi.d.navare@intel.com, wambui.karugax@gmail.com,
 stanislav.lisovskiy@intel.com
Subject: [PATCH] drm/i915: Fix wrong return value in intel_atomic_check()
Date: Sun,  2 Aug 2020 19:15:35 +0800
Message-Id: <20200802111535.5200-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: tianjia.zhang@alibaba.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGNhc2Ugb2YgY2FsbGluZyBjaGVja19kaWdpdGFsX3BvcnRfY29uZmxpY3RzKCkgZmFp
bGVkLCBhCm5lZ2F0aXZlIGVycm9yIGNvZGUgLUVJTlZBTCBzaG91bGQgYmUgcmV0dXJuZWQuCgpG
aXhlczogYmY1ZGE4M2U0YmQ4MCAoImRybS9pOTE1OiBNb3ZlIGNoZWNrX2RpZ2l0YWxfcG9ydF9j
b25mbGljdHMoKSBlYXJpZXIiKQpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGlhbmppYSBaaGFuZyA8dGlhbmppYS56aGFu
Z0BsaW51eC5hbGliYWJhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMKaW5kZXggMjY5OTZlMTgzOWUyLi45ZjNhN2VmNThhYmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCkBAIC0xNDg3Miw3ICsxNDg3Miw3IEBAIHN0
YXRpYyBpbnQgaW50ZWxfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYg
KGFueV9tcyAmJiAhY2hlY2tfZGlnaXRhbF9wb3J0X2NvbmZsaWN0cyhzdGF0ZSkpIHsKIAkJZHJt
X2RiZ19rbXMoJmRldl9wcml2LT5kcm0sCiAJCQkgICAgInJlamVjdGluZyBjb25mbGljdGluZyBk
aWdpdGFsIHBvcnQgY29uZmlndXJhdGlvblxuIik7Ci0JCXJldCA9IEVJTlZBTDsKKwkJcmV0ID0g
LUVJTlZBTDsKIAkJZ290byBmYWlsOwogCX0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
