Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9AD9013
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB7B6E950;
	Wed, 16 Oct 2019 11:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EA46E945
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:52:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D314418CB904;
 Wed, 16 Oct 2019 11:52:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99235C1D6;
 Wed, 16 Oct 2019 11:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1593C31E9E; Wed, 16 Oct 2019 13:52:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/11] drm/ttm: add drm_gem_ttm_mmap()
Date: Wed, 16 Oct 2019 13:52:00 +0200
Message-Id: <20191016115203.20095-9-kraxel@redhat.com>
In-Reply-To: <20191016115203.20095-1-kraxel@redhat.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 16 Oct 2019 11:52:10 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGhlbHBlciBmdW5jdGlvbiB0byBtbWFwIHR0bSBibydzIHVzaW5nICZkcm1fZ2VtX29iamVj
dF9mdW5jcy5tbWFwKCkuCgpOb3RlIHRoYXQgd2l0aCB0aGlzIGNvZGUgcGF0aCBhY2Nlc3MgdmVy
aWZpY2F0aW9uIGlzIGRvbmUgYnkKZHJtX2dlbV9tbWFwKCkgKHdoaWNoIGNhbGxzIGRybV92bWFf
bm9kZV9pc19hbGxvd2VkKCgpKS4KVGhlICZ0dG1fYm9fZHJpdmVyLnZlcmlmeV9hY2Nlc3MoKSBj
YWxsYmFjayBpcyBpcyBub3QgdXNlZC4KCnYzOiB1c2UgdHRtX2JvX21tYXBfb2JqIGluc3RlYWQg
b2YgdHRtX2JvX21tYXBfdm1hX3NldHVwCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaCAg
ICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jIHwgMTcgKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJt
X2dlbV90dG1faGVscGVyLmgKaW5kZXggNjI2OGY4OWM1YTQ4Li4xMThjZWY3NmY4NGYgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9nZW1fdHRtX2hlbHBlci5oCkBAIC0xNSw1ICsxNSw3IEBACiAKIHZvaWQgZHJtX2dlbV90
dG1fcHJpbnRfaW5mbyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHVuc2lnbmVkIGludCBpbmRlbnQs
CiAJCQkgICAgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0pOworaW50IGRybV9nZW1f
dHRtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sCisJCSAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpOwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3R0bV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIu
YwppbmRleCBhNTM0MTA0ZDhiZWUuLjc0MTJiZmM1YzA1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3R0bV9oZWxwZXIuYwpAQCAtNTIsNSArNTIsMjIgQEAgdm9pZCBkcm1fZ2VtX3R0bV9wcmludF9p
bmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwKIH0KIEVYUE9S
VF9TWU1CT0woZHJtX2dlbV90dG1fcHJpbnRfaW5mbyk7CiAKKy8qKgorICogZHJtX2dlbV90dG1f
bW1hcCgpIC0gbW1hcCAmdHRtX2J1ZmZlcl9vYmplY3QKKyAqIEBnZW06IEdFTSBvYmplY3QuCisg
KiBAdm1hOiB2bSBhcmVhLgorICoKKyAqIFRoaXMgZnVuY3Rpb24gY2FuIGJlIHVzZWQgYXMgJmRy
bV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAKKyAqIGNhbGxiYWNrLgorICovCitpbnQgZHJtX2dlbV90
dG1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSwKKwkJICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKK3sKKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gZHJtX2dl
bV90dG1fb2ZfZ2VtKGdlbSk7CisKKwlyZXR1cm4gdHRtX2JvX21tYXBfb2JqKHZtYSwgYm8pOwor
fQorRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3R0bV9tbWFwKTsKKwogTU9EVUxFX0RFU0NSSVBUSU9O
KCJEUk0gZ2VtIHR0bSBoZWxwZXJzIik7CiBNT0RVTEVfTElDRU5TRSgiR1BMIik7Ci0tIAoyLjE4
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
