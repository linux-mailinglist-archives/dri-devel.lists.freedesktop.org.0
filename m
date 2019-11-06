Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3EF122B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5C06EC78;
	Wed,  6 Nov 2019 09:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0C56EC79
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:31:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 561BBB447;
 Wed,  6 Nov 2019 09:31:26 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	christian.koenig@amd.com,
	noralf@tronnes.org
Subject: [PATCH 8/8] drm/fb-helper: Handle I/O memory correctly when flushing
 shadow fb
Date: Wed,  6 Nov 2019 10:31:21 +0100
Message-Id: <20191106093121.21762-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106093121.21762-1-tzimmermann@suse.de>
References: <20191106093121.21762-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZiZGV2IGNvbnNvbGUncyBmcmFtZWJ1ZmZlciBjYW4gYmUgbG9jYXRlZCBpbiBJL08gbWVt
b3J5LCBzdWNoCmFzIHZpZGVvIFJBTS4gV2hlbiBmbHVzaGluZyB0aGUgc2hhZG93IGZiLCB3ZSB0
ZXN0IGZvciB0aGlzIGNhc2UgYW5kCnVzZSBJL08tYmFzZWQgbWVtY3B5KCkgaW5zdGVhZC4gVGhl
IHNoYWRvdyBmYiBpcyBhbHdheXMgaW4gc3lzdGVtCm1lbW9yeS4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJfaGVscGVyLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCmluZGV4IDE3NGU2ZDk3
MjIzZi4uZTc2YzQyZjg4NTJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKQEAgLTM5MywxMCAr
MzkzLDE0IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGlydHlfYmxpdF9yZWFsKHN0cnVj
dCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsCiAJdm9pZCAqc3JjID0gZmJfaGVscGVyLT5mYmRl
di0+c2NyZWVuX2J1ZmZlciArIG9mZnNldDsKIAl2b2lkICpkc3QgPSBmYl9oZWxwZXItPmJ1ZmZl
ci0+dmFkZHIgKyBvZmZzZXQ7CiAJc2l6ZV90IGxlbiA9IChjbGlwLT54MiAtIGNsaXAtPngxKSAq
IGNwcDsKKwlib29sIGlzX2lvbWVtID0gZmJfaGVscGVyLT5idWZmZXItPnZhZGRyX2lzX2lvbWVt
OwogCXVuc2lnbmVkIGludCB5OwogCiAJZm9yICh5ID0gY2xpcC0+eTE7IHkgPCBjbGlwLT55Mjsg
eSsrKSB7Ci0JCW1lbWNweShkc3QsIHNyYywgbGVuKTsKKwkJaWYgKGlzX2lvbWVtKQorCQkJbWVt
Y3B5X3RvaW8oKHZvaWQgX19pb21lbSAqKWRzdCwgc3JjLCBsZW4pOworCQllbHNlCisJCQltZW1j
cHkoZHN0LCBzcmMsIGxlbik7CiAJCXNyYyArPSBmYi0+cGl0Y2hlc1swXTsKIAkJZHN0ICs9IGZi
LT5waXRjaGVzWzBdOwogCX0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
