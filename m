Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FC71351
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6786E1BB;
	Tue, 23 Jul 2019 07:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B46E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:54:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F121AECD;
 Tue, 23 Jul 2019 07:54:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, airlied@redhat.com
Subject: [PATCH 3/3] drm/mgag200: Don't unpin the current cursor image's
 buffer.
Date: Tue, 23 Jul 2019 09:54:25 +0200
Message-Id: <20190723075425.24028-4-tzimmermann@suse.de>
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

Q3VycmVudGx5IHRoZSBkaXNwbGF5ZWQgY3Vyc29yIGJ1ZmZlciBtaWdodCBiZSBldmljdGVkIGZy
b20gdmlkZW8gbWVtb3J5LgpOb3QgdW5waW5uaW5nIHRoZSBCTyBmaXhlcyB0aGlzIHByb2JsZW0u
IEF0IHRoaXMgcG9pbnQsIHBpeGVsc19jdXJyZW50CmFsc28gcmVmZXJlbmNlcyB0aGUgQk8gYW5k
IGl0IHdpbGwgYmUgdW5waW5uZWQgZHVyaW5nIHRoZSBuZXh0IGN1cnNvcgp1cGRhdGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KRml4ZXM6
IDk0ZGM1N2IxMDM5OSAoImRybS9tZ2FnMjAwOiBSZXdyaXRlIGN1cnNvciBoYW5kbGluZyIpCkNj
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJs
aWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJz
b3IuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIGIvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYwppbmRleCBmMTFiODYyY2JlZDkuLjI4OWNlM2UyOTAz
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jCkBAIC0yMTMsNyAr
MjEzLDYgQEAgaW50IG1nYV9jcnRjX2N1cnNvcl9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAog
CW1kZXYtPmN1cnNvci5waXhlbHNfY3VycmVudCA9IHBpeGVsc19uZXh0OwogCiAJZHJtX2dlbV92
cmFtX2t1bm1hcChwaXhlbHNfbmV4dCk7Ci0JZHJtX2dlbV92cmFtX3VucGluKHBpeGVsc19uZXh0
KTsKIAlkcm1fZ2VtX3ZyYW1fa3VubWFwKGdibyk7CiAJZHJtX2dlbV92cmFtX3VucGluKGdibyk7
CiAJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7Ci0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
