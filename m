Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309B331FA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 16:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D49F8923A;
	Mon,  3 Jun 2019 14:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117508923A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 14:21:09 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hXnpe-0002aE-GG; Mon, 03 Jun 2019 14:21:02 +0000
From: Colin King <colin.king@canonical.com>
To: Jyri Sarha <jsarha@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/bridge: sii902x: fix comparision of u32 with less
 than zero
Date: Mon,  3 Jun 2019 15:21:02 +0100
Message-Id: <20190603142102.27191-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBsZXNz
IHRoYW4gY2hlY2sgZm9yIHRoZSB2YXJpYWJsZSBudW1fbGFuZXMgaXMgYWx3YXlzIGdvaW5nIHRv
IGJlCmZhbHNlIGJlY2F1c2UgdGhlIHZhcmlhYmxlIGlzIGEgdTMyLiAgRml4IHRoaXMgYnkgbWFr
aW5nIG51bV9sYW5lcyBhbgppbnQgYW5kIGFsc28gbWFrZSBsb29wIGluZGV4IGkgYW4gaW50IHRv
by4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQpG
aXhlczogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1wbGVtZW50IEhETUkg
YXVkaW8gc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTAyeC5jCmluZGV4IGQ2Zjk4ZDM4OGFjMi4uMjFhOTQ3NjAzYzg4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpaTkwMnguYwpAQCAtNzE5LDcgKzcxOSw3IEBAIHN0YXRpYyBpbnQgc2lp
OTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAogCQkubWF4X2ky
c19jaGFubmVscyA9IDAsCiAJfTsKIAl1OCBsYW5lc1s0XTsKLQl1MzIgbnVtX2xhbmVzLCBpOwor
CWludCBudW1fbGFuZXMsIGk7CiAKIAlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYtPm9m
X25vZGUsICIjc291bmQtZGFpLWNlbGxzIikpIHsKIAkJZGV2X2RiZyhkZXYsICIlczogTm8gXCIj
c291bmQtZGFpLWNlbGxzXCIsIG5vIGF1ZGlvXG4iLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
