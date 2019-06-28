Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630FE59A3D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126D16E8FC;
	Fri, 28 Jun 2019 12:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3486E8FC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:13:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 28C34308792C;
 Fri, 28 Jun 2019 12:13:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7371E6012D;
 Fri, 28 Jun 2019 12:13:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB82516E05; Fri, 28 Jun 2019 14:13:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/12] drm/virtio: switch from ttm to gem shmem helpers.
Date: Fri, 28 Jun 2019 14:13:26 +0200
Message-Id: <20190628121338.24398-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 28 Jun 2019 12:13:42 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHRtIGluY3JlYXNpbmdseSBnZXRzIGludG8gdGhlIHdheSB3aGlsZSBoYWNraW5nIG9uIHZpcnRp
by1ncHUgbWVtb3J5Cm1hbmFnZW1lbnQuICBJdCBhbHNvIG92ZXJraWxsIGZvciB3aGF0IHZpcnRp
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2NToKIC0gZmVuY2UgYnVnZml4ZXMu
CiAtIG1pbm9yIG9wdGltaXphdGlvbnMuCnY0OgogLSBtYWtlIGdlbSBhcnJheSBoZWxwZXJzIHBy
aXZhdGUgdG8gdmlydGlvLgogLSBtaXNjIG1pbm9yIGZpeGVzLgp2MzoKIC0gYWRkIGdlbSBhcnJh
eSBoZWxwZXJzLgogLSByZXdvcmsgZmVuY2luZy4KCmNoZWVycywKICBHZXJkCgpHZXJkIEhvZmZt
YW5uICgxMik6CiAgZHJtL3ZpcnRpbzogcGFzcyBnZW0gcmVzZXJ2YXRpb24gb2JqZWN0IHRvIHR0
bSBpbml0CiAgZHJtL3ZpcnRpbzogc3dpdGNoIHZpcnRpb19ncHVfd2FpdF9pb2N0bCgpIHRvIGdl
bSBoZWxwZXIuCiAgZHJtL3ZpcnRpbzogc2ltcGxpZnkgY3Vyc29yIHVwZGF0ZXMKICBkcm0vdmly
dGlvOiByZW1vdmUgdmlydGlvX2dwdV9vYmplY3Rfd2FpdAogIGRybS92aXJ0aW86IGRyb3Agbm9f
d2FpdCBhcmd1bWVudCBmcm9tIHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUKICBkcm0vdmlydGlv
OiByZW1vdmUgdHRtIGNhbGxzIGZyb20gaW4KICAgIHZpcnRpb19ncHVfb2JqZWN0X3tyZXNlcnZl
LHVucmVzZXJ2ZX0KICBkcm0vdmlydGlvOiBhZGQgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgJiBo
ZWxwZXJzCiAgZHJtL3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCBm
ZW5jaW5nCiAgZHJtL3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfb2JqZWN0X2NyZWF0ZSBmZW5j
aW5nCiAgZHJtL3ZpcnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF9saXN0X3ZhbGlkYXRlL3Zp
cnRpb19ncHVfdW5yZWZfbGlzdAogIGRybS92aXJ0aW86IHN3aXRjaCBmcm9tIHR0bSB0byBnZW0g
c2htZW0gaGVscGVycwogIGRybS92aXJ0aW86IHJlbW92ZSB2aXJ0aW9fZ3B1X2FsbG9jX29iamVj
dAoKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgICB8ICA4MyArKystLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAgfCAgMjAgKy0KIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYyAgICB8ICA4OCArKysrLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyAgfCAxNTggKysrKy0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMgICAgfCAgIDkgLQogZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIHwgMjExICsrKysrLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jICB8ICAxMyArLQogZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMgIHwgIDM3IC0tLQogZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X3R0bS5jICAgIHwgMzA0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgICAgIHwgIDQ1ICsrKy0KIGRyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vS2NvbmZpZyAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby9NYWtlZmlsZSAgICAgICAgIHwgICAyICstCiAxMiBmaWxlcyBjaGFuZ2VkLCAyMzQg
aW5zZXJ0aW9ucygrKSwgNzM4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV90dG0uYwoKLS0gCjIuMTguMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
