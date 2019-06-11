Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A746C3CC6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C88919F;
	Tue, 11 Jun 2019 13:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9988A89160
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0562FAE87;
 Tue, 11 Jun 2019 13:03:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] Remove explicit locking and kmap arguments from GEM
 VRAM interface
Date: Tue, 11 Jun 2019 15:03:35 +0200
Message-Id: <20190611130344.18988-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJpdmVycyBzaG91bGQgbm90IGhhdmUgdG8gY2FyZSBhYm91dCBpbnRlcm5hbCBsb2NraW5nIG9m
IEdFTSBWUkFNIG9iamVjdHMKYW5kIHRoZWlyIG1lbW9yeS1tYXBwaW5nIHN0cnVjdHVyZXMuIFRo
aXMgcGF0Y2ggc2V0IHJlbW92ZXMgYm90aCBmcm9tIHRoZQpHRU0gVlJBTSBpbnRlcmZhY2UuCgpU
aGlzIGFmZmVjdHMgdGhlIGFzdCBhbmQgbWdhZzIwMCBkcml2ZXJzLiBJbiBwbGFjZXMgd2hlcmUg
R0VNIG9iamVjdHMgYXJlCmJlaW5nIGxvY2tlZCBieSB0aGUgZHJpdmVyLCB0aGUgcGF0Y2ggY29u
dmVydHMgdGhlIGxvY2sgb3BlcmF0aW9uIHRvIGEgcGluCm9wZXJhdGlvbi4gVGhlIGxvY2tpbmcg
cHJldmVudGVkIHRoZSBtZW1vcnkgbWFuYWdlciBmcm9tIG1vdmluZyB0aGUgb2JqZWN0LApzbyBw
aW5uaW5nIGlzIG1vcmUgYXBwcm9wcmlhdGUuCgpGb3IgdGhlIG1lbW9yeSBtYXBwaW5ncywgYWxs
IGJvb2sta2VlcGluZyBpcyBkb25lIGJ5IHRoZSBpbXBsZW1lbnRhdGlvbgpvZiBHRU0gVlJBTS4g
RXhwbGljaXQga21hcCBvYmplY3RzIGFyZSByZW1vdmVkIGZyb20gdGhlIG1vZHVsZSdzIHB1Ymxp
YwppbnRlcmZhY2VzLiBUaGlzIGNoYW5nZSBtb3N0bHkgYWZmZWN0cyB0aGUgY3Vyc29yIGhhbmRs
aW5nIGluIGFzdCBhbmQKbWdhZzIwMCwgd2hpY2ggaXMgYmVpbmcgc2ltcGxpZmllZCBieSB0aGlz
IHBhdGNoIHNldC4KCkZ1dHVyZSBkaXJlY3Rpb25zOiB3aXRoIHRoZXNlIHBhdGNoZXMgaW4gcGxh
Y2UsIG1vcmUgY29kZSBpbiBtb2RlIHNldHRpbmcKYW5kIGZiZGV2IGVtdWxhdGlvbiBjYW4gYmUg
c2hhcmVkIGJldHdlZW4gYXN0IGFuZCBtZ2FnMjAwLgoKVGhlIHBhdGNoZXMgaGF2ZSBiZWVuIHRl
c3RlZCBvbiBhc3QgYW5kIG1nYWcyMDAgaGFyZHdhcmUuCgpUaG9tYXMgWmltbWVybWFubiAoOSk6
CiAgZHJtL2dlbS12cmFtOiBTdXBwb3J0IHBpbm5pbmcgYnVmZmVycyB0byBjdXJyZW50IGxvY2F0
aW9uCiAgZHJtL2FzdDogVW5waW4gY3Vyc29yIEJPIGR1cmluZyBjbGVhbnVwCiAgZHJtL2FzdDog
UmVtb3ZlIG9ic29sZXRlIG9yIHVudXNlZCBjdXJzb3Igc3RhdGUKICBkcm0vYXN0OiBQaW4gYW5k
IG1hcCBjdXJzb3Igc291cmNlIEJPIGR1cmluZyB1cGRhdGUKICBkcm0vYXN0OiBQaW4gZnJhbWVi
dWZmZXIgQk8gZHVyaW5nIGRpcnR5IHVwZGF0ZQogIGRybS9tZ2FnMjAwOiBQaW4gZnJhbWVidWZm
ZXIgQk8gZHVyaW5nIGRpcnR5IHVwZGF0ZQogIGRybS9tZ2FnMjAwOiBSZXdyaXRlIGN1cnNvciBo
YW5kbGluZwogIGRybTogUmVtb3ZlIGxvY2sgaW50ZXJmYWNlcyBmcm9tIEdFTSBWUkFNIGhlbHBl
cnMKICBkcm06IFJlbW92ZSBmdW5jdGlvbnMgd2l0aCBrbWFwLW9iamVjdCBhcmd1bWVudCBmcm9t
IEdFTSBWUkFNIGhlbHBlcnMKCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgICAgICAg
ICAgIHwgICA3IC0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMgICAgICAgICAgICAgfCAg
MzMgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgICAgfCAgNTkg
KysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgfCAxNzEg
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
Y3Vyc29yLmMgfCAxNjUgKysrKysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9kcnYuaCAgICB8ICAgMyAtCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX2ZiLmMgICAgIHwgIDI3ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbWFpbi5jICAgfCAgIDQgKy0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAg
ICAgICAgfCAgIDkgLS0KIDkgZmlsZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKyksIDMzMiBk
ZWxldGlvbnMoLSkKCi0tCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
