Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F69AC18
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B3F6EC63;
	Fri, 23 Aug 2019 09:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B146EC60
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:55:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D02AB18C8908;
 Fri, 23 Aug 2019 09:55:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43AE36CE71;
 Fri, 23 Aug 2019 09:55:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2261B16E2D; Fri, 23 Aug 2019 11:55:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 00/18] drm/virtio: switch from ttm to gem shmem helpers.
Date: Fri, 23 Aug 2019 11:54:45 +0200
Message-Id: <20190823095503.2261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 09:55:11 +0000 (UTC)
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
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2ODoKIC0gcmViYXNlIHRvIGxhdGVz
dCBkcm0tbWlzYy1uZXh0LCBhZGFwdCB0byBjaGFuZ2VzLgp2NzoKIC0gcmViYXNlIHRvIGxhdGVz
dCBkcm0tbWlzYy1uZXh0CiAtIHJlb3JkZXIgcGF0Y2hlczogc3dpdGNoIGFsbCB2aXJ0aW8gY29t
bWFuZHMgdG8gb2JqZWN0IGFycmF5IGhlbHBlcnMKICAgZmlyc3QuIHRoZW4gZHJvcCB0dG0sIHRv
IG1ha2Ugc3VyZSB3ZSBkb24ndCByZWxlYXNlIG9iamVjdHMgc3RpbGwgaW4KICAgdXNlLgogLSBt
aXNjIGZpeGVzLgp2NjoKIC0gbGFyZ2VseSByZXdyaXRlIGZlbmNpbmcgbG9naWMsIHVzaW5nIHRo
ZSB2aXJ0aW9fZ3B1X2FycmF5XyogaGVscGVycwogLSBhZGQgbW9yZSBwYXRjaGVzIHRvIHRoZSBz
ZXJpZXMuCnY1OgogLSBmZW5jZSBidWdmaXhlcy4KIC0gbWlub3Igb3B0aW1pemF0aW9ucy4KdjQ6
CiAtIG1ha2UgZ2VtIGFycmF5IGhlbHBlcnMgcHJpdmF0ZSB0byB2aXJ0aW8uCiAtIG1pc2MgbWlu
b3IgZml4ZXMuCnYzOgogLSBhZGQgZ2VtIGFycmF5IGhlbHBlcnMuCiAtIHJld29yayBmZW5jaW5n
LgoKcGxlYXNlIHJldmlldy4KCnRoYW5rcywKICBHZXJkCgpHZXJkIEhvZmZtYW5uICgxOCk6CiAg
ZHJtL3ZpcnRpbzogcGFzcyBnZW0gcmVzZXJ2YXRpb24gb2JqZWN0IHRvIHR0bSBpbml0CiAgZHJt
L3ZpcnRpbzogc3dpdGNoIHZpcnRpb19ncHVfd2FpdF9pb2N0bCgpIHRvIGdlbSBoZWxwZXIuCiAg
ZHJtL3ZpcnRpbzogc2ltcGxpZnkgY3Vyc29yIHVwZGF0ZXMKICBkcm0vdmlydGlvOiByZW1vdmUg
dmlydGlvX2dwdV9vYmplY3Rfd2FpdAogIGRybS92aXJ0aW86IGRyb3Agbm9fd2FpdCBhcmd1bWVu
dCBmcm9tIHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUKICBkcm0vdmlydGlvOiByZW1vdmUgdHRt
IGNhbGxzIGZyb20gaW4KICAgIHZpcnRpb19ncHVfb2JqZWN0X3tyZXNlcnZlLHVucmVzZXJ2ZX0K
ICBkcm0vdmlydGlvOiBhZGQgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgJiBoZWxwZXJzCiAgZHJt
L3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCBmZW5jaW5nCiAgZHJt
L3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfb2JqZWN0X2NyZWF0ZSBmZW5jaW5nCiAgZHJtL3Zp
cnRpbzogcmV3b3JrIHZpcnRpb19ncHVfdHJhbnNmZXJfZnJvbV9ob3N0X2lvY3RsIGZlbmNpbmcK
ICBkcm0vdmlydGlvOiByZXdvcmsgdmlydGlvX2dwdV90cmFuc2Zlcl90b19ob3N0X2lvY3RsIGZl
bmNpbmcKICBkcm0vdmlydGlvOiByZXdvcmsgdmlydGlvX2dwdV9jbWRfY29udGV4dF97YXR0YWNo
LGRldGFjaH1fcmVzb3VyY2UKICBkcm0vdmlydGlvOiBkcm9wIHZpcnRpb19ncHVfb2JqZWN0X2xp
c3RfdmFsaWRhdGUvdmlydGlvX2dwdV91bnJlZl9saXN0CiAgZHJtL3ZpcnRpbzogc3dpdGNoIGZy
b20gdHRtIHRvIGdlbSBzaG1lbSBoZWxwZXJzCiAgZHJtL3ZpcnRpbzogcmVtb3ZlIHZpcnRpb19n
cHVfYWxsb2Nfb2JqZWN0CiAgZHJtL3ZpcnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF97cmVm
LHVucmVmfQogIGRybS92aXJ0aW86IGRyb3AgdmlydGlvX2dwdV9vYmplY3Rfe3Jlc2VydmUsdW5y
ZXNlcnZlfQogIGRybS92aXJ0aW86IGFkZCBmZW5jZSBzYW5pdHkgY2hlY2sKCiBkcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICAgfCAxMjMgKysrLS0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jICAgIHwgIDIwICstCiBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZmVuY2UuYyAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2dlbS5jICAgIHwgMTU2ICsrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2lvY3RsLmMgIHwgMjIxICsrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfa21zLmMgICAgfCAgIDkgLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X29iamVjdC5jIHwgMjIwICsrKysrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyAgfCAgMzQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfcHJpbWUuYyAgfCAgMzQgLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfdHRtLmMgICAgfCAzMDUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyAgICAgfCAgNzggKysrKy0tCiBkcml2ZXJzL2dwdS9k
cm0vdmlydGlvL0tjb25maWcgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vTWFrZWZpbGUgICAgICAgICB8ICAgMiArLQogMTMgZmlsZXMgY2hhbmdlZCwgMzcwIGluc2Vy
dGlvbnMoKyksIDgzOCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfdHRtLmMKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
