Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42986369
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C766E848;
	Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534036E84A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4AB27BDB1;
 Thu,  8 Aug 2019 13:44:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3C73100194E;
 Thu,  8 Aug 2019 13:44:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0796616E08; Thu,  8 Aug 2019 15:44:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
Date: Thu,  8 Aug 2019 15:44:00 +0200
Message-Id: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 08 Aug 2019 13:44:22 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpHZXJkIEhvZmZtYW5uICgxNyk6CiAgZHJtL3R0bTogdHVybiB0dG1fYm9fZGV2aWNlLnZtYV9t
YW5hZ2VyIGludG8gYSBwb2ludGVyCiAgZHJtL3R0bTogYWRkIGdlbV90dG1fYm9fZGV2aWNlX2lu
aXQoKQogIGRybS92cmFtOiBzd2l0Y2ggdnJhbSBoZWxwZXJzIHRvIHRoZSBuZXcgZ2VtX3R0bV9i
b19kZXZpY2VfaW5pdCgpCiAgZHJtL3F4bDogc3dpdGNoIHF4bCB0byB0aGUgbmV3IGdlbV90dG1f
Ym9fZGV2aWNlX2luaXQoKQogIGRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9mdW5j
cwogIGRybS9zaG1lbTogc3dpdGNoIHNobWVtIGhlbHBlciB0byBkcm1fZ2VtX29iamVjdF9mdW5j
cy0+bW1hcAogIGRybS9zaG1lbTogZHJvcCBERUZJTkVfRFJNX0dFTV9TSE1FTV9GT1BTCiAgZHJt
L3R0bTogZmFjdG9yIG91dCB0dG1fYm9fbW1hcF92bWFfc2V0dXAKICBkcm0vdHRtOiBhZGQgZHJt
X2dlbV90dG1fbW1hcCgpCiAgZHJtL3ZyYW06IHN3aXRjaCB2cmFtIGhlbHBlciB0byBkcm1fZ2Vt
X29iamVjdF9mdW5jcy0+bW1hcCBjb2RlcGF0aAogIGRybS92cmFtOiBkcm9wIHZlcmlmeV9hY2Nl
c3MKICBkcm06IGRyb3AgRFJNX1ZSQU1fTU1fRklMRV9PUEVSQVRJT05TCiAgZHJtL3F4bDogdXNl
IGRybV9nZW1fb2JqZWN0X2Z1bmNzCiAgZHJtL3F4bDogZHJvcCBxeGxfdHRtX2ZhdWx0CiAgZHJt
L3F4bDogc3dpdGNoIHF4bCB0byBkcm1fZ2VtX29iamVjdF9mdW5jcy0+bW1hcCBjb2RlcGF0aAog
IGRybS9xeGw6IGRyb3AgdmVyaWZ5X2FjY2VzcwogIGRybS9xeGw6IHVzZSBERUZJTkVfRFJNX0dF
TV9GT1BTKCkKCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCAgICAgICAgICAgICAgICAg
fCAgNSArLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmggICAgICAgICAgICAgIHwg
IDUgLS0KIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5
ICsrKwogaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaCAgICAgICAgICAgIHwgMjgg
Ky0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaCAgICAgICAgICAgICAg
fCAzMiArKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAg
ICAgICAgfCAgOSArLS0KIGluY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oICAgICAgICAg
ICAgICB8IDI3IC0tLS0tLS0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAg
ICAgICAgICAgIHwgIDggKysrCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAg
ICAgICAgICAgfCAxMSArKystCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAg
ICAgICAgICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jICAgICAg
ICAgICAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgICAgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgICAgICAg
IHwgMTggKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgICAgICAg
ICAgfCA0NyArKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMgICAgICAgICB8IDUzICstLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3ZyYW1fbW1faGVscGVyLmMgICAgICAgICAgfCA0NCArLS0tLS0tLS0tLS0tLQogLi4uL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyAgIHwgIDYgKy0KIGRyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfZHJ2LmMgICAgICAgICAgICAgICAgIHwgMTkgKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kdW1iLmMgICAgICAgICAgICAgICAgfCAxNyAtLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2lvY3RsLmMgICAgICAgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9vYmplY3QuYyAgICAgICAgICAgICAgfCAxMyArKysrKwogZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfdHRtLmMgICAgICAgICAgICAgICAgIHwgNTggKystLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgICAgICAgICAgICAgIHwgMjkgKysrKysr
Ky0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgICAgICAgICAgICAgIHwgNTMg
KysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2JvLmMgICAgICAgICAg
ICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jICAgICAgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgICAgICAg
ICAgfCAgNSArLQogRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdCAgICAgICAgICAgICAgICAg
IHwgMTIgKysrKwogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
IHwgIDggKysrCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
fCAgMyArCiBkcml2ZXJzL2dwdS9kcm0vcXhsL0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAg
MSArCiAzNSBmaWxlcyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKSwgMzIzIGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCgot
LSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
