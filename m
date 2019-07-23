Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF17134F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6E3899B7;
	Tue, 23 Jul 2019 07:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E316E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:54:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DC59AE6D;
 Tue, 23 Jul 2019 07:54:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, airlied@redhat.com
Subject: [PATCH 1/3] drm/mgag200: Pin displayed cursor BO to video memory
Date: Tue, 23 Jul 2019 09:54:23 +0200
Message-Id: <20190723075425.24028-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723075425.24028-1-tzimmermann@suse.de>
References: <20190723075425.24028-1-tzimmermann@suse.de>
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

VGhlIGN1cnNvciBCTyBoYXMgdG8gYmUgcGlubmVkIHRvIHZpZGVvIHJhbSB3aGlsZSBpdCdzIGJl
aW5nIGRpc3BsYXllZC4KV2l0aCB0aGUgY3VycmVudCBjb2RlLCB0aGUgQk8gbWlnaHQgYmUgcGlu
bmVkIHRvIHN5c3RlbSBtZW1vcnkgaW5zdGVhZC4KVGhlIHBhdGNoIGZpeGVzIHRoaXMgcHJvYmxl
bS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
PgpGaXhlczogOTRkYzU3YjEwMzk5ICgiZHJtL21nYWcyMDA6IFJld3JpdGUgY3Vyc29yIGhhbmRs
aW5nIikKQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2N1cnNvci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9j
dXJzb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMKaW5kZXgg
MTNmMzJkZjdlMzU3Li5hMTk5NzU5MzFjNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfY3Vyc29yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9jdXJzb3IuYwpAQCAtOTksNyArOTksNyBAQCBpbnQgbWdhX2NydGNfY3Vyc29yX3NldChz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJfQogCiAJLyogUGluIGFuZCBtYXAgdXAtY29taW5nIGJ1
ZmZlciB0byB3cml0ZSBjb2xvdXIgaW5kaWNlcyAqLwotCXJldCA9IGRybV9nZW1fdnJhbV9waW4o
cGl4ZWxzX25leHQsIDApOworCXJldCA9IGRybV9nZW1fdnJhbV9waW4ocGl4ZWxzX25leHQsIERS
TV9HRU1fVlJBTV9QTF9GTEFHX1ZSQU0pOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycigmZGV2LT5w
ZGV2LT5kZXYsCiAJCQkiZmFpbGVkIHRvIHBpbiBjdXJzb3IgYnVmZmVyOiAlZFxuIiwgcmV0KTsK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
