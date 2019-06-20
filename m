Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA94C71A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B566E4BE;
	Thu, 20 Jun 2019 06:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CED6E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:07:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B70C781126
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:07:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 543C519C4F;
 Thu, 20 Jun 2019 06:07:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 310FE1750A; Thu, 20 Jun 2019 08:07:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/12] drm/virtio: switch from ttm to gem shmem helpers.
Date: Thu, 20 Jun 2019 08:07:14 +0200
Message-Id: <20190620060726.926-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 20 Jun 2019 06:07:29 +0000 (UTC)
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
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgp2NDoKIC0gbWFrZSBnZW0gYXJyYXkg
aGVscGVycyBwcml2YXRlIHRvIHZpcnRpby4KIC0gbWlzYyBtaW5vciBmaXhlcy4KdjM6CiAtIGFk
ZCBnZW0gYXJyYXkgaGVscGVycy4KIC0gcmV3b3JrIGZlbmNpbmcuCgpjaGVlcnMsCiAgR2VyZAoK
R2VyZCBIb2ZmbWFubiAoMTIpOgogIGRybS92aXJ0aW86IHBhc3MgZ2VtIHJlc2VydmF0aW9uIG9i
amVjdCB0byB0dG0gaW5pdAogIGRybS92aXJ0aW86IHN3aXRjaCB2aXJ0aW9fZ3B1X3dhaXRfaW9j
dGwoKSB0byBnZW0gaGVscGVyLgogIGRybS92aXJ0aW86IHNpbXBsaWZ5IGN1cnNvciB1cGRhdGVz
CiAgZHJtL3ZpcnRpbzogcmVtb3ZlIHZpcnRpb19ncHVfb2JqZWN0X3dhaXQKICBkcm0vdmlydGlv
OiBkcm9wIG5vX3dhaXQgYXJndW1lbnQgZnJvbSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlCiAg
ZHJtL3ZpcnRpbzogcmVtb3ZlIHR0bSBjYWxscyBmcm9tIGluCiAgICB2aXJ0aW9fZ3B1X29iamVj
dF97cmVzZXJ2ZSx1bnJlc2VydmV9CiAgZHJtL3ZpcnRpbzogYWRkIHZpcnRpb19ncHVfb2JqZWN0
X2FycmF5ICYgaGVscGVycwogIGRybS92aXJ0aW86IHJld29yayB2aXJ0aW9fZ3B1X2V4ZWNidWZm
ZXJfaW9jdGwgZmVuY2luZwogIGRybS92aXJ0aW86IHJld29yayB2aXJ0aW9fZ3B1X29iamVjdF9j
cmVhdGUgZmVuY2luZwogIGRybS92aXJ0aW86IGRyb3AgdmlydGlvX2dwdV9vYmplY3RfbGlzdF92
YWxpZGF0ZS92aXJ0aW9fZ3B1X3VucmVmX2xpc3QKICBkcm0vdmlydGlvOiBzd2l0Y2ggZnJvbSB0
dG0gdG8gZ2VtIHNobWVtIGhlbHBlcnMKICBkcm0vdmlydGlvOiByZW1vdmUgdmlydGlvX2dwdV9h
bGxvY19vYmplY3QKCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICAgfCAg
ODYgKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jICAgIHwgIDIw
ICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMgICAgfCAgOTMgKysrKyst
LS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jICB8IDE1NCArKysrLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyAgICB8ICAgOSAtCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAyMTAgKysrKystLS0tLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgIHwgIDEzICstCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYyAgfCAgMzcgLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdHRtLmMgICAgfCAzMDQgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyAgICAgfCAgNDggKysr
LQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnICAgICAgICAgIHwgICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL01ha2VmaWxlICAgICAgICAgfCAgIDIgKy0KIDEyIGZpbGVzIGNo
YW5nZWQsIDIzNiBpbnNlcnRpb25zKCspLCA3NDIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3R0bS5jCgotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
