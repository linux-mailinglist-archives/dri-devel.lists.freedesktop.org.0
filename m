Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C2F2833
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F8F6EE99;
	Thu,  7 Nov 2019 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6C6EC91
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:50:37 +0000 (UTC)
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
 by pokefinder.org (Postfix) with ESMTPSA id 736C82C0553;
 Wed,  6 Nov 2019 10:50:36 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 05/12] video: fbdev: matrox: convert to
 i2c_new_scanned_device
Date: Wed,  6 Nov 2019 10:50:23 +0100
Message-Id: <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBmcm9tIHRoZSBkZXByZWNhdGVkIGkyY19uZXdfcHJvYmVkX2RldmljZSgpIHRvIHRoZSBu
ZXcKaTJjX25ld19zY2FubmVkX2RldmljZSgpLiBNYWtlIHVzZSBvZiB0aGUgbmV3IEVSUlBUUiBp
ZiBzdWl0YWJsZS4KClNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2Fu
Zy1lbmdpbmVlcmluZy5jb20+Ci0tLQoKQnVpbGQgdGVzdGVkIG9ubHkuIFJGQywgcGxlYXNlIGNv
bW1lbnQgYW5kL29yIGFjaywgYnV0IGRvbid0IGFwcGx5IHlldC4KCiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L21hdHJveC9pMmMtbWF0cm94ZmIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L21hdHJveC9pMmMtbWF0cm94ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2ky
Yy1tYXRyb3hmYi5jCmluZGV4IDM0ZTI2NTljMzE4OS4uZTJlNDcwNWUzZmUwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9pMmMtbWF0cm94ZmIuYworKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L21hdHJveC9pMmMtbWF0cm94ZmIuYwpAQCAtMTkxLDggKzE5MSw4IEBAIHN0
YXRpYyB2b2lkKiBpMmNfbWF0cm94ZmJfcHJvYmUoc3RydWN0IG1hdHJveF9mYl9pbmZvKiBtaW5m
bykgewogCQkJCTB4MWIsIEkyQ19DTElFTlRfRU5ECiAJCQl9OwogCi0JCQlpMmNfbmV3X3Byb2Jl
ZF9kZXZpY2UoJm0yaW5mby0+bWF2ZW4uYWRhcHRlciwKLQkJCQkJICAgICAgJm1hdmVuX2luZm8s
IGFkZHJfbGlzdCwgTlVMTCk7CisJCQlpMmNfbmV3X3NjYW5uZWRfZGV2aWNlKCZtMmluZm8tPm1h
dmVuLmFkYXB0ZXIsCisJCQkJCSAgICAgICAmbWF2ZW5faW5mbywgYWRkcl9saXN0LCBOVUxMKTsK
IAkJfQogCX0KIAlyZXR1cm4gbTJpbmZvOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
