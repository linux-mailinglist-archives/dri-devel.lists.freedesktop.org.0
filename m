Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F2180778
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 19:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBEE6E8CC;
	Tue, 10 Mar 2020 18:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FA26E8CD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583866474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tfWAqDJSy2TS3rSjSPeoUBDDQXeAXUxi8vtSix20tLo=;
 b=fhFNrNmWV5RJ6nr2XO72OUJcYaV6ZS3jfBk7jFj9eC9Dtruw+eGM/hcIm+K/ZAiOeeWAhC
 VB/BNpM+bX6r1SWaP4+TL0O8JGi6/sNWBjdD4KF4CAdhE7MTP8jsUNIWXaaSWuQ9CC/gz5
 7vNYj99NixsbmQa2iESOkg57bWYOaBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-fDJ7kBknPIC-hVHXFnedTQ-1; Tue, 10 Mar 2020 14:54:30 -0400
X-MC-Unique: fDJ7kBknPIC-hVHXFnedTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 273B618C35A0;
 Tue, 10 Mar 2020 18:54:28 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A6E673865;
 Tue, 10 Mar 2020 18:54:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/mst: Hookup DRM DP MST
 late_register/early_unregister callbacks
Date: Tue, 10 Mar 2020 14:54:16 -0400
Message-Id: <20200310185417.1588984-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aTkxNSBjYW4gZW5hYmxlIGF1eCBkZXZpY2Ugbm9kZXMgZm9yIERQIE1TVCBieSBjYWxsaW5nCmRy
bV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoKS9kcm1fZHBfbXN0X2Nvbm5lY3Rvcl9l
YXJseV91bnJlZ2lzdGVyKCksCnNvIGxldCdzIGhvb2sgdGhhdCB1cC4KCkNoYW5nZXMgc2luY2Ug
djE6CiogQ2FsbCBpbnRlbF9jb25uZWN0b3JfcmVnaXN0ZXIvdW5yZWdpc3RlcigpIGZyb20KICBp
bnRlbF9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIvdW5yZWdpc3RlcigpIHNvIHdlIGRv
bid0IGxvc2UKICBlcnJvciBpbmplY3Rpb24gLSBWaWxsZSBTeXJqw6Rsw6QKCkNjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFuYXNpIE5hdmFy
ZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KQ2M6ICJMZWUsIFNoYXduIEMiIDxzaGF3bi5j
LmxlZUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDI4
ICsrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBf
bXN0LmMKaW5kZXggZDUzOTc4ZWQzYzEyLi45MzExYzEwZjViMWIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwpAQCAtNTQ4LDEyICs1NDgsMzYgQEAgc3Rh
dGljIGludCBpbnRlbF9kcF9tc3RfZ2V0X2RkY19tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQKK2ludGVsX2RwX21zdF9j
b25uZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQor
eworCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nv
bm5lY3Rvcihjb25uZWN0b3IpOworCWludCByZXQ7CisKKwlyZXQgPSBkcm1fZHBfbXN0X2Nvbm5l
Y3Rvcl9sYXRlX3JlZ2lzdGVyKGNvbm5lY3RvciwKKwkJCQkJCSBpbnRlbF9jb25uZWN0b3ItPnBv
cnQpOworCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIGludGVsX2Nvbm5l
Y3Rvcl9yZWdpc3Rlcihjb25uZWN0b3IpOworfQorCitzdGF0aWMgdm9pZAoraW50ZWxfZHBfbXN0
X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCit7CisJc3RydWN0IGludGVsX2Nvbm5lY3RvciAqaW50ZWxfY29ubmVjdG9yID0gdG9faW50
ZWxfY29ubmVjdG9yKGNvbm5lY3Rvcik7CisKKwlpbnRlbF9jb25uZWN0b3JfdW5yZWdpc3Rlcihj
b25uZWN0b3IpOworCWRybV9kcF9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIoY29ubmVj
dG9yLAorCQkJCQkgICAgICBpbnRlbF9jb25uZWN0b3ItPnBvcnQpOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgaW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9mdW5j
cyA9IHsKIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9t
b2RlcywKIAkuYXRvbWljX2dldF9wcm9wZXJ0eSA9IGludGVsX2RpZ2l0YWxfY29ubmVjdG9yX2F0
b21pY19nZXRfcHJvcGVydHksCiAJLmF0b21pY19zZXRfcHJvcGVydHkgPSBpbnRlbF9kaWdpdGFs
X2Nvbm5lY3Rvcl9hdG9taWNfc2V0X3Byb3BlcnR5LAotCS5sYXRlX3JlZ2lzdGVyID0gaW50ZWxf
Y29ubmVjdG9yX3JlZ2lzdGVyLAotCS5lYXJseV91bnJlZ2lzdGVyID0gaW50ZWxfY29ubmVjdG9y
X3VucmVnaXN0ZXIsCisJLmxhdGVfcmVnaXN0ZXIgPSBpbnRlbF9kcF9tc3RfY29ubmVjdG9yX2xh
dGVfcmVnaXN0ZXIsCisJLmVhcmx5X3VucmVnaXN0ZXIgPSBpbnRlbF9kcF9tc3RfY29ubmVjdG9y
X2Vhcmx5X3VucmVnaXN0ZXIsCiAJLmRlc3Ryb3kgPSBpbnRlbF9jb25uZWN0b3JfZGVzdHJveSwK
IAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVz
dHJveV9zdGF0ZSwKIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGludGVsX2RpZ2l0YWxfY29u
bmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
