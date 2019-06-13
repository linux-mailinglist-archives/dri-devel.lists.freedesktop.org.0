Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496B433AE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78A98970B;
	Thu, 13 Jun 2019 07:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D63D8966B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:30:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B2204AF0F;
 Thu, 13 Jun 2019 07:30:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] Remove explicit locking and kmap arguments from GEM
 VRAM interface
Date: Thu, 13 Jun 2019 09:30:32 +0200
Message-Id: <20190613073041.29350-1-tzimmermann@suse.de>
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
c3RlZCBvbiBhc3QgYW5kIG1nYWcyMDAgaGFyZHdhcmUuCgp2MzoKCSogZG9jdW1lbnQgUFJJTUUg
cGluIGZsYWdzCgkqIHBpbiBjdXJzb3IgQk9zIGF0IGN1cnJlbnQgbG9jYXRpb24KdjI6CgkqIHN1
cHBvcnQgcGlubmluZyBCT3MgYXQgY3VycmVudCBsb2NhdGlvbgoJKiBwaW4gUFJJTUUgYnVmZmVy
cyB0byBjdXJyZW50IGxvY2F0aW9uCgpUaG9tYXMgWmltbWVybWFubiAoOSk6CiAgZHJtL2dlbS12
cmFtOiBTdXBwb3J0IHBpbm5pbmcgYnVmZmVycyB0byBjdXJyZW50IGxvY2F0aW9uCiAgZHJtL2Fz
dDogVW5waW4gY3Vyc29yIEJPIGR1cmluZyBjbGVhbnVwCiAgZHJtL2FzdDogUmVtb3ZlIG9ic29s
ZXRlIG9yIHVudXNlZCBjdXJzb3Igc3RhdGUKICBkcm0vYXN0OiBQaW4gYW5kIG1hcCBjdXJzb3Ig
c291cmNlIEJPIGR1cmluZyB1cGRhdGUKICBkcm0vYXN0OiBQaW4gZnJhbWVidWZmZXIgQk8gZHVy
aW5nIGRpcnR5IHVwZGF0ZQogIGRybS9tZ2FnMjAwOiBQaW4gZnJhbWVidWZmZXIgQk8gZHVyaW5n
IGRpcnR5IHVwZGF0ZQogIGRybS9tZ2FnMjAwOiBSZXdyaXRlIGN1cnNvciBoYW5kbGluZwogIGRy
bTogUmVtb3ZlIGxvY2sgaW50ZXJmYWNlcyBmcm9tIEdFTSBWUkFNIGhlbHBlcnMKICBkcm06IFJl
bW92ZSBmdW5jdGlvbnMgd2l0aCBrbWFwLW9iamVjdCBhcmd1bWVudCBmcm9tIEdFTSBWUkFNIGhl
bHBlcnMKCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgICAgICAgICAgIHwgICA3IC0K
IGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMgICAgICAgICAgICAgfCAgMzMgKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgICAgfCAgNjUgKysrKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgfCAxNzkgKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCAx
NjUgKysrKysrKysrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X2Rydi5oICAgIHwgICAzIC0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYyAg
ICAgfCAgMjcgKystLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMgICB8
ICAgNCArLQogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAgICB8ICAgOSAt
LQogOSBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMzM3IGRlbGV0aW9ucygtKQoK
LS0KMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
