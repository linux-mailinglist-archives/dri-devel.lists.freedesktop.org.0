Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7312987E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 15:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B366E10D;
	Fri, 24 May 2019 13:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C986E10C;
 Fri, 24 May 2019 13:06:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1A2DDC4EC4;
 Fri, 24 May 2019 13:06:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-47.ams2.redhat.com
 [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81B1E19748;
 Fri, 24 May 2019 13:06:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915/dsi: Use a fuzzy check for burst mode clock check
Date: Fri, 24 May 2019 15:06:07 +0200
Message-Id: <20190524130607.4021-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 24 May 2019 13:06:12 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJpb3IgdG8gdGhpcyBjb21taXQgd2UgZmFpbCB0byBpbml0IHRoZSBEU0kgcGFuZWwgb24gdGhl
IEdQRCBNaWNyb1BDOgpodHRwczovL3d3dy5pbmRpZWdvZ28uY29tL3Byb2plY3RzL2dwZC1taWNy
b3BjLTYtaW5jaC1oYW5kaGVsZC1pbmR1c3RyeS1sYXB0b3AjLwoKVGhlIHByb2JsZW0gaXMgaW50
ZWxfZHNpX3ZidF9pbml0KCkgZmFpbGluZyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6CipFUlJP
UiogQnVyc3QgbW9kZSBmcmVxIGlzIGxlc3MgdGhhbiBjb21wdXRlZAoKVGhlIHBjbGsgaW4gdGhl
IFZCVCBwYW5lbCBtb2RlbGluZSBpcyA3MDAwMCwgdG9nZXRoZXIgd2l0aCAyNCBicHAgYW5kCjQg
bGluZXMgdGhpcyByZXN1bHRzIGluIGEgYml0cmF0ZSB2YWx1ZSBvZiA3MDAwMCAqIDI0IC8gNCA9
IDQyMDAwMC4KQnV0IHRoZSB0YXJnZXRfYnVyc3RfbW9kZV9mcmVxIGluIHRoZSBWQlQgaXMgNDE4
MDAwLgoKVGhpcyBjb21taXQgd29ya3MgYXJvdW5kIHRoaXMgcHJvYmxlbSBieSBhZGRpbmcgYW4g
aW50ZWxfZnV6enlfY2xvY2tfY2hlY2sKd2hlbiB0YXJnZXRfYnVyc3RfbW9kZV9mcmVxIDwgYml0
cmF0ZSBhbmQgc2V0dGluZyB0YXJnZXRfYnVyc3RfbW9kZV9mcmVxIHRvCmJpdHJhdGUgd2hlbiB0
aGF0IGNoZWNrcyBzdWNjZWVkcywgZml4aW5nIHRoZSBwYW5lbCBub3Qgd29ya2luZy4KCkNjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5j
IHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCmluZGV4IDAyMmJmNTk0MThkZi4uYTJhOWI5ZDBl
ZWFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kc2lfdmJ0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCkBAIC04OTUsNiArODk1LDE3
IEBAIGJvb2wgaW50ZWxfZHNpX3ZidF9pbml0KHN0cnVjdCBpbnRlbF9kc2kgKmludGVsX2RzaSwg
dTE2IHBhbmVsX2lkKQogCQlpZiAobWlwaV9jb25maWctPnRhcmdldF9idXJzdF9tb2RlX2ZyZXEp
IHsKIAkJCXUzMiBiaXRyYXRlID0gaW50ZWxfZHNpX2JpdHJhdGUoaW50ZWxfZHNpKTsKIAorCQkJ
LyoKKwkJCSAqIFNvbWV0aW1lcyB0aGUgVkJUIGNvbnRhaW5zIGEgc2xpZ2h0bHkgbG93ZXIgY2xv
Y2ssCisJCQkgKiB0aGVuIHRoZSBiaXRyYXRlIHdlIGhhdmUgY2FsY3VsYXRlZCwgaW4gdGhpcyBj
YXNlCisJCQkgKiBqdXN0IHJlcGxhY2UgaXQgd2l0aCB0aGUgY2FsY3VsYXRlZCBiaXRyYXRlLgor
CQkJICovCisJCQlpZiAobWlwaV9jb25maWctPnRhcmdldF9idXJzdF9tb2RlX2ZyZXEgPCBiaXRy
YXRlICYmCisJCQkgICAgaW50ZWxfZnV6enlfY2xvY2tfY2hlY2soCisJCQkJCW1pcGlfY29uZmln
LT50YXJnZXRfYnVyc3RfbW9kZV9mcmVxLAorCQkJCQliaXRyYXRlKSkKKwkJCQltaXBpX2NvbmZp
Zy0+dGFyZ2V0X2J1cnN0X21vZGVfZnJlcSA9IGJpdHJhdGU7CisKIAkJCWlmIChtaXBpX2NvbmZp
Zy0+dGFyZ2V0X2J1cnN0X21vZGVfZnJlcSA8IGJpdHJhdGUpIHsKIAkJCQlEUk1fRVJST1IoIkJ1
cnN0IG1vZGUgZnJlcSBpcyBsZXNzIHRoYW4gY29tcHV0ZWRcbiIpOwogCQkJCXJldHVybiBmYWxz
ZTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
