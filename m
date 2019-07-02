Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7525CECA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 13:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF4B89AA2;
	Tue,  2 Jul 2019 11:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBEF89948
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:50:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BF1BB14C;
 Tue,  2 Jul 2019 11:50:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com, emil.l.velikov@gmail.com
Subject: [PATCH v3 0/5] Convert VRAM helpers to GEM object functions
Date: Tue,  2 Jul 2019 13:50:07 +0200
Message-Id: <20190702115012.4418-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
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

VGhlIFBSSU1FIGNhbGxiYWNrIGZ1bmN0aW9ucyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVw
cmVjYXRlZCBpbgpmYXZvciBvZiB0aGVpciBjb3VudGVycGFydHMgaW4gc3RydWN0IGRybV9nZW1f
b2JqZWN0X2Z1bmNzLgoKVGhpcyBwYXRjaCBzZXQgaW50cm9kdWNlcyBHRU0gb2JqZWN0IGZ1bmN0
aW9ucyBmb3IgVlJBTSBoZWxwZXJzIGFuZApjb252ZXJ0cyBvdmVyIHRoZSBmcmVlIGFuZCBQUklN
RSBmdW5jdGlvbnMuIERyaXZlcnMgYWZmZWN0ZWQgYnkgdGhpcwpjaGFuZ2UsIG5hbWVseSBib2No
cywgaGlibWMgYW5kIHZib3gsIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5LgoKdjI6CgkqIHJlbmFt
ZSBWUkFNIFBSSU1FIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIHJlcGxhY2luZyB0aGVtCgkqIHNldCBz
dHJ1Y3QgZHJtX2RyaXZlci5nZW1fcHJpbWVfbW1hcCBpbiBoaWJtYwoJKiByZXBsYWNlIHZib3gg
ZHJpdmVyJ3MgZW1wdHkgUFJJTUUgaW1wbGVtZW50YXRpb24KdjM6CgkqIG1vdmVkIG9iamVjdCB0
YWJsZSB0byBFT0YKCSoga2VwdCBhbGwgcmVuYW1lZCBmdW5jdGlvbnMgYXQgdGhlaXIgb3JpZ2lu
YWwgbG9jYXRpb24KCSoga2VwdCBkb2N1bWVudGF0aW9uCgpUaG9tYXMgWmltbWVybWFubiAoNSk6
CiAgZHJtL3ZyYW06IFNldCBHRU0gb2JqZWN0IGZ1bmN0aW9ucyBmb3IgUFJJTUUKICBkcm0vYm9j
aHM6IFJlbW92ZSBQUklNRSBoZWxwZXJzIGZyb20gZHJpdmVyIHN0cnVjdHVyZQogIGRybS9oaWJt
YzogVXBkYXRlIHN0cnVjdCBkcm1fZHJpdmVyIGZvciBHRU0gb2JqZWN0IGZ1bmN0aW9ucwogIGRy
bS92Ym94OiBSZW1vdmUgZW1wdHkgUFJJTUUgZnVuY3Rpb25zCiAgZHJtL3ZyYW06IERvbid0IGV4
cG9ydCBkcml2ZXIgY2FsbGJhY2sgZnVuY3Rpb25zIGZvciBQUklNRQoKIERvY3VtZW50YXRpb24v
Z3B1L3RvZG8ucnN0ICAgICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfZHJ2LmMgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jICAgICAgICAgfCA3OCArKysrKysrKystLS0tLS0tLS0tCiAuLi4v
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jICAgfCAgMyArLQogZHJpdmVy
cy9ncHUvZHJtL3Zib3h2aWRlby9NYWtlZmlsZSAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAgICAgICAgICB8ICA5IC0tLQogZHJpdmVycy9n
cHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5oICAgICAgICAgIHwgMTIgLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdmJveHZpZGVvL3Zib3hfcHJpbWUuYyAgICAgICAgfCA1NiAtLS0tLS0tLS0tLS0tCiBp
bmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAgICAgICAgfCAyNSArLS0tLS0K
IDkgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTQ4IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9wcmltZS5jCgot
LQoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
