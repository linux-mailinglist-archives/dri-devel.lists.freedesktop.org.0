Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF64B4A5B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16E46EB8A;
	Tue, 17 Sep 2019 09:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6376EB82
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:24:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B21483F3C;
 Tue, 17 Sep 2019 09:24:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93D376012E;
 Tue, 17 Sep 2019 09:24:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF9AC16E05; Tue, 17 Sep 2019 11:24:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/11] drm: rework mmap() workflow
Date: Tue, 17 Sep 2019 11:23:53 +0200
Message-Id: <20190917092404.9982-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 17 Sep 2019 09:24:09 +0000 (UTC)
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
X2JvX21tYXBfdm1hX3NldHVwCiAgZHJtL3R0bTogZHJvcCBWTV9ET05URFVNUAogIGRybS90dG06
IGFkZCBkcm1fZ2VtX3R0bV9tbWFwKCkKICBkcm0vdnJhbTogc3dpdGNoIHZyYW0gaGVscGVyIHRv
ICZkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwKCkKICBkcm0vdnJhbTogZHJvcCB2ZXJpZnlfYWNj
ZXNzCiAgZHJtL3ZyYW06IGRyb3AgRFJNX1ZSQU1fTU1fRklMRV9PUEVSQVRJT05TCgogaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysKIGluY2x1
ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggICAgICAgICAgICB8IDMwICstLS0tLS0tLS0K
IGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oICAgICAgICAgICAgICB8ICAyICsKIGlu
Y2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgICAgICB8IDI1IC0tLS0tLS0t
LQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgICAgICAgICAgIHwgIDggKysr
CiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAgICAgICAgICAgfCAgNSArLQog
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jICAgICAgICAgICAgIHwgIDUgKy0KIGRy
aXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgICAgICAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgICAgICAgfCAyNyArKysrKystLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICAgICAgICB8IDI4ICsrKyst
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyAgICAgICAgICB8IDE5
ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgICAgICB8
IDU2ICstLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgICAg
ICAgICAgICAgICAgICB8ICA5ICsrKwogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1j
X2RybV9kcnYuYyAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2
LmMgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5j
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgICAgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgICAgICAg
ICAgfCA0NyArKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9iby5jICAg
ICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYu
YyAgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5j
ICAgICAgIHwgIDIgKy0KIDI0IGZpbGVzIGNoYW5nZWQsIDEyMCBpbnNlcnRpb25zKCspLCAxODYg
ZGVsZXRpb25zKC0pCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
