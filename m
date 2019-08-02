Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0797F807
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27A56EE11;
	Fri,  2 Aug 2019 13:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C246EE0D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:12:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24D868535D;
 Fri,  2 Aug 2019 13:12:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACEEE5D704;
 Fri,  2 Aug 2019 13:12:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ED25716E05; Fri,  2 Aug 2019 15:12:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 00/18] drm/virtio: switch from ttm to gem shmem helpers.
Date: Fri,  2 Aug 2019 15:12:07 +0200
Message-Id: <20190802131225.17760-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 02 Aug 2019 13:12:30 +0000 (UTC)
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
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2NzoKIC0gcmViYXNlIHRvIGxhdGVz
dCBkcm0tbWlzYy1uZXh0CiAtIHJlb3JkZXIgcGF0Y2hlczogc3dpdGNoIGFsbCB2aXJ0aW8gY29t
bWFuZHMgdG8gb2JqZWN0IGFycmF5IGhlbHBlcnMKICAgZmlyc3QuIHRoZW4gZHJvcCB0dG0sIHRv
IG1ha2Ugc3VyZSB3ZSBkb24ndCByZWxlYXNlIG9iamVjdHMgc3RpbGwgaW4KICAgdXNlLgogLSBt
aXNjIGZpeGVzLgp2NjoKIC0gbGFyZ2VseSByZXdyaXRlIGZlbmNpbmcgbG9naWMsIHVzaW5nIHRo
ZSB2aXJ0aW9fZ3B1X2FycmF5XyogaGVscGVycwogLSBhZGQgbW9yZSBwYXRjaGVzIHRvIHRoZSBz
ZXJpZXMuCnY1OgogLSBmZW5jZSBidWdmaXhlcy4KIC0gbWlub3Igb3B0aW1pemF0aW9ucy4KdjQ6
CiAtIG1ha2UgZ2VtIGFycmF5IGhlbHBlcnMgcHJpdmF0ZSB0byB2aXJ0aW8uCiAtIG1pc2MgbWlu
b3IgZml4ZXMuCnYzOgogLSBhZGQgZ2VtIGFycmF5IGhlbHBlcnMuCiAtIHJld29yayBmZW5jaW5n
LgoKY2hlZXJzLAogIEdlcmQKCkdlcmQgSG9mZm1hbm4gKDE4KToKICBkcm0vdmlydGlvOiBwYXNz
IGdlbSByZXNlcnZhdGlvbiBvYmplY3QgdG8gdHRtIGluaXQKICBkcm0vdmlydGlvOiBzd2l0Y2gg
dmlydGlvX2dwdV93YWl0X2lvY3RsKCkgdG8gZ2VtIGhlbHBlci4KICBkcm0vdmlydGlvOiBzaW1w
bGlmeSBjdXJzb3IgdXBkYXRlcwogIGRybS92aXJ0aW86IHJlbW92ZSB2aXJ0aW9fZ3B1X29iamVj
dF93YWl0CiAgZHJtL3ZpcnRpbzogZHJvcCBub193YWl0IGFyZ3VtZW50IGZyb20gdmlydGlvX2dw
dV9vYmplY3RfcmVzZXJ2ZQogIGRybS92aXJ0aW86IHJlbW92ZSB0dG0gY2FsbHMgZnJvbSBpbgog
ICAgdmlydGlvX2dwdV9vYmplY3Rfe3Jlc2VydmUsdW5yZXNlcnZlfQogIGRybS92aXJ0aW86IGFk
ZCB2aXJ0aW9fZ3B1X29iamVjdF9hcnJheSAmIGhlbHBlcnMKICBkcm0vdmlydGlvOiByZXdvcmsg
dmlydGlvX2dwdV9leGVjYnVmZmVyX2lvY3RsIGZlbmNpbmcKICBkcm0vdmlydGlvOiByZXdvcmsg
dmlydGlvX2dwdV9vYmplY3RfY3JlYXRlIGZlbmNpbmcKICBkcm0vdmlydGlvOiByZXdvcmsgdmly
dGlvX2dwdV90cmFuc2Zlcl9mcm9tX2hvc3RfaW9jdGwgZmVuY2luZwogIGRybS92aXJ0aW86IHJl
d29yayB2aXJ0aW9fZ3B1X3RyYW5zZmVyX3RvX2hvc3RfaW9jdGwgZmVuY2luZwogIGRybS92aXJ0
aW86IHJld29yayB2aXJ0aW9fZ3B1X2NtZF9jb250ZXh0X3thdHRhY2gsZGV0YWNofV9yZXNvdXJj
ZQogIGRybS92aXJ0aW86IGRyb3AgdmlydGlvX2dwdV9vYmplY3RfbGlzdF92YWxpZGF0ZS92aXJ0
aW9fZ3B1X3VucmVmX2xpc3QKICBkcm0vdmlydGlvOiBzd2l0Y2ggZnJvbSB0dG0gdG8gZ2VtIHNo
bWVtIGhlbHBlcnMKICBkcm0vdmlydGlvOiByZW1vdmUgdmlydGlvX2dwdV9hbGxvY19vYmplY3QK
ICBkcm0vdmlydGlvOiBkcm9wIHZpcnRpb19ncHVfb2JqZWN0X3tyZWYsdW5yZWZ9CiAgZHJtL3Zp
cnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF97cmVzZXJ2ZSx1bnJlc2VydmV9CiAgZHJtL3Zp
cnRpbzogYWRkIGZlbmNlIHNhbml0eSBjaGVjawoKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kcnYuaCAgICB8IDEyMyArKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZHJ2LmMgICAgfCAgMjAgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9m
ZW5jZS5jICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMgICAg
fCAxNTcgKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
YyAgfCAyMjQgKysrKysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9rbXMuYyAgICB8ICAgOSAtCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0
LmMgfCAyMjAgKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9wbGFuZS5jICB8ICAzNCArLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmlt
ZS5jICB8ICAzNyAtLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV90dG0uYyAgICB8
IDMwNSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV92cS5jICAgICB8ICA3OCArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vS2NvbmZp
ZyAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9NYWtlZmlsZSAgICAg
ICAgIHwgICAyICstCiAxMyBmaWxlcyBjaGFuZ2VkLCAzNzMgaW5zZXJ0aW9ucygrKSwgODQyIGRl
bGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV90dG0uYwoKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
