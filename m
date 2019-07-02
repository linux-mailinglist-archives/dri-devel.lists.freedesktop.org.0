Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53945D15F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 16:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83B89EA3;
	Tue,  2 Jul 2019 14:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741F89EA3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 14:19:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D182F300183C;
 Tue,  2 Jul 2019 14:19:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D44C85D9D6;
 Tue,  2 Jul 2019 14:19:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9145911AB5; Tue,  2 Jul 2019 16:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/18] drm/virtio: switch from ttm to gem shmem helpers.
Date: Tue,  2 Jul 2019 16:18:45 +0200
Message-Id: <20190702141903.1131-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 14:19:07 +0000 (UTC)
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
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2NjoKIC0gbGFyZ2VseSByZXdyaXRl
IGZlbmNpbmcgbG9naWMsIHVzaW5nIHRoZSB2aXJ0aW9fZ3B1X2FycmF5XyogaGVscGVycwogLSBh
ZGQgbW9yZSBwYXRjaGVzIHRvIHRoZSBzZXJpZXMuCnY1OgogLSBmZW5jZSBidWdmaXhlcy4KIC0g
bWlub3Igb3B0aW1pemF0aW9ucy4KdjQ6CiAtIG1ha2UgZ2VtIGFycmF5IGhlbHBlcnMgcHJpdmF0
ZSB0byB2aXJ0aW8uCiAtIG1pc2MgbWlub3IgZml4ZXMuCnYzOgogLSBhZGQgZ2VtIGFycmF5IGhl
bHBlcnMuCiAtIHJld29yayBmZW5jaW5nLgoKY2hlZXJzLAogIEdlcmQKCkdlcmQgSG9mZm1hbm4g
KDE4KToKICBkcm0vdmlydGlvOiBwYXNzIGdlbSByZXNlcnZhdGlvbiBvYmplY3QgdG8gdHRtIGlu
aXQKICBkcm0vdmlydGlvOiBzd2l0Y2ggdmlydGlvX2dwdV93YWl0X2lvY3RsKCkgdG8gZ2VtIGhl
bHBlci4KICBkcm0vdmlydGlvOiBzaW1wbGlmeSBjdXJzb3IgdXBkYXRlcwogIGRybS92aXJ0aW86
IHJlbW92ZSB2aXJ0aW9fZ3B1X29iamVjdF93YWl0CiAgZHJtL3ZpcnRpbzogZHJvcCBub193YWl0
IGFyZ3VtZW50IGZyb20gdmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZQogIGRybS92aXJ0aW86IHJl
bW92ZSB0dG0gY2FsbHMgZnJvbSBpbgogICAgdmlydGlvX2dwdV9vYmplY3Rfe3Jlc2VydmUsdW5y
ZXNlcnZlfQogIGRybS92aXJ0aW86IGFkZCB2aXJ0aW9fZ3B1X29iamVjdF9hcnJheSAmIGhlbHBl
cnMKICBkcm0vdmlydGlvOiByZXdvcmsgdmlydGlvX2dwdV9leGVjYnVmZmVyX2lvY3RsIGZlbmNp
bmcKICBkcm0vdmlydGlvOiByZXdvcmsgdmlydGlvX2dwdV9vYmplY3RfY3JlYXRlIGZlbmNpbmcK
ICBkcm0vdmlydGlvOiBkcm9wIHZpcnRpb19ncHVfb2JqZWN0X2xpc3RfdmFsaWRhdGUvdmlydGlv
X2dwdV91bnJlZl9saXN0CiAgZHJtL3ZpcnRpbzogc3dpdGNoIGZyb20gdHRtIHRvIGdlbSBzaG1l
bSBoZWxwZXJzCiAgZHJtL3ZpcnRpbzogcmVtb3ZlIHZpcnRpb19ncHVfYWxsb2Nfb2JqZWN0CiAg
ZHJtL3ZpcnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF97cmVmLHVucmVmfQogIGRybS92aXJ0
aW86IHJld29yayB2aXJ0aW9fZ3B1X3RyYW5zZmVyX2Zyb21faG9zdF9pb2N0bCBmZW5jaW5nCiAg
ZHJtL3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfdHJhbnNmZXJfdG9faG9zdF9pb2N0bCBmZW5j
aW5nCiAgZHJtL3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfY21kX2NvbnRleHRfe2F0dGFjaCxk
ZXRhY2h9X3Jlc291cmNlCiAgZHJtL3ZpcnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF97cmVz
ZXJ2ZSx1bnJlc2VydmV9CiAgZHJtL3ZpcnRpbzogYWRkIGZlbmNlIHNhbml0eSBjaGVjawoKIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgICB8IDEyMSArKystLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAgfCAgMjAgKy0KIGRyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZ2VtLmMgICAgfCAxNDYgKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyAgfCAyMjIgKysrKysrLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyAgICB8ICAgOSAtCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAyMjAgKysrKystLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jICB8ICAxMyArLQogZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMgIHwgIDM3IC0tLQogZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X3R0bS5jICAgIHwgMzA0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgICAgIHwgIDcyICsrKystLQogZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL01ha2VmaWxlICAgICAgICAgfCAgIDIgKy0KIDEzIGZpbGVzIGNoYW5nZWQsIDMz
OCBpbnNlcnRpb25zKCspLCA4MzQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3R0bS5jCgotLSAKMi4xOC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
