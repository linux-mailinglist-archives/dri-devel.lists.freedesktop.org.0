Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD5D9005
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96EB6E946;
	Wed, 16 Oct 2019 11:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D646E944
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:52:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CDC273003194;
 Wed, 16 Oct 2019 11:52:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE91260C57;
 Wed, 16 Oct 2019 11:52:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CD05A92F; Wed, 16 Oct 2019 13:52:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/11] drm: rework mmap() workflow
Date: Wed, 16 Oct 2019 13:51:52 +0200
Message-Id: <20191016115203.20095-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 16 Oct 2019 11:52:07 +0000 (UTC)
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
byBzaG93IHRoaW5ncyBpbiBhY3Rpb24gZm9yIHJldmlldy4KCnY0OgogLSBwaWNrIHVwIGEgcmV2
aWV3ZWQtYnkgbWlzc2VkLgogLSBhZGQgY2hhbmdlbG9ncyB0byBwYXRjaCBjb21taXQgbXNncy4K
IC0gbWFrZSB0dG1fYm9fbW1hcF92bWFfc2V0dXAgc3RhdGljLgoKR2VyZCBIb2ZmbWFubiAoMTEp
OgogIGRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9mdW5jcwogIGRybS9zaG1lbTog
c3dpdGNoIHNobWVtIGhlbHBlciB0byAmZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcAogIGRybS9z
aG1lbTogZHJvcCBWTV9ET05URFVNUAogIGRybS9zaG1lbTogZHJvcCBWTV9JTwogIGRybS9zaG1l
bTogZHJvcCBERUZJTkVfRFJNX0dFTV9TSE1FTV9GT1BTCiAgZHJtL3R0bTogZmFjdG9yIG91dCB0
dG1fYm9fbW1hcF92bWFfc2V0dXAKICBkcm0vdHRtOiByZW5hbWUgdHRtX2ZiZGV2X21tYXAKICBk
cm0vdHRtOiBhZGQgZHJtX2dlbV90dG1fbW1hcCgpCiAgZHJtL3ZyYW06IHN3aXRjaCB2cmFtIGhl
bHBlciB0byAmZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCgpCiAgZHJtL3ZyYW06IGRyb3AgdmVy
aWZ5X2FjY2VzcwogIGRybS92cmFtOiBkcm9wIERSTV9WUkFNX01NX0ZJTEVfT1BFUkFUSU9OUwoK
IGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysr
CiBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oICAgICAgICAgICAgfCAzMCArLS0t
LS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaCAgICAgICAgICAgICAgfCAg
MiArCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAgICAgICAgfCAyNSAt
LS0tLS0tLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAgICAgICAgICAgICAgICB8
IDEwICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyAgICB8
ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAgICAgICAgICAgfCAg
NSArLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jICAgICAgICAgICAgIHwgIDUg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgICAgICAgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgICAgICAgfCAyNyArKysr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICAgICAgICB8IDI4
ICsrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyAgICAgICAg
ICB8IDE3ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAg
ICAgIHwgNTYgKy0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
ICAgICAgICAgICAgICAgICAgIHwgIDkgKysrCiAuLi4vZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
aGlibWNfZHJtX2Rydi5jICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuYyAgICAgICAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z2VtLmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyAgICAg
ICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgICAgICAg
ICAgICAgICB8IDU0ICsrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rf
Ym8uYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Ry
di5jICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zi
b3hfZHJ2LmMgICAgICAgICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9v
YmplY3QuYyAgICAgICB8ICAyICstCiAyNSBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygr
KSwgMTk5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
