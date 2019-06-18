Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696674A2FD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE156E1A4;
	Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B4F6E194
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 432723087926
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC573608C2;
 Tue, 18 Jun 2019 13:58:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D7D716E05; Tue, 18 Jun 2019 15:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/12] drm/virtio: switch from ttm to gem shmem helpers.
Date: Tue, 18 Jun 2019 15:58:08 +0200
Message-Id: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
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
by1ncHUgbmVlZHMuICBMZXRzIGdldCByaWQKb2YgaXQuCgpjaGVlcnMsCiAgR2VyZAoKR2VyZCBI
b2ZmbWFubiAoMTIpOgogIGRybS92aXJ0aW86IHBhc3MgZ2VtIHJlc2VydmF0aW9uIG9iamVjdCB0
byB0dG0gaW5pdAogIGRybS92aXJ0aW86IHN3aXRjaCB2aXJ0aW9fZ3B1X3dhaXRfaW9jdGwoKSB0
byBnZW0gaGVscGVyLgogIGRybS92aXJ0aW86IHNpbXBsaWZ5IGN1cnNvciB1cGRhdGVzCiAgZHJt
L3ZpcnRpbzogcmVtb3ZlIHZpcnRpb19ncHVfb2JqZWN0X3dhaXQKICBkcm0vdmlydGlvOiBkcm9w
IG5vX3dhaXQgYXJndW1lbnQgZnJvbSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlCiAgZHJtL3Zp
cnRpbzogcmVtb3ZlIHR0bSBjYWxscyBmcm9tIGluCiAgICB2aXJ0aW9fZ3B1X29iamVjdF97cmVz
ZXJ2ZSx1bnJlc2VydmV9CiAgZHJtL3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfZXhlY2J1ZmZl
cl9pb2N0bCBmZW5jaW5nCiAgZHJtL3ZpcnRpbzogcmV3b3JrIHZpcnRpb19ncHVfb2JqZWN0X2Ny
ZWF0ZSBmZW5jaW5nCiAgZHJtL3ZpcnRpbzogZHJvcCB2aXJ0aW9fZ3B1X29iamVjdF9saXN0X3Zh
bGlkYXRlL3ZpcnRpb19ncHVfdW5yZWZfbGlzdAogIGRybS92aXJ0aW86IHN3aXRjaCBmcm9tIHR0
bSB0byBnZW0gc2htZW0gaGVscGVycwogIGRybS92aXJ0aW86IHJld29yayB2aXJ0aW9fZ3B1X29i
amVjdF9jcmVhdGUgZmVuY2luZyBldmVuIG1vcmUuCiAgZHJtL3ZpcnRpbzogcmVtb3ZlIHZpcnRp
b19ncHVfYWxsb2Nfb2JqZWN0CgogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5o
ICAgIHwgIDYzICstLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAg
fCAgMjAgKy0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYyAgICB8ICA0MyAr
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyAgfCAxMjggKysrLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgIHwgICA5IC0KIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDE5OSArKysrLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyAgfCAgMTMgKy0KIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5jICB8ICAzNyAtLS0KIGRyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV90dG0uYyAgICB8IDMwNCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jICAgICB8ICAyNCArLQog
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnICAgICAgICAgIHwgICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL01ha2VmaWxlICAgICAgICAgfCAgIDIgKy0KIDEyIGZpbGVzIGNoYW5n
ZWQsIDEzMyBpbnNlcnRpb25zKCspLCA3MTEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3R0bS5jCgotLSAKMi4xOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
