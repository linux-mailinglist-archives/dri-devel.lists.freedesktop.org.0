Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05BA160A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8476E09C;
	Thu, 29 Aug 2019 10:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5951C6E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D750218C4272;
 Thu, 29 Aug 2019 10:33:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB95E1001938;
 Thu, 29 Aug 2019 10:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EFE5E59F2; Thu, 29 Aug 2019 12:33:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 00/18] drm/virtio: switch from ttm to gem shmem helpers.
Date: Thu, 29 Aug 2019 12:32:43 +0200
Message-Id: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 29 Aug 2019 10:33:05 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHRtIGluY3JlYXNpbmdseSBnZXRzIGludG8gdGhlIHdheSB3aGlsZSBoYWNraW5nIG9uIHZpcnRp
by1ncHUgbWVtb3J5Cm1hbmFnZW1lbnQuICBJdCBhbHNvIG92ZXJraWxsIGZvciB3aGF0IHZpcnRp
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2OToKIC0gcmViYXNlIHRvIGxhdGVz
dCBkZW0tbWlzYy1uZXh0LCBhZGFwdCB0byBjaGFuZ2VzLgogLSBmaXggaXNzdWVzIGZvdW5kIGJ5
IENoaWEtSSBXdS4Kdjg6CiAtIHJlYmFzZSB0byBsYXRlc3QgZHJtLW1pc2MtbmV4dCwgYWRhcHQg
dG8gY2hhbmdlcy4Kdjc6CiAtIHJlYmFzZSB0byBsYXRlc3QgZHJtLW1pc2MtbmV4dAogLSByZW9y
ZGVyIHBhdGNoZXM6IHN3aXRjaCBhbGwgdmlydGlvIGNvbW1hbmRzIHRvIG9iamVjdCBhcnJheSBo
ZWxwZXJzCiAgIGZpcnN0LiB0aGVuIGRyb3AgdHRtLCB0byBtYWtlIHN1cmUgd2UgZG9uJ3QgcmVs
ZWFzZSBvYmplY3RzIHN0aWxsIGluCiAgIHVzZS4KIC0gbWlzYyBmaXhlcy4KdjY6CiAtIGxhcmdl
bHkgcmV3cml0ZSBmZW5jaW5nIGxvZ2ljLCB1c2luZyB0aGUgdmlydGlvX2dwdV9hcnJheV8qIGhl
bHBlcnMKIC0gYWRkIG1vcmUgcGF0Y2hlcyB0byB0aGUgc2VyaWVzLgp2NToKIC0gZmVuY2UgYnVn
Zml4ZXMuCiAtIG1pbm9yIG9wdGltaXphdGlvbnMuCnY0OgogLSBtYWtlIGdlbSBhcnJheSBoZWxw
ZXJzIHByaXZhdGUgdG8gdmlydGlvLgogLSBtaXNjIG1pbm9yIGZpeGVzLgp2MzoKIC0gYWRkIGdl
bSBhcnJheSBoZWxwZXJzLgogLSByZXdvcmsgZmVuY2luZy4KCnBsZWFzZSByZXZpZXcuCgp0aGFu
a3MsCiAgR2VyZAoKR2VyZCBIb2ZmbWFubiAoMTgpOgogIGRybS92aXJ0aW86IHBhc3MgZ2VtIHJl
c2VydmF0aW9uIG9iamVjdCB0byB0dG0gaW5pdAogIGRybS92aXJ0aW86IHN3aXRjaCB2aXJ0aW9f
Z3B1X3dhaXRfaW9jdGwoKSB0byBnZW0gaGVscGVyLgogIGRybS92aXJ0aW86IHNpbXBsaWZ5IGN1
cnNvciB1cGRhdGVzCiAgZHJtL3ZpcnRpbzogcmVtb3ZlIHZpcnRpb19ncHVfb2JqZWN0X3dhaXQK
ICBkcm0vdmlydGlvOiBkcm9wIG5vX3dhaXQgYXJndW1lbnQgZnJvbSB2aXJ0aW9fZ3B1X29iamVj
dF9yZXNlcnZlCiAgZHJtL3ZpcnRpbzogcmVtb3ZlIHR0bSBjYWxscyBmcm9tIGluCiAgICB2aXJ0
aW9fZ3B1X29iamVjdF97cmVzZXJ2ZSx1bnJlc2VydmV9CiAgZHJtL3ZpcnRpbzogYWRkIHZpcnRp
b19ncHVfb2JqZWN0X2FycmF5ICYgaGVscGVycwogIGRybS92aXJ0aW86IHJld29yayB2aXJ0aW9f
Z3B1X2V4ZWNidWZmZXJfaW9jdGwgZmVuY2luZwogIGRybS92aXJ0aW86IHJld29yayB2aXJ0aW9f
Z3B1X29iamVjdF9jcmVhdGUgZmVuY2luZwogIGRybS92aXJ0aW86IHJld29yayB2aXJ0aW9fZ3B1
X3RyYW5zZmVyX2Zyb21faG9zdF9pb2N0bCBmZW5jaW5nCiAgZHJtL3ZpcnRpbzogcmV3b3JrIHZp
cnRpb19ncHVfdHJhbnNmZXJfdG9faG9zdF9pb2N0bCBmZW5jaW5nCiAgZHJtL3ZpcnRpbzogcmV3
b3JrIHZpcnRpb19ncHVfY21kX2NvbnRleHRfe2F0dGFjaCxkZXRhY2h9X3Jlc291cmNlCiAgZHJt
L3ZpcnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF9saXN0X3ZhbGlkYXRlL3ZpcnRpb19ncHVf
dW5yZWZfbGlzdAogIGRybS92aXJ0aW86IHN3aXRjaCBmcm9tIHR0bSB0byBnZW0gc2htZW0gaGVs
cGVycwogIGRybS92aXJ0aW86IHJlbW92ZSB2aXJ0aW9fZ3B1X2FsbG9jX29iamVjdAogIGRybS92
aXJ0aW86IGRyb3AgdmlydGlvX2dwdV9vYmplY3Rfe3JlZix1bnJlZn0KICBkcm0vdmlydGlvOiBk
cm9wIHZpcnRpb19ncHVfb2JqZWN0X3tyZXNlcnZlLHVucmVzZXJ2ZX0KICBkcm0vdmlydGlvOiBh
ZGQgZmVuY2Ugc2FuaXR5IGNoZWNrCgogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5oICAgIHwgMTIzICsrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9k
cnYuYyAgICB8ICAyMCArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ZlbmNlLmMg
IHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYyAgICB8IDE1NiAr
KysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jICB8IDIy
NCArKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5j
ICAgIHwgICA5IC0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDIy
MiArKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5l
LmMgIHwgIDM0ICstLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMgIHwg
IDM0IC0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3R0bS5jICAgIHwgMzA1IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3Zx
LmMgICAgIHwgIDc4ICsrKystLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnICAgICAg
ICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL01ha2VmaWxlICAgICAgICAgfCAg
IDIgKy0KIDEzIGZpbGVzIGNoYW5nZWQsIDM3NiBpbnNlcnRpb25zKCspLCA4MzcgZGVsZXRpb25z
KC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3R0
bS5jCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
