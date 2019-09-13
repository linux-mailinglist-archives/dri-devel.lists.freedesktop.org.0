Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365ACB1DA5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 14:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF8C6F397;
	Fri, 13 Sep 2019 12:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0384F6F398
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 12:29:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77605875223;
 Fri, 13 Sep 2019 12:29:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3DC5C207;
 Fri, 13 Sep 2019 12:29:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8423016E08; Fri, 13 Sep 2019 14:29:08 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm: rework mmap() workflow
Date: Fri, 13 Sep 2019 14:29:00 +0200
Message-Id: <20190913122908.784-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 13 Sep 2019 12:29:12 +0000 (UTC)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1tYXAgY2FsbGJhY2sgdG8gZHJtX29iamVjdAoKR2VyZCBIb2ZmbWFubiAoOCk6CiAgZHJt
OiBhZGQgbW1hcCgpIHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzCiAgZHJtL3NobWVtOiBzd2l0Y2gg
c2htZW0gaGVscGVyIHRvICZkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwCiAgZHJtL3NobWVtOiBk
cm9wIERFRklORV9EUk1fR0VNX1NITUVNX0ZPUFMKICBkcm0vdHRtOiBmYWN0b3Igb3V0IHR0bV9i
b19tbWFwX3ZtYV9zZXR1cAogIGRybS90dG06IGFkZCBkcm1fZ2VtX3R0bV9tbWFwKCkKICBkcm0v
dnJhbTogc3dpdGNoIHZyYW0gaGVscGVyIHRvICZkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwKCkK
ICBkcm0vdnJhbTogZHJvcCB2ZXJpZnlfYWNjZXNzCiAgZHJtL3ZyYW06IGRyb3AgRFJNX1ZSQU1f
TU1fRklMRV9PUEVSQVRJT05TCgogaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTQgKysrKwogaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaCAg
ICAgICAgICAgIHwgMzAgKy0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgg
ICAgICAgICAgICAgIHwgIDIgKwogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAg
ICAgICAgICAgIHwgMjUgLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuaCAg
ICAgICAgICAgICAgfCA4MiArKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS90dG0vdHRt
X2JvX2FwaS5oICAgICAgICAgICAgICAgICAgfCAgOCArKwogZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmMgICAgICAgICAgICAgICAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19kcnYuYyAgICAgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2Np
cnJ1cy5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAg
ICAgICAgICAgICAgICAgICAgIHwgMjcgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuYyAgICAgICAgfCAyNiArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3R0bV9oZWxwZXIuYyAgICAgICAgICB8IDE5ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV92cmFtX2hlbHBlci5jICAgICAgICAgfCA1NiArLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMgICAgICAgICAgICAgICAgICAgfCAgOSArKwogLi4uL2dwdS9kcm0vaGlz
aWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZHJ2LmMgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2dlbS5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dt
MTJ1MzIwLmMgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b192bS5jICAgICAgICAgICAgICAgfCA0NyArKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL3Yz
ZC92M2RfYm8uYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92M2Qv
djNkX2Rydi5jICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZp
ZGVvL3Zib3hfZHJ2LmMgICAgICAgICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rydi5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9vYmplY3QuYyAgICAgICB8ICAyICstCiAyNSBmaWxlcyBjaGFuZ2VkLCAyMDAgaW5zZXJ0
aW9ucygrKSwgMTg2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJt
L2RybV92cmFtX21tX2hlbHBlci5oCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
