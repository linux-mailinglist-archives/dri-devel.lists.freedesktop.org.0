Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD7BB474
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE36E8D3;
	Mon, 23 Sep 2019 12:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DDA6E8D3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:54:12 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.236])
 by regular1.263xmail.com (Postfix) with ESMTP id 352B045D;
 Mon, 23 Sep 2019 20:54:07 +0800 (CST)
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
 P17988T139868132738816S1569243231409431_; 
 Mon, 23 Sep 2019 20:54:07 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <084f3f145c6b5f8aeb6e10a2d2d49b50>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Sandy Huang <hjc@rock-chips.com>, Allison Randal <allison@lohutok.net>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 35/36] drm/udl: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:53:49 +0800
Message-Id: <1569243230-183568-5-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569243230-183568-1-git-send-email-hjc@rock-chips.com>
References: <1569243230-183568-1-git-send-email-hjc@rock-chips.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2ZiLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKaW5kZXggZWYzNTA0ZC4uMzNh
NDJiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jCkBAIC04OCw4ICs4OCw4IEBAIGludCB1ZGxfaGFuZGxl
X2RhbWFnZShzdHJ1Y3QgdWRsX2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIGludCB5LAogCWludCBh
bGlnbmVkX3g7CiAJaW50IGxvZ19icHA7CiAKLQlCVUdfT04oIWlzX3Bvd2VyX29mXzIoZmItPmJh
c2UuZm9ybWF0LT5jcHBbMF0pKTsKLQlsb2dfYnBwID0gX19mZnMoZmItPmJhc2UuZm9ybWF0LT5j
cHBbMF0pOworCUJVR19PTighaXNfcG93ZXJfb2ZfMihmYi0+YmFzZS5mb3JtYXQtPmJwcFswXSAv
IDgpKTsKKwlsb2dfYnBwID0gX19mZnMoZmItPmJhc2UuZm9ybWF0LT5icHBbMF0gLyA4KTsKIAog
CWlmICghZmItPmFjdGl2ZV8xNikKIAkJcmV0dXJuIDA7Ci0tIAoyLjcuNAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
