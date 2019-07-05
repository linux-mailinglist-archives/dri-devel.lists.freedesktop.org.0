Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA960312
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AE66E45B;
	Fri,  5 Jul 2019 09:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A366E451
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 09:26:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 826AFAF3E;
 Fri,  5 Jul 2019 09:26:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 5/6] drm/bochs: Use shadow buffer for bochs framebuffer
 console
Date: Fri,  5 Jul 2019 11:26:12 +0200
Message-Id: <20190705092613.7621-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705092613.7621-1-tzimmermann@suse.de>
References: <20190705092613.7621-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJvY2hzIGRyaXZlciAoYW5kIHZpcnR1YWwgaGFyZHdhcmUpIHJlcXVpcmVzIGJ1ZmZlciBv
YmplY3RzIHRvCnJlc2lkZSBpbiB2aWRlbyByYW0gdG8gZGlzcGxheSB0aGVtIHRvIHRoZSBzY3Jl
ZW4uIFNvIGl0IGNhbiBub3QKZGlzcGxheSB0aGUgZnJhbWVidWZmZXIgY29uc29sZSBiZWNhdXNl
IHRoZSByZXNwZWN0aXZlIGJ1ZmZlciBvYmplY3QKaXMgcGVybWFuZW50bHkgcGlubmVkIGluIHN5
c3RlbSBtZW1vcnkuCgpVc2luZyBhIHNoYWRvdyBidWZmZXIgZm9yIHRoZSBjb25zb2xlIHNvbHZl
cyB0aGlzIHByb2JsZW0uIFRoZSBjb25zb2xlCmVtdWxhdGlvbiB3aWxsIHBpbiB0aGUgYnVmZmVy
IG9iamVjdCBvbmx5IGR1cmluZyB1cGRhdGVzIGZyb20gdGhlIHNoYWRvdwpidWZmZXIuIE90aGVy
d2lzZSwgdGhlIGJvY2hzIGRyaXZlciBjYW4gZnJlZWx5IHJlbG9jYXRlZCB0aGUgYnVmZmVyCmJl
dHdlZW4gc3lzdGVtIG1lbW9yeSBhbmQgdmlkZW8gcmFtLgoKdjI6CgkqIHNlbGVjdCBzaGFkb3cg
RkIgdmlhIHN0cnVjdCBkcm1fbW9kZV9jb25maWcucHJlZmVyX3NoYWRvd19mYmRldgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfa21zLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYwppbmRleCBiYzE5ZGJkNTMxZWYuLjM1OTAzMGQ1
ZDgxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYwpAQCAtMTkxLDYgKzE5MSw3IEBAIGlu
dCBib2Noc19rbXNfaW5pdChzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocykKIAlib2Nocy0+ZGV2
LT5tb2RlX2NvbmZpZy5mYl9iYXNlID0gYm9jaHMtPmZiX2Jhc2U7CiAJYm9jaHMtPmRldi0+bW9k
ZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMjQ7CiAJYm9jaHMtPmRldi0+bW9kZV9jb25maWcu
cHJlZmVyX3NoYWRvdyA9IDA7CisJYm9jaHMtPmRldi0+bW9kZV9jb25maWcucHJlZmVyX3NoYWRv
d19mYmRldiA9IDE7CiAJYm9jaHMtPmRldi0+bW9kZV9jb25maWcucXVpcmtfYWRkZmJfcHJlZmVy
X2hvc3RfYnl0ZV9vcmRlciA9IHRydWU7CiAKIAlib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5mdW5j
cyA9ICZib2Noc19tb2RlX2Z1bmNzOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
