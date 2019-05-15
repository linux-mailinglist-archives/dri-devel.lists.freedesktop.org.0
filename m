Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CB1F596
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 15:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EB0892EF;
	Wed, 15 May 2019 13:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA950892EF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 13:30:15 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53020
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hQtz3-0004lO-V0; Wed, 15 May 2019 15:30:13 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fb-helper: Fix drm_fb_helper_hotplug_event() NULL ptr
 argument
Date: Wed, 15 May 2019 15:29:25 +0200
Message-Id: <20190515132925.48867-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=4LNAD+ReC02Lqye5pcCJHz/Xw9paQfS8ATB1kJPC63E=; 
 b=WhB7+5bP7banuOkY7AsfbSwfAUZfTjOHYD/rrclOHsTba2SeT2kwOyOFbn/6ilomDQ7dLu7H+SM6Nqm1vpYbrYuBLDXO+nbUSU7Y6Y5A1PWD4281XVh+Qz8zIXRvQ4pDeP70UdKjKqW8t0qqR4JO18qo/an66+1ppBp0A7+wjvKKeYXW6tN2w7Z4AOTMp60hVS0pUrnjfgm2ck/yLBM6CcxfB6bYto2tAL08TySQEPZXUG9SItuN3B5BL5BiKvSgtgbdK5g2X4kN4GtA6JKGWg1b0PHd751ro51ccSCgtzyg5UcBCwFNw3Jk883FSt+d/HKXVL3D2oV9PGGjz6V3kg==;
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
Cc: kbuild test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2ZiX2hlbHBlcl9ob3RwbHVnX2V2ZW50KCkgc2hvdWxkIHRvbGVyYXRlIHRoZSBmYl9oZWxw
ZXIgYXJndW1lbnQgYmVpbmcKTlVMTC4gQ29tbWl0IDAzYTk2MDZlN2ZlZSAoImRybS9mYi1oZWxw
ZXI6IEF2b2lkIHJhY2Ugd2l0aCBEUk0gdXNlcnNwYWNlIikKaW50cm9kdWNlZCBhIGZiX2hlbHBl
ciBkZXJlZmVyZW5jZSBiZWZvcmUgdGhlIE5VTEwgY2hlY2suCkZpeHVwIGJ5IG1vdmluZyB0aGUg
ZGVyZWZlcmVuY2UgYWZ0ZXIgdGhlIE5VTEwgY2hlY2suCgpGaXhlczogMDNhOTYwNmU3ZmVlICgi
ZHJtL2ZiLWhlbHBlcjogQXZvaWQgcmFjZSB3aXRoIERSTSB1c2Vyc3BhY2UiKQpSZXBvcnRlZC1i
eToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClJlcG9ydGVkLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IE5vcmFsZiBU
csO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCmluZGV4IGMyNTlhMjg1MjJmOC4uYTUy
YjQ4ZmFmYmQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKQEAgLTMwMzEsNyArMzAzMSw2IEBA
IEVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBlcl9pbml0aWFsX2NvbmZpZyk7CiAgKi8KIGludCBk
cm1fZmJfaGVscGVyX2hvdHBsdWdfZXZlbnQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBl
cikKIHsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZmJfaGVscGVyLT5kZXY7CiAJaW50IGVy
ciA9IDA7CiAKIAlpZiAoIWRybV9mYmRldl9lbXVsYXRpb24gfHwgIWZiX2hlbHBlcikKQEAgLTMw
NDQsMTMgKzMwNDMsMTMgQEAgaW50IGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudChzdHJ1Y3Qg
ZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQogCQlyZXR1cm4gZXJyOwogCX0KIAotCWlmICghZmJf
aGVscGVyLT5mYiB8fCAhZHJtX21hc3Rlcl9pbnRlcm5hbF9hY3F1aXJlKGRldikpIHsKKwlpZiAo
IWZiX2hlbHBlci0+ZmIgfHwgIWRybV9tYXN0ZXJfaW50ZXJuYWxfYWNxdWlyZShmYl9oZWxwZXIt
PmRldikpIHsKIAkJZmJfaGVscGVyLT5kZWxheWVkX2hvdHBsdWcgPSB0cnVlOwogCQltdXRleF91
bmxvY2soJmZiX2hlbHBlci0+bG9jayk7CiAJCXJldHVybiBlcnI7CiAJfQogCi0JZHJtX21hc3Rl
cl9pbnRlcm5hbF9yZWxlYXNlKGRldik7CisJZHJtX21hc3Rlcl9pbnRlcm5hbF9yZWxlYXNlKGZi
X2hlbHBlci0+ZGV2KTsKIAogCURSTV9ERUJVR19LTVMoIlxuIik7CiAKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
