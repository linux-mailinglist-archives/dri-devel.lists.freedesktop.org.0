Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D7B76F3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 12:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1166F9AB;
	Thu, 19 Sep 2019 10:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892196F99B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1B923083392;
 Thu, 19 Sep 2019 10:02:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1855D9CC;
 Thu, 19 Sep 2019 10:02:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D45D17444; Thu, 19 Sep 2019 12:02:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/11] drm: rework mmap() workflow
Date: Thu, 19 Sep 2019 12:02:12 +0200
Message-Id: <20190919100223.13309-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 19 Sep 2019 10:02:27 +0000 (UTC)
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

QWRkIG1tYXAgY2FsbGJhY2sgdG8gc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzLCB3aGljaCBp
cyBzdXBwb3NlZCB0bwpoYW5kbGUgdGhlIHZtYSBzZXR1cC4gIEl0IHdpbGwgYmUgdXNlZCBieSBi
b3RoIG5vcm1hbCBmb3BzLT5tbWFwICh2aWEKZHJtX2dlbV9tbWFwX29iaigpKSBhbmQgcHJpbWUg
bW1hcCAodmlhIGRybV9nZW1fcHJpbWVfbW1hcCgpKS4KCkZvciBzdGFydGVycyB0aGUgc2htZW0g
YW5kIHZyYW0gaGVscGVycyBhcmUgc3dpdGNoZWQgb3ZlciB0byB0aGUgbmV3CndvcmtmbG93LCB0
byBzaG93IHRoaW5ncyBpbiBhY3Rpb24gZm9yIHJldmlldy4KCkdlcmQgSG9mZm1hbm4gKDExKToK
ICBkcm06IGFkZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MKICBkcm0vc2htZW06IHN3
aXRjaCBzaG1lbSBoZWxwZXIgdG8gJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAKICBkcm0vc2ht
ZW06IGRyb3AgVk1fRE9OVERVTVAKICBkcm0vc2htZW06IGRyb3AgVk1fSU8KICBkcm0vc2htZW06
IGRyb3AgREVGSU5FX0RSTV9HRU1fU0hNRU1fRk9QUwogIGRybS90dG06IGZhY3RvciBvdXQgdHRt
X2JvX21tYXBfdm1hX3NldHVwCiAgZHJtL3R0bTogcmVuYW1lIHR0bV9mYmRldl9tbWFwCiAgZHJt
L3R0bTogYWRkIGRybV9nZW1fdHRtX21tYXAoKQogIGRybS92cmFtOiBzd2l0Y2ggdnJhbSBoZWxw
ZXIgdG8gJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAoKQogIGRybS92cmFtOiBkcm9wIHZlcmlm
eV9hY2Nlc3MKICBkcm0vdnJhbTogZHJvcCBEUk1fVlJBTV9NTV9GSUxFX09QRVJBVElPTlMKCiBp
bmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKwog
aW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaCAgICAgICAgICAgIHwgMzAgKy0tLS0t
LS0tLQogaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggICAgICAgICAgICAgIHwgIDIg
KwogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAgICAgICAgIHwgMjUgLS0t
LS0tLS0tCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgICAgfCAx
MCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgICAgfCAg
NSArLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgICAgICAgICAgICAgICAgIHwgIDUg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYyAgICAgICAgICAgICB8ICA1ICst
CiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgICAgICAgfCAgMiArLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgICAgICAgIHwgMjcgKysrKysr
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyAgICAgICAgfCAyOCAr
KysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgICAgICAgICAg
fCAxNyArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgICAg
ICB8IDU2ICstLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAg
ICAgICAgICAgICAgICAgICB8ICA5ICsrKwogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hp
Ym1jX2RybV9kcnYuYyAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmMgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZHJ2LmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bS5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgICAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgICAg
ICAgICAgfCA1NCArKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Jv
LmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYu
YyAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94
X2Rydi5jICAgICAgICAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9k
cnYuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2Jq
ZWN0LmMgICAgICAgfCAgMiArLQogMjUgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyks
IDE5OSBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
